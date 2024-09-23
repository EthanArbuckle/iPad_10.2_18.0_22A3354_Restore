@implementation FCFDBStorage

- (FCFDBStorage)initWithFileURL:(id)a3 options:(int64_t)a4 pruningPolicy:(id)a5
{
  id v8;
  void *v9;
  FCFDBStorage *v10;

  v8 = a5;
  objc_msgSend(a3, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FCFDBStorage initWithPath:options:pruningPolicy:](self, "initWithPath:options:pruningPolicy:", v9, a4, v8);

  return v10;
}

- (FCFDBStorage)initWithPath:(id)a3 options:(int64_t)a4 pruningPolicy:(id)a5
{
  id v8;
  id v9;
  id v10;
  FCFDBConnection *v11;
  void *v12;
  FCFDBConnection *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  dispatch_queue_t v33;
  void *v34;
  NSObject *v35;
  objc_super v37;
  uint8_t buf[4];
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v37.receiver = self;
  v37.super_class = (Class)FCFDBStorage;
  v10 = -[FCFDBStorage init](&v37, sel_init);
  if (v10)
  {
    v11 = -[FCFDBConnection initWithPath:]([FCFDBConnection alloc], "initWithPath:", v8);
    if (v11)
    {
      v12 = (void *)*((_QWORD *)v10 + 4);
      *((_QWORD *)v10 + 4) = v11;
      v13 = v11;

      *((_QWORD *)v10 + 1) = a4;
      v14 = objc_msgSend(v8, "copy");
      v15 = (void *)*((_QWORD *)v10 + 2);
      *((_QWORD *)v10 + 2) = v14;

      objc_storeStrong((id *)v10 + 3, a5);
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = dispatch_queue_create("FCFDBStorage.access", v16);
      v18 = (void *)*((_QWORD *)v10 + 5);
      *((_QWORD *)v10 + 5) = v17;

      dispatch_queue_set_specific(*((dispatch_queue_t *)v10 + 5), (const void *)FCFDBStorageAccessQueueUnique, (void *)FCFDBStorageAccessQueueUnique, 0);
      v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v20 = (void *)*((_QWORD *)v10 + 6);
      *((_QWORD *)v10 + 6) = v19;

      v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v22 = (void *)*((_QWORD *)v10 + 7);
      *((_QWORD *)v10 + 7) = v21;

      v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v24 = (void *)*((_QWORD *)v10 + 8);
      *((_QWORD *)v10 + 8) = v23;

      v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v26 = (void *)*((_QWORD *)v10 + 10);
      *((_QWORD *)v10 + 10) = v25;

      v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v28 = (void *)*((_QWORD *)v10 + 11);
      *((_QWORD *)v10 + 11) = v27;

      v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v30 = (void *)*((_QWORD *)v10 + 12);
      *((_QWORD *)v10 + 12) = v29;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v31 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v31, QOS_CLASS_BACKGROUND, 0);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = dispatch_queue_create("FCFDBStorage.slowSave", v32);
      v34 = (void *)*((_QWORD *)v10 + 13);
      *((_QWORD *)v10 + 13) = v33;

    }
    else
    {
      v35 = FCFeedDatabaseLog;
      if (os_log_type_enabled((os_log_t)FCFeedDatabaseLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v39 = v8;
        _os_log_error_impl(&dword_1A1B90000, v35, OS_LOG_TYPE_ERROR, "failed to establish connection to SQL database at path=%{public}@", buf, 0xCu);
      }
      v31 = v10;
      v10 = 0;
    }

  }
  return (FCFDBStorage *)v10;
}

- (id)_pruneFeedsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  FCFDBStorage *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v5
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing fdb storage outside the access queue"));
    *(_DWORD *)buf = 136315906;
    v34 = "-[FCFDBStorage _pruneFeedsIfNeeded:]";
    v35 = 2080;
    v36 = "FCFDBStorage.m";
    v37 = 1024;
    v38 = 394;
    v39 = 2114;
    v40 = v24;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if ((-[FCFDBStorage options](self, "options") & 4) != 0)
  {
    -[FCFDBStorage pruningPolicy](self, "pruningPolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "feedRangeToPrune");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v6 = v9;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v25 = v4;
      v10 = v4;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v11)
      {
        v12 = v11;
        v26 = self;
        v13 = 0;
        v14 = *(_QWORD *)v29;
        do
        {
          v15 = 0;
          v27 = v12;
          do
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v10);
            v16 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v15);
            objc_msgSend(v10, "objectForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "hasFetchedRangesInRange:", v6))
            {
              if (!v13)
                v13 = (void *)objc_msgSend(v10, "mutableCopy");
              v18 = v6;
              v19 = (void *)objc_msgSend(v17, "copyWithoutFetchedRange:", v6);
              objc_msgSend(v13, "setObject:forKey:", v19, v16);
              -[FCFDBStorage modifiedFeedIDs](v26, "modifiedFeedIDs");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "addObject:", v16);

              -[FCFDBStorage prunedFeedIDs](v26, "prunedFeedIDs");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "addObject:", v16);

              v6 = v18;
              v12 = v27;
            }

            ++v15;
          }
          while (v12 != v15);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v12);
      }
      else
      {
        v13 = 0;
      }

      if (v13)
        v22 = v13;
      else
        v22 = v10;
      v7 = v22;

      v4 = v25;
    }
    else
    {
      v7 = v4;
      v6 = 0;
    }
  }
  else
  {
    v6 = v4;
    v7 = v6;
  }

  return v7;
}

- (FCFDBPruningPolicy)pruningPolicy
{
  return self->_pruningPolicy;
}

- (int64_t)options
{
  return self->_options;
}

- (id)feedsForFeedIDs:(id)a3
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
  int64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  FCFDBFeed *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v5
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing fdb storage outside the access queue"));
    *(_DWORD *)buf = 136315906;
    v38 = "-[FCFDBStorage feedsForFeedIDs:]";
    v39 = 2080;
    v40 = "FCFDBStorage.m";
    v41 = 1024;
    v42 = 208;
    v43 = 2114;
    v44 = v27;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCFDBStorage cachedFeeds](self, "cachedFeeds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByRemovingKeysInDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    -[FCFDBStorage readDBConnection](self, "readDBConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectFeedsWithFeedIDs:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCFDBStorage _pruneFeedsIfNeeded:](self, "_pruneFeedsIfNeeded:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFDBStorage cachedFeeds](self, "cachedFeeds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addEntriesFromDictionary:", v10);

    objc_msgSend(v7, "fc_arrayByRemovingKeysInDictionary:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      v31 = v4;
      v13 = -[FCFDBStorage lastFeedLookupID](self, "lastFeedLookupID");
      v30 = v9;
      if (v13)
      {
        -[FCFDBStorage setLastFeedLookupID:](self, "setLastFeedLookupID:", v13);
      }
      else
      {
        -[FCFDBStorage readDBConnection](self, "readDBConnection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[FCFDBStorage setLastFeedLookupID:](self, "setLastFeedLookupID:", objc_msgSend(v14, "selectMaxFeedLookupID"));

      }
      v28 = v12;
      v29 = v10;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v33;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v19);
            -[FCFDBStorage setLastFeedLookupID:](self, "setLastFeedLookupID:", -[FCFDBStorage lastFeedLookupID](self, "lastFeedLookupID", v28, v29) + 1);
            v21 = -[FCFDBFeed initWithFeedID:feedLookupID:]([FCFDBFeed alloc], "initWithFeedID:feedLookupID:", v20, -[FCFDBStorage lastFeedLookupID](self, "lastFeedLookupID"));
            -[FCFDBStorage cachedFeeds](self, "cachedFeeds");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKey:", v21, v20);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v17);
      }

      -[FCFDBStorage modifiedFeedIDs](self, "modifiedFeedIDs");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObjectsFromArray:", v15);

      v9 = v30;
      v4 = v31;
      v12 = v28;
      v10 = v29;
    }

  }
  -[FCFDBStorage cachedFeeds](self, "cachedFeeds", v28, v29);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fc_subdictionaryForKeys:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (FCFDBConnectionReadable)readDBConnection
{
  return self->_readDBConnection;
}

void __32__FCFDBStorage_accessWithBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "cachedFeeds");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modifiedFeedIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nf_objectsForKeysWithoutMarker:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 32), "cachedFeeds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "prunedFeedIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nf_objectsForKeysWithoutMarker:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_msgSend(*(id *)(a1 + 32), "cachedFeedItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modifiedFeedItemIDs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nf_objectsForKeysWithoutMarker:", v16);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

  objc_msgSend(*(id *)(a1 + 32), "cachedFeeds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "copy");
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  objc_msgSend(*(id *)(a1 + 32), "modifiedFeedIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "prunedFeedIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "removeAllObjects");

  objc_msgSend(*(id *)(a1 + 32), "modifiedFeedItemIDs");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "removeAllObjects");

}

- (NSMutableDictionary)cachedFeeds
{
  return self->_cachedFeeds;
}

- (NSMutableSet)prunedFeedIDs
{
  return self->_prunedFeedIDs;
}

- (NSMutableSet)modifiedFeedItemIDs
{
  return self->_modifiedFeedItemIDs;
}

- (NSMutableSet)modifiedFeedIDs
{
  return self->_modifiedFeedIDs;
}

- (NSMutableDictionary)cachedFeedItems
{
  return self->_cachedFeedItems;
}

- (void)accessWithBlock:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD v9[9];
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__56;
  v34 = __Block_byref_object_dispose__56;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__56;
  v28 = __Block_byref_object_dispose__56;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__56;
  v22 = __Block_byref_object_dispose__56;
  v23 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__56;
  v16[4] = __Block_byref_object_dispose__56;
  v17 = 0;
  -[FCFDBStorage accessQueue](self, "accessQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__FCFDBStorage_accessWithBlock___block_invoke;
  block[3] = &unk_1E4647B80;
  v7 = v4;
  block[4] = self;
  v11 = v7;
  v12 = &v30;
  v13 = &v24;
  v14 = &v18;
  v15 = v16;
  dispatch_sync(v5, block);

  if (objc_msgSend((id)v31[5], "count") || objc_msgSend((id)v25[5], "count") || objc_msgSend((id)v19[5], "count"))
  {
    -[FCFDBStorage saveQueue](self, "saveQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __32__FCFDBStorage_accessWithBlock___block_invoke_2;
    v9[3] = &unk_1E4647BA8;
    v9[4] = self;
    v9[5] = &v18;
    v9[6] = v16;
    v9[7] = &v30;
    v9[8] = &v24;
    dispatch_async(v8, v9);

  }
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (id)initTransientWithOptions:(int64_t)a3
{
  return -[FCFDBStorage initWithPath:options:pruningPolicy:](self, "initWithPath:options:pruningPolicy:", CFSTR(":memory:"), a3, 0);
}

- (FCFDBStorage)initWithFileURL:(id)a3 options:(int64_t)a4
{
  void *v6;
  FCFDBStorage *v7;

  objc_msgSend(a3, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[FCFDBStorage initWithPath:options:pruningPolicy:](self, "initWithPath:options:pruningPolicy:", v6, a4, 0);

  return v7;
}

- (id)feedForFeedID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCFDBStorage cachedFeeds](self, "cachedFeeds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCFDBStorage feedsForFeedIDs:](self, "feedsForFeedIDs:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __32__FCFDBStorage_accessWithBlock___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  FCFDBConnection *v9;
  void *v10;
  FCFDBConnection *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id obj;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  _BYTE v42[128];
  _QWORD v43[4];

  v43[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D87C98]);
  objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v4;
  objc_msgSend(MEMORY[0x1E0D87C80], "attributeWithCompletionPolicy:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithExplanation:target:attributes:", CFSTR("News feed item storage write"), v3, v6);

  objc_msgSend(v7, "acquireWithError:", 0);
  objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = [FCFDBConnection alloc];
    objc_msgSend(*(id *)(a1 + 32), "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[FCFDBConnection initWithPath:](v9, "initWithPath:", v10);
    objc_msgSend(*(id *)(a1 + 32), "setWriteDBConnection:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "beginTransaction");

  objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertIndexesForFeedItems:knownFeedsByID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "insertFeedItems:knownFeedsByID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "insertFeeds:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertFeatureIndexesForFeedItems:knownFeedsByID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
  if ((objc_msgSend(*(id *)(a1 + 32), "options") & 4) != 0
    && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
  {
    v33 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v17)
    {
      v18 = v17;
      v35 = *(_QWORD *)v38;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v38 != v35)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v19);
          objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v20, "feedLookupID"));
          v22 = a1;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "trailingEmptyRegion");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "selectFeedItemIDsWithFeedLookupIDs:feedRange:feature:maxCount:", v24, v25, 0, 0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          a1 = v22;
          objc_msgSend(v36, "addObjectsFromArray:", v26);
          objc_msgSend(*(id *)(v22 + 32), "writeDBConnection");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v20, "feedLookupID"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "trailingEmptyRegion");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "deleteFeedItemIndexesFromFeedLookupID:feedRange:", v28, v29);

          ++v19;
        }
        while (v18 != v19);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v18);
    }

    objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "deleteFeedItemsWithIDs:", v36);

    objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "incrementalVacuum");

    v7 = v33;
  }
  objc_msgSend(*(id *)(a1 + 32), "writeDBConnection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commitTransaction");

  objc_msgSend(v7, "invalidateWithError:", 0);
}

- (id)feedItemsForFeedIDs:(id)a3 feedRange:(id)a4 feature:(id)a5 maxCountByFeed:(id)a6 totalMaxCount:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  unint64_t v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  FCFDBStorage *v50;
  _QWORD v51[4];
  id v52;
  FCFDBStorage *v53;
  id v54;
  _QWORD v55[5];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v16
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing fdb storage outside the access queue"));
    *(_DWORD *)buf = 136315906;
    v57 = "-[FCFDBStorage feedItemsForFeedIDs:feedRange:feature:maxCountByFeed:totalMaxCount:]";
    v58 = 2080;
    v59 = "FCFDBStorage.m";
    v60 = 1024;
    v61 = 242;
    v62 = 2114;
    v63 = v39;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v17 = MEMORY[0x1E0C809B0];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke;
  v55[3] = &unk_1E463C9B8;
  v55[4] = self;
  objc_msgSend(v12, "fc_arrayByTransformingWithBlock:", v55);
  v18 = objc_claimAutoreleasedReturnValue();
  -[FCFDBStorage readDBConnection](self, "readDBConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)v18;
  v43 = a7;
  objc_msgSend(v19, "selectFeedItemIDsWithFeedLookupIDs:feedRange:feature:maxCount:", v18, v13, v14, a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C99D20];
  v51[0] = v17;
  v51[1] = 3221225472;
  v51[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_2;
  v51[3] = &unk_1E463F098;
  v40 = v12;
  v52 = v40;
  v53 = self;
  v22 = v13;
  v54 = v22;
  objc_msgSend(v21, "fc_array:", v51);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v17;
  v46[1] = 3221225472;
  v46[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_4;
  v46[3] = &unk_1E4647C20;
  v24 = v15;
  v47 = v24;
  v25 = v23;
  v48 = v25;
  v26 = v20;
  v49 = v26;
  v50 = self;
  __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_4((uint64_t)v46);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFDBStorage cachedFeedItems](self, "cachedFeedItems");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fc_arrayByRemovingKeysInDictionary:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v30, "count"))
  {
    -[FCFDBStorage readDBConnection](self, "readDBConnection", v40);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "selectFeedItemsWithIDs:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCFDBStorage cachedFeedItems](self, "cachedFeedItems");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addEntriesFromDictionary:", v32);

  }
  -[FCFDBStorage cachedFeedItems](self, "cachedFeedItems", v40);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "allObjects");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "nf_mutableObjectsForKeysWithoutMarker:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_8;
    v44[3] = &unk_1E4647C48;
    v45 = v14;
    objc_msgSend(v36, "indexesOfObjectsPassingTest:", v44);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "removeObjectsAtIndexes:", v37);

  }
  objc_msgSend(v36, "sortUsingSelector:", sel_compareOrderDescending_);
  if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    objc_msgSend(v36, "fc_trimToMaxCount:");

  return v36;
}

uint64_t __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "_feedLookupIDForFeedID:", a2));
}

void __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_2(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id obj;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a1[4];
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        v9 = objc_msgSend(a1[5], "_feedLookupIDForFeedID:", v8);
        objc_msgSend(a1[5], "cachedFeedItemOrders");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_msgSend(a1[6], "nsRange");
        v14 = v13;
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_3;
        v16[3] = &unk_1E4647BD0;
        v17 = v3;
        v18 = v9;
        objc_msgSend(v11, "enumerateIndexesInRange:options:usingBlock:", v12, v14, 0, v16);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

}

void __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 40) | (a2 << 20));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

id __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 48));
    objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_135);
    v3 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_7;
    v21[3] = &unk_1E4647BF8;
    v21[4] = *(_QWORD *)(a1 + 56);
    objc_msgSend(v3, "fc_dictionaryByTransformingKeysWithBlock:", v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = v2;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "unsignedLongLongValue") & 0xFFFFF);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "unsignedIntegerValue");

          if (!v14 || objc_msgSend(v5, "countForObject:", v12) < v14)
          {
            objc_msgSend(v16, "addObject:", v11);
            objc_msgSend(v5, "addObject:", v12);
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v8);
    }

  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_5;
    v22[3] = &unk_1E463D4B8;
    v23 = *(id *)(a1 + 40);
    v24 = *(id *)(a1 + 48);
    __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_5((uint64_t)v22);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v23;
  }

  return v16;
}

id __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_5(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_arrayByAddingObjectsFromArray:toArray:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_6(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

uint64_t __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "_feedLookupIDForFeedID:", a2));
}

uint64_t __83__FCFDBStorage_feedItemsForFeedIDs_feedRange_feature_maxCountByFeed_totalMaxCount___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasFeature:", *(_QWORD *)(a1 + 32)) ^ 1;
}

- (void)insertFeedItems:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v5
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing fdb storage outside the access queue"));
    *(_DWORD *)buf = 136315906;
    v32 = "-[FCFDBStorage insertFeedItems:]";
    v33 = 2080;
    v34 = "FCFDBStorage.m";
    v35 = 1024;
    v36 = 336;
    v37 = 2114;
    v38 = v23;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "feedID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[FCFDBStorage _feedLookupIDForFeedID:](self, "_feedLookupIDForFeedID:", v11);

        v13 = objc_msgSend(v10, "order");
        -[FCFDBStorage cachedFeedItemOrders](self, "cachedFeedItemOrders");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "feedID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCFDBStorage cachedFeedItemOrders](self, "cachedFeedItemOrders");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "feedID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKey:", v16, v18);

        }
        objc_msgSend(v16, "addIndex:", objc_msgSend(v10, "order"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12 | (v13 << 20));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setObject:forKey:", v10, v19);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  -[FCFDBStorage cachedFeedItems](self, "cachedFeedItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addEntriesFromDictionary:", v25);

  -[FCFDBStorage modifiedFeedItemIDs](self, "modifiedFeedItemIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "allKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObjectsFromArray:", v22);

}

- (void)updateFeedID:(id)a3 refreshedFromOrder:(unint64_t)a4 refreshedToOrder:(unint64_t)a5 fetchedRange:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = (void *)FCFDBStorageAccessQueueUnique;
  if (dispatch_get_specific((const void *)FCFDBStorageAccessQueueUnique) != v12
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("accessing fdb storage outside the access queue"));
    v18 = 136315906;
    v19 = "-[FCFDBStorage updateFeedID:refreshedFromOrder:refreshedToOrder:fetchedRange:]";
    v20 = 2080;
    v21 = "FCFDBStorage.m";
    v22 = 1024;
    v23 = 367;
    v24 = 2114;
    v25 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v18, 0x26u);

  }
  -[FCFDBStorage feedForFeedID:](self, "feedForFeedID:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithRefreshedFromOrder:refreshedToOrder:newlyFetchedRange:", a4, a5, v11);
  -[FCFDBStorage cachedFeeds](self, "cachedFeeds");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v14, v10);

  -[FCFDBStorage modifiedFeedIDs](self, "modifiedFeedIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v10);

}

- (void)flushChanges
{
  NSObject *v2;

  -[FCFDBStorage saveQueue](self, "saveQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v2, &__block_literal_global_38_1);

}

- (int64_t)_feedLookupIDForFeedID:(id)a3
{
  void *v3;
  int64_t v4;

  -[FCFDBStorage feedForFeedID:](self, "feedForFeedID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "feedLookupID");

  return v4;
}

- (NSString)path
{
  return self->_path;
}

- (NSMutableDictionary)cachedFeedItemOrders
{
  return self->_cachedFeedItemOrders;
}

- (int64_t)lastFeedLookupID
{
  return self->_lastFeedLookupID;
}

- (void)setLastFeedLookupID:(int64_t)a3
{
  self->_lastFeedLookupID = a3;
}

- (OS_dispatch_queue)saveQueue
{
  return self->_saveQueue;
}

- (FCFDBConnectionWritable)writeDBConnection
{
  return self->_writeDBConnection;
}

- (void)setWriteDBConnection:(id)a3
{
  objc_storeStrong((id *)&self->_writeDBConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeDBConnection, 0);
  objc_storeStrong((id *)&self->_saveQueue, 0);
  objc_storeStrong((id *)&self->_prunedFeedIDs, 0);
  objc_storeStrong((id *)&self->_modifiedFeedIDs, 0);
  objc_storeStrong((id *)&self->_modifiedFeedItemIDs, 0);
  objc_storeStrong((id *)&self->_cachedFeedItems, 0);
  objc_storeStrong((id *)&self->_cachedFeedItemOrders, 0);
  objc_storeStrong((id *)&self->_cachedFeeds, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_readDBConnection, 0);
  objc_storeStrong((id *)&self->_pruningPolicy, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
