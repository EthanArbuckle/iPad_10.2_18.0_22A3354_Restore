@implementation CKMMSSettingsHelper

+ (BOOL)mmsDefaultEnabledForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE511F0], "sharedFeatureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isReadMMSDefaultFromCBEnabled");

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ctSubscriptionInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_3;
    if ((IMSharedHelperDeviceHasMultipleActiveSubscriptions() & 1) != 0)
      goto LABEL_9;
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ctSubscriptionInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subscriptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
LABEL_3:
      objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v11, &unk_2511C2378, 0, 0);

      if (v13)
      {
        objc_msgSend(v13, "valueForKey:", CFSTR("MMSDefaultEnabled"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
          v16 = objc_msgSend(v14, "BOOLValue");
        else
          v16 = 1;

      }
      else
      {
        v16 = 0;
      }

    }
    else
    {
LABEL_9:
      v16 = 0;
    }
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (id)getMMSDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ctSubscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", CFSTR("MMS"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v5, v6, 0, 0);

  return v8;
}

- (id)isMMSEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ctSubscriptionInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "subscriptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x24BE511B0];
    objc_msgSend(v5, "phoneNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "labelID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "IMUniqueIdentifierForPhoneNumber:simID:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("MMSEnabled-"), v9);
  }
  else
  {
    v9 = 0;
    v10 = CFSTR("MMSEnabled");
  }
  keyExistsAndHasValidFormat = 0;
  objc_msgSend(MEMORY[0x24BE30338], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsMMS");

  v13 = CFPreferencesGetAppBooleanValue(v10, CFSTR("com.apple.MobileSMS"), &keyExistsAndHasValidFormat) != 0;
  if (!keyExistsAndHasValidFormat)
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "ctSubscriptionInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "subscriptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_opt_class();
    objc_msgSend(v17, "phoneNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "labelID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v18, "mmsDefaultEnabledForPhoneNumber:simID:", v19, v20);

  }
  if (_IMWillLog())
  {
    v21 = CFSTR("NO");
    if ((v12 & v13) != 0)
      v21 = CFSTR("YES");
    v24 = v9;
    v25 = v10;
    v26 = v21;
    _IMAlwaysLog();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12 & v13, v24, v25, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)setMMSEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  const __CFString *v20;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v22;
  void *v23;
  id v24;
  id v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  id v30;

  v3 = a3;
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ctSubscriptionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BE511B0];
    objc_msgSend(v8, "phoneNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "labelID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "IMUniqueIdentifierForPhoneNumber:simID:", v10, v11);
    v30 = (id)objc_claimAutoreleasedReturnValue();

    v12 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), CFSTR("MMSEnabled-"), v30);
  }
  else
  {
    v30 = 0;
    v12 = CFSTR("MMSEnabled");
  }
  CFPreferencesSetAppValue(v12, (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3), CFSTR("com.apple.MobileSMS"));
  if (_IMWillLog())
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");
    v15 = CFSTR("NO");
    if (v14)
      v15 = CFSTR("YES");
    v26 = v12;
    v28 = v15;
    v24 = v30;
    _IMAlwaysLog();

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3, v24, v26, v28);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  if ((v17 & 1) == 0)
  {
    if (_IMWillLog())
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLValue");
      v20 = CFSTR("NO");
      if (v19)
        v20 = CFSTR("YES");
      v27 = CFSTR("MMSShowSubject");
      v29 = v20;
      v25 = v30;
      _IMAlwaysLog();

    }
    CFPreferencesSetAppValue(CFSTR("MMSShowSubject"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3, v25, v27, v29), CFSTR("com.apple.MobileSMS"));
  }
  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSMS.MMSEnabled.changed"), 0, 0, 1u);
  -[CKMMSSettingsHelper _syncManager](self, "_syncManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("MMSEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "synchronizeUserDefaultsDomain:keys:", CFSTR("com.apple.MobileSMS"), v23);

}

- (id)willSendGroupMMS
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v18;
  const __CFString *v19;

  CFPreferencesSynchronize(CFSTR("com.apple.MobileSMS"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ctSubscriptionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subscriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x24BE511B0];
    objc_msgSend(v6, "phoneNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "labelID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "IMUniqueIdentifierForPhoneNumber:simID:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }
  else
  {
    -[CKMMSSettingsHelper getMMSDictionary](self, "getMMSDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v6 = 0;
  }
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    objc_msgSend(MEMORY[0x24BE511B8], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copyCarrierBundleValueForSubscriptionContext:keyHierarchy:defaultValue:valueIfError:", v6, &unk_2511C2390, MEMORY[0x24BDBD1C0], MEMORY[0x24BDBD1C0]);
    v14 = (void *)objc_msgSend(v13, "BOOLValue");

  }
  else
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("GroupModeEnabled"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_9;
    objc_msgSend(v11, "objectForKey:", CFSTR("GroupModeEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "BOOLValue");
  }

LABEL_9:
  if (_IMWillLog())
  {
    v15 = CFSTR("NO");
    if ((_DWORD)v14)
      v15 = CFSTR("YES");
    v18 = v10;
    v19 = v15;
    _IMAlwaysLog();
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v14, v18, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_syncManager
{
  objc_class *v2;

  v2 = (objc_class *)MEMORY[0x24269E2F4](CFSTR("NPSManager"), CFSTR("NanoPreferencesSync"));
  if (v2)
    v2 = (objc_class *)objc_alloc_init(v2);
  return v2;
}

@end
