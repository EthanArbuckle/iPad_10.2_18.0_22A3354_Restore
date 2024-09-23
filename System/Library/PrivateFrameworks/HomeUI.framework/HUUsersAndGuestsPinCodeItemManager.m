@implementation HUUsersAndGuestsPinCodeItemManager

- (HUUsersAndGuestsPinCodeItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPinCodeManager_delegate_home_forAccessory_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUsersAndGuestsPinCodeItemManager.m"), 36, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUUsersAndGuestsPinCodeItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (HUUsersAndGuestsPinCodeItemManager)initWithDelegate:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithPinCodeManager_delegate_home_forAccessory_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUsersAndGuestsPinCodeItemManager.m"), 41, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUUsersAndGuestsPinCodeItemManager initWithDelegate:]",
    v6);

  return 0;
}

- (HUUsersAndGuestsPinCodeItemManager)initWithPinCodeManager:(id)a3 delegate:(id)a4 home:(id)a5 forAccessory:(id)a6
{
  id v12;
  id v13;
  id v14;
  HUUsersAndGuestsPinCodeItemManager *v15;
  HUUsersAndGuestsPinCodeItemManager *v16;
  NAFuture *v17;
  NAFuture *restoreFuture;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  HUUsersAndGuestsPinCodeItemManager *v25;
  SEL v26;
  objc_super v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HUUsersAndGuestsPinCodeItemManager;
  v15 = -[HFItemManager initWithDelegate:sourceItem:](&v27, sel_initWithDelegate_sourceItem_, a4, 0);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_pinCodeManager, a3);
    objc_storeStrong((id *)&v16->_overrideHome, a5);
    objc_storeStrong((id *)&v16->_accessory, a6);
    v17 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    restoreFuture = v16->_restoreFuture;
    v16->_restoreFuture = v17;

  }
  if (v14)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __88__HUUsersAndGuestsPinCodeItemManager_initWithPinCodeManager_delegate_home_forAccessory___block_invoke;
    v22[3] = &unk_1E6F5F2F0;
    v23 = v14;
    v24 = v13;
    v25 = v16;
    v26 = a2;
    objc_msgSend(v24, "fetchMissingWalletKeysForAccessory:completion:", v23, v22);

    v19 = v23;
  }
  else
  {
    -[HUUsersAndGuestsPinCodeItemManager restoreFuture](v16, "restoreFuture");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finishWithResult:", v20);

  }
  return v16;
}

void __88__HUUsersAndGuestsPinCodeItemManager_initWithPinCodeManager_delegate_home_forAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "hf_minimumDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 136315906;
    v15 = "-[HUUsersAndGuestsPinCodeItemManager initWithPinCodeManager:delegate:home:forAccessory:]_block_invoke";
    v16 = 2112;
    v17 = v3;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Completed fetching the missing wallet keys %@ for %@ in %@", (uint8_t *)&v14, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 48), "restoreFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishWithResult:", v3);

  objc_msgSend(*(id *)(a1 + 48), "restoreHomeKeyAccessItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(void **)(a1 + 48);
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "restoreHomeKeyAccessItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithObject:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v9, "updateResultsForItems:senderSelector:", v12, *(_QWORD *)(a1 + 56));

  }
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  _QWORD v32[2];
  _QWORD v33[3];
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31990]), "initWithHome:", v4);
  -[HUUsersAndGuestsPinCodeItemManager setUserItemProvider:](self, "setUserItemProvider:", v5);

  -[HUUsersAndGuestsPinCodeItemManager userItemProvider](self, "userItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIncludeCurrentUser:", 1);

  -[HUUsersAndGuestsPinCodeItemManager userItemProvider](self, "userItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIncludeOtherUsers:", 1);

  objc_initWeak(&location, self);
  v8 = _os_feature_enabled_impl();
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31990]), "initWithHome:", v4);
    objc_msgSend(v10, "setIncludeCurrentUser:", 0);
    objc_msgSend(v10, "setIncludeOtherUsers:", 1);
    objc_msgSend(v10, "setIncludeGuestUsers:", 1);
    v29[0] = v9;
    v29[1] = 3221225472;
    v29[2] = __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke;
    v29[3] = &unk_1E6F4DD60;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v10, "setFilter:", v29);
    v11 = objc_alloc(MEMORY[0x1E0D31928]);
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_2;
    v27[3] = &unk_1E6F53850;
    objc_copyWeak(&v28, &location);
    v12 = (void *)objc_msgSend(v11, "initWithSourceProvider:transformationBlock:", v10, v27);
    -[HUUsersAndGuestsPinCodeItemManager setTransformedGuestUserItemProvider:](self, "setTransformedGuestUserItemProvider:", v12);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);

  }
  v13 = objc_alloc(MEMORY[0x1E0D31840]);
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_4;
  v25[3] = &unk_1E6F4C4E8;
  objc_copyWeak(&v26, &location);
  v14 = (void *)objc_msgSend(v13, "initWithResultsBlock:", v25);
  -[HUUsersAndGuestsPinCodeItemManager setRestoreHomeKeyAccessItem:](self, "setRestoreHomeKeyAccessItem:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D31848]);
  v16 = (void *)MEMORY[0x1E0C99E60];
  -[HUUsersAndGuestsPinCodeItemManager restoreHomeKeyAccessItem](self, "restoreHomeKeyAccessItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "initWithItems:", v19);

  if (_os_feature_enabled_impl())
  {
    v33[0] = v20;
    -[HUUsersAndGuestsPinCodeItemManager userItemProvider](self, "userItemProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v21;
    -[HUUsersAndGuestsPinCodeItemManager transformedGuestUserItemProvider](self, "transformedGuestUserItemProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32[0] = v20;
    -[HUUsersAndGuestsPinCodeItemManager userItemProvider](self, "userItemProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v23;
}

uint64_t __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(WeakRetained, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hf_userIsRestrictedGuest:", v7);

  return v9;
}

id __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = objc_alloc(MEMORY[0x1E0D31920]);
  v7 = (void *)objc_msgSend(v3, "copy");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_3;
  v11[3] = &unk_1E6F50430;
  objc_copyWeak(&v13, v4);
  v8 = v3;
  v12 = v8;
  v9 = (void *)objc_msgSend(v6, "initWithSourceItem:transformationBlock:", v7, v11);

  objc_destroyWeak(&v13);
  return v9;
}

id __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_opt_class();
  v7 = *(id *)(a1 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(WeakRetained, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "user");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "homeAccessControlForUser:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "restrictedGuestAccessSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessAllowedToAccessories");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "na_safeContainsObject:", v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D30E20]);

  return v6;
}

id __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "restoreFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFinished");

  if (v3)
  {
    objc_msgSend(WeakRetained, "restoreFuture");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flatMap:", &__block_literal_global_277);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeRestoreHomeKeyAccessButton"), CFSTR("HUPinCodeRestoreHomeKeyAccessButton"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D18]);

    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "-[HUUsersAndGuestsPinCodeItemManager _buildItemProvidersForHome:]_block_invoke";
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%s) restoreHomeKeyAccessItem is hidden because restoreFuture is NOT finished", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v5;

  return v8;
}

id __65__HUUsersAndGuestsPinCodeItemManager__buildItemProvidersForHome___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _HULocalizedStringWithDefaultValue(CFSTR("HUPinCodeRestoreHomeKeyAccessButton"), CFSTR("HUPinCodeRestoreHomeKeyAccessButton"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D30D18]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  v5 = objc_msgSend(v2, "hmf_isEmpty");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D30D70]);

  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[HUUsersAndGuestsPinCodeItemManager _buildItemProvidersForHome:]_block_invoke_5";
    v12 = 1024;
    v13 = v5;
    v14 = 2112;
    v15 = v2;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "(%s) For restoreHomeKeyAccessItem, hidden = %{BOOL}d | missingWalletKeys = %@ | getMissingWalletKeyFuture.isFinished = YES", (uint8_t *)&v10, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v38;
  id v39;
  uint8_t buf[8];
  _QWORD v41[4];
  id v42;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HFItemManager itemModules](self, "itemModules");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __71__HUUsersAndGuestsPinCodeItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v41[3] = &unk_1E6F5F338;
  v7 = v4;
  v42 = v7;
  objc_msgSend(v6, "na_flatMap:", v41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v8);

  if (_os_feature_enabled_impl())
  {
    v39 = v7;
    objc_msgSend(v5, "na_firstObjectPassingTest:", &__block_literal_global_30_7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v38 = v5;
      HFLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Found pin code list section", buf, 2u);
      }

      v11 = (void *)objc_msgSend(v9, "mutableCopy");
      v12 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v9, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrayWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUUsersAndGuestsPinCodeItemManager transformedGuestUserItemProvider](self, "transformedGuestUserItemProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sortedArrayUsingComparator:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0CB36B8];
      -[HUUsersAndGuestsPinCodeItemManager transformedGuestUserItemProvider](self, "transformedGuestUserItemProvider");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "items");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "allObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "indexSetWithIndexesInRange:", 0, objc_msgSend(v23, "count"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "insertObjects:atIndexes:", v19, v24);

      objc_msgSend(v11, "setItems:", v14);
      v5 = v38;
      objc_msgSend(v38, "removeObject:", v9);
      objc_msgSend(v38, "addObject:", v11);

    }
    v7 = v39;
  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("PinCodes-users"));
  -[HUUsersAndGuestsPinCodeItemManager userItemProvider](self, "userItemProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "items");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v28 = v5;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sortedArrayUsingComparator:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");

  -[HUUsersAndGuestsPinCodeItemManager restoreHomeKeyAccessItem](self, "restoreHomeKeyAccessItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v33);

  objc_msgSend(v25, "setItems:", v32);
  HFLocalizedString();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHeaderTitle:", v34);

  HFLocalizedString();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFooterTitle:", v35);

  objc_msgSend(v28, "insertObject:atIndex:", v25, 0);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v28, v7);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

uint64_t __71__HUUsersAndGuestsPinCodeItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "buildSectionsWithDisplayedItems:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__HUUsersAndGuestsPinCodeItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("PinCodes-guests"));

  return v3;
}

- (id)_buildItemModulesForHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D31640]);
  -[HUUsersAndGuestsPinCodeItemManager pinCodeManager](self, "pinCodeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUsersAndGuestsPinCodeItemManager accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithItemUpdater:pinCodeManager:listType:home:forAccessory:", self, v7, 3, v4, v8);

  objc_msgSend(v5, "addObject:", v9);
  if (objc_msgSend(v4, "hasOnboardedForAccessCode"))
  {
    objc_msgSend(v4, "hf_accessoriesSupportingAccessCodes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0D31640]);
      -[HUUsersAndGuestsPinCodeItemManager pinCodeManager](self, "pinCodeManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUUsersAndGuestsPinCodeItemManager accessory](self, "accessory");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v12, "initWithItemUpdater:pinCodeManager:listType:home:forAccessory:", self, v13, 2, v4, v14);

      objc_msgSend(v5, "addObject:", v15);
    }
  }

  return v5;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUUsersAndGuestsPinCodeItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HUUsersAndGuestsPinCodeItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUUsersAndGuestsPinCodeItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HUUsersAndGuestsPinCodeItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HUUsersAndGuestsPinCodeItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)enableRestrictedGuestAccessSetting:(BOOL)a3 forItem:(id)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  HUUsersAndGuestsPinCodeItemManager *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v4 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[HUUsersAndGuestsPinCodeItemManager overrideHome](self, "overrideHome");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "user");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "homeAccessControlForUser:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v10, "restrictedGuestAccessSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessAllowedToAccessories");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithSet:", v13);

  -[HUUsersAndGuestsPinCodeItemManager accessory](self, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "na_safeContainsObject:", v15);

  if (v4)
  {
    if ((v16 & 1) != 0)
      goto LABEL_7;
    -[HUUsersAndGuestsPinCodeItemManager accessory](self, "accessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "na_safeAddObject:", v17);
  }
  else
  {
    if (!v16)
      goto LABEL_7;
    -[HUUsersAndGuestsPinCodeItemManager accessory](self, "accessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v17);
  }

LABEL_7:
  objc_msgSend(v10, "restrictedGuestAccessSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(v19, "setAccessAllowedToAccessories:", v14);
  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v42 = self;
    v43 = 2112;
    v44 = v21;
    v45 = 2112;
    v46 = v14;
    _os_log_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEFAULT, "%@:%@ Updating allowed accessories to: %@", buf, 0x20u);

  }
  v22 = (void *)MEMORY[0x1E0D519C0];
  v23 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke;
  v38[3] = &unk_1E6F4D600;
  v39 = v10;
  v40 = v19;
  v24 = v19;
  v25 = v10;
  objc_msgSend(v22, "futureWithBlock:", v38);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v23;
  v35[1] = 3221225472;
  v35[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_50;
  v35[3] = &unk_1E6F4D188;
  v27 = v9;
  v36 = v27;
  v37 = v8;
  v28 = v8;
  v29 = (id)objc_msgSend(v26, "addSuccessBlock:", v35);
  v33[0] = v23;
  v33[1] = 3221225472;
  v33[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_2_57;
  v33[3] = &unk_1E6F4E2D8;
  v34 = v27;
  v30 = v27;
  v31 = (id)objc_msgSend(v26, "addFailureBlock:", v33);

  return v26;
}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_2;
  v7[3] = &unk_1E6F4E2D8;
  v8 = v3;
  v6 = v3;
  objc_msgSend(v5, "updateRestrictedGuestSettings:completionHandler:", v4, v7);

}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[HUUsersAndGuestsPinCodeItemManager enableRestrictedGuestAccessSetting:forItem:]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Finished attempt to update guest access settings with error %@", (uint8_t *)&v6, 0x16u);
  }

  v5 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v5, "finishWithError:", v3);
  else
    objc_msgSend(v5, "finishWithNoResult");

}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v9 = "-[HUUsersAndGuestsPinCodeItemManager enableRestrictedGuestAccessSetting:forItem:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "(%s) Successfully updated allowed accessories for %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_52;
  v5[3] = &unk_1E6F4F418;
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", v5, 0);

}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_52(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didUpdateAccessControlForUser:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __81__HUUsersAndGuestsPinCodeItemManager_enableRestrictedGuestAccessSetting_forItem___block_invoke_2_57(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315650;
    v7 = "-[HUUsersAndGuestsPinCodeItemManager enableRestrictedGuestAccessSetting:forItem:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "(%s) Failed to update allowed accessories for %@ with error: %@.", (uint8_t *)&v6, 0x20u);
  }

}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userItemProvider, a3);
}

- (HFTransformItemProvider)transformedGuestUserItemProvider
{
  return self->_transformedGuestUserItemProvider;
}

- (void)setTransformedGuestUserItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_transformedGuestUserItemProvider, a3);
}

- (HFStaticItem)restoreHomeKeyAccessItem
{
  return self->_restoreHomeKeyAccessItem;
}

- (void)setRestoreHomeKeyAccessItem:(id)a3
{
  objc_storeStrong((id *)&self->_restoreHomeKeyAccessItem, a3);
}

- (NAFuture)restoreFuture
{
  return self->_restoreFuture;
}

- (void)setRestoreFuture:(id)a3
{
  objc_storeStrong((id *)&self->_restoreFuture, a3);
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
  objc_storeStrong((id *)&self->_restoreFuture, 0);
  objc_storeStrong((id *)&self->_restoreHomeKeyAccessItem, 0);
  objc_storeStrong((id *)&self->_transformedGuestUserItemProvider, 0);
  objc_storeStrong((id *)&self->_userItemProvider, 0);
}

@end
