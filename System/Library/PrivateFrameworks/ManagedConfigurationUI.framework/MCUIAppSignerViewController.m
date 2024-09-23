@implementation MCUIAppSignerViewController

- (MCUIAppSignerViewController)initWithAppSigner:(id)a3
{
  id v4;
  void *v5;
  MCUIAppSignerViewController *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[MCUIAppSignerViewController initWithAppSigner:uninstaller:](self, "initWithAppSigner:uninstaller:", v4, v5);

  return v6;
}

- (MCUIAppSignerViewController)initWithAppSigner:(id)a3 uninstaller:(id)a4
{
  id v7;
  id v8;
  MCUIAppSignerViewController *v9;
  MCUIAppSignerViewController *v10;
  id v11;
  void *v12;
  uint64_t v13;
  MDMProvisioningProfileTrust *profileTrust;
  void *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MCUIAppSignerViewController;
  v9 = -[MCUITableViewController initWithStyle:](&v18, sel_initWithStyle_, 2);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appSigner, a3);
    objc_storeStrong((id *)&v10->_uninstaller, a4);
    v11 = objc_alloc(MEMORY[0x1E0D44780]);
    dispatch_get_global_queue(33, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithValidationQueue:", v12);
    profileTrust = v10->_profileTrust;
    v10->_profileTrust = (MDMProvisioningProfileTrust *)v13;

    -[MCUIAppSignerViewController _setup](v10, "_setup");
    objc_msgSend(v7, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCUIAppSignerViewController navigationItem](v10, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v15);

  }
  return v10;
}

- (void)_setup
{
  OS_dispatch_group *v3;
  OS_dispatch_group *trustActionGroup;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD handler[4];
  id v22;
  id location;
  objc_super v24;
  objc_super v25;

  v3 = (OS_dispatch_group *)dispatch_group_create();
  trustActionGroup = self->_trustActionGroup;
  self->_trustActionGroup = v3;

  v25.receiver = self;
  v25.super_class = (Class)MCUIAppSignerViewController;
  -[MCUITableViewController updateExtendedLayoutIncludesOpaqueBars](&v25, sel_updateExtendedLayoutIncludesOpaqueBars);
  -[MCUIAppSignerViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 15);
  -[MCUIAppSignerViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("MCUIApplicationCellIdentifier"));

  -[MCUIAppSignerViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("MCUIApplicationTrustCellIdentifier"));

  v24.receiver = self;
  v24.super_class = (Class)MCUIAppSignerViewController;
  -[MCUITableViewController reloadTableOnContentSizeCategoryChange](&v24, sel_reloadTableOnContentSizeCategoryChange);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__appSignersUpdated_, CFSTR("kMCUIAppSignersUpdatedNotification"), v8);

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addNetworkReachableObserver:selector:", self, sel_networkReachabilityChanged_);

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isNetworkReachable = objc_msgSend(v10, "isNetworkReachable");

  objc_initWeak(&location, self);
  v11 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D1C100], "UTF8String");
  v12 = MEMORY[0x1E0C80D38];
  v13 = MEMORY[0x1E0C80D38];
  v14 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __37__MCUIAppSignerViewController__setup__block_invoke;
  handler[3] = &unk_1EA2B6230;
  objc_copyWeak(&v22, &location);
  notify_register_dispatch(v11, &_setup_settingsChangedToken, v12, handler);

  v15 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D1C110], "UTF8String");
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __37__MCUIAppSignerViewController__setup__block_invoke_2;
  v19[3] = &unk_1EA2B6230;
  objc_copyWeak(&v20, &location);
  notify_register_dispatch(v15, &_setup_trustFailedToken, MEMORY[0x1E0C80D38], v19);

  v16 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D1C118], "UTF8String");
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __37__MCUIAppSignerViewController__setup__block_invoke_3;
  v17[3] = &unk_1EA2B6230;
  objc_copyWeak(&v18, &location);
  notify_register_dispatch(v16, (int *)&_setup_verificationOfflineToken, MEMORY[0x1E0C80D38], v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __37__MCUIAppSignerViewController__setup__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_appSignersDidChange");
    WeakRetained = v2;
  }

}

void __37__MCUIAppSignerViewController__setup__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentTrustFailedAlert");
    WeakRetained = v2;
  }

}

void __37__MCUIAppSignerViewController__setup__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_presentNetworkRequiredAlert");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNetworkReachableObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)MCUIAppSignerViewController;
  -[MCUITableViewController dealloc](&v5, sel_dealloc);
}

- (void)_appSignersUpdated:(id)a3
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__MCUIAppSignerViewController__appSignersUpdated___block_invoke;
  v3[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __50__MCUIAppSignerViewController__appSignersUpdated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "tableView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadData");

    WeakRetained = v3;
  }

}

- (void)_appSignersDidChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshApplications");

  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v5);

  -[MCUIAppSignerViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("kMCUIAppSignersUpdatedNotification");
  v11[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("kMCUIUpdatedNotification"), self, v9);

}

- (void)_appSignerWasRemoved
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("kMCUIAppSignersUpdatedNotification");
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("kMCUIUpdatedNotification"), self, v4);

  -[MCUIAppSignerViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)networkReachabilityChanged:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CFA300]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[MCUIAppSignerViewController setIsNetworkReachable:](self, "setIsNetworkReachable:", objc_msgSend(v5, "BOOLValue"));
}

- (BOOL)isFreeDeveloper
{
  void *v3;
  char v4;
  void *v5;

  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasUniversalPP") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[MCUIAppSignerViewController appSigner](self, "appSigner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "hasFreePP");

  }
  return v4;
}

- (void)setAppSigner:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  MCUIAppSigner *v8;

  v8 = (MCUIAppSigner *)a3;
  if (self->_appSigner != v8)
  {
    objc_storeStrong((id *)&self->_appSigner, a3);
    -[MCUIAppSigner displayName](v8, "displayName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCUIAppSignerViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v5);

    -[MCUIAppSignerViewController tableView](self, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "reloadData");

  }
}

- (void)_trust
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[UIViewController MCUIShowProgressInNavBar](self, "MCUIShowProgressInNavBar");
  MCUILocalizedString(CFSTR("TRUSTING_APP_SIGNER_STATUS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  objc_initWeak(&location, self);
  -[MCUIAppSignerViewController trustActionGroup](self, "trustActionGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__MCUIAppSignerViewController__trust__block_invoke;
  v6[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v7, &location);
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __37__MCUIAppSignerViewController__trust__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "profileTrust");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appSigner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "provisioningProfiles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appSigner");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__MCUIAppSignerViewController__trust__block_invoke_2;
    v9[3] = &unk_1EA2B6280;
    objc_copyWeak(&v10, v1);
    objc_msgSend(v4, "uiTrustAndVerifyProvisioningProfiles:developer:completion:", v6, v8, v9);

    objc_destroyWeak(&v10);
  }

}

void __37__MCUIAppSignerViewController__trust__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v2[4];
  id v3[2];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __37__MCUIAppSignerViewController__trust__block_invoke_3;
  v2[3] = &unk_1EA2B6258;
  v3[1] = a2;
  objc_copyWeak(v3, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(v3);
}

void __37__MCUIAppSignerViewController__trust__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  id v5;

  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D23280]), "initWithReason:", CFSTR("MCUI provisioning profile trust"));
    objc_msgSend(v2, "setRebootType:", 1);
    objc_msgSend(MEMORY[0x1E0D23288], "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "shutdownWithOptions:", v2);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "MCUIHideProgressInNavBarShowBackButton:", 1);
    objc_msgSend(v5, "_appSignersDidChange");
    WeakRetained = v5;
  }

}

- (void)_verify
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  -[UIViewController MCUIShowProgressInNavBar](self, "MCUIShowProgressInNavBar");
  MCUILocalizedString(CFSTR("VERIFYING_APPS_STATUS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  objc_initWeak(&location, self);
  -[MCUIAppSignerViewController trustActionGroup](self, "trustActionGroup");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__MCUIAppSignerViewController__verify__block_invoke;
  v6[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v7, &location);
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __38__MCUIAppSignerViewController__verify__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(WeakRetained, "appSigner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provisioningProfiles");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v15;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
          objc_msgSend(v3, "profileTrust", obj);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "uuid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __38__MCUIAppSignerViewController__verify__block_invoke_2;
          v12[3] = &unk_1EA2B6280;
          objc_copyWeak(&v13, v1);
          objc_msgSend(v9, "uiVerifyProvisioningProfileUUID:completion:", v10, v12);

          objc_destroyWeak(&v13);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }

  }
}

void __38__MCUIAppSignerViewController__verify__block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MCUIAppSignerViewController__verify__block_invoke_3;
  block[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __38__MCUIAppSignerViewController__verify__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "MCUIHideProgressInNavBarShowBackButton:", 1);
    objc_msgSend(v2, "_appSignersDidChange");
    WeakRetained = v2;
  }

}

- (void)_removeAppSignerApps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  -[UIViewController MCUIShowProgressInNavBar](self, "MCUIShowProgressInNavBar");
  MCUILocalizedString(CFSTR("REMOVING_APP_SIGNER_STATUS"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  objc_initWeak(&location, self);
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController uninstaller](self, "uninstaller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController trustActionGroup](self, "trustActionGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__MCUIAppSignerViewController__removeAppSignerApps__block_invoke;
  v8[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v9, &location);
  +[MCUIAppSignerUninstallerUtilities uninstallAppSigner:withUninstaller:dispatchGroup:completion:](MCUIAppSignerUninstallerUtilities, "uninstallAppSigner:withUninstaller:dispatchGroup:completion:", v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__MCUIAppSignerViewController__removeAppSignerApps__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_appSignerWasRemoved");
    WeakRetained = v2;
  }

}

- (BOOL)_showVerifyRowIncludeAlmostUntrustedApps:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  int v13;
  BOOL v14;
  BOOL v15;

  v3 = a3;
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "untrustedAppCount");
  v10 = v9 > 0;
  if (v9 <= 0 && v3)
  {
    -[MCUIAppSignerViewController appSigner](self, "appSigner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "almostUntrustedAppCount") > 0;

  }
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isTrusted");
  v14 = v7 > 0 && v10;
  if (v13)
    v15 = v14;
  else
    v15 = 0;

  return v15;
}

- (BOOL)_isTrustPreventedByLockdownMode
{
  void *v3;
  char v4;

  if (-[MCUIAppSignerViewController isFreeDeveloper](self, "isFreeDeveloper"))
    return 0;
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLockdownModeEnabled");

  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  int v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;

  -[MCUIAppSignerViewController appSigner](self, "appSigner", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTrustable");

  v6 = -[MCUIAppSignerViewController _showVerifyRowIncludeAlmostUntrustedApps:](self, "_showVerifyRowIncludeAlmostUntrustedApps:", 1);
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v5)
    v10 = 2;
  else
    v10 = 1;
  v11 = v10 + v6;
  if (v9 <= 0)
    return v11;
  else
    return v11 + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;

  -[MCUIAppSignerViewController appSigner](self, "appSigner", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTrustable");

  v8 = -[MCUIAppSignerViewController _showVerifyRowIncludeAlmostUntrustedApps:](self, "_showVerifyRowIncludeAlmostUntrustedApps:", 1);
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if ((v7 & v8) != 0)
    v12 = 1;
  else
    v12 = v11;
  if (v7 | v8)
    v13 = 1;
  else
    v13 = v11;
  if (a4 != 1)
    v13 = 0;
  if (a4 != 2)
    v12 = v13;
  if (a4 == 3)
    return v11;
  else
    return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  int v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[MCUIAppSignerViewController appSigner](self, "appSigner", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTrustable");

  v8 = -[MCUIAppSignerViewController _showVerifyRowIncludeAlmostUntrustedApps:](self, "_showVerifyRowIncludeAlmostUntrustedApps:", 1);
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 < 1)
    return 0;
  v12 = a4 != 1 || v8;
  if ((v7 | v12) == 1)
  {
    v13 = !v8;
    if (a4 != 2)
      v13 = 0;
    if (a4 != 3 && !v13)
      return 0;
  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  MCUILocalizedString(CFSTR("APPLICATIONS_FROM_APP_SIGNER_%@"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "identity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  __CFString *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[MCUIAppSignerViewController appSigner](self, "appSigner", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTrusted");

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = CFSTR("APP_SIGNER_TRUSTED_DESCRIPTION_%@");
  }
  else
  {
    v10 = -[MCUIAppSignerViewController _isTrustPreventedByLockdownMode](self, "_isTrustPreventedByLockdownMode");
    v8 = (void *)MEMORY[0x1E0CB3940];
    if (v10)
      v9 = CFSTR("APP_SIGNER_LOCKDOWN_MODE_DESCRIPTION_%@");
    else
      v9 = CFSTR("APP_SIGNER_NOT_TRUSTED_DESCRIPTION_%@");
  }
  MCUILocalizedStringByDevice(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isTrustable");

  if (a4 || !v16)
  {
    if (a4)
    {
      if (a4 == 1)
      {
        if (-[MCUIAppSignerViewController _showVerifyRowIncludeAlmostUntrustedApps:](self, "_showVerifyRowIncludeAlmostUntrustedApps:", 0))
        {
          -[MCUIAppSignerViewController appSigner](self, "appSigner");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "untrustedAppCount");

          v20 = (void *)MEMORY[0x1E0CB3940];
          if (v19 < 2)
            v21 = CFSTR("APP_SIGNER_SINGULAR_APPS_NOT_VERIFIED_DESCRIPTION_%@");
          else
            v21 = CFSTR("APP_SIGNER_PLURAL_APPS_NOT_VERIFIED_DESCRIPTION_%@");
LABEL_32:
          MCUILocalizedStringByDevice(v21);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCUIAppSignerViewController appSigner](self, "appSigner");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "identity");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", v31, v33);
          v17 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_33;
        }
        if (-[MCUIAppSignerViewController _showVerifyRowIncludeAlmostUntrustedApps:](self, "_showVerifyRowIncludeAlmostUntrustedApps:", 1))
        {
          -[MCUIAppSignerViewController appSigner](self, "appSigner");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "almostUntrustedAppCount");

          v20 = (void *)MEMORY[0x1E0CB3940];
          if (v30 < 2)
            v21 = CFSTR("APP_SIGNER_SINGULAR_APPS_EXPIRING_VERIFICATION_DESCRIPTION_%@");
          else
            v21 = CFSTR("APP_SIGNER_PLURAL_APPS_EXPIRING_VERIFICATION_DESCRIPTION_%@");
          goto LABEL_32;
        }
      }
      v17 = 0;
      goto LABEL_33;
    }
    -[MCUIAppSignerViewController appSigner](self, "appSigner");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isTrusted");

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v23 & 1) != 0)
    {
      v35 = *MEMORY[0x1E0D46F10];
      v25 = &v35;
    }
    else
    {
      v36[0] = *MEMORY[0x1E0D46FE0];
      v25 = v36;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedRestrictionSourceDescriptionForFeatures:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && v27)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n\n%@"), v14, v27);
      v28 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v14)
    {
      v28 = v14;
    }
    else
    {
      if (!v27)
      {
        v17 = 0;
        goto LABEL_30;
      }
      v28 = v27;
    }
    v17 = v28;
LABEL_30:

    goto LABEL_33;
  }
  v17 = v14;
LABEL_33:

  return v17;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isTrustable");

  v10 = -[MCUIAppSignerViewController _showVerifyRowIncludeAlmostUntrustedApps:](self, "_showVerifyRowIncludeAlmostUntrustedApps:", 1);
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v9)
  {
    if (objc_msgSend(v7, "section") == 1)
    {
      -[MCUIAppSignerViewController _trustCellInTableView:atIndexPath:appCount:](self, "_trustCellInTableView:atIndexPath:appCount:", v6, v7, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (v10 && objc_msgSend(v7, "section") == 2)
    {
LABEL_9:
      -[MCUIAppSignerViewController _verifyCellInTableView:atIndexPath:](self, "_verifyCellInTableView:atIndexPath:", v6, v7);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
  }
  else if (v10 && objc_msgSend(v7, "section") == 1)
  {
    goto LABEL_9;
  }
  if (v13 >= 1
    && (((v9 | v10) & 1) == 0 && objc_msgSend(v7, "section") == 1
     || (v10 & v9 & 1) == 0 && objc_msgSend(v7, "section") == 2
     || objc_msgSend(v7, "section") == 3))
  {
    -[MCUIAppSignerViewController _appCellInTableView:atIndexPath:](self, "_appCellInTableView:atIndexPath:", v6, v7);
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLog(CFSTR("MCUIAppSignerViewController: No table cell found for indexPath: %@, showTrust: %d, showVerify: %d, appCount: %ld"), v7, v9, v10, v13);
    v14 = objc_opt_new();
  }
LABEL_18:
  v15 = (void *)v14;

  return v15;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isTrustable");

  v9 = -[MCUIAppSignerViewController _showVerifyRowIncludeAlmostUntrustedApps:](self, "_showVerifyRowIncludeAlmostUntrustedApps:", 1);
  if (objc_msgSend(v6, "section") == 1 && v8)
  {
    -[MCUIAppSignerViewController appSigner](self, "appSigner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isTrusted");

    if (v11)
    {
      -[MCUIAppSignerViewController _presentAppRemovalAlert](self, "_presentAppRemovalAlert");
    }
    else
    {
      -[MCUIAppSignerViewController appSigner](self, "appSigner");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "applications");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        -[MCUIAppSignerViewController _trust](self, "_trust");
      }
      else
      {
        -[MCUIAppSignerViewController appSigner](self, "appSigner");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "displayName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("MCUIAppSignerViewController: App signer %@ does not have any apps to trust"), v18);

      }
    }
  }
  else if (v9)
  {
    v12 = objc_msgSend(v6, "section") == 1 ? v8 : 1;
    if (v12 != 1 || (objc_msgSend(v6, "section") == 2 ? (v13 = v8) : (v13 = 0), v13 == 1))
      -[MCUIAppSignerViewController _presentVerifyAppAlert](self, "_presentVerifyAppAlert");
  }
  objc_msgSend(v19, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (BOOL)_tableView:(id)a3 isIndexPathValid:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "section");
  if (v7 >= objc_msgSend(v5, "numberOfSections"))
  {
    v9 = 0;
  }
  else
  {
    v8 = objc_msgSend(v6, "row");
    v9 = v8 < objc_msgSend(v5, "numberOfRowsInSection:", objc_msgSend(v6, "section"));
  }

  return v9;
}

- (id)_trustCellInTableView:(id)a3 atIndexPath:(id)a4 appCount:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  if (-[MCUIAppSignerViewController _tableView:isIndexPathValid:](self, "_tableView:isIndexPathValid:", v8, v9))
  {
    objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("MCUIApplicationTrustCellIdentifier"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCUIAppSignerViewController appSigner](self, "appSigner");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isTrusted");

    if (v12)
    {
      if (a5 >= 2)
        v13 = CFSTR("DELETE_APP_PLURAL");
      else
        v13 = CFSTR("DELETE_APP_SINGULAR");
      MCUILocalizedString(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "DMCProfileRedColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v10;
      v17 = v14;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      MCUILocalizedString(CFSTR("TRUST_APP_DEVELOPER_NAME_%@"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCUIAppSignerViewController appSigner](self, "appSigner");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "displayName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", v21, v23);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[MCUIAppSignerViewController _isTrustPreventedByLockdownMode](self, "_isTrustPreventedByLockdownMode") ^ 1;
      v16 = v10;
      v17 = v14;
      v18 = v15;
    }
    objc_msgSend(v16, "setText:color:enabled:", v17, v18, v19);

  }
  else
  {
    NSLog(CFSTR("MCUIAppSignerViewController: Invalid trust cell at indexPath: %@"), v9);

    v10 = (void *)objc_opt_new();
  }

  return v10;
}

- (id)_verifyCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (-[MCUIAppSignerViewController _tableView:isIndexPathValid:](self, "_tableView:isIndexPathValid:", v6, v7))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("MCUIApplicationTrustCellIdentifier"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MCUIAppSignerViewController appSigner](self, "appSigner");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "untrustedAppCount") >= 2)
      v10 = CFSTR("VERIFY_APP_PLURAL");
    else
      v10 = CFSTR("VERIFY_APP_SINGULAR");
    MCUILocalizedString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:color:enabled:", v11, v12, 1);

  }
  else
  {
    NSLog(CFSTR("MCUIAppSignerViewController: Invalid verify cell at indexPath: %@"), v7);

    v8 = (void *)objc_opt_new();
  }

  return v8;
}

- (id)_appCellInTableView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (-[MCUIAppSignerViewController _tableView:isIndexPathValid:](self, "_tableView:isIndexPathValid:", v6, v7))
  {
    -[MCUIAppSignerViewController appSigner](self, "appSigner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "applications");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("MCUIApplicationCellIdentifier"), v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BF88]), "initWithBundleID:dataSource:", v10, 0);
    objc_msgSend(v11, "setApplication:", v12);

  }
  else
  {
    NSLog(CFSTR("MCUIAppSignerViewController: Invalid app cell at indexPath: %@"), v7);
    v11 = (void *)objc_opt_new();
  }

  return v11;
}

- (void)_presentVerifyAppAlert
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  if (-[MCUIAppSignerViewController isNetworkReachable](self, "isNetworkReachable"))
  {
    -[MCUIAppSignerViewController appSigner](self, "appSigner");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "applications");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5 == 1)
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      MCUILocalizedString(CFSTR("APP_SIGNER_VERIFY_APP_SINGULAR_ALERT_TITLE_%@"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCUIAppSignerViewController appSigner](self, "appSigner");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("APP_SIGNER_VERIFY_APP_SINGULAR_ALERT");
    }
    else
    {
      if (!v5)
      {
        -[MCUIAppSignerViewController appSigner](self, "appSigner");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "displayName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("App signer %@ does not have any apps to verify"), v6);

        return;
      }
      v13 = (void *)MEMORY[0x1E0CB3940];
      MCUILocalizedString(CFSTR("APP_SIGNER_VERIFY_APP_PLURAL_ALERT_TITLE_%@"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCUIAppSignerViewController appSigner](self, "appSigner");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identity");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("APP_SIGNER_VERIFY_APP_PLURAL_ALERT");
    }

    MCUILocalizedStringByDevice(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v11, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MCUILocalizedString(CFSTR("CANCEL"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "MCUIAddCancelActionWithTitle:", v16);

    objc_initWeak(&location, self);
    MCUILocalizedString(CFSTR("VERIFY"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __53__MCUIAppSignerViewController__presentVerifyAppAlert__block_invoke;
    v19[3] = &unk_1EA2B5BE8;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v15, "MCUIAddActionWithTitle:style:completion:", v17, 0, v19);

    objc_msgSend(v15, "MCUIShowFromController:", self);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
  else
  {
    -[MCUIAppSignerViewController _presentNetworkRequiredAlert](self, "_presentNetworkRequiredAlert");
  }
}

void __53__MCUIAppSignerViewController__presentVerifyAppAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_verify");
    WeakRetained = v2;
  }

}

- (void)_presentTrustFailedAlert
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
  id v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  MCUILocalizedString(CFSTR("APP_SIGNER_TRUST_FAILED_TITLE_%@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  MCUILocalizedString(CFSTR("APP_SIGNER_TRUST_FAILED_MESSAGE_%@"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCUIAppSignerViewController _presentAlertWithTitle:message:](self, "_presentAlertWithTitle:message:", v12, v11);
}

- (void)_presentNetworkRequiredAlert
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
  id v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  MCUILocalizedString(CFSTR("APP_SIGNER_REQUIRES_NETWORK_TITLE_%@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v4, v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  MCUILocalizedStringByDevice(CFSTR("APP_SIGNER_REQUIRES_NETWORK_ALERT_%@"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCUIAppSignerViewController _presentAlertWithTitle:message:](self, "_presentAlertWithTitle:message:", v12, v11);
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[MCUIAppSignerViewController presentedViewController](self, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v10, v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MCUILocalizedString(CFSTR("DISMISS_ALERT"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "MCUIAddCancelActionWithTitle:", v9);

    objc_msgSend(v8, "MCUIShowFromController:", self);
  }

}

- (void)_presentAppRemovalAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id location;

  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BF88]), "initWithBundleID:dataSource:", v5, 0);
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[MCUIAppSignerViewController appSigner](self, "appSigner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applications");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  v11 = (void *)MEMORY[0x1E0CB3940];
  if (v10 == 1)
  {
    MCUILocalizedString(CFSTR("DELETE_APP_WARNING_ONE_%@"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    v15 = CFSTR("DELETE_APP_SINGULAR");
    goto LABEL_9;
  }
  MCUILocalizedString(CFSTR("DELETE_APP_WARNING_MULTIPLE_%d_%@"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v14, (v10 - 1), v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_8;
  v15 = CFSTR("DELETE_APP_PLURAL");
LABEL_9:
  MCUILocalizedString(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, v13, MCUIPreferAlert());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  MCUILocalizedString(CFSTR("CANCEL"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "MCUIAddCancelActionWithTitle:", v18);

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __54__MCUIAppSignerViewController__presentAppRemovalAlert__block_invoke;
  v19[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v17, "MCUIAddActionWithTitle:style:completion:", v16, 2, v19);
  objc_msgSend(v17, "MCUIShowFromController:", self);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __54__MCUIAppSignerViewController__presentAppRemovalAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_removeAppSignerApps");
    WeakRetained = v2;
  }

}

- (MCUIAppSigner)appSigner
{
  return self->_appSigner;
}

- (BOOL)isNetworkReachable
{
  return self->_isNetworkReachable;
}

- (void)setIsNetworkReachable:(BOOL)a3
{
  self->_isNetworkReachable = a3;
}

- (OS_dispatch_group)trustActionGroup
{
  return self->_trustActionGroup;
}

- (void)setTrustActionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_trustActionGroup, a3);
}

- (MCUIAppSignerUninstaller)uninstaller
{
  return self->_uninstaller;
}

- (void)setUninstaller:(id)a3
{
  objc_storeStrong((id *)&self->_uninstaller, a3);
}

- (MDMProvisioningProfileTrust)profileTrust
{
  return self->_profileTrust;
}

- (void)setProfileTrust:(id)a3
{
  objc_storeStrong((id *)&self->_profileTrust, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileTrust, 0);
  objc_storeStrong((id *)&self->_uninstaller, 0);
  objc_storeStrong((id *)&self->_trustActionGroup, 0);
  objc_storeStrong((id *)&self->_appSigner, 0);
}

@end
