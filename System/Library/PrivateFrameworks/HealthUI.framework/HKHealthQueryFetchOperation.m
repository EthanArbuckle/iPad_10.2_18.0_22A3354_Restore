@implementation HKHealthQueryFetchOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong(&self->_lockedFetchOperationManager, 0);
  objc_storeStrong(&self->_lockedClientCompletion, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)startOperationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id lockedFetchOperationManager;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_callbackLock);
  v5 = _Block_copy(v4);
  lockedFetchOperationManager = self->_lockedFetchOperationManager;
  self->_lockedFetchOperationManager = v5;

  os_unfair_lock_unlock(&self->_callbackLock);
  if (-[NSArray count](self->_queries, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_queries;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
  else
  {
    -[HKHealthQueryFetchOperation completedWithResults:error:](self, "completedWithResults:error:", MEMORY[0x1E0C9AA60], 0);
  }

}

- (void)completedWithResults:(id)a3 error:(id)a4
{
  id v6;
  void (**lockedClientCompletion)(id, HKHealthQueryFetchOperation *, id, id);
  id v8;
  void (**lockedFetchOperationManager)(id, BOOL, id);
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_callbackLock);
  lockedClientCompletion = (void (**)(id, HKHealthQueryFetchOperation *, id, id))self->_lockedClientCompletion;
  if (lockedClientCompletion)
  {
    lockedClientCompletion[2](lockedClientCompletion, self, v11, v6);
    v8 = self->_lockedClientCompletion;
    self->_lockedClientCompletion = 0;

  }
  lockedFetchOperationManager = (void (**)(id, BOOL, id))self->_lockedFetchOperationManager;
  if (lockedFetchOperationManager)
  {
    lockedFetchOperationManager[2](lockedFetchOperationManager, v6 == 0, v6);
    v10 = self->_lockedFetchOperationManager;
    self->_lockedFetchOperationManager = 0;

  }
  os_unfair_lock_unlock(&self->_callbackLock);

}

- (void)setQueries:(id)a3
{
  objc_storeStrong((id *)&self->_queries, a3);
}

- (HKHealthQueryFetchOperation)initWithHealthStore:(id)a3 operationDescription:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  HKHealthQueryFetchOperation *v11;
  HKHealthQueryFetchOperation *v12;
  void *v13;
  id lockedClientCompletion;
  id lockedFetchOperationManager;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKHealthQueryFetchOperation;
  v11 = -[HKFetchOperation initWithOperationDescription:](&v17, sel_initWithOperationDescription_, a4);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_healthStore, a3);
    v13 = _Block_copy(v10);
    lockedClientCompletion = v12->_lockedClientCompletion;
    v12->_lockedClientCompletion = v13;

    lockedFetchOperationManager = v12->_lockedFetchOperationManager;
    v12->_lockedFetchOperationManager = 0;

    v12->_callbackLock._os_unfair_lock_opaque = 0;
  }

  return v12;
}

- (void)stopOperation
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id lockedClientCompletion;
  id lockedFetchOperationManager;
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
  v3 = self->_queries;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++), (_QWORD)v10);
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  os_unfair_lock_lock(&self->_callbackLock);
  lockedClientCompletion = self->_lockedClientCompletion;
  self->_lockedClientCompletion = 0;

  lockedFetchOperationManager = self->_lockedFetchOperationManager;
  self->_lockedFetchOperationManager = 0;

  os_unfair_lock_unlock(&self->_callbackLock);
}

- (NSArray)queries
{
  return self->_queries;
}

@end
