@implementation HMDSyncOperationManager

- (HMDSyncOperationManager)initWithClientQueue:(id)a3 dataSource:(id)a4
{
  return -[HMDSyncOperationManager initWithClientQueue:dataSource:timerFactory:](self, "initWithClientQueue:dataSource:timerFactory:", a3, a4, &__block_literal_global_129_132425);
}

- (HMDSyncOperationManager)initWithClientQueue:(id)a3 dataSource:(id)a4 timerFactory:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  HMDSyncOperationManager *v11;
  uint64_t v12;
  OS_os_log *logger;
  id v14;
  char *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  dispatch_queue_t v19;
  const char *v20;
  void *v21;
  id timerFactory;
  HMDSyncOperationQueue *v23;
  uint64_t v24;
  HMDSyncOperationQueue *cloudPushOperations;
  uint64_t v26;
  NSMutableArray *cloudVerifyAccountOperations;
  HMDSyncOperationQueue *v28;
  HMDSyncOperationQueue *cloudFetchOperations;
  uint64_t v30;
  NSMutableArray *cloudZonePushOperationQueues;
  uint64_t v32;
  NSMutableDictionary *cloudZonePushOperationQueuesMap;
  uint64_t v34;
  NSMutableArray *cloudZoneFetchOperationQueues;
  uint64_t v36;
  NSMutableDictionary *cloudZoneFetchOperationQueuesMap;
  uint64_t v38;
  NSMutableArray *cloudCancelPauseOperations;
  uint64_t v40;
  NSMutableArray *cloudQueryDatabaseOperations;
  uint64_t v42;
  NSMutableArray *cloudPostFetchOperations;
  objc_super v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)HMDSyncOperationManager;
  v11 = -[HMDSyncOperationManager init](&v45, sel_init);
  if (v11)
  {
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    logger = v11->_logger;
    v11->_logger = (OS_os_log *)v12;

    HMDispatchQueueNameString();
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (char *)objc_msgSend(v14, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(v15, v16);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v17;

    v19 = v8;
    if (!v8)
    {
      HMDispatchQueueNameString();
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = (const char *)objc_msgSend(v14, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      v19 = dispatch_queue_create(v20, (dispatch_queue_attr_t)v15);
    }
    objc_storeStrong((id *)&v11->_clientQueue, v19);
    if (!v8)
    {

    }
    objc_storeWeak((id *)&v11->_dataSource, v9);
    v11->_lock._os_unfair_lock_opaque = 0;
    v21 = _Block_copy(v10);
    timerFactory = v11->_timerFactory;
    v11->_timerFactory = v21;

    v23 = [HMDSyncOperationQueue alloc];
    v24 = -[HMDSyncOperationQueue initName:syncManager:initialDelay:initialBackoff:hasBackoff:](v23, "initName:syncManager:initialDelay:initialBackoff:hasBackoff:", CFSTR("LegacyPush"), v11, 1, (double)(unint64_t)cloudUploadTimerInterval, (double)(unint64_t)cloudUploadTimerInterval);
    cloudPushOperations = v11->_cloudPushOperations;
    v11->_cloudPushOperations = (HMDSyncOperationQueue *)v24;

    v11->_pauseCloudPushLevel = 0;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v26 = objc_claimAutoreleasedReturnValue();
    cloudVerifyAccountOperations = v11->_cloudVerifyAccountOperations;
    v11->_cloudVerifyAccountOperations = (NSMutableArray *)v26;

    v28 = -[HMDSyncOperationQueue initName:syncManager:initialDelay:initialBackoff:hasBackoff:]([HMDSyncOperationQueue alloc], "initName:syncManager:initialDelay:initialBackoff:hasBackoff:", CFSTR("LegacyFetch"), v11, 0, 0.0, 0.0);
    cloudFetchOperations = v11->_cloudFetchOperations;
    v11->_cloudFetchOperations = v28;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = objc_claimAutoreleasedReturnValue();
    cloudZonePushOperationQueues = v11->_cloudZonePushOperationQueues;
    v11->_cloudZonePushOperationQueues = (NSMutableArray *)v30;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v32 = objc_claimAutoreleasedReturnValue();
    cloudZonePushOperationQueuesMap = v11->_cloudZonePushOperationQueuesMap;
    v11->_cloudZonePushOperationQueuesMap = (NSMutableDictionary *)v32;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v34 = objc_claimAutoreleasedReturnValue();
    cloudZoneFetchOperationQueues = v11->_cloudZoneFetchOperationQueues;
    v11->_cloudZoneFetchOperationQueues = (NSMutableArray *)v34;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v36 = objc_claimAutoreleasedReturnValue();
    cloudZoneFetchOperationQueuesMap = v11->_cloudZoneFetchOperationQueuesMap;
    v11->_cloudZoneFetchOperationQueuesMap = (NSMutableDictionary *)v36;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v38 = objc_claimAutoreleasedReturnValue();
    cloudCancelPauseOperations = v11->_cloudCancelPauseOperations;
    v11->_cloudCancelPauseOperations = (NSMutableArray *)v38;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v40 = objc_claimAutoreleasedReturnValue();
    cloudQueryDatabaseOperations = v11->_cloudQueryDatabaseOperations;
    v11->_cloudQueryDatabaseOperations = (NSMutableArray *)v40;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v42 = objc_claimAutoreleasedReturnValue();
    cloudPostFetchOperations = v11->_cloudPostFetchOperations;
    v11->_cloudPostFetchOperations = (NSMutableArray *)v42;

    v11->_syncLoopDialogDisplayed = 0;
  }

  return v11;
}

- (HMDSyncOperationQueue)cloudPushOperations
{
  os_unfair_lock_s *p_lock;
  HMDSyncOperationQueue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cloudPushOperations;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)cloudVerifyAccountOperations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_cloudVerifyAccountOperations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (HMDSyncOperationQueue)cloudFetchOperations
{
  os_unfair_lock_s *p_lock;
  HMDSyncOperationQueue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_cloudFetchOperations;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)cloudZonePushOperationQueues
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_cloudZonePushOperationQueues, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)cloudZoneFetchOperations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_cloudZoneFetchOperationQueues, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSArray)cloudCancelPauseOperations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_cloudCancelPauseOperations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)cloudQueryDatabaseOperations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_cloudQueryDatabaseOperations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (NSArray)cloudPostFetchOperations
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_cloudPostFetchOperations, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (void)addCloudVerifyAccountOperation:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_cloudVerifyAccountOperations, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)popCloudVerifyAccountOperation
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray count](self->_cloudVerifyAccountOperations, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_cloudVerifyAccountOperations, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_cloudVerifyAccountOperations, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)addCloudZonePushOperation:(id)a3 delay:(double)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_lock;
  id v9;
  char v10;
  HMDSyncOperationQueue *v11;

  v6 = a3;
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cloudZonePushOperationQueuesMap, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = [HMDSyncOperationQueue alloc];
    v9 = -[HMDSyncOperationQueue initName:syncManager:initialDelay:initialBackoff:hasBackoff:](v11, "initName:syncManager:initialDelay:initialBackoff:hasBackoff:", v7, self, 1, (double)(unint64_t)cloudZoneUploadTimerInitialInterval, (double)(unint64_t)cloudZoneUploadTimerInterval);
    -[NSMutableArray addObject:](self->_cloudZonePushOperationQueues, "addObject:", v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cloudZonePushOperationQueuesMap, "setObject:forKeyedSubscript:", v9, v7);
    v10 = objc_msgSend(v9, "isInMaximumTimeInterval");
  }
  objc_msgSend(v9, "addOperation:withDelay:", v6, a4);
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)removeCloudZonePushOperationQueue:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *cloudZonePushOperationQueuesMap;
  void *v6;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_cloudZonePushOperationQueues, "removeObject:", v7);
  cloudZonePushOperationQueuesMap = self->_cloudZonePushOperationQueuesMap;
  objc_msgSend(v7, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](cloudZonePushOperationQueuesMap, "setObject:forKeyedSubscript:", 0, v6);

  os_unfair_lock_unlock(p_lock);
}

- (id)popCloudZonePushOperationAndMoveQueueToEnd
{
  os_unfair_lock_s *p_lock;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)-[NSMutableArray copy](self->_cloudZonePushOperationQueues, "copy", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "nextOperation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[NSMutableArray removeObject:](self->_cloudZonePushOperationQueues, "removeObject:", v8);
          if (objc_msgSend(v8, "countTotal") <= 0
            && (objc_msgSend(v8, "backoffTimer"),
                v10 = (void *)objc_claimAutoreleasedReturnValue(),
                v11 = v10 == 0,
                v10,
                v11))
          {
            objc_msgSend(v8, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cloudZonePushOperationQueuesMap, "setObject:forKeyedSubscript:", 0, v13);

          }
          else
          {
            -[NSMutableArray addObject:](self->_cloudZonePushOperationQueues, "addObject:", v8);
          }
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (BOOL)addCloudZoneFetchOperation:(id)a3 delay:(double)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cloudZoneFetchOperationQueuesMap, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[HMDSyncOperationQueue initName:syncManager:initialDelay:initialBackoff:hasBackoff:]([HMDSyncOperationQueue alloc], "initName:syncManager:initialDelay:initialBackoff:hasBackoff:", v7, self, 0, 0.0, 0.0);
    -[NSMutableArray addObject:](self->_cloudZoneFetchOperationQueues, "addObject:", v8);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cloudZoneFetchOperationQueuesMap, "setObject:forKeyedSubscript:", v8, v7);
  }
  objc_msgSend(v8, "addOperation:withDelay:", v6, a4);
  os_unfair_lock_unlock(&self->_lock);

  return 0;
}

- (void)removeCloudZoneFetchOperationQueue:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *cloudZoneFetchOperationQueuesMap;
  void *v6;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray removeObject:](self->_cloudZoneFetchOperationQueues, "removeObject:", v7);
  cloudZoneFetchOperationQueuesMap = self->_cloudZoneFetchOperationQueuesMap;
  objc_msgSend(v7, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](cloudZoneFetchOperationQueuesMap, "setObject:forKeyedSubscript:", 0, v6);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)popCloudZoneFetchOperationAndMoveQueueToEnd:(id *)a3
{
  void *v5;
  id v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  id v13;
  void *v14;
  os_unfair_lock_t lock;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v5 = (void *)-[NSMutableArray copy](self->_cloudZoneFetchOperationQueues, "copy");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "countTotal") != 0;
        objc_msgSend(v11, "nextOperation");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v7 |= v12;
        *a3 = v13;
        if (v13)
        {
          -[NSMutableArray removeObject:](self->_cloudZoneFetchOperationQueues, "removeObject:", v11);
          if (objc_msgSend(v11, "countTotal") < 1)
          {
            objc_msgSend(v11, "name");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cloudZoneFetchOperationQueuesMap, "setObject:forKeyedSubscript:", 0, v14);

          }
          else
          {
            -[NSMutableArray addObject:](self->_cloudZoneFetchOperationQueues, "addObject:", v11);
          }
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(lock);
  return v7 & 1;
}

- (void)addCloudCancelPauseOperation:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableArray addObject:](self->_cloudCancelPauseOperations, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)popCloudCancelPauseOperation
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray count](self->_cloudCancelPauseOperations, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_cloudCancelPauseOperations, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_cloudCancelPauseOperations, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)addCloudQueryDatabaseOperationIfNonePresent:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[NSMutableArray count](self->_cloudQueryDatabaseOperations, "count");
  if (!v5)
    -[NSMutableArray addObject:](self->_cloudQueryDatabaseOperations, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

  return v5 == 0;
}

- (id)popCloudQueryDatabaseOperation
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray count](self->_cloudQueryDatabaseOperations, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_cloudQueryDatabaseOperations, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_cloudQueryDatabaseOperations, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)addCloudPostFetchOperationIfNonePresent:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  v5 = -[NSMutableArray count](self->_cloudPostFetchOperations, "count");
  if (!v5)
    -[NSMutableArray addObject:](self->_cloudPostFetchOperations, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

  return v5 == 0;
}

- (BOOL)dropCloudPostFetchOperationsIfPresent
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSMutableArray count](self->_cloudPostFetchOperations, "count");
  if (v4)
  {
    v5 = (void *)-[NSMutableArray copy](self->_cloudPostFetchOperations, "copy");
    -[NSMutableArray removeAllObjects](self->_cloudPostFetchOperations, "removeAllObjects");
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        -[HMDSyncOperationManager _dropWithoutAlreadyScheduledOperation:](self, "_dropWithoutAlreadyScheduledOperation:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4 != 0;
}

- (id)popCloudPostFetchOperation
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (-[NSMutableArray count](self->_cloudPostFetchOperations, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_cloudPostFetchOperations, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_cloudPostFetchOperations, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSString)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@, Push Operations = %@, Verify Account Operations = %@, Fetch Operations = %@, Zone Push = %@, Zone Fetch = %@, Cancel = %@, Query = %@>, Post Fetch = %@"), objc_opt_class(), self->_cloudPushOperations, self->_cloudVerifyAccountOperations, self->_cloudFetchOperations, self->_cloudZonePushOperationQueues, self->_cloudZoneFetchOperationQueues, self->_cloudCancelPauseOperations, self->_cloudQueryDatabaseOperations, self->_cloudPostFetchOperations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSString *)v4;
}

- (id)dumpState
{
  void *v3;
  os_unfair_lock_s *p_lock;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDSyncOperationQueue description](self->_cloudPushOperations, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v6 = self->_cloudVerifyAccountOperations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v59;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v9), "description");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    }
    while (v7);
  }

  -[HMDSyncOperationQueue description](self->_cloudFetchOperations, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v12 = self->_cloudZonePushOperationQueues;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v55;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v55 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v15), "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
    }
    while (v13);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v17 = self->_cloudZoneFetchOperationQueues;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v51;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v51 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v20), "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
    }
    while (v18);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v22 = self->_cloudCancelPauseOperations;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v47;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v25), "description");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v46, v64, 16);
    }
    while (v23);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v27 = self->_cloudQueryDatabaseOperations;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v43;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v43 != v29)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v30), "description");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v31);

        ++v30;
      }
      while (v28 != v30);
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v42, v63, 16);
    }
    while (v28);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v32 = self->_cloudPostFetchOperations;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v39;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v39 != v34)
          objc_enumerationMutation(v32);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v35), "description", (_QWORD)v38);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v36);

        ++v35;
      }
      while (v33 != v35);
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v38, v62, 16);
    }
    while (v33);
  }

  os_unfair_lock_unlock(p_lock);
  return v3;
}

- (void)_reportPossibleSyncLoop
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDSyncOperationManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUploadMaximumDelayLogEvent uploadMaximumDelay](HMDUploadMaximumDelayLogEvent, "uploadMaximumDelay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "submitLogEvent:", v5);

  if (isInternalBuild()
    && !-[HMDSyncOperationManager wasSyncLoopDialogDisplayed](self, "wasSyncLoopDialogDisplayed"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Presenting dialog about possible sync loop", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    -[HMDSyncOperationManager setSyncLoopDialogDisplayed:](v7, "setSyncLoopDialogDisplayed:", 1);
    +[HMDTTRManager sharedManager](HMDTTRManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requestRadarWithDisplayReason:radarTitle:", CFSTR("maximum push delay was reached"), CFSTR("HomeKit maximum push delay reached"));

  }
}

- (void)addOperation:(id)a3
{
  -[HMDSyncOperationManager addOperation:withDelay:](self, "addOperation:withDelay:", a3, 0.0);
}

- (void)addOperation:(id)a3 withDelay:(double)a4
{
  id v6;
  void *v7;
  HMDSyncOperationManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4 > 0.0)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "UUIDString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Adding operation delay, respect this delay: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v6, "options");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelayRespected:", 1);

  }
  -[HMDSyncOperationManager addOperationRespectingOptions:withDelay:](self, "addOperationRespectingOptions:withDelay:", v6, a4);

}

- (void)_dropWithoutAlreadyScheduledOperation:(id)a3
{
  id v3;
  void *v4;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", 23, CFSTR("Operation was dropped before it could run"), CFSTR("HMDSyncOperationManager dropped the operation"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "operationCompletions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addOperationRespectingOptions:(id)a3 withDelay:(double)a4
{
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  double v10;

  v6 = a3;
  if (v6)
  {
    -[HMDSyncOperationManager workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__HMDSyncOperationManager_addOperationRespectingOptions_withDelay___block_invoke;
    block[3] = &unk_24E796490;
    block[4] = self;
    v9 = v6;
    v10 = a4;
    dispatch_async(v7, block);

  }
}

- (void)pauseAndWaitForCurrentOperationCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__HMDSyncOperationManager_pauseAndWaitForCurrentOperationCompletion___block_invoke;
  aBlock[3] = &unk_24E787528;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  v6 = _Block_copy(aBlock);
  +[HMDSyncOperation cancelOperationWithBlock:](HMDSyncOperation, "cancelOperationWithBlock:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDSyncOperationManager addOperation:](self, "addOperation:", v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)cancelOperations
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HMDSyncOperationManager_cancelOperations__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (id)_dequeueNextOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDSyncOperationManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v11;
  int v12;
  char v13;
  int v14;
  void *v15;
  HMDSyncOperationManager *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  HMDSyncOperationManager *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  HMDSyncOperationManager *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  char v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDSyncOperationManager currentOperation](self, "currentOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HMDSyncOperationManager dataSource](self, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isCloudAccountActive");
    v13 = objc_msgSend(v11, "zoneFetchFailed");
    v14 = objc_msgSend(v11, "legacyZoneHasRecordsAvailable");
    if (-[HMDSyncOperationManager pauseQueue](self, "pauseQueue"))
    {
      v15 = (void *)MEMORY[0x227676638]();
      v16 = self;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v41 = v18;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Cannot dequeue operation because sync manager queue is paused", buf, 0xCu);

      }
      v19 = 0;
LABEL_30:

      objc_autoreleasePoolPop(v15);
      return v19;
    }
    -[HMDSyncOperationManager popCloudCancelPauseOperation](self, "popCloudCancelPauseOperation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      -[HMDSyncOperationManager popCloudQueryDatabaseOperation](self, "popCloudQueryDatabaseOperation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
      {
        if (!objc_msgSend(v11, "isNetworkConnectionAvailable"))
        {
LABEL_27:
          v19 = 0;
          goto LABEL_28;
        }
        -[HMDSyncOperationManager popCloudVerifyAccountOperation](self, "popCloudVerifyAccountOperation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          goto LABEL_28;
        -[HMDSyncOperationManager cloudFetchOperations](self, "cloudFetchOperations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countTotal");

        if (v21)
        {
          -[HMDSyncOperationManager cloudFetchOperations](self, "cloudFetchOperations");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

          if (v23)
          {
            -[HMDSyncOperationManager cloudFetchOperations](self, "cloudFetchOperations");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
            v25 = v24;
            objc_msgSend(v24, "nextOperation");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_28;
          }
          goto LABEL_27;
        }
        if (!v12)
        {
          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
LABEL_26:

            objc_autoreleasePoolPop(v28);
            goto LABEL_27;
          }
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v31;
          v32 = "%{public}@Cannot dequeue as no active account";
LABEL_25:
          _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEBUG, v32, buf, 0xCu);

          goto LABEL_26;
        }
        if (!v14)
        {
          if ((v13 & 1) != 0)
            goto LABEL_27;
LABEL_32:
          -[HMDSyncOperationManager cloudPushOperations](self, "cloudPushOperations");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        v39 = 0;
        v26 = -[HMDSyncOperationManager popCloudZoneFetchOperationAndMoveQueueToEnd:](self, "popCloudZoneFetchOperationAndMoveQueueToEnd:", &v39);
        v27 = v39;
        v19 = v27;
        if (v26)
        {
          if (v27)
            goto LABEL_28;
          v28 = (void *)MEMORY[0x227676638]();
          v29 = self;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            goto LABEL_26;
          HMFGetLogIdentifier();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v41 = v31;
          v32 = "%{public}@Waiting for delayed fetches to finish.";
          goto LABEL_25;
        }
        -[HMDSyncOperationManager popCloudPostFetchOperation](self, "popCloudPostFetchOperation");
        v35 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v35;
        if (!v35)
        {
          if (-[HMDSyncOperationManager pauseCloudPushLevel](self, "pauseCloudPushLevel") > 0
            || (-[HMDSyncOperationManager popCloudZonePushOperationAndMoveQueueToEnd](self, "popCloudZonePushOperationAndMoveQueueToEnd"), (v19 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
          {
            -[HMDSyncOperationManager cloudPushOperations](self, "cloudPushOperations");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v36, "count"))
            {

              goto LABEL_27;
            }
            v37 = -[HMDSyncOperationManager pauseCloudPushLevel](self, "pauseCloudPushLevel");

            if (v37 > 0)
              v38 = 1;
            else
              v38 = v13;
            if ((v38 & 1) != 0)
              goto LABEL_27;
            goto LABEL_32;
          }
        }
      }
    }
LABEL_28:
    v15 = (void *)MEMORY[0x227676638]();
    v33 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = v34;
      v42 = 2114;
      v43 = v19;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Dequeued operation to process %{public}@", buf, 0x16u);

    }
    goto LABEL_30;
  }
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDSyncOperationManager currentOperation](v6, "currentOperation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v41 = v8;
    v42 = 2112;
    v43 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Already executing operation %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  return 0;
}

- (void)_handleNextOperation
{
  NSObject *v3;
  void *v4;
  void *v5;
  HMDSyncOperationManager *v6;
  NSObject *v7;
  void *v8;
  NSObject *logger;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  HMDSyncOperationManager *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  id v25;
  unint64_t v26;
  _QWORD block[4];
  NSObject *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMDSyncOperationManager _dequeueNextOperation](self, "_dequeueNextOperation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v8;
      v32 = 2114;
      v33 = v4;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Starting sync operation %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    logger = v6->_logger;
    if (os_signpost_enabled(logger))
    {
      v10 = logger;
      objc_msgSend(v4, "zoneName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v11;
      v32 = 2112;
      v33 = v12;
      _os_signpost_emit_with_name_impl(&dword_2218F0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SyncOperation", "zone=%{signpost.description:attribute}@ identifier=%{signpost.description:attribute}@ ", buf, 0x16u);

    }
    -[HMDSyncOperationManager setCurrentOperation:](v6, "setCurrentOperation:", v4);
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    -[HMDSyncOperationManager clientQueue](v6, "clientQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__HMDSyncOperationManager__handleNextOperation__block_invoke;
    block[3] = &unk_24E79C268;
    v16 = v13;
    v28 = v16;
    v17 = v4;
    v29 = v17;
    dispatch_async(v14, block);

    v18 = (void *)MEMORY[0x227676638]();
    v19 = v6;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v21;
      v32 = 2114;
      v33 = v22;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting for sync operation %{public}@ to complete", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    -[HMDSyncOperationManager workQueue](v19, "workQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __47__HMDSyncOperationManager__handleNextOperation__block_invoke_163;
    v24[3] = &unk_24E796490;
    v24[4] = v19;
    v25 = v17;
    v26 = 0xEEEEB0B5B2B2EEEELL;
    dispatch_group_notify(v16, v23, v24);

  }
}

- (void)_handleCancelledOperations:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDSyncOperationManager *v9;

  v4 = a3;
  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke;
  v7[3] = &unk_24E79C268;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)pause
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HMDSyncOperationManager_pause__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__HMDSyncOperationManager_resume__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)kick
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__HMDSyncOperationManager_kick__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)pauseCloudPush
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HMDSyncOperationManager_pauseCloudPush__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)resumeCloudPush
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HMDSyncOperationManager_resumeCloudPush__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)resetCloudPushTimer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HMDSyncOperationManager_resetCloudPushTimer___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)timerDidFire:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDSyncOperationManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__HMDSyncOperationManager_timerDidFire___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSArray)cloudZoneFetchOperationQueues
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)pauseQueue
{
  return self->_pauseQueue;
}

- (void)setPauseQueue:(BOOL)a3
{
  self->_pauseQueue = a3;
}

- (int64_t)pauseCloudPushLevel
{
  return self->_pauseCloudPushLevel;
}

- (void)setPauseCloudPushLevel:(int64_t)a3
{
  self->_pauseCloudPushLevel = a3;
}

- (HMFExponentialBackoffTimer)cloudPushDelayTimer
{
  return self->_cloudPushDelayTimer;
}

- (void)setCloudPushDelayTimer:(id)a3
{
  objc_storeStrong((id *)&self->_cloudPushDelayTimer, a3);
}

- (BOOL)wasSyncLoopDialogDisplayed
{
  return self->_syncLoopDialogDisplayed;
}

- (void)setSyncLoopDialogDisplayed:(BOOL)a3
{
  self->_syncLoopDialogDisplayed = a3;
}

- (HMDSyncOperation)currentOperation
{
  return self->_currentOperation;
}

- (void)setCurrentOperation:(id)a3
{
  objc_storeStrong((id *)&self->_currentOperation, a3);
}

- (HMDSyncOperationManagerDataSource)dataSource
{
  return (HMDSyncOperationManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timerFactory, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentOperation, 0);
  objc_storeStrong((id *)&self->_cloudPushDelayTimer, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cloudFetchOperations, 0);
  objc_storeStrong((id *)&self->_cloudPushOperations, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_cloudZoneFetchOperationQueuesMap, 0);
  objc_storeStrong((id *)&self->_cloudZonePushOperationQueuesMap, 0);
  objc_storeStrong((id *)&self->_cloudPostFetchOperations, 0);
  objc_storeStrong((id *)&self->_cloudQueryDatabaseOperations, 0);
  objc_storeStrong((id *)&self->_cloudCancelPauseOperations, 0);
  objc_storeStrong((id *)&self->_cloudZoneFetchOperationQueues, 0);
  objc_storeStrong((id *)&self->_cloudZonePushOperationQueues, 0);
  objc_storeStrong((id *)&self->_cloudVerifyAccountOperations, 0);
}

void __40__HMDSyncOperationManager_timerDidFire___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "cloudFetchOperations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processFiredTimer:", *(_QWORD *)(a1 + 40));

  v4 = *(void **)(a1 + 32);
  if (v3)
    goto LABEL_4;
  objc_msgSend(v4, "cloudPushOperations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "processFiredTimer:", *(_QWORD *)(a1 + 40));

  if (v6)
  {
    v4 = *(void **)(a1 + 32);
LABEL_4:
    objc_msgSend(v4, "_handleNextOperation");
    return;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "cloudZoneFetchOperations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v14 = *(void **)(a1 + 40);
        objc_msgSend(v13, "backoffTimer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 == v15)
        {
          v16 = objc_msgSend(v13, "countTotal");

          if (!v16)
          {
            objc_msgSend(v13, "processFiredTimer:", *(_QWORD *)(a1 + 40));
            objc_msgSend(*(id *)(a1 + 32), "removeCloudZoneFetchOperationQueue:", v13);
            goto LABEL_31;
          }
        }
        else
        {

        }
        if (objc_msgSend(v13, "processFiredTimer:", *(_QWORD *)(a1 + 40)))
        {
LABEL_28:
          objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
          goto LABEL_31;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v10)
        continue;
      break;
    }
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "cloudZonePushOperationQueues", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v17, "copy");

  v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    while (2)
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v8);
        v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        v23 = *(void **)(a1 + 40);
        objc_msgSend(v22, "backoffTimer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23 == v24)
        {
          v25 = objc_msgSend(v22, "countTotal");

          if (!v25)
          {
            objc_msgSend(v22, "processFiredTimer:", *(_QWORD *)(a1 + 40));
            objc_msgSend(*(id *)(a1 + 32), "removeCloudZonePushOperationQueue:", v22);
            goto LABEL_31;
          }
        }
        else
        {

        }
        if (objc_msgSend(v22, "processFiredTimer:", *(_QWORD *)(a1 + 40)))
          goto LABEL_28;
      }
      v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v19)
        continue;
      break;
    }
  }
LABEL_31:

}

void __47__HMDSyncOperationManager_resetCloudPushTimer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Resetting cloud upload timer", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "cloudPushOperations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetBackoffTimer");

  if (*(_QWORD *)(a1 + 40))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "cloudZonePushOperationQueues", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          v13 = *(void **)(a1 + 40);
          objc_msgSend(v12, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v13) = objc_msgSend(v13, "isEqualToString:", v14);

          if ((_DWORD)v13)
            objc_msgSend(v12, "resetBackoffTimer");
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
}

void __42__HMDSyncOperationManager_resumeCloudPush__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "pauseCloudPushLevel") >= 1)
    objc_msgSend(*(id *)(a1 + 32), "setPauseCloudPushLevel:", objc_msgSend(*(id *)(a1 + 32), "pauseCloudPushLevel") - 1);
  v2 = objc_msgSend(*(id *)(a1 + 32), "pauseCloudPushLevel");
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2 < 1)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Resuming cloud push queue", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 32), "pauseCloudPushLevel");
      v10 = 138543618;
      v11 = v7;
      v12 = 2048;
      v13 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Cloud push queue is still paused because push level is %tu", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
  }
}

void __41__HMDSyncOperationManager_pauseCloudPush__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setPauseCloudPushLevel:", objc_msgSend(*(id *)(a1 + 32), "pauseCloudPushLevel") + 1));
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 32), "pauseCloudPushLevel");
    v7 = 138543618;
    v8 = v5;
    v9 = 2048;
    v10 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Pausing cloud push queue, level is %tu", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t __31__HMDSyncOperationManager_kick__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
}

uint64_t __33__HMDSyncOperationManager_resume__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setPauseQueue:", 0));
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Resuming sync manager queue", (uint8_t *)&v7, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  return objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
}

void __32__HMDSyncOperationManager_pause__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setPauseQueue:", 1));
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Pausing sync manager queue", (uint8_t *)&v6, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
}

void __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  id obj;
  _QWORD block[6];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  _BYTE v29[128];
  uint64_t v30;

  v1 = a1;
  v30 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v22;
    v5 = MEMORY[0x24BDAC760];
    v6 = __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke_164;
    v18 = v1;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v22 != v4)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v9 = (void *)MEMORY[0x227676638]();
        v10 = *(id *)(v1 + 40);
        HMFGetOSLogHandle();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v12 = v3;
          v13 = v4;
          v14 = v6;
          v15 = v5;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v26 = v16;
          v27 = 2114;
          v28 = v8;
          _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Cancelling sync operation %{public}@", buf, 0x16u);

          v5 = v15;
          v6 = v14;
          v4 = v13;
          v3 = v12;
          v1 = v18;
        }

        objc_autoreleasePoolPop(v9);
        objc_msgSend(*(id *)(v1 + 40), "clientQueue");
        v17 = objc_claimAutoreleasedReturnValue();
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = v6;
        block[3] = &unk_24E79C268;
        block[4] = *(_QWORD *)(v1 + 40);
        block[5] = v8;
        dispatch_async(v17, block);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v3);
  }

}

void __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke_164(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  _QWORD v5[4];
  __int128 v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke_2;
  v5[3] = &unk_24E79BCC8;
  v6 = *(_OWORD *)(a1 + 32);
  v2 = _Block_copy(v5);
  objc_msgSend(*(id *)(a1 + 40), "operationBlock");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, uint64_t))v3)[2](v3, v2, v4, 1);

}

void __54__HMDSyncOperationManager__handleCancelledOperations___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v7;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Sync operation %{public}@ cancelled", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "operationCompletions", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++) + 16))();
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(a1 + 40), "removeAllOperationCompletions");
}

void __47__HMDSyncOperationManager__handleNextOperation__block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;

  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __47__HMDSyncOperationManager__handleNextOperation__block_invoke_2;
  v8 = &unk_24E79BCC8;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v2 = _Block_copy(&v5);
  objc_msgSend(*(id *)(a1 + 40), "operationBlock", v5, v6, v7, v8);
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *, _QWORD))v3)[2](v3, v2, v4, 0);

}

uint64_t __47__HMDSyncOperationManager__handleNextOperation__block_invoke_163(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Sync operation %@ completed", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 80);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v8, OS_SIGNPOST_INTERVAL_END, v9, "SyncOperation", ", (uint8_t *)&v11, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setCurrentOperation:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
}

void __47__HMDSyncOperationManager__handleNextOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "operationCompletions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_msgSend(*(id *)(a1 + 40), "removeAllOperationCompletions");
}

void __43__HMDSyncOperationManager_cancelOperations__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@Cancelling all unprocessed sync operation", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock_with_options();
  objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "operationsToCancel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "operationsToCancel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v9);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v13), "operationsToCancel");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v18), "operationsToCancel", (_QWORD)v25);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v16);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
  objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  os_unfair_lock_unlock(v7);
  objc_msgSend(*(id *)(a1 + 32), "cloudPushDelayTimer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "suspend");

  v21 = (void *)MEMORY[0x227676638](objc_msgSend(*(id *)(a1 + 32), "setCloudPushDelayTimer:", 0));
  v22 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v36 = v24;
    _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_INFO, "%{public}@Cancelling all sync operations, resuming cloud push queue", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v21);
  objc_msgSend(*(id *)(a1 + 32), "setPauseCloudPushLevel:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_handleCancelledOperations:", v6);

}

void __69__HMDSyncOperationManager_pauseAndWaitForCurrentOperationCompletion___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void (**v6)(id, _QWORD);

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "pause");
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  if (v6)
    v6[2](v6, 0);

}

uint64_t __67__HMDSyncOperationManager_addOperationRespectingOptions_withDelay___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  void *v55;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  NSObject *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  NSObject *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  const char *v101;
  void *v102;
  id v103;
  NSObject *v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  NSObject *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  NSObject *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  NSObject *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  NSObject *v124;
  void *v125;
  void *v126;
  void *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  _BYTE v136[128];
  uint8_t v137[128];
  uint8_t buf[4];
  void *v139;
  __int16 v140;
  void *v141;
  uint64_t v142;

  v142 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v139 = v5;
    v140 = 2112;
    v141 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEBUG, "%{public}@Will attempt to add operation %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 40), "operationType") == 1 || objc_msgSend(*(id *)(a1 + 40), "operationType") == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "cloudPushOperations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backoffTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)MEMORY[0x227676638]();
      v10 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(a1 + 32), "cloudPushOperations");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "backoffTimer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeInterval");
        objc_msgSend(v13, "numberWithDouble:");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v139 = v12;
        v140 = 2114;
        v141 = v16;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Current push delay is: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v9);
    }
    objc_msgSend(*(id *)(a1 + 32), "cloudPushOperations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isInMaximumTimeInterval");

    if (v18)
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v139 = v22;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Scheduling legacy push at maximum time interval, maybe in a sync loop", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(*(id *)(a1 + 32), "_reportPossibleSyncLoop");
    }
    objc_msgSend(*(id *)(a1 + 32), "dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "legacyZoneHasRecordsAvailable");

    if (!v24)
    {
      v38 = (void *)MEMORY[0x227676638]();
      v39 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v41;
        v140 = 2114;
        v141 = v42;
        _os_log_impl(&dword_2218F0000, v40, OS_LOG_TYPE_INFO, "%{public}@Staging cloud push operation %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v38);
      objc_msgSend(*(id *)(a1 + 32), "cloudPushOperations");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stageOperation:", *(_QWORD *)(a1 + 40));
      goto LABEL_37;
    }
    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "cloudPushOperations");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allOperations");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v132, v137, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v133;
LABEL_16:
      v30 = 0;
      while (1)
      {
        if (*(_QWORD *)v133 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v30);
        if (objc_msgSend(v31, "operationType") == 2)
          break;
        if (v28 == ++v30)
        {
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v132, v137, 16);
          if (v28)
            goto LABEL_16;
          goto LABEL_22;
        }
      }
      v48 = (void *)MEMORY[0x227676638]();
      v49 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v50 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        goto LABEL_36;
      HMFGetLogIdentifier();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v139 = v51;
      v52 = "%{public}@Unprocessed cloud force push operation in queue, dropping new push operation";
      v53 = v50;
      v54 = 12;
      goto LABEL_35;
    }
LABEL_22:

    v32 = (void *)MEMORY[0x227676638]();
    v33 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v139 = v35;
      v140 = 2114;
      v141 = v36;
      _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_INFO, "%{public}@Adding cloud push operation %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v32);
    objc_msgSend(*(id *)(a1 + 32), "cloudPushOperations");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
    v26 = v37;
    objc_msgSend(v37, "addOperation:withDelay:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
    goto LABEL_37;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "operationType") == 3)
  {
    v43 = (void *)MEMORY[0x227676638]();
    v44 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v139 = v46;
      v140 = 2114;
      v141 = v47;
      _os_log_impl(&dword_2218F0000, v45, OS_LOG_TYPE_INFO, "%{public}@Adding cloud verify account operation %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v43);
    objc_msgSend(*(id *)(a1 + 32), "addCloudVerifyAccountOperation:", *(_QWORD *)(a1 + 40));
    return objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
  }
  if (objc_msgSend(*(id *)(a1 + 40), "operationType") != 4)
  {
    v75 = objc_msgSend(*(id *)(a1 + 40), "operationType");
    v76 = *(void **)(a1 + 40);
    if (v75 == 5)
    {
      objc_msgSend(v76, "zoneName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (void *)MEMORY[0x227676638]();
      v78 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = v79;
      if (v26)
      {
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v139 = v81;
          v140 = 2114;
          v141 = v82;
          _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_INFO, "%{public}@Adding cloud zone push operation %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v77);
        if (objc_msgSend(*(id *)(a1 + 32), "addCloudZonePushOperation:delay:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48)))
        {
          v83 = (void *)MEMORY[0x227676638]();
          v84 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "zoneName");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v139 = v86;
            v140 = 2114;
            v141 = v87;
            _os_log_impl(&dword_2218F0000, v85, OS_LOG_TYPE_ERROR, "%{public}@Scheduling zone %{public}@ push at maximum time interval, maybe in a sync loop", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v83);
          objc_msgSend(*(id *)(a1 + 32), "_reportPossibleSyncLoop");
        }
        goto LABEL_37;
      }
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v99;
        v140 = 2114;
        v141 = v100;
        v101 = "%{public}@Cannot add operation to zone push without a zoneName %{public}@";
LABEL_90:
        _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_ERROR, v101, buf, 0x16u);

        goto LABEL_91;
      }
      goto LABEL_91;
    }
    v89 = objc_msgSend(v76, "operationType");
    v90 = *(void **)(a1 + 40);
    if (v89 == 6)
    {
      objc_msgSend(v90, "zoneName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = (void *)MEMORY[0x227676638]();
      v78 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v91 = objc_claimAutoreleasedReturnValue();
      v80 = v91;
      if (v26)
      {
        if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v139 = v92;
          v140 = 2114;
          v141 = v93;
          _os_log_impl(&dword_2218F0000, v80, OS_LOG_TYPE_INFO, "%{public}@Adding cloud zone fetch operation %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v77);
        objc_msgSend(*(id *)(a1 + 32), "addCloudZoneFetchOperation:delay:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
        goto LABEL_37;
      }
      if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v99;
        v140 = 2114;
        v141 = v117;
        v101 = "%{public}@Cannot add operation to zone fetch without a zoneName %{public}@";
        goto LABEL_90;
      }
LABEL_91:

      objc_autoreleasePoolPop(v77);
      objc_msgSend(*(id *)(a1 + 32), "_dropWithoutAlreadyScheduledOperation:", *(_QWORD *)(a1 + 40));
      goto LABEL_37;
    }
    if (objc_msgSend(v90, "operationType") == 7)
    {
      v94 = (void *)MEMORY[0x227676638]();
      v95 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v97;
        v140 = 2112;
        v141 = v98;
        _os_log_impl(&dword_2218F0000, v96, OS_LOG_TYPE_INFO, "%{public}@Adding cloud cancel pause operation %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v94);
      objc_msgSend(*(id *)(a1 + 32), "addCloudCancelPauseOperation:", *(_QWORD *)(a1 + 40));
      return objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
    }
    if (objc_msgSend(*(id *)(a1 + 40), "operationType") == 8)
    {
      v102 = (void *)MEMORY[0x227676638]();
      v103 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v105;
        v140 = 2114;
        v141 = v106;
        _os_log_impl(&dword_2218F0000, v104, OS_LOG_TYPE_INFO, "%{public}@Adding cloud query database operation %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v102);
      if ((objc_msgSend(*(id *)(a1 + 32), "addCloudQueryDatabaseOperationIfNonePresent:", *(_QWORD *)(a1 + 40)) & 1) == 0)
      {
        v107 = (void *)MEMORY[0x227676638]();
        v108 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v109 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v139 = v110;
          v140 = 2114;
          v141 = v111;
          _os_log_impl(&dword_2218F0000, v109, OS_LOG_TYPE_INFO, "%{public}@Already have a query operation scheduled, dropping operation %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v107);
        objc_msgSend(*(id *)(a1 + 32), "_dropWithoutAlreadyScheduledOperation:", *(_QWORD *)(a1 + 40));
      }
      if (!objc_msgSend(*(id *)(a1 + 32), "dropCloudPostFetchOperationsIfPresent"))
        return objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
      v112 = (void *)MEMORY[0x227676638]();
      v113 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v114 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "cloudPostFetchOperations");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v139 = v115;
        v140 = 2114;
        v141 = v116;
        _os_log_impl(&dword_2218F0000, v114, OS_LOG_TYPE_INFO, "%{public}@Dropping post fetch because new query was added: %{public}@", buf, 0x16u);

LABEL_101:
      }
    }
    else
    {
      v118 = objc_msgSend(*(id *)(a1 + 40), "operationType");
      v112 = (void *)MEMORY[0x227676638]();
      v113 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v119 = objc_claimAutoreleasedReturnValue();
      v114 = v119;
      if (v118 == 9)
      {
        if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v139 = v120;
          v140 = 2114;
          v141 = v121;
          _os_log_impl(&dword_2218F0000, v114, OS_LOG_TYPE_INFO, "%{public}@Adding cloud post fetch operation %{public}@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v112);
        if ((objc_msgSend(*(id *)(a1 + 32), "addCloudPostFetchOperationIfNonePresent:", *(_QWORD *)(a1 + 40)) & 1) == 0)
        {
          v122 = (void *)MEMORY[0x227676638]();
          v123 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v124 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v124, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v126 = *(void **)(a1 + 40);
            *(_DWORD *)buf = 138543618;
            v139 = v125;
            v140 = 2114;
            v141 = v126;
            _os_log_impl(&dword_2218F0000, v124, OS_LOG_TYPE_INFO, "%{public}@Already have a post fetch operation scheduled, dropping operation %{public}@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v122);
          objc_msgSend(*(id *)(a1 + 32), "_dropWithoutAlreadyScheduledOperation:", *(_QWORD *)(a1 + 40));
        }
        return objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
      }
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v139 = v115;
        v140 = 2114;
        v141 = v127;
        _os_log_impl(&dword_2218F0000, v114, OS_LOG_TYPE_ERROR, "%{public}@Unknown sync operation type, dropping %{public}@", buf, 0x16u);
        goto LABEL_101;
      }
    }

    objc_autoreleasePoolPop(v112);
    return objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
  }
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "cloudFetchOperations", 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "allOperations");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
  if (!v58)
  {
LABEL_54:

    v70 = (void *)MEMORY[0x227676638]();
    v71 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v72 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v139 = v73;
      v140 = 2114;
      v141 = v74;
      _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_INFO, "%{public}@Adding cloud fetch operation %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v70);
    objc_msgSend(*(id *)(a1 + 32), "cloudFetchOperations");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  v59 = v58;
  v60 = *(_QWORD *)v129;
LABEL_42:
  v61 = 0;
  while (1)
  {
    if (*(_QWORD *)v129 != v60)
      objc_enumerationMutation(v26);
    v31 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v61);
    objc_msgSend(*(id *)(a1 + 40), "options");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v62, "isCloudConflict") & 1) == 0)
      break;
    objc_msgSend(v31, "options");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "isCloudConflict");

    if ((v64 & 1) != 0)
      goto LABEL_49;
    objc_msgSend(*(id *)(a1 + 32), "cloudFetchOperations");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "dropOperation:", v31);

    v66 = *(void **)(a1 + 40);
    objc_msgSend(v31, "operationCompletions");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "updateOperationCompletionsWithArray:", v67);
LABEL_50:

LABEL_52:
    if (v59 == ++v61)
    {
      v59 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
      if (v59)
        goto LABEL_42;
      goto LABEL_54;
    }
  }

LABEL_49:
  objc_msgSend(*(id *)(a1 + 40), "options");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v67, "isCloudConflict") & 1) != 0)
    goto LABEL_50;
  objc_msgSend(v31, "options");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = objc_msgSend(v68, "isCloudConflict");

  if (!v69)
    goto LABEL_52;
  v48 = (void *)MEMORY[0x227676638]();
  v49 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v50 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    goto LABEL_36;
  HMFGetLogIdentifier();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = *(void **)(a1 + 40);
  *(_DWORD *)buf = 138543618;
  v139 = v51;
  v140 = 2114;
  v141 = v88;
  v52 = "%{public}@Already have a legacy conflict fetch scheduled, dropping non-conflict fetch operation %{public}@";
  v53 = v50;
  v54 = 22;
LABEL_35:
  _os_log_impl(&dword_2218F0000, v53, OS_LOG_TYPE_INFO, v52, buf, v54);

LABEL_36:
  objc_autoreleasePoolPop(v48);
  objc_msgSend(*(id *)(a1 + 40), "operationCompletions");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "updateOperationCompletionsWithArray:", v55);

LABEL_37:
  return objc_msgSend(*(id *)(a1 + 32), "_handleNextOperation");
}

id __58__HMDSyncOperationManager_initWithClientQueue_dataSource___block_invoke(double a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE3F298]), "initWithTimeInterval:options:", 1, a1);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t53_132428 != -1)
    dispatch_once(&logCategory__hmf_once_t53_132428, &__block_literal_global_142_132429);
  return (id)logCategory__hmf_once_v54_132430;
}

void __38__HMDSyncOperationManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v54_132430;
  logCategory__hmf_once_v54_132430 = v0;

}

@end
