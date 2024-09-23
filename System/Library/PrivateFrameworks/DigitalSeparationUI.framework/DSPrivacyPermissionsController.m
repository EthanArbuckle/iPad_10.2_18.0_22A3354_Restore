@implementation DSPrivacyPermissionsController

- (DSPrivacyPermissionsController)init
{
  DSPrivacyPermissionsController *v2;
  NSMutableSet *v3;
  NSMutableSet *selectedApps;
  NSArray *v5;
  NSArray *sensors;
  NSMutableSet *v7;
  NSMutableSet *selectedSensors;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DSPrivacyPermissionsController;
  v2 = -[DSTableWelcomeController initWithTitle:detailText:icon:shouldShowSearchBar:](&v15, sel_initWithTitle_detailText_icon_shouldShowSearchBar_, &stru_24EFF4790, &stru_24EFF4790, 0, 1);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    selectedApps = v2->_selectedApps;
    v2->_selectedApps = v3;

    v5 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    sensors = v2->_sensors;
    v2->_sensors = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    selectedSensors = v2->_selectedSensors;
    v2->_selectedSensors = v7;

    DSUILocStringForKey(CFSTR("SKIP"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpBoldButtonForController:title:target:selector:](DSUIUtilities, "setUpBoldButtonForController:title:target:selector:", v2, v9, v2, sel__pushNextPane);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setBoldButton:](v2, "setBoldButton:", v10);

    DSUILocStringForKey(CFSTR("STOP_ALL_APP_SHARING"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities setUpLinkButtonForController:title:target:selector:](DSUIUtilities, "setUpLinkButtonForController:title:target:selector:", v2, v11, v2, sel_resetAllPermissions);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController setLinkButton:](v2, "setLinkButton:", v12);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_reloadData, *MEMORY[0x24BEBE008], 0);

  }
  return v2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  DSAppSharing *v12;
  DSAppSharing *appSharing;
  DSAppSharing *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id location;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)DSPrivacyPermissionsController;
  -[DSTableWelcomeController viewDidLoad](&v20, sel_viewDidLoad);
  DSUILocStringForKey(CFSTR("BY_APP"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  DSUILocStringForKey(CFSTR("BY_PERMISSION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScopeButtonTitles:", v5);

  DSUILocStringForKey(CFSTR("SEARCH_PRIVACY_APPS_PLACEHOLDER"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchBar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPlaceholder:", v8);

  v11 = objc_alloc_init(MEMORY[0x24BE2CC90]);
  v12 = (DSAppSharing *)objc_msgSend(objc_alloc(MEMORY[0x24BE2CC50]), "initWithTCCStore:", v11);
  appSharing = self->_appSharing;
  self->_appSharing = v12;

  -[DSTableWelcomeController startContentSpinner](self, "startContentSpinner");
  objc_initWeak(&location, self);
  v14 = self->_appSharing;
  objc_msgSend(MEMORY[0x24BE2CC98], "allUserVisibleApps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC9B8];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __45__DSPrivacyPermissionsController_viewDidLoad__block_invoke;
  v17[3] = &unk_24EFF34C8;
  objc_copyWeak(&v18, &location);
  v17[4] = self;
  -[DSAppSharing collectPermissionsForApps:queue:handler:](v14, "collectPermissionsForApps:queue:handler:", v15, MEMORY[0x24BDAC9B8], v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __45__DSPrivacyPermissionsController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setApps:", v5);
    objc_msgSend(v8, "stopContentSpinner");
    if (objc_msgSend(v6, "count"))
    {
      DSUILocStringForKey(CFSTR("COLLECT_APP_PERMISSIONS_FAILED_TITLE"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      DSUILocStringForKey(CFSTR("COLLECT_APP_PERMISSIONS_FAILED"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __45__DSPrivacyPermissionsController_viewDidLoad__block_invoke_3;
      v11[3] = &unk_24EFF3418;
      v11[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v8, "presentErrorAlertWithTitle:message:continueHandler:tryAgainHandler:", v9, v10, &__block_literal_global_0, v11);

    }
  }

}

uint64_t __45__DSPrivacyPermissionsController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (void)resetAllPermissions
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
  _QWORD v12[5];

  v3 = (void *)MEMORY[0x24BEBD3B0];
  DSUILocStringForKey(CFSTR("RESET_ALL_PERMISSIONS_CONFIRMATION"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", 0, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("CANCEL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, &__block_literal_global_227);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BEBD3A8];
  DSUILocStringForKey(CFSTR("STOP_ALL_APP_SHARING_CONFIRMATION"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__DSPrivacyPermissionsController_resetAllPermissions__block_invoke_2;
  v12[3] = &unk_24EFF3418;
  v12[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 2, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addAction:", v11);
  objc_msgSend(v5, "addAction:", v8);
  -[DSPrivacyPermissionsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

void __53__DSPrivacyPermissionsController_resetAllPermissions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id location;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showButtonsBusy");

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "appSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(MEMORY[0x24BE2CC98], "tccServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2CC98], "allUserVisibleApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC9B8];
  v11 = MEMORY[0x24BDAC9B8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__DSPrivacyPermissionsController_resetAllPermissions__block_invoke_3;
  v12[3] = &unk_24EFF3510;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "resetPermissions:forApps:queue:handler:", v8, v9, v10, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __53__DSPrivacyPermissionsController_resetAllPermissions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = (void *)MEMORY[0x24BE2CC98];
  v6 = a2;
  objc_msgSend(v5, "tccServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "apps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addUnsharedPermissions:andApps:", v8, v11);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleResetErrors:pushNextPane:", v6, 1);

}

- (void)resetSelectedPermissions
{
  void *v3;
  unint64_t scope;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id location;

  -[DSPrivacyPermissionsController buttonTray](self, "buttonTray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showButtonsBusy");

  objc_initWeak(&location, self);
  scope = self->_scope;
  if (!scope)
  {
    -[DSPrivacyPermissionsController appSharing](self, "appSharing");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend(MEMORY[0x24BE2CC98], "tccServices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPrivacyPermissionsController selectedApps](self, "selectedApps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("appID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC9B8];
    v12 = MEMORY[0x24BDAC9B8];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke;
    v27[3] = &unk_24EFF3510;
    v27[4] = self;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v5, "resetPermissions:forApps:queue:handler:", v8, v10, v11, v27);

    objc_destroyWeak(&v28);
    scope = self->_scope;
  }
  if (scope == 1)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    -[DSPrivacyPermissionsController selectedSensors](self, "selectedSensors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke_2;
    v25[3] = &unk_24EFF3538;
    v16 = v13;
    v26 = v16;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v25);

    -[DSPrivacyPermissionsController appSharing](self, "appSharing");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE2CC98], "allUserVisibleApps");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x24BDAC9B8];
    v20 = MEMORY[0x24BDAC9B8];
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke_3;
    v22[3] = &unk_24EFF3560;
    v22[4] = self;
    v21 = v16;
    v23 = v21;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v17, "resetPermissions:forApps:queue:handler:", v21, v18, v19, v22);

    objc_destroyWeak(&v24);
  }
  objc_destroyWeak(&location);
}

void __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = (void *)MEMORY[0x24BE2CC98];
  v6 = a2;
  objc_msgSend(v5, "tccServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "selectedApps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addUnsharedPermissions:andApps:", v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleResetErrors:pushNextPane:", v6, 1);

}

void __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "tccPermission");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __58__DSPrivacyPermissionsController_resetSelectedPermissions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = a2;
  objc_msgSend(v3, "apps");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addUnsharedPermissions:andApps:", v4, v8);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "handleResetErrors:pushNextPane:", v6, 1);

}

- (void)returnFromDetailAndResetSelectedPermissions:(id)a3 forApp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id location;
  _QWORD v25[4];
  id v26;

  v6 = a3;
  v7 = a4;
  -[DSPrivacyPermissionsController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showButtonsBusy");

  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v10 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __85__DSPrivacyPermissionsController_returnFromDetailAndResetSelectedPermissions_forApp___block_invoke;
  v25[3] = &unk_24EFF3588;
  v11 = v9;
  v26 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
  objc_initWeak(&location, self);
  -[DSPrivacyPermissionsController appSharing](self, "appSharing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "appID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC9B8];
  v17 = MEMORY[0x24BDAC9B8];
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __85__DSPrivacyPermissionsController_returnFromDetailAndResetSelectedPermissions_forApp___block_invoke_2;
  v20[3] = &unk_24EFF35B0;
  v20[4] = self;
  v18 = v11;
  v21 = v18;
  v19 = v7;
  v22 = v19;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v12, "resetPermissions:forApps:queue:handler:", v18, v15, v16, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __85__DSPrivacyPermissionsController_returnFromDetailAndResetSelectedPermissions_forApp___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "tccPermission");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __85__DSPrivacyPermissionsController_returnFromDetailAndResetSelectedPermissions_forApp___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id WeakRetained;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = *(_QWORD *)(a1 + 48);
  v7 = a2;
  objc_msgSend(v5, "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addUnsharedPermissions:andApps:", v4, v8);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "handleResetErrors:pushNextPane:", v7, 0);

}

- (void)returnFromDetailAndDeleteApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];

  v4 = a3;
  -[DSPrivacyPermissionsController appSharing](self, "appSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "deleteApp:forTest:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && objc_msgSend(v7, "code") == 8)
  {
    objc_msgSend(MEMORY[0x24BEBD3B0], "ds_alertControllerWithAppDeletionError:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BEBD3A8];
    DSUILocStringForKey(CFSTR("OK"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __63__DSPrivacyPermissionsController_returnFromDetailAndDeleteApp___block_invoke;
    v14[3] = &unk_24EFF3418;
    v14[4] = self;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    -[DSPrivacyPermissionsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }
  -[DSPrivacyPermissionsController reloadData](self, "reloadData");
  -[DSPrivacyPermissionsController navigationController](self, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 1);

}

void __63__DSPrivacyPermissionsController_returnFromDetailAndDeleteApp___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showButtonsAvailable");

}

- (void)returnFromDetailAndResetPermissionForSelectedApps:(id)a3 permission:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id location;
  _QWORD v25[4];
  id v26;

  v6 = a3;
  v7 = a4;
  -[DSPrivacyPermissionsController buttonTray](self, "buttonTray");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "showButtonsBusy");

  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v10 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __95__DSPrivacyPermissionsController_returnFromDetailAndResetPermissionForSelectedApps_permission___block_invoke;
  v25[3] = &unk_24EFF35D8;
  v11 = v9;
  v26 = v11;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);
  objc_initWeak(&location, self);
  -[DSPrivacyPermissionsController appSharing](self, "appSharing");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "tccPermission");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC9B8];
  v17 = MEMORY[0x24BDAC9B8];
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __95__DSPrivacyPermissionsController_returnFromDetailAndResetPermissionForSelectedApps_permission___block_invoke_2;
  v20[3] = &unk_24EFF35B0;
  v20[4] = self;
  v18 = v7;
  v21 = v18;
  v19 = v6;
  v22 = v19;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v12, "resetPermissions:forApps:queue:handler:", v15, v11, v16, v20);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

void __95__DSPrivacyPermissionsController_returnFromDetailAndResetPermissionForSelectedApps_permission___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "appID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __95__DSPrivacyPermissionsController_returnFromDetailAndResetPermissionForSelectedApps_permission___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "tccPermission");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addUnsharedPermissions:andApps:", v8, v9);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "handleResetErrors:pushNextPane:", v6, 0);

}

- (void)returnFromDetailAndStopAllSharingForPermission:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id location;

  v4 = a3;
  -[DSPrivacyPermissionsController buttonTray](self, "buttonTray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "showButtonsBusy");

  objc_initWeak(&location, self);
  -[DSPrivacyPermissionsController appSharing](self, "appSharing");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "tccPermission");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2CC98], "allUserVisibleApps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC9B8];
  v12 = MEMORY[0x24BDAC9B8];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __81__DSPrivacyPermissionsController_returnFromDetailAndStopAllSharingForPermission___block_invoke;
  v14[3] = &unk_24EFF3560;
  v14[4] = self;
  v13 = v4;
  v15 = v13;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v6, "resetPermissions:forApps:queue:handler:", v9, v10, v11, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

void __81__DSPrivacyPermissionsController_returnFromDetailAndStopAllSharingForPermission___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "tccPermission");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "apps");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addUnsharedPermissions:andApps:", v8, v11);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "handleResetErrors:pushNextPane:", v6, 0);

}

- (void)handleResetErrors:(id)a3 pushNextPane:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x24BE2CC68], "errorWithCode:underlyingErrors:", 4, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD3B0], "ds_alertControllerWithStopPermissionSharingError:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BEBD3A8];
    DSUILocStringForKey(CFSTR("OK"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __65__DSPrivacyPermissionsController_handleResetErrors_pushNextPane___block_invoke;
    v15[3] = &unk_24EFF3418;
    v15[4] = self;
    objc_msgSend(v9, "actionWithTitle:style:handler:", v10, 1, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v11);

    -[DSPrivacyPermissionsController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }
  else
  {
    -[DSPrivacyPermissionsController reloadData](self, "reloadData");
    if (v4)
    {
      -[DSPrivacyPermissionsController _pushNextPane](self, "_pushNextPane");
    }
    else
    {
      -[DSPrivacyPermissionsController navigationController](self, "navigationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v12, "popViewControllerAnimated:", 1);

    }
    -[DSPrivacyPermissionsController buttonTray](self, "buttonTray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "showButtonsAvailable");

  }
}

void __65__DSPrivacyPermissionsController_handleResetErrors_pushNextPane___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSelectedSensors:", v2);

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSelectedApps:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_updateButton");
  objc_msgSend(*(id *)(a1 + 32), "reloadData");
  objc_msgSend(*(id *)(a1 + 32), "buttonTray");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showButtonsAvailable");

}

- (void)collectPermissionsByType
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  NSArray *sensors;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_apps;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x24BE2CC48], "ensureApp:inSensorDict:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8++), v3, (_QWORD)v11);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BE2CC48], "sortSensorDict:", v3);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sensors = self->_sensors;
  self->_sensors = v9;

}

- (void)setApps:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;

  objc_storeStrong((id *)&self->_apps, a3);
  v5 = a3;
  v6 = objc_msgSend(v5, "count");

  -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", v6 == 0);
  -[DSPrivacyPermissionsController collectPermissionsByType](self, "collectPermissionsByType");
  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  -[DSPrivacyPermissionsController _updateButton](self, "_updateButton");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DSPrivacyPermissionsController;
  -[OBTableWelcomeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[DSPrivacyPermissionsController _updateButton](self, "_updateButton");
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "searchBar");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyPermissionsController filterContentForSearchText:category:](self, "filterContentForSearchText:category:", v4, objc_msgSend(v6, "selectedScopeButtonIndex"));

}

- (void)searchBar:(id)a3 selectedScopeButtonIndexDidChange:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[DSPrivacyPermissionsController headerView](self, "headerView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    DSUILocStringForKey(CFSTR("PRIVACY_PERMISSIONS_INFORMATION"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v7);

    -[DSPrivacyPermissionsController headerView](self, "headerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("PRIVACY_PERMISSIONS_DETAIL_PERMISSIONS"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDetailText:", v9);

    v10 = CFSTR("SEARCH_PRIVACY_INFORMATION_PLACEHOLDER");
  }
  else
  {
    DSUILocStringForKey(CFSTR("PRIVACY_PERMISSIONS_APPS"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v11);

    -[DSPrivacyPermissionsController headerView](self, "headerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("PRIVACY_PERMISSIONS_DETAIL_APPS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDetailText:", v13);

    v10 = CFSTR("SEARCH_PRIVACY_APPS_PLACEHOLDER");
  }
  DSUILocStringForKey(v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSTableWelcomeController searchController](self, "searchController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "searchBar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPlaceholder:", v14);

  -[DSTableWelcomeController searchController](self, "searchController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DSPrivacyPermissionsController filterContentForSearchText:category:](self, "filterContentForSearchText:category:", v19, a4);

  self->_scope = a4;
  -[DSPrivacyPermissionsController _updateButton](self, "_updateButton");
}

- (void)filterContentForSearchText:(id)a3 category:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_scope)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("localizedName contains[c] %@"), a4, a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[DSPrivacyPermissionsController sensors](self, "sensors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPrivacyPermissionsController setFilteredSensors:](self, "setFilteredSensors:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("displayName contains[c] %@"), a4, a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[DSPrivacyPermissionsController apps](self, "apps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPrivacyPermissionsController setFilteredApps:](self, "setFilteredApps:", v6);
  }

  -[DSPrivacyPermissionsController headerView](self, "headerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", &stru_24EFF4790);

  -[DSPrivacyPermissionsController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDetailText:", &stru_24EFF4790);

  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  unint64_t scope;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v5 = a4;
  scope = self->_scope;
  v7 = -[DSTableWelcomeController isFiltering](self, "isFiltering");
  if (scope == 1)
  {
    if (v7)
      -[DSPrivacyPermissionsController filteredSensors](self, "filteredSensors");
    else
      -[DSPrivacyPermissionsController sensors](self, "sensors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BE2CC48];
    -[DSPrivacyPermissionsController apps](self, "apps");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedDescriptionFromApps:permission:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x24BE2CC48];
    objc_msgSend(v9, "tccPermission");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iconForPermission:tableFormat:", v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[OBTableWelcomeController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedName");
    v17 = objc_claimAutoreleasedReturnValue();
    +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v16, v17, v12, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setAccessoryType:", 4);
    objc_msgSend(v18, "setEditingAccessoryType:", 4);
    -[DSPrivacyPermissionsController selectedSensors](self, "selectedSensors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = objc_msgSend(v19, "containsObject:", v9);

    if ((v17 & 1) != 0)
    {
LABEL_8:
      -[OBTableWelcomeController tableView](self, "tableView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "selectRowAtIndexPath:animated:scrollPosition:", v5, 1, 0);

    }
  }
  else
  {
    if (v7)
      -[DSPrivacyPermissionsController filteredApps](self, "filteredApps");
    else
      -[DSPrivacyPermissionsController apps](self, "apps");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE2CC48], "localizedDescriptionFromPermissions:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSUIUtilities appIconForAppID:format:](DSUIUtilities, "appIconForAppID:format:", v24, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[OBTableWelcomeController tableView](self, "tableView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[DSIconTableViewCell iconTableViewCellFromTableView:withText:detail:icon:](DSIconTableViewCell, "iconTableViewCellFromTableView:withText:detail:icon:", v25, v26, v12, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setAccessoryType:", 4);
    objc_msgSend(v18, "setEditingAccessoryType:", 4);
    -[DSPrivacyPermissionsController selectedApps](self, "selectedApps");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v27, "containsObject:", v9);

    if ((_DWORD)v26)
      goto LABEL_8;
  }
  v21 = v18;

  return v21;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  unint64_t scope;
  BOOL v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  scope = self->_scope;
  v7 = -[DSTableWelcomeController isFiltering](self, "isFiltering");
  if (scope)
  {
    if (v7)
      -[DSPrivacyPermissionsController filteredSensors](self, "filteredSensors");
    else
      -[DSPrivacyPermissionsController sensors](self, "sensors");
  }
  else if (v7)
  {
    -[DSPrivacyPermissionsController filteredApps](self, "filteredApps");
  }
  else
  {
    -[DSPrivacyPermissionsController apps](self, "apps");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = objc_msgSend(v8, "count");

  if (-[DSTableWelcomeController isFiltering](self, "isFiltering"))
  {
    if (v10)
    {
      -[DSTableWelcomeController hideNoResultsView](self, "hideNoResultsView");
    }
    else
    {
      -[DSTableWelcomeController searchController](self, "searchController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "searchBar");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[DSTableWelcomeController showNoResultsViewWithSearchText:](self, "showNoResultsViewWithSearchText:", v13);

    }
  }
  else if (v10)
  {
    -[DSTableWelcomeController hideNoSharingView](self, "hideNoSharingView");
    -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", 0);
    -[DSPrivacyPermissionsController _updateButton](self, "_updateButton");
    -[DSPrivacyPermissionsController _updateTitle](self, "_updateTitle");
  }
  else
  {
    DSUILocStringForKey(CFSTR("NO_SHARING_APPS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:", CFSTR("app.3.stack.3d.fill"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController showNoSharingViewWithText:image:](self, "showNoSharingViewWithText:image:", v14, v15);

    -[DSTableWelcomeController setIsModelEmpty:](self, "setIsModelEmpty:", 1);
    -[DSPrivacyPermissionsController _updateButton](self, "_updateButton");
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t scope;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  scope = self->_scope;
  v8 = -[DSTableWelcomeController isFiltering](self, "isFiltering");
  if (scope)
  {
    -[DSPrivacyPermissionsController selectedSensors](self, "selectedSensors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[DSPrivacyPermissionsController filteredSensors](self, "filteredSensors");
    else
      -[DSPrivacyPermissionsController sensors](self, "sensors");
  }
  else
  {
    -[DSPrivacyPermissionsController selectedApps](self, "selectedApps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[DSPrivacyPermissionsController filteredApps](self, "filteredApps");
    else
      -[DSPrivacyPermissionsController apps](self, "apps");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  -[DSPrivacyPermissionsController _updateButton](self, "_updateButton");
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v6;
  unint64_t scope;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  scope = self->_scope;
  v8 = -[DSTableWelcomeController isFiltering](self, "isFiltering");
  if (scope)
  {
    -[DSPrivacyPermissionsController selectedSensors](self, "selectedSensors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[DSPrivacyPermissionsController filteredSensors](self, "filteredSensors");
    else
      -[DSPrivacyPermissionsController sensors](self, "sensors");
  }
  else
  {
    -[DSPrivacyPermissionsController selectedApps](self, "selectedApps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[DSPrivacyPermissionsController filteredApps](self, "filteredApps");
    else
      -[DSPrivacyPermissionsController apps](self, "apps");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObject:", v12);

  -[DSPrivacyPermissionsController _updateButton](self, "_updateButton");
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  unint64_t scope;
  _BOOL4 v6;
  void *v7;
  void *v8;
  DSPrivacyPermissionDetailController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  DSPrivacyPermissionDetailController *v16;
  void *v17;
  DSPrivacyAppDetailController *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  scope = self->_scope;
  v6 = -[DSTableWelcomeController isFiltering](self, "isFiltering");
  if (scope)
  {
    if (v6)
      -[DSPrivacyPermissionsController filteredSensors](self, "filteredSensors");
    else
      -[DSPrivacyPermissionsController sensors](self, "sensors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v21, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = [DSPrivacyPermissionDetailController alloc];
    objc_msgSend(v8, "localizedName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("PRIVACY_PERMISSIONS_INFORMATION_DETAIL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSPrivacyPermissionsController apps](self, "apps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DSPrivacyPermissionDetailController initWithTitle:detailText:symbolName:permission:apps:](v9, "initWithTitle:detailText:symbolName:permission:apps:", v10, v14, 0, v8, v15);

  }
  else
  {
    if (v6)
      -[DSPrivacyPermissionsController filteredApps](self, "filteredApps");
    else
      -[DSPrivacyPermissionsController apps](self, "apps");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", objc_msgSend(v21, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = [DSPrivacyAppDetailController alloc];
    objc_msgSend(v8, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD17C8];
    DSUILocStringForKey(CFSTR("PRIVACY_PERMISSIONS_APP_DETAIL"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringWithFormat:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[DSPrivacyAppDetailController initWithTitle:detailText:symbolName:app:](v18, "initWithTitle:detailText:symbolName:app:", v10, v14, 0, v8);
  }

  -[DSPrivacyPermissionDetailController setDelegate:](v16, "setDelegate:", self);
  -[DSPrivacyPermissionsController navigationController](self, "navigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "pushViewController:animated:", v16, 1);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  if ((-[DSTableWelcomeController isKeyboardActive](self, "isKeyboardActive")
     || -[DSTableWelcomeController isFiltering](self, "isFiltering"))
    && !-[DSTableWelcomeController isShowingNoResultsView](self, "isShowingNoResultsView"))
  {
    if (self->_scope)
      v8 = CFSTR("SEARCH_PRIVACY_TITLE_INFORMATION");
    else
      v8 = CFSTR("SEARCH_PRIVACY_TITLE_APPS");
    DSUILocStringForKey(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("header"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultContentConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);
    objc_msgSend(v7, "setContentConfiguration:", v10);

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)DSPrivacyPermissionsController;
    -[DSTableWelcomeController tableView:viewForHeaderInSection:](&v12, sel_tableView_viewForHeaderInSection_, v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)reloadData
{
  DSAppSharing *appSharing;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id location;

  objc_initWeak(&location, self);
  appSharing = self->_appSharing;
  objc_msgSend(MEMORY[0x24BE2CC98], "allUserVisibleApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC9B8];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__DSPrivacyPermissionsController_reloadData__block_invoke;
  v7[3] = &unk_24EFF34C8;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  -[DSAppSharing collectPermissionsForApps:queue:handler:](appSharing, "collectPermissionsForApps:queue:handler:", v4, v5, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __44__DSPrivacyPermissionsController_reloadData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = objc_msgSend(v6, "count");

  if (v8)
  {
    DSUILocStringForKey(CFSTR("COLLECT_APP_PERMISSIONS_FAILED_TITLE"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("COLLECT_APP_PERMISSIONS_FAILED"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __44__DSPrivacyPermissionsController_reloadData__block_invoke_3;
    v19[3] = &unk_24EFF3418;
    v20 = WeakRetained;
    objc_msgSend(v20, "presentErrorAlertWithTitle:message:continueHandler:tryAgainHandler:", v9, v10, &__block_literal_global_280, v19);

  }
  if (WeakRetained)
    objc_msgSend(WeakRetained, "setApps:", v5);
  objc_msgSend(*(id *)(a1 + 32), "selectedSensors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "sensors");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "intersectSet:", v14);

  objc_msgSend(*(id *)(a1 + 32), "selectedApps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "apps");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "intersectSet:", v18);

  objc_msgSend(*(id *)(a1 + 32), "_updateButton");
}

uint64_t __44__DSPrivacyPermissionsController_reloadData__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadData");
}

- (void)addUnsharedPermissions:(id)a3 andApps:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  -[DSPrivacyPermissionsController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2CC48], "enumerateAppPermissionPairsFromApps:permissions:", v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__DSPrivacyPermissionsController_addUnsharedPermissions_andApps___block_invoke;
  v11[3] = &unk_24EFF3648;
  v12 = v8;
  v9 = v8;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

}

void __65__DSPrivacyPermissionsController_addUnsharedPermissions_andApps___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t);
  void *v13;
  const __CFString *v14;
  uint64_t i;
  void *v16;
  id (*v17)(uint64_t);
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "unsharedPermissions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v5);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    v11 = MEMORY[0x24BDAC760];
    v12 = __65__DSPrivacyPermissionsController_addUnsharedPermissions_andApps___block_invoke_2;
    v13 = &unk_24EFF3620;
    v14 = CFSTR("com.apple.DigitalSeparation.RevokedPermissions");
    v25 = v5;
    v26 = a1;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "unsharedApps");
          v17 = v12;
          v18 = v11;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "appID");
          v20 = v14;
          v21 = v13;
          v22 = v9;
          v23 = v10;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v24);

          v10 = v23;
          v9 = v22;
          v13 = v21;
          v14 = v20;

          v11 = v18;
          v12 = v17;
          v5 = v25;
          a1 = v26;
        }
        v28 = v5;
        AnalyticsSendEventLazy();

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v9);
  }

}

id __65__DSPrivacyPermissionsController_addUnsharedPermissions_andApps___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v6[0] = CFSTR("permission");
  v6[1] = CFSTR("app");
  v7[0] = v2;
  objc_msgSend(v1, "appID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_pushNextPane
{
  void *v3;
  id v4;

  -[DSPrivacyPermissionsController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pushNextPane");

  -[DSTableWelcomeController searchController](self, "searchController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 0);

}

- (void)_updateTitle
{
  unint64_t scope;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  scope = self->_scope;
  -[DSPrivacyPermissionsController headerView](self, "headerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (scope)
  {
    DSUILocStringForKey(CFSTR("PRIVACY_PERMISSIONS_INFORMATION"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);

    -[DSPrivacyPermissionsController headerView](self, "headerView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("PRIVACY_PERMISSIONS_DETAIL_PERMISSIONS");
  }
  else
  {
    DSUILocStringForKey(CFSTR("PRIVACY_PERMISSIONS_APPS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v7);

    -[DSPrivacyPermissionsController headerView](self, "headerView");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("PRIVACY_PERMISSIONS_DETAIL_APPS");
  }
  DSUILocStringForKey(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDetailText:", v8);

}

- (void)_updateButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;

  if (-[DSPrivacyPermissionsController scope](self, "scope"))
    -[DSPrivacyPermissionsController selectedSensors](self, "selectedSensors");
  else
    -[DSPrivacyPermissionsController selectedApps](self, "selectedApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[DSTableWelcomeController boldButton](self, "boldButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeTarget:action:forControlEvents:", 0, 0, 0xFFFFFFFFLL);

  if (v4)
  {
    -[DSTableWelcomeController boldButton](self, "boldButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    DSUILocStringForKey(CFSTR("STOP_ACCESS"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:forState:", v7, 0);

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", self, sel_resetSelectedPermissions, 64);
  }
  else
  {
    if (-[DSTableWelcomeController isModelEmpty](self, "isModelEmpty"))
      v9 = CFSTR("CONTINUE");
    else
      v9 = CFSTR("SKIP");
    DSUILocStringForKey(v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DSTableWelcomeController boldButton](self, "boldButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:forState:", v8, 0);

    -[DSTableWelcomeController boldButton](self, "boldButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__pushNextPane, 64);

  }
  -[DSTableWelcomeController hideButtonsIfSearching](self, "hideButtonsIfSearching");
}

- (DSNavigationDelegate)delegate
{
  return (DSNavigationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DSAppSharing)appSharing
{
  return self->_appSharing;
}

- (void)setAppSharing:(id)a3
{
  objc_storeStrong((id *)&self->_appSharing, a3);
}

- (NSArray)apps
{
  return self->_apps;
}

- (NSArray)filteredApps
{
  return self->_filteredApps;
}

- (void)setFilteredApps:(id)a3
{
  objc_storeStrong((id *)&self->_filteredApps, a3);
}

- (BOOL)isFiltered
{
  return self->_isFiltered;
}

- (void)setIsFiltered:(BOOL)a3
{
  self->_isFiltered = a3;
}

- (NSMutableSet)selectedApps
{
  return self->_selectedApps;
}

- (void)setSelectedApps:(id)a3
{
  objc_storeStrong((id *)&self->_selectedApps, a3);
}

- (unint64_t)scope
{
  return self->_scope;
}

- (void)setScope:(unint64_t)a3
{
  self->_scope = a3;
}

- (NSArray)sensors
{
  return self->_sensors;
}

- (void)setSensors:(id)a3
{
  objc_storeStrong((id *)&self->_sensors, a3);
}

- (NSMutableSet)selectedSensors
{
  return self->_selectedSensors;
}

- (void)setSelectedSensors:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSensors, a3);
}

- (NSArray)filteredSensors
{
  return self->_filteredSensors;
}

- (void)setFilteredSensors:(id)a3
{
  objc_storeStrong((id *)&self->_filteredSensors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filteredSensors, 0);
  objc_storeStrong((id *)&self->_selectedSensors, 0);
  objc_storeStrong((id *)&self->_sensors, 0);
  objc_storeStrong((id *)&self->_selectedApps, 0);
  objc_storeStrong((id *)&self->_filteredApps, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_appSharing, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
