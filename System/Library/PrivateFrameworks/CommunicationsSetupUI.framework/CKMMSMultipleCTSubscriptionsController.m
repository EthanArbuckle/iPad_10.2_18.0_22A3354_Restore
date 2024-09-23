@implementation CKMMSMultipleCTSubscriptionsController

- (id)isEnabledForSubscription:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("phoneNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("simID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKSettingsMMSHelper mmsDefaultEnabledForPhoneNumber:simID:](CKSettingsMMSHelper, "mmsDefaultEnabledForPhoneNumber:simID:", v6, v8);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", IMGetDomainBoolForKeyWithDefaultValue());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      _os_log_impl(&dword_2138BA000, v10, OS_LOG_TYPE_INFO, "Getting value %@ for key %@", (uint8_t *)&v12, 0x16u);
    }

  }
  return v9;
}

- (void)setEnabledForSubscription:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  __CFString *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v14;
  id v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "identifier");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v8, v6, CFSTR("com.apple.MobileSMS"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", IMGetDomainBoolForKeyWithDefaultValue());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v6;
      v16 = 2112;
      v17 = v8;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_INFO, "Setting value %@ for key %@, now is %@", (uint8_t *)&v14, 0x20u);

    }
  }
  -[CKMultipleCTSubscriptionsController defaultsKey](self, "defaultsKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("MMSEnabled-"));

  if (v12)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.MMSEnabled.changed"), 0, 0, 1u);
  }

}

@end
