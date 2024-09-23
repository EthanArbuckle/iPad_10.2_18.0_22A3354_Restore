@implementation HFZoneModule

- (HFZoneModule)initWithItemUpdater:(id)a3 room:(id)a4
{
  id v7;
  HFZoneModule *v8;
  HFZoneModule *v9;
  HFZoneItemProvider *v10;
  void *v11;
  uint64_t v12;
  HFZoneItemProvider *zoneItemProvider;
  HFZoneSuggestionItemProvider *v14;
  void *v15;
  uint64_t v16;
  HFZoneSuggestionItemProvider *zoneSuggestionItemProvider;
  HFCurrentZonesItem *v18;
  HFCurrentZonesItem *currentZoneItem;
  HFStaticItemProvider *v20;
  void *v21;
  uint64_t v22;
  HFStaticItemProvider *currentZoneItemProvider;
  void *v24;
  objc_super v26;

  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HFZoneModule;
  v8 = -[HFItemModule initWithItemUpdater:](&v26, sel_initWithItemUpdater_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_room, a4);
    v10 = [HFZoneItemProvider alloc];
    objc_msgSend(v7, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HFZoneItemProvider initWithHome:](v10, "initWithHome:", v11);
    zoneItemProvider = v9->_zoneItemProvider;
    v9->_zoneItemProvider = (HFZoneItemProvider *)v12;

    v14 = [HFZoneSuggestionItemProvider alloc];
    objc_msgSend(v7, "home");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[HFZoneSuggestionItemProvider initWithHome:](v14, "initWithHome:", v15);
    zoneSuggestionItemProvider = v9->_zoneSuggestionItemProvider;
    v9->_zoneSuggestionItemProvider = (HFZoneSuggestionItemProvider *)v16;

    v18 = -[HFCurrentZonesItem initWithRoom:]([HFCurrentZonesItem alloc], "initWithRoom:", v7);
    currentZoneItem = v9->_currentZoneItem;
    v9->_currentZoneItem = v18;

    v20 = [HFStaticItemProvider alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9->_currentZoneItem);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HFStaticItemProvider initWithItems:](v20, "initWithItems:", v21);
    currentZoneItemProvider = v9->_currentZoneItemProvider;
    v9->_currentZoneItemProvider = (HFStaticItemProvider *)v22;

    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addHomeObserver:", v9);

  }
  return v9;
}

- (NSSet)itemProviders
{
  NSSet *itemProviders;
  NSSet *v3;
  void *v5;
  HFStaticItem *v6;
  uint64_t v7;
  id v8;
  HFStaticItem *v9;
  HFStaticItemProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  HFStaticItemProvider *v14;
  id v15;
  void *v16;
  HFTransformItemProvider *v17;
  void *v18;
  HFTransformItemProvider *v19;
  HFTransformItemProvider *v20;
  void *v21;
  HFTransformItemProvider *v22;
  HFTransformItemProvider *v23;
  void *v24;
  HFTransformItemProvider *v25;
  void *v26;
  void *v27;
  NSSet *v28;
  NSSet *v29;
  _QWORD aBlock[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id location[2];

  itemProviders = self->_itemProviders;
  if (itemProviders)
  {
    v3 = itemProviders;
  }
  else
  {
    objc_initWeak(location, self);
    -[HFZoneModule room](self, "room");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [HFStaticItem alloc];
    v7 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __29__HFZoneModule_itemProviders__block_invoke;
    v34[3] = &unk_1EA732BD8;
    objc_copyWeak(&v36, location);
    v8 = v5;
    v35 = v8;
    v9 = -[HFStaticItem initWithResultsBlock:](v6, "initWithResultsBlock:", v34);
    -[HFZoneModule setCreateNewZoneItem:](self, "setCreateNewZoneItem:", v9);

    v10 = [HFStaticItemProvider alloc];
    v11 = (void *)MEMORY[0x1E0C99E60];
    -[HFZoneModule createNewZoneItem](self, "createNewZoneItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HFStaticItemProvider initWithItems:](v10, "initWithItems:", v13);
    -[HFZoneModule setCreateNewZoneItemProvider:](self, "setCreateNewZoneItemProvider:", v14);

    aBlock[0] = v7;
    aBlock[1] = 3221225472;
    aBlock[2] = __29__HFZoneModule_itemProviders__block_invoke_2;
    aBlock[3] = &unk_1EA732C28;
    objc_copyWeak(&v33, location);
    v15 = v8;
    v32 = v15;
    v16 = _Block_copy(aBlock);
    v17 = [HFTransformItemProvider alloc];
    -[HFZoneModule zoneItemProvider](self, "zoneItemProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[HFTransformItemProvider initWithSourceProvider:transformationBlock:](v17, "initWithSourceProvider:transformationBlock:", v18, v16);

    v20 = [HFTransformItemProvider alloc];
    -[HFZoneModule zoneSuggestionItemProvider](self, "zoneSuggestionItemProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HFTransformItemProvider initWithSourceProvider:transformationBlock:](v20, "initWithSourceProvider:transformationBlock:", v21, v16);

    v23 = [HFTransformItemProvider alloc];
    -[HFZoneModule currentZoneItemProvider](self, "currentZoneItemProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HFTransformItemProvider initWithSourceProvider:transformationBlock:](v23, "initWithSourceProvider:transformationBlock:", v24, v16);

    v26 = (void *)MEMORY[0x1E0C99E60];
    -[HFZoneModule createNewZoneItemProvider](self, "createNewZoneItemProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setWithObjects:", v19, v22, v27, v25, 0);
    v28 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v29 = self->_itemProviders;
    self->_itemProviders = v28;

    v3 = self->_itemProviders;
    objc_destroyWeak(&v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(location);
  }
  return v3;
}

id __29__HFZoneModule_itemProviders__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)MEMORY[0x1E0D519C0];
  v13[0] = CFSTR("title");
  v4 = 1;
  _HFLocalizedStringWithDefaultValue(CFSTR("HFZoneModuleCreateNew"), CFSTR("HFZoneModuleCreateNew"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("titlePlaceholder");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFZoneModuleCreateNewPlaceholder"), CFSTR("HFZoneModuleCreateNewPlaceholder"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("hidden");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hf_currentUserIsAdministrator"))
    v4 = objc_msgSend(WeakRetained, "isExpanded") ^ 1;
  objc_msgSend(v7, "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

_HFDeletableTransformItem *__29__HFZoneModule_itemProviders__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _HFDeletableTransformItem *v4;
  id v5;
  _HFDeletableTransformItem *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  v4 = [_HFDeletableTransformItem alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__HFZoneModule_itemProviders__block_invoke_3;
  v8[3] = &unk_1EA732C00;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v5 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v6 = -[HFTransformItem initWithSourceItem:transformationBlock:](v4, "initWithSourceItem:transformationBlock:", v5, v8);

  objc_destroyWeak(&v11);
  return v6;
}

id __29__HFZoneModule_itemProviders__block_invoke_3(id *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v3 = a1 + 6;
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(WeakRetained, "isExpanded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("hidden"));
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1[4], "zone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "rooms");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_9;
    }
    objc_msgSend(a1[4], "zoneBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rooms");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "containsObject:", a1[5]));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("selected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(WeakRetained, "isExpanded") ^ 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("hidden"));

LABEL_10:
  objc_msgSend(a1[5], "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hf_currentUserIsAdministrator");

  if ((v14 & 1) == 0)
  {
    v15 = a1[4];
    objc_msgSend(WeakRetained, "currentZoneItem");
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 != v16)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isDisabled"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (v17 = a1[4],
          objc_msgSend(WeakRetained, "createNewZoneItem"),
          v18 = (id)objc_claimAutoreleasedReturnValue(),
          v18,
          v17 == v18))
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("selected"));
  }

  return v6;
}

- (id)buildSectionsWithDisplayedItems:(id)a3
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
  int v15;
  void *v16;
  HFMutableItemSection *v17;
  void *v18;
  void *v19;
  _QWORD v21[5];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "na_filter:", &__block_literal_global_96);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_filter:", &__block_literal_global_198_1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_200);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "na_filter:", &__block_literal_global_201);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_203_0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_6;
    v21[3] = &unk_1EA732D30;
    v21[4] = self;
    objc_msgSend(v5, "na_firstObjectPassingTest:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "na_safeAddObject:", v12);
    objc_msgSend(v13, "addObjectsFromArray:", v8);
    objc_msgSend(v13, "addObjectsFromArray:", v11);
    -[HFZoneModule createNewZoneItem](self, "createNewZoneItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v4, "containsObject:", v14);

    if (v15)
    {
      -[HFZoneModule createNewZoneItem](self, "createNewZoneItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "na_safeAddObject:", v16);

    }
    if (objc_msgSend(v13, "count"))
    {
      v17 = -[HFItemSection initWithIdentifier:]([HFMutableItemSection alloc], "initWithIdentifier:", CFSTR("ZONE_SECTION"));
      -[HFItemSection setItems:](v17, "setItems:", v13);
      _HFLocalizedStringWithDefaultValue(CFSTR("HF_SERVICE_DETAILS_ZONE_FOOTER"), CFSTR("HF_SERVICE_DETAILS_ZONE_FOOTER"), 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItemSection setFooterTitle:](v17, "setFooterTitle:", v18);

      v22[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "sourceItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

BOOL __48__HFZoneModule_buildSectionsWithDisplayedItems___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "sourceItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentZoneItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

- (BOOL)toggleExpansion
{
  -[HFZoneModule setExpanded:](self, "setExpanded:", -[HFZoneModule isExpanded](self, "isExpanded") ^ 1);
  return -[HFZoneModule isExpanded](self, "isExpanded");
}

- (BOOL)canExpand
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[HFZoneModule zoneItemProvider](self, "zoneItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if ((v5 & 1) != 0)
    return 1;
  -[HFZoneModule room](self, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_allZones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)objc_msgSend(v8, "count") > 1;

  return v6;
}

- (void)setExpanded:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[HFZoneModule canExpand](self, "canExpand"))
  {
    if (self->_expanded != v3)
    {
      self->_expanded = v3;
      -[HFZoneModule _reloadItemProviders](self, "_reloadItemProviders");
    }
  }
}

- (void)_reloadItemProviders
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[HFZoneModule itemProviders](self, "itemProviders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateRequest requestToReloadItemProviders:senderSelector:](HFItemUpdateRequest, "requestToReloadItemProviders:senderSelector:", v4, a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[HFItemModule itemUpdater](self, "itemUpdater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "performItemUpdateRequest:", v7);

}

- (void)home:(id)a3 didAddZone:(id)a4
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a4, "rooms", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFZoneModule room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
    -[HFZoneModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (void)home:(id)a3 didRemoveZone:(id)a4
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a4, "rooms", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFZoneModule room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
    -[HFZoneModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (void)home:(id)a3 didUpdateNameForZone:(id)a4
{
  void *v5;
  void *v6;
  int v7;

  objc_msgSend(a4, "rooms", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFZoneModule room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
    -[HFZoneModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (void)home:(id)a3 didAddRoom:(id)a4 toZone:(id)a5
{
  id v6;
  void *v7;
  int v8;

  v6 = a4;
  -[HFZoneModule room](self, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
    -[HFZoneModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (void)home:(id)a3 didRemoveRoom:(id)a4 fromZone:(id)a5
{
  id v6;
  void *v7;
  int v8;

  v6 = a4;
  -[HFZoneModule room](self, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
    -[HFZoneModule _reloadItemProviders](self, "_reloadItemProviders");
}

- (void)setItemProviders:(id)a3
{
  objc_storeStrong((id *)&self->_itemProviders, a3);
}

- (HMRoom)room
{
  return self->_room;
}

- (HFCurrentZonesItem)currentZoneItem
{
  return self->_currentZoneItem;
}

- (HFItem)createNewZoneItem
{
  return self->_createNewZoneItem;
}

- (void)setCreateNewZoneItem:(id)a3
{
  objc_storeStrong((id *)&self->_createNewZoneItem, a3);
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (HFStaticItemProvider)expandedItemProvider
{
  return self->_expandedItemProvider;
}

- (void)setExpandedItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_expandedItemProvider, a3);
}

- (HFStaticItemProvider)createNewZoneItemProvider
{
  return self->_createNewZoneItemProvider;
}

- (void)setCreateNewZoneItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_createNewZoneItemProvider, a3);
}

- (HFStaticItemProvider)currentZoneItemProvider
{
  return self->_currentZoneItemProvider;
}

- (void)setCurrentZoneItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_currentZoneItemProvider, a3);
}

- (HFZoneItemProvider)zoneItemProvider
{
  return self->_zoneItemProvider;
}

- (void)setZoneItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_zoneItemProvider, a3);
}

- (HFZoneSuggestionItemProvider)zoneSuggestionItemProvider
{
  return self->_zoneSuggestionItemProvider;
}

- (void)setZoneSuggestionItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_zoneSuggestionItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneSuggestionItemProvider, 0);
  objc_storeStrong((id *)&self->_zoneItemProvider, 0);
  objc_storeStrong((id *)&self->_currentZoneItemProvider, 0);
  objc_storeStrong((id *)&self->_createNewZoneItemProvider, 0);
  objc_storeStrong((id *)&self->_expandedItemProvider, 0);
  objc_storeStrong((id *)&self->_createNewZoneItem, 0);
  objc_storeStrong((id *)&self->_currentZoneItem, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
