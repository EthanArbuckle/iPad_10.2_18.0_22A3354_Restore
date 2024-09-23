@implementation HFAccessorySettingGroupItem

- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HFAccessorySettingGroupItem *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rootGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HFAccessorySettingGroupItem initWithHomeKitSettingsVendor:usageOptions:group:](self, "initWithHomeKitSettingsVendor:usageOptions:group:", v7, v6, v9);
  return v10;
}

- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 entity:(id)a5
{
  id v10;
  id v11;
  id v12;
  HFAccessorySettingGroupItem *v13;
  HFAccessorySettingGroupItem *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingGroupItem.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitSettingsVendor"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HFAccessorySettingGroupItem;
  v13 = -[HFAccessorySettingGroupItem init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_entity, a5);
    objc_storeStrong((id *)&v14->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v14->_usageOptions, a4);
  }

  return v14;
}

- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 group:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HFAccessorySettingGroupItem *v18;
  HFAccessorySettingGroupItem *v19;
  void *v21;
  void *v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingGroupItem.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitSettingsVendor"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingGroupItem.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("group"));

LABEL_3:
  objc_msgSend(v12, "keyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hf_codex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_nodeWithKeyPath:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "representedObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[HFAccessorySettingGroupItem initWithHomeKitSettingsVendor:usageOptions:entity:](self, "initWithHomeKitSettingsVendor:usageOptions:entity:", v9, v10, v17);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_settingGroup, a5);

  return v19;
}

- (HFAccessorySettingGroupItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 selectionSetting:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HFAccessorySettingGroupItem *v18;
  HFAccessorySettingGroupItem *v19;
  void *v21;
  void *v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingGroupItem.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitSettingsVendor"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingGroupItem.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("selectionSetting"));

LABEL_3:
  objc_msgSend(v12, "keyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "settings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hf_codex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_nodeWithKeyPath:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "representedObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[HFAccessorySettingGroupItem initWithHomeKitSettingsVendor:usageOptions:entity:](self, "initWithHomeKitSettingsVendor:usageOptions:entity:", v9, v10, v17);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_selectionSetting, a5);

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  -[HFAccessorySettingGroupItem selectionSetting](self, "selectionSetting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingGroupItem usageOptions](self, "usageOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingGroupItem selectionSetting](self, "selectionSetting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "initWithHomeKitSettingsVendor:usageOptions:selectionSetting:", v7, v8, v9);
  }
  else
  {
    -[HFAccessorySettingGroupItem settingGroup](self, "settingGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingGroupItem usageOptions](self, "usageOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[HFAccessorySettingGroupItem settingGroup](self, "settingGroup");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "initWithHomeKitSettingsVendor:usageOptions:group:", v7, v8, v9);
    }
    else
    {
      -[HFAccessorySettingGroupItem entity](self, "entity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v12, "initWithHomeKitSettingsVendor:usageOptions:entity:", v7, v8, v9);
    }
  }
  v13 = (void *)v10;

  objc_msgSend(v13, "copyLatestResultsFromItem:", self);
  return v13;
}

- (NSString)settingKeyPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HFAccessorySettingGroupItem selectionSetting](self, "selectionSetting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFAccessorySettingGroupItem selectionSetting](self, "selectionSetting");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFAccessorySettingGroupItem settingGroup](self, "settingGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[HFAccessorySettingGroupItem settingGroup](self, "settingGroup");
    else
      -[HFAccessorySettingGroupItem entity](self, "entity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v4;
  objc_msgSend(v4, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFAccessorySettingGroupItem *v4;
  void *v5;
  void *v6;
  HFMutableItemUpdateOutcome *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  char v23;
  void *v24;
  void *v25;
  char *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  int v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  const char *aSelector;
  SEL aSelectora;
  SEL aSelectorb;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  uint64_t v83;

  v4 = self;
  v83 = *MEMORY[0x1E0C80C00];
  -[HFAccessorySettingGroupItem entity](self, "entity", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingGroupItem settingKeyPath](v4, "settingKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(HFMutableItemUpdateOutcome);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryDetails.%@"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, CFSTR("HFResultDisplayAccessibilityIDKey"));

  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &unk_1EA7CBF68, CFSTR("state"));
  -[HFAccessorySettingGroupItem entity](v4, "entity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previewValueKeyPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[HFAccessorySettingGroupItem settingKeyPath](v4, "settingKeyPath");
    v12 = (char *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, CFSTR("HFResultSettingKeyPathsDependenciesKey"));

  -[HFAccessorySettingGroupItem homeKitSettingsVendor](v4, "homeKitSettingsVendor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "homekitObjectIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v16, CFSTR("HFResultSettingParentIdentifiersDependenciesKey"));

  v17 = (void *)MEMORY[0x1E0C99E60];
  -[HFAccessorySettingGroupItem homeKitSettingsVendor](v4, "homeKitSettingsVendor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v19, CFSTR("dependentHomeKitObjects"));

  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));
  -[HFAccessorySettingGroupItem homeKitSettingsVendor](v4, "homeKitSettingsVendor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v20, CFSTR("HFResultHomeKitSettingsVendorKey"));

  objc_msgSend(v5, "previewValueKeyPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0x1E0CB3000;
  if (v21)
  {

  }
  else if ((objc_msgSend(v5, "previewAccessory") & 1) == 0)
  {
    goto LABEL_39;
  }
  v23 = objc_msgSend(v5, "previewAccessory");
  -[HFAccessorySettingGroupItem homeKitSettingsVendor](v4, "homeKitSettingsVendor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  aSelector = a2;
  v26 = v13;
  if ((v23 & 1) != 0)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(v24, "hf_settingsValueManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFAccessorySettingGroupItem homeKitSettingsVendor](v4, "homeKitSettingsVendor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "settings");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewValueKeyPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "hf_accessorySettingAtKeyPath:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v28, "valueForSetting:", v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v32, "hf_isBooleanSetting");

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "homeManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "hasOptedToHH2");

  if (v35
    && ((objc_msgSend(v6, "isEqualToString:", CFSTR("root.siri.recognitionLanguage")) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("root.siri.outputVoice"))))
  {
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](v4, "homeKitSettingsVendor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "conformsToProtocol:", &unk_1F0449888))
      v37 = v36;
    else
      v37 = 0;
    v38 = v37;

    objc_msgSend(v38, "hf_siriLanguageOptionsManager");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (v39)
    {
      HFLogForCategory(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(aSelector);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v80 = v41;
        v81 = 2112;
        v82 = v6;
        _os_log_impl(&dword_1DD34E000, v40, OS_LOG_TYPE_DEFAULT, "%@ language setting %@ is being formatted, fetching the option from the siri endpoint manager instead", buf, 0x16u);

      }
      objc_msgSend(v39, "selectedLanguageOption");
      v42 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v42;
    }

  }
  objc_msgSend(v5, "previewValueFormatter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  v13 = v26;
  if (v43)
  {
    objc_msgSend(v43, "stringForObjectValue:", v25);
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v25)
      v47 = v27;
    else
      v47 = 0;
    if (v47 == 1)
    {
      objc_opt_class();
      aSelectora = v26;
      v48 = v25;
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v49 = v48;
      else
        v49 = 0;
      v50 = v49;

      +[HFAccessorySettingFormatterFactory defaultFactory](HFAccessorySettingFormatterFactory, "defaultFactory");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "formatterForKey:", CFSTR("AccessorySettingsDefaultFormatter"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "stringForObjectValue:", v50);
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v13 = (char *)aSelectora;
      goto LABEL_35;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v46 = 0;
      goto LABEL_35;
    }
    v45 = v25;
  }
  v46 = v45;
LABEL_35:
  if (v46)
    v53 = v46;
  else
    v53 = &stru_1EA741FF8;
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v53, CFSTR("description"));

  v22 = 0x1E0CB3000uLL;
LABEL_39:
  -[HFAccessorySettingGroupItem _displayTitle](v4, "_displayTitle");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v54, CFSTR("title"));

  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v6, CFSTR("HFAccessorySettingGroupKeyPathKey"));
  -[HFAccessorySettingGroupItem settingGroup](v4, "settingGroup");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    -[HFAccessorySettingGroupItem settingGroup](v4, "settingGroup");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = CFSTR("HFAccessorySettingGroupRepresentitiveObjectKey");
  }
  else
  {
    -[HFAccessorySettingGroupItem selectionSetting](v4, "selectionSetting");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v58)
      goto LABEL_44;
    -[HFAccessorySettingGroupItem selectionSetting](v4, "selectionSetting");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v59, CFSTR("HFAccessorySettingGroupRepresentitiveObjectKey"));

    -[HFAccessorySettingGroupItem selectionSetting](v4, "selectionSetting");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = CFSTR("HFAccessorySettingValueKey");
  }
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v56, v57);

LABEL_44:
  v60 = *(void **)(v22 + 2024);
  -[HFAccessorySettingGroupItem entity](v4, "entity");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "numberWithInteger:", objc_msgSend(v61, "interfaceModality"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v62, CFSTR("HFAccessorySettingInterfaceModalityKey"));

  if (v5)
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5, CFSTR("HFAccessorySettingsEntityKey"));
  if (objc_msgSend(v5, "interfaceModality") == 9)
  {
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](v4, "homeKitSettingsVendor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "hf_settingsAdapterManager");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingGroupItem entity](v4, "entity");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "adapterIdentifier");
    aSelectorb = (SEL)v4;
    v66 = v5;
    v67 = v6;
    v68 = v13;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "adapterForIdentifier:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v70, "conformsToProtocol:", &unk_1F042DCF0))
      v71 = v70;
    else
      v71 = 0;
    v72 = v71;

    v13 = v68;
    v6 = v67;
    v5 = v66;
    v4 = (HFAccessorySettingGroupItem *)aSelectorb;

    objc_msgSend(v72, "inProgressButtonPressFutureForEntity:", v5);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v73, CFSTR("HFResultActionFutureKey"));
  }
  -[HFAccessorySettingGroupItem _decorateHiddenOrDisabled:](v4, "_decorateHiddenOrDisabled:", v7);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  return v74;
}

- (id)_displayTitle
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
  void *v12;

  -[HFAccessorySettingGroupItem entity](self, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrideLocalizedTitleKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HFAccessorySettingGroupItem entity](self, "entity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overrideLocalizedTitleKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _HFLocalizedStringWithDefaultValue(v6, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFAccessorySettingGroupItem settingGroup](self, "settingGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[HFAccessorySettingGroupItem settingGroup](self, "settingGroup");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedTitle");
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      -[HFAccessorySettingGroupItem settingKeyPath](self, "settingKeyPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("HFAccessorySettingsGroupTitle-%@"), v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      _HFLocalizedStringWithDefaultValue(v5, 0, 0);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  {
    v11 = v7;
  }
  else
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFAccessorySettingGroupItemUnknownTitle"), CFSTR("HFAccessorySettingGroupItemUnknownTitle"), 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
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

  -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_settingsValueManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFAccessorySettingGroupItem entity](self, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "BOOLeanKeyPathDependencies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __59__HFAccessorySettingGroupItem__validateKeyPathDependencies__block_invoke;
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

uint64_t __59__HFAccessorySettingGroupItem__validateKeyPathDependencies__block_invoke(uint64_t a1, uint64_t a2)
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

- (void)_decorateHiddenOrDisabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  int v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  void *v49;
  char isKindOfClass;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  char v71;
  int v72;
  void *v73;
  unsigned int v74;
  __int128 v75;
  uint64_t v76;

  v4 = a3;
  -[HFAccessorySettingGroupItem entity](self, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hf_currentUserIsAdministrator");

  -[HFAccessorySettingGroupItem usageOptions](self, "usageOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  -[HFAccessorySettingGroupItem entity](self, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adapterIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v27 = 0;
    goto LABEL_21;
  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "homeManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v11;
  if (!objc_msgSend(v15, "hasOptedToHH2"))
    goto LABEL_12;
  v16 = v8;
  v17 = v5;
  -[HFAccessorySettingGroupItem entity](self, "entity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "adapterIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "isEqualToString:", CFSTR("SiriLanguageAdapter")))
  {

    v5 = v17;
    v8 = v16;
LABEL_12:

LABEL_13:
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hf_settingsAdapterManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingGroupItem entity](self, "entity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "adapterIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "adapterForIdentifier:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v32;
    if (objc_msgSend(v26, "conformsToProtocol:", &unk_1F03FCB48))
      v33 = v26;
    else
      v33 = 0;
    v34 = v33;

    v11 = v72;
    if (!v34)
    {
      v26 = 0;
      v27 = 0;
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  -[HFAccessorySettingGroupItem entity](self, "entity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "keyPath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v21, "isEqualToString:", CFSTR("root.siri.personalRequests"));

  v5 = v17;
  v8 = v16;
  if ((v71 & 1) != 0)
    goto LABEL_13;
  -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "conformsToProtocol:", &unk_1F0449888))
    v23 = v22;
  else
    v23 = 0;
  v24 = v23;

  objc_msgSend(v24, "hf_siriLanguageOptionsManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    objc_msgSend(0, "conformsToProtocol:", &unk_1F03FCB48);
    v35 = 0;
    v26 = 0;
    v27 = 0;
    v11 = v72;
    goto LABEL_18;
  }
  v26 = v25;

  v11 = v72;
LABEL_17:
  -[HFAccessorySettingGroupItem entity](self, "entity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "shouldShowSettingsEntity:", v35) ^ 1;
LABEL_18:

LABEL_20:
LABEL_21:
  v74 = v8;
  if ((v8 | v11) == 1)
  {
    if (-[HFAccessorySettingGroupItem _validateKeyPathDependencies](self, "_validateKeyPathDependencies"))
    {
      v36 = 0;
    }
    else
    {
      v38 = objc_msgSend(v5, "requiresDependenciesToShowSetting");
      v27 |= v38;
      v36 = v38 ^ 1;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA7CBF68, CFSTR("state"));
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "settings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isControllable");

    v37 = v41 ^ 1 | v36;
    objc_msgSend(v5, "userInfo");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("TargetViewControllerIdentifier"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "settings");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isControllable") ^ 1;

      v37 = v46 | v37;
    }

  }
  else
  {
    v37 = 0;
    v27 = 1;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HFAccessorySettingGroupKeyPathKey"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v47, "isEqual:", CFSTR("root.general.profiles")))
  {
    if (((-[HFAccessorySettingGroupItem _useManagedConfigurationForProfiles](self, "_useManagedConfigurationForProfiles") | v27) & 1) != 0)
    {
LABEL_31:
      v48 = 1;
      goto LABEL_38;
    }
  }
  else if ((v27 & 1) != 0)
  {
    goto LABEL_31;
  }
  if (!+[HFUtilities supportsAnalytics](HFUtilities, "supportsAnalytics")
    && ((objc_msgSend(v47, "isEqual:", CFSTR("root.general.analytics.logs")) & 1) != 0
     || objc_msgSend(v47, "isEqual:", CFSTR("root.general.profiles"))))
  {
    v48 = 0;
    v37 = 1;
  }
  else
  {
    v48 = 0;
  }
LABEL_38:
  if (objc_msgSend(v47, "isEqual:", CFSTR("root.music.playbackInfluencesForYou")))
  {
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v73 = v5;
      objc_opt_class();
      -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v52 = v51;
      else
        v52 = 0;
      v53 = v52;

      objc_msgSend(v53, "accessory");
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v54, "softwareVersion");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (v55)
      {
        objc_msgSend(v54, "softwareVersion");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = *MEMORY[0x1E0D28390];
        v76 = *(_QWORD *)(MEMORY[0x1E0D28390] + 16);
        objc_msgSend(MEMORY[0x1E0D286A0], "versionFromOperatingSystemVersion:", &v75);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v56, "isAtLeastVersion:", v57);

      }
      else
      {
        v58 = 1;
      }

      v48 = v48 | v58;
      v5 = v73;
    }
    else
    {
      -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v60 = objc_opt_isKindOfClass();

      if ((v60 & 1) != 0)
      {
        objc_opt_class();
        -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v62 = v61;
        else
          v62 = 0;
        v63 = v62;

        objc_msgSend(v63, "mediaProfiles");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v63) = objc_msgSend(v64, "na_any:", &__block_literal_global_66);
        v48 = v48 | v63;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v48);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v65, CFSTR("hidden"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v37);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v66, CFSTR("isDisabled"));

  if ((v37 & 1) == 0)
  {
    -[HFAccessorySettingGroupItem usageOptions](self, "usageOptions");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("HMSettingDisplayOption_AllowNonAdminAccess"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "BOOLValue");

    if (v69)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("shouldDisableForNonAdminUsers"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v74);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v70, CFSTR("administrator"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));
}

uint64_t __57__HFAccessorySettingGroupItem__decorateHiddenOrDisabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;

  v2 = a2;
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "softwareVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "softwareVersion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0D28390];
    v11 = *(_QWORD *)(MEMORY[0x1E0D28390] + 16);
    objc_msgSend(MEMORY[0x1E0D286A0], "versionFromOperatingSystemVersion:", &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isAtLeastVersion:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)_useManagedConfigurationForProfiles
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;

  -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;
  }
  else
  {
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v9 = objc_opt_isKindOfClass();

    if ((v9 & 1) == 0)
    {
      v13 = 0;
      goto LABEL_13;
    }
    objc_opt_class();
    -[HFAccessorySettingGroupItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    objc_msgSend(v12, "mediaProfiles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "anyObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v7;

LABEL_13:
  objc_msgSend(v13, "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "supportsManagedConfigurationProfile");

  return v15;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (HFAccessorySettingsEntity)entity
{
  return self->_entity;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_usageOptions, a3);
}

- (HMSettingGroup)settingGroup
{
  return self->_settingGroup;
}

- (HMAccessorySelectionSetting)selectionSetting
{
  return self->_selectionSetting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionSetting, 0);
  objc_storeStrong((id *)&self->_settingGroup, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
}

@end
