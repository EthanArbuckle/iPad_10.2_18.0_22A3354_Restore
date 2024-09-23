@implementation FCKeyedOperationQueue

uint64_t __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_3(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_4;
  v5[3] = &unk_1E463D158;
  v11 = a2;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v9 = v3;
  v10 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

- (void)setExecutionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_executionQueue, a3);
}

- (FCKeyedOperationQueue)initWithDelegate:(id)a3 maxConcurrentOperationCount:(int64_t)a4
{
  id v6;
  FCKeyedOperationQueue *v7;
  FCKeyedOperationQueue *v8;
  uint64_t v9;
  NSMutableSet *keysForExecutingOperations;
  uint64_t v11;
  NSMutableOrderedSet *mutableKeyQueue;
  uint64_t v13;
  NSMutableDictionary *cancelHandlersByKey;
  dispatch_group_t v15;
  OS_dispatch_group *operationExecutionGroup;
  void *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "delegate");
    *(_DWORD *)buf = 136315906;
    v21 = "-[FCKeyedOperationQueue initWithDelegate:maxConcurrentOperationCount:]";
    v22 = 2080;
    v23 = "FCKeyedOperationQueue.m";
    v24 = 1024;
    v25 = 39;
    v26 = 2114;
    v27 = v18;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v19.receiver = self;
  v19.super_class = (Class)FCKeyedOperationQueue;
  v7 = -[FCKeyedOperationQueue init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v9 = objc_opt_new();
    keysForExecutingOperations = v8->_keysForExecutingOperations;
    v8->_keysForExecutingOperations = (NSMutableSet *)v9;

    v8->_maxConcurrentOperationCount = a4;
    v11 = objc_opt_new();
    mutableKeyQueue = v8->_mutableKeyQueue;
    v8->_mutableKeyQueue = (NSMutableOrderedSet *)v11;

    v13 = objc_opt_new();
    cancelHandlersByKey = v8->_cancelHandlersByKey;
    v8->_cancelHandlersByKey = (NSMutableDictionary *)v13;

    v15 = dispatch_group_create();
    operationExecutionGroup = v8->_operationExecutionGroup;
    v8->_operationExecutionGroup = (OS_dispatch_group *)v15;

  }
  return v8;
}

void __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  if (!*(_BYTE *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 56), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  -[FCKeyedOperationQueue _enqueueOperationIfNeeded](*(_QWORD *)(a1 + 64));
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    v3 = *(NSObject **)(v2 + 64);
  else
    v3 = 0;
  dispatch_group_leave(v3);
}

- (void)_enqueueOperationIfNeeded
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id WeakRetained;
  id v11;
  id v12;
  id v13;
  id v14;
  FCKeyedOperation *v15;
  void (**v16)(_QWORD);
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  FCKeyedOperation *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    if ((objc_msgSend((id)a1, "isSuspended") & 1) == 0)
    {
      v2 = *(id *)(a1 + 40);
      v3 = *(id *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 48);
      v5 = objc_msgSend(v2, "count");
      if (v4 == -1)
        v6 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v6 = v4;
      if (v5 < v6)
      {
        v7 = MEMORY[0x1E0C809B0];
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke;
        v30[3] = &unk_1E4649DD8;
        v8 = v2;
        v31 = v8;
        v9 = objc_msgSend(v3, "indexOfObjectPassingTest:", v30);
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
          v11 = 0;
        }
        else
        {
          objc_msgSend(v3, "objectAtIndexedSubscript:", v9);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          v12 = objc_loadWeakRetained((id *)(a1 + 16));
          WeakRetained = v12;
          if (v11 && v12)
          {
            objc_msgSend(v8, "addObject:", v11);
            v13 = *(id *)(a1 + 56);
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
            v19 = v7;
            v20 = 3221225472;
            v21 = __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_2;
            v22 = &unk_1E463BA00;
            v23 = objc_alloc_init(FCKeyedOperation);
            v24 = a1;
            WeakRetained = WeakRetained;
            v25 = WeakRetained;
            v11 = v11;
            v26 = v11;
            v27 = v3;
            v28 = v8;
            v14 = v13;
            v29 = v14;
            v15 = v23;
            v16 = (void (**)(_QWORD))_Block_copy(&v19);
            objc_msgSend((id)a1, "executionQueue", v19, v20, v21, v22);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v17)
            {
              objc_msgSend((id)a1, "executionQueue");
              v18 = objc_claimAutoreleasedReturnValue();
              dispatch_async(v18, v16);

            }
            else
            {
              v16[2](v16);
            }
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v11);
            -[FCKeyedOperationQueue _enqueueOperationIfNeeded](a1);

          }
        }

      }
    }
  }
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setSuspended:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  self->_suspended = a3;
  -[FCKeyedOperationQueue _enqueueOperationIfNeeded]((uint64_t)self);
}

- (void)setKeyQueue:(id)a3
{
  void *v4;
  id v5;
  NSMutableOrderedSet *v6;
  void *v7;
  NSMutableOrderedSet *v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3978];
  v5 = a3;
  objc_msgSend(v4, "isMainThread");
  if (self)
  {
    v6 = self->_mutableKeyQueue;
    -[NSMutableOrderedSet removeAllObjects](v6, "removeAllObjects");
    objc_msgSend(v5, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableOrderedSet addObjectsFromArray:](v6, "addObjectsFromArray:", v7);
    objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
    v8 = self->_mutableKeyQueue;
    v9 = self->_cancelHandlersByKey;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = (void *)-[NSMutableSet copy](self->_keysForExecutingOperations, "copy", 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((-[NSMutableOrderedSet containsObject:](v8, "containsObject:", v15) & 1) == 0)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
              objc_msgSend(v16, "cancel");

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

  }
  else
  {
    objc_msgSend(0, "removeAllObjects");
    objc_msgSend(v5, "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(0, "addObjectsFromArray:", v18);
  }
  -[FCKeyedOperationQueue _enqueueOperationIfNeeded]((uint64_t)self);
}

void __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__FCKeyedOperationQueue__enqueueOperationIfNeeded__block_invoke_3;
  v15[3] = &unk_1E4649E00;
  v16 = *(id *)(a1 + 64);
  v17 = *(id *)(a1 + 56);
  v18 = *(id *)(a1 + 72);
  v7 = *(id *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 40);
  v19 = v7;
  v20 = v8;
  v9 = v2;
  v10 = v5;
  v11 = v6;
  v12 = v15;
  if (v3 && !*(_BYTE *)(v3 + 8))
  {
    objc_msgSend(v10, "keyedOperationQueue:performAsyncOperationForKey:completion:", v9, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v4;
    v21[1] = 3221225472;
    v21[2] = __60__FCKeyedOperation_executeForQueue_delegate_key_completion___block_invoke;
    v21[3] = &unk_1E463AD10;
    v21[4] = v3;
    v22 = v13;
    v14 = v13;
    FCPerformBlockOnMainThread(v21);

  }
}

- (FCKeyedOperationQueue)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCKeyedOperationQueue init]";
    v9 = 2080;
    v10 = "FCKeyedOperationQueue.m";
    v11 = 1024;
    v12 = 34;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCKeyedOperationQueue init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (NSOrderedSet)keyQueue
{
  NSMutableOrderedSet *mutableKeyQueue;

  objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (self)
    mutableKeyQueue = self->_mutableKeyQueue;
  else
    mutableKeyQueue = 0;
  return (NSOrderedSet *)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:", mutableKeyQueue);
}

- (void)notifyWhenAllOperationsAreFinishedUsingBlock:(id)a3
{
  if (self)
    self = (FCKeyedOperationQueue *)self->_operationExecutionGroup;
  dispatch_group_notify(&self->super, MEMORY[0x1E0C80D38], a3);
}

- (FCKeyedOperationQueueDelegate)delegate
{
  return (FCKeyedOperationQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationExecutionGroup, 0);
  objc_storeStrong((id *)&self->_cancelHandlersByKey, 0);
  objc_storeStrong((id *)&self->_keysForExecutingOperations, 0);
  objc_storeStrong((id *)&self->_mutableKeyQueue, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
