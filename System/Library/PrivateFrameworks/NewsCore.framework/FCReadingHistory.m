@implementation FCReadingHistory

- (unint64_t)likingStatusForArticleID:(id)a3
{
  void *v3;
  unint64_t v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "articleLikingStatus");

  return v4;
}

- (BOOL)hasArticleBeenMarkedAsOffensive:(id)a3
{
  void *v3;
  char v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasArticleBeenMarkedOffensive");

  return v4;
}

- (id)_readingHistoryItemForArticleID:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__1;
    v15 = __Block_byref_object_dispose__1;
    v16 = 0;
    v6 = *(id *)(a1 + 112);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__FCReadingHistory__readingHistoryItemForArticleID___block_invoke_2;
    v8[3] = &unk_1E463AD58;
    v10 = &v11;
    v8[4] = a1;
    v9 = v4;
    objc_msgSend(v6, "performReadSync:", v8);

    v5 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  return v5;
}

void __52__FCReadingHistory__readingHistoryItemForArticleID___block_invoke_2(uint64_t *a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[13];
  v3 = a1[5];
  v4 = v2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v8 = (_QWORD *)a1[4];
    if (v8)
      v8 = (_QWORD *)v8[12];
    v9 = a1[5];
    v10 = v8;
    FCHistoryItemIDFromArticleID(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    -[FCReadingHistory _cacheHistoryItemByArticleID:](a1[4], *(void **)(*(_QWORD *)(a1[6] + 8) + 40));
  }
}

- (void)_cacheHistoryItemByArticleID:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  v4 = v3;
  if (a1 && v3)
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      v5 = *(void **)(a1 + 112);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_2;
      v10[3] = &unk_1E463AD10;
      v10[4] = a1;
      v11 = v4;
      objc_msgSend(v5, "performWriteSync:", v10);
      v6 = v11;
    }
    else
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_3;
      v7[3] = &unk_1E463AD10;
      v8 = v4;
      v9 = a1;
      dispatch_async(MEMORY[0x1E0C80D38], v7);
      v6 = v8;
    }

  }
}

void __41__FCReadingHistory_allDislikedArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "allValues", (_QWORD)v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "articleLikingStatus") == 2)
        {
          v10 = *(void **)(a1 + 40);
          objc_msgSend(v9, "articleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __38__FCReadingHistory_allLikedArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "allValues", (_QWORD)v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "articleLikingStatus") == 1)
        {
          v10 = *(void **)(a1 + 40);
          objc_msgSend(v9, "articleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __44__FCReadingHistory_loadLocalCachesFromStore__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAllEntriesToDictionary:", v2);

  objc_msgSend((id)objc_opt_class(), "internalLocalStoreKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsForKeys:", v5);

  if ((objc_msgSend(*(id *)(a1 + 32), "isSyncingEnabled") & 1) == 0)
  {
    v6 = objc_msgSend(v2, "count");
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    objc_msgSend(v2, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__FCReadingHistory_loadLocalCachesFromStore__block_invoke_2;
    v15[3] = &unk_1E463AF50;
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v2;
    v17 = &v18;
    FCVisitLocallyPrunableHistoryItems(v7, v15);

    if (v19[3])
    {
      v8 = (id)FCPrivateDataLog;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v19[3];
        *(_DWORD *)buf = 138543874;
        v23 = v10;
        v24 = 2048;
        v25 = v11;
        v26 = 2048;
        v27 = v6;
        _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ pruned %lu of %lu history items", buf, 0x20u);

      }
    }

    _Block_object_dispose(&v18, 8);
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    objc_storeStrong((id *)(v12 + 96), v2);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    objc_storeStrong((id *)(v14 + 104), v13);

}

void __39__FCReadingHistory_readingHistoryItems__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v3 = v2;
  objc_msgSend(v3, "allValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v7, "copy");
  v5 = (void *)v4;
  if (v4)
    v6 = (void *)v4;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);

}

void __37__FCReadingHistory_allSeenArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "allValues", (_QWORD)v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasArticleBeenSeen"))
        {
          v10 = *(void **)(a1 + 40);
          objc_msgSend(v9, "articleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __37__FCReadingHistory_allReadArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "allValues", (_QWORD)v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasArticleBeenRead"))
        {
          v10 = *(void **)(a1 + 40);
          objc_msgSend(v9, "articleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

+ (BOOL)requiresHighPriorityFirstSync
{
  return 0;
}

- (id)localStoreMigrator
{
  return objc_alloc_init(FCReadingHistoryMigrator);
}

+ (void)populateLocalStoreClassRegistry:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "registerClass:", objc_opt_class());

}

+ (unint64_t)localStoreVersion
{
  return 9;
}

+ (id)localStoreFilename
{
  return CFSTR("history");
}

+ (void)configureKeyValueStoreForJSONHandling:(id)a3
{
  objc_msgSend(a3, "setJSONEncodingHandlersWithObjectHandler:arrayObjectHandler:dictionaryKeyHandler:dictionaryValueHandler:", &__block_literal_global_102, 0, 0, &__block_literal_global_104);
}

+ (id)commandStoreFileName
{
  return CFSTR("history-commands");
}

+ (int64_t)commandQueueUrgency
{
  return 0;
}

- (void)loadLocalCachesFromStore
{
  FCMTWriterLock *itemsLock;
  _QWORD v3[5];

  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__FCReadingHistory_loadLocalCachesFromStore__block_invoke;
  v3[3] = &unk_1E463AB18;
  v3[4] = self;
  -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v3);
}

- (NSArray)sortedVisitedArticleIDs
{
  void *v2;
  void *v3;

  -[FCReadingHistory _sortedReadingHistoryItemsWithMaxCount:](self, -1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayByTransformingWithBlock:", &__block_literal_global_47);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)_sortedReadingHistoryItemsWithMaxCount:(void *)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  char v23;
  _QWORD aBlock[4];
  char v25;

  if (a1)
  {
    objc_msgSend(a1, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleSubscriptionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleSubscription");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject((id)v6, (const void *)(v6 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    v9 = v8;
    objc_getAssociatedObject((id)v6, (const void *)~v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue") ^ v9;

    v12 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke;
    aBlock[3] = &__block_descriptor_33_e40___NSDate_16__0___FCReadingHistoryItem__8l;
    v25 = v11 & 1;
    v13 = _Block_copy(aBlock);
    objc_msgSend(a1, "readingHistoryItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke_2;
    v22[3] = &__block_descriptor_33_e32_B16__0___FCReadingHistoryItem__8l;
    v23 = v11 & 1;
    objc_msgSend(v14, "fc_arrayOfObjectsPassingTest:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke_3;
    v20[3] = &unk_1E463B070;
    v21 = v13;
    v16 = v13;
    objc_msgSend(v15, "sortedArrayUsingComparator:", v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fc_subarrayWithMaxCount:", a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (NSArray)sortedListenedArticleIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[FCReadingHistory readingHistoryItems](self, "readingHistoryItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_48_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_51_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)readingHistoryItems
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__FCReadingHistory_readingHistoryItems__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (void)addObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCReadingHistory;
  -[FCPrivateDataController addObserver:](&v3, sel_addObserver_, a3);
}

- (FCReadingHistory)initWithContext:(id)a3 pushNotificationCenter:(id)a4 storeDirectory:(id)a5
{
  FCReadingHistory *v5;
  FCMTWriterLock *v6;
  FCMTWriterLock *itemsLock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCReadingHistory;
  v5 = -[FCPrivateDataController initWithContext:pushNotificationCenter:storeDirectory:](&v9, sel_initWithContext_pushNotificationCenter_storeDirectory_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(FCMTWriterLock);
    itemsLock = v5->_itemsLock;
    v5->_itemsLock = v6;

  }
  return v5;
}

- (NSSet)allLikedArticleIDs
{
  void *v3;
  FCMTWriterLock *itemsLock;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__FCReadingHistory_allLikedArticleIDs__block_invoke;
  v9[3] = &unk_1E463AD10;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[FCMTWriterLock performReadSync:](itemsLock, "performReadSync:", v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

- (NSSet)allDislikedArticleIDs
{
  void *v3;
  FCMTWriterLock *itemsLock;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__FCReadingHistory_allDislikedArticleIDs__block_invoke;
  v9[3] = &unk_1E463AD10;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[FCMTWriterLock performReadSync:](itemsLock, "performReadSync:", v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

- (NSSet)allSeenArticleIDs
{
  void *v3;
  FCMTWriterLock *itemsLock;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__FCReadingHistory_allSeenArticleIDs__block_invoke;
  v9[3] = &unk_1E463AD10;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[FCMTWriterLock performReadSync:](itemsLock, "performReadSync:", v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

- (NSSet)allReadArticleIDs
{
  void *v3;
  FCMTWriterLock *itemsLock;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__FCReadingHistory_allReadArticleIDs__block_invoke;
  v9[3] = &unk_1E463AD10;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[FCMTWriterLock performReadSync:](itemsLock, "performReadSync:", v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

- (void)_addHistoryItems:(uint64_t)a1 addToStore:(void *)a2
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  char v7;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (v3)
  {
    v4 = *(void **)(a1 + 112);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__FCReadingHistory__addHistoryItems_addToStore___block_invoke;
    v5[3] = &unk_1E463B200;
    v5[4] = a1;
    v7 = 1;
    v6 = v3;
    objc_msgSend(v4, "performWriteSync:", v5);

  }
}

void __44__FCReadingHistory_loadLocalCachesFromStore__block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "localStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  v7 = (void *)a1[5];
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObjectForKey:", v8);
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
}

+ (BOOL)requiresPushNotificationSupport
{
  return 1;
}

+ (BOOL)requiresBatchedSync
{
  return 1;
}

+ (id)backingRecordZoneIDs
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C95098]);
  v3 = (void *)objc_msgSend(v2, "initWithZoneName:ownerName:", CFSTR("ReadingHistory"), *MEMORY[0x1E0C94730]);
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)backingRecordIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)commandsToMergeLocalDataToCloud:(id)a3 privateDataDirectory:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  FCModifyHistoryCommand *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  FCModifyHistoryCommand *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(a1, "isLocalStoreKeyInternal:", v12) & 1) == 0)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v9);
  }

  v14 = -[FCModifyHistoryCommand initWithHistoryItems:merge:]([FCModifyHistoryCommand alloc], "initWithHistoryItems:merge:", v6, 1);
  v21 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)handleSyncWithChangedRecords:(id)a3 deletedRecordNames:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSMutableDictionary *itemsByIdentifier;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  FCMTWriterLock *itemsLock;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t j;
  id v36;
  unint64_t v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  char v68;
  void *v69;
  void *v70;
  int v71;
  FCReadingHistorySyncResults *v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  id *v78;
  id *v79;
  id v80;
  id v81;
  id v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t k;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t m;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t n;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t ii;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  id v130;
  id obj;
  id v132;
  char v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  void *v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  uint8_t v177[128];
  _BYTE buf[24];
  __int128 v179;
  FCReadingHistory *v180;
  id v181;
  _BYTE v182[22];
  __int16 v183;
  int v184;
  __int16 v185;
  void *v186;
  uint64_t v187;

  v187 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v134 = (void *)objc_opt_new();
  v163 = 0u;
  v164 = 0u;
  v165 = 0u;
  v166 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v177, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v164;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v164 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * i);
        objc_msgSend(v12, "recordType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("ReadingHistoryItem"));

        if (v14)
          objc_msgSend(v134, "addObject:", v12);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v163, v177, 16);
    }
    while (v9);
  }

  v136 = (void *)objc_opt_new();
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v132 = v7;
  v15 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v159, v176, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v160;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v160 != v17)
          objc_enumerationMutation(v132);
        v19 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * v18);
        if (self)
          itemsByIdentifier = self->_itemsByIdentifier;
        else
          itemsByIdentifier = 0;
        -[NSMutableDictionary objectForKeyedSubscript:](itemsByIdentifier, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v159 + 1) + 8 * v18));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "articleID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v21, "articleID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "addObject:", v23);

        }
        objc_msgSend(v21, "articleID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v19;
        v26 = v24;
        if (self)
        {
          objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
          if (!v25 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "itemID != nil");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "-[FCReadingHistory _removeHistoryItemWithItemID:articleID:]";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "FCReadingHistory.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v179) = 1632;
            WORD2(v179) = 2114;
            *(_QWORD *)((char *)&v179 + 6) = v28;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

          }
          itemsLock = self->_itemsLock;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __59__FCReadingHistory__removeHistoryItemWithItemID_articleID___block_invoke;
          *(_QWORD *)&v179 = &unk_1E463B228;
          *((_QWORD *)&v179 + 1) = v25;
          v180 = self;
          v181 = v26;
          -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", buf);

        }
        ++v18;
      }
      while (v16 != v18);
      v29 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v159, v176, 16);
      v16 = v29;
    }
    while (v29);
  }

  v30 = v134;
  v124 = v30;
  v125 = v136;
  if (self)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v129 = (id)objc_opt_new();
    v127 = (id)objc_opt_new();
    v126 = (void *)objc_opt_new();
    v31 = (void *)objc_opt_new();
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v130 = v30;
    v32 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v167, buf, 16);
    v128 = v31;
    if (v32)
    {
      v33 = v32;
      v133 = 0;
      v137 = *(_QWORD *)v168;
      v34 = 0x1E0D62000uLL;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v168 != v137)
            objc_enumerationMutation(v130);
          v36 = *(id *)(*((_QWORD *)&v167 + 1) + 8 * j);
          objc_opt_self();
          if (!v36 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "record != nil");
            *(_DWORD *)v182 = 136315906;
            *(_QWORD *)&v182[4] = "+[NTPBReadingHistoryItem(FCReadingHistory) readingHistoryItemWithCKRecord:]";
            *(_WORD *)&v182[12] = 2080;
            *(_QWORD *)&v182[14] = "FCReadingHistory.m";
            v183 = 1024;
            v184 = 1742;
            v185 = 2114;
            v186 = v70;
            _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v182, 0x26u);

          }
          v37 = v34;
          v38 = objc_alloc_init(*(Class *)(v34 + 2024));
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("articleID"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setArticleID:", v39);

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("sourceChannelTagID"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setSourceChannelTagID:", v40);

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("deviceID"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setDeviceID:", v41);

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("lastVisited"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setLastVisitedAt:", v42);

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("articleRead"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setHasArticleBeenRead:", objc_msgSend(v43, "BOOLValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("articleSeen"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setHasArticleBeenSeen:", objc_msgSend(v44, "BOOLValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("articleConsumed"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setHasArticleBeenConsumed:", objc_msgSend(v45, "BOOLValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("offensive"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setHasArticleBeenMarkedOffensive:", objc_msgSend(v46, "BOOLValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("removedFromAudio"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setHasArticleBeenRemovedFromAudio:", objc_msgSend(v47, "BOOLValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("completedListening"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setHasArticleCompletedListening:", objc_msgSend(v48, "BOOLValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("completedReading"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setHasArticleCompletedReading:", objc_msgSend(v49, "BOOLValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("listenedCount"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setListenedCount:", (int)objc_msgSend(v50, "intValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("listeningProgress"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "doubleValue");
          objc_msgSend(v38, "setListeningProgress:");

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("listeningProgressLastSaved"));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setListeningProgressSavedAt:", v52);

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("lastListened"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setLastListenedAt:", v53);

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("readingPosition"));
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setReadingPosition:", v54);

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("readingPositionLastSaved"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setReadingPositionSavedAt:", v55);

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("readCount"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setReadCount:", (int)objc_msgSend(v56, "intValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("pruningDisabled"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setPruningDisabled:", objc_msgSend(v57, "BOOLValue"));

          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("liked"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "BOOLValue");

          if (v59)
            objc_msgSend(v38, "setArticleLikingStatus:", 1);
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("disliked"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "BOOLValue");

          if (v61)
            objc_msgSend(v38, "setArticleLikingStatus:", 2);

          objc_msgSend(v38, "articleID");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (v62)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsByArticleID, "objectForKeyedSubscript:", v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = v63;
            if (v63)
            {
              objc_msgSend(v63, "lastVisitedAt");
              v65 = objc_claimAutoreleasedReturnValue();
              if (v65)
              {
                v66 = (void *)v65;
                objc_msgSend(v38, "lastVisitedAt");
                v67 = (void *)objc_claimAutoreleasedReturnValue();

                if (v67)
                {
                  v68 = 0;
                }
                else
                {
                  objc_msgSend(v126, "addObject:", v62);
                  v68 = 1;
                }
                v31 = v128;
              }
              else
              {
                v68 = 0;
              }
              v133 |= v68;
              v69 = v129;
            }
            else
            {
              v69 = v127;
            }
            objc_msgSend(v69, "addObject:", v62);
            objc_msgSend(v31, "addObject:", v38);

          }
          v34 = v37;
        }
        v33 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v167, buf, 16);
      }
      while (v33);
    }
    else
    {
      v133 = 0;
    }

    -[FCReadingHistory _addHistoryItems:addToStore:]((uint64_t)self, v31);
    v71 = v133 & 1;
    v72 = [FCReadingHistorySyncResults alloc];
    if (v125)
      v73 = v125;
    else
      v73 = (id)MEMORY[0x1E0C9AA60];
    objc_msgSend(v126, "arrayByAddingObjectsFromArray:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v129;
    v76 = v74;
    v77 = v127;
    if (v72)
    {
      *(_QWORD *)v182 = v72;
      *(_QWORD *)&v182[8] = FCReadingHistorySyncResults;
      v78 = (id *)objc_msgSendSuper2((objc_super *)v182, sel_init);
      v79 = v78;
      if (v78)
      {
        objc_storeStrong(v78 + 1, v129);
        objc_storeStrong(v79 + 2, v74);
        objc_storeStrong(v79 + 3, v127);
      }
    }
    else
    {
      v79 = 0;
    }

  }
  else
  {
    v71 = 0;
    v79 = 0;
  }

  if (v79)
    v80 = v79[1];
  else
    v80 = 0;
  v81 = v80;
  objc_msgSend(v81, "arrayByAddingObjectsFromArray:", v125);
  v135 = v81;
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  if (v79)
    v82 = v79[3];
  else
    v82 = 0;
  v83 = v82;
  if (v71 || objc_msgSend(v125, "count"))
  {
    v157 = 0u;
    v158 = 0u;
    v155 = 0u;
    v156 = 0u;
    -[FCPrivateDataController observers](self, "observers");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = (void *)objc_msgSend(v84, "copy");

    v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v155, v175, 16);
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v156;
      do
      {
        v89 = 0;
        do
        {
          if (*(_QWORD *)v156 != v88)
            objc_enumerationMutation(v85);
          v90 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v89);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (v79)
              v91 = v79[2];
            else
              v91 = 0;
            objc_msgSend(v90, "readingHistory:didRemoveArticlesWithIDs:", self, v91);
          }
          ++v89;
        }
        while (v87 != v89);
        v92 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v155, v175, 16);
        v87 = v92;
      }
      while (v92);
    }

  }
  if (objc_msgSend(v83, "count"))
  {
    v153 = 0u;
    v154 = 0u;
    v151 = 0u;
    v152 = 0u;
    -[FCPrivateDataController observers](self, "observers");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = (void *)objc_msgSend(v93, "copy");

    v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v151, v174, 16);
    if (v95)
    {
      v96 = v95;
      v97 = *(_QWORD *)v152;
      do
      {
        for (k = 0; k != v96; ++k)
        {
          if (*(_QWORD *)v152 != v97)
            objc_enumerationMutation(v94);
          v99 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * k);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v99, "readingHistory:didAddArticlesWithIDs:", self, v83);
        }
        v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v151, v174, 16);
      }
      while (v96);
    }

  }
  if (objc_msgSend(v138, "count"))
  {
    v100 = (void *)objc_opt_new();
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v101 = v138;
    v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v147, v173, 16);
    if (v102)
    {
      v103 = v102;
      v104 = *(_QWORD *)v148;
      do
      {
        for (m = 0; m != v103; ++m)
        {
          if (*(_QWORD *)v148 != v104)
            objc_enumerationMutation(v101);
          objc_msgSend(v100, "setObject:forKeyedSubscript:", &unk_1E470A160, *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * m));
        }
        v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v147, v173, 16);
      }
      while (v103);
    }

    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    -[FCPrivateDataController observers](self, "observers");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)objc_msgSend(v106, "copy");

    v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v143, v172, 16);
    if (v108)
    {
      v109 = v108;
      v110 = *(_QWORD *)v144;
      do
      {
        for (n = 0; n != v109; ++n)
        {
          if (*(_QWORD *)v144 != v110)
            objc_enumerationMutation(v107);
          v112 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * n);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v112, "readingHistory:didChangeFeaturesForArticles:", self, v100);
        }
        v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v143, v172, 16);
      }
      while (v109);
    }

  }
  if (objc_msgSend(v132, "count"))
  {
    -[FCPrivateDataController context](self, "context");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "personalizationData");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "markAsDirty");

    -[FCPrivateDataController context](self, "context");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v115, "userEventHistory");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "markAsDirty");

    v141 = 0u;
    v142 = 0u;
    v139 = 0u;
    v140 = 0u;
    -[FCPrivateDataController observers](self, "observers");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = (void *)objc_msgSend(v117, "copy");

    v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v139, v171, 16);
    if (v119)
    {
      v120 = v119;
      v121 = *(_QWORD *)v140;
      do
      {
        for (ii = 0; ii != v120; ++ii)
        {
          if (*(_QWORD *)v140 != v121)
            objc_enumerationMutation(v118);
          v123 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * ii);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v123, "readingHistoryLikelyClearedRemotely:", self);
        }
        v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v139, v171, 16);
      }
      while (v120);
    }

  }
}

- (id)allKnownRecordNamesWithinRecordZoneWithID:(id)a3
{
  NSMutableDictionary *itemsByIdentifier;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3);
  if (self)
    itemsByIdentifier = self->_itemsByIdentifier;
  else
    itemsByIdentifier = 0;
  return (id)-[NSMutableDictionary allKeys](itemsByIdentifier, "allKeys");
}

- (void)removeObserver:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FCReadingHistory;
  -[FCPrivateDataController removeObserver:](&v3, sel_removeObserver_, a3);
}

- (BOOL)canHelpRestoreZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("ReadingHistory"));
}

- (id)recordsForRestoringZoneName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[FCReadingHistory readingHistoryItems](self, "readingHistoryItems", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _FCPruneHistoryForUpload(v3, &__block_literal_global_105, &__block_literal_global_9_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_arrayByTransformingWithBlock:", &__block_literal_global_3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __48__FCReadingHistory_recordsForRestoringZoneName___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "asCKRecord");
}

- (BOOL)canHelpPruneZoneName:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("ReadingHistory"));
}

- (id)pruneRecords:(id)a3 forZoneName:(id)a4
{
  return _FCPruneHistoryForUpload(a3, &__block_literal_global_11_1, &__block_literal_global_13);
}

- (double)softMaxRecordAgeWhenMigratingZoneName:(id)a3
{
  return 2419200.0;
}

- (unint64_t)softMaxRecordCountWhenMigratingZoneName:(id)a3
{
  return 1000;
}

- (id)historyItemsForArticleIDs:(id)a3
{
  void *v3;
  void *v4;

  -[FCReadingHistory historyItemsByArticleIDForArticleIDs:](self, "historyItemsByArticleIDForArticleIDs:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)historyItemsByArticleIDForArticleIDs:(id)a3
{
  id v4;
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    v17 = 0;
    if (self)
      itemsLock = self->_itemsLock;
    else
      itemsLock = 0;
    v6 = itemsLock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__FCReadingHistory_historyItemsByArticleIDForArticleIDs___block_invoke_39;
    v9[3] = &unk_1E463AFC0;
    v9[4] = self;
    v10 = v4;
    v11 = &v12;
    -[FCMTWriterLock performReadSync:](v6, "performReadSync:", v9);

    v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

void __57__FCReadingHistory_historyItemsByArticleIDForArticleIDs___block_invoke_39(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;

  v2 = (_QWORD *)a1[4];
  if (v2)
    v2 = (_QWORD *)v2[13];
  v3 = a1[5];
  v4 = v2;
  objc_msgSend(v4, "fc_subdictionaryForKeys:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  if (v6 == objc_msgSend((id)a1[5], "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v5);
  }
  else
  {
    v7 = (void *)a1[5];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__FCReadingHistory_historyItemsByArticleIDForArticleIDs___block_invoke_2;
    v13[3] = &unk_1E463AF98;
    v8 = v5;
    v9 = a1[4];
    v14 = v8;
    v15 = v9;
    objc_msgSend(v7, "fc_dictionaryWithValueBlock:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

id __57__FCReadingHistory_historyItemsByArticleIDForArticleIDs___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = *(_QWORD **)(a1 + 40);
    if (v5)
      v5 = (_QWORD *)v5[12];
    v6 = v5;
    FCHistoryItemIDFromArticleID((uint64_t)v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCReadingHistory _cacheHistoryItemByArticleID:](*(_QWORD *)(a1 + 40), v4);
  }

  return v4;
}

- (id)mostRecentlyReadArticlesWithMaxCount:(unint64_t)a3
{
  return -[FCReadingHistory _sortedReadingHistoryItemsWithMaxCount:](self, a3);
}

- (id)mostRecentlyCompletedListeningArticlesWithMaxCount:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("lastListenedAt"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = &__block_literal_global_45;
    v7 = v5;
    -[FCReadingHistory readingHistoryItems](self, "readingHistoryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_45);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sortedArrayUsingDescriptors:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fc_subarrayWithMaxCount:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __71__FCReadingHistory_mostRecentlyCompletedListeningArticlesWithMaxCount___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasArticleCompletedListening");
}

uint64_t __43__FCReadingHistory_sortedVisitedArticleIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

- (id)sortedVisitedArticleIDsSatisfying:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[FCReadingHistory _sortedReadingHistoryItemsWithMaxCount:](self, -1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__FCReadingHistory_sortedVisitedArticleIDsSatisfying___block_invoke;
  v9[3] = &unk_1E463AFE8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "fc_arrayByTransformingWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __54__FCReadingHistory_sortedVisitedArticleIDsSatisfying___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_msgSend(v3, "articleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

BOOL __44__FCReadingHistory_sortedListenedArticleIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "lastListenedAt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __44__FCReadingHistory_sortedListenedArticleIDs__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "lastListenedAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastListenedAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __44__FCReadingHistory_sortedListenedArticleIDs__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

id __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 32);
  objc_msgSend(v3, "lastVisitedAt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "lastListenedAt");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "fc_isLaterThanOrEqualTo:", v6) & 1) != 0)
      objc_msgSend(v3, "lastVisitedAt");
    else
      objc_msgSend(v3, "lastListenedAt");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }

  return v5;
}

BOOL __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  _BOOL8 v7;
  void *v8;

  v3 = a2;
  v4 = *(unsigned __int8 *)(a1 + 32);
  objc_msgSend(v3, "lastVisitedAt");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4)
  {
    if (v5)
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "lastListenedAt");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8 != 0;

    }
  }
  else
  {
    v7 = v5 != 0;
  }

  return v7;
}

uint64_t __59__FCReadingHistory__sortedReadingHistoryItemsWithMaxCount___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "compare:", v9);
  return v10;
}

- (NSSet)allConsumedArticleIDs
{
  void *v3;
  FCMTWriterLock *itemsLock;
  id v5;
  void *v6;
  NSSet *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__FCReadingHistory_allConsumedArticleIDs__block_invoke;
  v9[3] = &unk_1E463AD10;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[FCMTWriterLock performReadSync:](itemsLock, "performReadSync:", v9);
  v6 = v10;
  v7 = (NSSet *)v5;

  return v7;
}

void __41__FCReadingHistory_allConsumedArticleIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "allValues", (_QWORD)v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "hasArticleBeenConsumed"))
        {
          v10 = *(void **)(a1 + 40);
          objc_msgSend(v9, "articleID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (NSDictionary)readingHistoryItemsByArticleID
{
  FCMTWriterLock *itemsLock;
  FCMTWriterLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__1;
  v12 = __Block_byref_object_dispose__1;
  v13 = 0;
  if (self)
    itemsLock = self->_itemsLock;
  else
    itemsLock = 0;
  v4 = itemsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__FCReadingHistory_readingHistoryItemsByArticleID__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[FCMTWriterLock performReadSync:](v4, "performReadSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

void __50__FCReadingHistory_readingHistoryItemsByArticleID__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v6 = v2;
  objc_msgSend(v6, "fc_dictionaryByTransformingKeysWithKeyAndValueBlock:", &__block_literal_global_57);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __50__FCReadingHistory_readingHistoryItemsByArticleID__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "articleID");
}

- (id)consumedArticleIDsForTagID:(id)a3 fromTime:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCReadingHistory readingHistoryItems](self, "readingHistoryItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__FCReadingHistory_consumedArticleIDsForTagID_fromTime___block_invoke;
  v16[3] = &unk_1E463B0B8;
  v17 = v6;
  v18 = v7;
  v10 = v8;
  v19 = v10;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
  v13 = v19;
  v14 = v10;

  return v14;
}

void __56__FCReadingHistory_consumedArticleIDsForTagID_fromTime___block_invoke(_QWORD *a1, void *a2)
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "hasArticleBeenConsumed");
  v4 = v11;
  if (v3)
  {
    objc_msgSend(v11, "sourceChannelTagID");
    v5 = objc_claimAutoreleasedReturnValue();
    v4 = v11;
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v11, "sourceChannelTagID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", a1[4]) & 1) == 0)
      {

        goto LABEL_7;
      }
      objc_msgSend(v11, "lastVisitedAt");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "fc_isLaterThan:", a1[5]);

      v4 = v11;
      if (v9)
      {
        v10 = (void *)a1[6];
        objc_msgSend(v11, "articleID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v6);
LABEL_7:

        v4 = v11;
      }
    }
  }

}

- (id)lastVisitedDateForArticleID:(id)a3
{
  void *v3;
  void *v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastVisitedAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasArticleBeenRead:(id)a3
{
  void *v3;
  char v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasArticleBeenRead");

  return v4;
}

- (BOOL)hasArticleBeenReadMoreThanThreshold:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "readCount");
  -[FCPrivateDataController context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appConfigurationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v5 > objc_msgSend(v8, "articleReadCountThreshold");

  return v5;
}

- (BOOL)hasArticleBeenVisited:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastVisitedAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)hasArticleBeenSeen:(id)a3
{
  void *v3;
  char v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasArticleBeenSeen");

  return v4;
}

- (BOOL)markArticleAsSeenWithHeadline:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v10 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCReadingHistory markArticlesAsSeenWithHeadlines:rememberForever:](self, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count", v10, v11) != 0;

  return v8;
}

- (id)markArticlesAsSeenWithHeadlines:(int)a3 rememberForever:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  FCModifyHistoryCommand *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v36;
  id obj;
  id v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v38 = 0;
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v36 = v5;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (!v6)
    goto LABEL_24;
  v7 = v6;
  v8 = *(_QWORD *)v47;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v47 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v9);
      objc_msgSend(v10, "articleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)a1, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v12, "mutableCopyWithZone:", 0);

      if (!v13)
      {
        v13 = objc_alloc_init(MEMORY[0x1E0D627E8]);
        objc_msgSend(v10, "articleID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setArticleID:", v14);

      }
      v45 = 0;
      v15 = v10;
      v16 = v13;
      if (!v15 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "headline");
        *(_DWORD *)buf = 136315906;
        v53 = "-[FCReadingHistory _markArticleAsSeenWithHeadline:rememberForever:historyItem:modifiedHistoryFeaturesOut:]";
        v54 = 2080;
        v55 = "FCReadingHistory.m";
        v56 = 1024;
        v57 = 917;
        v58 = 2114;
        v59 = v24;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        if (v16)
          goto LABEL_14;
      }
      else if (v16)
      {
        goto LABEL_14;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item");
        *(_DWORD *)buf = 136315906;
        v53 = "-[FCReadingHistory _markArticleAsSeenWithHeadline:rememberForever:historyItem:modifiedHistoryFeaturesOut:]";
        v54 = 2080;
        v55 = "FCReadingHistory.m";
        v56 = 1024;
        v57 = 918;
        v58 = 2114;
        v59 = v25;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
LABEL_14:
      objc_msgSend(v15, "articleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "articleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      if ((v19 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "[headline.articleID isEqualToString:item.articleID]");
        *(_DWORD *)buf = 136315906;
        v53 = "-[FCReadingHistory _markArticleAsSeenWithHeadline:rememberForever:historyItem:modifiedHistoryFeaturesOut:]";
        v54 = 2080;
        v55 = "FCReadingHistory.m";
        v56 = 1024;
        v57 = 919;
        v58 = 2114;
        v59 = v23;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      objc_msgSend(v15, "articleID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]((uint64_t)a1, v20, a3, objc_msgSend(v15, "publisherArticleVersion"), v16, &v45);

      if (v45)
      {
        objc_msgSend(v38, "addObject:", v15);
        objc_msgSend(v39, "addObject:", v16);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "articleID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKey:", v21, v22);

      }
      ++v9;
    }
    while (v7 != v9);
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    v7 = v26;
  }
  while (v26);
LABEL_24:

  -[FCReadingHistory _addHistoryItems:addToStore:]((uint64_t)a1, v39);
  v27 = -[FCModifyHistoryCommand initWithHistoryItems:merge:]([FCModifyHistoryCommand alloc], "initWithHistoryItems:merge:", v39, 0);
  objc_msgSend(a1, "addCommandToCommandQueue:", v27);
  if (objc_msgSend(v40, "count"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(a1, "observers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "copy");

    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v42 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v34, "readingHistory:didChangeFeaturesForArticles:", a1, v40);
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v31);
    }

  }
  v5 = v36;
LABEL_36:

  return v38;
}

- (BOOL)markArticleAsSeenWithHeadline:(id)a3 rememberForever:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a4;
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCReadingHistory markArticlesAsSeenWithHeadlines:rememberForever:](self, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count", v12, v13) != 0;

  return v10;
}

- (id)markArticlesAsSeenWithHeadlines:(id)a3
{
  return -[FCReadingHistory markArticlesAsSeenWithHeadlines:rememberForever:](self, a3, 0);
}

- (BOOL)hasArticleCompletedListening:(id)a3
{
  void *v3;
  char v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasArticleCompletedListening");

  return v4;
}

- (BOOL)markArticle:(id)a3 withCompletedListening:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  _QWORD v9[4];
  BOOL v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v7 = -[FCReadingHistory hasArticleCompletedListening:](self, "hasArticleCompletedListening:", v6) ^ v4;
  if (v7 == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __55__FCReadingHistory_markArticle_withCompletedListening___block_invoke;
    v9[3] = &__block_descriptor_33_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    v10 = v4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v9);
  }

  return v7;
}

void __55__FCReadingHistory_markArticle_withCompletedListening___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  int v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(v7, "hasArticleCompletedListening");
  v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != v5)
  {
    objc_msgSend(v7, "setHasArticleCompletedListening:", v6 != 0);
    *a3 = 0x2000;
  }

}

- (void)_modifyHistoryForArticleID:(void *)a3 withBlock:
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;
  void *v10;
  FCModifyHistoryCommand *v11;
  void *v12;
  FCModifyHistoryCommand *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD, _QWORD, _QWORD);
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  id v32;
  void *v33;
  id v34;
  id v35;
  _BYTE buf[12];
  __int16 v37;
  char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  if (!a1)
    goto LABEL_24;
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID != nil");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCReadingHistory _modifyHistoryForArticleID:withBlock:]";
      v37 = 2080;
      v38 = "FCReadingHistory.m";
      v39 = 1024;
      v40 = 1526;
      v41 = 2114;
      v42 = v23;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    if (v7)
      goto LABEL_23;
    goto LABEL_21;
  }
  if (!v6)
  {
LABEL_21:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "modifyBlock != nil");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCReadingHistory _modifyHistoryForArticleID:withBlock:]";
      v37 = 2080;
      v38 = "FCReadingHistory.m";
      v39 = 1024;
      v40 = 1527;
      v41 = 2114;
      v42 = v24;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
LABEL_23:
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)a1, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopyWithZone:", 0);

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D627E8]);
    objc_msgSend(v9, "setArticleID:", v5);
  }
  *(_QWORD *)buf = 0;
  ((void (**)(_QWORD, id, _BYTE *))v7)[2](v7, v9, buf);
  v35 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCReadingHistory _addHistoryItems:addToStore:]((uint64_t)a1, v10);

  v11 = [FCModifyHistoryCommand alloc];
  v34 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[FCModifyHistoryCommand initWithHistoryItems:merge:](v11, "initWithHistoryItems:merge:", v12, 0);

  objc_msgSend(a1, "addCommandToCommandQueue:", v13);
  if (*(_QWORD *)buf)
  {
    v25 = v7;
    v26 = v5;
    v32 = v5;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(a1, "observers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "readingHistory:didChangeFeaturesForArticles:", a1, v15);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v19);
    }

    v7 = v25;
    v5 = v26;
  }

LABEL_24:
}

- (BOOL)hasArticleCompletedReading:(id)a3
{
  void *v3;
  char v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasArticleCompletedReading");

  return v4;
}

- (BOOL)markArticle:(id)a3 withCompletedReading:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  _QWORD v9[4];
  BOOL v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v7 = -[FCReadingHistory hasArticleCompletedReading:](self, "hasArticleCompletedReading:", v6) ^ v4;
  if (v7 == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__FCReadingHistory_markArticle_withCompletedReading___block_invoke;
    v9[3] = &__block_descriptor_33_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    v10 = v4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v9);
  }

  return v7;
}

void __53__FCReadingHistory_markArticle_withCompletedReading___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  int v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(v7, "hasArticleCompletedReading");
  v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != v5)
  {
    objc_msgSend(v7, "setHasArticleCompletedReading:", v6 != 0);
    *a3 = 0x10000;
  }

}

- (BOOL)hasArticleBeenRemovedFromAudio:(id)a3
{
  void *v3;
  char v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasArticleBeenRemovedFromAudio");

  return v4;
}

- (BOOL)markArticle:(id)a3 withRemovedFromAudio:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  _QWORD v9[4];
  BOOL v10;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v7 = -[FCReadingHistory hasArticleBeenRemovedFromAudio:](self, "hasArticleBeenRemovedFromAudio:", v6) ^ v4;
  if (v7 == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__FCReadingHistory_markArticle_withRemovedFromAudio___block_invoke;
    v9[3] = &__block_descriptor_33_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    v10 = v4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v9);
  }

  return v7;
}

void __53__FCReadingHistory_markArticle_withRemovedFromAudio___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  int v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(v7, "hasArticleBeenRemovedFromAudio");
  v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != v5)
  {
    objc_msgSend(v7, "setHasArticleBeenRemovedFromAudio:", v6 != 0);
    *a3 = 0x20000;
  }

}

- (void)_markArticleAsSeenWithArticleID:(int)a3 rememberForever:(uint64_t)a4 articleVersion:(void *)a5 historyItem:(uint64_t *)a6 modifiedHistoryFeaturesOut:
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (!a1)
    goto LABEL_22;
  v12 = (void *)MEMORY[0x1E0CB3978];
  v13 = a2;
  objc_msgSend(v12, "isMainThread");
  if (!v13 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]";
    v25 = 2080;
    v26 = "FCReadingHistory.m";
    v27 = 1024;
    v28 = 936;
    v29 = 2114;
    v30 = v20;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v11)
      goto LABEL_7;
  }
  else if (v11)
  {
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "item");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]";
    v25 = 2080;
    v26 = "FCReadingHistory.m";
    v27 = 1024;
    v28 = 937;
    v29 = 2114;
    v30 = v21;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_7:
  objc_msgSend(v11, "articleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "[articleID isEqualToString:item.articleID]");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]";
    v25 = 2080;
    v26 = "FCReadingHistory.m";
    v27 = 1024;
    v28 = 938;
    v29 = 2114;
    v30 = v19;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (a6)
      goto LABEL_12;
  }
  else if (a6)
  {
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "modifiedHistoryFeaturesOut");
    *(_DWORD *)buf = 136315906;
    v24 = "-[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:]";
    v25 = 2080;
    v26 = "FCReadingHistory.m";
    v27 = 1024;
    v28 = 939;
    v29 = 2114;
    v30 = v22;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_12:
  v16 = objc_msgSend(v11, "hasArticleBeenSeen");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v16 & 1) == 0)
  {
    objc_msgSend(v11, "setHasArticleBeenSeen:", 1);
    objc_msgSend(v11, "setFirstSeenAt:", v17);
    v18 = 9;
    if (!a3)
      goto LABEL_18;
LABEL_16:
    if ((objc_msgSend(v11, "isPruningDisabled") & 1) == 0)
    {
      objc_msgSend(v11, "setPruningDisabled:", 1);
      v18 |= 0x8000uLL;
    }
    goto LABEL_18;
  }
  v18 = 0;
  if (a3)
    goto LABEL_16;
LABEL_18:
  if (!v16 || objc_msgSend(v11, "maxVersionSeen") < a4)
  {
    objc_msgSend(v11, "setMaxVersionSeen:", a4);
    objc_msgSend(v11, "setFirstSeenAtOfMaxVersionSeen:", v17);
    v18 |= 0x90uLL;
  }
  *a6 = v18;

LABEL_22:
}

- (BOOL)markArticle:(id)a3 withLikingStatus:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  _QWORD v9[5];

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  v7 = -[FCReadingHistory likingStatusForArticleID:](self, "likingStatusForArticleID:", v6);
  if (v7 != a4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__FCReadingHistory_markArticle_withLikingStatus___block_invoke;
    v9[3] = &__block_descriptor_40_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    v9[4] = a4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v9);
  }

  return v7 != a4;
}

void __49__FCReadingHistory_markArticle_withLikingStatus___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "articleLikingStatus") != *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v5, "setArticleLikingStatus:");
    *a3 = 32;
  }

}

- (void)_markArticle:(uint64_t)a3 withLikingStatus:
{
  void *v5;
  id v6;
  _QWORD v7[5];

  if (a1)
  {
    v5 = (void *)MEMORY[0x1E0CB3978];
    v6 = a2;
    objc_msgSend(v5, "isMainThread");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__FCReadingHistory__markArticle_withLikingStatus___block_invoke;
    v7[3] = &__block_descriptor_40_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    v7[4] = a3;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](a1, v6, v7);

  }
}

uint64_t __50__FCReadingHistory__markArticle_withLikingStatus___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "setArticleLikingStatus:", *(_QWORD *)(a1 + 32));
  *a3 = 32;
  return result;
}

- (BOOL)toggleLikeForArticleWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;

  v4 = a3;
  -[FCPrivateDataController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appConfigurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
    goto LABEL_9;
  -[FCPrivateDataController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appConfigurationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "likeDislikeBehavior");

  if (v12 == 2)
    goto LABEL_7;
  if (v12 != 1)
  {
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v13 = -[FCReadingHistory likingStatusForArticleID:](self, "likingStatusForArticleID:", v4);
  if (v13 == 2)
    goto LABEL_7;
  v14 = 0;
  if (v13 == 1)
  {
    v15 = 0;
    goto LABEL_8;
  }
  if (!v13)
  {
LABEL_7:
    v15 = 1;
    v14 = 1;
LABEL_8:
    -[FCReadingHistory _markArticle:withLikingStatus:](self, v4, v15);
  }
LABEL_10:

  return v14;
}

- (BOOL)toggleDislikeForArticleWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  BOOL v14;

  v4 = a3;
  -[FCPrivateDataController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appConfigurationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
    goto LABEL_6;
  -[FCPrivateDataController context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appConfigurationManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "likeDislikeBehavior");

  if (v12 == 2)
  {
    v14 = 1;
    goto LABEL_10;
  }
  if (v12 == 1)
  {
    v13 = -[FCReadingHistory likingStatusForArticleID:](self, "likingStatusForArticleID:", v4);
    if (v13 < 2)
    {
      v14 = 1;
      v12 = 2;
LABEL_10:
      -[FCReadingHistory _markArticle:withLikingStatus:](self, v4, v12);
      goto LABEL_11;
    }
    v14 = 0;
    if (v13 == 2)
    {
      v12 = 0;
      goto LABEL_10;
    }
  }
  else
  {
LABEL_6:
    v14 = 0;
  }
LABEL_11:

  return v14;
}

- (BOOL)toggleArticleHasBeenMarkedAsOffensive:(id)a3
{
  id v4;
  _BOOL8 v5;

  v4 = a3;
  v5 = -[FCReadingHistory hasArticleBeenMarkedAsOffensive:](self, "hasArticleBeenMarkedAsOffensive:", v4) ^ 1;
  -[FCReadingHistory markArticle:asOffensive:](self, "markArticle:asOffensive:", v4, v5);

  return v5;
}

- (void)markArticle:(id)a3 asOffensive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  BOOL v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (-[FCReadingHistory hasArticleBeenMarkedAsOffensive:](self, "hasArticleBeenMarkedAsOffensive:", v6) != v4)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __44__FCReadingHistory_markArticle_asOffensive___block_invoke;
    v19[3] = &__block_descriptor_33_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
    v20 = v4;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v6, v19);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[FCPrivateDataController observers](self, "observers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v21 = v6;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "readingHistory:didChangeOffensiveStateForArticlesWithIDs:", self, v14);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v22, 16);
      }
      while (v10);
    }

  }
}

void __44__FCReadingHistory_markArticle_asOffensive___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  int v5;
  int v6;
  id v7;

  v7 = a2;
  v5 = objc_msgSend(v7, "hasArticleBeenMarkedOffensive");
  v6 = *(unsigned __int8 *)(a1 + 32);
  if (v6 != v5)
  {
    objc_msgSend(v7, "setHasArticleBeenMarkedOffensive:", v6 != 0);
    *a3 = 512;
  }

}

- (BOOL)hasArticleBeenConsumed:(id)a3
{
  void *v3;
  char v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasArticleBeenConsumed");

  return v4;
}

- (void)markArticle:(id)a3 asArticleConsumed:(BOOL)a4 sourceChannelTagID:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (-[FCReadingHistory hasArticleBeenConsumed:](self, "hasArticleBeenConsumed:", v8) != v6)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__FCReadingHistory_markArticle_asArticleConsumed_sourceChannelTagID___block_invoke;
    v10[3] = &unk_1E463B120;
    v12 = v6;
    v11 = v9;
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v8, v10);

  }
}

void __69__FCReadingHistory_markArticle_asArticleConsumed_sourceChannelTagID___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  int v5;
  int v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(v8, "hasArticleBeenConsumed");
  v6 = *(unsigned __int8 *)(a1 + 40);
  if (v6 != v5)
  {
    objc_msgSend(v8, "setHasArticleBeenConsumed:", v6 != 0);
    if (*(_QWORD *)(a1 + 32))
    {
      FCDeviceIdentifierForVendor();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDeviceID:", v7);
      objc_msgSend(v8, "setSourceChannelTagID:", *(_QWORD *)(a1 + 32));

    }
    *a3 = 256;
  }

}

- (BOOL)markArticleAsReadWithArticleID:(id)a3 articleVersion:(int64_t)a4 readDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  FCReadingHistory *v15;
  id v16;
  uint64_t *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__FCReadingHistory_markArticleAsReadWithArticleID_articleVersion_readDate___block_invoke;
  v13[3] = &unk_1E463B148;
  v10 = v9;
  v18 = a4;
  v14 = v10;
  v15 = self;
  v11 = v8;
  v16 = v11;
  v17 = &v19;
  -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v11, v13);
  LOBYTE(self) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

void __75__FCReadingHistory_markArticleAsReadWithArticleID_articleVersion_readDate___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  char v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "setLastVisitedAt:", *(_QWORD *)(a1 + 32));
  v5 = objc_msgSend(v7, "hasArticleBeenRead");
  if ((v5 & 1) != 0)
  {
    v6 = 4;
  }
  else
  {
    objc_msgSend(v7, "setHasArticleBeenRead:", 1);
    v6 = 6;
  }
  if (objc_msgSend(v7, "maxVersionRead") < *(_QWORD *)(a1 + 64))
  {
    objc_msgSend(v7, "setMaxVersionRead:");
    v6 |= 0x40uLL;
  }
  objc_msgSend(v7, "setReadCount:", objc_msgSend(v7, "readCount") + 1);
  -[FCReadingHistory _markArticleAsSeenWithArticleID:rememberForever:articleVersion:historyItem:modifiedHistoryFeaturesOut:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48), 0, *(_QWORD *)(a1 + 64), v7, a3);
  *a3 = v6 | 0x4000;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v5 ^ 1;

}

- (void)markArticleAsReadWithHeadline:(id)a3 fromGroupType:(int64_t)a4 swipedToArticle:(BOOL)a5 onScreenChecker:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  _BOOL4 v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v30 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  v10 = v8;
  v31 = v9;
  objc_msgSend(v8, "articleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "articleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "publisherArticleVersion");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = -[FCReadingHistory markArticleAsReadWithArticleID:articleVersion:readDate:](self, "markArticleAsReadWithArticleID:articleVersion:readDate:", v12, v13, v14);

    if ((_DWORD)v13)
    {
      v27 = v11;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      -[FCPrivateDataController observers](self, "observers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v8;
      v16 = objc_msgSend(v15, "copy");

      v17 = (void *)v16;
      v18 = (void *)v16;
      v10 = v28;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v23, "readingHistory:didAddHeadline:fromGroupType:swipedToArticle:withOnScreenChecker:", self, v10, a4, v30, v31);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v10, "articleID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v24;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "readingHistory:didAddArticlesWithIDs:", self, v25);

              v10 = v28;
            }
          }
          v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v20);
      }

      v11 = v27;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "articleID");
    *(_DWORD *)buf = 136315906;
    v39 = "-[FCReadingHistory markArticleAsReadWithHeadline:fromGroupType:swipedToArticle:onScreenChecker:]";
    v40 = 2080;
    v41 = "FCReadingHistory.m";
    v42 = 1024;
    v43 = 1215;
    v44 = 2114;
    v45 = v26;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (void)markArticleAsReadWithHeadline:(id)a3
{
  -[FCReadingHistory markArticleAsReadWithHeadline:fromGroupType:swipedToArticle:onScreenChecker:](self, "markArticleAsReadWithHeadline:fromGroupType:swipedToArticle:onScreenChecker:", a3, 0, 0, 0);
}

- (void)removeArticleFromHistory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  uint8_t v20[128];
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "articleID");
    *(_DWORD *)buf = 136315906;
    v22 = "-[FCReadingHistory removeArticleFromHistory:]";
    v23 = 2080;
    v24 = "FCReadingHistory.m";
    v25 = 1024;
    v26 = 1248;
    v27 = 2114;
    v28 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, v4, &__block_literal_global_87);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[FCPrivateDataController observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          if (v4)
          {
            v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v19 = v4;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "readingHistory:didRemoveArticlesWithIDs:", self, v13);

            }
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

  }
}

void __45__FCReadingHistory_removeArticleFromHistory___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  id v13;

  v4 = a2;
  v5 = (void *)MEMORY[0x1E0DE7910];
  v13 = v4;
  objc_msgSend(v4, "lastVisitedAt");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "nf_object:isEqualToObject:", v6, 0);

  v7 = 0;
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v13, "setLastVisitedAt:", 0);
    v7 = 4;
  }
  v8 = (void *)MEMORY[0x1E0DE7910];
  objc_msgSend(v13, "readingPosition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v8, "nf_object:isEqualToObject:", v9, 0);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v13, "setReadingPosition:", 0);
    v7 |= 0x1000uLL;
  }
  v10 = (void *)MEMORY[0x1E0DE7910];
  objc_msgSend(v13, "lastListenedAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v10, "nf_object:isEqualToObject:", v11, 0);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v13, "setLastListenedAt:", 0);
    v7 |= 0x800uLL;
  }
  objc_msgSend(v13, "listeningProgress");
  if (v12 != 0.0)
  {
    objc_msgSend(v13, "setListeningProgress:", 0.0);
    v7 |= 0x400uLL;
  }
  if (objc_msgSend(v13, "hasArticleBeenRead"))
  {
    objc_msgSend(v13, "setHasArticleBeenRead:", 0);
    v7 |= 2uLL;
  }
  if (objc_msgSend(v13, "hasArticleBeenSeen"))
  {
    objc_msgSend(v13, "setHasArticleBeenSeen:", 0);
    v7 |= 1uLL;
  }
  if (objc_msgSend(v13, "hasArticleCompletedListening"))
  {
    objc_msgSend(v13, "setHasArticleCompletedListening:", 0);
    v7 |= 0x2000uLL;
  }
  if (objc_msgSend(v13, "hasArticleCompletedReading"))
  {
    objc_msgSend(v13, "setHasArticleCompletedReading:", 0);
    v7 |= 0x10000uLL;
  }
  if (objc_msgSend(v13, "hasArticleBeenRemovedFromAudio"))
  {
    objc_msgSend(v13, "setHasArticleBeenRemovedFromAudio:", 0);
    v7 |= 0x20000uLL;
  }
  *a3 = v7;

}

- (void)clearHistory
{
  NSMutableDictionary *itemsByIdentifier;
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  FCMTWriterLock *itemsLock;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  FCRemoveHistoryCommand *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
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
  _QWORD v44[5];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    itemsByIdentifier = self->_itemsByIdentifier;
  else
    itemsByIdentifier = 0;
  -[NSMutableDictionary allKeys](itemsByIdentifier, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if (self)
      v5 = self->_itemsByIdentifier;
    else
      v5 = 0;
    -[NSMutableDictionary allValues](v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", &__block_literal_global_90);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCPrivateDataController localStore](self, "localStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsForKeys:", v4);

    if (self)
      itemsLock = self->_itemsLock;
    else
      itemsLock = 0;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __32__FCReadingHistory_clearHistory__block_invoke_2;
    v44[3] = &unk_1E463AB18;
    v44[4] = self;
    -[FCMTWriterLock performWriteSync:](itemsLock, "performWriteSync:", v44);
    v30 = -[FCRemoveHistoryCommand initWithHistoryItemIDs:]([FCRemoveHistoryCommand alloc], "initWithHistoryItemIDs:", v4);
    -[FCPrivateDataController addCommandToCommandQueue:](self, "addCommandToCommandQueue:");
    v10 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E470A160, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v13);
    }
    v31 = v4;

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    -[FCPrivateDataController observers](self, "observers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "copy");

    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v37;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "readingHistory:didChangeFeaturesForArticles:", self, v10);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v19);
    }

    v4 = v31;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[FCPrivateDataController observers](self, "observers");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * k);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v29, "readingHistoryDidClear:", self);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v26);
  }

}

uint64_t __32__FCReadingHistory_clearHistory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "articleID");
}

uint64_t __32__FCReadingHistory_clearHistory__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 96);
  else
    v3 = 0;
  objc_msgSend(v3, "removeAllObjects");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 104);
  else
    v5 = 0;
  return objc_msgSend(v5, "removeAllObjects");
}

- (double)listeningProgressFor:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listeningProgress");
  v5 = v4;

  return v5;
}

- (id)listeningProgressSavedDateFor:(id)a3
{
  void *v3;
  void *v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listeningProgressSavedAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)firstSeenDateFor:(id)a3
{
  void *v3;
  void *v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstSeenAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)markArticle:(id)a3 withListeningProgress:(double)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__FCReadingHistory_markArticle_withListeningProgress___block_invoke;
  v4[3] = &__block_descriptor_40_e43_v24__0___FCMutableReadingHistoryItem__8_Q16l;
  *(double *)&v4[4] = a4;
  -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, a3, v4);
}

void __54__FCReadingHistory_markArticle_withListeningProgress___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v5 = a2;
  v6 = *(double *)(a1 + 32);
  v9 = v5;
  objc_msgSend(v5, "listeningProgress");
  if (v6 != v7 && vabdd_f64(v6, v7) >= fabs(v7 * 0.000000999999997))
  {
    objc_msgSend(v9, "setListeningProgress:", *(double *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setListeningProgressSavedAt:", v8);

    *a3 = 1024;
  }

}

- (id)lastListenedFor:(id)a3
{
  void *v3;
  void *v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastListenedAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)markArticle:(id)a3 withLastListened:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__FCReadingHistory_markArticle_withLastListened___block_invoke;
  v8[3] = &unk_1E463B1B0;
  v9 = v6;
  v7 = v6;
  -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, a3, v8);

}

void __49__FCReadingHistory_markArticle_withLastListened___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = (void *)MEMORY[0x1E0DE7910];
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  objc_msgSend(v5, "lastListenedAt");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8);

  if ((v6 & 1) != 0)
  {
    v9 = 0x40000;
  }
  else
  {
    objc_msgSend(v10, "setLastListenedAt:", *(_QWORD *)(a1 + 32));
    v9 = 264192;
  }
  objc_msgSend(v10, "setListenedCount:", objc_msgSend(v10, "listenedCount") + 1);
  *a3 = v9;

}

- (int64_t)listenedCountFor:(id)a3
{
  void *v3;
  int64_t v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "listenedCount");

  return v4;
}

- (id)readingPositionJSONFor:(id)a3
{
  void *v3;
  void *v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readingPosition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)readingPositionSavedDateFor:(id)a3
{
  void *v3;
  void *v4;

  -[FCReadingHistory _readingHistoryItemForArticleID:]((uint64_t)self, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readingPositionSavedAt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)markArticle:(id)a3 withReadingPositionJSON:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__FCReadingHistory_markArticle_withReadingPositionJSON___block_invoke;
  v8[3] = &unk_1E463B1B0;
  v9 = v6;
  v7 = v6;
  -[FCReadingHistory _modifyHistoryForArticleID:withBlock:](self, a3, v8);

}

void __56__FCReadingHistory_markArticle_withReadingPositionJSON___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a2;
  v6 = (void *)MEMORY[0x1E0DE7910];
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  objc_msgSend(v5, "readingPosition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v6, "nf_object:isEqualToObject:", v7, v8);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v10, "setReadingPosition:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setReadingPositionSavedAt:", v9);

    *a3 = 4096;
  }

}

void __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_2(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  id v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v1)
    v1 = (_QWORD *)v1[13];
  v3 = v1;
  objc_msgSend(v2, "articleID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

}

void __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v2)
    v2 = (_QWORD *)v2[12];
  v4 = v2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      v8 = *(void **)(v7 + 112);
    else
      v8 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_4;
    v9[3] = &unk_1E463AD10;
    v9[4] = v7;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v8, "performWriteSync:", v9);

  }
}

void __49__FCReadingHistory__cacheHistoryItemByArticleID___block_invoke_4(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  _QWORD *v3;
  id v4;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v1)
    v1 = (_QWORD *)v1[13];
  v3 = v1;
  objc_msgSend(v2, "articleID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

}

void __48__FCReadingHistory__addHistoryItems_addToStore___block_invoke(uint64_t a1)
{
  void (**v2)(void *, _QWORD);
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD aBlock[5];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__FCReadingHistory__addHistoryItems_addToStore___block_invoke_2;
  aBlock[3] = &unk_1E463B1D8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v2 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "localStore");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = *(id *)(a1 + 40);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v34;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v34 != v6)
            objc_enumerationMutation(obj);
          v2[2](v2, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v7));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = *(_QWORD *)(a1 + 32);
          if (v10)
            v11 = *(void **)(v10 + 96);
          else
            v11 = 0;
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v9);
          v12 = *(_QWORD **)(a1 + 32);
          if (v12)
            v12 = (_QWORD *)v12[13];
          v13 = v12;
          objc_msgSend(v8, "articleID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v14);

          objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, v9);
          ++v7;
        }
        while (v5 != v7);
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        v5 = v15;
      }
      while (v15);
    }

  }
  else
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v3 = *(id *)(a1 + 40);
    v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v30;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v30 != v18)
            objc_enumerationMutation(v3);
          v2[2](v2, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = *(_QWORD *)(a1 + 32);
          if (v22)
            v23 = *(void **)(v22 + 96);
          else
            v23 = 0;
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, v21);
          v24 = *(_QWORD **)(a1 + 32);
          if (v24)
            v24 = (_QWORD *)v24[13];
          v25 = v24;
          objc_msgSend(v20, "articleID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setObject:forKeyedSubscript:", v20, v26);

          ++v19;
        }
        while (v17 != v19);
        v27 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        v17 = v27;
      }
      while (v27);
    }
  }

}

id __48__FCReadingHistory__addHistoryItems_addToStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4)
    v4 = (_QWORD *)v4[12];
  v5 = v4;
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v3;
  if (v7)
  {
    v8 = (void *)objc_msgSend(v3, "mutableCopyWithZone:", 0);
    v9 = objc_msgSend(v8, "maxVersionRead");
    v10 = objc_msgSend(v7, "maxVersionRead");
    if (v9 <= v10)
      v11 = v10;
    else
      v11 = v9;
    objc_msgSend(v8, "setMaxVersionRead:", v11);
    FCMergeHistoryItemSeenFields(v8, v7);

  }
  return v8;
}

void __59__FCReadingHistory__removeHistoryItemWithItemID_articleID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      v3 = *(void **)(v2 + 96);
    else
      v3 = 0;
    objc_msgSend(v3, "removeObjectForKey:");
    objc_msgSend(*(id *)(a1 + 40), "localStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  }
  if (*(_QWORD *)(a1 + 48))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      v6 = *(void **)(v5 + 104);
    else
      v6 = 0;
    objc_msgSend(v6, "removeObjectForKey:");
  }
}

id __58__FCReadingHistory_configureKeyValueStoreForJSONHandling___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__FCReadingHistory_configureKeyValueStoreForJSONHandling___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = a2;
  objc_opt_class();
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("flags"));
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0C99D80];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__FCReadingHistory_configureKeyValueStoreForJSONHandling___block_invoke_3;
    v12[3] = &unk_1E463AA78;
    v13 = v4;
    v10 = v4;
    objc_msgSend(v9, "fc_dictionary:", v12);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void __58__FCReadingHistory_configureKeyValueStoreForJSONHandling___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "numberWithInt:", objc_msgSend(v4, "unsignedIntegerValue") & 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("hasBeenRead"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 1) & 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("hasBeenSeen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 2) & 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("hasBeenMarkedOffensive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 3) & 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("hasBeenLiked"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 4) & 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("hasBeenDisliked"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 5) & 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("hasBeenConsumed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 6) & 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("hasCompletedListening"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 8) & 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("hasCompletedReading"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue") >> 9) & 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("hasBeenRemovedFromAudio"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsLock, 0);
  objc_storeStrong((id *)&self->_itemsByArticleID, 0);
  objc_storeStrong((id *)&self->_itemsByIdentifier, 0);
}

@end
