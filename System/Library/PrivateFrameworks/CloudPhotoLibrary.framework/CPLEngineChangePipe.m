@implementation CPLEngineChangePipe

- (unint64_t)scopeType
{
  return 1;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v11;
  int v12;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  if (v12)
    -[CPLEngineChangePipe _notifyQueueRemovedChanges](self, "_notifyQueueRemovedChanges");
  return v12;
}

- (unint64_t)countOfQueuedBatches
{
  void *v2;
  unint64_t v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countOfQueuedBatches");

  return v3;
}

- (BOOL)isEmpty
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasQueuedBatches") ^ 1;

  return v3;
}

- (BOOL)hasQueuedBatches
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasQueuedBatches");

  return v3;
}

- (BOOL)appendChangeBatch:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  int v11;
  CPLEngineChangePipe *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7905();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412546;
      v12 = self;
      v13 = 2048;
      v14 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "%@ appending %lu changes", (uint8_t *)&v11, 0x16u);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "appendChangeBatch:error:", v6, a4);

  return v9;
}

- (BOOL)popChangeBatch:(id *)a3 error:(id *)a4
{
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v12;
  CPLEngineChangePipe *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "popChangeBatch:error:", a3, a4);

  if (v8 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7905();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(*a3, "count");
      v12 = 138412546;
      v13 = self;
      v14 = 2048;
      v15 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEBUG, "%@ popped %lu changes", (uint8_t *)&v12, 0x16u);
    }

  }
  return v8;
}

- (id)nextBatch
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  CPLEngineChangePipe *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage platformObject](self, "platformObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextBatch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7905();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v7 = 138412546;
      v8 = self;
      v9 = 2048;
      v10 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "%@ getting %lu changes", (uint8_t *)&v7, 0x16u);
    }

  }
  return v4;
}

- (BOOL)popNextBatchWithError:(id *)a3
{
  void *v5;
  int v6;
  NSObject *v7;
  int v9;
  CPLEngineChangePipe *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "popNextBatchWithError:", a3);

  if (v6 && !_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7905();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEBUG, "%@ popped next batch", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

- (BOOL)hasSomeChangeWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSomeChangeWithScopedIdentifier:", v4);

  return v6;
}

- (BOOL)hasSomeChangeInScopesWithIdentifiers:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSomeChangeInScopesWithIdentifiers:", v4);

  return v6;
}

- (BOOL)hasSomeChangeWithScopeFilter:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSomeChangeWithScopeFilter:", v4);

  return v6;
}

- (BOOL)deleteAllChangeBatchesWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  int v9;
  CPLEngineChangePipe *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7905();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "%@ deleting all batches", (uint8_t *)&v9, 0xCu);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deleteAllChangeBatchesWithError:", a3);

  if (v7)
    -[CPLEngineChangePipe _notifyQueueRemovedChanges](self, "_notifyQueueRemovedChanges");
  return v7;
}

- (BOOL)deleteAllChangesWithScopeFilter:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deleteAllChangesWithScopeFilter:error:", v6, a4);

  if (v8)
    -[CPLEngineChangePipe _notifyQueueRemovedChanges](self, "_notifyQueueRemovedChanges");
  return v8;
}

- (BOOL)compactChangeBatchesWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  int v9;
  CPLEngineChangePipe *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!_CPLSilentLogging)
  {
    __CPLStorageOSLogDomain_7905();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138412290;
      v10 = self;
      _os_log_impl(&dword_1B03C2000, v5, OS_LOG_TYPE_DEBUG, "%@ compacting batches", (uint8_t *)&v9, 0xCu);
    }

  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compactChangeBatchesWithError:", a3);

  if (v7)
    -[CPLEngineChangePipe _notifyQueueRemovedChanges](self, "_notifyQueueRemovedChanges");
  return v7;
}

- (id)allChangeBatches
{
  void *v2;
  void *v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allChangeBatches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)addDequeueObserver:(id)a3
{
  id v4;
  NSMutableArray *dequeueObservers;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  dequeueObservers = self->_dequeueObservers;
  v8 = v4;
  if (!dequeueObservers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_dequeueObservers;
    self->_dequeueObservers = v6;

    v4 = v8;
    dequeueObservers = self->_dequeueObservers;
  }
  -[NSMutableArray addObject:](dequeueObservers, "addObject:", v4);

}

- (id)addDequeueObserverWithDequeueSignalBlock:(id)a3
{
  id v4;
  CPLEngineDequeueObserver *v5;

  v4 = a3;
  v5 = -[CPLEngineDequeueObserver initWithDequeueSignalBlock:]([CPLEngineDequeueObserver alloc], "initWithDequeueSignalBlock:", v4);

  -[CPLEngineChangePipe addDequeueObserver:](self, "addDequeueObserver:", v5);
  return v5;
}

- (void)removeDequeueObserver:(id)a3
{
  -[NSMutableArray removeObject:](self->_dequeueObservers, "removeObject:", a3);
}

- (void)notifyClientWillAcknowledgeBatch:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_dequeueObservers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "clientWillAcknowledgeBatchBlock", (_QWORD)v11);
        v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, CPLEngineChangePipe *, id))v10)[2](v10, self, v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)notifyClientDidAcknowledgeBatch:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_dequeueObservers;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "clientDidAcknowledgeBatchBlock", (_QWORD)v11);
        v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, CPLEngineChangePipe *, id))v10)[2](v10, self, v4);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyQueueRemovedChanges
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_dequeueObservers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "changePipeDidRemoveChanges", (_QWORD)v9);
        v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, CPLEngineChangePipe *))v8)[2](v8, self);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)hasDequeueObservers
{
  return -[NSMutableArray count](self->_dequeueObservers, "count") != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dequeueObservers, 0);
}

@end
