@implementation SiriUISpokenNotificationsModule

- (SiriUISpokenNotificationsModule)initWithNibName:(id)a3 bundle:(id)a4
{
  SiriUISpokenNotificationsModule *v4;
  SiriUISpokenNotificationsModule *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *spokenNotificationsModuleQueue;
  uint64_t v8;
  BBSettingsGateway *settingsGateway;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SiriUISpokenNotificationsModule;
  v4 = -[CCUIMenuModuleViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CCUIMenuModuleViewController setIndentation:](v4, "setIndentation:", 2);
    if (-[CCUIButtonModuleViewController isExpanded](v5, "isExpanded"))
      -[SiriUISpokenNotificationsModule _updateMenuItems](v5, "_updateMenuItems");
    v6 = dispatch_queue_create("com.apple.siri.SpokenNotificationsModuleQueue", 0);
    spokenNotificationsModuleQueue = v5->_spokenNotificationsModuleQueue;
    v5->_spokenNotificationsModuleQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BE0FE98]), "initWithQueue:", v5->_spokenNotificationsModuleQueue);
    settingsGateway = v5->_settingsGateway;
    v5->_settingsGateway = (BBSettingsGateway *)v8;

  }
  return v5;
}

- (void)_updateMenuItems
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id location;

  if (!self->_menuItems)
    -[SiriUISpokenNotificationsModule _createMenuItems](self, "_createMenuItems");
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = sub_231021B88;
  v7 = &unk_24FFE3C90;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "getSpokenNotificationTemporarilyDisabledEndDateWithCompletion:", &v4);

  -[CCUIMenuModuleViewController setMenuItems:](self, "setMenuItems:", self->_menuItems, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateMenuItemsWithDate:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  -[SiriUISpokenNotificationsModule _createMenuItems](self, "_createMenuItems");
  if (!v19)
  {
    v18 = 1272;
LABEL_9:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v18), "setSelected:", 1);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isDate:inSameDayAsDate:", v19, v5);

  if (!v6)
  {
    v18 = 1288;
    goto LABEL_9;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v7, "setDateStyle:", 0);
  objc_msgSend(v7, "setTimeStyle:", 1);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "component:fromDate:", 32, v19);

  if (v9 % 12 == 1)
    v10 = CFSTR("SPOKEN_NOTIFICATIONS_MUTED_UNTIL_TIME_SUBTEXT_SINGULAR");
  else
    v10 = CFSTR("SPOKEN_NOTIFICATIONS_MUTED_UNTIL_TIME_SUBTEXT_PLURAL");
  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = (void *)MEMORY[0x24BDD1488];
  v13 = v10;
  objc_msgSend(v12, "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", v13, &stru_24FFE3E08, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringFromDate:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCUIMenuModuleItem setSelected:](self->_menuItemMute, "setSelected:", 1);
  -[CCUIMenuModuleItem setSubtitle:](self->_menuItemMute, "setSubtitle:", v17);

LABEL_10:
  -[CCUIMenuModuleViewController setMenuItems:](self, "setMenuItems:", self->_menuItems);

}

- (void)_createMenuItems
{
  NSMutableArray *v3;
  NSMutableArray *menuItems;
  id v5;
  void *v6;
  void *v7;
  CCUIMenuModuleItem *v8;
  CCUIMenuModuleItem *menuItemOn;
  id v10;
  void *v11;
  void *v12;
  CCUIMenuModuleItem *v13;
  CCUIMenuModuleItem *menuItemMute;
  id v15;
  void *v16;
  void *v17;
  CCUIMenuModuleItem *v18;
  CCUIMenuModuleItem *menuItemOffForTheDay;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location[2];

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  menuItems = self->_menuItems;
  self->_menuItems = v3;

  objc_initWeak(location, self);
  v5 = objc_alloc(MEMORY[0x24BE19B60]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SPOKEN_NOTIFICATIONS_ON"), &stru_24FFE3E08, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_2310221B4;
  v24[3] = &unk_24FFE3CB8;
  objc_copyWeak(&v25, location);
  v8 = (CCUIMenuModuleItem *)objc_msgSend(v5, "initWithTitle:identifier:handler:", v7, CFSTR("SPOKEN_NOTIFICATIONS_ON"), v24);
  menuItemOn = self->_menuItemOn;
  self->_menuItemOn = v8;

  v10 = objc_alloc(MEMORY[0x24BE19B60]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SPOKEN_NOTIFICATIONS_MUTE"), &stru_24FFE3E08, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = sub_2310221F4;
  v22[3] = &unk_24FFE3CB8;
  objc_copyWeak(&v23, location);
  v13 = (CCUIMenuModuleItem *)objc_msgSend(v10, "initWithTitle:identifier:handler:", v12, CFSTR("SPOKEN_NOTIFICATIONS_MUTE"), v22);
  menuItemMute = self->_menuItemMute;
  self->_menuItemMute = v13;

  v15 = objc_alloc(MEMORY[0x24BE19B60]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SPOKEN_NOTIFICATIONS_OFF"), &stru_24FFE3E08, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = sub_231022234;
  v20[3] = &unk_24FFE3CB8;
  objc_copyWeak(&v21, location);
  v18 = (CCUIMenuModuleItem *)objc_msgSend(v15, "initWithTitle:identifier:handler:", v17, CFSTR("SPOKEN_NOTIFICATIONS_OFF"), v20);
  menuItemOffForTheDay = self->_menuItemOffForTheDay;
  self->_menuItemOffForTheDay = v18;

  -[NSMutableArray addObject:](self->_menuItems, "addObject:", self->_menuItemOn);
  -[NSMutableArray addObject:](self->_menuItems, "addObject:", self->_menuItemMute);
  -[NSMutableArray addObject:](self->_menuItems, "addObject:", self->_menuItemOffForTheDay);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);
  objc_destroyWeak(location);
}

- (void)_turnOnSpokenMessages
{
  NSObject *v3;
  void *v4;
  CCUIContentModuleContext *contentModuleContext;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[SiriUISpokenNotificationsModule _turnOnSpokenMessages]";
    _os_log_impl(&dword_231020000, v3, OS_LOG_TYPE_DEFAULT, "%s Turning on Spoken Messages", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpokenNotificationTemporarilyDisabledUntil:", 0);

  contentModuleContext = self->_contentModuleContext;
  v6 = (void *)MEMORY[0x24BE19B78];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SPOKEN_NOTIFICATIONS_ON_STATUS_UPDATE"), &stru_24FFE3E08, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusUpdateWithMessage:type:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIContentModuleContext enqueueStatusUpdate:](contentModuleContext, "enqueueStatusUpdate:", v9);

}

- (void)_muteSpokenMessages
{
  NSObject *v3;
  void *v4;
  void *v5;
  CCUIContentModuleContext *contentModuleContext;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[SiriUISpokenNotificationsModule _muteSpokenMessages]";
    _os_log_impl(&dword_231020000, v3, OS_LOG_TYPE_DEFAULT, "%s Muting Spoken Messages for an hour", (uint8_t *)&v11, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 3600.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpokenNotificationTemporarilyDisabledUntil:", v4);

  contentModuleContext = self->_contentModuleContext;
  v7 = (void *)MEMORY[0x24BE19B78];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SPOKEN_NOTIFICATIONS_MUTE_STATUS_UPDATE"), &stru_24FFE3E08, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusUpdateWithMessage:type:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIContentModuleContext enqueueStatusUpdate:](contentModuleContext, "enqueueStatusUpdate:", v10);

}

- (void)_turnOffSpokenMessagesForTheDay
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CCUIContentModuleContext *contentModuleContext;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[SiriUISpokenNotificationsModule _turnOffSpokenMessagesForTheDay]";
    _os_log_impl(&dword_231020000, v3, OS_LOG_TYPE_DEFAULT, "%s Muting SpokenMessages until tomorrow", (uint8_t *)&v13, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpokenNotificationTemporarilyDisabledUntil:", v6);

  contentModuleContext = self->_contentModuleContext;
  v9 = (void *)MEMORY[0x24BE19B78];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SPOKEN_NOTIFICATIONS_OFF_STATUS_UPDATE"), &stru_24FFE3E08, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statusUpdateWithMessage:type:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIContentModuleContext enqueueStatusUpdate:](contentModuleContext, "enqueueStatusUpdate:", v12);

}

- (BOOL)_isEligibleForAnnounceNotificationsWithVendorID:(unsigned int)a3 productID:(unsigned int)a4
{
  if (a3 != 76)
    return 0;
  if (((0x409Bu >> (a4 - 2)) & 1) != 0 && a4 - 8194 <= 0xE || a4 == 8209 || a4 == 8230)
    return 0;
  else
    return (a4 - 8194 < 0x25) & (0x1C7BB7FF9BuLL >> (a4 - 2));
}

- (BOOL)isDeviceInEligibleAnnounceNotificationsConfiguration
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  const char *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "available");

  if (!v4)
  {
    v12 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[SiriUISpokenNotificationsModule isDeviceInEligibleAnnounceNotificationsConfiguration]";
      _os_log_impl(&dword_231020000, v12, OS_LOG_TYPE_DEFAULT, "%s BT is not available, falling back to assume an eligble device is connected", buf, 0xCu);
    }
LABEL_15:
    if (self->_headphonesAnnounceEnabled)
      return 1;
    goto LABEL_18;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x24BE0F9E0], "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (!v7)
  {

    goto LABEL_18;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v6);
      if (-[SiriUISpokenNotificationsModule _isEligibleForAnnounceNotificationsWithVendorID:productID:](self, "_isEligibleForAnnounceNotificationsWithVendorID:productID:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "vendorId"), objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "productId")))
      {
        v9 = 1;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  }
  while (v8);

  if ((v9 & 1) != 0)
    goto LABEL_15;
LABEL_18:
  if (self->_hearingAidsAnnounceEnabled)
    return 1;
  return self->_builtInSpeakerAnnounceEnabled;
}

- (void)_refreshState
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_2310229D0;
  v4[3] = &unk_24FFE3D08;
  v4[4] = self;
  objc_msgSend(v3, "getSpokenNotificationTemporarilyDisabledStatusWithCompletion:", v4);

}

- (void)_fetchAnnounceSettingsAndRefreshState
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;
  _BOOL4 headphonesAnnounceEnabled;
  _BOOL4 builtInSpeakerAnnounceEnabled;
  int v11;
  const char *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "announceNotificationsOnHearingAidsSupported");

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "announceNotificationsOnHearingAidsEnabled");

  self->_headphonesAnnounceEnabled = -[BBSettingsGateway effectiveGlobalAnnounceHeadphonesSetting](self->_settingsGateway, "effectiveGlobalAnnounceHeadphonesSetting") != 0;
  self->_hearingAidsAnnounceEnabled = v4 & v6;
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_builtInSpeakerAnnounceEnabled = objc_msgSend(v7, "announceNotificationsOnBuiltInSpeakerEnabled");

  v8 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    headphonesAnnounceEnabled = self->_headphonesAnnounceEnabled;
    builtInSpeakerAnnounceEnabled = self->_builtInSpeakerAnnounceEnabled;
    v11 = 136316162;
    v12 = "-[SiriUISpokenNotificationsModule _fetchAnnounceSettingsAndRefreshState]";
    v13 = 1024;
    v14 = headphonesAnnounceEnabled;
    v15 = 1024;
    v16 = v4;
    v17 = 1024;
    v18 = v6;
    v19 = 1024;
    v20 = builtInSpeakerAnnounceEnabled;
    _os_log_impl(&dword_231020000, v8, OS_LOG_TYPE_DEFAULT, "%s fetched announce settings: headphones:%d, hearing aids supported: %d, hearing aids enabled: %d, builtin speaker: %d", (uint8_t *)&v11, 0x24u);
  }
  -[SiriUISpokenNotificationsModule _refreshState](self, "_refreshState");
}

- (void)_refreshStateWithSelected:(BOOL)a3 expanded:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;
  BOOL v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_231022CCC;
  v4[3] = &unk_24FFE3D30;
  v5 = a4;
  v4[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v4);
}

- (void)buttonTapped:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CCUIContentModuleContext *contentModuleContext;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[SiriUISpokenNotificationsModule isDeviceInEligibleAnnounceNotificationsConfiguration](self, "isDeviceInEligibleAnnounceNotificationsConfiguration"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = sub_231022EC8;
    v14[3] = &unk_24FFE3D58;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "getSpokenNotificationTemporarilyDisabledStatusWithCompletion:", v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    contentModuleContext = self->_contentModuleContext;
    v10 = (void *)MEMORY[0x24BE19B78];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SPOKEN_NOTIFICATIONS_REQUIRES_H1_STATUS_UPDATE"), &stru_24FFE3E08, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "statusUpdateWithMessage:type:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUIContentModuleContext enqueueStatusUpdate:](contentModuleContext, "enqueueStatusUpdate:", v13);

  }
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  _QWORD v6[5];

  v3 = a3;
  if (a3)
  {
    self->_selectedOnExpansion = -[CCUIButtonModuleViewController isSelected](self, "isSelected");
    -[SiriUISpokenNotificationsModule _refreshStateWithSelected:expanded:](self, "_refreshStateWithSelected:expanded:", 0, 1);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = sub_231022FFC;
    v6[3] = &unk_24FFE3D80;
    v6[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v6);
  }
  else
  {
    -[SiriUISpokenNotificationsModule _refreshStateWithSelected:expanded:](self, "_refreshStateWithSelected:expanded:", self->_selectedOnExpansion, 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)SiriUISpokenNotificationsModule;
  -[CCUIMenuModuleViewController willTransitionToExpandedContentMode:](&v5, sel_willTransitionToExpandedContentMode_, v3);
}

- (void)didTransitionToExpandedContentMode:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SiriUISpokenNotificationsModule;
  -[CCUIMenuModuleViewController didTransitionToExpandedContentMode:](&v5, sel_didTransitionToExpandedContentMode_);
  if (!a3)
    -[SiriUISpokenNotificationsModule _refreshState](self, "_refreshState");
}

- (void)setContentModuleContext:(id)a3
{
  id v5;
  objc_super v6;

  objc_storeStrong((id *)&self->_contentModuleContext, a3);
  v5 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SiriUISpokenNotificationsModule;
  -[CCUIMenuModuleViewController setContentModuleContext:](&v6, sel_setContentModuleContext_, v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriUISpokenNotificationsModule;
  -[CCUIMenuModuleViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x24BE19B00];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForPackageNamed:inBundle:", CFSTR("AnnounceNotifications"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCUIMenuModuleViewController setGlyphPackageDescription:](self, "setGlyphPackageDescription:", v5);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SPOKEN_NOTIFICATIONS_TITLE"), &stru_24FFE3E08, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleViewController setTitle:](self, "setTitle:", v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *spokenNotificationsModuleQueue;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriUISpokenNotificationsModule;
  -[SiriUISpokenNotificationsModule viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_initWeak(&location, self);
  spokenNotificationsModuleQueue = self->_spokenNotificationsModuleQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_23102326C;
  v5[3] = &unk_24FFE3DA8;
  objc_copyWeak(&v6, &location);
  dispatch_async(spokenNotificationsModuleQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spokenNotificationsModuleQueue, 0);
  objc_storeStrong((id *)&self->_settingsGateway, 0);
  objc_storeStrong((id *)&self->_menuItemOffForTheDay, 0);
  objc_storeStrong((id *)&self->_menuItemMute, 0);
  objc_storeStrong((id *)&self->_menuItemOn, 0);
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end
