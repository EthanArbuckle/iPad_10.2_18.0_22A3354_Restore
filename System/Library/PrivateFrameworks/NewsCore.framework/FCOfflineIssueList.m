@implementation FCOfflineIssueList

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      observers = self->_observers;
    else
      observers = 0;
    if (-[NSHashTable containsObject:](observers, "containsObject:", v4)
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is already an observer"), v4);
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCOfflineIssueList addObserver:]";
      v11 = 2080;
      v12 = "FCOfflineIssueList.m";
      v13 = 1024;
      v14 = 227;
      v15 = 2114;
      v16 = v8;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (self)
        goto LABEL_7;
    }
    else if (self)
    {
LABEL_7:
      v6 = self->_observers;
LABEL_8:
      -[NSHashTable addObject:](v6, "addObject:", v4);
      goto LABEL_11;
    }
    v6 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCOfflineIssueList addObserver:]";
    v11 = 2080;
    v12 = "FCOfflineIssueList.m";
    v13 = 1024;
    v14 = 223;
    v15 = 2114;
    v16 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_11:

}

- (FCOfflineIssueList)initWithStoreDirectoryFileURL:(id)a3 appActivityMonitor:(id)a4 backgroundTaskable:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCOfflineIssueList *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  FCKeyValueStore *v15;
  FCKeyValueStore *localStore;
  uint64_t v17;
  NSHashTable *observers;
  void *v20;
  objc_super v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "storeDirectoryFileURL != nil");
    *(_DWORD *)buf = 136315906;
    v23 = "-[FCOfflineIssueList initWithStoreDirectoryFileURL:appActivityMonitor:backgroundTaskable:]";
    v24 = 2080;
    v25 = "FCOfflineIssueList.m";
    v26 = 1024;
    v27 = 50;
    v28 = 2114;
    v29 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v21.receiver = self;
  v21.super_class = (Class)FCOfflineIssueList;
  v11 = -[FCOfflineIssueList init](&v21, sel_init);
  if (v11)
  {
    +[FCKeyValueStoreSavePolicy defaultPolicy](FCKeyValueStoreSavePolicy, "defaultPolicy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && v10)
    {
      +[FCKeyValueStoreSavePolicy appBackgroundPolicyWithActivityMonitor:backgroundTaskable:](FCKeyValueStoreSavePolicy, "appBackgroundPolicyWithActivityMonitor:backgroundTaskable:", v9, v10);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    objc_msgSend(v8, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:migrator:savePolicy:]([FCKeyValueStore alloc], "initWithName:directory:version:options:classRegistry:migrator:savePolicy:", CFSTR("offline-issue-list"), v14, 2, 8, 0, 0, v12);
    localStore = v11->_localStore;
    v11->_localStore = v15;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v11->_observers;
    v11->_observers = (NSHashTable *)v17;

  }
  return v11;
}

- (FCOfflineIssueList)init
{
  void *v3;
  FCOfflineIssueList *v4;

  FCURLForContainerizedUserAccountDocumentDirectory(1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[FCOfflineIssueList initWithStoreDirectoryFileURL:](self, "initWithStoreDirectoryFileURL:", v3);

  return v4;
}

- (FCOfflineIssueList)initWithStoreDirectoryFileURL:(id)a3
{
  return -[FCOfflineIssueList initWithStoreDirectoryFileURL:appActivityMonitor:backgroundTaskable:](self, "initWithStoreDirectoryFileURL:appActivityMonitor:backgroundTaskable:", a3, 0, 0);
}

- (void)addIssueID:(id)a3 source:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  FCKeyValueStore *localStore;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  FCKeyValueStore *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    if (a4 == 2)
    {
      v7 = CFSTR("auto");
    }
    else if (a4)
    {
      v7 = CFSTR("manual");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("issues should always be added from a known source"));
        *(_DWORD *)buf = 136315906;
        v20 = "-[FCOfflineIssueList addIssueID:source:]";
        v21 = 2080;
        v22 = "FCOfflineIssueList.m";
        v23 = 1024;
        v24 = 92;
        v25 = 2114;
        v26 = v16;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v7 = CFSTR("unknown");
    }
    if (self)
      localStore = self->_localStore;
    else
      localStore = 0;
    -[FCKeyValueStore objectForKey:](localStore, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("issueID"));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, CFSTR("source"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("dateAdded"));

    if (self)
      v15 = self->_localStore;
    else
      v15 = 0;
    -[FCKeyValueStore setObject:forKey:](v15, "setObject:forKey:", v13, v6);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __40__FCOfflineIssueList_addIssueID_source___block_invoke_27;
    v17[3] = &unk_1E463AD10;
    v17[4] = self;
    v18 = v6;
    FCPerformBlockOnMainThread(v17);

  }
}

void __40__FCOfflineIssueList_addIssueID_source___block_invoke_27(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  v4 = (void *)objc_msgSend(v3, "copy", (_QWORD)v13);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v11 = *(_QWORD *)(a1 + 32);
        v17 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "offlineIssueList:didAddIssues:removeIssues:", v11, v12, v8);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v6);
  }

}

- (BOOL)containsIssueID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (self)
    self = (FCOfflineIssueList *)self->_localStore;
  -[FCOfflineIssueList objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dateRemoved"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateRemoved"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateAdded"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "fc_isEarlierThan:", v7);

    }
    else
    {
      v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)everContainedIssueID:(id)a3
{
  if (self)
    self = (FCOfflineIssueList *)self->_localStore;
  return -[FCOfflineIssueList containsObjectForKey:](self, "containsObjectForKey:", a3);
}

- (int64_t)sourceForIssueID:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  if (self)
    self = (FCOfflineIssueList *)self->_localStore;
  -[FCOfflineIssueList objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("source"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("manual")) & 1) != 0)
  {
    v5 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("auto")))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dateAddedForIssueID:(id)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (FCOfflineIssueList *)self->_localStore;
  -[FCOfflineIssueList objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dateRemovedForIssueID:(id)a3
{
  void *v3;
  void *v4;

  if (self)
    self = (FCOfflineIssueList *)self->_localStore;
  -[FCOfflineIssueList objectForKey:](self, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dateRemoved"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)issueIDs
{
  void *v2;
  void *v3;

  if (self)
    self = (FCOfflineIssueList *)self->_localStore;
  -[FCOfflineIssueList keysOfEntriesPassingTest:](self, "keysOfEntriesPassingTest:", &__block_literal_global_30_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __30__FCOfflineIssueList_issueIDs__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dateRemoved"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dateRemoved"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fc_isEarlierThan:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (NSArray)sortedIssueIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (self)
    self = (FCOfflineIssueList *)self->_localStore;
  -[FCOfflineIssueList allObjects](self, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_32_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_34_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_36_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

uint64_t __36__FCOfflineIssueList_sortedIssueIDs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("dateRemoved"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("dateRemoved"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("dateAdded"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fc_isEarlierThan:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __36__FCOfflineIssueList_sortedIssueIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateAdded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __36__FCOfflineIssueList_sortedIssueIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("issueID"));
}

- (void)removeIssueIDs:(id)a3
{
  id v4;
  FCKeyValueStore *localStore;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    localStore = self->_localStore;
  else
    localStore = 0;
  -[FCKeyValueStore updateObjectsForKeys:withBlock:](localStore, "updateObjectsForKeys:withBlock:", v4, &__block_literal_global_38_2);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__FCOfflineIssueList_removeIssueIDs___block_invoke_2;
  v7[3] = &unk_1E463AD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  FCPerformBlockOnMainThread(v7);

}

id __37__FCOfflineIssueList_removeIssueIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("dateRemoved"));

  return v2;
}

void __37__FCOfflineIssueList_removeIssueIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  v4 = (void *)objc_msgSend(v3, "copy", (_QWORD)v10);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "offlineIssueList:didAddIssues:removeIssues:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 40));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)removeAllIssues
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[FCOfflineIssueList issueIDs](self, "issueIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCOfflineIssueList removeIssueIDs:](self, "removeIssueIDs:", v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__FCOfflineIssueList_removeAllIssues__block_invoke;
  v5[3] = &unk_1E463AD10;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  FCPerformBlockOnMainThread(v5);

}

void __37__FCOfflineIssueList_removeAllIssues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  v4 = (void *)objc_msgSend(v3, "copy", (_QWORD)v10);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    v8 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "offlineIssueList:didAddIssues:removeIssues:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 40));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v4)
  {
    if (self)
      observers = self->_observers;
    else
      observers = 0;
    -[NSHashTable removeObject:](observers, "removeObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCOfflineIssueList removeObserver:]";
    v9 = 2080;
    v10 = "FCOfflineIssueList.m";
    v11 = 1024;
    v12 = 236;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
}

@end
