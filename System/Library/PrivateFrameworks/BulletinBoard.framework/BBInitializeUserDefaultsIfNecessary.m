@implementation BBInitializeUserDefaultsIfNecessary

void __BBInitializeUserDefaultsIfNecessary_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v1;
  __CFString *v2;
  char v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)BBPreferencesChangedHandler, CFSTR("com.apple.bulletinboard.prefsChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)BBPreferencesChangedHandler, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  BBUpdateUserDefaults();
  v1 = (void *)MGCopyAnswer();
  v2 = (__CFString *)CFPreferencesCopyAppValue(CFSTR("BBLastSystemVersion"), CFSTR("com.apple.bulletinboard"));
  v3 = -[__CFString isEqual:](v2, "isEqual:", v1);
  __BBShouldPerformMigration = v3 ^ 1;
  if ((v3 & 1) == 0)
  {
    v4 = BBLogMigration;
    if (os_log_type_enabled((os_log_t)BBLogMigration, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("(no previous version)");
      if (v2)
        v5 = v2;
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v1;
      _os_log_impl(&dword_20CCB9000, v4, OS_LOG_TYPE_DEFAULT, "Performing migration from %{public}@ to %{public}@...", (uint8_t *)&v6, 0x16u);
    }
  }

}

@end
