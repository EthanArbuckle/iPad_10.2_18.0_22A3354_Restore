@implementation HMFTimerManager

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (HMFTimerManager)initWithOptions:(unint64_t)a3
{
  HMFTimerManagerDefaultDataSource *v5;
  HMFTimerManager *v6;

  v5 = objc_alloc_init(HMFTimerManagerDefaultDataSource);
  v6 = -[HMFTimerManager initWithOptions:dataSource:](self, "initWithOptions:dataSource:", a3, v5);

  return v6;
}

- (HMFTimerManager)initWithOptions:(unint64_t)a3 dataSource:(id)a4
{
  id v7;
  HMFTimerManager *v8;
  HMFTimerManager *v9;
  NSMutableArray *v10;
  NSMutableArray *sortedTimerContexts;
  HMFTimer *nextTimer;
  HMFTimerManagerTimerContext *nextTimerContext;
  const char *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *delegateQueue;
  objc_super v18;

  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMFTimerManager;
  v8 = -[HMFTimerManager init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sortedTimerContexts = v9->_sortedTimerContexts;
    v9->_sortedTimerContexts = v10;

    nextTimer = v9->_nextTimer;
    v9->_nextTimer = 0;

    nextTimerContext = v9->_nextTimerContext;
    v9->_nextTimerContext = 0;

    v9->_options = a3;
    objc_storeStrong((id *)&v9->_dataSource, a4);
    v14 = (const char *)HMFDispatchQueueName(v9, 0);
    v15 = dispatch_queue_create(v14, 0);
    delegateQueue = v9->_delegateQueue;
    v9->_delegateQueue = (OS_dispatch_queue *)v15;

  }
  return v9;
}

- (id)startTimerWithTimeInterval:(double)a3 object:(id)a4
{
  return -[HMFTimerManager startTimerWithTimeInterval:object:shouldReplace:](self, "startTimerWithTimeInterval:object:shouldReplace:", a4, 0, a3);
}

- (id)startTimerWithTimeInterval:(double)a3 andReplaceObject:(id)a4
{
  return -[HMFTimerManager startTimerWithTimeInterval:object:shouldReplace:](self, "startTimerWithTimeInterval:object:shouldReplace:", a4, 1, a3);
}

- (id)startTimerWithTimeInterval:(double)a3 object:(id)a4 shouldReplace:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  HMFTimerManagerTimerContext *v9;
  double v10;
  HMFTimerManagerTimerContext *v11;

  v5 = a5;
  v8 = a4;
  v9 = [HMFTimerManagerTimerContext alloc];
  -[HMFTimerManagerDataSource currentTime](self->_dataSource, "currentTime");
  v11 = -[HMFTimerManagerTimerContext initWithObject:expirationTime:](v9, "initWithObject:expirationTime:", v8, v10 + a3);
  os_unfair_lock_lock_with_options();
  if (v8 && v5)
    -[HMFTimerManager _removeTimerContextsWithMatchingObject:](self, "_removeTimerContextsWithMatchingObject:", v8);
  -[HMFTimerManager _addTimerContext:](self, "_addTimerContext:", v11);
  os_unfair_lock_unlock(&self->_lock);
  -[HMFTimerManager refreshTimerManager](self, "refreshTimerManager");

  return v11;
}

- (void)cancelTimerForContext:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMFTimerManager _removeTimerContext:](self, "_removeTimerContext:", v4);
  os_unfair_lock_unlock(&self->_lock);
  -[HMFTimerManager refreshTimerManager](self, "refreshTimerManager");

}

- (void)_addTimerContext:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *sortedTimerContexts;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  p_lock = &self->_lock;
  v9 = a3;
  os_unfair_lock_assert_owner(p_lock);
  sortedTimerContexts = self->_sortedTimerContexts;
  v6 = -[NSMutableArray count](sortedTimerContexts, "count");
  +[HMFTimerManagerTimerContext comparator](HMFTimerManagerTimerContext, "comparator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](sortedTimerContexts, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, v6, 1024, v7);

  -[NSMutableArray insertObject:atIndex:](self->_sortedTimerContexts, "insertObject:atIndex:", v9, v8);
}

- (void)_removeTimerContextsWithMatchingObject:(id)a3
{
  id v4;
  NSMutableArray *sortedTimerContexts;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  sortedTimerContexts = self->_sortedTimerContexts;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__HMFTimerManager__removeTimerContextsWithMatchingObject___block_invoke;
  v8[3] = &unk_1E3B37C80;
  v9 = v4;
  v7 = v4;
  -[NSMutableArray indexesOfObjectsPassingTest:](sortedTimerContexts, "indexesOfObjectsPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsAtIndexes:](self->_sortedTimerContexts, "removeObjectsAtIndexes:", v6);

}

uint64_t __58__HMFTimerManager__removeTimerContextsWithMatchingObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_removeTimerContext:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *sortedTimerContexts;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  sortedTimerContexts = self->_sortedTimerContexts;
  v7 = -[NSMutableArray count](sortedTimerContexts, "count");
  +[HMFTimerManagerTimerContext comparator](HMFTimerManagerTimerContext, "comparator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](sortedTimerContexts, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, v7, 256, v8);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_sortedTimerContexts, "removeObjectAtIndex:", v9);
}

- (BOOL)_suspendTimerManagerIfEmpty
{
  uint64_t v3;
  HMFTimer *nextTimer;
  HMFTimerManagerTimerContext *nextTimerContext;

  os_unfair_lock_assert_owner(&self->_lock);
  v3 = -[NSMutableArray count](self->_sortedTimerContexts, "count");
  if (!v3)
  {
    -[HMFTimer suspend](self->_nextTimer, "suspend");
    nextTimer = self->_nextTimer;
    self->_nextTimer = 0;

    nextTimerContext = self->_nextTimerContext;
    self->_nextTimerContext = 0;

  }
  return v3 == 0;
}

- (void)_refreshNextTimerIfNeededWithTimeInterval:(double)a3
{
  HMFTimerManagerTimerContext *nextTimerContext;
  HMFTimerManagerTimerContext *v6;
  HMFTimerManagerTimerContext *v7;
  HMFTimerManagerTimerContext *v8;
  HMFTimer *v9;
  HMFTimer *nextTimer;

  os_unfair_lock_assert_owner(&self->_lock);
  if (!-[HMFTimerManager _suspendTimerManagerIfEmpty](self, "_suspendTimerManagerIfEmpty"))
  {
    nextTimerContext = self->_nextTimerContext;
    if (!nextTimerContext
      || (-[NSMutableArray firstObject](self->_sortedTimerContexts, "firstObject"),
          v6 = (HMFTimerManagerTimerContext *)objc_claimAutoreleasedReturnValue(),
          v6,
          nextTimerContext != v6))
    {
      -[NSMutableArray firstObject](self->_sortedTimerContexts, "firstObject");
      v7 = (HMFTimerManagerTimerContext *)objc_claimAutoreleasedReturnValue();
      v8 = self->_nextTimerContext;
      self->_nextTimerContext = v7;

      -[HMFTimerManagerDataSource timerWithTimeInterval:options:](self->_dataSource, "timerWithTimeInterval:options:", self->_options, a3);
      v9 = (HMFTimer *)objc_claimAutoreleasedReturnValue();
      nextTimer = self->_nextTimer;
      self->_nextTimer = v9;

      -[HMFTimer setDelegate:](self->_nextTimer, "setDelegate:", self);
      -[HMFTimer setDelegateQueue:](self->_nextTimer, "setDelegateQueue:", self->_delegateQueue);
      -[HMFTimer resume](self->_nextTimer, "resume");
    }
  }
}

- (id)_removeExpiredTimerContextsAndRefreshNextTimer
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_sortedTimerContexts;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      objc_msgSend(v9, "expirationTime", (_QWORD)v15);
      v11 = v10;
      -[HMFTimerManagerDataSource currentTime](self->_dataSource, "currentTime");
      v13 = v11 - v12;
      if (v13 > 0.0)
        break;
      objc_msgSend(v3, "addObject:", v9);
      if (v6 == ++v8)
      {
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v13 = 0.0;
  }

  if (objc_msgSend(v3, "count"))
    -[NSMutableArray removeObjectsInRange:](self->_sortedTimerContexts, "removeObjectsInRange:", 0, objc_msgSend(v3, "count"));
  -[HMFTimerManager _refreshNextTimerIfNeededWithTimeInterval:](self, "_refreshNextTimerIfNeededWithTimeInterval:", v13, (_QWORD)v15);
  return v3;
}

- (void)refreshTimerManager
{
  -[HMFTimerManager refreshTimerManagerWithShouldDispatchNotifications:](self, "refreshTimerManagerWithShouldDispatchNotifications:", 1);
}

- (void)refreshTimerManagerWithShouldDispatchNotifications:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  id v6;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[HMFTimerManager _suspendTimerManagerIfEmpty](self, "_suspendTimerManagerIfEmpty"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[HMFTimerManager _removeExpiredTimerContextsAndRefreshNextTimer](self, "_removeExpiredTimerContextsAndRefreshNextTimer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    -[HMFTimerManager notifyDidFireForTimerContexts:shouldDispatch:](self, "notifyDidFireForTimerContexts:shouldDispatch:", v6, v3);

  }
}

- (void)notifyDidFireForTimerContexts:(id)a3 shouldDispatch:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD block[5];
  id v11;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[HMFTimerManager delegateQueue](self, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__HMFTimerManager_notifyDidFireForTimerContexts_shouldDispatch___block_invoke;
      block[3] = &unk_1E3B37CA8;
      block[4] = self;
      v11 = v6;
      dispatch_async(v8, block);

    }
    else
    {
      dispatch_assert_queue_V2(v7);

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __64__HMFTimerManager_notifyDidFireForTimerContexts_shouldDispatch___block_invoke_2;
      v9[3] = &unk_1E3B37CD0;
      v9[4] = self;
      objc_msgSend(v6, "na_each:", v9);
    }
  }

}

uint64_t __64__HMFTimerManager_notifyDidFireForTimerContexts_shouldDispatch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDidFireForTimerContexts:shouldDispatch:", *(_QWORD *)(a1 + 40), 0);
}

void __64__HMFTimerManager_notifyDidFireForTimerContexts_shouldDispatch___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timerManager:didFireForTimerContext:", *(_QWORD *)(a1 + 32), v4);

}

- (void)timerDidFire:(id)a3
{
  NSObject *v4;

  -[HMFTimerManager delegateQueue](self, "delegateQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMFTimerManager refreshTimerManagerWithShouldDispatchNotifications:](self, "refreshTimerManagerWithShouldDispatchNotifications:", 0);
}

- (HMFTimerManagerDelegate)delegate
{
  return (HMFTimerManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_sortedTimerContexts, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_nextTimerContext, 0);
  objc_storeStrong((id *)&self->_nextTimer, 0);
}

@end
