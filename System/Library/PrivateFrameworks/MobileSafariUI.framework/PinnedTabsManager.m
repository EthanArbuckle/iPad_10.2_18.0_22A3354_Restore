@implementation PinnedTabsManager

- (void)_updateCache
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSMutableDictionary *pinnedTabsByUUID;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSMutableDictionary *privatePinnedTabsByUUID;
  void *v18;
  NSMutableDictionary *pinnedTabsByProfileIdentifier;
  _QWORD v20[5];
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
  -[NSMutableDictionary removeAllObjects](self->_pinnedTabsByUUID, "removeAllObjects");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_pinnedTabs;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        pinnedTabsByUUID = self->_pinnedTabsByUUID;
        objc_msgSend(v8, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](pinnedTabsByUUID, "setObject:forKeyedSubscript:", v8, v10);

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_privatePinnedTabsByUUID, "removeAllObjects");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = self->_privatePinnedTabs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
        privatePinnedTabsByUUID = self->_privatePinnedTabsByUUID;
        objc_msgSend(v16, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](privatePinnedTabsByUUID, "setObject:forKeyedSubscript:", v16, v18);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v13);
  }

  -[NSMutableDictionary removeAllObjects](self->_pinnedTabsByUUIDAndProfileIdentifier, "removeAllObjects");
  pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __33__PinnedTabsManager__updateCache__block_invoke;
  v20[3] = &unk_1E9CF5EB0;
  v20[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pinnedTabsByProfileIdentifier, "enumerateKeysAndObjectsUsingBlock:", v20);
}

- (PinnedTabsManager)initWithBrowserState:(id)a3 tabCollection:(id)a4
{
  id v6;
  id v7;
  PinnedTabsManager *v8;
  uint64_t v9;
  NSHashTable *observers;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  NSMutableArray *pinnedTabs;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *privatePinnedTabs;
  uint64_t v23;
  NSMutableDictionary *pinnedTabsByUUID;
  uint64_t v25;
  NSMutableDictionary *privatePinnedTabsByUUID;
  uint64_t v27;
  NSCountedSet *activeProfileIdentifiers;
  uint64_t v29;
  NSMutableSet *pendingUpdatedProfileIdentifiers;
  uint64_t v31;
  NSMutableDictionary *pinnedTabsByProfileIdentifier;
  uint64_t v33;
  NSMutableDictionary *pinnedTabsByUUIDAndProfileIdentifier;
  PinnedTabsManager *v35;
  objc_super v37;

  v6 = a3;
  v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)PinnedTabsManager;
  v8 = -[PinnedTabsManager init](&v37, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    observers = v8->_observers;
    v8->_observers = (NSHashTable *)v9;

    objc_msgSend(v6, "pinnedTabs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_29);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    pinnedTabs = v8->_pinnedTabs;
    v8->_pinnedTabs = v15;

    objc_msgSend(v6, "privatePinnedTabs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    }
    privatePinnedTabs = v8->_privatePinnedTabs;
    v8->_privatePinnedTabs = v21;

    objc_storeStrong((id *)&v8->_tabCollection, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    pinnedTabsByUUID = v8->_pinnedTabsByUUID;
    v8->_pinnedTabsByUUID = (NSMutableDictionary *)v23;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v25 = objc_claimAutoreleasedReturnValue();
    privatePinnedTabsByUUID = v8->_privatePinnedTabsByUUID;
    v8->_privatePinnedTabsByUUID = (NSMutableDictionary *)v25;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v27 = objc_claimAutoreleasedReturnValue();
    activeProfileIdentifiers = v8->_activeProfileIdentifiers;
    v8->_activeProfileIdentifiers = (NSCountedSet *)v27;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = objc_claimAutoreleasedReturnValue();
    pendingUpdatedProfileIdentifiers = v8->_pendingUpdatedProfileIdentifiers;
    v8->_pendingUpdatedProfileIdentifiers = (NSMutableSet *)v29;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = objc_claimAutoreleasedReturnValue();
    pinnedTabsByProfileIdentifier = v8->_pinnedTabsByProfileIdentifier;
    v8->_pinnedTabsByProfileIdentifier = (NSMutableDictionary *)v31;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v33 = objc_claimAutoreleasedReturnValue();
    pinnedTabsByUUIDAndProfileIdentifier = v8->_pinnedTabsByUUIDAndProfileIdentifier;
    v8->_pinnedTabsByUUIDAndProfileIdentifier = (NSMutableDictionary *)v33;

    -[PinnedTabsManager _updateCache](v8, "_updateCache");
    v35 = v8;
  }

  return v8;
}

id __56__PinnedTabsManager_initWithBrowserState_tabCollection___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

id __56__PinnedTabsManager_initWithBrowserState_tabCollection___block_invoke_2(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

- (NSArray)pinnedTabs
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_pinnedTabs, 1);
}

- (NSArray)privatePinnedTabs
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_privatePinnedTabs, 1);
}

- (id)pinnedTabsInContainer:(id)a3
{
  void *v3;
  void *v4;

  -[PinnedTabsManager _tabsInContainer:](self, "_tabsInContainer:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v3, 1);
  else
    v4 = (void *)MEMORY[0x1E0C9AA60];

  return v4;
}

- (void)_cacheTab:(id)a3 inContainer:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[PinnedTabsManager _tabsByUUIDInContainer:](self, "_tabsByUUIDInContainer:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (int)_pinnedTabsFolderIDForContainer:(id)a3
{
  id v4;
  int v5;
  int v6;
  WBTabCollection *tabCollection;
  int v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "isPrivateBrowsingEnabled"))
  {
    v5 = -[WBTabCollection privatePinnedTabsFolderID](self->_tabCollection, "privatePinnedTabsFolderID");
  }
  else
  {
    v6 = objc_msgSend(v4, "isInDefaultProfile");
    tabCollection = self->_tabCollection;
    if (!v6)
    {
      objc_msgSend(v4, "activeProfileIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[WBTabCollection pinnedTabsFolderIDForProfileWithIdentifier:](tabCollection, "pinnedTabsFolderIDForProfileWithIdentifier:", v9);

      goto LABEL_7;
    }
    v5 = -[WBTabCollection pinnedTabsFolderID](tabCollection, "pinnedTabsFolderID");
  }
  v8 = v5;
LABEL_7:

  return v8;
}

- (id)_tabsInContainer:(id)a3
{
  id v4;
  NSMutableArray *privatePinnedTabs;
  NSMutableArray *v6;
  NSMutableDictionary *pinnedTabsByProfileIdentifier;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isPrivateBrowsingEnabled"))
  {
    privatePinnedTabs = self->_privatePinnedTabs;
  }
  else
  {
    if (!objc_msgSend(v4, "isInDefaultProfile"))
    {
      pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
      objc_msgSend(v4, "activeProfileIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](pinnedTabsByProfileIdentifier, "objectForKeyedSubscript:", v8);
      v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    privatePinnedTabs = self->_pinnedTabs;
  }
  v6 = privatePinnedTabs;
LABEL_7:

  return v6;
}

- (id)_tabsByUUIDInContainer:(id)a3
{
  id v4;
  NSMutableDictionary *privatePinnedTabsByUUID;
  NSMutableDictionary *v6;
  NSMutableDictionary *pinnedTabsByUUIDAndProfileIdentifier;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "isPrivateBrowsingEnabled"))
  {
    privatePinnedTabsByUUID = self->_privatePinnedTabsByUUID;
  }
  else
  {
    if (!objc_msgSend(v4, "isInDefaultProfile"))
    {
      pinnedTabsByUUIDAndProfileIdentifier = self->_pinnedTabsByUUIDAndProfileIdentifier;
      objc_msgSend(v4, "activeProfileIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](pinnedTabsByUUIDAndProfileIdentifier, "objectForKeyedSubscript:", v8);
      v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    privatePinnedTabsByUUID = self->_pinnedTabsByUUID;
  }
  v6 = privatePinnedTabsByUUID;
LABEL_7:

  return v6;
}

- (id)_tabWithUUID:(id)a3 inContainer:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PinnedTabsManager _tabsByUUIDInContainer:](self, "_tabsByUUIDInContainer:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __33__PinnedTabsManager__updateCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "uuid", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKeyedSubscript:", v7, v5);
}

- (id)containerForTabWithUUID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pinnedTabsByUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
LABEL_5:
    +[PinnedTabsContainer containerWithPrivateBrowsing:](PinnedTabsContainer, "containerWithPrivateBrowsing:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_privatePinnedTabsByUUID, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v6 = 1;
    goto LABEL_5;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allKeys](self->_pinnedTabsByUUIDAndProfileIdentifier, "allKeys", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pinnedTabsByUUIDAndProfileIdentifier, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          +[PinnedTabsContainer containerWithActiveProfileIdentifier:](PinnedTabsContainer, "containerWithActiveProfileIdentifier:", v15);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_6;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }

  v8 = 0;
LABEL_6:

  return v8;
}

- (id)tabWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pinnedTabsByUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    || (-[NSMutableDictionary objectForKeyedSubscript:](self->_privatePinnedTabsByUUID, "objectForKeyedSubscript:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)objc_msgSend(v5, "copy");
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](self->_pinnedTabsByUUIDAndProfileIdentifier, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = v10;
            v6 = (void *)objc_msgSend(v10, "copy");

            v5 = v11;
            goto LABEL_4;
          }
        }
        v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
LABEL_4:

  return v6;
}

- (void)updatePinnedTabWithUUID:(id)a3 inContainer:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[PinnedTabsManager _tabWithUUID:inContainer:](self, "_tabWithUUID:inContainer:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v10[2](v10, v11);
    -[WBTabCollection saveItem:completionHandler:](self->_tabCollection, "saveItem:completionHandler:", v11, 0);
    -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsInContainer:](self, "notifyObserversOfUpdatedPinnedTabsInContainer:", v9);
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXTabGroup();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_1D7CA3000, v12, OS_LOG_TYPE_INFO, "Not updating pinned tab with uuid %{public}@ because it does not exist.", (uint8_t *)&v13, 0xCu);
    }
  }

}

- (void)updatePinnedTabsInContainer:(id)a3 usingBlock:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  unsigned int v18;
  void *v19;
  void (**v20)(id, void *);
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  -[PinnedTabsManager _tabsByUUIDInContainer:](self, "_tabsByUUIDInContainer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PinnedTabsManager _tabsInContainer:](self, "_tabsInContainer:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToArray:", v10) & 1) == 0)
  {
    v20 = v7;
    objc_msgSend(v10, "removeAllObjects");
    v19 = v9;
    objc_msgSend(v10, "addObjectsFromArray:", v9);
    v18 = -[PinnedTabsManager _pinnedTabsFolderIDForContainer:](self, "_pinnedTabsFolderIDForContainer:", v6);
    v11 = objc_msgSend(v6, "isPrivateBrowsingEnabled");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v17, "setSyncable:", 0);
          objc_msgSend(v17, "didRemoveFromTabGroup");
          objc_msgSend(v17, "setInUnnamedTabGroup:", v11 ^ 1);
          objc_msgSend(v17, "setPrivateBrowsing:", v11);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v14);
    }

    v9 = v19;
    -[WBTabCollection updateItems:inParentWithID:completionHandler:](self->_tabCollection, "updateItems:inParentWithID:completionHandler:", v19, v18, 0);
    -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsInContainer:](self, "notifyObserversOfUpdatedPinnedTabsInContainer:", v6);
    -[PinnedTabsManager _updateCache](self, "_updateCache");
    v7 = v20;
  }

}

- (void)appendTab:(id)a3 inContainer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  WBTabCollection *tabCollection;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[PinnedTabsManager _tabsInContainer:](self, "_tabsInContainer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isPrivateBrowsingEnabled");
  objc_msgSend(v8, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v7);
  objc_msgSend(v7, "setSyncable:", 0);
  objc_msgSend(v7, "didRemoveFromTabGroup");
  objc_msgSend(v7, "setInUnnamedTabGroup:", v9 ^ 1);
  objc_msgSend(v7, "setPrivateBrowsing:", v9);
  v11 = -[PinnedTabsManager _pinnedTabsFolderIDForContainer:](self, "_pinnedTabsFolderIDForContainer:", v6);
  tabCollection = self->_tabCollection;
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabCollection insertItems:inParentWithID:afterItem:](tabCollection, "insertItems:inParentWithID:afterItem:", v13, v11, v10);

  -[PinnedTabsManager _cacheTab:inContainer:](self, "_cacheTab:inContainer:", v7, v6);
  -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsInContainer:](self, "notifyObserversOfUpdatedPinnedTabsInContainer:", v6);

}

- (void)moveTab:(id)a3 toTabGroup:(id)a4 afterTab:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PinnedTabsManager removeTabWithUUID:persist:](self, "removeTabWithUUID:persist:", v11, 0);

  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "insertTabs:afterTab:", v12, v8);
}

- (void)removeTabWithUUID:(id)a3 persist:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSMutableArray *pinnedTabs;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary *pinnedTabsByUUID;
  void *v13;
  WBTabCollection *tabCollection;
  void *v15;
  NSMutableArray *privatePinnedTabs;
  id v17;
  void *v18;
  void *v19;
  NSMutableDictionary *privatePinnedTabsByUUID;
  void *v21;
  WBTabCollection *v22;
  void *v23;
  NSMutableDictionary *pinnedTabsByProfileIdentifier;
  _QWORD v25[4];
  id v26;
  PinnedTabsManager *v27;
  BOOL v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  void *v33;
  _QWORD v34[2];

  v4 = a4;
  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pinnedTabs = self->_pinnedTabs;
  v8 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke;
  v31[3] = &unk_1E9CF5ED8;
  v9 = v6;
  v32 = v9;
  -[NSMutableArray safari_firstObjectPassingTest:](pinnedTabs, "safari_firstObjectPassingTest:", v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    pinnedTabsByUUID = self->_pinnedTabsByUUID;
    objc_msgSend(v10, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](pinnedTabsByUUID, "removeObjectForKey:", v13);

    -[NSMutableArray removeObject:](self->_pinnedTabs, "removeObject:", v11);
    if (v4)
    {
      tabCollection = self->_tabCollection;
      v34[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBTabCollection deleteItems:leaveTombstones:](tabCollection, "deleteItems:leaveTombstones:", v15, 0);

    }
    -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsIsPrivate:](self, "notifyObserversOfUpdatedPinnedTabsIsPrivate:", 0);
  }
  else
  {
    privatePinnedTabs = self->_privatePinnedTabs;
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_2;
    v29[3] = &unk_1E9CF5ED8;
    v17 = v9;
    v30 = v17;
    -[NSMutableArray safari_firstObjectPassingTest:](privatePinnedTabs, "safari_firstObjectPassingTest:", v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      privatePinnedTabsByUUID = self->_privatePinnedTabsByUUID;
      objc_msgSend(v18, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](privatePinnedTabsByUUID, "removeObjectForKey:", v21);

      -[NSMutableArray removeObject:](self->_privatePinnedTabs, "removeObject:", v19);
      if (v4)
      {
        v22 = self->_tabCollection;
        v33 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabCollection deleteItems:leaveTombstones:](v22, "deleteItems:leaveTombstones:", v23, 0);

      }
      -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsIsPrivate:](self, "notifyObserversOfUpdatedPinnedTabsIsPrivate:", 1);
    }
    pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
    v25[0] = v8;
    v25[1] = 3221225472;
    v25[2] = __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_3;
    v25[3] = &unk_1E9CF5F00;
    v26 = v17;
    v27 = self;
    v28 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pinnedTabsByProfileIdentifier, "enumerateKeysAndObjectsUsingBlock:", v25);

  }
}

uint64_t __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  return v3;
}

uint64_t __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  return v3;
}

void __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_4;
  v14[3] = &unk_1E9CF5ED8;
  v15 = *(id *)(a1 + 32);
  objc_msgSend(v8, "safari_firstObjectPassingTest:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

    objc_msgSend(v8, "removeObject:", v9);
    if (*(_BYTE *)(a1 + 48))
    {
      v12 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
      v16[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deleteItems:leaveTombstones:", v13, 0);

    }
    objc_msgSend(*(id *)(a1 + 40), "notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:", v7);
    *a4 = 1;
  }

}

uint64_t __47__PinnedTabsManager_removeTabWithUUID_persist___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = WBSIsEqual();

  return v3;
}

- (void)willSelectProfileWithIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[NSCountedSet containsObject:](self->_activeProfileIdentifiers, "containsObject:") & 1) == 0)
    -[PinnedTabsManager _loadPinnedTabsForProfileWithIdentifier:](self, "_loadPinnedTabsForProfileWithIdentifier:", v4);
  -[NSCountedSet addObject:](self->_activeProfileIdentifiers, "addObject:", v4);

}

- (void)didDeselectProfileWithIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[NSCountedSet removeObject:](self->_activeProfileIdentifiers, "removeObject:", v4);
  if ((-[NSCountedSet containsObject:](self->_activeProfileIdentifiers, "containsObject:", v4) & 1) == 0)
    -[PinnedTabsManager _clearPinnedTabsForProfileWithIdentifier:](self, "_clearPinnedTabsForProfileWithIdentifier:", v4);

}

- (void)_loadPinnedTabsForProfileWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WBTabCollection pinnedTabsForProfileWithIdentifier:](self->_tabCollection, "pinnedTabsForProfileWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v17, "uuid", (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pinnedTabsByProfileIdentifier, "setObject:forKeyedSubscript:", v12, v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pinnedTabsByUUIDAndProfileIdentifier, "setObject:forKeyedSubscript:", v11, v4);

}

id __61__PinnedTabsManager__loadPinnedTabsForProfileWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "mutableCopy");
}

- (void)_clearPinnedTabsForProfileWithIdentifier:(id)a3
{
  NSMutableDictionary *pinnedTabsByProfileIdentifier;
  id v5;

  pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
  v5 = a3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](pinnedTabsByProfileIdentifier, "setObject:forKeyedSubscript:", 0, v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pinnedTabsByUUIDAndProfileIdentifier, "setObject:forKeyedSubscript:", 0, v5);

}

- (void)performUpdatesUsingBlock:(id)a3
{
  ++self->_updateSuppressionCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  --self->_updateSuppressionCount;
  -[PinnedTabsManager _notifyObserversAfterUpdatesIfNeeded](self, "_notifyObserversAfterUpdatesIfNeeded");
}

- (void)addPinnedTabsObserver:(id)a3
{
  NSMutableDictionary *pinnedTabsByProfileIdentifier;
  id v5;
  _QWORD v6[4];
  id v7;
  PinnedTabsManager *v8;

  v5 = a3;
  -[NSHashTable addObject:](self->_observers, "addObject:", v5);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "pinnedTabsManager:didUpdatePinnedTabs:isPrivate:", self, self->_pinnedTabs, 0);
    objc_msgSend(v5, "pinnedTabsManager:didUpdatePinnedTabs:isPrivate:", self, self->_privatePinnedTabs, 1);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    pinnedTabsByProfileIdentifier = self->_pinnedTabsByProfileIdentifier;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __43__PinnedTabsManager_addPinnedTabsObserver___block_invoke;
    v6[3] = &unk_1E9CF5F48;
    v7 = v5;
    v8 = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pinnedTabsByProfileIdentifier, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

uint64_t __43__PinnedTabsManager_addPinnedTabsObserver___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "pinnedTabsManager:didUpdatePinnedTabs:inProfileWithIdentifier:", *(_QWORD *)(a1 + 40), a3, a2);
}

- (void)removePinnedTabsObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)notifyObserversOfUpdatedPinnedTabsInContainer:(id)a3
{
  PinnedTabsManager *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "isPrivateBrowsingEnabled"))
  {
    v4 = self;
    v5 = 1;
  }
  else
  {
    if (!objc_msgSend(v7, "isInDefaultProfile"))
    {
      objc_msgSend(v7, "activeProfileIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:](self, "notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:", v6);

      goto LABEL_7;
    }
    v4 = self;
    v5 = 0;
  }
  -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsIsPrivate:](v4, "notifyObserversOfUpdatedPinnedTabsIsPrivate:", v5);
LABEL_7:

}

- (void)notifyObserversOfUpdatedPinnedTabsIsPrivate:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (self->_updateSuppressionCount)
  {
    v5 = 1;
    if (a3)
      v5 = 2;
    self->_updateFlags |= v5;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_observers;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      if (v3)
        v10 = 32;
      else
        v10 = 24;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "pinnedTabsManager:didUpdatePinnedTabs:isPrivate:", self, *(Class *)((char *)&self->super.isa + v10), v3, (_QWORD)v13);
        }
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (void)notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_updateSuppressionCount)
  {
    -[NSMutableSet addObject:](self->_pendingUpdatedProfileIdentifiers, "addObject:", v4);
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_observers;
    v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_pinnedTabsByProfileIdentifier, "objectForKeyedSubscript:", v4, (_QWORD)v12);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "pinnedTabsManager:didUpdatePinnedTabs:inProfileWithIdentifier:", self, v11, v4);

          }
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (void)_notifyObserversAfterUpdatesIfNeeded
{
  unint64_t updateFlags;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!self->_updateSuppressionCount)
  {
    updateFlags = self->_updateFlags;
    if ((updateFlags & 1) != 0)
    {
      -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsIsPrivate:](self, "notifyObserversOfUpdatedPinnedTabsIsPrivate:", 0);
      updateFlags = self->_updateFlags;
    }
    if ((updateFlags & 2) != 0)
      -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsIsPrivate:](self, "notifyObserversOfUpdatedPinnedTabsIsPrivate:", 1);
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_pendingUpdatedProfileIdentifiers;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[PinnedTabsManager notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:](self, "notifyObserversOfUpdatedPinnedTabsInProfileWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    self->_updateFlags = 0;
    -[NSMutableSet removeAllObjects](self->_pendingUpdatedProfileIdentifiers, "removeAllObjects");
  }
}

- (WBCollectionConfiguration)collectionConfiguration
{
  return self->_collectionConfiguration;
}

- (WBTabCollection)tabCollection
{
  return self->_tabCollection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionConfiguration, 0);
  objc_storeStrong((id *)&self->_pinnedTabsByUUIDAndProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_pinnedTabsByProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingUpdatedProfileIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeProfileIdentifiers, 0);
  objc_storeStrong((id *)&self->_privatePinnedTabsByUUID, 0);
  objc_storeStrong((id *)&self->_pinnedTabsByUUID, 0);
  objc_storeStrong((id *)&self->_privatePinnedTabs, 0);
  objc_storeStrong((id *)&self->_pinnedTabs, 0);
  objc_storeStrong((id *)&self->_tabCollection, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
