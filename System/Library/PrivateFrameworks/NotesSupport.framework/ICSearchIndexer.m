@implementation ICSearchIndexer

void __39__ICSearchIndexer_stopObservingChanges__block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
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
  v2 = objc_msgSend(*(id *)(a1 + 32), "isObservingChanges");
  v3 = os_log_create("com.apple.notes", "SearchIndexer");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if ((v2 & 1) != 0)
  {
    if (v4)
      __39__ICSearchIndexer_stopObservingChanges__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "setObservingChanges:", 0);
    if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("ICSearchIndexerDataSourceDidChangeNotification"), 0);

    }
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_dataSources", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "stopObservingChanges");
        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
  else if (v4)
  {
    __39__ICSearchIndexer_stopObservingChanges__block_invoke_cold_2();
  }

}

- (void)setObservingChanges:(BOOL)a3
{
  self->_observingChanges = a3;
}

- (NSArray)_dataSources
{
  void *v2;
  void *v3;

  -[ICSearchIndexer dataSourcesByIdentifier](self, "dataSourcesByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

void __33__ICSearchIndexer_addDataSource___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  id v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  objc_msgSend(*(id *)(a1 + 32), "dataSourcesByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 40), "dataSourceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v7 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __33__ICSearchIndexer_addDataSource___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "dataSourcesByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (os_log_t)objc_msgSend(v8, "mutableCopy");

    v9 = *(void **)(a1 + 40);
    objc_msgSend(v9, "dataSourceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, v10);

    objc_msgSend(*(id *)(a1 + 32), "setDataSourcesByIdentifier:", v6);
    if (objc_msgSend(*(id *)(a1 + 32), "isObservingChanges"))
      objc_msgSend(*v3, "startObservingChanges");
    goto LABEL_9;
  }
  if (v5 != *v3)
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1DDAA5000, v6, OS_LOG_TYPE_INFO, "Trying to add a second data source with the same identifier. Doing nothing.", v11, 2u);
    }
LABEL_9:

  }
}

- (NSDictionary)dataSourcesByIdentifier
{
  return self->_dataSourcesByIdentifier;
}

- (BOOL)isObservingChanges
{
  return self->_observingChanges;
}

- (void)setDataSourcesByIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

void __33__ICSearchIndexer_addDataSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Adding indexer data source: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __39__ICSearchIndexer_stopObservingChanges__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Stopping listening to changes in the search indexer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __40__ICSearchIndexer_startObservingChanges__block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "isObservingChanges");
  v3 = os_log_create("com.apple.notes", "SearchIndexer");
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
      __40__ICSearchIndexer_startObservingChanges__block_invoke_cold_1();
  }
  else
  {
    if (v4)
      __40__ICSearchIndexer_startObservingChanges__block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "setObservingChanges:", 1);
    if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_dataSourceDidChange_, CFSTR("ICSearchIndexerDataSourceDidChangeNotification"), 0);

    }
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "_dataSources", 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "startObservingChanges");
        }
        while (v7 != v9);
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }

}

void __40__ICSearchIndexer_startObservingChanges__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Starting to listen to changes in the search indexer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __32__ICSearchIndexer_sharedIndexer__block_invoke()
{
  ICSearchIndexer *v0;
  void *v1;
  ICSearchIndexImplementation *v2;

  v2 = objc_alloc_init(ICSearchIndexImplementation);
  v0 = -[ICSearchIndexer initWithSearchIndex:]([ICSearchIndexer alloc], "initWithSearchIndex:", v2);
  v1 = (void *)sharedIndexer_sSharedIndexer;
  sharedIndexer_sSharedIndexer = (uint64_t)v0;

}

- (ICSearchIndexer)initWithSearchIndex:(id)a3
{
  id v4;
  ICSearchIndexer *v5;
  ICSearchIndexer *v6;
  dispatch_queue_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  ICSelectorDelayer *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICSearchIndexer;
  v5 = -[ICSearchIndexer init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    -[ICSearchIndexer setSearchableIndex:](v5, "setSearchableIndex:", v4);
    v7 = dispatch_queue_create("com.apple.notes.indexer", 0);
    -[ICSearchIndexer setIndexingQueue:](v6, "setIndexingQueue:", v7);

    -[ICSearchIndexer indexingQueue](v6, "indexingQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(-32768, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v8, v9);

    v10 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[ICSearchIndexer setOperationQueue:](v6, "setOperationQueue:", v10);

    if (ICVerboseSearchLogging())
    {
      v11 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[ICSearchIndexer initWithSearchIndex:].cold.1(v6, v11);

    }
    -[ICSearchIndexer operationQueue](v6, "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setQualityOfService:", 9);

    -[ICSearchIndexer operationQueue](v6, "operationQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMaxConcurrentOperationCount:", 1);

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchIndexer setDataSourcesByIdentifier:](v6, "setDataSourcesByIdentifier:", v14);

    if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
    {
      v15 = -[ICSelectorDelayer initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:]([ICSelectorDelayer alloc], "initWithTarget:selector:delay:waitToFireUntilRequestsStop:callOnMainThread:", v6, sel_processChanges, 1, 1, 1.0);
      -[ICSearchIndexer setChangeProcessingDelayer:](v6, "setChangeProcessingDelayer:", v15);

    }
    -[ICSearchIndexer setObservingChanges:](v6, "setObservingChanges:", 0);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSearchIndexer setRetryTimers:](v6, "setRetryTimers:", v16);

    -[ICSearchIndexer setRetryOnErrors:](v6, "setRetryOnErrors:", 1);
    -[ICSearchIndexer setDisabled:](v6, "setDisabled:", 1);
  }

  return v6;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)startObservingChanges
{
  NSObject *v3;
  _QWORD block[5];

  -[ICSearchIndexer indexingQueue](self, "indexingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ICSearchIndexer_startObservingChanges__block_invoke;
  block[3] = &unk_1EA823E80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopObservingChanges
{
  NSObject *v3;
  _QWORD block[5];

  -[ICSearchIndexer indexingQueue](self, "indexingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ICSearchIndexer_stopObservingChanges__block_invoke;
  block[3] = &unk_1EA823E80;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)addDataSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICSearchIndexer indexingQueue](self, "indexingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__ICSearchIndexer_addDataSource___block_invoke;
  v7[3] = &unk_1EA823F20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)indexingQueue
{
  return self->_indexingQueue;
}

- (void)setSearchableIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchableIndex, a3);
}

- (void)setRetryTimers:(id)a3
{
  objc_storeStrong((id *)&self->_retryTimers, a3);
}

- (void)setRetryOnErrors:(BOOL)a3
{
  self->_retryOnErrors = a3;
}

- (void)setOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_operationQueue, a3);
}

- (void)setIndexingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_indexingQueue, a3);
}

- (void)setChangeProcessingDelayer:(id)a3
{
  objc_storeStrong((id *)&self->_changeProcessingDelayer, a3);
}

+ (id)sharedIndexer
{
  if (sharedIndexer_onceToken != -1)
    dispatch_once(&sharedIndexer_onceToken, &__block_literal_global_18);
  return (id)sharedIndexer_sSharedIndexer;
}

- (ICSearchIndex)searchableIndex
{
  ICSearchIndex *searchableIndex;
  ICSearchIndexImplementation *v4;
  ICSearchIndex *v5;

  searchableIndex = self->_searchableIndex;
  if (!searchableIndex)
  {
    v4 = objc_alloc_init(ICSearchIndexImplementation);
    v5 = self->_searchableIndex;
    self->_searchableIndex = (ICSearchIndex *)v4;

    searchableIndex = self->_searchableIndex;
  }
  return searchableIndex;
}

- (void)dataSourceDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id location;

  v4 = a3;
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0
    && -[ICSearchIndexer isObservingChanges](self, "isObservingChanges"))
  {
    objc_msgSend(v4, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v5);

    -[ICSearchIndexer indexingQueue](self, "indexingQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__ICSearchIndexer_dataSourceDidChange___block_invoke;
    block[3] = &unk_1EA8249B0;
    objc_copyWeak(&v8, &location);
    block[4] = self;
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __39__ICSearchIndexer_dataSourceDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "dataSourcesByIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSourceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    WeakRetained = v7;
    if (v5 == v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "changeProcessingDelayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "requestFire");

      WeakRetained = v7;
    }
  }

}

- (void)processChanges
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Search indexing disabled. Bailing early from processChanges.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __33__ICSearchIndexer_processChanges__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  ICIndexItemsOperation *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  ICReindexAllItemsOperation *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id location;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[24];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_dataSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v22;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v4)
        objc_enumerationMutation(v2);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v5), "needsReindexing") & 1) != 0)
        break;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }

    objc_msgSend(*(id *)(a1 + 32), "pendingReindexingOperation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = os_log_create("com.apple.notes", "SearchIndexer");
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v10)
    {
      if (v12)
        __33__ICSearchIndexer_processChanges__block_invoke_cold_4();
      goto LABEL_24;
    }
    if (v12)
      __33__ICSearchIndexer_processChanges__block_invoke_cold_3();

    v13 = [ICReindexAllItemsOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "searchableIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_dataSources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICIndexItemsOperation initWithSearchableIndex:dataSources:](v13, "initWithSearchableIndex:dataSources:", v7, v8);
  }
  else
  {
LABEL_9:

    v6 = [ICIndexItemsOperation alloc];
    objc_msgSend(*(id *)(a1 + 32), "searchableIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_dataSources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICIndexItemsOperation initWithSearchableIndex:dataSources:](v6, "initWithSearchableIndex:dataSources:", v7, v8);
  }
  v11 = v9;

  if (v11)
  {
    v14 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __33__ICSearchIndexer_processChanges__block_invoke_cold_2();

    objc_initWeak(&location, v11);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __33__ICSearchIndexer_processChanges__block_invoke_16;
    v18[3] = &unk_1EA8249B0;
    objc_copyWeak(&v19, &location);
    v18[4] = *(_QWORD *)(a1 + 32);
    -[NSObject setCompletionBlock:](v11, "setCompletionBlock:", v18);
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addOperation:", v11);

    if (ICVerboseSearchLogging())
    {
      v16 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 32), "operationQueue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        __33__ICSearchIndexer_processChanges__block_invoke_cold_1((uint64_t)v11, v17, (uint64_t)v25);
      }

    }
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
LABEL_24:

  }
}

void __33__ICSearchIndexer_processChanges__block_invoke_16(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "retryOnErrors")
    && (objc_msgSend(WeakRetained, "error"), v2 = (void *)objc_claimAutoreleasedReturnValue(), v2, v2))
  {
    objc_msgSend(*(id *)(a1 + 32), "retrySelector:", sel_processChanges);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "clearRetryForSelector:", sel_processChanges);
  }

}

- (NSArray)dataSources
{
  NSObject *v3;
  void *v4;
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
  v11 = __Block_byref_object_copy__5;
  v12 = __Block_byref_object_dispose__5;
  v13 = 0;
  -[ICSearchIndexer indexingQueue](self, "indexingQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__ICSearchIndexer_dataSources__block_invoke;
  v7[3] = &unk_1EA823D70;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v3, v7);

  v4 = (void *)v9[5];
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

void __30__ICSearchIndexer_dataSources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_dataSources");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeDataSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[ICSearchIndexer indexingQueue](self, "indexingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__ICSearchIndexer_removeDataSource___block_invoke;
  block[3] = &unk_1EA823F20;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __36__ICSearchIndexer_removeDataSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "dataSourcesByIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "dataSourceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);

  if (v4 == v5)
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __36__ICSearchIndexer_removeDataSource___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "dataSourcesByIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 40), "dataSourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v9);

    objc_msgSend(*(id *)(a1 + 32), "setDataSourcesByIdentifier:", v8);
    if (objc_msgSend(*(id *)(a1 + 40), "isObservingChanges"))
      objc_msgSend(*(id *)(a1 + 40), "stopObservingChanges");

  }
}

- (id)dataSourceWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  -[ICSearchIndexer indexingQueue](self, "indexingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ICSearchIndexer_dataSourceWithIdentifier___block_invoke;
  block[3] = &unk_1EA823EA8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__ICSearchIndexer_dataSourceWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dataSourcesByIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)newContextsForAllDataSources
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICSearchIndexer dataSources](self, "dataSources");
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
        v10 = (void *)objc_msgSend(v9, "newManagedObjectContext");
        if (!v10)
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "context", "-[ICSearchIndexer newContextsForAllDataSources]", 1, 0, CFSTR("Expected non-nil context for dataSource %@"), v9);
        objc_msgSend(v3, "ic_addNonNilObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)reindexAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICSearchIndexer searchableIndex](self, "searchableIndex");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSearchIndexer reindexAllSearchableItemsInIndex:completionHandler:](self, "reindexAllSearchableItemsInIndex:completionHandler:", v5, v4);

}

- (void)cancelIndexingOperationsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1EA824188;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAllOperations");

  if (ICVerboseSearchLogging())
  {
    v4 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_cold_1((id *)(a1 + 32), v4);

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_21;
  v6[3] = &unk_1EA8249D8;
  v5 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "finishRemainingOperationsWithCompletionHandler:", v6);

}

uint64_t __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_21(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_21_cold_1();

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)finishRemainingOperationsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1EA824188;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t result;

  v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_5();

  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "changeProcessingDelayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScheduledToFire");

  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_4();

    objc_msgSend(*v3, "changeProcessingDelayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fireImmediately");

  }
  objc_msgSend(*v3, "retryTimers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v8);
  objc_msgSend(*v3, "retryTimers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_24_0);

  objc_sync_exit(v8);
  if (ICVerboseSearchLogging())
  {
    v10 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_3((id *)(a1 + 32), v10);

  }
  objc_msgSend(*v3, "indexingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v11, &__block_literal_global_26);

  if (ICVerboseSearchLogging())
  {
    v12 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_2((id *)(a1 + 32), v12);

  }
  objc_msgSend(*v3, "operationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "waitUntilAllOperationsAreFinished");

  v14 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_1();

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isScheduled"))
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_22_cold_1();

    objc_msgSend(v5, "fire");
  }

}

- (void)deleteAllSearchableItemsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICSearchIndexer deleteAllSearchableItemsWithCompletionHandler:].cold.1();

  if (ICReindexAlertEnabled())
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:", "NO", "-[ICSearchIndexer deleteAllSearchableItemsWithCompletionHandler:]", 0, 1, CFSTR("An unintended indexing deletion may have happened. Do you want to file a radar?"), CFSTR("Possible unintended indexing deletion"));
  +[ICIndexerStateHandler logMethodCall:](ICIndexerStateHandler, "logMethodCall:", 0);
  -[ICSearchIndexer searchableIndex](self, "searchableIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1EA824A40;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "deleteAllSearchableItemsWithCompletionHandler:", v8);

}

void __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_2();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "clearObjectIDsToProcess");
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

- (id)pendingReindexingOperation
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  -[ICSearchIndexer operationQueue](self, "operationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_objectPassingTest:", &__block_literal_global_35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && ICVerboseSearchLogging())
  {
    v5 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ICSearchIndexer pendingReindexingOperation].cold.1();

  }
  return v4;
}

uint64_t __45__ICSearchIndexer_pendingReindexingOperation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v7;

  v2 = a2;
  v3 = objc_opt_class();
  ICDynamicCast(v3, (uint64_t)v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(v4, "isCancelled") & 1) != 0
    || (objc_msgSend(v4, "isExecuting") & 1) != 0
    || (objc_msgSend(v4, "isFinished") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    if (ICVerboseSearchLogging())
    {
      v7 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __45__ICSearchIndexer_pendingReindexingOperation__block_invoke_cold_1();

    }
    v5 = 1;
  }

  return v5;
}

- (void)reindexAllSearchableItemsInIndex
{
  id v3;

  -[ICSearchIndexer searchableIndex](self, "searchableIndex");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSearchIndexer reindexAllSearchableItemsInIndex:completionHandler:](self, "reindexAllSearchableItemsInIndex:completionHandler:", v3, 0);

}

- (void)reindexAllSearchableItemsInIndex:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  void (**v14)(id, void *);
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
  {
    if (-[ICSearchIndexer isDisabled](self, "isDisabled"))
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v15 = CFSTR("FailureReason");
      v16[0] = CFSTR("Indexing is disabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("NotesErrorDomain"), 300, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        v7[2](v7, v10);

    }
    else
    {
      +[ICIndexerStateHandler logMethodCall:](ICIndexerStateHandler, "logMethodCall:", 1);
      -[ICSearchIndexer indexingQueue](self, "indexingQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke;
      v12[3] = &unk_1EA824AD8;
      v12[4] = self;
      v14 = v7;
      v13 = v6;
      dispatch_async(v11, v12);

    }
  }

}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke(id *a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  ICReindexAllItemsOperation *v12;
  ICReindexAllItemsOperation *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  id location;
  _QWORD v27[4];
  id v28;
  ICReindexAllItemsOperation *v29;
  char v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 4;
  objc_msgSend(a1[4], "pendingReindexingOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (v5)
      __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_3();

    v13 = [ICReindexAllItemsOperation alloc];
    v14 = a1[5];
    objc_msgSend(a1[4], "_dataSources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICIndexItemsOperation initWithSearchableIndex:dataSources:](v13, "initWithSearchableIndex:dataSources:", v14, v15);

    if (ICVerboseSearchLogging())
    {
      v16 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_2();

    }
    objc_initWeak(&location, v12);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_41;
    v21[3] = &unk_1EA824AB0;
    objc_copyWeak(&v25, &location);
    v22 = a1[5];
    v17 = a1[6];
    v23 = a1[4];
    v24 = v17;
    -[ICReindexAllItemsOperation setCompletionBlock:](v12, "setCompletionBlock:", v21);
    objc_msgSend(*v2, "operationQueue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addOperation:", v12);

    if (ICVerboseSearchLogging())
    {
      v19 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*v2, "operationQueue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_1((uint64_t)v12, v20, (uint64_t)v30);
      }

    }
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    goto LABEL_23;
  }
  if (v5)
    __33__ICSearchIndexer_processChanges__block_invoke_cold_4();

  if (a1[6])
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_5();

    v7 = (void *)MEMORY[0x1E0CB34C8];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_40;
    v27[3] = &unk_1EA824A88;
    v29 = (ICReindexAllItemsOperation *)a1[6];
    v8 = v3;
    v28 = v8;
    objc_msgSend(v7, "blockOperationWithBlock:", v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addDependency:", v8);
    objc_msgSend(a1[4], "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addOperation:", v9);

    if (ICVerboseSearchLogging())
    {
      v11 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_4((uint64_t)v9, v2, v11);

    }
    v12 = v29;
LABEL_23:

  }
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_40(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_41(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_41_cold_1();

  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(WeakRetained, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "retryOnErrors")
    && (objc_msgSend(WeakRetained, "error"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "retrySelector:", sel_reindexAllSearchableItemsInIndex);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "clearRetryForSelector:", sel_reindexAllSearchableItemsInIndex);
  }

}

- (void)reindexSearchableItemsWithObjectIDURIs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICSearchIndexer searchableIndex](self, "searchableIndex");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSearchIndexer reindexSearchableItemsWithObjectIDURIs:inIndex:completionHandler:](self, "reindexSearchableItemsWithObjectIDURIs:inIndex:completionHandler:", v7, v8, v6);

}

- (void)reindexSearchableItemsWithObjectIDURIs:(id)a3 inIndex:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  ICSearchIndexer *v17;
  id v18;
  void (**v19)(id, void *);
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if ((ICUseCoreDataCoreSpotlightIntegration() & 1) == 0)
  {
    if (-[ICSearchIndexer isDisabled](self, "isDisabled"))
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v20 = CFSTR("FailureReason");
      v21[0] = CFSTR("Indexing is disabled");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("NotesErrorDomain"), 300, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
        v10[2](v10, v13);
    }
    else
    {
      +[ICIndexerStateHandler logMethodCall:](ICIndexerStateHandler, "logMethodCall:", 2);
      -[ICSearchIndexer indexingQueue](self, "indexingQueue");
      v14 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke;
      block[3] = &unk_1EA824B28;
      v16 = v9;
      v17 = self;
      v18 = v8;
      v19 = v10;
      dispatch_async(v14, block);

      v13 = v16;
    }

  }
}

void __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke(uint64_t a1)
{
  ICIndexItemsByIdentifiersOperation *v2;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  ICIndexItemsByIdentifiersOperation *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  uint8_t buf[4];
  ICIndexItemsByIdentifiersOperation *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = [ICIndexItemsByIdentifiersOperation alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_dataSources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (uint64_t *)(a1 + 48);
  v6 = -[ICIndexItemsByIdentifiersOperation initWithSearchableIndex:dataSources:objectIDURIsToIndex:](v2, "initWithSearchableIndex:dataSources:objectIDURIsToIndex:", v3, v4, *(_QWORD *)(a1 + 48));

  v7 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_cold_1();

  objc_initWeak(&location, v6);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_45;
  v12[3] = &unk_1EA824B00;
  objc_copyWeak(&v14, &location);
  v13 = *(id *)(a1 + 56);
  -[ICIndexItemsByIdentifiersOperation setCompletionBlock:](v6, "setCompletionBlock:", v12);
  objc_msgSend(*(id *)(a1 + 40), "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v6);

  if (ICVerboseSearchLogging())
  {
    v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "operationQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *v5;
      *(_DWORD *)buf = 138412802;
      v17 = v6;
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_debug_impl(&dword_1DDAA5000, v9, OS_LOG_TYPE_DEBUG, "reindexSearchableItemsWithObjectIDURIs: Added operation %@ to operation queue %@ for object ID URIs: %@", buf, 0x20u);

    }
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_45(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_45_cold_1();

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    objc_msgSend(WeakRetained, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
}

- (id)objectsForSearchableItems:(id)a3 inContexts:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[ICSearchIndexer objectsDictionaryForSearchableItems:inContexts:](self, "objectsDictionaryForSearchableItems:inContexts:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v8, "addObject:", v12);

      ++v9;
    }
    while (objc_msgSend(v6, "count") > v9);
  }
  v13 = (void *)objc_msgSend(v8, "copy");

  return v13;
}

- (id)objectForSearchableItem:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v15[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v15, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSearchIndexer objectsForSearchableItems:inContexts:](self, "objectsForSearchableItems:inContexts:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)objectsDictionaryForSearchableItems:(id)a3 inContexts:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  id obj;
  uint64_t v27;
  id v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v29 = a4;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v5;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v31)
  {
    v27 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v7, "attributeSet");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ic_dataSourceIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSearchIndexer dataSourceWithIdentifier:](self, "dataSourceWithIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v11 = v29;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        if (v12)
        {
          v13 = v12;
          v30 = v7;
          v14 = *(_QWORD *)v33;
LABEL_8:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v33 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
            objc_msgSend(v16, "persistentStoreCoordinator");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "persistentStoreCoordinator");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v17, "isEqual:", v18);

            if ((v19 & 1) != 0)
              break;
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              if (v13)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          v20 = v16;

          if (!v20)
            goto LABEL_20;
          objc_msgSend(v10, "objectForSearchableItem:context:", v30, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v30, "uniqueIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "setObject:forKey:", v21, v22);

          }
        }
        else
        {
LABEL_14:
          v20 = v11;
        }

LABEL_20:
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v31);
  }

  v23 = (void *)objc_msgSend(v25, "copy");
  return v23;
}

- (id)objectForManagedObjectIDURI:(id)a3 inContexts:(id)a4
{
  NSObject *v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  __int128 v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[5];
  id v34;
  id v35;
  uint64_t *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v31 = a4;
  v6 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICSearchIndexer objectForManagedObjectIDURI:inContexts:].cold.2();

  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__5;
  v49 = __Block_byref_object_dispose__5;
  v50 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[ICSearchIndexer dataSources](self, "dataSources");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v42;
    *(_QWORD *)&v7 = 138412546;
    v27 = v7;
LABEL_5:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v29)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v8);
      v10 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v9, "dataSourceIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v27;
        v53 = v22;
        v54 = 2112;
        v55 = v32;
        _os_log_debug_impl(&dword_1DDAA5000, v10, OS_LOG_TYPE_DEBUG, "Checking data source (%@) for item %@", buf, 0x16u);

      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v11 = v31;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v38 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            objc_msgSend(v15, "persistentStoreCoordinator", v27);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "persistentStoreCoordinator");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v16, "isEqual:", v17);

            if (v18)
            {
              v19 = v15;
              goto LABEL_20;
            }
          }
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
          if (v12)
            continue;
          break;
        }
      }
      v19 = 0;
LABEL_20:

      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __58__ICSearchIndexer_objectForManagedObjectIDURI_inContexts___block_invoke;
      v33[3] = &unk_1EA824B50;
      v36 = &v45;
      v33[4] = v9;
      v34 = v32;
      v20 = v19;
      v35 = v20;
      objc_msgSend(v20, "performBlockAndWait:", v33);
      v21 = v46[5] == 0;

      if (!v21)
        break;
      if (++v8 == v30)
      {
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v56, 16);
        if (v30)
          goto LABEL_5;
        break;
      }
    }
  }

  v23 = (void *)v46[5];
  if (!v23)
  {
    v24 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[ICSearchIndexer objectForManagedObjectIDURI:inContexts:].cold.1();

    v23 = (void *)v46[5];
  }
  v25 = v23;
  _Block_object_dispose(&v45, 8);

  return v25;
}

void __58__ICSearchIndexer_objectForManagedObjectIDURI_inContexts___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "objectForManagedObjectIDURI:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 56);
  v4 = a1 + 56;
  v6 = *(_QWORD *)(v5 + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v3;

  v8 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __58__ICSearchIndexer_objectForManagedObjectIDURI_inContexts___block_invoke_cold_1(v4, v2, v8);

}

- (void)retrySelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  ICBackoffTimer *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  double v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  -[ICSearchIndexer retryTimers](self, "retryTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchIndexer retryTimers](self, "retryTimers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (ICBackoffTimer *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (-[ICBackoffTimer isScheduled](v8, "isScheduled"))
    {
      v9 = os_log_create("com.apple.notes", "SearchIndexer");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[ICSearchIndexer retrySelector:].cold.2();

      goto LABEL_10;
    }
  }
  else
  {
    v8 = -[ICBackoffTimer initWithInitialInterval:maxInterval:target:selector:userInfo:]([ICBackoffTimer alloc], "initWithInitialInterval:maxInterval:target:selector:userInfo:", self, a3, v6, 1.0, 300.0);
    -[ICSearchIndexer retryTimers](self, "retryTimers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, v6);

  }
  v11 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[ICBackoffTimer nextTimeInterval](v8, "nextTimeInterval");
    -[ICSearchIndexer retrySelector:].cold.1((uint64_t)v6, (uint64_t)v13, v11, v12);
  }

  -[ICBackoffTimer scheduleToFire](v8, "scheduleToFire");
LABEL_10:

  objc_sync_exit(v5);
}

- (void)clearRetryForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;

  -[ICSearchIndexer retryTimers](self, "retryTimers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSearchIndexer retryTimers](self, "retryTimers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ICSearchIndexer clearRetryForSelector:].cold.1();

    objc_msgSend(v8, "invalidate");
    -[ICSearchIndexer retryTimers](self, "retryTimers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v6);

  }
  objc_sync_exit(v5);

}

- (void)clearObjectIDsToProcess
{
  void *v2;
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
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ICSearchIndexer dataSources](self, "dataSources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "clearObjectIDsToProcess");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)retryOnErrors
{
  return self->_retryOnErrors;
}

- (ICSelectorDelayer)changeProcessingDelayer
{
  return self->_changeProcessingDelayer;
}

- (NSMutableDictionary)retryTimers
{
  return self->_retryTimers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryTimers, 0);
  objc_storeStrong((id *)&self->_changeProcessingDelayer, 0);
  objc_storeStrong((id *)&self->_dataSourcesByIdentifier, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_indexingQueue, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

- (void)initWithSearchIndex:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DDAA5000, a2, v4, "ICSearchIndexer created operation queue %@", v5);

  OUTLINED_FUNCTION_13();
}

void __40__ICSearchIndexer_startObservingChanges__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Trying to listen for changes, but we are already", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __39__ICSearchIndexer_stopObservingChanges__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Trying to stop listening for changes, but we're not listening", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __33__ICSearchIndexer_processChanges__block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10_1(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1DDAA5000, v6, v4, "processChanges: Added operation %@ to operation queue %@", v5);

}

void __33__ICSearchIndexer_processChanges__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Processing changes with indexing operation %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __33__ICSearchIndexer_processChanges__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "No pending reindexing operation observed, creating new reindexing operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __33__ICSearchIndexer_processChanges__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Pending reindexing operation observed, Not creating new reindexing operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __36__ICSearchIndexer_removeDataSource___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Removing indexer data source: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DDAA5000, a2, v4, "cancelIndexingOperationsWithCompletionHandler: canceled all operations for operation queue %@", v5);

  OUTLINED_FUNCTION_13();
}

void __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Cancelling indexing operations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __65__ICSearchIndexer_cancelIndexingOperationsWithCompletionHandler___block_invoke_21_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Finished cancelling indexing operations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Finished remaining indexing operations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DDAA5000, a2, v4, "Starting to wait on indexer operation queue %@", v5);

  OUTLINED_FUNCTION_13();
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_3(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "indexingQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_1(&dword_1DDAA5000, a2, v4, "Starting to wait on indexing queue %@", v5);

  OUTLINED_FUNCTION_13();
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Index processing was scheduled, firing now", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Finishing remaining indexing operations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __66__ICSearchIndexer_finishRemainingOperationsWithCompletionHandler___block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Retry timer %@ was scheduled. Firing now.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deleteAllSearchableItemsWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Deleting all searchable items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Finished deleting all searchable items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __65__ICSearchIndexer_deleteAllSearchableItemsWithCompletionHandler___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_ERROR, "Error deleting all searchable items: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)pendingReindexingOperation
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "Did not find pending reindxing operations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __45__ICSearchIndexer_pendingReindexingOperation__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Found pending reindexing operation %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_10_1(a1, (uint64_t)a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_3(&dword_1DDAA5000, v6, v4, "reindexAllSearchableItemsInIndex: Added operation %@ to operation queue %@", v5);

}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Created Reindexing Operation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Reindexing all searchable items in searchable index: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_4(uint64_t a1, id *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_3(&dword_1DDAA5000, a3, v6, "Added completion handler operation %@ to operation queue: %@", (uint8_t *)&v7);

}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_2(&dword_1DDAA5000, v0, v1, "attaching completion handler to the pending reindexing operation", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __70__ICSearchIndexer_reindexAllSearchableItemsInIndex_completionHandler___block_invoke_41_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Finished reindexing all searchable items in index: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_3(&dword_1DDAA5000, v0, (uint64_t)v0, "Adding indexing operation %@ with objectIDURIs: %@", v1);
  OUTLINED_FUNCTION_1();
}

void __84__ICSearchIndexer_reindexSearchableItemsWithObjectIDURIs_inIndex_completionHandler___block_invoke_45_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Finished indexing operation %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)objectForManagedObjectIDURI:inContexts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Couldn't find object for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)objectForManagedObjectIDURI:inContexts:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Fetching object for objectIDURI %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __58__ICSearchIndexer_objectForManagedObjectIDURI_inContexts___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  OUTLINED_FUNCTION_9_1();
  v5 = v4;
  OUTLINED_FUNCTION_3(&dword_1DDAA5000, a3, v6, "Found %@ for %@", v7);

  OUTLINED_FUNCTION_13();
}

- (void)retrySelector:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3, double a4)
{
  *(_DWORD *)a2 = 138412546;
  *(_QWORD *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = a4;
  OUTLINED_FUNCTION_3(&dword_1DDAA5000, a3, (uint64_t)a3, "Scheduling selector %@ to retry in %.0fs", (uint8_t *)a2);
}

- (void)retrySelector:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Trying to retry %@, but it's already scheduled to be retried", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)clearRetryForSelector:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Clearing retry timer for selector: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
