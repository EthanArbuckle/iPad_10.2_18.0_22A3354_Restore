@implementation _FPUnionDataSource

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  _FPUnionDataSource *v3;
  _BOOL4 isRunning;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = self;
  objc_sync_enter(v3);
  isRunning = v3->_isRunning;
  objc_sync_exit(v3);

  if (isRunning)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3->_collections;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "items", (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    -[_FPUnionDataSource delegate](v3, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataSource:replaceContentsWithItems:hasMoreChanges:", v3, v5, 0);

  }
}

- (FPCollectionDataSourceDelegate)delegate
{
  return (FPCollectionDataSourceDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void)start
{
  _FPUnionDataSource *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_isRunning)
  {
    v2->_isRunning = 1;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = v2->_collections;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v12;
      v6 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v12 != v5)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v8, "setDelegate:", v2);
          objc_msgSend(v8, "workingQueue");
          v9 = objc_claimAutoreleasedReturnValue();
          block[0] = v6;
          block[1] = 3221225472;
          block[2] = __27___FPUnionDataSource_start__block_invoke;
          block[3] = &unk_1E444A308;
          block[4] = v8;
          dispatch_async(v9, block);

        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v4);
    }

  }
  objc_sync_exit(v2);

}

- (_FPUnionDataSource)initWithCollections:(id)a3
{
  id v4;
  _FPUnionDataSource *v5;
  uint64_t v6;
  NSArray *collections;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FPUnionDataSource;
  v5 = -[_FPUnionDataSource init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    collections = v5->_collections;
    v5->_collections = (NSArray *)v6;

  }
  return v5;
}

- (void)invalidate
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  _FPUnionDataSource *obj;
  _QWORD block[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isRunning)
  {
    obj->_isRunning = 0;
    objc_sync_exit(obj);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = obj->_collections;
    v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v13;
      v6 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v13 != v5)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v8, "workingQueue", obj);
          v9 = objc_claimAutoreleasedReturnValue();
          block[0] = v6;
          block[1] = 3221225472;
          block[2] = __32___FPUnionDataSource_invalidate__block_invoke;
          block[3] = &unk_1E444A308;
          block[4] = v8;
          dispatch_async(v9, block);

        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v4);
    }

  }
  else
  {
    objc_sync_exit(obj);

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_collections, 0);
}

- (void)collection:(id)a3 didUpdateItems:(id)a4 replaceItemsByFormerID:(id)a5 deleteItemsWithIDs:(id)a6
{
  id v9;
  id v10;
  id v11;
  _FPUnionDataSource *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = self;
  objc_sync_enter(v12);
  LODWORD(a4) = v12->_isRunning;
  objc_sync_exit(v12);

  if ((_DWORD)a4)
  {
    v23 = v11;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v9, "isRootItem:", v19))
          {
            objc_msgSend(v9, "updateRootItem:", v19);
          }
          else
          {
            objc_msgSend(v9, "itemFilteringPredicate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "additionalItemFilteringPredicate");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if ((!v20 || objc_msgSend(v20, "evaluateWithObject:", v19))
              && (!v21 || objc_msgSend(v21, "evaluateWithObject:", v19)))
            {
              objc_msgSend(v13, "addObject:", v19);
            }

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v16);
    }

    v11 = v23;
    if (objc_msgSend(v23, "count") || objc_msgSend(v13, "count"))
    {
      -[_FPUnionDataSource delegate](v12, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dataSource:receivedUpdatedItems:deletedItems:hasMoreChanges:", v12, v13, v23, 0);

    }
    v10 = v24;
  }

}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  id v5;
  _FPUnionDataSource *v6;
  _BOOL4 isRunning;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = self;
  objc_sync_enter(v6);
  isRunning = v6->_isRunning;
  objc_sync_exit(v6);

  if (isRunning)
  {
    if (objc_msgSend(v5, "fp_isFileProviderError:", -2001))
    {
      fp_current_or_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v5;
        _os_log_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_INFO, "[INFO] error in union collection, skipping: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    else
    {
      -[_FPUnionDataSource invalidate](v6, "invalidate");
      -[_FPUnionDataSource delegate](v6, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dataSource:wasInvalidatedWithError:", v6, v5);

    }
  }

}

- (void)collection:(id)a3 didUpdateObservedItem:(id)a4
{
  id v6;
  id v7;
  _FPUnionDataSource *v8;
  _BOOL4 isRunning;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  isRunning = v8->_isRunning;
  objc_sync_exit(v8);

  if (isRunning)
  {
    if (objc_msgSend(v6, "isRootItem:", v7))
    {
      objc_msgSend(v6, "updateRootItem:", v7);
    }
    else
    {
      objc_msgSend(v6, "itemFilteringPredicate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "additionalItemFilteringPredicate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((!v10 || objc_msgSend(v10, "evaluateWithObject:", v7))
        && (!v11 || objc_msgSend(v11, "evaluateWithObject:", v7)))
      {
        -[_FPUnionDataSource delegate](v8, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dataSource:receivedUpdatedItems:deletedItems:hasMoreChanges:", v8, v13, MEMORY[0x1E0C9AA60], 0);

      }
    }
  }

}

- (BOOL)hasMoreIncoming
{
  _FPUnionDataSource *v2;
  uint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  LODWORD(v3) = v2->_isRunning;
  objc_sync_exit(v2);

  if ((_DWORD)v3)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v4 = v2->_collections;
    v3 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "hasMoreUpdates", (_QWORD)v8) & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
        v3 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return v3;
}

@end
