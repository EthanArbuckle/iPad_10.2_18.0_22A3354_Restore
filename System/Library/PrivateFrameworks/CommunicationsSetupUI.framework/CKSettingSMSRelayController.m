@implementation CKSettingSMSRelayController

- (CKSettingSMSRelayController)initWithNibName:(id)a3 bundle:(id)a4
{
  CKSettingSMSRelayController *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKSettingSMSRelayController;
  v4 = -[CKSettingSMSRelayController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x24BE4FCB8]);
    v6 = (void *)objc_msgSend(v5, "initWithService:", *MEMORY[0x24BE4FB68]);
    -[CKSettingSMSRelayController setRelayService:](v4, "setRelayService:", v6);

    -[CKSettingSMSRelayController relayService](v4, "relayService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDelegate:queue:", v4, MEMORY[0x24BDAC9B8]);

    objc_msgSend(MEMORY[0x24BE502D0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "blockUntilConnected");

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v4, (CFNotificationCallback)_SMSRelayActiveDevicesChanged, CFSTR("com.apple.sms.smsRelayDevices.changed"), v4, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.sms.smsRelayDevices.changed"), 0);
  v4.receiver = self;
  v4.super_class = (Class)CKSettingSMSRelayController;
  -[CKSettingSMSRelayController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSettingSMSRelayController;
  -[CKSettingSMSRelayController viewDidLoad](&v5, sel_viewDidLoad);
  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY"), CFSTR("SMS_RELAY"), CFSTR("Messages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSettingSMSRelayController setTitle:](self, "setTitle:", v4);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSettingSMSRelayController;
  -[CKSettingSMSRelayController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CKSettingSMSRelayController emitNavigationEvent](self, "emitNavigationEvent");
}

- (void)emitNavigationEvent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.Apps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("com.apple.MobileSMS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("SMS_RELAY_DEVICES"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithKey:table:locale:bundleURL:", CFSTR("Messages"), 0, v7, v9);

  v11 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithKey:table:locale:bundleURL:", CFSTR("Text Message Forwarding"), 0, v12, v14);

  v17[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSettingSMSRelayController pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.MobileSMS"), v10, v16, v5);

}

- (BOOL)isMiCEnabled
{
  CFIndex AppIntegerValue;
  BOOL v3;
  int v4;
  NSObject *v5;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[16];

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("CloudKitSyncingEnabled"), CFSTR("com.apple.madrid"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v3 = AppIntegerValue == 1;
    else
      v3 = 0;
    LOBYTE(v4) = v3;
  }
  else
  {
    v4 = IMOSLoggingEnabled();
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2138BA000, v5, OS_LOG_TYPE_INFO, "Auto SMS forwarding disabled, proceeding as if MiC is disabled.", buf, 2u);
      }

      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (id)specifiers
{
  void *v2;
  _BOOL4 v5;
  NSObject *v6;
  const __CFString *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  objc_class *v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  const __CFString *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (v2)
    return v2;
  v34 = (int)*MEMORY[0x24BE756E0];
  v5 = -[CKSettingSMSRelayController isMiCEnabled](self, "isMiCEnabled");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (v5)
        v7 = CFSTR("YES");
      *(_DWORD *)buf = 138412290;
      v47 = v7;
      _os_log_impl(&dword_2138BA000, v6, OS_LOG_TYPE_INFO, "Is Messages in iCloud enabled on this device? {%@}", buf, 0xCu);
    }

  }
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v5)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[CKSettingSMSRelayController relayService](self, "relayService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "devices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v41 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((objc_msgSend(v15, "isWatch") & 1) == 0)
          {
            objc_msgSend(v15, "uniqueID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = -[CKSettingSMSRelayController isDeviceUsingMiCWithIdentifier:](self, "isDeviceUsingMiCWithIdentifier:", v16);

            if (v17)
              v18 = v8;
            else
              v18 = v9;
            objc_msgSend(v18, "addObject:", v15);
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v8, "count"))
    {
      -[CKSettingSMSRelayController _headerSpecifierForMicGroup](self, "_headerSpecifierForMicGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSettingSMSRelayController _specifiersForDevices:cellType:get:](self, "_specifiersForDevices:cellType:get:", v8, -1, sel_getDeviceOn_);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v19);
      objc_msgSend(v35, "addObjectsFromArray:", v20);

    }
    if (objc_msgSend(v9, "count"))
    {
      -[CKSettingSMSRelayController _headerSpecifierForNonMicGroupDisplayingHeader:](self, "_headerSpecifierForNonMicGroupDisplayingHeader:", objc_msgSend(v8, "count") != 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v21);
      -[CKSettingSMSRelayController _specifiersForDevices:cellType:get:](self, "_specifiersForDevices:cellType:get:", v9, 6, sel_getDeviceActive_);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObjectsFromArray:", v22);

    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v35);
    v23 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v24 = *(Class *)((char *)&self->super.super.super.super.super.isa + v34);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v34) = v23;
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[CKSettingSMSRelayController relayService](self, "relayService");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "devices");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v26);
          v30 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if ((objc_msgSend(v30, "isWatch") & 1) == 0)
            objc_msgSend(v8, "addObject:", v30);
        }
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v27);
    }

    -[CKSettingSMSRelayController _specifiersForDevices:cellType:get:](self, "_specifiersForDevices:cellType:get:", v8, 6, sel_getDeviceActive_);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CKSettingSMSRelayController _footerSpecifierForSMSRelayGroup](self, "_footerSpecifierForSMSRelayGroup");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObject:", v24);
    objc_msgSend(v35, "addObjectsFromArray:", v9);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v35);
    v31 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v32 = *(Class *)((char *)&self->super.super.super.super.super.isa + v34);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v34) = v31;

  }
  v33 = *(id *)((char *)&self->super.super.super.super.super.isa + v34);

  return v33;
}

- (id)_headerSpecifierForMicGroup
{
  void *v2;
  void *v3;
  void *v4;

  CommunicationsSetupUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_MIC_DEVICES_FOOTER"), CFSTR("SMS_RELAY_MIC_DEVICES_FOOTER"), CFSTR("Messages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("MOC_SMS_REALY_GROUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v3, *MEMORY[0x24BE75A68]);

  return v4;
}

- (id)_headerSpecifierForNonMicGroupDisplayingHeader:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("MOC_NON_SMS_REALY_GROUP"));
  else
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CommunicationsSetupUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_MIC_OTHER_DEVICES_FOOTER"), CFSTR("SMS_RELAY_MIC_OTHER_DEVICES_FOOTER"), CFSTR("Messages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setProperty:forKey:", v5, *MEMORY[0x24BE75A68]);
  return v3;
}

- (id)_footerSpecifierForSMSRelayGroup
{
  void *v2;
  void *v3;
  void *v4;

  CommunicationsSetupUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_DEVICES_HEADER"), CFSTR("SMS_RELAY_DEVICES_HEADER"), CFSTR("Messages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperty:forKey:", v3, *MEMORY[0x24BE75A68]);

  return v4;
}

- (id)_specifiersForDevices:(id)a3 cellType:(int64_t)a4 get:(SEL)a5
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BE50880];
        objc_msgSend(v11, "modelIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "marketingNameForModel:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%@)"), v12, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, sel_setDeviceActive_specifier_, a5, 0, a4, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setIdentifier:", v18);

        objc_msgSend(v6, "addObject:", v17);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  return v6;
}

- (id)getDeviceActive:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)objc_opt_class(), "deviceIsAuthorized:", v4);
  v6 = IMOSLoggingEnabled();
  if ((_DWORD)v5)
  {
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_INFO, "Device {%@} has SMS Forwarding enabled.", (uint8_t *)&v10, 0xCu);
      }
LABEL_9:

    }
  }
  else if (v6)
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_INFO, "Device {%@} has SMS Forwarding disabled.", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getDeviceOn:(id)a3
{
  void *v3;
  void *v4;

  CommunicationsSetupUIBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SMS_RELAY_ON"), CFSTR("SMS_RELAY_ON"), CFSTR("Messages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDeviceActive:(id)a3 specifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  int v11;
  int v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE50370], "smsService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  IMPreferredAccountForService();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("YES");
      if (!v8)
        v10 = CFSTR("NO");
      v18 = 138412290;
      v19 = v10;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_INFO, "Has smsAccount? {%@}", (uint8_t *)&v18, 0xCu);
    }

  }
  v11 = objc_msgSend(v5, "BOOLValue");
  v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v14;
        _os_log_impl(&dword_2138BA000, v13, OS_LOG_TYPE_INFO, "Enrolling device in SMS relay. specifier_identifier={%@}", (uint8_t *)&v18, 0xCu);

      }
    }
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enrollDeviceInSMSRelay:", v15);
  }
  else
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "identifier");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v17;
        _os_log_impl(&dword_2138BA000, v16, OS_LOG_TYPE_INFO, "Unenrolling device in SMS relay. specifier_identifier={%@}", (uint8_t *)&v18, 0xCu);

      }
    }
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unEnrollDeviceInSMSRelay:", v15);
  }

}

- (BOOL)isDeviceUsingMiCWithIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "isDeviceUsingMiCWithIdentifier:", v3);

  return v4;
}

+ (id)authorizedSMSRelayDevices
{
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("allowed"), CFSTR("com.apple.sms"));
}

+ (BOOL)deviceIsAuthorized:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CKSettingSMSRelayController authorizedSMSRelayDevices](CKSettingSMSRelayController, "authorizedSMSRelayDevices");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEqualToString:", v3, (_QWORD)v9) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (id)micSMSRelayDevices
{
  return (id)(id)CFPreferencesCopyAppValue(CFSTR("mic"), CFSTR("com.apple.sms"));
}

+ (BOOL)isDeviceUsingMiCWithIdentifier:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CKSettingSMSRelayController micSMSRelayDevices](CKSettingSMSRelayController, "micSMSRelayDevices");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEqualToString:", v3, (_QWORD)v9) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (unint64_t)numberOfActiveDevices
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE4FCB8]);
  v3 = (void *)objc_msgSend(v2, "initWithService:", *MEMORY[0x24BE4FB68]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "devices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "uniqueID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[CKSettingSMSRelayController deviceIsAuthorized:](CKSettingSMSRelayController, "deviceIsAuthorized:", v11))
        {
          v12 = objc_msgSend(v10, "isWatch");

          v7 += v12 ^ 1u;
        }
        else
        {

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)shouldShowSMSRelaySettings
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE4FCB8]);
  v3 = (void *)objc_msgSend(v2, "initWithService:", *MEMORY[0x24BE4FB68]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "devices", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isWatch") ^ 1;
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
    LOBYTE(v5) = v6 != 0;
  }

  return v5;
}

- (IDSService)relayService
{
  return self->_relayService;
}

- (void)setRelayService:(id)a3
{
  objc_storeStrong((id *)&self->_relayService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relayService, 0);
}

@end
