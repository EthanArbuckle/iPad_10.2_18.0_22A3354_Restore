@implementation ACUISettingsController

- (ACUISettingsController)init
{
  id v2;
  void *v3;
  dispatch_group_t v4;
  void *v5;
  id v6;
  void *v7;
  ACUISettingsController *v9;
  id v10;
  objc_super v11;
  SEL v12;
  id v13;

  v12 = a2;
  v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)ACUISettingsController;
  v13 = -[ACUISettingsController init](&v11, sel_init);
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v3 = (void *)*((_QWORD *)v13 + 174);
    *((_QWORD *)v13 + 174) = v2;

    v4 = dispatch_group_create();
    v5 = (void *)*((_QWORD *)v13 + 186);
    *((_QWORD *)v13 + 186) = v4;

    dispatch_group_enter(*((dispatch_group_t *)v13 + 186));
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)*((_QWORD *)v13 + 179);
    *((_QWORD *)v13 + 179) = v6;

    v10 = (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v10, "addObserver:selector:name:object:", v13, sel__lowPowerModeChangedNotification_, *MEMORY[0x1E0CB3048]);
    objc_msgSend(v10, "addObserver:selector:name:object:", v13, sel__effectiveSettingsChangedNotification_, *MEMORY[0x1E0D46EC8], 0);
    objc_storeStrong(&v10, 0);
  }
  v9 = (ACUISettingsController *)v13;
  objc_storeStrong(&v13, 0);
  return v9;
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
  ACUISettingsController *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  objc_super v27;
  BOOL v28;
  SEL v29;
  ACUISettingsController *v30;
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v30 = self;
  v29 = a2;
  v28 = a3;
  v27.receiver = self;
  v27.super_class = (Class)ACUISettingsController;
  -[ACUISettingsController viewDidAppear:](&v27, sel_viewDidAppear_, a3);
  PreferencesExtendedLibrary_1();
  v26 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.InternetAccounts/root"));
  v3 = objc_alloc(MEMORY[0x1E0CB3B78]);
  v6 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_msgSend(v5, "bundleURL");
  v25 = objc_msgSend(v3, "initWithKey:table:locale:bundleURL:", CFSTR("ACCOUNTS"));

  v7 = objc_alloc(MEMORY[0x1E0CB3B78]);
  v10 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (id)objc_msgSend(v9, "bundleURL");
  v24 = objc_msgSend(v7, "initWithKey:table:locale:bundleURL:", CFSTR("APPS_NAVIGATION_PATH"), 0, v10);

  v11 = objc_alloc(MEMORY[0x1E0CB3B78]);
  v14 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (id)objc_msgSend(v13, "bundleURL");
  v23 = objc_msgSend(v11, "initWithKey:table:locale:bundleURL:", CFSTR("CONTACTS_APP_PATH"), 0, v14);

  v15 = objc_alloc(MEMORY[0x1E0CB3B78]);
  v18 = (id)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v17 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (id)objc_msgSend(v17, "bundleURL");
  v22 = objc_msgSend(v15, "initWithKey:table:locale:bundleURL:", CFSTR("CONTACTS_ACCOUNTS_PATH"), 0, v18);

  v20 = v30;
  v19 = (id)v25;
  v31[0] = v24;
  v31[1] = v23;
  v31[2] = v22;
  v21 = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  -[ACUISettingsController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](v20, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.accounts.generic-account"), v19);

  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong((id *)&v23, 0);
  objc_storeStrong((id *)&v24, 0);
  objc_storeStrong((id *)&v25, 0);
  objc_storeStrong(&v26, 0);
}

- (void)_lowPowerModeChangedNotification:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  ACUISettingsController *v9;
  id location[2];
  ACUISettingsController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x1E0C80D38];
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __59__ACUISettingsController__lowPowerModeChangedNotification___block_invoke;
  v8 = &unk_1E9A155C8;
  v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __59__ACUISettingsController__lowPowerModeChangedNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierID:animated:", CFSTR("FETCH_NEW_DATA"), 1, a1, a1);
}

- (void)_effectiveSettingsChangedNotification:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  ACUISettingsController *v9;
  id location[2];
  ACUISettingsController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x1E0C80D38];
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __64__ACUISettingsController__effectiveSettingsChangedNotification___block_invoke;
  v8 = &unk_1E9A155C8;
  v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __64__ACUISettingsController__effectiveSettingsChangedNotification___block_invoke(uint64_t result)
{
  if ((*(_BYTE *)(*(_QWORD *)(result + 32) + 1480) & 1) != 1)
    return objc_msgSend(*(id *)(result + 32), "reloadSpecifiers");
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1480) = 0;
  return result;
}

- (void)dealloc
{
  objc_super v2;
  id v3[2];
  ACUISettingsController *v4;

  v4 = self;
  v3[1] = (id)a2;
  if (self->_accountStore)
    -[ACMonitoredAccountStore removeDelegate:](v4->_accountStore, "removeDelegate:", v4);
  -[ACUISettingsPluginManager parentViewControllerWillDisappear](v4->_settingsPluginManager, "parentViewControllerWillDisappear");
  v3[0] = (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3[0], "removeObserver:", v4);
  objc_storeStrong(v3, 0);
  v2.receiver = v4;
  v2.super_class = (Class)ACUISettingsController;
  -[ACUISettingsController dealloc](&v2, sel_dealloc);
}

- (id)navigationItem
{
  id v3;
  id v4;
  id v5;
  objc_super v6;
  id v7[3];

  v7[2] = self;
  v7[1] = (id)a2;
  v6.receiver = self;
  v6.super_class = (Class)ACUISettingsController;
  v7[0] = -[ACUISettingsController navigationItem](&v6, sel_navigationItem);
  v4 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACCOUNTS"), &stru_1E9A15E98, CFSTR("Localizable"));
  objc_msgSend(v7[0], "setBackButtonTitle:");

  v5 = v7[0];
  objc_storeStrong(v7, 0);
  return v5;
}

- (void)setSpecifier:(id)a3
{
  NSString *v3;
  NSString *filteredDataclass;
  objc_super v5;
  id location[2];
  ACUISettingsController *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)ACUISettingsController;
  -[ACUISettingsController setSpecifier:](&v5, sel_setSpecifier_, location[0]);
  v3 = (NSString *)(id)objc_msgSend(location[0], "propertyForKey:", *MEMORY[0x1E0D806F0]);
  filteredDataclass = v7->_filteredDataclass;
  v7->_filteredDataclass = v3;

  objc_storeStrong(location, 0);
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5 withCompletion:(id)a6
{
  NSObject *group;
  NSObject *queue;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  ACUISettingsController *v17;
  id v18;
  id v19;
  os_log_type_t v20;
  id v21;
  id v22[2];
  id v23;
  id location[2];
  ACUISettingsController *v25;
  char v26;
  uint8_t v27[40];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v23 = 0;
  objc_storeStrong(&v23, a4);
  v22[1] = a5;
  v22[0] = 0;
  objc_storeStrong(v22, a6);
  if (v25->_specifierLoadGroup)
  {
    v21 = _ACUILogSystem();
    v20 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v27, (uint64_t)"-[ACUISettingsController prepareHandlingURLForSpecifierID:resourceDictionary:animatePush:withCompletion:]", 246, (uint64_t)v23);
      _os_log_debug_impl(&dword_1D573D000, (os_log_t)v21, v20, "%s (%d) \"Deferring URL load for resources %@\", v27, 0x1Cu);
    }
    objc_storeStrong(&v21, 0);
    group = v25->_specifierLoadGroup;
    queue = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C809B0];
    v13 = -1073741824;
    v14 = 0;
    v15 = __105__ACUISettingsController_prepareHandlingURLForSpecifierID_resourceDictionary_animatePush_withCompletion___block_invoke;
    v16 = &unk_1E9A15BB0;
    v17 = v25;
    v18 = v23;
    v19 = v22[0];
    dispatch_group_notify(group, queue, &v12);

    v26 = 0;
    objc_storeStrong(&v19, 0);
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
  }
  else
  {
    v26 = 1;
  }
  objc_storeStrong(v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
  return v26 & 1;
}

uint64_t __105__ACUISettingsController_prepareHandlingURLForSpecifierID_resourceDictionary_animatePush_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleURL:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1, a1);
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v4;
  id v5;
  void *v6;
  id v7;
  os_log_t oslog;
  id v10;
  id v11;
  id v12;
  objc_super v13;
  os_log_type_t v14;
  id v15;
  id v16;
  id location[2];
  ACUISettingsController *v18;
  uint8_t v19[32];
  uint8_t v20[40];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = _ACUILogSystem();
  v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v20, (uint64_t)"-[ACUISettingsController handleURL:withCompletion:]", 258, (uint64_t)location[0]);
    _os_log_debug_impl(&dword_1D573D000, (os_log_t)v15, v14, "%s (%d) \"Handling URL load for resources %@\", v20, 0x1Cu);
  }
  objc_storeStrong(&v15, 0);
  v18->_isInHandleURL = 1;
  v13.receiver = v18;
  v13.super_class = (Class)ACUISettingsController;
  -[ACUISettingsController handleURL:withCompletion:](&v13, sel_handleURL_withCompletion_, location[0], &__block_literal_global_8);
  v18->_isInHandleURL = 0;
  if (v18->_viewControllerPushedByControllerLoadActionDuringHandleURL)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (id)objc_msgSend(location[0], "objectForKey:", CFSTR("path"));
      v6 = (void *)MEMORY[0x1E0C99DE8];
      v7 = (id)objc_msgSend(v12, "pathComponents");
      v11 = (id)objc_msgSend(v6, "arrayWithArray:");

      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v11, "removeObjectAtIndex:", 0);
        v4 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v11);
        v5 = v12;
        v12 = v4;

        v10 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", location[0]);
        objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("path"));
        -[PSViewController handleURL:withCompletion:](v18->_viewControllerPushedByControllerLoadActionDuringHandleURL, "handleURL:withCompletion:", v10, v16);
        objc_storeStrong(&v10, 0);
      }
      else if (v16)
      {
        (*((void (**)(void))v16 + 2))();
      }
      objc_storeStrong(&v11, 0);
      objc_storeStrong(&v12, 0);
    }
    objc_storeStrong((id *)&v18->_viewControllerPushedByControllerLoadActionDuringHandleURL, 0);
  }
  else
  {
    oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v19, (uint64_t)"-[ACUISettingsController handleURL:withCompletion:]", 285, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"No subview to display matching dictionary %@\", v19, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v16)
      (*((void (**)(void))v16 + 2))();
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)_accountStore
{
  ACMonitoredAccountStore *v2;
  ACMonitoredAccountStore *accountStore;

  if (!self->_accountStore)
  {
    v2 = (ACMonitoredAccountStore *)+[ACUIViewController acuiAccountStore](ACUIViewController, "acuiAccountStore");
    accountStore = self->_accountStore;
    self->_accountStore = v2;

    -[ACMonitoredAccountStore addDelegate:](self->_accountStore, "addDelegate:", self);
  }
  return self->_accountStore;
}

- (void)_accountsWithCompletion:(id)a3
{
  ACUISettingsController *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(_QWORD *, void *);
  void *v8;
  ACUISettingsController *v9;
  id v10;
  id location[2];
  ACUISettingsController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v12->_accounts)
  {
    if (location[0])
      (*((void (**)(id, NSArray *))location[0] + 2))(location[0], v12->_accounts);
  }
  else
  {
    v3 = v12;
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __50__ACUISettingsController__accountsWithCompletion___block_invoke;
    v8 = &unk_1E9A15BF8;
    v9 = v12;
    v10 = location[0];
    -[ACUISettingsController _loadAccountsWithCompletion:](v3, "_loadAccountsWithCompletion:", &v4);
    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v9, 0);
  }
  objc_storeStrong(location, 0);
}

void __50__ACUISettingsController__accountsWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v2;
  void **v3;
  void *v4;
  NSObject *v5;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v5);

  v2 = objc_msgSend(location[0], "copy");
  v3 = (void **)(a1[4] + 1384);
  v4 = *v3;
  *v3 = (void *)v2;

  if (a1[5])
    (*(void (**)(void))(a1[5] + 16))();
  objc_storeStrong(location, 0);
}

- (void)_loadAccountsWithCompletion:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t (*v31)(id *, void *, void *);
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t (*v39)(_QWORD *, void *, _BYTE *);
  void *v40;
  ACUISettingsController *v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t (*v45)(_QWORD *, void *, _BYTE *);
  void *v46;
  ACUISettingsController *v47;
  id v48;
  _QWORD __b[8];
  id v50;
  id v51;
  id v52;
  id location[2];
  ACUISettingsController *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v52 = 0;
  v51 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  memset(__b, 0, sizeof(__b));
  v18 = -[ACUISettingsController _accountStore](v54, "_accountStore");
  obj = (id)objc_msgSend(v18, "monitoredAccounts");

  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
  if (v20)
  {
    v15 = *(_QWORD *)__b[2];
    v16 = 0;
    v17 = v20;
    while (1)
    {
      v14 = v16;
      if (*(_QWORD *)__b[2] != v15)
        objc_enumerationMutation(obj);
      v50 = *(id *)(__b[1] + 8 * v16);
      if ((objc_msgSend(v50, "isVisible") & 1) != 0)
      {
        v3 = (id)objc_msgSend(v50, "parentAccount");
        v13 = v3 == 0;

        if (v13)
        {
          v4 = (id)objc_msgSend(v50, "enabledDataclasses");
          if (v54->_filteredDataclass)
          {
            v12 = (id)objc_msgSend(v50, "provisionedDataclasses");
            v42 = MEMORY[0x1E0C809B0];
            v43 = -1073741824;
            v44 = 0;
            v45 = __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke;
            v46 = &unk_1E9A15C20;
            v47 = v54;
            v48 = (id)objc_msgSend(v12, "objectsPassingTest:", &v42);

            if (!objc_msgSend(v48, "count"))
            {
              v11 = (id)objc_msgSend(v50, "accountType");
              v10 = (id)objc_msgSend(v11, "supportedDataclasses");
              v36 = MEMORY[0x1E0C809B0];
              v37 = -1073741824;
              v38 = 0;
              v39 = __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_2;
              v40 = &unk_1E9A15C20;
              v41 = v54;
              v5 = (id)objc_msgSend(v10, "objectsPassingTest:", &v36);
              v6 = v48;
              v48 = v5;

              objc_storeStrong((id *)&v41, 0);
            }
            if (objc_msgSend(v48, "count"))
              objc_msgSend(v51, "addObject:", v50);
            objc_storeStrong(&v48, 0);
            objc_storeStrong((id *)&v47, 0);
          }
          else
          {
            objc_msgSend(v51, "addObject:", v50);
          }
        }
      }
      ++v16;
      if (v14 + 1 >= v17)
      {
        v16 = 0;
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
        if (!v17)
          break;
      }
    }
  }

  objc_storeStrong(&v52, v51);
  v35 = ACUISortedAccountTypes();
  v7 = v52;
  v8 = MEMORY[0x1E0C809B0];
  v28 = MEMORY[0x1E0C809B0];
  v29 = -1073741824;
  v30 = 0;
  v31 = __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_3;
  v32 = &unk_1E9A15B70;
  v33 = v35;
  v34 = (id)objc_msgSend(v7, "sortedArrayUsingComparator:", &v28);
  queue = MEMORY[0x1E0C80D38];
  v21 = v8;
  v22 = -1073741824;
  v23 = 0;
  v24 = __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_4;
  v25 = &unk_1E9A15400;
  v27 = location[0];
  v26 = v34;
  dispatch_async(queue, &v21);

  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(location, 0);
}

uint64_t __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  char v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(location[0], "hasPrefix:", *(_QWORD *)(a1[4] + 1472));
  *a3 = v6 & 1;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

uint64_t __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  char v6;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_opt_class();
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(location[0], "hasPrefix:", *(_QWORD *)(a1[4] + 1472));
  *a3 = v6 & 1;
  objc_storeStrong(location, 0);
  return v6 & 1;
}

uint64_t __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13[2];
  id v14;
  id location[2];
  uint64_t v16;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14 = 0;
  objc_storeStrong(&v14, a3);
  v13[1] = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (id)objc_msgSend(location[0], "accountType");
    v13[0] = (id)objc_msgSend(v4, "identifier");

    v5 = (id)objc_msgSend(v14, "accountType");
    v12 = (id)objc_msgSend(v5, "identifier");

    v11 = objc_msgSend(a1[4], "indexOfObject:", v13[0]);
    v10 = objc_msgSend(a1[4], "indexOfObject:", v12);
    v7 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v16 = objc_msgSend(v7, "compare:");

    objc_storeStrong(&v12, 0);
    objc_storeStrong(v13, 0);
  }
  else
  {
    v16 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16;
}

uint64_t __54__ACUISettingsController__loadAccountsWithCompletion___block_invoke_4(uint64_t result)
{
  if (*(_QWORD *)(result + 40))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 40) + 16))();
  return result;
}

- (void)_accountStoreDidChange
{
  ACUISettingsController *v2;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *, void *);
  void *v7;
  ACUISettingsController *v8;
  os_log_type_t v9;
  id location[2];
  ACUISettingsController *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v11 = self;
  location[1] = (id)a2;
  location[0] = _ACUILogSystem();
  v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v12, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]", 383);
    _os_log_impl(&dword_1D573D000, (os_log_t)location[0], v9, "%s (%d) \"ACUISettingsController received monitored account delegate call.\", v12, 0x12u);
  }
  objc_storeStrong(location, 0);
  v2 = v11;
  v3 = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __48__ACUISettingsController__accountStoreDidChange__block_invoke;
  v7 = &unk_1E9A15C70;
  v8 = v11;
  -[ACUISettingsController _loadAccountsWithCompletion:](v2, "_loadAccountsWithCompletion:", &v3);
  objc_storeStrong((id *)&v8, 0);
}

void __48__ACUISettingsController__accountStoreDidChange__block_invoke(id *a1, void *a2)
{
  id v2;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;
  id v11;
  int v12;
  os_log_type_t v13;
  id v14[2];
  id location[2];
  uint8_t v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v14[1] = a1;
  if ((objc_msgSend(a1[4], "_isAccountList:identicalToAccountList:", location[0], *((_QWORD *)a1[4] + 173)) & 1) != 0)
  {
    v14[0] = _ACUILogSystem();
    v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v16, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 387);
      _os_log_impl(&dword_1D573D000, (os_log_t)v14[0], v13, "%s (%d) \"ACUISettingsController will ignore monitored account delegate call because the account list has not changed.\", v16, 0x12u);
    }
    objc_storeStrong(v14, 0);
    v12 = 1;
  }
  else
  {
    objc_storeStrong((id *)a1[4] + 173, location[0]);
    v11 = (id)objc_msgSend(*((id *)a1[4] + 174), "copy");
    v2 = a1[4];
    v4 = MEMORY[0x1E0C809B0];
    v5 = -1073741824;
    v6 = 0;
    v7 = __48__ACUISettingsController__accountStoreDidChange__block_invoke_64;
    v8 = &unk_1E9A15C48;
    v9 = v11;
    v10 = a1[4];
    objc_msgSend(v2, "_specifiersForAccountsGroupWithCompletion:", &v4);
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v9, 0);
    objc_storeStrong(&v11, 0);
    v12 = 0;
  }
  objc_storeStrong(location, 0);
}

void __48__ACUISettingsController__accountStoreDidChange__block_invoke_64(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  os_log_t v11;
  os_log_type_t v12;
  os_log_t v13;
  _QWORD __b[8];
  id v15;
  os_log_type_t v16;
  os_log_t v17;
  os_log_type_t v18;
  os_log_t oslog;
  os_log_type_t v20;
  id v21;
  os_log_type_t type;
  os_log_t v23[2];
  id location[2];
  uint8_t v25[32];
  uint8_t v26[48];
  _BYTE v27[128];
  uint8_t v28[32];
  uint8_t v29[32];
  uint8_t v30[32];
  uint8_t v31[40];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v23[1] = (os_log_t)a1;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    if (objc_msgSend(location[0], "count"))
    {
      oslog = (os_log_t)_ACUILogSystem();
      v18 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v29, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 403);
        _os_log_debug_impl(&dword_1D573D000, oslog, v18, "%s (%d) \"ACUISettingsController _accountStoreDidChange: BEGIN UPDATES!\", v29, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
      objc_msgSend(*(id *)(a1 + 40), "beginUpdates");
      v17 = (os_log_t)_ACUILogSystem();
      v16 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v28, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 406, *(_QWORD *)(a1 + 32));
        _os_log_debug_impl(&dword_1D573D000, v17, v16, "%s (%d) \"ACUISettingsController _accountStoreDidChange: removing specifiers %@\", v28, 0x1Cu);
      }
      objc_storeStrong((id *)&v17, 0);
      memset(__b, 0, sizeof(__b));
      obj = (id)objc_msgSend(*(id *)(a1 + 32), "reverseObjectEnumerator");
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
      if (v9)
      {
        v5 = *(_QWORD *)__b[2];
        v6 = 0;
        v7 = v9;
        while (1)
        {
          v4 = v6;
          if (*(_QWORD *)__b[2] != v5)
            objc_enumerationMutation(obj);
          v15 = *(id *)(__b[1] + 8 * v6);
          v2 = *(void **)(a1 + 40);
          v3 = (id)objc_msgSend(v15, "identifier");
          objc_msgSend(v2, "removeSpecifierID:");

          ++v6;
          if (v4 + 1 >= v7)
          {
            v6 = 0;
            v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v27, 16);
            if (!v7)
              break;
          }
        }
      }

      v13 = (os_log_t)_ACUILogSystem();
      v12 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v26, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 411, (uint64_t)location[0], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1400));
        _os_log_debug_impl(&dword_1D573D000, v13, v12, "%s (%d) \"ACUISettingsController _accountStoreDidChange: inserting specifiers %@ after specifier %@\", v26, 0x26u);
      }
      objc_storeStrong((id *)&v13, 0);
      objc_msgSend(*(id *)(a1 + 40), "insertContiguousSpecifiers:afterSpecifier:", location[0], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1400));
      v11 = (os_log_t)_ACUILogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_2_8_32_4_0((uint64_t)v25, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 414);
        _os_log_debug_impl(&dword_1D573D000, v11, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUISettingsController _accountStoreDidChange: END UPDATES!\", v25, 0x12u);
      }
      objc_storeStrong((id *)&v11, 0);
      objc_msgSend(*(id *)(a1 + 40), "endUpdates");
    }
    else
    {
      v21 = _ACUILogSystem();
      v20 = OS_LOG_TYPE_DEBUG;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_DEBUG))
      {
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v30, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 399, *(_QWORD *)(a1 + 32));
        _os_log_debug_impl(&dword_1D573D000, (os_log_t)v21, v20, "%s (%d) \"ACUISettingsController _accountStoreDidChange: removing specifiers %@\", v30, 0x1Cu);
      }
      objc_storeStrong(&v21, 0);
      objc_msgSend(*(id *)(a1 + 40), "removeContiguousSpecifiers:animated:", *(_QWORD *)(a1 + 32), 0);
    }
  }
  else
  {
    v23[0] = (os_log_t)_ACUILogSystem();
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v23[0], OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v31, (uint64_t)"-[ACUISettingsController _accountStoreDidChange]_block_invoke", 396, (uint64_t)location[0], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1400));
      _os_log_debug_impl(&dword_1D573D000, v23[0], type, "%s (%d) \"ACUISettingsController _accountStoreDidChange: inserting specifiers %@ after specifier %@\", v31, 0x26u);
    }
    objc_storeStrong((id *)v23, 0);
    objc_msgSend(*(id *)(a1 + 40), "insertContiguousSpecifiers:afterSpecifier:", location[0], *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1400));
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_isAccountList:(id)a3 identicalToAccountList:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  _QWORD __b[8];
  uint64_t v14;
  int v15;
  id v16;
  id location[2];
  ACUISettingsController *v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v12 = objc_msgSend(location[0], "count");
  if (v12 == objc_msgSend(v16, "count"))
  {
    memset(__b, 0, sizeof(__b));
    v9 = location[0];
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
    if (v10)
    {
      v6 = *(_QWORD *)__b[2];
      v7 = 0;
      v8 = v10;
      while (1)
      {
        v5 = v7;
        if (*(_QWORD *)__b[2] != v6)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(__b[1] + 8 * v7);
        if (!-[ACUISettingsController _isAccount:inList:](v18, "_isAccount:inList:", v14, v16))
          break;
        ++v7;
        if (v5 + 1 >= v8)
        {
          v7 = 0;
          v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", __b, v20, 16);
          if (!v8)
            goto LABEL_11;
        }
      }
      v19 = 0;
      v15 = 1;
    }
    else
    {
LABEL_11:
      v15 = 0;
    }

    if (!v15)
    {
      v19 = 1;
      v15 = 1;
    }
  }
  else
  {
    v19 = 0;
    v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v19 & 1;
}

- (BOOL)_isAccount:(id)a3 inList:(id)a4
{
  int v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v12;
  uint64_t v13;
  int v14;
  char v15;
  id v16;
  char v17;
  id v18;
  char v19;
  id v20;
  char v21;
  id v22;
  char v23;
  id v24;
  char v25;
  id v26;
  char v27;
  id v28;
  char v29;
  id v30;
  _QWORD __b[8];
  id v32;
  id v33;
  id location[3];
  char v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33 = 0;
  objc_storeStrong(&v33, a4);
  memset(__b, 0, sizeof(__b));
  v12 = v33;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
  if (v13)
  {
    v8 = *(_QWORD *)__b[2];
    v9 = 0;
    v10 = v13;
    while (1)
    {
      v7 = v9;
      if (*(_QWORD *)__b[2] != v8)
        objc_enumerationMutation(v12);
      v32 = *(id *)(__b[1] + 8 * v9);
      v5 = objc_msgSend(v32, "isAuthenticated") & 1;
      v29 = 0;
      v27 = 0;
      v25 = 0;
      v23 = 0;
      v21 = 0;
      v19 = 0;
      v17 = 0;
      v15 = 0;
      v6 = 0;
      if (v5 == (objc_msgSend(location[0], "isAuthenticated") & 1))
      {
        v30 = (id)objc_msgSend(v32, "identifier");
        v29 = 1;
        v28 = (id)objc_msgSend(location[0], "identifier");
        v27 = 1;
        v6 = 0;
        if ((objc_msgSend(v30, "isEqualToString:") & 1) != 0)
        {
          v26 = (id)objc_msgSend(v32, "accountDescription");
          v25 = 1;
          v24 = (id)objc_msgSend(location[0], "accountDescription");
          v23 = 1;
          v6 = 0;
          if ((objc_msgSend(v26, "isEqualToString:") & 1) != 0)
          {
            v22 = (id)objc_msgSend(v32, "enabledDataclasses");
            v21 = 1;
            v20 = (id)objc_msgSend(location[0], "enabledDataclasses");
            v19 = 1;
            v6 = 0;
            if ((objc_msgSend(v22, "isEqualToSet:") & 1) != 0)
            {
              v18 = (id)objc_msgSend(v32, "provisionedDataclasses");
              v17 = 1;
              v16 = (id)objc_msgSend(location[0], "provisionedDataclasses");
              v15 = 1;
              v6 = objc_msgSend(v18, "isEqualToSet:");
            }
          }
        }
      }
      if ((v15 & 1) != 0)

      if ((v17 & 1) != 0)
      if ((v19 & 1) != 0)

      if ((v21 & 1) != 0)
      if ((v23 & 1) != 0)

      if ((v25 & 1) != 0)
      if ((v27 & 1) != 0)

      if ((v29 & 1) != 0)
      if ((v6 & 1) != 0)
        break;
      ++v9;
      if (v7 + 1 >= v10)
      {
        v9 = 0;
        v10 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", __b, v36, 16);
        if (!v10)
          goto LABEL_30;
      }
    }
    v35 = 1;
    v14 = 1;
  }
  else
  {
LABEL_30:
    v14 = 0;
  }

  if (!v14)
    v35 = 0;
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
  return v35 & 1;
}

- (id)_settingsPluginManager
{
  ACUISettingsPluginManager *v2;
  ACUISettingsPluginManager *settingsPluginManager;

  if (!self->_settingsPluginManager)
  {
    v2 = -[ACUISettingsPluginManager initWithParentViewController:]([ACUISettingsPluginManager alloc], "initWithParentViewController:", self);
    settingsPluginManager = self->_settingsPluginManager;
    self->_settingsPluginManager = v2;

  }
  return self->_settingsPluginManager;
}

- (void)_filterAccounts:(id)a3 toTopLevel:(id)a4 grouped:(id)a5 ignoringGroups:(id)a6
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD __b[8];
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id location[2];
  ACUISettingsController *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v24 = 0;
  objc_storeStrong(&v24, a6);
  memset(__b, 0, sizeof(__b));
  v18 = location[0];
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
  if (v19)
  {
    v12 = *(_QWORD *)__b[2];
    v13 = 0;
    v14 = v19;
    while (1)
    {
      v11 = v13;
      if (*(_QWORD *)__b[2] != v12)
        objc_enumerationMutation(v18);
      v23 = *(_QWORD *)(__b[1] + 8 * v13);
      v21 = -[ACUISettingsController _accountGroupIdentifier:ignoringGroups:](v28, "_accountGroupIdentifier:ignoringGroups:", v23, v24);
      if (v21)
      {
        v10 = (id)objc_msgSend(v25, "objectForKey:", v21);
        v20 = (id)objc_msgSend(v10, "mutableCopy");

        if (!v20)
        {
          v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v7 = v20;
          v20 = v6;

        }
        objc_msgSend(v20, "addObject:", v23);
        v8 = v25;
        v9 = (id)objc_msgSend(v20, "copy");
        objc_msgSend(v8, "setObject:forKey:");

        objc_storeStrong(&v20, 0);
      }
      else
      {
        objc_msgSend(v26, "addObject:", v23);
      }
      objc_storeStrong(&v21, 0);
      ++v13;
      if (v11 + 1 >= v14)
      {
        v13 = 0;
        v14 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", __b, v29, 16);
        if (!v14)
          break;
      }
    }
  }

  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (id)_accountGroupIdentifier:(id)a3 ignoringGroups:(id)a4
{
  id v6;
  id v7;
  char v8;
  id v9;
  id location[3];
  id v11;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = (id)objc_msgSend(location[0], "accountType");
  v6 = (id)objc_msgSend(v7, "identifier");
  v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F140]);

  if ((v8 & 1) == 0 || (objc_msgSend(v9, "containsObject:", *MEMORY[0x1E0C8F140]) & 1) != 0)
    v11 = 0;
  else
    v11 = (id)*MEMORY[0x1E0C8F140];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v11;
}

- (id)specifiers
{
  PSSpecifier *v2;
  PSSpecifier *accountGroupSpecifier;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  ACUISettingsController *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  ACUISettingsController *v20;
  id v21;
  id v22;
  BOOL v23;
  BOOL v24;
  id v25;
  id v26;
  os_log_type_t v27;
  id location[2];
  ACUISettingsController *v29;
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = self;
  location[1] = (id)a2;
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]))
  {
    location[0] = _ACUILogSystem();
    v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_2_8_32_4_0((uint64_t)v30, (uint64_t)"-[ACUISettingsController specifiers]", 490);
      _os_log_impl(&dword_1D573D000, (os_log_t)location[0], v27, "%s (%d) \"ACUISettingsController is loading specifiers.\", v30, 0x12u);
    }
    objc_storeStrong(location, 0);
    v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = (void *)MEMORY[0x1E0D804E8];
    v14 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (id)objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("ACCOUNTS"), &stru_1E9A15E98, CFSTR("Localizable"));
    v2 = (PSSpecifier *)(id)objc_msgSend(v12, "groupSpecifierWithName:");
    accountGroupSpecifier = v29->_accountGroupSpecifier;
    v29->_accountGroupSpecifier = v2;

    objc_msgSend(v26, "addObject:", v29->_accountGroupSpecifier);
    v25 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, 0, 0, 0, 0, 15, 0);
    v24 = 0;
    v24 = v29->_accounts == 0;
    if (v24)
      objc_msgSend(v26, "addObject:", v25);
    v11 = v29;
    v15 = MEMORY[0x1E0C809B0];
    v16 = -1073741824;
    v17 = 0;
    v18 = __36__ACUISettingsController_specifiers__block_invoke;
    v19 = &unk_1E9A15C98;
    v23 = v24;
    v20 = v29;
    v21 = v25;
    v22 = v26;
    -[ACUISettingsController _specifiersForAccountsGroupWithCompletion:](v11, "_specifiersForAccountsGroupWithCompletion:", &v15);
    if ((ACUIIsSharedIPadMode() & 1) == 0)
    {
      v9 = v26;
      v10 = -[ACUISettingsController _addAccountSpecifier](v29, "_addAccountSpecifier");
      objc_msgSend(v9, "addObject:");

    }
    v5 = v26;
    v6 = (id)objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    objc_msgSend(v5, "addObject:");

    v7 = v26;
    v8 = -[ACUISettingsController _specifierForScheduleSettings](v29, "_specifierForScheduleSettings");
    objc_msgSend(v7, "addObject:");

    objc_storeStrong((id *)((char *)&v29->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80590]), v26);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v21, 0);
    objc_storeStrong((id *)&v20, 0);
    objc_storeStrong(&v25, 0);
    objc_storeStrong(&v26, 0);
  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&v29->super.super.super.super.super.isa
                                                 + (int)*MEMORY[0x1E0D80590]));
}

void __36__ACUISettingsController_specifiers__block_invoke(uint64_t a1, void *a2)
{
  NSObject *v2;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v2 = MEMORY[0x1E0C80D38];
  dispatch_assert_queue_V2(v2);

  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "insertContiguousSpecifiers:afterSpecifier:", location[0], *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "removeSpecifier:", *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1488))
    {
      dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 1488));
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1488), 0);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", location[0]);
  }
  objc_storeStrong(location, 0);
}

- (void)_specifiersForAccountsGroupWithCompletion:(id)a3
{
  ACUISettingsController *v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  ACUISettingsController *v9;
  id v10;
  BOOL v11;
  BOOL v12;
  os_log_type_t v13;
  id v14;
  id location[2];
  ACUISettingsController *v16;
  id v17;
  dispatch_once_t *v18;
  uint8_t v19[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = _ACUILogSystem();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_2_8_32_4_0((uint64_t)v19, (uint64_t)"-[ACUISettingsController _specifiersForAccountsGroupWithCompletion:]", 545);
    _os_log_impl(&dword_1D573D000, (os_log_t)v14, v13, "%s (%d) \"ACUISettingsController _specifiersForAccountsGroup called.\", v19, 0x12u);
  }
  objc_storeStrong(&v14, 0);
  v18 = (dispatch_once_t *)&_specifiersForAccountsGroupWithCompletion__onceToken;
  v17 = 0;
  objc_storeStrong(&v17, &__block_literal_global_67);
  if (*v18 != -1)
    dispatch_once(v18, v17);
  objc_storeStrong(&v17, 0);
  v12 = 1;
  if ((_specifiersForAccountsGroupWithCompletion__pluginsHandleModificationRestriction & 1) == 0)
    v12 = !-[ACUISettingsController _isAccountModificationDisabledByRestrictions](v16, "_isAccountModificationDisabledByRestrictions");
  v3 = v16;
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __68__ACUISettingsController__specifiersForAccountsGroupWithCompletion___block_invoke_2;
  v8 = &unk_1E9A15CE0;
  v9 = v16;
  v11 = v12;
  v10 = location[0];
  -[ACUISettingsController _accountsWithCompletion:](v3, "_accountsWithCompletion:", &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

uint64_t __68__ACUISettingsController__specifiersForAccountsGroupWithCompletion___block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((result & 1) != 0)
    _specifiersForAccountsGroupWithCompletion__pluginsHandleModificationRestriction = 1;
  return result;
}

void __68__ACUISettingsController__specifiersForAccountsGroupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  char v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *log;
  id v13;
  id v14;
  char v15;
  id v16;
  id v17;
  char v18;
  id v19;
  id v20;
  char v21;
  id v22;
  id v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  id obj;
  uint64_t v31;
  id v32;
  id v33;
  _QWORD v34[8];
  uint64_t v35;
  os_log_type_t type;
  os_log_t oslog;
  char v38;
  id v39;
  char v40;
  id v41;
  char v42;
  id v43;
  char v44;
  char v45;
  id v46;
  _QWORD __b[8];
  id v48;
  id v49;
  id v50;
  id v51[2];
  id location[2];
  _BYTE v53[128];
  uint8_t v54[40];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v51[1] = (id)a1;
  v51[0] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "_filterAccounts:toTopLevel:grouped:ignoringGroups:", location[0], v51[0], v50, 0);
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(__b, 0, sizeof(__b));
  obj = v51[0];
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
  if (v31)
  {
    v26 = *(_QWORD *)__b[2];
    v27 = 0;
    v28 = v31;
    while (1)
    {
      v25 = v27;
      if (*(_QWORD *)__b[2] != v26)
        objc_enumerationMutation(obj);
      v48 = *(id *)(__b[1] + 8 * v27);
      v46 = (id)objc_msgSend(*(id *)(a1 + 32), "_specifierForAccount:", v48);
      if (v46)
      {
        if ((_specifiersForAccountsGroupWithCompletion__pluginsHandleModificationRestriction & 1) == 0)
        {
          v45 = 0;
          v22 = (id)objc_msgSend(v48, "accountType");
          v23 = (id)objc_msgSend(v22, "identifier");
          LOBYTE(v24) = 0;
          if ((objc_msgSend(v23, "isEqualToString:", *MEMORY[0x1E0C8F0A8]) & 1) != 0)
            v24 = objc_msgSend(v48, "isAuthenticated") ^ 1;

          v45 = v24 & 1;
          v44 = 0;
          v19 = (id)objc_msgSend(v48, "accountType");
          v20 = (id)objc_msgSend(v19, "identifier");
          v2 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0C8F080]);
          v42 = 0;
          v40 = 0;
          v21 = 1;
          if ((v2 & 1) == 0)
          {
            v43 = (id)objc_msgSend(v48, "accountType");
            v42 = 1;
            v41 = (id)objc_msgSend(v43, "identifier");
            v40 = 1;
            v21 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x1E0C8F0B8]);
          }
          if ((v40 & 1) != 0)

          if ((v42 & 1) != 0)
          v44 = v21 & 1;
          v17 = v46;
          v18 = 1;
          if ((*(_BYTE *)(a1 + 48) & 1) == 0)
          {
            v18 = 1;
            if ((v45 & 1) == 0)
              v18 = v44;
          }
          v16 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18 & 1);
          objc_msgSend(v17, "setProperty:forKey:");

        }
        v13 = (id)objc_msgSend(v48, "accountType");
        v14 = (id)objc_msgSend(v13, "identifier");
        v3 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C8F030]);
        v38 = 0;
        v15 = 0;
        if ((v3 & 1) != 0)
        {
          v39 = (id)objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("primaryAccount"));
          v38 = 1;
          v15 = objc_msgSend(v39, "BOOLValue");
        }
        if ((v38 & 1) != 0)

        if ((v15 & 1) != 0)
        {
          oslog = (os_log_t)_ACUILogSystem();
          type = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            log = oslog;
            __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v54, (uint64_t)"-[ACUISettingsController _specifiersForAccountsGroupWithCompletion:]_block_invoke_2", 586, (uint64_t)v48);
            _os_log_impl(&dword_1D573D000, log, type, "%s (%d) \"Hit our primary account, lets ensure this is at the top - %@\", v54, 0x1Cu);
          }
          objc_storeStrong((id *)&oslog, 0);
          objc_msgSend(v49, "insertObject:atIndex:", v46, 0);
        }
        else
        {
          objc_msgSend(v49, "addObject:", v46);
        }
      }
      objc_storeStrong(&v46, 0);
      ++v27;
      if (v25 + 1 >= v28)
      {
        v27 = 0;
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v55, 16);
        if (!v28)
          break;
      }
    }
  }

  memset(v34, 0, sizeof(v34));
  v10 = (id)objc_msgSend(v50, "allKeys");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v34, v53, 16);
  if (v11)
  {
    v7 = *(_QWORD *)v34[2];
    v8 = 0;
    v9 = v11;
    while (1)
    {
      v6 = v8;
      if (*(_QWORD *)v34[2] != v7)
        objc_enumerationMutation(v10);
      v35 = *(_QWORD *)(v34[1] + 8 * v8);
      v33 = (id)objc_msgSend(v50, "objectForKey:", v35);
      v32 = (id)objc_msgSend(*(id *)(a1 + 32), "_specifierForCollectionCellLinkingToAccounts:withGroupIdentifier:underParentGroup:", v33, v35, 0);
      if (v32)
      {
        if ((_specifiersForAccountsGroupWithCompletion__pluginsHandleModificationRestriction & 1) == 0)
        {
          v4 = v32;
          v5 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(_BYTE *)(a1 + 48) & 1);
          objc_msgSend(v4, "setProperty:forKey:");

        }
        objc_msgSend(v49, "addObject:", v32);
      }
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      ++v8;
      if (v6 + 1 >= v9)
      {
        v8 = 0;
        v9 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v34, v53, 16);
        if (!v9)
          break;
      }
    }
  }

  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1392), v49);
  objc_storeStrong(&v49, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(v51, 0);
  objc_storeStrong(location, 0);
}

- (id)_specifierForCollectionCellLinkingToAccounts:(id)a3 withGroupIdentifier:(id)a4 underParentGroup:(id)a5
{
  id v5;
  id v6;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v32;
  uint64_t v33;
  os_log_t oslog;
  id v35;
  id v36;
  id v37;
  _QWORD v38[8];
  uint64_t v39;
  id v40;
  _QWORD v41[8];
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  int v47;
  _QWORD __b[8];
  id v49;
  id v50;
  id v51;
  id v52;
  id location[2];
  ACUISettingsController *v54;
  id v55;
  uint8_t v56[40];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v54 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v52 = 0;
  objc_storeStrong(&v52, a4);
  v51 = 0;
  objc_storeStrong(&v51, a5);
  v50 = 0;
  memset(__b, 0, sizeof(__b));
  v32 = location[0];
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", __b, v59, 16);
  if (v33)
  {
    v27 = *(_QWORD *)__b[2];
    v28 = 0;
    v29 = v33;
    while (1)
    {
      v26 = v28;
      if (*(_QWORD *)__b[2] != v27)
        objc_enumerationMutation(v32);
      v49 = *(id *)(__b[1] + 8 * v28);
      v24 = (id)objc_msgSend(v49, "identifier");
      v25 = objc_msgSend(v24, "isEqualToString:", v52);

      if ((v25 & 1) != 0)
        break;
      ++v28;
      if (v26 + 1 >= v29)
      {
        v28 = 0;
        v29 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", __b, v59, 16);
        if (!v29)
          goto LABEL_9;
      }
    }
    v5 = -[ACUISettingsController _specifierForAccount:](v54, "_specifierForAccount:", v49);
    v6 = v50;
    v50 = v5;

    v47 = 2;
  }
  else
  {
LABEL_9:
    v47 = 0;
  }

  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v44 = (id)objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v52);
  if (v51)
    objc_msgSend(v44, "addObject:", v51);
  -[ACUISettingsController _filterAccounts:toTopLevel:grouped:ignoringGroups:](v54, "_filterAccounts:toTopLevel:grouped:ignoringGroups:", location[0], v46, v45, v44);
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  memset(v41, 0, sizeof(v41));
  v22 = v46;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", v41, v58, 16);
  if (v23)
  {
    v19 = *(_QWORD *)v41[2];
    v20 = 0;
    v21 = v23;
    while (1)
    {
      v18 = v20;
      if (*(_QWORD *)v41[2] != v19)
        objc_enumerationMutation(v22);
      v42 = *(id *)(v41[1] + 8 * v20);
      v16 = (id)objc_msgSend(v42, "identifier");
      v17 = objc_msgSend(v16, "isEqualToString:", v52);

      if ((v17 & 1) == 0)
      {
        v40 = -[ACUISettingsController _specifierForAccount:](v54, "_specifierForAccount:", v42);
        objc_msgSend(v43, "addObject:", v40);
        objc_storeStrong(&v40, 0);
      }
      ++v20;
      if (v18 + 1 >= v21)
      {
        v20 = 0;
        v21 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", v41, v58, 16);
        if (!v21)
          break;
      }
    }
  }

  memset(v38, 0, sizeof(v38));
  v14 = (id)objc_msgSend(v45, "allKeys");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v38, v57, 16);
  if (v15)
  {
    v11 = *(_QWORD *)v38[2];
    v12 = 0;
    v13 = v15;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)v38[2] != v11)
        objc_enumerationMutation(v14);
      v39 = *(_QWORD *)(v38[1] + 8 * v12);
      v37 = (id)objc_msgSend(v45, "objectForKey:", v39);
      v36 = -[ACUISettingsController _specifierForCollectionCellLinkingToAccounts:withGroupIdentifier:underParentGroup:](v54, "_specifierForCollectionCellLinkingToAccounts:withGroupIdentifier:underParentGroup:", v37, v39, v52);
      if (v36)
        objc_msgSend(v43, "addObject:", v36);
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v37, 0);
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", v38, v57, 16);
        if (!v13)
          break;
      }
    }
  }

  if ((objc_msgSend(v52, "isEqualToString:", *MEMORY[0x1E0C8F140]) & 1) != 0)
  {
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SUBSCRIBED_CALENDARS"), &stru_1E9A15E98, CFSTR("Localizable"));
    v35 = +[ACUIAccountCollectionLinkCell specifierWithTitle:accounts:](ACUIAccountCollectionLinkCell, "specifierWithTitle:accounts:");

    v55 = v35;
    v47 = 1;
    objc_storeStrong(&v35, 0);
  }
  else if (v50)
  {
    objc_msgSend(v50, "setProperty:forKey:", v43, CFSTR("ACUIAccountCollectionSpecifiers"));
    v55 = v50;
    v47 = 1;
  }
  else
  {
    oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v56, (uint64_t)"-[ACUISettingsController _specifierForCollectionCellLinkingToAccounts:withGroupIdentifier:underParentGroup:]", 663, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"No principle account specifier found, grouping can not be made for accounts %@\", v56, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v55 = 0;
    v47 = 1;
  }
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(&v50, 0);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(&v52, 0);
  objc_storeStrong(location, 0);
  return v55;
}

- (id)_specifierForAccount:(id)a3
{
  id v4;
  id v5;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = (id)objc_msgSend(location[0], "copy");
  v5 = +[ACUIAccountSummaryCell specifierWithStyle:account:target:controllerLoadAction:](ACUIAccountSummaryCell, "specifierWithStyle:account:target:controllerLoadAction:", 3);

  objc_storeStrong(location, 0);
  return v5;
}

- (id)_addAccountSpecifier
{
  PSSpecifier *v2;
  PSSpecifier *addAccountSpecifier;
  PSSpecifier *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  unsigned __int8 v10;

  if (!self->_addAccountSpecifier)
  {
    v7 = (void *)MEMORY[0x1E0D804E8];
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:");
    v2 = (PSSpecifier *)(id)objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, 0, objc_opt_class(), 1, 0);
    addAccountSpecifier = self->_addAccountSpecifier;
    self->_addAccountSpecifier = v2;

    -[PSSpecifier setProperty:forKey:](self->_addAccountSpecifier, "setProperty:forKey:", CFSTR("ADD_ACCOUNT"), *MEMORY[0x1E0D80868]);
    if (self->_filteredDataclass)
      -[PSSpecifier setProperty:forKey:](self->_addAccountSpecifier, "setProperty:forKey:", self->_filteredDataclass, *MEMORY[0x1E0D806F0]);
  }
  v10 = !-[ACUISettingsController _isAccountModificationDisabledByRestrictions](self, "_isAccountModificationDisabledByRestrictions");
  v5 = self->_addAccountSpecifier;
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  -[PSSpecifier setProperty:forKey:](v5, "setProperty:forKey:");

  return self->_addAccountSpecifier;
}

- (id)_specifierForScheduleSettings
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7[2];
  ACUISettingsController *v8;

  v8 = self;
  v7[1] = (id)a2;
  v4 = (void *)MEMORY[0x1E0D804E8];
  v6 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v6, "localizedStringForKey:value:table:");
  v7[0] = (id)objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);

  objc_msgSend(v7[0], "setProperty:forKey:", CFSTR("FETCH_NEW_DATA"), *MEMORY[0x1E0D80868]);
  objc_msgSend(v7[0], "setControllerLoadAction:", sel__scheduleSettingsCellWasTappedWithSpecifier_);
  if (-[ACUISettingsController _isAccountModificationDisabledByRestrictions](v8, "_isAccountModificationDisabledByRestrictions"))
  {
    objc_msgSend(v7[0], "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
  }
  v3 = v7[0];
  objc_storeStrong(v7, 0);
  return v3;
}

- (void)_scheduleSettingsCellWasTappedWithSpecifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id location[2];
  ACUISettingsController *v8;
  id v9;
  dispatch_once_t *v10;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  v10 = (dispatch_once_t *)&_scheduleSettingsCellWasTappedWithSpecifier__onceToken;
  v9 = 0;
  objc_storeStrong(&v9, &__block_literal_global_86);
  if (*v10 != -1)
    dispatch_once(v10, v9);
  objc_storeStrong(&v9, 0);
  v3 = objc_alloc_init((Class)objc_msgSend((id)_scheduleSettingsCellWasTappedWithSpecifier___scheduleSettingsBundle, "principalClass"));
  v4 = v6;
  v6 = v3;

  if (v6)
  {
    objc_msgSend(v6, "setSpecifier:", location[0]);
    objc_msgSend(v6, "setParentController:", v8);
    v5 = (id)-[ACUISettingsController rootController](v8, "rootController");
    objc_msgSend(v6, "setRootController:");

    -[ACUISettingsController showController:animate:](v8, "showController:animate:", v6, 1);
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

void __70__ACUISettingsController__scheduleSettingsCellWasTappedWithSpecifier___block_invoke(void *a1)
{
  id v1;
  void *v2;
  id v3[3];

  v3[2] = a1;
  v3[1] = a1;
  v3[0] = CFSTR("/System/Library/PreferenceBundles/ScheduleSettings.bundle");
  v1 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v3[0]);
  v2 = (void *)_scheduleSettingsCellWasTappedWithSpecifier___scheduleSettingsBundle;
  _scheduleSettingsCellWasTappedWithSpecifier___scheduleSettingsBundle = (uint64_t)v1;

  objc_storeStrong(v3, 0);
}

- (id)_scheduleSettingsModeForSpecifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;
  id v12;
  char v13;
  int ClassPollInterval;
  id v15;
  id location[3];
  id v17;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  v12 = (id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v13 = objc_msgSend(v12, "isLowPowerModeEnabled");

  if ((v13 & 1) != 0)
  {
    v11 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (id)objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OFF"), &stru_1E9A15E98, CFSTR("Localizable"));
    v4 = v15;
    v15 = v3;

    v17 = v15;
  }
  else
  {
    if (PCSettingsGetClassPushEnabled())
    {
      v10 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v5 = (id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PUSH"), &stru_1E9A15E98, CFSTR("Localizable"));
      v6 = v15;
      v15 = v5;

    }
    else
    {
      ClassPollInterval = PCSettingsGetClassPollInterval();
      v7 = ACUIFetchSettingTitle(ClassPollInterval);
      v8 = v15;
      v15 = v7;

    }
    v17 = v15;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (void)_fetchLazyLoadedSpecifiers
{
  NSObject *queue;
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(id *);
  void *v7;
  id v8[2];
  ACUISettingsController *v9;

  v9 = self;
  v8[1] = (id)a2;
  if (!self->_isLazyLoadingPluginSpecifiers)
  {
    v9->_isLazyLoadingPluginSpecifiers = 1;
    queue = dispatch_get_global_queue(-32768, 0);
    v3 = MEMORY[0x1E0C809B0];
    v4 = -1073741824;
    v5 = 0;
    v6 = __52__ACUISettingsController__fetchLazyLoadedSpecifiers__block_invoke;
    v7 = &unk_1E9A155C8;
    v8[0] = v9;
    dispatch_async(queue, &v3);

    objc_storeStrong(v8, 0);
  }
}

void __52__ACUISettingsController__fetchLazyLoadedSpecifiers__block_invoke(id *a1)
{
  id v1;
  void **v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *queue;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15);
  void *v16;
  id v17;
  id v18;
  id v19[3];

  v19[2] = a1;
  v19[1] = a1;
  v4 = a1[4];
  v6 = (id)objc_msgSend(v4, "_settingsPluginManager");
  v5 = (id)objc_msgSend(v6, "contactsSettingsPlugin");
  v19[0] = (id)objc_msgSend(v4, "_specifiersForSettingsProvidedByPlugin:");

  v7 = a1[4];
  v9 = (id)objc_msgSend(v7, "_settingsPluginManager");
  v8 = (id)objc_msgSend(v9, "calendarSettingsPlugin");
  v18 = (id)objc_msgSend(v7, "_specifiersForSettingsProvidedByPlugin:");

  v1 = (id)objc_msgSend(v19[0], "arrayByAddingObjectsFromArray:", v18);
  v2 = (void **)((char *)a1[4] + 1424);
  v3 = *v2;
  *v2 = v1;

  queue = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C809B0];
  v13 = -1073741824;
  v14 = 0;
  v15 = __52__ACUISettingsController__fetchLazyLoadedSpecifiers__block_invoke_2;
  v16 = &unk_1E9A155C8;
  v17 = a1[4];
  dispatch_async(queue, &v12);

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(v19, 0);
}

void __52__ACUISettingsController__fetchLazyLoadedSpecifiers__block_invoke_2(NSObject *a1)
{
  BOOL v1;
  id v2;
  id v3;
  double v4;
  double v5;
  int *v6;
  NSObject *v7;
  char *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id obj;
  uint64_t v15;
  os_log_t v17;
  os_log_type_t v18;
  os_log_t v19;
  char v20;
  id v21;
  _QWORD __b[8];
  char *v23;
  id location;
  id v25;
  os_log_type_t type;
  os_log_t oslog[3];
  uint8_t v28[48];
  uint8_t v29[48];
  _BYTE v30[128];
  uint8_t v31[40];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  oslog[2] = a1;
  oslog[1] = a1;
  oslog[0] = (os_log_t)_ACUILogSystem();
  type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v31, (uint64_t)"-[ACUISettingsController _fetchLazyLoadedSpecifiers]_block_invoke_2", 785, *((_QWORD *)a1[4].isa + 177));
    _os_log_debug_impl(&dword_1D573D000, oslog[0], type, "%s (%d) \"ACUISettingsController is removing loading-in-progress specifiers: %@\", v31, 0x1Cu);
  }
  objc_storeStrong((id *)oslog, 0);
  -[objc_class removeContiguousSpecifiers:](a1[4].isa, "removeContiguousSpecifiers:", *((_QWORD *)a1[4].isa + 177));
  v25 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  location = (id)objc_msgSend(*(id *)((char *)a1[4].isa + (int)*MEMORY[0x1E0D80590]), "lastObject");
  memset(__b, 0, sizeof(__b));
  obj = *((id *)a1[4].isa + 178);
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
  if (v15)
  {
    v11 = *(_QWORD *)__b[2];
    v12 = 0;
    v13 = v15;
    while (1)
    {
      v10 = v12;
      if (*(_QWORD *)__b[2] != v11)
        objc_enumerationMutation(obj);
      v23 = *(char **)(__b[1] + 8 * v12);
      v1 = *(_QWORD *)&v23[*MEMORY[0x1E0D805B0]] != 0;
      v20 = 0;
      v9 = 0;
      if (!v1)
      {
        v8 = v23;
        v21 = (id)objc_msgSend(*((id *)a1[4].isa + 178), "objectAtIndexedSubscript:", 0);
        v20 = 1;
        v9 = v8 != v21;
      }
      if ((v20 & 1) != 0)

      if (v9)
      {
        v19 = (os_log_t)_ACUILogSystem();
        v18 = OS_LOG_TYPE_DEBUG;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          v7 = v19;
          __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v29, (uint64_t)"-[ACUISettingsController _fetchLazyLoadedSpecifiers]_block_invoke", 793, (uint64_t)v25, (uint64_t)location);
          _os_log_debug_impl(&dword_1D573D000, v7, v18, "%s (%d) \"ACUISettingsController is inserting specifiers: %@ after specifier: %@\", v29, 0x26u);
        }
        objc_storeStrong((id *)&v19, 0);
        -[objc_class insertContiguousSpecifiers:afterSpecifier:animated:](a1[4].isa, "insertContiguousSpecifiers:afterSpecifier:animated:", v25, location, 0);
        v2 = (id)objc_msgSend(v25, "lastObject");
        v3 = location;
        location = v2;

        objc_msgSend(v25, "removeAllObjects");
      }
      objc_msgSend(v25, "addObject:", v23);
      ++v12;
      if (v10 + 1 >= v13)
      {
        v12 = 0;
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v30, 16);
        if (!v13)
          break;
      }
    }
  }

  if (objc_msgSend(v25, "count"))
  {
    v17 = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v28, (uint64_t)"-[ACUISettingsController _fetchLazyLoadedSpecifiers]_block_invoke", 803, (uint64_t)v25, (uint64_t)location);
      _os_log_debug_impl(&dword_1D573D000, v17, OS_LOG_TYPE_DEBUG, "%s (%d) \"ACUISettingsController is inserting specifiers: %@ after specifier: %@\", v28, 0x26u);
    }
    objc_storeStrong((id *)&v17, 0);
    -[objc_class insertContiguousSpecifiers:afterSpecifier:animated:](a1[4].isa, "insertContiguousSpecifiers:afterSpecifier:animated:", v25, location, 0);
  }
  objc_msgSend(*(id *)((char *)a1[4].isa + (int)*MEMORY[0x1E0D80598]), "contentOffset", MEMORY[0x1E0D80598]);
  objc_msgSend(*(id *)((char *)a1[4].isa + *v6), "setContentOffset:animated:", 0, v4, v5);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v25, 0);
}

- (id)_specifiersForSettingsProvidedByPlugin:(id)a3
{
  objc_class *v3;
  id v5;
  id v6;
  NSMutableDictionary *pluginToSpecifiersMap;
  NSString *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id location[2];
  ACUISettingsController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = (id)objc_msgSend(location[0], "specifiers");
  if (objc_msgSend(v14, "count"))
  {
    v13 = (id)objc_msgSend(v14, "mutableCopy");
    v10 = (void *)MEMORY[0x1E0D804E8];
    v11 = (id)objc_msgSend(location[0], "headerText");
    v12 = (id)objc_msgSend(v10, "groupSpecifierWithName:");

    objc_msgSend(v13, "insertObject:atIndex:", v12, 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v9 = (id)objc_msgSend(location[0], "footerText");
      objc_msgSend(v12, "setProperty:forKey:");

    }
    pluginToSpecifiersMap = v17->_pluginToSpecifiersMap;
    v6 = v13;
    v3 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v3);
    -[NSMutableDictionary setObject:forKey:](pluginToSpecifiersMap, "setObject:forKey:", v6);

    objc_msgSend(v15, "addObjectsFromArray:", v13);
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
  }
  v5 = v15;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)_specifiersForLoadingMessage
{
  id v2;
  NSArray *v3;
  NSArray *loadingInProgressSpecifiers;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id *v12;
  id v13;
  id v14[2];
  ACUISettingsController *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15 = self;
  v14[1] = (id)a2;
  if (!self->_loadingInProgressSpecifiers)
  {
    v10 = 0x1E0D80000uLL;
    v7 = (id)MEMORY[0x1E0D804E8];
    v6 = MEMORY[0x1E0CB34D0];
    v9 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (id)objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LOADING_CONTACTS_CALENDARS"), &stru_1E9A15E98, CFSTR("Localizable"));
    v13 = 0;
    v2 = (id)objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0);
    v12 = v14;
    v14[0] = v2;

    objc_msgSend(v14[0], "setProperty:forKey:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D80808]);
    v11 = (id)objc_msgSend(*(id *)(v10 + 1256), "emptyGroupSpecifier");
    v16[0] = v11;
    v16[1] = v14[0];
    v3 = (NSArray *)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    loadingInProgressSpecifiers = v15->_loadingInProgressSpecifiers;
    v15->_loadingInProgressSpecifiers = v3;

    objc_storeStrong(v12, v13);
  }
  return v15->_loadingInProgressSpecifiers;
}

- (void)_accountCellWasTappedWithSpecifier:(id)a3
{
  id v3;
  ACUIAccountViewProvidersManager *v4;
  id v5;
  id obj;
  os_log_type_t v7;
  os_log_t oslog;
  Class v9;
  int v10;
  os_log_type_t v11;
  id v12;
  id v13;
  id location[2];
  ACUISettingsController *v15;
  uint8_t v16[32];
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = (id)objc_msgSend(location[0], "propertyForKey:", CFSTR("account"));
  if (v13)
  {
    v4 = +[ACUIAccountViewProvidersManager sharedInstance](ACUIAccountViewProvidersManager, "sharedInstance");
    v9 = -[ACUIAccountViewProvidersManager viewControllerClassForViewingAccount:](v4, "viewControllerClassForViewingAccount:", v13);

    if (v9)
    {
      obj = objc_alloc_init(v9);
      objc_msgSend(obj, "setSpecifier:", location[0]);
      objc_msgSend(obj, "setAccountChangeObserver:", v15);
      if ((-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", objc_opt_class()) & 1) != 0
        || (-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
      {
        objc_msgSend(obj, "setParentController:", v15);
        v3 = (id)-[ACUISettingsController rootController](v15, "rootController");
        objc_msgSend(obj, "setRootController:");

        -[ACUISettingsController showController:animate:](v15, "showController:animate:", obj, 1);
      }
      else
      {
        v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D804E0]), "initWithRootViewController:", obj);
        objc_msgSend(v5, "setSpecifier:", location[0]);
        objc_msgSend(v5, "setParentController:", v15);
        objc_msgSend(obj, "setParentController:", v5);
        objc_msgSend(obj, "setRootController:", v5);
        -[ACUISettingsController showController:animate:](v15, "showController:animate:", v5, 1);
        objc_storeStrong(&v5, 0);
      }
      if (v15->_isInHandleURL)
        objc_storeStrong((id *)&v15->_viewControllerPushedByControllerLoadActionDuringHandleURL, obj);
      objc_storeStrong(&obj, 0);
      v10 = 0;
    }
    else
    {
      oslog = (os_log_t)_ACUILogSystem();
      v7 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v16, (uint64_t)"-[ACUISettingsController _accountCellWasTappedWithSpecifier:]", 866, (uint64_t)v13);
        _os_log_error_impl(&dword_1D573D000, oslog, v7, "%s (%d) \"No view controller available for account %@\", v16, 0x1Cu);
      }
      objc_storeStrong((id *)&oslog, 0);
      v10 = 1;
    }
  }
  else
  {
    v12 = _ACUILogSystem();
    v11 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v17, (uint64_t)"-[ACUISettingsController _accountCellWasTappedWithSpecifier:]", 860, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1D573D000, (os_log_t)v12, v11, "%s (%d) \"An account cell was tapped but had no account associated with it! %@\", v17, 0x1Cu);
    }
    objc_storeStrong(&v12, 0);
    v10 = 1;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_super v5;
  id v6;
  id v7;
  id location[2];
  ACUISettingsController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v6 = (id)objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.isa+ (int)*MEMORY[0x1E0D80590]), "objectAtIndex:", -[ACUISettingsController indexForIndexPath:](v9, "indexForIndexPath:", v7));
  objc_msgSend(*(id *)((char *)&v9->super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80598]), "deselectRowAtIndexPath:animated:", v7, 1);
  v5.receiver = v9;
  v5.super_class = (Class)ACUISettingsController;
  -[ACUISettingsController tableView:didSelectRowAtIndexPath:](&v5, sel_tableView_didSelectRowAtIndexPath_, location[0], v7);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)viewController:(id)a3 didFinishRemovingAccountWithSuccess:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16;
  char v17;
  id v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  ACUISettingsController *v27;
  char isKindOfClass;
  id v30;
  char v31;
  id v32;
  char v33;
  id v34;
  BOOL v35;
  id location[2];
  ACUISettingsController *v37;
  uint64_t v38;

  v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v35 = a4;
  if (a4)
  {
    v26 = (id)-[ACUISettingsController navigationController](v37, "navigationController");
    v27 = (ACUISettingsController *)(id)objc_msgSend(v26, "topViewController");
    v33 = 0;
    v31 = 0;
    isKindOfClass = 0;
    if (v27 != v37)
    {
      v34 = (id)-[ACUISettingsController navigationController](v37, "navigationController");
      v33 = 1;
      v32 = (id)objc_msgSend(v34, "topViewController");
      v31 = 1;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    if ((v31 & 1) != 0)

    if ((v33 & 1) != 0)
    if ((isKindOfClass & 1) != 0)
    {
      v22 = (id)-[ACUISettingsController navigationController](v37, "navigationController");
      v30 = (id)objc_msgSend(v22, "topViewController");

      v24 = (id)objc_msgSend(v30, "specifiers");
      v23 = (id)objc_msgSend(location[0], "specifier");
      v25 = objc_msgSend(v24, "containsObject:");

      if ((v25 & 1) != 0)
      {
        v18 = (id)objc_msgSend(location[0], "specifier");
        v38 = 0;
        v19 = (id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v20 = objc_msgSend(v19, "userInterfaceIdiom");

        v38 = v20;
        v21 = 1;
        if (v20 != 1)
          v21 = v38 == 5;
        objc_msgSend(v30, "removeSpecifier:animated:", v18, v21);

      }
      objc_storeStrong(&v30, 0);
    }
    objc_msgSend(location[0], "setParentController:");
    objc_msgSend(location[0], "setRootController:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = (id)-[ACUISettingsController navigationController](v37, "navigationController");
      v15 = (id)objc_msgSend(v16, "viewControllers");
      v17 = objc_msgSend(v15, "containsObject:", v37);

      if ((v17 & 1) != 0)
      {
        v14 = (id)-[ACUISettingsController navigationController](v37, "navigationController");
        v4 = (id)objc_msgSend(v14, "popToViewController:animated:", v37, 1);

      }
      else
      {
        v12 = (id)-[ACUISettingsController navigationController](v37, "navigationController");
        v11 = (id)objc_msgSend(v12, "viewControllers");
        v10 = (id)-[ACUISettingsController parentViewController](v37, "parentViewController");
        v13 = objc_msgSend(v11, "containsObject:");

        if ((v13 & 1) != 0)
        {
          v9 = (id)-[ACUISettingsController navigationController](v37, "navigationController");
          v8 = (id)-[ACUISettingsController parentViewController](v37, "parentViewController");
          v5 = (id)objc_msgSend(v9, "popToViewController:animated:");

        }
        else
        {
          v7 = (id)-[ACUISettingsController navigationController](v37, "navigationController");
          v6 = (id)objc_msgSend(v7, "popToRootViewControllerAnimated:", 1);

        }
      }
    }
    else
    {
      -[ACUISettingsController dismissViewControllerAnimated:completion:](v37, "dismissViewControllerAnimated:completion:", 1, 0);
    }
  }
  objc_storeStrong(location, 0);
}

- (BOOL)_isAccountModificationDisabledByRestrictions
{
  id v3;
  BOOL v4;

  v3 = (id)objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46ED8]) == 2;

  return v4;
}

- (void)specifiersDidChangeForPlugin:(id)a3
{
  objc_class *v3;
  NSMutableDictionary *pluginToSpecifiersMap;
  NSString *v5;
  os_log_t oslog;
  id v7;
  id v8;
  id location[2];
  ACUISettingsController *v10;
  uint8_t v11[40];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  pluginToSpecifiersMap = v10->_pluginToSpecifiersMap;
  v3 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v3);
  v8 = (id)-[NSMutableDictionary objectForKey:](pluginToSpecifiersMap, "objectForKey:");

  v7 = -[ACUISettingsController _specifiersForSettingsProvidedByPlugin:](v10, "_specifiersForSettingsProvidedByPlugin:", location[0]);
  oslog = (os_log_t)_ACUILogSystem();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_4_8_32_4_0_8_64_8_64((uint64_t)v11, (uint64_t)"-[ACUISettingsController specifiersDidChangeForPlugin:]", 957, (uint64_t)v8, (uint64_t)v7);
    _os_log_debug_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_DEBUG, "%s (%d) \"replacing specifiers %@ with specifiers %@\", v11, 0x26u);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[ACUISettingsController replaceContiguousSpecifiers:withSpecifiers:animated:](v10, "replaceContiguousSpecifiers:withSpecifiers:animated:", v8, v7, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)accountWasAdded:(id)a3
{
  id location[2];
  ACUISettingsController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ACUISettingsController _accountStoreDidChange](v4, "_accountStoreDidChange");
  objc_storeStrong(location, 0);
}

- (void)accountWasModified:(id)a3
{
  id location[2];
  ACUISettingsController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ACUISettingsController _accountStoreDidChange](v4, "_accountStoreDidChange");
  objc_storeStrong(location, 0);
}

- (void)accountWasRemoved:(id)a3
{
  id location[2];
  ACUISettingsController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[ACUISettingsController _accountStoreDidChange](v4, "_accountStoreDidChange");
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierLoadGroup, 0);
  objc_storeStrong((id *)&self->_filteredDataclass, 0);
  objc_storeStrong((id *)&self->_viewControllerPushedByControllerLoadActionDuringHandleURL, 0);
  objc_storeStrong((id *)&self->_settingsPluginManager, 0);
  objc_storeStrong((id *)&self->_pluginToSpecifiersMap, 0);
  objc_storeStrong((id *)&self->_lazyLoadedSpecifiers, 0);
  objc_storeStrong((id *)&self->_loadingInProgressSpecifiers, 0);
  objc_storeStrong((id *)&self->_addAccountSpecifier, 0);
  objc_storeStrong((id *)&self->_accountGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_accountSpecifiers, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
