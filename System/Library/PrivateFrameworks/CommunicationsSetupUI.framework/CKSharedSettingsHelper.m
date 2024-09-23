@implementation CKSharedSettingsHelper

- (void)setReadReceiptsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  MEMORY[0x2199B87F0](CFSTR("com.apple.madrid"), CFSTR("GlobalReadReceiptVersionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5)
    v6 = objc_msgSend(v5, "integerValue") + 1;
  else
    v6 = 1;
  CFPreferencesSetAppValue(CFSTR("GlobalReadReceiptVersionID"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v6), CFSTR("com.apple.madrid"));
  CFPreferencesSetAppValue(CFSTR("ReadReceiptsEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3), CFSTR("com.apple.madrid"));
  CFPreferencesSynchronize(CFSTR("com.apple.madrid"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.ReadReceiptsEnabled.changed"), 0, 0, 1u);
  notify_post("com.apple.MobileSMS.ReadReceiptsEnabled.shouldUpdateDevices");
  if (PSIsNanoMirroringDomain())
  {
    -[CKSharedSettingsHelper _syncManager](self, "_syncManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("ReadReceiptsEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.madrid"), v9);

  }
}

- (void)setConversationListFilteringEnabled:(BOOL)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void (*v5)(void);
  void *v6;
  id v7;

  CFPreferencesSetAppValue(CFSTR("IncomingMessageAlertFiltration"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3), CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("IncomingMessageAlertFiltrationForcedOn"), (CFPropertyListRef)*MEMORY[0x24BDBD268], CFSTR("com.apple.MobileSMS"));
  CFPreferencesSetAppValue(CFSTR("MessageFilteringSettingsConfirmed"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.MobileSMS"));
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.IncomingMessageAlertFiltration.changed"), 0, 0, 1u);
  v5 = (void (*)(void))CUTWeakLinkSymbol();
  if (v5)
    v5();
  -[CKSharedSettingsHelper _syncManager](self, "_syncManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("IncomingMessageAlertFiltration"), CFSTR("IncomingMessageAlertFiltrationForcedOn"), CFSTR("MessageFilteringSettingsConfirmed"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.MobileSMS"), v6);

}

- (id)_syncManager
{
  objc_class *v2;

  v2 = (objc_class *)CUTWeakLinkClass();
  if (v2)
    v2 = (objc_class *)objc_alloc_init(v2);
  return v2;
}

@end
