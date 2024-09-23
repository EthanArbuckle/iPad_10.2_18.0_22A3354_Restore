@implementation MCUIWatchManager

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_7);
  return (id)shared_sharedInstance;
}

void __26__MCUIWatchManager_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (MCUIForPairedDevice())
  {
    v0 = objc_opt_new();
    v1 = (void *)shared_sharedInstance;
    shared_sharedInstance = v0;

  }
  else
  {
    NSLog(CFSTR("MCUI Watch manager not loading because MCUI is not running in Bridge"));
  }
}

- (MCUIWatchManager)init
{
  MCUIWatchManager *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSSManager *nssManager;
  uint64_t v7;
  NSMutableDictionary *cachedProfiles;
  uint64_t v9;
  NSMutableDictionary *cachedProfileSummaries;
  uint64_t v11;
  NSMutableDictionary *cachedRMConfigurationViewModels;
  NSArray *mdmProfilesInfo;
  NSArray *v14;
  NSArray *configProfilesInfo;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MCUIWatchManager;
  v2 = -[MCUIWatchManager init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D51860]);
    v4 = MEMORY[0x1E0C80D38];
    v5 = objc_msgSend(v3, "initWithQueue:", MEMORY[0x1E0C80D38]);
    nssManager = v2->_nssManager;
    v2->_nssManager = (NSSManager *)v5;

    v7 = objc_opt_new();
    cachedProfiles = v2->_cachedProfiles;
    v2->_cachedProfiles = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    cachedProfileSummaries = v2->_cachedProfileSummaries;
    v2->_cachedProfileSummaries = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    cachedRMConfigurationViewModels = v2->_cachedRMConfigurationViewModels;
    v2->_cachedRMConfigurationViewModels = (NSMutableDictionary *)v11;

    mdmProfilesInfo = v2->_mdmProfilesInfo;
    v14 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_fetchStatus = 2;
    v2->_mdmProfilesInfo = v14;

    configProfilesInfo = v2->_configProfilesInfo;
    v2->_configProfilesInfo = v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel__watchChanged_, *MEMORY[0x1E0D517D0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel__watchChanged_, *MEMORY[0x1E0D517A8], 0);

    dispatch_async(v4, &__block_literal_global_19);
    -[MCUIWatchManager _fetchProfiles](v2, "_fetchProfiles");
  }
  return v2;
}

void __24__MCUIWatchManager_init__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0CEAA60];
  v24[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appearanceWhenContainedInInstancesOfClasses:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  BPSForegroundColor();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = (void *)MEMORY[0x1E0CEAA58];
  v23 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appearanceWhenContainedInInstancesOfClasses:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BPSBackgroundColor();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = (void *)MEMORY[0x1E0CEAA58];
  v22 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appearanceWhenContainedInInstancesOfClasses:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  BPSSeparatorColor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSeparatorColor:", v11);

  v12 = (void *)MEMORY[0x1E0CEAA58];
  v21 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "appearanceWhenContainedInInstancesOfClasses:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  BPSTextColor();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSectionIndexColor:", v15);

  v16 = (void *)MEMORY[0x1E0CEAA58];
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appearanceWhenContainedInInstancesOfClasses:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  BPSForegroundColor();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSectionIndexBackgroundColor:", v19);

}

- (void)_watchChanged:(id)a3
{
  void *v4;
  _QWORD block[4];
  id v6;
  id location;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("MCUI Watch manager handling notification: %@"), v4);

  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MCUIWatchManager__watchChanged___block_invoke;
  block[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v6, &location);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __34__MCUIWatchManager__watchChanged___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "nssManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidate");

    v3 = objc_alloc(MEMORY[0x1E0D51860]);
    v4 = (void *)objc_msgSend(v3, "initWithQueue:", MEMORY[0x1E0C80D38]);
    objc_msgSend(v8, "setNssManager:", v4);

    objc_msgSend(v8, "cachedProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

    objc_msgSend(v8, "cachedProfileSummaries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");

    objc_msgSend(v8, "cachedRMConfigurationViewModels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeAllObjects");

    objc_msgSend(v8, "_fetchProfiles");
    WeakRetained = v8;
  }

}

- (int64_t)profileCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[MCUIWatchManager mdmProfilesInfo](self, "mdmProfilesInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[MCUIWatchManager configProfilesInfo](self, "configProfilesInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") + v4;

  return v6;
}

- (void)installProfileData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[MCUIWatchManager nssManager](self, "nssManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MCUIWatchManager_installProfileData_completion___block_invoke;
  v10[3] = &unk_1EA2B6670;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "installProfile:completionHandler:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __50__MCUIWatchManager_installProfileData_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
    NSLog(CFSTR("Error: MCUI Watch manager failed to install profile with error: %@"), v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_fetchProfiles");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)removeProfileIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[MCUIWatchManager nssManager](self, "nssManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__MCUIWatchManager_removeProfileIdentifier_completion___block_invoke;
  v11[3] = &unk_1EA2B6698;
  v9 = v6;
  v12 = v9;
  objc_copyWeak(&v14, &location);
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "removeProfileWithIdentifier:completionHandler:", v9, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __55__MCUIWatchManager_removeProfileIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
    NSLog(CFSTR("Error: MCUI Watch manager failed to remove profile (%@) with error: %@"), *(_QWORD *)(a1 + 32), v5);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_fetchProfiles");
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_fetchProfiles
{
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD block[4];
  id v8;
  id location;

  NSLog(CFSTR("MCUI Watch manager fetching profiles..."), a2);
  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MCUIWatchManager__fetchProfiles__block_invoke;
  block[3] = &unk_1EA2B5BE8;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  -[MCUIWatchManager nssManager](self, "nssManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __34__MCUIWatchManager__fetchProfiles__block_invoke_2;
  v5[3] = &unk_1EA2B66E0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "getProfilesInfo:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __34__MCUIWatchManager__fetchProfiles__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setFetchStatus:", 2);
    WeakRetained = v2;
  }

}

void __34__MCUIWatchManager__fetchProfiles__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MCUIWatchManager__fetchProfiles__block_invoke_3;
  block[3] = &unk_1EA2B5CC0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __34__MCUIWatchManager__fetchProfiles__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "_handleFetchProfilesError:");
    }
    else
    {
      objc_msgSend(WeakRetained, "setFetchStatus:");
      v4 = *MEMORY[0x1E0D51888];
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D51888]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v6;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setMdmProfilesInfo:", v7);

      }
      else
      {
        objc_msgSend(v3, "setMdmProfilesInfo:", MEMORY[0x1E0C9AA60]);
      }

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D51880]);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = v8;
      else
        v10 = MEMORY[0x1E0C9AA60];
      objc_msgSend(v3, "setConfigProfilesInfo:", v10);

      objc_msgSend(v3, "configProfilesInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_35);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "filteredArrayUsingPredicate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setConfigProfilesInfo:", v13);

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D51868]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setManagedAppsUninstalledOnMDMRemoval:", v14);

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *MEMORY[0x1E0D51898]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "setRmAccount:", v15);
      objc_msgSend(v3, "mdmProfilesInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      objc_msgSend(v3, "configProfilesInfo");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      objc_msgSend(v3, "managedAppsUninstalledOnMDMRemoval");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      objc_msgSend(v3, "rmAccount");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("MCUI Watch manager successfully fetched %ld MDM profile(s), %ld configuration profile(s), %ld managed app(s), and rmAccount %{BOOL}d"), v17, v19, v21, v22 != 0);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "postNotificationName:object:", CFSTR("kMCUIUpdatedNotification"), 0);

    }
  }

}

uint64_t __34__MCUIWatchManager__fetchProfiles__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isInstalledByDeclarativeManagement") ^ 1;
}

- (void)_handleFetchProfilesError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSLog(CFSTR("MCUI Watch manager failed to fetch profiles with error: %@"), v4);
  -[MCUIWatchManager setFetchStatus:](self, "setFetchStatus:", 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("kMCUINotificationErrorKey");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("kMCUIWatchFetchFailedNotification"), 0, v6);
}

- (void)fetchProfileIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[MCUIWatchManager nssManager](self, "nssManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __54__MCUIWatchManager_fetchProfileIdentifier_completion___block_invoke;
  v11[3] = &unk_1EA2B6730;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "getFullProfileInfoWithIdentifier:includeManagedPayloads:completionHandler:", v9, 1, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __54__MCUIWatchManager_fetchProfileIdentifier_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MCUIWatchManager_fetchProfileIdentifier_completion___block_invoke_2;
  block[3] = &unk_1EA2B6708;
  objc_copyWeak(&v15, a1 + 6);
  v11 = v6;
  v12 = a1[4];
  v7 = a1[5];
  v13 = v5;
  v14 = v7;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v15);
}

void __54__MCUIWatchManager_fetchProfileIdentifier_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      NSLog(CFSTR("MCUI Watch manager failed to fetch profile (%@) with error: %@"), *(_QWORD *)(a1 + 40), v3);
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D51870]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0D47220], "profileWithData:outError:", v4, &v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      if (v6)
      {
        v7 = v6;
        NSLog(CFSTR("MCUI Watch manager failed to decode profile (%@) with error: %@"), *(_QWORD *)(a1 + 40), v6);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_9:
        goto LABEL_10;
      }
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D51878]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_unarchiveProfilePayloadsSummaryFromData:forProfileIdentifier:", v8, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D51890]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_unarchiveRMConfigurationViewModelsFromData:forProfileIdentifier:", v9, *(_QWORD *)(a1 + 40));

    objc_msgSend(WeakRetained, "cachedProfiles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
LABEL_10:

}

- (void)_unarchiveProfilePayloadsSummaryFromData:(id)a3 forProfileIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = a3;
    v13 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v13;
    v11 = v10;
    if (v10)
      NSLog(CFSTR("MCUI Watch manager failed to unarchive profile (%@) payloads summary with error: %@"), v6, v10);
    if (v9)
    {
      -[MCUIWatchManager cachedProfileSummaries](self, "cachedProfileSummaries");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v6);

    }
  }

}

- (void)_unarchiveRMConfigurationViewModelsFromData:(id)a3 forProfileIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = a3;
    v13 = 0;
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v8, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v13;
    v11 = v10;
    if (v10)
      NSLog(CFSTR("MCUI Watch manager failed to unarchive profile (%@) rm configuration view models with error: %@"), v6, v10);
    if (v9)
    {
      -[MCUIWatchManager cachedRMConfigurationViewModels](self, "cachedRMConfigurationViewModels");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, v6);

    }
  }

}

- (id)cachedMDMProfileIdentifier
{
  void *v2;
  void *v3;

  -[NSArray firstObject](self->_mdmProfilesInfo, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cachedProfileForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedProfiles, "objectForKeyedSubscript:", a3);
}

- (id)cachedProfileSummaryForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedProfileSummaries, "objectForKeyedSubscript:", a3);
}

- (id)cachedRMConfigurationViewModelsForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedRMConfigurationViewModels, "objectForKeyedSubscript:", a3);
}

- (unint64_t)fetchStatus
{
  return self->_fetchStatus;
}

- (void)setFetchStatus:(unint64_t)a3
{
  self->_fetchStatus = a3;
}

- (NSArray)mdmProfilesInfo
{
  return self->_mdmProfilesInfo;
}

- (void)setMdmProfilesInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mdmProfilesInfo, a3);
}

- (NSArray)configProfilesInfo
{
  return self->_configProfilesInfo;
}

- (void)setConfigProfilesInfo:(id)a3
{
  objc_storeStrong((id *)&self->_configProfilesInfo, a3);
}

- (ACAccount)rmAccount
{
  return self->_rmAccount;
}

- (void)setRmAccount:(id)a3
{
  objc_storeStrong((id *)&self->_rmAccount, a3);
}

- (NSDictionary)managedAppsUninstalledOnMDMRemoval
{
  return self->_managedAppsUninstalledOnMDMRemoval;
}

- (void)setManagedAppsUninstalledOnMDMRemoval:(id)a3
{
  objc_storeStrong((id *)&self->_managedAppsUninstalledOnMDMRemoval, a3);
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
  objc_storeStrong((id *)&self->_nssManager, a3);
}

- (NSMutableDictionary)cachedProfiles
{
  return self->_cachedProfiles;
}

- (void)setCachedProfiles:(id)a3
{
  objc_storeStrong((id *)&self->_cachedProfiles, a3);
}

- (NSMutableDictionary)cachedProfileSummaries
{
  return self->_cachedProfileSummaries;
}

- (void)setCachedProfileSummaries:(id)a3
{
  objc_storeStrong((id *)&self->_cachedProfileSummaries, a3);
}

- (NSMutableDictionary)cachedRMConfigurationViewModels
{
  return self->_cachedRMConfigurationViewModels;
}

- (void)setCachedRMConfigurationViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRMConfigurationViewModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRMConfigurationViewModels, 0);
  objc_storeStrong((id *)&self->_cachedProfileSummaries, 0);
  objc_storeStrong((id *)&self->_cachedProfiles, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);
  objc_storeStrong((id *)&self->_managedAppsUninstalledOnMDMRemoval, 0);
  objc_storeStrong((id *)&self->_rmAccount, 0);
  objc_storeStrong((id *)&self->_configProfilesInfo, 0);
  objc_storeStrong((id *)&self->_mdmProfilesInfo, 0);
}

@end
