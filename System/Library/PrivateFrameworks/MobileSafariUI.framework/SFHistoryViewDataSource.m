@implementation SFHistoryViewDataSource

- (SFHistoryViewDataSource)initWithHistory:(id)a3
{
  id v5;
  SFHistoryViewDataSource *v6;
  SFHistoryViewDataSource *v7;
  uint64_t v8;
  NSOrderedSet *unfilteredSessions;
  dispatch_queue_t v10;
  OS_dispatch_queue *filteringQueue;
  SFHistoryViewDataSource *v12;
  void *v13;
  SFHistoryViewDataSource *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  SFHistoryViewDataSource *v20;
  id v21;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SFHistoryViewDataSource;
  v6 = -[SFHistoryViewDataSource init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_history, a3);
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
    v8 = objc_claimAutoreleasedReturnValue();
    unfilteredSessions = v7->_unfilteredSessions;
    v7->_unfilteredSessions = (NSOrderedSet *)v8;

    v10 = dispatch_queue_create("com.apple.mobilesafari.SFHistoryViewDataSource", 0);
    filteringQueue = v7->_filteringQueue;
    v7->_filteringQueue = (OS_dispatch_queue *)v10;

    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __43__SFHistoryViewDataSource_initWithHistory___block_invoke;
    v19 = &unk_1E9CF1830;
    v12 = v7;
    v20 = v12;
    v21 = v5;
    objc_msgSend(v21, "performBlockAfterHistoryHasLoaded:", &v16);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel_historyChanged_, *MEMORY[0x1E0D8B0F0], 0);

    v14 = v12;
  }

  return v7;
}

void __43__SFHistoryViewDataSource_initWithHistory___block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43__SFHistoryViewDataSource_initWithHistory___block_invoke_2;
  v2[3] = &unk_1E9CF1830;
  v3 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

uint64_t __43__SFHistoryViewDataSource_initWithHistory___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8A9B0]), "initWithHistory:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_updateIfNeeded");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", *MEMORY[0x1E0D8B0F0]);

  v4.receiver = self;
  v4.super_class = (Class)SFHistoryViewDataSource;
  -[SFHistoryViewDataSource dealloc](&v4, sel_dealloc);
}

- (void)historyChanged:(id)a3
{
  self->_updateFlags.changedExternally = 1;
  -[SFHistoryViewDataSource _updateIfNeeded](self, "_updateIfNeeded", a3);
}

- (void)filterUsingPredicate:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_userFilterPredicate, a3);
    -[SFHistoryViewDataSource _updateFilterPredicate](self, "_updateFilterPredicate");
  }

}

- (void)_updateFilterPredicate
{
  objc_storeStrong((id *)&self->_filterPredicate, self->_userFilterPredicate);
  self->_updateFlags.filterChanged = 1;
  -[SFHistoryViewDataSource _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateIfNeeded
{
  NSOrderedSet *unfilteredSessions;
  NSObject *filteringQueue;
  _QWORD block[5];

  if ((self->_updateFlags.filterChanged || self->_updateFlags.changedExternally)
    && !self->_updateFlags.isUpdating
    && !self->_updateFlags.suppressingUpdatesCount
    && self->_sessionController)
  {
    if (self->_updateFlags.changedExternally)
    {
      unfilteredSessions = self->_unfilteredSessions;
      self->_unfilteredSessions = 0;

    }
    *(_WORD *)&self->_updateFlags.isUpdating = 1;
    self->_updateFlags.changedExternally = 0;
    filteringQueue = self->_filteringQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__SFHistoryViewDataSource__updateIfNeeded__block_invoke;
    block[3] = &unk_1E9CF1900;
    block[4] = self;
    dispatch_async(filteringQueue, block);
  }
}

void __42__SFHistoryViewDataSource__updateIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_filteredHistorySessionsForPredicate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SFHistoryViewDataSource__updateIfNeeded__block_invoke_2;
  v4[3] = &unk_1E9CF1830;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

uint64_t __42__SFHistoryViewDataSource__updateIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "historyViewDataSource:didComputeSessions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_updateIfNeeded");
}

- (id)_filteredHistorySessionsForPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFHistoryViewDataSource _browsingSessions](self, "_browsingSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v19 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v13, "historyItems");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "filteredArrayUsingPredicate:", v4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "count"))
          {
            objc_msgSend(v13, "filteredSessionWithItems:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v17);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v6 = v19;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)_browsingSessions
{
  NSOrderedSet *unfilteredSessions;
  NSOrderedSet **p_unfilteredSessions;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[5];
  id v18;

  p_unfilteredSessions = &self->_unfilteredSessions;
  unfilteredSessions = self->_unfilteredSessions;
  if (unfilteredSessions)
    return unfilteredSessions;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistorySessionController orderedSessions](self->_sessionController, "orderedSessions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__2;
    v17[4] = __Block_byref_object_dispose__2;
    v18 = 0;
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3032000000;
    v15[3] = __Block_byref_object_copy__2;
    v15[4] = __Block_byref_object_dispose__2;
    v16 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __44__SFHistoryViewDataSource__browsingSessions__block_invoke;
    v11[3] = &unk_1E9CF30D0;
    v11[4] = self;
    v13 = v17;
    v14 = v15;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
    objc_storeStrong((id *)p_unfilteredSessions, v6);
    v9 = v12;
    v10 = v8;

    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v17, 8);

  }
  return v6;
}

void __44__SFHistoryViewDataSource__browsingSessions__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  SFHistoryViewDataSourceSession *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  SFHistoryViewDataSourceSession *v34;
  void *v35;
  SFHistoryViewDataSourceSession *v36;
  SFHistoryViewDataSourceSession *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  SFHistoryViewDataSourceSession *v45;
  id v46;
  uint64_t v47;
  void *v48;
  SFHistoryViewDataSourceSession *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "itemsLastVisitedInSession:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v48 = v6;
  if (a3 > 2)
  {
    v37 = [SFHistoryViewDataSourceSession alloc];
    objc_msgSend(v5, "startDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[History sessionIdentifierFromDate:](History, "sessionIdentifierFromDate:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(v5, "startDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "titleForDate:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v7);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[SFHistoryViewDataSourceSession initWithIdentifier:title:lastVisitedDate:historyItems:](v37, "initWithIdentifier:title:lastVisitedDate:historyItems:", v39, v42, v43, v44);

    v7 = v48;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v45);

  }
  else
  {
    v46 = v5;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v53;
      v11 = &off_1E9CEE000;
      v47 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v53 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          v14 = v11[208];
          objc_msgSend(v13, "lastVisitedDate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "sessionIdentifierFromDate:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v16, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) & 1) == 0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "firstObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              v50 = *(void **)(a1 + 40);
              v49 = [SFHistoryViewDataSourceSession alloc];
              v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
              v19 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "firstObject");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "lastVisitedDate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "titleForDate:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "firstObject");
              v22 = v9;
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "lastVisitedDate");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = -[SFHistoryViewDataSourceSession initWithIdentifier:title:lastVisitedDate:historyItems:](v49, "initWithIdentifier:title:lastVisitedDate:historyItems:", v18, v21, v24, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
              objc_msgSend(v50, "addObject:", v25);

              v10 = v47;
              v9 = v22;

              v11 = &off_1E9CEE000;
              v7 = v48;

            }
            objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
            v26 = objc_claimAutoreleasedReturnValue();
            v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
            v28 = *(void **)(v27 + 40);
            *(_QWORD *)(v27 + 40) = v26;

            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v16);
          }
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v9);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v46;
    if (v29)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "lastVisitedDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      +[History sessionIdentifierFromDate:](History, "sessionIdentifierFromDate:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(a1 + 40);
      v34 = [SFHistoryViewDataSourceSession alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "titleForDate:", v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[SFHistoryViewDataSourceSession initWithIdentifier:title:lastVisitedDate:historyItems:](v34, "initWithIdentifier:title:lastVisitedDate:historyItems:", v32, v35, v31, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      objc_msgSend(v33, "addObject:", v36);

    }
  }

}

- (void)deleteHistoryItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *filteringQueue;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = v7;
  else
    v8 = &__block_literal_global_8;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = (void *)MEMORY[0x1E0CB3880];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_2;
  v25[3] = &unk_1E9CF3118;
  v26 = v9;
  v12 = v9;
  objc_msgSend(v11, "predicateWithBlock:", v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  filteringQueue = self->_filteringQueue;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_3;
  block[3] = &unk_1E9CF2298;
  block[4] = self;
  v22 = v13;
  v23 = v6;
  v24 = v8;
  v15 = v8;
  v16 = v6;
  v17 = v13;
  dispatch_async(filteringQueue, block);
  objc_msgSend(v16, "safari_mapObjectsUsingBlock:", &__block_literal_global_16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0D8A8C0];
  -[WBSHistory profileLocalIdentifier](self->_history, "profileLocalIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deleteUsageHistoryForURLs:profileIdentifier:", v18, v20);

}

uint64_t __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_filteredHistorySessionsForPredicate:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_4;
  v4[3] = &unk_1E9CF2298;
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v4);

}

void __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_updateIfNeeded");
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_5;
  v5[3] = &unk_1E9CF26B8;
  v5[4] = v2;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v3, "removeItems:completionHanlder:", v4, v5);

}

uint64_t __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_5(uint64_t a1)
{
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 32), "_updateIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "saveChangesToCloudHistorySoon");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __64__SFHistoryViewDataSource_deleteHistoryItems_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "url");
}

- (void)saveChangesToCloudHistorySoon
{
  NSTimer *v3;
  NSTimer *saveChangesToCloudHistoryTimer;

  -[NSTimer invalidate](self->_saveChangesToCloudHistoryTimer, "invalidate");
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__saveChangesToCloudHistory, 0, 0, 3.0);
  v3 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  saveChangesToCloudHistoryTimer = self->_saveChangesToCloudHistoryTimer;
  self->_saveChangesToCloudHistoryTimer = v3;

}

- (void)_saveChangesToCloudHistory
{
  id v2;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveChangesToCloudHistoryStore");

}

- (History)history
{
  return self->_history;
}

- (SFHistoryViewDataSourceDelegate)delegate
{
  return (SFHistoryViewDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_saveChangesToCloudHistoryTimer, 0);
  objc_storeStrong((id *)&self->_filteringQueue, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_userFilterPredicate, 0);
  objc_storeStrong((id *)&self->_unfilteredSessions, 0);
  objc_storeStrong((id *)&self->_sessionController, 0);
}

@end
