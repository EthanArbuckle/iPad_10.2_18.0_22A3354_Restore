@implementation InstallHomePreferencesObserverIfNecessary

void ___InstallHomePreferencesObserverIfNecessary_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_HomePrefsChangedHandler, CFSTR("com.apple.Home.preferenceschanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
