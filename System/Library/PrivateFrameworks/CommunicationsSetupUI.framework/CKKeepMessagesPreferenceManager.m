@implementation CKKeepMessagesPreferenceManager

- (void)dealloc
{
  void *v3;
  int v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSyncedSettingsEnabled");

  if (v4)
    +[CKKeepMessagesPreferenceManager setSyncedSettingsManager:](CKKeepMessagesPreferenceManager, "setSyncedSettingsManager:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CKKeepMessagesPreferenceManager;
  -[CKKeepMessagesPreferenceManager dealloc](&v5, sel_dealloc);
}

- (void)updateKeepMessagesPreference:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSyncedSettingsEnabled");

  if (v5)
  {
    +[CKKeepMessagesPreferenceManager syncedSettingsManager](CKKeepMessagesPreferenceManager, "syncedSettingsManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSettingValue:forKey:", v7, 0);

  }
  else
  {
    -[CKKeepMessagesPreferenceManager _setLegacyKeepMessagesPreference:](self, "_setLegacyKeepMessagesPreference:", v7);
  }

}

+ (id)keepMessagesPreference
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  CFIndex AppIntegerValue;
  CFIndex v8;
  Boolean keyExistsAndHasValidFormat;

  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSyncedSettingsEnabled");

  if (v3)
  {
    +[CKKeepMessagesPreferenceManager syncedSettingsManager](CKKeepMessagesPreferenceManager, "syncedSettingsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingValueForKey:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("KeepMessageForDays"), CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v8 = AppIntegerValue;
    else
      v8 = 0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v8);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)addSyncedSettingObserver:(id)a3 selector:(SEL)a4 key:(int64_t)a5
{
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSyncedSettingsEnabled");

  if (v8)
  {
    +[CKKeepMessagesPreferenceManager syncedSettingsManager](CKKeepMessagesPreferenceManager, "syncedSettingsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:key:", v10, a4, a5);

  }
}

- (void)removeSyncedSettingObserver:(id)a3 key:(int64_t)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isSyncedSettingsEnabled");

  if (v6)
  {
    +[CKKeepMessagesPreferenceManager syncedSettingsManager](CKKeepMessagesPreferenceManager, "syncedSettingsManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:key:", v8, a4);

  }
}

+ (IMSyncedSettingsManaging)syncedSettingsManager
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_syncedSettingsManager;
  if (!_syncedSettingsManager)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE50378]);
    v4 = (void *)_syncedSettingsManager;
    _syncedSettingsManager = (uint64_t)v3;

    v2 = (void *)_syncedSettingsManager;
  }
  return (IMSyncedSettingsManaging *)v2;
}

+ (void)setSyncedSettingsManager:(id)a3
{
  objc_storeStrong((id *)&_syncedSettingsManager, a3);
}

- (void)_setLegacyKeepMessagesPreference:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v7;

  v3 = a3;
  MEMORY[0x2199B87F0](CFSTR("com.apple.MobileSMS"), CFSTR("KeepMessagesVersionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  if (v4)
    v5 = objc_msgSend(v4, "integerValue") + 1;
  else
    v5 = 1;
  CFPreferencesSetAppValue(CFSTR("KeepMessagesVersionID"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5), CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("KeepMessageForDays"), v3, CFSTR("com.apple.MobileSMS"));

  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  notify_post("com.apple.MobileSMS.KeepMessages.shouldUpdateDevices");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.KeepMessages.changed"), 0, 0, 1u);

}

@end
