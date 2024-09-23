@implementation HUDashboardAccessoryTransformItemProvider

- (NSMutableSet)allItems
{
  return self->_allItems;
}

id __56__HUDashboardAccessoryTransformItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "transformSourceResults:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D314A0]), "initWithAddedItems:removedItems:existingItems:", 0, 0, 0);
  }
  v7 = (void *)v6;
  objc_msgSend(v5, "allItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSet:", v9);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  -[HUDashboardAccessoryTransformItemProvider sourceItemProvider](self, "sourceItemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HUDashboardAccessoryTransformItemProvider_reloadItems__block_invoke;
  v7[3] = &unk_1E6F4D2C8;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "flatMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
  return v5;
}

- (id)transformSourceResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**v7)(void *, void *, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD aBlock[5];
  id v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HUDashboardAccessoryTransformItemProvider needsTransform](self, "needsTransform"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__HUDashboardAccessoryTransformItemProvider_transformSourceResults___block_invoke;
    aBlock[3] = &unk_1E6F57668;
    aBlock[4] = self;
    v6 = v5;
    v39 = v6;
    v7 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v4, "addedItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (-[HUDashboardAccessoryTransformItemProvider wantsRoomTransformForItem:](self, "wantsRoomTransformForItem:", v13))
          {
            -[HUDashboardAccessoryTransformItemProvider roomTransformedItemsForItem:](self, "roomTransformedItemsForItem:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v14, v13);

          }
          else
          {
            objc_msgSend(v6, "addObject:", v13);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v10);
    }

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v4, "existingItems", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v31;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v31 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
          if (-[HUDashboardAccessoryTransformItemProvider wantsRoomTransformForItem:](self, "wantsRoomTransformForItem:", v20))
          {
            -[HUDashboardAccessoryTransformItemProvider roomTransformedItemsForItem:](self, "roomTransformedItemsForItem:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v7[2](v7, v21, v20);

          }
          else
          {
            objc_msgSend(v6, "addObject:", v20);
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v17);
    }

    -[HUDashboardAccessoryTransformItemProvider allItems](self, "allItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_setByRemovingObjectsFromSet:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUDashboardAccessoryTransformItemProvider allItems](self, "allItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_setByIntersectingWithSet:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUDashboardAccessoryTransformItemProvider allItems](self, "allItems");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "na_setByRemovingObjectsFromSet:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D314A0]), "initWithAddedItems:removedItems:existingItems:", v23, v27, v25);
  }
  else
  {
    v28 = v4;
  }

  return v28;
}

- (BOOL)wantsRoomTransformForItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  if (-[HUDashboardAccessoryTransformItemProvider splitAccessoryGroupsByRoom](self, "splitAccessoryGroupsByRoom"))
  {
    objc_msgSend(v4, "accessoryRepresentableObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hf_canSpanMultipleRooms");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)invalidationReasons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)HUDashboardAccessoryTransformItemProvider;
  -[HFItemProvider invalidationReasons](&v11, sel_invalidationReasons);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HUDashboardAccessoryTransformItemProvider sourceItemProvider](self, "sourceItemProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidationReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v6);

  if (-[HUDashboardAccessoryTransformItemProvider splitAccessoryGroupsByRoom](self, "splitAccessoryGroupsByRoom"))
  {
    v7 = *MEMORY[0x1E0D308D8];
    v12[0] = *MEMORY[0x1E0D308C8];
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v8);

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (BOOL)splitAccessoryGroupsByRoom
{
  return self->_splitAccessoryGroupsByRoom;
}

- (HFItemProvider)sourceItemProvider
{
  return self->_sourceItemProvider;
}

- (HUDashboardAccessoryTransformItemProvider)initWithSourceProvider:(id)a3 inHome:(id)a4
{
  id v7;
  id v8;
  HUDashboardAccessoryTransformItemProvider *v9;
  HUDashboardAccessoryTransformItemProvider *v10;
  uint64_t v11;
  NSMutableSet *allItems;
  uint64_t v13;
  NSMapTable *roomTransformedItems;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HUDashboardAccessoryTransformItemProvider;
  v9 = -[HFItemProvider init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceItemProvider, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = objc_claimAutoreleasedReturnValue();
    allItems = v10->_allItems;
    v10->_allItems = (NSMutableSet *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    roomTransformedItems = v10->_roomTransformedItems;
    v10->_roomTransformedItems = (NSMapTable *)v13;

    objc_storeWeak((id *)&v10->_home, v8);
    v10->_splitAccessoryGroupsByRoom = 1;
  }

  return v10;
}

- (void)setSplitAccessoryGroupsByRoom:(BOOL)a3
{
  self->_splitAccessoryGroupsByRoom = a3;
}

void __68__HUDashboardAccessoryTransformItemProvider_transformSourceResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "roomTransformedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v6);

  v10 = *(void **)(a1 + 40);
  objc_msgSend(v7, "allItems");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "unionSet:", v11);
}

- (id)roomTransformedItemsForItem:(id)a3
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

  v4 = a3;
  -[HUDashboardAccessoryTransformItemProvider roomTransformedItems](self, "roomTransformedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUDashboardAccessoryTransformItemProvider _roomTransformedItemsForItem:](self, "_roomTransformedItemsForItem:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D317F0], "diffFromSet:toSet:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "additions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deletions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toSet");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_setByIntersectingWithSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D314A0]), "initWithAddedItems:removedItems:existingItems:", v9, v10, v12);
  return v13;
}

- (id)_roomTransformedItemsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  HUSplitRoomTransformedItem *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "accessoryRepresentableObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HUDashboardAccessoryTransformItemProvider home](self, "home", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_allRooms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v5, "hf_isInRoom:", v13))
        {
          v14 = -[HUSplitRoomTransformedItem initWithSourceItem:room:]([HUSplitRoomTransformedItem alloc], "initWithSourceItem:room:", v4, v13);
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

- (id)allTransformedItemsForItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HUDashboardAccessoryTransformItemProvider roomTransformedItems](self, "roomTransformedItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)clearTransformedItemsForItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUDashboardAccessoryTransformItemProvider roomTransformedItems](self, "roomTransformedItems");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (HMHome)home
{
  return (HMHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setAllItems:(id)a3
{
  objc_storeStrong((id *)&self->_allItems, a3);
}

- (NSMapTable)roomTransformedItems
{
  return self->_roomTransformedItems;
}

- (void)setRoomTransformedItems:(id)a3
{
  objc_storeStrong((id *)&self->_roomTransformedItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomTransformedItems, 0);
  objc_storeStrong((id *)&self->_allItems, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_sourceItemProvider, 0);
}

@end
