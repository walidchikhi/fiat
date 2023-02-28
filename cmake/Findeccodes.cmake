# - Try to find eccodes

# Once done this will define
#  ECCODES_FOUND        - System has eccodes
#  ECCODES_INCLUDE_DIRS - The eccodes include directories
#  ECCODES_LIBRARIES    - The libraries needed to use eccodes
#
# The following paths will be searched with priority if set in CMake or env
#
#  eccodes_ROOT
#  eccodes_DIR
#  ECCOES_DIR          - prefix path of the eccodes installation
#  ECCODES_PATH         - prefix path of the eccodes installation
#  
#  


find_path(ECCODES_INCLUDE_DIR  eccodes.h
        PATHS eccodes_ROOT eccodes_DIR ECCOES_DIR ENV ECCODES_DIR ENV eccodes_ROOT  /usr/lib  /usr/lib64  /usr/local/lib /usr/local/lib64 
        PATH_SUFFIXES include )

find_path(ECCODES_LIB_DIR NAMES libeccodes.so libeccodes.a
	 PATHS eccodes_ROOT eccodes_DIR ECCOES_DIR ENV ECCODES_DIR ENV eccodes_ROOT  /usr/lib  /usr/lib64  /usr/local/lib /usr/local/lib64 
         PATH_SUFFIXES lib lib64) 


find_library(ECCODES NAMES eccodes  HINTS ${eccodes_BASE_DIR} )
find_library(ECCODES_F90 NAMES eccodes_f90 HINTS ${eccodes_BASE_DIR})

LIST(APPEND ECCODES_LIBRARIES "${ECCODES_F90} ${ECCODES}")
string(REGEX REPLACE "[ \t\r\n]" ";"   ECCODES_LIBRARIES "${ECCODES_LIBRARIES}")

foreach(item ${ECCODES_LIBRARIES} )
message("onn essssst la '${item}'")
endforeach()
include(FindPackageHandleStandardArgs)

find_package_handle_standard_args(eccodes  DEFAULT_MSG ECCODES_LIBRARIES ECCODES_LIB_DIR ECCODES_INCLUDE_DIR ECCODES ECCODES_F90 )

mark_as_advanced(ECCODES_INCLUDE_DIR ECCODES_LIBRARIES ECCODES ECCODES_F90 ECCODES_LIB_DIR)

