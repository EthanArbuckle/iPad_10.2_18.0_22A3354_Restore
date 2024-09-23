@implementation CKSettingsSharedWithYouController

- (CKSettingsSharedWithYouController)init
{
  CKSettingsSharedWithYouController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSettingsSharedWithYouController;
  v2 = -[CKSettingsSharedWithYouController init](&v5, sel_init);
  if (v2)
  {
    MessagesSettingsLocalizedString(CFSTR("SHARED_WITH_YOU"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSettingsSharedWithYouController setTitle:](v2, "setTitle:", v3);

  }
  return v2;
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SHARED_WITH_YOU_GLOBAL_GROUP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);
    v7 = (void *)MEMORY[0x24BE75590];
    MessagesSettingsLocalizedString(CFSTR("AUTOMATIC_SHARING"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, sel_setSharedWithYouEnabled_specifier_, sel_sharedWithYouEnabled_, 0, 6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    MessagesSettingsLocalizedString(CFSTR("AUTOMATIC_SHARING_FOOTER_DESCRIPTION"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x24BE75A68]);

    if (objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown"))
      objc_msgSend(v9, "setProperty:forKey:", &unk_24D0941C0, *MEMORY[0x24BE75A18]);
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isLocked");

      if (v12)
        objc_msgSend(v9, "setProperty:forKey:", &unk_24D0941C0, *MEMORY[0x24BE75A18]);
    }
    objc_msgSend(v5, "addObject:", v9);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v13);

    -[CKSettingsSharedWithYouController setupDefaultAppsIfRequired](self, "setupDefaultAppsIfRequired");
    -[CKSettingsSharedWithYouController getAppSpecifiers](self, "getAppSpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v5, "addObjectsFromArray:", v14);
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)setSharedWithYouEnabled:(id)a3 specifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BE511D8];
  v6 = a3;
  objc_msgSend(v5, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBool:forDomain:forKey:", objc_msgSend(v6, "BOOLValue"), CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouEnabled"));

  -[CKSettingsSharedWithYouController updateAppPreferencesWith:](self, "updateAppPreferencesWith:", v6);
  notify_post((const char *)objc_msgSend(CFSTR("SLSharedWithYouSettingHasChanged"), "UTF8String"));
}

- (id)sharedWithYouEnabled:(id)a3
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if ((objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown", a3) & 1) != 0
    || _os_feature_enabled_impl()
    && (objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", CFSTR("com.apple.MobileSMS")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isLocked"),
        v3,
        (v4 & 1) != 0))
  {
    v5 = &unk_24D0941C0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "getBoolFromDomain:forKey:", CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouEnabled"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)updateAppPreferencesWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getValueFromDomain:forKey:", CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouApps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__CKSettingsSharedWithYouController_updateAppPreferencesWith___block_invoke;
    v8[3] = &unk_24D076180;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
  if (objc_msgSend((id)v12[5], "count"))
  {
    -[CKSettingsSharedWithYouController postNotificationForAppEnablementChanges](self, "postNotificationForAppEnablementChanges");
    -[CKSettingsSharedWithYouController reload](self, "reload");
  }
  _Block_object_dispose(&v11, 8);

}

void __62__CKSettingsSharedWithYouController_updateAppPreferencesWith___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "specifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "specifierForID:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(id *)(a1 + 40);
  v9 = v5;
  if (v8 != v5)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAppIsEnabled:specifier:shouldPostNotification:", v8, v7, v11);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v12);
    v9 = *(id *)(a1 + 40);
  }
  objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75A18]);

}

- (void)setupDefaultAppsIfRequired
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  -[CKSettingsSharedWithYouController getAppBundleIDsFromDefaults](self, "getAppBundleIDsFromDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE51300], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)objc_msgSend(v4, "performSelector:", sel_defaultAppBundleIDs), "mutableCopy");

  objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getBoolFromDomain:forKey:", CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouEnabled"));

  v42 = (void *)v5;
  if (!objc_msgSend(v3, "count"))
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(MEMORY[0x24BE51300], "onboardingAppBundleIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v52 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BE51300], "sharedManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setSharedWithYouEnabled:forApplicationWithBundleID:", v7, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
      }
      while (v10);
    }

    v5 = (uint64_t)v42;
  }
  -[CKSettingsSharedWithYouController getAppBundleIDsFromDefaults](self, "getAppBundleIDsFromDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v17 < v19)
  {
    NSLog(CFSTR("Messages Settings: Shared With You: Adding collaboration Apps"));
    objc_msgSend(MEMORY[0x24BE51300], "collaborationAppBundleIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v48 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BE51300], "sharedManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setSharedWithYouEnabled:forApplicationWithBundleID:", v7, v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v22);
    }

  }
  -[CKSettingsSharedWithYouController getAppBundleIDsFromDefaults](self, "getAppBundleIDsFromDefaults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_msgSend(v27, "count");
  v29 = v42;
  if (v28 < objc_msgSend(v42, "count"))
  {
    objc_msgSend(v42, "removeObjectsInArray:", v27);
    if (objc_msgSend(v42, "count"))
    {
      v41 = v27;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v30 = v42;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v44;
        do
        {
          for (k = 0; k != v32; ++k)
          {
            if (*(_QWORD *)v44 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
            if ((_DWORD)v7)
            {
              objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "getValueFromDomain:forKey:", CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouApps"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v37, "valueForKey:", v35);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "BOOLValue");

              objc_msgSend(MEMORY[0x24BE51300], "sharedManager");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setSharedWithYouEnabled:forApplicationWithBundleID:", v39, v35);

            }
            else
            {
              objc_msgSend(MEMORY[0x24BE51300], "sharedManager");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setSharedWithYouEnabled:forApplicationWithBundleID:", 0, v35);
            }

          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        }
        while (v32);
      }

      v27 = v41;
      v29 = v42;
    }
  }

}

- (id)getAppSpecifiers
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v3 = (void *)MEMORY[0x24BE75590];
  MessagesSettingsLocalizedString(CFSTR("APPS_HEADER"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:name:", CFSTR("SHARED_WITH_YOU_APPS_GROUP"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v2;
  objc_msgSend(v2, "addObject:", v5);
  objc_msgSend(MEMORY[0x24BE51300], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSelector:", sel_sharedWithYouApps);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v7;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v21 = v9;
    v22 = v5;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      v14 = *MEMORY[0x24BE75B70];
      v15 = *MEMORY[0x24BE75B88];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v17, "length"))
          {
            objc_msgSend(v24, "objectForKey:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE75590]), "initWithName:target:set:get:detail:cell:edit:", v17, self, sel_setAppIsEnabled_specifier_shouldPostNotification_, sel_appIsEnabled_, 0, 6, 0);
            objc_msgSend(v19, "setIdentifier:", v18);
            objc_msgSend(v19, "setProperty:forKey:", v18, v14);
            objc_msgSend(v19, "setProperty:forKey:", CFSTR("YES"), v15);
            objc_msgSend(v25, "addObject:", v19);

          }
          else
          {
            NSLog(CFSTR("Messages Settings: Shared With You: could not create app pref for App: %@"), v17);
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    v9 = v21;
    v5 = v22;
  }

  return v25;
}

- (id)getAppBundleIDsFromDefaults
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getValueFromDomain:forKey:", CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouApps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAppIsEnabled:(id)a3 specifier:(id)a4 shouldPostNotification:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  id v22;

  v22 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getValueFromDomain:forKey:", CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouApps"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (v14)
  {
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v22, v15);

  }
  objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v16, "setValue:forDomain:forKey:", v17, CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouApps"));

  v18 = *MEMORY[0x24BE75A18];
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE75A18]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19 || (v21 = objc_msgSend(v19, "BOOLValue"), v21 != objc_msgSend(v22, "BOOLValue")))
    objc_msgSend(v8, "setProperty:forKey:", v22, v18);
  if (!v9 || objc_msgSend(v9, "BOOLValue"))
    -[CKSettingsSharedWithYouController postNotificationForAppEnablementChanges](self, "postNotificationForAppEnablementChanges");

}

- (id)appIsEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE511E8], "deviceIsLockedDown")
    || _os_feature_enabled_impl()
    && (objc_msgSend(MEMORY[0x24BE042F8], "applicationWithBundleIdentifier:", CFSTR("com.apple.MobileSMS")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isLocked"),
        v5,
        v6))
  {
    objc_msgSend(v3, "setProperty:forKey:", &unk_24D0941C0, *MEMORY[0x24BE75A18]);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "getBoolFromDomain:forKey:", CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouEnabled"));

    if (v8)
    {
      objc_msgSend(v3, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE511D8], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "getValueFromDomain:forKey:", CFSTR("com.apple.SocialLayer"), CFSTR("SharedWithYouApps"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "valueForKey:", v9);
      v12 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setProperty:forKey:", v9, *MEMORY[0x24BE75A18]);
    }

  }
  v13 = v4;

  return v13;
}

- (void)postNotificationForAppEnablementChanges
{
  notify_post((const char *)objc_msgSend(CFSTR("SLSharedWithYouAppSettingHasChanged"), "UTF8String"));
}

@end
