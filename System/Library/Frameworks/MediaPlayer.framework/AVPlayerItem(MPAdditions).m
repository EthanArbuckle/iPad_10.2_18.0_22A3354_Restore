@implementation AVPlayerItem(MPAdditions)

- (void)setNowPlayingInfo:()MPAdditions
{
  id v4;

  objc_setAssociatedObject(a1, sel_nowPlayingInfo, a3, (void *)1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("MPPlayerItemNowPlayingInfoDidChangeNotification"), a1);

}

- (id)nowPlayingInfo
{
  return objc_getAssociatedObject(a1, sel_nowPlayingInfo);
}

@end
