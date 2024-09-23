@implementation HUSideBarItemManager

- (HUSideBarItemManager)initWithDelegate:(id)a3
{
  HUSideBarItemManager *v3;
  HUSideBarStaticItem *v4;
  HUSideBarStaticItem *homeItem;
  HUSideBarStaticItem *v6;
  HUSideBarStaticItem *automationItem;
  HUSideBarStaticItem *v8;
  HUSideBarStaticItem *discoverItem;
  id v10;
  void *v11;
  uint64_t v12;
  HFStaticItemProvider *staticItemProvider;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HUSideBarItemManager;
  v3 = -[HFItemManager initWithDelegate:](&v15, sel_initWithDelegate_, a3);
  if (v3)
  {
    v4 = -[HUSideBarStaticItem initWithSideBarStaticItemType:]([HUSideBarStaticItem alloc], "initWithSideBarStaticItemType:", 0);
    homeItem = v3->_homeItem;
    v3->_homeItem = v4;

    v6 = -[HUSideBarStaticItem initWithSideBarStaticItemType:]([HUSideBarStaticItem alloc], "initWithSideBarStaticItemType:", 1);
    automationItem = v3->_automationItem;
    v3->_automationItem = v6;

    v8 = -[HUSideBarStaticItem initWithSideBarStaticItemType:]([HUSideBarStaticItem alloc], "initWithSideBarStaticItemType:", 2);
    discoverItem = v3->_discoverItem;
    v3->_discoverItem = v8;

    v10 = objc_alloc(MEMORY[0x1E0D31848]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v3->_homeItem, v3->_automationItem, v3->_discoverItem, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithItems:", v11);
    staticItemProvider = v3->_staticItemProvider;
    v3->_staticItemProvider = (HFStaticItemProvider *)v12;

  }
  return v3;
}

- (id)roomItemForRoom:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUSideBarItemManager roomItemProvider](self, "roomItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__HUSideBarItemManager_roomItemForRoom___block_invoke;
  v10[3] = &unk_1E6F53000;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __40__HUSideBarItemManager_roomItemForRoom___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)categoryItemForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HUSideBarItemManager categoryItemProvider](self, "categoryItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__HUSideBarItemManager_categoryItemForCategory___block_invoke;
  v10[3] = &unk_1E6F53028;
  v11 = v4;
  v7 = v4;
  objc_msgSend(v6, "na_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __48__HUSideBarItemManager_categoryItemForCategory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessoryTypeGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  objc_super v31;

  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HUSideBarItemManager;
  -[HFItemManager _itemsToHideInSet:](&v31, sel__itemsToHideInSet_, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[HFItemManager home](self, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hf_hasAnyVisibleTriggers");
  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[HFItemManager home](self, "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "hf_userCanCreateTrigger") & 1) != 0 || (HFForceAllowAutomationCreation() & 1) != 0)
    {
      v11 = 0;
    }
    else
    {
      -[HFItemManager home](self, "home");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "hf_userIsAllowedToCreateTrigger") & 1) == 0
        && (objc_msgSend(MEMORY[0x1E0D319D0], "isRunningInStoreDemoMode") & 1) == 0
        && (objc_msgSend(MEMORY[0x1E0D319D0], "isPressDemoModeEnabled") & 1) == 0)
      {

        goto LABEL_12;
      }
      v11 = 1;
    }
  }
  -[HFItemManager home](self, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hf_shouldBlockCurrentUserFromHome");

  if (v11)
  if ((v10 & 1) == 0)
  {

    if ((v13 & 1) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }

  if (v13)
  {
LABEL_12:
    -[HUSideBarItemManager automationItem](self, "automationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v14);

  }
LABEL_13:
  -[HUSideBarItemManager discoverContentAvailabilityDictionary](self, "discoverContentAvailabilityDictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[HFItemManager home](self, "home");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "hf_shouldBlockCurrentUserFromHome");

  }
  else
  {
    v17 = 1;
  }

  -[HFItemManager home](self, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hf_currentUserIsRestrictedGuest");

  if ((v19 & 1) != 0 || v17)
  {
    -[HUSideBarItemManager discoverItem](self, "discoverItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v20);

  }
  -[HFItemManager home](self, "home");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "hf_currentUserIsRestrictedGuest");

  if (v22)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __42__HUSideBarItemManager__itemsToHideInSet___block_invoke;
    v29[3] = &unk_1E6F53050;
    v29[4] = self;
    v30 = v8;
    objc_msgSend(v6, "na_each:", v29);

  }
  -[HFItemManager home](self, "home");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "accessories");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (!v25)
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __42__HUSideBarItemManager__itemsToHideInSet___block_invoke_2;
    v27[3] = &unk_1E6F53050;
    v27[4] = self;
    v28 = v8;
    objc_msgSend(v6, "na_each:", v27);

  }
  return v8;
}

void __42__HUSideBarItemManager__itemsToHideInSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hf_shouldBlockCurrentRestrictedGuestFromHome");

  }
  else
  {
    v8 = 0;
  }
  objc_opt_class();
  v11 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v11;
  else
    v9 = 0;
  v10 = v9;

  if ((v8 & 1) != 0 || v10)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

}

void __42__HUSideBarItemManager__itemsToHideInSet___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v3 = a2;
  objc_opt_class();
  v10 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v10;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "room");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "roomForEntireHome");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqual:", v8);

    if (v9)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31710]), "initWithHome:", v4);
  -[HUSideBarItemManager setRoomItemProvider:](self, "setRoomItemProvider:", v5);

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__HUSideBarItemManager__buildItemProvidersForHome___block_invoke;
  v19[3] = &unk_1E6F4D8E8;
  v20 = v4;
  v6 = v4;
  -[HUSideBarItemManager roomItemProvider](self, "roomItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilter:", v19);

  objc_msgSend(v6, "hf_reorderableRoomsList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSideBarItemManager setReorderableRoomList:](self, "setReorderableRoomList:", v8);

  v9 = (void *)MEMORY[0x1E0C99DE8];
  -[HUSideBarItemManager staticItemProvider](self, "staticItemProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSideBarItemManager roomItemProvider](self, "roomItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithObjects:", v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D31870], "getAvailabilityDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSideBarItemManager setDiscoverContentAvailabilityDictionary:](self, "setDiscoverContentAvailabilityDictionary:", v13);

  v14 = objc_alloc(MEMORY[0x1E0D31060]);
  v15 = objc_alloc_init(MEMORY[0x1E0D315E8]);
  v16 = (void *)objc_msgSend(v14, "initWithHome:room:overrideValueSource:", v6, 0, v15);
  -[HUSideBarItemManager setCategoryItemProvider:](self, "setCategoryItemProvider:", v16);

  -[HUSideBarItemManager categoryItemProvider](self, "categoryItemProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v17);

  return v12;
}

uint64_t __51__HUSideBarItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hf_shouldBlockCurrentUserFromHome") ^ 1;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("home"));
  -[HUSideBarItemManager homeItem](self, "homeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSideBarItemManager automationItem](self, "automationItem", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v8;
  -[HUSideBarItemManager discoverItem](self, "discoverItem");
  v9 = objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v10);

  objc_msgSend(v5, "addObject:", v6);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("category"));
  -[HUSideBarItemManager sortedCategoryItems](self, "sortedCategoryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItems:", v12);

  _HULocalizedStringWithDefaultValue(CFSTR("HUSideBarCategorySectionTitle"), CFSTR("HUSideBarCategorySectionTitle"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHeaderTitle:", v13);

  -[HFItemManager home](self, "home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v14, "hf_currentUserIsRestrictedGuest");

  if ((v9 & 1) == 0)
    objc_msgSend(v5, "addObject:", v11);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("room"));
  -[HUSideBarItemManager sortedRoomItems](self, "sortedRoomItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setItems:", v16);

  _HULocalizedStringWithDefaultValue(CFSTR("HURoomSectionTitle"), CFSTR("HURoomSectionTitle"), 1);
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setHeaderTitle:", v17);

  -[HFItemManager home](self, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = objc_msgSend(v18, "hf_shouldBlockCurrentRestrictedGuestFromHome");

  if ((v17 & 1) == 0)
    objc_msgSend(v5, "addObject:", v15);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)allItems
{
  void *v2;
  void *v3;
  void *v4;

  -[HFItemManager itemProviders](self, "itemProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_91);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __32__HUSideBarItemManager_allItems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sortedRoomItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUSideBarItemManager roomItemProvider](self, "roomItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_dashboardSectionReorderableItemComparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "sortedArrayUsingComparator:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)sortedCategoryItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HUSideBarItemManager categoryItemProvider](self, "categoryItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_accessoryCategoriesReorderableItemComparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v5, "sortedArrayUsingComparator:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D314B0], "defaultItemComparator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingComparator:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (HUSideBarStaticItem)homeItem
{
  return self->_homeItem;
}

- (void)setHomeItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeItem, a3);
}

- (HUSideBarStaticItem)automationItem
{
  return self->_automationItem;
}

- (void)setAutomationItem:(id)a3
{
  objc_storeStrong((id *)&self->_automationItem, a3);
}

- (HUSideBarStaticItem)discoverItem
{
  return self->_discoverItem;
}

- (void)setDiscoverItem:(id)a3
{
  objc_storeStrong((id *)&self->_discoverItem, a3);
}

- (HFReorderableHomeKitItemList)reorderableRoomList
{
  return self->_reorderableRoomList;
}

- (void)setReorderableRoomList:(id)a3
{
  objc_storeStrong((id *)&self->_reorderableRoomList, a3);
}

- (HFStaticItemProvider)staticItemProvider
{
  return self->_staticItemProvider;
}

- (void)setStaticItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_staticItemProvider, a3);
}

- (HFRoomItemProvider)roomItemProvider
{
  return self->_roomItemProvider;
}

- (void)setRoomItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_roomItemProvider, a3);
}

- (HFAccessoryCategoryStatusItemProvider)categoryItemProvider
{
  return self->_categoryItemProvider;
}

- (void)setCategoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_categoryItemProvider, a3);
}

- (NSDictionary)discoverContentAvailabilityDictionary
{
  return self->_discoverContentAvailabilityDictionary;
}

- (void)setDiscoverContentAvailabilityDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_discoverContentAvailabilityDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoverContentAvailabilityDictionary, 0);
  objc_storeStrong((id *)&self->_categoryItemProvider, 0);
  objc_storeStrong((id *)&self->_roomItemProvider, 0);
  objc_storeStrong((id *)&self->_staticItemProvider, 0);
  objc_storeStrong((id *)&self->_reorderableRoomList, 0);
  objc_storeStrong((id *)&self->_discoverItem, 0);
  objc_storeStrong((id *)&self->_automationItem, 0);
  objc_storeStrong((id *)&self->_homeItem, 0);
}

@end
