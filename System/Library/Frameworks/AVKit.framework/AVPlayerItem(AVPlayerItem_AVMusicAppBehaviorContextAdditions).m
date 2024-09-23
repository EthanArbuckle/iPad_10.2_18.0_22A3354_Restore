@implementation AVPlayerItem(AVPlayerItem_AVMusicAppBehaviorContextAdditions)

- (uint64_t)avkit_musicAppBehaviorContext
{
  return objc_msgSend(a1, "avkit_valueForAVKitProperty:", CFSTR("avkit_musicAppBehaviorContext"));
}

- (uint64_t)avkit_setMusicBehaviorData:()AVPlayerItem_AVMusicAppBehaviorContextAdditions
{
  return objc_msgSend(a1, "avkit_setValue:forAVKitProperty:", a3, CFSTR("avkit_musicAppBehaviorContext"));
}

@end
