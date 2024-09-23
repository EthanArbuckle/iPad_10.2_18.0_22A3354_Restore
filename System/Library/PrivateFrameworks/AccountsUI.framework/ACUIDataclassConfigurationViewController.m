@implementation ACUIDataclassConfigurationViewController

+ (BOOL)shouldPresentAsModalSheet
{
  id v3;
  uint64_t v4;
  BOOL v5;

  v3 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = 1;
  if (v4 != 1)
    return v4 == 5;
  return v5;
}

- (ACUIDataclassConfigurationViewController)init
{
  NSMutableDictionary *v2;
  NSMutableDictionary *allDesiredDataclassActions;
  BOOL v4;
  ACUIDataclassConfigurationViewController *v6;
  id v7;
  objc_super v8;
  SEL v9;
  ACUIDataclassConfigurationViewController *v10;

  v9 = a2;
  v10 = 0;
  v8.receiver = self;
  v8.super_class = (Class)ACUIDataclassConfigurationViewController;
  v10 = -[ACUIViewController init](&v8, sel_init);
  objc_storeStrong((id *)&v10, v10);
  if (v10)
  {
    -[ACUIDataclassConfigurationViewController setShouldEnableAccountSummaryCell:](v10, "setShouldEnableAccountSummaryCell:", 1);
    -[ACUIDataclassConfigurationViewController setShouldEnableAccountSettingsCell:](v10, "setShouldEnableAccountSettingsCell:", 1);
    -[ACUIDataclassConfigurationViewController setShouldEnableDeleteAccountButton:](v10, "setShouldEnableDeleteAccountButton:", 1);
    -[ACUIDataclassConfigurationViewController setShouldEnableDataclassSwitches:](v10, "setShouldEnableDataclassSwitches:", 1);
    -[ACUIDataclassConfigurationViewController setFirstTimeSetup:](v10, "setFirstTimeSetup:", 0);
    v2 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    allDesiredDataclassActions = v10->_allDesiredDataclassActions;
    v10->_allDesiredDataclassActions = v2;

    -[ACUIDataclassConfigurationViewController setShouldShowDeleteAccountButton:](v10, "setShouldShowDeleteAccountButton:", (ACUIIsSharedIPadMode() & 1) == 0);
    v7 = (id)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v4 = objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]) == 2;
    -[ACUIDataclassConfigurationViewController setIsAccountModificationDisabled:](v10, "setIsAccountModificationDisabled:", v4);

  }
  v6 = v10;
  objc_storeStrong((id *)&v10, 0);
  return v6;
}

- (void)dealloc
{
  id v2;
  objc_super v3;
  SEL v4;
  ACUIDataclassConfigurationViewController *v5;

  v5 = self;
  v4 = a2;
  v2 = (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v2, "removeObserver:", v5);

  v3.receiver = v5;
  v3.super_class = (Class)ACUIDataclassConfigurationViewController;
  -[ACUIViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)isAccountDataclassListRedesignFFEnabled
{
  return _os_feature_enabled_impl() & 1;
}

- (void)forceMailSetup
{
  self->_forceMailSetup = 1;
}

- (id)displayedAccountTypeString
{
  ACAccountType *v3;
  ACAccount *v4;
  NSString *v5;

  v4 = -[ACUIDataclassConfigurationViewController account](self, "account");
  v3 = -[ACAccount accountType](v4, "accountType");
  v5 = -[ACAccountType accountTypeDescription](v3, "accountTypeDescription");

  return v5;
}

- (Class)accountInfoControllerClass
{
  return 0;
}

- (id)displayedShortAccountTypeString
{
  ACAccountType *v3;
  ACAccount *v4;
  NSString *v5;

  v4 = -[ACUIDataclassConfigurationViewController account](self, "account");
  v3 = -[ACAccount accountType](v4, "accountType");
  v5 = -[ACAccountType accountTypeDescription](v3, "accountTypeDescription");

  return v5;
}

- (id)valueForAccountSummaryCell
{
  ACAccount *v3;
  id v4;

  v3 = -[ACUIDataclassConfigurationViewController account](self, "account");
  v4 = -[ACAccount displayUsername](v3, "displayUsername");

  return v4;
}

- (int64_t)deleteButtonIndex
{
  return -[ACUIDataclassConfigurationViewController indexOfSpecifier:](self, "indexOfSpecifier:", self->_deleteButtonSpecifier, a2, self);
}

- (void)setFirstTimeSetup:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  -[ACUIDataclassConfigurationViewController setShouldShowDeleteAccountButton:](self, "setShouldShowDeleteAccountButton:", !a3);
  self->_firstTimeSetup = v3;
}

- (BOOL)isMailSetupForced
{
  return self->_forceMailSetup;
}

- (id)titleForDeleteButton
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));

  return v4;
}

- (id)messageForAccountDeletionWarning
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (id)objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_WARNING_FORMAT"));
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DATA"), &stru_1E9A15E98, CFSTR("Localizable"));
  v8 = (id)objc_msgSend(v3, "stringWithFormat:", v6, v4);

  return v8;
}

- (id)messageForAccountDeletionProgressUI
{
  id v3;
  id v4;

  v3 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DELETING"), &stru_1E9A15E98, CFSTR("Localizable"));

  return v4;
}

- (BOOL)shouldShowOtherSpecifiersDuringFirstSetup
{
  return 0;
}

- (void)viewDidLoad
{
  id v2;
  UIBarButtonItem *v3;
  NSString *v4;
  NSString *initialAccountDescription;
  id v6;
  ACAccount *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  UIBarButtonItem *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  ACAccount *v19;
  ACAccount *v20;
  ACAccount *v21;
  id v22;
  id v23;
  objc_super v24;
  os_log_type_t v25;
  id v26;
  os_log_type_t v27;
  id location;
  char v29;
  id v30;
  char v31;
  ACAccount *v32;
  id v33[2];
  ACUIDataclassConfigurationViewController *v34;
  uint8_t v35[32];
  uint8_t v36[40];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = self;
  v33[1] = (id)a2;
  v21 = -[ACUIDataclassConfigurationViewController account](self, "account");
  v22 = (id)-[ACAccount managingOwnerIdentifier](v21, "managingOwnerIdentifier");
  v31 = 0;
  v29 = 0;
  if (v22)
  {
    v2 = v22;
  }
  else
  {
    v32 = -[ACUIDataclassConfigurationViewController account](v34, "account");
    v31 = 1;
    v30 = (id)-[ACAccount objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF48]);
    v29 = 1;
    v2 = v30;
  }
  v33[0] = v2;
  if ((v29 & 1) != 0)

  if ((v31 & 1) != 0)
  if (v33[0])
  {
    location = _ACUILogSystem();
    v27 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      v20 = -[ACUIDataclassConfigurationViewController account](v34, "account");
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v36, (uint64_t)"-[ACUIDataclassConfigurationViewController viewDidLoad]", 157, (uint64_t)v20, (uint64_t)v33[0]);
      _os_log_debug_impl(&dword_1D573D000, (os_log_t)location, v27, "%s (%d) \"Hiding delete button for %@, account is managed by %@\", v36, 0x26u);

    }
    objc_storeStrong(&location, 0);
    -[ACUIDataclassConfigurationViewController setShouldShowDeleteAccountButton:](v34, "setShouldShowDeleteAccountButton:", 0);
  }
  if (-[ACUIDataclassConfigurationViewController isAccountModificationDisabled](v34, "isAccountModificationDisabled"))
  {
    v26 = _ACUILogSystem();
    v25 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
    {
      v19 = -[ACUIDataclassConfigurationViewController account](v34, "account");
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v35, (uint64_t)"-[ACUIDataclassConfigurationViewController viewDidLoad]", 162, (uint64_t)v19);
      _os_log_debug_impl(&dword_1D573D000, (os_log_t)v26, v25, "%s (%d) \"Hiding delete button for %@, account modification is disabled\", v35, 0x1Cu);

    }
    objc_storeStrong(&v26, 0);
    -[ACUIDataclassConfigurationViewController setShouldShowDeleteAccountButton:](v34, "setShouldShowDeleteAccountButton:", 0);
    -[ACUIDataclassConfigurationViewController setShouldEnableAccountSummaryCell:](v34, "setShouldEnableAccountSummaryCell:", 0);
    -[ACUIDataclassConfigurationViewController setShouldEnableAccountSettingsCell:](v34, "setShouldEnableAccountSettingsCell:", 0);
    -[ACUIDataclassConfigurationViewController setShouldEnableDataclassSwitches:](v34, "setShouldEnableDataclassSwitches:", 0);
  }
  v24.receiver = v34;
  v24.super_class = (Class)ACUIDataclassConfigurationViewController;
  -[ACUIViewController viewDidLoad](&v24, sel_viewDidLoad);
  v23 = (id)-[ACUIDataclassConfigurationViewController navigationItem](v34, "navigationItem");
  if (-[ACUIDataclassConfigurationViewController isAccountDataclassListRedesignFFEnabled](v34, "isAccountDataclassListRedesignFFEnabled"))
  {
    v3 = -[ACUIViewController doneButton](v34, "doneButton");
    v18 = v3 != 0;

    if (!v18)
    {
      v14 = objc_alloc(MEMORY[0x1E0CEA380]);
      v17 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_1E9A15E98, CFSTR("Localizable"));
      v15 = (id)objc_msgSend(v14, "initWithTitle:style:target:action:");
      -[ACUIViewController setDoneButton:](v34, "setDoneButton:");

    }
    v13 = -[ACUIViewController doneButton](v34, "doneButton");
    objc_msgSend(v23, "setRightBarButtonItem:");

  }
  if (-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v34, "isFirstTimeSetup"))
  {
    objc_msgSend(v23, "setHidesBackButton:", 1);
    v11 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SAVE"), &stru_1E9A15E98, CFSTR("Localizable"));
    v9 = (id)objc_msgSend(v23, "rightBarButtonItem");
    objc_msgSend(v9, "setTitle:", v10);

  }
  else
  {
    if (!-[ACUIViewController isPresentedAsModalSheet](v34, "isPresentedAsModalSheet"))
    {
      if (-[ACUIDataclassConfigurationViewController isAccountDataclassListRedesignFFEnabled](v34, "isAccountDataclassListRedesignFFEnabled"))
      {
        v12 = (id)objc_msgSend(v23, "rightBarButtonItem");
        objc_msgSend(v12, "setHidden:", 1);

      }
      else
      {
        objc_msgSend(v23, "setRightBarButtonItem:", 0);
      }
    }
    objc_msgSend(v23, "setLeftBarButtonItem:");
    -[ACUIViewController setCancelButton:](v34, "setCancelButton:", 0);
    objc_msgSend(v23, "setHidesBackButton:", 0);
  }
  v6 = -[ACUIDataclassConfigurationViewController _navigationTitle](v34, "_navigationTitle");
  objc_msgSend(v23, "setTitle:");

  v7 = -[ACUIDataclassConfigurationViewController account](v34, "account");
  v4 = -[ACAccount accountDescription](v7, "accountDescription");
  initialAccountDescription = v34->_initialAccountDescription;
  v34->_initialAccountDescription = v4;

  v8 = (id)-[ACUIDataclassConfigurationViewController table](v34, "table");
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("DATACLASS_CONFIGURATION_TABLE"));

  objc_storeStrong(&v23, 0);
  objc_storeStrong(v33, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3;
  const __CFString *v4;
  uint64_t v5;
  ACAccount *v6;
  id v7;
  os_log_t oslog;
  id location;
  objc_super v10;
  BOOL v11;
  SEL v12;
  ACUIDataclassConfigurationViewController *v13;
  uint8_t v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = self;
  v12 = a2;
  v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACUIDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  location = (id)-[ACUIDataclassConfigurationViewController navigationItem](v13, "navigationItem");
  v7 = -[ACUIDataclassConfigurationViewController _navigationTitle](v13, "_navigationTitle");
  objc_msgSend(location, "setTitle:");

  oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    v3 = -[ACUIDataclassConfigurationViewController isFirstTimeSetup](v13, "isFirstTimeSetup");
    v4 = CFSTR("First-time-setup");
    if (!v3)
      v4 = CFSTR("existing-setup");
    v5 = (uint64_t)v4;
    v6 = -[ACUIDataclassConfigurationViewController account](v13, "account");
    __os_log_helper_16_2_4_8_32_4_0_8_66_8_64((uint64_t)v14, (uint64_t)"-[ACUIDataclassConfigurationViewController viewWillAppear:]", 212, v5, (uint64_t)v6);
    _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"Presenting %{public}@ for %@\", v14, 0x26u);

  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;
  NSString *v6;
  ACAccount *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  NSString *v12;
  ACAccount *v13;
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
  id v24;
  id v25;
  id v26;
  ACUIDataclassConfigurationViewController *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  objc_super v34;
  BOOL v35;
  SEL v36;
  ACUIDataclassConfigurationViewController *v37;
  _QWORD v38[5];

  v38[4] = *MEMORY[0x1E0C80C00];
  v37 = self;
  v36 = a2;
  v35 = a3;
  v34.receiver = self;
  v34.super_class = (Class)ACUIDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController viewDidAppear:](&v34, sel_viewDidAppear_, a3);
  if (!-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v37, "isFirstTimeSetup"))
  {
    PreferencesExtendedLibrary_0();
    v4 = (void *)MEMORY[0x1E0C99E98];
    v3 = (void *)MEMORY[0x1E0CB3940];
    v7 = -[ACUIDataclassConfigurationViewController account](v37, "account");
    v6 = -[ACAccount identifier](v7, "identifier");
    v5 = (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("settings-navigation://com.apple.Settings.InternetAccounts/%@"), v6);
    v33 = (id)objc_msgSend(v4, "URLWithString:");

    v8 = objc_alloc(MEMORY[0x1E0CB3B78]);
    v13 = -[ACUIDataclassConfigurationViewController account](v37, "account");
    v12 = -[ACAccount accountDescription](v13, "accountDescription");
    v11 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (id)objc_msgSend(v10, "bundleURL");
    v32 = objc_msgSend(v8, "initWithKey:defaultValue:table:locale:bundleURL:", CFSTR("DO_NOT_LOCALIZE_ACCOUNT_DESCIRPTION_IN_DEFAULT_VALUE"), v12);

    v14 = objc_alloc(MEMORY[0x1E0CB3B78]);
    v17 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v16 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (id)objc_msgSend(v16, "bundleURL");
    v31 = objc_msgSend(v14, "initWithKey:table:locale:bundleURL:", CFSTR("APPS_NAVIGATION_PATH"), 0, v17);

    v18 = objc_alloc(MEMORY[0x1E0CB3B78]);
    v21 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v20 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (id)objc_msgSend(v20, "bundleURL");
    v30 = objc_msgSend(v18, "initWithKey:table:locale:bundleURL:", CFSTR("CONTACTS_APP_PATH"), 0, v21);

    v22 = objc_alloc(MEMORY[0x1E0CB3B78]);
    v25 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v24 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (id)objc_msgSend(v24, "bundleURL");
    v29 = objc_msgSend(v22, "initWithKey:table:locale:bundleURL:", CFSTR("CONTACTS_ACCOUNTS_PATH"), 0, v25);

    v27 = v37;
    v26 = (id)v32;
    v38[0] = v31;
    v38[1] = v30;
    v38[2] = v29;
    v38[3] = v32;
    v28 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
    -[ACUIDataclassConfigurationViewController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](v27, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.accounts.generic-account"), v26);

    objc_storeStrong((id *)&v29, 0);
    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
    objc_storeStrong((id *)&v32, 0);
    objc_storeStrong(&v33, 0);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  ACAccount *v3;
  ACAccountStore *v4;
  BOOL v5;
  char v6;
  ACAccount *v7;
  objc_super v8;
  BOOL v9;
  SEL v10;
  ACUIDataclassConfigurationViewController *v11;

  v11 = self;
  v10 = a2;
  v9 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ACUIDataclassConfigurationViewController;
  -[ACUIDataclassConfigurationViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  v6 = 0;
  v5 = 0;
  if (-[ACUIDataclassConfigurationViewController isAccountDataclassListRedesignFFEnabled](v11, "isAccountDataclassListRedesignFFEnabled"))
  {
    v7 = -[ACUIDataclassConfigurationViewController account](v11, "account");
    v6 = 1;
    v5 = v7 != 0;
  }
  if ((v6 & 1) != 0)

  if (v5)
  {
    v4 = -[ACUIViewController accountStore](v11, "accountStore");
    v3 = -[ACUIDataclassConfigurationViewController account](v11, "account");
    -[ACAccountStore saveAccount:withCompletionHandler:](v4, "saveAccount:withCompletionHandler:");

  }
}

void __62__ACUIDataclassConfigurationViewController_viewWillDisappear___block_invoke(NSObject *a1, char a2, id obj)
{
  os_log_t v4;
  os_log_type_t type;
  os_log_t oslog[2];
  id location;
  char v8;
  NSObject *v9;
  uint8_t v10[32];
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v8 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  oslog[1] = a1;
  if ((v8 & 1) == 0)
  {
    oslog[0] = (os_log_t)_ACUILogSystem();
    type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v11, (uint64_t)"-[ACUIDataclassConfigurationViewController viewWillDisappear:]_block_invoke", 270);
      _os_log_error_impl(&dword_1D573D000, oslog[0], type, "%s (%d) \"Account did not save\", v11, 0x12u);
    }
    objc_storeStrong((id *)oslog, 0);
  }
  if (location)
  {
    v4 = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v10, (uint64_t)"-[ACUIDataclassConfigurationViewController viewWillDisappear:]_block_invoke", 273, (uint64_t)location);
      _os_log_error_impl(&dword_1D573D000, v4, OS_LOG_TYPE_ERROR, "%s (%d) \"Error occurred while saving account. Error: %@\", v10, 0x1Cu);
    }
    objc_storeStrong((id *)&v4, 0);
  }
  objc_storeStrong(&location, 0);
}

- (id)_navigationTitle
{
  ACAccount *v3;
  NSString *v5;

  if (-[ACUIDataclassConfigurationViewController isFirstTimeSetup](self, "isFirstTimeSetup"))
    return -[ACUIDataclassConfigurationViewController displayedShortAccountTypeString](self, "displayedShortAccountTypeString");
  v3 = -[ACUIDataclassConfigurationViewController account](self, "account");
  v5 = -[ACAccount accountDescription](v3, "accountDescription");

  return v5;
}

- (void)doneButtonTapped:(id)a3
{
  BOOL forceMailSetup;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  ACUIDataclassConfigurationViewController *v20;
  NSObject *log;
  os_log_type_t type;
  NSString *v23;
  uint64_t v24;
  int v25;
  int v26;
  void (*v27)(_QWORD *, void *);
  void *v28;
  id v29;
  id v30;
  char v31;
  ACAccount *v32;
  uint64_t v33;
  int v34;
  int v35;
  void (*v36)(uint64_t);
  void *v37;
  ACUIDataclassConfigurationViewController *v38;
  id v39;
  int v40;
  NSString *v41;
  os_log_type_t v42;
  id v43;
  id location;
  SEL v45;
  ACUIDataclassConfigurationViewController *v46;
  uint8_t v47[56];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v46 = self;
  v45 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  v43 = _ACUILogSystem();
  v42 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
  {
    log = v43;
    type = v42;
    v20 = v46;
    v23 = NSStringFromSelector(v45);
    v41 = v23;
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66((uint64_t)v47, (uint64_t)"-[ACUIDataclassConfigurationViewController doneButtonTapped:]", 288, (uint64_t)v20, (uint64_t)v41, (uint64_t)location);
    _os_log_impl(&dword_1D573D000, log, type, "%s (%d) @\"%{public}@ %{public}@: %{public}@\", v47, 0x30u);

    objc_storeStrong((id *)&v41, 0);
  }
  objc_storeStrong(&v43, 0);
  if (-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v46, "isFirstTimeSetup"))
  {
    v33 = MEMORY[0x1E0C809B0];
    v34 = -1073741824;
    v35 = 0;
    v36 = __61__ACUIDataclassConfigurationViewController_doneButtonTapped___block_invoke;
    v37 = &unk_1E9A155C8;
    v38 = v46;
    v39 = (id)MEMORY[0x1D8277444](&v33);
    forceMailSetup = v46->_forceMailSetup;
    v31 = 0;
    v19 = 0;
    if (forceMailSetup)
    {
      v32 = -[ACUIDataclassConfigurationViewController account](v46, "account");
      v31 = 1;
      v19 = (-[ACAccount isProvisionedForDataclass:](v32, "isProvisionedForDataclass:", *MEMORY[0x1E0C8F3D0]) & 1) == 0;
    }
    if ((v31 & 1) != 0)

    if (v19)
    {
      v4 = (void *)MEMORY[0x1E0CEA2E8];
      v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONTINUE_WITHOUT_MAIL_TITLE"));
      v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CONTINUE_WITHOUT_MAIL_MESSAGE"), &stru_1E9A15E98, CFSTR("Localizable"));
      v30 = (id)objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v7);

      v10 = v30;
      v9 = (void *)MEMORY[0x1E0CEA2E0];
      v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
      v11 = (id)objc_msgSend(v9, "actionWithTitle:style:handler:");
      objc_msgSend(v10, "addAction:");

      v15 = v30;
      v14 = (void *)MEMORY[0x1E0CEA2E0];
      v18 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_1E9A15E98, CFSTR("Localizable"));
      v24 = MEMORY[0x1E0C809B0];
      v25 = -1073741824;
      v26 = 0;
      v27 = __61__ACUIDataclassConfigurationViewController_doneButtonTapped___block_invoke_2;
      v28 = &unk_1E9A158D0;
      v29 = v39;
      v16 = (id)objc_msgSend(v14, "actionWithTitle:style:handler:", v17, 0, &v24);
      objc_msgSend(v15, "addAction:");

      -[ACUIDataclassConfigurationViewController presentViewController:animated:completion:](v46, "presentViewController:animated:completion:", v30, 1, 0);
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v30, 0);
    }
    else
    {
      (*((void (**)(void))v39 + 2))();
    }
    objc_storeStrong(&v39, 0);
    objc_storeStrong((id *)&v38, 0);
    v40 = 0;
  }
  else
  {
    -[ACUIViewController dismissAnimated:](v46, "dismissAnimated:", 1);
    v40 = 1;
  }
  objc_storeStrong(&location, 0);
}

void __61__ACUIDataclassConfigurationViewController_doneButtonTapped___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "shouldVerifyBeforeAccountSave");
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "accountOperationsHelper");
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "account");
  objc_msgSend(v3, "saveAccount:withDataclassActions:requireVerification:");

}

void __61__ACUIDataclassConfigurationViewController_doneButtonTapped___block_invoke_2(_QWORD *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  (*(void (**)(void))(a1[4] + 16))();
  objc_storeStrong(location, 0);
}

- (void)cancelButtonTapped:(id)a3
{
  void (**v3)(id, _QWORD);
  id v4;
  ACUIDataclassConfigurationViewController *v5;
  NSObject *log;
  os_log_type_t type;
  NSString *v8;
  id v9;
  NSString *v10;
  os_log_type_t v11;
  id v12;
  id location;
  SEL v14;
  ACUIDataclassConfigurationViewController *v15;
  uint8_t v16[56];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = self;
  v14 = a2;
  location = 0;
  objc_storeStrong(&location, a3);
  v12 = _ACUILogSystem();
  v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    log = v12;
    type = v11;
    v5 = v15;
    v8 = NSStringFromSelector(v14);
    v10 = v8;
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_66((uint64_t)v16, (uint64_t)"-[ACUIDataclassConfigurationViewController cancelButtonTapped:]", 318, (uint64_t)v5, (uint64_t)v10, (uint64_t)location);
    _os_log_impl(&dword_1D573D000, log, type, "%s (%d) @\"%{public}@ %{public}@: %{public}@\", v16, 0x30u);

    objc_storeStrong((id *)&v10, 0);
  }
  objc_storeStrong(&v12, 0);
  v9 = (id)-[ACUIDataclassConfigurationViewController rootController](v15, "rootController");
  v4 = -[ACUIDataclassConfigurationViewController configurationCompletion](v15, "configurationCompletion");

  if (v4)
  {
    v3 = (void (**)(id, _QWORD))-[ACUIDataclassConfigurationViewController configurationCompletion](v15, "configurationCompletion");
    v3[2](v3, 0);

    -[ACUIDataclassConfigurationViewController setConfigurationCompletion:](v15, "setConfigurationCompletion:", 0);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "dismiss");
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
}

- (BOOL)shouldVerifyBeforeAccountSave
{
  return 1;
}

- (id)specifiers
{
  ACAccount *v2;
  PSSpecifier *v3;
  PSSpecifier *accountSummaryCellSpecifier;
  NSArray *v5;
  NSArray *dataclassSpecifiers;
  NSArray *v7;
  NSArray *otherSpecifiers;
  PSSpecifier *v9;
  PSSpecifier *accountSettingsCellSpecifier;
  PSSpecifier *v11;
  PSSpecifier *deleteButtonSpecifier;
  void *v14;
  id v15;
  PSSpecifier *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  BOOL v21;
  ACAccount *v22;
  id v23;
  BOOL v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  SEL v31;
  ACUIDataclassConfigurationViewController *v32;

  v32 = self;
  v31 = a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]))
  {
    v30 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = -[ACUIDataclassConfigurationViewController account](v32, "account");
    v24 = v2 == 0;

    if (v24)
    {
      v23 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", v31, v32, CFSTR("ACUIDataclassConfigurationViewController.m"), 353, CFSTR("Nil account in %@."), objc_opt_class());

    }
    if (!-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v32, "isFirstTimeSetup"))
    {
      v3 = (PSSpecifier *)-[ACUIDataclassConfigurationViewController specifierForAccountSummaryCell](v32, "specifierForAccountSummaryCell");
      accountSummaryCellSpecifier = v32->_accountSummaryCellSpecifier;
      v32->_accountSummaryCellSpecifier = v3;

      if (v32->_accountSummaryCellSpecifier)
      {
        v29 = -[ACUIDataclassConfigurationViewController displayedAccountTypeString](v32, "displayedAccountTypeString");
        v28 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v29);
        objc_msgSend(v30, "addObject:", v28);
        objc_msgSend(v30, "addObject:", v32->_accountSummaryCellSpecifier);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v29, 0);
      }
    }
    v22 = -[ACUIDataclassConfigurationViewController account](v32, "account");
    v27 = (id)-[ACAccount provisionedDataclasses](v22, "provisionedDataclasses");

    if (objc_msgSend(v27, "count"))
    {
      v5 = (NSArray *)-[ACUIDataclassConfigurationViewController _specifiersForDataclasses:](v32, "_specifiersForDataclasses:", v27);
      dataclassSpecifiers = v32->_dataclassSpecifiers;
      v32->_dataclassSpecifiers = v5;

      objc_msgSend(v30, "addObjectsFromArray:", v32->_dataclassSpecifiers);
    }
    if (!-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v32, "isFirstTimeSetup")
      || -[ACUIDataclassConfigurationViewController shouldShowOtherSpecifiersDuringFirstSetup](v32, "shouldShowOtherSpecifiersDuringFirstSetup"))
    {
      v7 = (NSArray *)-[ACUIDataclassConfigurationViewController otherSpecifiers](v32, "otherSpecifiers");
      otherSpecifiers = v32->_otherSpecifiers;
      v32->_otherSpecifiers = v7;

      if (-[NSArray count](v32->_otherSpecifiers, "count"))
      {
        v20 = -[NSArray objectAtIndexedSubscript:](v32->_otherSpecifiers, "objectAtIndexedSubscript:", 0);
        v21 = objc_msgSend(v20, "cellType") == 0;

        if (!v21)
        {
          v18 = v30;
          v19 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
          objc_msgSend(v18, "addObject:");

        }
        objc_msgSend(v30, "addObjectsFromArray:", v32->_otherSpecifiers);
      }
    }
    if (!-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v32, "isFirstTimeSetup")
      && -[ACUIDataclassConfigurationViewController isAccountDataclassListRedesignFFEnabled](v32, "isAccountDataclassListRedesignFFEnabled"))
    {
      v9 = (PSSpecifier *)-[ACUIDataclassConfigurationViewController specifierForAccountSettingsCell](v32, "specifierForAccountSettingsCell");
      accountSettingsCellSpecifier = v32->_accountSettingsCellSpecifier;
      v32->_accountSettingsCellSpecifier = v9;

      if (v32->_accountSettingsCellSpecifier)
      {
        v26 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithID:", CFSTR("accountSettingsSpecifier"));
        objc_msgSend(v30, "addObject:", v26);
        objc_msgSend(v30, "addObject:", v32->_accountSettingsCellSpecifier);
        objc_storeStrong(&v26, 0);
      }
    }
    if (-[ACUIDataclassConfigurationViewController shouldShowDeleteAccountButton](v32, "shouldShowDeleteAccountButton"))
    {
      v25 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
      objc_msgSend(v30, "addObject:", v25);
      v14 = (void *)MEMORY[0x1E0D804E8];
      v15 = -[ACUIDataclassConfigurationViewController titleForDeleteButton](v32, "titleForDeleteButton");
      v11 = (PSSpecifier *)(id)objc_msgSend(v14, "deleteButtonSpecifierWithName:target:action:");
      deleteButtonSpecifier = v32->_deleteButtonSpecifier;
      v32->_deleteButtonSpecifier = v11;

      -[PSSpecifier setProperty:forKey:](v32->_deleteButtonSpecifier, "setProperty:forKey:", CFSTR("ACUIDeleteButtonSpecifierID"), *MEMORY[0x1E0D80868]);
      v16 = v32->_deleteButtonSpecifier;
      v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACUIDataclassConfigurationViewController shouldEnableDeleteAccountButton](v32, "shouldEnableDeleteAccountButton"));
      -[PSSpecifier setProperty:forKey:](v16, "setProperty:forKey:");

      objc_msgSend(v30, "addObject:", v32->_deleteButtonSpecifier);
      objc_storeStrong(&v25, 0);
    }
    objc_storeStrong((id *)((char *)&v32->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), v30);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v30, 0);
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&v32->super.super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E0D80590]));
}

- (id)specifierForAccountSummaryCell
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v7;
  id v8;
  id v9;
  ACAccount *v10;
  id v11;
  id v12;
  id v13;
  ACAccount *v14;
  ACAccount *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _BOOL8 v20;
  int v21;
  objc_class *v22;
  id v23[2];
  ACUIDataclassConfigurationViewController *v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v24 = self;
  v23[1] = (id)a2;
  v23[0] = 0;
  v22 = -[ACUIDataclassConfigurationViewController accountInfoControllerClass](self, "accountInfoControllerClass");
  if (v22)
  {
    if (-[ACUIDataclassConfigurationViewController isAccountDataclassListRedesignFFEnabled](v24, "isAccountDataclassListRedesignFFEnabled"))
    {
      v7 = (void *)MEMORY[0x1E0D80520];
      v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LABEL"), &stru_1E9A15E98, CFSTR("Localizable"));
      v4 = (id)objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, v24, sel__setDescription_, sel__getDescription_, objc_opt_class());
      v5 = v23[0];
      v23[0] = v4;

      objc_msgSend(v23[0], "setKeyboardType:autoCaps:autoCorrection:", 0, 1);
      v26[0] = CFSTR("AccountSettingsAlreadyShowedEnableAndDeleteKey");
      v27[0] = MEMORY[0x1E0C9AAB0];
      v26[1] = CFSTR("account");
      v10 = -[ACUIDataclassConfigurationViewController account](v24, "account");
      v27[1] = v10;
      v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);

      v11 = v23[0];
      v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACUIDataclassConfigurationViewController shouldEnableAccountSummaryCell](v24, "shouldEnableAccountSummaryCell"));
      objc_msgSend(v11, "setProperty:forKey:");

      objc_msgSend(v23[0], "setUserInfo:", v18);
      objc_storeStrong(&v18, 0);
    }
    else
    {
      v20 = 0;
      v20 = -[ACUIViewController isPresentedAsModalSheet](v24, "isPresentedAsModalSheet")
         || (-[objc_class shouldPresentAsModalSheet](v22, "shouldPresentAsModalSheet") & 1) == 0;
      v14 = -[ACUIDataclassConfigurationViewController account](v24, "account");
      v13 = -[ACUIDataclassConfigurationViewController valueForAccountSummaryCell](v24, "valueForAccountSummaryCell");
      v2 = +[ACUIAccountSummaryCell specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:](ACUIAccountSummaryCell, "specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:", 1, v14);
      v3 = v23[0];
      v23[0] = v2;

      v28[0] = CFSTR("AccountSettingsAlreadyShowedEnableAndDeleteKey");
      v29[0] = MEMORY[0x1E0C9AAB0];
      v28[1] = CFSTR("account");
      v15 = -[ACUIDataclassConfigurationViewController account](v24, "account");
      v29[1] = v15;
      v19 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);

      objc_msgSend(v23[0], "setUserInfo:", v19);
      v16 = v23[0];
      v17 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACUIDataclassConfigurationViewController shouldEnableAccountSummaryCell](v24, "shouldEnableAccountSummaryCell"));
      objc_msgSend(v16, "setProperty:forKey:");

      objc_storeStrong(&v19, 0);
    }
    v25 = v23[0];
    v21 = 1;
  }
  else
  {
    v25 = 0;
    v21 = 1;
  }
  objc_storeStrong(v23, 0);
  return v25;
}

- (id)specifierForAccountSettingsCell
{
  id v2;
  id v3;
  id v5;
  ACAccount *v6;
  ACAccount *v7;
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  int v12;
  objc_class *v13;
  id v14[2];
  ACUIDataclassConfigurationViewController *v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v15 = self;
  v14[1] = (id)a2;
  v14[0] = 0;
  v13 = -[ACUIDataclassConfigurationViewController accountInfoControllerClass](self, "accountInfoControllerClass");
  if (v13)
  {
    v11 = 0;
    v11 = -[ACUIViewController isPresentedAsModalSheet](v15, "isPresentedAsModalSheet")
       || (-[objc_class shouldPresentAsModalSheet](v13, "shouldPresentAsModalSheet") & 1) == 0;
    v6 = -[ACUIDataclassConfigurationViewController account](v15, "account");
    v5 = -[ACUIDataclassConfigurationViewController valueForAccountSummaryCell](v15, "valueForAccountSummaryCell");
    v2 = +[ACUIAccountSummaryCell specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:](ACUIAccountSummaryCell, "specifierWithStyle:account:valueText:detailControllerClass:presentationStyle:");
    v3 = v14[0];
    v14[0] = v2;

    v17[0] = CFSTR("AccountSettingsAlreadyShowedEnableAndDeleteKey");
    v18[0] = MEMORY[0x1E0C9AAB0];
    v17[1] = CFSTR("account");
    v7 = -[ACUIDataclassConfigurationViewController account](v15, "account");
    v18[1] = v7;
    v10 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);

    objc_msgSend(v14[0], "setUserInfo:", v10);
    v8 = v14[0];
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ACUIDataclassConfigurationViewController shouldEnableAccountSettingsCell](v15, "shouldEnableAccountSettingsCell"));
    objc_msgSend(v8, "setProperty:forKey:");

    v16 = v14[0];
    v12 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v16 = 0;
    v12 = 1;
  }
  objc_storeStrong(v14, 0);
  return v16;
}

- (id)_specifiersForDataclasses:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  ACUIDataclassConfigurationViewController *v9;
  id v10;
  id v11;
  PSSpecifier *v12;
  id obj;
  uint64_t v14;
  id v15;
  _QWORD __b[8];
  uint64_t v17;
  id v18;
  id v19;
  id location[2];
  ACUIDataclassConfigurationViewController *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = v21;
  v10 = (id)objc_msgSend(location[0], "allObjects");
  v18 = -[ACUIDataclassConfigurationViewController _orderDataclassList:](v9, "_orderDataclassList:");

  v11 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
  -[ACUIDataclassConfigurationViewController setDataclassGroupSpecifier:](v21, "setDataclassGroupSpecifier:");

  v12 = -[ACUIDataclassConfigurationViewController dataclassGroupSpecifier](v21, "dataclassGroupSpecifier");
  objc_msgSend(v19, "addObject:");

  memset(__b, 0, sizeof(__b));
  obj = v18;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
  if (v14)
  {
    v6 = *(_QWORD *)__b[2];
    v7 = 0;
    v8 = v14;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)__b[2] != v6)
        objc_enumerationMutation(obj);
      v17 = *(_QWORD *)(__b[1] + 8 * v7);
      if (-[ACUIDataclassConfigurationViewController shouldShowSpecifierForDataclass:](v21, "shouldShowSpecifierForDataclass:", v17))
      {
        v15 = -[ACUIDataclassConfigurationViewController specifierForDataclass:](v21, "specifierForDataclass:", v17);
        if (v15)
          objc_msgSend(v19, "addObject:", v15);
        objc_storeStrong(&v15, 0);
      }
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v22, 16);
        if (!v8)
          break;
      }
    }
  }

  v4 = v19;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_getDescription:(id)a3
{
  ACAccount *v4;
  NSString *v5;
  id location[2];
  ACUIDataclassConfigurationViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[ACUIDataclassConfigurationViewController account](v7, "account");
  v5 = -[ACAccount accountDescription](v4, "accountDescription");

  objc_storeStrong(location, 0);
  return v5;
}

- (void)_setDescription:(id)a3
{
  uint64_t v3;
  ACAccount *v4;
  id v5;
  id v6;
  int v7;
  char v8;
  NSString *v9;
  char v10;
  ACAccountType *v11;
  char v12;
  ACAccount *v13;
  id location[2];
  ACUIDataclassConfigurationViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  v10 = 0;
  v8 = 0;
  LOBYTE(v7) = 1;
  if (-[ACUIDataclassConfigurationViewController isAccountDataclassListRedesignFFEnabled](v15, "isAccountDataclassListRedesignFFEnabled"))
  {
    v13 = -[ACUIDataclassConfigurationViewController account](v15, "account");
    v12 = 1;
    v11 = -[ACAccount accountType](v13, "accountType");
    v10 = 1;
    v9 = -[ACAccountType identifier](v11, "identifier");
    v8 = 1;
    v7 = !-[NSString isEqualToString:](v9, "isEqualToString:", *MEMORY[0x1E0C8F030]);
  }
  if ((v8 & 1) != 0)

  if ((v10 & 1) != 0)
  if ((v12 & 1) != 0)

  if ((v7 & 1) != 0)
  {
    v5 = location[0];
    v6 = (id)-[ACUIDataclassConfigurationViewController navigationItem](v15, "navigationItem");
    objc_msgSend(v6, "setTitle:", v5);

  }
  v4 = -[ACUIDataclassConfigurationViewController account](v15, "account", location[0]);
  -[ACAccount setAccountDescription:](v4, "setAccountDescription:", v3);

  objc_storeStrong(location, 0);
}

- (BOOL)shouldShowSpecifierForDataclass:(id)a3
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (id)specifierForDataclass:(id)a3
{
  id v4;
  void *v5;
  ACAccount *v6;
  ACAccount *v7;
  BOOL v8;
  char v9;
  NSString *v10;
  char v11;
  ACAccountType *v12;
  char v13;
  ACAccount *v14;
  id v15;
  id v16;
  int v17;
  id location[2];
  ACUIDataclassConfigurationViewController *v19;
  id v20;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F390]) & 1) != 0)
  {
    v20 = 0;
    v17 = 1;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0D804E8];
    v4 = location[0];
    v6 = -[ACUIDataclassConfigurationViewController account](v19, "account");
    v16 = (id)objc_msgSend(v5, "acui_specifierForDataclass:account:target:set:get:", v4);

    v7 = -[ACUIDataclassConfigurationViewController account](v19, "account");
    v15 = (id)-[ACAccount accountPropertyForKey:](v7, "accountPropertyForKey:", *MEMORY[0x1E0C8EF88]);

    v13 = 0;
    v11 = 0;
    v9 = 0;
    v8 = 0;
    if (-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v19, "isFirstTimeSetup"))
    {
      v14 = -[ACUIDataclassConfigurationViewController account](v19, "account");
      v13 = 1;
      v12 = -[ACAccount accountType](v14, "accountType");
      v11 = 1;
      v10 = -[ACAccountType identifier](v12, "identifier");
      v9 = 1;
      v8 = 0;
      if (-[NSString isEqualToString:](v10, "isEqualToString:", *MEMORY[0x1E0C8F0A8]))
        v8 = v15 != 0;
    }
    if ((v9 & 1) != 0)

    if ((v11 & 1) != 0)
    if ((v13 & 1) != 0)

    if (v19->_forceMailSetup && (objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F3D0]) & 1) != 0
      || v8 && (objc_msgSend(v15, "containsObject:", location[0]) & 1) == 0
      || !-[ACUIDataclassConfigurationViewController _isUserOverridableForDataclass:](v19, "_isUserOverridableForDataclass:", location[0])|| !-[ACUIDataclassConfigurationViewController shouldEnableDataclassSwitches](v19, "shouldEnableDataclassSwitches"))
    {
      objc_msgSend(v16, "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    }
    v20 = v16;
    v17 = 1;
    objc_storeStrong(&v15, 0);
    objc_storeStrong(&v16, 0);
  }
  objc_storeStrong(location, 0);
  return v20;
}

- (BOOL)_isUserOverridableForDataclass:(id)a3
{
  char v4;
  ACAccount *v5;
  char v6;
  id v7;
  char v8;
  id v9;
  id location[2];
  ACUIDataclassConfigurationViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F3D0]) & 1) != 0)
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E0D47258]);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F388]) & 1) != 0
         || (objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F390]) & 1) != 0)
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E0D47250]);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F378]) & 1) != 0)
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E0D47248]);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F400]) & 1) != 0)
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E0D47268]);
  }
  else if ((objc_msgSend(location[0], "isEqualToString:", *MEMORY[0x1E0C8F3F8]) & 1) != 0)
  {
    objc_storeStrong(&v9, (id)*MEMORY[0x1E0D47260]);
  }
  else
  {
    objc_storeStrong(&v9, 0);
  }
  v8 = 0;
  if (v9)
  {
    v5 = -[ACUIDataclassConfigurationViewController account](v11, "account");
    v7 = (id)-[ACAccount objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v9);

    v6 = 1;
    if (v7)
    {
      objc_opt_class();
      v6 = 1;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v6 = objc_msgSend(v7, "BOOLValue");
    }
    v8 = v6 & 1;
    objc_storeStrong(&v7, 0);
  }
  else
  {
    v8 = 1;
  }
  v4 = v8;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (id)otherSpecifiers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a2, self);
}

- (void)reloadDynamicSpecifiersWithAnimation:(BOOL)a3
{
  id v3;
  id v4;
  ACAccount *v5;
  id obj;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  SEL v17;
  ACUIDataclassConfigurationViewController *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = v18->_accountSummaryCellSpecifier;
  if (v13)
    objc_msgSend(v15, "addObject:", v13);
  v12 = -[ACUIDataclassConfigurationViewController specifierForAccountSummaryCell](v18, "specifierForAccountSummaryCell");
  if (v12)
    objc_msgSend(v14, "addObject:", v12);
  v11 = (id)-[NSArray copy](v18->_dataclassSpecifiers, "copy");
  if (v11)
    objc_msgSend(v15, "addObjectsFromArray:", v11);
  v5 = -[ACUIDataclassConfigurationViewController account](v18, "account");
  v4 = (id)-[ACAccount provisionedDataclasses](v5, "provisionedDataclasses");
  v10 = -[ACUIDataclassConfigurationViewController _specifiersForDataclasses:](v18, "_specifiersForDataclasses:");

  if (v10)
    objc_msgSend(v14, "addObjectsFromArray:", v10);
  v9 = (id)-[NSArray copy](v18->_otherSpecifiers, "copy");
  if (v9)
    objc_msgSend(v15, "addObjectsFromArray:", v9);
  v3 = -[ACUIDataclassConfigurationViewController otherSpecifiers](v18, "otherSpecifiers");
  v8 = (id)objc_msgSend(v3, "copy");

  if (v8)
    objc_msgSend(v14, "addObjectsFromArray:", v8);
  if ((objc_msgSend(v15, "isEqualToArray:", v14) & 1) == 0)
    -[ACUIDataclassConfigurationViewController replaceContiguousSpecifiers:withSpecifiers:animated:](v18, "replaceContiguousSpecifiers:withSpecifiers:animated:", v15, v14, 1);
  if (-[ACUIDataclassConfigurationViewController isAccountDataclassListRedesignFFEnabled](v18, "isAccountDataclassListRedesignFFEnabled"))
  {
    v7 = v18->_accountSettingsCellSpecifier;
    if (v7)
      objc_msgSend(v15, "addObject:", v7);
    obj = -[ACUIDataclassConfigurationViewController specifierForAccountSettingsCell](v18, "specifierForAccountSettingsCell");
    if (obj)
      objc_msgSend(v14, "addObject:", obj);
    objc_storeStrong((id *)&v18->_accountSettingsCellSpecifier, obj);
    objc_storeStrong(&obj, 0);
    objc_storeStrong(&v7, 0);
  }
  objc_storeStrong((id *)&v18->_accountSummaryCellSpecifier, v12);
  objc_storeStrong((id *)&v18->_dataclassSpecifiers, v10);
  objc_storeStrong((id *)&v18->_otherSpecifiers, v8);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
}

- (id)dataclassSwitchStateForSpecifier:(id)a3
{
  BOOL v3;
  id v5;
  id location[2];
  ACUIDataclassConfigurationViewController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = -[ACUIDataclassConfigurationViewController dataclassStateForSpecifier:](v7, "dataclassStateForSpecifier:", location[0]);
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)dataclassLinkListStateForSpecifier:(id)a3
{
  id v3;
  char v5;
  id v6;
  char v7;
  id v8;
  char v9;
  id v10;
  char v11;
  id v12;
  id location[2];
  ACUIDataclassConfigurationViewController *v14;
  id v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  v9 = 0;
  v7 = 0;
  v5 = 0;
  if (-[ACUIDataclassConfigurationViewController dataclassStateForSpecifier:](v14, "dataclassStateForSpecifier:", location[0]))
  {
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = 1;
    v10 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ON"), &stru_1E9A15E98, CFSTR("Localizable"));
    v9 = 1;
    v3 = v10;
  }
  else
  {
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = 1;
    v6 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OFF"), &stru_1E9A15E98, CFSTR("Localizable"));
    v5 = 1;
    v3 = v6;
  }
  v15 = v3;
  if ((v5 & 1) != 0)

  if ((v7 & 1) != 0)
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  objc_storeStrong(location, 0);
  return v15;
}

- (BOOL)dataclassStateForSpecifier:(id)a3
{
  uint64_t v4;
  ACAccount *v5;
  BOOL v6;
  os_log_t oslog;
  char v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  id location[2];
  ACUIDataclassConfigurationViewController *v13;
  uint8_t v14[40];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = (id)objc_msgSend(location[0], "acui_dataclass");
  v10 = 0;
  if (v13->_forceMailSetup && (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C8F3D0]) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v8 = 0;
    v6 = 0;
    if (-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v13, "isFirstTimeSetup"))
    {
      v9 = -[ACUIDataclassConfigurationViewController preEnabledDataclasses](v13, "preEnabledDataclasses");
      v8 = 1;
      v6 = (objc_msgSend(v9, "containsObject:", v11) & 1) == 1;
    }
    if ((v8 & 1) != 0)

    if (v6)
    {
      v10 = 1;
    }
    else
    {
      v5 = -[ACUIDataclassConfigurationViewController account](v13, "account");
      v10 = -[ACAccount isEnabledForDataclass:](v5, "isEnabledForDataclass:", v11) & 1;

    }
  }
  oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_32_4_0_8_66_4_0((uint64_t)v14, (uint64_t)"-[ACUIDataclassConfigurationViewController dataclassStateForSpecifier:]", 670, (uint64_t)v11, v10 & 1);
    _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"%{public}@: %d\", v14, 0x22u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = v10;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, (id)HIDWORD(v4));
  return v4 & 1;
}

- (void)dataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  id v4;
  ACUIDataclassConfigurationViewController *v5;
  id v6;
  char v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  ACAccount *v28;
  char v29;
  ACAccount *v30;
  uint64_t v32;
  int v33;
  int v34;
  void (*v35)(uint64_t, char, id);
  void *v36;
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  dispatch_object_t object;
  id v43;
  id v44;
  uint64_t v45;
  int v46;
  int v47;
  void (*v48)(uint64_t, void *);
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  int v53;
  int v54;
  void (*v55)(id *, void *);
  void *v56;
  id v57;
  id from;
  id v59;
  id v60;
  char v61;
  NSString *v62;
  char v63;
  ACAccountType *v64;
  char v65;
  ACAccount *v66;
  char v67;
  id v68;
  int v69;
  os_log_type_t v70;
  id v71;
  id v72;
  id v73;
  id location[2];
  ACUIDataclassConfigurationViewController *v75;
  uint8_t v76[24];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v75 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v73 = 0;
  objc_storeStrong(&v73, a4);
  v72 = (id)objc_msgSend(v73, "acui_dataclass");
  if (v72)
  {
    v30 = -[ACUIDataclassConfigurationViewController account](v75, "account");
    v68 = (id)-[ACAccount accountPropertyForKey:](v30, "accountPropertyForKey:", *MEMORY[0x1E0C8EF88]);

    v67 = 0;
    v65 = 0;
    v63 = 0;
    v61 = 0;
    v29 = 0;
    if (!-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v75, "isFirstTimeSetup"))
    {
      v66 = -[ACUIDataclassConfigurationViewController account](v75, "account");
      v65 = 1;
      v64 = -[ACAccount accountType](v66, "accountType");
      v63 = 1;
      v62 = -[ACAccountType identifier](v64, "identifier");
      v61 = 1;
      v29 = 0;
      if (-[NSString isEqualToString:](v62, "isEqualToString:", *MEMORY[0x1E0C8F0A8]))
      {
        v29 = 0;
        if (v68)
          v29 = objc_msgSend(location[0], "BOOLValue");
      }
    }
    if ((v61 & 1) != 0)

    if ((v63 & 1) != 0)
    if ((v65 & 1) != 0)

    v67 = v29 & 1;
    if ((v29 & 1) == 0 || (objc_msgSend(v68, "containsObject:", v72) & 1) != 0)
    {
      if (-[ACUIDataclassConfigurationViewController isFirstTimeSetup](v75, "isFirstTimeSetup"))
      {
        -[ACUIDataclassConfigurationViewController setDataclass:enabled:](v75, "setDataclass:enabled:", v72, objc_msgSend(location[0], "BOOLValue") & 1);
      }
      else
      {
        objc_initWeak(&v44, v75);
        v10 = objc_loadWeakRetained(&v44);
        v9 = (id)objc_msgSend(v10, "account");
        v43 = (id)objc_msgSend(v9, "copy");

        v8 = MEMORY[0x1E0C80D38];
        dispatch_assert_queue_V2(v8);

        object = (dispatch_object_t)(id)objc_msgSend(v73, "_switchSpinnerTimer");
        dispatch_resume(object);
        v5 = v75;
        v6 = v72;
        v7 = objc_msgSend(location[0], "BOOLValue");
        v4 = v43;
        v32 = MEMORY[0x1E0C809B0];
        v33 = -1073741824;
        v34 = 0;
        v35 = __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_3;
        v36 = &unk_1E9A15970;
        objc_copyWeak(&v41, &v44);
        v37 = v72;
        v38 = v43;
        v39 = object;
        v40 = v73;
        -[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:](v5, "_setDataclass:enabled:onAccount:completion:", v6, v7 & 1, v4, &v32);
        objc_storeStrong(&v40, 0);
        objc_storeStrong((id *)&v39, 0);
        objc_storeStrong(&v38, 0);
        objc_storeStrong(&v37, 0);
        objc_destroyWeak(&v41);
        objc_storeStrong((id *)&object, 0);
        objc_storeStrong(&v43, 0);
        objc_destroyWeak(&v44);
      }
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v28 = -[ACUIDataclassConfigurationViewController account](v75, "account");
      v60 = +[ACUILocalization localizedStringForDataclass:withSuffix:forAccount:](ACUILocalization, "localizedStringForDataclass:withSuffix:forAccount:", v72, CFSTR("LABEL"));

      v27 = (void *)MEMORY[0x1E0CEA2E8];
      v26 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v24 = (id)objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("GOOGLE_LOGIN_REQUIRED_TITLE"), &stru_1E9A15E98, CFSTR("Localizable"));
      v25 = (void *)MEMORY[0x1E0CB3940];
      v23 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v22 = (id)objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("GOOGLE_GRANTED_DATACLASS_LOGIN_MESSAGE"), &stru_1E9A15E98, CFSTR("Localizable"));
      v21 = (id)objc_msgSend(v25, "localizedStringWithFormat:", v60);
      v59 = (id)objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v24);

      objc_initWeak(&from, v75);
      v19 = v59;
      v20 = (void *)MEMORY[0x1E0CEA2E0];
      v18 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("LOGIN"), &stru_1E9A15E98, CFSTR("Localizable"));
      v52 = MEMORY[0x1E0C809B0];
      v53 = -1073741824;
      v54 = 0;
      v55 = __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke;
      v56 = &unk_1E9A158F8;
      objc_copyWeak(&v57, &from);
      v16 = (id)objc_msgSend(v20, "actionWithTitle:style:handler:", v17, 0, &v52);
      objc_msgSend(v19, "addAction:");

      v14 = v59;
      v15 = (void *)MEMORY[0x1E0CEA2E0];
      v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
      v45 = MEMORY[0x1E0C809B0];
      v46 = -1073741824;
      v47 = 0;
      v48 = __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_2;
      v49 = &unk_1E9A15920;
      objc_copyWeak(&v51, &from);
      v50 = v73;
      v11 = (id)objc_msgSend(v15, "actionWithTitle:style:handler:", v12, 1, &v45);
      objc_msgSend(v14, "addAction:");

      -[ACUIDataclassConfigurationViewController presentViewController:animated:completion:](v75, "presentViewController:animated:completion:", v59, 1, 0);
      objc_storeStrong(&v50, 0);
      objc_destroyWeak(&v51);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&from);
      objc_storeStrong(&v59, 0);
      objc_storeStrong(&v60, 0);
    }
    objc_storeStrong(&v68, 0);
    v69 = 0;
  }
  else
  {
    v71 = _ACUILogSystem();
    v70 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v76, (uint64_t)"-[ACUIDataclassConfigurationViewController dataclassSwitchStateDidChange:withSpecifier:]", 678);
      _os_log_error_impl(&dword_1D573D000, (os_log_t)v71, v70, "%s (%d) \"sender of dataclassSwitchStateDidChange:withSpecifier: has nil dataclass. Please file a bug!\", v76, 0x12u);
    }
    objc_storeStrong(&v71, 0);
    v69 = 1;
  }
  objc_storeStrong(&v72, 0);
  objc_storeStrong(&v73, 0);
  objc_storeStrong(location, 0);
}

void __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke(id *a1, void *a2)
{
  id v3[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  if (v3[0] && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3[0], "performSelector:withObject:", sel__reAuthenticationButtonTapped_, 0);
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

void __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3[2];
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = (id)a1;
  v3[0] = objc_loadWeakRetained((id *)(a1 + 40));
  if (v3[0])
    objc_msgSend(v3[0], "reloadSpecifier:animated:", *(_QWORD *)(a1 + 32), 1);
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

void __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_3(uint64_t a1, char a2, id obj)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(uint64_t, char, id);
  void *v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  id v20[2];
  id location;
  char v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v23 = a1;
  v22 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v20[1] = (id)a1;
  v7 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v7);

  v20[0] = objc_loadWeakRetained((id *)(a1 + 64));
  if (v20[0])
  {
    if ((v22 & 1) != 0)
    {
      dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
      objc_msgSend(v20[0], "reloadSpecifier:animated:", *(_QWORD *)(a1 + 56), 1);
    }
    else
    {
      v17 = 0;
      if (location)
      {
        v24 = *(_QWORD *)(a1 + 32);
        v25[0] = location;
        v18 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
        v17 = 1;
        v3 = v18;
      }
      else
      {
        v3 = 0;
      }
      v19 = v3;
      if ((v17 & 1) != 0)

      v4 = (id)objc_msgSend(v20[0], "accountOperationsHelper");
      v5 = *(_QWORD *)(a1 + 40);
      v6 = v19;
      v9 = MEMORY[0x1E0C809B0];
      v10 = -1073741824;
      v11 = 0;
      v12 = __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_4;
      v13 = &unk_1E9A15948;
      objc_copyWeak(&v16, (id *)(a1 + 64));
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 56);
      objc_msgSend(v4, "saveAccount:withDataclassActions:requireVerification:completion:", v5, v6, 0, &v9);

      objc_storeStrong(&v15, 0);
      objc_storeStrong(&v14, 0);
      objc_destroyWeak(&v16);
      objc_storeStrong(&v19, 0);
    }
  }
  objc_storeStrong(v20, 0);
  objc_storeStrong(&location, 0);
}

void __88__ACUIDataclassConfigurationViewController_dataclassSwitchStateDidChange_withSpecifier___block_invoke_4(uint64_t a1, char a2, id obj)
{
  NSObject *v3;
  id v4;
  id v6[2];
  id location;
  char v8;
  uint64_t v9;

  v9 = a1;
  v8 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v6[1] = (id)a1;
  v3 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v3);

  v6[0] = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (id)objc_msgSend(v6[0], "account");
  objc_msgSend(v4, "refresh");

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  objc_msgSend(v6[0], "reloadSpecifier:animated:", *(_QWORD *)(a1 + 40), 1);
  objc_storeStrong(v6, 0);
  objc_storeStrong(&location, 0);
}

- (void)_enableAllProvisionedDataclassesWithoutRequringUserInteraction
{
  BOOL v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  ACAccountStore *v9;
  id v10;
  uint64_t v11;
  ACAccount *v12;
  ACAccountType *v13;
  NSString *v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  id obj;
  uint64_t v22;
  os_log_t oslog;
  id v24;
  char v25;
  id v26;
  _QWORD v27[8];
  uint64_t v28;
  id v29;
  char v30;
  id v31;
  char v32;
  ACAccount *v33;
  os_log_type_t v34;
  id v35;
  _QWORD __b[8];
  uint64_t v37;
  os_log_type_t type;
  os_log_t location[2];
  ACUIDataclassConfigurationViewController *v40;
  uint8_t v41[48];
  _BYTE v42[128];
  uint8_t v43[32];
  _BYTE v44[128];
  uint8_t v45[24];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v40 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)_ACUILogSystem();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v45, (uint64_t)"-[ACUIDataclassConfigurationViewController _enableAllProvisionedDataclassesWithoutRequringUserInteraction]", 746);
    _os_log_debug_impl(&dword_1D573D000, location[0], type, "%s (%d) \"Attempting to enable all provisioned dataclasses.\", v45, 0x12u);
  }
  objc_storeStrong((id *)location, 0);
  memset(__b, 0, sizeof(__b));
  obj = (id)-[ACAccount provisionedDataclasses](v40->_account, "provisionedDataclasses");
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
  if (v22)
  {
    v18 = *(_QWORD *)__b[2];
    v19 = 0;
    v20 = v22;
    while (1)
    {
      v17 = v19;
      if (*(_QWORD *)__b[2] != v18)
        objc_enumerationMutation(obj);
      v37 = *(_QWORD *)(__b[1] + 8 * v19);
      if (-[ACUIDataclassConfigurationViewController shouldAutomaticallyTryEnablingDataclassDuringSetup:](v40, "shouldAutomaticallyTryEnablingDataclassDuringSetup:", v37))
      {
        -[ACAccount setEnabled:forDataclass:](v40->_account, "setEnabled:forDataclass:", 1, v37);
      }
      else
      {
        v35 = _ACUILogSystem();
        v34 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEBUG))
        {
          v16 = v35;
          __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v43, (uint64_t)"-[ACUIDataclassConfigurationViewController _enableAllProvisionedDataclassesWithoutRequringUserInteraction]", 751, v37);
          _os_log_debug_impl(&dword_1D573D000, v16, v34, "%s (%d) \"Skipping dataclass %@...\", v43, 0x1Cu);
        }
        objc_storeStrong(&v35, 0);
        v12 = -[ACUIDataclassConfigurationViewController account](v40, "account");
        v13 = -[ACAccount accountType](v12, "accountType");
        v14 = -[ACAccountType identifier](v13, "identifier");
        v2 = -[NSString isEqualToString:](v14, "isEqualToString:", *MEMORY[0x1E0C8F0A8]);
        v32 = 0;
        v30 = 0;
        v15 = 0;
        if (v2)
        {
          v33 = -[ACUIDataclassConfigurationViewController account](v40, "account");
          v32 = 1;
          v31 = (id)-[ACAccount accountPropertyForKey:](v33, "accountPropertyForKey:", *MEMORY[0x1E0C8EF88]);
          v30 = 1;
          v15 = v31 != 0;
        }
        if ((v30 & 1) != 0)

        if ((v32 & 1) != 0)
        if (v15)
          -[ACAccount setEnabled:forDataclass:](v40->_account, "setEnabled:forDataclass:", 0, v37);
      }
      ++v19;
      if (v17 + 1 >= v20)
      {
        v19 = 0;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v44, 16);
        if (!v20)
          break;
      }
    }
  }

  v9 = -[ACUIViewController accountStore](v40, "accountStore");
  v29 = (id)-[ACAccountStore dataclassActionsForAccountSave:](v9, "dataclassActionsForAccountSave:", v40->_account);

  memset(v27, 0, sizeof(v27));
  v10 = (id)-[ACAccount provisionedDataclasses](v40->_account, "provisionedDataclasses");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v27, v42, 16);
  if (v11)
  {
    v6 = *(_QWORD *)v27[2];
    v7 = 0;
    v8 = v11;
    while (1)
    {
      v5 = v7;
      if (*(_QWORD *)v27[2] != v6)
        objc_enumerationMutation(v10);
      v28 = *(_QWORD *)(v27[1] + 8 * v7);
      v26 = (id)objc_msgSend(v29, "objectForKeyedSubscript:", v28);
      if (v26)
      {
        v25 = 1;
        if (objc_msgSend(v26, "count") == 1)
        {
          v24 = (id)objc_msgSend(v26, "lastObject");
          if (objc_msgSend(v24, "type"))
          {
            oslog = (os_log_t)_ACUILogSystem();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
            {
              v4 = oslog;
              v3 = objc_msgSend(v24, "type");
              __os_log_helper_16_2_4_8_32_4_0_8_0_8_64((uint64_t)v41, (uint64_t)"-[ACUIDataclassConfigurationViewController _enableAllProvisionedDataclassesWithoutRequringUserInteraction]", 772, v3, v28);
              _os_log_debug_impl(&dword_1D573D000, v4, OS_LOG_TYPE_DEBUG, "%s (%d) \"Setting action %lu for dataclass %@\", v41, 0x26u);
            }
            objc_storeStrong((id *)&oslog, 0);
            -[NSMutableDictionary setObject:forKey:](v40->_allDesiredDataclassActions, "setObject:forKey:", v24, v28);
            v25 = 0;
          }
          objc_storeStrong(&v24, 0);
        }
        if ((v25 & 1) != 0)
          -[ACAccount setEnabled:forDataclass:](v40->_account, "setEnabled:forDataclass:", 0, v28);
      }
      objc_storeStrong(&v26, 0);
      ++v7;
      if (v5 + 1 >= v8)
      {
        v7 = 0;
        v8 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v27, v42, 16);
        if (!v8)
          break;
      }
    }
  }

  objc_storeStrong(&v29, 0);
}

- (BOOL)shouldAutomaticallyTryEnablingDataclassDuringSetup:(id)a3
{
  ACAccount *v4;
  ACAccount *v5;
  ACAccountType *v6;
  NSString *v7;
  BOOL v8;
  BOOL v9;
  id v10;
  id location[2];
  ACUIDataclassConfigurationViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[ACUIDataclassConfigurationViewController account](v12, "account");
  v10 = (id)-[ACAccount accountPropertyForKey:](v4, "accountPropertyForKey:", *MEMORY[0x1E0C8EF88]);

  v5 = -[ACUIDataclassConfigurationViewController account](v12, "account");
  v6 = -[ACAccount accountType](v5, "accountType");
  v7 = -[ACAccountType identifier](v6, "identifier");
  v8 = 0;
  if (-[NSString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x1E0C8F0A8]))
    v8 = v10 != 0;

  v9 = 1;
  if (v8)
    v9 = (objc_msgSend(v10, "containsObject:", location[0]) & 1) != 0;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v9;
}

- (void)setDataclass:(id)a3 enabled:(BOOL)a4
{
  ACAccount *v4;
  ACUIDataclassConfigurationViewController *v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(uint64_t, char, id);
  void *v13;
  id v14;
  id v15;
  BOOL v16;
  id from;
  BOOL v18;
  id location[2];
  ACUIDataclassConfigurationViewController *v20;

  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v18 = a4;
  objc_initWeak(&from, v20);
  v6 = v20;
  v7 = location[0];
  v8 = v18;
  v4 = -[ACUIDataclassConfigurationViewController account](v20, "account");
  v9 = MEMORY[0x1E0C809B0];
  v10 = -1073741824;
  v11 = 0;
  v12 = __65__ACUIDataclassConfigurationViewController_setDataclass_enabled___block_invoke;
  v13 = &unk_1E9A15998;
  objc_copyWeak(&v15, &from);
  v16 = v18;
  v14 = location[0];
  -[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:](v6, "_setDataclass:enabled:onAccount:completion:", v7, v8, v4, &v9);

  objc_storeStrong(&v14, 0);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

void __65__ACUIDataclassConfigurationViewController_setDataclass_enabled___block_invoke(uint64_t a1, char a2, id obj)
{
  NSObject *v4;
  os_log_t oslog;
  id v6[2];
  id location;
  char v8;
  uint64_t v9;
  uint8_t v10[40];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  v8 = a2 & 1;
  location = 0;
  objc_storeStrong(&location, obj);
  v6[1] = (id)a1;
  v4 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v4);

  if ((v8 & 1) == 0)
  {
    v6[0] = objc_loadWeakRetained((id *)(a1 + 40));
    if (v6[0])
    {
      if ((objc_msgSend(v6[0], "isFirstTimeSetup") & 1) == 0 || (*(_BYTE *)(a1 + 48) & 1) != 0)
      {
        if (location)
          objc_msgSend(*((id *)v6[0] + 183), "setObject:forKey:", location, *(_QWORD *)(a1 + 32));
        else
          objc_msgSend(*((id *)v6[0] + 183), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
      }
      else
      {
        oslog = (os_log_t)_ACUILogSystem();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v10, (uint64_t)"-[ACUIDataclassConfigurationViewController setDataclass:enabled:]_block_invoke", 806, *(_QWORD *)(a1 + 32));
          _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUIDCVC: Clearing any accumulated actions for dataclass %{public}@\", v10, 0x1Cu);
        }
        objc_storeStrong((id *)&oslog, 0);
        objc_msgSend(*((id *)v6[0] + 183), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
      }
    }
    objc_storeStrong(v6, 0);
  }
  objc_storeStrong(&location, 0);
}

- (void)_setDataclass:(id)a3 enabled:(BOOL)a4 onAccount:(id)a5 completion:(id)a6
{
  NSObject *queue;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  ACUIDataclassConfigurationViewController *v17;
  id v18;
  BOOL v19;
  id v20;
  id v21;
  BOOL v22;
  id location[2];
  ACUIDataclassConfigurationViewController *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21 = 0;
  objc_storeStrong(&v21, a5);
  v20 = 0;
  objc_storeStrong(&v20, a6);
  queue = dispatch_get_global_queue(2, 0);
  v10 = MEMORY[0x1E0C809B0];
  v11 = -1073741824;
  v12 = 0;
  v13 = __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke;
  v14 = &unk_1E9A15478;
  v19 = v22;
  v15 = location[0];
  v16 = v21;
  v17 = v24;
  v18 = v20;
  dispatch_async(queue, &v10);

  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  ACUIDataclassActionPicker *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  const __CFString *v10;
  NSObject *v11;
  NSObject *queue;
  BOOL v13;
  id v14;
  id v15;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  BOOL v24;
  uint64_t v25;
  int v26;
  int v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  char v32;
  id v33;
  char v34;
  id v35;
  os_log_type_t v36;
  os_log_t v37;
  char v38;
  os_log_type_t v39;
  os_log_t v40;
  ACUIDataclassActionPicker *v41;
  os_log_type_t v42;
  os_log_t v43;
  BOOL v44;
  id v45;
  os_log_type_t v46;
  os_log_t v47;
  id obj;
  id v49;
  id v50;
  os_log_type_t type;
  os_log_t oslog[3];
  uint8_t v53[48];
  uint8_t v54[48];
  uint8_t v55[32];
  uint8_t v56[32];
  uint8_t v57[56];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  oslog[2] = (os_log_t)a1;
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)_ACUILogSystem();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    if ((*(_BYTE *)(a1 + 64) & 1) != 0)
      v1 = CFSTR("Enabling");
    else
      v1 = CFSTR("Disabling");
    __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_64((uint64_t)v57, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 823, (uint64_t)v1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    _os_log_debug_impl(&dword_1D573D000, oslog[0], type, "%s (%d) \"ACUIDCVC: %{public}@ dataclass toggle %{public}@ for account %@.\", v57, 0x30u);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_msgSend(*(id *)(a1 + 40), "setEnabled:forDataclass:", *(_BYTE *)(a1 + 64) & 1, *(_QWORD *)(a1 + 32));
  v50 = 0;
  v49 = MEMORY[0x1E0C9AA60];
  if ((objc_msgSend(*(id *)(a1 + 48), "isFirstTimeSetup") & 1) != 0 && (*(_BYTE *)(a1 + 64) & 1) != 1)
  {
    v47 = (os_log_t)_ACUILogSystem();
    v46 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_66((uint64_t)v56, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 835, *(_QWORD *)(a1 + 32));
      _os_log_debug_impl(&dword_1D573D000, v47, v46, "%s (%d) \"ACUIDCVC: Disabling dataclass %{public}@ during first time setup, skipping requesting actions\", v56, 0x1Cu);
    }
    objc_storeStrong((id *)&v47, 0);
  }
  else
  {
    v15 = (id)objc_msgSend(*(id *)(a1 + 48), "accountOperationsHelper");
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 32);
    obj = v50;
    v14 = (id)objc_msgSend(v15, "dataclassActionsForAccountSave:forDataclass:error:", v2, v3, &obj);
    objc_storeStrong(&v50, obj);
    v4 = v49;
    v49 = v14;

  }
  v45 = 0;
  v44 = 1;
  if (v50)
  {
    v43 = (os_log_t)_ACUILogSystem();
    v42 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v55, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 842, (uint64_t)v50);
      _os_log_error_impl(&dword_1D573D000, v43, v42, "%s (%d) \"ACUIDCVC: Error returned for dataclassActionsForAccountSave: %@\", v55, 0x1Cu);
    }
    objc_storeStrong((id *)&v43, 0);
  }
  else if ((unint64_t)objc_msgSend(v49, "count") <= 1)
  {
    if (objc_msgSend(v49, "count") == 1)
    {
      v8 = (id)objc_msgSend(v49, "lastObject");
      v9 = v45;
      v45 = v8;

    }
    else
    {
      v44 = objc_msgSend(v49, "count") != 0;
    }
  }
  else
  {
    v5 = [ACUIDataclassActionPicker alloc];
    v41 = -[ACUIDataclassActionPicker initWithActions:affectingAccount:](v5, "initWithActions:affectingAccount:", v49, *(_QWORD *)(a1 + 40));
    -[ACUIDataclassActionPicker addAffectedDataclass:](v41, "addAffectedDataclass:", *(_QWORD *)(a1 + 32));
    v6 = -[ACUIDataclassActionPicker showInViewController:](v41, "showInViewController:", *(_QWORD *)(a1 + 48));
    v7 = v45;
    v45 = v6;

    objc_storeStrong((id *)&v41, 0);
  }
  if (v45 && objc_msgSend(v45, "type"))
  {
    v40 = (os_log_t)_ACUILogSystem();
    v39 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_32_4_0_8_66_8_66((uint64_t)v54, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 855, (uint64_t)v45, *(_QWORD *)(a1 + 32));
      _os_log_debug_impl(&dword_1D573D000, v40, v39, "%s (%d) \"ACUIDCVC: Setting action %{public}@ for dataclass %{public}@\", v54, 0x26u);
    }
    objc_storeStrong((id *)&v40, 0);
    v44 = 0;
  }
  if (v44)
  {
    v38 = 0;
    v38 = (*(_BYTE *)(a1 + 64) ^ 1) & 1;
    v37 = (os_log_t)_ACUILogSystem();
    v36 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      if ((v38 & 1) != 0)
        v10 = CFSTR("Re-enabling");
      else
        v10 = CFSTR("Re-disabling");
      __os_log_helper_16_2_5_8_32_4_0_8_66_8_66_8_64((uint64_t)v53, (uint64_t)"-[ACUIDataclassConfigurationViewController _setDataclass:enabled:onAccount:completion:]_block_invoke", 861, (uint64_t)v10, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      _os_log_debug_impl(&dword_1D573D000, v37, v36, "%s (%d) \"ACUIDCVC: %{public}@ dataclass toggle %{public}@ for account %@.\", v53, 0x30u);
    }
    objc_storeStrong((id *)&v37, 0);
    objc_msgSend(*(id *)(a1 + 40), "setEnabled:forDataclass:", v38 & 1, *(_QWORD *)(a1 + 32));
    v34 = 0;
    v32 = 0;
    v13 = 0;
    if (objc_msgSend(v49, "count") == 1)
    {
      v13 = 0;
      if (v45)
      {
        v35 = (id)objc_msgSend(v45, "undoAlertTitle");
        v34 = 1;
        v13 = 0;
        if (v35)
        {
          v33 = (id)objc_msgSend(v45, "undoAlertMessage");
          v32 = 1;
          v13 = v33 != 0;
        }
      }
    }
    if ((v32 & 1) != 0)

    if ((v34 & 1) != 0)
    if (v13)
    {
      queue = MEMORY[0x1E0C80D38];
      v25 = MEMORY[0x1E0C809B0];
      v26 = -1073741824;
      v27 = 0;
      v28 = __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke_131;
      v29 = &unk_1E9A15508;
      v30 = *(id *)(a1 + 48);
      v31 = v45;
      dispatch_async(queue, &v25);

      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v30, 0);
    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
    v11 = MEMORY[0x1E0C80D38];
    v17 = MEMORY[0x1E0C809B0];
    v18 = -1073741824;
    v19 = 0;
    v20 = __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke_2;
    v21 = &unk_1E9A153B0;
    v23 = *(id *)(a1 + 56);
    v24 = v44;
    v22 = v45;
    dispatch_async(v11, &v17);

    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
}

void __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke_131(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "undoAlertTitle");
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "undoAlertMessage");
  objc_msgSend(v2, "_presentUndoAlert:reason:", v4);

}

uint64_t __87__ACUIDataclassConfigurationViewController__setDataclass_enabled_onAccount_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

- (void)_presentUndoAlert:(id)a3 reason:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  ACUIDataclassConfigurationViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = (id)objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", location[0], v11, 1);
  v6 = v10;
  v5 = (void *)MEMORY[0x1E0CEA2E0];
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E9A15E98, CFSTR("Localizable"));
  v7 = (id)objc_msgSend(v5, "actionWithTitle:style:handler:");
  objc_msgSend(v6, "addAction:");

  -[ACUIDataclassConfigurationViewController presentViewController:animated:completion:](v13, "presentViewController:animated:completion:", v10, 1, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (id)_orderDataclassList:(id)a3
{
  id v4;
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F430]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F430]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3D8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3D8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3D0]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3D0]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F388]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F388]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F378]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F378]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F400]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F400]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F368]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F368]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3B8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3B8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3F8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3F8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3F0]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3F0]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3B0]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3B0]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F418]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F418]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3C0]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3C0]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3C8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3C8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F360]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F360]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3A8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3A8]);
  if ((objc_msgSend(location[0], "containsObject:", *MEMORY[0x1E0C8F3E8]) & 1) != 0)
    objc_msgSend(v5, "addObject:", *MEMORY[0x1E0C8F3E8]);
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_accountIdentifier
{
  NSString *v2;
  NSString *accountIdentifier;
  id v5;
  id v6[2];
  ACUIDataclassConfigurationViewController *v7;

  v7 = self;
  v6[1] = (id)a2;
  if (!self->_accountIdentifier)
  {
    v5 = (id)-[ACUIDataclassConfigurationViewController specifier](v7, "specifier");
    v6[0] = (id)objc_msgSend(v5, "userInfo");

    v2 = (NSString *)(id)objc_msgSend(v6[0], "objectForKey:", CFSTR("ACUISpecifierAccountIdentifier"));
    accountIdentifier = v7->_accountIdentifier;
    v7->_accountIdentifier = v2;

    objc_storeStrong(v6, 0);
  }
  return v7->_accountIdentifier;
}

- (ACAccount)account
{
  ACAccount *v2;
  ACAccount *account;
  ACAccount *v4;
  ACAccount *v5;
  ACAccountStore *v7;
  id v8;
  BOOL v9;
  char v10;
  id v11;
  id location[2];
  ACUIDataclassConfigurationViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  if (!self->_account)
  {
    v8 = (id)-[ACUIDataclassConfigurationViewController specifier](v13, "specifier");
    location[0] = (id)objc_msgSend(v8, "userInfo");

    v2 = (ACAccount *)(id)objc_msgSend(location[0], "objectForKey:", CFSTR("account"));
    account = v13->_account;
    v13->_account = v2;

    v10 = 0;
    v9 = 0;
    if (!v13->_account)
    {
      v11 = -[ACUIDataclassConfigurationViewController _accountIdentifier](v13, "_accountIdentifier");
      v10 = 1;
      v9 = v11 != 0;
    }
    if ((v10 & 1) != 0)

    if (v9)
    {
      v7 = -[ACUIViewController accountStore](v13, "accountStore");
      v4 = -[ACAccountStore accountWithIdentifier:](v7, "accountWithIdentifier:", v13->_accountIdentifier);
      v5 = v13->_account;
      v13->_account = v4;

    }
    if (v13->_account && -[ACUIDataclassConfigurationViewController isFirstTimeSetup](v13, "isFirstTimeSetup"))
      -[ACUIDataclassConfigurationViewController _enableAllProvisionedDataclassesWithoutRequringUserInteraction](v13, "_enableAllProvisionedDataclassesWithoutRequringUserInteraction");
    objc_storeStrong(location, 0);
  }
  return v13->_account;
}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  NSObject *queue;
  objc_super v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(uint64_t);
  void *v11;
  ACUIDataclassConfigurationViewController *v12;
  id v13;
  id location[2];
  ACUIDataclassConfigurationViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  queue = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __77__ACUIDataclassConfigurationViewController_operationsHelper_willSaveAccount___block_invoke;
  v11 = &unk_1E9A155C8;
  v12 = v15;
  dispatch_async(queue, &v7);

  v6.receiver = v15;
  v6.super_class = (Class)ACUIDataclassConfigurationViewController;
  -[ACUIViewController operationsHelper:willSaveAccount:](&v6, sel_operationsHelper_willSaveAccount_, location[0], v13);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __77__ACUIDataclassConfigurationViewController_operationsHelper_willSaveAccount___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFirstTimeSetup") & 1) == 1)
  {
    v1 = *(void **)(a1 + 32);
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ADDING_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
    objc_msgSend(v1, "startValidationWithPrompt:");

  }
}

- (id)operationsHelper:(id)a3 desiredDataclassActionFromPicker:(id)a4
{
  id v5;
  char v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  ACUIDataclassConfigurationViewController *v14;
  id v15;
  BOOL v16;
  ACUIDataclassConfigurationViewController *v17;
  id v18;
  BOOL v19;
  _QWORD __b[8];
  uint64_t v22;
  int v23;
  objc_super v24;
  id v25;
  id v26;
  id location[2];
  ACUIDataclassConfigurationViewController *v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  if ((objc_msgSend(location[0], "isRemovingAccount") & 1) != 0)
    v28->_didShowDataclassActionPickerDuringRemoval = 1;
  v24.receiver = v28;
  v24.super_class = (Class)ACUIDataclassConfigurationViewController;
  v25 = -[ACUIViewController operationsHelper:desiredDataclassActionFromPicker:](&v24, sel_operationsHelper_desiredDataclassActionFromPicker_, location[0], v26);
  if (!objc_msgSend(v25, "type"))
  {
    if ((objc_msgSend(location[0], "isRemovingAccount") & 1) == 0)
    {
      memset(__b, 0, sizeof(__b));
      v12 = (id)objc_msgSend(v26, "affectedDataclasses");
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
      if (v13)
      {
        v9 = *(_QWORD *)__b[2];
        v10 = 0;
        v11 = v13;
        while (1)
        {
          v8 = v10;
          if (*(_QWORD *)__b[2] != v9)
            objc_enumerationMutation(v12);
          v22 = *(_QWORD *)(__b[1] + 8 * v10);
          v5 = (id)objc_msgSend(v26, "affectedAccount");
          v6 = objc_msgSend(v5, "isEnabledForDataclass:", v22);

          v7 = (id)objc_msgSend(v26, "affectedAccount");
          objc_msgSend(v7, "setEnabled:forDataclass:", !(v6 & 1), v22);

          ++v10;
          if (v8 + 1 >= v11)
          {
            v10 = 0;
            v11 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
            if (!v11)
              break;
          }
        }
      }

    }
    goto LABEL_20;
  }
  if (objc_msgSend(v25, "type") != 4
    || (v17 = v28,
        v18 = (id)objc_msgSend(v26, "affectedDataclasses"),
        v19 = -[ACUIDataclassConfigurationViewController _confirmKeepLocalDataForDataclasses:](v17, "_confirmKeepLocalDataForDataclasses:"), v18, v19))
  {
    if (objc_msgSend(v25, "type") != 6
      || (v14 = v28,
          v15 = (id)objc_msgSend(v26, "affectedDataclasses"),
          v16 = -[ACUIDataclassConfigurationViewController _confirmDeleteLocalDataForDataclasses:](v14, "_confirmDeleteLocalDataForDataclasses:"), v15, v16))
    {
      if (objc_msgSend(v25, "type") == 2)
        v28->_isMergingSyncData = 1;
LABEL_20:
      v29 = v25;
      v23 = 1;
      goto LABEL_21;
    }
  }
  v29 = (id)objc_msgSend(MEMORY[0x1E0C8F2D0], "actionWithType:", 0);
  v23 = 1;
LABEL_21:
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  return v29;
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  NSObject *queue;
  objc_super v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  ACUIDataclassConfigurationViewController *v16;
  id v17;
  BOOL v18;
  id v19;
  id location[2];
  ACUIDataclassConfigurationViewController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v19 = 0;
  objc_storeStrong(&v19, a4);
  v18 = a5;
  v17 = 0;
  objc_storeStrong(&v17, a6);
  queue = MEMORY[0x1E0C80D38];
  v11 = MEMORY[0x1E0C809B0];
  v12 = -1073741824;
  v13 = 0;
  v14 = __94__ACUIDataclassConfigurationViewController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke;
  v15 = &unk_1E9A155C8;
  v16 = v21;
  dispatch_async(queue, &v11);

  v10.receiver = v21;
  v10.super_class = (Class)ACUIDataclassConfigurationViewController;
  -[ACUIViewController operationsHelper:didSaveAccount:withSuccess:error:](&v10, sel_operationsHelper_didSaveAccount_withSuccess_error_, location[0], v19, v18, v17);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

uint64_t __94__ACUIDataclassConfigurationViewController_operationsHelper_didSaveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFirstTimeSetup") & 1) != 1)
    return objc_msgSend(*(id *)(a1 + 32), "hideActivityInProgressUIWithDelay:", 0.0);
  v2 = *(void **)(a1 + 32);
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_ADDED"), &stru_1E9A15E98, CFSTR("Localizable"));
  objc_msgSend(v2, "stopValidationWithPrompt:showButtons:");

  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__notifyOfAccountSetupCompletion, 0, 1.0);
}

- (void)_notifyOfAccountSetupCompletion
{
  ACAccount *v2;
  id v3;
  id v4;
  char v5;
  void (**v6)(id, uint64_t);
  id v7;

  v7 = -[ACUIDataclassConfigurationViewController configurationCompletion](self, "configurationCompletion");

  if (v7)
  {
    v6 = (void (**)(id, uint64_t))-[ACUIDataclassConfigurationViewController configurationCompletion](self, "configurationCompletion");
    v6[2](v6, 1);

    -[ACUIDataclassConfigurationViewController setConfigurationCompletion:](self, "setConfigurationCompletion:", 0);
  }
  else
  {
    v4 = (id)-[ACUIDataclassConfigurationViewController rootController](self, "rootController");
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      v3 = (id)-[ACUIDataclassConfigurationViewController rootController](self, "rootController");
      v2 = -[ACUIDataclassConfigurationViewController account](self, "account");
      objc_msgSend(v3, "controller:didFinishSettingUpAccount:", self);

    }
  }
}

- (BOOL)_isShowingDeleteAccountButton
{
  id v2;
  BOOL v4;

  v2 = (id)-[ACUIDataclassConfigurationViewController specifierForID:](self, "specifierForID:", CFSTR("ACUIDeleteButtonSpecifierID"));
  v4 = v2 != 0;

  return v4;
}

- (void)appendDeleteAccountButton
{
  PSSpecifier *v2;
  PSSpecifier *deleteButtonSpecifier;
  id v4;
  void *v5;
  id v6;

  if (!-[ACUIDataclassConfigurationViewController _isShowingDeleteAccountButton](self, "_isShowingDeleteAccountButton"))
  {
    -[ACUIDataclassConfigurationViewController setShouldShowDeleteAccountButton:](self, "setShouldShowDeleteAccountButton:", 1);
    v4 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    -[ACUIDataclassConfigurationViewController addSpecifier:](self, "addSpecifier:");

    v5 = (void *)MEMORY[0x1E0D804E8];
    v6 = -[ACUIDataclassConfigurationViewController titleForDeleteButton](self, "titleForDeleteButton");
    v2 = (PSSpecifier *)(id)objc_msgSend(v5, "deleteButtonSpecifierWithName:target:action:");
    deleteButtonSpecifier = self->_deleteButtonSpecifier;
    self->_deleteButtonSpecifier = v2;

    -[PSSpecifier setProperty:forKey:](self->_deleteButtonSpecifier, "setProperty:forKey:", CFSTR("ACUIDeleteButtonSpecifierID"), *MEMORY[0x1E0D80868]);
    -[ACUIDataclassConfigurationViewController addSpecifier:](self, "addSpecifier:", self->_deleteButtonSpecifier);
  }
}

- (void)deleteButtonTapped:(id)a3
{
  ACAccount *v3;
  ACUIAccountOperationsHelper *v4;
  id location[2];
  ACUIDataclassConfigurationViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[ACUIViewController accountOperationsHelper](v6, "accountOperationsHelper");
  v3 = -[ACUIDataclassConfigurationViewController account](v6, "account");
  -[ACUIAccountOperationsHelper removeAccount:](v4, "removeAccount:");

  objc_storeStrong(location, 0);
}

- (BOOL)operationsHelper:(id)a3 shouldRemoveAccount:(id)a4
{
  BOOL v5;
  char v7;
  ACAccount *v8;
  char v9;
  id v10;
  char v11;
  id v12;
  id location[2];
  ACUIDataclassConfigurationViewController *v14;
  char v15;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  if (v14->_didShowDataclassActionPickerDuringRemoval)
  {
    v14->_didShowDataclassActionPickerDuringRemoval = 0;
    v15 = 1;
  }
  else
  {
    v11 = -[ACUIDataclassConfigurationViewController _promptUserToConfirmAccountDeletion](v14, "_promptUserToConfirmAccountDeletion");
    v9 = 0;
    v7 = 0;
    v5 = 0;
    if (v11)
    {
      v5 = 0;
      if ((ACDAccountSyncEnabled() & 1) != 0)
      {
        v10 = (id)ACDAccountSyncDevices();
        v9 = 1;
        v5 = 0;
        if (objc_msgSend(v10, "count"))
        {
          v8 = -[ACUIDataclassConfigurationViewController account](v14, "account");
          v7 = 1;
          v5 = 0;
          if ((ACDAccountSyncAccountIsSyncable() & 1) != 0)
            v5 = -[ACUIDataclassConfigurationViewController isAppleMailAccount:](v14, "isAppleMailAccount:", v12);
        }
      }
    }
    if ((v7 & 1) != 0)

    if ((v9 & 1) != 0)
    if (v5)
      v11 = -[ACUIDataclassConfigurationViewController _confirmSyncDelete](v14, "_confirmSyncDelete");
    v15 = v11;
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v15 & 1;
}

- (int64_t)operationsHelper:(id)a3 shouldRemoveOrDisableAccount:(id)a4
{
  os_log_t oslog;
  uint64_t v7;
  int v8;
  id v9;
  id location[2];
  ACUIDataclassConfigurationViewController *v11;
  int64_t v12;
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  if (v11->_didShowDataclassActionPickerDuringRemoval)
  {
    v11->_didShowDataclassActionPickerDuringRemoval = 0;
    v12 = (int64_t)&stru_1E9A15E98;
    v8 = 1;
  }
  else
  {
    v7 = -[ACUIDataclassConfigurationViewController _promptUserToConfirmAccountSyncDeletion](v11, "_promptUserToConfirmAccountSyncDeletion");
    oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_0((uint64_t)v13, (uint64_t)"-[ACUIDataclassConfigurationViewController operationsHelper:shouldRemoveOrDisableAccount:]", 1139, v7);
      _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"The button index returned was %ld\", v13, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v7)
    {
      if (v7 != 1)
        goto LABEL_14;
      if (!-[ACUIDataclassConfigurationViewController isAppleMailAccount:](v11, "isAppleMailAccount:", v9))
      {
        v12 = 2;
        v8 = 1;
        goto LABEL_15;
      }
      if (!-[ACUIDataclassConfigurationViewController _confirmSyncDelete](v11, "_confirmSyncDelete"))
      {
LABEL_14:
        v12 = 0;
        v8 = 1;
        goto LABEL_15;
      }
      v12 = 2;
      v8 = 1;
    }
    else
    {
      v12 = 1;
      v8 = 1;
    }
  }
LABEL_15:
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (BOOL)_promptUserToConfirmAccountDeletion
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  char v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  char IsSyncable;
  uint64_t v19;
  int v20;
  int v21;
  void (*v22)(uint64_t);
  void *v23;
  ACUIDataclassConfigurationViewController *v24;
  id v25;
  id v26;
  id v27[2];
  id v28;
  char v29;
  ACAccount *v30;
  char v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int v37;
  int v38;
  char v39;
  SEL v40;
  ACUIDataclassConfigurationViewController *v41;
  _QWORD v42[2];
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v41 = self;
  v40 = a2;
  v35 = 0;
  v36 = &v35;
  v37 = 0x20000000;
  v38 = 32;
  v39 = 0;
  v34 = 0;
  v33 = 0;
  v31 = 0;
  v29 = 0;
  IsSyncable = 0;
  if ((ACDAccountSyncEnabled() & 1) != 0)
  {
    v32 = (id)ACDAccountSyncDevices();
    v31 = 1;
    IsSyncable = 0;
    if (objc_msgSend(v32, "count"))
    {
      v30 = -[ACUIDataclassConfigurationViewController account](v41, "account");
      v29 = 1;
      IsSyncable = ACDAccountSyncAccountIsSyncable();
    }
  }
  if ((v29 & 1) != 0)

  if ((v31 & 1) != 0)
  if ((IsSyncable & 1) != 0)
  {
    v17 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_SYNC"), &stru_1E9A15E98, CFSTR("Localizable"));
    v43[0] = v16;
    v15 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
    v43[1] = v14;
    v2 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v3 = v34;
    v34 = v2;

    v4 = -[ACUIDataclassConfigurationViewController deviceMessage](v41, "deviceMessage");
  }
  else
  {
    v13 = -[ACUIDataclassConfigurationViewController titleForDeleteButton](v41, "titleForDeleteButton");
    v42[0] = v13;
    v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
    v42[1] = v11;
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v7 = v34;
    v34 = v6;

    v4 = -[ACUIDataclassConfigurationViewController messageForAccountDeletionWarning](v41, "messageForAccountDeletionWarning");
  }
  v5 = v33;
  v33 = v4;

  v28 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E0C80D38];
  v19 = MEMORY[0x1E0C809B0];
  v20 = -1073741824;
  v21 = 0;
  v22 = __79__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountDeletion__block_invoke;
  v23 = &unk_1E9A159C0;
  v24 = v41;
  v25 = v34;
  v26 = v33;
  v27[1] = &v35;
  v27[0] = v28;
  dispatch_async(queue, &v19);

  dispatch_semaphore_wait((dispatch_semaphore_t)v28, 0xFFFFFFFFFFFFFFFFLL);
  v9 = *((_BYTE *)v36 + 24);
  objc_storeStrong(v27, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  _Block_object_dispose(&v35, 8);
  return v9 & 1;
}

void __79__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountDeletion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  intptr_t (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  id v12[4];

  v12[3] = (id)a1;
  v12[2] = (id)a1;
  v4 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v5 = (id)objc_msgSend(v4, "titleForDeleteButton");
  v3 = *(_QWORD *)(a1 + 48);
  v6 = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __79__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountDeletion__block_invoke_2;
  v10 = &unk_1E9A15338;
  v12[1] = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 40);
  v12[0] = *(id *)(a1 + 56);
  objc_msgSend(v4, "showConfirmationWithButtons:title:message:destructive:completion:", v2, v5, v3, 1);

  objc_storeStrong(v12, 0);
  objc_storeStrong(&v11, 0);
}

intptr_t __79__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountDeletion__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2 != objc_msgSend(*(id *)(a1 + 32), "count") - 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int64_t)_promptUserToConfirmAccountSyncDeletion
{
  int64_t v3;
  NSObject *queue;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  ACUIDataclassConfigurationViewController *v16;
  id v17;
  id v18;
  id v19[2];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  int v25;
  int v26;
  uint64_t v27;
  SEL v28;
  ACUIDataclassConfigurationViewController *v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v29 = self;
  v28 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x20000000;
  v26 = 32;
  v27 = 0;
  v10 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TURN_OFF"), &stru_1E9A15E98, CFSTR("Localizable"));
  v30[0] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_SYNC"), &stru_1E9A15E98, CFSTR("Localizable"));
  v30[1] = v7;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
  v30[2] = v5;
  v22 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);

  v21 = -[ACUIDataclassConfigurationViewController deviceMessage](v29, "deviceMessage");
  v20 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E0C80D38];
  v11 = MEMORY[0x1E0C809B0];
  v12 = -1073741824;
  v13 = 0;
  v14 = __83__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountSyncDeletion__block_invoke;
  v15 = &unk_1E9A159C0;
  v16 = v29;
  v17 = v22;
  v18 = v21;
  v19[1] = &v23;
  v19[0] = v20;
  dispatch_async(queue, &v11);

  dispatch_semaphore_wait((dispatch_semaphore_t)v20, 0xFFFFFFFFFFFFFFFFLL);
  v3 = v24[3];
  objc_storeStrong(v19, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  _Block_object_dispose(&v23, 8);
  return v3;
}

void __83__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountSyncDeletion__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  intptr_t (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12[4];

  v12[3] = (id)a1;
  v12[2] = (id)a1;
  v4 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT"), &stru_1E9A15E98, CFSTR("Localizable"));
  v3 = *(_QWORD *)(a1 + 48);
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __83__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountSyncDeletion__block_invoke_2;
  v11 = &unk_1E9A159E8;
  v12[1] = *(id *)(a1 + 64);
  v12[0] = *(id *)(a1 + 56);
  objc_msgSend(v4, "showConfirmationWithButtons:title:message:destructive:completion:", v2, v5, v3, 1);

  objc_storeStrong(v12, 0);
}

intptr_t __83__ACUIDataclassConfigurationViewController__promptUserToConfirmAccountSyncDeletion__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)deviceMessage
{
  id v2;
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  id location;
  id v28;
  SEL v29;
  ACUIDataclassConfigurationViewController *v30;
  id v31;

  v30 = self;
  v29 = a2;
  v28 = (id)ACDAccountSyncDevices();
  location = (id)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v28);
  if (!objc_msgSend(location, "count") && !objc_msgSend(location, "count"))
  {
    v18 = (id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", v29, v30, CFSTR("ACUIDataclassConfigurationViewController.m"), 1220, CFSTR("No devices found for Account Sync Delete UI %@."), objc_opt_class());

  }
  if (objc_msgSend(location, "count") == 1)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    v17 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (id)objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_SYNC_WARNING_FORMAT_ONE_DEVICE"));
    v15 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (id)objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DATA"), &stru_1E9A15E98, CFSTR("Localizable"));
    v13 = (id)objc_msgSend(location, "allObjects");
    v12 = (id)objc_msgSend(v13, "firstObject");
    v31 = (id)objc_msgSend(v11, "stringWithFormat:", v16, v14, v12);

  }
  else
  {
    v2 = (id)objc_msgSend(location, "allObjects");
    v3 = v28;
    v28 = v2;

    v10 = (void *)MEMORY[0x1E0CB3940];
    v25 = 0;
    v23 = 0;
    v21 = 0;
    v19 = 0;
    if (objc_msgSend(location, "count") == 2)
    {
      v26 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v25 = 1;
      v24 = (id)objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_SYNC_WARNING_FORMAT_TWO_DEVICES"), &stru_1E9A15E98, CFSTR("Localizable"));
      v23 = 1;
      v9 = v24;
    }
    else
    {
      v22 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = 1;
      v20 = (id)objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("DELETE_ACCOUNT_SYNC_WARNING_FORMAT_THREE_OR_MORE_DEVICES"), &stru_1E9A15E98, CFSTR("Localizable"));
      v19 = 1;
      v9 = v20;
    }
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DATA"), &stru_1E9A15E98, CFSTR("Localizable"));
    v6 = (id)objc_msgSend(v28, "objectAtIndex:", 0);
    v5 = (id)objc_msgSend(v28, "objectAtIndex:", 1);
    v31 = (id)objc_msgSend(v10, "stringWithFormat:", v9, v7, v6, v5);

    if ((v19 & 1) != 0)
    if ((v21 & 1) != 0)

    if ((v23 & 1) != 0)
    if ((v25 & 1) != 0)

  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v28, 0);
  return v31;
}

- (BOOL)isAppleMailAccount:(id)a3
{
  char v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  id location[3];
  char v26;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = (id)objc_msgSend(location[0], "accountType");
  v17 = (id)objc_msgSend(v16, "identifier");
  v3 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0C8F0D0]);
  v23 = 0;
  v21 = 0;
  v18 = 1;
  if ((v3 & 1) == 0)
  {
    v24 = (id)objc_msgSend(location[0], "accountType");
    v23 = 1;
    v22 = (id)objc_msgSend(v24, "identifier");
    v21 = 1;
    v18 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0C8F0D8]);
  }
  if ((v21 & 1) != 0)

  if ((v23 & 1) != 0)
  if ((v18 & 1) != 0)
  {
    v20 = &unk_1E9A1E5C8;
    v19 = 0;
    v14 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF90]);
    v15 = objc_msgSend(v14, "length");

    if (v15)
    {
      v13 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF90]);
      v4 = (id)objc_msgSend(v13, "lowercaseString");
      v5 = v19;
      v19 = v4;

    }
    else
    {
      v11 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF50]);
      v12 = objc_msgSend(v11, "length");

      if (v12)
      {
        v10 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF50]);
        v6 = (id)objc_msgSend(v10, "lowercaseString");
        v7 = v19;
        v19 = v6;

      }
    }
    v26 = objc_msgSend(v20, "containsObject:", v19, &v19) & 1;
    objc_storeStrong(v9, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v26 = 0;
  }
  objc_storeStrong(location, 0);
  return v26 & 1;
}

- (void)operationsHelper:(id)a3 willRemoveAccount:(id)a4
{
  NSObject *queue;
  objc_super v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  ACUIDataclassConfigurationViewController *v12;
  id v13;
  id location[2];
  ACUIDataclassConfigurationViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  queue = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __79__ACUIDataclassConfigurationViewController_operationsHelper_willRemoveAccount___block_invoke;
  v11 = &unk_1E9A155C8;
  v12 = v15;
  dispatch_async(queue, &v7);

  v6.receiver = v15;
  v6.super_class = (Class)ACUIDataclassConfigurationViewController;
  -[ACUIViewController operationsHelper:willRemoveAccount:](&v6, sel_operationsHelper_willRemoveAccount_, location[0], v13);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __79__ACUIDataclassConfigurationViewController_operationsHelper_willRemoveAccount___block_invoke(id *a1)
{
  id v1;
  id v2;
  id v3;
  id v5[3];

  v5[2] = a1;
  v5[1] = a1;
  if ((*((_BYTE *)a1[4] + 1472) & 1) == 1)
  {
    v1 = a1[4];
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SAVING"), &stru_1E9A15E98, CFSTR("Localizable"));
    objc_msgSend(v1, "showActivityInProgressUIWithMessage:");

  }
  else
  {
    v5[0] = (id)objc_msgSend(a1[4], "messageForAccountDeletionProgressUI");
    objc_msgSend(a1[4], "showActivityInProgressUIWithMessage:", v5[0]);
    objc_storeStrong(v5, 0);
  }
}

- (void)operationsHelper:(id)a3 didRemoveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  NSObject *queue;
  objc_super v10;
  uint64_t v11;
  int v12;
  int v13;
  void (*v14)(uint64_t);
  void *v15;
  ACUIDataclassConfigurationViewController *v16;
  BOOL v17;
  id v18;
  BOOL v19;
  id v20;
  id location[2];
  ACUIDataclassConfigurationViewController *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = a5;
  v18 = 0;
  objc_storeStrong(&v18, a6);
  v22->_isMergingSyncData = 0;
  queue = MEMORY[0x1E0C80D38];
  v11 = MEMORY[0x1E0C809B0];
  v12 = -1073741824;
  v13 = 0;
  v14 = __96__ACUIDataclassConfigurationViewController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke;
  v15 = &unk_1E9A15298;
  v16 = v22;
  v17 = v19;
  dispatch_async(queue, &v11);

  v10.receiver = v22;
  v10.super_class = (Class)ACUIDataclassConfigurationViewController;
  -[ACUIViewController operationsHelper:didRemoveAccount:withSuccess:error:](&v10, sel_operationsHelper_didRemoveAccount_withSuccess_error_, location[0], v20, v19, v18);
  objc_storeStrong((id *)&v16, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

void __96__ACUIDataclassConfigurationViewController_operationsHelper_didRemoveAccount_withSuccess_error___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v10;
  id v11[3];

  v11[2] = (id)a1;
  v11[1] = (id)a1;
  objc_msgSend(*(id *)(a1 + 32), "hideActivityInProgressUI");
  if ((*(_BYTE *)(a1 + 40) & 1) == 0)
  {
    v1 = (void *)MEMORY[0x1E0CEA2E8];
    v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (id)objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("COULDNT_DELETE_ACCOUNT"));
    v3 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v2 = (id)objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("COULDNT_DELETE_ACCOUNT_DESCRIPTION"), &stru_1E9A15E98, CFSTR("Localizable"));
    v11[0] = (id)objc_msgSend(v1, "alertControllerWithTitle:message:preferredStyle:", v4);

    v6 = (void *)MEMORY[0x1E0CEA2E0];
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E9A15E98, CFSTR("Localizable"));
    v10 = (id)objc_msgSend(v6, "actionWithTitle:style:handler:");

    objc_msgSend(v11[0], "addAction:", v10);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v11[0], 1, 0);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(v11, 0);
  }
}

- (BOOL)_confirmKeepLocalDataForDataclasses:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  __CFString *v7;
  char v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  id v18;
  ACAccount *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  ACAccount *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  char IsSyncable;
  id v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  int v36;
  int v37;
  void (*v38)(uint64_t);
  void *v39;
  id v40;
  id v41;
  ACUIDataclassConfigurationViewController *v42;
  id v43;
  id v44[2];
  id v45;
  id v46;
  char v47;
  id v48;
  char v49;
  id v50;
  id v51;
  char v52;
  ACAccount *v53;
  char v54;
  id v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t *v60;
  int v61;
  int v62;
  char v63;
  id location[2];
  ACUIDataclassConfigurationViewController *v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[2] = *MEMORY[0x1E0C80C00];
  v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v59 = 0;
  v60 = &v59;
  v61 = 0x20000000;
  v62 = 32;
  v63 = 0;
  v34 = (id)objc_msgSend(location[0], "lastObject");
  v58 = +[ACUILocalization localizedTitleForDataclass:](ACUILocalization, "localizedTitleForDataclass:");

  v33 = (void *)MEMORY[0x1E0CB3940];
  v32 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v31 = (id)objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("REALLY_KEEP_EXISTING_DATA_WARNING_FORMAT_TITLE"), &stru_1E9A15E98, CFSTR("Localizable"));
  v57 = (id)objc_msgSend(v33, "stringWithFormat:", v58);

  v56 = 0;
  v54 = 0;
  v52 = 0;
  IsSyncable = 0;
  if ((ACDAccountSyncEnabled() & 1) != 0)
  {
    v55 = (id)ACDAccountSyncDevices();
    v54 = 1;
    IsSyncable = 0;
    if (objc_msgSend(v55, "count"))
    {
      v53 = -[ACUIDataclassConfigurationViewController account](v65, "account");
      v52 = 1;
      IsSyncable = ACDAccountSyncAccountIsSyncable();
    }
  }
  if ((v52 & 1) != 0)

  if ((v54 & 1) != 0)
  if ((IsSyncable & 1) != 0)
  {
    v29 = (void *)MEMORY[0x1E0CB3940];
    v28 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (id)objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("REALLY_KEEP_EXISTING_DATA_WARNING_ACCOUNT_SYNC_FORMAT"), &stru_1E9A15E98, CFSTR("Localizable"));
    v27 = location[0];
    v25 = -[ACUIDataclassConfigurationViewController account](v65, "account");
    v24 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v27, 0);
    v3 = (id)objc_msgSend(v29, "stringWithFormat:", v26, v24);
    v4 = v56;
    v56 = v3;

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    v22 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (id)objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("REALLY_KEEP_EXISTING_DATA_WARNING_FORMAT"), &stru_1E9A15E98, CFSTR("Localizable"));
    v21 = location[0];
    v19 = -[ACUIDataclassConfigurationViewController account](v65, "account");
    v18 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v21, 0);
    v5 = (id)objc_msgSend(v23, "stringWithFormat:", v20, v18);
    v6 = v56;
    v56 = v5;

  }
  v49 = 0;
  v47 = 0;
  v66 = 0;
  v16 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  v66 = v17;
  v15 = 1;
  if (v17 != 1)
    v15 = v66 == 5;
  if (v15)
  {
    v7 = CFSTR("KEEP");
  }
  else
  {
    v50 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v49 = 1;
    v48 = (id)objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("KEEP_LOCAL_DATA"), &stru_1E9A15E98, CFSTR("Localizable"));
    v47 = 1;
    v7 = (__CFString *)v48;
  }
  v51 = v7;
  if ((v47 & 1) != 0)

  if ((v49 & 1) != 0)
  v14 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", v51, &stru_1E9A15E98, CFSTR("Localizable"));
  v67[0] = v13;
  v12 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (id)objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
  v67[1] = v11;
  v46 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);

  v45 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E0C80D38];
  v35 = MEMORY[0x1E0C809B0];
  v36 = -1073741824;
  v37 = 0;
  v38 = __80__ACUIDataclassConfigurationViewController__confirmKeepLocalDataForDataclasses___block_invoke;
  v39 = &unk_1E9A15A38;
  v40 = v46;
  v44[1] = &v59;
  v41 = v45;
  v42 = v65;
  v43 = v57;
  v44[0] = v56;
  dispatch_async(queue, &v35);

  dispatch_semaphore_wait((dispatch_semaphore_t)v45, 0xFFFFFFFFFFFFFFFFLL);
  v9 = *((_BYTE *)v60 + 24);
  objc_storeStrong(v44, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong((id *)&v42, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  _Block_object_dispose(&v59, 8);
  objc_storeStrong(location, 0);
  return v9 & 1;
}

void __80__ACUIDataclassConfigurationViewController__confirmKeepLocalDataForDataclasses___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  intptr_t (*v5)(uint64_t, uint64_t);
  void *v6;
  id v7;
  id v8[2];
  id v9[3];

  v9[2] = (id)a1;
  v9[1] = (id)a1;
  v2 = MEMORY[0x1E0C809B0];
  v3 = -1073741824;
  v4 = 0;
  v5 = __80__ACUIDataclassConfigurationViewController__confirmKeepLocalDataForDataclasses___block_invoke_2;
  v6 = &unk_1E9A15A10;
  v7 = *(id *)(a1 + 32);
  v8[1] = *(id *)(a1 + 72);
  v8[0] = *(id *)(a1 + 40);
  v9[0] = (id)MEMORY[0x1D8277444]();
  objc_msgSend(*(id *)(a1 + 48), "showConfirmationWithButtons:title:message:destructive:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, v9[0]);
  objc_storeStrong(v9, 0);
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v7, 0);
}

intptr_t __80__ACUIDataclassConfigurationViewController__confirmKeepLocalDataForDataclasses___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 != objc_msgSend(*(id *)(a1 + 32), "count") - 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_confirmDeleteLocalDataForDataclasses:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  char v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  ACAccount *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  ACAccount *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  char IsSyncable;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  int v32;
  int v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id v37;
  ACUIDataclassConfigurationViewController *v38;
  id v39;
  id v40[2];
  id v41;
  id v42;
  char v43;
  ACAccount *v44;
  char v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t *v51;
  int v52;
  int v53;
  char v54;
  id location[2];
  ACUIDataclassConfigurationViewController *v56;
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  v56 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v50 = 0;
  v51 = &v50;
  v52 = 0x20000000;
  v53 = 32;
  v54 = 0;
  v30 = (id)objc_msgSend(location[0], "lastObject");
  v49 = +[ACUILocalization localizedTitleForDataclass:](ACUILocalization, "localizedTitleForDataclass:");

  v29 = (void *)MEMORY[0x1E0CB3940];
  v28 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v27 = (id)objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("REALLY_DELETE_EXISTING_DATA_WARNING_FORMAT_TITLE"), &stru_1E9A15E98, CFSTR("Localizable"));
  v48 = (id)objc_msgSend(v29, "stringWithFormat:", v49);

  v47 = 0;
  v45 = 0;
  v43 = 0;
  IsSyncable = 0;
  if ((ACDAccountSyncEnabled() & 1) != 0)
  {
    v46 = (id)ACDAccountSyncDevices();
    v45 = 1;
    IsSyncable = 0;
    if (objc_msgSend(v46, "count"))
    {
      v44 = -[ACUIDataclassConfigurationViewController account](v56, "account");
      v43 = 1;
      IsSyncable = ACDAccountSyncAccountIsSyncable();
    }
  }
  if ((v43 & 1) != 0)

  if ((v45 & 1) != 0)
  if ((IsSyncable & 1) != 0)
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    v24 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = (id)objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("REALLY_DELETE_EXISTING_DATA_WARNING_FORMAT_ACCOUNT_SYNC"), &stru_1E9A15E98, CFSTR("Localizable"));
    v23 = location[0];
    v21 = -[ACUIDataclassConfigurationViewController account](v56, "account");
    v20 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v23, 0);
    v3 = (id)objc_msgSend(v25, "stringWithFormat:", v22, v20);
    v4 = v47;
    v47 = v3;

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    v18 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (id)objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("REALLY_DELETE_EXISTING_DATA_WARNING_FORMAT"), &stru_1E9A15E98, CFSTR("Localizable"));
    v17 = location[0];
    v15 = -[ACUIDataclassConfigurationViewController account](v56, "account");
    v14 = +[ACUILocalization localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:](ACUILocalization, "localizedTextForDataclasses:usedAtBeginningOfSentence:forAccount:", v17, 0);
    v5 = (id)objc_msgSend(v19, "stringWithFormat:", v16, v14);
    v6 = v47;
    v47 = v5;

  }
  v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (id)objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E9A15E98, CFSTR("Localizable"));
  v57[0] = v12;
  v11 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E9A15E98, CFSTR("Localizable"));
  v57[1] = v10;
  v42 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);

  v41 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E0C80D38];
  v31 = MEMORY[0x1E0C809B0];
  v32 = -1073741824;
  v33 = 0;
  v34 = __82__ACUIDataclassConfigurationViewController__confirmDeleteLocalDataForDataclasses___block_invoke;
  v35 = &unk_1E9A15A38;
  v36 = v42;
  v40[1] = &v50;
  v37 = v41;
  v38 = v56;
  v39 = v48;
  v40[0] = v47;
  dispatch_async(queue, &v31);

  dispatch_semaphore_wait((dispatch_semaphore_t)v41, 0xFFFFFFFFFFFFFFFFLL);
  v8 = *((_BYTE *)v51 + 24);
  objc_storeStrong(v40, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong((id *)&v38, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v47, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v49, 0);
  _Block_object_dispose(&v50, 8);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

void __82__ACUIDataclassConfigurationViewController__confirmDeleteLocalDataForDataclasses___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  intptr_t (*v5)(uint64_t, uint64_t);
  void *v6;
  id v7;
  id v8[2];
  id v9[3];

  v9[2] = (id)a1;
  v9[1] = (id)a1;
  v2 = MEMORY[0x1E0C809B0];
  v3 = -1073741824;
  v4 = 0;
  v5 = __82__ACUIDataclassConfigurationViewController__confirmDeleteLocalDataForDataclasses___block_invoke_2;
  v6 = &unk_1E9A15A10;
  v7 = *(id *)(a1 + 32);
  v8[1] = *(id *)(a1 + 72);
  v8[0] = *(id *)(a1 + 40);
  v9[0] = (id)MEMORY[0x1D8277444]();
  objc_msgSend(*(id *)(a1 + 48), "showConfirmationWithButtons:title:message:destructive:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, v9[0]);
  objc_storeStrong(v9, 0);
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v7, 0);
}

intptr_t __82__ACUIDataclassConfigurationViewController__confirmDeleteLocalDataForDataclasses___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 != objc_msgSend(*(id *)(a1 + 32), "count") - 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_confirmSyncDelete
{
  NSObject *queue;
  char v4;
  uint64_t v5;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  NSObject *v11;
  ACUIDataclassConfigurationViewController *v12;
  __CFString *v13;
  id v14[2];
  dispatch_semaphore_t v15;
  id v16;
  id v17;
  __CFString *v18;
  uint64_t v19;
  uint64_t *v20;
  int v21;
  int v22;
  char v23;
  SEL v24;
  ACUIDataclassConfigurationViewController *v25;

  v25 = self;
  v24 = a2;
  v19 = 0;
  v20 = &v19;
  v21 = 0x20000000;
  v22 = 32;
  v23 = 0;
  v18 = CFSTR("(AppleInternal) Are you sure you want to delete your Apple Mail account EVERYWHERE?");
  v17 = -[ACUIDataclassConfigurationViewController deviceMessage](v25, "deviceMessage");
  v16 = &unk_1E9A1E5E0;
  v15 = dispatch_semaphore_create(0);
  queue = MEMORY[0x1E0C80D38];
  v5 = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __62__ACUIDataclassConfigurationViewController__confirmSyncDelete__block_invoke;
  v9 = &unk_1E9A15A38;
  v10 = v16;
  v14[1] = &v19;
  v11 = v15;
  v12 = v25;
  v13 = v18;
  v14[0] = v17;
  dispatch_async(queue, &v5);

  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  v4 = *((_BYTE *)v20 + 24);
  objc_storeStrong(v14, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong((id *)&v18, 0);
  _Block_object_dispose(&v19, 8);
  return v4 & 1;
}

void __62__ACUIDataclassConfigurationViewController__confirmSyncDelete__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  intptr_t (*v5)(uint64_t, uint64_t);
  void *v6;
  id v7;
  id v8[2];
  id v9[3];

  v9[2] = (id)a1;
  v9[1] = (id)a1;
  v2 = MEMORY[0x1E0C809B0];
  v3 = -1073741824;
  v4 = 0;
  v5 = __62__ACUIDataclassConfigurationViewController__confirmSyncDelete__block_invoke_2;
  v6 = &unk_1E9A15A10;
  v7 = *(id *)(a1 + 32);
  v8[1] = *(id *)(a1 + 72);
  v8[0] = *(id *)(a1 + 40);
  v9[0] = (id)MEMORY[0x1D8277444]();
  objc_msgSend(*(id *)(a1 + 48), "showConfirmationWithButtons:title:message:destructive:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 1, v9[0]);
  objc_storeStrong(v9, 0);
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v7, 0);
}

intptr_t __62__ACUIDataclassConfigurationViewController__confirmSyncDelete__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 != objc_msgSend(*(id *)(a1 + 32), "count") - 1)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;
  id v5;
  id v6;
  id textFieldTextDidChangeObserver;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(id *, void *);
  void *v19;
  id v20;
  id from;
  id v22;
  objc_super v23;
  id v24;
  id v25;
  id location[2];
  ACUIDataclassConfigurationViewController *v27;

  v27 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v25 = 0;
  objc_storeStrong(&v25, a4);
  v24 = 0;
  v23.receiver = v27;
  v23.super_class = (Class)ACUIDataclassConfigurationViewController;
  v4 = -[ACUIDataclassConfigurationViewController tableView:cellForRowAtIndexPath:](&v23, sel_tableView_cellForRowAtIndexPath_, location[0], v25);
  v5 = v24;
  v24 = v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = (id)objc_msgSend(v24, "textField");
    if (v22)
    {
      if (v27->_textFieldTextDidChangeObserver)
      {
        v13 = (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        objc_msgSend(v13, "removeObserver:name:object:", v27->_textFieldTextDidChangeObserver, *MEMORY[0x1E0CEBD20], v22);

      }
      objc_initWeak(&from, v27);
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = *MEMORY[0x1E0CEBD20];
      v12 = v22;
      v15 = MEMORY[0x1E0C809B0];
      v16 = -1073741824;
      v17 = 0;
      v18 = __76__ACUIDataclassConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke;
      v19 = &unk_1E9A15A60;
      objc_copyWeak(&v20, &from);
      v6 = (id)objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v11, v12, 0, &v15);
      textFieldTextDidChangeObserver = v27->_textFieldTextDidChangeObserver;
      v27->_textFieldTextDidChangeObserver = v6;

      objc_destroyWeak(&v20);
      objc_destroyWeak(&from);
    }
    objc_msgSend(v22, "setDelegate:", v27);
    objc_storeStrong(&v22, 0);
  }
  v9 = v24;
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v9;
}

void __76__ACUIDataclassConfigurationViewController_tableView_cellForRowAtIndexPath___block_invoke(id *a1, void *a2)
{
  id v3[2];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v3[1] = a1;
  v3[0] = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(v3[0], "_textFieldValueDidChange:", location[0]);
  objc_storeStrong(v3, 0);
  objc_storeStrong(location, 0);
}

- (void)_textFieldValueDidChange:(id)a3
{
  id v3;
  id v4;
  NSString *v5;
  ACAccount *v6;
  BOOL v7;
  id v8;
  id v9;
  char v10;
  unint64_t v11;
  id v12;
  id v13;
  id v14;
  int i;
  id location[2];
  ACUIDataclassConfigurationViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  for (i = 0; ; ++i)
  {
    v11 = i;
    if (v11 >= objc_msgSend(*(id *)((char *)&v17->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), "count"))break;
    v14 = (id)-[ACUIDataclassConfigurationViewController indexPathForIndex:](v17, "indexPathForIndex:", i);
    v9 = (id)objc_msgSend(*(id *)((char *)&v17->super.super.super.super.super.super.isa+ (int)*MEMORY[0x1E0D80598]), "cellForRowAtIndexPath:", v14);
    v10 = objc_msgSend(v9, "isEditing");

    if ((v10 & 1) != 0)
    {
      v13 = (id)objc_msgSend(*(id *)((char *)&v17->super.super.super.super.super.super.isa+ (int)*MEMORY[0x1E0D80598]), "cellForRowAtIndexPath:", v14);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (id)objc_msgSend(v13, "textField");
        v12 = (id)objc_msgSend(v8, "text");

        -[ACUIDataclassConfigurationViewController _setDescription:](v17, "_setDescription:", v12);
        objc_storeStrong(&v12, 0);
      }
      objc_storeStrong(&v13, 0);
    }
    objc_storeStrong(&v14, 0);
  }
  v6 = -[ACUIDataclassConfigurationViewController account](v17, "account");
  v5 = -[ACAccount accountDescription](v6, "accountDescription");
  v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v17->_initialAccountDescription);

  if (v7)
  {
    v4 = (id)-[ACUIDataclassConfigurationViewController navigationItem](v17, "navigationItem");
    v3 = (id)objc_msgSend(v4, "rightBarButtonItem");
    objc_msgSend(v3, "setHidden:", 1);

  }
  else
  {
    -[ACUIDataclassConfigurationViewController _updateDoneButton](v17, "_updateDoneButton");
  }
  objc_storeStrong(location, 0);
}

- (void)_updateDoneButton
{
  id v2;
  id v3;

  v3 = (id)-[ACUIDataclassConfigurationViewController navigationItem](self, "navigationItem");
  v2 = (id)objc_msgSend(v3, "rightBarButtonItem");
  objc_msgSend(v2, "setHidden:", 0);

}

- (BOOL)textFieldShouldReturn:(id)a3
{
  ACUIDataclassConfigurationViewController *v4;
  id v5;
  id v6;
  id v7;
  id location[2];
  ACUIDataclassConfigurationViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "resignFirstResponder");
  v4 = v9;
  v5 = (id)objc_msgSend(location[0], "text");
  -[ACUIDataclassConfigurationViewController _setDescription:](v4, "_setDescription:");

  v7 = (id)-[ACUIDataclassConfigurationViewController navigationItem](v9, "navigationItem");
  v6 = (id)objc_msgSend(v7, "rightBarButtonItem");
  objc_msgSend(v6, "setHidden:", 1);

  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)isFirstTimeSetup
{
  return self->_firstTimeSetup;
}

- (NSArray)preEnabledDataclasses
{
  return self->_preEnabledDataclasses;
}

- (void)setPreEnabledDataclasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1552);
}

- (void)setAccount:(id)a3
{
  objc_storeStrong((id *)&self->_account, a3);
}

- (PSSpecifier)dataclassGroupSpecifier
{
  return self->_dataclassGroupSpecifier;
}

- (void)setDataclassGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_dataclassGroupSpecifier, a3);
}

- (PSSpecifier)deleteButtonSpecifier
{
  return self->_deleteButtonSpecifier;
}

- (BOOL)shouldShowDeleteAccountButton
{
  return self->_shouldShowDeleteAccountButton;
}

- (void)setShouldShowDeleteAccountButton:(BOOL)a3
{
  self->_shouldShowDeleteAccountButton = a3;
}

- (BOOL)shouldEnableDeleteAccountButton
{
  return self->_shouldEnableDeleteAccountButton;
}

- (void)setShouldEnableDeleteAccountButton:(BOOL)a3
{
  self->_shouldEnableDeleteAccountButton = a3;
}

- (BOOL)shouldEnableAccountSummaryCell
{
  return self->_shouldEnableAccountSummaryCell;
}

- (void)setShouldEnableAccountSummaryCell:(BOOL)a3
{
  self->_shouldEnableAccountSummaryCell = a3;
}

- (BOOL)shouldEnableAccountSettingsCell
{
  return self->_shouldEnableAccountSettingsCell;
}

- (void)setShouldEnableAccountSettingsCell:(BOOL)a3
{
  self->_shouldEnableAccountSettingsCell = a3;
}

- (BOOL)shouldEnableDataclassSwitches
{
  return self->_shouldEnableDataclassSwitches;
}

- (void)setShouldEnableDataclassSwitches:(BOOL)a3
{
  self->_shouldEnableDataclassSwitches = a3;
}

- (void)setIsMailSetupForced:(BOOL)a3
{
  self->_isMailSetupForced = a3;
}

- (id)configurationCompletion
{
  return self->_configurationCompletion;
}

- (void)setConfigurationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1576);
}

- (BOOL)isAccountModificationDisabled
{
  return self->_isAccountModificationDisabled;
}

- (void)setIsAccountModificationDisabled:(BOOL)a3
{
  self->_isAccountModificationDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configurationCompletion, 0);
  objc_storeStrong((id *)&self->_dataclassGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_preEnabledDataclasses, 0);
  objc_storeStrong((id *)&self->_initialAccountDescription, 0);
  objc_storeStrong(&self->_textFieldTextDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_otherSpecifiers, 0);
  objc_storeStrong((id *)&self->_dataclassSpecifiers, 0);
  objc_storeStrong((id *)&self->_accountSettingsCellSpecifier, 0);
  objc_storeStrong((id *)&self->_accountSummaryCellSpecifier, 0);
  objc_storeStrong((id *)&self->_deleteButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_allDesiredDataclassActions, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end
