@implementation CSListItemManager

+ (CSListItemManager)itemManagerWithItemContainer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  CSListItemProvidingGetAllProviders();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "_initWithItemContainer:itemProviders:", v3, v5);

  return (CSListItemManager *)v6;
}

+ (CSListItemManager)itemManagerWithItemContainer:(id)a3 itemProviders:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithItemContainer:itemProviders:", v6, v5);

  return (CSListItemManager *)v7;
}

- (id)_initWithItemContainer:(id)a3 itemProviders:(id)a4
{
  id v6;
  id v7;
  CSListItemManager *v8;
  CSListItemManager *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *identifiersToItems;
  NSDictionary *v12;
  NSDictionary *identifiersToProviders;
  NSDictionary *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSDictionary *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CSListItemManager;
  v8 = -[CSListItemManager init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_itemContainer, v6);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identifiersToItems = v9->_identifiersToItems;
    v9->_identifiersToItems = v10;

    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identifiersToProviders = v9->_identifiersToProviders;
    v9->_identifiersToProviders = v12;

    v14 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v7;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v20, "setItemManager:", v9);
          objc_msgSend(v20, "section");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v14, "setObject:forKey:", v20, v22);

          objc_msgSend(v20, "section");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "itemManager:insertSection:", v9, v23);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v17);
    }

    v24 = v9->_identifiersToProviders;
    v9->_identifiersToProviders = v14;

    v7 = v26;
  }

  return v9;
}

- (BOOL)isPresentingSupplementaryContent
{
  return -[CSListItemManager itemCount](self, "itemCount") != 0;
}

- (unint64_t)itemCount
{
  return -[NSMutableDictionary count](self->_identifiersToItems, "count");
}

- (NSArray)allItems
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_identifiersToItems, "allValues");
}

- (void)setListHasNotificationContent:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_listHasNotificationContent != a3)
  {
    self->_listHasNotificationContent = a3;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSDictionary allValues](self->_identifiersToProviders, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v10 = -[CSListItemManager itemCount](self, "itemCount");
            v11 = objc_msgSend(v9, "itemCount");
            v13 = self->_listHasNotificationContent || v10 != v11;
            objc_msgSend(v9, "setListHasAdditionalContent:", v13);
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v6);
    }

  }
}

- (id)itemsGroupSortComparatorForListSectionIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__CSListItemManager_itemsGroupSortComparatorForListSectionIdentifier___block_invoke;
  v8[3] = &unk_1E8E30718;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17E1614](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

uint64_t __70__CSListItemManager_itemsGroupSortComparatorForListSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "identifiersToProviders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "itemsGroupSortComparator");
      v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v5, v6);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)itemsViewControllerSortComparatorForListSectionIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__CSListItemManager_itemsViewControllerSortComparatorForListSectionIdentifier___block_invoke;
  v8[3] = &unk_1E8E30740;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17E1614](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v6;
}

uint64_t __79__CSListItemManager_itemsViewControllerSortComparatorForListSectionIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "identifiersToProviders");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "itemsViewControllerSortComparator");
      v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, id, id))v11)[2](v11, v5, v6);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)willPresentPosterSwitcher
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[CSListItemManager isPresentingSupplementaryContent](self, "isPresentingSupplementaryContent"))
  {
    -[CSListItemManager identifiersToProviders](self, "identifiersToProviders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "willPresentPosterSwitcher", (_QWORD)v11);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (CSListItem)nowPlayingItem
{
  return self->_nowPlayingItem;
}

- (void)setNowPlayingItem:(id)a3
{
  id WeakRetained;
  CSListItem *v6;

  v6 = (CSListItem *)a3;
  if (self->_nowPlayingItem != v6)
  {
    objc_storeStrong((id *)&self->_nowPlayingItem, a3);
    WeakRetained = objc_loadWeakRetained((id *)&self->_itemContainer);
    objc_msgSend(WeakRetained, "itemManager:setNowPlayingItem:", self, v6);

  }
}

- (void)addItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_identifiersToItems, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[NSMutableDictionary setObject:forKey:](self->_identifiersToItems, "setObject:forKey:", v7, v4);
    -[CSListItemManager itemContainer](self, "itemContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemManager:insertItem:", self, v7);

  }
}

- (void)updateItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_identifiersToItems, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CSListItemManager itemContainer](self, "itemContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemManager:updateItem:", self, v7);

  }
}

- (void)removeItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_identifiersToItems, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_identifiersToItems, "removeObjectForKey:", v4);
    -[CSListItemManager itemContainer](self, "itemContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemManager:removeItem:", self, v7);

  }
}

- (void)item:(id)a3 requestsModalPresentationOfViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  CSListItemContaining **p_itemContainer;
  id v11;
  id v12;
  id v13;
  id WeakRetained;

  v6 = a5;
  p_itemContainer = &self->_itemContainer;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  objc_msgSend(WeakRetained, "itemManager:requestsModalPresentationOfViewController:forItem:animated:completion:", self, v12, v13, v6, v11);

}

- (void)item:(id)a3 requestsAuthenticationAndPerformBlock:(id)a4
{
  CSListItemContaining **p_itemContainer;
  id v6;
  id WeakRetained;

  p_itemContainer = &self->_itemContainer;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  objc_msgSend(WeakRetained, "itemManager:requestsAuthenticationAndPerformBlock:", self, v6);

}

- (void)handleRemovedItemsWithContentHosts:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSMutableDictionary allValues](self->_identifiersToItems, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "contentHost");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "containsObject:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[CSListItemManager identifiersToProviders](self, "identifiersToProviders", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "handleRemovedItems:", v5);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

}

- (void)cancelTouchesForItem:(id)a3
{
  CSListItemContaining **p_itemContainer;
  id v5;
  id WeakRetained;

  p_itemContainer = &self->_itemContainer;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  objc_msgSend(WeakRetained, "itemManager:cancelTouchesForInteractionWithItem:", self, v5);

}

- (void)restrictsTouches:(BOOL)a3 onHostedSceneOfContentHost:(id)a4
{
  if (a4)
    -[CSListItemManager _restrictsTouches:forSpecificContentHost:](self, "_restrictsTouches:forSpecificContentHost:", a3);
}

- (void)restrictsTouchesOnAllHostedScenes:(BOOL)a3
{
  -[CSListItemManager _restrictsTouches:forSpecificContentHost:](self, "_restrictsTouches:forSpecificContentHost:", a3, 0);
}

- (void)significantUserInteractionBeganForItem:(id)a3
{
  CSListItemContaining **p_itemContainer;
  id v5;
  id WeakRetained;

  p_itemContainer = &self->_itemContainer;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  objc_msgSend(WeakRetained, "itemManager:significantUserInteractionBeganWithItem:", self, v5);

}

- (void)significantUserInteractionEndedForItem:(id)a3
{
  CSListItemContaining **p_itemContainer;
  id v5;
  id WeakRetained;

  p_itemContainer = &self->_itemContainer;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_itemContainer);
  objc_msgSend(WeakRetained, "itemManager:significantUserInteractionEndedWithItem:", self, v5);

}

- (void)didAddNewSceneHostEnvironment
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_itemContainer);
  objc_msgSend(WeakRetained, "itemManagerDidAddNewSceneHostEnvironment");

}

- (void)supplementaryViewsContainer:(id)a3 requestsCancelTouches:(BOOL)a4 onSupplementaryViewController:(id)a5
{
  _BOOL8 v5;
  NSDictionary *identifiersToProviders;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v11 = a5;
  identifiersToProviders = self->_identifiersToProviders;
  objc_msgSend(a3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](identifiersToProviders, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "restrictsTouches:onHostedSceneInViewController:", v5, v11);

}

- (void)supplementaryViewsContainer:(id)a3 requestsCancelTouchesOnAllSupplementaryViewControllers:(BOOL)a4
{
  _BOOL8 v4;
  NSDictionary *identifiersToProviders;
  void *v6;
  id v7;

  v4 = a4;
  identifiersToProviders = self->_identifiersToProviders;
  objc_msgSend(a3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](identifiersToProviders, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "restrictsTouchesOnAllHostedScenes:", v4);

}

- (void)_restrictsTouches:(BOOL)a3 forSpecificContentHost:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allValues](self->_identifiersToItems, "allValues", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      if (!v6
        || (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "contentHost"),
            v13 = (id)objc_claimAutoreleasedReturnValue(),
            v13,
            v13 == v6))
      {
        objc_msgSend(v12, "contentHost");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v12, "contentHost");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "restrictsTouchesOnHostedScene:", v4);

        }
        if (v6)
          break;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (CSListItemContaining)itemContainer
{
  return (CSListItemContaining *)objc_loadWeakRetained((id *)&self->_itemContainer);
}

- (void)setItemContainer:(id)a3
{
  objc_storeWeak((id *)&self->_itemContainer, a3);
}

- (BOOL)listHasNotificationContent
{
  return self->_listHasNotificationContent;
}

- (NSMutableDictionary)identifiersToItems
{
  return self->_identifiersToItems;
}

- (void)setIdentifiersToItems:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersToItems, a3);
}

- (NSDictionary)identifiersToProviders
{
  return self->_identifiersToProviders;
}

- (void)setIdentifiersToProviders:(id)a3
{
  objc_storeStrong((id *)&self->_identifiersToProviders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiersToProviders, 0);
  objc_storeStrong((id *)&self->_identifiersToItems, 0);
  objc_destroyWeak((id *)&self->_itemContainer);
  objc_storeStrong((id *)&self->_nowPlayingItem, 0);
}

@end
