@implementation HFMediaAccessoryCommonSettingsManager

- (HFMediaAccessoryCommonSettingsManager)initWithMediaProfileContainer:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HFMediaAccessoryCommonSettingsManager *v9;
  HFMediaAccessoryCommonSettingsManager *v10;
  uint64_t v11;
  NSHashTable *observers;
  void *v13;
  uint64_t v14;
  HMHomeManager *homeManager;
  void *v16;
  void *v17;
  uint64_t v18;
  HMAccessorySettingsController *settingsController;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HFMediaAccessoryCommonSettingsManager;
  v9 = -[HFMediaAccessoryCommonSettingsManager init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaProfileContainer, a3);
    objc_storeStrong((id *)&v10->_home, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    observers = v10->_observers;
    v10->_observers = (NSHashTable *)v11;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "homeManager");
    v14 = objc_claimAutoreleasedReturnValue();
    homeManager = v10->_homeManager;
    v10->_homeManager = (HMHomeManager *)v14;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessorySettingsDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:", v10);

    -[HMHomeManager hf_accessorySettingsController](v10->_homeManager, "hf_accessorySettingsController");
    v18 = objc_claimAutoreleasedReturnValue();
    settingsController = v10->_settingsController;
    v10->_settingsController = (HMAccessorySettingsController *)v18;

    -[HFMediaAccessoryCommonSettingsManager _subscribeToAccessorySettings](v10, "_subscribeToAccessorySettings");
  }

  return v10;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMediaAccessoryCommonSettingsManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMediaAccessoryCommonSettingsManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (id)updateAccessorySettingWithHomeIdentifier:(id)a3 accessoryIdentifier:(id)a4 keyPath:(id)a5 rawSettingValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  HFMediaAccessoryCommonSettingsManager *v28;
  id v29;
  id v30;
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0D519C0]);
  -[HFMediaAccessoryCommonSettingsManager settingForKeyPath:](self, "settingForKeyPath:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "homeKitAccessorySettingValueForRawValue:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaAccessoryCommonSettingsManager settingsController](self, "settingsController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:", v10, v11, v12, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __126__HFMediaAccessoryCommonSettingsManager_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_rawSettingValue___block_invoke;
    v26[3] = &unk_1EA73C998;
    v20 = v14;
    v27 = v20;
    v28 = self;
    v29 = v17;
    v30 = v12;
    v31 = v13;
    v32 = v11;
    v21 = v17;
    v22 = (id)objc_msgSend(v19, "addCompletionBlock:", v26);

    v23 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  return v24;
}

uint64_t __126__HFMediaAccessoryCommonSettingsManager_updateAccessorySettingWithHomeIdentifier_accessoryIdentifier_keyPath_rawSettingValue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  if (a3)
    return objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  objc_msgSend(*(id *)(a1 + 40), "_updateCachedValue:forKeyPath:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessorySettingsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSettingValue:forKeyPath:accessoryIdentifier:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));

  return objc_msgSend(*(id *)(a1 + 32), "finishWithNoResult");
}

- (id)settingValueForKeyPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", HFAnnounceEnabledKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager announceEnabledSettingCachedValue](self, "announceEnabledSettingCachedValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", HFAudioAnalysisEnabledKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager audioAnalysisEnabledSettingCachedValue](self, "audioAnalysisEnabledSettingCachedValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", HFAllowHeySiriSettingKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager heySiriSettingCachedValue](self, "heySiriSettingCachedValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", HFTapToAccessSiriSettingKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager tapToAccessSiriSettingCachedValue](self, "tapToAccessSiriSettingCachedValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", HFAirPlayEnabledSettingKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager airPlayEnabledSettingCachedValue](self, "airPlayEnabledSettingCachedValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", HFDoorbellChimeEnabledKeyPath))
    {
      v6 = 0;
      goto LABEL_14;
    }
    -[HFMediaAccessoryCommonSettingsManager doorbellChimeEnabledSettingCachedValue](self, "doorbellChimeEnabledSettingCachedValue");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_14:

  return v6;
}

- (id)settingForKeyPath:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", HFAnnounceEnabledKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager announceEnabledSetting](self, "announceEnabledSetting");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", HFAudioAnalysisEnabledKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager audioAnalysisEnabledSetting](self, "audioAnalysisEnabledSetting");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", HFAllowHeySiriSettingKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager heySiriSetting](self, "heySiriSetting");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", HFTapToAccessSiriSettingKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager tapToAccessSiriSetting](self, "tapToAccessSiriSetting");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "isEqualToString:", HFAirPlayEnabledSettingKeyPath))
  {
    -[HFMediaAccessoryCommonSettingsManager airPlayEnabledSetting](self, "airPlayEnabledSetting");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", HFDoorbellChimeEnabledKeyPath))
    {
      v6 = 0;
      goto LABEL_14;
    }
    -[HFMediaAccessoryCommonSettingsManager doorbellChimeEnabledSetting](self, "doorbellChimeEnabledSetting");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_14:

  return v6;
}

- (id)_settingKeyPaths
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = HFAllowHeySiriSettingKeyPath;
  v3[1] = HFTapToAccessSiriSettingKeyPath;
  v3[2] = HFAnnounceEnabledKeyPath;
  v3[3] = HFAirPlayEnabledSettingKeyPath;
  v3[4] = HFDoorbellChimeEnabledKeyPath;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_subscribeToAccessorySettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  -[HFMediaAccessoryCommonSettingsManager mediaProfileContainer](self, "mediaProfileContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_backingAccessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFMediaAccessoryCommonSettingsManager _settingKeyPaths](self, "_settingKeyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessorySettingsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessoryCommonSettingsManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__HFMediaAccessoryCommonSettingsManager__subscribeToAccessorySettings__block_invoke;
  v13[3] = &unk_1EA726360;
  v14 = v6;
  v15 = v5;
  v11 = v5;
  v12 = v6;
  objc_msgSend(v8, "hf_subscribeToAccessorySettingsWithHomeIdentifier:accessoryIdentifier:keyPaths:options:completionHandler:", v10, v11, v12, 0, v13);

}

void __70__HFMediaAccessoryCommonSettingsManager__subscribeToAccessorySettings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory(0x25uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "Error subscribing to keyPaths [%@] for accessoryIdentifier [%@] - Error - [%@]", (uint8_t *)&v7, 0x20u);
    }

  }
}

- (void)_updateSettings:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  HFMediaAccessoryCommonSettingsManager *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id obj;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v46;
    v36 = *(_QWORD *)v46;
    do
    {
      v7 = 0;
      v37 = v5;
      do
      {
        if (*(_QWORD *)v46 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v7);
        objc_msgSend(v8, "keyPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", HFAllowHeySiriSettingKeyPath);

        if (v10)
        {
          -[HFMediaAccessoryCommonSettingsManager setHeySiriSetting:](self, "setHeySiriSetting:", v8);
        }
        else
        {
          objc_msgSend(v8, "keyPath");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", HFTapToAccessSiriSettingKeyPath);

          if (v12)
          {
            -[HFMediaAccessoryCommonSettingsManager setTapToAccessSiriSetting:](self, "setTapToAccessSiriSetting:", v8);
          }
          else
          {
            objc_msgSend(v8, "keyPath");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqualToString:", HFAnnounceEnabledKeyPath);

            if (v14)
            {
              -[HFMediaAccessoryCommonSettingsManager setAnnounceEnabledSetting:](self, "setAnnounceEnabledSetting:", v8);
            }
            else
            {
              objc_msgSend(v8, "keyPath");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", HFAudioAnalysisEnabledKeyPath);

              if (v16)
              {
                -[HFMediaAccessoryCommonSettingsManager setAudioAnalysisEnabledSetting:](self, "setAudioAnalysisEnabledSetting:", v8);
              }
              else
              {
                objc_msgSend(v8, "keyPath");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "isEqualToString:", HFAirPlayEnabledSettingKeyPath);

                if (v18)
                {
                  -[HFMediaAccessoryCommonSettingsManager setAirPlayEnabledSetting:](self, "setAirPlayEnabledSetting:", v8);
                }
                else
                {
                  objc_msgSend(v8, "keyPath");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  v20 = objc_msgSend(v19, "isEqualToString:", HFDoorbellChimeEnabledKeyPath);

                  if (v20)
                    -[HFMediaAccessoryCommonSettingsManager setDoorbellChimeEnabledSetting:](self, "setDoorbellChimeEnabledSetting:", v8);
                }
              }
            }
          }
        }
        -[HFMediaAccessoryCommonSettingsManager _settingKeyPaths](self, "_settingKeyPaths");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "keyPath");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "containsObject:", v22);

        if (v23)
        {
          v39 = v7;
          objc_msgSend(v8, "value");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v8;
          objc_msgSend(v8, "keyPath");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFMediaAccessoryCommonSettingsManager _updateCachedValue:forKeyPath:](self, "_updateCachedValue:forKeyPath:", v24, v25);

          v43 = 0u;
          v44 = 0u;
          v41 = 0u;
          v42 = 0u;
          -[HFMediaAccessoryCommonSettingsManager observers](self, "observers");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v42 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  -[HFMediaAccessoryCommonSettingsManager mediaProfileContainer](self, "mediaProfileContainer");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "keyPath");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v40, "value");
                  v34 = self;
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v31, "mediaProfileContainer:didUpdateSettingKeypath:value:", v32, v33, v35);

                  self = v34;
                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            }
            while (v28);
          }

          v6 = v36;
          v5 = v37;
          v7 = v39;
        }
        ++v7;
      }
      while (v7 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v5);
  }

}

- (void)_updateCachedValue:(id)a3 forKeyPath:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  HFLogForCategory(0x25uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Updating Cached Value for keyPath [%@] to [%@]", (uint8_t *)&v11, 0x16u);
  }

  if ((objc_msgSend(v8, "isEqualToString:", HFAnnounceEnabledKeyPath) & 1) != 0)
  {
    v10 = 104;
LABEL_15:
    objc_storeStrong((id *)((char *)&self->super.isa + v10), a3);
    goto LABEL_16;
  }
  if ((objc_msgSend(v8, "isEqualToString:", HFAudioAnalysisGroupKeyPath) & 1) != 0)
  {
    v10 = 112;
    goto LABEL_15;
  }
  if ((objc_msgSend(v8, "isEqualToString:", HFTapToAccessSiriSettingKeyPath) & 1) != 0)
  {
    v10 = 72;
    goto LABEL_15;
  }
  if ((objc_msgSend(v8, "isEqualToString:", HFAllowHeySiriSettingKeyPath) & 1) != 0)
  {
    v10 = 96;
    goto LABEL_15;
  }
  if ((objc_msgSend(v8, "isEqualToString:", HFAirPlayEnabledSettingKeyPath) & 1) != 0)
  {
    v10 = 120;
    goto LABEL_15;
  }
  if (objc_msgSend(v8, "isEqualToString:", HFDoorbellChimeEnabledKeyPath))
  {
    v10 = 128;
    goto LABEL_15;
  }
LABEL_16:

}

- (void)didReceiveSettingsUpdatesForAccessoryWithIdentifier:(id)a3 settings:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[HFMediaAccessoryCommonSettingsManager mediaProfileContainer](self, "mediaProfileContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_backingAccessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v6, "isEqual:", v9);
  if ((_DWORD)v7)
    -[HFMediaAccessoryCommonSettingsManager _updateSettings:](self, "_updateSettings:", v10);

}

- (void)updateSettingValue:(id)a3 forKeyPath:(id)a4 accessoryIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[HFMediaAccessoryCommonSettingsManager mediaProfileContainer](self, "mediaProfileContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_backingAccessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = objc_msgSend(v9, "isEqual:", v12);
  if ((_DWORD)v10)
    -[HFMediaAccessoryCommonSettingsManager _updateCachedValue:forKeyPath:](self, "_updateCachedValue:forKeyPath:", v13, v8);

}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setMediaProfileContainer:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProfileContainer, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
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

- (HMImmutableSetting)tapToAccessSiriSetting
{
  return self->_tapToAccessSiriSetting;
}

- (void)setTapToAccessSiriSetting:(id)a3
{
  objc_storeStrong((id *)&self->_tapToAccessSiriSetting, a3);
}

- (HMImmutableSetting)heySiriSetting
{
  return self->_heySiriSetting;
}

- (void)setHeySiriSetting:(id)a3
{
  objc_storeStrong((id *)&self->_heySiriSetting, a3);
}

- (HMImmutableSetting)announceEnabledSetting
{
  return self->_announceEnabledSetting;
}

- (void)setAnnounceEnabledSetting:(id)a3
{
  objc_storeStrong((id *)&self->_announceEnabledSetting, a3);
}

- (HMImmutableSetting)audioAnalysisEnabledSetting
{
  return self->_audioAnalysisEnabledSetting;
}

- (void)setAudioAnalysisEnabledSetting:(id)a3
{
  objc_storeStrong((id *)&self->_audioAnalysisEnabledSetting, a3);
}

- (id)tapToAccessSiriSettingCachedValue
{
  return self->_tapToAccessSiriSettingCachedValue;
}

- (void)setTapToAccessSiriSettingCachedValue:(id)a3
{
  objc_storeStrong(&self->_tapToAccessSiriSettingCachedValue, a3);
}

- (HMImmutableSetting)airPlayEnabledSetting
{
  return self->_airPlayEnabledSetting;
}

- (void)setAirPlayEnabledSetting:(id)a3
{
  objc_storeStrong((id *)&self->_airPlayEnabledSetting, a3);
}

- (HMImmutableSetting)doorbellChimeEnabledSetting
{
  return self->_doorbellChimeEnabledSetting;
}

- (void)setDoorbellChimeEnabledSetting:(id)a3
{
  objc_storeStrong((id *)&self->_doorbellChimeEnabledSetting, a3);
}

- (id)heySiriSettingCachedValue
{
  return self->_heySiriSettingCachedValue;
}

- (void)setHeySiriSettingCachedValue:(id)a3
{
  objc_storeStrong(&self->_heySiriSettingCachedValue, a3);
}

- (id)announceEnabledSettingCachedValue
{
  return self->_announceEnabledSettingCachedValue;
}

- (void)setAnnounceEnabledSettingCachedValue:(id)a3
{
  objc_storeStrong(&self->_announceEnabledSettingCachedValue, a3);
}

- (id)audioAnalysisEnabledSettingCachedValue
{
  return self->_audioAnalysisEnabledSettingCachedValue;
}

- (void)setAudioAnalysisEnabledSettingCachedValue:(id)a3
{
  objc_storeStrong(&self->_audioAnalysisEnabledSettingCachedValue, a3);
}

- (id)airPlayEnabledSettingCachedValue
{
  return self->_airPlayEnabledSettingCachedValue;
}

- (void)setAirPlayEnabledSettingCachedValue:(id)a3
{
  objc_storeStrong(&self->_airPlayEnabledSettingCachedValue, a3);
}

- (id)doorbellChimeEnabledSettingCachedValue
{
  return self->_doorbellChimeEnabledSettingCachedValue;
}

- (void)setDoorbellChimeEnabledSettingCachedValue:(id)a3
{
  objc_storeStrong(&self->_doorbellChimeEnabledSettingCachedValue, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_doorbellChimeEnabledSettingCachedValue, 0);
  objc_storeStrong(&self->_airPlayEnabledSettingCachedValue, 0);
  objc_storeStrong(&self->_audioAnalysisEnabledSettingCachedValue, 0);
  objc_storeStrong(&self->_announceEnabledSettingCachedValue, 0);
  objc_storeStrong(&self->_heySiriSettingCachedValue, 0);
  objc_storeStrong((id *)&self->_doorbellChimeEnabledSetting, 0);
  objc_storeStrong((id *)&self->_airPlayEnabledSetting, 0);
  objc_storeStrong(&self->_tapToAccessSiriSettingCachedValue, 0);
  objc_storeStrong((id *)&self->_audioAnalysisEnabledSetting, 0);
  objc_storeStrong((id *)&self->_announceEnabledSetting, 0);
  objc_storeStrong((id *)&self->_heySiriSetting, 0);
  objc_storeStrong((id *)&self->_tapToAccessSiriSetting, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end
