@implementation HUSafetyAndSecuritySettingsItemModule

- (HUSafetyAndSecuritySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HUSafetyAndSecuritySettingsItemModule *v9;
  HUSafetyAndSecuritySettingsItemModule *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSafetyAndSecuritySettingsItemModule.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

  }
  v18.receiver = self;
  v18.super_class = (Class)HUSafetyAndSecuritySettingsItemModule;
  v9 = -[HFItemModule initWithItemUpdater:](&v18, sel_initWithItemUpdater_, v7);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a4);
    objc_initWeak(&location, v10);
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "homeManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__HUSafetyAndSecuritySettingsItemModule_initWithItemUpdater_home___block_invoke;
    v15[3] = &unk_1E6F54280;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v12, "fetchDevicesWithCompletionHandler:", v15);

    -[HUSafetyAndSecuritySettingsItemModule _buildItemProviders](v10, "_buildItemProviders");
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __66__HUSafetyAndSecuritySettingsItemModule_initWithItemUpdater_home___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (HUSafetyAndSecuritySettingsItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUSafetyAndSecuritySettingsItemModule.m"), 64, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUSafetyAndSecuritySettingsItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

+ (id)_userItemComparator
{
  return &__block_literal_global_300;
}

uint64_t __60__HUSafetyAndSecuritySettingsItemModule__userItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "latestResults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D30ED8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30ED8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "latestResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "type") || !objc_msgSend(v10, "type"))
  {
    if (objc_msgSend(v8, "type") && !objc_msgSend(v10, "type"))
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
      v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v4, v5);

    }
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (void)_buildItemProviders
{
  id v3;
  void *v4;
  HUSoundRecognitionItem *v5;
  void *v6;
  HUSoundRecognitionItem *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  _QWORD v32[3];
  _QWORD v33[4];
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D31840]);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke;
  v31[3] = &unk_1E6F4C518;
  v31[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithResultsBlock:", v31);
  -[HUSafetyAndSecuritySettingsItemModule setHomeUpgradeBannerItem:](self, "setHomeUpgradeBannerItem:", v4);

  v5 = [HUSoundRecognitionItem alloc];
  -[HUSafetyAndSecuritySettingsItemModule home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HUSoundRecognitionItem initWithHome:](v5, "initWithHome:", v6);
  -[HUSafetyAndSecuritySettingsItemModule setListenForSoundsItem:](self, "setListenForSoundsItem:", v7);

  -[HUSafetyAndSecuritySettingsItemModule home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hf_hasAtleastOneSafetyAndSecuritySupportedAccessory") ^ 1;

  v10 = objc_alloc(MEMORY[0x1E0D31840]);
  v33[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecuritySettings_Notifications_Title"), CFSTR("HUSafetyAndSecuritySettings_Notifications_Title"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D30D20];
  v34[0] = v11;
  v34[1] = CFSTR("HUSafetyAndSecuritySettings_Notifications_Title");
  v13 = *MEMORY[0x1E0D30D70];
  v33[1] = v12;
  v33[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = *MEMORY[0x1E0D30CE8];
  v34[2] = v14;
  v34[3] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v10, "initWithResults:", v15);
  -[HUSafetyAndSecuritySettingsItemModule setNotificationsItem:](self, "setNotificationsItem:", v16);

  -[HUSafetyAndSecuritySettingsItemModule listenForSoundsItem](self, "listenForSoundsItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v17;
  -[HUSafetyAndSecuritySettingsItemModule notificationsItem](self, "notificationsItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v18;
  -[HUSafetyAndSecuritySettingsItemModule homeUpgradeBannerItem](self, "homeUpgradeBannerItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x1E0D31848]);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithItems:", v22);
  -[HUSafetyAndSecuritySettingsItemModule setStaticItemProvider:](self, "setStaticItemProvider:", v23);

  v24 = objc_alloc(MEMORY[0x1E0D31990]);
  -[HUSafetyAndSecuritySettingsItemModule home](self, "home");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithHome:", v25);
  -[HUSafetyAndSecuritySettingsItemModule setUserItemProvider:](self, "setUserItemProvider:", v26);

  -[HUSafetyAndSecuritySettingsItemModule userItemProvider](self, "userItemProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setIncludeCurrentUser:", 1);

  -[HUSafetyAndSecuritySettingsItemModule home](self, "home");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hf_currentUserIsAdministrator");
  -[HUSafetyAndSecuritySettingsItemModule userItemProvider](self, "userItemProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setIncludeOtherUsers:", v29);

}

id __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  uint64_t v13;
  id v14;

  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allHomesFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke_2;
  v12 = &unk_1E6F4F3F0;
  v13 = *(_QWORD *)(a1 + 32);
  v14 = v2;
  v5 = v2;
  v6 = (id)objc_msgSend(v4, "addSuccessBlock:", &v9);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5, v9, v10, v11, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke_2(uint64_t a1, void *a2)
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  unint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "na_filter:", &__block_literal_global_24_5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setOwnerHomes:", v3);

  _HULocalizedStringWithDefaultValue(CFSTR("HUSoftwareUpdateHomeKitUpdateAvailable"), CFSTR("HUSoftwareUpdateHomeKitUpdateAvailable"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D18]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecuritySoftwareUpdateImproveReliabilityAndPerformance"), CFSTR("HUSafetyAndSecuritySoftwareUpdateImproveReliabilityAndPerformance"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30BF8]);

  _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecuritySoftwareUpdateContinueButtonTitle"), CFSTR("HUSafetyAndSecuritySoftwareUpdateContinueButtonTitle"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30BC0]);

  v7 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "hf_keyColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithHierarchicalColor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationByApplyingConfiguration:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31880]), "initWithSystemImageName:configuration:", CFSTR("homekit"), v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSymbolIconConfiguration:", v12);
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30C60]);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "homeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "hf_canUpdateToHH2");

  HFLogForCategory();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = 0x1E0CB3000;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = CFSTR("Hiding");
    if (v17)
      v20 = CFSTR("Showing");
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 32), "home", v20);
    v32 = v9;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithBool:", objc_msgSend(v30, "hf_currentUserIsOwner"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v15, "isHH2MigrationAvailable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v13;
    v25 = v12;
    v26 = v11;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v15, "hasOptedToHH2"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v34 = v29;
    v35 = 2112;
    v36 = v22;
    v37 = 2112;
    v38 = v23;
    v39 = 2112;
    v40 = v27;
    _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@ HH2 migration banner. Owner:%@ migrationAvailable:%@ userAlreadyOptedIn:%@", buf, 0x2Au);

    v11 = v26;
    v12 = v25;
    v13 = v24;

    v10 = v31;
    v19 = 0x1E0CB3000uLL;

    v9 = v32;
  }

  objc_msgSend(*(id *)(v19 + 2024), "numberWithInt:", v17 ^ 1u);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D30D70]);

}

uint64_t __60__HUSafetyAndSecuritySettingsItemModule__buildItemProviders__block_invoke_3(uint64_t a1, void *a2)
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

- (id)itemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[HUSafetyAndSecuritySettingsItemModule staticItemProvider](self, "staticItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSafetyAndSecuritySettingsItemModule userItemProvider](self, "userItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[4];
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUSafetyAndSecuritySettingsItemModule homeUpgradeBannerItem](self, "homeUpgradeBannerItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSafetyAndSecurityBannerSectionIdentifier"));
    -[HUSafetyAndSecuritySettingsItemModule homeUpgradeBannerItem](self, "homeUpgradeBannerItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItems:", v10);

    -[HUSafetyAndSecuritySettingsItemModule ownerHomes](self, "ownerHomes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v11, "count") <= 1)
      v12 = CFSTR("HUSafetyAndSecuritySoftwareUpdateFooter");
    else
      v12 = CFSTR("HUSafetyAndSecuritySoftwareUpdateFooterPlural");
    _HULocalizedStringWithDefaultValue(v12, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFooterTitle:", v13);

    objc_msgSend(v5, "addObject:", v8);
  }
  -[HUSafetyAndSecuritySettingsItemModule listenForSoundsItem](self, "listenForSoundsItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "containsObject:", v14);

  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSafetyAndSecuritySettingsListenForSoundsSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecuritySettings_ListenForSoundsSection_Footer"), CFSTR("HUSafetyAndSecuritySettings_ListenForSoundsSection_Footer"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFooterTitle:", v17);

    -[HUSafetyAndSecuritySettingsItemModule listenForSoundsItem](self, "listenForSoundsItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setItems:", v19);

    objc_msgSend(v5, "addObject:", v16);
  }
  -[HUSafetyAndSecuritySettingsItemModule notificationsItem](self, "notificationsItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v4, "containsObject:", v20);

  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSafetyAndSecuritySettingsNotificationsSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecuritySettings_Notifications_Footer"), CFSTR("HUSafetyAndSecuritySettings_Notifications_Footer"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFooterTitle:", v23);

    -[HUSafetyAndSecuritySettingsItemModule notificationsItem](self, "notificationsItem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setItems:", v25);

    objc_msgSend(v5, "addObject:", v22);
  }
  -[HUSafetyAndSecuritySettingsItemModule home](self, "home");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "hf_hasAtleastOneAudioAnalysisSupportedAccessory");

  if (v27)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUSafetyAndSecuritySettingsUserItemSectionIdentifier"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecuritySettingsUserSection_Header"), CFSTR("HUSafetyAndSecuritySettingsUserSection_Header"), 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHeaderTitle:", v29);

    _HULocalizedStringWithDefaultValue(CFSTR("HUSafetyAndSecuritySettingsUserSection_Footer"), CFSTR("HUSafetyAndSecuritySettingsUserSection_Footer"), 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFooterTitle:", v30);

    -[HUSafetyAndSecuritySettingsItemModule userItemProvider](self, "userItemProvider");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "items");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_userItemComparator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "sortedArrayUsingComparator:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __73__HUSafetyAndSecuritySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
    v38[3] = &unk_1E6F4DAD8;
    v39 = v4;
    objc_msgSend(v35, "na_filter:", v38);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setItems:", v36);

    objc_msgSend(v5, "addObject:", v28);
  }

  return v5;
}

uint64_t __73__HUSafetyAndSecuritySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (id)enableUserPermissionSetting:(BOOL)a3 forItem:(id)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  id v20;
  SEL v21;
  BOOL v22;
  uint8_t buf[4];
  HUSafetyAndSecuritySettingsItemModule *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = self;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Attempting to update DropIn permission setting for item %@", buf, 0x20u);

  }
  objc_opt_class();
  v10 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  if (v12
    && (-[HUSafetyAndSecuritySettingsItemModule userItemProvider](self, "userItemProvider"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "items"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "containsObject:", v10),
        v14,
        v13,
        v15))
  {
    v16 = (void *)MEMORY[0x1E0D519C0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke;
    v19[3] = &unk_1E6F562E8;
    v22 = a3;
    v19[4] = self;
    v20 = v12;
    v21 = a2;
    objc_msgSend(v16, "futureWithBlock:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeAccessControlForUser:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56))
      v11 = CFSTR("enable");
    else
      v11 = CFSTR("disable");
    objc_msgSend(*(id *)(a1 + 40), "user");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v19 = v9;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_impl(&dword_1B8E1E000, v8, OS_LOG_TYPE_DEFAULT, "%@: %@ Will %@ DropIn permission setting for %@", buf, 0x2Au);

  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke_73;
  v14[3] = &unk_1E6F54258;
  objc_copyWeak(&v17, (id *)buf);
  v13 = v3;
  v15 = v13;
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v7, "updateAudioAnalysisUserDropinAccessLevel:completionHandler:", v4, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);

}

void __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke_73(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_ERROR, "Error setting dropin access level setting: %@", buf, 0xCu);
    }

    objc_msgSend(a1[4], "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Success in setting dropin access level setting", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke_74;
    v11 = &unk_1E6F4F418;
    v12 = WeakRetained;
    v13 = a1[5];
    objc_msgSend(v7, "dispatchHomeObserverMessage:sender:", &v8, 0);

    objc_msgSend(a1[4], "finishWithNoResult", v8, v9, v10, v11, v12);
  }

}

void __77__HUSafetyAndSecuritySettingsItemModule_enableUserPermissionSetting_forItem___block_invoke_74(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "user");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didUpdateAccessControlForUser:", v3, v4);

  }
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (HFItem)listenForSoundsItem
{
  return self->_listenForSoundsItem;
}

- (void)setListenForSoundsItem:(id)a3
{
  objc_storeStrong((id *)&self->_listenForSoundsItem, a3);
}

- (HFItem)notificationsItem
{
  return self->_notificationsItem;
}

- (void)setNotificationsItem:(id)a3
{
  objc_storeStrong((id *)&self->_notificationsItem, a3);
}

- (HFItem)homeUpgradeBannerItem
{
  return self->_homeUpgradeBannerItem;
}

- (void)setHomeUpgradeBannerItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeUpgradeBannerItem, a3);
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (HFItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userItemProvider, a3);
}

- (NSArray)ownerHomes
{
  return self->_ownerHomes;
}

- (void)setOwnerHomes:(id)a3
{
  objc_storeStrong((id *)&self->_ownerHomes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerHomes, 0);
  objc_storeStrong((id *)&self->_userItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_homeUpgradeBannerItem, 0);
  objc_storeStrong((id *)&self->_notificationsItem, 0);
  objc_storeStrong((id *)&self->_listenForSoundsItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
