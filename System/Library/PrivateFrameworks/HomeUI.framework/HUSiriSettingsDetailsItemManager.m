@implementation HUSiriSettingsDetailsItemManager

- (HUSiriSettingsDetailsItemManager)initWithDelegate:(id)a3 module:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HUSiriSettingsDetailsItemManager *v13;
  uint64_t v14;
  HMAccessorySettingsController *settingsController;
  uint64_t v16;
  NSString *settingGroupKeyPath;
  void *v18;
  void *v19;
  objc_super v21;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "accessorySettingsItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "copy");
  v21.receiver = self;
  v21.super_class = (Class)HUSiriSettingsDetailsItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v21, sel_initWithDelegate_sourceItem_, v8, v12);

  if (v13)
  {
    objc_msgSend(v7, "settingsController");
    v14 = objc_claimAutoreleasedReturnValue();
    settingsController = v13->_settingsController;
    v13->_settingsController = (HMAccessorySettingsController *)v14;

    objc_msgSend(v7, "settingGroupKeyPath");
    v16 = objc_claimAutoreleasedReturnValue();
    settingGroupKeyPath = v13->_settingGroupKeyPath;
    v13->_settingGroupKeyPath = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accessorySettingsDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:", v13);

    objc_storeStrong((id *)&v13->_module, a4);
  }

  return v13;
}

- (id)updateSettingItem:(id)a3 withValue:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  objc_msgSend(v5, "updateValue:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __64__HUSiriSettingsDetailsItemManager_updateSettingItem_withValue___block_invoke;
  v16[3] = &unk_1E6F589D0;
  v9 = v7;
  v17 = v9;
  v18 = v6;
  v19 = v5;
  v10 = v5;
  v11 = v6;
  v12 = (id)objc_msgSend(v8, "addCompletionBlock:", v16);
  v13 = v19;
  v14 = v9;

  return v14;
}

uint64_t __64__HUSiriSettingsDetailsItemManager_updateSettingItem_withValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (a3)
    return objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessorySettingsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "settingKeyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "accessoryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSettingValue:forKeyPath:accessoryIdentifier:", v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (id)_buildItemModulesForHome:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  HUHomeKitAccessorySettingsItemModule *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HUHomeKitAccessorySettingsItemModule *v16;
  HUHomeKitAccessorySettingsItemModule *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id obj;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31120], "hf_groupKeyPaths");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    v27 = v4;
    do
    {
      v8 = 0;
      v28 = v6;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v8);
        if (!-[HUSiriSettingsDetailsItemManager _shouldSkipModuleCreationForGroupKeyPath:](self, "_shouldSkipModuleCreationForGroupKeyPath:", v9))
        {
          v10 = [HUHomeKitAccessorySettingsItemModule alloc];
          -[HUSiriSettingsDetailsItemManager settingsController](self, "settingsController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUSiriSettingsDetailsItemManager module](self, "module");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "home");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUSiriSettingsDetailsItemManager module](self, "module");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sourceItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v10;
          v4 = v27;
          v17 = -[HUHomeKitAccessorySettingsItemModule initWithSettingsController:itemUpdater:home:sourceItem:settingGroupKeyPath:isCollapsed:](v16, "initWithSettingsController:itemUpdater:home:sourceItem:settingGroupKeyPath:isCollapsed:", v11, self, v13, v15, v9, 0);

          v6 = v28;
          objc_msgSend(v27, "na_safeAddObject:", v17);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v6);
  }
  -[HUSiriSettingsDetailsItemManager setHomeKitAccessorySettingsModules:](self, "setHomeKitAccessorySettingsModules:", v4);
  -[HUSiriSettingsDetailsItemManager homeKitAccessorySettingsModules](self, "homeKitAccessorySettingsModules");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __61__HUSiriSettingsDetailsItemManager__buildItemModulesForHome___block_invoke;
  v30[3] = &unk_1E6F59F78;
  v31 = v25;
  v19 = v25;
  objc_msgSend(v18, "sortedArrayUsingComparator:", v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSiriSettingsDetailsItemManager setHomeKitAccessorySettingsModules:](self, "setHomeKitAccessorySettingsModules:", v20);

  HFLogForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    -[HUSiriSettingsDetailsItemManager homeKitAccessorySettingsModules](self, "homeKitAccessorySettingsModules");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v26;
    v38 = 2112;
    v39 = v24;
    _os_log_debug_impl(&dword_1B8E1E000, v21, OS_LOG_TYPE_DEBUG, ". settingsDict = [%@] Generated homeKitAccessorySettingsModules = [%@]", buf, 0x16u);

  }
  v22 = (void *)objc_msgSend(v4, "copy");

  return v22;
}

uint64_t __61__HUSiriSettingsDetailsItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "settingGroupKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "settingGroupKeyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 > v11)
    return 1;
  else
    return -1;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
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
  NSObject *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSiriSettingsDetailsItemManager settingGroupKeyPath](self, "settingGroupKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30518]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)MEMORY[0x1E0D30F20];
  v27 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D30F20]);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D305E8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
    objc_msgSend(v12, "addObjectsFromArray:", v11);
  v14 = objc_alloc(MEMORY[0x1E0D31428]);
  -[HUSiriSettingsDetailsItemManager settingsController](self, "settingsController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSiriSettingsDetailsItemManager module](self, "module");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sourceItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSiriSettingsDetailsItemManager settingGroupKeyPath](self, "settingGroupKeyPath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v14, "initWithSettingsController:sourceItem:settingGroupKeyPath:moduleSettings:usageOptions:", v15, v17, v18, v13, 0);
  -[HUSiriSettingsDetailsItemManager setSiriSettingsItemProvider:](self, "setSiriSettingsItemProvider:", v19);

  HFLogForCategory();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    -[HUSiriSettingsDetailsItemManager siriSettingsItemProvider](self, "siriSettingsItemProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSiriSettingsDetailsItemManager settingGroupKeyPath](self, "settingGroupKeyPath");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v30 = v24;
    v31 = 2112;
    v32 = v25;
    _os_log_debug_impl(&dword_1B8E1E000, v20, OS_LOG_TYPE_DEBUG, "Built siriSettingsItemProvider [%@] for settingGroupKeyPath = [%@]", buf, 0x16u);

  }
  -[HUSiriSettingsDetailsItemManager siriSettingsItemProvider](self, "siriSettingsItemProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
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
  void *v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUSiriSettingsDetailsItemManager siriSettingsItemProvider](self, "siriSettingsItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setByIntersectingWithSet:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("SiriSettingsTopSection"));
  objc_msgSend(v7, "na_filter:", &__block_literal_global_282);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v9;
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v10);

  objc_msgSend(v8, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_13_3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setItems:", v12);

  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSiriSettingsDetailsItemManager settingGroupKeyPath](self, "settingGroupKeyPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D305F8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0D310F0], "defaultFactory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "formatterForKey:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v18, "attributedStringForObjectValue:withDefaultAttributes:", self, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v8, "setAttributedFooterTitle:", v19);
  }
  else
  {
    objc_msgSend(v18, "stringForObjectValue:", self);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFooterTitle:", v20);

  }
  -[HUSiriSettingsDetailsItemManager siriSettingsItemProvider](self, "siriSettingsItemProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "items");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "na_setByIntersectingWithSet:", v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("SiriSettingsBottomSection"));
  objc_msgSend(v23, "na_filter:", &__block_literal_global_17_5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setItems:", v26);

  objc_msgSend(v24, "items");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_18_3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setItems:", v28);

  v32[0] = v8;
  v32[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

uint64_t __69__HUSiriSettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "settingKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D301B8]) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v5, "settingKeyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D30FD0]);

  }
  return v7;
}

uint64_t __69__HUSiriSettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;

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

  v12 = objc_msgSend(v8, "displayIndex");
  if (v12 > objc_msgSend(v11, "displayIndex"))
    v13 = 1;
  else
    v13 = -1;

  return v13;
}

uint64_t __69__HUSiriSettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  objc_msgSend(v5, "settingKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D30798]) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "settingKeyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D301B8]) & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v5, "settingKeyPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D30FD0]) ^ 1;

    }
  }

  return v7;
}

uint64_t __69__HUSiriSettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;

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

  v12 = objc_msgSend(v8, "displayIndex");
  if (v12 > objc_msgSend(v11, "displayIndex"))
    v13 = 1;
  else
    v13 = -1;

  return v13;
}

- (BOOL)_shouldSkipModuleCreationForGroupKeyPath:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = (_QWORD *)MEMORY[0x1E0D30478];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D30478])
    && (!objc_msgSend(v4, "isEqualToString:", *v5)
     || !objc_msgSend(MEMORY[0x1E0D319D0], "isAMac")))
  {
    goto LABEL_10;
  }
  v6 = (_QWORD *)MEMORY[0x1E0D30490];
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D30490]))
  {
    if (!objc_msgSend(v4, "isEqualToString:", *v6)
      || !objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    {
      goto LABEL_10;
    }
  }
  v7 = (_QWORD *)MEMORY[0x1E0D30590];
  if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D30590]))
  {
    v11 = 1;
    goto LABEL_12;
  }
  if (objc_msgSend(v4, "isEqualToString:", *v7))
  {
    -[HUSiriSettingsDetailsItemManager module](self, "module");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_allCameraProfilesWithDoorbellService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") == 0;

  }
  else
  {
LABEL_10:
    v11 = 0;
  }
LABEL_12:

  return v11;
}

- (HUHomeKitAccessorySettingsItemModule)module
{
  return self->_module;
}

- (void)setModule:(id)a3
{
  objc_storeStrong((id *)&self->_module, a3);
}

- (NSArray)homeKitAccessorySettingsModules
{
  return self->_homeKitAccessorySettingsModules;
}

- (void)setHomeKitAccessorySettingsModules:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsModules, a3);
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsController, a3);
}

- (HFHomeKitAccessorySettingsItemProvider)siriSettingsItemProvider
{
  return self->_siriSettingsItemProvider;
}

- (void)setSiriSettingsItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_siriSettingsItemProvider, a3);
}

- (NSString)settingGroupKeyPath
{
  return self->_settingGroupKeyPath;
}

- (void)setSettingGroupKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_settingGroupKeyPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingGroupKeyPath, 0);
  objc_storeStrong((id *)&self->_siriSettingsItemProvider, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsModules, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

@end
