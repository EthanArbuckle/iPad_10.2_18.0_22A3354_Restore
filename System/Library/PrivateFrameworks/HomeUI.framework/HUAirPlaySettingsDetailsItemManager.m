@implementation HUAirPlaySettingsDetailsItemManager

- (HUAirPlaySettingsDetailsItemManager)initWithDelegate:(id)a3 module:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HUAirPlaySettingsDetailsItemManager *v13;
  uint64_t v14;
  HMAccessorySettingsController *settingsController;
  uint64_t v16;
  NSString *settingGroupKeyPath;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "accessorySettingsItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v11, "copy");
  v22.receiver = self;
  v22.super_class = (Class)HUAirPlaySettingsDetailsItemManager;
  v13 = -[HFItemManager initWithDelegate:sourceItem:](&v22, sel_initWithDelegate_sourceItem_, v8, v12);

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
    v23[0] = *MEMORY[0x1E0D301A8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAirPlaySettingsDetailsItemManager _subscribeToAccessorySettings:](v13, "_subscribeToAccessorySettings:", v20);

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
  v16[2] = __67__HUAirPlaySettingsDetailsItemManager_updateSettingItem_withValue___block_invoke;
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

uint64_t __67__HUAirPlaySettingsDetailsItemManager_updateSettingItem_withValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
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
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  HUHomeKitAccessorySettingsItemModule *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  HUHomeKitAccessorySettingsItemModule *v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31120], "hf_groupKeyPaths");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  v33 = v5;
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    v9 = (_QWORD *)MEMORY[0x1E0D301B0];
    v31 = *(_QWORD *)v38;
    v32 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (!-[HUAirPlaySettingsDetailsItemManager _shouldHideModuleHavingGroupKeyPath:](self, "_shouldHideModuleHavingGroupKeyPath:", v11))
        {
          objc_msgSend(0, "settingGroupKeyPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", *v9);

          if (v13)
          {
            -[HUAirPlaySettingsDetailsItemManager module](self, "module");
            v14 = (HUHomeKitAccessorySettingsItemModule *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v34 = [HUHomeKitAccessorySettingsItemModule alloc];
            -[HUAirPlaySettingsDetailsItemManager settingsController](self, "settingsController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUAirPlaySettingsDetailsItemManager module](self, "module");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "home");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUAirPlaySettingsDetailsItemManager module](self, "module");
            v18 = v9;
            v19 = v7;
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "sourceItem");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[HUHomeKitAccessorySettingsItemModule initWithSettingsController:itemUpdater:home:sourceItem:settingGroupKeyPath:isCollapsed:](v34, "initWithSettingsController:itemUpdater:home:sourceItem:settingGroupKeyPath:isCollapsed:", v15, self, v17, v21, v11, 0);

            v5 = v33;
            v7 = v19;
            v9 = v18;

            v8 = v31;
            v4 = v32;

          }
          objc_msgSend(v4, "na_safeAddObject:", v14);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v7);
  }
  -[HUAirPlaySettingsDetailsItemManager setHomeKitAccessorySettingsModules:](self, "setHomeKitAccessorySettingsModules:", v4);
  -[HUAirPlaySettingsDetailsItemManager homeKitAccessorySettingsModules](self, "homeKitAccessorySettingsModules");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __64__HUAirPlaySettingsDetailsItemManager__buildItemModulesForHome___block_invoke;
  v35[3] = &unk_1E6F59F78;
  v36 = v29;
  v23 = v29;
  objc_msgSend(v22, "sortedArrayUsingComparator:", v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAirPlaySettingsDetailsItemManager setHomeKitAccessorySettingsModules:](self, "setHomeKitAccessorySettingsModules:", v24);

  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    -[HUAirPlaySettingsDetailsItemManager homeKitAccessorySettingsModules](self, "homeKitAccessorySettingsModules");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v42 = v30;
    v43 = 2112;
    v44 = v28;
    _os_log_debug_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_DEBUG, ". settingsDict = [%@] Generated homeKitAccessorySettingsModules = [%@]", buf, 0x16u);

  }
  v26 = (void *)objc_msgSend(v4, "copy");

  return v26;
}

uint64_t __64__HUAirPlaySettingsDetailsItemManager__buildItemModulesForHome___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[4];
  NSObject *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v55 = (id)objc_opt_new();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("AirPlayMasterSettingSection"));
  -[HUAirPlaySettingsDetailsItemManager module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAirPlaySettingsDetailsItemManager module](self, "module");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessorySettingsItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v67[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setItems:", v10);

  }
  else
  {
    objc_msgSend(v4, "setItems:", 0);
  }
  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAirPlaySettingsDetailsItemManager settingGroupKeyPath](self, "settingGroupKeyPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = v13;
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D305F8]);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D310F0], "defaultFactory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "formatterForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v16, "attributedStringForObjectValue:withDefaultAttributes:", self, 0);
  v17 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v9;
  v48 = v16;
  v49 = (void *)v14;
  v47 = (void *)v17;
  if (v17)
  {
    objc_msgSend(v4, "setAttributedFooterTitle:", v17);
  }
  else
  {
    objc_msgSend(v16, "stringForObjectValue:", self);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setFooterTitle:", v18);

  }
  v53 = v4;
  objc_msgSend(v55, "na_safeAddObject:", v4);
  objc_opt_class();
  v52 = v5;
  objc_msgSend(v5, "itemProviders");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  objc_opt_class();
  v46 = v23;
  objc_msgSend(v23, "items");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;
  v28 = v27;

  v45 = v28;
  objc_msgSend(v28, "settingValue");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "BOOLValue");

  -[HUAirPlaySettingsDetailsItemManager module](self, "module");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "sourceItem");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "accessories");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "anyObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[HUAirPlaySettingsDetailsItemManager homeKitAccessorySettingsModules](self, "homeKitAccessorySettingsModules");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v37; ++i)
      {
        if (*(_QWORD *)v59 != v38)
          objc_enumerationMutation(v35);
        if (v30)
        {
          v40 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v40, "buildSectionsWithDisplayedItems:", v54);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v56[0] = MEMORY[0x1E0C809B0];
          v56[1] = 3221225472;
          v56[2] = __72__HUAirPlaySettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke;
          v56[3] = &unk_1E6F56038;
          v57 = v34;
          objc_msgSend(v41, "na_filter:", v56);
          v42 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v55, "addObjectsFromArray:", v42);
          HFLogForCategory();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v63 = v42;
            v64 = 2112;
            v65 = v40;
            _os_log_debug_impl(&dword_1B8E1E000, v43, OS_LOG_TYPE_DEBUG, "Built Setting Sections = [%@] for module = [%@]", buf, 0x16u);
          }

        }
        else
        {
          HFLogForCategory();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v63) = 0;
            _os_log_impl(&dword_1B8E1E000, v42, OS_LOG_TYPE_DEFAULT, "Hiding all other sections since airPlayEnabledSettingValue = %{BOOL}d", buf, 8u);
          }
        }

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v37);
  }

  return v55;
}

uint64_t __72__HUAirPlaySettingsDetailsItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D30978]);

  if (v4)
    return objc_msgSend(*(id *)(a1 + 32), "supportsPreferredMediaUser");
  else
    return 1;
}

- (BOOL)_shouldHideModuleHavingGroupKeyPath:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[9];

  v11[8] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D301B0];
  v11[0] = *MEMORY[0x1E0D30F28];
  v11[1] = v3;
  v4 = *MEMORY[0x1E0D30478];
  v11[2] = *MEMORY[0x1E0D30420];
  v11[3] = v4;
  v5 = *MEMORY[0x1E0D30960];
  v11[4] = *MEMORY[0x1E0D30490];
  v11[5] = v5;
  v6 = *MEMORY[0x1E0D305F0];
  v11[6] = *MEMORY[0x1E0D30590];
  v11[7] = v6;
  v7 = (void *)MEMORY[0x1E0C99D20];
  v8 = a3;
  objc_msgSend(v7, "arrayWithObjects:count:", v11, 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "containsObject:", v8);

  return (char)v7;
}

- (void)_subscribeToAccessorySettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUAirPlaySettingsDetailsItemManager module](self, "module");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v10;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Now subscribing to setting accessoryUUID [%@] - keyPaths [%@]", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessorySettingsDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAirPlaySettingsDetailsItemManager module](self, "module");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__HUAirPlaySettingsDetailsItemManager__subscribeToAccessorySettings___block_invoke;
  v18[3] = &unk_1E6F4E2D8;
  v19 = v4;
  v17 = v4;
  objc_msgSend(v12, "hf_subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v15, v16, v17, 0, v18);

}

void __69__HUAirPlaySettingsDetailsItemManager__subscribeToAccessorySettings___block_invoke(uint64_t a1, void *a2)
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
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_ERROR, "Error subscribing to keypaths [%@] Error = %@", (uint8_t *)&v6, 0x16u);
    }

  }
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

- (NSMutableSet)allItemProviders
{
  return self->_allItemProviders;
}

- (void)setAllItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_allItemProviders, a3);
}

- (NSString)settingGroupKeyPath
{
  return self->_settingGroupKeyPath;
}

- (void)setSettingGroupKeyPath:(id)a3
{
  objc_storeStrong((id *)&self->_settingGroupKeyPath, a3);
}

- (NSArray)dependentSettingItems
{
  return self->_dependentSettingItems;
}

- (void)setDependentSettingItems:(id)a3
{
  objc_storeStrong((id *)&self->_dependentSettingItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentSettingItems, 0);
  objc_storeStrong((id *)&self->_settingGroupKeyPath, 0);
  objc_storeStrong((id *)&self->_allItemProviders, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeKitAccessorySettingsModules, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

@end
