@implementation TabSnapshotCache

- (id)_entryForIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  NSMutableDictionary *groupIdentifiers;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  TabSnapshotCacheEntry *v12;
  BOOL v13;

  v4 = a4;
  groupIdentifiers = self->_groupIdentifiers;
  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](groupIdentifiers, "objectForKeyedSubscript:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v7;
  v11 = v10;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_snapshots, "objectForKeyedSubscript:", v11);
  v12 = (TabSnapshotCacheEntry *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = 1;
  else
    v13 = !v4;
  if (!v13)
  {
    v12 = -[TabSnapshotCacheEntry initWithIdentifier:isGroup:]([TabSnapshotCacheEntry alloc], "initWithIdentifier:isGroup:", v11, v9 != 0);
    -[TabSnapshotCacheEntry setStateObserver:](v12, "setStateObserver:", self);
    -[TabSnapshotCache tabSnapshotCacheEntryDidUpdateState:](self, "tabSnapshotCacheEntryDidUpdateState:", v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_snapshots, "setObject:forKeyedSubscript:", v12, v11);
  }

  return v12;
}

- (void)_finishUpdatingToState:(int64_t)a3 forEntry:(id)a4
{
  -[TabSnapshotCache _finishUpdatingToState:cachedSnapshot:forEntry:](self, "_finishUpdatingToState:cachedSnapshot:forEntry:", a3, 0, a4);
}

- (void)_determineInitialStateForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *fileSystemAccessQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[TabSnapshotCache _determineInitialStateForIdentifier:].cold.1(v6, v5);
  -[TabSnapshotCache _beginUpdatingStateForIdentifier:](self, "_beginUpdatingStateForIdentifier:", v4);

  fileSystemAccessQueue = self->_fileSystemAccessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__TabSnapshotCache__determineInitialStateForIdentifier___block_invoke;
  v9[3] = &unk_1E9CF1830;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(fileSystemAccessQueue, v9);

}

- (void)_beginUpdatingStateForIdentifier:(id)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    objc_msgSend(v3, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Begin updating entry: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(v3, "setUpdatingState:", 1);
  objc_msgSend(v3, "setStateUpdateCancelled:", 0);

}

- (id)_entryForIdentifier:(id)a3
{
  return -[TabSnapshotCache _entryForIdentifier:createIfNeeded:](self, "_entryForIdentifier:createIfNeeded:", a3, 0);
}

- (void)_calculateFitsInCache
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  NSMapTable *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSMapTable *obj;
  char *obja;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = self->_delegateToContextMap;
  v3 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v47;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v47 != v5)
          objc_enumerationMutation(obj);
        -[TabSnapshotCache _contextForDelegate:](self, "_contextForDelegate:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "identifiersToCache");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v43;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v43 != v11)
                objc_enumerationMutation(v8);
              -[TabSnapshotCache _entryForIdentifier:createIfNeeded:](self, "_entryForIdentifier:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v12), 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setFitsInCache:", 0);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          }
          while (v10);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v4);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v28 = self->_delegateToContextMap;
  v30 = -[NSMapTable countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v39;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v39 != v29)
          objc_enumerationMutation(v28);
        obja = v14;
        -[TabSnapshotCache _contextForDelegate:](self, "_contextForDelegate:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifiersToCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v15;
        v17 = objc_msgSend(v15, "capacity");
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v19 = v16;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v35;
LABEL_22:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v35 != v22)
              objc_enumerationMutation(v19);
            if (!v17)
              goto LABEL_32;
            -[TabSnapshotCache _entryForIdentifier:createIfNeeded:](self, "_entryForIdentifier:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v23), 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v24, "isGroup"))
              goto LABEL_29;
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v18, "containsObject:", v25);

            if ((v26 & 1) == 0)
              break;
LABEL_30:

            if (v21 == ++v23)
            {
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
              if (v21)
                goto LABEL_22;
              goto LABEL_32;
            }
          }
          objc_msgSend(v24, "identifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v27);

LABEL_29:
          objc_msgSend(v24, "fitsInCache");
          objc_msgSend(v24, "setFitsInCache:", 1);
          --v17;
          goto LABEL_30;
        }
LABEL_32:

        v14 = obja + 1;
      }
      while (obja + 1 != (char *)v30);
      v30 = -[NSMapTable countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
    }
    while (v30);
  }

}

- (id)_contextForDelegate:(id)a3
{
  id v4;
  TabSnapshotCacheContext *v5;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_delegateToContextMap, "objectForKey:", v4);
  v5 = (TabSnapshotCacheContext *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(TabSnapshotCacheContext);
    -[TabSnapshotCacheContext setCapacity:](v5, "setCapacity:", objc_msgSend(v4, "capacityForTabSnapshotCache:", self));
    -[NSMapTable setObject:forKey:](self->_delegateToContextMap, "setObject:forKey:", v5, v4);
  }

  return v5;
}

- (void)setCapacity:(unint64_t)a3 forDelegate:(id)a4
{
  id v6;

  -[TabSnapshotCache _contextForDelegate:](self, "_contextForDelegate:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "capacity") != a3)
  {
    objc_msgSend(v6, "setCapacity:", a3);
    -[TabSnapshotCache requestNextSnapshotIfNecessary](self, "requestNextSnapshotIfNecessary");
  }

}

- (void)_finishUpdatingToState:(int64_t)a3 cachedSnapshot:(id)a4 forEntry:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_msgSend(v9, "debugDescription");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if ((unint64_t)a3 > 3)
      v14 = CFSTR("Empty");
    else
      v14 = off_1E9CFB3D8[a3];
    *(_DWORD *)buf = 138543874;
    v17 = v12;
    v18 = 2112;
    v19 = v14;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_INFO, "Finish updating entry: %{public}@ (toState = %@; snapshot = %@)",
      buf,
      0x20u);

  }
  if (objc_msgSend(v9, "isUpdatingState"))
  {
    objc_msgSend(v9, "setUpdatingState:", 0);
    if ((objc_msgSend(v9, "stateUpdateCancelled") & 1) == 0)
    {
      objc_msgSend(v9, "setState:", a3);
      if (v8)
      {
        objc_msgSend(v9, "setSnapshot:", v8);
        if (!deviceSupportsASTC || objc_msgSend(v9, "state") == 3)
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __67__TabSnapshotCache__finishUpdatingToState_cachedSnapshot_forEntry___block_invoke;
          v15[3] = &unk_1E9CFB390;
          v15[4] = self;
          -[TabSnapshotCache _enumerateIdentifiersForEntry:respondingToSelector:withBlock:](self, "_enumerateIdentifiersForEntry:respondingToSelector:withBlock:", v9, sel_tabSnapshotCache_didCacheSnapshotWithIdentifier_, v15);
        }
      }
      -[TabSnapshotCache _sendDidFinishUpdatingToDelegateIfNeeded](self, "_sendDidFinishUpdatingToDelegateIfNeeded");
    }
    -[TabSnapshotCache requestNextSnapshotIfNecessary](self, "requestNextSnapshotIfNecessary");
  }

}

- (void)requestNextSnapshotIfNecessary
{
  uint64_t v2;
  _QWORD block[5];

  if (!self->_needsRequestNextSnapshot)
  {
    v2 = MEMORY[0x1E0C809B0];
    self->_needsRequestNextSnapshot = 1;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __50__TabSnapshotCache_requestNextSnapshotIfNecessary__block_invoke;
    block[3] = &unk_1E9CF1900;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)tabSnapshotCacheEntryDidUpdateState:(id)a3
{
  id v4;
  int v5;
  NSMutableSet *identifiersPendingUpdate;
  id v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isPendingUpdate");
  identifiersPendingUpdate = self->_identifiersPendingUpdate;
  objc_msgSend(v4, "identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[NSMutableSet addObject:](identifiersPendingUpdate, "addObject:", v7);
  else
    -[NSMutableSet removeObject:](identifiersPendingUpdate, "removeObject:", v7);

}

- (void)_sendDidFinishUpdatingToDelegateIfNeeded
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (-[TabSnapshotCache isFinishedUpdating](self, "isFinishedUpdating"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = self->_delegateToContextMap;
    v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v20;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v20 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "tabSnapshotCacheDidFinishUpdating:", self);
          ++v7;
        }
        while (v5 != v7);
        v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v5);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSHashTable allObjects](self->_snapshotCacheObservers, "allObjects", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "tabSnapshotCacheDidFinishUpdating:", self);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v11);
    }

  }
}

- (BOOL)isFinishedUpdating
{
  return -[NSMutableSet count](self->_identifiersPendingUpdate, "count") == 0;
}

- (void)_requestNextSnapshotIfNecessaryForDelegate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  unint64_t currentlyRequestedSnapshotCount;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  int v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  -[TabSnapshotCache _contextForDelegate:](self, "_contextForDelegate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiersToCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v4;
  v29 = objc_msgSend(v4, "updating");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v11);
        -[TabSnapshotCache _entryForIdentifier:createIfNeeded:](self, "_entryForIdentifier:createIfNeeded:", v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isGroup"))
        {
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v6, "containsObject:", v14);

          if ((v15 & 1) != 0)
            goto LABEL_10;
          objc_msgSend(v13, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);

        }
        v17 = objc_msgSend(v13, "fitsInCache");
        if ((objc_msgSend(v13, "isUpdatingState") & 1) == 0)
        {
          switch(objc_msgSend(v13, "state"))
          {
            case 0:
              -[TabSnapshotCache _determineInitialStateForIdentifier:](self, "_determineInitialStateForIdentifier:", v12);
              break;
            case 1:
              if (v29)
              {
                currentlyRequestedSnapshotCount = self->_currentlyRequestedSnapshotCount;
                v19 = currentlyRequestedSnapshotCount < 8 ? v17 : 0;
                if (v19 == 1)
                {
                  self->_currentlyRequestedSnapshotCount = currentlyRequestedSnapshotCount + 1;
                  -[TabSnapshotCache _beginUpdatingStateForIdentifier:](self, "_beginUpdatingStateForIdentifier:", v12);
                  v20 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    v21 = v20;
                    objc_msgSend(v13, "debugDescription");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138543362;
                    v40 = v22;
                    _os_log_impl(&dword_1D7CA3000, v21, OS_LOG_TYPE_INFO, "Request snapshot for entry: %{public}@", buf, 0xCu);

                  }
                  v31[0] = MEMORY[0x1E0C809B0];
                  v31[1] = 3221225472;
                  v31[2] = __63__TabSnapshotCache__requestNextSnapshotIfNecessaryForDelegate___block_invoke;
                  v31[3] = &unk_1E9CFB3B8;
                  v31[4] = self;
                  v32 = v13;
                  v33 = v7;
                  v34 = v12;
                  objc_msgSend(v28, "tabSnapshotCache:requestSnapshotWithIdentifier:completion:", self, v12, v31);

                }
              }
              break;
            case 2:
              if (v29)
                -[TabSnapshotCache _saveSnapshotForIdentifier:](self, "_saveSnapshotForIdentifier:", v12);
              break;
            case 3:
              if ((v17 & 1) == 0)
              {
                v23 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  v24 = v23;
                  objc_msgSend(v13, "debugDescription");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v40 = v25;
                  _os_log_impl(&dword_1D7CA3000, v24, OS_LOG_TYPE_INFO, "Reached capacity; will evict snapshot for entry: %{public}@",
                    buf,
                    0xCu);

                }
                objc_msgSend(v13, "setSnapshot:", 0);
                objc_msgSend(v13, "setState:", 4);
                v30[0] = MEMORY[0x1E0C809B0];
                v30[1] = 3221225472;
                v30[2] = __63__TabSnapshotCache__requestNextSnapshotIfNecessaryForDelegate___block_invoke_139;
                v30[3] = &unk_1E9CFB390;
                v30[4] = self;
                -[TabSnapshotCache _enumerateIdentifiersForEntry:respondingToSelector:withBlock:](self, "_enumerateIdentifiersForEntry:respondingToSelector:withBlock:", v13, sel_tabSnapshotCache_didEvictSnapshotWithIdentifier_, v30);
              }
              break;
            case 4:
              if (v17)
                -[TabSnapshotCache _requestSavedSnapshotForIdentifier:](self, "_requestSavedSnapshotForIdentifier:", v12);
              break;
            default:
              break;
          }
        }
LABEL_10:

        ++v11;
      }
      while (v9 != v11);
      v26 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      v9 = v26;
    }
    while (v26);
  }

}

- (void)setUpdating:(BOOL)a3 forDelegate:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  -[TabSnapshotCache _contextForDelegate:](self, "_contextForDelegate:", a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "updating") != v4)
  {
    objc_msgSend(v6, "setUpdating:", v4);
    if (v4)
      -[TabSnapshotCache requestNextSnapshotIfNecessary](self, "requestNextSnapshotIfNecessary");
  }

}

- (void)_requestSavedSnapshotForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *fileSystemAccessQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[TabSnapshotCache _requestSavedSnapshotForIdentifier:].cold.1(v6, v5);
  -[TabSnapshotCache _beginUpdatingStateForIdentifier:](self, "_beginUpdatingStateForIdentifier:", v4);

  fileSystemAccessQueue = self->_fileSystemAccessQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__TabSnapshotCache__requestSavedSnapshotForIdentifier___block_invoke;
  v9[3] = &unk_1E9CF1830;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(fileSystemAccessQueue, v9);

}

uint64_t __56__TabSnapshotCache__determineInitialStateForIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = 4;
  else
    v1 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_finishUpdatingToState:forEntry:", v1, *(_QWORD *)(a1 + 40));
}

- (id)_existingURLForSnapshotWithIdentifier:(id)a3 effectsVersion:(int64_t *)a4
{
  id v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__17;
  v14 = __Block_byref_object_dispose__17;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__TabSnapshotCache__existingURLForSnapshotWithIdentifier_effectsVersion___block_invoke;
  v9[3] = &unk_1E9CFB2D8;
  v9[4] = &v10;
  v9[5] = a4;
  -[TabSnapshotCache _enumeratePossibleURLsForSnapshotWithIdentifier:withBlock:](self, "_enumeratePossibleURLsForSnapshotWithIdentifier:withBlock:", v6, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)_enumeratePossibleURLsForSnapshotWithIdentifier:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[2];
  void (*v11)(uint64_t, uint64_t);
  void *v12;
  TabSnapshotCache *v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __78__TabSnapshotCache__enumeratePossibleURLsForSnapshotWithIdentifier_withBlock___block_invoke;
  v12 = &unk_1E9CFB300;
  v16 = &v17;
  v13 = self;
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  if (deviceSupportsASTC)
    __78__TabSnapshotCache__enumeratePossibleURLsForSnapshotWithIdentifier_withBlock___block_invoke((uint64_t)v10, 1);
  if (!*((_BYTE *)v18 + 24))
    v11((uint64_t)v10, 0);

  _Block_object_dispose(&v17, 8);
}

void __78__TabSnapshotCache__enumeratePossibleURLsForSnapshotWithIdentifier_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  BOOL v6;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v4 = 2;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_URLForSnapshotWithIdentifier:isKTX:effectsVersion:", *(_QWORD *)(a1 + 40), a2, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        v6 = 0;
      else
        v6 = v4 > 1;
      --v4;
    }
    while (v6);
  }
}

void __73__TabSnapshotCache__existingURLForSnapshotWithIdentifier_effectsVersion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int v8;
  void *v9;
  _QWORD *v10;
  id v11;

  v11 = a2;
  v8 = objc_msgSend(v11, "checkResourceIsReachableAndReturnError:", 0);
  v9 = v11;
  if (v8)
  {
    v10 = *(_QWORD **)(a1 + 40);
    if (v10)
      *v10 = a3;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
    v9 = v11;
  }

}

- (id)_URLForSnapshotWithIdentifier:(id)a3 isKTX:(BOOL)a4 effectsVersion:(int64_t)a5
{
  _BOOL4 v6;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  NSURL *thumbnailCacheDirectoryURL;
  __CFString *v13;
  void *v14;
  void *v15;

  v6 = a4;
  objc_msgSend(a3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a5 >= 2)
  {
    objc_msgSend(v8, "stringByAppendingFormat:", CFSTR("-v%ld"), a5);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  v11 = CFSTR("png");
  if (v6)
    v11 = CFSTR("ktx");
  thumbnailCacheDirectoryURL = self->_thumbnailCacheDirectoryURL;
  v13 = v11;
  -[NSURL URLByAppendingPathComponent:isDirectory:](thumbnailCacheDirectoryURL, "URLByAppendingPathComponent:isDirectory:", v9, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "URLByAppendingPathExtension:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __50__TabSnapshotCache_requestNextSnapshotIfNecessary__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_calculateFitsInCache");
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_requestNextSnapshotIfNecessaryForDelegate:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (WeakRetained)
      -[TabSnapshotCache removeSnapshotCacheObserver:](self, "removeSnapshotCacheObserver:", WeakRetained);
    if (obj)
      -[TabSnapshotCache addSnapshotCacheObserver:](self, "addSnapshotCacheObserver:");
  }

}

- (void)addSnapshotCacheObserver:(id)a3
{
  -[NSHashTable addObject:](self->_snapshotCacheObservers, "addObject:", a3);
}

- (void)setIdentifiersToCache:(id)a3 forDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSMapTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id obj;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TabSnapshotCache identifiersToCacheForDelegate:](self, "identifiersToCacheForDelegate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToOrderedSet:", v6) & 1) == 0)
  {
    v47 = v8;
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v10 = self->_delegateToContextMap;
    v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v59 != v13)
            objc_enumerationMutation(v10);
          if (*(id *)(*((_QWORD *)&v58 + 1) + 8 * i) == v7)
          {
            v15 = v6;
          }
          else
          {
            -[TabSnapshotCache identifiersToCacheForDelegate:](self, "identifiersToCacheForDelegate:");
            v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          v16 = v15;
          objc_msgSend(v15, "set");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "minusSet:", v17);

        }
        v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v12);
    }
    v46 = v6;

    v45 = v7;
    objc_msgSend(v7, "snapshotsToPersistOnDiskForTabSnapshotCache:", self);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    obj = v9;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v55 != v20)
            objc_enumerationMutation(obj);
          v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
          -[NSMutableDictionary objectForKey:](self->_snapshots, "objectForKey:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setUpdatingState:", 0);
          -[NSMutableDictionary removeObjectForKey:](self->_snapshots, "removeObjectForKey:", v22);
          -[NSMutableSet removeObject:](self->_identifiersPendingUpdate, "removeObject:", v22);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiers, "objectForKeyedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "groupMembers");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "removeObject:", v22);

            -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "groupMembers");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "count");

            if (!v29)
              -[NSMutableSet removeObject:](self->_identifiersPendingUpdate, "removeObject:", v24);
            -[NSMutableDictionary removeObjectForKey:](self->_groupIdentifiers, "removeObjectForKey:", v22);
          }
          if ((objc_msgSend(v49, "containsObject:", v22) & 1) == 0)
          {
            -[TabSnapshotCache _preferredURLForSnapshotWithIdentifier:](self, "_preferredURLForSnapshotWithIdentifier:", v22);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "path");
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "_web_removeFileOnlyAtPath:", v31);

            if (v33)
            {
              v34 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v64 = v31;
                _os_log_impl(&dword_1D7CA3000, v34, OS_LOG_TYPE_DEFAULT, "Identifiers to cache changed; removed snapshot at path %{public}@",
                  buf,
                  0xCu);
              }
            }

          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
      }
      while (v19);
    }

    v6 = v46;
    v35 = (void *)objc_msgSend(v46, "mutableCopy");
    objc_msgSend(v35, "minusOrderedSet:", v47);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v36 = v35;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
    v7 = v45;
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v51;
      do
      {
        for (k = 0; k != v38; ++k)
        {
          if (*(_QWORD *)v51 != v39)
            objc_enumerationMutation(v36);
          v41 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k);
          -[TabSnapshotCache _entryForIdentifier:createIfNeeded:](self, "_entryForIdentifier:createIfNeeded:", v41, 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
            -[NSMutableSet addObject:](self->_identifiersPendingUpdate, "addObject:", v41);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      }
      while (v38);
    }

    v43 = (void *)objc_msgSend(v46, "copy");
    -[TabSnapshotCache _contextForDelegate:](self, "_contextForDelegate:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setIdentifiersToCache:", v43);

    if ((objc_msgSend(v45, "tabSnapshotCacheShouldDeferNextSnapshotRequest:", self) & 1) == 0)
      -[TabSnapshotCache requestNextSnapshotIfNecessary](self, "requestNextSnapshotIfNecessary");

    v8 = v47;
  }

}

- (void)_enumerateIdentifiersForEntry:(id)a3 respondingToSelector:(SEL)a4 withBlock:(id)a5
{
  id v6;
  void (**v7)(id, uint64_t, uint64_t);
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  NSHashTable *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  uint64_t v36;
  NSMapTable *obj;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, uint64_t))a5;
  if ((objc_msgSend(v6, "isGroup") & 1) != 0)
  {
    objc_msgSend(v6, "groupMembers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v9;
  v34 = v6;

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->_delegateToContextMap;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v52;
    do
    {
      v14 = 0;
      v36 = v12;
      do
      {
        if (*(_QWORD *)v52 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v14);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[TabSnapshotCache identifiersToCacheForDelegate:](self, "identifiersToCacheForDelegate:", v15, v34);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v17 = v38;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v48;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v48 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                if (objc_msgSend(v16, "containsObject:", v22))
                  v7[2](v7, v15, v22);
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            }
            while (v19);
          }

          v12 = v36;
        }
        ++v14;
      }
      while (v14 != v12);
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v12);
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v23 = self->_snapshotCacheObservers;
  v24 = -[NSHashTable countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v29 = v38;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v40;
            do
            {
              for (k = 0; k != v31; ++k)
              {
                if (*(_QWORD *)v40 != v32)
                  objc_enumerationMutation(v29);
                v7[2](v7, v28, *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * k));
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
            }
            while (v31);
          }

        }
      }
      v25 = -[NSHashTable countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v25);
  }

}

uint64_t __67__TabSnapshotCache__finishUpdatingToState_cachedSnapshot_forEntry___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "tabSnapshotCache:didCacheSnapshotWithIdentifier:", *(_QWORD *)(a1 + 32), a3);
}

- (id)snapshotWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "snapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)addIdentifier:(id)a3 toGroupWithIdentifier:(id)a4
{
  NSMutableSet *identifiersPendingUpdate;
  id v7;
  id v8;
  void *v9;
  void *v10;

  identifiersPendingUpdate = self->_identifiersPendingUpdate;
  v7 = a4;
  v8 = a3;
  -[NSMutableSet removeObject:](identifiersPendingUpdate, "removeObject:", v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIdentifiers, "setObject:forKeyedSubscript:", v7, v8);

  -[TabSnapshotCache _entryForIdentifier:createIfNeeded:](self, "_entryForIdentifier:createIfNeeded:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupMembers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  -[TabSnapshotCache requestNextSnapshotIfNecessary](self, "requestNextSnapshotIfNecessary");
}

- (id)identifiersToCacheForDelegate:(id)a3
{
  void *v3;
  void *v4;

  -[TabSnapshotCache _contextForDelegate:](self, "_contextForDelegate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiersToCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultSnapshotCache
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)defaultSnapshotCache_defaultTabSnapshotCacheInstance;
  if (!defaultSnapshotCache_defaultTabSnapshotCacheInstance)
  {
    v3 = objc_alloc_init((Class)a1);
    v4 = (void *)defaultSnapshotCache_defaultTabSnapshotCacheInstance;
    defaultSnapshotCache_defaultTabSnapshotCacheInstance = (uint64_t)v3;

    v2 = (void *)defaultSnapshotCache_defaultTabSnapshotCacheInstance;
  }
  return v2;
}

+ (void)initialize
{
  deviceSupportsASTC = MGGetBoolAnswer();
}

void __55__TabSnapshotCache__requestSavedSnapshotForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_readSnapshotImageForIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__TabSnapshotCache__requestSavedSnapshotForIdentifier___block_invoke_2;
  block[3] = &unk_1E9CF2990;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (id)_readSnapshotImageForIdentifier:(id)a3
{
  id v4;
  const __CFURL *v5;
  const __CFURL *v6;
  CGImageSourceRef v7;
  CGImageSource *v8;
  const __CFDictionary *v9;
  CGImage *ImageAtIndex;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  -[TabSnapshotCache _existingURLForSnapshotWithIdentifier:effectsVersion:](self, "_existingURLForSnapshotWithIdentifier:effectsVersion:", v4, &v18);
  v5 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[TabSnapshotCache _readSnapshotImageForIdentifier:].cold.1();
    goto LABEL_9;
  }
  v7 = CGImageSourceCreateWithURL(v5, 0);
  if (!v7)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[TabSnapshotCache _readSnapshotImageForIdentifier:].cold.2();
LABEL_9:
    v16 = 0;
    goto LABEL_12;
  }
  v8 = v7;
  v19 = *MEMORY[0x1E0CBD250];
  v20[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, v9);
  CFRelease(v8);
  v11 = objc_alloc(MEMORY[0x1E0DC3870]);
  v12 = (void *)objc_msgSend(v11, "sf_initWithCGImage:tabSnapshotEffectsVersion:", ImageAtIndex, v18);
  CGImageRelease(ImageAtIndex);
  if (deviceSupportsASTC)
  {
    v13 = v12;
  }
  else
  {
    -[UIImage safari_decodedImageIfPossible](v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v13;

LABEL_12:
  return v16;
}

void __56__TabSnapshotCache__determineInitialStateForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFURL *v4;
  CGImageSourceRef v5;
  char v6;
  void *v7;
  _QWORD block[5];
  id v9;
  char v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_existingURLForSnapshotWithIdentifier:effectsVersion:", v3, 0);
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

  if (v4 && (v5 = CGImageSourceCreateWithURL(v4, 0)) != 0)
  {
    CFRelease(v5);
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__TabSnapshotCache__determineInitialStateForIdentifier___block_invoke_2;
  block[3] = &unk_1E9CF1D28;
  v10 = v6;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (BOOL)hasValidSnapshotWithIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    LOBYTE(v4) = (objc_msgSend(v3, "state") & 0xFFFFFFFFFFFFFFFELL) == 2;

  return (char)v4;
}

- (void)performBatchUpdatesWithBlock:(id)a3
{
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  -[TabSnapshotCache requestNextSnapshotIfNecessary](self, "requestNextSnapshotIfNecessary");
}

void __55__TabSnapshotCache_initWithThumbnailCacheDirectoryURL___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;

  v1 = a1 + 32;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v3 = *MEMORY[0x1E0C999D8];
  v7 = 0;
  v4 = objc_msgSend(v2, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v3, &v7);
  v5 = v7;
  if ((v4 & 1) == 0)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __55__TabSnapshotCache_initWithThumbnailCacheDirectoryURL___block_invoke_cold_1(v1, v6, v5);
  }

}

+ (void)removeSavedSnapshotsKeepingSnapshotsWithIdentifiers:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  SafariThumbnailCacheDirectoryPath();
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)v4;
  objc_msgSend(v18, "contentsOfDirectoryAtPath:error:", v4, 0);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v22;
    *(_QWORD *)&v6 = 138543362;
    v17 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v10, "stringByDeletingPathExtension", v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "rangeOfString:", CFSTR("-v"));
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "substringToIndex:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v13;
        }
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
        if ((objc_msgSend(v3, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(v19, "stringByAppendingPathComponent:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "_web_removeFileOnlyAtPath:", v15))
          {
            v16 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v26 = v15;
              _os_log_impl(&dword_1D7CA3000, v16, OS_LOG_TYPE_DEFAULT, "Cleaning cache directory; removed snapshot at path %{public}@",
                buf,
                0xCu);
            }
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

}

- (TabSnapshotCache)init
{
  void *v3;
  void *v4;
  void *v5;
  TabSnapshotCache *v6;

  v3 = (void *)MEMORY[0x1E0C99E98];
  SafariThumbnailCacheDirectoryPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TabSnapshotCache initWithThumbnailCacheDirectoryURL:](self, "initWithThumbnailCacheDirectoryURL:", v5);

  return v6;
}

- (TabSnapshotCache)initWithThumbnailCacheDirectoryURL:(id)a3
{
  id v5;
  TabSnapshotCache *v6;
  TabSnapshotCache *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *fileSystemAccessQueue;
  NSMutableDictionary *v11;
  NSMutableDictionary *snapshots;
  NSMutableDictionary *v13;
  NSMutableDictionary *groupIdentifiers;
  uint64_t v15;
  NSMapTable *delegateToContextMap;
  uint64_t v17;
  NSHashTable *snapshotCacheObservers;
  NSMutableSet *v19;
  NSMutableSet *identifiersPendingUpdate;
  NSObject *v21;
  TabSnapshotCache *v22;
  TabSnapshotCache *v23;
  _QWORD block[4];
  TabSnapshotCache *v26;
  objc_super v27;

  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TabSnapshotCache;
  v6 = -[TabSnapshotCache init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_thumbnailCacheDirectoryURL, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.mobilesafari.TabSnapshotCache.FileSystem", v8);
    fileSystemAccessQueue = v7->_fileSystemAccessQueue;
    v7->_fileSystemAccessQueue = (OS_dispatch_queue *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    snapshots = v7->_snapshots;
    v7->_snapshots = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    groupIdentifiers = v7->_groupIdentifiers;
    v7->_groupIdentifiers = v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    delegateToContextMap = v7->_delegateToContextMap;
    v7->_delegateToContextMap = (NSMapTable *)v15;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v17 = objc_claimAutoreleasedReturnValue();
    snapshotCacheObservers = v7->_snapshotCacheObservers;
    v7->_snapshotCacheObservers = (NSHashTable *)v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    identifiersPendingUpdate = v7->_identifiersPendingUpdate;
    v7->_identifiersPendingUpdate = v19;

    v21 = v7->_fileSystemAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__TabSnapshotCache_initWithThumbnailCacheDirectoryURL___block_invoke;
    block[3] = &unk_1E9CF1900;
    v22 = v7;
    v26 = v22;
    dispatch_async(v21, block);
    v23 = v22;

  }
  return v7;
}

uint64_t __55__TabSnapshotCache__requestSavedSnapshotForIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = *(void **)(a1 + 40);
  if (v2 == 4)
    return objc_msgSend(v3, "_finishUpdatingToState:cachedSnapshot:forEntry:", 3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  else
    return objc_msgSend(v3, "_finishUpdatingToState:forEntry:", 4, *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsASTC
{
  return deviceSupportsASTC;
}

- (id)_preferredURLForSnapshotWithIdentifier:(id)a3
{
  return -[TabSnapshotCache _URLForSnapshotWithIdentifier:isKTX:effectsVersion:](self, "_URLForSnapshotWithIdentifier:isKTX:effectsVersion:", a3, deviceSupportsASTC, 2);
}

- (id)_allIdentifiersToCache
{
  void *v3;
  NSMapTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_delegateToContextMap;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[TabSnapshotCache identifiersToCacheForDelegate:](self, "identifiersToCacheForDelegate:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionOrderedSet:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)removeSnapshotCacheObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_snapshotCacheObservers, "removeObject:", a3);
}

- (void)removeSnapshotWithIdentifier:(id)a3
{
  id v4;
  NSObject *fileSystemAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_snapshots, "setObject:forKeyedSubscript:", 0, v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupIdentifiers, "setObject:forKeyedSubscript:", 0, v4);
  fileSystemAccessQueue = self->_fileSystemAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__TabSnapshotCache_removeSnapshotWithIdentifier___block_invoke;
  v7[3] = &unk_1E9CF1830;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(fileSystemAccessQueue, v7);

}

uint64_t __49__TabSnapshotCache_removeSnapshotWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enumeratePossibleURLsForSnapshotWithIdentifier:withBlock:", *(_QWORD *)(a1 + 40), &__block_literal_global_75);
}

void __49__TabSnapshotCache_removeSnapshotWithIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_web_removeFileOnlyAtPath:", v4);

  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = 138543362;
      v8 = v2;
      _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Removed snapshot at path %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)invalidateSnapshotWithIdentifier:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Invalidate entry: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(v4, "setState:", 1);
  objc_msgSend(v4, "setStateUpdateCancelled:", 1);
  -[TabSnapshotCache requestNextSnapshotIfNecessary](self, "requestNextSnapshotIfNecessary");

}

- (void)_saveSnapshotForIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  NSObject *fileSystemAccessQueue;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    objc_msgSend(v5, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v13 = v8;
    _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_INFO, "Save snapshot for entry: %{public}@", buf, 0xCu);

  }
  if (v5)
  {
    -[TabSnapshotCache _beginUpdatingStateForIdentifier:](self, "_beginUpdatingStateForIdentifier:", v4);
    fileSystemAccessQueue = self->_fileSystemAccessQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__TabSnapshotCache__saveSnapshotForIdentifier___block_invoke;
    v10[3] = &unk_1E9CF1830;
    v10[4] = self;
    v11 = v5;
    dispatch_async(fileSystemAccessQueue, v10);

  }
}

void __47__TabSnapshotCache__saveSnapshotForIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "snapshot");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = objc_msgSend(v3, "CGImage");
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_writeSnapshotImage:withIdentifier:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__TabSnapshotCache__saveSnapshotForIdentifier___block_invoke_2;
  block[3] = &unk_1E9CF2990;
  v7 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v7;
  v11 = v6;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __47__TabSnapshotCache__saveSnapshotForIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (deviceSupportsASTC)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (v2)
      return objc_msgSend(*(id *)(a1 + 32), "_finishUpdatingToState:cachedSnapshot:forEntry:", 3, v2, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "setSnapshot:", 0);
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 4;
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = 3;
  }
  return objc_msgSend(v4, "_finishUpdatingToState:forEntry:", v6, v5);
}

- (id)_writeSnapshotImage:(CGImage *)a3 withIdentifier:(id)a4
{
  id v6;
  const __CFURL *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  const __CFString *v10;
  void *v11;
  CGImageDestination *v12;
  CGImageDestination *v13;
  BOOL v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  const __CFURL *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TabSnapshotCache _preferredURLForSnapshotWithIdentifier:](self, "_preferredURLForSnapshotWithIdentifier:", v6);
  v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  if (deviceSupportsASTC)
  {
    v8 = *MEMORY[0x1E0CBC830];
    v28[0] = *MEMORY[0x1E0CBCA18];
    v28[1] = v8;
    v29[0] = *MEMORY[0x1E0CBC840];
    v29[1] = &unk_1E9D623F8;
    v28[2] = *MEMORY[0x1E0CBC858];
    v29[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("org.khronos.ktx");
  }
  else
  {
    v10 = (const __CFString *)*MEMORY[0x1E0CA5C10];
    v26 = *MEMORY[0x1E0CBD028];
    v24 = *MEMORY[0x1E0CBD008];
    v25 = &unk_1E9D62410;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  }
  v12 = CGImageDestinationCreateWithURL(v7, v10, 1uLL, 0);
  if (!v12)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[TabSnapshotCache _writeSnapshotImage:withIdentifier:].cold.1();
    goto LABEL_12;
  }
  v13 = v12;
  CGImageDestinationAddImage(v12, a3, v9);
  v14 = CGImageDestinationFinalize(v13);
  CFRelease(v13);
  if (!v14)
  {
    v17 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[TabSnapshotCache _writeSnapshotImage:withIdentifier:].cold.2();
LABEL_12:
    v15 = 0;
    goto LABEL_15;
  }
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __55__TabSnapshotCache__writeSnapshotImage_withIdentifier___block_invoke;
  v22 = &unk_1E9CFB368;
  v23 = v7;
  -[TabSnapshotCache _enumeratePossibleURLsForSnapshotWithIdentifier:withBlock:](self, "_enumeratePossibleURLsForSnapshotWithIdentifier:withBlock:", v6, &v19);
  if (deviceSupportsASTC)
  {
    -[TabSnapshotCache _readSnapshotImageForIdentifier:](self, "_readSnapshotImageForIdentifier:", v6, v19, v20, v21, v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

LABEL_15:
  return v15;
}

void __55__TabSnapshotCache__writeSnapshotImage_withIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "_web_removeFileOnlyAtPath:", v5);

    if (v6)
    {
      v7 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543362;
        v9 = v3;
        _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_DEFAULT, "Removed legacy snapshot at path %{public}@", (uint8_t *)&v8, 0xCu);
      }
    }
  }

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[TabSnapshotCache _allIdentifiersToCache](self, "_allIdentifiersToCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "state"))
        {
          v10 = objc_msgSend(v9, "state");
          v11 = CFSTR("*");
          if (v10 != 1)
          {
            v12 = objc_msgSend(v9, "state", CFSTR("*"));
            v11 = CFSTR("e");
            if (v12 != 4)
            {
              v13 = objc_msgSend(v9, "state", CFSTR("e"));
              v11 = CFSTR("█");
              if (v13 != 3)
              {
                if (objc_msgSend(v9, "state", CFSTR("█")) == 2)
                  v11 = CFSTR("S");
                else
                  v11 = CFSTR("X");
              }
            }
          }
        }
        else
        {
          v11 = CFSTR(".");
        }
        objc_msgSend(v3, "appendString:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v14 = (void *)MEMORY[0x1E0CB3940];
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@: %p; delegateToContextMap = %@, snapshotCacheStates = %@;>"),
    v16,
    self,
    self->_delegateToContextMap,
    v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v17;
}

void __63__TabSnapshotCache__requestNextSnapshotIfNecessaryForDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = WBS_LOG_CHANNEL_PREFIXTabSnapshots();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 40);
    v6 = v4;
    objc_msgSend(v5, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Did request snapshot for entry: %{public}@", (uint8_t *)&v8, 0xCu);

  }
  if (v3 && objc_msgSend(*(id *)(a1 + 48), "containsObject:", *(_QWORD *)(a1 + 56)))
    objc_msgSend(*(id *)(a1 + 32), "_finishUpdatingToState:cachedSnapshot:forEntry:", 2, v3, *(_QWORD *)(a1 + 40));
  else
    objc_msgSend(*(id *)(a1 + 32), "_finishUpdatingToState:forEntry:", 4, *(_QWORD *)(a1 + 40));

}

uint64_t __63__TabSnapshotCache__requestNextSnapshotIfNecessaryForDelegate___block_invoke_139(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "tabSnapshotCache:didEvictSnapshotWithIdentifier:", *(_QWORD *)(a1 + 32), a3);
}

- (void)removeIdentifier:(id)a3 fromGroupWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiers, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if (v9)
  {
    -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "groupMembers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v6);

    -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "groupMembers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
      -[NSMutableSet removeObject:](self->_identifiersPendingUpdate, "removeObject:", v7);
    -[NSMutableDictionary removeObjectForKey:](self->_groupIdentifiers, "removeObjectForKey:", v6);
    -[TabSnapshotCache requestNextSnapshotIfNecessary](self, "requestNextSnapshotIfNecessary");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NSMapTable objectEnumerator](self->_delegateToContextMap, "objectEnumerator", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "identifiersToCache");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v6);

          if ((v21 & 1) != 0)
          {

            -[TabSnapshotCache _entryForIdentifier:](self, "_entryForIdentifier:", v6);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              -[TabSnapshotCache tabSnapshotCacheEntryDidUpdateState:](self, "tabSnapshotCacheEntryDidUpdateState:", v15);
            else
              -[NSMutableSet addObject:](self->_identifiersPendingUpdate, "addObject:", v6);
            goto LABEL_16;
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v17)
          continue;
        break;
      }
    }
LABEL_16:

  }
}

- (id)groupIdentifierForSnapshotWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiers, "objectForKeyedSubscript:", a3);
}

- (BOOL)isIdentifier:(id)a3 memberOfSameGroupAsIdentifier:(id)a4
{
  NSMutableDictionary *groupIdentifiers;
  id v7;
  void *v8;
  void *v9;

  groupIdentifiers = self->_groupIdentifiers;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](groupIdentifiers, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_groupIdentifiers, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(groupIdentifiers) = objc_msgSend(v8, "isEqual:", v9);
  return (char)groupIdentifiers;
}

- (TabSnapshotCacheDelegate)delegate
{
  return (TabSnapshotCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fileSystemAccessQueue, 0);
  objc_storeStrong((id *)&self->_identifiersPendingUpdate, 0);
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_thumbnailCacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_snapshots, 0);
  objc_storeStrong((id *)&self->_snapshotCacheObservers, 0);
  objc_storeStrong((id *)&self->_delegateToContextMap, 0);
}

void __55__TabSnapshotCache_initWithThumbnailCacheDirectoryURL___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 48);
  v5 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v4;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_5_0(&dword_1D7CA3000, v5, v7, "Failed to exclude tab snapshots directory from backup %@. Error: %{public}@", (uint8_t *)&v8);

}

- (void)_determineInitialStateForIdentifier:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_4(&dword_1D7CA3000, v5, v6, "Determine initial state for entry: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_3();
}

- (void)_requestSavedSnapshotForIdentifier:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = a1;
  objc_msgSend(a2, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_4(&dword_1D7CA3000, v5, v6, "Request saved snapshot for entry: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_3();
}

- (void)_readSnapshotImageForIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1D7CA3000, v0, v1, "Image does not exist for identifier: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_readSnapshotImageForIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1D7CA3000, v0, v1, "Failed to create image source with URL: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_writeSnapshotImage:withIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_1(&dword_1D7CA3000, v0, v1, "Failed to create image destination with URL: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

- (void)_writeSnapshotImage:withIdentifier:.cold.2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_1D7CA3000, v1, (uint64_t)v1, "Failed to finalize image destination with URL: %{public}@, image properties: %{public}@", v2);
  OUTLINED_FUNCTION_10();
}

@end
