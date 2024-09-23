@implementation HULockCategorySettingsItemManager

- (HULockCategorySettingsItemManager)initWithDelegate:(id)a3 topic:(id)a4 home:(id)a5
{
  id v9;
  id v10;
  HULockCategorySettingsItemManager *v11;
  HULockCategorySettingsItemManager *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HULockCategorySettingsItemManager;
  v11 = -[HFItemManager initWithDelegate:sourceItem:](&v14, sel_initWithDelegate_sourceItem_, a3, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_topic, a4);
    objc_storeStrong((id *)&v12->_overrideHome, a5);
  }

  return v12;
}

- (HULockCategorySettingsItemManager)initWithDelegate:(id)a3 topic:(id)a4 pinCodeManager:(id)a5 home:(id)a6
{
  HFPinCodeManager *v10;
  HULockCategorySettingsItemManager *v11;
  HFPinCodeManager *pinCodeManager;

  v10 = (HFPinCodeManager *)a5;
  v11 = -[HULockCategorySettingsItemManager initWithDelegate:topic:home:](self, "initWithDelegate:topic:home:", a3, a4, a6);
  pinCodeManager = v11->_pinCodeManager;
  v11->_pinCodeManager = v10;

  return v11;
}

- (HULockCategorySettingsItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDelegate_topic_home_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HULockCategorySettingsItemManager.m"), 53, CFSTR("%s is unavailable; use %@ instead"),
    "-[HULockCategorySettingsItemManager initWithDelegate:sourceItem:]",
    v7);

  return 0;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
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
  _QWORD v32[4];
  id v33;
  id v34;
  id location;
  uint8_t buf[4];
  const char *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  -[HFItemManager home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasOnboardedForAccessCode");

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31990]), "initWithHome:", v4);
    -[HULockCategorySettingsItemManager setUserItemProvider:](self, "setUserItemProvider:", v7);

    -[HULockCategorySettingsItemManager userItemProvider](self, "userItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIncludeCurrentUser:", 1);

    -[HFItemManager home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hf_currentUserIsAdministrator");
    -[HULockCategorySettingsItemManager userItemProvider](self, "userItemProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIncludeOtherUsers:", v10);

  }
  v12 = objc_alloc(MEMORY[0x1E0D317D8]);
  v13 = *MEMORY[0x1E0CB9A80];
  v38[0] = *MEMORY[0x1E0CB9A78];
  v38[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithHome:serviceTypes:", v4, v14);
  -[HULockCategorySettingsItemManager setLockServiceItemProvider:](self, "setLockServiceItemProvider:", v15);

  HFLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[HULockCategorySettingsItemManager _buildItemProvidersForHome:]";
    _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "(%s) Creating 'guests'", buf, 0xCu);
  }

  v17 = objc_alloc(MEMORY[0x1E0D31840]);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke;
  v32[3] = &unk_1E6F518D0;
  objc_copyWeak(&v34, &location);
  v18 = v4;
  v33 = v18;
  v19 = (void *)objc_msgSend(v17, "initWithResultsBlock:", v32);
  -[HULockCategorySettingsItemManager setGuestsItem:](self, "setGuestsItem:", v19);

  v20 = objc_alloc(MEMORY[0x1E0D31850]);
  v21 = (void *)MEMORY[0x1E0C99E60];
  -[HULockCategorySettingsItemManager guestsItem](self, "guestsItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithObject:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v20, "initWithItems:", v23);
  -[HULockCategorySettingsItemManager setStaticItemProvider:](self, "setStaticItemProvider:", v24);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0D308F0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULockCategorySettingsItemManager staticItemProvider](self, "staticItemProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setClientInvalidationReasons:", v25);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HULockCategorySettingsItemManager userItemProvider](self, "userItemProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "na_safeAddObject:", v28);

  -[HULockCategorySettingsItemManager staticItemProvider](self, "staticItemProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "na_safeAddObject:", v29);

  -[HULockCategorySettingsItemManager lockServiceItemProvider](self, "lockServiceItemProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "na_safeAddObject:", v30);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);

  return v27;
}

id __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(WeakRetained, "pinCodeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "guestPinCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(WeakRetained, "pinCodeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "otherEcosystemGuestPinCodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "combineAllFutures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke_2;
  v13[3] = &unk_1E6F51740;
  v14 = *(id *)(a1 + 32);
  v15 = WeakRetained;
  objc_msgSend(v9, "flatMap:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recover:", &__block_literal_global_287);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v34[5];
  _QWORD v35[5];
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v37 = "-[HULockCategorySettingsItemManager _buildItemProvidersForHome:]_block_invoke_2";
    v38 = 2112;
    v39 = v3;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "(%s) Completed getting access codes from HK and other ecosystems with results %@", buf, 0x16u);
  }

  objc_msgSend(v3, "na_arrayByFlattening");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "hf_accessoriesSupportingAccessCodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "home");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "hf_currentUserIsAdministrator"))
      {
        objc_msgSend(*(id *)(a1 + 40), "home");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "hasOnboardedForAccessCode") ^ 1;

      }
      else
      {
        v10 = 1;
      }

    }
    else
    {
      v10 = 1;
    }

  }
  else
  {
    v10 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "restrictedGuests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v20 = _os_feature_enabled_impl() ^ 1;
  if (!v13)
    v20 = 1;
  v21 = v10 & v20;
  HULocalizedStringWithFormat(CFSTR("HUEditLocationGuestsDescriptionFormat"), CFSTR("%lu"), v14, v15, v16, v17, v18, v19, v13 + v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x1E0D519C0];
  v34[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUEditLocationGuestsTitle"), CFSTR("HUEditLocationGuestsTitle"), 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0D30BF8];
  v35[0] = v25;
  v35[1] = v22;
  v27 = *MEMORY[0x1E0D30C70];
  v34[1] = v26;
  v34[2] = v27;
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("person.2.circle.fill"), v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v28;
  v34[3] = *MEMORY[0x1E0D30D70];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v29;
  v34[4] = *MEMORY[0x1E0D30B78];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "futureWithResult:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

id __64__HULockCategorySettingsItemManager__buildItemProvidersForHome___block_invoke_31(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[HULockCategorySettingsItemManager _buildItemProvidersForHome:]_block_invoke";
    v12 = 2112;
    v13 = v2;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "(%s) Failed to get access codes from HK and other ecosystems. Error = %@. Hiding 'guests' item.", buf, 0x16u);
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HULockCategorySettingsItemManager *v27;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HULockCategorySettingsLockListSection"));
  -[HULockCategorySettingsItemManager lockServiceItemProvider](self, "lockServiceItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingComparator:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v11);

  objc_msgSend(v5, "addObject:", v6);
  -[HULockCategorySettingsItemManager userItemProvider](self, "userItemProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HULockCategorySettingsPeopleSection"));
    v27 = self;
    -[HULockCategorySettingsItemManager userItemProvider](self, "userItemProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v17 = v5;
    v18 = v6;
    v19 = v4;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingComparator:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    v4 = v19;
    v6 = v18;
    v5 = v17;

    -[HULockCategorySettingsItemManager guestsItem](v27, "guestsItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "na_safeAddObject:", v23);

    objc_msgSend(v13, "setItems:", v22);
    _HULocalizedStringWithDefaultValue(CFSTR("HULockCategorySettingsPeopleSectionTitle"), CFSTR("HULockCategorySettingsPeopleSectionTitle"), 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHeaderTitle:", v24);

    objc_msgSend(v17, "addObject:", v13);
  }
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_homeFuture
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  -[HULockCategorySettingsItemManager overrideHome](self, "overrideHome");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HULockCategorySettingsItemManager;
  -[HFItemManager _registerForExternalUpdates](&v4, sel__registerForExternalUpdates);
  -[HULockCategorySettingsItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:", self);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HULockCategorySettingsItemManager;
  -[HFItemManager _unregisterForExternalUpdates](&v4, sel__unregisterForExternalUpdates);
  -[HULockCategorySettingsItemManager pinCodeManager](self, "pinCodeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)pinCodeManagerDidUpdate:(id)a3 pinCodes:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  HULockCategorySettingsItemManager *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = self;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@: %@ Reloading PIN Code related items...", buf, 0x16u);

  }
  -[HULockCategorySettingsItemManager staticItemProvider](self, "staticItemProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v9, a2);

}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HFUserItemProvider)userItemProvider
{
  return self->_userItemProvider;
}

- (void)setUserItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_userItemProvider, a3);
}

- (HFServiceItemProvider)lockServiceItemProvider
{
  return self->_lockServiceItemProvider;
}

- (void)setLockServiceItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lockServiceItemProvider, a3);
}

- (HFStaticItem)guestsItem
{
  return self->_guestsItem;
}

- (void)setGuestsItem:(id)a3
{
  objc_storeStrong((id *)&self->_guestsItem, a3);
}

- (HFUserNotificationServiceTopic)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_topic, 0);
  objc_storeStrong((id *)&self->_guestsItem, 0);
  objc_storeStrong((id *)&self->_lockServiceItemProvider, 0);
  objc_storeStrong((id *)&self->_userItemProvider, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end
