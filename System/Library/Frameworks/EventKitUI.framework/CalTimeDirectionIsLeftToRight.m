@implementation CalTimeDirectionIsLeftToRight

void __CalTimeDirectionIsLeftToRight_block_invoke()
{
  void *v0;
  __CFNotificationCenter *LocalCenter;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  __calendarDirectionLeftToRight = objc_msgSend(v0, "_calendarDirection") == 0;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_LocaleChanged, (CFStringRef)*MEMORY[0x1E0C9B070], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
