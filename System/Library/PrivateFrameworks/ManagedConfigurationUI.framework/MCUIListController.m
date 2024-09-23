@implementation MCUIListController

- (MCUIListController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  MCUIListController *v8;
  void *v9;
  MCUIBridgeSpecifierProvider *v10;
  MCUIBridgeSpecifierProvider *bridgeSpecifierProvider;
  void *v12;
  MCUIMCSpecifierProvider *v13;
  MCUIMCSpecifierProvider *mcSpecifierProvider;
  uint64_t v15;
  DMCEnrollmentInterface *dmcEnrollmentInterface;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint32_t v22;
  _QWORD v24[4];
  id v25;
  _QWORD handler[4];
  id v27;
  id location;
  objc_super v29;

  v6 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)MCUIListController;
  v8 = -[MCUIListController initWithNibName:bundle:](&v29, sel_initWithNibName_bundle_, v6, v7);
  if (v8)
  {
    +[MCUIWatchManager shared](MCUIWatchManager, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[MCUISpecifierProvider initWithDelegate:]([MCUIBridgeSpecifierProvider alloc], "initWithDelegate:", v8);
      bridgeSpecifierProvider = v8->_bridgeSpecifierProvider;
      v8->_bridgeSpecifierProvider = v10;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", v8, sel__watchFetchFailed_, CFSTR("kMCUIWatchFetchFailedNotification"), 0);
    }
    else
    {
      v8->_needsToReloadManageAccountSpecifiers = 1;
      v13 = -[MCUISpecifierProvider initWithDelegate:]([MCUIMCSpecifierProvider alloc], "initWithDelegate:", v8);
      mcSpecifierProvider = v8->_mcSpecifierProvider;
      v8->_mcSpecifierProvider = v13;

      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1BF98]), "initFromViewController:delegate:", v8, v8);
      dmcEnrollmentInterface = v8->_dmcEnrollmentInterface;
      v8->_dmcEnrollmentInterface = (DMCEnrollmentInterface *)v15;

      -[DMCEnrollmentInterface accountSpecifierProvider](v8->_dmcEnrollmentInterface, "accountSpecifierProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDelegate:", v8);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v8, sel__mcuiUpdated, CFSTR("kMCUIUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v8, sel__mcuiUpdated, *MEMORY[0x1E0D44940], 0);

    objc_initWeak(&location, v8);
    v19 = MEMORY[0x1E0C80D38];
    v20 = MEMORY[0x1E0C80D38];
    v21 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __45__MCUIListController_initWithNibName_bundle___block_invoke;
    handler[3] = &unk_1EA2B6230;
    objc_copyWeak(&v27, &location);
    LODWORD(v19) = notify_register_dispatch("MISProvisioningProfileInstalled", &v8->_provisioningProfileInstalledToken, v19, handler);

    if ((_DWORD)v19)
      NSLog(CFSTR("Failed to register for provisioning profile installation"));
    v24[0] = v21;
    v24[1] = 3221225472;
    v24[2] = __45__MCUIListController_initWithNibName_bundle___block_invoke_2;
    v24[3] = &unk_1EA2B6230;
    objc_copyWeak(&v25, &location);
    v22 = notify_register_dispatch("MISProvisioningProfileRemoved", &v8->_provisioningProfileInstalledToken, MEMORY[0x1E0C80D38], v24);

    if (v22)
      NSLog(CFSTR("Failed to register for provisioning profile removal"));
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __45__MCUIListController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanCacheAndReloadSpecifiers");
    WeakRetained = v2;
  }

}

void __45__MCUIListController_initWithNibName_bundle___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanCacheAndReloadSpecifiers");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  notify_cancel(self->_provisioningProfileInstalledToken);
  notify_cancel(self->_provisioningProfileRemovedToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("kMCUIUpdatedNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)MCUIListController;
  -[MCUIListController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MCUIListController;
  -[MCUIListController viewDidLoad](&v3, sel_viewDidLoad);
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadProfiles");

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MCUIListController;
  -[MCUIListController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[MCUIListController _setupDeviceExpert](self, "_setupDeviceExpert");
}

- (void)_setupDeviceExpert
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/ManagedConfigurationList"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithKey:table:locale:bundleURL:", CFSTR("VPN & Device Management"), 0, v4, v6);

  -[MCUIListController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.gear"), v7, MEMORY[0x1E0C9AA60], v8);
}

- (void)_mcuiUpdated
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__MCUIListController__mcuiUpdated__block_invoke;
  v2[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __34__MCUIListController__mcuiUpdated__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanCacheAndReloadSpecifiers");
    WeakRetained = v2;
  }

}

- (void)_watchFetchFailed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kMCUINotificationErrorKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__MCUIListController__watchFetchFailed___block_invoke;
    block[3] = &unk_1EA2B5C98;
    objc_copyWeak(&v9, &location);
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(CFSTR("MCUIListController could not load error from watchFetchFailed notification: %@"), v4);
  }

}

void __40__MCUIListController__watchFetchFailed___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  _QWORD v4[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__MCUIListController__watchFetchFailed___block_invoke_2;
    v4[3] = &unk_1EA2B5BC0;
    v4[4] = WeakRetained;
    objc_msgSend(MEMORY[0x1E0CEA2E8], "MCUIShowAlertForError:fromViewController:suggestedTitle:suggestedMessage:completion:", v3, WeakRetained, 0, 0, v4);
  }

}

void __40__MCUIListController__watchFetchFailed___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mcuiViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "popViewControllerAnimated:", 1);

}

- (id)specifiers
{
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;

  v2 = (int)*MEMORY[0x1E0D80590];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
  if (!v3)
  {
    +[MCUIWatchManager shared](MCUIWatchManager, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MCUIListController bridgeSpecifierProvider](self, "bridgeSpecifierProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "specifiers");
      v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v8 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = v7;

    }
    else
    {
      -[MCUIListController _specifiersForPhone](self, "_specifiersForPhone");
      v9 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
      *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = v9;
    }

    v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
  }
  return v3;
}

- (id)_specifiersForPhone
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[5];
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;

  v3 = (void *)objc_opt_new();
  v4 = dispatch_group_create();
  -[MCUIListController vpnSpecifiers](self, "vpnSpecifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    -[MCUIListController vpnSpecifiers](self, "vpnSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  }
  else
  {
    dispatch_group_enter(v4);
    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __41__MCUIListController__specifiersForPhone__block_invoke;
    v17[3] = &unk_1EA2B5BC0;
    v18 = v4;
    -[MCUIListController _loadVPNSpecifiersWithCompletionHandler:](self, "_loadVPNSpecifiersWithCompletionHandler:", v17);

  }
  -[MCUIListController managedAccountSpecifiers](self, "managedAccountSpecifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[MCUIListController managedAccountSpecifiers](self, "managedAccountSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v10);

  }
  if (-[MCUIListController needsToReloadManageAccountSpecifiers](self, "needsToReloadManageAccountSpecifiers"))
  {
    dispatch_group_enter(v4);
    v15[0] = v6;
    v15[1] = 3221225472;
    v15[2] = __41__MCUIListController__specifiersForPhone__block_invoke_2;
    v15[3] = &unk_1EA2B5BC0;
    v16 = v4;
    -[MCUIListController _loadManagedAccountSpecifiersWithCompletionHandler:](self, "_loadManagedAccountSpecifiersWithCompletionHandler:", v15);

  }
  else if (v5)
  {
    goto LABEL_10;
  }
  block[0] = v6;
  block[1] = 3221225472;
  block[2] = __41__MCUIListController__specifiersForPhone__block_invoke_3;
  block[3] = &unk_1EA2B5BC0;
  block[4] = self;
  dispatch_group_notify(v4, MEMORY[0x1E0C80D38], block);
LABEL_10:
  -[MCUIListController mcSpecifierProvider](self, "mcSpecifierProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "specifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v3, "addObjectsFromArray:", v12);

  return v3;
}

void __41__MCUIListController__specifiersForPhone__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __41__MCUIListController__specifiersForPhone__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __41__MCUIListController__specifiersForPhone__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
  return objc_msgSend(*(id *)(a1 + 32), "_handleDeferredPush");
}

- (void)_cleanCacheAndReloadSpecifiers
{
  -[MCUIListController setNeedsToReloadManageAccountSpecifiers:](self, "setNeedsToReloadManageAccountSpecifiers:", 1);
  -[MCUIListController reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)_loadVPNSpecifiersWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MCUIListController__loadVPNSpecifiersWithCompletionHandler___block_invoke;
  block[3] = &unk_1EA2B5DD8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __62__MCUIListController__loadVPNSpecifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  objc_class *v9;
  _QWORD block[4];
  __CFString *v11;
  id v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    PSBundlePathForPreferenceBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB34D0];
    SFRuntimeAbsoluteFilePathForPath();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (objc_class *)objc_msgSend(v7, "principalClass");
    if (v8)
    {
      v9 = v8;
      if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class()))

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__MCUIListController__loadVPNSpecifiersWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1EA2B6418;
    objc_copyWeak(&v13, v2);
    v11 = CFSTR("VPNPreferences");
    v12 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v13);
  }

}

void __62__MCUIListController__loadVPNSpecifiersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *MEMORY[0x1E0D80728];
    v15[0] = *MEMORY[0x1E0D80738];
    v15[1] = v4;
    v16[0] = v3;
    v16[1] = MEMORY[0x1E0C9AAA0];
    v15[2] = CFSTR("isDeviceManagement");
    v16[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v5;
    v13 = CFSTR("items");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    SpecifiersFromPlist();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    objc_msgSend(WeakRetained, "setVpnSpecifiers:", v9, &v11);

    objc_msgSend(WeakRetained, "setVpnBundleControllers:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3
{
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("VPN"))
    && (-[MCUIListController specifierForID:](self, "specifierForID:", CFSTR("VPN")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    return 1;
  }
  else
  {
    return -[MCUIListController needsToReloadManageAccountSpecifiers](self, "needsToReloadManageAccountSpecifiers");
  }
}

- (void)_handleDeferredPush
{
  void *v3;
  uint64_t v4;

  -[MCUIListController specifierIDPendingPush](self, "specifierIDPendingPush");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    -[MCUIListController handlePendingURL](self, "handlePendingURL");
}

- (void)_loadManagedAccountSpecifiersWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__MCUIListController__loadManagedAccountSpecifiersWithCompletionHandler___block_invoke;
  v7[3] = &unk_1EA2B6468;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __73__MCUIListController__loadManagedAccountSpecifiersWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "dmcEnrollmentInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "specifiersForManagedAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__MCUIListController__loadManagedAccountSpecifiersWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1EA2B6440;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __73__MCUIListController__loadManagedAccountSpecifiersWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsToReloadManageAccountSpecifiers:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setManagedAccountSpecifiers:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)accountCellWasTapped:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0D1BF98], "accountControllerFromSpecifier:baseViewController:preferiCloudAccount:", a3, self, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MCUIListController showController:animate:](self, "showController:animate:", v4, 1);

}

- (void)enrollmentDidBegin
{
  -[MCUIListController _mainQueue_setManagedSignInButtonEnabled:](self, "_mainQueue_setManagedSignInButtonEnabled:", 0);
}

- (void)enrollmentDidSucceed
{
  -[MCUIListController _mainQueue_setManagedSignInButtonEnabled:](self, "_mainQueue_setManagedSignInButtonEnabled:", 1);
}

- (void)enrollmentDidFailWithError:(id)a3
{
  -[MCUIListController _mainQueue_setManagedSignInButtonEnabled:](self, "_mainQueue_setManagedSignInButtonEnabled:", 1);
}

- (void)enrollmentWasCanceled
{
  -[MCUIListController _mainQueue_setManagedSignInButtonEnabled:](self, "_mainQueue_setManagedSignInButtonEnabled:", 1);
}

- (void)_mainQueue_setManagedSignInButtonEnabled:(BOOL)a3
{
  _QWORD block[4];
  id v5;
  BOOL v6;
  id location;

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MCUIListController__mainQueue_setManagedSignInButtonEnabled___block_invoke;
  block[3] = &unk_1EA2B6490;
  objc_copyWeak(&v5, &location);
  v6 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__MCUIListController__mainQueue_setManagedSignInButtonEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "dmcEnrollmentInterface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setManagedSignInButtonEnabled:", *(unsigned __int8 *)(a1 + 40));

    objc_msgSend(v4, "_cleanCacheAndReloadSpecifiers");
    WeakRetained = v4;
  }

}

- (void)handleURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("sender"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "setOriginalURLSender:", v5);
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D47288]))
  {
    NSLog(CFSTR("MCUIListController handling URL path %@ from sender %@"), v6, v5);
    objc_msgSend(v4, "objectForKey:", CFSTR("username"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCUIListController _showAccountDetailsPaneWithUsername:completion:](self, "_showAccountDetailsPaneWithUsername:completion:", v7, 0);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)MCUIListController;
    -[MCURLListenerListController handleURL:](&v8, sel_handleURL_, v4);
  }

}

- (void)_showAccountDetailsPaneWithUsername:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0D1BF80], "itemSpecifierIDForAccountUsername:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MCUIListController specifiers](self, "specifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v7);

        if (v15)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __69__MCUIListController__showAccountDetailsPaneWithUsername_completion___block_invoke;
          v16[3] = &unk_1EA2B5E68;
          v16[4] = self;
          v16[5] = v13;
          dispatch_async(MEMORY[0x1E0C80D38], v16);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  if (v6)
    v6[2](v6);

}

uint64_t __69__MCUIListController__showAccountDetailsPaneWithUsername_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accountCellWasTapped:", *(_QWORD *)(a1 + 40));
}

- (BOOL)prepareHandlingURLForSpecifierID:(id)a3 resourceDictionary:(id)a4 animatePush:(BOOL *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  +[MCUIWatchManager shared](MCUIWatchManager, "shared");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10
    && (v11 = (void *)v10, v12 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D472A0]), v11, v12))
  {
    v13 = 1;
    if (a5)
      *a5 = 1;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)MCUIListController;
    v13 = -[MCUIListController prepareHandlingURLForSpecifierID:resourceDictionary:animatePush:](&v15, sel_prepareHandlingURLForSpecifierID_resourceDictionary_animatePush_, v8, v9, a5);
  }

  return v13;
}

- (int)provisioningProfileInstalledToken
{
  return self->_provisioningProfileInstalledToken;
}

- (void)setProvisioningProfileInstalledToken:(int)a3
{
  self->_provisioningProfileInstalledToken = a3;
}

- (int)provisioningProfileRemovedToken
{
  return self->_provisioningProfileRemovedToken;
}

- (void)setProvisioningProfileRemovedToken:(int)a3
{
  self->_provisioningProfileRemovedToken = a3;
}

- (MCUIMCSpecifierProvider)mcSpecifierProvider
{
  return self->_mcSpecifierProvider;
}

- (void)setMcSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mcSpecifierProvider, a3);
}

- (MCUIBridgeSpecifierProvider)bridgeSpecifierProvider
{
  return self->_bridgeSpecifierProvider;
}

- (void)setBridgeSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeSpecifierProvider, a3);
}

- (BOOL)needsToReloadManageAccountSpecifiers
{
  return self->_needsToReloadManageAccountSpecifiers;
}

- (void)setNeedsToReloadManageAccountSpecifiers:(BOOL)a3
{
  self->_needsToReloadManageAccountSpecifiers = a3;
}

- (NSArray)managedAccountSpecifiers
{
  return self->_managedAccountSpecifiers;
}

- (void)setManagedAccountSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_managedAccountSpecifiers, a3);
}

- (DMCEnrollmentInterface)dmcEnrollmentInterface
{
  return self->_dmcEnrollmentInterface;
}

- (void)setDmcEnrollmentInterface:(id)a3
{
  objc_storeStrong((id *)&self->_dmcEnrollmentInterface, a3);
}

- (NSArray)vpnSpecifiers
{
  return self->_vpnSpecifiers;
}

- (void)setVpnSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_vpnSpecifiers, a3);
}

- (NSArray)vpnBundleControllers
{
  return self->_vpnBundleControllers;
}

- (void)setVpnBundleControllers:(id)a3
{
  objc_storeStrong((id *)&self->_vpnBundleControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vpnBundleControllers, 0);
  objc_storeStrong((id *)&self->_vpnSpecifiers, 0);
  objc_storeStrong((id *)&self->_dmcEnrollmentInterface, 0);
  objc_storeStrong((id *)&self->_managedAccountSpecifiers, 0);
  objc_storeStrong((id *)&self->_bridgeSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_mcSpecifierProvider, 0);
}

@end
