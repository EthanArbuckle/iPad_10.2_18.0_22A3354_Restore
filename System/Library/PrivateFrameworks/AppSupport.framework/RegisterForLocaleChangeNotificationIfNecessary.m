@implementation RegisterForLocaleChangeNotificationIfNecessary

void ___RegisterForLocaleChangeNotificationIfNecessary_block_invoke()
{
  __CFNotificationCenter *LocalCenter;

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_LocaleWillChangeCallback, CFSTR("kCFLocaleCurrentLocaleDidChangeNotification-2"), 0, CFNotificationSuspensionBehaviorDrop);
}

@end
