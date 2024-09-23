@implementation HUGridActionSetItemManager

- (HUGridActionSetItemManager)initWithDelegate:(id)a3
{
  HUGridActionSetItemManager *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUGridActionSetItemManager;
  result = -[HFItemManager initWithDelegate:](&v4, sel_initWithDelegate_, a3);
  if (result)
    result->_actionSetStyle = 1;
  return result;
}

- (HUGridActionSetItemManager)initWithDelegate:(id)a3 actionSetStyle:(unint64_t)a4 room:(id)a5
{
  id v9;
  HUGridActionSetItemManager *v10;
  HUGridActionSetItemManager *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HUGridActionSetItemManager;
  v10 = -[HFItemManager initWithDelegate:](&v13, sel_initWithDelegate_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_room, a5);
    v11->_actionSetStyle = a4;
  }

  return v11;
}

- (id)actionSetItemAssociatedWithActionSet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HFItemManager allItems](self, "allItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "actionSet");
          v12 = (id)objc_claimAutoreleasedReturnValue();

          if (v12 == v4)
            goto LABEL_12;

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (void)setRoom:(id)a3
{
  HMRoom *v5;
  HMRoom *v6;

  v5 = (HMRoom *)a3;
  if (self->_room != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_room, a3);
    -[HUGridActionSetItemManager _updateFilters](self, "_updateFilters");
    v5 = v6;
  }

}

- (void)setOnlyShowsFavorites:(BOOL)a3
{
  if (self->_onlyShowsFavorites != a3)
  {
    self->_onlyShowsFavorites = a3;
    -[HUGridActionSetItemManager _updateFilters](self, "_updateFilters");
  }
}

- (HFReorderableHomeKitItemList)reorderableActionSetList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HUGridActionSetItemManager clientReorderableActionSetList](self, "clientReorderableActionSetList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUGridActionSetItemManager clientReorderableActionSetList](self, "clientReorderableActionSetList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFItemManager sourceItem](self, "sourceItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "latestResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CA8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (HFReorderableHomeKitItemList *)v4;
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
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUGridActionSetItemManager room](self, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D31708]);
    -[HUGridActionSetItemManager room](self, "room");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithHome:room:", v4, v7);
    -[HFItemManager setSourceItem:](self, "setSourceItem:", v8);

LABEL_5:
    goto LABEL_6;
  }
  if (v4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31418]), "initWithHome:", v4);
    -[HFItemManager setSourceItem:](self, "setSourceItem:", v7);
    goto LABEL_5;
  }
LABEL_6:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31150]), "initWithHome:actionSetItemStyle:", v4, -[HUGridActionSetItemManager actionSetStyle](self, "actionSetStyle"));
  -[HUGridActionSetItemManager setActionSetItemProvider:](self, "setActionSetItemProvider:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31840]), "initWithResultsBlock:", &__block_literal_global_85);
  -[HUGridActionSetItemManager setActionSetPlaceholderItem:](self, "setActionSetPlaceholderItem:", v10);

  v11 = objc_alloc(MEMORY[0x1E0D31848]);
  v12 = (void *)MEMORY[0x1E0C99E60];
  -[HUGridActionSetItemManager actionSetPlaceholderItem](self, "actionSetPlaceholderItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithObject:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v11, "initWithItems:", v14);
  -[HUGridActionSetItemManager setActionSetPlaceholderItemProvider:](self, "setActionSetPlaceholderItemProvider:", v15);

  -[HUGridActionSetItemManager _updateFilters](self, "_updateFilters");
  -[HUGridActionSetItemManager actionSetItemProvider](self, "actionSetItemProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  -[HUGridActionSetItemManager actionSetPlaceholderItemProvider](self, "actionSetPlaceholderItemProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

id __57__HUGridActionSetItemManager__buildItemProvidersForHome___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D30D90]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUPlaceholderActionSetTitle"), CFSTR("HUPlaceholderActionSetTitle"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0D30D18]);

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31460]), "initWithSystemImageNamed:", CFSTR("plus.circle.fill"));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0D30C60]);

  v3 = (void *)MEMORY[0x1E0D519C0];
  v4 = (void *)objc_msgSend(v0, "copy");
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
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

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("HUGridActionSetSectionIdentifier"));
  objc_msgSend(v4, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridActionSetItemManager _comparatorForSectionIdentifier:](self, "_comparatorForSectionIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v10);

  _HULocalizedStringWithDefaultValue(CFSTR("HUGridScenesSectionTitle"), CFSTR("HUGridScenesSectionTitle"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeaderTitle:", v11);

  objc_msgSend(v5, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0D314B0], "filterSections:toDisplayedItems:", v5, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_comparatorForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[HUGridActionSetItemManager reorderableActionSetList](self, "reorderableActionSetList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedHomeKitItemComparator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = _Block_copy(v6);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HUGridActionSetItemManager;
    -[HFItemManager _comparatorForSectionIdentifier:](&v11, sel__comparatorForSectionIdentifier_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _Block_copy(v9);

  }
  return v8;
}

- (void)_didFinishUpdateTransactionWithAffectedItems:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUGridActionSetItemManager;
  v4 = a3;
  -[HFItemManager _didFinishUpdateTransactionWithAffectedItems:](&v7, sel__didFinishUpdateTransactionWithAffectedItems_, v4);
  -[HFItemManager sourceItem](self, "sourceItem", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
    -[HUGridActionSetItemManager setReorderableActionSetList:](self, "setReorderableActionSetList:", 0);
}

- (BOOL)_requiresNotificationsForCharacteristic:(id)a3
{
  return 1;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUGridActionSetItemManager;
  -[HFItemManager _itemsToHideInSet:](&v11, sel__itemsToHideInSet_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (-[HUGridActionSetItemManager hideActionSetPlaceholderItem](self, "hideActionSetPlaceholderItem")
    || (-[HUGridActionSetItemManager actionSetItemProvider](self, "actionSetItemProvider"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "items"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "hmf_isEmpty"),
        v7,
        v6,
        (v8 & 1) == 0))
  {
    -[HUGridActionSetItemManager actionSetPlaceholderItem](self, "actionSetPlaceholderItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeAddObject:", v9);

  }
  return v5;
}

- (BOOL)shouldPerformInitialLoadOnMainThread
{
  return 1;
}

- (void)_updateFilters
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;

  -[HUGridActionSetItemManager room](self, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridActionSetItemManager actionSetItemProvider](self, "actionSetItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRoom:", v3);

  v5 = -[HUGridActionSetItemManager onlyShowsFavorites](self, "onlyShowsFavorites");
  -[HUGridActionSetItemManager actionSetItemProvider](self, "actionSetItemProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOnlyShowsFavorites:", v5);

}

- (BOOL)isItemReorderableAtIndex:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;

  -[HFItemManager displayedItemAtIndexPath:](self, "displayedItemAtIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridActionSetItemManager actionSetPlaceholderItem](self, "actionSetPlaceholderItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if ((v6 & 1) != 0)
    return 0;
  -[HUGridActionSetItemManager reorderableActionSetList](self, "reorderableActionSetList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8 != 0;

  return v7;
}

- (HMRoom)room
{
  return self->_room;
}

- (BOOL)onlyShowsFavorites
{
  return self->_onlyShowsFavorites;
}

- (BOOL)hideActionSetPlaceholderItem
{
  return self->_hideActionSetPlaceholderItem;
}

- (void)setHideActionSetPlaceholderItem:(BOOL)a3
{
  self->_hideActionSetPlaceholderItem = a3;
}

- (unint64_t)actionSetStyle
{
  return self->_actionSetStyle;
}

- (HFStaticItem)actionSetPlaceholderItem
{
  return self->_actionSetPlaceholderItem;
}

- (void)setActionSetPlaceholderItem:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetPlaceholderItem, a3);
}

- (HFActionSetItemProvider)actionSetItemProvider
{
  return self->_actionSetItemProvider;
}

- (void)setActionSetItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetItemProvider, a3);
}

- (HFStaticItemProvider)actionSetPlaceholderItemProvider
{
  return self->_actionSetPlaceholderItemProvider;
}

- (void)setActionSetPlaceholderItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetPlaceholderItemProvider, a3);
}

- (HFReorderableHomeKitItemList)clientReorderableActionSetList
{
  return self->_clientReorderableActionSetList;
}

- (void)setClientReorderableActionSetList:(id)a3
{
  objc_storeStrong((id *)&self->_clientReorderableActionSetList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientReorderableActionSetList, 0);
  objc_storeStrong((id *)&self->_actionSetPlaceholderItemProvider, 0);
  objc_storeStrong((id *)&self->_actionSetItemProvider, 0);
  objc_storeStrong((id *)&self->_actionSetPlaceholderItem, 0);
  objc_storeStrong((id *)&self->_room, 0);
}

@end
