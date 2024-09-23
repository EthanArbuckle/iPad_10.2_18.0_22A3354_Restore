@implementation HUSoftwareUpdateStandaloneItemManager

- (HUSoftwareUpdateStandaloneItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSoftwareUpdateStandaloneItemManager.m"), 60, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSoftwareUpdateStandaloneItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUSoftwareUpdateStandaloneItemManager)initWithDelegate:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  HUSoftwareUpdateStandaloneItemManager *v8;
  uint64_t v9;
  NAFuture *softwareUpdateFetchFuture;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HUSoftwareUpdateStandaloneItemManager;
  v8 = -[HFItemManager initWithDelegate:sourceItem:](&v18, sel_initWithDelegate_sourceItem_, v6, 0);
  if (v8)
  {
    v9 = objc_opt_new();
    softwareUpdateFetchFuture = v8->_softwareUpdateFetchFuture;
    v8->_softwareUpdateFetchFuture = (NAFuture *)v9;

    objc_storeStrong((id *)&v8->_overrideHome, a4);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addHomeManagerObserver:", v8);

    objc_initWeak(&location, v8);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "homeManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __63__HUSoftwareUpdateStandaloneItemManager_initWithDelegate_home___block_invoke;
    v15[3] = &unk_1E6F54280;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v13, "fetchDevicesWithCompletionHandler:", v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __63__HUSoftwareUpdateStandaloneItemManager_initWithDelegate_home___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "Fetched devices:[%@] Error:[%@]", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(WeakRetained, "setDevices:", v5);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeHomeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HUSoftwareUpdateStandaloneItemManager;
  -[HFItemManager dealloc](&v4, sel_dealloc);
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUSoftwareUpdateStandaloneItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  void *v5;
  HUFirmwareUpdateItemModule *v6;
  void *v7;
  HUSoftwareUpdateItemModule *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[HUFirmwareUpdateItemModule initWithItemUpdater:home:]([HUFirmwareUpdateItemModule alloc], "initWithItemUpdater:home:", self, v4);
  -[HUSoftwareUpdateStandaloneItemManager setFirmwareUpdateModule:](self, "setFirmwareUpdateModule:", v6);

  -[HUSoftwareUpdateStandaloneItemManager firmwareUpdateModule](self, "firmwareUpdateModule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v7);

  v8 = -[HUSoftwareUpdateItemModule initWithItemUpdater:home:sourceItem:]([HUSoftwareUpdateItemModule alloc], "initWithItemUpdater:home:sourceItem:", self, v4, 0);
  -[HUSoftwareUpdateStandaloneItemManager setSoftwareUpdateModule:](self, "setSoftwareUpdateModule:", v8);

  -[HUSoftwareUpdateStandaloneItemManager softwareUpdateModule](self, "softwareUpdateModule");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v9);

  return v5;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  HUSoftwareUpdateAllItem *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  HUSoftwareUpdateFetchItem *v30;
  void *v31;
  HUSoftwareUpdateFetchItem *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v48;
  uint64_t v49;
  id (*v50)(uint64_t);
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[4];
  id v58;
  HUSoftwareUpdateStandaloneItemManager *v59;
  _QWORD v60[4];
  id v61;
  HUSoftwareUpdateStandaloneItemManager *v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[2];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke;
  v63[3] = &unk_1E6F5AC38;
  v7 = v4;
  v64 = v7;
  __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke((uint64_t)v63);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0D31840]);
  v60[0] = v6;
  v60[1] = 3221225472;
  v60[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_2;
  v60[3] = &unk_1E6F4DB68;
  v10 = v8;
  v61 = v10;
  v62 = self;
  v11 = (void *)objc_msgSend(v9, "initWithResultsBlock:", v60);
  -[HUSoftwareUpdateStandaloneItemManager setAutoUpdateItem:](self, "setAutoUpdateItem:", v11);

  v12 = objc_alloc(MEMORY[0x1E0D31840]);
  v57[0] = v6;
  v57[1] = 3221225472;
  v57[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_3;
  v57[3] = &unk_1E6F4DB68;
  v58 = v10;
  v59 = self;
  v13 = v10;
  v14 = (void *)objc_msgSend(v12, "initWithResultsBlock:", v57);
  -[HUSoftwareUpdateStandaloneItemManager setAutoUpdateThirdPartyItem:](self, "setAutoUpdateThirdPartyItem:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D31840]);
  v55[0] = v6;
  v55[1] = 3221225472;
  v55[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_4;
  v55[3] = &unk_1E6F4DB68;
  v55[4] = self;
  v16 = v7;
  v56 = v16;
  v17 = (void *)objc_msgSend(v15, "initWithResultsBlock:", v55);
  -[HUSoftwareUpdateStandaloneItemManager setHomeUpdateBannerItem:](self, "setHomeUpdateBannerItem:", v17);

  v18 = -[HUSoftwareUpdateAllItem initWithHome:]([HUSoftwareUpdateAllItem alloc], "initWithHome:", v16);
  -[HUSoftwareUpdateStandaloneItemManager setUpdateAllItem:](self, "setUpdateAllItem:", v18);

  v19 = objc_alloc(MEMORY[0x1E0D31840]);
  v65[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateUpdatedRecentlyTitle"), CFSTR("HUSoftwareUpdateUpdatedRecentlyTitle"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v20;
  v65[1] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "hf_currentUserIsAdministrator") ^ 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v19, "initWithResults:", v22);
  -[HUSoftwareUpdateStandaloneItemManager setUpdatedRecentlyItem:](self, "setUpdatedRecentlyItem:", v23);

  v24 = objc_alloc(MEMORY[0x1E0D31840]);
  v53[0] = v6;
  v53[1] = 3221225472;
  v53[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_55;
  v53[3] = &unk_1E6F4C518;
  v25 = v16;
  v54 = v25;
  v26 = (void *)objc_msgSend(v24, "initWithResultsBlock:", v53);
  -[HUSoftwareUpdateStandaloneItemManager setBetaUpdatesItem:](self, "setBetaUpdatesItem:", v26);

  v27 = objc_alloc(MEMORY[0x1E0D31840]);
  v48 = v6;
  v49 = 3221225472;
  v50 = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_4_65;
  v51 = &unk_1E6F4C518;
  v52 = v25;
  v28 = v25;
  v29 = (void *)objc_msgSend(v27, "initWithResultsBlock:", &v48);
  -[HUSoftwareUpdateStandaloneItemManager setCarrySettingsItem:](self, "setCarrySettingsItem:", v29);

  v30 = [HUSoftwareUpdateFetchItem alloc];
  -[HUSoftwareUpdateStandaloneItemManager softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[HUSoftwareUpdateFetchItem initWithHome:softwareUpdateFetchFuture:](v30, "initWithHome:softwareUpdateFetchFuture:", v28, v31);
  -[HUSoftwareUpdateStandaloneItemManager setFetchItem:](self, "setFetchItem:", v32);

  v33 = (void *)MEMORY[0x1E0C99E20];
  -[HUSoftwareUpdateStandaloneItemManager autoUpdateItem](self, "autoUpdateItem");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateStandaloneItemManager fetchItem](self, "fetchItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateStandaloneItemManager updateAllItem](self, "updateAllItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateStandaloneItemManager autoUpdateThirdPartyItem](self, "autoUpdateThirdPartyItem");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateStandaloneItemManager updatedRecentlyItem](self, "updatedRecentlyItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setWithObjects:", v34, v35, v36, v37, v38, 0, v48, v49, v50, v51);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUSoftwareUpdateStandaloneItemManager homeUpdateBannerItem](self, "homeUpdateBannerItem");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "addObject:", v40);

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v39);
  objc_msgSend(v5, "addObject:", v41);
  v42 = (void *)MEMORY[0x1E0C99E60];
  -[HUSoftwareUpdateStandaloneItemManager betaUpdatesItem](self, "betaUpdatesItem");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSoftwareUpdateStandaloneItemManager carrySettingsItem](self, "carrySettingsItem");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setWithObjects:", v43, v44, 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31850]), "initWithItems:", v45);
  objc_msgSend(v5, "addObject:", v46);

  return v5;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30B80];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30B80]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsAdministrator") ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30D70]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner") ^ 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30C80]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v7);

  return v2;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateEnableAutomaticUpdatesSwitch"), CFSTR("HUSoftwareUpdateEnableAutomaticUpdatesSwitch"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("HUSoftwareUpdateEnableAutomaticUpdatesSwitch"), *MEMORY[0x1E0D30D20]);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isAutomaticSoftwareUpdateEnabled");
  objc_msgSend(v4, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateEnableAutomaticThirdPartyUpdatesSwitch"), CFSTR("HUSoftwareUpdateEnableAutomaticThirdPartyUpdatesSwitch"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0D30D18]);

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "isAutomaticThirdPartyAccessorySoftwareUpdateEnabled");
  objc_msgSend(v4, "numberWithInteger:", HFPrimaryStateFromBOOL());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30E20]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allHomesFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_5;
  v11[3] = &unk_1E6F5AC80;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v2;
  v13 = v5;
  v14 = v6;
  v7 = v2;
  v8 = (id)objc_msgSend(v4, "addSuccessBlock:", v11);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_5(id *a1, void *a2)
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "na_filter:", &__block_literal_global_203);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateHomeKitUpdateAvailable"), CFSTR("HUSoftwareUpdateHomeKitUpdateAvailable"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D18]);

  v32 = v3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
    v5 = CFSTR("HUSoftwareUpdateImproveReliabilityAndPerformance");
  else
    v5 = CFSTR("HUSoftwareUpdateImproveReliabilityAndPerformancePlural");
  _HULocalizedStringWithDefaultValue(v5, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30BF8]);

  _HULocalizedStringWithDefaultValue(CFSTR("HULearnMoreTitle"), CFSTR("HULearnMoreTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30BC0]);

  v8 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configurationWithHierarchicalColor:", v9);
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)v10;
  objc_msgSend(v11, "configurationByApplyingConfiguration:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31880]), "initWithSystemImageName:configuration:", CFSTR("homekit"), v12);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSymbolIconConfiguration:", v13);
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D30C60]);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "homeManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[5], "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hf_canUpdateToHH2");

  HFLogForCategory();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  v21 = 0x1E0CB3000;
  if (v18)
  {
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1[6], "hf_currentUserIsOwner"));
      v29 = v12;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "isHH2MigrationAvailable"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "hasOptedToHH2"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v22;
      v35 = 2112;
      v36 = v23;
      v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "Showing HH2 migration banner. Owner:%@ migrationAvailable:%@ userAlreadyOptedIn:%@", buf, 0x20u);

      v21 = 0x1E0CB3000;
      v12 = v29;
    }
  }
  else if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1[6], "hf_currentUserIsOwner"));
    v30 = v11;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "isHH2MigrationAvailable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v16, "hasOptedToHH2"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v34 = v25;
    v35 = 2112;
    v36 = v26;
    v37 = 2112;
    v38 = v27;
    _os_log_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_DEFAULT, "Hiding HH2 migration banner. Owner:%@ migrationAvailable:%@ userAlreadyOptedIn:%@", buf, 0x20u);

    v21 = 0x1E0CB3000uLL;
    v11 = v30;
  }

  objc_msgSend(*(id *)(v21 + 2024), "numberWithInt:", v18 ^ 1u);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D30D70]);

}

uint64_t __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hf_userIsOwner:", v3);

  return v4;
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_55(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__24;
  v15 = __Block_byref_object_dispose__24;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateBetaUpdatesTitle"), CFSTR("HUSoftwareUpdateBetaUpdatesTitle"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12[5], "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0D30D18]);

  objc_msgSend((id)v12[5], "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  if (objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner")
    && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomePods") & 1) != 0)
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = (void *)MEMORY[0x1E0D519C0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_58;
    v9[3] = &unk_1E6F4C660;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v4, "futureWithBlock:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_3_63;
    v8[3] = &unk_1E6F5ACA8;
    v8[4] = &v11;
    objc_msgSend(v5, "flatMap:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v12[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D33500];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_2_60;
  v7[3] = &unk_1E6F4D5D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "shouldShowBetaEnrollmentButtonForHomeID:withCompletion:", v5, v7);

}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_2_60(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

uint64_t __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_3_63(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "BOOLValue"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30D70]);
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

id __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_4_65(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__24;
  v15 = __Block_byref_object_dispose__24;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateCarrySettingsTitle"), CFSTR("HUSoftwareUpdateCarrySettingsTitle"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v12[5], "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0D30D18]);

  objc_msgSend((id)v12[5], "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  if (objc_msgSend(*(id *)(a1 + 32), "hf_currentUserIsOwner")
    && (objc_msgSend(*(id *)(a1 + 32), "hf_hasHomePods") & 1) != 0)
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = (void *)MEMORY[0x1E0D519C0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_5_68;
    v9[3] = &unk_1E6F4C660;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v4, "futureWithBlock:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_7;
    v8[3] = &unk_1E6F5ACA8;
    v8[4] = &v11;
    objc_msgSend(v5, "flatMap:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v12[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_5_68(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D33508];
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_6_70;
  v7[3] = &unk_1E6F4D5D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v4, "shouldShowCarrySettingsButtonForHomeID:withCompletion:", v5, v7);

}

void __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_6_70(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithResult:", v3);

}

uint64_t __68__HUSoftwareUpdateStandaloneItemManager__buildItemProvidersForHome___block_invoke_7(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "BOOLValue"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30D70]);
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
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
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v45[2];
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("banners"));
  -[HUSoftwareUpdateStandaloneItemManager homeUpdateBannerItem](self, "homeUpdateBannerItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v8);

  objc_msgSend(v5, "addObject:", v6);
  -[HFItemManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v9, "hf_hasAccessoriesSupportingSoftwareUpdate");

  if (!(_DWORD)v8)
    goto LABEL_11;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("settings"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateEnableAutomaticUpdatesSectionHeader"), CFSTR("HUSoftwareUpdateEnableAutomaticUpdatesSectionHeader"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHeaderTitle:", v11);

  v12 = (void *)objc_opt_new();
  -[HFItemManager home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hf_hasFirstPartyAccessoriesSupportingSoftwareUpdate");

  if (v14)
  {
    -[HUSoftwareUpdateStandaloneItemManager autoUpdateItem](self, "autoUpdateItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v15);

  }
  -[HFItemManager home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "hf_hasThirdPartyAccessoriesSupportingSoftwareUpdate"))
    goto LABEL_7;
  -[HFItemManager home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hf_hasEnabledResidentSupportingThirdPartySoftwareUpdate");

  if (v18)
  {
    -[HUSoftwareUpdateStandaloneItemManager autoUpdateThirdPartyItem](self, "autoUpdateThirdPartyItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v16);
LABEL_7:

  }
  objc_msgSend(v10, "setItems:", v12);
  objc_msgSend(v10, "items");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
    objc_msgSend(v5, "addObject:", v10);

LABEL_11:
  -[HUSoftwareUpdateStandaloneItemManager fetchItem](self, "fetchItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "latestResults");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EA8]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "BOOLValue");

  if ((v24 & 1) == 0)
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("updateAll"));
    -[HUSoftwareUpdateStandaloneItemManager updateAllItem](self, "updateAllItem");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setItems:", v27);

    objc_msgSend(v5, "addObject:", v25);
  }
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("fetchUpdates"));
  -[HUSoftwareUpdateStandaloneItemManager fetchItem](self, "fetchItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setItems:", v30);

  objc_msgSend(v5, "addObject:", v28);
  -[HUSoftwareUpdateStandaloneItemManager softwareUpdateModule](self, "softwareUpdateModule");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setHideAppleUpdates:", v24);

  -[HUSoftwareUpdateStandaloneItemManager softwareUpdateModule](self, "softwareUpdateModule");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "buildSectionsWithDisplayedItems:", v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v33);

  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("updatedRecently"));
  -[HUSoftwareUpdateStandaloneItemManager updatedRecentlyItem](self, "updatedRecentlyItem");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v35;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setItems:", v36);

  objc_msgSend(v5, "addObject:", v34);
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("betaUpdates"));
  -[HUSoftwareUpdateStandaloneItemManager betaUpdatesItem](self, "betaUpdatesItem");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v38;
  -[HUSoftwareUpdateStandaloneItemManager carrySettingsItem](self, "carrySettingsItem");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setItems:", v40);

  objc_msgSend(v5, "addObject:", v37);
  -[HUSoftwareUpdateStandaloneItemManager firmwareUpdateModule](self, "firmwareUpdateModule");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "buildSectionsWithDisplayedItems:", v4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v42);

  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HUSoftwareUpdateStandaloneItemManager;
  -[HFItemManager _itemsToHideInSet:](&v20, sel__itemsToHideInSet_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __59__HUSoftwareUpdateStandaloneItemManager__itemsToHideInSet___block_invoke;
  v13 = &unk_1E6F5ACD0;
  v7 = v6;
  v14 = v7;
  v15 = &v16;
  objc_msgSend(v4, "na_each:", &v10);
  if (!*((_BYTE *)v17 + 24))
  {
    -[HUSoftwareUpdateStandaloneItemManager updatedRecentlyItem](self, "updatedRecentlyItem", v10, v11, v12, v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  _Block_object_dispose(&v16, 8);

  return v7;
}

void __59__HUSoftwareUpdateStandaloneItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "latestResults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30EB8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

- (id)_transformedUpdateOutcomeForItem:(id)a3 proposedOutcome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  -[HUSoftwareUpdateStandaloneItemManager firmwareUpdateModule](self, "firmwareUpdateModule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUSoftwareUpdateStandaloneItemManager firmwareUpdateModule](self, "firmwareUpdateModule");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transformedUpdateOutcomeForItem:proposedOutcome:", v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)triggerSoftwareUpdateFetch
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[HUSoftwareUpdateStandaloneItemManager softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFinished");

  if (v5)
  {
    v6 = (void *)objc_opt_new();
    -[HUSoftwareUpdateStandaloneItemManager setSoftwareUpdateFetchFuture:](self, "setSoftwareUpdateFetchFuture:", v6);

    -[HUSoftwareUpdateStandaloneItemManager softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSoftwareUpdateStandaloneItemManager fetchItem](self, "fetchItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSoftwareUpdateFetchFuture:", v7);

    v9 = (void *)MEMORY[0x1E0D314C0];
    v10 = (void *)MEMORY[0x1E0C99E60];
    -[HFItemManager itemProviders](self, "itemProviders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestToReloadItemProviders:senderSelector:", v12, a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HFItemManager performItemUpdateRequest:](self, "performItemUpdateRequest:", v13);

  }
  -[HUSoftwareUpdateStandaloneItemManager softwareUpdateFetchFuture](self, "softwareUpdateFetchFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addHomeSetupSuccessBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__HUSoftwareUpdateStandaloneItemManager_addHomeSetupSuccessBlock___block_invoke;
  v6[3] = &unk_1E6F5ACF8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __66__HUSoftwareUpdateStandaloneItemManager_addHomeSetupSuccessBlock___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_homeFuture");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "addSuccessBlock:", *(_QWORD *)(a1 + 40));

}

- (void)home:(id)a3 didUpdateAutomaticSoftwareUpdateEnabled:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0D314C0];
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HUSoftwareUpdateStandaloneItemManager autoUpdateItem](self, "autoUpdateItem", a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestToUpdateItems:senderSelector:", v8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFItemManager performItemUpdateRequest:](self, "performItemUpdateRequest:", v9);

}

- (void)home:(id)a3 didUpdateAutomaticThirdPartyAccessorySoftwareUpdateEnabled:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0D314C0];
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[HUSoftwareUpdateStandaloneItemManager autoUpdateThirdPartyItem](self, "autoUpdateThirdPartyItem", a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithObject:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestToUpdateItems:senderSelector:", v8, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFItemManager performItemUpdateRequest:](self, "performItemUpdateRequest:", v9);

}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  HUSoftwareUpdateStandaloneItemManager *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = self;
    v17 = 2112;
    v18 = v8;
    v19 = 1024;
    v20 = v4;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@: Migration Completed - didUpdateHH2State = %{BOOL}d", (uint8_t *)&v15, 0x1Cu);

  }
  v9 = (void *)MEMORY[0x1E0D314C0];
  v10 = (void *)MEMORY[0x1E0C99E60];
  -[HFItemManager itemProviders](self, "itemProviders");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestToReloadItemProviders:senderSelector:", v12, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HFItemManager performItemUpdateRequest:](self, "performItemUpdateRequest:", v13);

}

- (HFItem)autoUpdateItem
{
  return self->_autoUpdateItem;
}

- (void)setAutoUpdateItem:(id)a3
{
  objc_storeStrong((id *)&self->_autoUpdateItem, a3);
}

- (HFItem)autoUpdateThirdPartyItem
{
  return self->_autoUpdateThirdPartyItem;
}

- (void)setAutoUpdateThirdPartyItem:(id)a3
{
  objc_storeStrong((id *)&self->_autoUpdateThirdPartyItem, a3);
}

- (HFItem)homeUpdateBannerItem
{
  return self->_homeUpdateBannerItem;
}

- (void)setHomeUpdateBannerItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeUpdateBannerItem, a3);
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (HUSoftwareUpdateFetchItem)fetchItem
{
  return self->_fetchItem;
}

- (void)setFetchItem:(id)a3
{
  objc_storeStrong((id *)&self->_fetchItem, a3);
}

- (HUSoftwareUpdateItemModule)softwareUpdateModule
{
  return self->_softwareUpdateModule;
}

- (void)setSoftwareUpdateModule:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateModule, a3);
}

- (HUSoftwareUpdateAllItem)updateAllItem
{
  return self->_updateAllItem;
}

- (void)setUpdateAllItem:(id)a3
{
  objc_storeStrong((id *)&self->_updateAllItem, a3);
}

- (HFItem)updatedRecentlyItem
{
  return self->_updatedRecentlyItem;
}

- (void)setUpdatedRecentlyItem:(id)a3
{
  objc_storeStrong((id *)&self->_updatedRecentlyItem, a3);
}

- (HUFirmwareUpdateItemModule)firmwareUpdateModule
{
  return self->_firmwareUpdateModule;
}

- (void)setFirmwareUpdateModule:(id)a3
{
  objc_storeStrong((id *)&self->_firmwareUpdateModule, a3);
}

- (HFItem)betaUpdatesItem
{
  return self->_betaUpdatesItem;
}

- (void)setBetaUpdatesItem:(id)a3
{
  objc_storeStrong((id *)&self->_betaUpdatesItem, a3);
}

- (HFItem)carrySettingsItem
{
  return self->_carrySettingsItem;
}

- (void)setCarrySettingsItem:(id)a3
{
  objc_storeStrong((id *)&self->_carrySettingsItem, a3);
}

- (NAFuture)softwareUpdateFetchFuture
{
  return self->_softwareUpdateFetchFuture;
}

- (void)setSoftwareUpdateFetchFuture:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void)setOverrideHome:(id)a3
{
  objc_storeStrong((id *)&self->_overrideHome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_softwareUpdateFetchFuture, 0);
  objc_storeStrong((id *)&self->_carrySettingsItem, 0);
  objc_storeStrong((id *)&self->_betaUpdatesItem, 0);
  objc_storeStrong((id *)&self->_firmwareUpdateModule, 0);
  objc_storeStrong((id *)&self->_updatedRecentlyItem, 0);
  objc_storeStrong((id *)&self->_updateAllItem, 0);
  objc_storeStrong((id *)&self->_softwareUpdateModule, 0);
  objc_storeStrong((id *)&self->_fetchItem, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_homeUpdateBannerItem, 0);
  objc_storeStrong((id *)&self->_autoUpdateThirdPartyItem, 0);
  objc_storeStrong((id *)&self->_autoUpdateItem, 0);
}

@end
