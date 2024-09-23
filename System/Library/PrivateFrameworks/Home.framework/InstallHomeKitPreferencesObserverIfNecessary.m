@implementation InstallHomeKitPreferencesObserverIfNecessary

void ___InstallHomeKitPreferencesObserverIfNecessary_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_HomeDPrefsChangedHandler, CFSTR("com.apple.homed.preferenceschanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

@end
