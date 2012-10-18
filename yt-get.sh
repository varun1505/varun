yt-get()
{
for i in $(grep FLV ${HOME}/.cache/google-chrome/Default/Cache/* | grep "f_[0-9a-fA-F]*" | uniq); do
	echo "$i" >> temp.txt
done

for j in $(grep "f_[0-9a-fA-F]*" temp.txt | uniq); do
  
  temp=`stat -c %Y "$j"`
  echo $temp
  if [ temp > large ] ; then
	large=$temp
	lfile=$j
  fi
done
#echo "Latest File: $lfile"
echo "(p) to play the video (s) to Save it to your home folder."
read choice

if [ $choice = "p" ] ; then
	mplayer $lfile
elif [ $choice="s" ] ; then
	cat $lfile > ${HOME}/video.flv
	echo $lfile
	echo "Saved to home folder."
else
	echo "Incorrect Option. Enter correct option."
	echo "Exiting."
fi
rm temp.txt
}
