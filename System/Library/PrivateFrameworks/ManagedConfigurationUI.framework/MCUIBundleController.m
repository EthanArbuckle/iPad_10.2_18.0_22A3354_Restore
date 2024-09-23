@implementation MCUIBundleController

- (id)_detailsFromSpecifier:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("kMCUISpecifierDetails"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (MCUIBundleController)initWithParentListController:(id)a3 properties:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  MCUIBundleController *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  +[MCUIBundleController sharedInstance](MCUIBundleController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__MCUIBundleController_initWithParentListController_properties___block_invoke;
  v13[3] = &unk_1EA2B5E68;
  v8 = v6;
  v14 = v8;
  v15 = v5;
  v9 = v5;
  dispatch_async_and_wait(v7, v13);

  v10 = v15;
  v11 = (MCUIBundleController *)v8;

  return v11;
}

- (id)specifiersWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCUIBundleController dataManager](self, "dataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDeviceManagementHidden");

  if (v6)
  {
    NSLog(CFSTR("MCUI bundle controller not returning a specifier because Device Management is hidden"));
LABEL_7:
    v12 = 0;
    goto LABEL_8;
  }
  if (!-[MCUIBundleController _updateTopLevelSpecifier](self, "_updateTopLevelSpecifier")
    && !-[MCUIBundleController _swizzlingFromSpecifier:](self, "_swizzlingFromSpecifier:", v4))
  {
    NSLog(CFSTR("MCUI bundle controller returning a nil PSSpecifier"));
    goto LABEL_7;
  }
  -[MCUIBundleController specifier](self, "specifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIBundleController specifier](self, "specifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("MCUI bundle controller returning PSSpecifier named '%@' with user info: %@"), v8, v10);

  -[MCUIBundleController specifier](self, "specifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v12;
}

- (id)_initWithDataManager:(id)a3
{
  id v4;
  MCUIBundleController *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCUIBundleController;
  v5 = -[MCUIBundleController init](&v9, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("MCUIBundleController_dispatch_queue", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    -[MCUIBundleController _sharedInitWithDataManager:](v5, "_sharedInitWithDataManager:", v4);
  }

  return v5;
}

- (PSSpecifier)specifier
{
  void *v3;
  char v4;
  PSSpecifier *v5;
  PSSpecifier *specifier;
  PSSpecifier *v7;
  PSSpecifier *v8;

  -[MCUIBundleController dataManager](self, "dataManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDeviceManagementHidden");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    specifier = self->_specifier;
    if (!specifier)
    {
      objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, sel__detailsFromSpecifier_, objc_opt_class(), 2, 0);
      v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      v8 = self->_specifier;
      self->_specifier = v7;

      -[PSSpecifier setProperty:forKey:](self->_specifier, "setProperty:forKey:", *MEMORY[0x1E0D47280], *MEMORY[0x1E0D80868]);
      specifier = self->_specifier;
    }
    v5 = specifier;
  }
  return v5;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  return (id)sharedInstance_sharedInstance;
}

- (MCUIDataManagerProtocol)dataManager
{
  return self->_dataManager;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  NSLog(CFSTR("MCUI bundle controller dealloc'd"), a2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)MCUIBundleController;
  -[MCUIBundleController dealloc](&v5, sel_dealloc);
}

void __38__MCUIBundleController_sharedInstance__block_invoke()
{
  MCUIBundleController *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [MCUIBundleController alloc];
  +[MCUIDataManager sharedManager](MCUIDataManager, "sharedManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[MCUIBundleController _initWithDataManager:](v0, "_initWithDataManager:", v3);
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v1;

}

id __64__MCUIBundleController_initWithParentListController_properties___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setParentController:", *(_QWORD *)(a1 + 40));
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + (int)*MEMORY[0x1E0D80560]), *(id *)(a1 + 40));
}

- (MCUIBundleController)initWithParentListController:(id)a3 dataManager:(id)a4
{
  id v6;
  MCUIBundleController *v7;
  MCUIBundleController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MCUIBundleController;
  v7 = -[MCUIBundleController initWithParentListController:](&v10, sel_initWithParentListController_, a3);
  v8 = v7;
  if (v7)
    -[MCUIBundleController _sharedInitWithDataManager:](v7, "_sharedInitWithDataManager:", v6);

  return v8;
}

- (void)_sharedInitWithDataManager:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_dataManager, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__mcuiUpdated, CFSTR("kMCUIUpdatedNotification"), 0);

}

- (void)unload
{
  NSObject *v3;
  _QWORD block[5];

  NSLog(CFSTR("MCUI bundle controller unloading"), a2);
  -[MCUIBundleController queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MCUIBundleController_unload__block_invoke;
  block[3] = &unk_1EA2B5BC0;
  block[4] = self;
  dispatch_async_and_wait(v3, block);

}

id __30__MCUIBundleController_unload__block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 24), 0);
}

- (BOOL)_swizzlingFromSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  objc_msgSend(a3, "propertyForKey:", CFSTR("URLDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("MCUI bundle controller received URL dictionary for loading specifiers: %@"), v3);
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("path"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "pathComponents");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "objectAtIndex:", 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D47280]);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      NSLog(CFSTR("MCUI bundle controller error: No path in provided URL dictionary"));
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_updateTopLevelSpecifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  __CFString *v12;
  NSObject *v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;

  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[MCUIWatchManager shared](MCUIWatchManager, "shared");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "profileCount");

    if (v5 == 1)
      v6 = CFSTR("SINGULAR_BLOBS_DESIGNATION");
    else
      v6 = CFSTR("PLURAL_BLOBS_DESIGNATION");
    MCUILocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v5 > 0;
  }
  else
  {
    if (ne_session_dns_settings_configs_present())
      v12 = CFSTR("DEVICE_MANAGEMENT_VPN_DNS");
    else
      v12 = CFSTR("DEVICE_MANAGEMENT_VPN");
    MCUILocalizedString(v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = 1;
  }
  -[MCUIBundleController queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__MCUIBundleController__updateTopLevelSpecifier__block_invoke;
  block[3] = &unk_1EA2B6060;
  block[4] = self;
  v18 = v7;
  v19 = v10;
  v14 = v10;
  v15 = v7;
  dispatch_async_and_wait(v13, block);

  return v11;
}

void __48__MCUIBundleController__updateTopLevelSpecifier__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setName:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v6;

  if (*(_QWORD *)(a1 + 48))
    v7 = *(const __CFString **)(a1 + 48);
  else
    v7 = &stru_1EA2B7FD8;
  objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("kMCUISpecifierDetails"));
  objc_msgSend(*(id *)(a1 + 32), "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInfo:", v9);

}

- (void)_mcuiUpdated
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__MCUIBundleController__mcuiUpdated__block_invoke;
  v2[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __36__MCUIBundleController__mcuiUpdated__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  void *v3;
  int v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 3);

    if (v2)
    {
      objc_msgSend(v5, "dataManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "isDeviceManagementHidden");

      if (v4)
        NSLog(CFSTR("MCUI bundle controller ignoring data manager update because Device Management is hidden"));
      else
        objc_msgSend(v5, "_reloadTopLevelSpecifier");
    }
    else
    {
      NSLog(CFSTR("MCUI bundle controller ignoring data manager update because parent controller is nil"));
    }
    WeakRetained = v5;
  }

}

- (void)_reloadTopLevelSpecifier
{
  uint64_t v3;
  PSListController **p_parentController;
  id WeakRetained;
  void *v6;
  id v7;

  -[MCUIBundleController _updateTopLevelSpecifier](self, "_updateTopLevelSpecifier");
  v3 = *MEMORY[0x1E0D47280];
  p_parentController = &self->_parentController;
  WeakRetained = objc_loadWeakRetained((id *)p_parentController);
  objc_msgSend(WeakRetained, "specifierForID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    NSLog(CFSTR("MCUI bundle controller reloading specifier ID: %@"), v3);
    v7 = objc_loadWeakRetained((id *)p_parentController);
    objc_msgSend(v7, "reloadSpecifierID:animated:", v3, 1);
  }
  else
  {
    NSLog(CFSTR("MCUI bundle controller reloading all specifiers (Cannot find specifier ID: %@)"), v3);
    v7 = objc_loadWeakRetained((id *)p_parentController);
    objc_msgSend(v7, "reloadSpecifiers");
  }

}

- (void)setDataManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataManager, a3);
}

- (PSListController)parentController
{
  return (PSListController *)objc_loadWeakRetained((id *)&self->_parentController);
}

- (void)setParentController:(id)a3
{
  objc_storeWeak((id *)&self->_parentController, a3);
}

- (void)setSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_specifier, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_parentController);
  objc_storeStrong((id *)&self->_dataManager, 0);
}

@end
