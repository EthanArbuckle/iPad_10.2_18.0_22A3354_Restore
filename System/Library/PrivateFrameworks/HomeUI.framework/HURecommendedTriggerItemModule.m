@implementation HURecommendedTriggerItemModule

- (HURecommendedTriggerItemModule)initWithItemUpdater:(id)a3 home:(id)a4
{
  id v7;
  HURecommendedTriggerItemModule *v8;
  HURecommendedTriggerItemModule *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HURecommendedTriggerItemModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v11, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v9->_maximumNumberOfShownRecommendations = 3;
    v9->_hideSectionHeaderTitle = 0;
    v9->_engineOptions = 2;
  }

  return v9;
}

- (HURecommendedTriggerItemModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_home_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HURecommendedTriggerItemModule.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HURecommendedTriggerItemModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (void)setConfigureBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id configureBlock;
  id aBlock;

  aBlock = a3;
  -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setConfigureBlock:", aBlock);

  }
  v6 = _Block_copy(aBlock);
  configureBlock = self->_configureBlock;
  self->_configureBlock = v6;

}

- (void)setEngineOptions:(unint64_t)a3
{
  void *v4;
  unint64_t engineOptions;
  id v6;

  self->_engineOptions = -[HURecommendedTriggerItemModule _effectiveRecommendationEngineOptionsWithOptions:](self, "_effectiveRecommendationEngineOptionsWithOptions:", a3);
  -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    engineOptions = self->_engineOptions;
    -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEngineOptions:", engineOptions);

  }
}

- (id)buildItemProviders
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;

  v3 = objc_alloc(MEMORY[0x1E0D33540]);
  -[HURecommendedTriggerItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHome:andServiceLikeItems:", v4, 0);
  -[HURecommendedTriggerItemModule setRecommendationItemProvider:](self, "setRecommendationItemProvider:", v5);

  v6 = -[HURecommendedTriggerItemModule engineOptions](self, "engineOptions");
  -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEngineOptions:", v6);

  objc_initWeak(&location, self);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __52__HURecommendedTriggerItemModule_buildItemProviders__block_invoke;
  v22 = &unk_1E6F515D0;
  objc_copyWeak(&v23, &location);
  -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFilter:", &v19);

  -[HURecommendedTriggerItemModule configureBlock](self, "configureBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HURecommendedTriggerItemModule configureBlock](self, "configureBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setConfigureBlock:", v10);

  }
  v12 = objc_alloc(MEMORY[0x1E0D31848]);
  -[HURecommendedTriggerItemModule _buildStaticItems](self, "_buildStaticItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithItems:", v13);

  v15 = (void *)MEMORY[0x1E0C99E60];
  -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObjects:", v16, v14, 0, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v17;
}

uint64_t __52__HURecommendedTriggerItemModule_buildItemProviders__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  int v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  int v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_msgSend((id)objc_opt_class(), "shouldShowRecommendation:", v3);
  objc_msgSend(WeakRetained, "filter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(WeakRetained, "filter");
    v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v8 = ((uint64_t (**)(_QWORD, id))v7)[2](v7, v3);

  }
  else
  {
    v8 = 1;
  }

  if ((v5 & v8 & 1) == 0)
  {
    HFLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109634;
      v11[1] = v5;
      v12 = 1024;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Hiding recommendation, passesBasicFilter: %{BOOL}d passesClientFilter: %{BOOL}d recommendation: %@", (uint8_t *)v11, 0x18u);
    }

  }
  return v5 & v8;
}

- (id)_buildStaticItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[HURecommendedTriggerItemModule moreButtonItem](self, "moreButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D31840]);
    v12 = *MEMORY[0x1E0D30D18];
    _HULocalizedStringWithDefaultValue(CFSTR("HURecommendedAutomationsShowMoreButtonTitle"), CFSTR("HURecommendedAutomationsShowMoreButtonTitle"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithResults:", v6);
    -[HURecommendedTriggerItemModule setMoreButtonItem:](self, "setMoreButtonItem:", v7);

  }
  v8 = (void *)MEMORY[0x1E0C99E60];
  -[HURecommendedTriggerItemModule moreButtonItem](self, "moreButtonItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  objc_class *v4;
  id v5;
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
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HURecommendedTriggerItemModuleSection"));
  if (!-[HURecommendedTriggerItemModule hideSectionHeaderTitle](self, "hideSectionHeaderTitle"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HURecommendedAutomationsSectionTitle"), CFSTR("HURecommendedAutomationsSectionTitle"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHeaderTitle:", v7);

  }
  -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "rankComparator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v12);

  objc_msgSend(v6, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecommendedTriggerItemModule moreButtonItem](self, "moreButtonItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v15);

  v16 = (void *)MEMORY[0x1E0D314B0];
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "filterSections:toDisplayedItems:", v17, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_setByIntersectingWithSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (-[HURecommendedTriggerItemModule maximumNumberOfShownRecommendations](self, "maximumNumberOfShownRecommendations") == 0x7FFFFFFFFFFFFFFFLL|| v9 <= -[HURecommendedTriggerItemModule maximumNumberOfShownRecommendations](self, "maximumNumberOfShownRecommendations"))
  {
    -[HURecommendedTriggerItemModule moreButtonItem](self, "moreButtonItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);
  }
  else
  {
    v10 = -[HURecommendedTriggerItemModule maximumNumberOfShownRecommendations](self, "maximumNumberOfShownRecommendations");
    -[HURecommendedTriggerItemModule recommendationItemProvider](self, "recommendationItemProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "rankComparator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sortedArrayUsingComparator:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    while (v10 < objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectAtIndex:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v16);

      ++v10;
    }
  }

  return v5;
}

- (unint64_t)_effectiveRecommendationEngineOptionsWithOptions:(unint64_t)a3
{
  return a3 & 0xFFFFFFFFFFFFFFFCLL | 2;
}

+ (BOOL)shouldShowRecommendation:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  char v29;
  void *v30;
  char v31;
  BOOL v32;
  char v34;

  v3 = a3;
  objc_msgSend(v3, "hu_triggerBuilderIfAny");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiresFMFDeviceToRun");

  objc_msgSend(v3, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "homeAccessControlForUser:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "presenceComputationStatus");

  objc_msgSend(v3, "hu_triggerBuilderIfAny");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v12 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_opt_class();
  objc_msgSend(v14, "locationInterface");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "locationEventBuilder");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  if (v18)
  {
    objc_msgSend(v18, "region");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19 != 0;

  }
  else
  {
    v20 = 1;
  }
  objc_msgSend(v3, "hu_asTriggerRecommendation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "triggerBuilders");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "na_any:", &__block_literal_global_110);

  if (objc_msgSend(MEMORY[0x1E0D319D0], "supportsBeingCurrentLocationDevice"))
  {
    objc_msgSend(MEMORY[0x1E0D314E0], "sharedDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "authorizationStatus");

    v34 = HFLocationServicesAvailableForAuthorizationStatus();
    v25 = (void *)MEMORY[0x1E0CBA780];
    objc_msgSend(v3, "home");
    LOBYTE(v24) = v23;
    v26 = v14;
    v27 = v20;
    v28 = v10;
    v29 = v5;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v25) = objc_msgSend(v25, "hf_presenceDisableReasonsForHome:", v30);

    v5 = v29;
    v10 = v28;
    v20 = v27;
    v14 = v26;
    v23 = (char)v24;
    v31 = v34;
    if ((v25 & 2) != 0)
      v31 = 0;
  }
  else
  {
    v31 = 1;
  }
  v32 = ((v10 != 3) | ~v5) & (v31 | ~v23) & v20;

  return v32;
}

uint64_t __59__HURecommendedTriggerItemModule_shouldShowRecommendation___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "eventBuilders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "na_any:", &__block_literal_global_25);

  return v7;
}

uint64_t __59__HURecommendedTriggerItemModule_shouldShowRecommendation___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF347FD0);
}

+ (id)rankComparator
{
  if (_MergedGlobals_4_1 != -1)
    dispatch_once(&_MergedGlobals_4_1, &__block_literal_global_76_0);
  return (id)qword_1EF226A48;
}

void __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1EF226A48;
  qword_1EF226A48 = (uint64_t)&__block_literal_global_78_0;

}

uint64_t __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t (**v15)(_QWORD, _QWORD, _QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  objc_opt_class();
  v9 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_4;
  v20 = &unk_1E6F543A8;
  v12 = v8;
  v21 = v12;
  v13 = v11;
  v22 = v13;
  if (!v13 || (v14 = __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_4((uint64_t)&v17)) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator", v17, v18, v19, v20, v21, v22);
    v15 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v14 = ((uint64_t (**)(_QWORD, id, id))v15)[2](v15, v6, v9);

  }
  return v14;
}

uint64_t __48__HURecommendedTriggerItemModule_rankComparator__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "recommendation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "recommendation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "sortingPriority");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "sortingPriority");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8;
}

- (HMHome)home
{
  return self->_home;
}

- (HFStaticItem)moreButtonItem
{
  return self->_moreButtonItem;
}

- (void)setMoreButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_moreButtonItem, a3);
}

- (int64_t)maximumNumberOfShownRecommendations
{
  return self->_maximumNumberOfShownRecommendations;
}

- (void)setMaximumNumberOfShownRecommendations:(int64_t)a3
{
  self->_maximumNumberOfShownRecommendations = a3;
}

- (BOOL)hideSectionHeaderTitle
{
  return self->_hideSectionHeaderTitle;
}

- (void)setHideSectionHeaderTitle:(BOOL)a3
{
  self->_hideSectionHeaderTitle = a3;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)configureBlock
{
  return self->_configureBlock;
}

- (unint64_t)engineOptions
{
  return self->_engineOptions;
}

- (HRERecommendationItemProvider)recommendationItemProvider
{
  return self->_recommendationItemProvider;
}

- (void)setRecommendationItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_recommendationItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendationItemProvider, 0);
  objc_storeStrong(&self->_configureBlock, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_moreButtonItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
