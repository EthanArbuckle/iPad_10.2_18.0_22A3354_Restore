@implementation HFHomeKitAccessorySettingItem

- (HFHomeKitAccessorySettingItem)initWithSettingsController:(id)a3 localizedTitle:(id)a4 homeIdentifier:(id)a5 accessoryIdentifier:(id)a6 settingDict:(id)a7 usageOptions:(id)a8
{
  id v15;
  id v16;
  id v17;
  HFHomeKitAccessorySettingItem *v18;
  HFHomeKitAccessorySettingItem *v19;
  void *v20;
  uint64_t v21;
  NSString *settingKeyPath;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v15 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v16 = a7;
  v17 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HFHomeKitAccessorySettingItem;
  v18 = -[HFHomeKitAccessorySettingItem init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_settingsController, a3);
    objc_storeStrong((id *)&v19->_localizedTitle, a4);
    objc_storeStrong((id *)&v19->_homeIdentifier, a5);
    objc_storeStrong((id *)&v19->_accessoryIdentifier, a6);
    objc_storeStrong((id *)&v19->_settingDict, a7);
    -[NSDictionary allKeys](v19->_settingDict, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = objc_claimAutoreleasedReturnValue();
    settingKeyPath = v19->_settingKeyPath;
    v19->_settingKeyPath = (NSString *)v21;

    objc_storeStrong((id *)&v19->_usageOptions, a8);
    -[NSDictionary objectForKeyedSubscript:](v19->_settingDict, "objectForKeyedSubscript:", v19->_settingKeyPath);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", HFUIInterfaceTypeKey);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v23, "objectForKeyedSubscript:", HFUIInterfaceTypeKey);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_userInterfaceType = objc_msgSend(v25, "integerValue");

    }
    else
    {
      v19->_userInterfaceType = -1;
    }

  }
  return v19;
}

- (HFHomeKitAccessorySettingItem)initWithSetting:(id)a3 sourceItem:(id)a4 localizedTitle:(id)a5 settingsController:(id)a6 homeIdentifier:(id)a7 accessoryIdentifier:(id)a8 settingDict:(id)a9 usageOptions:(id)a10
{
  id v17;
  HFHomeKitAccessorySettingItem *v18;
  HFHomeKitAccessorySettingItem *v19;
  uint64_t v20;
  id cachedSettingValue;
  id v23;

  v23 = a3;
  v17 = a4;
  v18 = -[HFHomeKitAccessorySettingItem initWithSettingsController:localizedTitle:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:](self, "initWithSettingsController:localizedTitle:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:", a6, a5, a7, a8, a9, a10);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_setting, a3);
    objc_storeStrong((id *)&v19->_sourceItem, a4);
    -[HMImmutableSetting value](v19->_setting, "value");
    v20 = objc_claimAutoreleasedReturnValue();
    cachedSettingValue = v19->_cachedSettingValue;
    v19->_cachedSettingValue = (id)v20;

  }
  return v19;
}

- (HFHomeKitAccessorySettingItem)initWithDefaultSetting:(id)a3 sourceItem:(id)a4 localizedTitle:(id)a5 settingsController:(id)a6 homeIdentifier:(id)a7 accessoryIdentifier:(id)a8 settingDict:(id)a9 usageOptions:(id)a10
{
  HFHomeKitAccessorySettingItem *v10;
  NSObject *v11;
  uint8_t buf[4];
  HFHomeKitAccessorySettingItem *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = -[HFHomeKitAccessorySettingItem initWithSetting:sourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:](self, "initWithSetting:sourceItem:localizedTitle:settingsController:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:", a3, a4, a5, a6, a7, a8, a9, a10);
  if (v10)
  {
    HFLogForCategory(0x25uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v10;
      _os_log_debug_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEBUG, "Initialized Default Accessory Setting Item = [%@]", buf, 0xCu);
    }

    v10->_disabled = 1;
  }
  return v10;
}

- (HFHomeKitAccessorySettingItem)initWithSourceItem:(id)a3 localizedTitle:(id)a4 settingsController:(id)a5 homeIdentifier:(id)a6 accessoryIdentifier:(id)a7 settingDict:(id)a8 usageOptions:(id)a9
{
  id v16;
  HFHomeKitAccessorySettingItem *v17;
  HFHomeKitAccessorySettingItem *v18;

  v16 = a3;
  v17 = -[HFHomeKitAccessorySettingItem initWithSettingsController:localizedTitle:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:](self, "initWithSettingsController:localizedTitle:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:", a5, a4, a6, a7, a8, a9);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_sourceItem, a3);
    v18->_disabled = 1;
  }

  return v18;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HFHomeKitAccessorySettingItem homeIdentifier](self, "homeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem accessoryIdentifier](self, "accessoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem setting](self, "setting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem settingDict](self, "settingDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("homeIdentifier:[%@], accessoryIdentifier:[%@], keyPath:[%@], settingDict:[%@]"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)targetSettingKeyPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFHomeKitAccessorySettingItem settingDict](self, "settingDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", HFHomeKitSettingTargetKeyPathKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setIsControllable:(BOOL)a3
{
  id v4;

  if (self->_isControllable != a3)
  {
    self->_isControllable = a3;
    -[HFHomeKitAccessorySettingItem setDisabled:](self, "setDisabled:", !a3);
    v4 = -[HFItem updateWithOptions:](self, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  }
}

- (BOOL)updateSetting:(id)a3
{
  id v5;
  HMImmutableSetting **p_setting;
  void *v7;
  void *v8;
  BOOL v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id cachedSettingValue;
  id v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_setting = &self->_setting;
  -[HMImmutableSetting value](self->_setting, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
  {
    v9 = -[HFHomeKitAccessorySettingItem isDisabled](self, "isDisabled");

    if (!v9)
    {
      v10 = 0;
      goto LABEL_8;
    }
  }
  else
  {

  }
  HFLogForCategory(0x25uLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[HMImmutableSetting keyPath](*p_setting, "keyPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Updating setting [%@] with new value [%@]", (uint8_t *)&v18, 0x16u);

  }
  -[HFHomeKitAccessorySettingItem setDisabled:](self, "setDisabled:", 0);
  objc_storeStrong((id *)&self->_setting, a3);
  -[HMImmutableSetting value](*p_setting, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  cachedSettingValue = self->_cachedSettingValue;
  self->_cachedSettingValue = v14;

  v16 = -[HFItem updateWithOptions:](self, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  v10 = 1;
LABEL_8:

  return v10;
}

- (void)updateSettingValue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id cachedSettingValue;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x25uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFHomeKitAccessorySettingItem settingKeyPath](self, "settingKeyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Updating setting value for keypath [%@] with new value [%@]", (uint8_t *)&v9, 0x16u);

  }
  -[HFHomeKitAccessorySettingItem setDisabled:](self, "setDisabled:", 0);
  cachedSettingValue = self->_cachedSettingValue;
  self->_cachedSettingValue = v4;

  v8 = -[HFItem updateWithOptions:](self, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
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

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFHomeKitAccessorySettingItem settingsController](self, "settingsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem homeIdentifier](self, "homeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem accessoryIdentifier](self, "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem settingDict](self, "settingDict");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem usageOptions](self, "usageOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithSettingsController:localizedTitle:homeIdentifier:accessoryIdentifier:settingDict:usageOptions:", v5, v6, v7, v8, v9, v10);

  -[HFHomeKitAccessorySettingItem sourceItem](self, "sourceItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSourceItem:", v12);

  -[HFHomeKitAccessorySettingItem setting](self, "setting");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSetting:", v13);

  -[HFHomeKitAccessorySettingItem cachedSettingValue](self, "cachedSettingValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCachedSettingValue:", v14);

  objc_msgSend(v11, "copyLatestResultsFromItem:", self);
  return v11;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  HFMutableItemUpdateOutcome *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(HFMutableItemUpdateOutcome);
  -[HFHomeKitAccessorySettingItem _decorateOutcomeWithResultKeys:](self, "_decorateOutcomeWithResultKeys:", v5);
  if (v4)
  {
    -[HFMutableItemUpdateOutcome results](v5, "results");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "addEntriesFromDictionary:", v4);
    -[HFMutableItemUpdateOutcome setResults:](v5, "setResults:", v7);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)updateValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFHomeKitAccessorySettingItem setting](self, "setting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeKitAccessorySettingValueForRawValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x25uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[HFHomeKitAccessorySettingItem settingKeyPath](self, "settingKeyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Now updating setting keypath [%@] with HMImmutableSettingValue = [%@]", (uint8_t *)&v15, 0x16u);

  }
  -[HFHomeKitAccessorySettingItem settingsController](self, "settingsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem homeIdentifier](self, "homeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem accessoryIdentifier](self, "accessoryIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hf_updateAccessorySettingWithHomeIdentifier:accessoryIdentifier:keyPath:settingValue:", v10, v11, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_decorateOutcomeWithResultKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFHomeKitAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem localizedTitle](self, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("title"));

  -[HFHomeKitAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", HFAllowHeySiriSettingKeyPath))
  {
    v8 = _os_feature_enabled_impl();

    if (!v8)
      goto LABEL_13;
    -[HFHomeKitAccessorySettingItem sourceItem](self, "sourceItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "home");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "siriPhraseOptions") == 3)
    {
      -[HFHomeKitAccessorySettingItem sourceItem](self, "sourceItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "home");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");

      if (v13)
        v14 = CFSTR("HFJustSiriOrHeySiri_Home_Level_Setting_Title");
      else
        v14 = CFSTR("HFHeySiri_Home_Level_Setting_Title");
    }
    else
    {

      v14 = CFSTR("HFHeySiri_Home_Level_Setting_Title");
    }
    _HFLocalizedStringWithDefaultValue(v14, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("title"));

    -[HFHomeKitAccessorySettingItem sourceItem](self, "sourceItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "hf_atleastOneMediaAccessoryHasSiriEnabled"))
      v17 = CFSTR("HFSiriSetting_On");
    else
      v17 = CFSTR("HFSiriSetting_Off");
    _HFLocalizedStringWithDefaultValue(v17, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("description"));

  }
LABEL_13:
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HFAccessorySettingKeyPathKey"));
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[HFHomeKitAccessorySettingItem setting](self, "setting");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithBool:", objc_msgSend(v20, "isReadOnly"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("HFAccessorySettingIsWritableKey"));

  -[HFHomeKitAccessorySettingItem setting](self, "setting");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("HFAccessorySettingRepresentitiveObjectKey"));

  -[HFHomeKitAccessorySettingItem settingDict](self, "settingDict");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", HFUIInterfaceTypeKey);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "integerValue");

  -[NSDictionary objectForKeyedSubscript:](self->_settingDict, "objectForKeyedSubscript:", self->_settingKeyPath);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", HFDisplaySettingValueKey);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "BOOLValue");

  if (v27)
  {
    -[HFHomeKitAccessorySettingItem _formattedValueForSetting](self, "_formattedValueForSetting");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v28)
      v30 = (const __CFString *)v28;
    else
      v30 = &stru_1EA741FF8;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v30, CFSTR("description"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HFHomeKitAccessorySettingItem isDisabled](self, "isDisabled"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v31, CFSTR("isDisabled"));

  HFLogForCategory(0x25uLL);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    -[HFHomeKitAccessorySettingItem setting](self, "setting");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138412546;
    v44 = v42;
    v45 = 2112;
    v46 = v4;
    _os_log_debug_impl(&dword_1DD34E000, v32, OS_LOG_TYPE_DEBUG, "Finished configuring setting [%@] with options = [%@]", (uint8_t *)&v43, 0x16u);

  }
  -[HFHomeKitAccessorySettingItem settingDict](self, "settingDict");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v34, "objectForKey:", HFDisplayValuePreviewFromKeyPath);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v35;
  if (v35)
    v37 = (void *)v35;
  else
    v37 = v5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v38, CFSTR("HFResultSettingKeyPathsDependenciesKey"));

  v39 = (void *)MEMORY[0x1E0C99E60];
  -[HFHomeKitAccessorySettingItem accessoryIdentifier](self, "accessoryIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setWithObject:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v41, CFSTR("HFResultSettingParentIdentifiersDependenciesKey"));

}

- (id)_formattedValueForSetting
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;

  -[HFHomeKitAccessorySettingItem settingDict](self, "settingDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFHomeKitAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", HFDisplayValuePreviewFormatterKey);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[HFAccessorySettingFormatterFactory defaultFactory](HFAccessorySettingFormatterFactory, "defaultFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formatterForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", HFDisplayValuePreviewFromAccessoryKey);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  -[HFHomeKitAccessorySettingItem settingValue](self, "settingValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[HFHomeKitAccessorySettingItem sourceItem](self, "sourceItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "anyObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mediaProfile");
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  if (v8)
  {
    objc_msgSend(v8, "stringForObjectValue:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    v17 = v11;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v19 = v18;

    if (v19 && (v20 = objc_retainAutorelease(v19), !strcmp((const char *)objc_msgSend(v20, "objCType"), "B")))
    {
      +[HFAccessorySettingFormatterFactory defaultFactory](HFAccessorySettingFormatterFactory, "defaultFactory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "formatterForKey:", CFSTR("AccessorySettingsDefaultFormatter"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v20, "BOOLValue"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringForObjectValue:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v16;
}

- (NSUUID)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (unint64_t)displayIndex
{
  return self->_displayIndex;
}

- (void)setDisplayIndex:(unint64_t)a3
{
  self->_displayIndex = a3;
}

- (NSDictionary)settingDict
{
  return self->_settingDict;
}

- (void)setSettingDict:(id)a3
{
  objc_storeStrong((id *)&self->_settingDict, a3);
}

- (NSString)settingKeyPath
{
  return self->_settingKeyPath;
}

- (void)setSettingKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_usageOptions, a3);
}

- (int64_t)userInterfaceType
{
  return self->_userInterfaceType;
}

- (void)setUserInterfaceType:(int64_t)a3
{
  self->_userInterfaceType = a3;
}

- (BOOL)isControllable
{
  return self->_isControllable;
}

- (HFServiceLikeItem)sourceItem
{
  return self->_sourceItem;
}

- (void)setSourceItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceItem, a3);
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifier, a3);
}

- (HMImmutableSetting)setting
{
  return self->_setting;
}

- (void)setSetting:(id)a3
{
  objc_storeStrong((id *)&self->_setting, a3);
}

- (HMAccessorySettingsController)settingsController
{
  return self->_settingsController;
}

- (void)setSettingsController:(id)a3
{
  objc_storeStrong((id *)&self->_settingsController, a3);
}

- (id)cachedSettingValue
{
  return self->_cachedSettingValue;
}

- (void)setCachedSettingValue:(id)a3
{
  objc_storeStrong(&self->_cachedSettingValue, a3);
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cachedSettingValue, 0);
  objc_storeStrong((id *)&self->_settingsController, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_settingKeyPath, 0);
  objc_storeStrong((id *)&self->_settingDict, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

@end
