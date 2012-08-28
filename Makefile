# For simplicity and reliability, we're using the pdflatex-makefile base
# whose project is located here: https://github.com/ransford/pdflatex-makefile
#
# If this is from a tarball, you'll see the subdirectory already existing.
# If this is from Git, and you didn't do a git clone --recursive
# it will warn you and help you set up the "submodule" that pulls in
# those files.

# Default target uses pdflatex to build, and tries to build minimally.
# Other targets:
#   make clean
#   make view - opens the PDF in your PDF viewer.

ifndef TARGET

all: conference journal

conference:
	$(MAKE) TARGET=sampleasme2e
viewconference:
	$(MAKE) TARGET=sampleasme2e view
cleanconference:
	$(MAKE) TARGET=sampleasme2e clean

journal:
	$(MAKE) TARGET=sampleasme2ej
viewjournal:
	$(MAKE) TARGET=sampleasme2ej view
cleanjournal:
	$(MAKE) TARGET=sampleasme2ej clean

clean: cleanconference cleanjournal

else

# check whether pdflatex-makefile submodule is initialized
ifneq ($(wildcard pdflatex-makefile/Makefile.include),)
include pdflatex-makefile/Makefile.include
else
##### begin submodule-initialization targets
.PHONY: all
all:
      @echo Run 'make setup' and then 'make' again.
setup:
      cd "$(shell git rev-parse --show-toplevel)" && git submodule init \
              && git submodule update
##### end submodule action
endif

endif
