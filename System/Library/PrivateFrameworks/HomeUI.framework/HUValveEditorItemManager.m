@implementation HUValveEditorItemManager

+ (id)preferredSectionSortArray
{
  if (_MergedGlobals_4_9 != -1)
    dispatch_once(&_MergedGlobals_4_9, &__block_literal_global_7_3);
  return (id)qword_1EF226C18;
}

void __53__HUValveEditorItemManager_preferredSectionSortArray__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0CB8918];
  v2[1] = CFSTR("HUNameItemModuleSectionIdentifier");
  v2[2] = *MEMORY[0x1E0CB8A28];
  v2[3] = CFSTR("HUValveEditorSectionIdentifierIdentify");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1EF226C18;
  qword_1EF226C18 = v0;

}

+ (id)sortComparatorForValveEditorSections
{
  return &__block_literal_global_9_1;
}

uint64_t __64__HUValveEditorItemManager_sortComparatorForValveEditorSections__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HUValveEditorSectionSortOrderKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("HUValveEditorSectionSortOrderKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "compare:", v9);
  if (!v10)
  {
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "compare:", v12);

  }
  return v10;
}

- (HUValveEditorItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4 editorMode:(unint64_t)a5
{
  id v8;
  void *v9;
  HUValveEditorItemManager *v10;
  uint64_t v11;
  id v12;
  void *v13;
  HFValveServiceItem *v14;
  void *v15;
  void *v16;
  HFValveServiceItem *sourceValveItem;
  HUControlPanelController *v18;
  HUControlPanelController *controlPanelController;
  objc_super v21;

  v8 = a3;
  v9 = (void *)objc_msgSend(a4, "copy");
  v21.receiver = self;
  v21.super_class = (Class)HUValveEditorItemManager;
  v10 = -[HFItemManager initWithDelegate:sourceItem:](&v21, sel_initWithDelegate_sourceItem_, v8, v9);

  if (v10)
  {
    v11 = objc_opt_class();
    -[HFItemManager sourceItem](v10, "sourceItem");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = (HFValveServiceItem *)v12;
      if (v13)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v11, objc_opt_class());

    }
    v14 = 0;
LABEL_9:

    sourceValveItem = v10->_sourceValveItem;
    v10->_sourceValveItem = v14;

    v18 = -[HUControlPanelController initWithDelegate:]([HUControlPanelController alloc], "initWithDelegate:", v10);
    controlPanelController = v10->_controlPanelController;
    v10->_controlPanelController = v18;

    v10->_editorMode = a5;
  }
  return v10;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
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
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  HUNameItemModule *v43;
  void *v44;
  void *v45;
  HUNameItemModule *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v51[4];
  id v52;
  id location;
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D317A0]);
  -[HFValveServiceItem homeKitObject](self->_sourceValveItem, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithExistingObject:inHome:", v6, v7);
  -[HUValveEditorItemManager setServiceBuilder:](self, "setServiceBuilder:", v8);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUValveEditorItemManager controlPanelItemProvider](self, "controlPanelItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D31338]);
    -[HUValveEditorItemManager sourceValveItem](self, "sourceValveItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUValveEditorItemManager sourceValveItem](self, "sourceValveItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v11, "initWithItem:valueSource:", v12, v14);
    -[HUValveEditorItemManager setControlPanelItemProvider:](self, "setControlPanelItemProvider:", v15);

    if (-[HUValveEditorItemManager editorMode](self, "editorMode") == 1)
    {
      objc_initWeak(&location, self);
      v51[0] = MEMORY[0x1E0C809B0];
      v51[1] = 3221225472;
      v51[2] = __55__HUValveEditorItemManager__buildItemProvidersForHome___block_invoke;
      v51[3] = &unk_1E6F568A8;
      objc_copyWeak(&v52, &location);
      -[HUValveEditorItemManager controlPanelItemProvider](self, "controlPanelItemProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFilter:", v51);

      objc_destroyWeak(&v52);
      objc_destroyWeak(&location);
    }
    -[HUValveEditorItemManager controlPanelItemProvider](self, "controlPanelItemProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v17);

  }
  -[HUValveEditorItemManager staticItemProvider](self, "staticItemProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18 == 0;

  if (v19)
  {
    -[HUValveEditorItemManager sourceValveItem](self, "sourceValveItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "service");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "accessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "hf_owningBridgeAccessory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    -[HUValveEditorItemManager sourceValveItem](self, "sourceValveItem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "latestResults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "integerValue") == 0;

    v29 = objc_alloc(MEMORY[0x1E0D31840]);
    v54[0] = *MEMORY[0x1E0D30D18];
    _HULocalizedStringWithDefaultValue(CFSTR("HUValveEditorIdentifyButtonTitle"), CFSTR("HUValveEditorIdentifyButtonTitle"), 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v54[1] = *MEMORY[0x1E0D30D70];
    v55[0] = v30;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24 | v28);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v29, "initWithResults:", v32);
    -[HUValveEditorItemManager setIdentifyItem:](self, "setIdentifyItem:", v33);

    v34 = objc_alloc(MEMORY[0x1E0D31848]);
    v35 = (void *)MEMORY[0x1E0C99E60];
    -[HUValveEditorItemManager nameItem](self, "nameItem");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUValveEditorItemManager identifyItem](self, "identifyItem");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setWithObjects:", v36, v37, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v34, "initWithItems:", v38);
    -[HUValveEditorItemManager setStaticItemProvider:](self, "setStaticItemProvider:", v39);

    -[HUValveEditorItemManager staticItemProvider](self, "staticItemProvider");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v40);

  }
  -[HUValveEditorItemManager nameModule](self, "nameModule");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41 == 0;

  if (v42)
  {
    v43 = [HUNameItemModule alloc];
    -[HUValveEditorItemManager sourceValveItem](self, "sourceValveItem");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUValveEditorItemManager serviceBuilder](self, "serviceBuilder");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[HUNameItemModule initWithItemUpdater:sourceServiceLikeItem:itemBuilder:](v43, "initWithItemUpdater:sourceServiceLikeItem:itemBuilder:", self, v44, v45);
    -[HUValveEditorItemManager setNameModule:](self, "setNameModule:", v46);

    -[HUValveEditorItemManager nameModule](self, "nameModule");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "itemProviders");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "allObjects");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v49);

  }
  return v9;
}

uint64_t __55__HUValveEditorItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_characteristicTypesForControlPanelItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "na_any:", &__block_literal_global_16_2) ^ 1;
  return v6;
}

uint64_t __55__HUValveEditorItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *MEMORY[0x1E0CB8A28]);
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
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
  uint64_t i;
  void *v14;
  uint64_t v15;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v62;
  void *v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  const __CFString *v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  _BYTE v82[128];
  const __CFString *v83;
  void *v84;
  uint64_t v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUValveEditorItemManager controlPanelItemProvider](self, "controlPanelItemProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intersectsSet:", v4);

  v62 = v4;
  if (v8)
  {
    -[HUValveEditorItemManager controlPanelItemProvider](self, "controlPanelItemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_setByIntersectingWithSet:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = MEMORY[0x1E0C809B0];
    v76[1] = 3221225472;
    v76[2] = __61__HUValveEditorItemManager__buildSectionsWithDisplayedItems___block_invoke;
    v76[3] = &unk_1E6F508C8;
    v76[4] = self;
    objc_msgSend(v11, "na_filter:", v76);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    obj = v12;
    v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
    if (v66)
    {
      v65 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v66; ++i)
        {
          v14 = v5;
          if (*(_QWORD *)v73 != v65)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
          -[HUValveEditorItemManager _characteristicTypesForControlPanelItem:](self, "_characteristicTypesForControlPanelItem:", v15, v62);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v71[0] = MEMORY[0x1E0C809B0];
          v71[1] = 3221225472;
          v71[2] = __61__HUValveEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_2;
          v71[3] = &unk_1E6F4E0D8;
          v71[4] = self;
          objc_msgSend(v16, "na_firstObjectPassingTest:", v71);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", v17);
          v85 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setItems:", v19);

          -[HUValveEditorItemManager controlPanelController](self, "controlPanelController");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFItemManager sourceItem](self, "sourceItem");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "sectionTitleForItem:forSourceItem:", v15, v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setHeaderTitle:", v22);

          -[HUValveEditorItemManager controlPanelController](self, "controlPanelController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HFItemManager sourceItem](self, "sourceItem");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "sectionFooterForItem:forSourceItem:", v15, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setFooterTitle:", v25);

          objc_msgSend((id)objc_opt_class(), "preferredSectionSortArray");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "indexOfObject:", v17);

          if (v27 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend((id)objc_opt_class(), "preferredSectionSortArray");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v28, "count");

          }
          v83 = CFSTR("HUValveEditorSectionSortOrderKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setUserInfo:", v30);

          v5 = v14;
          objc_msgSend(v14, "addObject:", v18);

        }
        v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
      }
      while (v66);
    }

    v4 = v62;
  }
  -[HUValveEditorItemManager nameModule](self, "nameModule", v62);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "buildSectionsWithDisplayedItems:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v33 = v32;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v68;
    do
    {
      for (j = 0; j != v35; ++j)
      {
        if (*(_QWORD *)v68 != v36)
          objc_enumerationMutation(v33);
        v38 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * j);
        objc_msgSend(v38, "identifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("HUNameItemModuleSectionIdentifier"));

        if (v40)
        {
          v41 = (void *)objc_msgSend(v38, "mutableCopy");
          objc_msgSend((id)objc_opt_class(), "preferredSectionSortArray");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v42, "indexOfObject:", CFSTR("HUNameItemModuleSectionIdentifier"));

          v80 = CFSTR("HUValveEditorSectionSortOrderKey");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = v44;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setUserInfo:", v45);

          objc_msgSend(v5, "addObject:", v41);
        }
        else
        {
          objc_msgSend(v5, "addObject:", v38);
        }
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    }
    while (v35);
  }

  -[HUValveEditorItemManager identifyItem](self, "identifyItem");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v63, "containsObject:", v46);

  if (v47)
  {
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUValveEditorSectionIdentifierIdentify"));
    -[HUValveEditorItemManager identifyItem](self, "identifyItem");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v49;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setItems:", v50);

    objc_msgSend((id)objc_opt_class(), "preferredSectionSortArray");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "indexOfObject:", CFSTR("HUValveEditorSectionIdentifierIdentify"));

    -[HUValveEditorItemManager sourceValveItem](self, "sourceValveItem");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "service");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "serviceSubtype");
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v55, "isEqualToString:", *MEMORY[0x1E0CB9978]))
    {
      v56 = CFSTR("HUValveEditorIdentifyButtonFooterTitleIrrigation");
    }
    else if (objc_msgSend(v55, "isEqualToString:", *MEMORY[0x1E0CB9980]))
    {
      v56 = CFSTR("HUValveEditorIdentifyButtonFooterTitleShowerHead");
    }
    else if (objc_msgSend(v55, "isEqualToString:", *MEMORY[0x1E0CB9990]))
    {
      v56 = CFSTR("HUValveEditorIdentifyButtonFooterTitleFaucet");
    }
    else
    {
      if (!objc_msgSend(v55, "isEqualToString:", *MEMORY[0x1E0CB9970]))
      {
        v57 = 0;
        goto LABEL_32;
      }
      v56 = CFSTR("HUValveEditorIdentifyButtonFooterTitleGeneric");
    }
    _HULocalizedStringWithDefaultValue(v56, v56, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_32:
    objc_msgSend(v48, "setFooterTitle:", v57);
    v77 = CFSTR("HUValveEditorSectionSortOrderKey");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v52);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v58;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setUserInfo:", v59);

    objc_msgSend(v5, "addObject:", v48);
  }
  objc_msgSend((id)objc_opt_class(), "sortComparatorForValveEditorSections");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortUsingComparator:", v60);

  return v5;
}

uint64_t __61__HUValveEditorItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "controlPanelController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldDisplayItem:", v3);

  return v5;
}

uint64_t __61__HUValveEditorItemManager__buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "preferredSectionSortArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2);

  return v4;
}

- (id)_characteristicTypesForControlPanelItem:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "controlItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__HUValveEditorItemManager__characteristicTypesForControlPanelItem___block_invoke;
  v7[3] = &unk_1E6F57A40;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "na_each:", v7);

  return v5;
}

void __68__HUValveEditorItemManager__characteristicTypesForControlPanelItem___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicOptions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "characteristicTypesForUsage:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

- (id)_characteristicsAffectedByControlItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "characteristicOptions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristicTypesForUsage:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(v3, "valueSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allCharacteristicsForCharacteristicType:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "unionSet:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v4;
}

- (void)controlPanelController:(id)a3 willBeginPossibleWritesForControlItem:(id)a4
{
  id v5;

  -[HUValveEditorItemManager _characteristicsAffectedByControlItem:](self, "_characteristicsAffectedByControlItem:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HFItemManager beginSuppressingUpdatesForCharacteristics:withReason:](self, "beginSuppressingUpdatesForCharacteristics:withReason:", v5, CFSTR("valveEditorControlItemInteraction"));

}

- (void)controlPanelController:(id)a3 didEndPossibleWritesForControlItem:(id)a4
{
  -[HFItemManager endSuppressingUpdatesForCharacteristicsWithReason:updateAffectedItems:](self, "endSuppressingUpdatesForCharacteristicsWithReason:updateAffectedItems:", CFSTR("valveEditorControlItemInteraction"), 1);
}

- (HUNameItemModule)nameModule
{
  return self->_nameModule;
}

- (void)setNameModule:(id)a3
{
  objc_storeStrong((id *)&self->_nameModule, a3);
}

- (HFStaticItem)identifyItem
{
  return self->_identifyItem;
}

- (void)setIdentifyItem:(id)a3
{
  objc_storeStrong((id *)&self->_identifyItem, a3);
}

- (HUControlPanelController)controlPanelController
{
  return self->_controlPanelController;
}

- (void)setControlPanelController:(id)a3
{
  objc_storeStrong((id *)&self->_controlPanelController, a3);
}

- (HFServiceBuilder)serviceBuilder
{
  return self->_serviceBuilder;
}

- (void)setServiceBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_serviceBuilder, a3);
}

- (unint64_t)editorMode
{
  return self->_editorMode;
}

- (HFValveServiceItem)sourceValveItem
{
  return self->_sourceValveItem;
}

- (void)setSourceValveItem:(id)a3
{
  objc_storeStrong((id *)&self->_sourceValveItem, a3);
}

- (HFItem)nameItem
{
  return self->_nameItem;
}

- (void)setNameItem:(id)a3
{
  objc_storeStrong((id *)&self->_nameItem, a3);
}

- (HFControlPanelItemProvider)controlPanelItemProvider
{
  return self->_controlPanelItemProvider;
}

- (void)setControlPanelItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_controlPanelItemProvider, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_controlPanelItemProvider, 0);
  objc_storeStrong((id *)&self->_nameItem, 0);
  objc_storeStrong((id *)&self->_sourceValveItem, 0);
  objc_storeStrong((id *)&self->_serviceBuilder, 0);
  objc_storeStrong((id *)&self->_controlPanelController, 0);
  objc_storeStrong((id *)&self->_identifyItem, 0);
  objc_storeStrong((id *)&self->_nameModule, 0);
}

@end
