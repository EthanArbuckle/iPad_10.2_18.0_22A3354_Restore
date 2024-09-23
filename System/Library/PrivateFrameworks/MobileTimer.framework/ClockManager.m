@implementation ClockManager

+ (void)loadUserPreferences
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.mobiletimer"));
}

+ (void)saveAndNotifyForUserPreferences:(BOOL)a3 localNotifications:(BOOL)a4
{
  const __CFString *v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  if (a3)
  {
    if (a3 && a4)
      v4 = CFSTR("com.apple.mobiletimer.user-preferences-and-local-notifications-changed");
    else
      v4 = CFSTR("com.apple.mobiletimer.user-preferences-changed");
    CFPreferencesAppSynchronize(CFSTR("com.apple.mobiletimer"));
  }
  else
  {
    if (!a4)
      return;
    v4 = CFSTR("com.apple.mobiletimer.local-notifications-changed");
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0, 0, 0);
}

@end
