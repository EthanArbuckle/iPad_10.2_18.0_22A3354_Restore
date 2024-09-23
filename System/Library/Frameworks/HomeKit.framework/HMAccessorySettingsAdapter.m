@implementation HMAccessorySettingsAdapter

- (HMAccessorySettingsAdapter)initWithHomeIdentifier:(id)a3 dataSource:(id)a4 controller:(id)a5 workQueue:(id)a6 settingsContainer:(id)a7 containerIdentifier:(id)a8 containerType:(int64_t)a9 settingsControl:(id)a10 context:(id)a11
{
  id v18;
  id v19;
  id v20;
  HMAccessorySettingsAdapter *v21;
  HMAccessorySettingsAdapter *v22;
  HMAccessorySettings *accessorySettings;
  HMAccessorySettingGroup *rootGroup;
  NSArray *tapAssistanceSelections;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v18 = a7;
  v27 = a8;
  v19 = a10;
  v20 = a11;
  v32.receiver = self;
  v32.super_class = (Class)HMAccessorySettingsAdapter;
  v21 = -[HMAccessorySettingsAdapter init](&v32, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_homeIdentifier, a3);
    objc_storeStrong((id *)&v22->_accessoryDataSource, a4);
    objc_storeStrong((id *)&v22->_accessorySettingsController, a5);
    objc_storeStrong((id *)&v22->_workQueue, a6);
    objc_storeWeak((id *)&v22->_settingsContainer, v18);
    objc_storeWeak((id *)&v22->_settingsControl, v19);
    objc_storeStrong((id *)&v22->_accessoryContext, a11);
    accessorySettings = v22->_accessorySettings;
    v22->_accessorySettings = 0;

    rootGroup = v22->_rootGroup;
    v22->_rootGroup = 0;

    tapAssistanceSelections = v22->_tapAssistanceSelections;
    v22->_tapAssistanceSelections = 0;

    objc_storeStrong((id *)&v22->_settingsContainerIdentifier, a8);
    v22->_containerType = a9;
    *(_WORD *)&v22->_didReceiveFirstUpdateEvent = 0;
  }

  return v22;
}

- (void)configureWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMAccessorySettingsAdapter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__HMAccessorySettingsAdapter_configureWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3AB60A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)unconfigure
{
  id v2;

  -[HMAccessorySettingsAdapter accessoryDataSource](self, "accessoryDataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetSubscriptions");

}

- (void)_configureForAccessoryWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMAccessorySettingsAdapter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "languageKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsAdapter homeIdentifier](v10, "homeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsAdapter settingsContainerIdentifier](v10, "settingsContainerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Adapter subscribes to accessory settings, home identifier: %@, accessory identifier: %@, key paths: %@\a", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  -[HMAccessorySettingsAdapter accessoryDataSource](v10, "accessoryDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsAdapter homeIdentifier](v10, "homeIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsAdapter settingsContainerIdentifier](v10, "settingsContainerIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__HMAccessorySettingsAdapter__configureForAccessoryWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E3AB53A8;
  v20[4] = v10;
  v21 = v8;
  v22 = v4;
  v18 = v4;
  v19 = v8;
  objc_msgSend(v15, "subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v16, v17, v19, 0, v20);

}

- (void)_configureForMediaSystemWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HMAccessorySettingsAdapter *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "languageKeyPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsAdapter homeIdentifier](v10, "homeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsAdapter settingsContainerIdentifier](v10, "settingsContainerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v8;
    _os_log_impl(&dword_19B1B0000, v11, OS_LOG_TYPE_INFO, "%{public}@Adapter subscribes to media system settings, home identifier: %@, media system identifier: %@, key paths: %@", buf, 0x2Au);

  }
  objc_autoreleasePoolPop(v9);
  -[HMAccessorySettingsAdapter accessoryDataSource](v10, "accessoryDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsAdapter homeIdentifier](v10, "homeIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsAdapter settingsContainerIdentifier](v10, "settingsContainerIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__HMAccessorySettingsAdapter__configureForMediaSystemWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E3AB53A8;
  v20[4] = v10;
  v21 = v8;
  v22 = v4;
  v18 = v4;
  v19 = v8;
  objc_msgSend(v15, "subscribeToMediaSystemSettingsWithHomeIdentifier:mediaSystemIdentifier:keyPaths:options:completionHandler:", v16, v17, v19, 0, v20);

}

- (id)_transformAccessorySettingToLanguageSetting:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  HMLanguageSetting *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  HMSettingLanguageValue *v16;
  HMLanguageSetting *v17;
  void *v18;
  void *v20;
  void *v21;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    if (v9)
    {
      objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v10, "count") >= 3)
      {
        objc_msgSend(v10, "objectAtIndex:", 0);
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", 1);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndex:", 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        if ((unint64_t)objc_msgSend(v10, "count") >= 5)
        {
          objc_msgSend(v10, "objectAtIndex:", 4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v16 = -[HMSettingLanguageValue initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:]([HMSettingLanguageValue alloc], "initWithInputLanguageCode:outputVoiceLanguageCode:outputVoiceGenderCode:voiceName:", v12, v13, v14, v15);
        v21 = (void *)v12;
        v17 = [HMLanguageSetting alloc];
        objc_msgSend((id)objc_opt_class(), "selectedLanguageSettingKeyPath");
        v20 = (void *)v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[HMLanguageSetting initWithKeyPath:readOnly:languageValue:](v17, "initWithKeyPath:readOnly:languageValue:", v18, 0, v16);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateWithKeyPath:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id);
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  HMAccessorySettingsAdapter *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  const __CFString *v23;
  NSObject *v24;
  id v25;
  void *v26;
  HMAccessorySettingsAdapter *v27;
  NSObject *v28;
  void *v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  void (**v34)(id, id);
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a5;
  if ((objc_msgSend((id)objc_opt_class(), "defaultSettingsContainsKeyPath:", v8) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "languageKeyPaths");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v8);

    if ((v12 & 1) == 0)
    {
      v17 = (void *)MEMORY[0x1A1AC1AAC]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v20;
        v37 = 2112;
        v38 = v8;
        v39 = 2112;
        v40 = v9;
        _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error in adapter updating keypath: %@ value: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v17);
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = CFSTR("Setting is not supported in the adapter");
      v23 = CFSTR("Only Boolean and Number Settings are supported");
      goto LABEL_21;
    }
  }
  if (-[HMAccessorySettingsAdapter containerType](self, "containerType") == 1)
  {
    -[HMAccessorySettingsAdapter settingsContainerIdentifier](self, "settingsContainerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_18;
  }
  else
  {
    if (-[HMAccessorySettingsAdapter containerType](self, "containerType") != 2)
      goto LABEL_18;
    -[HMAccessorySettingsAdapter settingsContainer](self, "settingsContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
    v16 = v15;

    if (v16)
    {
      objc_msgSend(v16, "targetAccessoryIdentifierBySerial");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    if (!v13)
    {
LABEL_18:
      v26 = (void *)MEMORY[0x1A1AC1AAC]();
      v27 = self;
      HMFGetOSLogHandle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v36 = v29;
        v37 = 2112;
        v38 = v8;
        v39 = 2112;
        v40 = v9;
        _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error in updating keypath: %@ value: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v26);
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = CFSTR("Settings container is not supported in the adapter");
      v23 = CFSTR("Only accessory or media system is supported");
LABEL_21:
      objc_msgSend(v21, "hmfErrorWithCode:reason:suggestion:", 3, v22, v23);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v10[2](v10, v25);
      goto LABEL_22;
    }
  }
  -[HMAccessorySettingsAdapter workQueue](self, "workQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HMAccessorySettingsAdapter_updateWithKeyPath_value_completionHandler___block_invoke;
  block[3] = &unk_1E3AB52E0;
  block[4] = self;
  v31 = v8;
  v32 = v9;
  v33 = v13;
  v34 = v10;
  v25 = v13;
  dispatch_async(v24, block);

LABEL_22:
}

- (void)updateSettingsReflected:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HMAccessorySettingsAdapter workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HMAccessorySettingsAdapter_updateSettingsReflected___block_invoke;
  v6[3] = &unk_1E3AB15A8;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (id)createKeyPathArrayWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessorySettingsAdapter *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    v10 = v5;
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v9;
      v14 = 2112;
      v15 = v4;
      v16 = 2048;
      v17 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@The keypath %@ needs at least 2 keys, but only has %lu component.", (uint8_t *)&v12, 0x20u);

    }
    objc_autoreleasePoolPop(v6);
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)groupKeyArrayFromKeyPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HMAccessorySettingsAdapter createKeyPathArrayWithKeyPath:](self, "createKeyPathArrayWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  if ((objc_msgSend(v4, "hmf_isEmpty") & 1) != 0)
  {
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v4, "removeLastObject");
    v5 = v4;
  }

  return v5;
}

- (id)settingKeyFromKeyPath:(id)a3
{
  void *v3;
  void *v4;

  -[HMAccessorySettingsAdapter createKeyPathArrayWithKeyPath:](self, "createKeyPathArrayWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hmf_isEmpty") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)appendKeyPath:(id)a3 withNextKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, a4);
}

- (id)findOrAddAccessorySettingGroupWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessorySettingGroup *v7;
  void *v8;
  HMAccessorySettingGroup *v9;
  HMAccessorySettings *v10;
  void *v11;
  void *v12;
  void *v13;
  HMAccessorySettings *v14;
  void *v15;
  HMAccessorySettingsAdapter *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  HMAccessorySettingsAdapter *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  HMAccessorySettingsAdapter *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t i;
  uint64_t v41;
  uint64_t v42;
  HMAccessorySettingGroup *v43;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessorySettingsAdapter rootGroup](self, "rootGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[HMAccessorySettingsAdapter accessorySettings](self, "accessorySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [HMAccessorySettingGroup alloc];
      objc_msgSend(v4, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[HMAccessorySettingGroup initWithKeyPath:](v7, "initWithKeyPath:", v8);
      -[HMAccessorySettingsAdapter setRootGroup:](self, "setRootGroup:", v9);

      v10 = [HMAccessorySettings alloc];
      -[HMAccessorySettingsAdapter settingsContainer](self, "settingsContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter settingsControl](self, "settingsControl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter rootGroup](self, "rootGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMAccessorySettings initWithSettingsContainer:settingsControl:rootGroup:](v10, "initWithSettingsContainer:settingsControl:rootGroup:", v11, v12, v13);
      -[HMAccessorySettingsAdapter setAccessorySettings:](self, "setAccessorySettings:", v14);

      v15 = (void *)MEMORY[0x1A1AC1AAC]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v52 = v18;
        _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Creating RootGroup and AccessorySettings for the adapter", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v15);
    }
  }
  -[HMAccessorySettingsAdapter rootGroup](self, "rootGroup");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[HMAccessorySettingsAdapter accessorySettings](self, "accessorySettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[HMAccessorySettingsAdapter rootGroup](self, "rootGroup");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "keyPath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "hmf_isEmpty"))
      {
        v24 = (void *)MEMORY[0x1A1AC1AAC]();
        v25 = self;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v52 = v27;
          _os_log_impl(&dword_19B1B0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Group key array cannot be empty.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v24);
      }
      else
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v23, "isEqual:", v33);

        if (v34)
        {
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v45 = v4;
          v35 = v4;
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v47;
            v39 = 1;
            do
            {
              for (i = 0; i != v37; ++i)
              {
                if (*(_QWORD *)v47 != v38)
                  objc_enumerationMutation(v35);
                if ((v39 & 1) == 0)
                {
                  v41 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
                  -[HMAccessorySettingsAdapter appendKeyPath:withNextKey:](self, "appendKeyPath:withNextKey:", v23, v41);
                  v42 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v22, "accessorySettingGroupWithKeyPath:", v42);
                  v43 = (HMAccessorySettingGroup *)objc_claimAutoreleasedReturnValue();
                  if (!v43)
                  {
                    v43 = -[HMAccessorySettingGroup initWithKeyPath:]([HMAccessorySettingGroup alloc], "initWithKeyPath:", v41);
                    objc_msgSend(v22, "addGroup:", v43);
                  }

                  v22 = v43;
                  v23 = (void *)v42;
                }
                v39 = 0;
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
              v39 = 0;
            }
            while (v37);
          }

          v22 = v22;
          v32 = v22;
          v4 = v45;
          goto LABEL_30;
        }
      }
      v32 = 0;
LABEL_30:

      goto LABEL_31;
    }
  }
  v28 = (void *)MEMORY[0x1A1AC1AAC]();
  v29 = self;
  HMFGetOSLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v52 = v31;
    _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Root group or accessory settings object is nil", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v28);
  v32 = 0;
LABEL_31:

  return v32;
}

- (void)createRootSettingGroup
{
  void *v3;
  void *v4;
  HMAccessorySettingsAdapter *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HMAccessoryNumberSetting *v23;
  HMAccessorySettingsAdapter *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMAccessorySettingsAdapter *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HMAccessorySettingsAdapter *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  const char *v45;
  int64_t v46;
  HMAccessorySettingsAdapter *v47;
  NSObject *v48;
  void *v49;
  __int128 v50;
  void *v51;
  id obj;
  void *context;
  void *contexta;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  -[HMAccessorySettingsAdapter rootGroup](self, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1A1AC1AAC]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v7;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Warning: Settings adapter root group has already been constructed.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    return;
  }
  -[HMAccessorySettingsAdapter createTapAssistanceSelections](self, "createTapAssistanceSelections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsAdapter setTapAssistanceSelections:](self, "setTapAssistanceSelections:", v8);

  objc_msgSend((id)objc_opt_class(), "defaultSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v10;
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (!v59)
    goto LABEL_24;
  v58 = *(_QWORD *)v61;
  *(_QWORD *)&v11 = 138543618;
  v50 = v11;
  do
  {
    for (i = 0; i != v59; ++i)
    {
      if (*(_QWORD *)v61 != v58)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
      -[HMAccessorySettingsAdapter groupKeyArrayFromKeyPath:](self, "groupKeyArrayFromKeyPath:", v13, v50);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter findOrAddAccessorySettingGroupWithKeyPath:](self, "findOrAddAccessorySettingGroupWithKeyPath:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter settingKeyFromKeyPath:](self, "settingKeyFromKeyPath:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "defaultSettings");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hmf_arrayForKey:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count") == 6)
      {
        v57 = (void *)v15;
        objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectAtIndexedSubscript:", 3);
        v22 = objc_claimAutoreleasedReturnValue();
        v55 = (void *)v22;
        v56 = v16;
        if (objc_msgSend((id)objc_opt_class(), "isKeyPathForTapAssistanceSelectionSettingType:", v13))
        {
          -[HMAccessorySettingsAdapter createTapAssistanceSelectionSettingFromNumberConstraint:properties:value:min:max:step:](self, "createTapAssistanceSelectionSettingFromNumberConstraint:properties:value:min:max:step:", v16, 3, v22, v19, v20, v21);
          v23 = (HMAccessoryNumberSetting *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            context = (void *)MEMORY[0x1A1AC1AAC]();
            v24 = self;
            HMFGetOSLogHandle();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v50;
              v65 = v51;
              v66 = 2112;
              v67 = v13;
              _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Error in creating setting for keypath %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(context);
            v26 = v57;
            goto LABEL_21;
          }
        }
        else
        {
          v23 = -[HMAccessoryNumberSetting initWithKey:properties:value:minimumValue:maximumValue:stepValue:]([HMAccessoryNumberSetting alloc], "initWithKey:properties:value:minimumValue:maximumValue:stepValue:", v16, 3, v22, v19, v20, v21);
        }
        -[HMAccessorySetting internal](v23, "internal");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessorySettingsAdapter accessorySettings](self, "accessorySettings");
        contexta = v18;
        v33 = v14;
        v34 = v21;
        v35 = v20;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMAccessorySettingsAdapter accessoryContext](self, "accessoryContext");
        v37 = v19;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "configureWithAccessorySettings:context:shouldHandleUpdatedValue:", v36, v38, 0);

        v19 = v37;
        v20 = v35;
        v21 = v34;
        v14 = v33;
        v18 = contexta;

        v26 = v57;
        objc_msgSend(v57, "addSetting:", v23);

LABEL_21:
        v16 = v56;
        goto LABEL_22;
      }
      v27 = (void *)MEMORY[0x1A1AC1AAC]();
      v28 = self;
      HMFGetOSLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v30 = v16;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v65 = v31;
        _os_log_impl(&dword_19B1B0000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Value array size mismatch", buf, 0xCu);

        v16 = v30;
      }

      objc_autoreleasePoolPop(v27);
      v26 = (void *)v15;
LABEL_22:

    }
    v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  }
  while (v59);
LABEL_24:

  if (-[HMAccessorySettingsAdapter containerType](self, "containerType") == 1)
  {
    v39 = (void *)MEMORY[0x1A1AC1AAC]();
    v40 = self;
    HMFGetOSLogHandle();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter homeIdentifier](v40, "homeIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter settingsContainerIdentifier](v40, "settingsContainerIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v42;
      v66 = 2112;
      v67 = v43;
      v68 = 2112;
      v69 = v44;
      v45 = "%{public}@Root group created for home: %@, accessory: %@";
      goto LABEL_30;
    }
  }
  else
  {
    v46 = -[HMAccessorySettingsAdapter containerType](self, "containerType");
    v39 = (void *)MEMORY[0x1A1AC1AAC]();
    v47 = self;
    HMFGetOSLogHandle();
    v48 = objc_claimAutoreleasedReturnValue();
    v41 = v48;
    if (v46 == 2)
    {
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        goto LABEL_34;
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter homeIdentifier](v47, "homeIdentifier");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter settingsContainerIdentifier](v47, "settingsContainerIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v65 = v42;
      v66 = 2112;
      v67 = v43;
      v68 = 2112;
      v69 = v44;
      v45 = "%{public}@Root group created for home: %@, media system: %@";
LABEL_30:
      _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_INFO, v45, buf, 0x20u);

    }
    else
    {
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      HMFGetLogIdentifier();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter homeIdentifier](v47, "homeIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v65 = v42;
      v66 = 2112;
      v67 = v49;
      _os_log_impl(&dword_19B1B0000, v41, OS_LOG_TYPE_ERROR, "%{public}@Error in root group creation for home: %@", buf, 0x16u);

    }
  }
LABEL_34:

  objc_autoreleasePoolPop(v39);
}

- (id)createTapAssistanceSelectionSettingFromNumberConstraint:(id)a3 properties:(unint64_t)a4 value:(id)a5 min:(id)a6 max:(id)a7 step:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  HMAccessorySelectionSetting *v25;
  void *v26;
  HMAccessorySelectionSetting *v27;
  void *v28;
  HMAccessorySettingsAdapter *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!-[HMAccessorySettingsAdapter isValidSelectionItemNumberConstraintValue:min:max:step:](self, "isValidSelectionItemNumberConstraintValue:min:max:step:", v15, v16, v17, v18))
  {
    v28 = (void *)MEMORY[0x1A1AC1AAC]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v31;
      v32 = "%{public}@Invalid number constraints for tab assistance selection item";
LABEL_9:
      _os_log_impl(&dword_19B1B0000, v30, OS_LOG_TYPE_ERROR, v32, (uint8_t *)&v34, 0xCu);

    }
LABEL_10:

    objc_autoreleasePoolPop(v28);
    v27 = 0;
    goto LABEL_11;
  }
  -[HMAccessorySettingsAdapter tapAssistanceSelections](self, "tapAssistanceSelections");
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19
    || (v20 = (void *)v19,
        -[HMAccessorySettingsAdapter tapAssistanceSelections](self, "tapAssistanceSelections"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "count"),
        v21,
        v20,
        v22 != 3))
  {
    v28 = (void *)MEMORY[0x1A1AC1AAC]();
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v31;
      v32 = "%{public}@Tab assistance selections array is nil or the number selection items is not 3";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  -[HMAccessorySettingsAdapter tapAssistanceSelections](self, "tapAssistanceSelections");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectAtIndexedSubscript:", objc_msgSend(v15, "integerValue"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = [HMAccessorySelectionSetting alloc];
  -[HMAccessorySettingsAdapter tapAssistanceSelections](self, "tapAssistanceSelections");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HMAccessorySelectionSetting initWithKey:properties:value:items:](v25, "initWithKey:properties:value:items:", v14, a4, v24, v26);

LABEL_11:
  return v27;
}

- (BOOL)isValidSelectionItemNumberConstraintValue:(id)a3 min:(id)a4 max:(id)a5 step:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v15 = !objc_msgSend(v10, "integerValue")
     && objc_msgSend(v11, "integerValue") == 2
     && (v13 = objc_msgSend(v9, "integerValue"), v13 >= objc_msgSend(v10, "integerValue"))
     && (v14 = objc_msgSend(v9, "integerValue"), v14 <= objc_msgSend(v11, "integerValue"))
     && objc_msgSend(v12, "integerValue") == 1;

  return v15;
}

- (id)accessoryNumberSettingWithKeyPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  -[HMAccessorySettingsAdapter accessorySettingWithKeyPath:](self, "accessorySettingWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)accessorySettingWithKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  HMAccessorySettingsAdapter *v20;
  NSObject *v21;
  void *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMAccessorySettingsAdapter groupKeyArrayFromKeyPath:](self, "groupKeyArrayFromKeyPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hmf_isEmpty") & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[HMAccessorySettingsAdapter rootGroup](self, "rootGroup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v8);

    if (v10)
    {
      v24 = v4;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v11 = v5;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v26;
        v15 = 1;
        while (2)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v26 != v14)
              objc_enumerationMutation(v11);
            if ((v15 & 1) == 0)
            {
              -[HMAccessorySettingsAdapter appendKeyPath:withNextKey:](self, "appendKeyPath:withNextKey:", v8, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16));
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "accessorySettingGroupWithKeyPath:", v17);
              v18 = objc_claimAutoreleasedReturnValue();

              if (!v18)
              {
                v19 = (void *)MEMORY[0x1A1AC1AAC]();
                v20 = self;
                HMFGetOSLogHandle();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v30 = v22;
                  v31 = 2112;
                  v32 = v17;
                  _os_log_impl(&dword_19B1B0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot find group with the key path: %@", buf, 0x16u);

                }
                objc_autoreleasePoolPop(v19);

                v7 = 0;
                v6 = 0;
                v4 = v24;
                goto LABEL_20;
              }
              v8 = v17;
              v7 = (void *)v18;
            }
            v15 = 0;
            ++v16;
          }
          while (v13 != v16);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          v15 = 0;
          if (v13)
            continue;
          break;
        }
      }

      v4 = v24;
      objc_msgSend(v7, "accessorySettingWithKeyPath:", v24);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v17 = v8;
LABEL_20:

  }
  return v6;
}

- (BOOL)updateBooleanSettingWithKeyPath:(id)a3 value:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  HMAccessorySettingsAdapter *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HMAccessorySettingsAdapter accessorySettingWithKeyPath:](self, "accessorySettingWithKeyPath:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = &unk_1E3B2E530;
    if (v4)
      v11 = &unk_1E3B2E518;
    v12 = v11;
    v13 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v9, "updateValue:", v12));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keyPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v21 = v13;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v10;
      v28 = 2112;
      v29 = v18;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully updated the BOOLean setting: %@, old value: %@, new value: %@", buf, 0x2Au);

      v13 = v21;
    }

    objc_autoreleasePoolPop(v13);
    v19 = objc_msgSend(v10, "isEqual:", v12) ^ 1;

  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (BOOL)updateNumberSettingWithKeyPath:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  HMAccessorySettingsAdapter *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessorySettingsAdapter accessorySettingWithKeyPath:](self, "accessorySettingWithKeyPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "value");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    v13 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v10, "updateValue:", v12));
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "keyPath");
      v21 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v22 = v7;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Successfully updated the number setting: %@, old value: %@, new value: %@", buf, 0x2Au);

      v7 = v22;
      v13 = v21;

    }
    objc_autoreleasePoolPop(v13);
    v19 = objc_msgSend(v11, "isEqual:", v12) ^ 1;

  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (BOOL)updateTapAssistanceSelectionSettingWithKeyPath:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMAccessorySettingsAdapter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMAccessorySettingsAdapter tapAssistanceSelectionSetting:](self, "tapAssistanceSelectionSetting:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1A1AC1AAC](objc_msgSend(v9, "updateValue:", v7));
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "keyPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "value");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Successfully updated the tap assistance selection setting: %@, old value: %@, new value: %@", (uint8_t *)&v20, 0x2Au);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(v9, "value");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "isEqual:", v17) ^ 1;

  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (void)accessorySettingsDataSource:(id)a3 didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a4 settings:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  HMAccessorySettingsAdapter *v14;
  id v15;

  v7 = a4;
  v8 = a5;
  -[HMAccessorySettingsAdapter workQueue](self, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__HMAccessorySettingsAdapter_accessorySettingsDataSource_didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke;
  block[3] = &unk_1E3AB5CD0;
  v13 = v8;
  v14 = self;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(v9, block);

}

- (BOOL)_handleLanguageSettingUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  HMAccessorySettingsAdapter *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  HMAccessorySettingsAdapter *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  BOOL v24;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "selectedLanguageSettingKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {
    v8 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    v10 = v9;

    if (!v10)
    {
      v11 = (void *)MEMORY[0x1A1AC1AAC]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543874;
        v27 = v14;
        v28 = 2112;
        v29 = 0;
        v30 = 2112;
        v31 = v8;
        _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected setting type for setting = %@, cast from object:%@", (uint8_t *)&v26, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
    }
    -[HMAccessorySettingsAdapter setSelectedLanguageSetting:](self, "setSelectedLanguageSetting:", v10);
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v4, "keyPath");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "availableLanguagesKeyPath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (v17)
  {
    v10 = v4;
    if (!v10)
    {
      v18 = (void *)MEMORY[0x1A1AC1AAC]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138543618;
        v27 = v21;
        v28 = 2112;
        v29 = 0;
        _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unexpected setting type for setting = %@", (uint8_t *)&v26, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
    }
    -[HMAccessorySettingsAdapter setAvailableLanguageSetting:](self, "setAvailableLanguageSetting:", v10);
    goto LABEL_16;
  }
LABEL_17:
  -[HMAccessorySettingsAdapter selectedLanguageSetting](self, "selectedLanguageSetting");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsAdapter availableLanguageSetting](self, "availableLanguageSetting");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HMAccessorySettingsAdapter _addOrUpdateLanguageSetting:availableLanguagesSetting:](self, "_addOrUpdateLanguageSetting:availableLanguagesSetting:", v22, v23);

  return v24;
}

- (id)_findSettingInGroupForKeyPath:(id)a3 group:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __66__HMAccessorySettingsAdapter__findSettingInGroupForKeyPath_group___block_invoke;
    v19[3] = &unk_1E3AB2F28;
    v11 = v6;
    v20 = v11;
    objc_msgSend(v9, "na_firstObjectPassingTest:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = v12;
    }
    else
    {
      objc_msgSend(v8, "groups");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v10;
      v17[1] = 3221225472;
      v17[2] = __66__HMAccessorySettingsAdapter__findSettingInGroupForKeyPath_group___block_invoke_2;
      v17[3] = &unk_1E3AB0C60;
      v17[4] = self;
      v18 = v11;
      objc_msgSend(v14, "na_map:", v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(v15, "firstObject");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_addOrUpdateLanguageSetting:(id)a3 availableLanguagesSetting:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  HMAccessorySettingsAdapter *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend((id)objc_opt_class(), "selectedLanguageSettingKeyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v7)
  {
    -[HMAccessorySettingsAdapter rootGroup](self, "rootGroup");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsAdapter _findSettingInGroupForKeyPath:group:](self, "_findSettingInGroupForKeyPath:group:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMAccessorySettingsAdapter groupKeyArrayFromKeyPath:](self, "groupKeyArrayFromKeyPath:", v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMAccessorySettingsAdapter findOrAddAccessorySettingGroupWithKeyPath:](self, "findOrAddAccessorySettingGroupWithKeyPath:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
    v13 = v12;

    v14 = v13 == 0;
    v15 = v11;
    if (!v13)
    {
      -[HMAccessorySettingsAdapter legacyLanguageSettingFromSelectedSetting:selections:settingsReflected:](self, "legacyLanguageSettingFromSelectedSetting:selections:settingsReflected:", v6, v7, -[HMAccessorySettingsAdapter settingsReflected](self, "settingsReflected"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v15 = v17;

      objc_msgSend(v15, "internal");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter accessorySettings](self, "accessorySettings");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter accessoryContext](self, "accessoryContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "configureWithAccessorySettings:context:shouldHandleUpdatedValue:", v19, v20, 0);

      objc_msgSend(v34, "addSetting:", v15);
    }
    -[HMAccessorySettingsAdapter legacyLanguageSettingFromSelectedSetting:selections:settingsReflected:](self, "legacyLanguageSettingFromSelectedSetting:selections:settingsReflected:", v6, v7, -[HMAccessorySettingsAdapter settingsReflected](self, "settingsReflected"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "value");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "isEqual:", v23);

    if ((v24 & 1) == 0)
    {
      objc_msgSend(v21, "value");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateValue:", v25);

      v14 = 1;
    }

  }
  else
  {
    v26 = (void *)MEMORY[0x1A1AC1AAC]();
    v27 = self;
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter selectedLanguageSetting](v27, "selectedLanguageSetting");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessorySettingsAdapter availableLanguageSetting](v27, "availableLanguageSetting");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v29;
      v37 = 2112;
      v38 = v30;
      v39 = 2112;
      v40 = v31;
      _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@Missing selected language = %@ or available language settings = %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v26);
    v14 = 0;
  }

  return v14;
}

- (id)legacyLanguageSettingFromSelectedSetting:(id)a3 selections:(id)a4 settingsReflected:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMAccessorySelectionSetting *v16;
  _QWORD v18[5];

  v5 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "selectedLanguageSettingKeyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsAdapter settingKeyFromKeyPath:](self, "settingKeyFromKeyPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "languageValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __100__HMAccessorySettingsAdapter_legacyLanguageSettingFromSelectedSetting_selections_settingsReflected___block_invoke;
  v18[3] = &unk_1E3AB0C88;
  v18[4] = self;
  objc_msgSend(v12, "na_map:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "languageValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMAccessorySettingsAdapter languageSelectionItemFromValue:](self, "languageSelectionItemFromValue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HMAccessorySelectionSetting initWithKey:properties:value:items:]([HMAccessorySelectionSetting alloc], "initWithKey:properties:value:items:", v11, 3, v15, v13);
  -[HMAccessorySetting updateReflected:](v16, "updateReflected:", v5);

  return v16;
}

- (id)languageSelectionItemFromValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HMAccessorySelectionSettingItem *v11;

  v3 = a3;
  objc_msgSend(v3, "inputLanguageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputVoiceLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outputVoiceGenderCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_1E3AB7688, "stringByAppendingFormat:", CFSTR("%@,%@,%@,%@"), v4, v5, v6, CFSTR("d"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "voiceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "voiceName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(",%@"), v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }
  v11 = -[HMAccessorySelectionSettingItem initWithTitle:]([HMAccessorySelectionSettingItem alloc], "initWithTitle:", v7);

  return v11;
}

- (id)createTapAssistanceSelections
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "tapAssistanceSelectionTitles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)transformIntegerToSelection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;

  -[HMAccessorySettingsAdapter tapAssistanceSelections](self, "tapAssistanceSelections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if ((a3 & 0x8000000000000000) == 0 && v5)
  {
    -[HMAccessorySettingsAdapter tapAssistanceSelections](self, "tapAssistanceSelections");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 <= a3)
    {
      v6 = 0;
    }
    else
    {
      -[HMAccessorySettingsAdapter tapAssistanceSelections](self, "tapAssistanceSelections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v6;
}

- (BOOL)transformSelectionToInteger:(id)a3 integerValue:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  -[HMAccessorySettingsAdapter tapAssistanceSelections](self, "tapAssistanceSelections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMAccessorySettingsAdapter tapAssistanceSelections](self, "tapAssistanceSelections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__HMAccessorySettingsAdapter_transformSelectionToInteger_integerValue___block_invoke;
    v11[3] = &unk_1E3AB0CF0;
    v12 = v6;
    *a4 = objc_msgSend(v8, "indexOfObjectPassingTest:", v11);

    v9 = *a4 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)BOOLeanSettingValueWithKeyPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  -[HMAccessorySettingsAdapter accessorySettingWithKeyPath:](self, "accessorySettingWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)accessoryLanguageSetting
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend((id)objc_opt_class(), "selectedLanguageSettingKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessorySettingsAdapter accessorySettingWithKeyPath:](self, "accessorySettingWithKeyPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (id)numberSettingValueWithKeyPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[HMAccessorySettingsAdapter accessorySettingWithKeyPath:](self, "accessorySettingWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5)
  {
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &unk_1E3B2E5C0;
  }

  return v6;
}

- (id)tapAssistanceSelectionSetting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isKeyPathForTapAssistanceSelectionSettingType:", v4))
  {
    -[HMAccessorySettingsAdapter accessorySettingWithKeyPath:](self, "accessorySettingWithKeyPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tapAssistanceSelectionSettingValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HMAccessorySettingsAdapter tapAssistanceSelectionSetting:](self, "tapAssistanceSelectionSetting:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (BOOL)settingReflected:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[HMAccessorySettingsAdapter accessorySettingWithKeyPath:](self, "accessorySettingWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "isReflected");
  else
    v5 = 0;

  return v5;
}

- (id)logIdentifier
{
  int64_t v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  HMAccessorySettingsAdapter *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[HMAccessorySettingsAdapter containerType](self, "containerType");
  if (v3 == 2)
  {
    -[HMAccessorySettingsAdapter settingsContainer](self, "settingsContainer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containerUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  if (v3 == 1)
  {
    -[HMAccessorySettingsAdapter settingsContainerIdentifier](self, "settingsContainerIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return v5;
  }
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v10;
    _os_log_impl(&dword_19B1B0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unknown settings container type", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v7);
  v5 = CFSTR("wrong-log-identifier");
  return v5;
}

- (HMAccessorySettingGroup)rootGroup
{
  return (HMAccessorySettingGroup *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRootGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (HMAccessorySettings)accessorySettings
{
  return (HMAccessorySettings *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAccessorySettings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (HMAccessorySettingsAdapterDelegate)delegate
{
  return (HMAccessorySettingsAdapterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMAccessorySettingsDataSource)accessoryDataSource
{
  return (HMAccessorySettingsDataSource *)objc_getProperty(self, a2, 40, 1);
}

- (HMAccessorySettingsController)accessorySettingsController
{
  return (HMAccessorySettingsController *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMAccessorySettingsContainerInternal)settingsContainer
{
  return (HMAccessorySettingsContainerInternal *)objc_loadWeakRetained((id *)&self->_settingsContainer);
}

- (HMControllable)settingsControl
{
  return (HMControllable *)objc_loadWeakRetained((id *)&self->_settingsControl);
}

- (_HMContext)accessoryContext
{
  return (_HMContext *)objc_getProperty(self, a2, 88, 1);
}

- (HMLanguageValueListSetting)availableLanguageSetting
{
  return (HMLanguageValueListSetting *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAvailableLanguageSetting:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (HMLanguageSetting)selectedLanguageSetting
{
  return (HMLanguageSetting *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSelectedLanguageSetting:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSArray)tapAssistanceSelections
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTapAssistanceSelections:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSUUID)settingsContainerIdentifier
{
  return self->_settingsContainerIdentifier;
}

- (int64_t)containerType
{
  return self->_containerType;
}

- (BOOL)didReceiveFirstUpdateEvent
{
  return self->_didReceiveFirstUpdateEvent;
}

- (void)setDidReceiveFirstUpdateEvent:(BOOL)a3
{
  self->_didReceiveFirstUpdateEvent = a3;
}

- (BOOL)settingsReflected
{
  return self->_settingsReflected;
}

- (void)setSettingsReflected:(BOOL)a3
{
  self->_settingsReflected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsContainerIdentifier, 0);
  objc_storeStrong((id *)&self->_tapAssistanceSelections, 0);
  objc_storeStrong((id *)&self->_selectedLanguageSetting, 0);
  objc_storeStrong((id *)&self->_availableLanguageSetting, 0);
  objc_storeStrong((id *)&self->_accessoryContext, 0);
  objc_destroyWeak((id *)&self->_settingsControl);
  objc_destroyWeak((id *)&self->_settingsContainer);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_accessorySettingsController, 0);
  objc_storeStrong((id *)&self->_accessoryDataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accessorySettings, 0);
  objc_storeStrong((id *)&self->_rootGroup, 0);
}

uint64_t __71__HMAccessorySettingsAdapter_transformSelectionToInteger_integerValue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

HMAccessorySelectionSettingItem *__59__HMAccessorySettingsAdapter_createTapAssistanceSelections__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HMAccessorySelectionSettingItem *v3;

  v2 = a2;
  v3 = -[HMAccessorySelectionSettingItem initWithTitle:]([HMAccessorySelectionSettingItem alloc], "initWithTitle:", v2);

  return v3;
}

uint64_t __100__HMAccessorySettingsAdapter_legacyLanguageSettingFromSelectedSetting_selections_settingsReflected___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "languageSelectionItemFromValue:", a2);
}

uint64_t __66__HMAccessorySettingsAdapter__findSettingInGroupForKeyPath_group___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __66__HMAccessorySettingsAdapter__findSettingInGroupForKeyPath_group___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_findSettingInGroupForKeyPath:group:", *(_QWORD *)(a1 + 40), a2);
}

void __119__HMAccessorySettingsAdapter_accessorySettingsDataSource_didReceiveSettingsUpdatesForAccessoryWithIdentifier_settings___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t v63[128];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "hmf_isEmpty"))
  {
    objc_msgSend(*(id *)(a1 + 40), "accessorySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "settingsContainerInternal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (objc_msgSend(*(id *)(a1 + 40), "containerType") == 1)
      {
        v8 = (void *)MEMORY[0x1A1AC1AAC]();
        v9 = *(id *)(a1 + 40);
        HMFGetOSLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        v53 = v7;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(void **)(a1 + 48);
          v13 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v65 = v11;
          v66 = 2112;
          v67 = v12;
          v68 = 2112;
          v69 = v13;
          v14 = "%{public}@Adapter did receive setting update: accessory: %@ settings: %@";
LABEL_14:
          _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, v14, buf, 0x20u);

          goto LABEL_15;
        }
        goto LABEL_15;
      }
      v17 = objc_msgSend(*(id *)(a1 + 40), "containerType");
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      v10 = v18;
      if (v17 == 2)
      {
        v53 = v7;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(a1 + 48);
          v20 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v65 = v11;
          v66 = 2112;
          v67 = v19;
          v68 = 2112;
          v69 = v20;
          v14 = "%{public}@Adapter did receive setting update: media system: %@ settings: %@";
          goto LABEL_14;
        }
LABEL_15:

        objc_autoreleasePoolPop(v8);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "delegate");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        obj = *(id *)(a1 + 32);
        v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        if (v58)
        {
          v21 = *(_QWORD *)v60;
          do
          {
            for (i = 0; i != v58; ++i)
            {
              if (*(_QWORD *)v60 != v21)
                objc_enumerationMutation(obj);
              v23 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
              objc_msgSend(v23, "keyPath");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(*(id *)(a1 + 40), "didReceiveFirstUpdateEvent") & 1) == 0)
              {
                objc_msgSend(*(id *)(a1 + 40), "accessorySettings");
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (v25)
                {
                  v26 = (void *)MEMORY[0x1A1AC1AAC]();
                  v27 = *(id *)(a1 + 40);
                  HMFGetOSLogHandle();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    HMFGetLogIdentifier();
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v65 = v29;
                    _os_log_impl(&dword_19B1B0000, v28, OS_LOG_TYPE_INFO, "%{public}@Received first update event, notifying delegate we have a valid settings tree.", buf, 0xCu);

                  }
                  objc_autoreleasePoolPop(v26);
                  v30 = *(void **)(a1 + 40);
                  objc_msgSend(v30, "accessorySettings");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "adapter:didUpdateSettings:", v30, v31);

                  objc_msgSend(*(id *)(a1 + 40), "setDidReceiveFirstUpdateEvent:", 1);
                }
              }
              v32 = v23;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v33 = v32;
              else
                v33 = 0;
              v34 = v33;

              if (v34)
              {
                if (objc_msgSend(*(id *)(a1 + 40), "updateBooleanSettingWithKeyPath:value:", v24, objc_msgSend(v34, "BOOLValue")))objc_msgSend(v56, "addObject:", v24);
              }
              else
              {
                v35 = v32;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v36 = v35;
                else
                  v36 = 0;
                v37 = v36;

                if (v37)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v37, "integerValue"));
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)objc_opt_class(), "scaleDownNumberSettingValue:", v38);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend((id)objc_opt_class(), "isKeyPathForTapAssistanceSelectionSettingType:", v24))
                  {
                    objc_msgSend(*(id *)(a1 + 40), "transformIntegerToSelection:", objc_msgSend(v39, "integerValue"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v40
                      && objc_msgSend(*(id *)(a1 + 40), "updateTapAssistanceSelectionSettingWithKeyPath:value:", v24, v40))
                    {
                      objc_msgSend(v56, "addObject:", v24);
                    }

                  }
                  else if (objc_msgSend(*(id *)(a1 + 40), "updateNumberSettingWithKeyPath:value:", v24, v39))
                  {
                    objc_msgSend(v56, "addObject:", v24);
                  }

                }
                else
                {
                  objc_msgSend((id)objc_opt_class(), "languageKeyPaths");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v41, "containsObject:", v24);

                  if (v42)
                  {
                    if (objc_msgSend(*(id *)(a1 + 40), "_handleLanguageSettingUpdate:", v35))
                      objc_msgSend(v56, "addObject:", v24);
                  }
                  else
                  {
                    v43 = (void *)MEMORY[0x1A1AC1AAC]();
                    v44 = *(id *)(a1 + 40);
                    HMFGetOSLogHandle();
                    v45 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v54 = v43;
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "keyPath");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v65 = v46;
                      v66 = 2112;
                      v67 = v47;
                      _os_log_impl(&dword_19B1B0000, v45, OS_LOG_TYPE_ERROR, "%{public}@The setting object for key path: %@ is not supported in the adapter.", buf, 0x16u);

                      v43 = v54;
                    }

                    objc_autoreleasePoolPop(v43);
                  }
                }

              }
            }
            v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          }
          while (v58);
        }

        v7 = v53;
        if (objc_msgSend(v56, "count"))
        {
          v48 = (void *)MEMORY[0x1A1AC1AAC]();
          v49 = *(id *)(a1 + 40);
          HMFGetOSLogHandle();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v65 = v51;
            v66 = 2112;
            v67 = v56;
            _os_log_impl(&dword_19B1B0000, v50, OS_LOG_TYPE_INFO, "%{public}@Adapter did update for settings %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v48);
          objc_msgSend(v55, "adapter:didUpdateSettingKeyPaths:", *(_QWORD *)(a1 + 40), v56);
        }

        goto LABEL_60;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v65 = v52;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Unknown settings container type this adapter", buf, 0xCu);

      }
    }
    else
    {
      v8 = (void *)MEMORY[0x1A1AC1AAC]();
      v9 = *(id *)(a1 + 40);
      HMFGetOSLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "accessorySettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v15;
        v66 = 2112;
        v67 = v16;
        _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@settings container not found, not processing. settings: %@", buf, 0x16u);

      }
    }

    objc_autoreleasePoolPop(v8);
LABEL_60:

    return;
  }
  v2 = (void *)MEMORY[0x1A1AC1AAC]();
  v3 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v65 = v5;
    _os_log_impl(&dword_19B1B0000, v4, OS_LOG_TYPE_ERROR, "%{public}@Event delegate call from dataSource has empty settings array.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
}

void __54__HMAccessorySettingsAdapter_updateSettingsReflected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  __int128 v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *context;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v2;
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "allKeys");
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    v46 = v4;
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v49;
      *(_QWORD *)&v6 = 138543874;
      v42 = v6;
      v45 = *(_QWORD *)v49;
      do
      {
        v9 = 0;
        v44 = v7;
        do
        {
          if (*(_QWORD *)v49 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v9);
          objc_msgSend(v3, "objectForKey:", v10, v42);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(*(id *)(a1 + 32), "accessorySettingWithKeyPath:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", 5);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13;
            if (v12)
              v15 = v13 == 0;
            else
              v15 = 1;
            if (!v15 && objc_msgSend(v13, "BOOLValue"))
            {
              context = (void *)MEMORY[0x1A1AC1AAC]();
              v16 = *(id *)(a1 + 32);
              HMFGetOSLogHandle();
              v17 = a1;
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                HMFBooleanToString();
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v42;
                v53 = v19;
                v54 = 2112;
                v55 = v10;
                v56 = 2112;
                v57 = v20;
                _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_INFO, "%{public}@Updating setting %@ reflected to: %@", buf, 0x20u);

                v3 = v43;
                v7 = v44;
              }

              objc_autoreleasePoolPop(context);
              objc_msgSend(v12, "updateReflected:", *(unsigned __int8 *)(v17 + 40));
              a1 = v17;
              v8 = v45;
              v4 = v46;
            }

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      }
      while (v7);
    }

    v21 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "selectedLanguageSettingKeyPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accessorySettingWithKeyPath:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v25 = (void *)MEMORY[0x1A1AC1AAC]();
      v26 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "selectedLanguageSettingKeyPath");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v53 = v28;
        v54 = 2112;
        v55 = v29;
        v56 = 2112;
        v57 = v30;
        _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_INFO, "%{public}@Updating language setting %@ reflected to: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v25);
      v24 = objc_msgSend(v23, "updateReflected:", *(unsigned __int8 *)(a1 + 40));
    }
    v31 = (void *)MEMORY[0x1A1AC1AAC](v24);
    v32 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v53 = v34;
      v54 = 2112;
      v55 = v35;
      _os_log_impl(&dword_19B1B0000, v33, OS_LOG_TYPE_INFO, "%{public}@Setting adapter needReflectSettings to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v31);
    objc_msgSend(*(id *)(a1 + 32), "setSettingsReflected:", *(unsigned __int8 *)(a1 + 40));

  }
  else
  {
    v36 = MEMORY[0x1A1AC1AAC]();
    v37 = a1;
    v38 = (void *)v36;
    v39 = *(id *)(v37 + 32);
    HMFGetOSLogHandle();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v53 = v41;
      _os_log_impl(&dword_19B1B0000, v40, OS_LOG_TYPE_ERROR, "%{public}@Default settings do not exist", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v38);
  }

}

void __72__HMAccessorySettingsAdapter_updateWithKeyPath_value_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  HMSettingIntegerValue *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[5];
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "languageKeyPaths");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_transformAccessorySettingToLanguageSetting:", *(_QWORD *)(a1 + 48));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "accessorySettingsController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "homeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 56);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "languageValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __72__HMAccessorySettingsAdapter_updateWithKeyPath_value_completionHandler___block_invoke_25;
      v44[3] = &unk_1E3AB53A8;
      v44[4] = *(_QWORD *)(a1 + 32);
      v45 = v4;
      v46 = *(id *)(a1 + 64);
      objc_msgSend(v5, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:completionHandler:", v6, v7, v8, v9, v44);

LABEL_30:
      return;
    }
    v21 = (void *)MEMORY[0x1A1AC1AAC]();
    v22 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v24;
      v49 = 2112;
      v50 = 0;
      _os_log_impl(&dword_19B1B0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Nil setting transformation for setting = %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v21);
    v25 = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v26);
LABEL_29:

    goto LABEL_30;
  }
  if (!objc_msgSend((id)objc_opt_class(), "isKeyPathForBooleanSettingType:", *(_QWORD *)(a1 + 40)))
  {
    if (objc_msgSend((id)objc_opt_class(), "isKeyPathForConstrainedNumberSettingType:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 48), "floatValue");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "scaleUpNumberSettingValue:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HMSettingIntegerValue initWithIntegerValue:]([HMSettingIntegerValue alloc], "initWithIntegerValue:", objc_msgSend(v12, "integerValue"));
      objc_msgSend(*(id *)(a1 + 32), "updateNumberSettingWithKeyPath:value:", *(_QWORD *)(a1 + 40), v4);
LABEL_8:

      goto LABEL_9;
    }
    if (objc_msgSend((id)objc_opt_class(), "isKeyPathForTapAssistanceSelectionSettingType:", *(_QWORD *)(a1 + 40)))
    {
      v43 = -1;
      v27 = *(id *)(a1 + 48);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v28 = v27;
      else
        v28 = 0;
      v4 = v28;

      if (v4 && objc_msgSend(*(id *)(a1 + 32), "transformSelectionToInteger:integerValue:", v4, &v43))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v43);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "scaleUpNumberSettingValue:", v12);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[HMSettingIntegerValue initWithIntegerValue:]([HMSettingIntegerValue alloc], "initWithIntegerValue:", objc_msgSend(v29, "integerValue"));
        objc_msgSend(*(id *)(a1 + 32), "updateTapAssistanceSelectionSettingWithKeyPath:value:", *(_QWORD *)(a1 + 40), v4);

        goto LABEL_8;
      }
      v36 = (void *)MEMORY[0x1A1AC1AAC]();
      v37 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543618;
        v48 = v39;
        v49 = 2112;
        v50 = v40;
        _os_log_impl(&dword_19B1B0000, v38, OS_LOG_TYPE_ERROR, "%{public}@Wrong update value for tap assistance: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v36);
      objc_msgSend(*(id *)(a1 + 32), "accessoryContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "delegateCaller");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 3);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "callCompletion:error:", v41, v42);

    }
    else
    {
      v30 = (void *)MEMORY[0x1A1AC1AAC]();
      v31 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v48 = v33;
        v49 = 2112;
        v50 = v34;
        _os_log_impl(&dword_19B1B0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Keypath is of an unknown type that is not supported: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:suggestion:", 3, CFSTR("Keypath is of unknown setting type"), CFSTR("Only Boolean and Number Setting are supported"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessoryContext");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "delegateCaller");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "callCompletion:error:", *(_QWORD *)(a1 + 64), v4);
    }

    goto LABEL_29;
  }
  v10 = objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
  v11 = -[HMSettingBooleanValue initWithBoolValue:]([HMSettingBooleanValue alloc], "initWithBoolValue:", v10);
  objc_msgSend(*(id *)(a1 + 32), "updateBooleanSettingWithKeyPath:value:", *(_QWORD *)(a1 + 40), v10);
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "accessorySettingsController", v43);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:completionHandler:", v14, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), v11, *(_QWORD *)(a1 + 64));

  v15 = (void *)MEMORY[0x1A1AC1AAC]();
  v16 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v48 = v18;
    v49 = 2112;
    v50 = v19;
    v51 = 2112;
    v52 = v20;
    _os_log_impl(&dword_19B1B0000, v17, OS_LOG_TYPE_INFO, "%{public}@Update setting keypath: %@ value: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v15);

}

void __72__HMAccessorySettingsAdapter_updateWithKeyPath_value_completionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setSelectedLanguageSetting:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "selectedLanguageSettingKeyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adapter:didUpdateSettingKeyPaths:", v5, v7);

    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "selectedLanguageSetting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "availableLanguageSetting");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_addOrUpdateLanguageSetting:availableLanguagesSetting:", v9, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "accessoryContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegateCaller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "callCompletion:error:", *(_QWORD *)(a1 + 48), v3);

}

void __76__HMAccessorySettingsAdapter__configureForMediaSystemWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v16 = 138543874;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v3;
    v10 = "%{public}@Failed to subscribe to media system settings with key paths: %@ :%@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v14;
    v10 = "%{public}@Successfully subscribed to media system settings with key paths: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v11, v12, v10, (uint8_t *)&v16, v13);

LABEL_7:
  objc_autoreleasePoolPop(v4);
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);

}

void __74__HMAccessorySettingsAdapter__configureForAccessoryWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 40);
    v16 = 138543874;
    v17 = v8;
    v18 = 2112;
    v19 = v9;
    v20 = 2112;
    v21 = v3;
    v10 = "%{public}@Failed to subscribe to the accessory settings with key paths: %@ :%@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v14;
    v10 = "%{public}@Successfully subscribed to the accessory settings with key paths: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
  }
  _os_log_impl(&dword_19B1B0000, v11, v12, v10, (uint8_t *)&v16, v13);

LABEL_7:
  objc_autoreleasePoolPop(v4);
  v15 = *(_QWORD *)(a1 + 48);
  if (v15)
    (*(void (**)(uint64_t, id))(v15 + 16))(v15, v3);

}

void __61__HMAccessorySettingsAdapter_configureWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "createRootSettingGroup");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "accessoryDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  v4 = objc_msgSend(*(id *)(a1 + 32), "containerType");
  v5 = *(void **)(a1 + 32);
  if (v4 == 1)
  {
    objc_msgSend(v5, "_configureForAccessoryWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else if (objc_msgSend(v5, "containerType") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_configureForMediaSystemWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "settingsContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unknown settings container: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:suggestion:", 3, CFSTR("Unknown settings container"), CFSTR("Only accessory or media system can be container"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    }
  }
}

+ (NSString)selectedLanguageSettingKeyPath
{
  return (NSString *)CFSTR("root.siri.language");
}

+ (id)availableLanguagesKeyPath
{
  return CFSTR("root.siri.availableLanguages");
}

+ (NSArray)languageKeyPaths
{
  if (languageKeyPaths__hmf_once_t0 != -1)
    dispatch_once(&languageKeyPaths__hmf_once_t0, &__block_literal_global_25457);
  return (NSArray *)(id)languageKeyPaths__hmf_once_v1;
}

+ (NSArray)tapAssistanceSelectionTitles
{
  return (NSArray *)&unk_1E3B306D0;
}

+ (id)tapAssistanceSelectionItemWithIndex:(int64_t)a3
{
  void *v5;
  unint64_t v6;
  HMAccessorySelectionSettingItem *v7;
  void *v8;
  void *v9;
  HMAccessorySelectionSettingItem *v10;

  if (a3 < 0
    || (objc_msgSend(a1, "tapAssistanceSelectionTitles"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6 <= a3))
  {
    v10 = 0;
  }
  else
  {
    v7 = [HMAccessorySelectionSettingItem alloc];
    objc_msgSend(a1, "tapAssistanceSelectionTitles");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMAccessorySelectionSettingItem initWithTitle:](v7, "initWithTitle:", v9);

  }
  return v10;
}

+ (int64_t)itemIndexWithTapAssistanceSelectionItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(a1, "tapAssistanceSelectionTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__HMAccessorySettingsAdapter_itemIndexWithTapAssistanceSelectionItem___block_invoke;
  v10[3] = &unk_1E3AB0D18;
  v11 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

+ (id)defaultSettings
{
  return &unk_1E3B30408;
}

+ (BOOL)defaultSettingsContainsKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

+ (BOOL)isKeyPathForBooleanSettingType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "defaultSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "count") == 6)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", &unk_1E3B2E548);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isKeyPathForConstrainedNumberSettingType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "defaultSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "count") == 6)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", &unk_1E3B2E560);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isKeyPathForTapAssistanceSelectionSettingType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "defaultSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && objc_msgSend(v6, "count") == 6)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqual:", &unk_1E3B2E5A8);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)defaultSettingsConstraintsForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(a1, "defaultSettingsContainsKeyPath:", v4))
  {
    objc_msgSend(a1, "defaultSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)defaultSettingsAllKeyPaths
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "defaultSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (float)constraintSettingScaleFactor
{
  return 100.0;
}

+ (id)scaleUpNumberSettingValue:(id)a3
{
  float v4;
  float v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(a3, "floatValue");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "constraintSettingScaleFactor");
  *(float *)&v8 = v5 * v7;
  return (id)objc_msgSend(v6, "numberWithFloat:", v8);
}

+ (id)scaleDownNumberSettingValue:(id)a3
{
  float v4;
  float v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(a3, "floatValue");
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a1, "constraintSettingScaleFactor");
  *(float *)&v8 = v5 / v7;
  return (id)objc_msgSend(v6, "numberWithFloat:", v8);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t64 != -1)
    dispatch_once(&logCategory__hmf_once_t64, &__block_literal_global_177_25385);
  return (id)logCategory__hmf_once_v65;
}

void __41__HMAccessorySettingsAdapter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v65;
  logCategory__hmf_once_v65 = v0;

}

uint64_t __70__HMAccessorySettingsAdapter_itemIndexWithTapAssistanceSelectionItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __46__HMAccessorySettingsAdapter_languageKeyPaths__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("root.siri.language"), CFSTR("root.siri.availableLanguages"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)languageKeyPaths__hmf_once_v1;
  languageKeyPaths__hmf_once_v1 = v0;

}

@end
