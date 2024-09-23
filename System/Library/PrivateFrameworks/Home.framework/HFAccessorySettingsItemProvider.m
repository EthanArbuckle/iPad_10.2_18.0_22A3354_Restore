@implementation HFAccessorySettingsItemProvider

- (HFAccessorySettingsItemProvider)initWithHomeKitSettingsVendor:(id)a3 settingGroup:(id)a4 usageOptions:(id)a5
{
  id v10;
  id v11;
  id v12;
  HFAccessorySettingsItemProvider *v13;
  HFAccessorySettingsItemProvider *v14;
  uint64_t v15;
  NSMutableSet *settingItems;
  uint64_t v17;
  NSMutableDictionary *settingToItemCache;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessorySettingsItemProvider.m"), 429, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitSettingsVendor"));

  }
  v21.receiver = self;
  v21.super_class = (Class)HFAccessorySettingsItemProvider;
  v13 = -[HFItemProvider init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_homeKitSettingsVendor, a3);
    v15 = objc_opt_new();
    settingItems = v14->_settingItems;
    v14->_settingItems = (NSMutableSet *)v15;

    v17 = objc_opt_new();
    settingToItemCache = v14->_settingToItemCache;
    v14->_settingToItemCache = (NSMutableDictionary *)v17;

    objc_storeStrong((id *)&v14->_usageOptions, a5);
    -[HFAccessorySettingsItemProvider setSettingGroup:](v14, "setSettingGroup:", v11);
  }

  return v14;
}

- (void)setSettingGroup:(id)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  SEL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NATreeNode *v21;
  NATreeNode *parentNode;
  id obj;

  obj = a3;
  if ((objc_msgSend(obj, "isEqual:", self->_settingGroup) & 1) != 0)
    goto LABEL_11;
  if (!obj)
  {
    -[HFAccessorySettingsItemProvider homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rootGroup");
    obj = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(obj, "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("root"));

  if ((v6 & 1) != 0)
    goto LABEL_9;
  -[HFAccessorySettingsItemProvider homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(obj, "keyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hf_accessorySettingGroupAtKeyPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "isEqual:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a2;
    v14 = v12;
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", v13, self, CFSTR("HFAccessorySettingsItemProvider.m"), 453, CFSTR("HMAccessorySettingGroup must belong to parent HMMediaProfile!"));
LABEL_7:

  }
LABEL_9:
  -[HFAccessorySettingsItemProvider settingToItemCache](self, "settingToItemCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  objc_storeStrong((id *)&self->_settingGroup, obj);
  v16 = obj;
  if (obj)
  {
    -[HFAccessorySettingsItemProvider homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hf_codex");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "keyPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hf_nodeWithKeyPath:", v20);
    v21 = (NATreeNode *)objc_claimAutoreleasedReturnValue();
    parentNode = self->_parentNode;
    self->_parentNode = v21;

LABEL_11:
    v16 = obj;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFAccessorySettingsItemProvider homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingsItemProvider settingGroup](self, "settingGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingsItemProvider usageOptions](self, "usageOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithHomeKitSettingsVendor:settingGroup:usageOptions:", v5, v6, v7);

  return v8;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_opt_class();
  -[HFAccessorySettingsItemProvider homeKitSettingsVendor](self, "homeKitSettingsVendor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingsItemProvider usageOptions](self, "usageOptions");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingsItemProvider settingGroup](self, "settingGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingsItemProvider parentNode](self, "parentNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingsItemProvider settingToItemCache](self, "settingToItemCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildItemTuplesForHomeKitSettings:usageOptions:settingGroup:underNode:cache:", v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAccessorySettingsItemProvider filter](self, "filter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  if (v11)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_4;
    v19[3] = &unk_1EA733FE0;
    v13 = v19;
    v5 = &v20;
    objc_copyWeak(&v20, &location);
  }
  else
  {
    v13 = 0;
  }
  -[HFItemProvider reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:](self, "reloadItemsWithObjects:keyAdaptor:itemAdaptor:filter:itemMap:", v10, &__block_literal_global_376, &__block_literal_global_378, v13, &__block_literal_global_374);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_5;
  v17[3] = &unk_1EA726E30;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v14, "flatMap:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v18);

  if (v11)
    objc_destroyWeak(v5);

  objc_destroyWeak(&location);
  return v15;
}

uint64_t __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "outputItem");
}

uint64_t __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "keyPath");
}

uint64_t __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "settingKeyPath");
}

uint64_t __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t (**v5)(_QWORD, _QWORD);
  void *v6;
  uint64_t v7;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "filter");
  v5 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingKeyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = ((uint64_t (**)(_QWORD, void *))v5)[2](v5, v6);
  return v7;
}

id __46__HFAccessorySettingsItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
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

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)items
{
  void *v2;
  void *v3;

  -[HFAccessorySettingsItemProvider settingItems](self, "settingItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFAccessorySettingsItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("accessory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)buildItemTuplesForHomeKitSettings:(id)a3 usageOptions:(id)a4 settingGroup:(id)a5 underNode:(id)a6 cache:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  id v85;
  id v86;
  _QWORD v87[4];
  id v88;
  _QWORD aBlock[4];
  id v90;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v55 = a6;
  v14 = a7;
  if (!v14)
    v14 = (id)objc_opt_new();
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke;
  aBlock[3] = &unk_1EA734008;
  v16 = v14;
  v90 = v16;
  v17 = _Block_copy(aBlock);
  v87[0] = v15;
  v87[1] = 3221225472;
  v87[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_2;
  v87[3] = &unk_1EA734030;
  v88 = v16;
  v54 = v16;
  v18 = _Block_copy(v87);
  v82[0] = v15;
  v82[1] = 3221225472;
  v82[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_3;
  v82[3] = &unk_1EA734058;
  v19 = v17;
  v85 = v19;
  v20 = v11;
  v83 = v20;
  v21 = v12;
  v84 = v21;
  v22 = v18;
  v86 = v22;
  v23 = _Block_copy(v82);
  v77[0] = v15;
  v77[1] = 3221225472;
  v77[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_4;
  v77[3] = &unk_1EA734080;
  v24 = v19;
  v80 = v24;
  v25 = v20;
  v78 = v25;
  v26 = v21;
  v79 = v26;
  v27 = v22;
  v81 = v27;
  v28 = _Block_copy(v77);
  v72[0] = v15;
  v72[1] = 3221225472;
  v72[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_5;
  v72[3] = &unk_1EA7340A8;
  v29 = v24;
  v75 = v29;
  v30 = v25;
  v73 = v30;
  v31 = v26;
  v74 = v31;
  v32 = v27;
  v76 = v32;
  v33 = _Block_copy(v72);
  v66[0] = v15;
  v66[1] = 3221225472;
  v66[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_6;
  v66[3] = &unk_1EA7340D0;
  v67 = v30;
  v68 = v31;
  v69 = v29;
  v70 = v32;
  v71 = v23;
  v34 = v23;
  v51 = v32;
  v53 = v31;
  v52 = v30;
  v50 = v29;
  v35 = _Block_copy(v66);
  v36 = (void *)objc_opt_new();
  objc_msgSend(v13, "settings");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v15;
  v63[1] = 3221225472;
  v63[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_7;
  v63[3] = &unk_1EA7340F8;
  v38 = v35;
  v65 = v38;
  v39 = v36;
  v64 = v39;
  objc_msgSend(v37, "na_each:", v63);

  objc_msgSend(v13, "groups");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v15;
  v59[1] = 3221225472;
  v59[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_8;
  v59[3] = &unk_1EA734148;
  v61 = v28;
  v41 = v39;
  v60 = v41;
  v62 = v38;
  v42 = v38;
  v43 = v28;
  objc_msgSend(v40, "na_each:", v59);

  objc_msgSend(v55, "childNodes");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v15;
  v56[1] = 3221225472;
  v56[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_11;
  v56[3] = &unk_1EA734170;
  v58 = v33;
  v45 = v41;
  v57 = v45;
  v46 = v33;
  objc_msgSend(v44, "na_each:", v56);

  v47 = v57;
  v48 = v45;

  return v48;
}

id __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  _HomeKitSettingToHFItem_CacheItemCacheKey(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "cacheKey");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeSetObject:forKey:", v3, v4);

}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_3(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  _HomeKitSettingToHFItem_CacheItem *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  (*(void (**)(void))(a1[6] + 16))();
  v9 = (_HomeKitSettingToHFItem_CacheItem *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[_HomeKitSettingToHFItem_CacheItem initWithHomeKitSettingsVendor:usageOptions:setting:optionItem:]([_HomeKitSettingToHFItem_CacheItem alloc], "initWithHomeKitSettingsVendor:usageOptions:setting:optionItem:", a1[4], a1[5], v7, v8);
    (*(void (**)(void))(a1[7] + 16))();
  }
  objc_msgSend(v10, "na_safeAddObject:", v9);

}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  _HomeKitSettingToHFItem_CacheItem *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  (*(void (**)(void))(a1[6] + 16))();
  v6 = (_HomeKitSettingToHFItem_CacheItem *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[_HomeKitSettingToHFItem_CacheItem initWithHomeKitSettingsVendor:usageOptions:group:]([_HomeKitSettingToHFItem_CacheItem alloc], "initWithHomeKitSettingsVendor:usageOptions:group:", a1[4], a1[5], v5);
    (*(void (**)(void))(a1[7] + 16))();
  }
  objc_msgSend(v7, "na_safeAddObject:", v6);

}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_5(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  _HomeKitSettingToHFItem_CacheItem *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  (*(void (**)(void))(a1[6] + 16))();
  v6 = (_HomeKitSettingToHFItem_CacheItem *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[_HomeKitSettingToHFItem_CacheItem initWithHomeKitSettingsVendor:usageOptions:accessoryGroupEntity:]([_HomeKitSettingToHFItem_CacheItem alloc], "initWithHomeKitSettingsVendor:usageOptions:accessoryGroupEntity:", a1[4], a1[5], v5);
    (*(void (**)(void))(a1[7] + 16))();
  }
  objc_msgSend(v7, "na_safeAddObject:", v6);

}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_6(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _HomeKitSettingToHFItem_CacheItem *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  (*(void (**)(void))(a1[6] + 16))();
  v7 = (_HomeKitSettingToHFItem_CacheItem *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[_HomeKitSettingToHFItem_CacheItem initWithHomeKitSettingsVendor:usageOptions:setting:]([_HomeKitSettingToHFItem_CacheItem alloc], "initWithHomeKitSettingsVendor:usageOptions:setting:", a1[4], a1[5], v6);
    (*(void (**)(void))(a1[7] + 16))();
  }
  objc_msgSend(v5, "na_safeAddObject:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v6;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v8, "items", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          (*(void (**)(void))(a1[8] + 16))();
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

uint64_t __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_8(id *a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void (*v5)(_QWORD *, id, id);
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v4 = a1[4];
  v3 = a1[5];
  v5 = (void (*)(_QWORD *, id, id))v3[2];
  v6 = a2;
  v5(v3, v4, v6);
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_9;
  v13[3] = &unk_1EA7340F8;
  v15 = a1[6];
  v14 = a1[4];
  objc_msgSend(v7, "na_each:", v13);

  objc_msgSend(v6, "groups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_10;
  v10[3] = &unk_1EA734120;
  v12 = a1[5];
  v11 = a1[4];
  objc_msgSend(v9, "na_each:", v10);

}

uint64_t __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

uint64_t __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a2;
  objc_msgSend(v9, "representedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysShowGroup");

  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "representedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, v6, v7);

  }
  objc_msgSend(v9, "childNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_12;
  v10[3] = &unk_1EA734170;
  v12 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v8, "na_each:", v10);

}

void __111__HFAccessorySettingsItemProvider_buildItemTuplesForHomeKitSettings_usageOptions_settingGroup_underNode_cache___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "representedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysShowGroup");

  if (v4)
  {
    v7 = a1 + 32;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v7 + 8);
    objc_msgSend(v9, "representedObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v6 + 16))(v6, v5, v8);

  }
}

- (HMSettingGroup)settingGroup
{
  return self->_settingGroup;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (NSDictionary)usageOptions
{
  return self->_usageOptions;
}

- (void)setUsageOptions:(id)a3
{
  objc_storeStrong((id *)&self->_usageOptions, a3);
}

- (NSMutableDictionary)settingToItemCache
{
  return self->_settingToItemCache;
}

- (void)setSettingToItemCache:(id)a3
{
  objc_storeStrong((id *)&self->_settingToItemCache, a3);
}

- (NSMutableSet)settingItems
{
  return self->_settingItems;
}

- (void)setSettingItems:(id)a3
{
  objc_storeStrong((id *)&self->_settingItems, a3);
}

- (NATreeNode)parentNode
{
  return self->_parentNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentNode, 0);
  objc_storeStrong((id *)&self->_settingItems, 0);
  objc_storeStrong((id *)&self->_settingToItemCache, 0);
  objc_storeStrong((id *)&self->_usageOptions, 0);
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong(&self->_filter, 0);
  objc_storeStrong((id *)&self->_settingGroup, 0);
}

@end
