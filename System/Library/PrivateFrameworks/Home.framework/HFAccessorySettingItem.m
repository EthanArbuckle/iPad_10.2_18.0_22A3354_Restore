@implementation HFAccessorySettingItem

- (HFAccessorySettingItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HFAccessorySettingItem *v14;
  HFAccessorySettingItem *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingItem.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitSettingsVendor"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingItem.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("setting"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)HFAccessorySettingItem;
  v14 = -[HFAccessorySettingItem init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v15->_setting, a5);
    objc_storeStrong((id *)&v15->_usageOptions, a4);
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingItem usageOptions](self, "usageOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingItem setting](self, "setting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithHomeKitSettingsVendor:usageOptions:setting:", v5, v6, v7);

  objc_msgSend(v8, "copyLatestResultsFromItem:", self);
  return v8;
}

- (HFAccessorySettingsEntity)entity
{
  HFAccessorySettingsEntity *entity;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HFAccessorySettingsEntity *v9;
  HFAccessorySettingsEntity *v10;

  entity = self->_entity;
  if (!entity)
  {
    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_codex");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingItem settingKeyPath](self, "settingKeyPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_nodeWithKeyPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "representedObject");
    v9 = (HFAccessorySettingsEntity *)objc_claimAutoreleasedReturnValue();
    v10 = self->_entity;
    self->_entity = v9;

    entity = self->_entity;
  }
  return entity;
}

- (NSString)settingKeyPath
{
  void *v2;
  void *v3;

  -[HFAccessorySettingItem setting](self, "setting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
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
  -[HFAccessorySettingItem _decorateOutcomeWithResultKeys:](self, "_decorateOutcomeWithResultKeys:", v5);
  -[HFAccessorySettingItem _decorateOutcomeWithDependencies:](self, "_decorateOutcomeWithDependencies:", v5);
  -[HFAccessorySettingItem _decorateOutcomeWithAccessorySettingResultKeys:](self, "_decorateOutcomeWithAccessorySettingResultKeys:", v5);
  -[HFAccessorySettingItem _decorateHiddenOrDisabled:](self, "_decorateHiddenOrDisabled:", v5);
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
  int v13;
  HFAccessorySettingItem *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    NSLog(CFSTR("Value manager was nil!"));
  HFLogForCategory(0x39uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[HFAccessorySettingItem setting](self, "setting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = self;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "Updating setting item '%@/%@' to value: %@", (uint8_t *)&v13, 0x20u);

  }
  if (v6)
  {
    -[HFAccessorySettingItem setting](self, "setting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "changeValueForSetting:toValue:", v9, v4);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithError:", v9);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)value
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_settingsValueManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingItem setting](self, "setting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForSetting:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_validateKeyPathDependencies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12;
  id v13;

  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingItem entity](self, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "BOOLeanKeyPathDependencies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__HFAccessorySettingItem__validateKeyPathDependencies__block_invoke;
    v11[3] = &unk_1EA727E50;
    v12 = v4;
    v13 = v6;
    v9 = objc_msgSend(v8, "na_all:", v11);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __54__HFAccessorySettingItem__validateKeyPathDependencies__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "hf_accessorySettingAtKeyPath:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "valueForSetting:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "hf_codex");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "keyPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hf_nodeWithKeyPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "representedObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("BooleanDependencyFalseKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v14, "isEqualToString:", v16);

      v18 = v17 ^ 1u;
    }
    else
    {
      objc_opt_class();
      v7 = v4;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v7;
      else
        v19 = 0;
      v20 = v19;

      if (!v20)
      {
        v7 = 0;
        v18 = 1;
        goto LABEL_14;
      }
      objc_msgSend(*(id *)(a1 + 40), "valueForSetting:", v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v11, "BOOLValue");
    }

LABEL_14:
    goto LABEL_15;
  }
  v18 = 1;
LABEL_15:

  return v18;
}

- (void)_decorateOutcomeWithDependencies:(id)a3
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
  id v16;

  v4 = a3;
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("HFResultHomeKitSettingsVendorKey"));

  v6 = (void *)MEMORY[0x1E0C99E20];
  -[HFAccessorySettingItem setting](self, "setting");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithObject:", v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingItem entity](self, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "BOOLeanKeyPathDependencies");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "na_safeAddObjectsFromArray:", v10);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("HFResultSettingKeyPathsDependenciesKey"));
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "homekitObjectIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("HFResultSettingParentIdentifiersDependenciesKey"));

  v13 = (void *)MEMORY[0x1E0C99E60];
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithObject:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("dependentHomeKitObjects"));

}

- (void)_decorateOutcomeWithAccessorySettingResultKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  const __CFString *v43;
  const __CFString *v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  HFImageIconDescriptor *v56;
  int v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  int v66;
  void *v67;
  void *v68;
  void *v69;
  __CFString *v70;
  void *v71;
  void *v72;
  _QWORD v73[2];

  v73[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingItem entity](self, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingItem setting](self, "setting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v6;
  objc_msgSend(v6, "valueForSetting:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("HFAccessorySettingValueKey"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("HFAccessorySettingValueKey"));

  }
  -[HFAccessorySettingItem setting](self, "setting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HFAccessorySettingItem setting](self, "setting");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stepValue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = &unk_1EA7CD7C0;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("HFAccessorySettingNumberValueStepKey"));

    objc_msgSend(v13, "maximumValue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = &unk_1EA7CD7D0;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("HFAccessorySettingNumberValueMaxKey"));

    objc_msgSend(v13, "minimumValue");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = &unk_1EA7CD7E0;
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, CFSTR("HFAccessorySettingNumberValueMinKey"));

  }
  if (!v7)
  {
    v24 = (void *)MEMORY[0x1E0C9AA70];
LABEL_20:
    -[HFAccessorySettingItem setting](self, "setting");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = HFAccessorySettingsDefaultInterfaceModalityForHMAccessorySetting(v25);

    goto LABEL_21;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("HFAccessorySettingsEntityKey"));
  v23 = objc_msgSend(v7, "interfaceModality");
  objc_msgSend(v7, "userInfo");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 == 1 || v23 == -1)
    goto LABEL_20;
LABEL_21:
  -[HFAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v7;
  if ((objc_msgSend(v26, "isEqualToString:", CFSTR("root.siri.allowHeySiri")) & 1) == 0)
  {

    goto LABEL_26;
  }
  -[HFAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v27, "isEqualToString:", CFSTR("root.siri.allowHeySiri")) & 1) == 0)
  {

    goto LABEL_29;
  }
  v28 = _os_feature_enabled_impl();

  if ((v28 & 1) == 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v23);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("HFAccessorySettingInterfaceModalityKey");
LABEL_27:
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v29, v30);
LABEL_32:

    goto LABEL_33;
  }
LABEL_29:
  -[HFAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v29, "isEqualToString:", CFSTR("root.siri.allowHeySiri")))
    goto LABEL_32;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HFAccessorySettingInterfaceModalityKey"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {

    goto LABEL_32;
  }
  v57 = _os_feature_enabled_impl();

  if (v57)
  {
    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v58, "conformsToProtocol:", &unk_1F0449888))
      v59 = v58;
    else
      v59 = 0;
    v60 = v59;

    objc_msgSend(v60, "accessories");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v61, "anyObject");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "mediaProfile");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "hf_mediaAccessoryCommonSettingsManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "settingValueForKeyPath:", HFAllowHeySiriSettingKeyPath);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "BOOLValue");

    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "hf_settingsValueManager");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "valueForSettingAtKeyPath:", CFSTR("root.siri.allowHeySiri"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v63) = objc_msgSend(v69, "BOOLValue");

    if (v66 | v63)
      v70 = CFSTR("HFSiriSetting_On");
    else
      v70 = CFSTR("HFSiriSetting_Off");
    _HFLocalizedStringWithDefaultValue(v70, v70, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CFSTR("description");
    goto LABEL_27;
  }
LABEL_33:
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("HFAccessorySettingUserInfoKey"));
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v33 = objc_opt_isKindOfClass();

  if ((v33 & 1) != 0)
  {
    objc_opt_class();
    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v35 = v34;
    else
      v35 = 0;
    v36 = v35;

    objc_msgSend(v36, "accessory");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "mediaProfile");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = +[HFMediaHelper isHomePodOriginal:](HFMediaHelper, "isHomePodOriginal:", v38);

    objc_msgSend(v36, "accessory");
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "mediaProfile");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = +[HFMediaHelper isHomePodMini:](HFMediaHelper, "isHomePodMini:", v41);

    v43 = CFSTR("homepodmini.fill");
    v44 = CFSTR("homepod.fill");
  }
  else
  {
    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v46 = objc_opt_isKindOfClass();

    v43 = CFSTR("homepodmini.fill");
    v44 = CFSTR("homepod.fill");
    if ((v46 & 1) != 0)
    {
      objc_opt_class();
      -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v48 = v47;
      else
        v48 = 0;
      v49 = v48;

      v39 = +[HFMediaHelper isHomePodOriginalMediaSystem:](HFMediaHelper, "isHomePodOriginalMediaSystem:", v49);
      v42 = +[HFMediaHelper isHomePodMiniMediaSystem:](HFMediaHelper, "isHomePodMiniMediaSystem:", v49);

      if (v42)
        v43 = CFSTR("homepodmini.2.fill");
      if (v39)
        v44 = CFSTR("homepod.2.fill");
    }
    else
    {
      v39 = 0;
      v42 = 0;
    }
  }
  v50 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "_configurationWithHierarchicalColors:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:", *MEMORY[0x1E0CEB5B0]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "configurationByApplyingConfiguration:", v53);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    v56 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", v44, v55);
    if (!v56)
      goto LABEL_54;
    goto LABEL_53;
  }
  if (v42)
  {
    v56 = -[HFImageIconDescriptor initWithSystemImageNamed:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:", v43);
    if (v56)
    {
LABEL_53:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v56, CFSTR("icon"));

    }
  }
LABEL_54:

}

- (void)_decorateOutcomeWithResultKeys:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  __CFString *v57;
  const __CFString *v58;
  int v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  id v65;

  v65 = a3;
  -[HFAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryDetails.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v5, CFSTR("HFResultDisplayAccessibilityIDKey"));

  -[HFAccessorySettingItem entity](self, "entity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overrideLocalizedTitleKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HFAccessorySettingItem entity](self, "entity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overrideLocalizedTitleKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v9, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

LABEL_5:
    goto LABEL_6;
  }
  -[HFAccessorySettingItem setting](self, "setting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HFAccessorySettingItem setting](self, "setting");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v9, CFSTR("title"));
    goto LABEL_5;
  }
  NSLog(CFSTR("Accessory Setting Property is unnamed!"));
LABEL_6:
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v4, CFSTR("HFAccessorySettingKeyPathKey"));
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[HFAccessorySettingItem setting](self, "setting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithBool:", objc_msgSend(v14, "isWritable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v15, CFSTR("HFAccessorySettingIsWritableKey"));

  -[HFAccessorySettingItem setting](self, "setting");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setObject:forKeyedSubscript:", v16, CFSTR("HFAccessorySettingRepresentitiveObjectKey"));

  -[HFAccessorySettingItem entity](self, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "interfaceModality");

  if (v18 == 9)
  {
    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hf_settingsAdapterManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingItem entity](self, "entity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "adapterIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "adapterForIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "conformsToProtocol:", &unk_1F042DCF0))
      v24 = v23;
    else
      v24 = 0;
    v25 = v24;

    -[HFAccessorySettingItem entity](self, "entity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "inProgressButtonPressFutureForEntity:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v65, "setObject:forKeyedSubscript:", v27, CFSTR("HFResultActionFutureKey"));
  }
  -[HFAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "isEqualToString:", CFSTR("root.siri.allowHeySiri")))
    v29 = _os_feature_enabled_impl();
  else
    v29 = 0;

  -[HFAccessorySettingItem settingKeyPath](self, "settingKeyPath");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("root.siri.allowHeySiri"));

  if (!v31 || v29)
  {
    if (v29)
    {
      -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "hf_home");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "siriPhraseOptions") == 3)
      {
        -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "hf_home");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "hf_atLeastOneMediaAccessoryWithSupportingJustSiriLanguage");

        if (v36)
          v37 = CFSTR("HFJustSiriOrHeySiri_Home_Level_Setting_Title");
        else
          v37 = CFSTR("HFHeySiri_Home_Level_Setting_Title");
      }
      else
      {

        v37 = CFSTR("HFHeySiri_Home_Level_Setting_Title");
      }
      _HFLocalizedStringWithDefaultValue(v37, v37, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v38, CFSTR("title"));

    }
    -[HFAccessorySettingItem entity](self, "entity");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "previewValueKeyPath");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {

    }
    else
    {
      -[HFAccessorySettingItem entity](self, "entity");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "previewAccessory");

      if (!v42)
        goto LABEL_37;
    }
    -[HFAccessorySettingItem entity](self, "entity");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "previewAccessory");

    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if ((v44 & 1) != 0)
    {
      v47 = 0;
    }
    else
    {
      objc_msgSend(v45, "hf_settingsValueManager");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "settings");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingItem entity](self, "entity");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "previewValueKeyPath");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "hf_accessorySettingAtKeyPath:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "valueForSetting:", v53);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v53, "hf_isBooleanSetting");

    }
    -[HFAccessorySettingItem entity](self, "entity");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "previewValueFormatter");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (v55)
    {
      objc_msgSend(v55, "stringForObjectValue:", v46);
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v46)
        v59 = v47;
      else
        v59 = 0;
      if (v59 == 1)
      {
        objc_opt_class();
        v60 = v46;
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v61 = v60;
        else
          v61 = 0;
        v62 = v61;

        +[HFAccessorySettingFormatterFactory defaultFactory](HFAccessorySettingFormatterFactory, "defaultFactory");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "formatterForKey:", CFSTR("AccessorySettingsDefaultFormatter"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "stringForObjectValue:", v62);
        v57 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_33;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v57 = 0;
        goto LABEL_33;
      }
      v56 = v46;
    }
    v57 = v56;
LABEL_33:
    if (v57)
      v58 = v57;
    else
      v58 = &stru_1EA741FF8;
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v58, CFSTR("description"));

  }
LABEL_37:

}

- (void)_decorateHiddenOrDisabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void (**v17)(void *, void *, const __CFString *);
  __objc2_class **v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  const __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  char v48;
  void *v49;
  int v50;
  void *v51;
  char isKindOfClass;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  int v58;
  unsigned int v59;
  __CFString *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  int v65;
  uint64_t v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  int v81;
  NSObject *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  int v87;
  unsigned int v88;
  unsigned int v89;
  void *v90;
  uint64_t v91;
  id v92;
  _QWORD aBlock[5];
  id v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFAccessorySettingItem entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_currentUserIsAdministrator");

  -[HFAccessorySettingItem setting](self, "setting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isWritable");

  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isControllable");

  -[HFAccessorySettingItem usageOptions](self, "usageOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "BOOLValue");

  v91 = objc_opt_new();
  v90 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HFAccessorySettingItem__decorateHiddenOrDisabled___block_invoke;
  aBlock[3] = &unk_1EA727E78;
  aBlock[4] = self;
  v92 = v5;
  v94 = v92;
  v17 = (void (**)(void *, void *, const __CFString *))_Block_copy(aBlock);
  v18 = off_1EA722000;
  v88 = v8;
  if ((v8 & 1) == 0 && !v16)
  {
    v19 = 0;
    v20 = CFSTR("Current User is not administrator.");
    v21 = (void *)v91;
LABEL_38:
    v17[2](v17, v21, v20);
    v89 = 1;
    goto LABEL_41;
  }
  if (-[HFAccessorySettingItem _validateKeyPathDependencies](self, "_validateKeyPathDependencies"))
  {
    v19 = 0;
    v89 = 0;
  }
  else
  {
    v22 = objc_msgSend(v92, "requiresDependenciesToShowSetting");
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v92, "BOOLeanKeyPathDependencies");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("KeyPath dependencies possess one or more failed cases: %@"), v24);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v22)
      v26 = (void *)v91;
    else
      v26 = v90;
    v17[2](v17, v26, v25);

    v89 = v22;
    v19 = v22 ^ 1;
  }
  if ((v10 & v13 & 1) == 0)
  {
    if ((v10 & 1) == 0)
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      -[HFAccessorySettingItem setting](self, "setting");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "keyPath");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingItem setting](self, "setting");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingItem setting](self, "setting");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isWritable");
      v33 = CFSTR("Read Only");
      if (v32)
        v33 = CFSTR("Read/Write");
      objc_msgSend(v27, "stringWithFormat:", CFSTR("Setting '%@' is readonly: %@/%@"), v29, v30, v33);
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v90, v34);

    }
    if ((v13 & 1) == 0)
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      -[HFAccessorySettingItem setting](self, "setting");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "keyPath");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "settings");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("Setting '%@' is not controllable: %@/%@"), v37, v39, CFSTR("NOT CONTROLLABLE"));
      v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17[2](v17, v90, v40);

    }
    v19 = 1;
  }
  -[HFAccessorySettingItem setting](self, "setting");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "keyPath");
  v42 = objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend((id)v42, "isEqualToString:", CFSTR("root.announce.enabled"));

  -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v42) = objc_opt_isKindOfClass();

  if ((v42 & 1) != 0)
  {
    objc_opt_class();
    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v45 = v44;
    else
      v45 = 0;
    v46 = v45;

    objc_msgSend(v46, "accessory");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "hf_isHomePod");

    objc_msgSend(v46, "accessory");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = objc_msgSend(v49, "supportsAudioAnalysis");
    if ((v48 & 1) == 0)
      goto LABEL_31;
  }
  else
  {
    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      v50 = 0;
LABEL_31:
      v59 = 0;
      LOBYTE(v58) = 0;
      goto LABEL_32;
    }
    objc_opt_class();
    -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v54 = v53;
    else
      v54 = 0;
    v55 = v54;

    objc_msgSend(v55, "accessories");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v56, "anyObject");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v57, "supportsAudioAnalysis");

    if (!v55)
      goto LABEL_31;
  }
  v58 = !+[HFUtilities isAMac](HFUtilities, "isAMac");
  v59 = 1;
LABEL_32:
  if (v87 && (v58 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Announce settings should be hidden since containsHomePod = %{BOOL}d isAMac = %{BOOL}d"), v59, +[HFUtilities isAMac](HFUtilities, "isAMac"));
    v60 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, (void *)v91, v60);

    v89 = 1;
  }
  -[HFAccessorySettingItem setting](self, "setting");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "keyPath");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("root.audioAnalysis.enabled"));

  if (v63)
  {
    v21 = (void *)v91;
    if ((v59 & v50 & 1) == 0)
    {
      v20 = CFSTR("Audio Analysis settings should be hidden");
      v18 = off_1EA722000;
      goto LABEL_38;
    }
  }
  else
  {
    v21 = (void *)v91;
  }
  v18 = off_1EA722000;
LABEL_41:
  if ((-[__objc2_class supportsAnalytics](v18[262], "supportsAnalytics") & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HFAccessorySettingKeyPathKey"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "isEqual:", CFSTR("root.general.analytics.shareSpeakerAnalytics"));

    v19 = v19 | v65;
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA7CB800, CFSTR("state"));
  if (objc_msgSend(v92, "interfaceModality") == 5)
  {
    -[HFAccessorySettingItem setting](self, "setting");
    v66 = objc_claimAutoreleasedReturnValue();
    if (v66)
    {
      v67 = (void *)v66;
      -[HFAccessorySettingItem setting](self, "setting");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v69 = objc_opt_isKindOfClass();

      if ((v69 & 1) != 0)
      {
        -[HFAccessorySettingItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "hf_settingsValueManager");
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        v72 = (void *)MEMORY[0x1E0CB37E8];
        -[HFAccessorySettingItem setting](self, "setting");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "valueForSetting:", v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v74, "BOOLValue"))
          v75 = 2;
        else
          v75 = 1;
        objc_msgSend(v72, "numberWithInteger:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v76, CFSTR("state"));

        v21 = (void *)v91;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v89);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v77, CFSTR("hidden"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v78, CFSTR("isDisabled"));

  if ((v19 & 1) == 0)
  {
    -[HFAccessorySettingItem usageOptions](self, "usageOptions");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("HMSettingDisplayOption_AllowNonAdminAccess"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = objc_msgSend(v80, "BOOLValue");

    if (v81)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("shouldDisableForNonAdminUsers"));
  }
  if (objc_msgSend(v90, "count"))
  {
    HFLogForCategory(0x29uLL);
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v92, "keyPath");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v96 = v83;
      v97 = 2112;
      v98 = v90;
      _os_log_impl(&dword_1DD34E000, v82, OS_LOG_TYPE_DEFAULT, "Setting Item @ keypath '%@' is disabled for reasons: %@", buf, 0x16u);

    }
  }
  if (objc_msgSend(v21, "count"))
  {
    HFLogForCategory(0x29uLL);
    v84 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v92, "keyPath");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v96 = v85;
      v97 = 2112;
      v98 = v21;
      _os_log_impl(&dword_1DD34E000, v84, OS_LOG_TYPE_DEFAULT, "Setting Item @ keypath '%@' is hidden for reasons: %@", buf, 0x16u);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v88);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v86, CFSTR("administrator"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));
}

void __52__HFAccessorySettingItem__decorateHiddenOrDisabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setting");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    objc_msgSend(v7, "na_safeAddObject:", v5);
    goto LABEL_5;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "alwaysShowGroup") & 1) == 0)
    goto LABEL_4;
LABEL_5:

}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (void)setHomeKitSettingsVendor:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, a3);
}

- (HMSetting)setting
{
  return self->_setting;
}

- (void)setSetting:(id)a3
{
  objc_storeStrong((id *)&self->_setting, a3);
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_usageOptions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_setting, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
}

@end
