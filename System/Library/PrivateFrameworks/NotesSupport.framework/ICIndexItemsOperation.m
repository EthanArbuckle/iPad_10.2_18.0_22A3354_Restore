@implementation ICIndexItemsOperation

- (ICIndexItemsOperation)init
{
  -[ICIndexItemsOperation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICIndexItemsOperation)initWithSearchableIndex:(id)a3 dataSources:(id)a4
{
  id v6;
  id v7;
  ICIndexItemsOperation *v8;
  ICIndexItemsOperation *v9;
  uint64_t v10;
  NSMutableArray *objectIDsToIndex;
  uint64_t v12;
  NSMutableArray *searchableItemsToIndex;
  uint64_t v14;
  NSMutableArray *objectIDURIsToDelete;
  NSMutableDictionary *v16;
  NSMutableDictionary *contextCache;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICIndexItemsOperation;
  v8 = -[ICIndexItemsOperation init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ICIndexItemsOperation setSearchableIndex:](v8, "setSearchableIndex:", v6);
    -[ICIndexItemsOperation setDataSources:](v9, "setDataSources:", v7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    objectIDsToIndex = v9->_objectIDsToIndex;
    v9->_objectIDsToIndex = (NSMutableArray *)v10;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    searchableItemsToIndex = v9->_searchableItemsToIndex;
    v9->_searchableItemsToIndex = (NSMutableArray *)v12;

    v9->_totalSizeOfSearchableItemsToIndex = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    objectIDURIsToDelete = v9->_objectIDURIsToDelete;
    v9->_objectIDURIsToDelete = (NSMutableArray *)v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    contextCache = v9->_contextCache;
    v9->_contextCache = v16;

  }
  return v9;
}

- (id)managedObjectContextForDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIndexItemsOperation contextCache](self, "contextCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = (void *)objc_msgSend(v4, "newManagedObjectContext");
    -[ICIndexItemsOperation contextCache](self, "contextCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v5);

  }
  return v7;
}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Started main function of indexing items operation %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)processItems
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_1DDAA5000, v0, v1, "%@ Order of data source to be indexed: %@");
  OUTLINED_FUNCTION_1();
}

BOOL __37__ICIndexItemsOperation_processItems__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "indexingPriority");
  v6 = objc_msgSend(v4, "indexingPriority");

  return v5 < v6;
}

void __37__ICIndexItemsOperation_processItems__block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectIDsToIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = *(id *)(a1 + 48);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v19;
    *(_QWORD *)&v5 = 138412802;
    v17 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 32), "searchableItemsToIndex", v17, (_QWORD)v18);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v9);

        objc_msgSend(v9, "attributeSet");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "textContent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v12, "lengthOfBytesUsingEncoding:", 4);

        v13 = os_log_create("com.apple.notes", "SearchIndexer");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v9, "uniqueIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          *(_DWORD *)buf = v17;
          v23 = v14;
          v24 = 2112;
          v25 = v15;
          v26 = 2048;
          v27 = v16;
          _os_log_debug_impl(&dword_1DDAA5000, v13, OS_LOG_TYPE_DEBUG, "%@ item-to-index %@ is %lu bytes", buf, 0x20u);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    }
    while (v6);
  }

}

void __37__ICIndexItemsOperation_processItems__block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectIDURIsToDelete");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

    if (ICVerboseSearchLogging())
    {
      v3 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __37__ICIndexItemsOperation_processItems__block_invoke_6_cold_1();

    }
  }
  v4 = *(void **)(a1 + 48);
  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v17;
      *(_QWORD *)&v7 = 138412546;
      v15 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
          objc_msgSend(*(id *)(a1 + 40), "objectIDURIsToDelete", v15, (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v11);

          if (ICVerboseSearchLogging())
          {
            v13 = os_log_create("com.apple.notes", "SearchIndexer");
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              v14 = *(_QWORD *)(a1 + 40);
              *(_DWORD *)buf = v15;
              v21 = v14;
              v22 = 2112;
              v23 = v11;
              _os_log_debug_impl(&dword_1DDAA5000, v13, OS_LOG_TYPE_DEBUG, "%@ additional item-to-delete %@", buf, 0x16u);
            }

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v8);
    }

  }
}

- (void)commitIfNecessaryForDataSource:(id)a3 hasItemsToDeleteThenUpdate:(BOOL)a4 forceCommit:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL4 v8;
  _BOOL4 v9;
  id v10;

  v5 = a5;
  v6 = a4;
  v10 = a3;
  v8 = -[ICIndexItemsOperation _shouldCommitDeletionWithHasItemsToDeleteThenUpdate:shouldForceCommit:](self, "_shouldCommitDeletionWithHasItemsToDeleteThenUpdate:shouldForceCommit:", v6, v5);
  v9 = -[ICIndexItemsOperation _shouldCommitIndexingWithHasItemsToDeleteThenUpdate:shouldForceCommit:](self, "_shouldCommitIndexingWithHasItemsToDeleteThenUpdate:shouldForceCommit:", v6, v5);
  if (v8)
    -[ICIndexItemsOperation _commitObjectIDURIsToDeleteForDataSource:](self, "_commitObjectIDURIsToDeleteForDataSource:", v10);
  if (v9)
    -[ICIndexItemsOperation _commitObjectIDsToIndexForDataSource:](self, "_commitObjectIDsToIndexForDataSource:", v10);

}

- (BOOL)_shouldCommitDeletionWithHasItemsToDeleteThenUpdate:(BOOL)a3 shouldForceCommit:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  -[ICIndexItemsOperation objectIDURIsToDelete](self, "objectIDURIsToDelete");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v9 = 0;
    if (!v5)
      return v9;
    goto LABEL_8;
  }
  v9 = 1;
  if (!v5 && !a4)
  {
    -[ICIndexItemsOperation objectIDURIsToDelete](self, "objectIDURIsToDelete");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_msgSend(v10, "count") & 0xFFFFFFFFFFFFC000) != 0;

  }
  if (v5)
  {
LABEL_8:
    v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ICIndexItemsOperation _shouldCommitDeletionWithHasItemsToDeleteThenUpdate:shouldForceCommit:].cold.1(v9, v11, v12, v13, v14, v15, v16, v17);

  }
  return v9;
}

- (void)_commitObjectIDURIsToDeleteForDataSource:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  dispatch_semaphore_t v16;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "-[ICIndexItemsOperation _commitObjectIDURIsToDeleteForDataSource:]", 1, 0, CFSTR("Unexpected call from main thread"));
  v5 = dispatch_semaphore_create(0);
  v6 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICIndexItemsOperation _commitObjectIDURIsToDeleteForDataSource:].cold.1(self, v6);

  -[ICIndexItemsOperation objectIDURIsToDelete](self, "objectIDURIsToDelete");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "searchIndexerWillDeleteSearchableItemsWithObjectIDURIs:", v8);

  -[ICIndexItemsOperation searchableIndex](self, "searchableIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIndexItemsOperation objectIDURIsToDelete](self, "objectIDURIsToDelete");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke;
  v14[3] = &unk_1EA824210;
  v14[4] = self;
  v15 = v4;
  v16 = v5;
  v12 = v5;
  v13 = v4;
  objc_msgSend(v9, "deleteSearchableItemsWithIdentifiers:completionHandler:", v11, v14);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

void __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "setError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);

  }
  v12 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectIDURIsToDelete");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v12, "searchIndexerDidFinishDeletingSearchableItemsWithObjectIDURIs:error:", v14, v3);

  objc_msgSend(*(id *)(a1 + 32), "objectIDURIsToDelete");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (BOOL)_shouldCommitIndexingWithHasItemsToDeleteThenUpdate:(BOOL)a3 shouldForceCommit:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  -[ICIndexItemsOperation objectIDsToIndex](self, "objectIDsToIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    v9 = 0;
    if (!v5)
      return v9;
    goto LABEL_10;
  }
  v9 = 1;
  if (!v5 && !a4)
  {
    -[ICIndexItemsOperation objectIDsToIndex](self, "objectIDsToIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v10, "count") <= 0x63)
      v9 = -[ICIndexItemsOperation totalSizeOfSearchableItemsToIndex](self, "totalSizeOfSearchableItemsToIndex") >> 12 > 0x18;

  }
  if (v5)
  {
LABEL_10:
    v11 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ICIndexItemsOperation _shouldCommitIndexingWithHasItemsToDeleteThenUpdate:shouldForceCommit:].cold.1(v9, v11, v12, v13, v14, v15, v16, v17);

  }
  return v9;
}

- (BOOL)universalSearchProcessingLibraryEnabled
{
  return _os_feature_enabled_impl();
}

- (void)_commitObjectIDsToIndexForDataSource:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  ICIndexItemsOperation *v24;
  NSObject *v25;
  id v26;
  char v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "![NSThread isMainThread]", "-[ICIndexItemsOperation _commitObjectIDsToIndexForDataSource:]", 1, 0, CFSTR("Unexpected call from main thread"));
  v5 = dispatch_semaphore_create(0);
  v6 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICIndexItemsOperation _commitObjectIDsToIndexForDataSource:].cold.1(self, (uint64_t)v4, v6);

  -[ICIndexItemsOperation objectIDsToIndex](self, "objectIDsToIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "searchIndexerWillIndexObjectIDs:", v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:", CFSTR("sy_isLinkItem"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ICIndexItemsOperation searchableItemsToIndex](self, "searchableItemsToIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "attributeSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "valueForCustomKey:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = 1;
          goto LABEL_15;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v11)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_15:

  objc_initWeak(&location, self);
  -[ICIndexItemsOperation searchableIndex](self, "searchableIndex");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIndexItemsOperation searchableItemsToIndex](self, "searchableItemsToIndex");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke;
  v22[3] = &unk_1EA824278;
  objc_copyWeak(&v26, &location);
  v20 = v4;
  v23 = v20;
  v24 = self;
  v27 = v16;
  v21 = v5;
  v25 = v21;
  objc_msgSend(v17, "indexSearchableItems:completionHandler:", v19, v22);

  dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = os_log_create("com.apple.notes", "SearchIndexer");
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_cold_2();

    objc_msgSend(WeakRetained, "setError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_cold_1();

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "objectIDsToIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v7, "searchIndexerDidFinishIndexingObjectIDs:error:", v9, v3);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "ic_isAppExtension") & 1) == 0)
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "universalSearchProcessingLibraryEnabled");

    if (!v11)
      goto LABEL_13;
    objc_msgSend(WeakRetained, "searchableItemsToIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v13, "ic_compactMap:", &__block_literal_global_24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      +[ICImageAnalysisController sharedController](ICImageAnalysisController, "sharedController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "analyzeSearchableItems:completion:", v10, 0);

    }
  }

LABEL_13:
  objc_msgSend(WeakRetained, "searchableItemsToIndex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeAllObjects");

  objc_msgSend(WeakRetained, "objectIDsToIndex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "removeAllObjects");

  objc_msgSend(WeakRetained, "setTotalSizeOfSearchableItemsToIndex:", 0);
  if (*(_BYTE *)(a1 + 64))
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v17 = (void *)getSYItemIndexingManagerClass_softClass;
    v23 = getSYItemIndexingManagerClass_softClass;
    if (!getSYItemIndexingManagerClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getSYItemIndexingManagerClass_block_invoke;
      v19[3] = &unk_1EA823E40;
      v19[4] = &v20;
      __getSYItemIndexingManagerClass_block_invoke((uint64_t)v19);
      v17 = (void *)v21[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v20, 8);
    objc_msgSend(v18, "indexedContentItemsDidChange");
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

id __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_22(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v2 = (void *)MEMORY[0x1E0CEC3F8];
  v3 = a2;
  objc_msgSend(v3, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeWithIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "conformsToType:", *MEMORY[0x1E0CEC520]);

  if (v7)
    v8 = v3;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

- (ICSearchIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (void)setSearchableIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchableIndex, a3);
}

- (NSArray)dataSources
{
  return self->_dataSources;
}

- (void)setDataSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSMutableArray)objectIDsToIndex
{
  return self->_objectIDsToIndex;
}

- (void)setObjectIDsToIndex:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDsToIndex, a3);
}

- (NSMutableArray)searchableItemsToIndex
{
  return self->_searchableItemsToIndex;
}

- (void)setSearchableItemsToIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchableItemsToIndex, a3);
}

- (unint64_t)totalSizeOfSearchableItemsToIndex
{
  return self->_totalSizeOfSearchableItemsToIndex;
}

- (void)setTotalSizeOfSearchableItemsToIndex:(unint64_t)a3
{
  self->_totalSizeOfSearchableItemsToIndex = a3;
}

- (NSMutableArray)objectIDURIsToDelete
{
  return self->_objectIDURIsToDelete;
}

- (void)setObjectIDURIsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDURIsToDelete, a3);
}

- (NSMutableDictionary)contextCache
{
  return self->_contextCache;
}

- (void)setContextCache:(id)a3
{
  objc_storeStrong((id *)&self->_contextCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextCache, 0);
  objc_storeStrong((id *)&self->_objectIDURIsToDelete, 0);
  objc_storeStrong((id *)&self->_searchableItemsToIndex, 0);
  objc_storeStrong((id *)&self->_objectIDsToIndex, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

void __37__ICIndexItemsOperation_processItems__block_invoke_6_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1DDAA5000, v0, v1, "%@ item-to-delete %@");
  OUTLINED_FUNCTION_1();
}

- (void)_shouldCommitDeletionWithHasItemsToDeleteThenUpdate:(uint64_t)a3 shouldForceCommit:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, a2, a3, "Found items to delete-then-update, shouldCommitDeletion=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_commitObjectIDURIsToDeleteForDataSource:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectIDURIsToDelete");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 1024;
  v8 = objc_msgSend(v4, "count");
  _os_log_debug_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_DEBUG, "%@ deleting %d item(s) for current batch", (uint8_t *)&v5, 0x12u);

}

void __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, a2, a3, "%@ finished deleting searchable item batch", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __66__ICIndexItemsOperation__commitObjectIDURIsToDeleteForDataSource___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8(&dword_1DDAA5000, v0, v1, "%@ error deleting searchable item batch: %@");
  OUTLINED_FUNCTION_1();
}

- (void)_shouldCommitIndexingWithHasItemsToDeleteThenUpdate:(uint64_t)a3 shouldForceCommit:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, a2, a3, "Found items to delete-then-update, shouldCommitIndexing=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_commitObjectIDsToIndexForDataSource:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "searchableItemsToIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138413058;
  v8 = a1;
  v9 = 2048;
  v10 = objc_msgSend(v6, "count");
  v11 = 2048;
  v12 = objc_msgSend(a1, "totalSizeOfSearchableItemsToIndex");
  v13 = 2112;
  v14 = a2;
  _os_log_debug_impl(&dword_1DDAA5000, a3, OS_LOG_TYPE_DEBUG, "%@ indexing %lu item(s) for current batch. bytes=%lu from %@", (uint8_t *)&v7, 0x2Au);

}

void __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "%@ finished indexing batch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__ICIndexItemsOperation__commitObjectIDsToIndexForDataSource___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_1DDAA5000, v0, v1, "%@ error indexing batch: %@");
  OUTLINED_FUNCTION_1();
}

@end
