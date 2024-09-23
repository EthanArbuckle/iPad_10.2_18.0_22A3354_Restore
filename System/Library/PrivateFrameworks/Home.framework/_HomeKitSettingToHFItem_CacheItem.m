@implementation _HomeKitSettingToHFItem_CacheItem

- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5 optionItem:(id)a6
{
  id v11;
  _HomeKitSettingToHFItem_CacheItem *v12;
  _HomeKitSettingToHFItem_CacheItem *v13;

  v11 = a6;
  v12 = -[_HomeKitSettingToHFItem_CacheItem initWithHomeKitSettingsVendor:usageOptions:setting:](self, "initWithHomeKitSettingsVendor:usageOptions:setting:", a3, a4, a5);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_optionItem, a6);

  return v13;
}

- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 setting:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HomeKitSettingToHFItem_CacheItem *v12;
  _HomeKitSettingToHFItem_CacheItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HomeKitSettingToHFItem_CacheItem;
  v12 = -[_HomeKitSettingToHFItem_CacheItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_singleSetting, a5);
    objc_storeStrong((id *)&v13->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v13->_usageOptions, a4);
  }

  return v13;
}

- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 group:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HomeKitSettingToHFItem_CacheItem *v12;
  _HomeKitSettingToHFItem_CacheItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HomeKitSettingToHFItem_CacheItem;
  v12 = -[_HomeKitSettingToHFItem_CacheItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_settingGroup, a5);
    objc_storeStrong((id *)&v13->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v13->_usageOptions, a4);
  }

  return v13;
}

- (_HomeKitSettingToHFItem_CacheItem)initWithHomeKitSettingsVendor:(id)a3 usageOptions:(id)a4 accessoryGroupEntity:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HomeKitSettingToHFItem_CacheItem *v12;
  _HomeKitSettingToHFItem_CacheItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_HomeKitSettingToHFItem_CacheItem;
  v12 = -[_HomeKitSettingToHFItem_CacheItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessoryGroupEntity, a5);
    objc_storeStrong((id *)&v13->_homeKitSettingsVendor, a3);
    objc_storeStrong((id *)&v13->_usageOptions, a4);
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HomeKitSettingToHFItem_CacheItem keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("keyPath"));

  -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("homeKitSettingsVendor"));

  -[_HomeKitSettingToHFItem_CacheItem optionItem](self, "optionItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v7, CFSTR("optionItem"), 1);

  -[_HomeKitSettingToHFItem_CacheItem settingGroup](self, "settingGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v9, CFSTR("settingGroup"), 1);

  -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v11, CFSTR("singleSetting"), 1);

  -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v13, CFSTR("accessoryGroupEntity"), 1);

  -[_HomeKitSettingToHFItem_CacheItem usageOptions](self, "usageOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v15, CFSTR("usageOptions"), 1);

  objc_msgSend(v3, "build");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

- (NSString)cacheKey
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  -[_HomeKitSettingToHFItem_CacheItem settingGroup](self, "settingGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_HomeKitSettingToHFItem_CacheItem settingGroup](self, "settingGroup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[_HomeKitSettingToHFItem_CacheItem optionItem](self, "optionItem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingsItemProvider.m"), 193, CFSTR("CacheKey cannot be nil!"));
          v10 = &stru_1EA741FF8;
          goto LABEL_10;
        }
        -[_HomeKitSettingToHFItem_CacheItem optionItem](self, "optionItem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  v9 = v5;
  _HomeKitSettingToHFItem_CacheItemCacheKey(v5);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return (NSString *)v10;
}

- (NSString)keyPath
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[_HomeKitSettingToHFItem_CacheItem optionItem](self, "optionItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyPath");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[_HomeKitSettingToHFItem_CacheItem optionItem](self, "optionItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v6, v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v6 = v10;
      v9 = v6;
    }
    else
    {
      -[_HomeKitSettingToHFItem_CacheItem settingGroup](self, "settingGroup");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v9 = v12;
      }
      else
      {
        -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "keyPath");
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      v6 = 0;
    }
  }

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_2_0 != -1)
    dispatch_once(&_MergedGlobals_2_0, &__block_literal_global_39_2);
  return (NAIdentity *)(id)qword_1ED3789E8;
}

- (BOOL)shouldBeDisplayed
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  char v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContainedWithinItemGroup");

  -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isItemGroup");

  if ((v4 & 1) != 0 || v6)
  {
    -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "adapterIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_20;
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "hasOptedToHH2") & 1) != 0)
    {
      -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "adapterIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("SiriLanguageAdapter"));

      if (v14)
      {
        -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "conformsToProtocol:", &unk_1F0449888))
          v16 = v15;
        else
          v16 = 0;
        v17 = v16;

        objc_msgSend(v17, "hf_siriLanguageOptionsManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = v18;

LABEL_17:
          -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v19, "shouldShowSettingsEntity:", v27);
LABEL_18:

LABEL_40:
          return v7;
        }
        objc_msgSend(0, "conformsToProtocol:", &unk_1F03FCB48);
LABEL_20:
        -[_HomeKitSettingToHFItem_CacheItem settingGroup](self, "settingGroup");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {

        }
        else
        {
          -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
            v30 = 0;
          else
            v30 = v6;
          if (v30 == 1)
          {
            -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
            v19 = (id)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v19, "alwaysShowGroup");
            goto LABEL_35;
          }
        }
        objc_opt_class();
        -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v33 = v32;
        else
          v33 = 0;
        v19 = v33;

        if (v19)
          v34 = v4;
        else
          v34 = 0;
        if (v34 != 1)
        {
          if (!v4
            || (-[_HomeKitSettingToHFItem_CacheItem settingGroup](self, "settingGroup"),
                v35 = (void *)objc_claimAutoreleasedReturnValue(),
                v35,
                !v35))
          {
            v7 = 1;
            goto LABEL_40;
          }
          -[_HomeKitSettingToHFItem_CacheItem settingGroup](self, "settingGroup");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_opt_class();
          -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HomeKitSettingToHFItem_CacheItem usageOptions](self, "usageOptions");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v36, "_checkSettingGroupForSettingsThatNeedToBeDisplayed:usageOptions:settingGroup:", v37, v38, v27);

          goto LABEL_18;
        }
        v31 = objc_msgSend(v19, "isReflected");
LABEL_35:
        v7 = v31 ^ 1;
        goto LABEL_40;
      }
    }
    else
    {

    }
    -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hf_settingsAdapterManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "adapterIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "adapterForIdentifier:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v24;
    if (objc_msgSend(v19, "conformsToProtocol:", &unk_1F03FCB48))
      v25 = v19;
    else
      v25 = 0;
    v26 = v25;

    if (v26)
      goto LABEL_17;
    goto LABEL_20;
  }
  return 1;
}

+ (BOOL)_checkSettingGroupForSettingsThatNeedToBeDisplayed:(id)a3 usageOptions:(id)a4 settingGroup:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  char v41;
  void *v42;
  char v43;
  NSObject *v44;
  void *v46;
  id v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  id obj;
  void *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_codex");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "keyPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hf_nodeWithKeyPath:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v54 = v8;
  +[HFAccessorySettingsItemProvider buildItemTuplesForHomeKitSettings:usageOptions:settingGroup:underNode:cache:](HFAccessorySettingsItemProvider, "buildItemTuplesForHomeKitSettings:usageOptions:settingGroup:underNode:cache:", v8, v9, v10, v14, 0);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (!v15)
  {
    v43 = 0;
    goto LABEL_46;
  }
  v16 = v15;
  v48 = a1;
  v55 = *(_QWORD *)v57;
  v52 = v14;
  v50 = v10;
  v51 = v9;
  v49 = v12;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v57 != v55)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
      objc_opt_class();
      objc_msgSend(v18, "singleSetting");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v20 = v19;
      else
        v20 = 0;
      v21 = v20;

      if (v21 && !objc_msgSend(v21, "isReflected"))
      {
        v43 = 1;
        v10 = v50;
        v9 = v51;
        v12 = v49;
LABEL_45:
        v14 = v52;

        goto LABEL_46;
      }
      objc_msgSend(v18, "accessoryGroupEntity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "adapterIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "homeManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v25, "hasOptedToHH2") & 1) != 0)
        {
          objc_msgSend(v18, "accessoryGroupEntity");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "adapterIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("SiriLanguageAdapter"));

          if (v28)
          {
            v29 = &unk_1F0449888;
            v30 = v54;
            if (objc_msgSend(v30, "conformsToProtocol:", v29))
              v31 = v30;
            else
              v31 = 0;
            v32 = v31;

            objc_msgSend(v32, "hf_siriLanguageOptionsManager");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = v33;
            if (v33)
            {
              v35 = v33;
              if (v32)
                goto LABEL_19;
            }
            else
            {
              objc_msgSend(0, "conformsToProtocol:", &unk_1F03FCB48);
              if (v32)
              {
LABEL_19:
                if (+[HFMediaHelper isContainedWithinAGroup:](HFMediaHelper, "isContainedWithinAGroup:", v32))
                {
                  HFLogForCategory(0);
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v18, "accessoryGroupEntity");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v61 = v46;
                    v62 = 2112;
                    v63 = v32;
                    _os_log_impl(&dword_1DD34E000, v44, OS_LOG_TYPE_DEFAULT, "Hiding language setting entity %@ for %@", buf, 0x16u);

                  }
                  v43 = 0;
LABEL_43:
                  v9 = v51;
                  goto LABEL_44;
                }
                goto LABEL_28;
              }
            }
            v30 = 0;
LABEL_28:
            v39 = v34;
LABEL_29:

            if (v39)
            {
              objc_msgSend(v18, "accessoryGroupEntity");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v41 = objc_msgSend(v39, "shouldShowSettingsEntity:", v40);

              if ((v41 & 1) != 0)
              {
                v43 = 1;
                v34 = v39;
                goto LABEL_43;
              }
            }

            goto LABEL_32;
          }
        }
        else
        {

        }
        objc_msgSend(v54, "hf_settingsAdapterManager");
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "accessoryGroupEntity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "adapterIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "adapterForIdentifier:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "conformsToProtocol:", &unk_1F03FCB48))
          v38 = v37;
        else
          v38 = 0;
        v39 = v38;

        goto LABEL_29;
      }
LABEL_32:
      objc_msgSend(v18, "settingGroup");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend(v18, "settingGroup");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v51;
        v43 = objc_msgSend(v48, "_checkSettingGroupForSettingsThatNeedToBeDisplayed:usageOptions:settingGroup:", v54, v51, v34);
LABEL_44:
        v12 = v49;
        v10 = v50;

        goto LABEL_45;
      }

    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
    v43 = 0;
    v10 = v50;
    v9 = v51;
    v12 = v49;
    v14 = v52;
    if (v16)
      continue;
    break;
  }
LABEL_46:

  return v43;
}

- (HFItem)outputItem
{
  HFItem *outputItem;
  uint64_t v4;
  void *v5;
  void *v6;
  HFAccessorySettingOptionItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HFItem *v12;
  HFItem *v13;
  HFItem *v14;
  void *v15;
  char isKindOfClass;
  HFAccessorySettingGroupItem *v17;
  HFItem *v18;
  void *v19;
  HFAccessorySettingItem *v20;
  void *v21;
  HFAccessorySettingGroupItem *v22;
  void *v23;
  HFAccessorySettingGroupItem *v24;

  outputItem = self->_outputItem;
  if (outputItem)
    goto LABEL_18;
  if (-[_HomeKitSettingToHFItem_CacheItem shouldBeDisplayed](self, "shouldBeDisplayed"))
  {
    -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = (void *)v4,
          -[_HomeKitSettingToHFItem_CacheItem optionItem](self, "optionItem"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v6))
    {
      v7 = [HFAccessorySettingOptionItem alloc];
      -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HomeKitSettingToHFItem_CacheItem usageOptions](self, "usageOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HomeKitSettingToHFItem_CacheItem optionItem](self, "optionItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[HFAccessorySettingOptionItem initWithHomeKitSettingsVendor:usageOptions:setting:optionItem:](v7, "initWithHomeKitSettingsVendor:usageOptions:setting:optionItem:", v8, v9, v10, v11);
      v13 = self->_outputItem;
      self->_outputItem = v12;

    }
    else
    {
      -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v17 = [HFAccessorySettingGroupItem alloc];
        -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HomeKitSettingToHFItem_CacheItem usageOptions](self, "usageOptions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[HFAccessorySettingGroupItem initWithHomeKitSettingsVendor:usageOptions:selectionSetting:](v17, "initWithHomeKitSettingsVendor:usageOptions:selectionSetting:", v8, v9, v10);
      }
      else
      {
        -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = [HFAccessorySettingItem alloc];
          -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HomeKitSettingToHFItem_CacheItem usageOptions](self, "usageOptions");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HomeKitSettingToHFItem_CacheItem singleSetting](self, "singleSetting");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[HFAccessorySettingItem initWithHomeKitSettingsVendor:usageOptions:setting:](v20, "initWithHomeKitSettingsVendor:usageOptions:setting:", v8, v9, v10);
        }
        else
        {
          -[_HomeKitSettingToHFItem_CacheItem settingGroup](self, "settingGroup");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            v22 = [HFAccessorySettingGroupItem alloc];
            -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[_HomeKitSettingToHFItem_CacheItem usageOptions](self, "usageOptions");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[_HomeKitSettingToHFItem_CacheItem settingGroup](self, "settingGroup");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[HFAccessorySettingGroupItem initWithHomeKitSettingsVendor:usageOptions:group:](v22, "initWithHomeKitSettingsVendor:usageOptions:group:", v8, v9, v10);
          }
          else
          {
            -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v23)
            {
LABEL_17:
              outputItem = self->_outputItem;
LABEL_18:
              v14 = outputItem;
              return v14;
            }
            v24 = [HFAccessorySettingGroupItem alloc];
            -[_HomeKitSettingToHFItem_CacheItem homeKitSettingsVendor](self, "homeKitSettingsVendor");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[_HomeKitSettingToHFItem_CacheItem usageOptions](self, "usageOptions");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[_HomeKitSettingToHFItem_CacheItem accessoryGroupEntity](self, "accessoryGroupEntity");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = -[HFAccessorySettingGroupItem initWithHomeKitSettingsVendor:usageOptions:entity:](v24, "initWithHomeKitSettingsVendor:usageOptions:entity:", v8, v9, v10);
          }
        }
      }
      v11 = self->_outputItem;
      self->_outputItem = v18;
    }

    goto LABEL_17;
  }
  v14 = 0;
  return v14;
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (HMSetting)singleSetting
{
  return self->_singleSetting;
}

- (HMSettingGroup)settingGroup
{
  return self->_settingGroup;
}

- (HMAccessorySelectionSettingItem)optionItem
{
  return self->_optionItem;
}

- (HFAccessorySettingsEntity)accessoryGroupEntity
{
  return self->_accessoryGroupEntity;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_accessoryGroupEntity, 0);
  objc_storeStrong((id *)&self->_optionItem, 0);
  objc_storeStrong((id *)&self->_settingGroup, 0);
  objc_storeStrong((id *)&self->_singleSetting, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong((id *)&self->_outputItem, 0);
}

@end
