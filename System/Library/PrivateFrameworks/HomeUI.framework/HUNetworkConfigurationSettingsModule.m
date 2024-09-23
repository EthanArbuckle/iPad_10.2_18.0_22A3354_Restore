@implementation HUNetworkConfigurationSettingsModule

- (HUNetworkConfigurationSettingsModule)initWithItemUpdater:(id)a3 group:(id)a4
{
  id v7;
  HUNetworkConfigurationSettingsModule *v8;
  HUNetworkConfigurationSettingsModule *v9;
  HUNetworkProtectionModeOptionItemProvider *v10;
  HUNetworkProtectionModeOptionItemProvider *networkProtectionModeOptionItemProvider;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HUNetworkConfigurationSettingsModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v13, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_group, a4);
    v10 = -[HUNetworkProtectionModeOptionItemProvider initWithGroup:]([HUNetworkProtectionModeOptionItemProvider alloc], "initWithGroup:", v7);
    networkProtectionModeOptionItemProvider = v9->_networkProtectionModeOptionItemProvider;
    v9->_networkProtectionModeOptionItemProvider = v10;

  }
  return v9;
}

- (HUNetworkConfigurationSettingsModule)initWithItemUpdater:(id)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithItemUpdater_group_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUNetworkConfigurationSettingsModule.m"), 45, CFSTR("%s is unavailable; use %@ instead"),
    "-[HUNetworkConfigurationSettingsModule initWithItemUpdater:]",
    v6);

  return 0;
}

- (BOOL)isItemNetworkProtectionModeOptionItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[HUNetworkConfigurationSettingsModule networkProtectionModeOptionItemProvider](self, "networkProtectionModeOptionItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (HFNetworkConfigurationGroupItem)sourceItem
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_opt_class();
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  objc_msgSend(v5, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (!v8)
  {
    objc_msgSend(v5, "sourceItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Invalid source item %@ for item manager %@"), v9, v5);

  }
  return (HFNetworkConfigurationGroupItem *)v8;
}

- (id)updateProtectionMode:(int64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18[2];
  id location;
  uint8_t buf[4];
  HUNetworkConfigurationSettingsModule *v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[HUNetworkConfigurationSettingsModule group](self, "group");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v21 = self;
    v22 = 2048;
    v23 = a3;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: Updating protection mode to %lu for group %@", buf, 0x20u);

  }
  -[HUNetworkConfigurationSettingsModule group](self, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_updateProtectionMode:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUNetworkConfigurationSettingsModule setIsUpdatingProtectionMode:](self, "setIsUpdatingProtectionMode:", 1);
  -[HUNetworkConfigurationSettingsModule updateProtectionModeTimer](self, "updateProtectionModeTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[HUNetworkConfigurationSettingsModule updateProtectionModeTimer](self, "updateProtectionModeTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = self;
      v22 = 2112;
      v23 = (int64_t)v12;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: Cancelling timer %@ and restarting mode update", buf, 0x16u);

    }
    -[HUNetworkConfigurationSettingsModule updateProtectionModeTimer](self, "updateProtectionModeTimer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidate");

    -[HUNetworkConfigurationSettingsModule setUpdateProtectionModeTimer:](self, "setUpdateProtectionModeTimer:", 0);
  }
  objc_initWeak((id *)buf, v8);
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke;
  v16[3] = &unk_1E6F4E3D0;
  objc_copyWeak(&v17, (id *)buf);
  objc_copyWeak(v18, &location);
  v18[1] = (id)a2;
  v14 = (id)objc_msgSend(v9, "addCompletionBlock:", v16);
  objc_destroyWeak(v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

  return v9;
}

void __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20[2];
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v8 = objc_loadWeakRetained(a1 + 5);
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_2;
  v21[3] = &unk_1E6F4E358;
  objc_copyWeak(&v22, a1 + 4);
  objc_msgSend(v9, "dispatchHomeObserverMessage:sender:", v21, 0);

  v11 = (void *)MEMORY[0x1E0C99E88];
  v15 = v10;
  v16 = 3221225472;
  v17 = __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_3;
  v18 = &unk_1E6F4E3A8;
  v19 = v8;
  objc_copyWeak(v20, a1 + 5);
  v20[1] = a1[6];
  objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v15, 30.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpdateProtectionModeTimer:", v12, v15, v16, v17, v18, v19);

  HFLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "updateProtectionModeTimer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = v8;
    v25 = 2112;
    v26 = v14;
    v27 = 2048;
    v28 = 30;
    _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@: Starting protection mode update timer %@ (%lus)", buf, 0x20u);

  }
  objc_destroyWeak(v20);
  objc_destroyWeak(&v22);

}

void __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "hf_home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home:didUpdateAccessoryNetworkProtectionGroup:", v5, v4);

  }
}

void __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v24 = v5;
    v25 = 2112;
    v26 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@: Timer fired %@", buf, 0x16u);
  }

  v6 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (!WeakRetained
    || (objc_msgSend(WeakRetained, "sourceItem"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = v9 == 0,
        v9,
        v10))
  {
    HFLogForCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_error_impl(&dword_1B8E1E000, v19, OS_LOG_TYPE_ERROR, "%@: Protection mode update timer lost reference to parent; invalidating",
        buf,
        0xCu);
    }
  }
  else
  {
    objc_msgSend(v8, "setIsUpdatingProtectionMode:", 0);
    objc_msgSend(v8, "setUpdateProtectionModeTimer:", 0);
    HFLogForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "sourceItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1B8E1E000, v11, OS_LOG_TYPE_DEFAULT, "%@: Ending attempt and updating %@ to check for mismatch", buf, 0x16u);

    }
    objc_msgSend(v8, "itemUpdater");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0D314C0];
    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "sourceItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "requestToUpdateItems:senderSelector:", v17, *(_QWORD *)(a1 + 48));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "performItemUpdateRequest:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_19;
    v21[3] = &unk_1E6F4E380;
    objc_copyWeak(&v22, v6);
    v20 = (id)-[NSObject addCompletionBlock:](v19, "addCompletionBlock:", v21);
    objc_destroyWeak(&v22);
  }

}

void __61__HUNetworkConfigurationSettingsModule_updateProtectionMode___block_invoke_19(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DF8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = 138412290;
      v9 = WeakRetained;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: Protection mode update attempt timed out", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(WeakRetained, "networkConfigurationSettingsModuleDelegate");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject networkConfigurationSettingsModuleUpdateDidTimeout:](v6, "networkConfigurationSettingsModuleUpdateDidTimeout:", WeakRetained);
  }
  else if (v7)
  {
    v8 = 138412290;
    v9 = WeakRetained;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: Protection mode update attempt already succeeded", (uint8_t *)&v8, 0xCu);
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HUNetworkConfigurationSettingsModule group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HUNetworkConfigurationSettingsModule %p (%@)>"), self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)itemProviders
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUNetworkConfigurationSettingsModule networkProtectionModeOptionItemProvider](self, "networkProtectionModeOptionItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D31570];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithIdentifier:", CFSTR("HUNetworkConfigurationSettingsModuleProtectionModeOptionSectionIdentifier"));
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkConfigurationSettingsSectionTitle"), CFSTR("HUNetworkConfigurationSettingsSectionTitle"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v7);

  -[HUNetworkConfigurationSettingsModule networkProtectionModeOptionItemProvider](self, "networkProtectionModeOptionItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "items");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "itemResultManualSortComparator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v12);

  -[HUNetworkConfigurationSettingsModule _protectionModeOptionSectionFooter](self, "_protectionModeOptionSectionFooter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttributedFooterTitle:", v13);

  v14 = (void *)MEMORY[0x1E0D314B0];
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "filterSections:toDisplayedItems:", v15, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_protectionModeOptionSectionFooter
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  int v34;
  _QWORD v35[10];
  _QWORD v36[4];
  id v37;
  HUNetworkConfigurationSettingsModule *v38;
  _QWORD v39[4];
  char v40;
  char v41;
  uint8_t buf[4];
  HUNetworkConfigurationSettingsModule *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  -[HUNetworkConfigurationSettingsModule sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latestResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E00]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v3, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DD0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(v3, "latestResults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DE8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(v3, "latestResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DE0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v3, "latestResults");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DC8]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_26);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "latestResults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DD8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");
  if (v9 == 2)
    v22 = v21;
  else
    v22 = 0;

  objc_msgSend(v3, "latestResults");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D30DF8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "BOOLValue"))
    v34 = !-[HUNetworkConfigurationSettingsModule isUpdatingProtectionMode](self, "isUpdatingProtectionMode");
  else
    v34 = 0;

  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138414594;
    v43 = self;
    v44 = 2112;
    v45 = v3;
    v46 = 2048;
    v47 = v6;
    v48 = 2048;
    v49 = v9;
    v50 = 1024;
    v51 = -[HUNetworkConfigurationSettingsModule isUpdatingProtectionMode](self, "isUpdatingProtectionMode");
    v52 = 1024;
    v53 = v34;
    v54 = 1024;
    v55 = v15;
    v56 = 1024;
    v57 = v12;
    v58 = 2048;
    v59 = objc_msgSend(v17, "count");
    v60 = 1024;
    v61 = v22;
    _os_log_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEFAULT, "%@: Constructing footer for item %@: target:%lu current:%lu updateAttempt:%{BOOL}d protectionMismatch:%{BOOL}d hostException:%{BOOL}d hostMismatch:%{BOOL}d allowedHostCount:%lu accessViolation:%{BOOL}d", buf, 0x52u);
  }

  v26 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v27 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_32;
  v39[3] = &__block_descriptor_34_e25___NSAttributedString_8__0l;
  v40 = v12;
  v41 = v15;
  __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_32((uint64_t)v39);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendAttributedString:", v28);

  if (objc_msgSend(v26, "length"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
    objc_msgSend(v26, "appendAttributedString:", v29);

  }
  if (v9 == 2)
  {
    v36[0] = v27;
    v36[1] = 3221225472;
    v36[2] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_3;
    v36[3] = &unk_1E6F4E4A0;
    v37 = v26;
    v38 = self;
    objc_msgSend(v33, "na_each:", v36);

  }
  if (v22)
  {
    v35[5] = v27;
    v35[6] = 3221225472;
    v35[7] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_5;
    v35[8] = &unk_1E6F4C540;
    v35[9] = self;
    __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_5();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendAttributedString:", v30);

  }
  if (v34)
  {
    v35[0] = v27;
    v35[1] = 3221225472;
    v35[2] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_6;
    v35[3] = &unk_1E6F4C540;
    v35[4] = self;
    __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_6((uint64_t)v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appendAttributedString:", v31);

  }
  return v26;
}

uint64_t __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_32(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  __int16 v7;

  v2 = objc_alloc(MEMORY[0x1E0CB3498]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_2;
  v6[3] = &__block_descriptor_34_e15___NSString_8__0l;
  v7 = *(_WORD *)(a1 + 32);
  __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_2((uint64_t)v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);

  return v4;
}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_2(uint64_t a1)
{
  __CFString *v1;
  void *v2;

  if (*(_BYTE *)(a1 + 32))
  {
    if (*(_BYTE *)(a1 + 33))
      v1 = CFSTR("HUNetworkConfigurationSettingsAllowedHostMessageMismatchAndException");
    else
      v1 = CFSTR("HUNetworkConfigurationSettingsAllowedHostMessageMismatch");
  }
  else
  {
    if (!*(_BYTE *)(a1 + 33))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "string");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
    v1 = CFSTR("HUNetworkConfigurationSettingsAllowedHostMessageException");
  }
  _HULocalizedStringWithDefaultValue(v1, v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

void __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_4;
  v7[3] = &unk_1E6F4E478;
  v4 = *(void **)(a1 + 32);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v6 = v3;
  __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_4((uint64_t)v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendAttributedString:", v5);

}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend((id)objc_opt_class(), "_attributedCheckmarkIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendAttributedString:", v3);

  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend((id)objc_opt_class(), "_allowedHostDescriptionForHostGroup:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);
  objc_msgSend(v2, "appendAttributedString:", v6);

  return v2;
}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_5()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend((id)objc_opt_class(), "_attributedExclamationIcon");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendAttributedString:", v1);

  v2 = objc_alloc(MEMORY[0x1E0CB3498]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkConfigurationSettingsBlockedHostDescription"), CFSTR("HUNetworkConfigurationSettingsBlockedHostDescription"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithString:", v3);
  objc_msgSend(v0, "appendAttributedString:", v4);

  return v0;
}

id __74__HUNetworkConfigurationSettingsModule__protectionModeOptionSectionFooter__block_invoke_6(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend((id)objc_opt_class(), "_attributedExclamationIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendAttributedString:", v3);

  v4 = (void *)MEMORY[0x1E0CBA710];
  objc_msgSend(*(id *)(a1 + 32), "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_detailedLocalizedTitleForTargetProtectionMode:", objc_msgSend(v5, "targetProtectionMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_title");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUNetworkConfigurationSettingsConfigurationMismatchDescription"), CFSTR("%@%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0CB3498];
  _HULocalizedStringWithDefaultValue(CFSTR("HUNetworkConfigurationSettingsConfigurationMismatchDescriptionLink"), CFSTR("HUNetworkConfigurationSettingsConfigurationMismatchDescriptionLink"), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("HUNetworkConfigurationSettingsMismatchLinkAttributeName");
  v22[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_attributedLinkStringForString:linkString:linkURL:attributes:additionalLinkAttributes:", v14, v16, 0, 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "appendAttributedString:", v18);
  return v2;
}

+ (id)_allowedHostDescriptionForHostGroup:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "purposeLocalizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HULocalizedStringWithFormat(CFSTR("HUNetworkConfigurationSettingsAllowedHostDescriptionFormat"), CFSTR("%@%@"), v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_attributedIconNamed:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR("\n"));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__HUNetworkConfigurationSettingsModule__attributedIconNamed___block_invoke;
  v9[3] = &unk_1E6F4E4C8;
  v10 = v3;
  v5 = v3;
  __61__HUNetworkConfigurationSettingsModule__attributedIconNamed___block_invoke((uint64_t)v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendAttributedString:", v6);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", CFSTR(" "));
  objc_msgSend(v4, "appendAttributedString:", v7);

  return v4;
}

id __61__HUNetworkConfigurationSettingsModule__attributedIconNamed___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA258]);
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB558], 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithSymbolConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithRenderingMode:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v6);

  objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_attributedCheckmarkIcon
{
  return (id)objc_msgSend(a1, "_attributedIconNamed:", CFSTR("checkmark.circle"));
}

+ (id)_attributedExclamationIcon
{
  return (id)objc_msgSend(a1, "_attributedIconNamed:", CFSTR("exclamationmark.circle"));
}

- (HUNetworkConfigurationSettingsModuleDelegate)networkConfigurationSettingsModuleDelegate
{
  return (HUNetworkConfigurationSettingsModuleDelegate *)objc_loadWeakRetained((id *)&self->_networkConfigurationSettingsModuleDelegate);
}

- (void)setNetworkConfigurationSettingsModuleDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_networkConfigurationSettingsModuleDelegate, a3);
}

- (HMAccessoryNetworkProtectionGroup)group
{
  return self->_group;
}

- (BOOL)isUpdatingProtectionMode
{
  return self->_isUpdatingProtectionMode;
}

- (void)setIsUpdatingProtectionMode:(BOOL)a3
{
  self->_isUpdatingProtectionMode = a3;
}

- (HUNetworkProtectionModeOptionItemProvider)networkProtectionModeOptionItemProvider
{
  return self->_networkProtectionModeOptionItemProvider;
}

- (void)setNetworkProtectionModeOptionItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_networkProtectionModeOptionItemProvider, a3);
}

- (NSTimer)updateProtectionModeTimer
{
  return self->_updateProtectionModeTimer;
}

- (void)setUpdateProtectionModeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateProtectionModeTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateProtectionModeTimer, 0);
  objc_storeStrong((id *)&self->_networkProtectionModeOptionItemProvider, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_networkConfigurationSettingsModuleDelegate);
}

@end
