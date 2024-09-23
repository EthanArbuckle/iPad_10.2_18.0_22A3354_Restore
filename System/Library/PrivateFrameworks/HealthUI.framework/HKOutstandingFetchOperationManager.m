@implementation HKOutstandingFetchOperationManager

+ (id)sharedOperationManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HKOutstandingFetchOperationManager_sharedOperationManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedOperationManager_onceToken != -1)
    dispatch_once(&sharedOperationManager_onceToken, block);
  return (id)_outstandingFetchOperationManager;
}

- (void)_rebalanceFetchOperations
{
  if (self->_needsRebalanceFetchOperations)
  {
    -[HKOutstandingFetchOperationManager _fillActiveFetchOperations](self, "_fillActiveFetchOperations");
    self->_needsRebalanceFetchOperations = 0;
  }
}

uint64_t __61__HKOutstandingFetchOperationManager__executeFetchOperation___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_logOperationCompletion:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_removeFetchOperationFromActiveOperations:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsRebalanceFetchOperations");
}

- (BOOL)_removeFetchOperationFromActiveOperations:(id)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[NSMutableArray indexOfObject:](self->_activeFetchOperations, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_activeFetchOperations, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopOperation");
    objc_msgSend(v5, "_setDelegate:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->_activeFetchOperations, "removeObjectAtIndex:", v4);

  }
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_fillActiveFetchOperations
{
  NSMutableArray *i;
  void *v4;
  void *v5;

  for (i = self->_activeFetchOperations;
        (unint64_t)-[NSMutableArray count](i, "count") < self->_maxConcurrentFetchOperations
     && -[NSMutableArray count](self->_pendingHighPriorityFetchOperations, "count");
        i = self->_activeFetchOperations)
  {
    -[NSMutableArray firstObject](self->_pendingHighPriorityFetchOperations, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOutstandingFetchOperationManager _executeFetchOperation:](self, "_executeFetchOperation:", v4);
    -[NSMutableArray removeObjectAtIndex:](self->_pendingHighPriorityFetchOperations, "removeObjectAtIndex:", 0);

  }
  if (-[HKOutstandingFetchOperationManager _noHighPriorityActiveOperations](self, "_noHighPriorityActiveOperations"))
  {
    while ((unint64_t)-[NSMutableArray count](self->_activeFetchOperations, "count") < self->_maxConcurrentFetchOperations
         && -[NSMutableArray count](self->_pendingNormalPriorityFetchOperations, "count"))
    {
      -[NSMutableArray firstObject](self->_pendingNormalPriorityFetchOperations, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOutstandingFetchOperationManager _executeFetchOperation:](self, "_executeFetchOperation:", v5);
      -[NSMutableArray removeObjectAtIndex:](self->_pendingNormalPriorityFetchOperations, "removeObjectAtIndex:", 0);

    }
  }
}

- (void)_logOperationCompletion:(id)a3
{
  id v3;
  double v4;
  double v5;
  __CFString *v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    objc_msgSend(v3, "operationDescription");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("Redacted Description");
  }
  _HKInitializeLogging();
  HKUILogCharting();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "executionTime");
    v9 = v5 - v8;
    objc_msgSend(v3, "executionTime");
    v11 = v10;
    objc_msgSend(v3, "queueTime");
    v13 = 134218498;
    v14 = v9;
    v15 = 2048;
    v16 = v11 - v12;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1D7813000, v7, OS_LOG_TYPE_DEFAULT, "ChartQuery: running %lgs queued %lgs for %@", (uint8_t *)&v13, 0x20u);
  }

}

- (void)_logOperationStart:(id)a3
{
  id v3;
  __CFString *v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(MEMORY[0x1E0CB6F18], "isAppleInternalInstall"))
  {
    objc_msgSend(v3, "operationDescription");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("Redacted Description");
  }
  _HKInitializeLogging();
  HKUILogCharting();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = objc_msgSend(v3, "highPriority");
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1D7813000, v5, OS_LOG_TYPE_DEFAULT, "ChartQuery: highpriority %d for %@", (uint8_t *)v6, 0x12u);
  }

}

- (void)addFetchOperation:(id)a3
{
  HKOutstandingFetchOperationManager *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v10, "_delegate");
  v5 = (HKOutstandingFetchOperationManager *)objc_claimAutoreleasedReturnValue();

  if (v5 != self)
  {
    objc_msgSend(v10, "_delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOutstandingFetchOperationManager.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[fetchOperation _delegate] == nil"));

    }
    objc_msgSend(v10, "_setDelegate:", self);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    objc_msgSend(v10, "setQueueTime:");
    v7 = objc_msgSend(v10, "highPriority");
    v8 = 16;
    if (v7)
      v8 = 24;
    objc_msgSend(*(id *)((char *)&self->super.isa + v8), "addObject:", v10);
    -[HKOutstandingFetchOperationManager _setNeedsRebalanceFetchOperations](self, "_setNeedsRebalanceFetchOperations");
  }

}

- (BOOL)_noHighPriorityActiveOperations
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
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
  v2 = self->_activeFetchOperations;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "highPriority", (_QWORD)v9) & 1) != 0)
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (void)_setNeedsRebalanceFetchOperations
{
  uint64_t v2;
  _QWORD block[5];

  if (!self->_needsRebalanceFetchOperations)
  {
    v2 = MEMORY[0x1E0C809B0];
    self->_needsRebalanceFetchOperations = 1;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __71__HKOutstandingFetchOperationManager__setNeedsRebalanceFetchOperations__block_invoke;
    block[3] = &unk_1E9C3F0D0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_executeFetchOperation:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  HKOutstandingFetchOperationManager *v10;
  id v11;

  v4 = a3;
  -[HKOutstandingFetchOperationManager _logOperationStart:](self, "_logOperationStart:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setExecutionTime:");
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __61__HKOutstandingFetchOperationManager__executeFetchOperation___block_invoke;
  v9 = &unk_1E9C44D08;
  v10 = self;
  v11 = v4;
  v5 = v4;
  objc_msgSend(v5, "startOperationWithCompletion:", &v6);
  -[NSMutableArray addObject:](self->_activeFetchOperations, "addObject:", v5, v6, v7, v8, v9, v10);

}

uint64_t __71__HKOutstandingFetchOperationManager__setNeedsRebalanceFetchOperations__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rebalanceFetchOperations");
}

void __61__HKOutstandingFetchOperationManager__executeFetchOperation___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__HKOutstandingFetchOperationManager__executeFetchOperation___block_invoke_2;
  v2[3] = &unk_1E9C3FC50;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x1E0C80D38], v2);

}

+ (void)setSharedOperationManager:(id)a3
{
  objc_storeStrong((id *)&_outstandingFetchOperationManager, a3);
}

void __60__HKOutstandingFetchOperationManager_sharedOperationManager__block_invoke(uint64_t a1)
{
  void *v1;
  HKOutstandingFetchOperationManager *v2;

  v1 = *(void **)(a1 + 32);
  v2 = -[HKOutstandingFetchOperationManager initWithMaxConcurrentFetchOperations:]([HKOutstandingFetchOperationManager alloc], "initWithMaxConcurrentFetchOperations:", 5);
  objc_msgSend(v1, "setSharedOperationManager:", v2);

}

- (HKOutstandingFetchOperationManager)initWithMaxConcurrentFetchOperations:(int64_t)a3
{
  HKOutstandingFetchOperationManager *v4;
  HKOutstandingFetchOperationManager *v5;
  NSMutableArray *v6;
  NSMutableArray *pendingNormalPriorityFetchOperations;
  NSMutableArray *v8;
  NSMutableArray *pendingHighPriorityFetchOperations;
  NSMutableArray *v10;
  NSMutableArray *activeFetchOperations;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKOutstandingFetchOperationManager;
  v4 = -[HKOutstandingFetchOperationManager init](&v13, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxConcurrentFetchOperations = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingNormalPriorityFetchOperations = v5->_pendingNormalPriorityFetchOperations;
    v5->_pendingNormalPriorityFetchOperations = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingHighPriorityFetchOperations = v5->_pendingHighPriorityFetchOperations;
    v5->_pendingHighPriorityFetchOperations = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activeFetchOperations = v5->_activeFetchOperations;
    v5->_activeFetchOperations = v10;

  }
  return v5;
}

- (void)setMaxConcurrentFetchOperations:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  self->_maxConcurrentFetchOperations = a3;
  -[HKOutstandingFetchOperationManager _setNeedsRebalanceFetchOperations](self, "_setNeedsRebalanceFetchOperations");
}

- (void)addFetchOperations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HKOutstandingFetchOperationManager addFetchOperation:](self, "addFetchOperation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeFetchOperations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[HKOutstandingFetchOperationManager removeFetchOperation:](self, "removeFetchOperation:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeFetchOperation:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[HKOutstandingFetchOperationManager _removeFetchOperationFromPendingOperations:](self, "_removeFetchOperationFromPendingOperations:", v4)|| -[HKOutstandingFetchOperationManager _removeFetchOperationFromActiveOperations:](self, "_removeFetchOperationFromActiveOperations:", v4))
  {
    -[HKOutstandingFetchOperationManager _setNeedsRebalanceFetchOperations](self, "_setNeedsRebalanceFetchOperations");
  }

}

- (BOOL)_removeFetchOperationFromPendingOperations:(id)a3
{
  id v4;
  NSMutableArray **p_pendingNormalPriorityFetchOperations;
  uint64_t v6;
  NSMutableArray **p_pendingHighPriorityFetchOperations;
  NSMutableArray *pendingHighPriorityFetchOperations;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  p_pendingNormalPriorityFetchOperations = &self->_pendingNormalPriorityFetchOperations;
  v6 = -[NSMutableArray indexOfObject:](self->_pendingNormalPriorityFetchOperations, "indexOfObject:", v4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v6;
LABEL_6:
    -[NSMutableArray objectAtIndexedSubscript:](*p_pendingNormalPriorityFetchOperations, "objectAtIndexedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_setDelegate:", 0);
    -[NSMutableArray removeObjectAtIndex:](*p_pendingNormalPriorityFetchOperations, "removeObjectAtIndex:", v11);

    v10 = 1;
    goto LABEL_7;
  }
  pendingHighPriorityFetchOperations = self->_pendingHighPriorityFetchOperations;
  p_pendingHighPriorityFetchOperations = &self->_pendingHighPriorityFetchOperations;
  v9 = -[NSMutableArray indexOfObject:](pendingHighPriorityFetchOperations, "indexOfObject:", v4);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v9;
    p_pendingNormalPriorityFetchOperations = p_pendingHighPriorityFetchOperations;
    goto LABEL_6;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)fetchOperationDidUpdatePriority:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (-[HKOutstandingFetchOperationManager _removeFetchOperationFromPendingOperations:](self, "_removeFetchOperationFromPendingOperations:", v4))
  {
    -[HKOutstandingFetchOperationManager addFetchOperation:](self, "addFetchOperation:", v4);
  }

}

- (int64_t)maxConcurrentFetchOperations
{
  return self->_maxConcurrentFetchOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFetchOperations, 0);
  objc_storeStrong((id *)&self->_pendingHighPriorityFetchOperations, 0);
  objc_storeStrong((id *)&self->_pendingNormalPriorityFetchOperations, 0);
}

@end
