@implementation CKCloudSettingsViewController

- (id)_headerGroupSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CKCloudSettingsViewController *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("HEADER_GROUP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v3);

  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MESSAGES_DATACLASS_TITLE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, -1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setProperty:forKey:", NSClassFromString(CFSTR("AAUIDataclassSpecifierCell")), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("HEADING_TITLE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v10, *MEMORY[0x24BE75D50]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SECURELY_STORE_YOUR_MESSAGES_IN_ICLOUD"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %%@"), v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v28, *MEMORY[0x24BE75D28]);
  -[CKCloudSettingsViewController viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messagesLearnMoreUrlString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setProperty:forKey:", v27, CFSTR("AAUIDataclassAttributedLink"));
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v14, CFSTR("AAUIDataclassAttributedLinkText"));

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
  v16 = objc_alloc(MEMORY[0x24BE51AB0]);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scale");
  v19 = (void *)objc_msgSend(v16, "initWithSize:scale:", 64.0, 64.0, v18);

  objc_msgSend(v15, "prepareImageForDescriptor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", objc_msgSend(v20, "CGImage"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x24BE75AC8];
  objc_msgSend(v8, "setProperty:forKey:", v21, *MEMORY[0x24BE75AC8]);
  objc_msgSend(v30, "addObject:", v8);
  +[CKiCloudSettingsUtils iCloudSettingsSyncText](CKiCloudSettingsUtils, "iCloudSettingsSyncText");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACUIDataclassConfigurationViewController specifierForDataclass:](v7, "specifierForDataclass:", *MEMORY[0x24BDB3E48]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setName:", v23);
  v25 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v24, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(v24, "setProperty:forKey:", v25, *MEMORY[0x24BE75868]);
  objc_msgSend(v24, "removePropertyForKey:", v22);
  objc_msgSend(v30, "addObject:", v24);

  return v30;
}

- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CKCloudSettingsViewController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "micAccountsMatch");

  v10 = IMOSLoggingEnabled();
  if ((v9 & 1) != 0)
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v6;
        _os_log_impl(&dword_24190B000, v11, OS_LOG_TYPE_INFO, "Toggled MiC switch newState={%@}, will call super.", buf, 0xCu);
      }

    }
    v13.receiver = self;
    v13.super_class = (Class)CKCloudSettingsViewController;
    -[ACUIDataclassConfigurationViewController dataclassSwitchStateDidChange:withSpecifier:](&v13, sel_dataclassSwitchStateDidChange_withSpecifier_, v6, v7);
  }
  else
  {
    if (v10)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24190B000, v12, OS_LOG_TYPE_INFO, "Tried to toggle MiC but there is an account mismatch. Showing alert.", buf, 2u);
      }

    }
    -[CKCloudSettingsViewController _presentAlertForAccountMismatchFromSpecifier:](self, "_presentAlertForAccountMismatchFromSpecifier:", v7);
  }

}

- (void)_presentAlertForAccountMismatchFromSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CKCloudSettingsViewController *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location[2];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_MISMATCH_ALERT_TITLE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ICLOUD_ACCOUNT_MISMATCH"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  location[0] = 0;
  v19 = self;
  objc_initWeak(location, self);
  v7 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHOW_IMESSAGE_SETTINGS"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __96__CKCloudSettingsViewController_HeaderSpecifiers___presentAlertForAccountMismatchFromSpecifier___block_invoke;
  v25[3] = &unk_2511BD1B0;
  objc_copyWeak(&v27, location);
  v11 = v4;
  v26 = v11;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __96__CKCloudSettingsViewController_HeaderSpecifiers___presentAlertForAccountMismatchFromSpecifier___block_invoke_2;
  v22[3] = &unk_2511BD1B0;
  objc_copyWeak(&v24, location);
  v16 = v11;
  v23 = v16;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v21, v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v12);
  objc_msgSend(v18, "addAction:", v17);
  objc_msgSend(v18, "setPreferredAction:", v12);
  -[CKCloudSettingsViewController presentViewController:animated:completion:](v19, "presentViewController:animated:completion:", v18, 1, 0);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);
  objc_destroyWeak(location);

}

void __96__CKCloudSettingsViewController_HeaderSpecifiers___presentAlertForAccountMismatchFromSpecifier___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "_navigateToMessagesSettings");

}

void __96__CKCloudSettingsViewController_HeaderSpecifiers___presentAlertForAccountMismatchFromSpecifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);

}

- (void)_navigateToMessagesSettings
{
  -[CKCloudSettingsViewController navigateToSettingsWithURLString:forSpecifier:](self, "navigateToSettingsWithURLString:forSpecifier:", CFSTR("prefs:root=MESSAGES"), 0);
}

- (CKCloudSettingsViewController)init
{
  CKCloudSettingsViewController *v2;
  CKCloudSettingsViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKCloudSettingsViewController;
  v2 = -[ACUIDataclassConfigurationViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKCloudSettingsViewController _internalInit](v2, "_internalInit");
  return v3;
}

- (void)_internalInit
{
  CKiCloudSettingsViewModel *v3;
  CKiCloudSettingsViewModel *viewModel;

  v3 = objc_alloc_init(CKiCloudSettingsViewModel);
  -[CKiCloudSettingsViewModel setDelegate:](v3, "setDelegate:", self);
  viewModel = self->_viewModel;
  self->_viewModel = v3;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CKCloudSettingsViewController _stopObservingAccountStoreChanges](self, "_stopObservingAccountStoreChanges");
  -[CKCloudSettingsViewController viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopObservers");

  v4.receiver = self;
  v4.super_class = (Class)CKCloudSettingsViewController;
  -[ACUIDataclassConfigurationViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKCloudSettingsViewController;
  -[ACUIDataclassConfigurationViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSettingsViewController setTitle:](self, "setTitle:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKCloudSettingsViewController;
  -[ACUIDataclassConfigurationViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MESSAGES"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSettingsViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[CKCloudSettingsViewController _headerGroupSpecifiers](self, "_headerGroupSpecifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    -[CKCloudSettingsViewController _syncDetailsSpecifiers](self, "_syncDetailsSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    if (-[CKCloudSettingsViewController isCloudSyncingEnabled](self, "isCloudSyncingEnabled")
      && -[CKiCloudSettingsViewModel isSyncAvailable](self->_viewModel, "isSyncAvailable"))
    {
      -[CKCloudSettingsViewController _syncSpecifiers](self, "_syncSpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v8);

    }
    v9 = (objc_class *)objc_msgSend(v5, "copy");
    v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v9;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_syncSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SYNC_ACTION_GROUP_IDENTIFIER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE75590];
  -[CKCloudSettingsViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncButtonText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 13, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKCloudSettingsViewController viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isSyncButtonEnabled");

  objc_msgSend(v7, "setIdentifier:", CFSTR("SYNC_NOW_BUTTON"));
  objc_msgSend(v7, "setButtonAction:", sel_syncButtonPressed_);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v10, *MEMORY[0x24BE75A18]);

  v13[0] = v3;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)syncButtonPressed:(id)a3
{
  id v3;

  -[CKCloudSettingsViewController viewModel](self, "viewModel", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncButtonPressed");

}

- (void)navigateToSettingsWithURLString:(id)a3 forSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_24190B000, v7, OS_LOG_TYPE_INFO, "Detected tap on footer link text.", (uint8_t *)&v12, 2u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_24190B000, v8, OS_LOG_TYPE_INFO, "Attempting to present a screen for specifier={%@}", (uint8_t *)&v12, 0xCu);
    }

  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openSensitiveURL:withOptions:", v10, 0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = 0;
      _os_log_impl(&dword_24190B000, v11, OS_LOG_TYPE_INFO, "Programming error - unable to load urlString=(%@)", (uint8_t *)&v12, 0xCu);
    }

  }
}

- (id)account
{
  void *v2;
  void *v3;
  void *v4;

  -[CKCloudSettingsViewController accountManager](self, "accountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (AIDAAccountManager)accountManager
{
  AIDAAccountManager *accountManager;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  accountManager = self->_accountManager;
  if (!accountManager)
  {
    -[CKCloudSettingsViewController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[CKCloudSettingsViewController specifier](self, "specifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("icloudAccountManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKCloudSettingsViewController setAccountManager:](self, "setAccountManager:", v6);
      -[CKCloudSettingsViewController _startObservingAccountStoreChanges](self, "_startObservingAccountStoreChanges");

    }
    accountManager = self->_accountManager;
    if (!accountManager)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__CKCloudSettingsViewController_accountManager__block_invoke;
      block[3] = &unk_2511BD1D8;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      accountManager = self->_accountManager;
    }
  }
  return accountManager;
}

void __47__CKCloudSettingsViewController_accountManager__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void)_startObservingAccountStoreChanges
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  -[CKCloudSettingsViewController accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__CKCloudSettingsViewController__startObservingAccountStoreChanges__block_invoke;
  v4[3] = &unk_2511BD200;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addAccountChangeObserver:handler:", self, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__CKCloudSettingsViewController__startObservingAccountStoreChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = *MEMORY[0x24BE06080];
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enabledDataclasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(v9, "enabledDataclasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v11 != v13)
      objc_msgSend(WeakRetained, "reloadSpecifiers");

  }
}

- (void)_stopObservingAccountStoreChanges
{
  AIDAAccountManager *accountManager;

  accountManager = self->_accountManager;
  if (accountManager)
    -[AIDAAccountManager removeAccountChangeObserver:](accountManager, "removeAccountChangeObserver:", self);
}

- (BOOL)isCloudSyncingEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[CKCloudSettingsViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[CKCloudSettingsViewController account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabledForDataclass:", *MEMORY[0x24BDB3E48]);

  return v5;
}

- (CKiCloudSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (ICQAppCloudStorage)appCloudStorage
{
  return self->_appCloudStorage;
}

- (void)setAppCloudStorage:(id)a3
{
  objc_storeStrong((id *)&self->_appCloudStorage, a3);
}

- (BOOL)isStorageUsedRequestInProgress
{
  return self->_storageUsedRequestInProgress;
}

- (void)setStorageUsedRequestInProgress:(BOOL)a3
{
  self->_storageUsedRequestInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appCloudStorage, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

- (id)_syncDetailsSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
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
  void *v30;
  NSRange v31;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("SYNC_DETAILS_GROUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCloudSettingsViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncStatusFooterText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKCloudSettingsViewController viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncStatusFooterSubstringForHyperlink");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = v6;
  if (v8)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v10, *MEMORY[0x24BE75A30]);

    -[CKCloudSettingsViewController viewModel](self, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "syncStatusFooterSubstringForHyperlink");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v31.location = objc_msgSend(v6, "rangeOfString:", v12);
    NSStringFromRange(v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v13, *MEMORY[0x24BE75A40]);

    objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x24BE75A58]);
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v14, *MEMORY[0x24BE75A50]);

    NSStringFromSelector(sel__presentScreenForSpecifier_);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v15, *MEMORY[0x24BE75A38]);

  }
  else
  {
    objc_msgSend(v4, "setProperty:forKey:", v6, *MEMORY[0x24BE75A68]);
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("MANAGE_STORAGE_TITLE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSettingsUtils specifierWithTitle:target:selector:](CKiCloudSettingsUtils, "specifierWithTitle:target:selector:", v17, self, sel__fetchStorageUsed_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("KEEP_MESSAGES_TITLE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSettingsUtils specifierWithTitle:target:selector:](CKiCloudSettingsUtils, "specifierWithTitle:target:selector:", v20, self, sel__fetchKeepMessagesPreference_);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("IN_ICLOUD_TITLE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSettingsUtils specifierWithTitle:target:selector:](CKiCloudSettingsUtils, "specifierWithTitle:target:selector:", v23, self, sel__messagesInCloudCount_);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("STATUS_TITLE"), &stru_2511BE380, CFSTR("iCloudMessagesSettings"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKiCloudSettingsUtils specifierWithTitle:target:selector:](CKiCloudSettingsUtils, "specifierWithTitle:target:selector:", v26, self, sel__fetchSyncStatusText_);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setCellType:", 2);
  objc_msgSend(v18, "setDetailControllerClass:", NSClassFromString(CFSTR("CKCloudMessagesDetailController")));
  objc_msgSend(v21, "setCellType:", 2);
  objc_msgSend(v21, "setDetailControllerClass:", NSClassFromString(CFSTR("CKKeepMessagesSelectionList")));
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(v3, "addObject:", v18);
  if (-[CKCloudSettingsViewController isCloudSyncingEnabled](self, "isCloudSyncingEnabled"))
  {
    objc_msgSend(v3, "addObject:", v21);
    objc_msgSend(v3, "addObject:", v24);
    objc_msgSend(v3, "addObject:", v27);
  }
  v28 = (void *)objc_msgSend(v3, "copy");

  return v28;
}

- (void)_presentScreenForSpecifier:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  -[CKCloudSettingsViewController viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "syncState");

  if (v6 <= 9)
  {
    if (((1 << v6) & 0x78) != 0)
    {
      -[CKCloudSettingsViewController viewModel](self, "viewModel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "footerHyperlinkUrl");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKCloudSettingsViewController navigateToSettingsWithURLString:forSpecifier:](self, "navigateToSettingsWithURLString:forSpecifier:", v9, v4);

    }
    else
    {
      if (((1 << v6) & 7) == 0)
      {
        -[CKCloudSettingsViewController viewModel](self, "viewModel");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject showICloudUpsellIfAvailable](v7, "showICloudUpsellIfAvailable");
LABEL_9:

        goto LABEL_10;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_24190B000, v7, OS_LOG_TYPE_INFO, "Attempted to present a screen for a hyperlink for an unsupported sync state.", v10, 2u);
        }
        goto LABEL_9;
      }
    }
  }
LABEL_10:

}

- (id)_fetchStorageUsed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id location;

  v4 = a3;
  -[CKCloudSettingsViewController appCloudStorage](self, "appCloudStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKCloudSettingsViewController appCloudStorage](self, "appCloudStorage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "storageUsed");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "longLongValue");

    NSLocalizedFileSizeDescription();
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!-[CKCloudSettingsViewController isStorageUsedRequestInProgress](self, "isStorageUsedRequestInProgress"))
    {
      -[CKCloudSettingsViewController setStorageUsedRequestInProgress:](self, "setStorageUsedRequestInProgress:", 1);
      v9 = objc_alloc(NSClassFromString(CFSTR("ICQCloudStorageDataController")));
      -[CKCloudSettingsViewController account](self, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithAccount:", v10);

      objc_msgSend(v11, "setShouldIgnoreCache:", 1);
      location = 0;
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appBundleIdentifierForDataclass:", *MEMORY[0x24BDB3E48]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __72__CKCloudSettingsViewController_SyncStateSpecifiers___fetchStorageUsed___block_invoke;
      v15[3] = &unk_2511BD2B0;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v11, "fetchStorageByApp:completion:", v13, v15);
      objc_destroyWeak(&v16);

      objc_destroyWeak(&location);
    }
    v8 = &stru_2511BE380;
  }

  return v8;
}

void __72__CKCloudSettingsViewController_SyncStateSpecifiers___fetchStorageUsed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  _QWORD block[4];
  id v8;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "setStorageUsedRequestInProgress:", 0);

  if (v3)
  {
    v6 = objc_loadWeakRetained(v4);
    objc_msgSend(v6, "setAppCloudStorage:", v3);

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__CKCloudSettingsViewController_SyncStateSpecifiers___fetchStorageUsed___block_invoke_2;
    block[3] = &unk_2511BD288;
    objc_copyWeak(&v8, v4);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v8);
  }

}

void __72__CKCloudSettingsViewController_SyncStateSpecifiers___fetchStorageUsed___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "specifiers");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v6, "count");
  v4 = objc_loadWeakRetained(v1);
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "reloadSpecifierID:animated:", CFSTR("SYNC_DETAILS_GROUP"), 1);
  else
    objc_msgSend(v4, "reloadSpecifiers");

}

- (id)_fetchKeepMessagesPreference:(id)a3
{
  void *v3;
  void *v4;

  -[CKCloudSettingsViewController viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keepMessagesPreference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_messagesInCloudCount:(id)a3
{
  void *v3;
  void *v4;

  -[CKCloudSettingsViewController viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messagesInCloudCount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_fetchSyncStatusText:(id)a3
{
  void *v3;
  void *v4;

  -[CKCloudSettingsViewController viewModel](self, "viewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncStatus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
