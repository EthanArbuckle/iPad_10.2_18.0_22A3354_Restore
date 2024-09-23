@implementation HFHomeKitAccessorySettingsItemProvider

- (HFHomeKitAccessorySettingsItemProvider)initWithSettingsController:(id)a3 sourceItem:(id)a4 settingGroupKeyPath:(id)a5 moduleSettings:(id)a6 usageOptions:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HFHomeKitAccessorySettingsItemProvider *v17;
  uint64_t v18;
  NSMutableSet *settingItems;
  void *v20;
  void *v21;
  uint64_t v22;
  NSUUID *accessoryIdentifier;
  id v25;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v25 = a6;
  v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HFHomeKitAccessorySettingsItemProvider;
  v17 = -[HFItemProvider init](&v26, sel_init);
  if (v17)
  {
    v18 = objc_opt_new();
    settingItems = v17->_settingItems;
    v17->_settingItems = (NSMutableSet *)v18;

    objc_storeStrong((id *)&v17->_settingsController, a3);
    objc_storeStrong((id *)&v17->_sourceItem, a4);
    objc_storeStrong((id *)&v17->_groupKeyPath, a5);
    objc_storeStrong((id *)&v17->_moduleSettings, a6);
    objc_storeStrong((id *)&v17->_usageOptions, a7);
    -[HFServiceLikeItem accessories](v17->_sourceItem, "accessories");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "anyObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "uniqueIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();
    accessoryIdentifier = v17->_accessoryIdentifier;
    v17->_accessoryIdentifier = (NSUUID *)v22;

  }
  return v17;
}

- (id)items
{
  void *v2;
  void *v3;

  -[HFHomeKitAccessorySettingsItemProvider settingItems](self, "settingItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)reloadItems
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = -[HFHomeKitAccessorySettingsItemProvider settingsAlreadyFetched](self, "settingsAlreadyFetched");
  HFLogForCategory(0x25uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "We have already fetched settings, so we will just reload the existing setting items to refresh the UI", v10, 2u);
    }

    -[HFHomeKitAccessorySettingsItemProvider settingItems](self, "settingItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitAccessorySettingsItemProvider _reloadItemsFromSettings:performInitialUpdateOnItems:](self, "_reloadItemsFromSettings:performInitialUpdateOnItems:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Now fetching the settings", buf, 2u);
    }

    -[HFHomeKitAccessorySettingsItemProvider _fetchSettingsAndReloadItems](self, "_fetchSettingsAndReloadItems");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HFHomeKitAccessorySettingsItemProvider settingItems](self, "settingItems", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "settingKeyPath");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", v7))
        {

        }
        else
        {
          objc_msgSend(v13, "targetSettingKeyPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v7);

          if (!v16)
            continue;
        }
        objc_msgSend(v13, "updateSettingValue:", v6);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

}

- (BOOL)updateSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  BOOL v18;
  void *v19;
  BOOL v20;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __57__HFHomeKitAccessorySettingsItemProvider_updateSettings___block_invoke;
  v23[3] = &unk_1EA726E58;
  v23[4] = self;
  v25 = &v26;
  v7 = v5;
  v24 = v7;
  objc_msgSend(v4, "na_each:", v23);
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)MEMORY[0x1E0C99DE8];
    -[HFHomeKitAccessorySettingsItemProvider settingItems](self, "settingItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObjectsFromArray:", v7);
    -[HFHomeKitAccessorySettingsItemProvider splitSettingsDictionary](self, "splitSettingsDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitAccessorySettingsItemProvider allKeyPaths](self, "allKeyPaths");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFHomeKitAccessorySettingsItemProvider _generateAccessorySettingItemForSettings:homeKitSettings:keyPaths:](self, "_generateAccessorySettingItemForSettings:homeKitSettings:keyPaths:", v12, v7, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObjectsFromArray:", v14);
    HFLogForCategory(0x25uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v7;
      _os_log_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_DEFAULT, "Creating New Settings = [%@]", buf, 0xCu);
    }

    v16 = -[HFHomeKitAccessorySettingsItemProvider _reloadItemsFromSettings:performInitialUpdateOnItems:](self, "_reloadItemsFromSettings:performInitialUpdateOnItems:", v11, 1);
  }
  -[HFHomeKitAccessorySettingsItemProvider nonHomeKitSettingsDictionary](self, "nonHomeKitSettingsDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count") == 0;

  if (!v18)
  {
    -[HFHomeKitAccessorySettingsItemProvider settingItems](self, "settingItems");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __57__HFHomeKitAccessorySettingsItemProvider_updateSettings___block_invoke_2;
    v22[3] = &unk_1EA726E80;
    v22[4] = self;
    objc_msgSend(v19, "na_each:", v22);

  }
  v20 = *((_BYTE *)v27 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  return v20;
}

void __57__HFHomeKitAccessorySettingsItemProvider_updateSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  __int128 v22;
  uint64_t v23;
  char v24;
  int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v23 = a1;
  objc_msgSend(*(id *)(a1 + 32), "settingItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v7 = v5;
    v24 = 0;
    v8 = *(_QWORD *)v27;
    *(_QWORD *)&v6 = 138412290;
    v22 = v6;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "settingKeyPath", v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "keyPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v12))
        {

        }
        else
        {
          objc_msgSend(v10, "targetSettingKeyPath");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "keyPath");
          v14 = v7;
          v15 = v8;
          v16 = v4;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v13, "isEqualToString:", v17);

          v4 = v16;
          v8 = v15;
          v7 = v14;

          if (!v25)
            continue;
        }
        if (objc_msgSend(v10, "updateSetting:", v3))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v23 + 48) + 8) + 24) = 1;
          HFLogForCategory(0x25uLL);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v22;
            v31 = v3;
            _os_log_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_DEFAULT, "New value has been found for [%@]", buf, 0xCu);
          }

        }
        v24 = 1;
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (!v7)
      {

        if ((v24 & 1) != 0)
          goto LABEL_21;
        goto LABEL_19;
      }
    }
  }

LABEL_19:
  objc_msgSend(*(id *)(v23 + 32), "homeKitKeyPaths");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyPath");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "containsObject:", v20);

  if (v21)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v23 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(v23 + 40), "addObject:", v3);
  }
LABEL_21:

}

void __57__HFHomeKitAccessorySettingsItemProvider_updateSettings___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "nonHomeKitSettingsDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settingKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v6, "setIsControllable:", 1);

}

- (BOOL)shouldUpdateForKeyPaths:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  char v10;
  _QWORD v12[5];
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFHomeKitAccessorySettingsItemProvider homeKitKeyPaths](self, "homeKitKeyPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  HFLogForCategory(0x25uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      -[HFHomeKitAccessorySettingsItemProvider homeKitKeyPaths](self, "homeKitKeyPaths");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Deciding whether we should update [%@], current homeKitKeyPaths [%@]", buf, 0x16u);

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__HFHomeKitAccessorySettingsItemProvider_shouldUpdateForKeyPaths___block_invoke;
    v12[3] = &unk_1EA726EA8;
    v12[4] = self;
    v10 = objc_msgSend(v4, "na_any:", v12);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Should always update for the first callback for [%@]", buf, 0xCu);
    }

    v10 = 1;
  }

  return v10;
}

uint64_t __66__HFHomeKitAccessorySettingsItemProvider_shouldUpdateForKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "homeKitKeyPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (id)sourceItemAccessory
{
  void *v2;
  void *v3;
  void *v4;

  -[HFHomeKitAccessorySettingsItemProvider sourceItem](self, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_fetchSettingsAndReloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
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
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v41 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFHomeKitAccessorySettingsItemProvider moduleSettings](self, "moduleSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  -[HFHomeKitAccessorySettingsItemProvider sourceItemAccessory](self, "sourceItemAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __70__HFHomeKitAccessorySettingsItemProvider__fetchSettingsAndReloadItems__block_invoke;
  v47[3] = &unk_1EA726ED0;
  v48 = v4;
  v9 = v6;
  v49 = v9;
  v10 = v7;
  v50 = v10;
  v11 = v8;
  v51 = v11;
  v12 = v4;
  v42 = v3;
  objc_msgSend(v3, "na_each:", v47);
  if (objc_msgSend(v9, "count"))
  {
    v13 = (void *)objc_msgSend(v9, "copy");
    -[HFHomeKitAccessorySettingsItemProvider setSplitSettingsDictionary:](self, "setSplitSettingsDictionary:", v13);

    HFLogForCategory(0x25uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v9;
      _os_log_debug_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_DEBUG, "Identified Settings that need to be split = [%@]", buf, 0xCu);
    }

  }
  v15 = v9;
  if (objc_msgSend(v10, "count"))
  {
    v16 = (void *)objc_msgSend(v10, "copy");
    -[HFHomeKitAccessorySettingsItemProvider setNonHomeKitSettingsDictionary:](self, "setNonHomeKitSettingsDictionary:", v16);

  }
  v17 = (void *)objc_msgSend(v12, "copy");
  -[HFHomeKitAccessorySettingsItemProvider setAllKeyPaths:](self, "setAllKeyPaths:", v17);

  v18 = (void *)objc_msgSend(v11, "copy");
  -[HFHomeKitAccessorySettingsItemProvider setHomeKitKeyPaths:](self, "setHomeKitKeyPaths:", v18);

  v19 = (void *)MEMORY[0x1E0C99DE8];
  -[HFHomeKitAccessorySettingsItemProvider settingItems](self, "settingItems");
  v20 = v12;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v22 = v10;
  v40 = v10;
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "arrayWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v20;
  -[HFHomeKitAccessorySettingsItemProvider _generateAccessorySettingItemForSettings:keyPaths:](self, "_generateAccessorySettingItemForSettings:keyPaths:", v22, v20);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObjectsFromArray:", v39);
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "accessorySettingsDataSource");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "uniqueIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingsItemProvider accessoryIdentifier](self, "accessoryIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hf_defaultSettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:", v28, v29, v11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFHomeKitAccessorySettingsItemProvider _generateAccessorySettingItemForSettings:homeKitSettings:keyPaths:](self, "_generateAccessorySettingItemForSettings:homeKitSettings:keyPaths:", v15, v30, v25);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "na_safeAddObjectsFromArray:", v30);
  objc_msgSend(v24, "na_safeAddObjectsFromArray:", v31);
  -[HFHomeKitAccessorySettingsItemProvider _reloadItemsFromSettings:performInitialUpdateOnItems:](self, "_reloadItemsFromSettings:performInitialUpdateOnItems:", v24, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __70__HFHomeKitAccessorySettingsItemProvider__fetchSettingsAndReloadItems__block_invoke_9;
  v44[3] = &unk_1EA726EF8;
  v44[4] = self;
  v45 = v11;
  v33 = v41;
  v46 = v33;
  v34 = v11;
  v35 = (id)objc_msgSend(v32, "addCompletionBlock:", v44);
  v36 = v46;
  v37 = v33;

  return v37;
}

void __70__HFHomeKitAccessorySettingsItemProvider__fetchSettingsAndReloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObjectsFromArray:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", HFHomeKitSettingTargetKeyPathKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", HFNonHomeKitSettingKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(v8, "isEqualToString:", v11) & 1) == 0)
  {
    v10 = *(void **)(a1 + 40);
    goto LABEL_8;
  }
  if (v9 && objc_msgSend(v9, "BOOLValue"))
  {
    v10 = *(void **)(a1 + 48);
LABEL_8:
    objc_msgSend(v10, "setObject:forKey:", v7, v11);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v11);
LABEL_9:

}

void __70__HFHomeKitAccessorySettingsItemProvider__fetchSettingsAndReloadItems__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setSettingsAlreadyFetched:", 1);
  objc_msgSend(*(id *)(a1 + 32), "_subscribeToAccessorySettings:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "finishWithResult:error:", v7, v6);

}

- (id)_reloadItemsFromSettings:(id)a3 performInitialUpdateOnItems:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  BOOL v15;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_3;
  v13[3] = &unk_1EA726FC8;
  objc_copyWeak(&v14, &location);
  v15 = a4;
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v6, &__block_literal_global_3, &__block_literal_global_15, 0, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_18;
  v11[3] = &unk_1EA726E30;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v8, "flatMap:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v9;
}

id __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_opt_class();
  v6 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v5)
    objc_msgSend(v5, "keyPath");
  else
    objc_msgSend(v8, "settingKeyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "settingKeyPath");
}

id __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  HFHomeKitAccessorySettingItem *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  v5 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_opt_class();
  v8 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v7)
  {
    objc_msgSend(WeakRetained, "moduleSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_4;
    v49[3] = &unk_1EA726FA0;
    v50 = v7;
    objc_msgSend(v11, "na_filter:", v49);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  HFLogForCategory(0x25uLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v52 = v7;
    v53 = 2112;
    v54 = v10;
    _os_log_debug_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_DEBUG, "HMImmutableSetting = [%@] HFHomeKitAccessorySettingItem = [%@]", buf, 0x16u);
  }

  if (v7 && objc_msgSend(v12, "count"))
  {
    v48 = WeakRetained;
    v44 = v10;
    v45 = a1;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v16;
    objc_msgSend(v16, "objectForKeyedSubscript:", HFLocalizedSettingTitleKey);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      _HFLocalizedStringWithDefaultValue(v17, 0, 0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        _HFLocalizedStringWithDefaultValue(v18, 0, 0);
        v19 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "accessorySettingsDataSource");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keyPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "hf_localizedTitleForKeyPath:", v24);
      v19 = objc_claimAutoreleasedReturnValue();

    }
    v40 = (void *)v19;
    v41 = v18;
    v25 = objc_msgSend(v48, "settingsAlreadyFetched");
    v39 = [HFHomeKitAccessorySettingItem alloc];
    objc_msgSend(v48, "sourceItem");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "settingsController");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "sourceItemAccessory");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "home");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "uniqueIdentifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "accessoryIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v12;
    objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "usageOptions");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v25)
    {
      v33 = v40;
      v34 = -[HFHomeKitAccessorySettingItem initWithSetting:sourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:](v39, "initWithSetting:sourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:", v8, v47, v40, v46, v28, v29, v30, v31);
    }
    else
    {
      v33 = v40;
      v34 = -[HFHomeKitAccessorySettingItem initWithDefaultSetting:sourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:](v39, "initWithDefaultSetting:sourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:", v8, v47, v40, v46, v28, v29, v30, v31);
    }
    v21 = (void *)v34;

    WeakRetained = v48;
    objc_msgSend(v48, "allKeyPaths");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyPath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setDisplayIndex:", objc_msgSend(v35, "indexOfObject:", v36));

    v10 = v44;
    a1 = v45;
    v12 = v43;
  }
  else if (v10)
  {
    v20 = v10;
    v21 = v8;
  }
  else
  {
    v21 = 0;
  }
  if (*(_BYTE *)(a1 + 40))
    v37 = (id)objc_msgSend(v21, "updateWithOptions:", MEMORY[0x1E0C9AA70]);

  return v21;
}

uint64_t __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

id __95__HFHomeKitAccessorySettingsItemProvider__reloadItemsFromSettings_performInitialUpdateOnItems___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "settingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "settingItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  HFLogForCategory(0x25uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "settingItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v10;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Assembled settingItems = [%@], results = [%@]", (uint8_t *)&v13, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_subscribeToAccessorySettings:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x25uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFHomeKitAccessorySettingsItemProvider accessoryIdentifier](self, "accessoryIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Now subscribing to setting accessoryUUID [%@] - keyPaths [%@]", buf, 0x16u);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessorySettingsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingsItemProvider sourceItemAccessory](self, "sourceItemAccessory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingsItemProvider accessoryIdentifier](self, "accessoryIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__HFHomeKitAccessorySettingsItemProvider__subscribeToAccessorySettings___block_invoke;
  v14[3] = &unk_1EA726968;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v8, "hf_subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v11, v12, v13, 0, v14);

}

void __72__HFHomeKitAccessorySettingsItemProvider__subscribeToAccessorySettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x25uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Error subscribing to keypaths [%@] Error = %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (id)_generateAccessorySettingItemForSettings:(id)a3 homeKitSettings:(id)a4 keyPaths:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HFHomeKitAccessorySettingItem *v32;
  HFHomeKitAccessorySettingItem *v33;
  NSObject *v34;
  void *v35;
  id obj;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  HFHomeKitAccessorySettingItem *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  HFHomeKitAccessorySettingItem *v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  uint64_t v69;
  void *v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v7 = a4;
  v44 = a5;
  v43 = (void *)objc_opt_new();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v7;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v60;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v60 != v38)
          objc_enumerationMutation(obj);
        v41 = v8;
        v54 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v8);
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v9 = v39;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v56;
          v45 = *(_QWORD *)v56;
          v46 = v9;
          do
          {
            v13 = 0;
            v47 = v11;
            do
            {
              if (*(_QWORD *)v56 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v13);
              objc_msgSend(v9, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "objectForKeyedSubscript:", HFHomeKitSettingTargetKeyPathKey);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "keyPath");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "isEqualToString:", v17);

              if (v18)
              {
                objc_msgSend(v15, "objectForKeyedSubscript:", HFLocalizedSettingTitleKey);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = v19;
                v52 = v16;
                v53 = v15;
                if (v19)
                {
                  v21 = v19;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFAccessorySettingsGroupTitle-%@"), v14);
                  v21 = (id)objc_claimAutoreleasedReturnValue();
                }
                v22 = v21;
                v48 = v14;
                v49 = v21;

                _HFLocalizedStringWithDefaultValue(v22, 0, 0);
                v23 = objc_claimAutoreleasedReturnValue();
                v50 = [HFHomeKitAccessorySettingItem alloc];
                -[HFHomeKitAccessorySettingsItemProvider sourceItem](self, "sourceItem");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[HFHomeKitAccessorySettingsItemProvider settingsController](self, "settingsController");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[HFHomeKitAccessorySettingsItemProvider sourceItemAccessory](self, "sourceItemAccessory");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "home");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "uniqueIdentifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[HFHomeKitAccessorySettingsItemProvider accessoryIdentifier](self, "accessoryIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = v14;
                v70 = v53;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[HFHomeKitAccessorySettingsItemProvider usageOptions](self, "usageOptions");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = v50;
                v51 = (void *)v23;
                v33 = -[HFHomeKitAccessorySettingItem initWithSetting:sourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:](v32, "initWithSetting:sourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:", v54, v24, v23, v25, v28, v29, v30, v31);

                HFLogForCategory(0x25uLL);
                v34 = objc_claimAutoreleasedReturnValue();
                v16 = v52;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412802;
                  v64 = v33;
                  v65 = 2112;
                  v66 = v48;
                  v67 = 2112;
                  v68 = v52;
                  _os_log_debug_impl(&dword_1DD34E000, v34, OS_LOG_TYPE_DEBUG, "SplitSetting: Generated HFHomeKitAccessorySettingItem [%@] for unique keypath %@ having targetKeyPath %@", buf, 0x20u);
                }

                -[HFHomeKitAccessorySettingItem setDisplayIndex:](v33, "setDisplayIndex:", objc_msgSend(v44, "indexOfObject:", v48));
                objc_msgSend(v43, "addObject:", v33);

                v12 = v45;
                v9 = v46;
                v11 = v47;
                v15 = v53;
              }

              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v55, v71, 16);
          }
          while (v11);
        }

        v8 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    }
    while (v40);
  }

  v35 = (void *)objc_msgSend(v43, "copy");
  return v35;
}

- (id)_generateAccessorySettingItemForSettings:(id)a3 keyPaths:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  HFHomeKitAccessorySettingItem *v22;
  HFHomeKitAccessorySettingItem *v23;
  NSObject *v24;
  void *v25;
  uint64_t v27;
  void *v29;
  id v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  HFHomeKitAccessorySettingItem *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  HFHomeKitAccessorySettingItem *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v30 = a4;
  v29 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v5;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v31)
  {
    v27 = *(_QWORD *)v40;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v6);
        objc_msgSend(obj, "objectForKeyedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", HFLocalizedSettingTitleKey);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        v35 = v7;
        v33 = v6;
        if (v9)
        {
          v11 = v9;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HFAccessorySettingsGroupTitle-%@"), v7);
          v11 = (id)objc_claimAutoreleasedReturnValue();
        }
        v12 = v11;
        v36 = v11;

        _HFLocalizedStringWithDefaultValue(v12, 0, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        v37 = [HFHomeKitAccessorySettingItem alloc];
        -[HFHomeKitAccessorySettingsItemProvider sourceItem](self, "sourceItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFHomeKitAccessorySettingsItemProvider settingsController](self, "settingsController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFHomeKitAccessorySettingsItemProvider sourceItemAccessory](self, "sourceItemAccessory");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "home");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "uniqueIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFHomeKitAccessorySettingsItemProvider accessoryIdentifier](self, "accessoryIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = v35;
        v48 = v8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
        v34 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFHomeKitAccessorySettingsItemProvider usageOptions](self, "usageOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v37;
        v38 = (void *)v13;
        v23 = -[HFHomeKitAccessorySettingItem initWithSourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:](v22, "initWithSourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:", v14, v13, v15, v18, v19, v20, v21);

        HFLogForCategory(0x25uLL);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v23;
          v45 = 2112;
          v46 = v35;
          _os_log_debug_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEBUG, "Non-HomeKit Setting: Generated HFHomeKitAccessorySettingItem [%@] for unique keypath %@", buf, 0x16u);
        }

        -[HFHomeKitAccessorySettingItem setDisplayIndex:](v23, "setDisplayIndex:", objc_msgSend(v30, "indexOfObject:", v35));
        objc_msgSend(v29, "addObject:", v23);

        v6 = v33 + 1;
      }
      while (v31 != v33 + 1);
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v31);
  }

  v25 = (void *)objc_msgSend(v29, "copy");
  return v25;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_usageOptions, a3);
}

- (NSArray)moduleSettings
{
  return self->_moduleSettings;
}

- (void)setModuleSettings:(id)a3
{
  objc_storeStrong((id *)&self->_moduleSettings, a3);
}

- (NSString)groupKeyPath
{
  return self->_groupKeyPath;
}

- (void)setGroupKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (NSMutableSet)settingItems
{
  return self->_settingItems;
}

- (void)setSettingItems:(id)a3
{
  objc_storeStrong((id *)&self->_settingItems, a3);
}

- (HMHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsController, a3);
}

- (HFServiceLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (NSArray)allKeyPaths
{
  return self->_allKeyPaths;
}

- (void)setAllKeyPaths:(id)a3
{
  objc_storeStrong((id *)&self->_allKeyPaths, a3);
}

- (NSArray)homeKitKeyPaths
{
  return self->_homeKitKeyPaths;
}

- (void)setHomeKitKeyPaths:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitKeyPaths, a3);
}

- (NSDictionary)splitSettingsDictionary
{
  return self->_splitSettingsDictionary;
}

- (void)setSplitSettingsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_splitSettingsDictionary, a3);
}

- (NSDictionary)nonHomeKitSettingsDictionary
{
  return self->_nonHomeKitSettingsDictionary;
}

- (void)setNonHomeKitSettingsDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_nonHomeKitSettingsDictionary, a3);
}

- (BOOL)settingsAlreadyFetched
{
  return self->_settingsAlreadyFetched;
}

- (void)setSettingsAlreadyFetched:(BOOL)a3
{
  self->_settingsAlreadyFetched = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonHomeKitSettingsDictionary, 0);
  objc_storeStrong((id *)&self->_splitSettingsDictionary, 0);
  objc_storeStrong((id *)&self->_homeKitKeyPaths, 0);
  objc_storeStrong((id *)&self->_allKeyPaths, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_settingItems, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_groupKeyPath, 0);
  objc_storeStrong((id *)&self->_moduleSettings, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
}

@end
