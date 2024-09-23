@implementation HUAccessorySettingsItemModule

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5
{
  return -[HUAccessorySettingsItemModule initWithItemUpdater:home:sourceItem:usageOptions:](self, "initWithItemUpdater:home:sourceItem:usageOptions:", a3, a4, a5, 0);
}

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 mediaAccessoryItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HUAccessorySettingsItemModule *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HUAccessorySettingsItemModule initWithItemUpdater:home:sourceItem:usageOptions:](self, "initWithItemUpdater:home:sourceItem:usageOptions:", v7, v10, v6, 0);

  return v11;
}

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 home:(id)a4 sourceItem:(id)a5 usageOptions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HUAccessorySettingsItemModule *v23;
  HUAccessorySettingsItemModule *v24;
  uint64_t v25;
  HMSettings *settings;
  void *v27;
  uint64_t v28;
  NATreeNode *codex;
  uint64_t v30;
  HFAccessorySettingsItemProvider *accessorySettingsItemProvider;
  void *v33;
  objc_super v34;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "latestResults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D80]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = &unk_1EF305B38;
  if (objc_msgSend(v16, "conformsToProtocol:", v17))
    v18 = v16;
  else
    v18 = 0;
  v19 = v18;

  if (!v19)
  {
    v20 = v13;
    v21 = objc_msgSend(v20, "conformsToProtocol:", &unk_1EF2AC700) ? v20 : 0;
    v22 = v21;

    objc_msgSend(v22, "homeKitSettingsVendor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsItemModule.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("homeKitSettingsVendor"));

      v16 = 0;
    }
  }
  v34.receiver = self;
  v34.super_class = (Class)HUAccessorySettingsItemModule;
  v23 = -[HUServiceDetailsItemModule initWithItemUpdater:home:sourceItem:](&v34, sel_initWithItemUpdater_home_sourceItem_, v11, v12, v13);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_homeKitSettingsVendor, v16);
    objc_msgSend(v16, "settings");
    v25 = objc_claimAutoreleasedReturnValue();
    settings = v24->_settings;
    v24->_settings = (HMSettings *)v25;

    objc_msgSend(v16, "settings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hf_codex");
    v28 = objc_claimAutoreleasedReturnValue();
    codex = v24->_codex;
    v24->_codex = (NATreeNode *)v28;

    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D31118]), "initWithHomeKitSettingsVendor:settingGroup:usageOptions:", v16, 0, v14);
    accessorySettingsItemProvider = v24->_accessorySettingsItemProvider;
    v24->_accessorySettingsItemProvider = (HFAccessorySettingsItemProvider *)v30;

  }
  return v24;
}

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 homeKitSettingsVendor:(id)a4 usageOptions:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  HUAccessorySettingsItemModule *v13;

  v8 = (objc_class *)MEMORY[0x1E0D310F8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithHomeKitSettingsVendor:usageOptions:", v10, v9);

  v13 = -[HUAccessorySettingsItemModule initWithItemUpdater:settingGroupItem:usageOptions:](self, "initWithItemUpdater:settingGroupItem:usageOptions:", v11, v12, v9);
  return v13;
}

- (HUAccessorySettingsItemModule)initWithItemUpdater:(id)a3 settingGroupItem:(id)a4 usageOptions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HUAccessorySettingsItemModule *v13;
  uint64_t v14;
  HFAccessorySettingsEntity *parentEntity;
  uint64_t v16;
  HMSettingGroup *parentSettingGroup;
  void *v18;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "homeKitSettingsVendor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hf_home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HUAccessorySettingsItemModule initWithItemUpdater:home:sourceItem:usageOptions:](self, "initWithItemUpdater:home:sourceItem:usageOptions:", v10, v12, v8, v9);

  if (v13)
  {
    objc_msgSend(v8, "entity");
    v14 = objc_claimAutoreleasedReturnValue();
    parentEntity = v13->_parentEntity;
    v13->_parentEntity = (HFAccessorySettingsEntity *)v14;

    objc_msgSend(v8, "settingGroup");
    v16 = objc_claimAutoreleasedReturnValue();
    parentSettingGroup = v13->_parentSettingGroup;
    v13->_parentSettingGroup = (HMSettingGroup *)v16;

    objc_msgSend(v8, "settingGroup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFAccessorySettingsItemProvider setSettingGroup:](v13->_accessorySettingsItemProvider, "setSettingGroup:", v18);

  }
  return v13;
}

- (id)itemProviders
{
  NSSet *itemProviders;
  NSSet *v3;
  NSSet *v5;
  void *v6;
  NSSet *v7;
  NSSet *v8;

  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    v5 = (NSSet *)objc_opt_new();
    -[HUAccessorySettingsItemModule accessorySettingsItemProvider](self, "accessorySettingsItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSSet na_safeAddObject:](v5, "na_safeAddObject:", v6);

    v7 = self->_itemProviders;
    self->_itemProviders = v5;
    v8 = v5;

    v3 = self->_itemProviders;
  }
  return v3;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  _QWORD v47[5];
  _QWORD v48[5];
  _QWORD v49[4];
  id v50;

  v4 = a3;
  -[HUAccessorySettingsItemModule _resetIfNeeded](self, "_resetIfNeeded");
  -[HUAccessorySettingsItemModule settings](self, "settings");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (id)v5;
    -[HUAccessorySettingsItemModule parentSettingGroup](self, "parentSettingGroup");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v29 = (void *)MEMORY[0x1E0C9AA60];
LABEL_17:

      goto LABEL_18;
    }
    v8 = (void *)v7;
    -[HUAccessorySettingsItemModule codex](self, "codex");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[HUAccessorySettingsItemModule accessorySettingsItemProvider](self, "accessorySettingsItemProvider");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke;
      v49[3] = &unk_1E6F4DAD8;
      v6 = v10;
      v50 = v6;
      v45 = v4;
      objc_msgSend(v4, "na_filter:", v49);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v11;
      v48[1] = 3221225472;
      v48[2] = __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2;
      v48[3] = &unk_1E6F4DAD8;
      v48[4] = self;
      objc_msgSend(v12, "na_filter:", v48);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessorySettingsItemModule setSettingItemsToBeDisplayed:](self, "setSettingItemsToBeDisplayed:", v13);

      v46 = v12;
      v47[0] = v11;
      v47[1] = 3221225472;
      v47[2] = __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_3;
      v47[3] = &unk_1E6F4DAD8;
      v47[4] = self;
      objc_msgSend(v12, "na_filter:", v47);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessorySettingsItemModule setGroupItemsToBeDisplayed:](self, "setGroupItemsToBeDisplayed:", v14);

      v15 = (void *)objc_opt_new();
      -[HUAccessorySettingsItemModule accessorySettingsItemProvider](self, "accessorySettingsItemProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "settingGroup");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "keyPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0C99E10];
      -[HUAccessorySettingsItemModule codex](self, "codex");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hf_nodeWithKeyPath:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "hf_sortedAccessorySettingsChildren");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "na_filter:", &__block_literal_global_208);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "na_map:", &__block_literal_global_107_2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "orderedSetWithArray:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUAccessorySettingsItemModule _itemSectionsForParentGroupWithItems](self, "_itemSectionsForParentGroupWithItems");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObjectsFromArray:", v26);

      -[HUAccessorySettingsItemModule parentEntity](self, "parentEntity");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23) = objc_msgSend(v27, "wantsSeparateSectionPerGroup");

      if ((_DWORD)v23)
      {
        -[HUAccessorySettingsItemModule _itemSectionsForGroupKeyPaths:](self, "_itemSectionsForGroupKeyPaths:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObjectsFromArray:", v28);

      }
      objc_msgSend(v15, "sortedArrayUsingComparator:", &__block_literal_global_109_5);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessorySettingsItemModule parentEntity](self, "parentEntity");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "adapterIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v42 = v25;
        v43 = v18;
        v44 = v15;
        -[HUAccessorySettingsItemModule homeKitSettingsVendor](self, "homeKitSettingsVendor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "hf_settingsAdapterManager");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUAccessorySettingsItemModule parentEntity](self, "parentEntity");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "adapterIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "adapterForIdentifier:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "conformsToProtocol:", &unk_1EF348390))
          v37 = v36;
        else
          v37 = 0;
        v38 = v37;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[HUAccessorySettingsItemModule parentEntity](self, "parentEntity");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "customizeSections:forEntity:", v29, v39);
          v40 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v40;
        }
        v4 = v45;
        v25 = v42;
        v18 = v43;

        v15 = v44;
      }
      else
      {
        v4 = v45;
      }

      goto LABEL_17;
    }
  }
  v29 = (void *)MEMORY[0x1E0C9AA60];
LABEL_18:

  return v29;
}

uint64_t __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

uint64_t __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  uint64_t v17;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSoftwareVersionNeeded");

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v6, "homeKitSettingsVendor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getAllHomePodFromItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 32);
    v16 = *MEMORY[0x1E0D284B8];
    v17 = *(_QWORD *)(MEMORY[0x1E0D284B8] + 16);
    objc_msgSend(MEMORY[0x1E0D286A0], "versionFromOperatingSystemVersion:", &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "checkSoftwareVersionForAccessories:neededSoftwareVersion:", v11, v13);

  }
  else
  {
    v14 = v6 != 0;
  }

  return v14;
}

uint64_t __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  uint64_t v17;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  objc_msgSend(v6, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSoftwareVersionNeeded");

  if (v8)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v6, "homeKitSettingsVendor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getAllHomePodFromItem:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(a1 + 32);
    v16 = *MEMORY[0x1E0D284B8];
    v17 = *(_QWORD *)(MEMORY[0x1E0D284B8] + 16);
    objc_msgSend(MEMORY[0x1E0D286A0], "versionFromOperatingSystemVersion:", &v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "checkSoftwareVersionForAccessories:neededSoftwareVersion:", v11, v13);

  }
  else
  {
    v14 = v6 != 0;
  }

  return v14;
}

BOOL __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "interfaceModality") == 0;

  return v3;
}

id __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "representedObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __65__HUAccessorySettingsItemModule_buildSectionsWithDisplayedItems___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("HUAccessorySettingsItemModuleSortKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HUAccessorySettingsItemModuleSortKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

- (void)updateItems:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D314C0], "requestToUpdateItems:senderSelector:", a3, a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemModule itemUpdater](self, "itemUpdater");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "performItemUpdateRequest:", v6);

}

- (void)updateItems:(id)a3 matchingDependency:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsItemModule itemProviders](self, "itemProviders");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__HUAccessorySettingsItemModule_updateItems_matchingDependency___block_invoke;
  v11[3] = &unk_1E6F5B0F8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "na_each:", v11);

  -[HUAccessorySettingsItemModule updateItems:](self, "updateItems:", v9);
}

void __64__HUAccessorySettingsItemModule_updateItems_matchingDependency___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__HUAccessorySettingsItemModule_updateItems_matchingDependency___block_invoke_2;
  v4[3] = &unk_1E6F53050;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_each:", v4);

}

void __64__HUAccessorySettingsItemModule_updateItems_matchingDependency___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D30E50]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (void)updateItemsForKeyPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[HUAccessorySettingsItemModule itemProviders](self, "itemProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__HUAccessorySettingsItemModule_updateItemsForKeyPath___block_invoke;
  v9[3] = &unk_1E6F5B0F8;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  objc_msgSend(v6, "na_each:", v9);

  -[HUAccessorySettingsItemModule updateItems:](self, "updateItems:", v7);
}

void __55__HUAccessorySettingsItemModule_updateItemsForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__HUAccessorySettingsItemModule_updateItemsForKeyPath___block_invoke_2;
  v4[3] = &unk_1E6F53050;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "na_each:", v4);

}

void __55__HUAccessorySettingsItemModule_updateItemsForKeyPath___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D30158]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (id)updateItem:(id)a3 withValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D30178]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v30 = v5;
    v31 = 2112;
    v32 = v8;
    v33 = 2112;
    v34 = v6;
    _os_log_impl(&dword_1B8E1E000, v9, OS_LOG_TYPE_DEFAULT, "Attempting to update item '%@' (Setting: %@) to value: %@", buf, 0x20u);
  }

  if (v5 && v8)
  {
    objc_msgSend(v5, "updateValue:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __54__HUAccessorySettingsItemModule_updateItem_withValue___block_invoke;
    v25[3] = &unk_1E6F56310;
    v12 = v5;
    v26 = v12;
    v13 = v8;
    v27 = v13;
    v14 = v6;
    v28 = v14;
    objc_msgSend(v10, "addFailureBlock:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __54__HUAccessorySettingsItemModule_updateItem_withValue___block_invoke_130;
    v21[3] = &unk_1E6F5B120;
    v22 = v12;
    v23 = v13;
    v24 = v14;
    objc_msgSend(v15, "addSuccessBlock:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v26;
  }
  else
  {
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v30 = v5;
      v31 = 2112;
      v32 = v6;
      _os_log_error_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_ERROR, "Failed to update setting; no item or setting for item: %@ / value: %@",
        buf,
        0x16u);
    }

    v19 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithError:", v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __54__HUAccessorySettingsItemModule_updateItem_withValue___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    *(_DWORD *)buf = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Failed to update item '%@' (Setting: %@) to value: %@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("updateItem:%@ withValue:%@"), a1[4], a1[6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logError:operationDescription:", v3, v9);

}

void __54__HUAccessorySettingsItemModule_updateItem_withValue___block_invoke_130(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v5 = a1[6];
    v6 = 138412802;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1B8E1E000, v2, OS_LOG_TYPE_DEFAULT, "Updated item '%@' (Setting: %@) to value: %@", (uint8_t *)&v6, 0x20u);
  }

}

- (void)_registerForAccessorySettingsUpdates
{
  void *v3;
  id v4;

  -[HUAccessorySettingsItemModule settings](self, "settings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addHomeKitSettingsObserver:", self);
  else
    objc_msgSend(v3, "addMediaObjectObserver:", self);

}

- (void)_unregisterForAccessorySettingsUpdates
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeHomeKitSettingsObserver:", self);

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeMediaObjectObserver:", self);

}

- (id)_itemSectionWithEntity:(id)a3 items:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAccessorySettingsItemModule.m"), 268, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("items"));

  }
  objc_msgSend(v7, "keyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v11);
  objc_msgSend(v13, "setItems:", v8);
  objc_msgSend(v7, "headerTitleFormatter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v7, "headerTitleFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessorySettingsItemModule homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributedStringForObjectValue:withDefaultAttributes:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v13, "setAttributedHeaderTitle:", v17);
    }
    else
    {
      objc_msgSend(v7, "headerTitleFormatter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessorySettingsItemModule homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringForObjectValue:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHeaderTitle:", v21);

      v17 = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "localizedHeader");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_13;
    objc_msgSend(v7, "localizedHeader");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHeaderTitle:", v17);
  }

LABEL_13:
  objc_msgSend(v7, "footerTitleFormatter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v7, "footerTitleFormatter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAccessorySettingsItemModule homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "attributedStringForObjectValue:withDefaultAttributes:", v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v13, "setAttributedFooterTitle:", v25);
    }
    else
    {
      objc_msgSend(v7, "footerTitleFormatter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessorySettingsItemModule homeKitSettingsVendor](self, "homeKitSettingsVendor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringForObjectValue:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setFooterTitle:", v29);

      v25 = 0;
    }
  }
  else
  {
    objc_msgSend(v7, "localizedFooter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
      goto LABEL_20;
    objc_msgSend(v7, "localizedFooter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFooterTitle:", v25);
  }

LABEL_20:
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), 0x7FFFFFFFFFFFFFFFLL, CFSTR("HUAccessorySettingsItemModuleSortKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v30;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUserInfo:", v31);
LABEL_26:

    goto LABEL_27;
  }
  v42 = CFSTR("HUAccessorySettingsItemModuleSortKey");
  objc_msgSend(v7, "sortKey");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (!v30)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), 0x7FFFFFFFFFFFFFFFLL);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v43[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUserInfo:", v32);

  if (!v30)
    goto LABEL_26;
LABEL_27:

  objc_msgSend(v7, "adapterIdentifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[HUAccessorySettingsItemModule homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "hf_settingsAdapterManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adapterIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "adapterForIdentifier:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v37, "configureSection:forEntity:", v13, v7);

  }
  return v13;
}

- (id)_itemSectionsForParentGroupWithItems
{
  HUAccessorySettingsItemModule *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  HUAccessorySettingsItemModule *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  void *v28;
  id obj;
  _QWORD v30[4];
  _QWORD v31[2];
  _QWORD v32[4];
  id v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v2 = self;
  v44 = *MEMORY[0x1E0C80C00];
  -[HUAccessorySettingsItemModule settingItemsToBeDisplayed](self, "settingItemsToBeDisplayed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsItemModule groupItemsToBeDisplayed](v2, "groupItemsToBeDisplayed");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[HUAccessorySettingsItemModule parentSettingGroup](v2, "parentSettingGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke;
        v34[3] = &unk_1E6F4DAD8;
        v34[4] = v10;
        objc_msgSend(v3, "na_firstObjectPassingTest:", v34);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = v2;
          -[HUAccessorySettingsItemModule codex](v2, "codex");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "keyPath");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "hf_nodeWithKeyPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v28, "addObject:", v11);
          }
          else
          {
            HFLogForCategory();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "keyPath");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v40 = v11;
              v41 = 2112;
              v42 = v17;
              _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Dropping item (%@) with setting not in allowlist: %@", buf, 0x16u);

            }
          }
          v2 = v12;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v7);
  }

  -[HUAccessorySettingsItemModule parentEntity](v2, "parentEntity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "wantsSeparateSectionPerGroup");

  if ((v19 & 1) != 0)
  {
    v20 = (void *)objc_opt_new();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_3;
    v30[3] = &unk_1E6F5B1B0;
    v21 = (id *)v31;
    v22 = v20;
    v31[0] = v22;
    v31[1] = v2;
    v23 = v28;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v30);
    v24 = v27;
  }
  else
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_143;
    v32[3] = &unk_1E6F5B148;
    v21 = &v33;
    v23 = v28;
    v25 = v28;
    v33 = v25;
    v24 = v27;
    objc_msgSend(v27, "na_each:", v32);
    objc_msgSend(v25, "sortUsingComparator:", &__block_literal_global_146_0);
    -[HUAccessorySettingsItemModule _itemSectionsForShowInSeperateSectionItems:](v2, "_itemSectionsForShowInSeperateSectionItems:", v25);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

uint64_t __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D30158]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

void __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_143(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "alwaysShowGroup");

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

uint64_t __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sortKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

void __69__HUAccessorySettingsItemModule__itemSectionsForParentGroupWithItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_itemSectionWithEntity:items:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v7);

}

- (id)_itemSectionsForShowInSeperateSectionItems:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "entity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "showInSeperateSection");

        if (v13)
        {
          objc_msgSend(v11, "entity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUAccessorySettingsItemModule _itemSectionWithEntity:items:](self, "_itemSectionWithEntity:items:", v14, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "na_safeAddObject:", v16);

          objc_msgSend(v5, "removeObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v17 = v5;
  objc_msgSend(v5, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "array");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySettingsItemModule _itemSectionWithEntity:items:](self, "_itemSectionWithEntity:items:", v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeAddObject:", v21);

  return v4;
}

- (id)_itemSectionsForGroupKeyPaths:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = (id)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        -[HUAccessorySettingsItemModule codex](self, "codex", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hf_nodeWithKeyPath:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "representedObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          -[HUAccessorySettingsItemModule groupItemsToBeDisplayed](self, "groupItemsToBeDisplayed");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __63__HUAccessorySettingsItemModule__itemSectionsForGroupKeyPaths___block_invoke;
          v21[3] = &unk_1E6F5B1D8;
          v21[4] = v10;
          objc_msgSend(v14, "na_firstObjectPassingTest:", v21);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[HUAccessorySettingsItemModule settingItemsToBeDisplayed](self, "settingItemsToBeDisplayed");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUAccessorySettingsItemModule groupItemsToBeDisplayed](self, "groupItemsToBeDisplayed");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUAccessorySettingsItemModule _itemSectionForGroup:entity:settingItems:groupItems:](self, "_itemSectionForGroup:entity:settingItems:groupItems:", v15, v13, v16, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "na_safeAddObject:", v18);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  return v20;
}

uint64_t __63__HUAccessorySettingsItemModule__itemSectionsForGroupKeyPaths___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "settingKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_itemSectionForGroup:(id)a3 entity:(id)a4 settingItems:(id)a5 groupItems:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, void *);
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;

  v9 = a3;
  v10 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke;
  v36[3] = &unk_1E6F5B200;
  v12 = v9;
  v37 = v12;
  v13 = v10;
  v38 = v13;
  v14 = a5;
  objc_msgSend(a6, "na_filter:", v36);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "settingGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = v11;
  v32 = 3221225472;
  v33 = __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_2;
  v34 = &unk_1E6F5B250;
  v18 = v17;
  v35 = v18;
  objc_msgSend(v14, "na_filter:", &v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v15;
  if (v15)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
LABEL_3:
      objc_msgSend(v20, "setByAddingObjectsFromSet:", v19, self, v31, v32, v33, v34);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set", self, v31, v32, v33, v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setByAddingObjectsFromSet:", v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
LABEL_4:

LABEL_5:
  objc_msgSend(v21, "na_filter:", &__block_literal_global_154_0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "na_setByRemovingObjectsFromSet:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sortedArrayUsingComparator:", &__block_literal_global_155_0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v25, "count"))
  {
    objc_msgSend(v30, "_itemSectionWithEntity:items:", v13, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

uint64_t __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "settingGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "entity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "alwaysShowGroup");

    if (v10)
    {
      objc_msgSend(v3, "entity");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "keyPath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "hasPrefix:", v13);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

uint64_t __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D30178]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_3;
  v9[3] = &unk_1E6F5B228;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

uint64_t __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "keyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

BOOL __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D30190]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

uint64_t __85__HUAccessorySettingsItemModule__itemSectionForGroup_entity_settingItems_groupItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D30190];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D30190]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sortKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

  return v12;
}

- (void)_resetIfNeeded
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  HMSettings *v6;
  HMSettings *settings;
  uint64_t v8;
  void *v9;
  void *v10;
  HMSettingGroup *v11;
  HMSettingGroup *parentSettingGroup;
  HMSettingGroup *v13;
  void *v14;
  void *v15;
  NATreeNode *v16;
  NATreeNode *codex;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HFAccessorySettingsEntity *v26;
  HFAccessorySettingsEntity *parentEntity;

  -[HUAccessorySettingsItemModule settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  if (!v3)
  {
    -[HUAccessorySettingsItemModule homeKitSettingsVendor](self, "homeKitSettingsVendor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "settings");
    v6 = (HMSettings *)objc_claimAutoreleasedReturnValue();
    settings = self->_settings;
    self->_settings = v6;

  }
  -[HUAccessorySettingsItemModule parentSettingGroup](self, "parentSettingGroup");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
  }
  else
  {
    -[HMSettings rootGroup](self->_settings, "rootGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_8;
    -[HMSettings rootGroup](self->_settings, "rootGroup");
    v11 = (HMSettingGroup *)objc_claimAutoreleasedReturnValue();
    parentSettingGroup = self->_parentSettingGroup;
    self->_parentSettingGroup = v11;

    v13 = self->_parentSettingGroup;
    -[HUAccessorySettingsItemModule accessorySettingsItemProvider](self, "accessorySettingsItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSettingGroup:", v13);
    v4 = 1;
  }

LABEL_8:
  -[HUAccessorySettingsItemModule codex](self, "codex");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[HUAccessorySettingsItemModule settings](self, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hf_codex");
    v16 = (NATreeNode *)objc_claimAutoreleasedReturnValue();
    codex = self->_codex;
    self->_codex = v16;

    v4 = 1;
  }
  -[HUAccessorySettingsItemModule parentEntity](self, "parentEntity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18
    || (-[HUAccessorySettingsItemModule parentSettingGroup](self, "parentSettingGroup"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "keyPath"),
        (v19 = objc_claimAutoreleasedReturnValue()) == 0))
  {

  }
  else
  {
    v20 = (void *)v19;
    -[HUAccessorySettingsItemModule codex](self, "codex");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[HUAccessorySettingsItemModule codex](self, "codex");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUAccessorySettingsItemModule parentSettingGroup](self, "parentSettingGroup");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "keyPath");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hf_nodeWithKeyPath:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "representedObject");
      v26 = (HFAccessorySettingsEntity *)objc_claimAutoreleasedReturnValue();
      parentEntity = self->_parentEntity;
      self->_parentEntity = v26;

      goto LABEL_17;
    }
  }
  if (v4)
  {
LABEL_17:
    -[HUAccessorySettingsItemModule _unregisterForAccessorySettingsUpdates](self, "_unregisterForAccessorySettingsUpdates");
    -[HUAccessorySettingsItemModule _registerForAccessorySettingsUpdates](self, "_registerForAccessorySettingsUpdates");
  }
}

- (id)getAllHomePodFromItem:(id)a3
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v5 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(v7, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v12 = (void *)v9;

    v4 = v12;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v10 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v7 = v11;

    objc_msgSend(v7, "components");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "na_map:", &__block_literal_global_159_2);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:

  return v4;
}

id __55__HUAccessorySettingsItemModule_getAllHomePodFromItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mediaProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)checkSoftwareVersionForAccessories:(id)a3 neededSoftwareVersion:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__HUAccessorySettingsItemModule_checkSoftwareVersionForAccessories_neededSoftwareVersion___block_invoke;
  v8[3] = &unk_1E6F4E5D8;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "na_any:", v8);

  return (char)a3;
}

uint64_t __90__HUAccessorySettingsItemModule_checkSoftwareVersionForAccessories_neededSoftwareVersion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAtLeastVersion:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (HFAccessorySettingsItemProvider)accessorySettingsItemProvider
{
  return self->_accessorySettingsItemProvider;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMSettings)settings
{
  return self->_settings;
}

- (NATreeNode)codex
{
  return self->_codex;
}

- (HFAccessorySettingsEntity)parentEntity
{
  return self->_parentEntity;
}

- (HMSettingGroup)parentSettingGroup
{
  return self->_parentSettingGroup;
}

- (NSSet)settingItemsToBeDisplayed
{
  return self->_settingItemsToBeDisplayed;
}

- (void)setSettingItemsToBeDisplayed:(id)a3
{
  objc_storeStrong((id *)&self->_settingItemsToBeDisplayed, a3);
}

- (NSSet)groupItemsToBeDisplayed
{
  return self->_groupItemsToBeDisplayed;
}

- (void)setGroupItemsToBeDisplayed:(id)a3
{
  objc_storeStrong((id *)&self->_groupItemsToBeDisplayed, a3);
}

- (HFHomeKitSettingsVendor)homeKitSettingsVendor
{
  return self->_homeKitSettingsVendor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitSettingsVendor, 0);
  objc_storeStrong((id *)&self->_groupItemsToBeDisplayed, 0);
  objc_storeStrong((id *)&self->_settingItemsToBeDisplayed, 0);
  objc_storeStrong((id *)&self->_parentSettingGroup, 0);
  objc_storeStrong((id *)&self->_parentEntity, 0);
  objc_storeStrong((id *)&self->_codex, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
  objc_storeStrong((id *)&self->_accessorySettingsItemProvider, 0);
}

@end
