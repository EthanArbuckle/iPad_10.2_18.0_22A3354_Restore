@implementation BRQuery

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = (void *)gBRActiveQueriesSet;
    gBRActiveQueriesSet = (uint64_t)v2;

  }
}

+ (id)willBeginPossibleCreationOfItemAtURL:(id)a3
{
  id v3;
  int active_platform;
  BRQueryStitch *v6;
  void *v7;

  v3 = a3;
  if (!atomic_load(&gBRActiveQueries))
    goto LABEL_12;
  active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) != 2)
  {
    if (active_platform == 11)
    {
      if (!dyld_program_sdk_at_least())
        goto LABEL_12;
      goto LABEL_10;
    }
    if (active_platform != 1)
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
      goto LABEL_10;
    }
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
    goto LABEL_12;
LABEL_10:
  if (!objc_msgSend(v3, "br_isInSyncedLocation"))
  {
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  v6 = -[BRQueryStitch initWithURL:objid:kind:]([BRQueryStitch alloc], "initWithURL:objid:kind:", v3, 0, 0);
  pthread_rwlock_rdlock(&gBRActiveQueriesMutex);
  objc_msgSend((id)gBRActiveQueriesSet, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRQueryStitch setQueries:](v6, "setQueries:", v7);

  pthread_rwlock_unlock(&gBRActiveQueriesMutex);
LABEL_13:

  return v6;
}

+ (id)willBeginPossibleDeletionOfItemAtURL:(id)a3
{
  id v3;
  int active_platform;
  void *v6;
  BRQueryStitch *v7;
  void *v8;

  v3 = a3;
  if (!atomic_load(&gBRActiveQueries))
    goto LABEL_13;
  active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) != 2)
  {
    if (active_platform == 11)
    {
      if (!dyld_program_sdk_at_least())
        goto LABEL_13;
      goto LABEL_10;
    }
    if (active_platform != 1)
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
      goto LABEL_10;
    }
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
    goto LABEL_13;
LABEL_10:
  if (!objc_msgSend(v3, "br_isInSyncedLocation"))
  {
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  +[BRFileObjectID fileObjectIDForURL:allocateDocID:error:](BRFileObjectID, "fileObjectIDForURL:allocateDocID:error:", v3, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[BRQueryStitch initWithURL:objid:kind:]([BRQueryStitch alloc], "initWithURL:objid:kind:", v3, v6, 2);
    pthread_rwlock_rdlock(&gBRActiveQueriesMutex);
    objc_msgSend((id)gBRActiveQueriesSet, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRQueryStitch setQueries:](v7, "setQueries:", v8);

    pthread_rwlock_unlock(&gBRActiveQueriesMutex);
  }
  else
  {
    v7 = 0;
  }

LABEL_14:
  return v7;
}

+ (id)willBeginPossibleMoveOfItemAtURL:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  int active_platform;
  void *v9;
  BRQueryStitch *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (!atomic_load(&gBRActiveQueries))
    goto LABEL_14;
  active_platform = dyld_get_active_platform();
  if ((active_platform & 0xFFFFFFFB) != 2)
  {
    if (active_platform == 11)
    {
      if (!dyld_program_sdk_at_least())
        goto LABEL_14;
      goto LABEL_10;
    }
    if (active_platform != 1)
    {
      syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
      goto LABEL_10;
    }
  }
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
LABEL_14:
    v10 = 0;
    goto LABEL_17;
  }
LABEL_10:
  if ((objc_msgSend(v5, "br_isInSyncedLocation") & 1) == 0 && !objc_msgSend(v6, "br_isInSyncedLocation"))
    goto LABEL_14;
  +[BRFileObjectID fileObjectIDForURL:allocateDocID:error:](BRFileObjectID, "fileObjectIDForURL:allocateDocID:error:", v5, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[BRQueryStitch initWithURL:objid:kind:]([BRQueryStitch alloc], "initWithURL:objid:kind:", v6, v9, 1);
    -[BRQueryStitch setFromURL:](v10, "setFromURL:", v5);
    pthread_rwlock_rdlock(&gBRActiveQueriesMutex);
    objc_msgSend((id)gBRActiveQueriesSet, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRQueryStitch setQueries:](v10, "setQueries:", v11);

    pthread_rwlock_unlock(&gBRActiveQueriesMutex);
  }
  else
  {
    v10 = 0;
  }

LABEL_17:
  return v10;
}

+ (void)didEndPossibleFileOperation:(id)a3
{
  objc_msgSend(a3, "done");
}

- (NSString)description
{
  const __CFString *v3;

  if (atomic_load((unsigned int *)&self->_disableCount))
    v3 = CFSTR("suspended");
  else
    v3 = CFSTR("running");
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@ state:%s predicate:%@>"), objc_opt_class(), self, v3, queryStateToCString[self->_queryState], self->_predicate);
}

- (BRQuery)initWithQuery:(id)a3 values:(id)a4 sortingAttributes:(id)a5 items:(id)a6
{
  id v9;
  id v10;
  id v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BRItemCollectionGatherer *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char *v33;
  BRNotificationReceiver *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD v46[4];
  char *v47;
  objc_super v48;

  v9 = a3;
  v48.receiver = self;
  v48.super_class = (Class)BRQuery;
  v10 = a5;
  v11 = a4;
  v12 = -[BRQuery init](&v48, sel_init);
  objc_msgSend(v12, "setQuery:", v9);
  objc_msgSend(v9, "predicate");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)v12 + 6);
  *((_QWORD *)v12 + 6) = v13;

  v17 = BRIsFPFSEnabled(v15, v16);
  v12[96] = v17;
  if (v17)
  {
    v18 = -[BRItemCollectionGatherer initWithDelegate:query:]([BRItemCollectionGatherer alloc], "initWithDelegate:query:", v12, v9);
    v19 = (void *)*((_QWORD *)v12 + 36);
    *((_QWORD *)v12 + 36) = v18;

    v20 = objc_opt_new();
    v21 = (void *)*((_QWORD *)v12 + 37);
    *((_QWORD *)v12 + 37) = v20;

    v22 = objc_opt_new();
    v23 = (void *)*((_QWORD *)v12 + 38);
    *((_QWORD *)v12 + 38) = v22;

    v24 = objc_opt_new();
    v25 = (void *)*((_QWORD *)v12 + 41);
    *((_QWORD *)v12 + 41) = v24;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v26 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v26, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create("br-progress-queue", v27);

    v29 = (void *)*((_QWORD *)v12 + 43);
    *((_QWORD *)v12 + 43) = v28;

    br_pacer_create("br-progress-pacer", *((void **)v12 + 43), 1.0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v12 + 42);
    *((_QWORD *)v12 + 42) = v30;

    v32 = (void *)*((_QWORD *)v12 + 42);
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __56__BRQuery_initWithQuery_values_sortingAttributes_items___block_invoke;
    v46[3] = &unk_1E3DA4738;
    v47 = v12;
    br_pacer_set_event_handler(v32, v46);
    br_pacer_resume(*((unsigned __int8 **)v12 + 42));
    v33 = v47;
  }
  else
  {
    v34 = objc_alloc_init(BRNotificationReceiver);
    v33 = (char *)*((_QWORD *)v12 + 4);
    *((_QWORD *)v12 + 4) = v34;
  }

  v35 = objc_msgSend(v11, "copy");
  v36 = (void *)*((_QWORD *)v12 + 13);
  *((_QWORD *)v12 + 13) = v35;

  v37 = objc_msgSend(v10, "copy");
  v38 = (void *)*((_QWORD *)v12 + 14);
  *((_QWORD *)v12 + 14) = v37;

  *(_OWORD *)(v12 + 120) = xmmword_19CC7DAA0;
  *(_OWORD *)(v12 + 136) = xmmword_19CC7DAA0;
  *(_OWORD *)(v12 + 152) = xmmword_19CC7DAA0;
  v39 = objc_opt_new();
  v40 = (void *)*((_QWORD *)v12 + 8);
  *((_QWORD *)v12 + 8) = v39;

  v41 = objc_opt_new();
  v42 = (void *)*((_QWORD *)v12 + 9);
  *((_QWORD *)v12 + 9) = v41;

  v43 = objc_opt_new();
  v44 = (void *)*((_QWORD *)v12 + 10);
  *((_QWORD *)v12 + 10) = v43;

  return (BRQuery *)v12;
}

uint64_t __56__BRQuery_initWithQuery_values_sortingAttributes_items___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processProgressUpdateBatch");
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: _receiver.delegate == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (id)valuesOfAttribute:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_results, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_results;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v9 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v11);

        objc_msgSend(v9, "attributeForName:", v4, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        ++v11;
        v12 = v9;
      }
      while (v8 != v11);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);

  }
  return v5;
}

- (void)_setQueryState:(int)a3
{
  void *v5;
  NSObject *v6;
  OS_dispatch_queue *progressQueue;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int queryState;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  BRItemCollectionGatherer *collectionGatherer;
  id networkReachabilityToken;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  void *v26;
  NSObject *v27;
  _QWORD block[5];
  _QWORD v29[4];
  id v30;
  _QWORD v31[3];
  _BYTE location[12];
  __int16 v33;
  BRQuery *v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  memset(v31, 0, sizeof(v31));
  __brc_create_section(0, (uint64_t)"-[BRQuery _setQueryState:]", 557, v31);
  brc_bread_crumbs((uint64_t)"-[BRQuery _setQueryState:]", 557);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v25 = queryStateToCString[a3];
    *(_DWORD *)location = 134218754;
    *(_QWORD *)&location[4] = v31[0];
    v33 = 2112;
    v34 = self;
    v35 = 2080;
    v36 = v25;
    v37 = 2112;
    v38 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: setting state to %s%@", location, 0x2Au);
  }

  if (!self->_isFPFSMode)
  {
    queryState = self->_queryState;
    -[BRQuery receiver](self, "receiver");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    self->_queryState = a3;
    switch(a3)
    {
      case 1:
        if (!queryState)
        {
          pthread_rwlock_wrlock(&gBRActiveQueriesMutex);
          do
            v17 = __ldaxr(&gBRActiveQueries);
          while (__stlxr(v17 + 1, &gBRActiveQueries));
          objc_msgSend((id)gBRActiveQueriesSet, "addObject:", self);
          pthread_rwlock_unlock(&gBRActiveQueriesMutex);
        }
        objc_msgSend(v12, "setDelegate:", self);
        objc_msgSend(v12, "setBatchingChanges:", self->_batchingParameters.first_max_num);
        v18 = 128;
        goto LABEL_23;
      case 2:
        objc_msgSend(v16, "setBatchingChanges:", self->_batchingParameters.progress_max_num);
        v18 = 144;
        goto LABEL_23;
      case 3:
        objc_msgSend(v16, "setBatchingChanges:", self->_batchingParameters.update_max_num);
        v18 = 160;
LABEL_23:
        objc_msgSend(v12, "setBatchingDelay:", (double)*(unint64_t *)((char *)&self->super.isa + v18) / 1000.0);
        break;
      case 4:
        objc_msgSend(v16, "invalidateAndDontNotifyDelegate");
        pthread_rwlock_wrlock(&gBRActiveQueriesMutex);
        if (objc_msgSend((id)gBRActiveQueriesSet, "containsObject:", self))
        {
          do
            v22 = __ldaxr(&gBRActiveQueries);
          while (__stlxr(v22 - 1, &gBRActiveQueries));
          objc_msgSend((id)gBRActiveQueriesSet, "removeObject:", self);
          v23 = objc_msgSend((id)gBRActiveQueriesSet, "count");
          v24 = atomic_load(&gBRActiveQueries);
          if (v23 != v24)
          {
            brc_bread_crumbs((uint64_t)"-[BRQuery _setQueryState:]", 627);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(0);
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
              -[BRQuery _setQueryState:].cold.1();

          }
        }
        pthread_rwlock_unlock(&gBRActiveQueriesMutex);
        break;
      default:
        goto LABEL_24;
    }
    goto LABEL_24;
  }
  self->_queryState = a3;
  if (a3 == 4)
  {
    -[BRItemCollectionGatherer invalidate](self->_collectionGatherer, "invalidate");
    collectionGatherer = self->_collectionGatherer;
    self->_collectionGatherer = 0;

    -[BRQuery _stopProgressObservers](self, "_stopProgressObservers");
    BRRemoveNetworkReachabilityObserver(self->_networkReachabilityToken);
    networkReachabilityToken = self->_networkReachabilityToken;
    self->_networkReachabilityToken = 0;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getUIApplicationWillResignActiveNotification();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, v21, 0);

    getUIApplicationDidBecomeActiveNotification[0]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, v14, 0);
LABEL_16:

LABEL_24:
    goto LABEL_25;
  }
  if (a3 == 1)
  {
    if (!self->_networkReachabilityToken)
    {
      objc_initWeak((id *)location, self);
      progressQueue = self->_progressQueue;
      v8 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __26__BRQuery__setQueryState___block_invoke;
      v29[3] = &unk_1E3DA7288;
      objc_copyWeak(&v30, (id *)location);
      BRAddNetworkReachabilityObserverWithCallbackQueue(progressQueue, v29);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = self->_networkReachabilityToken;
      self->_networkReachabilityToken = v9;

      v11 = self->_progressQueue;
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __26__BRQuery__setQueryState___block_invoke_2;
      block[3] = &unk_1E3DA4738;
      block[4] = self;
      dispatch_async(v11, block);
      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)location);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    getUIApplicationWillResignActiveNotification();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__applicationWillResignActive_, v13, 0);

    getUIApplicationDidBecomeActiveNotification[0]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActive_, v14, 0);
    goto LABEL_16;
  }
LABEL_25:
  __brc_leave_section((uint64_t)v31);
}

void __26__BRQuery__setQueryState___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "networkReachabilityChanged:", a2);

}

void __26__BRQuery__setQueryState___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  +[BRReachabilityMonitor sharedReachabilityMonitor](BRReachabilityMonitor, "sharedReachabilityMonitor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "networkReachabilityChanged:", objc_msgSend(v2, "isNetworkReachable"));

}

- (void)disableUpdates
{
  int *p_disableCount;
  unsigned int v3;
  _QWORD v4[5];

  p_disableCount = &self->_disableCount;
  do
    v3 = __ldaxr((unsigned int *)p_disableCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_disableCount));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __25__BRQuery_disableUpdates__block_invoke;
  v4[3] = &unk_1E3DA4738;
  v4[4] = self;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v4);
}

void __25__BRQuery_disableUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v1 + 284);
  *(_DWORD *)(v1 + 284) = v3 + 1;
  if (!v3)
  {
    if (*((_BYTE *)*v2 + 96))
    {
      brc_bread_crumbs((uint64_t)"-[BRQuery disableUpdates]_block_invoke", 643);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __25__BRQuery_disableUpdates__block_invoke_cold_2();

      objc_msgSend(*((id *)*v2 + 36), "disableUpdates");
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRQuery disableUpdates]_block_invoke", 649);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __25__BRQuery_disableUpdates__block_invoke_cold_1();

      objc_msgSend(*v2, "receiver");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "suspend");

    }
  }
}

- (void)enableUpdates
{
  int *p_disableCount;
  unsigned int v3;
  _QWORD v4[5];

  p_disableCount = &self->_disableCount;
  do
    v3 = __ldaxr((unsigned int *)p_disableCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_disableCount));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __24__BRQuery_enableUpdates__block_invoke;
  v4[3] = &unk_1E3DA4738;
  v4[4] = self;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v4);
}

void __24__BRQuery_enableUpdates__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  int v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;

  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v1 + 284) - 1;
  *(_DWORD *)(v1 + 284) = v3;
  if (!v3)
  {
    if (*((_BYTE *)*v2 + 96))
    {
      brc_bread_crumbs((uint64_t)"-[BRQuery enableUpdates]_block_invoke", 663);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __24__BRQuery_enableUpdates__block_invoke_cold_2();

      objc_msgSend(*((id *)*v2 + 36), "enableUpdates");
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRQuery enableUpdates]_block_invoke", 669);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __24__BRQuery_enableUpdates__block_invoke_cold_1();

      objc_msgSend(*v2, "receiver");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "resume");

    }
  }
}

- (void)_performBlockAsync:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSOperationQueue *queryQueue;
  __CFRunLoop *runLoop;
  int active_platform;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __30__BRQuery__performBlockAsync___block_invoke;
  v12[3] = &unk_1E3DA6E48;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v6 = (void *)MEMORY[0x1A1AD85E4](v12);
  queryQueue = self->_queryQueue;
  if (!queryQueue)
  {
    runLoop = self->_runLoop;
    if (runLoop)
    {
      CFRunLoopPerformBlock(runLoop, (CFTypeRef)*MEMORY[0x1E0C9B270], v6);
      CFRunLoopWakeUp(self->_runLoop);
      goto LABEL_17;
    }
    active_platform = dyld_get_active_platform();
    if ((active_platform & 0xFFFFFFFB) != 2)
    {
      if (active_platform == 11)
      {
        if (dyld_program_sdk_at_least())
          goto LABEL_14;
        goto LABEL_11;
      }
      if (active_platform != 1)
      {
        syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
        goto LABEL_14;
      }
    }
    if ((dyld_program_sdk_at_least() & 1) != 0)
    {
LABEL_14:
      brc_bread_crumbs((uint64_t)"-[BRQuery _performBlockAsync:]", 693);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BRQuery _performBlockAsync:].cold.1();
LABEL_16:

      goto LABEL_17;
    }
LABEL_11:
    brc_bread_crumbs((uint64_t)"-[BRQuery _performBlockAsync:]", 695);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      -[BRQuery _performBlockAsync:].cold.2();
    goto LABEL_16;
  }
  -[NSOperationQueue addOperationWithBlock:](queryQueue, "addOperationWithBlock:", v6);
LABEL_17:

}

void __30__BRQuery__performBlockAsync___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 96) && !*(_QWORD *)(v1 + 288))
  {
    brc_bread_crumbs((uint64_t)"-[BRQuery _performBlockAsync:]_block_invoke", 679);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __30__BRQuery__performBlockAsync___block_invoke_cold_1();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)stop
{
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD v6[3];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  BRQuery *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  memset(v6, 0, sizeof(v6));
  __brc_create_section(0, (uint64_t)"-[BRQuery stop]", 702, v6);
  brc_bread_crumbs((uint64_t)"-[BRQuery stop]", 702);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v8 = v6[0];
    v9 = 2112;
    v10 = self;
    v11 = 2112;
    v12 = v3;
    _os_log_debug_impl(&dword_19CBF0000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx stopping %@%@", buf, 0x20u);
  }

  -[BRQuery setQuery:](self, "setQuery:", 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __15__BRQuery_stop__block_invoke;
  v5[3] = &unk_1E3DA4738;
  v5[4] = self;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v5);
  __brc_leave_section((uint64_t)v6);
}

uint64_t __15__BRQuery_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setQueryState:", 4);
}

- (void)_watchScopes
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] The current process has the following container IDs that should be added to the search scopes = %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_runQuery
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] not doing anything, we're already started%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (unsigned)executeWithOptions:(unint64_t)a3
{
  NSMutableArray *v4;
  NSMutableArray *results;
  _BOOL4 isFPFSMode;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  NSObject *v12;

  if (self->_results)
  {
    brc_bread_crumbs((uint64_t)"-[BRQuery executeWithOptions:]", 781);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRQuery executeWithOptions:].cold.1();

  }
  v4 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 64);
  results = self->_results;
  self->_results = v4;

  isFPFSMode = self->_isFPFSMode;
  v7 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 64);
  v8 = 24;
  if (!isFPFSMode)
    v8 = 16;
  v9 = *(Class *)((char *)&self->super.isa + v8);
  *(Class *)((char *)&self->super.isa + v8) = v7;

  -[BRQuery _runQuery](self, "_runQuery");
  return 1;
}

- (id)attributeValueForName:(id)a3 forResultAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (-[NSMutableArray count](self->_results, "count") <= a4)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_results, "objectAtIndex:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributeForName:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (unint64_t)countOfResultsForAttributeName:(id)a3 value:(id)a4
{
  return 0;
}

- (int64_t)indexOfResult:(const void *)a3
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t (*create_result_callbacks_equal)(uint64_t, const void *);
  void *v9;

  v5 = -[NSMutableArray count](self->_results, "count");
  if (v5 < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  while (1)
  {
    create_result_callbacks_equal = (uint64_t (*)(uint64_t, const void *))self->_create_result_callbacks_equal;
    -[NSMutableArray objectAtIndex:](self->_results, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(create_result_callbacks_equal) = create_result_callbacks_equal(objc_msgSend(v9, "replacement"), a3);

    if ((_DWORD)create_result_callbacks_equal)
      break;
    if (v6 == ++v7)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (id)_replacementObjectForQueryItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (self->_create_result_fn)
  {
    objc_msgSend(v4, "replacement");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      ((void (*)(BRQuery *, void *, void *))self->_create_result_fn)(self, v5, self->_create_result_context);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setReplacement:", v6);
    }
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (id)_replacementObjectsForArrayOfQueryItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[BRQuery _replacementObjectForQueryItem:](self, "_replacementObjectForQueryItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (const)resultAtIndex:(int64_t)a3
{
  void *v5;
  id v6;

  if (-[NSMutableArray count](self->_results, "count") <= a3)
    return 0;
  -[NSMutableArray objectAtIndex:](self->_results, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[BRQuery _replacementObjectForQueryItem:](self, "_replacementObjectForQueryItem:", v5);

  return v6;
}

- (unint64_t)resultCount
{
  return -[NSMutableArray count](self->_results, "count");
}

- (void)setBatchingParameters:(id *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_batchingParameters.update_max_num = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_batchingParameters.progress_max_num = v4;
  *(_OWORD *)&self->_batchingParameters.first_max_num = v3;
}

- (void)setExternalDocumentsBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;

}

- (void)setCreateResultFunction:(void *)a3 withContext:(void *)a4 callbacks:(id *)a5
{
  void *var4;
  uint64_t (*var2)();

  self->_create_result_fn = a3;
  self->_create_result_context = a4;
  if (!a5)
  {
    self->_create_result_callbacks_equal = MLEqualCallback;
LABEL_7:
    var2 = MLReleaseCallback;
    goto LABEL_8;
  }
  var4 = a5->var4;
  if (!var4)
    var4 = MLEqualCallback;
  self->_create_result_callbacks_equal = var4;
  var2 = (uint64_t (*)())a5->var2;
  if (!var2)
    goto LABEL_7;
LABEL_8:
  self->_create_result_callbacks_release = var2;
}

- (void)setCreateValueFunction:(void *)a3 withContext:(void *)a4 callbacks:(id *)a5
{
  void *var4;
  uint64_t (*var2)();

  self->_create_value_fn = a3;
  self->_create_value_context = a4;
  if (!a5)
  {
    self->_create_value_callbacks_equal = MLEqualCallback;
LABEL_7:
    var2 = MLReleaseCallback;
    goto LABEL_8;
  }
  var4 = a5->var4;
  if (!var4)
    var4 = MLEqualCallback;
  self->_create_value_callbacks_equal = var4;
  var2 = (uint64_t (*)())a5->var2;
  if (!var2)
    goto LABEL_7;
LABEL_8:
  self->_create_value_callbacks_release = var2;
}

- (void)setSearchScope:(id)a3 withOptions:(unsigned int)a4
{
  NSArray *v6;
  NSArray *searchScopes;

  v6 = (NSArray *)objc_msgSend(a3, "copy");
  searchScopes = self->_searchScopes;
  self->_searchScopes = v6;

  self->_scopeOptions = a4;
}

- (void)setSortComparator:(void *)a3 withContext:(void *)a4
{
  self->_sort_fn = a3;
  self->_sort_context = a4;
}

- (void)setQueryQueue:(id)a3
{
  NSOperationQueue *v5;
  NSOperationQueue *v6;
  NSOperationQueue **p_queryQueue;
  void *v8;
  NSObject *v9;

  v5 = (NSOperationQueue *)a3;
  v6 = v5;
  if (self->_queryQueue != v5)
  {
    p_queryQueue = &self->_queryQueue;
    if (-[NSOperationQueue maxConcurrentOperationCount](v5, "maxConcurrentOperationCount") != 1)
    {
      brc_bread_crumbs((uint64_t)"-[BRQuery setQueryQueue:]", 941);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[BRQuery setQueryQueue:].cold.1();

    }
    objc_storeStrong((id *)p_queryQueue, a3);
  }

}

- (id)queryQueue
{
  return self->_queryQueue;
}

- (void)_postNote:(__CFString *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;

  brc_bread_crumbs((uint64_t)"-[BRQuery _postNote:]", 954);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRQuery _postNote:].cold.1((uint64_t)a3);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", a3, self);

}

- (void)_postNote:(__CFString *)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  __CFString *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  brc_bread_crumbs((uint64_t)"-[BRQuery _postNote:userInfo:]", 960);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412802;
    v11 = a3;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_debug_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] posting %@: %@%@", (uint8_t *)&v10, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", a3, self, v6);

}

- (BOOL)_collectUpdates:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int16 v14;
  int v15;
  void *v16;
  NSMutableDictionary *toBeInsertedByFileObjectID;
  int active_platform;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  BOOL v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[3];
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v33, 0, sizeof(v33));
  __brc_create_section(0, (uint64_t)"-[BRQuery _collectUpdates:]", 966, v33);
  brc_bread_crumbs((uint64_t)"-[BRQuery _collectUpdates:]", 966);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v36 = v33[0];
    v37 = 2112;
    v38 = v4;
    v39 = 2112;
    v40 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx changes = %@%@", buf, 0x20u);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1A1AD841C]();
        objc_msgSend(v10, "fileObjectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "isDead");
        v14 = objc_msgSend(v10, "diffs");
        if ((v13 & 1) == 0)
        {
          if (-[NSPredicate evaluateWithObject:](self->_predicate, "evaluateWithObject:", v10))
          {
            v15 = 0;
            goto LABEL_13;
          }
          objc_msgSend(v10, "markDead");
        }
        v15 = 1;
LABEL_13:
        -[NSMutableDictionary objectForKey:](self->_resultsByRowID, "objectForKey:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if (v15)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_toBeReplacedByFileObjectID, "removeObjectForKey:", v12);
LABEL_30:
            -[NSMutableDictionary setObject:forKey:](self->_toBeRemovedByFileObjectID, "setObject:forKey:", v16, v12);
            goto LABEL_33;
          }
          if ((v14 & 0xC030) != 0)
          {
            active_platform = dyld_get_active_platform();
            if ((active_platform & 0xFFFFFFFB) == 2 || active_platform == 1 || active_platform == 11)
            {
              if ((dyld_program_sdk_at_least() & 1) == 0)
              {
                -[NSMutableDictionary removeObjectForKey:](self->_toBeReplacedByFileObjectID, "removeObjectForKey:", v12);
                -[NSMutableDictionary setObject:forKey:](self->_toBeInsertedByFileObjectID, "setObject:forKey:", v10, v12);
                goto LABEL_30;
              }
            }
            else
            {
              syslog(5, "Unknown platform linking against CloudDocs framework %d", active_platform);
            }
          }
          -[NSMutableDictionary setObject:forKey:](self->_toBeReplacedByFileObjectID, "setObject:forKey:", v10, v12);
          -[NSMutableDictionary removeObjectForKey:](self->_toBeRemovedByFileObjectID, "removeObjectForKey:", v12);
        }
        else
        {
          toBeInsertedByFileObjectID = self->_toBeInsertedByFileObjectID;
          if (v15)
          {
            -[NSMutableDictionary objectForKey:](toBeInsertedByFileObjectID, "objectForKey:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v16, "canMerge:", v10))
              -[NSMutableDictionary removeObjectForKey:](self->_toBeInsertedByFileObjectID, "removeObjectForKey:", v12);
          }
          else
          {
            -[NSMutableDictionary objectForKey:](toBeInsertedByFileObjectID, "objectForKey:", v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v19;
            if (v19)
            {
              objc_msgSend(v19, "merge:", v10);
            }
            else
            {
              -[NSMutableDictionary setObject:forKey:](self->_toBeInsertedByFileObjectID, "setObject:forKey:", v10, v12);
              v16 = 0;
            }
          }
        }
LABEL_33:

        objc_autoreleasePoolPop(v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v7);
  }

  brc_bread_crumbs((uint64_t)"-[BRQuery _collectUpdates:]", 1029);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[BRQuery _collectUpdates:].cold.3((uint64_t)self);

  brc_bread_crumbs((uint64_t)"-[BRQuery _collectUpdates:]", 1030);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[BRQuery _collectUpdates:].cold.2((uint64_t)self);

  brc_bread_crumbs((uint64_t)"-[BRQuery _collectUpdates:]", 1031);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[BRQuery _collectUpdates:].cold.1((uint64_t)self);

  kdebug_trace();
  v26 = -[NSMutableDictionary count](self->_toBeRemovedByFileObjectID, "count")
     || -[NSMutableDictionary count](self->_toBeInsertedByFileObjectID, "count")
     || -[NSMutableDictionary count](self->_toBeReplacedByFileObjectID, "count") != 0;
  __brc_leave_section((uint64_t)v33);

  return v26;
}

- (void)_processUpdates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] Crash recovery is done%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __26__BRQuery__processUpdates__block_invoke(uint64_t a1, unint64_t a2)
{
  id v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count") <= a2)
    __26__BRQuery__processUpdates__block_invoke_cold_1();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 192))(0, objc_msgSend(v4, "replacement"));
  objc_msgSend(v4, "setReplacement:", 0);

}

- (void)_processChanges:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[3];
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  BRQuery *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v21, 0, sizeof(v21));
  __brc_create_section(0, (uint64_t)"-[BRQuery _processChanges:]", 1155, v21);
  brc_bread_crumbs((uint64_t)"-[BRQuery _processChanges:]", 1155);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v24 = v21[0];
    v25 = 2112;
    v26 = self;
    v27 = 2112;
    v28 = v4;
    v29 = 2112;
    v30 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %@: processing changes %@%@", buf, 0x2Au);
  }

  if (self->_queryState == 4
    || (-[BRQuery query](self, "query"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = v7 == 0,
        v7,
        v8))
  {
    brc_bread_crumbs((uint64_t)"-[BRQuery _processChanges:]", 1158);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRQuery _processChanges:].cold.1();

  }
  else
  {
    if (self->_queryState == 1)
    {
      -[BRQuery _setQueryState:](self, "_setQueryState:", 2);
      -[BRQuery _postNote:](self, "_postNote:", CFSTR("__kMDQueryWillChangeNotification"));
    }
    if (self->_needsCrashMarking)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = self->_results;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "setIsPreCrash:", 1, (_QWORD)v17);
          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v10);
      }

      self->_needsCrashMarking = 0;
    }
    if (-[BRQuery _collectUpdates:](self, "_collectUpdates:", v4, (_QWORD)v17)
      || self->_needsCrashEvicting && -[NSMutableArray count](self->_results, "count"))
    {
      -[BRQuery _processUpdates](self, "_processUpdates");
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[BRQuery _processChanges:]", 1177);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[BRQuery _processChanges:].cold.2();

    }
    if (self->_queryState == 2 && self->_ubiquitousGatherComplete)
    {
      -[BRQuery _setQueryState:](self, "_setQueryState:", 3);
      -[BRQuery _postNote:](self, "_postNote:", CFSTR("kMDQueryDidFinishNotification"));
    }
  }
  __brc_leave_section((uint64_t)v21);

}

- (void)processUpdates
{
  id v3;

  if (!atomic_load((unsigned int *)&self->_disableCount))
  {
    -[BRQuery receiver](self, "receiver");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "flush");

  }
}

- (void)_sendHasUpdateNotificationIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] posting has updates notifications%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSendHasUpdateNotification:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40__BRQuery_setSendHasUpdateNotification___block_invoke;
  v3[3] = &unk_1E3DA59E8;
  v3[4] = self;
  v4 = a3;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v3);
}

uint64_t __40__BRQuery_setSendHasUpdateNotification___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(unsigned __int8 *)(*(_QWORD *)(result + 32) + 95) != *(unsigned __int8 *)(result + 40))
  {
    v1 = result;
    brc_bread_crumbs((uint64_t)"-[BRQuery setSendHasUpdateNotification:]_block_invoke", 1218);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = "Enabling";
      v5 = *(_QWORD *)(v1 + 32);
      if (!*(_BYTE *)(v1 + 40))
        v4 = "Disabling";
      v6 = 136315650;
      v7 = v4;
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v2;
      _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] %s update notifications on %@%@", (uint8_t *)&v6, 0x20u);
    }

    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 95) = *(_BYTE *)(v1 + 40);
    return objc_msgSend(*(id *)(v1 + 32), "_sendHasUpdateNotificationIfNeeded");
  }
  return result;
}

- (void)notificationsReceiverDidInvalidate:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke;
  v6[3] = &unk_1E3DA4A70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v6);

}

void __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  BRNotificationReceiver *v7;
  _DWORD *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[3];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, sizeof(v14));
  __brc_create_section(0, (uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1230, v14);
  brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1230);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v11 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v16 = v14[0];
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v2;
    _os_log_debug_impl(&dword_19CBF0000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx remote process is gone for %@%@", buf, 0x20u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) != *(_QWORD *)(v4 + 32))
  {
    brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1232);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_3();

    v4 = *(_QWORD *)(a1 + 32);
  }
  if ((*(_DWORD *)(v4 + 88) | 4) != 4)
  {
    brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1236);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_2();

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 92) = 0;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 93) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 94) = 1;
    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v4, "setReceiver:", 0);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) != 4)
  {
    v7 = objc_alloc_init(BRNotificationReceiver);
    -[BRNotificationReceiver setDelegate:](v7, "setDelegate:", *(_QWORD *)(a1 + 32));
    v8 = *(_DWORD **)(a1 + 32);
    if (v8[71])
    {
      -[BRNotificationReceiver suspend](v7, "suspend");
      v8 = *(_DWORD **)(a1 + 32);
    }
    objc_msgSend(v8, "setReceiver:", v7);
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 88))
    {
      brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidInvalidate:]_block_invoke", 1261);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "_setQueryState:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 88));
      objc_msgSend(*(id *)(a1 + 32), "_watchScopes");
    }

  }
  __brc_leave_section((uint64_t)v14);
}

- (void)notificationsReceiverDidFinishGathering:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD v8[3];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRQuery notificationsReceiverDidFinishGathering:]", 1270, v8);
  brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidFinishGathering:]", 1270);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v10 = v8[0];
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received gathering done for %@%@", buf, 0x20u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__BRQuery_notificationsReceiverDidFinishGathering___block_invoke;
  v7[3] = &unk_1E3DA72D8;
  v7[4] = self;
  objc_msgSend(v4, "dequeue:block:", -1, v7);
  __brc_leave_section((uint64_t)v8);

}

void __51__BRQuery_notificationsReceiverDidFinishGathering___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__BRQuery_notificationsReceiverDidFinishGathering___block_invoke_2;
  v6[3] = &unk_1E3DA4A70;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_performBlockAsync:", v6);

}

uint64_t __51__BRQuery_notificationsReceiverDidFinishGathering___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 92) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_processChanges:", *(_QWORD *)(a1 + 40));
}

- (void)notificationsReceiverDidReceiveNotificationsBatch:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD v8[3];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRQuery notificationsReceiverDidReceiveNotificationsBatch:]", 1281, v8);
  brc_bread_crumbs((uint64_t)"-[BRQuery notificationsReceiverDidReceiveNotificationsBatch:]", 1281);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v10 = v8[0];
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received notifications for %@%@", buf, 0x20u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__BRQuery_notificationsReceiverDidReceiveNotificationsBatch___block_invoke;
  v7[3] = &unk_1E3DA72D8;
  v7[4] = self;
  objc_msgSend(v4, "dequeue:block:", -1, v7);
  __brc_leave_section((uint64_t)v8);

}

void __61__BRQuery_notificationsReceiverDidReceiveNotificationsBatch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__BRQuery_notificationsReceiverDidReceiveNotificationsBatch___block_invoke_2;
  v6[3] = &unk_1E3DA4A70;
  v6[4] = v4;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "_performBlockAsync:", v6);

}

uint64_t __61__BRQuery_notificationsReceiverDidReceiveNotificationsBatch___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processChanges:", *(_QWORD *)(a1 + 40));
}

- (void)notificationReceiverDidReceiveNotifications:(id)a3
{
  _QWORD v3[5];

  if (self->_sendHasUpdateNotification)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __55__BRQuery_notificationReceiverDidReceiveNotifications___block_invoke;
    v3[3] = &unk_1E3DA4738;
    v3[4] = self;
    -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v3);
  }
}

uint64_t __55__BRQuery_notificationReceiverDidReceiveNotifications___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendHasUpdateNotificationIfNeeded");
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  _QWORD v10[3];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_progressQueue);
  memset(v10, 0, sizeof(v10));
  __brc_create_section(0, (uint64_t)"-[BRQuery networkReachabilityChanged:]", 1304, v10);
  brc_bread_crumbs((uint64_t)"-[BRQuery networkReachabilityChanged:]", 1304);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = "not reachable";
    *(_DWORD *)buf = 134218498;
    if (v3)
      v8 = "reachable";
    v12 = v10[0];
    v13 = 2080;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx network is %s%@", buf, 0x20u);
  }

  v7 = MEMORY[0x1E0C809B0];
  self->_isNetworkOffline = !v3;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __38__BRQuery_networkReachabilityChanged___block_invoke;
  v9[3] = &unk_1E3DA4738;
  v9[4] = self;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v9);
  __brc_leave_section((uint64_t)v10);
}

void __38__BRQuery_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 344);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__BRQuery_networkReachabilityChanged___block_invoke_2;
  block[3] = &unk_1E3DA4738;
  block[4] = v1;
  dispatch_sync(v2, block);
}

void __38__BRQuery_networkReachabilityChanged___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 304), "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 304);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v7, (_QWORD)v9);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setIsNetworkOffline:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 312));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "addObject:", v7);

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }

    br_pacer_signal(*(void **)(*(_QWORD *)(a1 + 32) + 336));
  }
}

- (void)_monitorTransferForFPItemIfNecessary:(id)a3
{
  id v4;
  NSMutableDictionary *progressObserverByFPItemID;
  void *v6;
  BRFPItemProgressObserver *v7;
  NSMutableDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_progressQueue);
  if ((objc_msgSend(v4, "isUploading") & 1) != 0 || objc_msgSend(v4, "isDownloading"))
  {
    progressObserverByFPItemID = self->_progressObserverByFPItemID;
    objc_msgSend(v4, "itemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](progressObserverByFPItemID, "objectForKeyedSubscript:", v6);
    v7 = (BRFPItemProgressObserver *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[BRFPItemProgressObserver updateWithFPItem:](v7, "updateWithFPItem:", v4);
    }
    else
    {
      v7 = -[BRFPItemProgressObserver initWithFPItem:queue:]([BRFPItemProgressObserver alloc], "initWithFPItem:queue:", v4, self->_progressQueue);
      objc_initWeak(&location, self);
      v10 = MEMORY[0x1E0C809B0];
      v11 = 3221225472;
      v12 = __48__BRQuery__monitorTransferForFPItemIfNecessary___block_invoke;
      v13 = &unk_1E3DA7300;
      objc_copyWeak(&v14, &location);
      -[BRFPItemProgressObserver setProgressHandler:](v7, "setProgressHandler:", &v10);
      v8 = self->_progressObserverByFPItemID;
      objc_msgSend(v4, "itemID", v10, v11, v12, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

      -[BRFPItemProgressObserver start](v7, "start");
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    objc_msgSend(v4, "itemID");
    v7 = (BRFPItemProgressObserver *)objc_claimAutoreleasedReturnValue();
    -[BRQuery _stopMonitoringTransferForFPItemID:](self, "_stopMonitoringTransferForFPItemID:", v7);
  }

}

void __48__BRQuery__monitorTransferForFPItemIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  void **WeakRetained;
  void **v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[41];
    objc_msgSend(v7, "fpItemID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    br_pacer_signal(v4[42]);
  }

}

- (void)_monitorNetworkForQueryItemIfNecessary:(id)a3 fpItemID:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "isInTransfer"))
  {
    objc_msgSend(v6, "setIsNetworkOffline:", self->_isNetworkOffline);

    -[NSMutableSet addObject:](self->_fpItemIDsInTransfer, "addObject:", v7);
  }
  else
  {
    objc_msgSend(v6, "setIsNetworkOffline:", 0);

    -[NSMutableSet removeObject:](self->_fpItemIDsInTransfer, "removeObject:", v7);
  }

}

- (void)_stopMonitoringTransferForFPItemID:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_progressQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_progressObserverByFPItemID, "objectForKeyedSubscript:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "stop");
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_progressObserverByFPItemID, "setObject:forKeyedSubscript:", 0, v6);
  }
  -[NSMutableSet removeObject:](self->_fpItemIDsWithProgressUpdates, "removeObject:", v6);

}

- (void)_stopProgressObservers
{
  NSObject *progressQueue;
  _QWORD block[5];

  if (BRIsFPFSEnabled(self, a2))
  {
    progressQueue = self->_progressQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__BRQuery__stopProgressObservers__block_invoke;
    block[3] = &unk_1E3DA4738;
    block[4] = self;
    dispatch_sync(progressQueue, block);
  }
}

uint64_t __33__BRQuery__stopProgressObservers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "stop");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "removeAllObjects");
}

- (void)_processProgressUpdateBatch
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __38__BRQuery__processProgressUpdateBatch__block_invoke;
  v2[3] = &unk_1E3DA4738;
  v2[4] = self;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v2);
}

void __38__BRQuery__processProgressUpdateBatch__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  id WeakRetained;
  id v11;
  void *v12;
  id v13;
  _DWORD *v14;
  int v15;
  id v16;
  _QWORD v17[5];
  _QWORD block[5];
  id v19;
  id v20;
  id v21;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(NSObject **)(v5 + 344);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__BRQuery__processProgressUpdateBatch__block_invoke_2;
  block[3] = &unk_1E3DA59A0;
  block[4] = v5;
  v16 = v2;
  v19 = v16;
  v8 = v3;
  v20 = v8;
  v9 = v4;
  v21 = v9;
  dispatch_sync(v7, block);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_postNote:", CFSTR("__kMDQueryWillChangeNotification"));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(WeakRetained, "willChange:valuesAtIndexes:forKey:", 4, v16, CFSTR("results"));

    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "_replacementObjectsForArrayOfQueryItem:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB2E70]);

    v17[0] = v6;
    v17[1] = 3221225472;
    v17[2] = __38__BRQuery__processProgressUpdateBatch__block_invoke_123;
    v17[3] = &unk_1E3DA7328;
    v17[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v17);
    v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    objc_msgSend(v13, "didChange:valuesAtIndexes:forKey:", 4, v16, CFSTR("results"));

    v14 = *(_DWORD **)(a1 + 32);
    v15 = v14[22];
    if (v15 == 2)
    {
      objc_msgSend(v14, "_postNote:", CFSTR("kMDQueryProgressNotification"));
    }
    else if (v15 == 3)
    {
      objc_msgSend(v14, "_postNote:userInfo:", CFSTR("kMDQueryDidUpdateNotification"), v11);
    }

  }
}

uint64_t __38__BRQuery__processProgressUpdateBatch__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 328);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v26;
    *(_QWORD *)&v4 = 138412546;
    v24 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v8, v24, (_QWORD)v25);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 296), "objectForKeyedSubscript:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v9)
          v12 = v10 == 0;
        else
          v12 = 1;
        if (v12
          || (v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "indexOfObjectIdenticalTo:", v9),
              v13 == 0x7FFFFFFFFFFFFFFFLL))
        {
          brc_bread_crumbs((uint64_t)"-[BRQuery _processProgressUpdateBatch]_block_invoke_2", 1423);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v30 = v8;
            v31 = 2112;
            v32 = v14;
            _os_log_impl(&dword_19CBF0000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Result not found for progress update %@%@", buf, 0x16u);
          }

        }
        else
        {
          v16 = v13;
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
          objc_msgSend(v11, "downloadPercentCompleted");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v11, "downloadPercentCompleted");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("kICDDownloadPercent"));

          }
          objc_msgSend(v11, "uploadPercentCompleted");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v11, "uploadPercentCompleted");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v20, CFSTR("kICDUploadPercent"));

          }
          objc_msgSend(*(id *)(a1 + 40), "addIndex:", v16);
          v21 = *(void **)(a1 + 48);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKey:", v14, v22);

          objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v5);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 328), "removeAllObjects");
}

void __38__BRQuery__processProgressUpdateBatch__block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a3;
  objc_msgSend(v4, "objectAtIndex:", objc_msgSend(a2, "unsignedLongValue"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("kICDDownloadPercent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAttribute:forKey:", v6, CFSTR("dl%"));

  objc_msgSend(v5, "valueForKey:", CFSTR("kICDUploadPercent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setAttribute:forKey:", v7, CFSTR("ul%"));
}

- (id)_classifyItems:(id)a3 deletedItemIDs:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  _BOOL4 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSPredicate *predicate;
  BRQueryItem *v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v45;
  void *v46;
  id v47;
  id v48;
  _BOOL4 v49;
  uint64_t v50;
  id obj;
  id obja;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[3];
  _QWORD v63[3];
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  _BYTE v67[14];
  __int16 v68;
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  obj = a3;
  v6 = a4;
  v48 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  v46 = v7;
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v59;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v59 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * v11);
        -[NSMutableDictionary objectForKey:](self->_fpItemIDToResultItem, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_results, "indexOfObjectIdenticalTo:", v13);
          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            brc_bread_crumbs((uint64_t)"-[BRQuery _classifyItems:deletedItemIDs:]", 1476);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log(0);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v65 = v16;
              _os_log_fault_impl(&dword_19CBF0000, v17, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: resultIndex != NSNotFound%@", buf, 0xCu);
            }

            v7 = v46;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setObject:forKey:", v12, v15);

        }
        ++v11;
      }
      while (v9 != v11);
      v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      v9 = v18;
    }
    while (v18);
  }

  v19 = !-[NSArray containsObject:](self->_searchScopes, "containsObject:", *MEMORY[0x1E0CB2E58])
     && -[NSArray containsObject:](self->_searchScopes, "containsObject:", *MEMORY[0x1E0CB2E60]);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obja = obj;
  v20 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
  if (v20)
  {
    v22 = v20;
    v23 = *(_QWORD *)v55;
    *(_QWORD *)&v21 = 138412290;
    v45 = v21;
    v49 = v19;
    do
    {
      v24 = 0;
      v50 = v22;
      do
      {
        if (*(_QWORD *)v55 != v23)
          objc_enumerationMutation(obja);
        v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v24);
        if (v19 && objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v24), "br_isDocumentsFolder"))
        {
          brc_bread_crumbs((uint64_t)"-[BRQuery _classifyItems:deletedItemIDs:]", 1486);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v65 = v25;
            v66 = 2112;
            *(_QWORD *)v67 = v26;
            _os_log_debug_impl(&dword_19CBF0000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring Documents Folder %@ from NSMDQ results%@", buf, 0x16u);
          }
        }
        else
        {
          objc_msgSend(v25, "itemID", v45);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          predicate = self->_predicate;
          v29 = -[BRQueryItem initWithFPItem:]([BRQueryItem alloc], "initWithFPItem:", v25);
          v30 = -[NSPredicate evaluateWithObject:](predicate, "evaluateWithObject:", v29);

          -[NSMutableDictionary objectForKey:](self->_fpItemIDToResultItem, "objectForKey:", v26);
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            v31 = v23;
            v32 = -[NSMutableArray indexOfObjectIdenticalTo:](self->_results, "indexOfObjectIdenticalTo:", v27);
            if (v32 == 0x7FFFFFFFFFFFFFFFLL)
            {
              brc_bread_crumbs((uint64_t)"-[BRQuery _classifyItems:deletedItemIDs:]", 1496);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(0);
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = v45;
                v65 = v35;
                _os_log_fault_impl(&dword_19CBF0000, v36, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: resultIndex != NSNotFound%@", buf, 0xCu);
              }

              v19 = v49;
              if (!v30)
                goto LABEL_37;
LABEL_30:
              objc_msgSend(v25, "fileURL");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v33)
                goto LABEL_37;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setObject:forKey:", v25, v34);

            }
            else
            {
              if (v30)
                goto LABEL_30;
LABEL_37:
              brc_bread_crumbs((uint64_t)"-[BRQuery _classifyItems:deletedItemIDs:]", 1498);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(1);
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v25, "fileURL");
                v41 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413058;
                v65 = v25;
                v66 = 1024;
                *(_DWORD *)v67 = v30;
                *(_WORD *)&v67[4] = 2112;
                *(_QWORD *)&v67[6] = v41;
                v42 = (void *)v41;
                v68 = 2112;
                v69 = v37;
                _os_log_debug_impl(&dword_19CBF0000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing %@ from the set -- itemSatisfiesPredicate = %d, url = %@%@", buf, 0x26u);

              }
              objc_msgSend(v25, "itemID");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setObject:forKey:", v39, v40);

              v19 = v49;
            }
            v23 = v31;
            v22 = v50;
            goto LABEL_41;
          }
          if (v30)
            objc_msgSend(v47, "addObject:", v25);
        }
LABEL_41:

        ++v24;
      }
      while (v22 != v24);
      v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    }
    while (v22);
  }

  v62[0] = CFSTR("kICDQueryAddedItems");
  v62[1] = CFSTR("kICDQueryRemovedItems");
  v63[0] = v47;
  v63[1] = v53;
  v62[2] = CFSTR("kICDQueryReplacedItems");
  v63[2] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (void)_handleAddedItemsNotifications:(id)a3 userInfo:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  void *v11;
  NSObject *progressQueue;
  id v13;
  void *v14;
  id v15;
  uint64_t block;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  BRQuery *v22;

  v15 = a3;
  v6 = a4;
  if (objc_msgSend(v15, "count"))
  {
    v7 = -[NSMutableArray count](self->_results, "count");
    v8 = objc_msgSend(v15, "count");
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", v7, v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_query);
    objc_msgSend(WeakRetained, "willChange:valuesAtIndexes:forKey:", 2, v9, CFSTR("results"));
    if (v6)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    else
      v11 = 0;
    progressQueue = self->_progressQueue;
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __51__BRQuery__handleAddedItemsNotifications_userInfo___block_invoke;
    v19 = &unk_1E3DA4A48;
    v20 = v15;
    v13 = v11;
    v21 = v13;
    v22 = self;
    dispatch_sync(progressQueue, &block);
    if (v6)
    {
      -[BRQuery _replacementObjectsForArrayOfQueryItem:](self, "_replacementObjectsForArrayOfQueryItem:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB2E68]);

    }
    objc_msgSend(WeakRetained, "didChange:valuesAtIndexes:forKey:", 2, v9, CFSTR("results"), v15, block, v17, v18, v19);

  }
}

void __51__BRQuery__handleAddedItemsNotifications_userInfo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__BRQuery__handleAddedItemsNotifications_userInfo___block_invoke_2;
  v5[3] = &unk_1E3DA7350;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

}

void __51__BRQuery__handleAddedItemsNotifications_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  BRQueryItem *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = -[BRQueryItem initWithFPItem:]([BRQueryItem alloc], "initWithFPItem:", v9);
  v4 = *(void **)(a1 + 32);
  if (v4)
    objc_msgSend(v4, "addObject:", v3);
  objc_msgSend(*(id *)(a1 + 40), "_monitorTransferForFPItemIfNecessary:", v9);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v9, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_monitorNetworkForQueryItemIfNecessary:fpItemID:", v3, v6);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v3);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  objc_msgSend(v9, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v3, v8);

}

- (void)_handleReplacedItemsNotifications:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id WeakRetained;
  void *v11;
  NSObject *progressQueue;
  id v13;
  void *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  BRQuery *v19;
  _QWORD v20[4];
  id v21;

  v15 = a3;
  v6 = a4;
  if (objc_msgSend(v15, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke;
    v20[3] = &unk_1E3DA7378;
    v9 = v7;
    v21 = v9;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
    WeakRetained = objc_loadWeakRetained((id *)&self->_query);
    objc_msgSend(WeakRetained, "willChange:valuesAtIndexes:forKey:", 4, v9, CFSTR("results"));
    if (v6)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    else
      v11 = 0;
    progressQueue = self->_progressQueue;
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_2;
    block[3] = &unk_1E3DA4A48;
    v17 = v15;
    v13 = v11;
    v18 = v13;
    v19 = self;
    dispatch_sync(progressQueue, block);
    if (v6)
    {
      -[BRQuery _replacementObjectsForArrayOfQueryItem:](self, "_replacementObjectsForArrayOfQueryItem:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB2E70]);

    }
    objc_msgSend(WeakRetained, "didChange:valuesAtIndexes:forKey:", 4, v9, CFSTR("results"));

  }
}

uint64_t __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(a2, "unsignedLongValue"));
}

void __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_3;
  v5[3] = &unk_1E3DA73A0;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;
  BRQueryItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    v7 = objc_msgSend(v5, "unsignedLongValue");
    if (v7 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "count"))
    {
      brc_bread_crumbs((uint64_t)"-[BRQuery _handleReplacedItemsNotifications:userInfo:]_block_invoke_3", 1566);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_3_cold_1();

    }
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectAtIndex:", objc_msgSend(v5, "unsignedLongValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
  v10 = -[BRQueryItem initWithFPItem:]([BRQueryItem alloc], "initWithFPItem:", v6);
  objc_msgSend(*(id *)(a1 + 40), "_monitorTransferForFPItemIfNecessary:", v6);
  v11 = *(void **)(a1 + 40);
  objc_msgSend(v6, "itemID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_monitorNetworkForQueryItemIfNecessary:fpItemID:", v10, v12);

  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  objc_msgSend(v6, "itemID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "merge:allowMergingFileObjectIDIfPossible:", v10, 1);
}

- (void)_handleRemovedItemsNotifications:(id)a3 userInfo:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  NSObject *progressQueue;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD block[4];
  id v18;
  id v19;
  BRQuery *v20;
  id v21;

  v15 = a3;
  v6 = a4;
  if (objc_msgSend(v15, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_query);
    v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    if (v6)
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    else
      v9 = 0;
    progressQueue = self->_progressQueue;
    v11 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke;
    block[3] = &unk_1E3DA59A0;
    v18 = v15;
    v12 = v9;
    v19 = v12;
    v20 = self;
    v13 = v8;
    v21 = v13;
    dispatch_sync(progressQueue, block);
    objc_msgSend(WeakRetained, "willChange:valuesAtIndexes:forKey:", 3, v13, CFSTR("results"));
    if (v6)
    {
      -[BRQuery _replacementObjectsForArrayOfQueryItem:](self, "_replacementObjectsForArrayOfQueryItem:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB2E78]);

    }
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3;
    v16[3] = &unk_1E3DA72B0;
    v16[4] = self;
    objc_msgSend(v13, "enumerateIndexesWithOptions:usingBlock:", 2, v16, v15);
    -[NSMutableArray removeObjectsAtIndexes:](self->_results, "removeObjectsAtIndexes:", v13);
    objc_msgSend(WeakRetained, "didChange:valuesAtIndexes:forKey:", 3, v13, CFSTR("results"));

  }
}

void __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_2;
  v6[3] = &unk_1E3DA73C8;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectAtIndex:", objc_msgSend(v8, "unsignedLongValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v8, "unsignedLongValue"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", v5);
  objc_msgSend(*(id *)(a1 + 40), "_stopMonitoringTransferForFPItemID:", v5);

}

void __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count") <= a2)
  {
    brc_bread_crumbs((uint64_t)"-[BRQuery _handleRemovedItemsNotifications:userInfo:]_block_invoke_3", 1610);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3_cold_1();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 192))(0, objc_msgSend(v4, "replacement"));
  objc_msgSend(v4, "setReplacement:", 0);

}

- (void)itemCollectionGathererFinishedGathering
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__BRQuery_itemCollectionGathererFinishedGathering__block_invoke;
  v2[3] = &unk_1E3DA4738;
  v2[4] = self;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v2);
}

void __50__BRQuery_itemCollectionGathererFinishedGathering__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;

  brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererFinishedGathering]_block_invoke", 1622);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __50__BRQuery_itemCollectionGathererFinishedGathering__block_invoke_cold_1();

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v4 + 88) != 3)
  {
    *(_BYTE *)(v4 + 92) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_setQueryState:", 3);
    objc_msgSend(*(id *)(a1 + 32), "_postNote:", CFSTR("kMDQueryDidFinishNotification"));
  }
}

- (void)itemCollectionGathererGatheredItems:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__BRQuery_itemCollectionGathererGatheredItems___block_invoke;
  v6[3] = &unk_1E3DA4A70;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v6);

}

void __47__BRQuery_itemCollectionGathererGatheredItems___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _DWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD *v9;
  int v10;

  brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererGatheredItems:]_block_invoke", 1634);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __47__BRQuery_itemCollectionGathererGatheredItems___block_invoke_cold_1();

  v4 = *(_DWORD **)(a1 + 32);
  if (v4[22] == 1)
  {
    objc_msgSend(v4, "_setQueryState:", 2);
    v4 = *(_DWORD **)(a1 + 32);
  }
  objc_msgSend(v4, "_postNote:", CFSTR("__kMDQueryWillChangeNotification"));
  objc_msgSend(*(id *)(a1 + 32), "_classifyItems:deletedItemIDs:", *(_QWORD *)(a1 + 40), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kICDQueryReplacedItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kICDQueryAddedItems"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") || objc_msgSend(v6, "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_handleAddedItemsNotifications:userInfo:", v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "_handleReplacedItemsNotifications:userInfo:", v6, v8);
    v9 = *(_DWORD **)(a1 + 32);
    v10 = v9[22];
    if (v10 == 2)
    {
      objc_msgSend(v9, "_postNote:", CFSTR("kMDQueryProgressNotification"));
    }
    else if (v10 == 3)
    {
      objc_msgSend(v9, "_postNote:userInfo:", CFSTR("kMDQueryDidUpdateNotification"), v8);
    }

  }
}

- (void)itemCollectionGathererDidReceiveUpdates:(id)a3 deleteItemsWithIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke;
  v10[3] = &unk_1E3DA4A48;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v10);

}

void __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke(uint64_t a1)
{
  _DWORD *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD *v12;
  int v13;

  v2 = *(_DWORD **)(a1 + 32);
  if (v2[22] == 1)
  {
    objc_msgSend(v2, "_setQueryState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_postNote:", CFSTR("__kMDQueryWillChangeNotification"));
  }
  brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidReceiveUpdates:deleteItemsWithIDs:]_block_invoke", 1671);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke_cold_2(a1, (uint64_t)v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "_classifyItems:deletedItemIDs:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidReceiveUpdates:deleteItemsWithIDs:]_block_invoke", 1683);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke_cold_1((uint64_t)v5);

  objc_msgSend(v5, "objectForKey:", CFSTR("kICDQueryReplacedItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kICDQueryRemovedItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kICDQueryAddedItems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count") || objc_msgSend(v10, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_postNote:", CFSTR("__kMDQueryWillChangeNotification"));
    objc_msgSend(*(id *)(a1 + 32), "_handleAddedItemsNotifications:userInfo:", v10, v11);
    objc_msgSend(*(id *)(a1 + 32), "_handleReplacedItemsNotifications:userInfo:", v8, v11);
    objc_msgSend(*(id *)(a1 + 32), "_handleRemovedItemsNotifications:userInfo:", v9, v11);
    v12 = *(_DWORD **)(a1 + 32);
    v13 = v12[22];
    if (v13 == 2)
    {
      objc_msgSend(v12, "_postNote:", CFSTR("kMDQueryProgressNotification"));
    }
    else if (v13 == 3)
    {
      objc_msgSend(v12, "_postNote:userInfo:", CFSTR("kMDQueryDidUpdateNotification"), v11);
    }
  }

}

- (void)itemCollectionGathererDidInvalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke;
  v2[3] = &unk_1E3DA4738;
  v2[4] = self;
  -[BRQuery _performBlockAsync:](self, "_performBlockAsync:", v2);
}

void __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _DWORD *v17;
  int v18;
  BRItemCollectionGatherer *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[5];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidInvalidate]_block_invoke", 1716);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_cold_2();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, v5);
  objc_msgSend(WeakRetained, "willChange:valuesAtIndexes:forKey:", 3, v6, CFSTR("results"));
  v25 = *MEMORY[0x1E0CB2E78];
  v7 = *(id **)(a1 + 32);
  objc_msgSend(v7[3], "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_replacementObjectsForArrayOfQueryItem:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_129;
  v24[3] = &unk_1E3DA72B0;
  v24[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "enumerateIndexesWithOptions:usingBlock:", 2, v24);
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 64);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 8);
  *(_QWORD *)(v12 + 8) = v11;

  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 64);
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 24);
  *(_QWORD *)(v15 + 24) = v14;

  objc_msgSend(WeakRetained, "didChange:valuesAtIndexes:forKey:", 3, v6, CFSTR("results"));
  v17 = *(_DWORD **)(a1 + 32);
  v18 = v17[22];
  switch(v18)
  {
    case 2:
      objc_msgSend(v17, "_postNote:", CFSTR("kMDQueryProgressNotification"));
      break;
    case 4:
      goto LABEL_12;
    case 3:
      objc_msgSend(v17, "_postNote:userInfo:", CFSTR("kMDQueryDidUpdateNotification"), v10);
      break;
  }
  v19 = -[BRItemCollectionGatherer initWithDelegate:query:]([BRItemCollectionGatherer alloc], "initWithDelegate:query:", *(_QWORD *)(a1 + 32), WeakRetained);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 288);
  *(_QWORD *)(v20 + 288) = v19;

  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 88))
  {
    brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidInvalidate]_block_invoke", 1745);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_setQueryState:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 88));
    objc_msgSend(*(id *)(a1 + 32), "_watchScopes");
  }
LABEL_12:

}

void __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_129(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  NSObject *v6;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count") <= a2)
  {
    brc_bread_crumbs((uint64_t)"-[BRQuery itemCollectionGathererDidInvalidate]_block_invoke", 1723);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3_cold_1();

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 192))(0, objc_msgSend(v4, "replacement"));
  objc_msgSend(v4, "setReplacement:", 0);

}

- (void)_applicationWillResignActive:(id)a3
{
  id v4;
  unsigned int queryState;
  BOOL v6;
  int v7;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  BRItemCollectionGatherer *collectionGatherer;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  queryState = self->_queryState;
  v6 = queryState > 4;
  v7 = (1 << queryState) & 0x13;
  if (v6 || v7 == 0)
  {
    objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskInterruptable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0D87C98]);
    v20[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithExplanation:target:attributes:", CFSTR("NSMDQ resigning"), v9, v12);

    objc_msgSend(v13, "acquireWithInvalidationHandler:", &__block_literal_global_140_0);
    brc_bread_crumbs((uint64_t)"-[BRQuery _applicationWillResignActive:]", 1765);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[BRQuery _applicationWillResignActive:].cold.1((uint64_t)self);

    collectionGatherer = self->_collectionGatherer;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __40__BRQuery__applicationWillResignActive___block_invoke_141;
    v18[3] = &unk_1E3DA4738;
    v19 = v13;
    v17 = v13;
    -[BRItemCollectionGatherer pauseWatchingWithCompletionBlock:](collectionGatherer, "pauseWatchingWithCompletionBlock:", v18);

  }
}

void __40__BRQuery__applicationWillResignActive___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a3;
  brc_bread_crumbs((uint64_t)"-[BRQuery _applicationWillResignActive:]_block_invoke", 1762);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __40__BRQuery__applicationWillResignActive___block_invoke_cold_1((uint64_t)v3);

}

uint64_t __40__BRQuery__applicationWillResignActive___block_invoke_141(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs((uint64_t)"-[BRQuery _applicationWillResignActive:]_block_invoke", 1767);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __40__BRQuery__applicationWillResignActive___block_invoke_141_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)_applicationDidBecomeActive:(id)a3
{
  void *v4;
  NSObject *v5;

  brc_bread_crumbs((uint64_t)"-[BRQuery _applicationDidBecomeActive:]", 1776);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BRQuery _applicationDidBecomeActive:].cold.1((uint64_t)self);

  -[BRItemCollectionGatherer resumeWatching](self->_collectionGatherer, "resumeWatching");
}

- (NSMetadataQuery)query
{
  return (NSMetadataQuery *)objc_loadWeakRetained((id *)&self->_query);
}

- (void)setQuery:(id)a3
{
  objc_storeWeak((id *)&self->_query, a3);
}

- (BRNotificationReceiver)receiver
{
  return (BRNotificationReceiver *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReceiver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressQueue, 0);
  objc_storeStrong((id *)&self->_progressUpdatePacer, 0);
  objc_storeStrong((id *)&self->_fpItemIDsWithProgressUpdates, 0);
  objc_storeStrong(&self->_networkReachabilityToken, 0);
  objc_storeStrong((id *)&self->_fpItemIDsInTransfer, 0);
  objc_storeStrong((id *)&self->_progressObserverByFPItemID, 0);
  objc_storeStrong((id *)&self->_collectionGatherer, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_storeStrong((id *)&self->_searchScopes, 0);
  objc_storeStrong((id *)&self->_sortingAttributes, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_toBeInsertedByFileObjectID, 0);
  objc_storeStrong((id *)&self->_toBeReplacedByFileObjectID, 0);
  objc_storeStrong((id *)&self->_toBeRemovedByFileObjectID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_destroyWeak((id *)&self->_query);
  objc_storeStrong((id *)&self->_receiver, 0);
  objc_storeStrong((id *)&self->_fpItemIDToResultItem, 0);
  objc_storeStrong((id *)&self->_resultsByRowID, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

- (void)_setQueryState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: gBRActiveQueriesSet.count == gBRActiveQueries%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __25__BRQuery_disableUpdates__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@: suspending receiver%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __25__BRQuery_disableUpdates__block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@: disabling gatherer updates%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __24__BRQuery_enableUpdates__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@: resuming receiver%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __24__BRQuery_enableUpdates__block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  OUTLINED_FUNCTION_9_0(*MEMORY[0x1E0C80C00]);
  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@: enabling gatherer updates%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_performBlockAsync:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] API MISUSE: NSMetadataQuery CLIENT BUG: do not access the results before calling -startQuery%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performBlockAsync:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_19CBF0000, v0, (os_log_type_t)0x90u, "[ERROR] NSMetadataQuery CLIENT BUG: do not access the results before calling -startQuery%@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __30__BRQuery__performBlockAsync___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] Collection Gatherer has been invalidated, skip performing the block%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)executeWithOptions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: _results == nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setQueryQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] API MISUSE: running a NSMetadataQuery with maxConcurrentOperationCount != 1 is not supported%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_postNote:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] posting %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_collectUpdates:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 80);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] _toBeInserted = %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_collectUpdates:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 64);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] _toBeRemoved = %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

- (void)_collectUpdates:(uint64_t)a1 .cold.3(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 72);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] _toBeReplaced = %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __26__BRQuery__processUpdates__block_invoke_cold_1()
{
  __assert_rtn("-[BRQuery _processUpdates]_block_invoke", "BRQuery.m", 1110, "idx < self->_results.count");
}

- (void)_processChanges:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] the query is stopped, not processing changes%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processChanges:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] no update to collect%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] Restarting the receiver%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] setup the query to restart with Crash Marking on%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__BRQuery_notificationsReceiverDidInvalidate___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: receiver == self->_receiver%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __54__BRQuery__handleReplacedItemsNotifications_userInfo___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: [idx unsignedLongValue] < _results.count%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__BRQuery__handleRemovedItemsNotifications_userInfo___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: idx < self->_results.count%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__BRQuery_itemCollectionGathererFinishedGathering__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] BRQuery::finishedGathering%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __47__BRQuery_itemCollectionGathererGatheredItems___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] BRQuery::itemCollectionGathererGatheredItems - START%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] BRQuery classificationResultDict = %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __70__BRQuery_itemCollectionGathererDidReceiveUpdates_deleteItemsWithIDs___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_19CBF0000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] BRQuery updateHandler\n items = %@ \n deleted = %@%@", (uint8_t *)&v5, 0x20u);
}

void __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] Rewatch the scopes%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __46__BRQuery_itemCollectionGathererDidInvalidate__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] BRQuery::itemCollectionGathererDidInvalidate - Clearning the results away%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_applicationWillResignActive:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - BRQuery::_applicationWillResignActive%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __40__BRQuery__applicationWillResignActive___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] NSMDQ resignation expired with error %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

void __40__BRQuery__applicationWillResignActive___block_invoke_141_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3(&dword_19CBF0000, v0, v1, "[DEBUG] About to invalidate the assertion%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_applicationDidBecomeActive:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v1, v2, "[DEBUG] %@ - BRQuery::_applicationDidBecomeActive%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
