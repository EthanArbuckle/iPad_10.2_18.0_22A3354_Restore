@implementation ACUIAddAccountViewController

- (ACUIAddAccountViewController)init
{
  uint64_t v2;
  uint64_t v3;
  ACAccountStore *v4;
  ACAccountStore *accountStore;
  ACUIAddAccountViewController *v7;
  ACUIAddAccountViewController *v8;
  objc_super v9;
  SEL v10;
  ACUIAddAccountViewController *v11;

  v10 = a2;
  v11 = 0;
  v9.receiver = self;
  v9.super_class = (Class)ACUIAddAccountViewController;
  v8 = -[ACUIAddAccountViewController init](&v9, sel_init);
  v11 = v8;
  objc_storeStrong((id *)&v11, v8);
  if (v8)
  {
    v2 = SBSSpringBoardServerPort();
    MEMORY[0x1D8277144](v2, &v11->_originalCellFlag, &v11->_originalWifiFlag);
    v3 = SBSSpringBoardServerPort();
    MEMORY[0x1D8277168](v3, 1);
    v4 = (ACAccountStore *)objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    accountStore = v11->_accountStore;
    v11->_accountStore = v4;

  }
  v7 = v11;
  objc_storeStrong((id *)&v11, 0);
  return v7;
}

- (ACUIAccountViewProvidersManager)viewProvidersManager
{
  return +[ACUIAccountViewProvidersManager sharedInstance](ACUIAccountViewProvidersManager, "sharedInstance", a2, self);
}

- (ACUIAddAccountDataSource)addAccountDataSource
{
  id v3;
  id v4;
  char v5;
  ACUIDefaultAddAccountDataSource *v6;

  if (!self->_addAccountDataSource)
  {
    v3 = (id)-[ACUIAddAccountViewController specifier](self, "specifier");
    v4 = (id)objc_msgSend(v3, "propertyForKey:", CFSTR("ACUIAddAccountDataSourceKey"));
    v5 = 0;
    if (v4)
    {
      objc_storeStrong((id *)&self->_addAccountDataSource, v4);
    }
    else
    {
      v6 = objc_alloc_init(ACUIDefaultAddAccountDataSource);
      v5 = 1;
      objc_storeStrong((id *)&self->_addAccountDataSource, v6);
    }
    if ((v5 & 1) != 0)

  }
  return self->_addAccountDataSource;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v3;
  SEL v4;
  ACUIAddAccountViewController *v5;

  v5 = self;
  v4 = a2;
  v2 = SBSSpringBoardServerPort();
  MEMORY[0x1D8277168](v2, v5->_originalCellFlag, v5->_originalWifiFlag);
  v3.receiver = v5;
  v3.super_class = (Class)ACUIAddAccountViewController;
  -[ACUIAddAccountViewController dealloc](&v3, sel_dealloc);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  objc_super v6;
  BOOL v7;
  SEL v8;
  ACUIAddAccountViewController *v9;

  v9 = self;
  v8 = a2;
  v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ACUIAddAccountViewController;
  -[ACUIAddAccountViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    v5 = (id)-[ACUIAddAccountViewController navigationItem](v9, "navigationItem");
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ADD_ACCOUNT_TITLE"), &stru_1E9A15E98, CFSTR("Localizable"));
    objc_msgSend(v5, "setTitle:");

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  ACUIAddAccountViewController *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  objc_super v32;
  BOOL v33;
  SEL v34;
  ACUIAddAccountViewController *v35;
  _QWORD v36[5];

  v36[4] = *MEMORY[0x1E0C80C00];
  v35 = self;
  v34 = a2;
  v33 = a3;
  v32.receiver = self;
  v32.super_class = (Class)ACUIAddAccountViewController;
  -[ACUIAddAccountViewController viewDidAppear:](&v32, sel_viewDidAppear_, a3);
  PreferencesExtendedLibrary();
  v31 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.InternetAccounts/ADD_ACCOUNT"));
  v3 = objc_alloc(MEMORY[0x1E0CB3B78]);
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "bundleURL");
  v30 = objc_msgSend(v3, "initWithKey:table:locale:bundleURL:");

  v7 = objc_alloc(MEMORY[0x1E0CB3B78]);
  v10 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(v9, "bundleURL");
  v29 = objc_msgSend(v7, "initWithKey:table:locale:bundleURL:", CFSTR("APPS_NAVIGATION_PATH"), 0, v10);

  v11 = objc_alloc(MEMORY[0x1E0CB3B78]);
  v14 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (id)objc_msgSend(v13, "bundleURL");
  v28 = objc_msgSend(v11, "initWithKey:table:locale:bundleURL:", CFSTR("CONTACTS_APP_PATH"), 0, v14);

  v15 = objc_alloc(MEMORY[0x1E0CB3B78]);
  v18 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v17 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (id)objc_msgSend(v17, "bundleURL");
  v27 = objc_msgSend(v15, "initWithKey:table:locale:bundleURL:", CFSTR("CONTACTS_ACCOUNTS_PATH"), 0, v18);

  v19 = objc_alloc(MEMORY[0x1E0CB3B78]);
  v22 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v21 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = (id)objc_msgSend(v21, "bundleURL");
  v26 = objc_msgSend(v19, "initWithKey:table:locale:bundleURL:", CFSTR("ADD_ACCOUNT"), 0, v22);

  v24 = v35;
  v23 = (id)v30;
  v36[0] = v29;
  v36[1] = v28;
  v36[2] = v27;
  v36[3] = v26;
  v25 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
  -[ACUIAddAccountViewController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](v24, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.accounts.generic-account"), v23);

  objc_storeStrong((id *)&v26, 0);
  objc_storeStrong((id *)&v27, 0);
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong((id *)&v30, 0);
  objc_storeStrong(&v31, 0);
}

- (void)setSpecifier:(id)a3
{
  id v3;
  id obj;
  objc_super v5;
  id location[2];
  ACUIAddAccountViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)ACUIAddAccountViewController;
  -[ACUIAddAccountViewController setSpecifier:](&v5, sel_setSpecifier_, location[0]);
  v3 = (id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x1E0D806F0]);
  -[ACUIAddAccountViewController setFilteredDataclass:](v7, "setFilteredDataclass:");

  obj = (id)objc_msgSend(location[0], "propertyForKey:", CFSTR("ACUIAddAccountDataSourceKey"));
  if (obj)
  {
    objc_storeStrong((id *)&v7->_addAccountDataSource, obj);
    -[ACUIAddAccountViewController reloadSpecifiers](v7, "reloadSpecifiers");
  }
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldAddSpecifierForAccountTypeID:(id)a3
{
  char v4;
  NSString *v5;
  id v6;
  ACUIAddAccountDataSource *v7;
  char v8;
  BOOL v9;
  ACAccountType *v10;
  char v11;
  NSString *v12;
  char v13;
  id location[2];
  ACUIAddAccountViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = -[ACUIAddAccountViewController addAccountDataSource](v15, "addAccountDataSource");
  v8 = -[ACUIAddAccountDataSource shouldAddSpecifierForAccountTypeID:](v7, "shouldAddSpecifierForAccountTypeID:", location[0]);

  v13 = v8 & 1;
  v11 = 0;
  v9 = 0;
  if ((v8 & 1) != 0)
  {
    v12 = -[ACUIAddAccountViewController filteredDataclass](v15, "filteredDataclass");
    v11 = 1;
    v9 = v12 != 0;
  }
  if ((v11 & 1) != 0)

  if (v9)
  {
    v10 = -[ACAccountStore accountTypeWithAccountTypeIdentifier:](v15->_accountStore, "accountTypeWithAccountTypeIdentifier:", location[0]);
    v6 = (id)-[ACAccountType supportedDataclasses](v10, "supportedDataclasses");
    v5 = -[ACUIAddAccountViewController filteredDataclass](v15, "filteredDataclass");
    v13 = objc_msgSend(v6, "containsObject:") & 1;

    objc_storeStrong((id *)&v10, 0);
  }
  v4 = v13;
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (BOOL)shouldAddSpecifierForOtherAccountTypes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  int v9;
  _QWORD __b[8];
  uint64_t v11;
  id location[2];
  ACUIAddAccountViewController *v13;
  char v14;
  _BYTE v15[128];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  v13 = self;
  location[1] = (id)a2;
  v16[0] = *MEMORY[0x1E0C8F0D0];
  v16[1] = *MEMORY[0x1E0C8F060];
  v16[2] = *MEMORY[0x1E0C8F100];
  v16[3] = *MEMORY[0x1E0C8F058];
  v16[4] = *MEMORY[0x1E0C8F140];
  location[0] = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 5);
  memset(__b, 0, sizeof(__b));
  obj = location[0];
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
  if (v8)
  {
    v4 = *(_QWORD *)__b[2];
    v5 = 0;
    v6 = v8;
    while (1)
    {
      v3 = v5;
      if (*(_QWORD *)__b[2] != v4)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(__b[1] + 8 * v5);
      if (-[ACUIAddAccountViewController shouldAddSpecifierForAccountTypeID:](v13, "shouldAddSpecifierForAccountTypeID:", v11))
      {
        break;
      }
      ++v5;
      if (v3 + 1 >= v6)
      {
        v5 = 0;
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v15, 16);
        if (!v6)
          goto LABEL_9;
      }
    }
    v14 = 1;
    v9 = 1;
  }
  else
  {
LABEL_9:
    v9 = 0;
  }

  if (!v9)
    v14 = 0;
  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (id)specifiers
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location;
  id v18[2];
  ACUIAddAccountViewController *v19;

  v19 = self;
  v18[1] = (id)a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]))
  {
    v16 = (id)-[ACUIAddAccountViewController table](v19, "table");
    objc_msgSend(v16, "_setMarginWidth:", 50.0);

    v18[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "shouldMakeUIForDefaultPNG") & 1) == 0)
    {
      v15 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      objc_msgSend(v18[0], "addObject:");

      if (-[ACUIAddAccountViewController shouldAddSpecifierForAccountTypeID:](v19, "shouldAddSpecifierForAccountTypeID:", *MEMORY[0x1E0C8F030]))
      {
        v14 = -[ACUIAddAccountViewController _specifierForiCloudAccount](v19, "_specifierForiCloudAccount");
        objc_msgSend(v18[0], "addObject:");

      }
      if (-[ACUIAddAccountViewController shouldAddSpecifierForAccountTypeID:](v19, "shouldAddSpecifierForAccountTypeID:", *MEMORY[0x1E0C8F080]))
      {
        v13 = -[ACUIAddAccountViewController _specifierForExchangeAccount](v19, "_specifierForExchangeAccount");
        objc_msgSend(v18[0], "addObject:");

      }
      if (-[ACUIAddAccountViewController shouldAddSpecifierForAccountTypeID:](v19, "shouldAddSpecifierForAccountTypeID:", *MEMORY[0x1E0C8F0D0]))
      {
        location = -[ACUIAddAccountViewController _specifiersForRegionalMailAccounts](v19, "_specifiersForRegionalMailAccounts");
        if (objc_msgSend(location, "count"))
          objc_msgSend(v18[0], "addObjectsFromArray:", location);
        objc_storeStrong(&location, 0);
      }
      if (-[ACUIAddAccountViewController shouldAddSpecifierForAccountTypeID:](v19, "shouldAddSpecifierForAccountTypeID:", *MEMORY[0x1E0C8F0A8]))
      {
        v11 = v18[0];
        v12 = -[ACUIAddAccountViewController _specifierForGmailAccount](v19, "_specifierForGmailAccount");
        objc_msgSend(v11, "addObject:");

      }
      if (-[ACUIAddAccountViewController shouldAddSpecifierForAccountTypeID:](v19, "shouldAddSpecifierForAccountTypeID:", *MEMORY[0x1E0C8F160]))
      {
        v9 = v18[0];
        v10 = -[ACUIAddAccountViewController _specifierForYahooAccount](v19, "_specifierForYahooAccount");
        objc_msgSend(v9, "addObject:");

      }
      if (-[ACUIAddAccountViewController shouldAddSpecifierForAccountTypeID:](v19, "shouldAddSpecifierForAccountTypeID:", *MEMORY[0x1E0C8F028]))
      {
        v7 = v18[0];
        v8 = -[ACUIAddAccountViewController _specifierForAOLAccount](v19, "_specifierForAOLAccount");
        objc_msgSend(v7, "addObject:");

      }
      if (-[ACUIAddAccountViewController shouldAddSpecifierForAccountTypeID:](v19, "shouldAddSpecifierForAccountTypeID:", *MEMORY[0x1E0C8F0B8]))
      {
        v5 = v18[0];
        v6 = -[ACUIAddAccountViewController _specifierForOutlookAccount](v19, "_specifierForOutlookAccount");
        objc_msgSend(v5, "addObject:");

      }
      if (-[ACUIAddAccountViewController shouldAddSpecifierForOtherAccountTypes](v19, "shouldAddSpecifierForOtherAccountTypes"))
      {
        v3 = v18[0];
        v4 = -[ACUIAddAccountViewController specifierForOtherAccounts](v19, "specifierForOtherAccounts");
        objc_msgSend(v3, "addObject:");

      }
    }
    objc_storeStrong((id *)((char *)&v19->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), v18[0]);
    objc_storeStrong(v18, 0);
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&v19->super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E0D80590]));
}

- (id)_specifierForiCloudAccount
{
  id v2;
  id v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  ACUIAccountViewProvidersManager *v10;
  char v11;
  char v12;
  id v13;
  id location;
  id v15[2];
  ACUIAddAccountViewController *v16;

  v16 = self;
  v15[1] = (id)a2;
  v15[0] = 0;
  v10 = -[ACUIAddAccountViewController viewProvidersManager](self, "viewProvidersManager");
  location = -[ACUIAccountViewProvidersManager configurationInfoForCreatingAccountWithType:](v10, "configurationInfoForCreatingAccountWithType:", *MEMORY[0x1E0C8F030]);

  v12 = 0;
  v11 = 0;
  if (location)
  {
    v13 = (id)objc_msgSend(location, "objectForKeyedSubscript:", CFSTR("ACUISpecifierAccountIdentifier"));
    v12 = 1;
    v11 = objc_msgSend(v13, "isEqualToString:", CFSTR("primary"));
  }
  if ((v12 & 1) != 0)

  if ((v11 & 1) != 0)
    v2 = -[ACUIAddAccountViewController _specifierForPrimaryiCloudAccount](v16, "_specifierForPrimaryiCloudAccount");
  else
    v2 = -[ACUIAddAccountViewController giantSpecifierWithName:forAccountTypeID:](v16, "giantSpecifierWithName:forAccountTypeID:", CFSTR("iCloud"), *MEMORY[0x1E0C8F030]);
  v3 = v15[0];
  v15[0] = v2;

  v6 = v15[0];
  v5 = (void *)MEMORY[0x1E0CEA638];
  v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("iCloud"));
  objc_msgSend(v6, "setProperty:forKey:");

  objc_msgSend(v15[0], "accessibilitySetIdentification:", CFSTR("appleid"));
  v9 = v15[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v15, 0);
  return v9;
}

- (id)_specifierForPrimaryiCloudAccount
{
  id v3;
  id v4;
  ACUIAccountViewProvidersManager *v5;
  id location;
  id v7[2];
  ACUIAddAccountViewController *v8;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("iCloud"), self, 0, 0, 0, 10, 0);
  objc_msgSend(v7[0], "setButtonAction:", sel__presentPrimaryAppleIDSignInController_);
  v5 = -[ACUIAddAccountViewController viewProvidersManager](v8, "viewProvidersManager");
  v4 = -[ACUIAccountViewProvidersManager configurationInfoForCreatingAccountWithType:](v5, "configurationInfoForCreatingAccountWithType:", *MEMORY[0x1E0C8F030]);
  location = (id)objc_msgSend(v4, "mutableCopy");

  if (objc_msgSend(location, "count"))
    objc_msgSend(v7[0], "setUserInfo:", location);
  v3 = v7[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v7, 0);
  return v3;
}

- (void)_presentPrimaryAppleIDSignInController:(id)a3
{
  uint64_t v3;
  ACUIAccountViewProvidersManager *v4;
  ACUIAddAccountDataSource *v5;
  _QWORD *v6;
  ACUIAccountViewProvidersManager *v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  id v11;
  Class v12;
  id location[2];
  ACUIAddAccountViewController *v14;
  uint64_t v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  v5 = -[ACUIAddAccountViewController addAccountDataSource](v14, "addAccountDataSource");
  v6 = (_QWORD *)MEMORY[0x1E0C8F030];
  v3 = *MEMORY[0x1E0C8F030];
  v4 = -[ACUIAddAccountViewController viewProvidersManager](v14, "viewProvidersManager");
  v12 = (Class)-[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v5, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", v3);

  v11 = objc_alloc_init(v12);
  v7 = -[ACUIAddAccountViewController viewProvidersManager](v14, "viewProvidersManager");
  -[ACUIAccountViewProvidersManager setDelegate:forSignInController:forAccountWithType:](v7, "setDelegate:forSignInController:forAccountWithType:", v14, v11, *v6);

  v15 = 0;
  v8 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v15 = v9;
  v10 = 1;
  if (v9 != 1)
    v10 = v15 == 5;
  if (v10)
  {
    objc_msgSend(v11, "setModalPresentationStyle:", 2);
    objc_msgSend(v11, "setModalTransitionStyle:", 0);
  }
  -[ACUIAddAccountViewController presentViewController:animated:completion:](v14, "presentViewController:animated:completion:", v11, 1);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)signInControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  id v4;
  id location;
  BOOL v6;
  SEL v7;
  ACUIAddAccountViewController *v8;

  v8 = self;
  v7 = a2;
  v6 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  -[ACUIAddAccountViewController _dismissAndBecomeFirstResponder](v8, "_dismissAndBecomeFirstResponder");
  if (v6)
  {
    -[ACUIAddAccountViewController setupViewControllerDidDismiss:](v8, "setupViewControllerDidDismiss:");
    v4 = (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("ACUIAccountSetupDidFinish"), 0);

  }
  objc_storeStrong(&location, 0);
}

- (void)signInControllerDidCancel
{
  -[ACUIAddAccountViewController _dismissAndBecomeFirstResponder](self, "_dismissAndBecomeFirstResponder", a2, self);
}

- (void)_dismissAndBecomeFirstResponder
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v3 = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __63__ACUIAddAccountViewController__dismissAndBecomeFirstResponder__block_invoke;
  v7 = &unk_1E9A155C8;
  v8[0] = self;
  -[ACUIAddAccountViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong(v8, 0);
}

uint64_t __63__ACUIAddAccountViewController__dismissAndBecomeFirstResponder__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isFirstResponder");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
  return result;
}

- (id)_specifierForExchangeAccount
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[ACUIAddAccountViewController giantSpecifierWithName:forAccountTypeID:](self, "giantSpecifierWithName:forAccountTypeID:", CFSTR("Exchange ActiveSync"), *MEMORY[0x1E0C8F080]);
  v4 = v8[0];
  v3 = (void *)MEMORY[0x1E0CEA638];
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("Exchange"));
  objc_msgSend(v4, "setProperty:forKey:");

  objc_msgSend(v8[0], "accessibilitySetIdentification:", CFSTR("mail-exchange"));
  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_specifierForGmailAccount
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  __CFString *v12;
  id v13[2];
  ACUIAddAccountViewController *v14;

  v14 = self;
  v13[1] = (id)a2;
  if ((__UseGoogleMail() & 1) != 0)
    v2 = CFSTR("Google Mail");
  else
    v2 = CFSTR("Gmail");
  v13[0] = v2;
  if ((__UseGoogleMail() & 1) != 0)
    v3 = CFSTR("googlemail.png");
  else
    v3 = CFSTR("Gmail");
  v12 = v3;
  v11 = -[ACUIAddAccountViewController _specifierForCustomControlledAccountWithName:accountTypeID:](v14, "_specifierForCustomControlledAccountWithName:accountTypeID:", v13[0], *MEMORY[0x1E0C8F0A8]);
  v7 = v11;
  v6 = (void *)MEMORY[0x1E0CEA638];
  v5 = v12;
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(v6, "imageNamed:inBundle:", v5);
  objc_msgSend(v7, "setProperty:forKey:");

  objc_msgSend(v11, "accessibilitySetIdentification:", CFSTR("mail-gmail"));
  v10 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(v13, 0);
  return v10;
}

- (id)_specifierForCustomControlledAccountWithName:(id)a3 accountTypeID:(id)a4
{
  id v5;
  id v7;
  ACUIAccountViewProvidersManager *v8;
  ACUIAddAccountDataSource *v9;
  uint64_t v10;
  id v11;
  id v12;
  id location[2];
  ACUIAddAccountViewController *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = -[ACUIAddAccountViewController giantSpecifierWithName:forAccountTypeID:](v14, "giantSpecifierWithName:forAccountTypeID:", location[0], v12);
  v9 = -[ACUIAddAccountViewController addAccountDataSource](v14, "addAccountDataSource");
  v7 = v12;
  v8 = -[ACUIAddAccountViewController viewProvidersManager](v14, "viewProvidersManager");
  v10 = -[ACUIAddAccountDataSource controllerClassForCreatingAccountWithType:withViewProviderManager:](v9, "controllerClassForCreatingAccountWithType:withViewProviderManager:", v7);

  if (v10)
  {
    objc_msgSend(v11, "setDetailControllerClass:", 0);
    objc_msgSend(v11, "setTarget:", v14);
    objc_msgSend(v11, "setButtonAction:", sel__createCustomControlledAccountTapped_);
  }
  v5 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)_addAccountSpecifierWasTapped:(id)a3
{
  id v3;
  ACUIAddAccountViewController *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t (*v22)(uint64_t, char);
  void *v23;
  ACUIAddAccountViewController *v24;
  id v25;
  id v26;
  uint64_t v27;
  int v28;
  int v29;
  void (*v30)(id *, void *, void *);
  void *v31;
  ACUIAddAccountViewController *v32;
  id v33;
  id v34;
  uint64_t v35;
  BOOL v36;
  os_log_type_t v37;
  id v38;
  id v39;
  id location[2];
  ACUIAddAccountViewController *v41;
  _QWORD v42[6];
  _QWORD v43[6];
  uint8_t v44[40];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v39 = (id)objc_msgSend(location[0], "propertyForKey:", CFSTR("ACUIAccountType"));
  v38 = _ACUILogSystem();
  v37 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v38, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v44, (uint64_t)"-[ACUIAddAccountViewController _addAccountSpecifierWasTapped:]", 452, (uint64_t)v39);
    _os_log_impl(&dword_1D573D000, (os_log_t)v38, v37, "%s (%d) \"Add account tapped for '%@'\", v44, 0x1Cu);
  }
  objc_storeStrong(&v38, 0);
  v36 = 0;
  v18 = 0;
  if ((objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0C8F080]) & 1) != 0)
    v18 = -[ACUIAddAccountViewController isStolenDeviceProtectionFeatureAvailableAndEnabled](v41, "isStolenDeviceProtectionFeatureAvailableAndEnabled");
  v36 = v18;
  if (v18)
  {
    v35 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC12B8]), "initWithIdentifier:", CFSTR("com.apple.account.Exchange.add"));
    v5 = (id)v35;
    v42[0] = &unk_1E9A1E508;
    v17 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("EXCHANGE_DTO_RATCHET_TITLE"));
    v43[0] = v16;
    v42[1] = &unk_1E9A1E520;
    v15 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("EXCHANGE_DTO_RATCHET_TEXT"), &stru_1E9A15E98, CFSTR("Localizable"));
    v43[1] = v14;
    v42[2] = &unk_1E9A1E538;
    v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("EXCHANGE_DTO_RATCHET_COUNTDOWN_TEXT"), &stru_1E9A15E98, CFSTR("Localizable"));
    v43[2] = v12;
    v42[3] = &unk_1E9A1E550;
    v11 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EXCHANGE_DTO_LOCALIZED_REASON"), &stru_1E9A15E98, CFSTR("Localizable"));
    v43[3] = v10;
    v42[4] = &unk_1E9A1E568;
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("EXCHANGE_DTO_LOCALIZED_CALLOUT"), &stru_1E9A15E98, CFSTR("Localizable"));
    v43[4] = v8;
    v42[5] = &unk_1E9A1E580;
    v7 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=ACCOUNTS_AND_PASSWORDS&path=ADD_ACCOUNT"));
    v43[5] = v7;
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 6);
    v27 = MEMORY[0x1E0C809B0];
    v28 = -1073741824;
    v29 = 0;
    v30 = __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke;
    v31 = &unk_1E9A15618;
    v32 = v41;
    v33 = v39;
    v34 = location[0];
    objc_msgSend(v5, "armWithOptions:completion:", v6, &v27);

    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v33, 0);
    objc_storeStrong((id *)&v32, 0);
    objc_storeStrong((id *)&v35, 0);
  }
  else
  {
    v4 = v41;
    v3 = v39;
    v19 = MEMORY[0x1E0C809B0];
    v20 = -1073741824;
    v21 = 0;
    v22 = __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke_112;
    v23 = &unk_1E9A15640;
    v24 = v41;
    v25 = v39;
    v26 = location[0];
    -[ACUIAddAccountViewController _alertIfAccountTypePreventsMultiples:withCompletion:](v4, "_alertIfAccountTypePreventsMultiples:withCompletion:", v3, &v19);
    objc_storeStrong(&v26, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong((id *)&v24, 0);
  }
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
}

void __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke(id *a1, void *a2, void *a3)
{
  id v3;
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  id v7;
  BOOL v10;
  os_log_t oslog;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  id v20;
  uint8_t v21[7];
  char v22;
  id v23[2];
  id v24;
  id location[2];
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v24 = 0;
  objc_storeStrong(&v24, a3);
  v23[1] = a1;
  v10 = 1;
  if (!location[0])
    v10 = v24 != 0;
  if (!v10)
    __assert_rtn("-[ACUIAddAccountViewController _addAccountSpecifierWasTapped:]_block_invoke", "ACUIAddAccountViewController.m", 473, "result != nil || error != nil");
  v7 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", &unk_1E9A1E568);

  if (v7)
  {
    v23[0] = (id)_ACLogSystem();
    v22 = 2;
    if (os_log_type_enabled((os_log_t)v23[0], OS_LOG_TYPE_DEBUG))
    {
      log = v23[0];
      type = v22;
      __os_log_helper_16_0_0(v21);
      _os_log_debug_impl(&dword_1D573D000, log, type, "@\"Ratchet armed! Showing the exchange account login flow\", v21, 2u);
    }
    objc_storeStrong(v23, 0);
    queue = MEMORY[0x1E0C80D38];
    v13 = MEMORY[0x1E0C809B0];
    v14 = -1073741824;
    v15 = 0;
    v16 = __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke_110;
    v17 = &unk_1E9A155F0;
    v18 = a1[4];
    v19 = a1[5];
    v20 = a1[6];
    dispatch_async(queue, &v13);

    objc_storeStrong(&v20, 0);
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v3 = (id)objc_msgSend(v24, "userInfo");
    v12 = (id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CC1290]);

    if (objc_msgSend(v24, "code") || !v12)
    {
      oslog = (os_log_t)(id)_ACLogSystem();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v26, (uint64_t)v24);
        _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "@\"Ratchet not armed. Reason: %@\", v26, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

uint64_t __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke_110(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_allowedToAddAccountTypeID:fromSpecifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1, a1);
}

uint64_t __62__ACUIAddAccountViewController__addAccountSpecifierWasTapped___block_invoke_112(uint64_t result, char a2)
{
  if ((a2 & 1) != 0)
    return objc_msgSend(*(id *)(result + 32), "_allowedToAddAccountTypeID:fromSpecifier:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48));
  return result;
}

- (void)_allowedToAddAccountTypeID:(id)a3 fromSpecifier:(id)a4
{
  id v4;
  id v5;
  NSString *v6;
  id v7;
  id v8;
  id v9;
  ACUIAddAccountDataSource *v10;
  BOOL v11;
  id v13;
  id v14;
  Class v15;
  id v16;
  os_log_type_t v17;
  id v18;
  id v19;
  id location[2];
  ACUIAddAccountViewController *v21;
  uint8_t v22[40];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = _ACUILogSystem();
  v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v22, (uint64_t)"-[ACUIAddAccountViewController _allowedToAddAccountTypeID:fromSpecifier:]", 499, (uint64_t)location[0]);
    _os_log_impl(&dword_1D573D000, (os_log_t)v18, v17, "%s (%d) \"Allowed to add accounts for '%@'\", v22, 0x1Cu);
  }
  objc_storeStrong(&v18, 0);
  v16 = -[ACUIAddAccountViewController viewProvidersManager](v21, "viewProvidersManager");
  v10 = -[ACUIAddAccountViewController addAccountDataSource](v21, "addAccountDataSource");
  v15 = (Class)-[ACUIAddAccountDataSource viewControllerClassForCreatingAccountWithType:withViewProviderManager:](v10, "viewControllerClassForCreatingAccountWithType:withViewProviderManager:", location[0], v16);

  v4 = (id)objc_msgSend(v19, "userInfo");
  v11 = v4 != 0;

  if (!v11)
  {
    v9 = (id)objc_msgSend(v16, "configurationInfoForCreatingAccountWithType:", location[0]);
    v14 = (id)objc_msgSend(v9, "mutableCopy");

    if (objc_msgSend(v14, "count"))
      objc_msgSend(v19, "setUserInfo:", v14);
    objc_storeStrong(&v14, 0);
  }
  v5 = v19;
  v6 = NSStringFromClass(v15);
  objc_msgSend(v5, "setProperty:forKey:");

  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setSpecifier:", v19);
  objc_msgSend(v13, "setParentController:", v21);
  v7 = v13;
  v8 = (id)-[ACUIAddAccountViewController rootController](v21, "rootController");
  objc_msgSend(v7, "setRootController:");

  -[ACUIAddAccountViewController showController:](v21, "showController:", v13);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)_createCustomControlledAccountTapped:(id)a3
{
  id v3;
  ACUIAddAccountViewController *v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t, char);
  void *v9;
  ACUIAddAccountViewController *v10;
  id v11;
  id v12;
  id v13;
  id location[2];
  ACUIAddAccountViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (id)objc_msgSend(location[0], "propertyForKey:", CFSTR("ACUIAccountType"));
  v4 = v15;
  v3 = v13;
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke;
  v9 = &unk_1E9A15640;
  v10 = v15;
  v11 = v13;
  v12 = location[0];
  -[ACUIAddAccountViewController _alertIfAccountTypePreventsMultiples:withCompletion:](v4, "_alertIfAccountTypePreventsMultiples:withCompletion:", v3);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke(uint64_t a1, char a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(id *, void *, void *, void *);
  void *v18;
  id v19[2];
  id v20;
  id from;
  os_log_type_t v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  int v26;
  int v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id location;
  Class v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint8_t v36[40];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v35 = a1;
  v34 = a2 & 1;
  v33 = a1;
  if ((a2 & 1) != 0)
  {
    v32 = 0;
    v11 = (id)objc_msgSend(*(id *)(a1 + 32), "addAccountDataSource");
    v12 = *(_QWORD *)(a1 + 40);
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "viewProvidersManager");
    v32 = (Class)objc_msgSend(v11, "controllerClassForCreatingAccountWithType:withViewProviderManager:", v12);

    v2 = (id)objc_msgSend(*(id *)(a1 + 48), "userInfo");
    v9 = v2 != 0;

    if (!v9)
    {
      v8 = (id)objc_msgSend(*(id *)(a1 + 32), "viewProvidersManager");
      v7 = (id)objc_msgSend(v8, "configurationInfoForCreatingAccountWithType:", *(_QWORD *)(a1 + 40));
      location = (id)objc_msgSend(v7, "copy");

      if (objc_msgSend(location, "count"))
        objc_msgSend(*(id *)(a1 + 48), "setUserInfo:", location);
      objc_storeStrong(&location, 0);
    }
    if ((-[objc_class conformsToProtocol:](v32, "conformsToProtocol:", &unk_1EFF6F2D8) & 1) != 0)
    {
      v24 = 0;
      v25 = &v24;
      v26 = 838860800;
      v27 = 48;
      v28 = __Block_byref_object_copy__0;
      v29 = __Block_byref_object_dispose__0;
      v30 = objc_alloc_init(v32);
      v23 = _ACUILogSystem();
      v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v36, (uint64_t)"-[ACUIAddAccountViewController _createCustomControlledAccountTapped:]_block_invoke", 535, v25[5]);
        _os_log_impl(&dword_1D573D000, (os_log_t)v23, v22, "%s (%d) \"Begining account creation controller %{public}@\", v36, 0x1Cu);
      }
      objc_storeStrong(&v23, 0);
      v6 = (id)objc_msgSend(*(id *)(a1 + 32), "addAccountDataSource");
      objc_msgSend(v6, "configureAccountCreationController:", v25[5]);

      objc_initWeak(&from, *(id *)(a1 + 32));
      v3 = (void *)v25[5];
      v4 = *(_QWORD *)(a1 + 48);
      v5 = *(_QWORD *)(a1 + 32);
      v14 = MEMORY[0x1E0C809B0];
      v15 = -1073741824;
      v16 = 0;
      v17 = __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_158;
      v18 = &unk_1E9A156B8;
      v19[1] = &v24;
      objc_copyWeak(&v20, &from);
      v19[0] = *(id *)(a1 + 48);
      objc_msgSend(v3, "beginAccountCreationWithSpecifier:fromViewController:completion:", v4, v5, &v14);
      objc_storeStrong(v19, 0);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&from);
      _Block_object_dispose(&v24, 8);
      objc_storeStrong(&v30, 0);
    }
  }
}

void __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_158(id *a1, void *a2, void *a3, void *a4)
{
  NSObject *queue;
  NSObject *log;
  os_log_type_t type;
  id v7;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id v18[2];
  id v19[2];
  id v20;
  os_log_type_t v21;
  id v22[2];
  id v23;
  void *v24;
  id location[2];
  uint8_t v26[40];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v24 = a3;
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22[1] = a1;
  v22[0] = _ACUILogSystem();
  v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v22[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v22[0];
    type = v21;
    v7 = +[ACUIAddAccountViewController _debugStringForAction:](ACUIAddAccountViewController, "_debugStringForAction:", v24);
    v20 = v7;
    __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v26, (uint64_t)"-[ACUIAddAccountViewController _createCustomControlledAccountTapped:]_block_invoke", 541, (uint64_t)v20);
    _os_log_impl(&dword_1D573D000, log, type, "%s (%d) \"Account Creation Controller completed with action: %{public}@\", v26, 0x1Cu);

    objc_storeStrong(&v20, 0);
  }
  objc_storeStrong(v22, 0);
  queue = MEMORY[0x1E0C80D38];
  v11 = MEMORY[0x1E0C809B0];
  v12 = -1073741824;
  v13 = 0;
  v14 = __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_159;
  v15 = &unk_1E9A15690;
  v18[1] = a1[5];
  objc_copyWeak(v19, a1 + 6);
  v16 = location[0];
  v19[1] = v24;
  v17 = v23;
  v18[0] = a1[4];
  dispatch_async(queue, &v11);

  objc_storeStrong(v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_destroyWeak(v19);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

void __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_159(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t, char);
  void *v12;
  id v13;
  id v14[3];

  v14[2] = (id)a1;
  v14[1] = (id)a1;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 0);
  v14[0] = objc_loadWeakRetained((id *)(a1 + 64));
  if (v14[0])
  {
    v6 = (id)objc_msgSend(v14[0], "addAccountDataSource");
    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD *)(a1 + 72);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    v5 = v14[0];
    v8 = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_2;
    v12 = &unk_1E9A15668;
    v13 = v14[0];
    objc_msgSend(v6, "accountControllerCompletedWithAccount:action:data:specifier:viewController:completion:", v1, v2, v3, v4, v5, &v8);

    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(v14, 0);
}

uint64_t __69__ACUIAddAccountViewController__createCustomControlledAccountTapped___block_invoke_2(uint64_t a1, char a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "nonModalDataclassConfigurationControllerDidCompleteWithSuccess:", a2 & 1);
}

+ (id)_debugStringForAction:(int64_t)a3
{
  id v4;
  id location;
  int64_t v6;
  SEL v7;
  id v8;

  v8 = a1;
  v7 = a2;
  v6 = a3;
  location = CFSTR("unknown");
  if (v6)
  {
    if (v6 == 1)
    {
      objc_storeStrong(&location, CFSTR("dataclass configuration"));
    }
    else if (v6 == 2)
    {
      objc_storeStrong(&location, CFSTR("alternate configuration"));
    }
  }
  else
  {
    objc_storeStrong(&location, CFSTR("none"));
  }
  v4 = location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (id)_specifierForYahooAccount
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[ACUIAddAccountViewController _specifierForCustomControlledAccountWithName:accountTypeID:](self, "_specifierForCustomControlledAccountWithName:accountTypeID:", CFSTR("Yahoo!\u200E"), *MEMORY[0x1E0C8F160]);
  v4 = v8[0];
  v3 = (void *)MEMORY[0x1E0CEA638];
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("Yahoo"));
  objc_msgSend(v4, "setProperty:forKey:");

  objc_msgSend(v8[0], "accessibilitySetIdentification:", CFSTR("mail-yahoo"));
  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_specifierForAOLAccount
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[ACUIAddAccountViewController _specifierForCustomControlledAccountWithName:accountTypeID:](self, "_specifierForCustomControlledAccountWithName:accountTypeID:");
  v4 = v8[0];
  v3 = (void *)MEMORY[0x1E0CEA638];
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("AOL"));
  objc_msgSend(v4, "setProperty:forKey:");

  objc_msgSend(v8[0], "accessibilitySetIdentification:", CFSTR("mail-aol"));
  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_specifierForOutlookAccount
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = -[ACUIAddAccountViewController _specifierForCustomControlledAccountWithName:accountTypeID:](self, "_specifierForCustomControlledAccountWithName:accountTypeID:");
  v4 = v8[0];
  v3 = (void *)MEMORY[0x1E0CEA638];
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("Outlook"));
  objc_msgSend(v4, "setProperty:forKey:");

  objc_msgSend(v8[0], "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isHotmail"));
  objc_msgSend(v8[0], "accessibilitySetIdentification:", CFSTR("mail-hotmail"));
  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return v7;
}

- (id)_specifiersForRegionalMailAccounts
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id obj;
  uint64_t v8;
  char v9;
  NSString *v10;
  char v11;
  id v12;
  id v13;
  id v14;
  _QWORD __b[8];
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  char v22;
  id v23;
  os_log_type_t v24;
  os_log_t oslog;
  id v26;
  int v27;
  os_log_type_t v28;
  id location;
  id v30[2];
  ACUIAddAccountViewController *v31;
  id v32;
  _BYTE v33[128];
  uint8_t v34[32];
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = self;
  v30[1] = (id)a2;
  v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v30[0] = (id)objc_msgSend(v12, "URLForResource:withExtension:", CFSTR("RegionalMailAccountTypes"), CFSTR("plist"));

  if (v30[0])
  {
    v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:", v30[0]);
    if (v26)
    {
      v10 = -[ACUIAddAccountViewController filteredDataclass](v31, "filteredDataclass");
      v22 = 0;
      v20 = 0;
      v11 = 0;
      if (v10)
      {
        v23 = -[ACUIAddAccountViewController filteredDataclass](v31, "filteredDataclass");
        v22 = 1;
        v9 = 1;
        if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0C8F3D0]) & 1) == 0)
        {
          v21 = -[ACUIAddAccountViewController filteredDataclass](v31, "filteredDataclass");
          v20 = 1;
          v9 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C8F3F8]);
        }
        v11 = v9 ^ 1;
      }
      if ((v20 & 1) != 0)

      if ((v22 & 1) != 0)
      if ((v11 & 1) != 0)
      {
        v32 = 0;
        v27 = 1;
      }
      else
      {
        v19 = __MailRegionCode();
        v18 = (id)objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("AccountTypes"));
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        memset(__b, 0, sizeof(__b));
        obj = v18;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
        if (v8)
        {
          v4 = *(_QWORD *)__b[2];
          v5 = 0;
          v6 = v8;
          while (1)
          {
            v3 = v5;
            if (*(_QWORD *)__b[2] != v4)
              objc_enumerationMutation(obj);
            v16 = *(id *)(__b[1] + 8 * v5);
            v14 = (id)objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Regions"));
            if ((objc_msgSend(v14, "containsObject:", v19) & 1) != 0)
            {
              v13 = -[ACUIAddAccountViewController _specifierForRegionalAccountType:](v31, "_specifierForRegionalAccountType:", v16);
              if (v13)
                objc_msgSend(v17, "addObject:", v13);
              objc_storeStrong(&v13, 0);
              v27 = 0;
            }
            else
            {
              v27 = 3;
            }
            objc_storeStrong(&v14, 0);
            ++v5;
            if (v3 + 1 >= v6)
            {
              v5 = 0;
              v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v33, 16);
              if (!v6)
                break;
            }
          }
        }

        v32 = v17;
        v27 = 1;
        objc_storeStrong(&v17, 0);
        objc_storeStrong(&v18, 0);
        objc_storeStrong(&v19, 0);
      }
    }
    else
    {
      oslog = (os_log_t)_ACUILogSystem();
      v24 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v34, (uint64_t)"-[ACUIAddAccountViewController _specifiersForRegionalMailAccounts]", 606);
        _os_log_error_impl(&dword_1D573D000, oslog, v24, "%s (%d) \"Failed to parse contents of RegionalMailAccountTypes.plist!\", v34, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      v32 = 0;
      v27 = 1;
    }
    objc_storeStrong(&v26, 0);
  }
  else
  {
    location = _ACUILogSystem();
    v28 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v35, (uint64_t)"-[ACUIAddAccountViewController _specifiersForRegionalMailAccounts]", 600);
      _os_log_error_impl(&dword_1D573D000, (os_log_t)location, v28, "%s (%d) \"Could not find RegionalMailAccountTypes.plist.\", v35, 0x12u);
    }
    objc_storeStrong(&location, 0);
    v32 = 0;
    v27 = 1;
  }
  objc_storeStrong(v30, 0);
  return v32;
}

- (id)_specifierForRegionalAccountType:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  ACUIAddAccountViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("RegionalDisplayName"));
  v14 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("LargeIcon"));
  v13 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("AccessibilityLabel"));
  v12 = 0;
  if (v14)
  {
    v8 = (void *)MEMORY[0x1E0CEA638];
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (id)objc_msgSend(v8, "imageNamed:inBundle:", v14);
    v4 = v12;
    v12 = v3;

  }
  v11 = 0;
  v5 = 11;
  if (v12)
    v5 = 10;
  v11 = v5;
  v10 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v15, v17, 0, 0, objc_opt_class(), v5, 0);
  objc_msgSend(v10, "setButtonAction:", sel__addAccountSpecifierWasTapped_);
  objc_msgSend(v10, "setProperty:forKey:", *MEMORY[0x1E0C8F0D0], CFSTR("ACUIAccountType"));
  objc_msgSend(v10, "setUserInfo:", location[0]);
  if (v12)
    objc_msgSend(v10, "setProperty:forKey:", v12, *MEMORY[0x1E0D80870]);
  if (v13)
    objc_msgSend(v10, "accessibilitySetIdentification:", v13);
  v7 = v10;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)specifierForOtherAccounts
{
  id *location;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  ACUIAddAccountViewController *v8;
  id v9;
  id v10;
  id v11;
  const __CFString *v12;
  id v13;
  ACUIAddAccountDataSource *v14;
  NSString *v15;
  id v16[2];
  ACUIAddAccountViewController *v17;

  v17 = self;
  v16[1] = (id)a2;
  v9 = (id)MEMORY[0x1E0D804E8];
  v7 = MEMORY[0x1E0CB34D0];
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = CFSTR("OTHER");
  v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:");
  v8 = v17;
  v16[0] = (id)objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, v17, 0, 0, objc_opt_class(), 11, 0);

  objc_msgSend(v16[0], "setProperty:forKey:", v12, *MEMORY[0x1E0D80868]);
  v13 = v16[0];
  v14 = -[ACUIAddAccountViewController addAccountDataSource](v17, "addAccountDataSource");
  objc_msgSend(v13, "setProperty:forKey:");

  v15 = -[ACUIAddAccountViewController filteredDataclass](v17, "filteredDataclass");
  if (v15)
  {
    v5 = v16[0];
    v6 = -[ACUIAddAccountViewController filteredDataclass](v17, "filteredDataclass");
    objc_msgSend(v5, "setProperty:forKey:");

  }
  location = v16;
  v4 = v16[0];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)giantSpecifierWithName:(id)a3 forAccountTypeID:(id)a4
{
  id v4;
  id obj;
  id v7;
  ACUIAddAccountViewController *v8;
  uint64_t v9;
  id *v10;
  id *v11;
  id *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id location[2];
  ACUIAddAccountViewController *v18;

  obj = a4;
  v18 = self;
  location[1] = (id)a2;
  v12 = location;
  v13 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = &v16;
  v16 = 0;
  objc_storeStrong(&v16, obj);
  v9 = MEMORY[0x1E0D804E8];
  v7 = location[0];
  v8 = v18;
  v4 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", location[0], v18, 0, 0, objc_opt_class(), 10, 0);
  v10 = &v15;
  v15 = v4;
  objc_msgSend(v4, "setButtonAction:", sel__addAccountSpecifierWasTapped_);
  objc_msgSend(v15, "setProperty:forKey:", v16, CFSTR("ACUIAccountType"));
  v14 = v15;
  objc_storeStrong(v10, v13);
  objc_storeStrong(v11, v13);
  objc_storeStrong(v12, v13);
  return v14;
}

- (void)setupViewControllerDidDismiss:(id)a3
{
  id location[2];
  ACUIAddAccountViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ACUIAddAccountViewController _popToLayerAboveAddAccountFlow](v4, "_popToLayerAboveAddAccountFlow");
  objc_storeStrong(location, 0);
}

- (void)_popToLayerAboveAddAccountFlow
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id obj;
  uint64_t v20;
  id v21;
  char v22;
  _QWORD v23[8];
  uint64_t v24;
  _QWORD __b[8];
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  id location[2];
  ACUIAddAccountViewController *v32;
  uint64_t v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v21 = (id)-[ACUIAddAccountViewController navigationController](self, "navigationController");
  v30 = (id)objc_msgSend(v21, "viewControllers");

  v29 = 0;
  v27 = 0;
  v22 = 0;
  if ((objc_msgSend(v30, "containsObject:", v32) & 1) == 0)
  {
    v28 = (id)-[ACUIAddAccountViewController parentViewController](v32, "parentViewController");
    v27 = 1;
    v22 = objc_msgSend(v30, "containsObject:");
  }
  if ((v27 & 1) != 0)

  v29 = v22 & 1;
  memset(__b, 0, sizeof(__b));
  obj = (id)objc_msgSend(v30, "reverseObjectEnumerator");
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
  if (v20)
  {
    v16 = *(_QWORD *)__b[2];
    v17 = 0;
    v18 = v20;
    while (1)
    {
      v15 = v17;
      if (*(_QWORD *)__b[2] != v16)
        objc_enumerationMutation(obj);
      v26 = *(id *)(__b[1] + 8 * v17);
      if ((v29 & 1) != 0)
      {
        memset(v23, 0, sizeof(v23));
        v13 = (id)objc_msgSend(v26, "childViewControllers");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v23, v34, 16);
        if (v14)
        {
          v10 = *(_QWORD *)v23[2];
          v11 = 0;
          v12 = v14;
          while (1)
          {
            v9 = v11;
            if (*(_QWORD *)v23[2] != v10)
              objc_enumerationMutation(v13);
            v24 = *(_QWORD *)(v23[1] + 8 * v11);
            if (-[ACUIAddAccountViewController _viewControllerIsNotAddOrAddOther:](v32, "_viewControllerIsNotAddOrAddOther:", v24))
            {
              break;
            }
            ++v11;
            if (v9 + 1 >= v12)
            {
              v11 = 0;
              v12 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", v23, v34, 16);
              if (!v12)
                goto LABEL_18;
            }
          }
          objc_storeStrong(location, v26);
        }
LABEL_18:

        if (location[0])
          break;
      }
      else if (-[ACUIAddAccountViewController _viewControllerIsNotAddOrAddOther:](v32, "_viewControllerIsNotAddOrAddOther:", v26))
      {
        objc_storeStrong(location, v26);
        break;
      }
      ++v17;
      if (v15 + 1 >= v18)
      {
        v17 = 0;
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v35, 16);
        if (!v18)
          break;
      }
    }
  }

  v33 = 0;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  v33 = v7;
  v8 = 1;
  if (v7 != 1)
    v8 = v33 == 5;
  if (location[0])
  {
    v5 = (id)-[ACUIAddAccountViewController navigationController](v32, "navigationController");
    v2 = (id)objc_msgSend(v5, "popToViewController:animated:", location[0], v8);

  }
  else
  {
    v4 = (id)-[ACUIAddAccountViewController navigationController](v32, "navigationController");
    v3 = (id)objc_msgSend(v4, "popToRootViewControllerAnimated:", v8);

  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_viewControllerIsNotAddOrAddOther:(id)a3
{
  BOOL v4;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    v4 = 0;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      v4 = (objc_opt_isKindOfClass() & 1) == 0;
    }
  }
  objc_storeStrong(location, 0);
  return v4;
}

- (void)nonModalDataclassConfigurationControllerDidCompleteWithSuccess:(BOOL)a3
{
  -[ACUIAddAccountViewController _popToLayerAboveAddAccountFlow](self, "_popToLayerAboveAddAccountFlow");
}

- (void)_alertIfAccountTypePreventsMultiples:(id)a3 withCompletion:(id)a4
{
  uint64_t v5;
  id v6;
  ACAccountStore *accountStore;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  ACUIAddAccountViewController *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  int v18;
  int v19;
  void (*v20)(uint64_t, char);
  void *v21;
  id v22;
  id v23;
  id v24;
  id location[2];
  ACUIAddAccountViewController *v26;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  objc_storeStrong(&v24, a4);
  v5 = MEMORY[0x1E0C809B0];
  v17 = MEMORY[0x1E0C809B0];
  v18 = -1073741824;
  v19 = 0;
  v20 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke;
  v21 = &unk_1E9A15708;
  v22 = v24;
  v23 = (id)MEMORY[0x1D8277444](&v17);
  objc_initWeak(&v16, v26);
  accountStore = v26->_accountStore;
  v6 = location[0];
  v8 = v5;
  v9 = -1073741824;
  v10 = 0;
  v11 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_3;
  v12 = &unk_1E9A15758;
  objc_copyWeak(&v15, &v16);
  v13 = v26;
  v14 = v23;
  -[ACAccountStore accountTypeWithIdentifier:completion:](accountStore, "accountTypeWithIdentifier:completion:", v6, &v8);
  objc_storeStrong(&v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v16);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

void __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke(uint64_t a1, char a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = a1;
  v12 = a2 & 1;
  v11 = a1;
  queue = MEMORY[0x1E0C80D38];
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_2;
  v8 = &unk_1E9A156E0;
  v9 = *(id *)(a1 + 32);
  v10 = v12 & 1;
  dispatch_async(queue, &v4);

  objc_storeStrong(&v9, 0);
}

uint64_t __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40) & 1);
}

void __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16[2];
  id v17;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17 = 0;
  objc_storeStrong(&v17, a3);
  v16[1] = (id)a1;
  v16[0] = objc_loadWeakRetained((id *)(a1 + 48));
  if ((objc_msgSend(location[0], "supportsMultipleAccounts") & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = (id)objc_msgSend(v16[0], "addAccountDataSource");
    v3 = location[0];
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1408);
    v8 = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_4;
    v12 = &unk_1E9A15730;
    v13 = location[0];
    v14 = v16[0];
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v5, "hasAccountWithType:accountStore:completion:", v3, v4, &v8);

    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v13, 0);
  }
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(id *);
  void *v8;
  id v9;
  id v10;
  id v11[2];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v11[1] = (id)a1;
  if (location[0])
  {
    queue = MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_5;
    v8 = &unk_1E9A155F0;
    v9 = *(id *)(a1 + 32);
    v10 = location[0];
    v11[0] = *(id *)(a1 + 40);
    dispatch_async(queue, &v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    objc_storeStrong(v11, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_storeStrong(location, 0);
}

void __84__ACUIAddAccountViewController__alertIfAccountTypePreventsMultiples_withCompletion___block_invoke_5(id *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17;
  id v18[3];

  v18[2] = a1;
  v18[1] = a1;
  v1 = (void *)MEMORY[0x1E0CB3940];
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SINGLETON_ACCOUNT_ERROR_TITLE"));
  v2 = (id)objc_msgSend(a1[4], "accountTypeDescription");
  v18[0] = (id)objc_msgSend(v1, "stringWithFormat:", v3, v2);

  v5 = (void *)MEMORY[0x1E0CB3940];
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SINGLETON_ACCOUNT_ERROR_MESSAGE"), &stru_1E9A15E98, CFSTR("Localizable"));
  v7 = (id)objc_msgSend(a1[4], "accountTypeDescription");
  v6 = (id)objc_msgSend(a1[5], "username");
  v17 = (id)objc_msgSend(v5, "stringWithFormat:", v8, v7, v6);

  v16 = (id)objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v18[0], v17, 1);
  v11 = v16;
  v10 = (void *)MEMORY[0x1E0CEA2E0];
  v14 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E9A15E98, CFSTR("Localizable"));
  v12 = (id)objc_msgSend(v10, "actionWithTitle:style:handler:");
  objc_msgSend(v11, "addAction:");

  objc_msgSend(a1[6], "presentViewController:animated:completion:", v16, 1, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(v18, 0);
}

- (BOOL)isStolenDeviceProtectionFeatureAvailableAndEnabled
{
  id v3;
  id v4;
  char v5;
  id v6;
  char v7;
  BOOL v8;

  if ((_os_feature_enabled_impl() & 1) == 0)
    return 0;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CC12C8], "sharedInstance");
  v7 = objc_msgSend(v6, "isFeatureSupported");

  if ((v7 & 1) == 0)
    return 0;
  v4 = (id)objc_msgSend(MEMORY[0x1E0CC12C8], "sharedInstance");
  v5 = objc_msgSend(v4, "isFeatureAvailable");

  if ((v5 & 1) == 0)
    return 0;
  v3 = (id)objc_msgSend(MEMORY[0x1E0CC12C8], "sharedInstance");
  v8 = objc_msgSend(v3, "isFeatureEnabled") & 1;

  return v8;
}

- (NSString)filteredDataclass
{
  return (NSString *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setFilteredDataclass:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (void)setAddAccountDataSource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addAccountDataSource, 0);
  objc_storeStrong((id *)&self->_filteredDataclass, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_gmailSpecifier, 0);
  objc_storeStrong((id *)&self->_preEnabledDataclasses, 0);
}

@end
