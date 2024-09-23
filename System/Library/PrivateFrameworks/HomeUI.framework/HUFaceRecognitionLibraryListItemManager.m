@implementation HUFaceRecognitionLibraryListItemManager

- (HUFaceRecognitionLibraryListItemManager)initWithHome:(id)a3 delegate:(id)a4
{
  id v8;
  id v9;
  HUFaceRecognitionLibraryListItemManager *v10;
  HUFaceRecognitionLibraryListItemManager *v11;
  HFDemoModeFaceRecognitionDataSource *v12;
  HFDemoModeFaceRecognitionDataSource *demoDataSource;
  id v14;
  uint64_t v15;
  HFStaticItem *knownToHomeItem;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionLibraryListItemManager.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v23.receiver = self;
  v23.super_class = (Class)HUFaceRecognitionLibraryListItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v23, sel_initWithDelegate_sourceItem_, v9, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_overrideHome, a3);
    if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0
      || objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode"))
    {
      v12 = (HFDemoModeFaceRecognitionDataSource *)objc_alloc_init(MEMORY[0x1E0D31370]);
      demoDataSource = v11->_demoDataSource;
      v11->_demoDataSource = v12;

    }
    v11->_didSendAnalyticsEvent = 0;
    v11->_recentsLimit = 50;
    objc_initWeak(&location, v11);
    v14 = objc_alloc(MEMORY[0x1E0D31840]);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke;
    v19[3] = &unk_1E6F518D0;
    objc_copyWeak(&v21, &location);
    v20 = v8;
    v15 = objc_msgSend(v14, "initWithResultsBlock:", v19);
    knownToHomeItem = v11->_knownToHomeItem;
    v11->_knownToHomeItem = (HFStaticItem *)v15;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v11;
}

id __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode");
  objc_msgSend(*(id *)(a1 + 32), "personManagerSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFaceClassificationEnabled");

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionKnownToHouseCellTitle"), CFSTR("HUFaceRecognitionKnownToHouseCellTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0D30D18]);

  HFLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D30BF8]);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D30B78]);

  if (v3)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(WeakRetained, "demoDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "knownToHouseholdEntries");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D30C08]);

LABEL_9:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    goto LABEL_9;
  }
  v14 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(WeakRetained, "overrideHome");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "personManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "completionHandlerAdapter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchAllPersonsWithCompletion:", v17);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke_2;
  v21[3] = &unk_1E6F4F9C8;
  v22 = v6;
  objc_msgSend(v14, "flatMap:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recover:", &__block_literal_global_29_0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v19;
}

id __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "na_filter:", &__block_literal_global_92);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30C08]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "count") == 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D30C98]);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

id __65__HUFaceRecognitionLibraryListItemManager_initWithHome_delegate___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v2;
    _os_log_error_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_ERROR, "Error fetching persons: %@", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x1E0D519C0];
  v8 = *MEMORY[0x1E0D30D70];
  v9 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HUFaceRecognitionLibraryListItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_delegate_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionLibraryListItemManager.m"), 102, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionLibraryListItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUFaceRecognitionLibraryListItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_delegate_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUFaceRecognitionLibraryListItemManager.m"), 107, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUFaceRecognitionLibraryListItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  HUFaceRecognitionRecentEventsItemProvider *v22;
  void *v23;
  void *v24;
  int v25;
  HUFaceRecognitionRecentEventsItemProvider *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  id (*v32)(uint64_t);
  void *v33;
  id v34;
  char v35;
  uint8_t buf[4];
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode");
  v7 = objc_alloc(MEMORY[0x1E0D31840]);
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __70__HUFaceRecognitionLibraryListItemManager__buildItemProvidersForHome___block_invoke;
  v33 = &unk_1E6F4DF80;
  v8 = v4;
  v34 = v8;
  v35 = v6;
  v9 = (void *)objc_msgSend(v7, "initWithResultsBlock:", &v30);
  -[HUFaceRecognitionLibraryListItemManager setAllowFacialRecognitionItem:](self, "setAllowFacialRecognitionItem:", v9);

  v10 = objc_alloc(MEMORY[0x1E0D31848]);
  v11 = (void *)MEMORY[0x1E0C99E60];
  -[HUFaceRecognitionLibraryListItemManager allowFacialRecognitionItem](self, "allowFacialRecognitionItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUFaceRecognitionLibraryListItemManager knownToHomeItem](self, "knownToHomeItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithObjects:", v12, v13, 0, v30, v31, v32, v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v10, "initWithItems:", v14);
  -[HUFaceRecognitionLibraryListItemManager setStaticItemProvider:](self, "setStaticItemProvider:", v15);

  -[HUFaceRecognitionLibraryListItemManager staticItemProvider](self, "staticItemProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v16);

  if ((v6 & 1) == 0)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D319C8]), "initWithHome:", v8);
    -[HUFaceRecognitionLibraryListItemManager setUserPhotosLibraryItemProvider:](self, "setUserPhotosLibraryItemProvider:", v17);

    -[HUFaceRecognitionLibraryListItemManager userPhotosLibraryItemProvider](self, "userPhotosLibraryItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v18);

  }
  -[HUFaceRecognitionLibraryListItemManager recentEventsItemProvider](self, "recentEventsItemProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    if (v6)
    {
      HFLogForCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v37 = 1;
        _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "isDemoMode %{BOOL}d", buf, 8u);
      }

      v21 = objc_alloc(MEMORY[0x1E0D31378]);
      -[HFItemManager home](self, "home");
      v22 = (HUFaceRecognitionRecentEventsItemProvider *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initForMode:home:", 0, v22);
      -[HUFaceRecognitionLibraryListItemManager setRecentEventsItemProvider:](self, "setRecentEventsItemProvider:", v23);

    }
    else
    {
      -[HFItemManager home](self, "home");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "hf_currentUserIsAdministrator");

      if (!v25)
      {
LABEL_14:
        -[HUFaceRecognitionLibraryListItemManager recentEventsItemProvider](self, "recentEventsItemProvider");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "na_safeAddObject:", v28);

        goto LABEL_15;
      }
      v26 = [HUFaceRecognitionRecentEventsItemProvider alloc];
      -[HFItemManager home](self, "home");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[HUFaceRecognitionRecentEventsItemProvider initWithHome:](v26, "initWithHome:", v27);

      -[HUFaceRecognitionLibraryListItemManager setRecentEventsItemProvider:](self, "setRecentEventsItemProvider:", v22);
      -[HUFaceRecognitionRecentEventsItemProvider setFetchLimit:](v22, "setFetchLimit:", -[HUFaceRecognitionLibraryListItemManager recentsLimit](self, "recentsLimit"));
    }

    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

id __70__HUFaceRecognitionLibraryListItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[7];

  v21[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "personManagerSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isFaceClassificationEnabled");

  v3 = (void *)MEMORY[0x1E0D519C0];
  v15 = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionSettingSwitchTitle"), CFSTR("HUFaceRecognitionSettingSwitchTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D30D20];
  v21[0] = v4;
  v21[1] = CFSTR("HUFaceRecognitionSettingSwitchTitle");
  v6 = *MEMORY[0x1E0D30E20];
  v16 = v5;
  v17 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D30CE8];
  v21[2] = v7;
  v21[3] = MEMORY[0x1E0C9AAB0];
  v9 = *MEMORY[0x1E0D30C80];
  v18 = v8;
  v19 = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v10;
  v20 = *MEMORY[0x1E0D30B78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v15, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v41 = a3;
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUFaceRecognitionSettingSwitchSection"));
  -[HUFaceRecognitionLibraryListItemManager allowFacialRecognitionItem](self, "allowFacialRecognitionItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v8);

  v9 = (void *)MEMORY[0x1E0CB3498];
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionSettingSwitchFooter"), CFSTR("HUFaceRecognitionSettingSwitchFooter"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionSettingFooterLearnMoreSubstring"), CFSTR("HUFaceRecognitionSettingFooterLearnMoreSubstring"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "hf_faceRecognitionPrivacyURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_attributedLinkStringForString:linkString:linkURL:", v10, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();

  v40 = (void *)v13;
  objc_msgSend(v6, "setAttributedFooterTitle:", v13);
  objc_msgSend(v5, "addObject:", v6);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUFaceRecognitionLibrariesSection"));
  -[HUFaceRecognitionLibraryListItemManager userPhotosLibraryItemProvider](self, "userPhotosLibraryItemProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "items");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v17;
  objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_52);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_safeAddObjectsFromArray:", v19);

  -[HUFaceRecognitionLibraryListItemManager knownToHomeItem](self, "knownToHomeItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "na_safeAddObject:", v20);

  objc_msgSend(v14, "setItems:", v18);
  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionLibrariesSectionTitle"), CFSTR("HUFaceRecognitionLibrariesSectionTitle"), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHeaderTitle:", v21);

  objc_msgSend(v5, "addObject:", v14);
  -[HUFaceRecognitionLibraryListItemManager recentEventsItemProvider](self, "recentEventsItemProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "items");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[HUFaceRecognitionRecentEventsItemProvider cameraSignificantEventDateComparator](HUFaceRecognitionRecentEventsItemProvider, "cameraSignificantEventDateComparator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sortedArrayUsingComparator:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 1;
  if ((objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) == 0)
    v27 = objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode");
  -[HFItemManager home](self, "home");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "personManagerSettings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "isFaceClassificationEnabled");
  if (v26)
    v31 = v27;
  else
    v31 = 0;
  if (v30 | v31)
    v32 = v26;
  else
    v32 = (void *)MEMORY[0x1E0C9AA60];

  v33 = v32;
  -[HUFaceRecognitionLibraryListItemManager setCoalescedPersonEvents:](self, "setCoalescedPersonEvents:", v33);
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUFaceRecognitionRecentVisitorsSectionIdentifier"));
  objc_msgSend(v34, "setItems:", v33);

  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionRecentVisitorsSectionTitle"), CFSTR("HUFaceRecognitionRecentVisitorsSectionTitle"), 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setHeaderTitle:", v35);

  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionRecentVisitorsSectionFooter"), CFSTR("HUFaceRecognitionRecentVisitorsSectionFooter"), 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFooterTitle:", v36);

  objc_msgSend(v5, "addObject:", v34);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v41);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  return v37;
}

uint64_t __76__HUFaceRecognitionLibraryListItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "user");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUFaceRecognitionLibraryListItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setRecentsLimit:(unint64_t)a3
{
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HUFaceRecognitionLibraryListItemManager recentEventsItemProvider](self, "recentEventsItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8 && self->_recentsLimit != a3)
  {
    self->_recentsLimit = a3;
    objc_msgSend(v8, "setFetchLimit:", a3);
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = a3;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Setting limit %lu on recents", buf, 0xCu);
    }

    v12 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v10, a2);

  }
}

- (void)sendAnalyticsEvent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!-[HUFaceRecognitionLibraryListItemManager didSendAnalyticsEvent](self, "didSendAnalyticsEvent"))
  {
    -[HUFaceRecognitionLibraryListItemManager setDidSendAnalyticsEvent:](self, "setDidSendAnalyticsEvent:", 1);
    v3 = (void *)objc_opt_new();
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[HUFaceRecognitionLibraryListItemManager coalescedPersonEvents](self, "coalescedPersonEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v3;
    objc_msgSend(v3, "na_safeSetObject:forKey:", v6, *MEMORY[0x1E0D30410]);

    v25 = (void *)objc_opt_new();
    v26 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[HUFaceRecognitionLibraryListItemManager coalescedPersonEvents](self, "coalescedPersonEvents");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (!v7)
      goto LABEL_17;
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v10 = *MEMORY[0x1E0D30B40];
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v11);
        objc_opt_class();
        objc_msgSend(v12, "latestResults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v15 = v14;
        else
          v15 = 0;
        v16 = v15;

        objc_msgSend(v16, "person");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "length");

          if (v19)
            goto LABEL_15;
          v20 = v25;
          v21 = v17;
        }
        else
        {
          v20 = v26;
          v21 = v12;
        }
        objc_msgSend(v20, "addObject:", v21);
LABEL_15:

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (!v8)
      {
LABEL_17:

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "na_safeSetObject:forKey:", v22, *MEMORY[0x1E0D30408]);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "na_safeSetObject:forKey:", v23, *MEMORY[0x1E0D30418]);

        objc_msgSend(MEMORY[0x1E0D31170], "sendEvent:withData:", 7, v24);
        return;
      }
    }
  }
}

- (HFItem)allowFacialRecognitionItem
{
  return self->_allowFacialRecognitionItem;
}

- (void)setAllowFacialRecognitionItem:(id)a3
{
  objc_storeStrong((id *)&self->_allowFacialRecognitionItem, a3);
}

- (HFStaticItem)knownToHomeItem
{
  return self->_knownToHomeItem;
}

- (void)setKnownToHomeItem:(id)a3
{
  objc_storeStrong((id *)&self->_knownToHomeItem, a3);
}

- (unint64_t)recentsLimit
{
  return self->_recentsLimit;
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (HFUserPhotosLibraryItemProvider)userPhotosLibraryItemProvider
{
  return self->_userPhotosLibraryItemProvider;
}

- (void)setUserPhotosLibraryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userPhotosLibraryItemProvider, a3);
}

- (HFItemProvider)recentEventsItemProvider
{
  return self->_recentEventsItemProvider;
}

- (void)setRecentEventsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_recentEventsItemProvider, a3);
}

- (HFDemoModeFaceRecognitionDataSource)demoDataSource
{
  return self->_demoDataSource;
}

- (void)setDemoDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_demoDataSource, a3);
}

- (NSArray)coalescedPersonEvents
{
  return self->_coalescedPersonEvents;
}

- (void)setCoalescedPersonEvents:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedPersonEvents, a3);
}

- (BOOL)didSendAnalyticsEvent
{
  return self->_didSendAnalyticsEvent;
}

- (void)setDidSendAnalyticsEvent:(BOOL)a3
{
  self->_didSendAnalyticsEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedPersonEvents, 0);
  objc_storeStrong((id *)&self->_demoDataSource, 0);
  objc_storeStrong((id *)&self->_recentEventsItemProvider, 0);
  objc_storeStrong((id *)&self->_userPhotosLibraryItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_knownToHomeItem, 0);
  objc_storeStrong((id *)&self->_allowFacialRecognitionItem, 0);
}

@end
