@implementation AVPlayerItem(AVPlayerItem_AVEditBehaviorContextAdditions)

- (uint64_t)avkit_currentEditBehaviorContext
{
  return objc_msgSend(a1, "avkit_valueForAVKitProperty:", CFSTR("avkit_currentEditBehaviorContext"));
}

- (uint64_t)avkit_setCurrentEditBehaviorContext:()AVPlayerItem_AVEditBehaviorContextAdditions
{
  return objc_msgSend(a1, "avkit_setValue:forAVKitProperty:", a3, CFSTR("avkit_currentEditBehaviorContext"));
}

@end
