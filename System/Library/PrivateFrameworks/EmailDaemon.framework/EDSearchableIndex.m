@implementation EDSearchableIndex

uint64_t __45__EDSearchableIndex__dataSourceScheduleWork___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __81__EDSearchableIndex__dataSourceInvalidateItemsGreaterThanTransaction_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchableIndex:invalidateItemsGreaterThanTransaction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (EDSearchableIndexDataSource)dataSource
{
  return (EDSearchableIndexDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)_queueRefresh
{
  void *v3;

  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsRefresh:", 1);

  -[EDSearchableIndex _queueTransitionFromRefresh:](self, "_queueTransitionFromRefresh:", 1);
}

uint64_t __51__EDSearchableIndex__transitionWithBudgetTimeUsed___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queueConsumeBudgetElapsedPeriod:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queueTransitionFromRefresh:", 0);
}

- (void)_queueConsumeBudgetElapsedPeriod:(double)a3
{
  id v5;

  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex schedulableDelegate](self, "schedulableDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchableIndexSchedulable:didIndexForTime:", self, a3);

}

void __58__EDSearchableIndex__processRefreshRequestWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "queueContentsAllowsRefresh"))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "needsRefresh") & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  v4 = objc_msgSend(*(id *)(a1 + 32), "isPerformingBlockAffectingDataSourceAndIndex");

  if ((v4 & 1) == 0)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pendingIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__EDSearchableIndex__processRefreshRequestWithCompletion___block_invoke_2;
    v9[3] = &unk_1E949C280;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    objc_msgSend(v5, "_dataSourceRequestNeededUpdatesExcludingIdentifiers:completion:", v7, v9);

    return;
  }
LABEL_7:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_dataSourceRequestNeededUpdatesExcludingIdentifiers:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndex.m"), 1170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != nil"));

  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke;
  v12[3] = &unk_1E949CCB0;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  v10 = v8;
  v14 = v10;
  -[EDSearchableIndex _dataSourceScheduleWork:](self, "_dataSourceScheduleWork:", v12);

}

- (void)_dataSourceInvalidateItemsGreaterThanTransaction:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  int64_t v10;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__EDSearchableIndex__dataSourceInvalidateItemsGreaterThanTransaction_completion___block_invoke;
  v8[3] = &unk_1E949F8E0;
  v9 = v6;
  v10 = a3;
  v8[4] = self;
  v7 = v6;
  -[EDSearchableIndex _dataSourceScheduleWork:](self, "_dataSourceScheduleWork:", v8);

}

- (void)_dataSourceScheduleWork:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("com.apple.email.searchableIndex.dataSourceWorkBlock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __45__EDSearchableIndex__dataSourceScheduleWork___block_invoke;
  v12 = &unk_1E949BD50;
  v6 = v4;
  v14 = v6;
  v7 = v5;
  v13 = v7;
  v8 = _Block_copy(&v9);
  -[EFStoppableScheduler performBlock:](self->_dataSourceScheduler, "performBlock:", v8, v9, v10, v11, v12);

}

- (NSString)indexName
{
  return self->_indexName;
}

- (void)_resume
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "resume");

  v5 = CFSTR("still suspended");
  if (v4 > 1)
    v5 = CFSTR("already resumed");
  if (v4 == 1)
    v5 = CFSTR("resuming");
  v6 = v5;
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[EDSearchableIndex state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v6;
    v14 = 2048;
    v15 = objc_msgSend(v11, "resumeCount");
    _os_log_debug_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEBUG, "-[EDSearchableIndex resume]: %@ (%lld)", (uint8_t *)&v12, 0x16u);

  }
  -[EDSearchableIndex schedulableDelegate](self, "schedulableDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex _eventDataForTransitionState:](self, "_eventDataForTransitionState:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "searchableIndexSchedulable:didGenerateImportantPowerEventWithIdentifier:eventData:", self, CFSTR("resume"), v9);

  if (v4 == 1)
  {
    objc_msgSend(v8, "indexingDidResumeForSearchableIndexSchedulable:", self);
    -[EDSearchableIndex state](self, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIsActive:", 1);

    if ((_os_feature_enabled_impl() & 1) == 0)
      -[EDSearchableIndex _resumeIndexingScheduler](self, "_resumeIndexingScheduler");
    -[EDSearchableIndex _queueTransitionFromRefresh:](self, "_queueTransitionFromRefresh:", 0);
  }

}

- (EDSearchableIndexSchedulableDelegate)schedulableDelegate
{
  return (EDSearchableIndexSchedulableDelegate *)objc_loadWeakRetained((id *)&self->_schedulableDelegate);
}

void __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  int v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint8_t *v26;
  _QWORD v27[5];
  id v28;
  id location[2];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  char v37;

  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v3, "EDSearchableIndexDataSourceUpdates", ", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v35 = buf;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isPerformingBlockAffectingDataSourceAndIndex");
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v35[24] = 1;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EE90]), "initWithLabel:", CFSTR("com.apple.mail.searchableIndex.dataSourceCancelation"));
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, v6);
    v7 = *(_QWORD **)(a1 + 32);
    v8 = (void *)v7[4];
    objc_msgSend(v7, "dataSourceUpdateTimeLimit");
    v10 = v9;
    v27[0] = v5;
    v27[1] = 3221225472;
    v27[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_203;
    v27[3] = &unk_1E949AD60;
    objc_copyWeak(&v28, location);
    v27[4] = *(_QWORD *)(a1 + 32);
    v11 = (id)objc_msgSend(v8, "afterDelay:performBlock:", v27, v10);
    v13 = *(char **)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_206;
    v23[3] = &unk_1E94A0970;
    v23[4] = v13;
    v24 = v12;
    v14 = v6;
    v25 = v14;
    v26 = buf;
    objc_msgSend(v13, "_throttleRequestedSize:targetTime:action:", v13 + 56, v23, 0.5);
    v31[3] = v15;

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
  }
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 32);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_2;
  v20[3] = &unk_1E94A0998;
  v22 = &v30;
  v20[4] = v16;
  v21 = *(id *)(a1 + 48);
  objc_msgSend(v17, "performSyncBlock:", v20);
  if (v35[24])
    objc_msgSend(*(id *)(a1 + 32), "refresh");
  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(location[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v18, OS_SIGNPOST_INTERVAL_END, v19, "EDSearchableIndexDataSourceUpdates", ", (uint8_t *)location, 2u);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(buf, 8);
}

- (BOOL)isPerformingBlockAffectingDataSourceAndIndex
{
  int64_t v2;

  v2 = atomic_load((unint64_t *)&self->_countOfBlocksAffectingDataSourceAndIndex);
  return v2 > 0;
}

+ (OS_os_log)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__EDSearchableIndex_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_7 != -1)
    dispatch_once(&signpostLog_onceToken_7, block);
  return (OS_os_log *)(id)signpostLog_log_7;
}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (double)dataSourceUpdateTimeLimit
{
  return self->_dataSourceUpdateTimeLimit;
}

- (void)_scheduleDataSourceRefresh
{
  void *v3;
  char v4;
  void *v5;
  EFSuspendableScheduler *indexingScheduler;
  _QWORD v7[5];

  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scheduledRefresh");

  if ((v4 & 1) == 0)
  {
    -[EDSearchableIndex state](self, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScheduledRefresh:", 1);

    indexingScheduler = self->_indexingScheduler;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__EDSearchableIndex__scheduleDataSourceRefresh__block_invoke;
    v7[3] = &unk_1E949AEB8;
    v7[4] = self;
    -[EFSuspendableScheduler performBlock:](indexingScheduler, "performBlock:", v7);
  }
}

- (id)_eventDataForTransitionState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v19 = a3;
  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  v21[0] = v19;
  v20[0] = CFSTR("state");
  v20[1] = CFSTR("resumeCount");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[EDSearchableIndex state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithLongLong:", objc_msgSend(v5, "resumeCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  v20[2] = CFSTR("pending");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[EDSearchableIndex state](self, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "countOfItemsInPendingQueues"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  v20[3] = CFSTR("preprocessingItemCount");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[EDSearchableIndex state](self, "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preprocessingItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v13;
  v20[4] = CFSTR("persistenceAvailable");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[EDSearchableIndex state](self, "state");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "persistenceAvailable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __28__EDSearchableIndex_refresh__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queueRefresh");
}

- (void)setSearchableIndexBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void)setSchedulableDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_schedulableDelegate, a3);
}

- (NSSet)purgeReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("MonitoredActivityReasonCompacting"), CFSTR("MonitoredActivityReasonMoving"), CFSTR("MonitoredActivityReasonArchiving"), 0);
}

- (NSSet)exclusionReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("MonitoredActivityReasonDeleting"), CFSTR("MonitoredActivityReasonJunking"), 0);
}

- (void)_suspendIndexingScheduler
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1D2F2C000, v0, v1, "suspending indexing scheduler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchLastClientState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Timed out while fetching client state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (CSSearchableIndex)searchIndex
{
  EDSearchableIndex *v2;
  CSSearchableIndex *searchIndex;
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  NSString *indexName;
  void *v11;
  uint64_t v12;
  CSSearchableIndex *v13;
  uint64_t v14;
  void *v15;
  int v16;
  CSSearchableIndex *v17;

  v2 = self;
  objc_sync_enter(v2);
  searchIndex = v2->_searchIndex;
  if (!searchIndex)
  {
    v4 = (id)*MEMORY[0x1E0CB2AB0];
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isAppleSilicon");

    if (v6)
    {
      v7 = (id)*MEMORY[0x1E0CB2AC0];

      v4 = v7;
    }
    -[EDSearchableIndex searchableIndexBundleID](v2, "searchableIndexBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0CA6B38]);
      indexName = v2->_indexName;
      -[EDSearchableIndex searchableIndexBundleID](v2, "searchableIndexBundleID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "initWithName:protectionClass:bundleIdentifier:", indexName, v4, v11);
      v13 = v2->_searchIndex;
      v2->_searchIndex = (CSSearchableIndex *)v12;

    }
    else
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B38]), "initWithName:protectionClass:", v2->_indexName, v4);
      v11 = v2->_searchIndex;
      v2->_searchIndex = (CSSearchableIndex *)v14;
    }

    -[EDSearchableIndex state](v2, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "persistenceAvailable");

    if (v16)
      -[CSSearchableIndex setIndexDelegate:](v2->_searchIndex, "setIndexDelegate:", v2);

    searchIndex = v2->_searchIndex;
  }
  v17 = searchIndex;
  objc_sync_exit(v2);

  return v17;
}

- (NSString)searchableIndexBundleID
{
  return self->_searchableIndexBundleID;
}

void __45__EDSearchableIndex_setPersistenceAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "persistenceAvailable");
  v4 = *(unsigned __int8 *)(a1 + 40);

  if (v4 != v3)
  {
    v5 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPersistenceAvailable:", v5);

    v7 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "searchIndex");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setIndexDelegate:", v7);

      objc_msgSend(*(id *)(a1 + 32), "_resume");
      objc_msgSend(*(id *)(a1 + 32), "_queueRefresh");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_suspend");
    }
  }
}

- (double)_throttleRequestedSize:(unint64_t *)a3 targetTime:(double)a4 action:(id)a5
{
  id v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  unint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v8 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v20 = __62__EDSearchableIndex__throttleRequestedSize_targetTime_action___block_invoke;
  v21 = &unk_1E94A0890;
  v23 = &v25;
  v9 = v8;
  v22 = v9;
  v24 = a3;
  v10 = v19;
  v11 = mach_absolute_time();
  v20((uint64_t)v10);
  v12 = mach_absolute_time();
  if (EFGetElapsedTimeSinceAbsoluteTime_onceToken_1 != -1)
    dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken_1, &__block_literal_global_672);
  v14 = EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo_1;
  v13 = *(unsigned int *)algn_1ED11C734;

  v15 = -[EDSearchableIndex currentMaximumBatchSize](self, "currentMaximumBatchSize");
  v16 = *a3;
  v17 = v26[3];
  if (v17)
    v16 = vcvtad_u64_f64(a4 / ((double)((v12 - v11) * v14 / v13) / 1000000000.0 / (double)v17) * 0.7 + (double)v16 * 0.3);
  if (v16 <= 4)
    v16 = 4;
  if (v16 >= v15)
    v16 = v15;
  *a3 = v16;

  _Block_object_dispose(&v25, 8);
  return (double)((v12 - v11) * v14 / v13) / 1000000000.0;
}

void __62__EDSearchableIndex__throttleRequestedSize_targetTime_action___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1D824B334]();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    if (!v5)
    {
      objc_msgSend((id)objc_opt_class(), "_localClientState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        +[EDSearchableIndex log](EDSearchableIndex, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_2((uint64_t)v10, v11, v12);

        objc_msgSend((id)objc_opt_class(), "_saveLocalClientState:", 0);
      }

    }
    +[EDSearchableIndexClientState clientStateFromData:](EDSearchableIndexClientState, "clientStateFromData:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = &stru_1E94A4508;
      *(_DWORD *)buf = 138412802;
      v37 = v13;
      v38 = 2112;
      if (!v5)
        v15 = CFSTR(" (new)");
      v39 = v15;
      v40 = 2112;
      v41 = v5;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "last client state: %@%@ data:%@", buf, 0x20u);
    }

    if (!v13 || !objc_msgSend(v13, "transaction"))
    {
      +[EDSearchableIndex log](EDSearchableIndex, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "transaction");
        __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_1((uint64_t)v13, (uint64_t)buf);
      }

      v17 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "transaction"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringValue");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_collectAnalyticsForReindexReason:withInfo:", 1, v19);

    }
    objc_msgSend(*(id *)(a1 + 32), "state");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "transaction"))
    {
      objc_msgSend(*(id *)(a1 + 32), "state");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "transaction");
      LOBYTE(v22) = v22 == objc_msgSend(v13, "transaction");

      if ((v22 & 1) != 0)
      {
LABEL_25:
        v27 = objc_msgSend(v13, "transaction");
        objc_msgSend(*(id *)(a1 + 32), "state");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setTransaction:", v27);

        objc_msgSend(*(id *)(a1 + 32), "state");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setClientStateFetched:", 1);

        v30 = *(void **)(a1 + 32);
        v31 = objc_msgSend(v13, "transaction");
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __42__EDSearchableIndex__fetchLastClientState__block_invoke_2;
        v33[3] = &unk_1E949AEB8;
        v33[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v30, "_dataSourceInvalidateItemsGreaterThanTransaction:completion:", v31, v33);

        goto LABEL_26;
      }
      v23 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v13, "transaction"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "_collectAnalyticsForReindexReason:withInfo:", 1, v25);

      v26 = *(void **)(a1 + 32);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __42__EDSearchableIndex__fetchLastClientState__block_invoke_156;
      v34[3] = &unk_1E94A0818;
      v35 = v13;
      objc_msgSend(v26, "_promptToFileRadarAboutReindexing:", v34);
      v20 = v35;
    }

    goto LABEL_25;
  }
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v7, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_3();
  }

  v9 = *(void **)(a1 + 32);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __42__EDSearchableIndex__fetchLastClientState__block_invoke_159;
  v32[3] = &unk_1E949AEB8;
  v32[4] = v9;
  objc_msgSend(v9, "_dataSourceScheduleWork:", v32);
LABEL_26:

}

- (void)_resumeIndexingScheduler
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1D2F2C000, v0, v1, "resuming indexing scheduler", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__EDSearchableIndex_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_74 != -1)
    dispatch_once(&log_onceToken_74, block);
  return (OS_os_log *)(id)log_log_74;
}

- (void)setForeground:(BOOL)a3
{
  unint64_t v4;
  os_unfair_lock_s *p_mainThreadAccessibleIvarLock;

  if (a3)
    v4 = 512;
  else
    v4 = 64;
  p_mainThreadAccessibleIvarLock = &self->_mainThreadAccessibleIvarLock;
  os_unfair_lock_lock(&self->_mainThreadAccessibleIvarLock);
  self->_currentMaximumBatchSize = v4;
  os_unfair_lock_unlock(p_mainThreadAccessibleIvarLock);
}

uint64_t __47__EDSearchableIndex__scheduleDataSourceRefresh__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__EDSearchableIndex__scheduleDataSourceRefresh__block_invoke_2;
  v4[3] = &unk_1E949AEB8;
  v4[4] = v2;
  objc_msgSend(v2, "_processRefreshRequestWithCompletion:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "_transitionWithBudgetTimeUsed:", 0.0);
}

- (void)_transitionWithBudgetTimeUsed:(double)a3
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v4[6];

  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__EDSearchableIndex__transitionWithBudgetTimeUsed___block_invoke;
  v4[3] = &unk_1E949B658;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v4);
}

- (void)_processRefreshRequestWithCompletion:(id)a3
{
  id v4;
  EFAssertableScheduler *stateTransitionScheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EFSuspendableScheduler assertIsExecuting:](self->_indexingScheduler, "assertIsExecuting:", 1);
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__EDSearchableIndex__processRefreshRequestWithCompletion___block_invoke;
  v7[3] = &unk_1E949C280;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v7);

}

void __32__EDSearchableIndex_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_7;
  signpostLog_log_7 = (uint64_t)v1;

}

void __24__EDSearchableIndex_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_74;
  log_log_74 = (uint64_t)v1;

}

- (void)setPersistenceAvailable:(BOOL)a3
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v4[5];
  BOOL v5;

  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__EDSearchableIndex_setPersistenceAvailable___block_invoke;
  v4[3] = &unk_1E94A0780;
  v4[4] = self;
  v5 = a3;
  -[EFAssertableScheduler performBlock:](stateTransitionScheduler, "performBlock:", v4);
}

- (void)refresh
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v3[5];

  stateTransitionScheduler = self->_stateTransitionScheduler;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__EDSearchableIndex_refresh__block_invoke;
  v3[3] = &unk_1E949AEB8;
  v3[4] = self;
  -[EFAssertableScheduler performBlock:](stateTransitionScheduler, "performBlock:", v3);
}

- (void)_registerStateCaptureHandler
{
  id v3;
  EFCancelable *v4;
  EFCancelable *stateCancelable;

  v3 = MEMORY[0x1E0C80D38];
  EFLogRegisterStateCaptureBlock();
  v4 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
  stateCancelable = self->_stateCancelable;
  self->_stateCancelable = v4;

}

+ (OS_os_log)indexWhileLockedLog
{
  id v2;

  if (indexWhileLockedLog_onceToken != -1)
    dispatch_once(&indexWhileLockedLog_onceToken, &__block_literal_global_60);
  if (_os_feature_enabled_impl())
    v2 = (id)indexWhileLockedLog_log;
  else
    v2 = 0;
  return (OS_os_log *)v2;
}

void __40__EDSearchableIndex_indexWhileLockedLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "IndexWhileLocked");
  v1 = (void *)indexWhileLockedLog_log;
  indexWhileLockedLog_log = (uint64_t)v0;

}

+ (BOOL)isValidTransaction:(int64_t)a3
{
  return a3 > 0;
}

+ (BOOL)isIncrementalIndexingType:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0x96u >> a3);
}

- (EDSearchableIndex)initWithName:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void (**v11)(void *, const __CFString *);
  _EDSearchableIndexPendingRemovals *v12;
  void *v13;
  void *v14;
  _EDSearchableIndexPendingRemovals *v15;
  EDSearchableIndexState *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  unint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  os_activity_t v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(uint64_t);
  void *v75;
  id v76;
  _QWORD aBlock[4];
  id v78;
  objc_super v79;
  _BYTE location[24];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v79.receiver = self;
  v79.super_class = (Class)EDSearchableIndex;
  v8 = -[EDSearchableIndex init](&v79, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__EDSearchableIndex_initWithName_dataSource___block_invoke;
    aBlock[3] = &unk_1E949F1F8;
    v78 = v6;
    v11 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
    v12 = [_EDSearchableIndexPendingRemovals alloc];
    objc_msgSend(v8, "purgeReasons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "exclusionReasons");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[_EDSearchableIndexPendingRemovals initWithPurgeReasons:exclusionReasons:](v12, "initWithPurgeReasons:exclusionReasons:", v13, v14);

    v16 = -[EDSearchableIndexState initWithPendingIdentifierRemovals:]([EDSearchableIndexState alloc], "initWithPendingIdentifierRemovals:", v15);
    v17 = (void *)*((_QWORD *)v8 + 23);
    *((_QWORD *)v8 + 23) = v16;

    v18 = (void *)MEMORY[0x1E0D1F080];
    v19 = (void *)MEMORY[0x1E0D1F070];
    v11[2](v11, CFSTR("state"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serialDispatchQueueSchedulerWithName:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "assertableSchedulerWithScheduler:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v8 + 4);
    *((_QWORD *)v8 + 4) = v22;

    objc_storeWeak((id *)v8 + 20, v7);
    v24 = objc_alloc_init(MEMORY[0x1E0D1E138]);
    v25 = (void *)*((_QWORD *)v8 + 19);
    *((_QWORD *)v8 + 19) = v24;

    v26 = (void *)MEMORY[0x1E0D1F080];
    v27 = (void *)MEMORY[0x1E0D1F070];
    v11[2](v11, CFSTR("indexingQueue"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "serialDispatchQueueSchedulerWithName:qualityOfService:", v28, 9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "suspendableSchedulerWithScheduler:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v8 + 10);
    *((_QWORD *)v8 + 10) = v30;

    v32 = objc_alloc(MEMORY[0x1E0D1F080]);
    v33 = (void *)MEMORY[0x1E0D1F070];
    v11[2](v11, CFSTR("dataSource"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "serialDispatchQueueSchedulerWithName:qualityOfService:", v34, 9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v32, "initWithScheduler:", v35);
    v37 = (void *)*((_QWORD *)v8 + 11);
    *((_QWORD *)v8 + 11) = v36;

    v38 = objc_alloc(MEMORY[0x1E0D1F080]);
    v39 = (void *)MEMORY[0x1E0D1F070];
    v11[2](v11, CFSTR("addIndexItems"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "serialDispatchQueueSchedulerWithName:qualityOfService:", v40, 9);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v38, "initWithScheduler:", v41);
    v43 = (void *)*((_QWORD *)v8 + 12);
    *((_QWORD *)v8 + 12) = v42;

    *((_DWORD *)v8 + 28) = 0;
    *((_DWORD *)v8 + 36) = 0;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "activeProcessorCount");

    v46 = objc_alloc(MEMORY[0x1E0D1F080]);
    objc_msgSend(MEMORY[0x1E0D1F070], "operationQueueSchedulerWithMaxConcurrentOperationCount:", (uint64_t)((double)v45 * 0.5) + 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v46, "initWithScheduler:", v47);
    v49 = (void *)*((_QWORD *)v8 + 13);
    *((_QWORD *)v8 + 13) = v48;

    v50 = objc_alloc(MEMORY[0x1E0D1F080]);
    v51 = (void *)MEMORY[0x1E0D1F070];
    v11[2](v11, CFSTR("batch"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "serialDispatchQueueSchedulerWithName:qualityOfService:", v52, 9);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v50, "initWithScheduler:", v53);
    v55 = (void *)*((_QWORD *)v8 + 15);
    *((_QWORD *)v8 + 15) = v54;

    *((int64x2_t *)v8 + 3) = vdupq_n_s64(0x40uLL);
    *((_QWORD *)v8 + 8) = 64;
    *(_OWORD *)(v8 + 200) = xmmword_1D317A880;
    if ((_os_feature_enabled_impl() & 1) == 0)
      objc_msgSend(v8, "_suspendIndexingScheduler");
    v56 = _os_activity_create(&dword_1D2F2C000, "processing batch of indexable items", MEMORY[0x1E0C80FE0], OS_ACTIVITY_FLAG_DEFAULT);
    v57 = (void *)*((_QWORD *)v8 + 9);
    *((_QWORD *)v8 + 9) = v56;

    v8[150] = 0;
    atomic_store(0, (unint64_t *)v8 + 16);
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v8[151] = objc_msgSend(v58, "BOOLForKey:", CFSTR("DisableSpotlightVerification")) ^ 1;

    objc_msgSend(v8, "powerObservable");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      v60 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
      v61 = (void *)*((_QWORD *)v8 + 2);
      *((_QWORD *)v8 + 2) = v60;

      *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)location, v8);
      v62 = (void *)*((_QWORD *)v8 + 2);
      v63 = (void *)MEMORY[0x1E0D1EF30];
      v72 = MEMORY[0x1E0C809B0];
      v73 = 3221225472;
      v74 = __45__EDSearchableIndex_initWithName_dataSource___block_invoke_2;
      v75 = &unk_1E94A0710;
      objc_copyWeak(&v76, (id *)location);
      objc_msgSend(v63, "observerWithResultBlock:", &v72);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "subscribe:", v64, v72, v73, v74, v75);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "addCancelable:", v65);

      objc_destroyWeak(&v76);
      objc_destroyWeak((id *)location);
    }
    objc_msgSend(v8, "_registerStateCaptureHandler");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addObserver:selector:name:object:", v8, sel_richLinkBecameAvailable_, CFSTR("LibraryMessageRichLinkDataBecameAvailableNotification"), 0);

    if (_os_feature_enabled_impl())
    {
      objc_msgSend((id)objc_opt_class(), "indexWhileLockedLog");
      v67 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
      {
        v68 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "numberWithInt:", objc_msgSend(v69, "processIdentifier"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v70;
        _os_log_impl(&dword_1D2F2C000, v67, OS_LOG_TYPE_DEFAULT, "maild started with pid %@", location, 0xCu);

      }
    }

  }
  return (EDSearchableIndex *)v8;
}

id __45__EDSearchableIndex_initWithName_dataSource___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.email.searchableIndex.%@.%@"), a2, *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

void __45__EDSearchableIndex_initWithName_dataSource___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_powerStateChanged");

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating searchable index", buf, 2u);
  }

  -[EFCancelationToken cancel](self->_cancelationToken, "cancel");
  -[EFCancelable cancel](self->_stateCancelable, "cancel");
  -[EFCancelable cancel](self->_coalescingTimer, "cancel");
  if (!-[EDSearchableIndexState isActive](self->_state, "isActive") && (_os_feature_enabled_impl() & 1) == 0)
    -[EFSuspendableScheduler resume](self->_indexingScheduler, "resume");
  -[CSSearchableIndex setIndexDelegate:](self->_searchIndex, "setIndexDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)EDSearchableIndex;
  -[EDSearchableIndex dealloc](&v4, sel_dealloc);
}

- (unint64_t)currentMaximumBatchSize
{
  os_unfair_lock_s *p_mainThreadAccessibleIvarLock;
  unint64_t currentMaximumBatchSize;

  p_mainThreadAccessibleIvarLock = &self->_mainThreadAccessibleIvarLock;
  os_unfair_lock_lock(&self->_mainThreadAccessibleIvarLock);
  currentMaximumBatchSize = self->_currentMaximumBatchSize;
  os_unfair_lock_unlock(p_mainThreadAccessibleIvarLock);
  return currentMaximumBatchSize;
}

- (NSString)copyDiagnosticInformation
{
  id v3;
  EFAssertableScheduler *stateTransitionScheduler;
  uint64_t v5;
  EFStoppableScheduler *dataSourceScheduler;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD v31[22];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  unint64_t v67;
  _QWORD v68[3];
  char v69;
  _QWORD v70[3];
  char v71;
  _QWORD v72[3];
  char v73;
  _QWORD v74[3];
  char v75;
  _QWORD v76[3];
  char v77;
  _QWORD v78[3];
  char v79;
  _QWORD v80[3];
  char v81;
  _QWORD v82[3];
  char v83;
  _QWORD v84[3];
  char v85;
  _QWORD v86[3];
  char v87;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  v87 = -86;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v85 = -86;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x2020000000;
  v83 = -86;
  v80[0] = 0;
  v80[1] = v80;
  v80[2] = 0x2020000000;
  v81 = -86;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v79 = -86;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v77 = -86;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  v75 = -86;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x2020000000;
  v73 = -86;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  v71 = -86;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x2020000000;
  v69 = -86;
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0xAAAAAAAAAAAAAAAALL;
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__29;
  v58 = __Block_byref_object_dispose__29;
  v59 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__29;
  v52 = __Block_byref_object_dispose__29;
  v53 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__29;
  v46 = __Block_byref_object_dispose__29;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__29;
  v40 = __Block_byref_object_dispose__29;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0xAAAAAAAAAAAAAAAALL;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __46__EDSearchableIndex_copyDiagnosticInformation__block_invoke;
  v31[3] = &unk_1E94A0738;
  v31[4] = self;
  v31[5] = v86;
  v31[6] = v84;
  v31[7] = v82;
  v31[8] = v80;
  v31[9] = v78;
  v31[10] = v76;
  v31[11] = v74;
  v31[12] = v72;
  v31[13] = v70;
  v31[14] = v68;
  v31[15] = &v64;
  v31[16] = &v60;
  v31[17] = &v54;
  v31[18] = &v48;
  v31[19] = &v42;
  v31[20] = &v36;
  v31[21] = &v32;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v31, &v54, &v32, &v48, &v42, &v36);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  dataSourceScheduler = self->_dataSourceScheduler;
  v26[0] = v5;
  v26[1] = 3221225472;
  v26[2] = __46__EDSearchableIndex_copyDiagnosticInformation__block_invoke_2;
  v26[3] = &unk_1E949BE40;
  v26[4] = self;
  v26[5] = &v27;
  -[EFStoppableScheduler performSyncBlock:](dataSourceScheduler, "performSyncBlock:", v26);
  v7 = -[EDSearchableIndex currentMaximumBatchSize](self, "currentMaximumBatchSize");
  objc_msgSend(v3, "appendString:", CFSTR("==== Searchable Index State ====\n"));
  objc_msgSend(v3, "appendFormat:", CFSTR("  transaction:                    %lld\n"), v65[3]);
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  active:                         %@ (rc=%lld)\n"), v8, v61[3]);

  NSStringFromBOOL();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  persistenceAvailable:           %@\n"), v9);

  NSStringFromBOOL();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  client state fetched:           %@\n"), v10);

  NSStringFromBOOL();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  coalesce timer fired:           %@\n"), v11);

  NSStringFromBOOL();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  scheduled processing:           %@\n"), v12);

  NSStringFromBOOL();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  needs refresh:                  %@\n"), v13);

  NSStringFromBOOL();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  scheduled refresh:              %@\n"), v14);

  NSStringFromBOOL();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  needs verification:             %@\n"), v15);

  NSStringFromBOOL();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  scheduled verification:         %@\n"), v16);

  objc_msgSend(v3, "appendFormat:", CFSTR("  indexing batch size:            %lu\n"), v33[3]);
  objc_msgSend(v3, "appendFormat:", CFSTR("  data source batch size:         %lu\n"), v28[3]);
  objc_msgSend(v3, "appendFormat:", CFSTR("  maximum batch size:             %lu\n"), v7);
  -[EDSearchableIndex schedulableDelegate](self, "schedulableDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  data source indexing permitted: %@\n"), v18);

  objc_msgSend(v17, "hasAvailableIndexingBudgetForSearchableIndexSchedulable:", self);
  NSStringFromBOOL();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  has available indexing budget:  %@\n"), v19);

  objc_msgSend(v17, "budgetedTimeRemainingForSearchableIndexSchedulable:", self);
  objc_msgSend(v3, "appendFormat:", CFSTR("  budgeted time remaining:        %.4fs\n"), v20);
  objc_msgSend(v3, "appendFormat:", CFSTR("  budgeted item count remaining:  %ld\n"), objc_msgSend(v17, "budgetedItemCountRemainingForSearchableIndexSchedulable:", self));
  v21 = objc_msgSend((id)v55[5], "count");
  objc_msgSend(v3, "appendFormat:", CFSTR("  pending items:                  %lu (%p)\n"), v21, v55[5]);
  v22 = objc_msgSend((id)v49[5], "count");
  objc_msgSend(v3, "appendFormat:", CFSTR("  pre-processing items:           %lu (%p)\n"), v22, v49[5]);
  v23 = objc_msgSend((id)v43[5], "count");
  objc_msgSend(v3, "appendFormat:", CFSTR("  pending removals:               %lu (%p)\n"), v23, v43[5]);
  v24 = objc_msgSend((id)v37[5], "count");
  objc_msgSend(v3, "appendFormat:", CFSTR("  pending domain removals:        %lu (%p)\n"), v24, v37[5]);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);
  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v80, 8);
  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v86, 8);
  return (NSString *)v3;
}

void __46__EDSearchableIndex_copyDiagnosticInformation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "scheduledVerification");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "scheduledProcessing");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v4, "scheduledRefresh");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v5, "isActive");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v6, "persistenceAvailable");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v7, "clientStateFetched");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(v8, "coalesceTimerFired");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = objc_msgSend(v9, "needsRefresh");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = objc_msgSend(v10, "needsVerification");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 148);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = objc_msgSend(v11, "transaction");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = objc_msgSend(v12, "resumeCount");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pendingItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "copy");
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "preprocessingItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "copy");
  v21 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
  v22 = *(void **)(v21 + 40);
  *(_QWORD *)(v21 + 40) = v20;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pendingIdentifierRemovals");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "copy");
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 152) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pendingDomainRemovals");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "copy");
  v31 = *(_QWORD *)(*(_QWORD *)(a1 + 160) + 8);
  v32 = *(void **)(v31 + 40);
  *(_QWORD *)(v31 + 40) = v30;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 168) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
}

uint64_t __46__EDSearchableIndex_copyDiagnosticInformation__block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

- (void)_powerStateChanged
{
  if (-[EDSearchableIndex isPluggedIn](self, "isPluggedIn"))
    -[EDSearchableIndex refresh](self, "refresh");
}

+ (id)_reindexReasonString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Batch Transaction Failed");
  else
    return off_1E94A0E08[a3 - 1];
}

- (void)_sendAnalyticsForReindexReason:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("reason");
  objc_msgSend((id)objc_opt_class(), "_reindexReasonString:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.mail.searchableIndex.reindexAnalytics"), v5);
  -[EDSearchableIndex analyticsCollector](self, "analyticsCollector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logOneTimeEvent:", v6);

}

- (void)_storeLastKnownReindexReason:(int64_t)a3 withInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_reindexReasonString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@: %@ %@"), v6, v7, v15);

  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("LastKnownReindexReasons"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithArray:", v11);

  if ((unint64_t)objc_msgSend(v12, "count") >= 0x32)
    objc_msgSend(v12, "removeObjectAtIndex:", 0);
  objc_msgSend(v12, "addObject:", v8);
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("LastKnownReindexReasons"));

}

id __49__EDSearchableIndex__registerStateCaptureHandler__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("LastKnownReindexReasons"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v2, CFSTR("LastKnownReindexReasons"));

  v3 = (void *)objc_msgSend(v0, "copy");
  return v3;
}

- (void)_collectAnalyticsForReindexReason:(int64_t)a3 withInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "_reindexReasonString:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v8;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Collecting reindexing analytics for reason: %@, info: %@", (uint8_t *)&v9, 0x16u);

  }
  -[EDSearchableIndex _sendAnalyticsForReindexReason:](self, "_sendAnalyticsForReindexReason:", a3);
  -[EDSearchableIndex _storeLastKnownReindexReason:withInfo:](self, "_storeLastKnownReindexReason:withInfo:", a3, v6);

}

- (void)_collectAnalyticsForReindexReason:(int64_t)a3
{
  -[EDSearchableIndex _collectAnalyticsForReindexReason:withInfo:](self, "_collectAnalyticsForReindexReason:withInfo:", a3, 0);
}

- (void)setDataSourceIndexingPermitted:(BOOL)a3
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v4[5];
  BOOL v5;

  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__EDSearchableIndex_setDataSourceIndexingPermitted___block_invoke;
  v4[3] = &unk_1E94A0780;
  v4[4] = self;
  v5 = a3;
  -[EFAssertableScheduler performBlock:](stateTransitionScheduler, "performBlock:", v4);
}

uint64_t __52__EDSearchableIndex_setDataSourceIndexingPermitted___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  int v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 148) != v2)
  {
    v3 = result;
    *(_BYTE *)(v1 + 148) = v2;
    v4 = *(unsigned __int8 *)(result + 40);
    v5 = *(void **)(result + 32);
    if (v4)
    {
      objc_msgSend(v5, "state");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isActive");

      v8 = *(void **)(v3 + 32);
      if (v7)
      {
        objc_msgSend(v8, "state");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setNeedsVerification:", 1);

        return objc_msgSend(*(id *)(v3 + 32), "_queueRefresh");
      }
      else
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __52__EDSearchableIndex_setDataSourceIndexingPermitted___block_invoke_2;
        v10[3] = &unk_1E949AEB8;
        v10[4] = v8;
        return objc_msgSend(v8, "_dataSourceScheduleWork:", v10);
      }
    }
    else
    {
      return objc_msgSend(v5, "_queueTransitionFromRefresh:", 0);
    }
  }
  return result;
}

void __52__EDSearchableIndex_setDataSourceIndexingPermitted___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Finishing because indexing is disabled", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "schedulableDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexingDidFinishForSearchableIndexSchedulable:backlogComplete:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_scheduleSpotlightVerification
{
  void *v3;
  char v4;
  void *v5;
  EFSuspendableScheduler *indexingScheduler;
  _QWORD v7[5];

  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex state](self, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scheduledVerification");

  if ((v4 & 1) == 0)
  {
    -[EDSearchableIndex state](self, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScheduledVerification:", 1);

    indexingScheduler = self->_indexingScheduler;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke;
    v7[3] = &unk_1E949AEB8;
    v7[4] = self;
    -[EFSuspendableScheduler performBlock:](indexingScheduler, "performBlock:", v7);
  }
}

void __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  int v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[4];
  id v13;
  id v14;
  char v15;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("LastVerificationFailureReportDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = v4;
  if (v3 && (objc_msgSend(v4, "timeIntervalSinceDate:", v3), v6 < 604800.0))
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("LastVerificationFailureReportDate"));
    v7 = 0;
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_2;
  aBlock[3] = &unk_1E94A07F0;
  v15 = v7;
  v8 = v2;
  v13 = v8;
  v9 = v5;
  v14 = v9;
  v10 = _Block_copy(aBlock);
  if (v7)
    v11 = 0;
  else
    v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "_scheduleSpotlightVerificationOnIndexingQueueWithCompletion:", v11);
  objc_msgSend(*(id *)(a1 + 32), "_clearOrphanedSearchableMessagesFromDatabase");

}

void __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2 == 1)
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      if (v5)
        objc_msgSend(v5, "addSuccessBlock:", &__block_literal_global_128);
      else
        __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_3();
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("LastVerificationFailureReportDate"));
  }

}

void __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_3()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__29;
  v10 = __Block_byref_object_dispose__29;
  v11 = (id)0xAAAAAAAAAAAAAAAALL;
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DAFF28]), "initWithQueue:", 0);
  v0 = (void *)v7[5];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", CFSTR("Mail"), CFSTR("Spotlight"), CFSTR("Verification Failed"), CFSTR("VerificationStateCorrupt"), v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)v7[5];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_4;
  v5[3] = &unk_1E94A07C8;
  v5[4] = &v6;
  objc_msgSend(v4, "snapshotWithSignature:duration:events:payload:actions:reply:", v3, 0, 0, 0, v5, 0.0);

  _Block_object_dispose(&v6, 8);
}

void __51__EDSearchableIndex__scheduleSpotlightVerification__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  char v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DB00A0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || ((v6 = objc_msgSend(v4, "BOOLValue"), v5) ? (v7 = v6) : (v7 = 0), (v7 & 1) == 0))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DB0090]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_INFO, "Failed to get diagnostic signature with reason: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

- (void)_clearOrphanedSearchableMessagesFromDatabase
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__EDSearchableIndex__clearOrphanedSearchableMessagesFromDatabase__block_invoke;
  v2[3] = &unk_1E949AEB8;
  v2[4] = self;
  -[EDSearchableIndex _dataSourceScheduleWork:](self, "_dataSourceScheduleWork:", v2);
}

void __65__EDSearchableIndex__clearOrphanedSearchableMessagesFromDatabase__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Checking messages.searchable_message for orphaned values", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearOrphanedSearchableMessagesFromDatabase");

}

- (void)_scheduleSpotlightVerificationOnIndexingQueueWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t buf[16];

  v4 = a3;
  -[EFSuspendableScheduler assertIsExecuting:](self->_indexingScheduler, "assertIsExecuting:", 1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "verifying representative sample of items in the datasource are actually indexed", buf, 2u);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke;
  v9[3] = &unk_1E94A0840;
  v9[4] = self;
  v7 = v4;
  v11 = v7;
  v8 = v5;
  v10 = v8;
  -[EDSearchableIndex _processSpotlightVerificationWithCompletion:](self, "_processSpotlightVerificationWithCompletion:", v9);
  objc_msgSend(v8, "lockWhenCondition:", 1);
  objc_msgSend(v8, "unlock");
  -[EDSearchableIndex _transitionWithBudgetTimeUsed:](self, "_transitionWithBudgetTimeUsed:", 0.0);

}

void __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  NSObject *v20;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (a2 == 2)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = "Spotlight found everything from the sample";
      goto LABEL_11;
    }
  }
  else
  {
    if (a2 == 1)
    {
      +[EDSearchableIndex log](EDSearchableIndex, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke_cold_1();

      v12 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "_collectAnalyticsForReindexReason:withInfo:", 0, v14);

      v15 = *(void **)(a1 + 32);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke_136;
      v19[3] = &unk_1E94A0818;
      v16 = v8;
      v20 = v16;
      objc_msgSend(v15, "_promptToFileRadarAboutReindexing:", v19);
      objc_msgSend(*(id *)(a1 + 32), "_handleFailingTransactionIDs:", v16);
      v9 = v20;
      goto LABEL_12;
    }
    if (a2)
      goto LABEL_13;
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v10 = "Datasource couldn't verify or Mail didn't fetch any samples";
LABEL_11:
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_INFO, v10, buf, 2u);
    }
  }
LABEL_12:

LABEL_13:
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
    (*(void (**)(uint64_t, uint64_t, id))(v17 + 16))(v17, a2, v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertIsExecuting:", 1);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setScheduledVerification:", 0);

  if (a2 == 1)
    objc_msgSend(*(id *)(a1 + 32), "_scheduleSpotlightVerification");
  objc_msgSend(*(id *)(a1 + 40), "lock");
  objc_msgSend(*(id *)(a1 + 40), "unlockWithCondition:", 1);

}

id __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke_136(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Index verification failed for %@ transactions: %@"), v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_registerDistantFutureSpotlightVerification
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (-[EDSearchableIndex enableSpotlightVerification](self, "enableSpotlightVerification"))
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __64__EDSearchableIndex__registerDistantFutureSpotlightVerification__block_invoke_2;
    v4[3] = &unk_1E94A0868;
    objc_copyWeak(&v5, &location);
    v3 = _Block_copy(v4);
    ef_xpc_activity_register();

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __64__EDSearchableIndex__registerDistantFutureSpotlightVerification__block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807D8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808A8], 1);

}

void __64__EDSearchableIndex__registerDistantFutureSpotlightVerification__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_verifySpotlightIndex");

}

- (void)_verifySpotlightIndex
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v3[5];

  stateTransitionScheduler = self->_stateTransitionScheduler;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__EDSearchableIndex__verifySpotlightIndex__block_invoke;
  v3[3] = &unk_1E949AEB8;
  v3[4] = self;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v3);
}

uint64_t __42__EDSearchableIndex__verifySpotlightIndex__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsVerification:", 1);

  return objc_msgSend(*(id *)(a1 + 32), "_queueTransitionFromRefresh:", 0);
}

- (void)_handleFailingTransactionIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[EDSearchableIndex _handleFailingTransactionIDs:].cold.1((uint64_t)v4, (uint64_t)v7, objc_msgSend(v4, "count"), v5);

  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex _invalidateItemsInTransactions:](self, "_invalidateItemsInTransactions:", v6);

}

- (void)applicationWillSuspend
{
  -[EDSearchableIndex setForeground:](self, "setForeground:", 0);
}

- (void)applicationWillResume
{
  -[EDSearchableIndex setForeground:](self, "setForeground:", 1);
}

+ (id)_localClientStateURL
{
  if (_localClientStateURL_onceToken != -1)
    dispatch_once(&_localClientStateURL_onceToken, &__block_literal_global_143);
  return (id)_localClientStateURL_result;
}

void __41__EDSearchableIndex__localClientStateURL__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D1E2B8], "baseMailDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v3 = v0;
    objc_msgSend(v0, "URLByAppendingPathComponent:", CFSTR("SpotlightState.json"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_localClientStateURL_result;
    _localClientStateURL_result = v1;

    v0 = v3;
  }

}

+ (id)_localClientState
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  if (v4)
  {
    objc_msgSend(a1, "_localClientStateURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 1, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDSearchableIndexClientState clientStateFromData:](EDSearchableIndexClientState, "clientStateFromData:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (void)_saveLocalClientState:(id)a3
{
  void *v4;
  int v5;
  id v6;
  _QWORD block[5];

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternal");

  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__EDSearchableIndex__saveLocalClientState___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (_saveLocalClientState__onceToken != -1)
      dispatch_once(&_saveLocalClientState__onceToken, block);
    objc_msgSend((id)_saveLocalClientState__coalescer, "coalesceValue:", v6);
  }

}

void __43__EDSearchableIndex__saveLocalClientState___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_localClientStateURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc(MEMORY[0x1E0D1EE98]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__EDSearchableIndex__saveLocalClientState___block_invoke_2;
  v6[3] = &unk_1E94A08B8;
  v3 = v1;
  v7 = v3;
  v4 = objc_msgSend(v2, "initWithCoalescingAction:", v6);
  v5 = (void *)_saveLocalClientState__coalescer;
  _saveLocalClientState__coalescer = v4;

}

void __43__EDSearchableIndex__saveLocalClientState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "archiveRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeToURL:options:error:", *(_QWORD *)(a1 + 32), 0x10000000, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);
  }

}

id __42__EDSearchableIndex__fetchLastClientState__block_invoke_156(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 32), "transaction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("Invalidated items greater than transaction: %@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __42__EDSearchableIndex__fetchLastClientState__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refresh");
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_159(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "schedulableDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexingDidFinishForSearchableIndexSchedulable:backlogComplete:", *(_QWORD *)(a1 + 32), 0);

}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_2_161(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "tryLockWhenCondition:", 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "unlockWithCondition:", 1);
  }

}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_162(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "schedulableDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexingDidFinishForSearchableIndexSchedulable:backlogComplete:", *(_QWORD *)(a1 + 32), 0);

}

- (void)_noteNeedsLastClientStateFetch
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v4[5];

  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 0);
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__EDSearchableIndex__noteNeedsLastClientStateFetch__block_invoke;
  v4[3] = &unk_1E949AEB8;
  v4[4] = self;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v4);
}

void __51__EDSearchableIndex__noteNeedsLastClientStateFetch__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClientStateFetched:", 0);

}

- (int64_t)_transaction
{
  EFAssertableScheduler *stateTransitionScheduler;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33__EDSearchableIndex__transaction__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__EDSearchableIndex__transaction__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "transaction");

}

- (int64_t)_nextTransaction
{
  EFAssertableScheduler *stateTransitionScheduler;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__EDSearchableIndex__nextTransaction__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__EDSearchableIndex__nextTransaction__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "transaction") + 1;
  objc_msgSend(v3, "setTransaction:", v2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2;

}

- (void)_suspend
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  __CFString *v9;

  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex state](self, "state");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "suspend");

  v4 = CFSTR("still resumed");
  if (v3 < 0)
    v4 = CFSTR("already suspended");
  if (!v3)
    v4 = CFSTR("suspending");
  v9 = v4;
  -[EDSearchableIndex schedulableDelegate](self, "schedulableDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex _eventDataForTransitionState:](self, "_eventDataForTransitionState:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchableIndexSchedulable:didGenerateImportantPowerEventWithIdentifier:eventData:", self, CFSTR("suspend"), v6);

  if (!v3)
  {
    objc_msgSend(v5, "indexingDidSuspendForSearchableIndexSchedulable:", self);
    -[EDSearchableIndex state](self, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsActive:", 0);

    if ((_os_feature_enabled_impl() & 1) == 0)
      -[EDSearchableIndex _suspendIndexingScheduler](self, "_suspendIndexingScheduler");
    -[EDSearchableIndex _queueTransitionFromRefresh:](self, "_queueTransitionFromRefresh:", 0);
  }

}

- (void)suspend
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v3[5];

  stateTransitionScheduler = self->_stateTransitionScheduler;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__EDSearchableIndex_suspend__block_invoke;
  v3[3] = &unk_1E949AEB8;
  v3[4] = self;
  -[EFAssertableScheduler performBlock:](stateTransitionScheduler, "performBlock:", v3);
}

uint64_t __28__EDSearchableIndex_suspend__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_suspend");
}

- (void)resume
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v3[5];

  stateTransitionScheduler = self->_stateTransitionScheduler;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__EDSearchableIndex_resume__block_invoke;
  v3[3] = &unk_1E949AEB8;
  v3[4] = self;
  -[EFAssertableScheduler performBlock:](stateTransitionScheduler, "performBlock:", v3);
}

uint64_t __27__EDSearchableIndex_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resume");
}

- (BOOL)isPersistenceAvailable
{
  EFAssertableScheduler *stateTransitionScheduler;
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
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__EDSearchableIndex_isPersistenceAvailable__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__EDSearchableIndex_isPersistenceAvailable__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "persistenceAvailable");

}

- (BOOL)isActive
{
  EFAssertableScheduler *stateTransitionScheduler;
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
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__EDSearchableIndex_isActive__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__EDSearchableIndex_isActive__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isActive");

}

- (int64_t)resumeCount
{
  EFAssertableScheduler *stateTransitionScheduler;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__EDSearchableIndex_resumeCount__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __32__EDSearchableIndex_resumeCount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "resumeCount");

}

- (BOOL)isIndexingDisabledForPPT
{
  EDSearchableIndex *v2;
  os_unfair_lock_s *p_indexingDisabledForPPTLock;

  v2 = self;
  p_indexingDisabledForPPTLock = &self->_indexingDisabledForPPTLock;
  os_unfair_lock_lock(&self->_indexingDisabledForPPTLock);
  LOBYTE(v2) = v2->_indexingDisabledForPPT;
  os_unfair_lock_unlock(p_indexingDisabledForPPTLock);
  return (char)v2;
}

- (void)setIndexingDisabledForPPT:(BOOL)a3
{
  os_unfair_lock_s *p_indexingDisabledForPPTLock;

  p_indexingDisabledForPPTLock = &self->_indexingDisabledForPPTLock;
  os_unfair_lock_lock(&self->_indexingDisabledForPPTLock);
  self->_indexingDisabledForPPT = a3;
  os_unfair_lock_unlock(p_indexingDisabledForPPTLock);
}

- (BOOL)clientStateFetched
{
  EFAssertableScheduler *stateTransitionScheduler;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -86;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__EDSearchableIndex_clientStateFetched__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = self;
  v5[5] = &v6;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__EDSearchableIndex_clientStateFetched__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "clientStateFetched");

}

- (void)setClientStateFetched:(BOOL)a3
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v4[5];
  BOOL v5;

  stateTransitionScheduler = self->_stateTransitionScheduler;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__EDSearchableIndex_setClientStateFetched___block_invoke;
  v4[3] = &unk_1E94A0780;
  v4[4] = self;
  v5 = a3;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v4);
}

void __43__EDSearchableIndex_setClientStateFetched___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClientStateFetched:", v1);

}

- (void)_dataSourceAssignTransaction:(int64_t)a3 updates:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__EDSearchableIndex__dataSourceAssignTransaction_updates_completion___block_invoke;
  v12[3] = &unk_1E949C750;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  -[EDSearchableIndex _dataSourceScheduleWork:](self, "_dataSourceScheduleWork:", v12);

}

void __69__EDSearchableIndex__dataSourceAssignTransaction_updates_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delayDataSourceAssignmentFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 56);

    if (v3 >= 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "delayDataSourceAssignmentFuture");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v4, "result");

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchableIndex:assignTransaction:updates:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);

}

- (void)_dataSourceAssignTransaction:(int64_t)a3 forIdentifiers:(id)a4 completion:(id)a5
{
  void *v8;
  EDSearchableIndexUpdates *v9;
  id v10;

  v10 = a5;
  objc_msgSend(a4, "ef_map:", &__block_literal_global_191);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EDSearchableIndexUpdates initWithIndexedItems:]([EDSearchableIndexUpdates alloc], "initWithIndexedItems:", v8);
  -[EDSearchableIndex _dataSourceAssignTransaction:updates:completion:](self, "_dataSourceAssignTransaction:updates:completion:", a3, v9, v10);

}

EDSearchableIndexItem *__76__EDSearchableIndex__dataSourceAssignTransaction_forIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  EDSearchableIndexItem *v3;

  v2 = a2;
  v3 = -[EDSearchableIndexItem initWithIdentifier:]([EDSearchableIndexItem alloc], "initWithIdentifier:", v2);

  return v3;
}

void __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_203(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_203_cold_1();

    objc_msgSend(WeakRetained, "cancel");
    objc_msgSend(*(id *)(a1 + 32), "schedulableDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "didCancelDataSourceUpdateRequestForSearchableIndexSchedulable:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_206(uint64_t a1, uint64_t a2)
{
  id *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_suspendIndexingScheduler");
  objc_msgSend(*v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemsToRemoveForSearchableIndex:", *v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v8;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "Removing %@ items", buf, 0xCu);

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "dataSourceRefreshReasons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeItemsWithIdentifiers:reasons:fromRefresh:", v6, v10, 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "itemsToIndexForSearchableIndex:excludingIdentifiers:count:cancelationToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      *(_DWORD *)buf = 138412802;
      v37 = v14;
      v38 = 2048;
      v39 = v15;
      v40 = 2048;
      v41 = a2;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_INFO, "Indexing %@ items throttledDataSourceBatchSize:%lu batchSize:%lu", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_indexItems:fromRefresh:immediately:", v12, 1, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "domainsToRemoveForSearchableIndex:", *(_QWORD *)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v17, "count"))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v19;
      _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_INFO, "Removing %@ domains", buf, 0xCu);

    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = v17;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(a1 + 32), "removeItemsForDomainIdentifier:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v21);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_resumeIndexingScheduler");
  v24 = objc_msgSend(v12, "count");
  if (v24 || objc_msgSend(*(id *)(a1 + 48), "isCanceled"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isDataSourceIndexingPermitted"))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v37 = 0;
      v38 = 2048;
      v39 = a2;
      _os_log_impl(&dword_1D2F2C000, v26, OS_LOG_TYPE_DEFAULT, "Data source returned %lu out of %lu requested items to index.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "schedulableDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "indexingDidFinishForSearchableIndexSchedulable:backlogComplete:", *(_QWORD *)(a1 + 32), 1);

    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(void **)(v28 + 32);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_207;
    v30[3] = &unk_1E949AEB8;
    v30[4] = v28;
    objc_msgSend(v29, "performBlock:", v30);
  }

  return v24;
}

void __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_207(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didCompleteBacklog");

}

uint64_t __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) > 0.0)
    objc_msgSend(*(id *)(a1 + 32), "_queueConsumeBudgetElapsedPeriod:");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_dataSourceVerifyRepresentativeSampleWithCompletion:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__EDSearchableIndex__dataSourceVerifyRepresentativeSampleWithCompletion___block_invoke;
    v6[3] = &unk_1E949C280;
    v6[4] = self;
    v7 = v4;
    -[EDSearchableIndex _dataSourceScheduleWork:](self, "_dataSourceScheduleWork:", v6);

  }
}

void __73__EDSearchableIndex__dataSourceVerifyRepresentativeSampleWithCompletion___block_invoke(uint64_t a1)
{
  EDSearchableIndexVerifier *v2;

  v2 = -[EDSearchableIndexVerifier initWithDataSource:]([EDSearchableIndexVerifier alloc], "initWithDataSource:", *(_QWORD *)(a1 + 32));
  -[EDSearchableIndexVerifier verifyDataSamplesWithCompletionHandler:scheduler:](v2, "verifyDataSamplesWithCompletionHandler:scheduler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

}

- (void)_dataSourcePrepareToIndexItems:(id)a3 fromRefresh:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  id v13;
  id v14;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (v6)
  {
    if (v9)
      (*((void (**)(id))v9 + 2))(v9);
  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke;
    aBlock[3] = &unk_1E949CCB0;
    aBlock[4] = self;
    v13 = v8;
    v14 = v10;
    v11 = _Block_copy(aBlock);
    -[EDSearchableIndex _dataSourceScheduleWork:](self, "_dataSourceScheduleWork:", v11);

  }
}

void __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke(uint64_t a1)
{
  NSObject *v1;
  os_signpost_id_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  os_signpost_id_t v32;
  __int128 v33;
  id v34;
  id obj;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[6];
  uint8_t buf[8];
  uint8_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v1))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v1, OS_SIGNPOST_INTERVAL_BEGIN, v2, "EDSearchableIndexDataSourcePrepare", ", buf, 2u);
  }

  v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
  if (v3)
  {
    v37 = *(_QWORD *)v53;
    *(_QWORD *)&v4 = 138413058;
    v33 = v4;
    do
    {
      v38 = v3;
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v53 != v37)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "indexingType", v33);
        if (+[EDSearchableIndex isIncrementalIndexingType:](EDSearchableIndex, "isIncrementalIndexingType:", v7)&& (objc_msgSend(*(id *)(a1 + 32), "dataSource"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "indexingTypeForSearchableIndex:item:", *(_QWORD *)(a1 + 32), v6), v8, v9 != v7))
        {
          *(_QWORD *)buf = 0;
          v47 = buf;
          v48 = 0x3032000000;
          v49 = __Block_byref_object_copy__29;
          v50 = __Block_byref_object_dispose__29;
          v51 = 0;
          v10 = *(_QWORD *)(a1 + 32);
          v11 = *(void **)(v10 + 32);
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke_210;
          v45[3] = &unk_1E949BE40;
          v45[4] = v10;
          v45[5] = buf;
          objc_msgSend(v11, "performSyncBlock:", v45);
          objc_msgSend(v6, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(*((id *)v47 + 5), "containsObject:") & 1) != 0)
          {
            v9 = v7;
          }
          else
          {
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v12 = *(id *)(a1 + 40);
            v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v41, v64, 16);
            if (v13)
            {
              v14 = *(_QWORD *)v42;
              while (2)
              {
                for (j = 0; j != v13; ++j)
                {
                  if (*(_QWORD *)v42 != v14)
                    objc_enumerationMutation(v12);
                  v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
                  if (v16 != v6
                    && !+[EDSearchableIndex isIncrementalIndexingType:](EDSearchableIndex, "isIncrementalIndexingType:", objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "indexingType")))
                  {
                    objc_msgSend(v16, "identifier");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v18 = objc_msgSend(v17, "isEqualToString:", v39);

                    if ((v18 & 1) != 0)
                    {
                      v9 = v7;
                      goto LABEL_30;
                    }
                  }
                }
                v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v41, v64, 16);
                if (v13)
                  continue;
                break;
              }
            }

            if (v9 == 5)
            {
              +[EDSearchableIndex log](EDSearchableIndex, "log");
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v6, "identifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v56 = 138412802;
                v57 = v6;
                v58 = 2114;
                v59 = v28;
                v60 = 2048;
                v61 = v7;
                _os_log_impl(&dword_1D2F2C000, v27, OS_LOG_TYPE_DEFAULT, "Changing indexingType for item %@ identifier: %{public}@ from %ld using setNeedsAllAttributesIncludingDataDetectionResultsIndexingType", v56, 0x20u);

              }
              objc_msgSend(v6, "setNeedsAllAttributesIncludingDataDetectionResultsIndexingType");
              v9 = 5;
            }
            else if (v9)
            {
              objc_msgSend(v6, "setIndexingType:", v9);
              +[EDSearchableIndex log](EDSearchableIndex, "log");
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v6, "identifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v56 = v33;
                v57 = v6;
                v58 = 2114;
                v59 = v29;
                v60 = 2048;
                v61 = v7;
                v62 = 2048;
                v63 = v9;
                _os_log_error_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_ERROR, "Unexpected changing of indexingType for item %@ identifier: %{public}@ from %ld to %ld", v56, 0x2Au);

              }
LABEL_30:

            }
            else
            {
              +[EDSearchableIndex log](EDSearchableIndex, "log");
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v6, "identifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)v56 = 138412802;
                v57 = v6;
                v58 = 2114;
                v59 = v20;
                v60 = 2048;
                v61 = v7;
                _os_log_impl(&dword_1D2F2C000, v19, OS_LOG_TYPE_DEFAULT, "Changing indexingType for item %@ identifier: %{public}@ from %ld using setNeedsAllAttributesIndexingType", v56, 0x20u);

              }
              objc_msgSend(v6, "setNeedsAllAttributesIndexingType");
              v9 = 0;
            }
          }

          _Block_object_dispose(buf, 8);
        }
        else
        {
          v9 = v7;
        }
        if (v9 != 3 && v9 != 6)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "indexingType"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "indexingType"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v24, v25);

            v23 = v24;
          }
          objc_msgSend(v6, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v26);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
    }
    while (v3);
  }

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke_211;
  v40[3] = &unk_1E94A09C0;
  v40[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v34, "enumerateKeysAndObjectsUsingBlock:", v40);
  v30 = *(_QWORD *)(a1 + 48);
  if (v30)
    (*(void (**)(void))(v30 + 16))();
  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v31, OS_SIGNPOST_INTERVAL_END, v32, "EDSearchableIndexDataSourcePrepare", ", buf, 2u);
  }

}

void __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke_210(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pendingIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __79__EDSearchableIndex__dataSourcePrepareToIndexItems_fromRefresh_withCompletion___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchableIndex:assignIndexingType:forIdentifiers:", *(_QWORD *)(a1 + 32), objc_msgSend(v7, "integerValue"), v5);

}

- (id)bundleIDForSearchableIndexVerifier:(id)a3
{
  -[EDSearchableIndex searchableIndexBundleID](self, "searchableIndexBundleID", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dataSamplesForSearchableIndexVerifier:(id)a3 searchableIndex:(id)a4 count:(unint64_t)a5 lastVerifiedMessageID:(int64_t)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a4;
  -[EDSearchableIndex dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "verificationDataSamplesForSearchableIndex:count:lastVerifiedMessageID:", v9, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)knownTransactionIDsForSearchableIndexVerifier:(id)a3
{
  void *v4;
  void *v5;

  -[EDSearchableIndex dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "distinctTransactionIDsForSearchableIndex:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_startCoalescingTimer
{
  NSObject *v3;
  double coalescingDelaySeconds;
  EFAssertableScheduler *stateTransitionScheduler;
  double v6;
  EFCancelable *v7;
  EFCancelable *coalescingTimer;
  _QWORD v9[4];
  id v10;
  _BYTE buf[24];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  if (!self->_coalescingTimer)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      coalescingDelaySeconds = self->_coalescingDelaySeconds;
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = coalescingDelaySeconds;
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "starting coalescing timer (t=%fs)", buf, 0xCu);
    }

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    stateTransitionScheduler = self->_stateTransitionScheduler;
    v6 = self->_coalescingDelaySeconds;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__EDSearchableIndex__startCoalescingTimer__block_invoke;
    v9[3] = &unk_1E949C258;
    objc_copyWeak(&v10, (id *)buf);
    -[EFAssertableScheduler afterDelay:performBlock:](stateTransitionScheduler, "afterDelay:performBlock:", v9, v6);
    v7 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
    coalescingTimer = self->_coalescingTimer;
    self->_coalescingTimer = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
}

void __42__EDSearchableIndex__startCoalescingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_coalescingTimerFired");

}

- (void)_stopCoalescingTimer
{
  NSObject *v3;
  EFCancelable *coalescingTimer;
  uint8_t v5[16];

  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  if (self->_coalescingTimer)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "stopping coalescing timer", v5, 2u);
    }

    -[EFCancelable cancel](self->_coalescingTimer, "cancel");
    coalescingTimer = self->_coalescingTimer;
    self->_coalescingTimer = 0;

  }
}

- (void)_coalescingTimerFired
{
  NSObject *v3;
  void *v4;
  EFCancelable *coalescingTimer;
  uint8_t v6[16];

  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "coalescing timer fired", v6, 2u);
  }

  -[EDSearchableIndex state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCoalesceTimerFired:", 1);

  coalescingTimer = self->_coalescingTimer;
  self->_coalescingTimer = 0;

  -[EDSearchableIndex _queueTransitionFromRefresh:](self, "_queueTransitionFromRefresh:", 0);
}

- (void)_queueConsumeBudgetItemCount:(unint64_t)a3 lastItemDateReceived:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex schedulableDelegate](self, "schedulableDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchableIndexSchedulable:didIndexItemCount:lastItemDateReceived:", self, a3, v7);

}

- (void)_queueTransitionFromRefresh:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  unint64_t v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t throttledIndexingBatchSize;
  void *v15;
  int v16;
  void *v17;
  int v18;
  unint64_t v19;
  int v20;
  NSObject *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  BOOL v31;
  void *v32;
  int v33;

  v3 = a3;
  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isActive") & 1) != 0)
  {

  }
  else
  {
    v6 = _os_feature_enabled_impl();

    if ((v6 & 1) == 0)
      return;
  }
  -[EDSearchableIndex state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "clientStateFetched");

  if ((v8 & 1) != 0)
  {
    -[EDSearchableIndex state](self, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countOfItemsInPendingQueues");

    -[EDSearchableIndex state](self, "state");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "needsImmediateProcessing");

    -[EDSearchableIndex state](self, "state");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIndexImmediately:", 0);

    throttledIndexingBatchSize = self->_throttledIndexingBatchSize;
    -[EDSearchableIndex state](self, "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "coalesceTimerFired");

    -[EDSearchableIndex state](self, "state");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCoalesceTimerFired:", 0);
    if (v10)
      v18 = v16;
    else
      v18 = 0;
    v19 = 16;
    if (throttledIndexingBatchSize < 0x10)
      v19 = throttledIndexingBatchSize;
    if (v19 <= v10)
      v20 = 1;
    else
      v20 = v18;

    if ((v20 | v12) == 1)
    {
      -[EDSearchableIndex _stopCoalescingTimer](self, "_stopCoalescingTimer");
      -[EDSearchableIndex _scheduleProcessPendingItemsFromRefresh:](self, "_scheduleProcessPendingItemsFromRefresh:", v3);
    }
    else if (v10 - 1 <= 0xE)
    {
      -[EDSearchableIndex _startCoalescingTimer](self, "_startCoalescingTimer");
    }
    -[EDSearchableIndex schedulableDelegate](self, "schedulableDelegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "hasAvailableIndexingBudgetForSearchableIndexSchedulable:", self);

    -[EDSearchableIndex state](self, "state");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "queueContentsAllowsRefresh");

    -[EDSearchableIndex state](self, "state");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "persistenceAvailable");

    if (v29)
    {
      -[EDSearchableIndex state](self, "state");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v30, "needsToScheduleRefresh") & v25 & v27 & 1) != 0)
      {
        v31 = -[EDSearchableIndex isPerformingBlockAffectingDataSourceAndIndex](self, "isPerformingBlockAffectingDataSourceAndIndex");

        if (!v31)
          -[EDSearchableIndex _scheduleDataSourceRefresh](self, "_scheduleDataSourceRefresh");
      }
      else
      {

      }
      -[EDSearchableIndex state](self, "state");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "needsToScheduleVerification");

      if (v33)
        -[EDSearchableIndex _scheduleSpotlightVerification](self, "_scheduleSpotlightVerification");
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "indexWhileLockedLog");
    v21 = objc_claimAutoreleasedReturnValue();
    if (v21 && (EFProtectedDataAvailable() & 1) == 0 && os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[EDSearchableIndex _queueTransitionFromRefresh:].cold.1();

    -[EDSearchableIndex state](self, "state");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isActive");

    if (v23)
      -[EDSearchableIndex _fetchLastClientState](self, "_fetchLastClientState");
  }
}

- (void)_logSignpostForIndexingBatchStartWithPendingItemsCount:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[EDSearchableIndex signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = 138543362;
    v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "EDSearchableIndexBatchProcessing", "BatchStartedWithPendingItemCount=%{signpost.description:attribute,public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_logSignpostForIndexingBatchAssignedDomainRemovalCount:(unint64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[EDSearchableIndex signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = 134349056;
    v8 = a3;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_EVENT, v6, "EDSearchableIndexBatchProcessing", "BatchAssignedDomnainRemovalCount=%{signpost.description:attribute,public}llu", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_logSignpostForIndexingBatchAssignedUpdatesWithItemsIndexedCount:(unint64_t)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[EDSearchableIndex signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = 134349056;
    v8 = a3;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_EVENT, v6, "EDSearchableIndexBatchProcessing", "BatchAssignedDomnainRemovalCount=%{signpost.description:attribute,public}llu", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_logSignpostForIndexingBatchCompletedWithItemsIndexedCount:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[EDSearchableIndex signpostID](self, "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = 138543362;
    v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v5, OS_SIGNPOST_INTERVAL_END, v6, "EDSearchableIndexBatchProcessing", "BatchFinishedWithItemIndexedCount=%{signpost.description:attribute,public}@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)_scheduleProcessPendingItemsFromRefresh:(BOOL)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  EFSuspendableScheduler *indexingScheduler;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex state](self, "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scheduledProcessing");

  if ((v6 & 1) == 0)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[EDSearchableIndex _scheduleProcessPendingItemsFromRefresh:].cold.1();

    -[EDSearchableIndex state](self, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScheduledProcessing:", 1);

    objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("com.apple.email.searchableIndex.indexingBatch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    indexingScheduler = self->_indexingScheduler;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke;
    v12[3] = &unk_1E949FE90;
    v14 = a3;
    v12[4] = self;
    v13 = v9;
    v11 = v9;
    -[EFSuspendableScheduler performBlock:](indexingScheduler, "performBlock:", v12);

  }
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char *v10;
  double v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[7];
  _QWORD v24[7];
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  os_activity_scope_state_s state;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[8];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[5];
  _QWORD v49[5];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  double v53;
  _QWORD v54[2];
  _QWORD v55[3];

  v55[2] = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = -86;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 0xAAAAAAAAAAAAAAAALL;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0xAAAAAAAAAAAAAAAALL;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_2;
  v35[3] = &unk_1E94A09E8;
  v35[4] = v2;
  v35[5] = &v44;
  v35[6] = &v40;
  v35[7] = &v36;
  objc_msgSend(v3, "performSyncBlock:", v35);
  objc_msgSend(*(id *)(a1 + 32), "schedulableDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  if (*((_BYTE *)v45 + 24))
  {
    state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
    state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
    os_activity_scope_enter(*(os_activity_t *)(*(_QWORD *)(a1 + 32) + 72), &state);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41[3]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v54[1] = CFSTR("preprocessing");
    v55[0] = v6;
    v54[0] = CFSTR("pending");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37[3]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v55[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchableIndexSchedulable:didGeneratePowerEventWithIdentifier:eventData:", v7, CFSTR("Start Indexing Batch"), v9);

    objc_msgSend(*(id *)(a1 + 32), "_logSignpostForIndexingBatchStartWithPendingItemsCount:", v6);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 0xAAAAAAAAAAAAAAAALL;
    v10 = *(char **)(a1 + 32);
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_3;
    v24[3] = &unk_1E94A0AD8;
    v25 = *(_BYTE *)(a1 + 48);
    v24[4] = v10;
    v24[5] = &v26;
    v24[6] = &v31;
    objc_msgSend(v10, "_throttleRequestedSize:targetTime:action:", v10 + 48, v24, 0.5);
    v12 = v11;
    os_activity_scope_leave(&state);
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v27[3];
      *(_DWORD *)buf = 134218240;
      v51 = v14;
      v52 = 2048;
      v53 = v12;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_INFO, "batch of %lu items took %.4gs to index", buf, 0x16u);
    }

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v12 = 0.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_transitionWithBudgetTimeUsed:", v12);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32[3]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_logSignpostForIndexingBatchCompletedWithItemsIndexedCount:", v15);
  if (v12 > 0.0 && v32[3])
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 32);
    v23[0] = v4;
    v23[1] = 3221225472;
    v23[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_231;
    v23[3] = &unk_1E94A0B00;
    v23[4] = v16;
    v23[5] = &v40;
    v23[6] = &v36;
    objc_msgSend(v17, "performSyncBlock:", v23);
    v49[0] = v15;
    v48[0] = CFSTR("countOfItemsIndexed");
    v48[1] = CFSTR("elapsedTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v18;
    v48[2] = CFSTR("itemsPerSecond");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(unint64_t)v32[3] / v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v19;
    v48[3] = CFSTR("pending");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41[3]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v20;
    v48[4] = CFSTR("preprocessing");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37[3]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v49[4] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "searchableIndexSchedulable:didGenerateImportantPowerEventWithIdentifier:eventData:", *(_QWORD *)(a1 + 32), CFSTR("Finished Indexing Batch"), v22);
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScheduledProcessing:", 0);

  objc_msgSend(*(id *)(a1 + 32), "state");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "clientStateFetched");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "countOfItemsInPendingQueues");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preprocessingItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "count");

}

uint64_t __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  uint64_t v47;
  _BYTE *v48;
  _QWORD v49[5];
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  _BYTE *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  _QWORD aBlock[5];
  id v71;
  id v72;
  id v73;
  id v74;
  _BYTE buf[24];
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_consumeBatchOfSize:", a2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v3, "_identifiersStringForItems:maxLength:", v44, 150);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v42;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Indexing batch of %@ items: %{public}@", buf, 0x16u);

  }
  objc_msgSend((id)objc_opt_class(), "indexWhileLockedLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (EFProtectedDataAvailable() & 1) == 0)
  {
    v7 = v6;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v44, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v42;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Indexing batch of %@ items: %{public}@", buf, 0x16u);

    }
  }

  v9 = *(void **)(a1 + 32);
  v73 = 0;
  v74 = 0;
  objc_msgSend(v9, "_getDomainRemovals:identifierRemovals:", &v74, &v73);
  v10 = v74;
  v43 = v73;
  v11 = objc_msgSend(v44, "count");
  v12 = objc_msgSend(v43, "count");
  if (v12 + v11 + objc_msgSend(v10, "count"))
  {
    +[EDSearchableIndexClientState clientState](EDSearchableIndexClientState, "clientState");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDSearchableIndexClientState clientState](EDSearchableIndexClientState, "clientState");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v76 = __Block_byref_object_copy__29;
    v77 = __Block_byref_object_dispose__29;
    v78 = (id)0xAAAAAAAAAAAAAAAALL;
    v13 = v36;
    v78 = v13;
    objc_msgSend(v13, "setTransaction:", objc_msgSend(*(id *)(a1 + 32), "_nextTransaction"));
    v14 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_219;
    aBlock[3] = &unk_1E94A0A38;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v15 = v44;
    v71 = v15;
    v72 = v42;
    v39 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0D1F070], "globalAsyncSchedulerWithQualityOfService:", 9);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    v67 = &v66;
    v68 = 0x2020000000;
    v69 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_processDomainRemovals:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v55[0] = v14;
    v55[1] = 3221225472;
    v55[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_223;
    v55[3] = &unk_1E94A0A60;
    v56 = v10;
    v18 = v39;
    v63 = v18;
    v19 = v13;
    v20 = *(_QWORD *)(a1 + 32);
    v37 = v19;
    v57 = v19;
    v58 = v20;
    v21 = v40;
    v59 = v21;
    v64 = buf;
    v65 = &v66;
    v22 = v15;
    v60 = v22;
    v38 = v17;
    v61 = v38;
    v23 = v43;
    v62 = v23;
    objc_msgSend(v16, "onScheduler:then:", v41, v55);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v49[0] = v14;
    v49[1] = 3221225472;
    v49[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_226;
    v49[3] = &unk_1E94A0A88;
    v49[4] = *(_QWORD *)(a1 + 32);
    v25 = v22;
    v50 = v25;
    v26 = v38;
    v51 = v26;
    v52 = v23;
    v27 = v18;
    v54 = v27;
    v28 = v21;
    v53 = v28;
    objc_msgSend(v24, "onScheduler:then:", v41, v49);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v45[0] = v14;
    v45[1] = 3221225472;
    v45[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_228;
    v45[3] = &unk_1E94A0AB0;
    v30 = v25;
    v48 = buf;
    v31 = *(_QWORD *)(a1 + 32);
    v46 = v30;
    v47 = v31;
    objc_msgSend(v29, "onScheduler:recover:", v41, v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = (id)objc_msgSend(v32, "result:", 0);
    if (objc_msgSend(*(id *)(a1 + 32), "canIndexAttachments")
      && *((_BYTE *)v67 + 24)
      && !*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "refresh");
    }

    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(buf, 8);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v44, "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 24);
  v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return v34;
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_219(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  char v19;

  v7 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  v10 = objc_msgSend(v7, "transaction");
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_2_220;
  v15 = &unk_1E94A0A10;
  v19 = a4;
  v11 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v11;
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v9, "_dataSourceAssignTransaction:updates:completion:", v10, v8, &v12);
  objc_msgSend((id)objc_opt_class(), "_saveLocalClientState:", v7, v12, v13, v14, v15, v16);

}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_2_220(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t v9;

  if (*(_BYTE *)(a1 + 56))
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_3_221;
    v6[3] = &unk_1E949B390;
    v7 = v2;
    v4 = *(id *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v8 = v4;
    v9 = v5;
    objc_msgSend(v3, "performSyncBlock:", v6);

  }
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_3_221(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_INFO, "Clearing %lu items %{public}@ from processingItems", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didIndexItems:", *(_QWORD *)(a1 + 32));

}

id __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_223(uint64_t a1)
{
  EDSearchableIndexUpdates *v2;
  void *v3;
  EDSearchableIndexUpdates *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = [EDSearchableIndexUpdates alloc];
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[EDSearchableIndexUpdates initWithRemovedDomainIdentifiers:](v2, "initWithRemovedDomainIdentifiers:", v3);

    (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
    objc_msgSend(*(id *)(a1 + 48), "_logSignpostForIndexingBatchAssignedDomainRemovalCount:", objc_msgSend(*(id *)(a1 + 32), "count"));

  }
  objc_msgSend(*(id *)(a1 + 56), "setTransaction:", objc_msgSend(*(id *)(a1 + 48), "_nextTransaction"));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 48), "signpostID");
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(v18) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "EDSearchableIndexCSProcessing", "BatchBeginCoreSpotlightBatch", (uint8_t *)&v18, 2u);
  }

  objc_msgSend(*(id *)(a1 + 48), "searchIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginIndexBatch");

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "_processIndexingBatch:clientState:itemsNotIndexed:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 48), "_processIdentifierRemovals:", *(_QWORD *)(a1 + 80));
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 56);
    v18 = 138412290;
    v19 = v10;
    _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Ending batch with client state: %@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend((id)objc_opt_class(), "indexWhileLockedLog");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11 && (EFProtectedDataAvailable() & 1) == 0 && os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 56);
    v18 = 138412290;
    v19 = v12;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Ending batch with client state: %@", (uint8_t *)&v18, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 48), "searchIndex");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "archiveRepresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "endIndexBatchWithClientState:completionHandler:", v14, v15);

  objc_msgSend(v5, "future");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_226(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  void *v4;
  void *v5;
  EDSearchableIndexUpdates *v6;
  EDSearchableIndexUpdates *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "signpostID");
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v2, OS_SIGNPOST_INTERVAL_END, v3, "EDSearchableIndexCSProcessing", "BatchEndCoreSpotlightBatch", (uint8_t *)&v15, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "arrayByExcludingObjectsInArray:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [EDSearchableIndexUpdates alloc];
  v7 = -[EDSearchableIndexUpdates initWithIndexedItems:removedIdentifiers:removedDomainIdentifiers:](v6, "initWithIndexedItems:removedIdentifiers:removedDomainIdentifiers:", v4, v5, MEMORY[0x1E0C9AA60]);
  objc_msgSend((id)objc_opt_class(), "indexWhileLockedLog");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (EFProtectedDataAvailable() & 1) == 0)
  {
    v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "_identifiersStringForItems:maxLength:", *(_QWORD *)(a1 + 40), 150);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v10;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Recording successful index of items: %@", (uint8_t *)&v15, 0xCu);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v11 = *(void **)(a1 + 32);
  -[EDSearchableIndexUpdates indexedItems](v7, "indexedItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_logSignpostForIndexingBatchAssignedUpdatesWithItemsIndexedCount:", objc_msgSend(v12, "count"));

  objc_msgSend(MEMORY[0x1E0D1EEC0], "nullFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_228(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v13 = objc_msgSend(*(id *)(a1 + 32), "count");
    v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "transaction");
    objc_msgSend(v3, "ef_publicDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v26 = v13;
    v27 = 2048;
    v28 = v14;
    v29 = 2114;
    v30 = v15;
    _os_log_error_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_ERROR, "Spotlight failed to index %ld items (transaction=%lld) failed with error: %{public}@", buf, 0x20u);

  }
  objc_msgSend((id)objc_opt_class(), "indexWhileLockedLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (EFProtectedDataAvailable() & 1) == 0)
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(*(id *)(a1 + 32), "count");
      v17 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "transaction");
      objc_msgSend(v3, "ef_publicDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v26 = v16;
      v27 = 2048;
      v28 = v17;
      v29 = 2114;
      v30 = v18;
      _os_log_error_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_ERROR, "Spotlight failed to index %ld items (transaction=%lld) failed with error: %{public}@", buf, 0x20u);

    }
  }

  objc_msgSend(*(id *)(a1 + 40), "_noteNeedsLastClientStateFetch");
  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_229;
  v22 = &unk_1E949B6D0;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 40);
  v23 = v9;
  v24 = v10;
  objc_msgSend(v8, "performSyncBlock:", &v19);
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithError:", v3, v19, v20, v21, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_229(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_INFO, "Clearing %lu items from processingItems due to indexing failure", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "failedToIndexItems:", *(_QWORD *)(a1 + 32));

}

void __61__EDSearchableIndex__scheduleProcessPendingItemsFromRefresh___block_invoke_231(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "countOfItemsInPendingQueues");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preprocessingItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "count");

}

void __47__EDSearchableIndex__scheduleDataSourceRefresh__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertIsExecuting:", 1);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setScheduledRefresh:", 0);

}

- (void)beginUpdatesAffectingDataSourceAndIndex
{
  int64_t *p_countOfBlocksAffectingDataSourceAndIndex;
  unint64_t v3;

  p_countOfBlocksAffectingDataSourceAndIndex = &self->_countOfBlocksAffectingDataSourceAndIndex;
  do
    v3 = __ldaxr((unint64_t *)p_countOfBlocksAffectingDataSourceAndIndex);
  while (__stlxr(v3 + 1, (unint64_t *)p_countOfBlocksAffectingDataSourceAndIndex));
}

- (void)endUpdatesAffectingDataSourceAndIndex
{
  int64_t *p_countOfBlocksAffectingDataSourceAndIndex;
  unint64_t v3;

  p_countOfBlocksAffectingDataSourceAndIndex = &self->_countOfBlocksAffectingDataSourceAndIndex;
  do
    v3 = __ldaxr((unint64_t *)p_countOfBlocksAffectingDataSourceAndIndex);
  while (__stlxr(v3 - 1, (unint64_t *)p_countOfBlocksAffectingDataSourceAndIndex));
}

- (id)_consumeBatchOfSize:(unint64_t)a3
{
  EFAssertableScheduler *stateTransitionScheduler;
  id v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[EFSuspendableScheduler assertIsExecuting:](self->_indexingScheduler, "assertIsExecuting:", 1);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__29;
  v13 = __Block_byref_object_dispose__29;
  v14 = 0;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__EDSearchableIndex__consumeBatchOfSize___block_invoke;
  v8[3] = &unk_1E94A0B28;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __41__EDSearchableIndex__consumeBatchOfSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pendingItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processBatchOfSize:", *(_QWORD *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pendingItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v4 != v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "_identifiersStringForItems:maxLength:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 150);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134218498;
      v17 = v4 - v11;
      v18 = 2048;
      v19 = v4;
      v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "consuming %lu items out of a potential %lu new processingItems: %{public}@", (uint8_t *)&v16, 0x20u);
    }

  }
  if ((unint64_t)(v11 - 4) <= 0xB)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v11;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Allowing immediate indexing of %lu pending items", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "state");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIndexImmediately:", 1);

  }
}

- (id)_identifiersForItems:(id)a3
{
  objc_msgSend(a3, "ef_map:", &__block_literal_global_241);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __42__EDSearchableIndex__identifiersForItems___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "identifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_identifiersStringForItems:(id)a3 maxLength:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  -[EDSearchableIndex _identifiersForItems:](self, "_identifiersForItems:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@]"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "length");
  if (v9 >= a4)
    v10 = a4;
  else
    v10 = v9;
  objc_msgSend(v8, "substringToIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_getDomainRemovals:(id *)a3 identifierRemovals:(id *)a4
{
  EFAssertableScheduler *stateTransitionScheduler;
  _QWORD v8[6];
  id v9;
  BOOL v10;
  BOOL v11;
  id location;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  -[EFSuspendableScheduler assertIsExecuting:](self->_indexingScheduler, "assertIsExecuting:", 1);
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__29;
  v23 = __Block_byref_object_dispose__29;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__EDSearchableIndex__getDomainRemovals_identifierRemovals___block_invoke;
  v8[3] = &unk_1E94A0B70;
  objc_copyWeak(&v9, &location);
  v10 = a3 != 0;
  v11 = a4 != 0;
  v8[4] = &v13;
  v8[5] = &v19;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v8);
  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
}

void __59__EDSearchableIndex__getDomainRemovals_identifierRemovals___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _EDSearchableIndexPendingRemovals *v10;
  void *v11;
  void *v12;
  _EDSearchableIndexPendingRemovals *v13;
  void *v14;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(WeakRetained, "state");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removePendingDomainRemovals");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  if (*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(WeakRetained, "state");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pendingIdentifierRemovals");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = [_EDSearchableIndexPendingRemovals alloc];
    objc_msgSend(WeakRetained, "purgeReasons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "exclusionReasons");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[_EDSearchableIndexPendingRemovals initWithPurgeReasons:exclusionReasons:](v10, "initWithPurgeReasons:exclusionReasons:", v11, v12);
    objc_msgSend(WeakRetained, "state");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPendingIdentifierRemovals:", v13);

  }
}

- (BOOL)_processIndexingBatch:(id)a3 clientState:(id)a4 itemsNotIndexed:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  unint64_t throttledIndexingBatchSize;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  EDSearchableIndex *v45;
  id v46;
  _QWORD v47[5];
  id v48;
  id v49;
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  unint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v38 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "count");
  if (v10)
  {
    +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[EDSearchableIndex signpostID](self, "signpostID");
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v12, "EDSearchableIndexCreateSearchableItems", ", buf, 2u);
    }

    v13 = MEMORY[0x1E0C809B0];
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke;
    v47[3] = &unk_1E94A0BC0;
    v47[4] = self;
    v48 = v38;
    v49 = v9;
    objc_msgSend(v8, "ef_map:", v47);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1EEC0], "join:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v15, "result:", &v46);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v46;
    objc_msgSend(v16, "ef_filter:", *MEMORY[0x1E0D1ED88]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDSearchableIndex signpostLog](EDSearchableIndex, "signpostLog");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = -[EDSearchableIndex signpostID](self, "signpostID");
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D2F2C000, v18, OS_SIGNPOST_INTERVAL_END, v19, "EDSearchableIndexCreateSearchableItems", ", buf, 2u);
    }

    if (!v17)
    {
      +[EDSearchableIndex log](EDSearchableIndex, "log");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v37, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[EDSearchableIndex _processIndexingBatch:clientState:itemsNotIndexed:].cold.1();
      }

    }
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(v17, "count");
      throttledIndexingBatchSize = self->_throttledIndexingBatchSize;
      *(_DWORD *)buf = 134218496;
      v52 = v22;
      v53 = 2048;
      v54 = v10;
      v55 = 2048;
      v56 = throttledIndexingBatchSize;
      _os_log_impl(&dword_1D2F2C000, v21, OS_LOG_TYPE_DEFAULT, "indexing %lu / %lu items, throttled batch size %lu", buf, 0x20u);
    }

    objc_msgSend((id)objc_opt_class(), "indexWhileLockedLog");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 && (EFProtectedDataAvailable() & 1) == 0)
    {
      v25 = v24;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = objc_msgSend(v17, "count");
        v27 = self->_throttledIndexingBatchSize;
        *(_DWORD *)buf = 134218496;
        v52 = v26;
        v53 = 2048;
        v54 = v10;
        v55 = 2048;
        v56 = v27;
        _os_log_impl(&dword_1D2F2C000, v25, OS_LOG_TYPE_DEFAULT, "indexing %lu / %lu items, throttled batch size %lu", buf, 0x20u);
      }

    }
    if (objc_msgSend(v17, "count"))
    {
      -[EDSearchableIndex searchIndex](self, "searchIndex");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v13;
      v43[1] = 3221225472;
      v43[2] = __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_248;
      v43[3] = &unk_1E94A0BE8;
      v29 = v17;
      v44 = v29;
      v45 = self;
      objc_msgSend(v28, "indexSearchableItems:completionHandler:", v29, v43);

      if (-[EDSearchableIndex canIndexAttachments](self, "canIndexAttachments"))
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v40;
          while (2)
          {
            for (i = 0; i != v31; ++i)
            {
              if (*(_QWORD *)v40 != v32)
                objc_enumerationMutation(v30);
              objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "attributeSet");
              v34 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v34, "attachmentPaths");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              LOBYTE(v34) = objc_msgSend(v35, "count") == 0;
              if ((v34 & 1) == 0)
              {
                LOBYTE(v31) = 1;
                goto LABEL_34;
              }
            }
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
            if (v31)
              continue;
            break;
          }
        }
LABEL_34:

      }
      else
      {
        LOBYTE(v31) = 0;
      }

    }
    else
    {
      LOBYTE(v31) = 0;
    }

  }
  else
  {
    LOBYTE(v31) = 0;
  }

  return v31;
}

id __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "fetchIndexableAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(v5 + 120);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_2;
  v10[3] = &unk_1E94A0B98;
  v10[4] = v5;
  v7 = v3;
  v11 = v7;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v4, "onScheduler:map:", v6, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "skipIndexExclusionCheck") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "shouldExcludeFromIndex") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "searchableItem");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "searchableIndexBundleID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "attributeSet");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBundleID:", v3);

      v5 = *(void **)(a1 + 48);
      objc_msgSend(v2, "attributeSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addTransactionValueToAttributeSet:", v6);

      v7 = v2;
    }
    else if ((objc_msgSend(*(id *)(a1 + 40), "alwaysMarkAsIndexed") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

void __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_248(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_248_cold_1();
    }
  }
  else
  {
    v15 = a1;
    v4 = objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = *(id *)(v15 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v9, "attributeSet");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "relatedUniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            objc_msgSend(v10, "accountIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12 == 0;

            if (!v13)
            {
              v14 = (void *)objc_msgSend(v9, "copy");
              -[NSObject addObject:](v4, "addObject:", v14);

            }
          }

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    if (-[NSObject count](v4, "count"))
      objc_msgSend(*(id *)(v15 + 40), "_processAttachmentItemsForSuggestionsService:", v4);
  }

}

- (id)_processDomainRemovals:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EFSuspendableScheduler assertIsExecuting:](self->_indexingScheduler, "assertIsExecuting:", 1);
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR(", "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "removing indexed items for domains {%@}", (uint8_t *)&v15, 0xCu);

    }
    -[EDSearchableIndex searchIndex](self, "searchIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorOnlyCompletionHandlerAdapter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v10, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithResult:", v12);

  }
  objc_msgSend(v5, "future");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)_processIdentifierRemovals:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "identifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_INFO, "removing indexed items with identifiers {%@}", (uint8_t *)&v11, 0xCu);

    }
    -[EDSearchableIndex searchIndex](self, "searchIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteSearchableItemsWithIdentifiers:completionHandler:", v9, 0);

    objc_msgSend(v4, "purgedIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "changeStateOfSearchableItemsWithUIDs:toState:", v10, 1);

  }
}

void __58__EDSearchableIndex__processRefreshRequestWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertIsExecuting:", 1);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsRefresh:", 0);

}

- (void)_processSpotlightVerificationWithCompletion:(id)a3
{
  id v4;
  EFAssertableScheduler *stateTransitionScheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EFSuspendableScheduler assertIsExecuting:](self->_indexingScheduler, "assertIsExecuting:", 1);
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__EDSearchableIndex__processSpotlightVerificationWithCompletion___block_invoke;
  v7[3] = &unk_1E949C280;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v7);

}

uint64_t __65__EDSearchableIndex__processSpotlightVerificationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsVerification");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsVerification:", 0);

    return objc_msgSend(*(id *)(a1 + 32), "_dataSourceVerifyRepresentativeSampleWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, 0, 0);
  }
  return result;
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  EFAssertableScheduler *stateTransitionScheduler;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "spotlight requests to reindex items with identifiers %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex _collectAnalyticsForReindexReason:withInfo:](self, "_collectAnalyticsForReindexReason:withInfo:", 2, v13);

  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke;
  v24[3] = &unk_1E94A0818;
  v15 = v9;
  v25 = v15;
  -[EDSearchableIndex _promptToFileRadarAboutReindexing:](self, "_promptToFileRadarAboutReindexing:", v24);
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2;
  v20[3] = &unk_1E949EED8;
  v20[4] = self;
  v17 = v15;
  v21 = v17;
  v18 = v10;
  v23 = v18;
  v19 = v8;
  v22 = v19;
  -[EFAssertableScheduler performBlock:](stateTransitionScheduler, "performBlock:", v20);

}

id __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Spotlight requested that Mail reindex %@ items: %@"), v3, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClientStateFetched:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_missingIdentifiersForIdentifiersNeedingReindex:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_3;
  v7[3] = &unk_1E94A0C38;
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7[4] = v6;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v3, "onScheduler:addSuccessBlock:", v4, v7);

}

void __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (**v5)(void *, _QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_4;
  v9 = &unk_1E94A0C10;
  v4 = *(id *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v5 = (void (**)(void *, _QWORD))_Block_copy(&v6);
  if (objc_msgSend(v3, "count", v6, v7, v8, v9))
    objc_msgSend(*(id *)(a1 + 40), "deleteSearchableItemsWithIdentifiers:completionHandler:", v3, v5);
  else
    v5[2](v5, 0);

}

uint64_t __98__EDSearchableIndex_searchableIndex_reindexSearchableItemsWithIdentifiers_acknowledgementHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "refresh");
}

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[EDSearchableIndex searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:].cold.1();

  -[EDSearchableIndex _collectAnalyticsForReindexReason:](self, "_collectAnalyticsForReindexReason:", 3);
  -[EDSearchableIndex _promptToFileRadarAboutReindexing:](self, "_promptToFileRadarAboutReindexing:", &__block_literal_global_255);
  -[EDSearchableIndex redonateAllItemsWithAcknowledgementHandler:](self, "redonateAllItemsWithAcknowledgementHandler:", v5);

}

const __CFString *__89__EDSearchableIndex_searchableIndex_reindexAllSearchableItemsWithAcknowledgementHandler___block_invoke()
{
  return CFSTR("Spotlight requested that Mail reindex all items.");
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  char v4;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((v4 & 1) != 0)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "spotlight updated items with summaries: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    -[EDSearchableIndex generatedSummariesDidUpdate:](self, "generatedSummariesDidUpdate:", v6);
  }

}

- (id)_missingIdentifiersForIdentifiersNeedingReindex:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__EDSearchableIndex__missingIdentifiersForIdentifiersNeedingReindex___block_invoke;
  v9[3] = &unk_1E949CF38;
  v6 = v5;
  v10 = v6;
  -[EDSearchableIndex _dataSourceAssignTransaction:forIdentifiers:completion:](self, "_dataSourceAssignTransaction:forIdentifiers:completion:", 0, v4, v9);
  objc_msgSend(v6, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __69__EDSearchableIndex__missingIdentifiersForIdentifiersNeedingReindex___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

- (void)_invalidateItemsInTransactions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__EDSearchableIndex__invalidateItemsInTransactions___block_invoke;
  v6[3] = &unk_1E949B6D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[EDSearchableIndex _dataSourceScheduleWork:](self, "_dataSourceScheduleWork:", v6);

}

void __52__EDSearchableIndex__invalidateItemsInTransactions___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchableIndex:invalidateItemsInTransactions:", *v2, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v9 = objc_msgSend(v4, "count");
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Deleting %lu items from Spotlight index: %{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "searchIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__EDSearchableIndex__invalidateItemsInTransactions___block_invoke_258;
  v7[3] = &unk_1E949EFC8;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "deleteSearchableItemsWithIdentifiers:completionHandler:", v4, v7);

}

uint64_t __52__EDSearchableIndex__invalidateItemsInTransactions___block_invoke_258(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refresh");
}

- (void)reindexSearchableItemsWithIdentifiers:(id)a3 acknowledgementHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[EDSearchableIndex searchIndex](self, "searchIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:](self, "searchableIndex:reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v7, v8, v6);

}

- (void)reindexAllSearchableItemsWithAcknowledgementHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDSearchableIndex searchIndex](self, "searchIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:](self, "searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:", v4, v5);

}

- (void)generatedSummariesDidUpdate:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDSearchableIndex dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchableIndex:indexGeneratedSummaries:", self, v5);

}

- (void)redonateAllItemsWithAcknowledgementHandler:(id)a3
{
  id v4;
  EFAssertableScheduler *stateTransitionScheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__EDSearchableIndex_redonateAllItemsWithAcknowledgementHandler___block_invoke;
  v7[3] = &unk_1E949C280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[EFAssertableScheduler performBlock:](stateTransitionScheduler, "performBlock:", v7);

}

void __64__EDSearchableIndex_redonateAllItemsWithAcknowledgementHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[16];

  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Redonating All Items", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_suspendIndexingScheduler");
  objc_msgSend(*(id *)(a1 + 32), "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startReindex");

  objc_msgSend((id)objc_opt_class(), "_saveLocalClientState:", 0);
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating all items", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__EDSearchableIndex_redonateAllItemsWithAcknowledgementHandler___block_invoke_259;
  v6[3] = &unk_1E949C280;
  v5 = *(void **)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v5;
  objc_msgSend(v7, "_dataSourceInvalidateItemsGreaterThanTransaction:completion:", 0, v6);

}

uint64_t __64__EDSearchableIndex_redonateAllItemsWithAcknowledgementHandler___block_invoke_259(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "_resumeIndexingScheduler");
  if (*(_QWORD *)(a1 + 40))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Invoking acknowledgement handler", v4, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return objc_msgSend(*(id *)(a1 + 32), "refresh");
}

- (void)resetIndexForNewLibraryWithCompletionHandler:(id)a3
{
  id v4;
  EFAssertableScheduler *stateTransitionScheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  stateTransitionScheduler = self->_stateTransitionScheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E949C280;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[EFAssertableScheduler performBlock:](stateTransitionScheduler, "performBlock:", v7);

}

void __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_suspendIndexingScheduler");
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startReindex");

  objc_msgSend((id)objc_opt_class(), "_saveLocalClientState:", 0);
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEFAULT, "Deleting all items from Spotlight", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "searchIndex");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke_260;
  v6[3] = &unk_1E949CD40;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v5;
  objc_msgSend(v4, "deleteAllSearchableItemsWithCompletionHandler:", v6);

}

void __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke_260(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke_260_cold_1();
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_resumeIndexingScheduler");
  if (*(_QWORD *)(a1 + 40))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Invoking completion handler", v6, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)indexItems:(id)a3
{
  -[EDSearchableIndex indexItems:immediately:](self, "indexItems:immediately:", a3, 0);
}

- (void)indexItems:(id)a3 immediately:(BOOL)a4
{
  -[EDSearchableIndex indexItems:fromRefresh:immediately:](self, "indexItems:fromRefresh:immediately:", a3, 0, a4);
}

- (void)indexItems:(id)a3 fromRefresh:(BOOL)a4 immediately:(BOOL)a5
{
  id v8;
  NSObject *v9;
  EFStoppableScheduler *addIndexItemsScheduler;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  BOOL v14;

  v8 = a3;
  if (-[EDSearchableIndex isIndexingDisabledForPPT](self, "isIndexingDisabledForPPT"))
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[EDSearchableIndex indexItems:fromRefresh:immediately:].cold.1();

  }
  else if (objc_msgSend(v8, "count"))
  {
    addIndexItemsScheduler = self->_addIndexItemsScheduler;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __56__EDSearchableIndex_indexItems_fromRefresh_immediately___block_invoke;
    v11[3] = &unk_1E94A0CA0;
    v11[4] = self;
    v12 = v8;
    v13 = a4;
    v14 = a5;
    -[EFStoppableScheduler performBlock:](addIndexItemsScheduler, "performBlock:", v11);

  }
}

uint64_t __56__EDSearchableIndex_indexItems_fromRefresh_immediately___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_indexItems:fromRefresh:immediately:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
}

- (void)_indexItems:(id)a3 fromRefresh:(BOOL)a4 immediately:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  EFAssertableScheduler *stateTransitionScheduler;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;
  BOOL v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v5 = a5;
  v6 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__29;
    v27 = __Block_byref_object_dispose__29;
    v28 = 0;
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[EDSearchableIndex _identifiersStringForItems:maxLength:](self, "_identifiersStringForItems:maxLength:", v8, 150);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v30 = v8;
      v31 = 2114;
      v32 = v15;
      v33 = 1024;
      v34 = v6;
      v35 = 1024;
      v36 = v5;
      _os_log_debug_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEBUG, "%p indexItems:%{public}@ fromRefresh:%{BOOL}d i:%{BOOL}d", buf, 0x22u);

    }
    stateTransitionScheduler = self->_stateTransitionScheduler;
    v11 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke;
    v20[3] = &unk_1E949BE18;
    v22 = &v23;
    v20[4] = self;
    v12 = v8;
    v21 = v12;
    -[EFAssertableScheduler performSyncBlock:](stateTransitionScheduler, "performSyncBlock:", v20);
    if (objc_msgSend((id)v24[5], "count"))
    {
      +[EDSearchableIndex log](EDSearchableIndex, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        -[EDSearchableIndex _identifiersStringForItems:maxLength:](self, "_identifiersStringForItems:maxLength:", v24[5], 150);
        objc_claimAutoreleasedReturnValue();
        -[EDSearchableIndex _indexItems:fromRefresh:immediately:].cold.1();
      }

      objc_msgSend(v12, "arrayByExcludingObjectsInArray:", v24[5]);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (id)v14;
    }
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_261;
    v16[3] = &unk_1E94A0CA0;
    v16[4] = self;
    v8 = v12;
    v17 = v8;
    v18 = v6;
    v19 = v5;
    -[EDSearchableIndex _dataSourcePrepareToIndexItems:fromRefresh:withCompletion:](self, "_dataSourcePrepareToIndexItems:fromRefresh:withCompletion:", v8, v6, v16);

    _Block_object_dispose(&v23, 8);
  }

}

void __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "state");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareToIndexItems:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_261(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  __int16 v9;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_2;
  v6[3] = &unk_1E94A0CA0;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(_WORD *)(a1 + 48);
  objc_msgSend(v3, "performBlock:", v6);

}

void __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_3;
  v10[3] = &unk_1E94A0CC8;
  v9 = *(int8x16_t *)(a1 + 32);
  v11 = vextq_s8(v9, v9, 8uLL);
  objc_msgSend((id)v9.i64[0], "ef_compactMap:", v10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_identifiersStringForItems:maxLength:", v5, 150);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(unsigned __int8 *)(a1 + 48);
    v8 = *(unsigned __int8 *)(a1 + 49);
    *(_DWORD *)buf = 134218754;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    v16 = 1024;
    v17 = v7;
    v18 = 1024;
    v19 = v8;
    _os_log_debug_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEBUG, "%p prepared indexItems:%{public}@ fromRefresh:%{BOOL}d i:%{BOOL}d", buf, 0x22u);

  }
  objc_msgSend(*(id *)(a1 + 40), "_doIndexItems:fromRefresh:immediately:", v2, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  objc_msgSend(*(id *)(a1 + 40), "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didPrepareItems:", *(_QWORD *)(a1 + 32));

}

EDSearchableIndexPendingItem *__57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  EDSearchableIndexPendingItem *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preparingItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  if (v6)
  {
    v7 = -[EDSearchableIndexPendingItem initWithItem:]([EDSearchableIndexPendingItem alloc], "initWithItem:", v3);
  }
  else
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v3, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_3_cold_1(v9, v10, v12, v8);
    }

    v7 = 0;
  }

  return v7;
}

- (void)_doIndexItems:(id)a3 fromRefresh:(BOOL)a4 immediately:(BOOL)a5
{
  _BOOL4 v5;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  EFStoppableScheduler *preprocessingScheduler;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  EDSearchableIndexUpdates *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _BOOL4 v49;
  id v50;
  id v51;
  void *v52;
  id obj;
  _QWORD v54[4];
  NSObject *v55;
  EDSearchableIndex *v56;
  void *v57;
  BOOL v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  _BOOL4 v80;
  _BYTE v81[128];
  uint64_t v82;

  v5 = a5;
  v49 = a4;
  v82 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  -[EFAssertableScheduler assertIsExecuting:](self->_stateTransitionScheduler, "assertIsExecuting:", 1);
  -[EDSearchableIndex state](self, "state");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isActive") & 1) != 0)
  {

LABEL_4:
    if (v5)
    {
      -[EDSearchableIndex state](self, "state");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setIndexImmediately:", 1);

    }
    -[EDSearchableIndex state](self, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pendingItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44 = v12;
    v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    obj = v47;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v60 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
          objc_msgSend(v16, "identifier", v44);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[EDSearchableIndex state](self, "state");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "pendingIdentifierRemovals");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "identifiers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "containsObject:", v17);

          if (v21)
          {
            +[EDSearchableIndex log](EDSearchableIndex, "log");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v64 = (uint64_t)v17;
              _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, "Skipping index of %{public}@ identifier because it is present in self.state.pendingIdentifierRemovals", buf, 0xCu);
            }
LABEL_19:

          }
          else
          {
            -[EDSearchableIndex state](self, "state");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "indexItem:", v16);

            switch(v24)
            {
              case 0:
                objc_msgSend(v16, "items");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = (void *)objc_msgSend(v25, "copy");

                preprocessingScheduler = self->_preprocessingScheduler;
                v54[0] = MEMORY[0x1E0C809B0];
                v54[1] = 3221225472;
                v54[2] = __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke;
                v54[3] = &unk_1E94A0218;
                v22 = v26;
                v55 = v22;
                v56 = self;
                v57 = v16;
                v58 = v49;
                -[EFStoppableScheduler performBlock:](preprocessingScheduler, "performBlock:", v54);
                objc_msgSend(v16, "referenceItem");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addObject:", v28);

                goto LABEL_19;
              case 1:
                objc_msgSend(v16, "referenceItem");
                v22 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addObject:", v22);
                goto LABEL_19;
              case 2:
                objc_msgSend(v16, "referenceItem");
                v22 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "addObject:", v22);
                goto LABEL_19;
              case 3:
                objc_msgSend(v16, "referenceItem");
                v22 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "addObject:", v22);
                goto LABEL_19;
              default:
                break;
            }
          }

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v81, 16);
      }
      while (v13);
    }

    v29 = objc_msgSend(v50, "count");
    -[EDSearchableIndex state](self, "state");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "pendingItems");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    v33 = objc_msgSend(v51, "count");
    -[EDSearchableIndex _identifiersStringForItems:maxLength:](self, "_identifiersStringForItems:maxLength:", v50, 150);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndex _identifiersStringForItems:maxLength:](self, "_identifiersStringForItems:maxLength:", v48, 150);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndex _identifiersStringForItems:maxLength:](self, "_identifiersStringForItems:maxLength:", v51, 150);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "ef_compactMap:", &__block_literal_global_266);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[EDSearchableIndexUpdates initWithRemovedIdentifiers:]([EDSearchableIndexUpdates alloc], "initWithRemovedIdentifiers:", v34);
    -[EDSearchableIndex _dataSourceAssignTransaction:updates:completion:](self, "_dataSourceAssignTransaction:updates:completion:", -1, v35, 0);
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_msgSend(obj, "count");
      -[EDSearchableIndex state](self, "state");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "pendingItems");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "count");
      *(_DWORD *)buf = 134220034;
      v64 = v37;
      v65 = 2048;
      v66 = v29;
      v67 = 2114;
      v68 = v45;
      v69 = 2114;
      v70 = v46;
      v71 = 2048;
      v72 = v29 + v44 - v32;
      v73 = 2048;
      v74 = v33;
      v75 = 2114;
      v76 = v52;
      v77 = 2048;
      v78 = v40;
      v79 = 1024;
      v80 = v49;
      _os_log_impl(&dword_1D2F2C000, v36, OS_LOG_TYPE_DEFAULT, "Requested %lu items to be indexed (new: %lu %{public}@ existing: %{public}@ deferred: %lu preprocess: %lu %{public}@ pending: %lu) fromRefresh: %{BOOL}d", buf, 0x58u);

    }
    if (v29)
    {
      if (v49)
      {
        objc_msgSend(v50, "lastObject");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "dateReceived");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[EDSearchableIndex _queueConsumeBudgetItemCount:lastItemDateReceived:](self, "_queueConsumeBudgetItemCount:lastItemDateReceived:", v29, v42);

      }
      -[EDSearchableIndex _queueTransitionFromRefresh:](self, "_queueTransitionFromRefresh:", v49, v44);
    }

    goto LABEL_32;
  }
  v8 = _os_feature_enabled_impl();

  if ((v8 & 1) != 0)
    goto LABEL_4;
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v64 = objc_msgSend(v47, "count");
    _os_log_impl(&dword_1D2F2C000, v43, OS_LOG_TYPE_INFO, "Requested %lu items to be indexed while inactive", buf, 0xCu);
  }

  -[EDSearchableIndex _queueRefresh](self, "_queueRefresh");
LABEL_32:

}

void __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  void *v7;
  _QWORD v8[4];
  __int128 v9;
  uint64_t *v10;
  double v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  _QWORD v17[2];
  void (*v18)(uint64_t);
  void *v19;
  id v20;

  v2 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v18 = __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_2;
  v19 = &unk_1E949AEB8;
  v20 = *(id *)(a1 + 32);
  v3 = v17;
  v4 = mach_absolute_time();
  v18((uint64_t)v3);
  v5 = mach_absolute_time();
  if (EFGetElapsedTimeSinceAbsoluteTime_onceToken_1 != -1)
    dispatch_once(&EFGetElapsedTimeSinceAbsoluteTime_onceToken_1, &__block_literal_global_672);
  v6 = (double)((v5 - v4)
              * EFGetElapsedTimeSinceAbsoluteTime_sTimebaseInfo_1
              / *(unsigned int *)algn_1ED11C734)
     / 1000000000.0;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3;
  v8[3] = &unk_1E94A0CF0;
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
  v9 = *(_OWORD *)(a1 + 40);
  v12 = *(_BYTE *)(a1 + 56);
  v10 = &v13;
  v11 = v6;
  objc_msgSend(v7, "performSyncBlock:", v8);
  if (*((_BYTE *)v14 + 24))
    objc_msgSend(*(id *)(a1 + 40), "refresh");
  _Block_object_dispose(&v13, 8);

}

void __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v6 + 1) + 8 * i);
        if (objc_msgSend(v5, "requiresPreprocessing", (_QWORD)v6))
          objc_msgSend(v5, "preprocess");
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v2);
  }

}

uint64_t __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v13;
  uint8_t buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "didPreprocessItem:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "referenceItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "shouldIndexImmediatelyPostPreprocessing");

    }
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3_cold_1(v8, v4, buf, v7);
    }

    v9 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_doIndexItems:fromRefresh:immediately:", v5, *(unsigned __int8 *)(a1 + 64), v4);
  }
  else
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      objc_claimAutoreleasedReturnValue();
      __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3_cold_2();
    }
  }

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "queueContentsAllowsRefresh");

    if (v11)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  return objc_msgSend(*(id *)(a1 + 32), "_queueConsumeBudgetElapsedPeriod:", *(double *)(a1 + 56));
}

id __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_264(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "identifier");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)removeItemsWithIdentifiers:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EDSearchableIndex currentReasons](self, "currentReasons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex removeItemsWithIdentifiers:reasons:fromRefresh:](self, "removeItemsWithIdentifiers:reasons:fromRefresh:", v5, v4, 0);

}

- (void)removeItemsWithIdentifiers:(id)a3 reasons:(id)a4 fromRefresh:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  EFAssertableScheduler *stateTransitionScheduler;
  id v13;
  _QWORD v14[4];
  id v15;
  EDSearchableIndex *v16;
  id v17;
  BOOL v18;
  _QWORD aBlock[5];
  id v20;
  BOOL v21;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke;
    aBlock[3] = &unk_1E94A0D58;
    aBlock[4] = self;
    v21 = a5;
    v20 = v9;
    v11 = _Block_copy(aBlock);
    stateTransitionScheduler = self->_stateTransitionScheduler;
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_267;
    v14[3] = &unk_1E94A0D80;
    v17 = v11;
    v15 = v8;
    v16 = self;
    v18 = a5;
    v13 = v11;
    -[EFAssertableScheduler performBlock:](stateTransitionScheduler, "performBlock:", v14);

  }
}

void __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "assertIsExecuting:", 1);
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");
    if (v5 >= 0x96)
      v6 = 150;
    else
      v6 = v5;
    objc_msgSend(v4, "substringToIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(unsigned __int8 *)(a1 + 48);
      v11 = 138543618;
      v12 = v7;
      v13 = 1024;
      v14 = v9;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Removing identifiers:%{public}@ fromRefresh:%{BOOL}d", (uint8_t *)&v11, 0x12u);
    }

    objc_msgSend(*(id *)(a1 + 32), "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeIdentifiersFromPendingQueues:reasons:", v3, *(_QWORD *)(a1 + 40));

  }
}

void __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_267(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;
  char v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_2;
  v3[3] = &unk_1E94A0DA8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  v7 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v4, "_dataSourceScheduleWork:", v3);

}

void __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  char v11;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchableIndex:willRemoveIdentifiers:type:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
  objc_msgSend(v2, "childIdentifiersToRemoveFromSearchableIndex:whenRemovingParentIdentifiers:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v2, "searchableIndex:willRemoveIdentifiers:type:", *(_QWORD *)(a1 + 32), v3, 0);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_3;
  v7[3] = &unk_1E94A0D80;
  v10 = *(id *)(a1 + 48);
  v5 = v3;
  v11 = *(_BYTE *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "performBlock:", v7);

}

uint64_t __68__EDSearchableIndex_removeItemsWithIdentifiers_reasons_fromRefresh___block_invoke_3(uint64_t a1)
{
  _BOOL8 v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (*(_BYTE *)(a1 + 56))
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "state");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIndexImmediately:", 1);

    v2 = *(_BYTE *)(a1 + 56) != 0;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_queueTransitionFromRefresh:", v2);
}

- (void)removeItemsForDomainIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__EDSearchableIndex_removeItemsForDomainIdentifier___block_invoke;
  v6[3] = &unk_1E949B6D0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[EDSearchableIndex _dataSourceScheduleWork:](self, "_dataSourceScheduleWork:", v6);

}

void __52__EDSearchableIndex_removeItemsForDomainIdentifier___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *v2;
  v13[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchableIndex:willRemoveIdentifiers:type:", v4, v5, 1);

  v6 = *(void **)(a1 + 40);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__EDSearchableIndex_removeItemsForDomainIdentifier___block_invoke_2;
  v10[3] = &unk_1E949B6D0;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v7, "performBlock:", v10);

}

uint64_t __52__EDSearchableIndex_removeItemsForDomainIdentifier___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Removing all items for domain: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemsForDomainIdentifier:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "_queueTransitionFromRefresh:", 0);
}

- (void)test_resetSpotlightIndex
{
  dispatch_semaphore_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  NSObject *v10;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndex.m"), 2323, CFSTR("%s can only be called from unit tests"), "-[EDSearchableIndex test_resetSpotlightIndex]");

  }
  v4 = dispatch_semaphore_create(0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__EDSearchableIndex_test_resetSpotlightIndex__block_invoke;
  v9[3] = &unk_1E949AEB8;
  v5 = v4;
  v10 = v5;
  -[EDSearchableIndex resetIndexForNewLibraryWithCompletionHandler:](self, "resetIndexForNewLibraryWithCompletionHandler:", v9);
  while (dispatch_semaphore_wait(v5, 0x64uLL))
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.01);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runUntilDate:", v7);

  }
}

intptr_t __45__EDSearchableIndex_test_resetSpotlightIndex__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)removeMessages:(id)a3
{
  id v4;

  objc_msgSend(a3, "ef_mapSelector:", sel_persistentID);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndex removeItemsWithIdentifiers:](self, "removeItemsWithIdentifiers:");

}

- (void)indexAttachmentsForMessageWithIdentifier:(id)a3 immediately:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[EDSearchableIndex log](EDSearchableIndex, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Preparing to index attachment from message %@ immediately %@", (uint8_t *)&v12, 0x16u);

  }
  -[EDSearchableIndex dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "searchableIndex:prepareToIndexAttachmentsForMessageWithIdentifier:", self, v6);

  if (v4)
  {
    -[EDSearchableIndex dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchableIndex:attachmentItemsForMessageWithIdentifier:", self, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDSearchableIndex indexItems:](self, "indexItems:", v11);
  }
  else
  {
    -[EDSearchableIndex refresh](self, "refresh");
  }

}

- (void)_processAttachmentItemsForSuggestionsService:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  -[EDSearchableIndex _suggestionsService](self, "_suggestionsService");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend(v28, "firstObject");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      v4 = objc_opt_new();
      v5 = (void *)objc_opt_new();
      v6 = (void *)objc_opt_new();
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      obj = v28;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v31 != v8)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "attributeSet", v26);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "contentType");
            v11 = objc_claimAutoreleasedReturnValue();
            v12 = (void *)v11;
            if (v11)
              v13 = (const __CFString *)v11;
            else
              v13 = &stru_1E94A4508;
            -[NSObject addObject:](v4, "addObject:", v13);

            objc_msgSend(v10, "displayName");
            v14 = objc_claimAutoreleasedReturnValue();
            v15 = (void *)v14;
            if (v14)
              v16 = (const __CFString *)v14;
            else
              v16 = &stru_1E94A4508;
            objc_msgSend(v5, "addObject:", v16);

            objc_msgSend(v10, "contentURL");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "path");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            if (v18)
              v20 = (const __CFString *)v18;
            else
              v20 = &stru_1E94A4508;
            objc_msgSend(v6, "addObject:", v20);

          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        }
        while (v7);
      }

      -[NSObject attributeSet](v26, "attributeSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setAttachmentTypes:", v4);
      objc_msgSend(v21, "setAttachmentNames:", v5);
      objc_msgSend(v21, "setAttachmentPaths:", v6);
      +[EDSearchableIndex log](EDSearchableIndex, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = obj;
        _os_log_impl(&dword_1D2F2C000, v22, OS_LOG_TYPE_DEFAULT, "Processing attachment items %@ with suggestions service", buf, 0xCu);
      }

      objc_msgSend(v27, "dissectAttachmentsFromSearchableItem:options:withCompletion:", v26, 3, &__block_literal_global_274);
    }
    else
    {
      +[EDSearchableIndex log](EDSearchableIndex, "log");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        -[EDSearchableIndex _processAttachmentItemsForSuggestionsService:].cold.2(v4, v24, v25);
    }

    v23 = v26;
  }
  else
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[EDSearchableIndex _processAttachmentItemsForSuggestionsService:].cold.1();
  }

}

void __66__EDSearchableIndex__processAttachmentItemsForSuggestionsService___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;

  v3 = a3;
  if (v3)
  {
    +[EDSearchableIndex log](EDSearchableIndex, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __66__EDSearchableIndex__processAttachmentItemsForSuggestionsService___block_invoke_cold_1();
    }

  }
}

- (id)_suggestionsService
{
  if (_suggestionsService_onceToken != -1)
    dispatch_once(&_suggestionsService_onceToken, &__block_literal_global_275);
  return (id)_suggestionsService_suggestionsInstance;
}

uint64_t __40__EDSearchableIndex__suggestionsService__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D19970], "serviceForMail");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_suggestionsService_suggestionsInstance;
  _suggestionsService_suggestionsInstance = v0;

  return objc_msgSend((id)_suggestionsService_suggestionsInstance, "setSyncTimeout:", 1.0);
}

- (void)indexMessages:(id)a3 includeBody:(BOOL)a4 indexingType:(int64_t)a5
{
  id v7;

  v7 = a3;
  -[EDSearchableIndex doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndex indexMessages:includeBody:indexingType:]", "EDSearchableIndex.m", 2407, "0");
}

- (void)markMessagesAsPrinted:(id)a3
{
  id v5;

  v5 = a3;
  -[EDSearchableIndex doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndex markMessagesAsPrinted:]", "EDSearchableIndex.m", 2411, "0");
}

- (EFObservable)powerObservable
{
  return 0;
}

- (BOOL)isPluggedIn
{
  return 1;
}

- (void)attachmentBecameAvailable:(id)a3
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "object");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v8 = (void *)v4;
    v6 = objc_opt_respondsToSelector();
    v5 = v8;
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v8, "persistentID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        -[EDSearchableIndex indexAttachmentsForMessageWithIdentifier:immediately:](self, "indexAttachmentsForMessageWithIdentifier:immediately:", v7, 1);

      v5 = v8;
    }
  }

}

- (void)richLinkBecameAvailable:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  +[EDSearchableIndex log](EDSearchableIndex, "log", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Rich link data became available, starting a data source refresh", v5, 2u);
  }

  -[EDSearchableIndex refresh](self, "refresh");
}

- (BOOL)canIndexAttachments
{
  return 1;
}

- (NSSet)dataSourceRefreshReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("MonitoredActivityReasonCompacting"));
}

- (NSSet)currentReasons
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("MonitoredActivityReasonCompacting"));
}

- (void)test_tearDown
{
  void *v4;

  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndex.m"), 2485, CFSTR("%s can only be called from unit tests"), "-[EDSearchableIndex test_tearDown]");

  }
  -[EFStoppableScheduler stopAndWait](self->_dataSourceScheduler, "stopAndWait");
  if (-[EDSearchableIndex isActive](self, "isActive"))
    -[EFSuspendableScheduler stopAndWait](self->_indexingScheduler, "stopAndWait");
  -[EFStoppableScheduler stopAndWait](self->_addIndexItemsScheduler, "stopAndWait");
  -[EFStoppableScheduler stopAndWait](self->_preprocessingScheduler, "stopAndWait");
  -[EFStoppableScheduler stopAndWait](self->_indexingBatchScheduler, "stopAndWait");
  -[EFAssertableScheduler stopAndWait](self->_stateTransitionScheduler, "stopAndWait");
}

- (BOOL)isDataSourceIndexingPermitted
{
  return self->_dataSourceIndexingPermitted;
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void)setSearchIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchIndex, a3);
}

- (EDSearchableIndexState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (BOOL)skipIndexExclusionCheck
{
  return self->_skipIndexExclusionCheck;
}

- (void)setSkipIndexExclusionCheck:(BOOL)a3
{
  self->_skipIndexExclusionCheck = a3;
}

- (BOOL)enableSpotlightVerification
{
  return self->_enableSpotlightVerification;
}

- (void)setEnableSpotlightVerification:(BOOL)a3
{
  self->_enableSpotlightVerification = a3;
}

- (double)coalescingDelaySeconds
{
  return self->_coalescingDelaySeconds;
}

- (void)setCoalescingDelaySeconds:(double)a3
{
  self->_coalescingDelaySeconds = a3;
}

- (void)setDataSourceUpdateTimeLimit:(double)a3
{
  self->_dataSourceUpdateTimeLimit = a3;
}

- (EFFuture)delayDataSourceAssignmentFuture
{
  return self->_delayDataSourceAssignmentFuture;
}

- (void)setDelayDataSourceAssignmentFuture:(id)a3
{
  objc_storeStrong((id *)&self->_delayDataSourceAssignmentFuture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayDataSourceAssignmentFuture, 0);
  objc_storeStrong((id *)&self->_searchableIndexBundleID, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_destroyWeak((id *)&self->_schedulableDelegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_lastReindexRadarPrompt, 0);
  objc_storeStrong((id *)&self->_indexingBatchScheduler, 0);
  objc_storeStrong((id *)&self->_preprocessingScheduler, 0);
  objc_storeStrong((id *)&self->_addIndexItemsScheduler, 0);
  objc_storeStrong((id *)&self->_dataSourceScheduler, 0);
  objc_storeStrong((id *)&self->_indexingScheduler, 0);
  objc_storeStrong((id *)&self->_batchIndexingActivity, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_stateTransitionScheduler, 0);
  objc_storeStrong((id *)&self->_stateCancelable, 0);
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_indexName, 0);
}

void __81__EDSearchableIndex__scheduleSpotlightVerificationOnIndexingQueueWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_10_0(&dword_1D2F2C000, v0, v1, "Spotlight index and Mail database are out of sync, items may be missing or duplicated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_handleFailingTransactionIDs:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2114;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Removing corrupt indexes for %lu transactions: %{public}@", (uint8_t *)a2, a4);
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_11(a1, a2, 5.778e-34);
  *(_WORD *)(v2 + 12) = 2048;
  *(_QWORD *)(v2 + 14) = v3;
  OUTLINED_FUNCTION_0_0(&dword_1D2F2C000, "Received corrupted client state: %@, transaction: %lld, will cause full re-index.", v4, v5);
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, a2, a3, "CoreSpotlight failed to return our client state (old state: %@)", (uint8_t *)&v3);
}

void __42__EDSearchableIndex__fetchLastClientState__block_invoke_cold_3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, v3, (uint64_t)v3, "failed to retrieve last client state: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __84__EDSearchableIndex__dataSourceRequestNeededUpdatesExcludingIdentifiers_completion___block_invoke_203_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_10_0(&dword_1D2F2C000, v0, v1, "Data source updates took too long to return results. Canceling.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_queueTransitionFromRefresh:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Unable to index while locked without client state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_scheduleProcessPendingItemsFromRefresh:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_7(&dword_1D2F2C000, v0, v1, "scheduling processing of pending items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processIndexingBatch:clientState:itemsNotIndexed:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "generating searchable items failed: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __71__EDSearchableIndex__processIndexingBatch_clientState_itemsNotIndexed___block_invoke_248_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "indexing searchable items failed: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)searchableIndex:reindexAllSearchableItemsWithAcknowledgementHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Spotlight requested that Mail reindex all items", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __66__EDSearchableIndex_resetIndexForNewLibraryWithCompletionHandler___block_invoke_260_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, v3, (uint64_t)v3, "failed to delete all items from domain: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)indexItems:fromRefresh:immediately:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "WARNING: Skipping indexing, indexing is disabled. This is intended for testing purposes only.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_indexItems:fromRefresh:immediately:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_6_0(&dword_1D2F2C000, v3, (uint64_t)v3, "Index items usage issue - indexing identifiers(s) %{public}@ that were removed", v4);

  OUTLINED_FUNCTION_2_0();
}

void __57__EDSearchableIndex__indexItems_fromRefresh_immediately___block_invoke_3_cold_1(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "%p dropped item: %{public}@", buf, 0x16u);

  OUTLINED_FUNCTION_2_0();
}

void __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3_cold_1(void *a1, char a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2 & 1;
  _os_log_debug_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_DEBUG, "Finished processing item %{public}@ immediately: %{BOOL}d", buf, 0x12u);

  OUTLINED_FUNCTION_2_0();
}

void __59__EDSearchableIndex__doIndexItems_fromRefresh_immediately___block_invoke_3_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  _os_log_debug_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_DEBUG, "Skipped processing item - no longer in preprocessingItems %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

- (void)_processAttachmentItemsForSuggestionsService:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0(&dword_1D2F2C000, v0, v1, "Unable to connect to suggestions service mail protocol", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_processAttachmentItemsForSuggestionsService:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a1, a3, "Nil searchableItem for item: %@", (uint8_t *)&v3);
}

void __66__EDSearchableIndex__processAttachmentItemsForSuggestionsService___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, v3, (uint64_t)v3, "Unable to process the attachment items %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

@end
