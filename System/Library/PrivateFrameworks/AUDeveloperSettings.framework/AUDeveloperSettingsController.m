@implementation AUDeveloperSettingsController

- (AUDeveloperSettingsController)init
{
  AUDeveloperSettingsController *v2;
  CBUserController *v3;
  CBUserController *loggingController;
  PSSpecifier *customerOverrideCollectionSpecifier;
  os_log_t v6;
  OS_os_log *log;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AUDeveloperSettingsController;
  v2 = -[AUDeveloperSettingsController init](&v9, sel_init);
  if (v2)
  {
    v3 = (CBUserController *)objc_alloc_init(MEMORY[0x24BDBB2B0]);
    loggingController = v2->_loggingController;
    v2->_loggingController = v3;

    customerOverrideCollectionSpecifier = v2->_customerOverrideCollectionSpecifier;
    v2->_customerOverrideCollectionSpecifier = 0;

    v6 = os_log_create((const char *)objc_msgSend(CFSTR("com.apple.AUDeveloperSettings"), "UTF8String"), "developerSettings");
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

    -[AUDeveloperSettingsController registerForNotifications](v2, "registerForNotifications");
  }
  return v2;
}

- (void)registerForNotifications
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "com.apple.bluetoothuser.settingsChanged";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_21BF1C000, a2, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed for %s (%u)", (uint8_t *)&v2, 0x12u);
}

void __57__AUDeveloperSettingsController_registerForNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleBTUserSettingsChangedNotification:", a2);

}

- (void)handleBTUserSettingsChangedNotification:(int)a3
{
  NSObject *log;
  PSSpecifier *logCollectionSpecifier;
  int v6;
  const char *v7;
  __int16 v8;
  PSSpecifier *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    logCollectionSpecifier = self->_logCollectionSpecifier;
    v6 = 136315394;
    v7 = "-[AUDeveloperSettingsController handleBTUserSettingsChangedNotification:]";
    v8 = 2112;
    v9 = logCollectionSpecifier;
    _os_log_impl(&dword_21BF1C000, log, OS_LOG_TYPE_DEFAULT, "%s: Reloading %@", (uint8_t *)&v6, 0x16u);
  }
  self->_btQueried = 0;
  -[AUDeveloperSettingsController reloadSpecifier:](self, "reloadSpecifier:", self->_logCollectionSpecifier);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AUDeveloperSettingsController;
  -[AUDeveloperSettingsController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AIRPODS_TESTING"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AUDeveloperSettingsController setTitle:](self, "setTitle:", v4);

  -[AUDeveloperSettingsController setEditing:](self, "setEditing:", 0);
}

- (id)specifiers
{
  void *v2;
  id v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PSSpecifier *v30;
  PSSpecifier *logCollectionSpecifier;
  objc_class *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSRange v41;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    v40 = (int)*MEMORY[0x24BE756E0];
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INSTALL_PRE_RELEASE_BETA_FIRMWARE_ON"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setName:", v7);

    objc_msgSend(v5, "addObject:", v39);
    -[AUDeveloperSettingsController createCustomerSpecifiers](self, "createCustomerSpecifiers");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v5;
    objc_msgSend(v5, "addObjectsFromArray:", v38);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("HOW_TO_INSTALL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *MEMORY[0x24BE75A68];
    objc_msgSend(v37, "setProperty:forKey:", v10);

    objc_msgSend(v5, "addObject:", v37);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LEGAL_CONSENT_BRIEF"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ %@"), v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v19, *MEMORY[0x24BE75A30]);

    objc_msgSend(v11, "setProperty:forKey:", v17, v35);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41.location = objc_msgSend(v17, "rangeOfString:", v21);
    NSStringFromRange(v41);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v22, *MEMORY[0x24BE75A40]);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProperty:forKey:", v23, *MEMORY[0x24BE75A50]);

    objc_msgSend(v11, "setProperty:forKey:", CFSTR("showLegalConsentLearnMoreLink:"), *MEMORY[0x24BE75A38]);
    objc_msgSend(v36, "addObject:", v11);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("ENABLE_LOG_COLLECTION_FOR_AIRPODS"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setName:", v26);

    objc_msgSend(v36, "addObject:", v24);
    v27 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("LOG_COLLECTION"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, sel_handleLogCollectionToggle_specifier_, sel_islogCollectionEnabled_, 0, 6, 0);
    v30 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    logCollectionSpecifier = self->_logCollectionSpecifier;
    self->_logCollectionSpecifier = v30;

    objc_msgSend(v36, "addObject:", self->_logCollectionSpecifier);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v36);
    v32 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v33 = *(Class *)((char *)&self->super.super.super.super.super.isa + v40);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v40) = v32;

    v3 = *(id *)((char *)&self->super.super.super.super.super.isa + v40);
  }
  return v3;
}

- (id)createCustomerSpecifiers
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v36 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "accessoriesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v38 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v38)
  {
    v37 = *(_QWORD *)v41;
    v31 = *MEMORY[0x24BE75A18];
    v33 = *MEMORY[0x24BE75868];
    v32 = *MEMORY[0x24BE759F0];
    v34 = v2;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v41 != v37)
          objc_enumerationMutation(v2);
        v4 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v3);
        objc_msgSend(v2, "objectForKeyedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SupportsDeveloperSettings"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (!v6 || objc_msgSend(v6, "BOOLValue"))
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "isEqualToString:", &stru_24DFF2410))
          {
            v9 = v4;

            v8 = v9;
          }
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("fusing"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = AUDeveloperSettingsAccessoryFusingStringToType(v10);
          v39 = v10;
          if (v11 == 2)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            v14 = CFSTR("UNFUSED_NOT_ELIGIBLE");
LABEL_14:
            objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "stringByAppendingString:", v15);
            v16 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (!v11)
            {
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v12;
              v14 = CFSTR("DEV_FUSED_NOT_ELIGIBLE");
              goto LABEL_14;
            }
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("assetLocation"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = AUDeveloperSettingsURLStringToType(v13);
            if (v18 <= 6 && ((1 << v18) & 0x4C) != 0)
            {
              v17 = 1;
LABEL_21:

              objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("appleconnect://settings"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v20, "canOpenURL:", v21);

              if (v17 && v22)
              {
                objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel_getOverrideLocation_, objc_opt_class(), 1, 0);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, sel_setSeedParticipation_specifier_, sel_isSeedParticipationEnabled_, 0, 6, 0);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v24;
                if ((v17 & 1) == 0)
                  objc_msgSend(v24, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v31);
              }
              objc_msgSend(v23, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v33);
              objc_msgSend(v23, "setIdentifier:", v4);
              NSStringFromSelector(sel_removedSpecifier_);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setProperty:forKey:", v25, v32);

              objc_msgSend(v36, "addObject:", v23);
              v2 = v34;
              goto LABEL_27;
            }
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("LOCATION_NOT_ELIGIBLE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
            v26 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "stringByAppendingString:", v26);
            v16 = objc_claimAutoreleasedReturnValue();

            v8 = (void *)v26;
          }

          v17 = 0;
          v8 = (void *)v16;
          goto LABEL_21;
        }
LABEL_27:

        ++v3;
      }
      while (v38 != v3);
      v27 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      v38 = v27;
    }
    while (v27);
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v36);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (void)showLegalConsentLearnMoreLink:(id)a3
{
  id v4;

  v4 = (id)objc_opt_new();
  -[AUDeveloperSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)setSeedParticipation:(id)a3 specifier:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(a3, "BOOLValue") & 1) != 0)
  {
    if (-[AUDeveloperSettingsController needLegalConsent](self, "needLegalConsent"))
    {
      -[AUDeveloperSettingsController showLegalConsent:](self, "showLegalConsent:", v8);
    }
    else
    {
      +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateAccessory:locationType:", v7, 3);

      -[AUDeveloperSettingsController reloadSpecifier:](self, "reloadSpecifier:", self->_customerOverrideCollectionSpecifier);
    }
  }
  else
  {
    -[AUDeveloperSettingsController showParticipateInSeedOffAlert:](self, "showParticipateInSeedOffAlert:", v8);
  }

}

- (id)isSeedParticipationEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isSeedParticipationEnabled:", v5);
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
}

- (BOOL)needLegalConsent
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v2, "accessoriesDictionary", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(v2, "isSeedParticipationEnabled:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (void)_agreeToLegalConsent
{
  void *v3;
  void *v4;

  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifier identifier](self->_currentAccessorySpecifier, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAccessory:locationType:", v4, 3);

  -[AUDeveloperSettingsController reloadSpecifier:](self, "reloadSpecifier:", self->_customerOverrideCollectionSpecifier);
  -[AUDeveloperSettingsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_notNowToLegalConsent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__AUDeveloperSettingsController__notNowToLegalConsent__block_invoke;
  v2[3] = &unk_24DFEE8F8;
  v2[4] = self;
  -[AUDeveloperSettingsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

uint64_t __54__AUDeveloperSettingsController__notNowToLegalConsent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)showLegalConsent:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  OBTextWelcomeController *v9;
  OBTextWelcomeController *legalConsentController;
  OBTextWelcomeController *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_storeStrong((id *)&self->_currentAccessorySpecifier, a3);
  if (!self->_legalConsentController)
  {
    v6 = objc_alloc((Class)getOBTextWelcomeControllerClass());
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LEGAL_CONSENT_TITLE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (OBTextWelcomeController *)objc_msgSend(v6, "initWithTitle:detailText:symbolName:", v8, 0, 0);
    legalConsentController = self->_legalConsentController;
    self->_legalConsentController = v9;

    v11 = self->_legalConsentController;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LEGAL_CONSENT_TEXT"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTextWelcomeController addSectionWithHeader:content:](v11, "addSectionWithHeader:content:", 0, v13);

    v14 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithTitle:style:target:action:", v16, 2, self, sel__agreeToLegalConsent);

    v18 = objc_alloc(MEMORY[0x24BDF6860]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithTitle:style:target:action:", v20, 2, self, sel__notNowToLegalConsent);

    -[OBTextWelcomeController navigationItem](self->_legalConsentController, "navigationItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setRightBarButtonItem:", v17);

    -[OBTextWelcomeController navigationItem](self->_legalConsentController, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLeftBarButtonItem:", v21);

  }
  v24 = (void *)objc_opt_new();
  v26[0] = self->_legalConsentController;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setViewControllers:", v25);

  objc_msgSend(v24, "setModalPresentationStyle:", 2);
  -[AUDeveloperSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);

}

- (void)showParticipateInSeedOffAlert:(id)a3
{
  id v3;
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
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[4];
  id v32;

  v3 = a3;
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoriesDictionary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKeyedSubscript:", v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("name"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_AIRPODS_TESTING_TEXT"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v8, v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_AIRPODS_TESTING_TITLE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v11, v24, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TURN_OFF"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __63__AUDeveloperSettingsController_showParticipateInSeedOffAlert___block_invoke;
  v31[3] = &unk_24DFEF718;
  v17 = v3;
  v32 = v17;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v18);

  v19 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v16;
  v29[1] = 3221225472;
  v29[2] = __63__AUDeveloperSettingsController_showParticipateInSeedOffAlert___block_invoke_2;
  v29[3] = &unk_24DFEF740;
  v29[4] = self;
  v30 = v17;
  v22 = v17;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v23);

  -[AUDeveloperSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
}

void __63__AUDeveloperSettingsController_showParticipateInSeedOffAlert___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateAccessory:locationType:", v2, 2);

}

uint64_t __63__AUDeveloperSettingsController_showParticipateInSeedOffAlert___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 40));
}

- (void)_agreePrivacyConsent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__AUDeveloperSettingsController__agreePrivacyConsent__block_invoke;
  v2[3] = &unk_24DFEE8F8;
  v2[4] = self;
  -[AUDeveloperSettingsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

uint64_t __53__AUDeveloperSettingsController__agreePrivacyConsent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setlogCollection:specifier:", MEMORY[0x24BDBD1C8], *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1424));
}

- (void)_notNowToPrivacyConsent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __56__AUDeveloperSettingsController__notNowToPrivacyConsent__block_invoke;
  v2[3] = &unk_24DFEE8F8;
  v2[4] = self;
  -[AUDeveloperSettingsController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v2);
}

uint64_t __56__AUDeveloperSettingsController__notNowToPrivacyConsent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

- (void)setlogCollection:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  CBUserController *loggingController;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_initWeak(&location, self);
  loggingController = self->_loggingController;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __60__AUDeveloperSettingsController_setlogCollection_specifier___block_invoke;
  v11[3] = &unk_24DFEF790;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  -[CBUserController setAppleAudioAccessoryLimitedLogging:completion:](loggingController, "setAppleAudioAccessoryLimitedLogging:completion:", v8, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __60__AUDeveloperSettingsController_setlogCollection_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__AUDeveloperSettingsController_setlogCollection_specifier___block_invoke_2;
  block[3] = &unk_24DFEF768;
  v6 = v3;
  v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __60__AUDeveloperSettingsController_setlogCollection_specifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v4 = 136315394;
    v5 = "-[AUDeveloperSettingsController setlogCollection:specifier:]_block_invoke_2";
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_21BF1C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: inError=%@", (uint8_t *)&v4, 0x16u);
  }
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 40));

  }
}

- (void)handleLogCollectionToggle:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  OBTextWelcomeController *v12;
  OBTextWelcomeController *privacyConsentController;
  OBTextWelcomeController *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "BOOLValue");
  objc_storeStrong((id *)&self->_currentAccessorySpecifier, a4);
  if (v8)
  {
    if (!self->_privacyConsentController)
    {
      v9 = objc_alloc((Class)getOBTextWelcomeControllerClass());
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PRIVACY_CONSENT_TITLE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (OBTextWelcomeController *)objc_msgSend(v9, "initWithTitle:detailText:symbolName:", v11, 0, 0);
      privacyConsentController = self->_privacyConsentController;
      self->_privacyConsentController = v12;

      v14 = self->_privacyConsentController;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PRIVACY_CONSENT_TEXT"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[OBTextWelcomeController addSectionWithHeader:content:](v14, "addSectionWithHeader:content:", 0, v16);

      v17 = objc_alloc(MEMORY[0x24BDF6860]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v17, "initWithTitle:style:target:action:", v19, 2, self, sel__agreePrivacyConsent);

      v21 = objc_alloc(MEMORY[0x24BDF6860]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("NOT_NOW"), &stru_24DFF2410, CFSTR("AUDeveloperSettings"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithTitle:style:target:action:", v23, 2, self, sel__notNowToPrivacyConsent);

      -[OBTextWelcomeController navigationItem](self->_privacyConsentController, "navigationItem");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setRightBarButtonItem:", v20);

      -[OBTextWelcomeController navigationItem](self->_privacyConsentController, "navigationItem");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setLeftBarButtonItem:", v24);

    }
    v27 = (void *)objc_opt_new();
    v29[0] = self->_privacyConsentController;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setViewControllers:", v28);

    objc_msgSend(v27, "setModalPresentationStyle:", 2);
    -[AUDeveloperSettingsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, 0);

  }
  else
  {
    -[AUDeveloperSettingsController setlogCollection:specifier:](self, "setlogCollection:specifier:", v6, v7);
  }

}

- (id)islogCollectionEnabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CBUserController *loggingController;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, char, void *);
  void *v12;
  AUDeveloperSettingsController *v13;
  id v14;

  v4 = a3;
  v5 = v4;
  if (self->_btQueried)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isLoggingEnabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    loggingController = self->_loggingController;
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __56__AUDeveloperSettingsController_islogCollectionEnabled___block_invoke;
    v12 = &unk_24DFEF7E0;
    v13 = self;
    v14 = v4;
    -[CBUserController appleAudioAccessoryLimitedLoggingWithCompletion:](loggingController, "appleAudioAccessoryLimitedLoggingWithCompletion:", &v9);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isLoggingEnabled, v9, v10, v11, v12, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

void __56__AUDeveloperSettingsController_islogCollectionEnabled___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  char v11;

  v5 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__AUDeveloperSettingsController_islogCollectionEnabled___block_invoke_2;
  v8[3] = &unk_24DFEF7B8;
  v11 = a2;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

uint64_t __56__AUDeveloperSettingsController_islogCollectionEnabled___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  uint64_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1376);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 136315650;
    v7 = "-[AUDeveloperSettingsController islogCollectionEnabled:]_block_invoke_2";
    v8 = 1024;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_21BF1C000, v2, OS_LOG_TYPE_DEFAULT, "%s: inEnabled=%d, error=%@", (uint8_t *)&v6, 0x1Cu);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1433) = *(_BYTE *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1432) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", *(_QWORD *)(a1 + 48));
}

- (id)getOverrideLocation:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  getInfoForAccessory(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetLocation"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && AUDeveloperSettingsURLStringToType(v5) == 6)
  {
    v7 = CFSTR("Customer Staging");

    v6 = v7;
  }

  return v6;
}

- (void)removedSpecifier:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  +[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeAccessoryWithSerialNumber:", v4);
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  uint64_t v5;
  void *v6;
  int64_t v7;

  v5 = -[AUDeveloperSettingsController indexForIndexPath:](self, "indexForIndexPath:", a4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToSpecifier:", self->_logCollectionSpecifier) ^ 1;

  return v7;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  AUDeveloperSettingsController *v4;
  uint64_t v5;
  void *v6;

  v4 = self;
  v5 = -[AUDeveloperSettingsController indexForIndexPath:](self, "indexForIndexPath:", a4);
  objc_msgSend(*(id *)((char *)&v4->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "isEqualToSpecifier:", v4->_logCollectionSpecifier) ^ 1;

  return (char)v4;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v6;
  id v7;

  v6 = -[AUDeveloperSettingsController indexForIndexPath:](self, "indexForIndexPath:", a5, a4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToSpecifier:", self->_logCollectionSpecifier) & 1) == 0)
  {
    -[AUDeveloperSettingsController removedSpecifier:](self, "removedSpecifier:", v7);
    -[AUDeveloperSettingsController removeSpecifier:](self, "removeSpecifier:", v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAccessorySpecifier, 0);
  objc_storeStrong((id *)&self->_privacyConsentController, 0);
  objc_storeStrong((id *)&self->_legalConsentController, 0);
  objc_storeStrong((id *)&self->_loggingController, 0);
  objc_storeStrong((id *)&self->_customerOverrideCollectionSpecifier, 0);
  objc_storeStrong((id *)&self->_logCollectionSpecifier, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
