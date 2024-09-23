@implementation HUPersonalRequestsDevicesItemModule

- (HUPersonalRequestsDevicesItemModule)initWithItemUpdater:(id)a3 userItem:(id)a4 home:(id)a5 onlyShowDeviceSwitches:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  HUPersonalRequestsDevicesItemModule *v14;
  HUPersonalRequestsDevicesItemModule *v15;
  uint64_t v16;
  HULocationDeviceManager *locationDeviceManager;
  void *v19;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalRequestsDevicesItemModule.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v20.receiver = self;
  v20.super_class = (Class)HUPersonalRequestsDevicesItemModule;
  v14 = -[HFItemModule initWithItemUpdater:](&v20, sel_initWithItemUpdater_, v11);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_home, a5);
    objc_storeStrong((id *)&v15->_sourceItem, a4);
    v15->_onlyShowDeviceSwitches = a6;
    if (!-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](v15, "onlyShowDeviceSwitches"))
    {
      +[HULocationDeviceManager sharedInstance](HULocationDeviceManager, "sharedInstance");
      v16 = objc_claimAutoreleasedReturnValue();
      locationDeviceManager = v15->_locationDeviceManager;
      v15->_locationDeviceManager = (HULocationDeviceManager *)v16;

    }
    -[HUPersonalRequestsDevicesItemModule _createItemProviders](v15, "_createItemProviders");
  }

  return v15;
}

- (HUPersonalRequestsDevicesItemModule)initWithItemUpdater:(id)a3 userItem:(id)a4 home:(id)a5 settingsController:(id)a6 onlyShowDeviceSwitches:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HUPersonalRequestsDevicesItemModule *v17;
  HUPersonalRequestsDevicesItemModule *v18;
  uint64_t v19;
  NSMapTable *mediaProfileToLanguageOptionsManagerMap;
  void *v21;
  void *v22;
  HUPersonalRequestsDevicesItemModule *v23;
  uint64_t v24;
  HULocationDeviceManager *locationDeviceManager;
  void *v27;
  _QWORD v28[4];
  HUPersonalRequestsDevicesItemModule *v29;
  SEL v30;
  objc_super v31;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUPersonalRequestsDevicesItemModule.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home"));

  }
  v31.receiver = self;
  v31.super_class = (Class)HUPersonalRequestsDevicesItemModule;
  v17 = -[HFItemModule initWithItemUpdater:](&v31, sel_initWithItemUpdater_, v13);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_home, a5);
    objc_storeStrong((id *)&v18->_sourceItem, a4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v19 = objc_claimAutoreleasedReturnValue();
    mediaProfileToLanguageOptionsManagerMap = v18->_mediaProfileToLanguageOptionsManagerMap;
    v18->_mediaProfileToLanguageOptionsManagerMap = (NSMapTable *)v19;

    -[HUPersonalRequestsDevicesItemModule home](v18, "home");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hf_personalRequestAccessories");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __115__HUPersonalRequestsDevicesItemModule_initWithItemUpdater_userItem_home_settingsController_onlyShowDeviceSwitches___block_invoke;
    v28[3] = &unk_1E6F4F8F8;
    v23 = v18;
    v29 = v23;
    v30 = a2;
    objc_msgSend(v22, "na_each:", v28);
    v23->_onlyShowDeviceSwitches = a7;
    if (!-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](v23, "onlyShowDeviceSwitches"))
    {
      +[HULocationDeviceManager sharedInstance](HULocationDeviceManager, "sharedInstance");
      v24 = objc_claimAutoreleasedReturnValue();
      locationDeviceManager = v23->_locationDeviceManager;
      v23->_locationDeviceManager = (HULocationDeviceManager *)v24;

    }
    -[HUPersonalRequestsDevicesItemModule _createItemProviders](v23, "_createItemProviders");

  }
  return v18;
}

void __115__HUPersonalRequestsDevicesItemModule_initWithItemUpdater_userItem_home_settingsController_onlyShowDeviceSwitches___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "hf_isSiriEndpoint") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "homeManager"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasOptedToHH2"),
        v5,
        v4,
        v6))
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Creating Siri language options manager for accessory: %@", (uint8_t *)&v14, 0x20u);

    }
    objc_msgSend(v3, "mediaProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hf_siriLanguageOptionsManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "mediaProfileToLanguageOptionsManagerMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mediaProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, v13);

  }
}

- (void)registerForExternalUpdates
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
  {
    -[HUPersonalRequestsDevicesItemModule locationDeviceManager](self, "locationDeviceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:", self);

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HUPersonalRequestsDevicesItemModule mediaProfileToLanguageOptionsManagerMap](self, "mediaProfileToLanguageOptionsManagerMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "addObserver:", self);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)unregisterForExternalUpdates
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
  {
    -[HUPersonalRequestsDevicesItemModule locationDeviceManager](self, "locationDeviceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self);

  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HUPersonalRequestsDevicesItemModule mediaProfileToLanguageOptionsManagerMap](self, "mediaProfileToLanguageOptionsManagerMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeObserver:", self);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (HMAssistantAccessControl)accessControl
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUPersonalRequestsDevicesItemModule sourceItem](self, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsDevicesItemModule home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assistantAccessControlForHome:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMAssistantAccessControl *)v6;
}

- (void)_createItemProviders
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *itemProviders;
  id v10;
  HFItem *v11;
  HFItem *personalRequestsToggleItem;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSSet *v18;
  NSSet *v19;
  _QWORD v20[4];
  id v21;
  id location;

  if (self->_itemProviders)
  {
    NSLog(CFSTR("_createItemProviders has been called twice"), a2);
  }
  else
  {
    objc_initWeak(&location, self);
    -[HUPersonalRequestsDevicesItemModule _createPersonalRequestProviderForMediaAccessories](self, "_createPersonalRequestProviderForMediaAccessories");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonalRequestsDevicesItemModule setPersonalRequestsMediaAccessoriesProvider:](self, "setPersonalRequestsMediaAccessoriesProvider:", v3);

    -[HUPersonalRequestsDevicesItemModule _createPersonalRequestProviderForOtherAccessories](self, "_createPersonalRequestProviderForOtherAccessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonalRequestsDevicesItemModule setPersonalRequestsOtherAccessoriesProvider:](self, "setPersonalRequestsOtherAccessoriesProvider:", v4);

    if (-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
    {
      v5 = (void *)MEMORY[0x1E0C99E60];
      -[HUPersonalRequestsDevicesItemModule personalRequestsMediaAccessoriesProvider](self, "personalRequestsMediaAccessoriesProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPersonalRequestsDevicesItemModule personalRequestsOtherAccessoriesProvider](self, "personalRequestsOtherAccessoriesProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setWithObjects:", v6, v7, 0);
      v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
      itemProviders = self->_itemProviders;
      self->_itemProviders = v8;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_alloc(MEMORY[0x1E0D31840]);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __59__HUPersonalRequestsDevicesItemModule__createItemProviders__block_invoke;
      v20[3] = &unk_1E6F4C4E8;
      objc_copyWeak(&v21, &location);
      v11 = (HFItem *)objc_msgSend(v10, "initWithResultsBlock:", v20);
      personalRequestsToggleItem = self->_personalRequestsToggleItem;
      self->_personalRequestsToggleItem = v11;

      -[HUPersonalRequestsDevicesItemModule personalRequestsToggleItem](self, "personalRequestsToggleItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v13);

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31848]), "initWithItems:", v6);
      v15 = (void *)MEMORY[0x1E0C99E60];
      -[HUPersonalRequestsDevicesItemModule personalRequestsMediaAccessoriesProvider](self, "personalRequestsMediaAccessoriesProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUPersonalRequestsDevicesItemModule personalRequestsOtherAccessoriesProvider](self, "personalRequestsOtherAccessoriesProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithObjects:", v16, v17, v14, 0);
      v18 = (NSSet *)objc_claimAutoreleasedReturnValue();
      v19 = self->_itemProviders;
      self->_itemProviders = v18;

      objc_destroyWeak(&v21);
    }

    objc_destroyWeak(&location);
  }
}

id __59__HUPersonalRequestsDevicesItemModule__createItemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
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
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "personalRequestsDevices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "count");

  v3 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = *MEMORY[0x1E0D30D18];
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequests"), CFSTR("HUUsersPersonalRequests"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = *MEMORY[0x1E0D30E20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = *MEMORY[0x1E0D30B80];
  v6 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(WeakRetained, "sourceItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "user");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setWithSafeObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)_showPersonalRequestsItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[HUPersonalRequestsDevicesItemModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsDevicesItemModule sourceItem](self, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "user");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v6))
  {
    -[HUPersonalRequestsDevicesItemModule accessControl](self, "accessControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a3;
  if (objc_msgSend(v4, "count")
    && -[HUPersonalRequestsDevicesItemModule _showPersonalRequestsItems](self, "_showPersonalRequestsItems"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = (void *)MEMORY[0x1E0C99DE8];
    -[HUPersonalRequestsDevicesItemModule personalRequestsMediaAccessoriesProvider](self, "personalRequestsMediaAccessoriesProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUPersonalRequestsDevicesItemModule personalRequestsOtherAccessoriesProvider](self, "personalRequestsOtherAccessoriesProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v13);

    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_43);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_setByIntersectingWithSet:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HOMEPOD_PERSONAL_REQUESTS_DEVICES"));
    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsHomePodsSectionTitle"), CFSTR("HUUsersPersonalRequestsHomePodsSectionTitle"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHeaderTitle:", v18);

    objc_msgSend(v16, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D319D0], "comparatorWithSortedObjects:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sortedArrayUsingComparator:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setItems:", v21);

    if (!-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
    {
      -[HUPersonalRequestsDevicesItemModule _attributedFooterTitle](self, "_attributedFooterTitle");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAttributedFooterTitle:", v22);

    }
    objc_msgSend(v5, "addObject:", v17);

  }
  else
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

uint64_t __71__HUPersonalRequestsDevicesItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30D18];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30D18]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "localizedStandardCompare:", v9);

  return v10;
}

- (BOOL)isItemPersonalRequestsToggle:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[HUPersonalRequestsDevicesItemModule personalRequestsToggleItem](self, "personalRequestsToggleItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (BOOL)isItemPersonalRequestsDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HUPersonalRequestsDevicesItemModule personalRequestsMediaAccessoriesProvider](self, "personalRequestsMediaAccessoriesProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[HUPersonalRequestsDevicesItemModule personalRequestsOtherAccessoriesProvider](self, "personalRequestsOtherAccessoriesProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "containsObject:", v4);

  }
  return v7;
}

- (NSArray)personalRequestsDevices
{
  void *v2;
  void *v3;

  -[HUPersonalRequestsDevicesItemModule accessControl](self, "accessControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)toggleAllPersonalRequestsDevices
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HUPersonalRequestsDevicesItemModule personalRequestsDevices](self, "personalRequestsDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "%@ Setting Personal Request devices to empty array.", (uint8_t *)&v8, 0xCu);

    }
    -[HUPersonalRequestsDevicesItemModule setPersonalRequestsDevices:](self, "setPersonalRequestsDevices:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    -[HUPersonalRequestsDevicesItemModule turnOnAllPersonalRequestsDevices](self, "turnOnAllPersonalRequestsDevices");
  }
}

- (void)turnOnAllPersonalRequestsDevices
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUPersonalRequestsDevicesItemModule home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_personalRequestAccessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "%@ Setting Personal Request devices to %@", (uint8_t *)&v10, 0x16u);

  }
  -[HUPersonalRequestsDevicesItemModule home](self, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_personalRequestAccessories");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsDevicesItemModule setPersonalRequestsDevices:](self, "setPersonalRequestsDevices:", v9);

}

- (BOOL)_voiceRecognitionLanguage:(id)a3 matchesMultiUserCapableAccessory:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  HUPersonalRequestsDevicesItemModule *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _BYTE v25[14];
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a4, "mediaProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsMultiUser");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D31530], "siriLanguageOptionFor:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      -[NSObject recognitionLanguage](v11, "recognitionLanguage");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = -[NSObject isEqualToString:](v13, "isEqualToString:", v7);
      HFLogForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138413314;
        v21 = self;
        v22 = 2112;
        v23 = v16;
        v24 = 1024;
        *(_DWORD *)v25 = v14;
        *(_WORD *)&v25[4] = 2112;
        *(_QWORD *)&v25[6] = v13;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_1B8E1E000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@ Supported voice recognition language matches Siri language?: %{BOOL}d: %@, on %@", (uint8_t *)&v20, 0x30u);

      }
    }
    else
    {
      HFLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412802;
        v21 = self;
        v22 = 2112;
        v23 = v18;
        v24 = 2112;
        *(_QWORD *)v25 = v8;
        _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "%@:%@ HomePod does not have Siri Language: %@", (uint8_t *)&v20, 0x20u);

      }
      LOBYTE(v14) = 0;
    }

  }
  else
  {
    HFLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412802;
      v21 = self;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      *(_QWORD *)v25 = v8;
      _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@ Accessory does not support multi user features (voice recognition): %@", (uint8_t *)&v20, 0x20u);

    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void)turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *);
  void *v15;
  HUPersonalRequestsDevicesItemModule *v16;
  id v17;
  uint8_t buf[4];
  HUPersonalRequestsDevicesItemModule *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "languageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUPersonalRequestsDevicesItemModule home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_personalRequestAccessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __113__HUPersonalRequestsDevicesItemModule_turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices__block_invoke;
  v15 = &unk_1E6F4EE80;
  v16 = self;
  v8 = v5;
  v17 = v8;
  objc_msgSend(v7, "na_filter:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v19 = self;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@ turning on Personal Requests for all HomePods on %@ & that support voice recognition: %@", buf, 0x2Au);

  }
  -[HUPersonalRequestsDevicesItemModule setPersonalRequestsDevices:](self, "setPersonalRequestsDevices:", v9, v12, v13, v14, v15, v16);

}

uint64_t __113__HUPersonalRequestsDevicesItemModule_turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  objc_msgSend(v3, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isContainedWithinItemGroup"))
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_mediaSystemForAccessory:", v3);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  objc_msgSend(v4, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __113__HUPersonalRequestsDevicesItemModule_turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices__block_invoke_2;
  v11[3] = &unk_1E6F4EE80;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v9 = objc_msgSend(v7, "na_all:", v11);

  return v9;
}

uint64_t __113__HUPersonalRequestsDevicesItemModule_turnOnPersonalRequestsForAllVoiceRecognitionCapablePersonalRequestsDevices__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_voiceRecognitionLanguage:matchesMultiUserCapableAccessory:", *(_QWORD *)(a1 + 40), a2);
}

- (void)setPersonalRequestsDevices:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v5 = a3;
  -[HUPersonalRequestsDevicesItemModule accessControl](self, "accessControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    objc_msgSend(v7, "setAccessories:", v5);
    objc_msgSend(v7, "setAllowUnauthenticatedRequests:", 1);
    -[HUPersonalRequestsDevicesItemModule _commitUpdateToAccessControl:](self, "_commitUpdateToAccessControl:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__HUPersonalRequestsDevicesItemModule_setPersonalRequestsDevices___block_invoke;
    v10[3] = &unk_1E6F4F960;
    v10[4] = self;
    v10[5] = a2;
    v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v10);

  }
}

void __66__HUPersonalRequestsDevicesItemModule_setPersonalRequestsDevices___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0D314C0];
  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 32), "personalRequestsMediaAccessoriesProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "personalRequestsOtherAccessoriesProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestToReloadItemProviders:senderSelector:", v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v9, "performItemUpdateRequest:", v7);

}

- (NAFuture)activeLocationDeviceFuture
{
  void *v3;
  void *v4;

  if (-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA60]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HUPersonalRequestsDevicesItemModule locationDeviceManager](self, "locationDeviceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeLocationDeviceFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NAFuture *)v3;
}

- (id)updateLocationDeviceToThisDevice
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[6];
  _QWORD v15[5];
  uint8_t buf[16];

  if (-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
    NSLog(CFSTR("We should never call updateLocationDeviceToThisDevice if we are in 'Show Only Device List' mode"));
  if (-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Updating location device to this device...", buf, 2u);
    }

    -[HUPersonalRequestsDevicesItemModule locationDeviceManager](self, "locationDeviceManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "availableLocationDevicesFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __71__HUPersonalRequestsDevicesItemModule_updateLocationDeviceToThisDevice__block_invoke;
    v15[3] = &unk_1E6F4F9C8;
    v15[4] = self;
    objc_msgSend(v7, "flatMap:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __71__HUPersonalRequestsDevicesItemModule_updateLocationDeviceToThisDevice__block_invoke_41;
    v14[3] = &unk_1E6F4C150;
    v14[4] = self;
    v14[5] = a2;
    objc_msgSend(v9, "addSuccessBlock:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addFailureBlock:", &__block_literal_global_45_0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reschedule:", v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

id __71__HUPersonalRequestsDevicesItemModule_updateLocationDeviceToThisDevice__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(v3, "count"))
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "The location device manager returned no available location devices...?", (uint8_t *)&v13, 2u);
    }

  }
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_38_1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Updating location device to: %@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "locationDeviceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateActiveLocationDevice:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 138412290;
      v14 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "This device was not found in the location device manager's list of location devices...? (%@)", (uint8_t *)&v13, 0xCu);
    }

    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

  return v11;
}

uint64_t __71__HUPersonalRequestsDevicesItemModule_updateLocationDeviceToThisDevice__block_invoke_36(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCurrentDevice");
}

void __71__HUPersonalRequestsDevicesItemModule_updateLocationDeviceToThisDevice__block_invoke_41(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint8_t v8[16];

  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Successfully updated location device to this device", v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "itemUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D314C0];
  objc_msgSend(*(id *)(a1 + 32), "allItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestToUpdateItems:senderSelector:", v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "performItemUpdateRequest:", v6);

}

void __71__HUPersonalRequestsDevicesItemModule_updateLocationDeviceToThisDevice__block_invoke_43(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_ERROR, "Failed to update active location device: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (BOOL)isCurrentIOSDeviceOnSameVoiceRecognitionLanguageAsPersonalRequestsDeviceForItem:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v12;
  HUPersonalRequestsDevicesItemModule *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HUPersonalRequestsDevicesItemModule recognitionLanguageForItem:](self, "recognitionLanguageForItem:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "isEqualToString:", v7);
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413314;
    v13 = self;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    v20 = 1024;
    v21 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Siri language on this device (%@) matches Siri Language on Accessory (%@)?: %{BOOL}d", (uint8_t *)&v12, 0x30u);

  }
  return v8;
}

- (id)recognitionLanguageForItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;

  v3 = a3;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_opt_class();
  if (v6)
  {
    objc_opt_class();
    v7 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_msgSend(v9, "sourceItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = (void *)objc_opt_class();
    objc_opt_class();
    v14 = v7;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
    v16 = v15;

    objc_msgSend(v16, "sourceItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

  }
  else
  {
    v20 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;
    v12 = v21;

    v13 = (void *)objc_opt_class();
    v16 = v20;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v16;
    else
      v22 = 0;
    v19 = v22;
  }

  if (v12)
  {
    objc_msgSend(v12, "mediaProfileContainer");
  }
  else
  {
    objc_msgSend(v19, "accessories");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "anyObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "mediaProfile");
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (objc_msgSend(v24, "conformsToProtocol:", &unk_1EF347468))
    v25 = v24;
  else
    v25 = 0;
  v26 = v25;

  if (!v12)
  {

    v23 = v16;
  }

  objc_msgSend(MEMORY[0x1E0D31530], "siriLanguageOptionFor:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "recognitionLanguage");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (BOOL)recognitionLanguageIsSupportedVRLanguageForItem:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v12;
  HUPersonalRequestsDevicesItemModule *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[HUPersonalRequestsDevicesItemModule supportedMULanguageCodes](self, "supportedMULanguageCodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsDevicesItemModule recognitionLanguageForItem:](self, "recognitionLanguageForItem:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "containsObject:", v7);
  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = self;
    v14 = 2112;
    v15 = v10;
    v16 = 1024;
    v17 = v8;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ Accessory language is a supported voice recognition language?: %{BOOL}d", (uint8_t *)&v12, 0x1Cu);

  }
  return v8;
}

- (BOOL)recognitionLanguageIsSupportedVRLanguageForCurrentDevice
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[HUPersonalRequestsDevicesItemModule supportedMULanguageCodes](self, "supportedMULanguageCodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "containsObject:", v4);

  return v5;
}

- (id)_commitUpdateToAccessControl:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  HUPersonalRequestsDevicesItemModule *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  HUPersonalRequestsDevicesItemModule *v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D519C0];
  v6 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke;
  v19[3] = &unk_1E6F4FA10;
  v7 = v4;
  v20 = v7;
  v21 = self;
  objc_msgSend(v5, "futureWithErrorOnlyHandlerAdapterBlock:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v6;
  v14 = 3221225472;
  v15 = __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_298;
  v16 = &unk_1E6F4D188;
  v17 = self;
  v18 = v7;
  v9 = v7;
  v10 = (id)objc_msgSend(v8, "addSuccessBlock:", &v13);
  v11 = (id)objc_msgSend(v8, "addFailureBlock:", &__block_literal_global_302, v13, v14, v15, v16, v17);

  return v8;
}

void __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Committing update to assistant access control: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "user");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateAssistantAccessControl:forHome:completionHandler:", v8, v9, v3);

}

void __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_298(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_2;
  v4[3] = &unk_1E6F4FA38;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "dispatchUserObserverMessage:sender:", v4, 0);

}

void __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "user:didUpdateAssistantAccessControl:forHome:", v4, v5, v6);

  }
}

void __68__HUPersonalRequestsDevicesItemModule__commitUpdateToAccessControl___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0D313A0];
  v3 = a2;
  objc_msgSend(v2, "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:", v3);

}

- (id)_createPersonalRequestProviderForMediaAccessories
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D31510]);
  -[HUPersonalRequestsDevicesItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHome:", v4);

  objc_msgSend(v5, "setFilter:", &__block_literal_global_306);
  v6 = objc_alloc(MEMORY[0x1E0D31928]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForMediaAccessories__block_invoke_3;
  v9[3] = &unk_1E6F4FAE0;
  objc_copyWeak(&v10, &location);
  v7 = (void *)objc_msgSend(v6, "initWithSourceProvider:transformationBlock:", v5, v9);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v7;
}

uint64_t __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForMediaAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF347468))
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "na_all:", &__block_literal_global_307);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(MEMORY[0x1E0CBA358], "isAccessorySupported:", v2);
    else
      v7 = 0;
  }

  return v7;
}

uint64_t __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForMediaAccessories__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CBA358], "isAccessorySupported:", a2);
}

id __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForMediaAccessories__block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_transformItemForSourceItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_createPersonalRequestProviderForOtherAccessories
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];

  v3 = objc_alloc(MEMORY[0x1E0D310B0]);
  -[HUPersonalRequestsDevicesItemModule home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithHome:", v4);

  objc_msgSend(v5, "setFilter:", &__block_literal_global_313);
  v6 = objc_alloc(MEMORY[0x1E0D31928]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForOtherAccessories__block_invoke_2;
  v9[3] = &unk_1E6F4FB28;
  v9[4] = self;
  v7 = (void *)objc_msgSend(v6, "initWithSourceProvider:transformationBlock:", v5, v9);

  return v7;
}

void *__88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForOtherAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
    goto LABEL_8;
  objc_msgSend(v5, "hf_siriEndpointProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "hf_primaryService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CBA358], "isAccessorySupported:", v5);
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
  }
LABEL_9:

  return v6;
}

uint64_t __88__HUPersonalRequestsDevicesItemModule__createPersonalRequestProviderForOtherAccessories__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_transformItemForSourceItem:", a2);
}

- (id)_transformItemForSourceItem:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D31920]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke;
  v9[3] = &unk_1E6F4FB50;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  v7 = (void *)objc_msgSend(v5, "initWithSourceItem:transformationBlock:", v6, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

id __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  int v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  NSObject *v48;
  void *v49;
  int v50;
  int v51;
  void *v52;
  int v53;
  char v54;
  void *v55;
  char v56;
  NSObject *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  id v74;
  uint64_t v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  int v87;
  __int16 v88;
  int v89;
  __int16 v90;
  int v91;
  __int16 v92;
  int v93;
  __int16 v94;
  int v95;
  uint64_t v96;

  v2 = a1;
  v96 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(*(id *)(v2 + 32), "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(WeakRetained, "accessControl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessories");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v12 = *(id *)(v2 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v12;
  else
    v13 = 0;
  v14 = v13;

  objc_opt_class();
  v15 = *(id *)(v2 + 32);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  v78 = v17;
  if (v14)
  {
    objc_msgSend(v14, "accessories");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_2;
    v82[3] = &unk_1E6F4E5D8;
    v83 = v11;
    v19 = objc_msgSend(v18, "na_any:", v82);

    if ((v19 & 1) == 0)
      goto LABEL_19;
  }
  else
  {
    if (!v17)
      goto LABEL_19;
    v80[0] = MEMORY[0x1E0C809B0];
    v80[1] = 3221225472;
    v80[2] = __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_4;
    v80[3] = &unk_1E6F4E5D8;
    v81 = v17;
    v20 = objc_msgSend(v11, "na_any:", v80);

    if (!v20)
      goto LABEL_19;
  }
  objc_msgSend(WeakRetained, "accessControl");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "allowUnauthenticatedRequests");

  if ((v22 & 1) == 0)
  {
    HFLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v85 = v79;
      _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, "Forcing PR OFF for %@ because the user previously had allowUnauthenticatedRequests set to NO", buf, 0xCu);
    }

  }
LABEL_19:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = *MEMORY[0x1E0D30E20];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v24);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D30CE8]);
  objc_msgSend(WeakRetained, "sourceMediaProfileContainer");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
    goto LABEL_23;
  v26 = (void *)v25;
  objc_msgSend(WeakRetained, "sourceMediaProfileContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hf_backingAccessory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "uniqueIdentifier");
  v29 = WeakRetained;
  v30 = v2;
  v31 = v9;
  v32 = v14;
  v33 = v11;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "uniqueIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend(v34, "isEqual:", v35);

  v11 = v33;
  v14 = v32;
  v9 = v31;
  v2 = v30;
  WeakRetained = v29;

  if (v76)
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsSelectedHomePodDescriptionText"), CFSTR("HUUsersPersonalRequestsSelectedHomePodDescriptionText"), 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x1E0D30BF8];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0D30BF8]);

    objc_msgSend(v29, "sourceMediaProfileContainer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "hf_backingAccessory");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "hf_siriEndpointProfile");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v40)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsSelectedSiriEndpointDescriptionText"), CFSTR("HUUsersPersonalRequestsSelectedSiriEndpointDescriptionText"), 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v41, v37);

    }
  }
  else
  {
LABEL_23:
    v37 = *MEMORY[0x1E0D30BF8];
    objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D30BF8]);
  }
  objc_msgSend(WeakRetained, "supportedMULanguageCodes");
  v42 = objc_claimAutoreleasedReturnValue();
  if (v42
    && (v43 = (void *)v42,
        objc_msgSend(WeakRetained, "home"),
        v44 = (void *)objc_claimAutoreleasedReturnValue(),
        v45 = objc_msgSend(v44, "isMultiUserEnabled"),
        v44,
        v43,
        v45))
  {
    v77 = v11;
    v46 = objc_msgSend(WeakRetained, "recognitionLanguageIsSupportedVRLanguageForItem:", *(_QWORD *)(v2 + 32));
    v47 = objc_msgSend(WeakRetained, "isCurrentIOSDeviceOnSameVoiceRecognitionLanguageAsPersonalRequestsDeviceForItem:", *(_QWORD *)(v2 + 32));
    HFLogForCategory();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      v73 = *(void **)(v2 + 32);
      objc_msgSend(WeakRetained, "home");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "isMultiUserEnabled");
      v51 = objc_msgSend(v79, "supportsMultiUser");
      objc_msgSend(WeakRetained, "home");
      v74 = v14;
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "hf_currentUserIsOwner");
      *(_DWORD *)buf = 138413570;
      v85 = v73;
      v86 = 1024;
      v87 = v47;
      v88 = 1024;
      v89 = v46;
      v90 = 1024;
      v91 = v50;
      v92 = 1024;
      v93 = v51;
      v94 = 1024;
      v95 = v53;
      _os_log_impl(&dword_1B8E1E000, v48, OS_LOG_TYPE_DEFAULT, "Calculating switch attributes for item %@: \n\t\t.... item is on phone's language?: %{BOOL}d (& is VR language)?: %{BOOL}d, home has enabled multi-user?: %{BOOL}d, item supports multi-user?: %{BOOL}d, current user is the owner?: %{BOOL}d", buf, 0x2Au);

      v14 = v74;
    }

    if ((objc_msgSend(v79, "supportsMultiUser") & 1) != 0)
      v54 = v46 & v47;
    else
      v54 = objc_msgSend(v14, "supportsMultiUser") & v46 & v47;
    v11 = v77;
    if ((v54 & 1) == 0)
    {
      _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsVoiceRecognitionNotAvailableDescription"), CFSTR("HUUsersPersonalRequestsVoiceRecognitionNotAvailableDescription"), 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v61, v37);

      objc_msgSend(WeakRetained, "home");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "hf_currentUserIsOwner");

      if ((v63 & 1) == 0)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30C80]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", HFPrimaryStateFromBOOL());
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v64, v75);

      }
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "home");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "isMultiUserEnabled");

    if ((v56 & 1) != 0)
    {
      HFLogForCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B8E1E000, v57, OS_LOG_TYPE_DEFAULT, "Supported voice recognition languages have not populated yet. Disabling personal requests switches for non-owners. This should get fixed during an upcoming reload...", buf, 2u);
      }

      _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsVoiceRecognitionNotAvailableDescription"), CFSTR("HUUsersPersonalRequestsVoiceRecognitionNotAvailableDescription"), 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v58, v37);

    }
    objc_msgSend(WeakRetained, "home");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "hf_currentUserIsOwner");

    if ((v60 & 1) == 0)
      objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D70]);
  }
  v65 = *MEMORY[0x1E0D30B80];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D30B80]);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (v66)
  {
    v68 = (void *)objc_msgSend(v66, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)objc_msgSend(v69, "mutableCopy");

  }
  objc_msgSend(WeakRetained, "sourceItem");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "user");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addObject:", v71);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v68, v65);
  return v9;
}

uint64_t __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_3;
  v8[3] = &unk_1E6F4E5D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __67__HUPersonalRequestsDevicesItemModule__transformItemForSourceItem___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

- (id)_attributedFooterTitle
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[5];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  -[HUPersonalRequestsDevicesItemModule home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_siriEndPointAccessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  -[HUPersonalRequestsDevicesItemModule locationDeviceManager](self, "locationDeviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeLocationDeviceFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HUPersonalRequestsDevicesItemModule__attributedFooterTitle__block_invoke;
  v11[3] = &unk_1E6F4FB78;
  v12 = v5;
  v11[4] = &v13;
  v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v11);

  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __61__HUPersonalRequestsDevicesItemModule__attributedFooterTitle__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  char v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a2;
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsEnabledSettingsLinkTitle"), CFSTR("HUUsersPersonalRequestsEnabledSettingsLinkTitle"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v38, "isCurrentDevice"))
  {
    _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsEnabledThisDeviceFooterItem"), CFSTR("HUUsersPersonalRequestsEnabledThisDeviceFooterItem"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(a1 + 40))
      goto LABEL_9;
    v12 = CFSTR("HUUsersPersonalRequestsEnabledThisDeviceFooterItem_Accessories");
    goto LABEL_4;
  }
  if (v38)
  {
    objc_msgSend(v38, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUsersPersonalRequestsEnabledOtherDeviceFooterItem"), CFSTR("%@"), v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!*(_BYTE *)(a1 + 40))
      goto LABEL_9;
    objc_msgSend(v38, "name");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUsersPersonalRequestsEnabledOtherDeviceFooterItem_Accessories"), CFSTR("%@"), v21, v22, v23, v24, v25, v26, (uint64_t)v2);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = v2;
    goto LABEL_8;
  }
  if (!objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    goto LABEL_14;
  _HULocalizedStringWithDefaultValue(CFSTR("HUUsersPersonalRequestsEnabledOtherUnknownDeviceFooterItem"), CFSTR("HUUsersPersonalRequestsEnabledOtherUnknownDeviceFooterItem"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 40))
  {
    v12 = CFSTR("HUUsersPersonalRequestsEnabledOtherUnknownDeviceFooterItem_Accessories");
LABEL_4:
    _HULocalizedStringWithDefaultValue(v12, v12, 1);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_8:

    v11 = (void *)v13;
  }
LABEL_9:
  if (v11)
  {
    HULocalizedStringWithFormat(CFSTR("HUUsersPersonalRequestsEnabledSettingsDescription"), CFSTR("%@"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    HULocalizedStringWithFormat(CFSTR("HUUsersPersonalRequestsEnabledFormat"), CFSTR("%@%@"), v27, v28, v29, v30, v31, v32, (uint64_t)v11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
LABEL_14:
  HULocalizedStringWithFormat(CFSTR("HUUsersPersonalRequestsEnabledNoFMFDeviceSettingsDescription"), CFSTR("%@"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v34 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");
  v35 = v34;
  v36 = (void *)MEMORY[0x1E0CB3498];
  if (v34)
  {
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v33, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "hf_locationDeviceSettingsURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "hf_attributedLinkStringForString:linkString:linkURL:", v33, v4, v2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v37);
  if ((v35 & 1) == 0)
  {

    v37 = v2;
  }

}

- (void)locationDeviceManager:(id)a3 didUpdateActiveLocationDevice:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  if (-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches", a3, a4))
    NSLog(CFSTR("We should never call didUpdateActiveLocationDevice if we are in 'Show Only Device List' mode"));
  if (!-[HUPersonalRequestsDevicesItemModule onlyShowDeviceSwitches](self, "onlyShowDeviceSwitches"))
  {
    -[HFItemModule itemUpdater](self, "itemUpdater");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0D314C0];
    -[HFItemModule allItems](self, "allItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestToUpdateItems:senderSelector:", v7, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v10, "performItemUpdateRequest:", v8);

  }
}

- (void)siriLanguageOptionsManager:(id)a3 availableLanguageOptionsDidChange:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  HUPersonalRequestsDevicesItemModule *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
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
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Update items with available language options: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsDevicesItemModule personalRequestsMediaAccessoriesProvider](self, "personalRequestsMediaAccessoriesProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeAddObject:", v10);

  -[HUPersonalRequestsDevicesItemModule personalRequestsOtherAccessoriesProvider](self, "personalRequestsOtherAccessoriesProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeAddObject:", v11);

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314C0], "requestToReloadItemProviders:senderSelector:", v9, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "performItemUpdateRequest:", v13);

}

- (void)siriLanguageOptionsManager:(id)a3 selectedLanguageOptionDidChange:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  HUPersonalRequestsDevicesItemModule *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a4;
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
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ Update items with selected language option: %@", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPersonalRequestsDevicesItemModule personalRequestsMediaAccessoriesProvider](self, "personalRequestsMediaAccessoriesProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeAddObject:", v10);

  -[HUPersonalRequestsDevicesItemModule personalRequestsOtherAccessoriesProvider](self, "personalRequestsOtherAccessoriesProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_safeAddObject:", v11);

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D314C0], "requestToReloadItemProviders:senderSelector:", v9, a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "performItemUpdateRequest:", v13);

}

- (NSSet)itemProviders
{
  return self->_itemProviders;
}

- (HFMediaProfileContainer)sourceMediaProfileContainer
{
  return self->_sourceMediaProfileContainer;
}

- (void)setSourceMediaProfileContainer:(id)a3
{
  objc_storeStrong((id *)&self->_sourceMediaProfileContainer, a3);
}

- (BOOL)onlyShowDeviceSwitches
{
  return self->_onlyShowDeviceSwitches;
}

- (void)setOnlyShowDeviceSwitches:(BOOL)a3
{
  self->_onlyShowDeviceSwitches = a3;
}

- (NSArray)supportedMULanguageCodes
{
  return self->_supportedMULanguageCodes;
}

- (void)setSupportedMULanguageCodes:(id)a3
{
  objc_storeStrong((id *)&self->_supportedMULanguageCodes, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (HFUserItem)sourceItem
{
  return self->_sourceItem;
}

- (HFItemProvider)personalRequestsMediaAccessoriesProvider
{
  return self->_personalRequestsMediaAccessoriesProvider;
}

- (void)setPersonalRequestsMediaAccessoriesProvider:(id)a3
{
  objc_storeStrong((id *)&self->_personalRequestsMediaAccessoriesProvider, a3);
}

- (HFItemProvider)personalRequestsOtherAccessoriesProvider
{
  return self->_personalRequestsOtherAccessoriesProvider;
}

- (void)setPersonalRequestsOtherAccessoriesProvider:(id)a3
{
  objc_storeStrong((id *)&self->_personalRequestsOtherAccessoriesProvider, a3);
}

- (HFItem)personalRequestsToggleItem
{
  return self->_personalRequestsToggleItem;
}

- (HULocationDeviceManager)locationDeviceManager
{
  return self->_locationDeviceManager;
}

- (NSMapTable)mediaProfileToLanguageOptionsManagerMap
{
  return self->_mediaProfileToLanguageOptionsManagerMap;
}

- (void)setMediaProfileToLanguageOptionsManagerMap:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProfileToLanguageOptionsManagerMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProfileToLanguageOptionsManagerMap, 0);
  objc_storeStrong((id *)&self->_locationDeviceManager, 0);
  objc_storeStrong((id *)&self->_personalRequestsToggleItem, 0);
  objc_storeStrong((id *)&self->_personalRequestsOtherAccessoriesProvider, 0);
  objc_storeStrong((id *)&self->_personalRequestsMediaAccessoriesProvider, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_supportedMULanguageCodes, 0);
  objc_storeStrong((id *)&self->_sourceMediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
