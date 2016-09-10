#!/bin/bash
if test "$#" -ne 4; then
    echo "Usage: $0 host user pass file" 
    exit -1 
fi
ftp -n << END_SCRIPT
open $1
user $2 $3
cd "ftpdir"
put $4
get $4 retrieval.$$
bye
END_SCRIPT

if [ -f retrieval.$$ ]
then
	echo "FTP of $4 to $1 worked"
	rm -f retrieval.$$
else
	echo "FTP of $4 did not work"
fi
