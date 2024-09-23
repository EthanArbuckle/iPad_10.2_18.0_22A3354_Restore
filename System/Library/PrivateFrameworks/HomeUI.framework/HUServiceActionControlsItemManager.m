@implementation HUServiceActionControlsItemManager

- (HUServiceActionControlsItemManager)initWithServiceActionItem:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  HUServiceActionControlsItemManager *v12;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "containingItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  v14.receiver = self;
  v14.super_class = (Class)HUServiceActionControlsItemManager;
  v12 = -[HFItemManager initWithDelegate:sourceItem:](&v14, sel_initWithDelegate_sourceItem_, v9, v11);

  if (v12)
  {
    -[HUServiceActionControlsItemManager setServiceActionItem:](v12, "setServiceActionItem:", v8);
    v12->_mode = a4;
  }

  return v12;
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
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;
  id location;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D31338]);
  -[HUServiceActionControlsItemManager serviceActionItem](self, "serviceActionItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceActionControlsItemManager serviceActionItem](self, "serviceActionItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithItem:valueSource:", v6, v8);
  -[HUServiceActionControlsItemManager setControlPanelItemProvider:](self, "setControlPanelItemProvider:", v9);

  v14 = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v15, &location);
  -[HUServiceActionControlsItemManager controlPanelItemProvider](self, "controlPanelItemProvider", v14, 3221225472, __65__HUServiceActionControlsItemManager__buildItemProvidersForHome___block_invoke, &unk_1E6F568A8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilter:", &v14);

  -[HUServiceActionControlsItemManager controlPanelItemProvider](self, "controlPanelItemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
}

uint64_t __65__HUServiceActionControlsItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serviceActionItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "services");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") > 1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "_actionControlsDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "itemManager:shouldShowControlPanelItem:", WeakRetained, v3);

  }
  return v8;
}

- (id)_itemsToHideInSet:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUServiceActionControlsItemManager;
  -[HFItemManager _itemsToHideInSet:](&v6, sel__itemsToHideInSet_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (unint64_t)_numberOfSections
{
  void *v2;
  unint64_t v3;

  -[HUServiceActionControlsItemManager _sectionIdentifiers](self, "_sectionIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_identifierForSection:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HUServiceActionControlsItemManager _sectionIdentifiers](self, "_sectionIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") <= a3)
    NSLog(CFSTR("Received identifier request for section (%ld), but only have (%ld) sections"), a3, objc_msgSend(v4, "count"));
  if (objc_msgSend(v4, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_titleForSectionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("HUServiceActionControlsRemoveFromTriggerSectionIdentifier")) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[HUServiceActionControlsItemManager controlPanelItemProvider](self, "controlPanelItemProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__HUServiceActionControlsItemManager__titleForSectionWithIdentifier___block_invoke;
    v13[3] = &unk_1E6F4DAD8;
    v14 = v4;
    objc_msgSend(v7, "na_firstObjectPassingTest:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUServiceActionControlsItemManager _actionControlsDelegate](self, "_actionControlsDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "itemManager:shouldShowSectionTitleForControlPanelItem:", self, v8);

    if (v10)
    {
      objc_msgSend(v8, "latestResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D30D18]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

uint64_t __69__HUServiceActionControlsItemManager__titleForSectionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_sectionIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUServiceActionControlsItemManager controlPanelItemProvider](self, "controlPanelItemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUServiceActionControlsItemManager controlPanelItemProvider](self, "controlPanelItemProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controlPanelItemComparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingComparator:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "latestResults", (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[HUServiceActionControlsItemManager _sectionIdentifierForControlPanelItem:](self, "_sectionIdentifierForControlPanelItem:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v17);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  objc_msgSend(v3, "addObject:", CFSTR("HUServiceActionControlsRemoveFromTriggerSectionIdentifier"));
  return v3;
}

- (id)_sectionIdentifierForControlPanelItem:(id)a3
{
  return (id)objc_msgSend(a3, "uniqueIdentifier");
}

- (HFServiceActionItem)serviceActionItem
{
  return self->_serviceActionItem;
}

- (void)setServiceActionItem:(id)a3
{
  objc_storeStrong((id *)&self->_serviceActionItem, a3);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (HFControlPanelItemProvider)controlPanelItemProvider
{
  return self->_controlPanelItemProvider;
}

- (void)setControlPanelItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_controlPanelItemProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlPanelItemProvider, 0);
  objc_storeStrong((id *)&self->_serviceActionItem, 0);
}

@end
