@implementation HUAccessorySettingsUtilities

+ (id)generateModulesFromSettingsDictionary:(id)a3 itemUpdater:(id)a4 home:(id)a5 sourceItem:(id)a6 usageOptions:(id)a7 settingsController:(id)a8
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  void *v28;
  HUHomeKitAccessorySettingsItemModule *v29;
  id v30;
  id v31;
  void *v32;
  NSString *v33;
  void *v34;
  NSObject *v35;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  HUHomeKitAccessorySettingsItemModule *v48;
  __int16 v49;
  uint64_t v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v41 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a8;
  v40 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D31120], "hf_accessorySettingsDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessories");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "anyObject");
  v17 = objc_claimAutoreleasedReturnValue();

  v18 = (void *)v17;
  if (v15)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v37 = v15;
    obj = v15;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v44;
      v38 = *(_QWORD *)v44;
      v39 = a1;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(obj);
          v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
          if ((objc_msgSend(a1, "_shouldSkipModuleCreationForGroupKeyPath:accessory:home:", v23, v18, v12) & 1) == 0)
          {
            v24 = v18;
            if ((objc_msgSend(a1, "_shouldCollapseModuleForGroupKeyPath:", v23) & 1) != 0)
            {
              v25 = 1;
              v26 = obj;
            }
            else
            {
              v26 = obj;
              objc_msgSend(obj, "objectForKeyedSubscript:", v23);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "objectForKeyedSubscript:", *MEMORY[0x1E0D30518]);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = v28 != 0;

            }
            v29 = -[HUHomeKitAccessorySettingsItemModule initWithSettingsController:itemUpdater:home:sourceItem:settingGroupKeyPath:isCollapsed:]([HUHomeKitAccessorySettingsItemModule alloc], "initWithSettingsController:itemUpdater:home:sourceItem:settingGroupKeyPath:isCollapsed:", v14, v41, v12, v13, v23, v25);
            objc_msgSend(v26, "objectForKeyedSubscript:", v23);
            v30 = v14;
            v31 = v13;
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0D301A0]);
            v33 = (NSString *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              v34 = (void *)objc_msgSend(objc_alloc(NSClassFromString(v33)), "initWithSettingsController:sourceItem:home:", v30, v31, v12);
              -[HUHomeKitAccessorySettingsItemModule setAccessorySettingsManager:](v29, "setAccessorySettingsManager:", v34);

            }
            HFLogForCategory();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v48 = v29;
              v49 = 2112;
              v50 = v23;
              _os_log_impl(&dword_1B8E1E000, v35, OS_LOG_TYPE_DEFAULT, "Created settingsModule [%@] for groupKeyPath [%@]", buf, 0x16u);
            }

            objc_msgSend(v40, "na_safeAddObject:", v29);
            v13 = v31;
            v14 = v30;
            v21 = v38;
            a1 = v39;
            v18 = v24;
          }
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v20);
    }

    v15 = v37;
  }

  return v40;
}

+ (BOOL)_shouldSkipModuleCreationForGroupKeyPath:(id)a3 accessory:(id)a4 home:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v8, "hf_categoryOrPrimaryServiceType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB7AA8]);

  if (v12)
  {
    objc_msgSend(v10, "addObject:", *MEMORY[0x1E0D301B0]);
  }
  else
  {
    v23[0] = *MEMORY[0x1E0D30978];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v13);

  }
  if (_os_feature_enabled_impl() && objc_msgSend(v8, "supportsUserMediaSettings"))
    objc_msgSend(v10, "addObject:", *MEMORY[0x1E0D305F0]);
  v14 = (uint64_t *)MEMORY[0x1E0D30590];
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D30590]))
  {
    objc_msgSend(v9, "hf_allCameraProfilesWithDoorbellService");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (!v16)
    {
      v22 = *v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v17);

    }
  }
  if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
  {
    v21 = *MEMORY[0x1E0D30478];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v18);

  }
  v19 = objc_msgSend(v10, "containsObject:", v7);

  return v19;
}

+ (BOOL)_shouldCollapseModuleForGroupKeyPath:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D301B0]) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D30F28]);

  return v4;
}

@end
