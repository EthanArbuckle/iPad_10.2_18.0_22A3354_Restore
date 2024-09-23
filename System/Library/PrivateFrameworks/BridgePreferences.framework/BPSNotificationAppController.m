@implementation BPSNotificationAppController

- (BPSNotificationAppController)init
{
  BPSNotificationAppController *v2;
  NSMutableArray *v3;
  NSMutableArray *notificationSpecifiers;
  uint64_t v5;
  NPSDomainAccessor *bbAppsSettings;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BPSNotificationAppController;
  v2 = -[BPSNotificationAppController init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    notificationSpecifiers = v2->_notificationSpecifiers;
    v2->_notificationSpecifiers = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:", CFSTR("com.apple.bulletinboard.apps"));
    bbAppsSettings = v2->_bbAppsSettings;
    v2->_bbAppsSettings = (NPSDomainAccessor *)v5;

  }
  return v2;
}

- (id)bundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 1;
}

- (BOOL)caresAboutSubsections
{
  return 0;
}

- (id)bulletinBoardSettings
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (id)-[NPSDomainAccessor synchronize](self->_bbAppsSettings, "synchronize");
  -[NPSDomainAccessor dictionaryForKey:](self->_bbAppsSettings, "dictionaryForKey:", self->_bundleIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinSubsections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinSubsections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "mutableCopy", (_QWORD)v16);
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("BPSNanoBulletinSubsections"));
  }
  return v5;
}

- (id)glanceSpecifierForIdentifier:(id)a3
{
  return 0;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *bundleIdentifier;
  void *v8;
  void *v9;
  BBSectionInfo *bbSectionInfo;
  NSMutableDictionary *v11;
  void *sectionInfo;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *notificationSpecifiers;
  void *v20;
  unint64_t v21;
  id v22;
  NSMutableArray *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSMutableArray *v28;
  NSMutableArray *notificationApplicationSpecifiers;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  void *v33;
  NSMutableArray *v34;
  NSMutableArray *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  char HasCapabilityForString;
  void *v53;
  void *v54;
  void *v55;
  NSMutableArray *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  _QWORD v84[2];
  const __CFString *v85;
  _QWORD v86[2];

  v86[1] = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (v4)
    return v4;
  -[BPSNotificationAppController applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSString *)objc_msgSend(v5, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v6;

  -[BPSNotificationAppController bulletinBoardSettings](self, "bulletinBoardSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E488], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "loadBBSections");

  bbSectionInfo = self->_bbSectionInfo;
  self->_bbSectionInfo = 0;

  if (v8)
  {
    v11 = (NSMutableDictionary *)objc_msgSend(v8, "mutableCopy");
    sectionInfo = self->_sectionInfo;
    self->_sectionInfo = v11;
  }
  else
  {
    -[BPSNotificationAppController bbSectionInfo](self, "bbSectionInfo");
    sectionInfo = (void *)objc_claimAutoreleasedReturnValue();
    -[BPSNotificationAppController sectionInfoForBBSectionInfo:](self, "sectionInfoForBBSectionInfo:", sectionInfo);
    v13 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v14 = self->_sectionInfo;
    self->_sectionInfo = v13;

  }
  -[NSMutableDictionary objectForKey:](self->_sectionInfo, "objectForKey:", CFSTR("BPSNanoBulletinShowsCustomSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    self->_mirrorSettings = objc_msgSend(v15, "BOOLValue") ^ 1;
  else
    -[BPSNotificationAppController setMirrorSettings:](self, "setMirrorSettings:", -[BPSNotificationAppController suppressMirrorOption](self, "suppressMirrorOption") ^ 1);
  if (-[BPSNotificationAppController caresAboutSubsections](self, "caresAboutSubsections"))
    -[BPSNotificationAppController updateSubsections](self, "updateSubsections");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSNotificationAppController loadSpecifiersFromPlistName:target:](self, "loadSpecifiersFromPlistName:target:", CFSTR("AbstactApplication"), self);
  v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  notificationSpecifiers = self->_notificationSpecifiers;
  self->_notificationSpecifiers = v18;

  if (!-[BPSNotificationAppController suppressAlertSpecifiers](self, "suppressAlertSpecifiers"))
  {
    if (-[BPSNotificationAppController _suppressSendToNotificationCenterOption](self, "_suppressSendToNotificationCenterOption"))
    {
      -[BPSNotificationAppController removeSendToNotificationCenterOption](self, "removeSendToNotificationCenterOption");
    }
    -[NSMutableArray specifierForID:](self->_notificationSpecifiers, "specifierForID:", CFSTR("NOTIFICATIONS_OFF_ID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[BPSNotificationAppController alertingMode](self, "alertingMode");
    if (v21 == 2)
    {
      v23 = self->_notificationSpecifiers;
      v24 = CFSTR("ALLOW_NOTIFICATIONS_ID");
    }
    else
    {
      if (v21 != 1)
      {
        if (v21)
          goto LABEL_23;
        v22 = v20;
LABEL_21:
        v25 = v22;
        if (v22)
        {
          -[NSMutableArray specifierForID:](self->_notificationSpecifiers, "specifierForID:", CFSTR("CUSTOM_RADIO_GROUP_ID"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v25;
          objc_msgSend(v26, "setProperty:forKey:", v25, *MEMORY[0x24BE75C20]);

          goto LABEL_24;
        }
LABEL_23:
        v82 = 0;
LABEL_24:
        if (-[BPSNotificationAppController alertingMode](self, "alertingMode") == 1
          || -[BPSNotificationAppController alertingMode](self, "alertingMode") == 2)
        {
          v27 = -[NSMutableArray indexOfObject:](self->_notificationSpecifiers, "indexOfObject:", v20);
          if (v27 == 0x7FFFFFFFFFFFFFFFLL)
          {
            NSLog(CFSTR("Error Notifications Off specifier not found."));
            v27 = 0;
          }
          -[BPSNotificationAppController notificationApplicationSpecifiers](self, "notificationApplicationSpecifiers");
          v28 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          notificationApplicationSpecifiers = self->_notificationApplicationSpecifiers;
          self->_notificationApplicationSpecifiers = v28;

          if (self->_notificationApplicationSpecifiers)
          {
            v76 = v17;
            v79 = v20;
            v30 = v16;
            v31 = v8;
            if (!-[NSMutableArray count](self->_notificationSpecifiers, "count"))
            {
              v32 = self->_notificationSpecifiers;
              objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v32, "addObject:", v33);

            }
            v34 = self->_notificationSpecifiers;
            v35 = self->_notificationApplicationSpecifiers;
            objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v27 + 1, -[NSMutableArray count](v35, "count"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray insertObjects:atIndexes:](v34, "insertObjects:atIndexes:", v35, v36);

            v8 = v31;
            v16 = v30;
            v17 = v76;
            v20 = v79;
          }
          if (-[BPSNotificationAppController alertType](self, "alertType") && !self->_mirrorSettings)
          {
            v75 = v8;
            v37 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("ALERTS"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
            v77 = v16;
            v80 = v20;
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "groupSpecifierWithID:name:", CFSTR("ALERT_GROUP_ID"), v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            v86[0] = CFSTR("tinker-paired");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = v40;
            objc_msgSend(v40, "setProperty:forKey:", v41);

            -[NSMutableArray insertObject:atIndex:](self->_notificationSpecifiers, "insertObject:atIndex:", v40, v27 + 1);
            v42 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("SOUND"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v44, self, sel_setSoundsValue_forSpecifier_, sel_soundsValue_, 0, 6, 0);
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            v85 = CFSTR("tinker-paired");
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setProperty:forKey:", v46, CFSTR("forbiddenWatchCapabilities"));

            -[NSMutableArray insertObject:atIndex:](self->_notificationSpecifiers, "insertObject:atIndex:", v45, v27 + 2);
            v47 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("HAPTIC"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v49, self, sel_setVibrationValue_forSpecifier_, sel_vibrationValue_, 0, 6, 0);
            v50 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = v77;
            v20 = v80;

            -[NSMutableArray insertObject:atIndex:](self->_notificationSpecifiers, "insertObject:atIndex:", v50, v27 + 3);
            v8 = v75;

          }
          if (-[NSMutableArray count](self->_notificationSpecifiers, "count"))
          {
            BPSGetActiveSetupCompletedDevice();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            HasCapabilityForString = BPSDeviceHasCapabilityForString(CFSTR("tinker-paired"), v51);

            if ((HasCapabilityForString & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("NOTIFICATION_COALESCING_GROUP_ID"));
              v78 = v16;
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("NOTIFICATION_COALESCING_TITLE"), self, sel_setNotificationGroupingValue_specifier_, sel_notificationGroupingValue_, objc_opt_class(), 2, 0);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_COALESCING_TITLE"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setName:", v55);

              objc_msgSend(v53, "setIdentifier:", CFSTR("NOTIFICATION_COALESCING_ID"));
              objc_msgSend(v53, "setProperty:forKey:", CFSTR("notificationGroupTitles"), *MEMORY[0x24BE75D58]);
              objc_msgSend(v53, "setProperty:forKey:", CFSTR("notificationGroupValues"), *MEMORY[0x24BE75DA8]);
              v56 = self->_notificationSpecifiers;
              v84[0] = v81;
              v84[1] = v53;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v84, 2);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObjectsFromArray:](v56, "addObjectsFromArray:", v57);

              v16 = v78;
            }
          }
        }

        goto LABEL_39;
      }
      v23 = self->_notificationSpecifiers;
      v24 = CFSTR("SEND_TO_NOTIFICATION_CENTER_ID");
    }
    -[NSMutableArray specifierForID:](v23, "specifierForID:", v24);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  -[BPSNotificationAppController removeAlertOptions](self, "removeAlertOptions");
LABEL_39:
  if (-[BPSNotificationAppController suppressNotificationCoalescingOptions](self, "suppressNotificationCoalescingOptions"))
  {
    -[BPSNotificationAppController removeNotificationCoalescingOptions](self, "removeNotificationCoalescingOptions");
  }
  -[BPSNotificationAppController applicationGroupSpecifiers](self, "applicationGroupSpecifiers");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObjectsFromArray:", v58);

  if (-[BPSNotificationAppController suppressMirrorOption](self, "suppressMirrorOption"))
  {
    -[BPSNotificationAppController removeMirrorOptions](self, "removeMirrorOptions");
  }
  else if (-[BPSNotificationAppController suppressAllMirrorSpecifiers](self, "suppressAllMirrorSpecifiers"))
  {
    -[BPSNotificationAppController removeMirrorOptions](self, "removeMirrorOptions");
    -[BPSNotificationAppController removeAlertOptions](self, "removeAlertOptions");
  }
  else
  {
    -[NSMutableArray specifierForID:](self->_notificationSpecifiers, "specifierForID:", CFSTR("MIRROR_RADIO_GROUP_ID"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_mirrorSettings)
    {
      -[BPSNotificationAppController removeAlertOptions](self, "removeAlertOptions");
      -[NSMutableArray specifierForID:](self->_notificationSpecifiers, "specifierForID:", CFSTR("MIRROR_MY_COMPANION_ID"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setProperty:forKey:", v60, *MEMORY[0x24BE75C20]);
      -[BPSNotificationAppController localizedMirroringDetailFooter](self, "localizedMirroringDetailFooter");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setProperty:forKey:", v61, *MEMORY[0x24BE75A68]);

    }
    else
    {
      -[BPSNotificationAppController mirroredApplicationGroupSpecifiers](self, "mirroredApplicationGroupSpecifiers");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObjectsFromArray:", v62);

      -[NSMutableArray specifierForID:](self->_notificationSpecifiers, "specifierForID:", CFSTR("CUSTOM_ID"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setProperty:forKey:", v60, *MEMORY[0x24BE75C20]);
    }

  }
  objc_msgSend(v83, "addObjectsFromArray:", self->_notificationSpecifiers);
  objc_msgSend(v83, "addObjectsFromArray:", v17);
  if (-[BPSNotificationAppController settingsMode](self, "settingsMode") == 1 && !objc_msgSend(v83, "count"))
  {
    -[BPSNotificationAppController specifier](self, "specifier");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "propertyForKey:", *MEMORY[0x24BE75D50]);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("NOTIFICATIONS_SETTINGS_DESCRIPTION_%@"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
    v67 = v16;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringWithFormat:", v68, v64);
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v67;
    -[BPSNotificationAppController customGroupSpecifierForDescription:](self, "customGroupSpecifierForDescription:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "addObject:", v70);

  }
  -[BPSNotificationAppController localizedPaneTitle](self, "localizedPaneTitle");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSNotificationAppController setTitle:](self, "setTitle:", v71);

  v72 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v83;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  return v4;
}

- (id)customGroupSpecifierForDescription:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  NSRange v17;

  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATIONS_SETTINGS"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v10, *MEMORY[0x24BE75A30]);

  objc_msgSend(v8, "setProperty:forKey:", v5, *MEMORY[0x24BE75A58]);
  v11 = objc_msgSend(v5, "rangeOfString:options:", v7, 4);
  v13 = v12;

  v17.location = v11;
  v17.length = v13;
  NSStringFromRange(v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v14, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v15, *MEMORY[0x24BE75A50]);

  objc_msgSend(v8, "setProperty:forKey:", CFSTR("_showSettingsNotifications"), *MEMORY[0x24BE75A38]);
  return v8;
}

- (void)_showSettingsNotifications
{
  void *v2;
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  -[BPSNotificationAppController bbSectionInfo](self, "bbSectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_24CBE59D0;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  v7 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("prefs:root=NOTIFICATIONS_ID&path=%@"), v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLWithString:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BPSOpenSensitiveURLAsync(v8);

}

- (id)sectionInfoForBBSectionInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16E0];
  if (v4 && !objc_msgSend(v4, "alertType"))
    v7 = objc_msgSend(v4, "showsInLockScreen");
  else
    v7 = 1;
  objc_msgSend(v6, "numberWithInt:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("BPSNanoBulletinShowsAlerts"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "showsMessagePreview"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("BPSNanoBulletinShowsPreview"));

  objc_msgSend(v4, "sectionID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    || (-[BPSNotificationAppController applicationBundleIdentifier](self, "applicationBundleIdentifier"),
        (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("BPSNanoBulletinSectionId"));

  }
  objc_msgSend(v4, "subsectionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("BPSNanoBulletinSubsectionId"));
  objc_msgSend(v4, "subsections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v4, "subsections", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          -[BPSNotificationAppController sectionInfoForBBSectionInfo:](self, "sectionInfoForBBSectionInfo:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

    objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("BPSNanoBulletinSubsections"));
  }

  return v5;
}

- (BBSectionInfo)bbSectionInfo
{
  BBSectionInfo **p_bbSectionInfo;
  BBSectionInfo *bbSectionInfo;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  p_bbSectionInfo = &self->_bbSectionInfo;
  bbSectionInfo = self->_bbSectionInfo;
  if (!bbSectionInfo)
  {
    objc_msgSend(MEMORY[0x24BE6E488], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bbSections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BE6E488], "sharedManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "loadBBSections");

      objc_msgSend(MEMORY[0x24BE6E488], "sharedManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bbSections");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v14, "sectionID", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isEqualToString:", self->_bundleIdentifier))
          {
            objc_storeStrong((id *)p_bbSectionInfo, v14);

            goto LABEL_14;
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_14:

    bbSectionInfo = *p_bbSectionInfo;
  }
  return bbSectionInfo;
}

- (void)updateSubsections
{
  void *v3;
  BBSectionInfo *bbSectionInfo;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  BPSNotificationAppController *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE6E488], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadBBSections");

  bbSectionInfo = self->_bbSectionInfo;
  self->_bbSectionInfo = 0;

  -[BPSNotificationAppController bbSectionInfo](self, "bbSectionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BPSNotificationAppController sectionInfoForBBSectionInfo:](self, "sectionInfoForBBSectionInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinSubsections"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (self->_mirrorSettings
      || (-[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfo, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinSubsections")), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinSubsections"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionInfo, "setObject:forKeyedSubscript:", v8, CFSTR("BPSNanoBulletinSubsections"));

    }
    else
    {
      v21 = v6;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinSubsections"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      if (objc_msgSend(v11, "count"))
      {
        v12 = 0;
        v22 = self;
        do
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinSubsectionId"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          -[NSMutableDictionary objectForKeyedSubscript:](self->_sectionInfo, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinSubsections"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v25;
            while (2)
            {
              for (i = 0; i != v16; ++i)
              {
                if (*(_QWORD *)v25 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinSubsectionId"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v13, "isEqualToString:", v20))
                {
                  objc_msgSend(v11, "setObject:atIndexedSubscript:", v19, v12);

                  goto LABEL_18;
                }

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
              if (v16)
                continue;
              break;
            }
          }
LABEL_18:

          ++v12;
          self = v22;
        }
        while (v12 < objc_msgSend(v11, "count"));
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sectionInfo, "setObject:forKeyedSubscript:", v11, CFSTR("BPSNanoBulletinSubsections"));

      v6 = v21;
    }
  }
  else
  {
    -[NSMutableDictionary removeObjectForKey:](self->_sectionInfo, "removeObjectForKey:", CFSTR("BPSNanoBulletinSubsections"));
  }

}

- (void)removeMirrorOptions
{
  NSMutableArray *notificationSpecifiers;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  id v8;

  notificationSpecifiers = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](notificationSpecifiers, "specifierForID:", CFSTR("MIRROR_RADIO_GROUP_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](notificationSpecifiers, "removeObject:", v4);

  v5 = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](v5, "specifierForID:", CFSTR("MIRROR_MY_COMPANION_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v5, "removeObject:", v6);

  v7 = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](v7, "specifierForID:", CFSTR("CUSTOM_ID"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v7, "removeObject:", v8);

}

- (void)removeAlertOptions
{
  NSMutableArray *notificationSpecifiers;
  void *v4;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  NSMutableArray *v15;
  void *v16;

  notificationSpecifiers = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](notificationSpecifiers, "specifierForID:", CFSTR("ALERT_GROUP_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](notificationSpecifiers, "removeObject:", v4);

  v5 = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](v5, "specifierForID:", CFSTR("CUSTOM_RADIO_GROUP_ID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v5, "removeObject:", v6);

  v7 = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](v7, "specifierForID:", CFSTR("ALLOW_NOTIFICATIONS_ID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v7, "removeObject:", v8);

  v9 = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](v9, "specifierForID:", CFSTR("SEND_TO_NOTIFICATION_CENTER_ID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v9, "removeObject:", v10);

  v11 = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](v11, "specifierForID:", CFSTR("NOTIFICATIONS_OFF_ID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v11, "removeObject:", v12);

  v13 = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](v13, "specifierForID:", CFSTR("NOTIFICATION_COALESCING_GROUP_ID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v13, "removeObject:", v14);

  v15 = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](v15, "specifierForID:", CFSTR("NOTIFICATION_COALESCING_ID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v15, "removeObject:", v16);

  if (self->_notificationApplicationSpecifiers)
    -[NSMutableArray removeObjectsInArray:](self->_notificationSpecifiers, "removeObjectsInArray:");
}

- (void)removeNotificationCoalescingOptions
{
  NSMutableArray *notificationSpecifiers;
  void *v4;
  NSMutableArray *v5;
  id v6;

  notificationSpecifiers = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](notificationSpecifiers, "specifierForID:", CFSTR("NOTIFICATION_COALESCING_GROUP_ID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](notificationSpecifiers, "removeObject:", v4);

  v5 = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](v5, "specifierForID:", CFSTR("NOTIFICATION_COALESCING_ID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](v5, "removeObject:", v6);

}

- (void)removeSendToNotificationCenterOption
{
  NSMutableArray *notificationSpecifiers;
  id v3;

  notificationSpecifiers = self->_notificationSpecifiers;
  -[NSMutableArray specifierForID:](notificationSpecifiers, "specifierForID:", CFSTR("SEND_TO_NOTIFICATION_CENTER_ID"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObject:](notificationSpecifiers, "removeObject:", v3);

}

- (id)localizedPaneTitle
{
  NSLog(CFSTR("%s should be overridden by subclasses"), a2, "-[BPSNotificationAppController localizedPaneTitle]");
  return 0;
}

- (id)applicationBundleIdentifier
{
  NSLog(CFSTR("%s should be overridden by subclasses"), a2, "-[BPSNotificationAppController applicationBundleIdentifier]");
  return 0;
}

- (BOOL)suppressMirrorOption
{
  return 0;
}

- (BOOL)suppressAlertSpecifiers
{
  return 0;
}

- (BOOL)suppressAllMirrorSpecifiers
{
  return 0;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 1;
}

- (BOOL)suppressNotificationCoalescingOptions
{
  return 0;
}

- (BOOL)_suppressSendToNotificationCenterOption
{
  return !-[BPSNotificationAppController watchHasCapabilitySendToNotificationCenter](self, "watchHasCapabilitySendToNotificationCenter")|| -[BPSNotificationAppController suppressSendToNotificationCenterOption](self, "suppressSendToNotificationCenterOption");
}

- (BOOL)watchHasCapabilitySendToNotificationCenter
{
  void *v2;
  char v3;

  BPSGetActiveSetupCompletedDevice();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BPSIsDeviceCompatibleWithVersions(CFSTR("5"), 0, v2);

  return v3;
}

- (NSMutableArray)notificationApplicationSpecifiers
{
  return 0;
}

- (id)mirroredApplicationGroupSpecifiers
{
  return 0;
}

- (id)applicationGroupSpecifiers
{
  NSString *v2;
  NSString *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "propertyForKey:", *MEMORY[0x24BE759D0]);
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    -[objc_class sharedInstance](NSClassFromString(v2), "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "areSpecifiersLoaded") & 1) == 0)
      objc_msgSend(v4, "loadSpecifiers");
    objc_msgSend(v4, "specifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)localizedMirroringDetailFooter
{
  return 0;
}

- (void)writeSectionState
{
  NSMutableDictionary *sectionInfo;
  void *v4;
  id v5;
  __CFNotificationCenter *DarwinNotifyCenter;

  sectionInfo = self->_sectionInfo;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sectionInfo, "setObject:forKey:", v4, CFSTR("BPSNanoBulletinUpdateTimestamp"));

  -[NPSDomainAccessor setObject:forKey:](self->_bbAppsSettings, "setObject:forKey:", self->_sectionInfo, self->_bundleIdentifier);
  v5 = (id)-[NPSDomainAccessor synchronize](self->_bbAppsSettings, "synchronize");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("BulletinDistributorBBSectionsDidChangeNotification"), 0, 0, 0);
}

- (void)setMirrorSettings:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 mirrorSettings;
  NSMutableDictionary *sectionInfo;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  mirrorSettings = self->_mirrorSettings;
  self->_mirrorSettings = a3;
  sectionInfo = self->_sectionInfo;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sectionInfo, "setObject:forKey:", v7, CFSTR("BPSNanoBulletinShowsCustomSettings"));

  -[BPSNotificationAppController writeSectionState](self, "writeSectionState");
  if (mirrorSettings != v3)
  {
    if (-[BPSNotificationAppController alertType](self, "alertType"))
    {
      if (v3)
        v8 = 0;
      else
        v8 = 3;
      objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_setCurrentToneWatchAlertPolicy:forAlertType:", v8, -[BPSNotificationAppController alertType](self, "alertType"));

      objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_setCurrentVibrationWatchAlertPolicy:forAlertType:", v8, -[BPSNotificationAppController alertType](self, "alertType"));

    }
    -[BPSNotificationAppController mirrorSettingsChanged:](self, "mirrorSettingsChanged:", v3);
    -[BPSListController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BPSNotificationAppController *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  BPSNotificationAppController *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v8 = -[BPSNotificationAppController indexForIndexPath:](self, "indexForIndexPath:", v7);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("didSelect row: %@ spec: %@"), v10, v11);

  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v12, "isEqualToString:", CFSTR("MIRROR_MY_COMPANION_ID"));

  if ((_DWORD)v11)
  {
    v13 = self;
    v14 = 1;
  }
  else
  {
    objc_msgSend(v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("CUSTOM_ID"));

    if (!v16)
    {
      objc_msgSend(v9, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("ALLOW_NOTIFICATIONS_ID"));

      if (v18)
      {
        v19 = self;
        v20 = 2;
      }
      else
      {
        objc_msgSend(v9, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("SEND_TO_NOTIFICATION_CENTER_ID"));

        if (v22)
        {
          v19 = self;
          v20 = 1;
        }
        else
        {
          objc_msgSend(v9, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("NOTIFICATIONS_OFF_ID"));

          if (!v24)
            goto LABEL_13;
          v19 = self;
          v20 = 0;
        }
      }
      -[BPSNotificationAppController setAlertingMode:](v19, "setAlertingMode:", v20);
      goto LABEL_13;
    }
    v13 = self;
    v14 = 0;
  }
  -[BPSNotificationAppController setMirrorSettings:](v13, "setMirrorSettings:", v14);
LABEL_13:
  v25.receiver = self;
  v25.super_class = (Class)BPSNotificationAppController;
  -[BPSNotificationAppController tableView:didSelectRowAtIndexPath:](&v25, sel_tableView_didSelectRowAtIndexPath_, v6, v7);

}

- (id)notificationGroupTitles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_COALESCING_OFF"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class(), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_COALESCING_AUTO"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOTIFICATION_COALESCING_BY_APP"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)notificationGroupValues
{
  return &unk_24CBF0120;
}

- (id)notificationGroupingValue:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKey:](self->_sectionInfo, "objectForKey:", CFSTR("BPSNanoBulletinNotificationGrouping"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_24CBEFF80;
  v5 = v3;

  return v5;
}

- (void)setNotificationGroupingValue:(id)a3 specifier:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_sectionInfo, "setObject:forKey:", a3, CFSTR("BPSNanoBulletinNotificationGrouping"));
  -[BPSNotificationAppController writeSectionState](self, "writeSectionState");
}

- (void)setAlertingMode:(unint64_t)a3
{
  unint64_t v5;
  NSMutableDictionary *sectionInfo;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;

  v5 = -[BPSNotificationAppController alertingMode](self, "alertingMode");
  sectionInfo = self->_sectionInfo;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3 == 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](sectionInfo, "setObject:forKey:", v7, CFSTR("BPSNanoBulletinShowsAlerts"));

  -[NSMutableDictionary objectForKey:](self->_sectionInfo, "objectForKey:", CFSTR("BPSNanoBulletinSubsections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 == 1)
  {
    -[NSMutableDictionary objectForKey:](self->_sectionInfo, "objectForKey:", CFSTR("BPSNanoBulletinSubsections"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3 == 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("BPSNanoBulletinShowsAlerts"));

  }
  v13 = self->_sectionInfo;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a3 == 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, CFSTR("BPSNanoBulletinSendToNotificationCenter"));

  -[BPSNotificationAppController writeSectionState](self, "writeSectionState");
  if (v5 != a3)
    -[BPSListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (unint64_t)alertingMode
{
  unint64_t v3;
  void *v4;

  if (-[BPSNotificationAppController showAlerts](self, "showAlerts"))
    return 2;
  -[NSMutableDictionary objectForKey:](self->_sectionInfo, "objectForKey:", CFSTR("BPSNanoBulletinSendToNotificationCenter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "BOOLValue");

  return v3;
}

- (void)setShowPreviewValue:(id)a3 forSpecifier:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[NSMutableDictionary setObject:forKey:](self->_sectionInfo, "setObject:forKey:", v5, CFSTR("BPSNanoBulletinShowsPreview"));
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary objectForKey:](self->_sectionInfo, "objectForKey:", CFSTR("BPSNanoBulletinSubsections"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setObject:forKey:", v5, CFSTR("BPSNanoBulletinShowsPreview"));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  -[BPSNotificationAppController writeSectionState](self, "writeSectionState");
}

- (id)showPreviewValue:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_sectionInfo, "objectForKey:", CFSTR("BPSNanoBulletinShowsPreview"));
}

- (void)setSoundsValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;
  id v6;

  if (objc_msgSend(a3, "BOOLValue"))
    v5 = 1;
  else
    v5 = 2;
  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCurrentToneWatchAlertPolicy:forAlertType:", v5, -[BPSNotificationAppController alertType](self, "alertType"));

}

- (id)soundsValue:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BEB8CC8], "sharedToneManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_currentToneWatchAlertPolicyForAlertType:", -[BPSNotificationAppController alertType](self, "alertType"));

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 == 1);
}

- (void)setVibrationValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;
  id v6;

  if (objc_msgSend(a3, "BOOLValue"))
    v5 = 1;
  else
    v5 = 2;
  objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setCurrentVibrationWatchAlertPolicy:forAlertType:", v5, -[BPSNotificationAppController alertType](self, "alertType"));

}

- (id)vibrationValue:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x24BEB8CD8], "sharedVibrationManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_currentVibrationWatchAlertPolicyForAlertType:", -[BPSNotificationAppController alertType](self, "alertType"));

  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5 == 1);
}

- (BOOL)showAlerts
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!self->_mirrorSettings)
  {
    -[NSMutableDictionary objectForKey:](self->_sectionInfo, "objectForKey:", CFSTR("BPSNanoBulletinShowsAlerts"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    return v12;
  }
  -[BPSNotificationAppController bbSectionInfo](self, "bbSectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subsections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(v2, "subsections", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "allowsNotifications")
            && (objc_msgSend(v10, "alertType") || (objc_msgSend(v10, "showsInLockScreen") & 1) != 0))
          {

            goto LABEL_18;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  else if (objc_msgSend(v2, "allowsNotifications"))
  {
    if (objc_msgSend(v2, "alertType"))
LABEL_18:
      v14 = 1;
    else
      v14 = objc_msgSend(v2, "showsInLockScreen");
    goto LABEL_20;
  }
  v14 = 0;
LABEL_20:

  return v14;
}

- (BOOL)showPreview
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (self->_mirrorSettings)
  {
    -[BPSNotificationAppController bbSectionInfo](self, "bbSectionInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "subsections");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v2, "subsections", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "showsMessagePreview") & 1) != 0)
            {

              v10 = 1;
              goto LABEL_15;
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          if (v7)
            continue;
          break;
        }
      }

      v10 = 0;
    }
    else
    {
      v10 = objc_msgSend(v2, "showsMessagePreview");
    }
LABEL_15:

    return v10;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_sectionInfo, "objectForKey:", CFSTR("BPSNanoBulletinShowsPreview"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    return v12;
  }
}

- (int64_t)alertType
{
  return 0;
}

- (PSSpecifier)previewSwitchSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE75590];
  -[BPSNotificationAppController localizedPreviewChoiceTitle](self, "localizedPreviewChoiceTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, self, sel_setShowPreviewValue_forSpecifier_, sel_showPreviewValue_, 0, 6, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PSSpecifier *)v5;
}

- (id)localizedPreviewChoiceTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHOW_PREVIEWS"), &stru_24CBE59D0, CFSTR("AbstactApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wantsPreviewChoice
{
  return 1;
}

- (id)localizedPreviewGroupLabel
{
  return 0;
}

- (id)localizedPreviewGroupFooter
{
  return 0;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1392);
}

- (void)setBbSectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_bbSectionInfo, a3);
}

- (void)setNotificationApplicationSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_notificationApplicationSpecifiers, a3);
}

- (NPSDomainAccessor)bbAppsSettings
{
  return self->_bbAppsSettings;
}

- (void)setBbAppsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_bbAppsSettings, a3);
}

- (NSMutableArray)notificationSpecifiers
{
  return self->_notificationSpecifiers;
}

- (BOOL)mirrorSettings
{
  return self->_mirrorSettings;
}

- (NSMutableDictionary)sectionInfo
{
  return self->_sectionInfo;
}

- (unint64_t)settingsMode
{
  return self->_settingsMode;
}

- (void)setSettingsMode:(unint64_t)a3
{
  self->_settingsMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_storeStrong((id *)&self->_notificationSpecifiers, 0);
  objc_storeStrong((id *)&self->_bbAppsSettings, 0);
  objc_storeStrong((id *)&self->_notificationApplicationSpecifiers, 0);
  objc_storeStrong((id *)&self->_bbSectionInfo, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
