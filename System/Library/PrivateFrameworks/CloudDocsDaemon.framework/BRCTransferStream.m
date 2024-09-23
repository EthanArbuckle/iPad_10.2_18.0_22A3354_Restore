@implementation BRCTransferStream

- (NSArray)operations
{
  BRCTransferStream *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary allValues](v2->_inFlightOpByID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_sync_exit(v2);
  return (NSArray *)v4;
}

- (BRCTransferStream)initWithSyncContext:(id)a3 name:(id)a4 scheduler:(id)a5 maxCountOfBatchesInFlight:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  BRCTransferStream *v14;
  BRCTransferStream *v15;
  BRCDeadlineSource *v16;
  BRCDeadlineSource *schedulingSource;
  NSMutableDictionary *v18;
  NSMutableDictionary *inFlightOpByID;
  dispatch_workloop_t v20;
  OS_dispatch_workloop *transferWorkloop;
  dispatch_group_t v22;
  OS_dispatch_group *transferBatchRequestWaiter;
  BRCDeadlineSource *v24;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  const char *v29;
  _QWORD v30[5];
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v31.receiver = self;
  v31.super_class = (Class)BRCTransferStream;
  v14 = -[BRCTransferStream init](&v31, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_syncContext, a3);
    v15->_session = (BRCAccountSession *)(id)objc_msgSend(v11, "session");
    if (!v13)
    {
      abc_report_panic_with_signature();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("scheduler is nil"));
      v26 = objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
        __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_106_cold_1(v26, (uint64_t)v27, v28);

      brc_append_system_info_to_message();
      v29 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
      __assert_rtn("-[BRCTransferStream initWithSyncContext:name:scheduler:maxCountOfBatchesInFlight:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/sync/transfers/BRCTransferStream.m", 65, v29);
    }
    v16 = -[BRCDeadlineSource initWithScheduler:name:]([BRCDeadlineSource alloc], "initWithScheduler:name:", v13, v12);
    schedulingSource = v15->_schedulingSource;
    v15->_schedulingSource = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    inFlightOpByID = v15->_inFlightOpByID;
    v15->_inFlightOpByID = v18;

    v20 = dispatch_workloop_create((const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    transferWorkloop = v15->_transferWorkloop;
    v15->_transferWorkloop = (OS_dispatch_workloop *)v20;

    v22 = dispatch_group_create();
    transferBatchRequestWaiter = v15->_transferBatchRequestWaiter;
    v15->_transferBatchRequestWaiter = (OS_dispatch_group *)v22;

    v24 = v15->_schedulingSource;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __82__BRCTransferStream_initWithSyncContext_name_scheduler_maxCountOfBatchesInFlight___block_invoke;
    v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v30[4] = v15;
    -[BRCDeadlineSource setEventHandler:](v24, "setEventHandler:", v30);
    -[BRCDeadlineSource setWorkloop:](v15->_schedulingSource, "setWorkloop:", v15->_transferWorkloop);
    v15->_maxCountOfBatchesInFlight = a6;
  }

  return v15;
}

void __82__BRCTransferStream_initWithSyncContext_name_scheduler_maxCountOfBatchesInFlight___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D17A6BE8]();
  objc_msgSend(*(id *)(a1 + 32), "_schedule");
  objc_autoreleasePoolPop(v2);
}

- (void)signalWithDeadline:(int64_t)minSignalTime
{
  if (self->_minSignalTime > minSignalTime)
    minSignalTime = self->_minSignalTime;
  -[BRCDeadlineSource signalWithDeadline:](self->_schedulingSource, "signalWithDeadline:", minSignalTime);
}

- (void)signal
{
  -[BRCTransferStream signalWithDeadline:](self, "signalWithDeadline:", self->_minSignalTime);
}

- (void)_setReachedCap:(BOOL)a3
{
  _BOOL4 v3;
  BRCDeadlineSource *schedulingSource;

  v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transferWorkloop);
  if (self->_hasReachedCap != v3)
  {
    self->_hasReachedCap = v3;
    schedulingSource = self->_schedulingSource;
    if (v3)
      -[BRCDeadlineSource suspend](schedulingSource, "suspend");
    else
      -[BRCDeadlineSource resume](schedulingSource, "resume");
  }
}

- (void)startSchedulingMultipleItemsInteractively
{
  int *p_multipleItemsInteractiveSchedulingCount;
  unsigned int v4;

  -[BRCDeadlineSource suspend](self->_schedulingSource, "suspend");
  p_multipleItemsInteractiveSchedulingCount = &self->_multipleItemsInteractiveSchedulingCount;
  do
    v4 = __ldaxr((unsigned int *)p_multipleItemsInteractiveSchedulingCount);
  while (__stlxr(v4 + 1, (unsigned int *)p_multipleItemsInteractiveSchedulingCount));
}

- (void)endSchedulingMultipleItemsInteractively
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _multipleItemsInteractiveSchedulingCount >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)forceSchedulingPendingInteractiveTransfers
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] ┏%llx force scheduling interactive transfers%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v39 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "cancel");
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v45, 16);
      }
      while (v4);
    }

    objc_msgSend(*(id *)(a1 + 32), "signal");
    return;
  }
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 80);
  v10 = 2 * v9;
  if (*(_BYTE *)(v8 + 72))
    v11 = v7 >= v10;
  else
    v11 = 1;
  if (v11)
    v12 = v7;
  else
    v12 = v7 + 1;
  if (v12 >= v9)
  {
    v32 = 2 * v9;
    v33 = v7;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(v8 + 40), "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
          if ((objc_msgSend(v16, "isCancelled") & 1) == 0 && (objc_msgSend(v16, "isFinished") & 1) == 0)
          {
            if (!v16
              || (objc_msgSend(v19, "startDate"),
                  v20 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v16, "startDate"),
                  v21 = (void *)objc_claimAutoreleasedReturnValue(),
                  v22 = objc_msgSend(v20, "compare:", v21),
                  v21,
                  v20,
                  v22 == -1))
            {
              v23 = v19;

              v16 = v23;
            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    brc_bread_crumbs();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_4((uint64_t)v16);

    if (!v16)
    {
      brc_bread_crumbs();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_3();

    }
    objc_msgSend(v16, "cancel");

    v10 = v32;
    v7 = v33;
  }
  if (v7 >= v10)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v26;
      _os_log_impl(&dword_1CBD43000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] We have way too many operations in flight.  Waiting for cancelled operations to finish cancelling%@", buf, 0xCu);
    }
    goto LABEL_41;
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72))
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_2();
LABEL_41:

    return;
  }
  brc_bread_crumbs();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_scheduleOneBatchWithQoS:", 25);
}

- (void)_evaluateCap
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transferWorkloop);
  if (-[NSMutableDictionary count](self->_inFlightOpByID, "count") >= self->_maxCountOfBatchesInFlight)
  {
    -[BRCTransferStream _setReachedCap:](self, "_setReachedCap:", 1);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMutableDictionary objectEnumerator](self->_inFlightOpByID, "objectEnumerator", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          v9 = self->_maxCountOfBatchesInFlight * objc_msgSend(v8, "doneSize");
          if (v9 < objc_msgSend(v8, "totalSize"))
          {
            -[BRCTransferStream _setReachedCap:](self, "_setReachedCap:", 1);

            return;
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }

    -[BRCTransferStream _setReachedCap:](self, "_setReachedCap:", 0);
  }
}

- (void)_addBatchOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  BRCTransferStream *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  BRCTransferStream *v20;
  id v21;
  id v22;
  id v23[2];
  _QWORD v24[5];
  id v25;
  id location;

  v4 = a3;
  if (!v4)
  {
    brc_bread_crumbs();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      -[BRCTransferStream _addBatchOperation:].cold.2();

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_transferWorkloop);
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCTransferStream _addBatchOperation:].cold.1((uint64_t)v4);

  if (v4)
  {
    objc_msgSend(v4, "operationID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9 = objc_msgSend(v4, "totalSize");
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __40__BRCTransferStream__addBatchOperation___block_invoke;
    v24[3] = &unk_1E87611E0;
    objc_copyWeak(&v25, &location);
    v24[4] = self;
    objc_msgSend(v4, "setDidProgressBlock:", v24);
    v16 = v10;
    v17 = 3221225472;
    v18 = __40__BRCTransferStream__addBatchOperation___block_invoke_3;
    v19 = &unk_1E8763838;
    objc_copyWeak(v23, &location);
    v11 = v8;
    v22 = v11;
    v20 = self;
    v23[1] = (id)v9;
    v12 = v7;
    v21 = v12;
    objc_msgSend(v4, "setFinishBlock:", &v16);
    self->_inFlightSize += v9;
    v13 = self;
    objc_sync_enter(v13);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13->_inFlightOpByID, "setObject:forKeyedSubscript:", v4, v12, v16, v17, v18, v19, v20);
    objc_sync_exit(v13);

    objc_msgSend(v4, "schedule");
    -[BRCTransferStream _evaluateCap](v13, "_evaluateCap");

    objc_destroyWeak(v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
}

void __40__BRCTransferStream__addBatchOperation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ((objc_msgSend(WeakRetained, "isCancelled") & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__BRCTransferStream__addBatchOperation___block_invoke_2;
    block[3] = &unk_1E875D500;
    block[4] = v2;
    dispatch_async_and_wait(v3, block);
  }

}

uint64_t __40__BRCTransferStream__addBatchOperation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateCap");
}

void __40__BRCTransferStream__addBatchOperation___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  uint64_t v8;
  double v9;
  double v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  _QWORD block[5];
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  if (WeakRetained)
  {
    objc_msgSend(v6, "br_suggestedRetryTimeInterval");
    if (v9 > 0.0)
    {
      v10 = v9;
      v11 = WeakRetained;
      objc_sync_enter(v11);
      v12 = brc_current_date_nsec();
      v13 = brc_interval_to_nsec() + v12;
      if (v13 > (uint64_t)v11[4])
      {
        brc_bread_crumbs();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __40__BRCTransferStream__addBatchOperation___block_invoke_3_cold_1((uint64_t)v14, v15, v10);

        v11[4] = (id)v13;
      }
      objc_sync_exit(v11);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = __40__BRCTransferStream__addBatchOperation___block_invoke_5;
    block[3] = &unk_1E875E038;
    v16 = *(void **)(a1 + 40);
    v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
    block[1] = 3221225472;
    v18 = *(_QWORD *)(a1 + 64);
    block[4] = WeakRetained;
    v21 = v18;
    v20 = v16;
    dispatch_async_and_wait(v17, block);
    objc_msgSend(WeakRetained[1], "availableDiskSpaceDidChange");

  }
}

uint64_t __40__BRCTransferStream__addBatchOperation___block_invoke_5(uint64_t a1)
{
  id v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) -= *(_QWORD *)(a1 + 48);
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

  return objc_msgSend(*(id *)(a1 + 32), "_evaluateCap");
}

- (void)addBatchOperation:(id)a3
{
  id v4;
  NSObject *transferBatchRequestWaiter;
  NSObject *transferWorkloop;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (!self->_isWaitingForTransferBatch)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCTransferStream addBatchOperation:].cold.1();

  }
  transferWorkloop = self->_transferWorkloop;
  transferBatchRequestWaiter = self->_transferBatchRequestWaiter;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__BRCTransferStream_addBatchOperation___block_invoke;
  v10[3] = &unk_1E875D470;
  v10[4] = self;
  v11 = v4;
  v7 = v4;
  dispatch_group_async(transferBatchRequestWaiter, transferWorkloop, v10);

}

uint64_t __39__BRCTransferStream_addBatchOperation___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    objc_msgSend(*(id *)(a1 + 40), "cancel");
  return objc_msgSend(*(id *)(a1 + 32), "_addBatchOperation:", *(_QWORD *)(a1 + 40));
}

- (void)_scheduleOneBatchWithQoS:(int64_t)a3
{
  void *v5;
  void (**streamDidBecomeReadyToTransferRecords)(id, unint64_t, int64_t, _QWORD *);
  double v7;
  _QWORD v8[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_transferWorkloop);
  -[BRCSyncContext defaults](self->_syncContext, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCDeadlineSource suspend](self->_schedulingSource, "suspend");
  dispatch_group_enter((dispatch_group_t)self->_transferBatchRequestWaiter);
  self->_isWaitingForTransferBatch = 1;
  streamDidBecomeReadyToTransferRecords = (void (**)(id, unint64_t, int64_t, _QWORD *))self->_streamDidBecomeReadyToTransferRecords;
  objc_msgSend(v5, "transferQueueTransferBudget");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__BRCTransferStream__scheduleOneBatchWithQoS___block_invoke;
  v8[3] = &unk_1E875D500;
  v8[4] = self;
  streamDidBecomeReadyToTransferRecords[2](streamDidBecomeReadyToTransferRecords, (unint64_t)v7, a3, v8);

}

void __46__BRCTransferStream__scheduleOneBatchWithQoS___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 48);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__BRCTransferStream__scheduleOneBatchWithQoS___block_invoke_2;
  block[3] = &unk_1E875D500;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __46__BRCTransferStream__scheduleOneBatchWithQoS___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "resume");
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)_schedule
{
  -[BRCTransferStream _scheduleOneBatchWithQoS:](self, "_scheduleOneBatchWithQoS:", -1);
}

- (void)cancelTransferID:(id)a3 operationID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  OS_dispatch_workloop *transferWorkloop;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18[3];
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCTransferStream cancelTransferID:operationID:]", 306, v18);
  brc_bread_crumbs();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v13 = v18[0];
    objc_msgSend(v7, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v20 = v13;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v14;
    v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cancelling entry %@ in %@%@", buf, 0x2Au);

  }
  transferWorkloop = self->_transferWorkloop;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__BRCTransferStream_cancelTransferID_operationID___block_invoke;
  v15[3] = &unk_1E875D448;
  v15[4] = self;
  v11 = v7;
  v16 = v11;
  v12 = v6;
  v17 = v12;
  dispatch_async_with_logs_10(transferWorkloop, v15);

  __brc_leave_section(v18);
}

void __50__BRCTransferStream_cancelTransferID_operationID___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelTransferID:", a1[6]);

}

- (void)addAliasItem:(id)a3 toTransferWithID:(id)a4 operationID:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_dispatch_workloop *transferWorkloop;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  transferWorkloop = self->_transferWorkloop;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__BRCTransferStream_addAliasItem_toTransferWithID_operationID___block_invoke;
  v15[3] = &unk_1E875DD30;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async_with_logs_10(transferWorkloop, v15);

}

void __63__BRCTransferStream_addAliasItem_toTransferWithID_operationID___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAliasItem:toTransferWithID:", a1[6], a1[7]);

}

- (double)progressForTransferID:(id)a3 operationID:(id)a4
{
  id v6;
  id v7;
  BRCTransferStream *v8;
  void *v9;
  double v10;
  double v11;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary objectForKeyedSubscript:](v8->_inFlightOpByID, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v8);

  objc_msgSend(v9, "progressForTransferID:", v6);
  v11 = v10;

  return v11;
}

- (void)resume
{
  -[BRCDeadlineSource resume](self->_schedulingSource, "resume");
}

- (void)cancel
{
  OS_dispatch_workloop *transferWorkloop;
  _QWORD v4[5];

  self->_isCancelled = 1;
  -[BRCDeadlineSource cancel](self->_schedulingSource, "cancel");
  transferWorkloop = self->_transferWorkloop;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __27__BRCTransferStream_cancel__block_invoke;
  v4[3] = &unk_1E875D500;
  v4[4] = self;
  dispatch_async_with_logs_10(transferWorkloop, v4);
}

void __27__BRCTransferStream_cancel__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectEnumerator", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "cancel");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: self.isCancelled%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __26__BRCTransferStream_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRCTransferStream close].cold.1();

  }
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = 0;

}

void __26__BRCTransferStream_close__block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 73))
    objc_msgSend(*(id *)(v4 + 24), "resume");
}

- (void)suspend
{
  -[BRCDeadlineSource suspend](self->_schedulingSource, "suspend");
}

- (id)streamDidBecomeReadyToTransferRecords
{
  return self->_streamDidBecomeReadyToTransferRecords;
}

- (void)setStreamDidBecomeReadyToTransferRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (unint64_t)inFlightSize
{
  return self->_inFlightSize;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_streamDidBecomeReadyToTransferRecords, 0);
  objc_storeStrong((id *)&self->_transferBatchRequestWaiter, 0);
  objc_storeStrong((id *)&self->_transferWorkloop, 0);
  objc_storeStrong((id *)&self->_inFlightOpByID, 0);
  objc_storeStrong((id *)&self->_schedulingSource, 0);
  objc_storeStrong((id *)&self->_syncContext, 0);
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Force scheduling a new high priority batch%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] waiting for the next scheduling to finish%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: oldestBatchOperation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __63__BRCTransferStream_forceSchedulingPendingInteractiveTransfers__block_invoke_cold_4(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] cancelling oldest batch (%@)%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_addBatchOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] adding operation %@ to the transfer stream%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

- (void)_addBatchOperation:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: operation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __40__BRCTransferStream__addBatchOperation___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a3;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Transfer stream backing off %.03fs%@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)addBatchOperation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _isWaitingForTransferBatch%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
