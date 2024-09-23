@implementation MCUIDataManager

- (void)setObserving:(BOOL)a3
{
  self->_observing = a3;
}

- (void)appMovedToForeground:(id)a3
{
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[MCUIDataManager appWorkspace](self, "appWorkspace", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[MCUIDataManager observing](self, "observing");

    if (!v6)
    {
      -[MCUIDataManager appWorkspace](self, "appWorkspace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:", self);

      -[MCUIDataManager setObserving:](self, "setObserving:", 1);
    }
  }
  -[MCUIDataManager reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:](self, "reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:", 0);
}

- (void)appMovedToBackground:(id)a3
{
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;

  -[MCUIDataManager appWorkspace](self, "appWorkspace", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[MCUIDataManager observing](self, "observing");

    if (v6)
    {
      -[MCUIDataManager appWorkspace](self, "appWorkspace");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObserver:", self);

      -[MCUIDataManager setObserving:](self, "setObserving:", 0);
    }
  }
}

- (BOOL)isDeviceManagementHidden
{
  return +[MCUIDataManager _isDeviceManagementHiddenConcrete](MCUIDataManager, "_isDeviceManagementHiddenConcrete");
}

- (void)reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__MCUIDataManager_reloadAppSignersAndBlockedAppsInBackgroundWithCompletion___block_invoke;
  v7[3] = &unk_1EA2B63F0;
  v8 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1DF0AD9A4](v7);
  -[MCUIDataManager reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:](self, "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:", 0, 1, 1, v6);

}

uint64_t __76__MCUIDataManager_reloadAppSignersAndBlockedAppsInBackgroundWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a5, a6, a7);
  return result;
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)reloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  BOOL v14;
  BOOL v15;
  BOOL v16;

  v10 = a6;
  if (!-[MCUIDataManager isDeviceManagementHidden](self, "isDeviceManagementHidden"))
  {
    -[MCUIDataManager reloadQueue](self, "reloadQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__MCUIDataManager_reloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke;
    block[3] = &unk_1EA2B6378;
    block[4] = self;
    v14 = a3;
    v15 = a4;
    v16 = a5;
    v13 = v10;
    dispatch_async(v11, block);

  }
}

- (MCUIDataManager)init
{
  MCUIDataManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *memberQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *reloadQueue;
  uint64_t v7;
  LSApplicationWorkspace *appWorkspace;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint32_t v17;
  _QWORD v19[4];
  id v20;
  _QWORD handler[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MCUIDataManager;
  v2 = -[MCUIDataManager init](&v24, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("MCUIDataManager member queue", 0);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("MCUIDataManager reload queue", 0);
    reloadQueue = v2->_reloadQueue;
    v2->_reloadQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v7 = objc_claimAutoreleasedReturnValue();
    appWorkspace = v2->_appWorkspace;
    v2->_appWorkspace = (LSApplicationWorkspace *)v7;

    -[LSApplicationWorkspace addObserver:](v2->_appWorkspace, "addObserver:", v2);
    v2->_observing = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D471E8];
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel_profilesChanged_, v10, v11);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v2, sel_appMovedToBackground_, *MEMORY[0x1E0CEB288], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_appMovedToForeground_, *MEMORY[0x1E0CEB270], 0);

    objc_initWeak(&location, v2);
    v14 = MEMORY[0x1E0C80D38];
    v15 = MEMORY[0x1E0C80D38];
    v16 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __23__MCUIDataManager_init__block_invoke;
    handler[3] = &unk_1EA2B6230;
    objc_copyWeak(&v22, &location);
    LODWORD(v14) = notify_register_dispatch("MISProvisioningProfileInstalled", &v2->_provisioningProfileInstalledToken, v14, handler);

    if ((_DWORD)v14)
      NSLog(CFSTR("Failed to register for provisioning profile installation"));
    v19[0] = v16;
    v19[1] = 3221225472;
    v19[2] = __23__MCUIDataManager_init__block_invoke_2;
    v19[3] = &unk_1EA2B6230;
    objc_copyWeak(&v20, &location);
    v17 = notify_register_dispatch("MISProvisioningProfileRemoved", &v2->_provisioningProfileInstalledToken, MEMORY[0x1E0C80D38], v19);

    if (v17)
      NSLog(CFSTR("Failed to register for provisioning profile removal"));
    if (-[MCUIDataManager isDeviceManagementHidden](v2, "isDeviceManagementHidden"))
    {
      NSLog(CFSTR("Data manager not preloading data because the profile section is restricted"));
    }
    else
    {
      NSLog(CFSTR("Data manager preloading data in background"));
      -[MCUIDataManager reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:](v2, "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:", 1, 1, 0, 0);
      -[MCUIDataManager reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:](v2, "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:", 0, 0, 1, 0);
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)_reloadQueueReloadDataInBackgroundIncludingProfiles:(BOOL)a3 appSigners:(BOOL)a4 blockedApplications:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  _QWORD block[5];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  BOOL v53;
  BOOL v54;
  BOOL v55;
  id v56;
  id v57;
  id v58;
  id v59[2];

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  if (!-[MCUIDataManager isDeviceManagementHidden](self, "isDeviceManagementHidden"))
  {
    if (v8)
    {
      if ((MCUIForPairedDevice() & 1) != 0)
        v11 = 2;
      else
        v11 = objc_msgSend(MEMORY[0x1E0D47220], "thisDeviceType");
      objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      v59[0] = 0;
      v57 = 0;
      objc_msgSend(v14, "allProfilesOutMDMProfileInfo:outConfigurationProfilesInfo:outUninstalledProfilesInfo:forDeviceType:", v59, &v58, &v57, v11);
      v32 = v59[0];
      v13 = v58;
      v12 = v57;

      NSLog(CFSTR("Data manager returned after loading profiles from profiled"));
    }
    else
    {
      v12 = 0;
      v13 = 0;
      v32 = 0;
    }
    v33 = v7;
    if (v7)
    {
      v56 = 0;
      +[MCUIAppSigner enterpriseAppSignersWithOutDeveloperAppSigners:](MCUIAppSigner, "enterpriseAppSignersWithOutDeveloperAppSigners:", &v56);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v56;
      NSLog(CFSTR("Data manager returned after loading %d enterprise app signers and %d developer app signers from LaunchServices"), objc_msgSend(v15, "count"), objc_msgSend(v16, "count"));
    }
    else
    {
      v16 = 0;
      v15 = 0;
    }
    v34 = v10;
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D1BF88], "blockedApplications");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Data manager returned after loading %d blocked apps from LaunchServices"), objc_msgSend(v17, "count"));
    }
    else
    {
      v17 = 0;
    }
    v18 = v12;
    -[MCUIDataManager memberQueue](self, "memberQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __113__MCUIDataManager__reloadQueueReloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke;
    block[3] = &unk_1EA2B63A0;
    v53 = v8;
    block[4] = self;
    v20 = v32;
    v47 = v20;
    v21 = v13;
    v48 = v21;
    v22 = v18;
    v49 = v22;
    v54 = v33;
    v23 = v15;
    v50 = v23;
    v24 = v16;
    v51 = v24;
    v55 = v6;
    v25 = v17;
    v52 = v25;
    dispatch_sync(v19, block);

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __113__MCUIDataManager__reloadQueueReloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke_2;
    v35[3] = &unk_1EA2B63C8;
    v41 = v25;
    v42 = v34;
    v36 = v20;
    v37 = v21;
    v38 = v22;
    v39 = v23;
    v40 = v24;
    v43 = v8;
    v44 = v33;
    v45 = v6;
    v26 = v25;
    v27 = v24;
    v28 = v23;
    v29 = v22;
    v30 = v21;
    v31 = v20;
    dispatch_async(MEMORY[0x1E0C80D38], v35);

    v10 = v34;
  }

}

+ (BOOL)_isDeviceManagementHiddenConcrete
{
  return objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode");
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3);
  return (id)sharedManager_manager;
}

void __32__MCUIDataManager_sharedManager__block_invoke()
{
  MCUIDataManager *v0;
  void *v1;

  v0 = objc_alloc_init(MCUIDataManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

void __23__MCUIDataManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:", 0);

}

void __23__MCUIDataManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:", 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB270], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0D471E8], 0);

  if (self->_observing)
  {
    -[LSApplicationWorkspace removeObserver:](self->_appWorkspace, "removeObserver:", self);
    self->_observing = 0;
  }
  notify_cancel(self->_appsChangedNotifyToken);
  notify_cancel(self->_provisioningProfileInstalledToken);
  notify_cancel(self->_provisioningProfileRemovedToken);
  v6.receiver = self;
  v6.super_class = (Class)MCUIDataManager;
  -[MCUIDataManager dealloc](&v6, sel_dealloc);
}

- (void)profilesChanged:(id)a3
{
  NSLog(CFSTR("Data manager reloading all data in background because profile list changed"), a2, a3);
  -[MCUIDataManager reloadAllDataInBackgroundWithCompletion:](self, "reloadAllDataInBackgroundWithCompletion:", 0);
}

- (BOOL)isProfileSectionEmpty
{
  return -[MCUIDataManager itemCount](self, "itemCount") == 0;
}

- (unint64_t)itemCount
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__MCUIDataManager_itemCount__block_invoke;
  v6[3] = &unk_1EA2B6328;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __28__MCUIDataManager_itemCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  v4 = objc_msgSend(*(id *)(v2 + 32), "count");
  if (v3)
    v5 = v4 + 1;
  else
    v5 = v4;
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  v7 = v5 + v6 + objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7 + v8 + result;
  return result;
}

- (unint64_t)appSignerCount
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__MCUIDataManager_appSignerCount__block_invoke;
  v6[3] = &unk_1EA2B6328;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__MCUIDataManager_appSignerCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result + v2;
  return result;
}

- (unint64_t)installedProfileCount
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__MCUIDataManager_installedProfileCount__block_invoke;
  v6[3] = &unk_1EA2B6328;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __40__MCUIDataManager_installedProfileCount__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 24);
  result = objc_msgSend(*(id *)(v2 + 32), "count");
  if (v3)
    v5 = result + 1;
  else
    v5 = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  return result;
}

- (id)mdmProfile
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__MCUIDataManager_mdmProfile__block_invoke;
  v6[3] = &unk_1EA2B6328;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __29__MCUIDataManager_mdmProfile__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (id)configurationProfiles
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__MCUIDataManager_configurationProfiles__block_invoke;
  v6[3] = &unk_1EA2B6328;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__MCUIDataManager_configurationProfiles__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (NSArray)uninstalledProfilesInfo
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__MCUIDataManager_uninstalledProfilesInfo__block_invoke;
  v6[3] = &unk_1EA2B6328;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __42__MCUIDataManager_uninstalledProfilesInfo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (NSArray)freeDeveloperAppSigners
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__MCUIDataManager_freeDeveloperAppSigners__block_invoke;
  v6[3] = &unk_1EA2B6328;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __42__MCUIDataManager_freeDeveloperAppSigners__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
}

- (NSArray)enterpriseAppSigners
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__MCUIDataManager_enterpriseAppSigners__block_invoke;
  v6[3] = &unk_1EA2B6328;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __39__MCUIDataManager_enterpriseAppSigners__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 56));
}

- (NSArray)blockedApplications
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __38__MCUIDataManager_blockedApplications__block_invoke;
  v6[3] = &unk_1EA2B6328;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __38__MCUIDataManager_blockedApplications__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)allDeviceManagementOutMDMProfileInfo:(id *)a3 outConfigurationProfilesInfo:(id *)a4 outUninstalledProfilesInfo:(id *)a5 outEnterpriseAppSigners:(id *)a6 outFreeDevAppSigners:(id *)a7 outBlockedApplications:(id *)a8
{
  NSObject *v12;
  _QWORD block[11];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy_;
  v51 = __Block_byref_object_dispose_;
  v52 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  v46 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  -[MCUIDataManager memberQueue](self, "memberQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __180__MCUIDataManager_allDeviceManagementOutMDMProfileInfo_outConfigurationProfilesInfo_outUninstalledProfilesInfo_outEnterpriseAppSigners_outFreeDevAppSigners_outBlockedApplications___block_invoke;
  block[3] = &unk_1EA2B6350;
  block[4] = self;
  block[5] = &v47;
  block[6] = &v41;
  block[7] = &v35;
  block[8] = &v29;
  block[9] = &v23;
  block[10] = &v17;
  dispatch_sync(v12, block);

  if (a3)
    *a3 = objc_retainAutorelease((id)v48[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v42[5]);
  if (a5)
    *a5 = objc_retainAutorelease((id)v36[5]);
  if (a6)
    *a6 = objc_retainAutorelease((id)v30[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v24[5]);
  if (a8)
    *a8 = objc_retainAutorelease((id)v18[5]);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
}

void __180__MCUIDataManager_allDeviceManagementOutMDMProfileInfo_outConfigurationProfilesInfo_outUninstalledProfilesInfo_outEnterpriseAppSigners_outFreeDevAppSigners_outBlockedApplications___block_invoke(_QWORD *a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), *(id *)(a1[4] + 56));
  objc_storeStrong((id *)(*(_QWORD *)(a1[9] + 8) + 40), *(id *)(a1[4] + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1[10] + 8) + 40), *(id *)(a1[4] + 64));
}

- (void)reloadAllDataInBackgroundWithCompletion:(id)a3
{
  -[MCUIDataManager reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:](self, "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:", 1, 1, 1, a3);
}

uint64_t __101__MCUIDataManager_reloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadQueueReloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49), *(unsigned __int8 *)(a1 + 50), *(_QWORD *)(a1 + 40));
}

void __113__MCUIDataManager__reloadQueueReloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 88))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 56));
  }
  if (*(_BYTE *)(a1 + 89))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 64));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 72));
  }
  if (*(_BYTE *)(a1 + 90))
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 80));
}

void __113__MCUIDataManager__reloadQueueReloadDataInBackgroundIncludingProfiles_appSigners_blockedApplications_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 80);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("kMCUIProfilesUpdatedNotification"), 0, 0);

  }
  if (*(_BYTE *)(a1 + 89))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("kMCUIAppSignersUpdatedNotification"), 0, 0);

  }
  if (*(_BYTE *)(a1 + 88) || *(_BYTE *)(a1 + 89) || *(_BYTE *)(a1 + 90))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = CFSTR("kMCUIProfilesUpdatedNotification");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = CFSTR("kMCUIAppSignersUpdatedNotification");
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 89));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("kMCUIUpdatedNotification"), 0, v8);

  }
}

- (void)reloadProfilesInBackgroundWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__MCUIDataManager_reloadProfilesInBackgroundWithCompletion___block_invoke;
  v7[3] = &unk_1EA2B63F0;
  v8 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1DF0AD9A4](v7);
  -[MCUIDataManager reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:](self, "reloadDataInBackgroundIncludingProfiles:appSigners:blockedApplications:completion:", 1, 0, 0, v6);

}

uint64_t __60__MCUIDataManager_reloadProfilesInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)applicationsDidInstall:(id)a3
{
  -[MCUIDataManager reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:](self, "reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:", 0);
}

- (void)applicationsDidUninstall:(id)a3
{
  -[MCUIDataManager reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:](self, "reloadAppSignersAndBlockedAppsInBackgroundWithCompletion:", 0);
}

- (MCProfileInfo)mdmProfileInfo
{
  return self->_mdmProfileInfo;
}

- (void)setMdmProfileInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mdmProfileInfo, a3);
}

- (NSArray)configurationProfilesInfo
{
  return self->_configurationProfilesInfo;
}

- (void)setConfigurationProfilesInfo:(id)a3
{
  objc_storeStrong((id *)&self->_configurationProfilesInfo, a3);
}

- (void)setUninstalledProfilesInfo:(id)a3
{
  objc_storeStrong((id *)&self->_uninstalledProfilesInfo, a3);
}

- (void)setFreeDeveloperAppSigners:(id)a3
{
  objc_storeStrong((id *)&self->_freeDeveloperAppSigners, a3);
}

- (void)setEnterpriseAppSigners:(id)a3
{
  objc_storeStrong((id *)&self->_enterpriseAppSigners, a3);
}

- (void)setBlockedApplications:(id)a3
{
  objc_storeStrong((id *)&self->_blockedApplications, a3);
}

- (void)setAppWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_appWorkspace, a3);
}

- (OS_dispatch_queue)reloadQueue
{
  return self->_reloadQueue;
}

- (void)setReloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reloadQueue, a3);
}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (BOOL)observing
{
  return self->_observing;
}

- (int)appsChangedNotifyToken
{
  return self->_appsChangedNotifyToken;
}

- (void)setAppsChangedNotifyToken:(int)a3
{
  self->_appsChangedNotifyToken = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueue, 0);
  objc_storeStrong((id *)&self->_reloadQueue, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
  objc_storeStrong((id *)&self->_blockedApplications, 0);
  objc_storeStrong((id *)&self->_enterpriseAppSigners, 0);
  objc_storeStrong((id *)&self->_freeDeveloperAppSigners, 0);
  objc_storeStrong((id *)&self->_uninstalledProfilesInfo, 0);
  objc_storeStrong((id *)&self->_configurationProfilesInfo, 0);
  objc_storeStrong((id *)&self->_mdmProfileInfo, 0);
}

@end
