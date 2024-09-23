@implementation HKChartCache

- (HKChartCache)init
{
  HKChartCache *v2;
  uint64_t v3;
  NSHashTable *observers;
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedResultsByIdentifier;
  NSMutableDictionary *v7;
  NSMutableDictionary *resultsLoadedByIdentifier;
  _HKChartCachePendingFetchOperationManager *v9;
  _HKChartCachePendingFetchOperationManager *pendingFetchOperationsManager;
  NSArray *bufferedIdentifiers;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKChartCache;
  v2 = -[HKChartCache init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedResultsByIdentifier = v2->_cachedResultsByIdentifier;
    v2->_cachedResultsByIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    resultsLoadedByIdentifier = v2->_resultsLoadedByIdentifier;
    v2->_resultsLoadedByIdentifier = v7;

    v9 = objc_alloc_init(_HKChartCachePendingFetchOperationManager);
    pendingFetchOperationsManager = v2->_pendingFetchOperationsManager;
    v2->_pendingFetchOperationsManager = v9;

    v2->_shouldBufferFetchOperations = 0;
    bufferedIdentifiers = v2->_bufferedIdentifiers;
    v2->_maxRetryCount = 3;
    v2->_bufferedIdentifiers = 0;

    objc_storeWeak((id *)&v2->_priorityDelegateForBufferedIdentifiers, 0);
  }
  return v2;
}

- (id)dataSourceRespectingType
{
  return self->_dataSource;
}

- (void)setShouldBufferFetchOperations:(BOOL)a3
{
  _BOOL4 shouldBufferFetchOperations;
  void *v5;
  void *v6;
  id WeakRetained;

  shouldBufferFetchOperations = self->_shouldBufferFetchOperations;
  self->_shouldBufferFetchOperations = a3;
  if (shouldBufferFetchOperations != a3 && !a3)
  {
    -[HKChartCache bufferedIdentifiers](self, "bufferedIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HKChartCache bufferedIdentifiers](self, "bufferedIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_priorityDelegateForBufferedIdentifiers);
      -[HKChartCache fetchResultsForIdentifiers:priorityDelegate:](self, "fetchResultsForIdentifiers:priorityDelegate:", v6, WeakRetained);

      -[HKChartCache setBufferedIdentifiers:](self, "setBufferedIdentifiers:", 0);
      -[HKChartCache setPriorityDelegateForBufferedIdentifiers:](self, "setPriorityDelegateForBufferedIdentifiers:", 0);
    }
  }
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_alertObserversDidUpdateResults
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "chartCacheDidUpdate:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (unint64_t)stateForIdentifier:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_resultsLoadedByIdentifier, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "BOOLValue"))
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)cachedResultsForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedResultsByIdentifier, "objectForKeyedSubscript:", a3);
}

- (void)fetchResultsForIdentifiers:(id)a3 priorityDelegate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  if (self->_shouldBufferFetchOperations)
  {
    v6 = a4;
    -[HKChartCache bufferedIdentifiers](self, "bufferedIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[HKChartCache bufferedIdentifiers](self, "bufferedIdentifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKChartCache setBufferedIdentifiers:](self, "setBufferedIdentifiers:", v9);

    }
    else
    {
      -[HKChartCache setBufferedIdentifiers:](self, "setBufferedIdentifiers:", v12);
    }
    -[HKChartCache setPriorityDelegateForBufferedIdentifiers:](self, "setPriorityDelegateForBufferedIdentifiers:", v6);
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0C99E20];
    v11 = a4;
    objc_msgSend(v10, "setWithArray:", v12);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HKChartCache _addFetchOperationsForIdentifiers:priorityDelegate:](self, "_addFetchOperationsForIdentifiers:priorityDelegate:", v6, v11);

  }
}

- (void)_removeFetchOperationsForIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[_HKChartCachePendingFetchOperationManager fetchOperationForIdentifier:](self->_pendingFetchOperationsManager, "fetchOperationForIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);
        -[_HKChartCachePendingFetchOperationManager removeFetchOperation:](self->_pendingFetchOperationsManager, "removeFetchOperation:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  -[HKOutstandingFetchOperationManager removeFetchOperations:](self->_operationManager, "removeFetchOperations:", v5);
}

- (void)_addFetchOperationsForIdentifiers:(id)a3 priorityDelegate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKChartCache.m"), 157, CFSTR("HKChartCache: fetch operation requested on non-main thread"));

        }
        if (!-[HKChartCache stateForIdentifier:](self, "stateForIdentifier:", v14))
        {
          -[HKChartCache _operationForIdentifier:priorityDelegate:](self, "_operationForIdentifier:priorityDelegate:", v14, v7);
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = (void *)v15;
            objc_msgSend(v8, "addObject:", v15);
            -[_HKChartCachePendingFetchOperationManager addFetchOperation:](self->_pendingFetchOperationsManager, "addFetchOperation:", v16);
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resultsLoadedByIdentifier, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v14);

          }
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  -[HKOutstandingFetchOperationManager addFetchOperations:](self->_operationManager, "addFetchOperations:", v8);
}

- (void)invalidateResultsForIdentifiers:(id)a3
{
  -[NSMutableDictionary removeObjectsForKeys:](self->_resultsLoadedByIdentifier, "removeObjectsForKeys:", a3);
  -[HKChartCache _alertObserversDidUpdateResults](self, "_alertObserversDidUpdateResults");
}

- (void)invalidateCache
{
  -[NSMutableDictionary removeAllObjects](self->_resultsLoadedByIdentifier, "removeAllObjects");
  -[HKChartCache _alertObserversDidUpdateResults](self, "_alertObserversDidUpdateResults");
}

- (id)_operationForIdentifier:(id)a3 priorityDelegate:(id)a4
{
  id v6;
  id v7;
  HKChartCacheDataSource *dataSource;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *, void *, void *, void *);
  void *v16;
  id v17;
  id v18;
  id v19;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  dataSource = self->_dataSource;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __57__HKChartCache__operationForIdentifier_priorityDelegate___block_invoke;
  v16 = &unk_1E9C456D0;
  objc_copyWeak(&v19, &location);
  v9 = v6;
  v17 = v9;
  v10 = v7;
  v18 = v10;
  -[HKChartCacheDataSource operationForIdentifier:priorityDelegate:completion:](dataSource, "operationForIdentifier:priorityDelegate:completion:", v9, v10, &v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", v9, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

void __57__HKChartCache__operationForIdentifier_priorityDelegate___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HKChartCache__operationForIdentifier_priorityDelegate___block_invoke_2;
  v13[3] = &unk_1E9C44EB0;
  objc_copyWeak(&v19, a1 + 6);
  v14 = v7;
  v15 = a1[4];
  v16 = a1[5];
  v17 = v8;
  v18 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v19);
}

void __57__HKChartCache__operationForIdentifier_priorityDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "_handleOperationCompletionWithOperation:identifier:priorityDelegate:results:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)_handleOperationCompletionWithOperation:(id)a3 identifier:(id)a4 priorityDelegate:(id)a5 results:(id)a6 error:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject **v16;
  NSObject *v17;
  uint64_t v18;
  int64_t maxRetryCount;
  NSObject *v20;
  NSObject *v21;
  NSMutableDictionary *cachedResultsByIdentifier;
  void *v23;
  int v24;
  id v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[_HKChartCachePendingFetchOperationManager removeFetchOperation:](self->_pendingFetchOperationsManager, "removeFetchOperation:", a3);
  if (v15)
  {
    _HKInitializeLogging();
    v16 = (NSObject **)MEMORY[0x1E0CB52C0];
    v17 = *MEMORY[0x1E0CB52C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
      -[HKChartCache _handleOperationCompletionWithOperation:identifier:priorityDelegate:results:error:].cold.2((uint64_t)self, (uint64_t)v15, v17);
    -[_HKChartCachePendingFetchOperationManager incrementRetryCountForIdentifier:](self->_pendingFetchOperationsManager, "incrementRetryCountForIdentifier:", v12);
    v18 = -[_HKChartCachePendingFetchOperationManager retryCountForIdentifier:](self->_pendingFetchOperationsManager, "retryCountForIdentifier:", v12);
    maxRetryCount = self->_maxRetryCount;
    _HKInitializeLogging();
    v20 = *v16;
    v21 = *v16;
    if (v18 <= maxRetryCount)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138412546;
        v25 = v12;
        v26 = 2048;
        v27 = v18;
        _os_log_impl(&dword_1D7813000, v20, OS_LOG_TYPE_DEFAULT, "[HKCC] Retrying fetch operation for identifier (%@) retry count (%ld)", (uint8_t *)&v24, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKChartCache _addFetchOperationsForIdentifiers:priorityDelegate:](self, "_addFetchOperationsForIdentifiers:priorityDelegate:", v23, v13);

    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[HKChartCache _handleOperationCompletionWithOperation:identifier:priorityDelegate:results:error:].cold.1((uint64_t)v12, v18, v20);
      -[_HKChartCachePendingFetchOperationManager resetRetryCountForIdentifier:](self->_pendingFetchOperationsManager, "resetRetryCountForIdentifier:", v12);
    }
  }
  else
  {
    cachedResultsByIdentifier = self->_cachedResultsByIdentifier;
    if (v14)
      -[NSMutableDictionary setObject:forKeyedSubscript:](cachedResultsByIdentifier, "setObject:forKeyedSubscript:", v14, v12);
    else
      -[NSMutableDictionary removeObjectForKey:](cachedResultsByIdentifier, "removeObjectForKey:", v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_resultsLoadedByIdentifier, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v12);
    -[_HKChartCachePendingFetchOperationManager resetRetryCountForIdentifier:](self->_pendingFetchOperationsManager, "resetRetryCountForIdentifier:", v12);
    -[HKChartCache _alertObserversDidUpdateResults](self, "_alertObserversDidUpdateResults");
  }

}

- (HKChartCacheDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (HKOutstandingFetchOperationManager)operationManager
{
  return self->_operationManager;
}

- (void)setOperationManager:(id)a3
{
  objc_storeStrong((id *)&self->_operationManager, a3);
}

- (BOOL)shouldBufferFetchOperations
{
  return self->_shouldBufferFetchOperations;
}

- (int64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(int64_t)a3
{
  self->_maxRetryCount = a3;
}

- (NSArray)bufferedIdentifiers
{
  return self->_bufferedIdentifiers;
}

- (void)setBufferedIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_bufferedIdentifiers, a3);
}

- (HKChartCachePriorityDelegate)priorityDelegateForBufferedIdentifiers
{
  return (HKChartCachePriorityDelegate *)objc_loadWeakRetained((id *)&self->_priorityDelegateForBufferedIdentifiers);
}

- (void)setPriorityDelegateForBufferedIdentifiers:(id)a3
{
  objc_storeWeak((id *)&self->_priorityDelegateForBufferedIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_priorityDelegateForBufferedIdentifiers);
  objc_storeStrong((id *)&self->_bufferedIdentifiers, 0);
  objc_storeStrong((id *)&self->_operationManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_resultsLoadedByIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingFetchOperationsManager, 0);
  objc_storeStrong((id *)&self->_cachedResultsByIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_handleOperationCompletionWithOperation:(NSObject *)a3 identifier:priorityDelegate:results:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, a2, a3, "[HKCC] Fetch operation for identifier (%@) surpassed max retry count (%ld). Failing.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

- (void)_handleOperationCompletionWithOperation:(NSObject *)a3 identifier:priorityDelegate:results:error:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_4(&dword_1D7813000, a2, a3, "[HKCC] Error fetching results from data source %@: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

@end
