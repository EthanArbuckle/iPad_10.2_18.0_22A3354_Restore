@implementation FSChangeMonitor

- (FSChangeMonitor)init
{
  abort();
}

- (FSChangeMonitor)initWithLabel:(id)a3 workloop:(id)a4
{
  id v6;
  id v7;
  FSChangeMonitor *v8;
  FSChangeMonitor *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *streamQueue;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *processQueue;
  dispatch_source_t v19;
  OS_dispatch_source *fseventsProcessSource;
  void *v21;
  OS_dispatch_source *v22;
  id v23;
  NSObject *v24;
  dispatch_block_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSMutableArray *fseventsToProcess;
  char *v30;
  const char *v31;
  BOOL v32;
  uint64_t v33;
  NSMutableArray *subscriptions;
  uint64_t v35;
  NSMutableArray *pendingBarrierEvents;
  _QWORD block[4];
  id v39;
  id v40;
  id location;
  objc_super v42;
  char __str[1024];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)FSChangeMonitor;
  v8 = -[FSChangeMonitor init](&v42, sel_init);
  v9 = v8;
  if (v8)
  {
    atomic_store(1u, (unsigned int *)&v8->_suspendCount);
    bzero(__str, 0x400uLL);
    v10 = objc_retainAutorelease(v6);
    snprintf(__str, 0x400uLL, "%s: fsevents-stream", (const char *)objc_msgSend(v10, "UTF8String"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_UTILITY, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(__str, v12);
    streamQueue = v9->_streamQueue;
    v9->_streamQueue = (OS_dispatch_queue *)v13;

    snprintf(__str, 0x400uLL, "%s: fsevents-process", (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_UTILITY, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create(__str, v16);
    processQueue = v9->_processQueue;
    v9->_processQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v9->_delegationQueue, a4);
    v19 = dispatch_source_create(MEMORY[0x24BDAC9D0], 0, 0, (dispatch_queue_t)v9->_delegationQueue);
    fseventsProcessSource = v9->_fseventsProcessSource;
    v9->_fseventsProcessSource = (OS_dispatch_source *)v19;

    fpfs_current_log();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v9->_log, v21);
    dispatch_set_qos_class_fallback();
    location = 0;
    objc_initWeak(&location, v9);
    v22 = v9->_fseventsProcessSource;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__FSChangeMonitor_initWithLabel_workloop___block_invoke;
    block[3] = &unk_250BDC190;
    v23 = v21;
    v39 = v23;
    objc_copyWeak(&v40, &location);
    v24 = v22;
    v25 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
    dispatch_source_set_event_handler(v24, v25);

    objc_msgSend(MEMORY[0x24BE313B0], "defaultStore");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_maxFSEventQueueSize = (int)objc_msgSend(v26, "maxFSEventQueueSize");

    objc_msgSend(MEMORY[0x24BE313B0], "defaultStore");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_fseventProcessBatchSize = (int)objc_msgSend(v27, "fseventProcessBatchSize");

    v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v9->_maxFSEventQueueSize);
    fseventsToProcess = v9->_fseventsToProcess;
    v9->_fseventsToProcess = (NSMutableArray *)v28;

    v30 = getenv("FPFS_FSCHANGEMONITOR_NODELAY");
    v32 = 0;
    if (v30)
    {
      v31 = v30;
      if (!strcmp(v30, "1") || !strcasecmp(v31, "true") || !strcasecmp(v31, "yes"))
        v32 = 1;
    }
    v9->_createNoDelay = v32;
    v9->_optimizeOutOwnEvents = 1;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v33 = objc_claimAutoreleasedReturnValue();
    subscriptions = v9->_subscriptions;
    v9->_subscriptions = (NSMutableArray *)v33;

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
    v35 = objc_claimAutoreleasedReturnValue();
    pendingBarrierEvents = v9->_pendingBarrierEvents;
    v9->_pendingBarrierEvents = (NSMutableArray *)v35;

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);

  }
  return v9;
}

void __42__FSChangeMonitor_initWithLabel_workloop___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  fpfs_adopt_log();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "processFseventBatch");

  __fp_pop_log();
}

- (void)dealloc
{
  FSVolume *volume;
  OS_dispatch_queue *streamQueue;
  OS_dispatch_queue *processQueue;
  OS_dispatch_queue *delegationQueue;
  NSObject *fseventsProcessSource;
  OS_dispatch_source *v8;
  objc_super v9;

  volume = self->_volume;
  self->_volume = 0;

  streamQueue = self->_streamQueue;
  self->_streamQueue = 0;

  processQueue = self->_processQueue;
  self->_processQueue = 0;

  delegationQueue = self->_delegationQueue;
  self->_delegationQueue = 0;

  fseventsProcessSource = self->_fseventsProcessSource;
  if (fseventsProcessSource)
  {
    dispatch_source_cancel(fseventsProcessSource);
    dispatch_activate((dispatch_object_t)self->_fseventsProcessSource);
    v8 = self->_fseventsProcessSource;
    self->_fseventsProcessSource = 0;

  }
  v9.receiver = self;
  v9.super_class = (Class)FSChangeMonitor;
  -[FSChangeMonitor dealloc](&v9, sel_dealloc);
}

- (id)subscribeToEventsAtPath:(id)a3 fd:(int)a4 sinceEventID:(unint64_t)a5 streamUUID:(id)a6 ignoreOwnEvents:(BOOL)a7 delegate:(id)a8 purpose:(id)a9
{
  _BOOL8 v10;
  uint64_t v13;
  id v15;
  id v16;
  id v17;
  id v18;
  FSChangeSubscription *v19;
  FSChangeMonitor *v20;
  FSChangeSubscription *v21;

  v10 = a7;
  v13 = *(_QWORD *)&a4;
  v15 = a3;
  v16 = a6;
  v17 = a8;
  v18 = a9;
  v19 = -[FSChangeSubscription initWithPath:fd:reader:sinceEventID:streamUUID:ignoreOwnEvents:delegate:purpose:]([FSChangeSubscription alloc], "initWithPath:fd:reader:sinceEventID:streamUUID:ignoreOwnEvents:delegate:purpose:", v15, v13, self, a5, v16, v10, v17, v18);
  if (v19)
  {
    -[FSChangeMonitor suspend](self, "suspend");
    v20 = self;
    objc_sync_enter(v20);
    -[NSMutableArray addObject:](v20->_subscriptions, "addObject:", v19);
    if (!v10)
      v20->_optimizeOutOwnEvents = 0;
    objc_sync_exit(v20);

    v21 = v19;
  }

  return v19;
}

- (BOOL)_activateSubscription:(id)a3 error:(id *)a4
{
  id v6;
  FSVolume *volume;
  FSVolume *v8;
  void *v9;
  _BOOL4 v10;
  FSVolume *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  BOOL v17;

  v6 = a3;
  if (objc_msgSend(v6, "isActivated"))
    -[FSChangeMonitor _activateSubscription:error:].cold.1();
  objc_msgSend(v6, "setIsActivated:", 1);
  volume = self->_volume;
  if (!volume)
  {
    v8 = objc_alloc_init(FSVolume);
    objc_msgSend(v6, "root");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FSVolume setupForPath:error:](v8, "setupForPath:error:", v9, a4);

    if (!v10)
    {
      v17 = 0;
      goto LABEL_9;
    }
    v11 = self->_volume;
    self->_volume = v8;

    volume = self->_volume;
  }
  -[FSVolume eventStreamUUID](volume, "eventStreamUUID");
  v8 = (FSVolume *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventStreamUUID");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v6, "eventStreamUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FSVolume isEqual:](v8, "isEqual:", v14);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(v6, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subscription:handleResetWithReason:", v6, 4);

    }
  }
  objc_msgSend(v6, "setEventStreamUUID:", v8);
  v17 = -[FSChangeMonitor setUpStreamForReason:error:](self, "setUpStreamForReason:error:", 3, a4);
LABEL_9:

  return v17;
}

- (BOOL)activateSubscription:(id)a3 error:(id *)a4
{
  id v6;
  FSChangeMonitor *v7;
  _BOOL4 isActivated;
  BOOL v9;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  isActivated = v7->_isActivated;
  if (!v7->_isActivated)
    v7->_isActivated = 1;
  v9 = -[FSChangeMonitor _activateSubscription:error:](v7, "_activateSubscription:error:", v6, a4);
  objc_sync_exit(v7);

  if (!isActivated)
    -[FSChangeMonitor resume](v7, "resume");
  -[FSChangeMonitor resume](v7, "resume");

  return v9;
}

- (void)disableSubscription:(id)a3
{
  FSChangeMonitor *v4;
  uint64_t v5;
  char v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[NSMutableArray count](v4->_subscriptions, "count"))
    -[NSMutableArray removeObject:](v4->_subscriptions, "removeObject:", v7);
  v5 = -[NSMutableArray count](v4->_subscriptions, "count");
  if (!v5)
    v4->_isActivated = 0;
  v6 = objc_msgSend(v7, "isActivated");
  objc_sync_exit(v4);

  if (!v5)
  {
    -[FSChangeMonitor suspend](v4, "suspend");
    if ((v6 & 1) != 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  if ((v6 & 1) == 0)
LABEL_7:
    -[FSChangeMonitor resume](v4, "resume");
LABEL_8:

}

- (void)foreachSubscriptionInState:(unint64_t)a3 apply:(id)a4
{
  uint64_t (**v6)(id, id);
  void *v7;
  FSChangeMonitor *v8;
  void *v9;
  FSChangeMonitor *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  FSChangeMonitor *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (**)(id, id))a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
  v8 = self;
  objc_sync_enter(v8);
  v9 = (void *)-[NSMutableArray copy](v8->_subscriptions, "copy");
  objc_sync_exit(v8);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v9;
  v11 = -[FSChangeMonitor countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v12 = v11;
  if (v11)
  {
    v13 = *(_QWORD *)v20;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x23B860C70](v11);
        v17 = v15;
        objc_sync_enter(v17);
        if ((objc_msgSend(v17, "state", (_QWORD)v19) & a3) != 0 && (v6[2](v6, v17) & 1) == 0)
        {
          objc_sync_exit(v17);

          objc_autoreleasePoolPop(v16);
          v18 = v10;
          goto LABEL_15;
        }
        if (objc_msgSend(v17, "state") == 4)
          objc_msgSend(v7, "addObject:", v17);
        objc_sync_exit(v17);

        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = -[FSChangeMonitor countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v12 = v11;
      if (v11)
        continue;
      break;
    }
  }

  if (objc_msgSend(v7, "count"))
  {
    v18 = v8;
    objc_sync_enter(v18);
    -[NSMutableArray removeObjectsInArray:](v8->_subscriptions, "removeObjectsInArray:", v7);
    objc_sync_exit(v18);
LABEL_15:

  }
}

- (unint64_t)oldestStartingPoint
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__FSChangeMonitor_oldestStartingPoint__block_invoke;
  v4[3] = &unk_250BDC1B8;
  v4[4] = &v5;
  -[FSChangeMonitor foreachSubscriptionInState:apply:](self, "foreachSubscriptionInState:apply:", 3, v4);
  if (v6[3])
    v2 = v6[3];
  else
    v2 = -1;
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __38__FSChangeMonitor_oldestStartingPoint__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(a2, "lastDeliveredEventID");
  if (v3 != -1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_QWORD *)(v4 + 24) - 1 >= v3)
      *(_QWORD *)(v4 + 24) = v3;
  }
  return 1;
}

- (double)latency
{
  void *v3;
  double v4;
  double v5;

  if (self->_createNoDelay)
    return 0.0;
  objc_msgSend(MEMORY[0x24BE313B0], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fseventsAggregationDelay");
  v5 = v4;

  return v5;
}

- (BOOL)hasBufferedEvents
{
  NSObject *processQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  processQueue = self->_processQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__FSChangeMonitor_hasBufferedEvents__block_invoke;
  v5[3] = &unk_250BDC1E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(processQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__FSChangeMonitor_hasBufferedEvents__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (fpfs_fsevent_stream)_createStreamNamed:(id)a3 since:(unint64_t)a4 criteria:(id)a5
{
  _BOOL4 createNoDelay;
  NSMutableArray *subscriptions;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  FSEventStreamCreateFlags v16;
  id v17;
  const char *v18;
  CFTimeInterval v19;
  char *v20;

  createNoDelay = self->_createNoDelay;
  subscriptions = self->_subscriptions;
  v10 = a5;
  v11 = a3;
  -[NSMutableArray valueForKey:](subscriptions, "valueForKey:", CFSTR("root"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_barrierFolderURL, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "arrayByAddingObject:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  self->_isProcessingHistory = a4 != -1;
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[FSChangeMonitor _createStreamNamed:since:criteria:].cold.1();
  if (createNoDelay)
    v16 = 243;
  else
    v16 = 241;

  v17 = objc_retainAutorelease(v11);
  v18 = (const char *)objc_msgSend(v17, "UTF8String");

  -[FSChangeMonitor latency](self, "latency");
  v20 = fpfs_fsevent_stream_open(v18, (uint64_t)fseventsCallback, (uint64_t)self, (const __CFArray *)v12, a4, v16, self->_streamQueue, v10, v19);

  return (fpfs_fsevent_stream *)v20;
}

- (id)liveFSEventsXPCActivityCriteria
{
  return 0;
}

- (BOOL)setUpStreamForReason:(int64_t)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v6;
  fpfs_fsevent_stream *stream;
  void *v8;
  fpfs_fsevent_stream *v9;
  BOOL v10;

  self->_drainEvents = 0;
  v5 = -[FSChangeMonitor oldestStartingPoint](self, "oldestStartingPoint", a3, a4);
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FSChangeMonitor setUpStreamForReason:error:].cold.1(v5, v6);

  stream = self->_stream;
  if (stream)
  {
    fpfs_fsevent_stream_close((uint64_t)stream);
    self->_stream = 0;
  }
  -[FSChangeMonitor liveFSEventsXPCActivityCriteria](self, "liveFSEventsXPCActivityCriteria");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FSChangeMonitor _createStreamNamed:since:criteria:](self, "_createStreamNamed:since:criteria:", CFSTR("com.apple.fpfs.fsevents"), v5, v8);
  self->_stream = v9;
  v10 = v9 != 0;

  return v10;
}

- (BOOL)_queueEvents:(id)a3 markSelfEncountered:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSMutableArray *fseventsToProcess;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  NSObject *v20;
  uint8_t v21[16];

  v4 = a4;
  v6 = a3;
  if (-[NSMutableArray count](self->_fseventsToProcess, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_fseventsToProcess, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "flags") & 0xE;

    if (v8)
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[FSChangeMonitor _queueEvents:markSelfEncountered:].cold.3();

LABEL_23:
      v18 = 0;
      goto LABEL_24;
    }
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "flags") & 0xE;

  if (v11)
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[FSChangeMonitor _queueEvents:markSelfEncountered:].cold.2();

    -[NSMutableArray removeAllObjects](self->_fseventsToProcess, "removeAllObjects");
    fseventsToProcess = self->_fseventsToProcess;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](fseventsToProcess, "addObject:", v14);

    dispatch_source_merge_data((dispatch_source_t)self->_fseventsProcessSource, 1uLL);
    goto LABEL_23;
  }
  if (v4)
  {
    if (self->_hasMarkSelf)
    {
      v15 = -[NSMutableArray count](self->_fseventsToProcess, "count");
      if (v15 >= 1)
      {
        v16 = v15 + 1;
        while (1)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_fseventsToProcess, "objectAtIndexedSubscript:", (v16 - 2));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "flags") & 0x80000) != 0)
            break;

          if ((unint64_t)--v16 <= 1)
            goto LABEL_19;
        }
        -[NSMutableArray removeObjectAtIndex:](self->_fseventsToProcess, "removeObjectAtIndex:", (v16 - 2));

      }
    }
    else
    {
      self->_hasMarkSelf = 1;
    }
  }
LABEL_19:
  if (-[NSMutableArray count](self->_fseventsToProcess, "count") >= self->_maxFSEventQueueSize)
    -[FSChangeMonitor _queueEvents:markSelfEncountered:].cold.1();
  -[NSMutableArray addObjectsFromArray:](self->_fseventsToProcess, "addObjectsFromArray:", v6);
  if (-[NSMutableArray count](self->_fseventsToProcess, "count"))
    dispatch_source_merge_data((dispatch_source_t)self->_fseventsProcessSource, 1uLL);
  if (-[NSMutableArray count](self->_fseventsToProcess, "count") < self->_maxFSEventQueueSize)
    goto LABEL_23;
  fp_current_or_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_23AA66000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] We still have too many events in the queue, blocking until events are flushed", v21, 2u);
  }

  v18 = 1;
LABEL_24:

  return v18;
}

- (void)queueEvents:(id)a3 markSelfEncountered:(BOOL)a4
{
  id v6;
  NSObject *processQueue;
  uint64_t v8;
  NSObject *delegationQueue;
  _QWORD v10[5];
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    processQueue = self->_processQueue;
    v8 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__FSChangeMonitor_queueEvents_markSelfEncountered___block_invoke;
    block[3] = &unk_250BDC208;
    v13 = &v15;
    block[4] = self;
    v12 = v6;
    v14 = a4;
    dispatch_sync(processQueue, block);
    if (*((_BYTE *)v16 + 24))
    {
      delegationQueue = self->_delegationQueue;
      v10[0] = v8;
      v10[1] = 3221225472;
      v10[2] = __51__FSChangeMonitor_queueEvents_markSelfEncountered___block_invoke_2;
      v10[3] = &unk_250BDBB48;
      v10[4] = self;
      dispatch_async_and_wait(delegationQueue, v10);
    }

    _Block_object_dispose(&v15, 8);
  }

}

uint64_t __51__FSChangeMonitor_queueEvents_markSelfEncountered___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queueEvents:markSelfEncountered:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __51__FSChangeMonitor_queueEvents_markSelfEncountered___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processFseventBatch");
}

- (void)processFseventBatch
{
  OS_dispatch_queue *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t spid;
  uint8_t v23[8];
  _QWORD v24[5];
  _QWORD block[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  id v30;
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  fpfs_adopt_log();
  v30 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_delegationQueue);
  v3 = self->_processQueue;
  if (v3)
  {
    fssync_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_signpost_id_generate(v4);

    fssync_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    spid = v5;
    v8 = v5 - 1;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      v9 = -[NSMutableArray count](self->_fseventsToProcess, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_signpost_emit_with_name_impl(&dword_23AA66000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "FS: event batch", "count %llu", (uint8_t *)&buf, 0xCu);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__0;
    v34 = __Block_byref_object_dispose__0;
    v35 = 0;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0;
    -[FSChangeMonitor foreachSubscriptionInState:apply:](self, "foreachSubscriptionInState:apply:", 2, &__block_literal_global_2);
    v10 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __38__FSChangeMonitor_processFseventBatch__block_invoke_2;
    block[3] = &unk_250BDC270;
    block[4] = self;
    block[5] = &buf;
    block[6] = &v26;
    dispatch_sync((dispatch_queue_t)v3, block);
    v11 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count");
    v12 = v11;
    if ((_DWORD)v11)
    {
      v13 = 0;
      v14 = v11 - 1;
      do
      {
        v15 = (void *)MEMORY[0x23B860C70]();
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectAtIndexedSubscript:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[FSChangeMonitor handleFSEvent:indexInBatch:batchSize:](self, "handleFSEvent:indexInBatch:batchSize:", v16, v13, v12);

        objc_autoreleasePoolPop(v15);
      }
      while (v14 != v13++ && v17);
    }
    -[FSChangeMonitor foreachSubscriptionInState:apply:](self, "foreachSubscriptionInState:apply:", 2, &__block_literal_global_19);
    if (*((_BYTE *)v27 + 24))
    {
      v24[0] = v10;
      v24[1] = 3221225472;
      v24[2] = __38__FSChangeMonitor_processFseventBatch__block_invoke_4;
      v24[3] = &unk_250BDBB48;
      v24[4] = self;
      dispatch_async((dispatch_queue_t)v3, v24);
    }
    fssync_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl(&dword_23AA66000, v21, OS_SIGNPOST_INTERVAL_END, spid, "FS: event batch", ", v23, 2u);
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&buf, 8);

  }
  __fp_pop_log();

}

uint64_t __38__FSChangeMonitor_processFseventBatch__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionWillHandleBatchOfEvents:", v2);

  return 1;
}

uint64_t __38__FSChangeMonitor_processFseventBatch__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t result;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = objc_msgSend(*(id *)(v2 + 56), "count");
  if (v3 >= v4)
    v3 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "subarrayWithRange:", 0, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectsInRange:", 0, v3);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 84) = 0;
  v8 = *(id *)(a1 + 32);
  objc_sync_enter(v8);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 85);
  objc_sync_exit(v8);

  if (v9)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "flags", (_QWORD)v16) & 0x80000) != 0)
          {
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 84) = 1;
            goto LABEL_14;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_14:

  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count", (_QWORD)v16);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result != 0;
  return result;
}

uint64_t __38__FSChangeMonitor_processFseventBatch__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionDidHandleBatchOfEvents:", v2);

  return 1;
}

void __38__FSChangeMonitor_processFseventBatch__block_invoke_4(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  if (v1)
    dispatch_source_merge_data(v1, 1uLL);
}

- (void)deliverBarrierEvents
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSMutableArray *v8;
  NSMutableArray *pendingBarrierEvents;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__FSChangeMonitor_deliverBarrierEvents__block_invoke;
  v10[3] = &unk_250BDC2B8;
  v10[4] = self;
  v10[5] = &v11;
  -[FSChangeMonitor foreachSubscriptionInState:apply:](self, "foreachSubscriptionInState:apply:", 2, v10);
  v3 = -[NSMutableArray count](self->_pendingBarrierEvents, "count");
  if (v3 != v12[3])
  {
    v4 = -[NSMutableArray count](self->_pendingBarrierEvents, "count");
    v5 = v12[3];
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = "";
      if ((unint64_t)(v4 - v5) > 1)
        v7 = "s";
      *(_DWORD *)buf = 134218242;
      v16 = v4 - v5;
      v17 = 2080;
      v18 = v7;
      _os_log_impl(&dword_23AA66000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] %lu barrier event%s not delivered, dropping!", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 5);
  v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  pendingBarrierEvents = self->_pendingBarrierEvents;
  self->_pendingBarrierEvents = v8;

  _Block_object_dispose(&v11, 8);
}

uint64_t __39__FSChangeMonitor_deliverBarrierEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(v3, "didProcessBarrierEventUUID:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11))
        {
          fp_current_or_default_log();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            __39__FSChangeMonitor_deliverBarrierEvents__block_invoke_cold_1();

          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          goto LABEL_13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return 1;
}

- (BOOL)handleFSEvent:(id)a3 indexInBatch:(unsigned int)a4 batchSize:(unsigned int)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  NSObject *v39;
  FSChangeMonitor *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint8_t buf[4];
  _BYTE v46[10];
  _BYTE v47[10];
  _BYTE v48[10];
  _BYTE v49[10];
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  objc_msgSend(v8, "path");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "eventID");
  v10 = objc_msgSend(v8, "fileID");
  v11 = objc_msgSend(v8, "flags");
  v12 = objc_msgSend(v8, "additionalDebugFlagsForHistoricalStream:", self->_isProcessingHistory) | v11;
  objc_msgSend(MEMORY[0x24BDD17C8], "fpfs_initWithFSEventsFlags:", v12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  fssync_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);

  fssync_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v46 = v37;
    *(_WORD *)&v46[8] = 2048;
    *(_QWORD *)v47 = v10;
    *(_WORD *)&v47[8] = 2112;
    *(_QWORD *)v48 = v36;
    *(_WORD *)&v48[8] = 2048;
    *(_QWORD *)v49 = v9;
    _os_signpost_emit_with_name_impl(&dword_23AA66000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "FS: event", "path %@ fileID %llu flags %@ eventID %llu", buf, 0x2Au);
  }

  fp_current_or_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v37, "fp_prettyPath");
    v32 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v46 = a4 + 1;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = a5;
    *(_WORD *)v47 = 2112;
    *(_QWORD *)&v47[2] = v32;
    v33 = (void *)v32;
    *(_WORD *)v48 = 2048;
    *(_QWORD *)&v48[2] = v10;
    *(_WORD *)v49 = 2112;
    *(_QWORD *)&v49[2] = v36;
    v50 = 2048;
    v51 = v9;
    _os_log_debug_impl(&dword_23AA66000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Dequeueing event: %u/%u path:'%@' fileID:%llu flags:%@ id:%llu", buf, 0x36u);

  }
  if ((v12 & 8) != 0)
  {
    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23AA66000, v23, OS_LOG_TYPE_INFO, "[INFO] fsevents id wrapped", buf, 2u);
    }

    -[FSChangeMonitor resetWithReason:newFSEventID:](self, "resetWithReason:newFSEventID:", 5, -1);
    fssync_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    v22 = v24;
    if (v17 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    goto LABEL_36;
  }
  if ((v12 & 0x10) == 0)
  {
    if ((v12 & 4) != 0)
    {
      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23AA66000, v27, OS_LOG_TYPE_INFO, "[INFO] kernel dropped an event", buf, 2u);
      }

      -[FSChangeMonitor resetWithReason:newFSEventID:](self, "resetWithReason:newFSEventID:", 10, -1);
      fssync_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      v22 = v28;
      if (v17 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v28))
        goto LABEL_37;
      *(_WORD *)buf = 0;
    }
    else
    {
      if ((v12 & 2) == 0)
        goto LABEL_10;
      if (self->_isProcessingHistory)
      {
        fp_current_or_default_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23AA66000, v29, OS_LOG_TYPE_INFO, "[INFO] dropped event during the processing of the historical stream", buf, 2u);
        }

        -[FSChangeMonitor resetWithReason:newFSEventID:](self, "resetWithReason:newFSEventID:", 8, -1);
        fssync_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        v22 = v30;
        if (v17 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v30))
          goto LABEL_37;
        *(_WORD *)buf = 0;
      }
      else
      {
        if (self->_plannedRescan)
        {
LABEL_10:
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke;
          v38[3] = &unk_250BDC2E0;
          v44 = v12;
          v42 = v9;
          v39 = v8;
          v40 = self;
          v41 = v37;
          v43 = v10;
          -[FSChangeMonitor foreachSubscriptionInState:apply:](self, "foreachSubscriptionInState:apply:", 2, v38);
          fssync_default_log();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23AA66000, v20, OS_SIGNPOST_INTERVAL_END, v14, "FS: event", ", buf, 2u);
          }

          v21 = 1;
          v22 = v39;
          goto LABEL_38;
        }
        fp_current_or_default_log();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_23AA66000, v34, OS_LOG_TYPE_INFO, "[INFO] dropped event during the processing of the live stream", buf, 2u);
        }

        -[FSChangeMonitor resetWithReason:newFSEventID:](self, "resetWithReason:newFSEventID:", 9, 0);
        fssync_default_log();
        v35 = objc_claimAutoreleasedReturnValue();
        v22 = v35;
        if (v17 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v35))
        {
LABEL_37:
          v21 = 0;
          goto LABEL_38;
        }
        *(_WORD *)buf = 0;
      }
    }
LABEL_36:
    _os_signpost_emit_with_name_impl(&dword_23AA66000, v22, OS_SIGNPOST_INTERVAL_END, v14, "FS: event", ", buf, 2u);
    goto LABEL_37;
  }
  fp_current_or_default_log();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23AA66000, v25, OS_LOG_TYPE_INFO, "[INFO] done processing history", buf, 2u);
  }

  self->_isProcessingHistory = 0;
  -[FSChangeMonitor deliverBarrierEvents](self, "deliverBarrierEvents");
  fssync_default_log();
  v26 = objc_claimAutoreleasedReturnValue();
  v22 = v26;
  if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23AA66000, v22, OS_SIGNPOST_INTERVAL_END, v14, "FS: event", ", buf, 2u);
  }
  v21 = 1;
LABEL_38:

  return v21;
}

uint64_t __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  __darwin_ino64_t st_ino;
  NSObject *v21;
  NSObject *v22;
  stat v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!objc_msgSend(v3, "ignoreOwnEvents") || (*(_BYTE *)(a1 + 74) & 8) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "barrierUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 86))
      {
        fp_current_or_default_log();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_7();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 104), "addObject:", v4);
        goto LABEL_22;
      }
      if ((*(_BYTE *)(a1 + 73) & 1) == 0)
      {
LABEL_22:
        v11 = 0;
LABEL_30:

        goto LABEL_31;
      }
      if (objc_msgSend(v3, "didProcessBarrierEventUUID:", v4))
      {
        fp_current_or_default_log();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          __39__FSChangeMonitor_deliverBarrierEvents__block_invoke_cold_1();

        goto LABEL_22;
      }
LABEL_29:
      v11 = 1;
      goto LABEL_30;
    }
    if ((*(_BYTE *)(a1 + 72) & 2) != 0)
    {
      fp_current_or_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_5();

      objc_msgSend(v3, "delegate");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject subscriptionHandleDroppedEvent:](v14, "subscriptionHandleDroppedEvent:", v3);
    }
    else
    {
      v6 = *(void **)(a1 + 48);
      objc_msgSend(v3, "root");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v6, "hasPrefix:", v7);

      if ((v6 & 1) != 0)
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 86)
          || (*(_WORD *)(a1 + 72) & 0xB01) == 0
          || (objc_msgSend(*(id *)(a1 + 32), "rawFlags") & 0x80000) != 0
          || (v16 = *(void **)(a1 + 48),
              objc_msgSend(v3, "root"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              LODWORD(v16) = objc_msgSend(v16, "isEqualToString:", v17),
              v17,
              !(_DWORD)v16))
        {
LABEL_11:
          fp_current_or_default_log();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_1();

          objc_msgSend(v3, "delegate");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "subscription:handleEventAtPath:targetItemID:eventID:flags:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 72));

          objc_msgSend(v3, "didProcessEventID:", *(_QWORD *)(a1 + 56));
          goto LABEL_29;
        }
        memset(&v23, 0, sizeof(v23));
        objc_msgSend(v3, "root", 0);
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        if (lstat((const char *)-[NSObject fileSystemRepresentation](v18, "fileSystemRepresentation"), &v23) < 0)
        {
          v19 = *__error();

          if (v19 == 2)
            goto LABEL_40;
          fp_current_or_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_3(v3, v18);
        }

LABEL_40:
        st_ino = v23.st_ino;
        if (st_ino != objc_msgSend(v3, "rootFileID"))
        {
          fp_current_or_default_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_2(v3, (uint64_t)&v23.st_ino, v22);

          exit(1);
        }
        if ((*(_WORD *)(a1 + 72) & 0xA01) != 0)
        {
          fp_current_or_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v3;
            _os_log_impl(&dword_23AA66000, v21, OS_LOG_TYPE_INFO, "[INFO] %@ root needs deep-scan", buf, 0xCu);
          }

          objc_msgSend(*(id *)(a1 + 40), "resetWithReason:newFSEventID:", 6, -1);
          goto LABEL_22;
        }
        goto LABEL_11;
      }
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_4();
    }

    goto LABEL_29;
  }
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_8();

  objc_msgSend(v3, "didProcessEventID:", *(_QWORD *)(a1 + 56));
  v11 = 1;
LABEL_31:

  return v11;
}

- (id)description
{
  int v3;
  const __CFString *v4;
  __CFString *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v3 = atomic_load((unsigned int *)&self->_suspendCount);
  if (v3 <= 0)
    v4 = CFSTR("running");
  else
    v4 = CFSTR("suspended");
  if (self->_isCancelled)
    v5 = CFSTR("cancelled");
  else
    v5 = (__CFString *)v4;
  v6 = atomic_load((unsigned int *)&self->_resetCount);
  if (v6 >= 1)
  {
    v7 = atomic_load((unsigned int *)&self->_resetCount);
    -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR(" reset:%d"), v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_stream)
  {
    -[__CFString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR(" [open stream]"));
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (__CFString *)v8;
  }
  -[NSMutableArray valueForKey:](self->_subscriptions, "valueForKey:", CFSTR("root"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_opt_class();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p %@ roots: %@>"), v11, self, v5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)flushStream
{
  fpfs_fsevent_stream_flush((uint64_t)self->_stream);
}

- (void)_close
{
  FSChangeMonitor *v3;
  NSObject *fseventsProcessSource;
  OS_dispatch_source *v5;
  uint64_t stream;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  FSVolume *volume;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  -[FSChangeMonitor suspend](self, "suspend");
  v3 = self;
  objc_sync_enter(v3);
  fseventsProcessSource = v3->_fseventsProcessSource;
  if (fseventsProcessSource)
  {
    dispatch_resume(fseventsProcessSource);
    v5 = v3->_fseventsProcessSource;
    v3->_fseventsProcessSource = 0;

  }
  stream = (uint64_t)v3->_stream;
  if (stream)
  {
    fpfs_fsevent_stream_close(stream);
    v3->_stream = 0;
    v3->_drainEvents = 1;
  }
  v7 = (void *)-[NSMutableArray copy](v3->_subscriptions, "copy");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dispose", (_QWORD)v13);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[NSMutableArray removeAllObjects](v3->_subscriptions, "removeAllObjects");
  volume = v3->_volume;
  v3->_volume = 0;

  objc_sync_exit(v3);
}

- (void)close
{
  id v6;

  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  v6 = a1;
  OUTLINED_FUNCTION_4_0(&dword_23AA66000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx closing the %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_9();
}

void __24__FSChangeMonitor_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__FSChangeMonitor_close__block_invoke_2;
  block[3] = &unk_250BDBB48;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __24__FSChangeMonitor_close__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

uint64_t __24__FSChangeMonitor_close__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_close");
}

- (void)resetWithReason:(int64_t)a3 newFSEventID:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  int *p_resetCount;
  unsigned int v10;
  dispatch_time_t v11;
  NSObject *streamQueue;
  _QWORD v13[7];
  id v14;
  _BYTE v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  fpfs_adopt_log();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_opt_class();
    -[FSChangeMonitor resetWithReason:newFSEventID:].cold.1(v8, a3, (uint64_t)v15, v7);
  }

  p_resetCount = &self->_resetCount;
  do
    v10 = __ldaxr((unsigned int *)p_resetCount);
  while (__stlxr(v10 + 1, (unsigned int *)p_resetCount));
  if (!v10)
    -[FSChangeMonitor suspend](self, "suspend");
  v11 = dispatch_time(0, 2000000000);
  streamQueue = self->_streamQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke;
  v13[3] = &unk_250BDC348;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a3;
  dispatch_after(v11, streamQueue, v13);
  __fp_pop_log();

}

uint64_t __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke(uint64_t result)
{
  uint64_t v1;
  unsigned int *v2;
  unsigned int v3;
  BOOL v4;
  signed int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  __int128 v16;
  uint64_t section;

  v1 = result;
  v2 = (unsigned int *)(*(_QWORD *)(result + 32) + 8);
  do
  {
    v3 = __ldaxr(v2);
    v4 = __OFSUB__(v3, 1);
    v5 = v3 - 1;
  }
  while (__stlxr(v5, v2));
  if ((v5 < 0) ^ v4 | (v5 == 0))
  {
    section = __fp_create_section();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_cold_1((uint64_t)&section, v6, v7, v8, v9, v10, v11, v12);

    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 81) = 1;
    v13 = *(_QWORD *)(v1 + 32);
    v14 = *(NSObject **)(v13 + 40);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_38;
    v15[3] = &unk_250BDC348;
    v15[4] = v13;
    v16 = *(_OWORD *)(v1 + 40);
    dispatch_async_and_wait(v14, v15);
    objc_msgSend(*(id *)(v1 + 32), "resume");
    return __fp_leave_section_Debug();
  }
  return result;
}

void __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_38(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];
  __int128 v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_2;
  block[3] = &unk_250BDC348;
  block[4] = v1;
  v4 = *(_OWORD *)(a1 + 40);
  dispatch_sync(v2, block);
}

uint64_t __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t *v4;
  uint64_t v6;
  _QWORD v7[4];
  __int128 v8;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_2_cold_1();

  if (*(_QWORD *)(a1 + 40)
    || (v6 = objc_msgSend(*(id *)(a1 + 32), "oldestStartingPoint"), *(_QWORD *)(a1 + 40))
    || v6 == -1)
  {
    objc_msgSend(*(id *)(a1 + 32), "deliverBarrierEvents");
    objc_msgSend(*(id *)(a1 + 32), "setPlannedRescan:", 1);
    v3 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_39;
    v7[3] = &__block_descriptor_48_e30_B16__0__FSChangeSubscription_8l;
    v8 = *(_OWORD *)(a1 + 40);
    objc_msgSend(v3, "foreachSubscriptionInState:apply:", 2, v7);
  }
  v4 = *(uint64_t **)(a1 + 32);
  if (v4[2])
  {
    fpfs_fsevent_stream_close(v4[2]);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v4 = *(uint64_t **)(a1 + 32);
  }
  return objc_msgSend(v4, "setUpStreamForReason:error:", *(_QWORD *)(a1 + 48), 0);
}

uint64_t __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setLastDeliveredEventID:", v3);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscription:handleResetWithReason:", v4, *(_QWORD *)(a1 + 40));

  return 1;
}

- (void)suspend
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a1 + 1;
  OUTLINED_FUNCTION_11(&dword_23AA66000, a2, a3, "[DEBUG] suspending - suspendCount:%d->%d", (uint8_t *)v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)resume
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  OUTLINED_FUNCTION_11(&dword_23AA66000, a3, (uint64_t)a3, "[DEBUG] resuming - suspendCount:%d->%d", (uint8_t *)v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_cancel
{
  int *p_resetCount;
  unsigned int v4;
  fpfs_fsevent_stream *stream;
  NSObject *fseventsProcessSource;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  if (!self->_isCancelled)
  {
    self->_isCancelled = 1;
    p_resetCount = &self->_resetCount;
    do
      v4 = __ldaxr((unsigned int *)p_resetCount);
    while (__stlxr(v4 + 1, (unsigned int *)p_resetCount));
    stream = self->_stream;
    if (stream)
      fpfs_fsevent_stream_suspend((uint64_t)stream);
    fseventsProcessSource = self->_fseventsProcessSource;
    if (fseventsProcessSource)
      dispatch_source_cancel(fseventsProcessSource);
  }
}

- (void)cancel
{
  NSObject *streamQueue;
  _QWORD block[5];

  streamQueue = self->_streamQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__FSChangeMonitor_cancel__block_invoke;
  block[3] = &unk_250BDBB48;
  block[4] = self;
  dispatch_async(streamQueue, block);
}

void __25__FSChangeMonitor_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__FSChangeMonitor_cancel__block_invoke_2;
  block[3] = &unk_250BDBB48;
  block[4] = v1;
  dispatch_async_and_wait(v2, block);
}

uint64_t __25__FSChangeMonitor_cancel__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (OS_dispatch_queue)delegationQueue
{
  return self->_delegationQueue;
}

- (NSURL)barrierFolderURL
{
  return self->_barrierFolderURL;
}

- (void)setBarrierFolderURL:(id)a3
{
  objc_storeStrong((id *)&self->_barrierFolderURL, a3);
}

- (BOOL)hasPlannedRescan
{
  return self->_plannedRescan;
}

- (void)setPlannedRescan:(BOOL)a3
{
  self->_plannedRescan = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barrierFolderURL, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pendingBarrierEvents, 0);
  objc_storeStrong((id *)&self->_subscriptions, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_fseventsToProcess, 0);
  objc_storeStrong((id *)&self->_fseventsProcessSource, 0);
  objc_storeStrong((id *)&self->_delegationQueue, 0);
  objc_storeStrong((id *)&self->_processQueue, 0);
  objc_storeStrong((id *)&self->_streamQueue, 0);
}

- (void)_activateSubscription:error:.cold.1()
{
  __assert_rtn("-[FSChangeMonitor _activateSubscription:error:]", "FSChangeMonitor.m", 183, "!subscription.isActivated");
}

- (void)_createStreamNamed:since:criteria:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_2(&dword_23AA66000, v0, v1, "[DEBUG] Observing %@ (%s)");
  OUTLINED_FUNCTION_1_0();
}

- (void)setUpStreamForReason:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "com.apple.fpfs.fsevents";
  v4 = 2048;
  v5 = a1;
  OUTLINED_FUNCTION_4_0(&dword_23AA66000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Creating stream with name %s since %llu", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queueEvents:markSelfEncountered:.cold.1()
{
  __assert_rtn("-[FSChangeMonitor _queueEvents:markSelfEncountered:]", "FSChangeMonitor.m", 502, "_fseventsToProcess.count < _maxFSEventQueueSize");
}

- (void)_queueEvents:markSelfEncountered:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AA66000, v0, v1, "[DEBUG] Incoming events need deep scan.  Dropping all existing events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)_queueEvents:markSelfEncountered:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AA66000, v0, v1, "[DEBUG] Already need deep scan.  Dropping all incoming events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __39__FSChangeMonitor_deliverBarrierEvents__block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_1_2(&dword_23AA66000, v0, v1, "[DEBUG] %@ (handling barrier - %@)");
  OUTLINED_FUNCTION_1_0();
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_23AA66000, v0, v1, "[DEBUG] %@ processing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "rootFileID");
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_23AA66000, a3, OS_LOG_TYPE_FAULT, "[CRIT] The root fileID changed from %llu to %llu", v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "root");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *__error();
  v5 = 138412546;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_23AA66000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Cannot stat root at '%@' after fsevent:%{errno}d", (uint8_t *)&v5, 0x12u);

  OUTLINED_FUNCTION_1();
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_23AA66000, v0, v1, "[DEBUG] %@ (ignored uninteresting path)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_23AA66000, v0, v1, "[DEBUG] %@ (dropped event)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_23AA66000, v0, v1, "[DEBUG] Historical stream is being processed - enqueuing barrier event %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __56__FSChangeMonitor_handleFSEvent_indexInBatch_batchSize___block_invoke_cold_8()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_2(&dword_23AA66000, v0, v1, "[DEBUG] %@ ignore event #%llu (own event)");
  OUTLINED_FUNCTION_1_0();
}

- (void)resetWithReason:(uint64_t)a3 newFSEventID:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  const __CFString *v6;
  id v7;

  if ((unint64_t)(a2 - 1) > 9)
    v6 = CFSTR("unspecified reason");
  else
    v6 = off_250BDC3D8[a2 - 1];
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = v6;
  v7 = a1;
  OUTLINED_FUNCTION_4_0(&dword_23AA66000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] resetting the %@ because of %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_9();
}

void __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_23AA66000, a2, a3, "[DEBUG] ┏%llx reset: drained all fsevents from the old stream", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __48__FSChangeMonitor_resetWithReason_newFSEventID___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_23AA66000, v0, v1, "[DEBUG] creating the new stream", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
