@implementation CADSpotlightIndexer

- (CADSpotlightIndexer)initWithSpotlightEntityAnnotator:(id)a3
{
  id v4;
  CADCoreSpotlightIndexProvider *v5;
  void *v6;
  CADSpotlightIndexer *v7;

  v4 = a3;
  v5 = objc_alloc_init(CADCoreSpotlightIndexProvider);
  objc_msgSend(MEMORY[0x1E0D0C2C8], "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CADSpotlightIndexer initWithDatabaseConfiguration:spotlightIndexProvider:spotlightDefaults:spotlightEntityAnnotator:](self, "initWithDatabaseConfiguration:spotlightIndexProvider:spotlightDefaults:spotlightEntityAnnotator:", 0, v5, v6, v4);

  return v7;
}

- (CADSpotlightIndexer)initWithDatabaseConfiguration:(id)a3 spotlightIndexProvider:(id)a4 spotlightDefaults:(id)a5 spotlightEntityAnnotator:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CADSpotlightIndexer *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  id v19;
  OS_dispatch_queue *v20;
  uint64_t v21;
  CalAccumulatingQueue *incrementalUpdateQueue;
  CalCancellationTokenSource *v23;
  CalCancellationTokenSource *cancellationTokenSource;
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)CADSpotlightIndexer;
  v15 = -[CADSpotlightIndexer init](&v30, sel_init);
  if (v15)
  {
    v26 = v11;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("spotlightIndexingQueue", v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    objc_initWeak(&location, v15);
    v19 = objc_alloc(MEMORY[0x1E0D0C250]);
    v20 = v15->_queue;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __119__CADSpotlightIndexer_initWithDatabaseConfiguration_spotlightIndexProvider_spotlightDefaults_spotlightEntityAnnotator___block_invoke;
    v27[3] = &unk_1E6A37380;
    objc_copyWeak(&v28, &location);
    v21 = objc_msgSend(v19, "initWithQueue:andBlock:", v20, v27);
    incrementalUpdateQueue = v15->_incrementalUpdateQueue;
    v15->_incrementalUpdateQueue = (CalAccumulatingQueue *)v21;

    objc_storeStrong((id *)&v15->_databaseConfiguration, a3);
    objc_storeStrong((id *)&v15->_spotlightIndexProvider, a4);
    objc_storeStrong((id *)&v15->_spotlightDefaults, a5);
    objc_storeStrong((id *)&v15->_spotlightEntityAnnotator, a6);
    v23 = (CalCancellationTokenSource *)objc_alloc_init(MEMORY[0x1E0D0C268]);
    cancellationTokenSource = v15->_cancellationTokenSource;
    v15->_cancellationTokenSource = v23;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    v11 = v26;
  }

  return v15;
}

void __119__CADSpotlightIndexer_initWithDatabaseConfiguration_spotlightIndexProvider_spotlightDefaults_spotlightEntityAnnotator___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_incrementalUpdate");
    WeakRetained = v2;
  }

}

- (void)cancelOngoingWorkAndShutdown
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v0, v1, "Returning because indexer was shutdown", v2);
  OUTLINED_FUNCTION_1();
}

+ (__CFSet)_entityTypesThatAffectSpotlightIndexing
{
  if (_entityTypesThatAffectSpotlightIndexing_onceToken != -1)
    dispatch_once(&_entityTypesThatAffectSpotlightIndexing_onceToken, &__block_literal_global_11);
  return (__CFSet *)_entityTypesThatAffectSpotlightIndexing_entityTypes;
}

void __62__CADSpotlightIndexer__entityTypesThatAffectSpotlightIndexing__block_invoke()
{
  _entityTypesThatAffectSpotlightIndexing_entityTypes = (uint64_t)CFSetCreateMutable(0, 5, 0);
  CFSetAddValue((CFMutableSetRef)_entityTypesThatAffectSpotlightIndexing_entityTypes, (const void *)0x1A);
  CFSetAddValue((CFMutableSetRef)_entityTypesThatAffectSpotlightIndexing_entityTypes, (const void *)6);
  CFSetAddValue((CFMutableSetRef)_entityTypesThatAffectSpotlightIndexing_entityTypes, (const void *)1);
  CFSetAddValue((CFMutableSetRef)_entityTypesThatAffectSpotlightIndexing_entityTypes, (const void *)2);
  CFSetAddValue((CFMutableSetRef)_entityTypesThatAffectSpotlightIndexing_entityTypes, (const void *)5);
}

- (void)waitUntilIdle
{
  void *v3;
  NSObject *queue;
  id v5;
  _QWORD block[4];
  id v7;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CADSpotlightIndexer_waitUntilIdle__block_invoke;
  block[3] = &unk_1E6A373A8;
  v7 = v3;
  v5 = v3;
  dispatch_sync(queue, block);

}

- (void)_enumerateDatabases:(id)a3
{
  if (self->_databaseConfiguration)
    CalDatabaseEnumerateDatabasesWithConfiguration();
  else
    CalDatabaseEnumerateDatabases();
}

- (void)_incrementalUpdate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__CADSpotlightIndexer__incrementalUpdate__block_invoke;
  v2[3] = &unk_1E6A373D0;
  v2[4] = self;
  -[CADSpotlightIndexer _enumerateDatabases:](self, "_enumerateDatabases:", v2);
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  NSObject *v8;
  uint64_t ChangedEKObjectsForClient;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  char v25;
  const __CFString *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void **v30;
  uint64_t v31;
  void *context;
  char v35;
  char v36[15];
  char v37;
  char v38[15];
  char v39;
  char v40[15];
  id v41;
  id v42;
  void *v43;
  char v44;
  int v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  int v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCC9D714]();
  while (1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "token", v30);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isCancelled");

    v8 = CADSpotlightHandle;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
        -[CADSpotlightIndexer cancelOngoingWorkAndShutdown].cold.1();
      v26 = CFSTR("returning because indexer was shutdown");
      goto LABEL_39;
    }
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v47 = a2;
      _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_DEFAULT, "Fetching changes for database %@", buf, 0xCu);
    }
    v45 = 0;
    v44 = 0;
    v43 = 0;
    objc_msgSend((id)objc_opt_class(), "_entityTypesThatAffectSpotlightIndexing");
    v30 = &v43;
    ChangedEKObjectsForClient = CalDatabaseGetChangedEKObjectsForClient();
    if (ChangedEKObjectsForClient == -1)
    {
      v27 = CADSpotlightHandle;
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
        __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_2(v27, v28, v29);
      v31 = -1;
      v26 = CFSTR("error fetching changes: %ld");
LABEL_39:
      +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", v26, v31);
      goto LABEL_43;
    }
    if (v44)
      break;
    v10 = ChangedEKObjectsForClient;
    v11 = v43;
    v12 = (void *)CADSpotlightHandle;
    v13 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
    if (v10 == 1)
    {
      if (!v13)
        goto LABEL_13;
      v14 = v12;
      v18 = objc_msgSend(v11, "count", &v43);
      *(_DWORD *)buf = 134218498;
      v47 = v18;
      v48 = 1024;
      v49 = v45;
      v50 = 2112;
      v51 = a2;
      v16 = v14;
      v17 = "Processing a partial batch of %lu changes (through %i) for %@";
    }
    else
    {
      if (!v13)
        goto LABEL_13;
      v14 = v12;
      v15 = objc_msgSend(v11, "count", &v43);
      *(_DWORD *)buf = 134218498;
      v47 = v15;
      v48 = 1024;
      v49 = v45;
      v50 = 2112;
      v51 = a2;
      v16 = v14;
      v17 = "Processing all remaining %lu changes (through %i) for %@";
    }
    _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0x1Cu);

LABEL_13:
    objc_msgSend((id)objc_opt_class(), "_personaID:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = *(void **)(a1 + 32);
      v41 = 0;
      v42 = 0;
      objc_msgSend(v20, "_upsertsAndDeletesFromChanges:inDatabase:personaID:outUpserts:outDeletes:", v11, a2, v19, &v42, &v41);
      v21 = v42;
      v22 = v41;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "token");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isCancelled");

      if (v24)
      {
        if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
          __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_3(&v39, v40);
        +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("returning because indexer was shutdown"), v30);

        v25 = 0;
        goto LABEL_21;
      }
      if (objc_msgSend(*(id *)(a1 + 32), "_deleteFromIndex:", v22))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "_upsertToIndex:inDatabase:personaID:deleteBeforeInserting:", v21, a2, v19, 1))
        {
          CalDatabaseClearChangedObjectIDsUpToSequenceNumberForClient();
        }
        else if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
        {
          __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_4(&v37, v38);
        }
      }
      else if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      {
        __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_5(&v35, v36);
      }

      if (v10 == 1)
LABEL_19:
        objc_msgSend(*(id *)(a1 + 32), "_resetDatabase:", a2, v30);
    }
    else if (v10 == 1)
    {
      goto LABEL_19;
    }
    v25 = 1;
LABEL_21:

    if (v10 != 1 || (v25 & 1) == 0)
      goto LABEL_43;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
    __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_6();
  objc_msgSend(*(id *)(a1 + 32), "_fullReindexWithReason:", 1, &v43);
  *a4 = 1;
LABEL_43:
  objc_autoreleasePoolPop(context);
}

- (void)indexUnconsumedChanges
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[CalCancellationTokenSource token](self->_cancellationTokenSource, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCancelled");

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      -[CADSpotlightIndexer cancelOngoingWorkAndShutdown].cold.1();
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("returning because indexer was shutdown"));
  }
  else
  {
    v7 = CFSTR("incrementalUpdateTransactionKey");
    v5 = (void *)os_transaction_create();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CalAccumulatingQueue updateTagsAndExecuteBlock:withContext:](self->_incrementalUpdateQueue, "updateTagsAndExecuteBlock:withContext:", 0, v6);
  }
}

- (void)_fullReindexIfAllowedWithTransaction:(id)a3 reason:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CADSpotlightIndexer__fullReindexIfAllowedWithTransaction_reason___block_invoke;
  block[3] = &unk_1E6A373F8;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __67__CADSpotlightIndexer__fullReindexIfAllowedWithTransaction_reason___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_mostRecentFailure");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "_fullReindexWithReason:", *(_QWORD *)(a1 + 48));
    goto LABEL_9;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "_mostRecentFailureWithinADayOfNow:", v2);
  v4 = CADSpotlightHandle;
  v5 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
  if ((v3 & 1) == 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEFAULT, "1 day since last failure, reindex needed", buf, 2u);
    }
    goto LABEL_8;
  }
  if (v5)
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEFAULT, "reindex aborted, less than one day since last failure", v6, 2u);
  }
  +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("reindex aborted, less than one day since last failure"));
LABEL_9:

}

- (void)checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded
{
  void *v3;
  int v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  -[CalCancellationTokenSource token](self->_cancellationTokenSource, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCancelled");

  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      -[CADSpotlightIndexer cancelOngoingWorkAndShutdown].cold.1();
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("returning because indexer was shutdown"));
  }
  else
  {
    v5 = (void *)os_transaction_create();
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __86__CADSpotlightIndexer_checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded__block_invoke;
    v8[3] = &unk_1E6A37420;
    v8[4] = self;
    v9 = v5;
    v7 = v5;
    dispatch_async(queue, v8);

  }
}

void __86__CADSpotlightIndexer_checkForAndReportPastSpotlightMigrationErrorsAndReindexIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", CFSTR("kCalDBLastSpotLightIndexVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", CFSTR("LastABCReport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_mostRecentFailure");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "_mostRecentFailureWithinADayOfNow:", v4);
    v6 = CADSpotlightHandle;
    v7 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
    if ((v5 & 1) != 0)
    {
      if (v7)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_DEFAULT, "****** [Spotlight indexing] reindex aborted, less than one day since last failure", (uint8_t *)&v15, 2u);
      }
      +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("reindex aborted, less than one day since last failure"));
      if (v3)
        goto LABEL_17;
    }
    else
    {
      if (v7)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_DEFAULT, "****** [Spotlight indexing] 1 day since last failure, reindex needed", (uint8_t *)&v15, 2u);
      }
      if (v3)
        goto LABEL_15;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C230]), "initWithType:subtype:context:", CFSTR("Database"), CFSTR("Spotlight"), CFSTR("IndexFailure"));
    objc_msgSend(v12, "report");
    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("LastABCReport"));

    if ((v5 & 1) == 0)
    {
LABEL_15:
      v11 = 2;
LABEL_16:
      objc_msgSend(*(id *)(a1 + 32), "_fullReindexWithReason:", v11);
    }
  }
  else
  {
    v8 = objc_msgSend(v2, "intValue");
    v9 = CADSpotlightHandle;
    v10 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
    if (v8 <= 22)
    {
      if (v10)
      {
        v15 = 138412290;
        v16 = v2;
        _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_DEFAULT, "****** [Spotlight indexing] reindex needed, last version was %@", (uint8_t *)&v15, 0xCu);
      }
      v11 = 3;
      goto LABEL_16;
    }
    if (v10)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_DEFAULT, "****** [Spotlight indexing] spotlight index is current", (uint8_t *)&v15, 2u);
    }
  }
LABEL_17:

}

- (id)_mostRecentFailure
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  id v8;
  id v9;

  -[CADSpotlightDefaults objectForKey:](self->_spotlightDefaults, "objectForKey:", CFSTR("CalDBSpotLightError"));
  v3 = objc_claimAutoreleasedReturnValue();
  -[CADSpotlightDefaults objectForKey:](self->_spotlightDefaults, "objectForKey:", CFSTR("LastUnfinishedSpotlightReindex"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 | v4)
  {
    if (v3)
      v6 = v4 == 0;
    else
      v6 = 0;
    if (v6)
    {
      v8 = (id)v3;
    }
    else
    {
      if (v3)
        v7 = 1;
      else
        v7 = v4 == 0;
      if (v7)
      {
        objc_msgSend((id)v3, "laterDate:", v4);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = (id)v4;
      }
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (BOOL)_mostRecentFailureWithinADayOfNow:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  return v7 <= 86400.0;
}

- (void)_fullReindexWithReason:(unint64_t)a3
{
  void *v5;
  int v6;
  CADSpotlightDefaults *spotlightDefaults;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  dispatch_semaphore_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  void *v23;
  int v24;
  CADSpotlightDefaults *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint8_t v29[16];
  _QWORD v30[6];
  _QWORD v31[4];
  id v32;
  id v33;
  NSObject *v34;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v37;
  char v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[CalCancellationTokenSource token](self->_cancellationTokenSource, "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCancelled");

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      -[CADSpotlightIndexer cancelOngoingWorkAndShutdown].cold.1();
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("returning because indexer was shutdown"));
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    -[CADSpotlightDefaults setObject:forKey:](self->_spotlightDefaults, "setObject:forKey:", 0, CFSTR("CalDBSpotLightError"));
    spotlightDefaults = self->_spotlightDefaults;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADSpotlightDefaults setObject:forKey:](spotlightDefaults, "setObject:forKey:", v8, CFSTR("LastUnfinishedSpotlightReindex"));

    v9 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      v11 = v9;
      objc_msgSend(v10, "numberWithUnsignedInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1B6A18000, v11, OS_LOG_TYPE_DEFAULT, "Beginning spotlight re-index for all databases: %@", (uint8_t *)&buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("started _fullReindexWithReason: %@"), v13);

    v14 = (id)*MEMORY[0x1E0D0C520];
    v15 = (void *)-[CADSpotlightIndexProvider newSpotlightIndexForBundleID:](self->_spotlightIndexProvider, "newSpotlightIndexForBundleID:", v14);
    v16 = dispatch_semaphore_create(0);
    v17 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B6A18000, v17, OS_LOG_TYPE_DEFAULT, "Deleting events for database during full re-index", (uint8_t *)&buf, 2u);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v37 = 0x2020000000;
    v38 = 1;
    v18 = (void *)objc_opt_class();
    v19 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke;
    v31[3] = &unk_1E6A37470;
    v20 = v15;
    v32 = v20;
    v21 = v14;
    v33 = v21;
    p_buf = &buf;
    v22 = v16;
    v34 = v22;
    objc_msgSend(v18, "_executeWithNumRetriesOnFailure:block:", 1, v31);
    -[CalCancellationTokenSource token](self->_cancellationTokenSource, "token");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isCancelled");

    if (v24)
    {
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
        -[CADSpotlightIndexer cancelOngoingWorkAndShutdown].cold.1();
      +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("returning because indexer was shutdown"));
    }
    else
    {
      if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24)
        || (v30[0] = v19,
            v30[1] = 3221225472,
            v30[2] = __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_48,
            v30[3] = &unk_1E6A374C0,
            v30[4] = self,
            v30[5] = &buf,
            -[CADSpotlightIndexer _enumerateDatabases:](self, "_enumerateDatabases:", v30),
            !*(_BYTE *)(*((_QWORD *)&buf + 1) + 24)))
      {
        +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("error while attemping full reindex, writing error pref"));
        v25 = self->_spotlightDefaults;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[CADSpotlightDefaults setObject:forKey:](v25, "setObject:forKey:", v26, CFSTR("CalDBSpotLightError"));

      }
      -[CADSpotlightDefaults setObject:forKey:](self->_spotlightDefaults, "setObject:forKey:", 0, CFSTR("LastUnfinishedSpotlightReindex"));
      -[CADSpotlightDefaults setObject:forKey:](self->_spotlightDefaults, "setObject:forKey:", 0, CFSTR("LastABCReport"));
      -[CADSpotlightDefaults setObject:forKey:](self->_spotlightDefaults, "setObject:forKey:", &unk_1E6A50648, CFSTR("kCalDBLastSpotLightIndexVersion"));
      v27 = CADSpotlightHandle;
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1B6A18000, v27, OS_LOG_TYPE_DEFAULT, "Finished spotlight re-index for all databases", v29, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("finished _fullReindexWithReason: %@"), v28);

    }
    _Block_object_dispose(&buf, 8);

  }
}

uint64_t __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke(uint64_t a1, char a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  CFRetain(*(CFTypeRef *)(a1 + 32));
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2;
  v9[3] = &unk_1E6A37448;
  v13 = a2;
  v6 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v10 = v6;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v4, "deleteAllSearchableItemsForBundleID:completionHandler:", v5, v9);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 48), 0xFFFFFFFFFFFFFFFFLL);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

  return v7;
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL4 v5;
  const __CFString *v6;
  NSObject *v7;
  uint8_t buf[16];

  v3 = a2;
  if (v3)
  {
    v4 = *(unsigned __int8 *)(a1 + 56);
    v5 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v5)
        __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_cold_2();
      v6 = CFSTR("error deleting searchable items for calendar: %@. Retrying...");
    }
    else
    {
      if (v5)
        __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_cold_1();
      v6 = CFSTR("error deleting searchable items for calendar: %@");
    }
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", v6, v3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v7 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_DEFAULT, "Deleted events for database during full re-index, beginning index", buf, 2u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 40));

}

uint64_t __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  _QWORD v8[4];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v6 = (void *)objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_49;
  v8[3] = &unk_1E6A37498;
  v10 = a2;
  v11 = a3;
  v9 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(v6, "_executeWithNumRetriesOnFailure:block:", 1, v8);
}

uint64_t __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_49(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CalRemoveClientForPersistentChangeTracking();
  CalDatabaseRegisterClientForPersistentChangeTracking();
  CalDatabaseCopyCalendarItemUUIDs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_DEFAULT, "Indexing %lu events in this database as part of full-reindex", buf, 0xCu);

  }
  +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("Indexing %lu events in this database as part of reindex"), objc_msgSend(v4, "count"));
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_personaID:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_pushBatchedUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:", v4, *(_QWORD *)(a1 + 48), v7, 0);
    v8 = (void *)CADSpotlightHandle;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = objc_msgSend(v4, "count");
        *(_DWORD *)buf = 134217984;
        v15 = v10;
        _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_DEFAULT, "Finished indexing %lu events in this database as part of a full-reindex", buf, 0xCu);

      }
      +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("Finished indexing %lu events in this database as part of a full-reindex"), objc_msgSend(v4, "count"));
    }
    else
    {
      v11 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR);
      if (a2)
      {
        if (v11)
          __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_49_cold_1(v8);
        +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("error indexing %lu events in this database as part of a full-reindex, retrying..."), objc_msgSend(v4, "count"));
      }
      else
      {
        if (v11)
          __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_49_cold_2(v8);
        +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("error indexing %lu events in this database as part of a full-reindex, out of retries"), objc_msgSend(v4, "count"));
      }
    }

  }
  v12 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  return v12;
}

+ (void)_executeWithNumRetriesOnFailure:(int64_t)a3 block:(id)a4
{
  do
  {
    if (((*((uint64_t (**)(id, BOOL))a4 + 2))(a4, a3 > 0) & 1) != 0)
      break;
  }
  while (a3-- > 0);
}

+ (id)_personaID:(void *)a3
{
  __CFString *v3;
  __CFString *v4;

  if (!a3)
  {
    v3 = CFSTR("CalMainDatabasePersona");
    goto LABEL_7;
  }
  v3 = (__CFString *)CalAuxDatabaseCopyPersonaID();
  if (-[__CFString length](v3, "length"))
  {
LABEL_7:
    v3 = v3;
    v4 = v3;
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
    +[CADSpotlightIndexer _personaID:].cold.1();
  v4 = 0;
LABEL_8:

  return v4;
}

- (void)_upsertsAndDeletesFromChanges:(id)a3 inDatabase:(CalDatabase *)a4 personaID:(id)a5 outUpserts:(id *)a6 outDeletes:(id *)a7
{
  id v10;
  id v11;
  CFIndex v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  const void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  CalDatabase *v37;
  uint64_t v38;
  void *v39;
  const void *v40;
  const void *v41;
  void *v42;
  const void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v50;
  __CFSet *theSet;
  CalDatabase *v52;
  id v53;
  void *v54;
  id obj;
  void *v56;
  char v57;
  _BYTE v58[15];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint8_t buf[4];
  int v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v53 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "count");
  theSet = CFSetCreateMutable(0, v12, MEMORY[0x1E0C9B3B0]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v10;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v60;
    v56 = (void *)*MEMORY[0x1E0D0C520];
    v52 = a4;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v60 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v16);
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("record"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("type"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "integerValue");

          v21 = objc_msgSend(v18, "entityType");
          v22 = v56;
          switch(v21)
          {
            case 1:
              if (v20 == 2)
              {
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("UUID"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("store_id"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "intValue");

                v25 = CalDatabaseCopyStoreWithUID();
                if (v25)
                {
                  v26 = (const void *)v25;
                  v27 = (void *)CalStoreCopyUUID();
                  if (v27 && v23)
                  {
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@.%@"), v22, v11, v27, v23);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v53, "addObject:", v28);

                    a4 = v52;
                  }
                  CFRelease(v26);

                }
                goto LABEL_29;
              }
              goto LABEL_44;
            case 2:
              if (v20 != 2)
              {
                v38 = objc_msgSend(v18, "entityID");
                v37 = a4;
                goto LABEL_31;
              }
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("UUID"));
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("calendar_id"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "intValue");

              v33 = (const void *)CalDatabaseCopyCalendarWithUID();
              if (v33)
                v34 = (void *)CalCalendarCopyUUID();
              else
                v34 = 0;
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("store_id"));
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "intValue");

              v43 = (const void *)CalDatabaseCopyStoreWithUID();
              if (v43)
              {
                v44 = (void *)CalStoreCopyUUID();
                if (v44 && v34 && v54)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@.%@.%@"), v22, v11, v44, v34, v54);
                  v50 = v11;
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "addObject:", v45);

                  v11 = v50;
                }
                if (v33)
LABEL_40:
                  CFRelease(v33);
              }
              else
              {
                v44 = 0;
                if (v33)
                  goto LABEL_40;
              }
              if (v43)
                CFRelease(v43);

              a4 = v52;
LABEL_44:

              break;
            case 3:
            case 4:
              goto LABEL_20;
            case 5:
              if (v20 != 2)
              {
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("event_id_tomb"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = objc_msgSend(v35, "intValue");

                v37 = a4;
                v38 = v36;
LABEL_31:
                v40 = (const void *)MEMORY[0x1BCC9BEF0](v37, v38);
                if (v40)
                {
                  v41 = v40;
                  CFSetAddValue(theSet, v40);
                  CFRelease(v41);
                }
              }
              goto LABEL_44;
            case 6:
              if (v20 == 2)
              {
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("persistent_id"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v22, v11, v23);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v53, "addObject:", v39);

LABEL_29:
              }
              goto LABEL_44;
            default:
              if (v21 == 26)
              {
                if (v20 == 2)
                {
                  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("persona_id"));
                  v29 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v22, v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "addObject:", v30);

                  v11 = (id)v29;
                }
              }
              else
              {
LABEL_20:
                v31 = CADSpotlightHandle;
                if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  v64 = v21;
                  _os_log_error_impl(&dword_1B6A18000, v31, OS_LOG_TYPE_ERROR, "Got changes for unexpected entity type: %d", buf, 8u);
                }
              }
              goto LABEL_44;
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
            -[CADSpotlightIndexer _upsertsAndDeletesFromChanges:inDatabase:personaID:outUpserts:outDeletes:].cold.1(&v57, v58);
          +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("CADObjectId was nil for change, skipping"));
        }

        ++v16;
      }
      while (v14 != v16);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      v14 = v46;
    }
    while (v46);
  }

  -[__CFSet allObjects](theSet, "allObjects");
  *a6 = (id)objc_claimAutoreleasedReturnValue();

  v47 = objc_retainAutorelease(v53);
  *a7 = v47;

}

- (BOOL)_deleteFromIndex:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (id)CADSpotlightHandle;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 134217984;
      v30 = v6;
      _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, "Beginning delete of %lu domain ids", buf, 0xCu);
    }

    v7 = (void *)-[CADSpotlightIndexProvider newSpotlightIndexForBundleID:](self->_spotlightIndexProvider, "newSpotlightIndexForBundleID:", *MEMORY[0x1E0D0C520]);
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    CFRetain(v7);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __40__CADSpotlightIndexer__deleteFromIndex___block_invoke;
    v20 = &unk_1E6A374E8;
    v9 = v4;
    v21 = v9;
    v24 = &v25;
    v10 = v7;
    v22 = v10;
    v11 = v8;
    v23 = v11;
    objc_msgSend(v10, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v9, &v17);
    v12 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_DEFAULT, "Beginning wait for deletion of domain ids", buf, 2u);
    }
    dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
    v13 = (id)CADSpotlightHandle;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v9, "count", v17, v18, v19, v20, v21, v22);
      *(_DWORD *)buf = 134217984;
      v30 = v14;
      _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_DEFAULT, "Finished deleting %lu domain ids", buf, 0xCu);
    }

    v15 = *((unsigned __int8 *)v26 + 24);
  }
  else
  {
    v15 = *((unsigned __int8 *)v26 + 24);
  }
  _Block_object_dispose(&v25, 8);

  return v15 != 0;
}

void __40__CADSpotlightIndexer__deleteFromIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      __40__CADSpotlightIndexer__deleteFromIndex___block_invoke_cold_1(a1);
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("Failed to push spotlight deletes for domain ids: %@"), v3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (BOOL)_upsertToIndex:(__CFArray *)a3 inDatabase:(CalDatabase *)a4 personaID:(id)a5 deleteBeforeInserting:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  CFIndex Count;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  const void *v15;
  id *p_isa;
  CFIndex v17;
  void *v18;
  const void *ValueAtIndex;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  const void *v32;
  const void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t i;
  double v44;
  double v45;
  double v46;
  unint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  NSObject *v63;
  BOOL v64;
  unsigned int Duration;
  id v67;
  void *context;
  id obj;
  void *v70;
  int UID;
  void *started;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  int HasRecurrenceRules;
  uint64_t v77;
  void *v78;
  CADSpotlightIndexer *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  char v93;
  char v94[7];
  _BYTE v95[128];
  void *v96;
  uint8_t buf[4];
  uint64_t v98;
  uint64_t v99;

  v6 = a6;
  v99 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  Count = CFArrayGetCount(a3);
  if (Count)
  {
    v11 = Count;
    v79 = self;
    v12 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v98 = v11;
      _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_DEFAULT, "Start upserting %ld entities", buf, 0xCu);
    }
    context = (void *)MEMORY[0x1BCC9D714]();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CalDatabaseCopyNaturalLanguageSuggestionsCalendar();
    if (v14)
    {
      v15 = (const void *)v14;
      UID = CalCalendarGetUID();
      CFRelease(v15);
    }
    else
    {
      UID = -1;
    }
    p_isa = (id *)&v79->super.isa;
    v82 = *MEMORY[0x1E0D0C520];
    v73 = (void *)-[CADSpotlightIndexProvider newSpotlightIndexForBundleID:](v79->_spotlightIndexProvider, "newSpotlightIndexForBundleID:");
    if (v11 >= 1)
    {
      v17 = 0;
      v77 = v11;
      do
      {
        v18 = (void *)MEMORY[0x1BCC9D714]();
        ValueAtIndex = CFArrayGetValueAtIndex(a3, v17);
        objc_msgSend(p_isa, "_spotlightItemAttributes:", ValueAtIndex);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_spotlightDomainIDForItem:bundleID:personaID:", ValueAtIndex, v82, v9);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
        {
          v25 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v98 = (uint64_t)ValueAtIndex;
            _os_log_error_impl(&dword_1B6A18000, v25, OS_LOG_TYPE_ERROR, "Skipping record %@ because we got a nil domain id", buf, 0xCu);
          }
          +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("Skipping record because we got a nil domain id"));
          goto LABEL_39;
        }
        v21 = (void *)v20;
        v87 = (void *)CalCalendarItemCopyUUID();
        if (v6)
          objc_msgSend(v78, "addObject:", v21);
        v85 = v21;
        if (CalEventGetJunkStatus() == 1)
        {
          v22 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v23 = v22;
            v24 = "Skip indexing event marked as junk";
LABEL_21:
            _os_log_impl(&dword_1B6A18000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
          }
        }
        else
        {
          if (CalEventGetCalendarId() != UID)
          {
            v27 = 0;
            goto LABEL_24;
          }
          v26 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v23 = v26;
            v24 = "Skip indexing event on natural language suggested calendar";
            goto LABEL_21;
          }
        }
        v27 = 1;
        p_isa = (id *)&v79->super.isa;
LABEL_24:
        v83 = v18;
        v28 = CalEventCopyContactName();
        v86 = (void *)CalEventCopyContactIdentifier();
        v84 = (void *)v28;
        if (!v86 || v28)
        {
          if (CalCalendarItemGetRowID() != -1)
          {
            if ((v27 & 1) == 0)
            {
              if (CalCalendarItemIsPhantomMaster())
              {
                v30 = CADSpotlightHandle;
                if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1B6A18000, v30, OS_LOG_TYPE_DEFAULT, "Skip indexing event because is a phantom master", buf, 2u);
                }
              }
              else
              {
                v31 = CalEventCopyUniqueIdentifier();
                if (v31)
                {
                  v32 = (const void *)v31;
                  objc_msgSend(v88, "setIdentifier:", v31);
                  CFRelease(v32);
                }
                v11 = v77;
                if (CalDatabaseLockForThread())
                {
                  v33 = (const void *)CalFilterCreateWithDatabaseShowingAll();
                  _CalEventOccurrenceCacheCopySpotlightOccurrenceDates();
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  CFRelease(v33);
                  Duration = _CalEventGetDuration();
                  HasRecurrenceRules = _CalCalendarItemHasRecurrenceRules();
                  CalDatabaseUnlockForThread();
                  started = (void *)CalCalendarItemCopyStartDate();
                  if ((CalEventIsAllDay() & 1) != 0 || CalEventIsFloating())
                  {
                    v34 = (void *)CalCopyTimeZone();
                    objc_msgSend(started, "dateInTimeZone:fromTimeZone:", v34, 0);
                    v35 = objc_claimAutoreleasedReturnValue();

                    started = (void *)v35;
                  }
                  v11 = v77;
                  v36 = v80;
                  if (v86)
                  {
                    v37 = (void *)CalCalendarItemCopyCalendarScale();
                    objc_msgSend(MEMORY[0x1E0C99D48], "CalCalendarWithUnsanitizedCalendarIdentifier:", v37);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "calendarIdentifier");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v70 = 0;
                  }
                  v39 = 0x1E0C99000;
                  v67 = v9;
                  if (!objc_msgSend(v80, "count"))
                  {
                    v40 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(started, "timeIntervalSinceReferenceDate");
                    objc_msgSend(v40, "numberWithDouble:");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v96 = v41;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
                    v42 = objc_claimAutoreleasedReturnValue();

                    v39 = 0x1E0C99000uLL;
                    v36 = (void *)v42;
                  }
                  v91 = 0u;
                  v92 = 0u;
                  v89 = 0u;
                  v90 = 0u;
                  obj = v36;
                  v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
                  if (v75)
                  {
                    v74 = *(_QWORD *)v90;
                    while (2)
                    {
                      for (i = 0; i != v75; ++i)
                      {
                        if (*(_QWORD *)v90 != v74)
                          objc_enumerationMutation(obj);
                        objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "doubleValue");
                        v45 = v44;
                        v46 = v44 + (double)Duration;
                        objc_msgSend(*(id *)(v39 + 3432), "dateWithTimeIntervalSinceReferenceDate:");
                        v47 = v39;
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v88, "setStartDate:", v48);

                        objc_msgSend(*(id *)(v47 + 3432), "dateWithTimeIntervalSinceReferenceDate:", v46);
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v88, "setEndDate:", v49);

                        if (v86)
                        {
                          v50 = (void *)MEMORY[0x1E0D0C298];
                          objc_msgSend(v88, "startDate");
                          v51 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v50, "birthdayStringForContactName:eventDate:birthDate:lunarCalendar:", v84, v51, started, v70);
                          v52 = (void *)objc_claimAutoreleasedReturnValue();

                          objc_msgSend(v88, "setTitle:", v52);
                        }
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%f"), v87, *(_QWORD *)&v45);
                        v53 = objc_claimAutoreleasedReturnValue();
                        v54 = objc_alloc(MEMORY[0x1E0CA6B48]);
                        v55 = (void *)objc_msgSend(v88, "copy");
                        v81 = (void *)v53;
                        v56 = (void *)objc_msgSend(v54, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v53, v85, v55);

                        if (HasRecurrenceRules)
                        {
                          v39 = 0x1E0C99000uLL;
                          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v45);
                          v57 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          v57 = 0;
                          v39 = 0x1E0C99000uLL;
                        }
                        objc_msgSend(p_isa[6], "associateEventEntityWithIdentifier:occurrenceDate:withSearchableItem:", v87, v57, v56);
                        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v56, "setExpirationDate:", v58);

                        objc_msgSend(v13, "addObject:", v56);
                        if ((unint64_t)objc_msgSend(v13, "count") >= 0x64)
                        {
                          v59 = v13;
                          objc_msgSend(p_isa[7], "token");
                          v60 = (void *)objc_claimAutoreleasedReturnValue();
                          v61 = objc_msgSend(v60, "isCancelled");

                          if (v61)
                          {
                            if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
                              -[CADSpotlightIndexer _upsertToIndex:inDatabase:personaID:deleteBeforeInserting:].cold.2(buf, &buf[1]);
                            +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("returning NO because indexer was shutdown"));
                            v13 = v59;
                            v62 = v78;
LABEL_78:

                            objc_autoreleasePoolPop(v83);
                            v9 = v67;
                            goto LABEL_79;
                          }
                          v13 = v59;
                          v62 = v78;
                          if (!objc_msgSend(p_isa, "_sendSpotlightUpdates:deletes:toIndex:", v59, v78, v73))goto LABEL_78;
                          objc_msgSend(v59, "removeAllObjects");
                          objc_msgSend(v78, "removeAllObjects");
                          p_isa = (id *)&v79->super.isa;
                          v39 = 0x1E0C99000;
                        }

                        v11 = v77;
                      }
                      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
                      if (v75)
                        continue;
                      break;
                    }
                  }

                  v9 = v67;
                }
              }
            }
            goto LABEL_38;
          }
        }
        else
        {
          v29 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_DEFAULT, "Skip indexing event because it is a bad birthday", buf, 2u);
          }
          if (CalCalendarItemGetRowID() != -1)
            goto LABEL_38;
        }
        if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
          -[CADSpotlightIndexer _upsertToIndex:inDatabase:personaID:deleteBeforeInserting:].cold.1(&v93, v94);
        +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("Skip indexing event because it has a row id of -1"));
LABEL_38:

        v18 = v83;
LABEL_39:

        objc_autoreleasePoolPop(v18);
        ++v17;
      }
      while (v17 != v11);
    }
    v62 = v78;
    if ((objc_msgSend(v13, "count") || objc_msgSend(v78, "count"))
      && !objc_msgSend(p_isa, "_sendSpotlightUpdates:deletes:toIndex:", v13, v78, v73))
    {
LABEL_79:

      objc_autoreleasePoolPop(context);
      v64 = 0;
      goto LABEL_80;
    }

    objc_autoreleasePoolPop(context);
    v63 = CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v98 = v11;
      _os_log_impl(&dword_1B6A18000, v63, OS_LOG_TYPE_DEFAULT, "Finished upserting %ld entities to index", buf, 0xCu);
    }
  }
  v64 = 1;
LABEL_80:

  return v64;
}

- (BOOL)_sendSpotlightUpdates:(id)a3 deletes:(id)a4 toIndex:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  dispatch_group_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  BOOL v24;
  _QWORD v26[4];
  id v27;
  NSObject *v28;
  void (**v29)(_QWORD);
  uint64_t *v30;
  _QWORD v31[4];
  NSObject *v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 1;
  v11 = objc_msgSend(v8, "count");
  if (v11)
  {
    v12 = dispatch_group_create();
    v13 = (void *)objc_msgSend(v8, "copy");
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke;
    v31[3] = &unk_1E6A37538;
    v14 = v12;
    v32 = v14;
    v36 = v11;
    v15 = v10;
    v33 = v15;
    v16 = v13;
    v34 = v16;
    v35 = &v37;
    v17 = (void (**)(_QWORD))MEMORY[0x1BCC9D8DC](v31);
    if (objc_msgSend(v9, "count"))
    {
      v18 = (id)CADSpotlightHandle;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 134218240;
        v42 = v19;
        v43 = 2048;
        v44 = v11;
        _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_DEFAULT, "Beginning delete of %lu events, before indexing %lu events", buf, 0x16u);
      }

      dispatch_group_enter(v14);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_108;
      v26[3] = &unk_1E6A37560;
      v27 = v9;
      v30 = &v37;
      v29 = v17;
      v28 = v14;
      objc_msgSend(v15, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v27, v26);

    }
    else
    {
      v17[2](v17);
    }
    v20 = objc_msgSend(v9, "count");
    v21 = CADSpotlightHandle;
    v22 = os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v22)
      {
        *(_WORD *)buf = 0;
        v23 = "Beginning wait for delete, then indexing of events";
LABEL_12:
        _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
      }
    }
    else if (v22)
    {
      *(_WORD *)buf = 0;
      v23 = "Beginning wait for indexing of events";
      goto LABEL_12;
    }
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  }
  v24 = *((_BYTE *)v38 + 24) != 0;
  _Block_object_dispose(&v37, 8);

  return v24;
}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCC9D714]();
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v3 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    v15 = v4;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_DEFAULT, "Beginning indexing of %lu events", buf, 0xCu);
  }
  CFRetain(*(CFTypeRef *)(a1 + 40));
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_105;
  v9[3] = &unk_1E6A37510;
  v12 = *(_QWORD *)(a1 + 56);
  v7 = v5;
  v8 = *(_QWORD *)(a1 + 64);
  v10 = v7;
  v13 = v8;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(v7, "indexSearchableItems:completionHandler:", v6, v9);

  objc_autoreleasePoolPop(v2);
}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_105(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_105_cold_1();
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("Failed to push spotlight inserts/updates: %@"), v3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
  v4 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 134217984;
    v7 = v5;
    _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEFAULT, "Finished indexing of %lu events", buf, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_108(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)CADSpotlightHandle;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_108_cold_1(a1);
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("Failed to push spotlight deletes for ids before indexing: %@"), v3);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 32);
      v6 = v4;
      *(_DWORD *)buf = 134217984;
      v8 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1B6A18000, v6, OS_LOG_TYPE_DEFAULT, "Finished delete of %lu events, beginning indexing", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

+ (id)spotlightDomainIDForItemInMainDatabase:(void *)a3
{
  return (id)objc_msgSend(a1, "spotlightDomainIDForItem:inDatabaseWithPersonaID:", a3, CFSTR("CalMainDatabasePersona"));
}

+ (id)spotlightDomainIDForItem:(void *)a3 inDatabaseWithPersonaID:(id)a4
{
  return (id)objc_msgSend(a1, "_spotlightDomainIDForItem:bundleID:personaID:", a3, *MEMORY[0x1E0D0C520], a4);
}

+ (id)_spotlightDomainIDForItem:(void *)a3 bundleID:(id)a4 personaID:(id)a5
{
  os_unfair_lock_s *RecordLock;
  const void *v8;
  int v9;
  _BYTE *v10;
  const void *Store;
  const void *Calendar;
  const void *v13;
  int v14;
  const os_unfair_lock *Context;
  const void *v16;
  char v17;
  const void *v18;
  void *v19;
  _BYTE *v20;
  uint64_t v22;
  id v23;
  id v24;

  v24 = a4;
  v23 = a5;
  RecordLock = (os_unfair_lock_s *)CalGetRecordLock();
  os_unfair_lock_lock(RecordLock);
  v8 = (const void *)MEMORY[0x1BCC9BCB0](a3);
  _CalDatabaseGetRecordStore();
  v9 = _CalEntityIsOfType();
  v10 = (_BYTE *)MEMORY[0x1E0D0A160];
  if (v9)
  {
    Store = CFRetain(a3);
    Calendar = 0;
    v13 = 0;
    goto LABEL_18;
  }
  if ((_CalEntityIsOfType() & 1) != 0)
  {
    Calendar = CFRetain(a3);
    if (!Calendar)
      goto LABEL_5;
  }
  else
  {
    if (!_CalEntityIsOfType())
    {
      v13 = 0;
      v14 = 0;
      Calendar = 0;
      goto LABEL_21;
    }
    Calendar = (const void *)_CalCalendarItemGetCalendar();
    if (!Calendar)
    {
      CPRecordGetOriginalProperty();
      Calendar = (const void *)_CalGetCalendarWithUID();
      if (!Calendar)
      {
LABEL_5:
        v13 = 0;
        v14 = 0;
LABEL_21:
        Store = 0;
        goto LABEL_22;
      }
    }
    CFRetain(Calendar);
  }
  Store = (const void *)_CalCalendarGetStore();
  if (Store)
    goto LABEL_16;
  if (*v10)
  {
    if (CPRecordGetStore())
    {
      Context = (const os_unfair_lock *)CPRecordStoreGetContext();
      if (Context)
        os_unfair_lock_assert_owner(Context + 20);
    }
  }
  CPRecordGetOriginalProperty();
  Store = (const void *)_CalGetStoreWithUID();
  if (Store)
LABEL_16:
    CFRetain(Store);
  v13 = (const void *)_CalCalendarCopyUUID();
LABEL_18:
  v14 = v9 ^ 1;
  if (Store)
  {
    v16 = (const void *)_CalStoreCopyUUID();
    v17 = 0;
    goto LABEL_23;
  }
LABEL_22:
  v16 = 0;
  v17 = 1;
LABEL_23:
  if (_CalEntityIsOfType())
  {
    v18 = (const void *)_CalCalendarItemCopyUUID();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@.%@.%@"), v24, v23, v16, v13, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v18);
    if (!v8)
      goto LABEL_33;
LABEL_32:
    CFRelease(v8);
    goto LABEL_33;
  }
  if (v16 && v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@.%@"), v24, v23, v16, v13);
    goto LABEL_31;
  }
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@.%@"), v24, v23, v16, v22);
LABEL_31:
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_33;
    goto LABEL_32;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
    +[CADSpotlightIndexer _spotlightDomainIDForItem:bundleID:personaID:].cold.1();
  v19 = 0;
  if (v8)
    goto LABEL_32;
LABEL_33:
  if (v14)
    CFRelease(Calendar);
  if ((v17 & 1) == 0)
    CFRelease(Store);
  v20 = (_BYTE *)MEMORY[0x1E0D0A160];
  if (v13)
    CFRelease(v13);
  if (v16)
    CFRelease(v16);
  if (*v20)
    os_unfair_lock_assert_owner(RecordLock);
  os_unfair_lock_unlock(RecordLock);

  return v19;
}

- (id)_spotlightItemAttributes:(void *)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  const void *v10;
  void *v11;
  uint64_t IsSubscribed;
  void *v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  void *v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  const void *v25;
  void *v26;
  uint64_t v27;
  const void *v28;
  uint64_t v29;
  const void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  const void *v35;
  uint64_t v36;
  const void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  const void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  const __CFArray *v46;
  void *v47;
  CFIndex v48;
  const void *ValueAtIndex;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _BOOL4 v53;
  void *v54;
  id v55;
  int v56;
  void *v57;
  id v58;
  const void *v59;
  int v60;
  void *v61;
  id v62;
  BOOL v63;
  int v64;
  _BOOL4 v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  id v71;
  void *v72;
  void *v73;
  int v74;
  void *v75;
  BOOL v76;
  void *v77;
  id v78;
  const void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  const __CFArray *v92;
  CFIndex Count;
  void *v94;
  CFTypeRef cf;
  uint64_t v96;
  void *v97;
  _QWORD v98[4];
  _QWORD v99[3];

  v99[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CA6B50]);
  v4 = (void *)objc_msgSend(v3, "initWithContentType:", *MEMORY[0x1E0CEC478]);
  v5 = CalCalendarItemCopyCalendar();
  if (v5)
  {
    v6 = (const void *)v5;
    v7 = (const void *)CalCalendarCopyStore();
    if (v7)
      v8 = (const void *)CalStoreCopyExternalID();
    else
      v8 = 0;
    v9 = CalCalendarCopyTitle();
    if (v9)
    {
      v10 = (const void *)v9;
      objc_msgSend(v4, "setContainerDisplayName:", v9);
      CFRelease(v10);
    }
    if (CalCalendarIsHolidaySubscribedCalendar())
      objc_msgSend(v4, "setCalendarHolidayIdentifier:", CFSTR("Y"));
    v11 = v4;
    IsSubscribed = CalCalendarIsSubscribed();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mobilecal_calendarIsSubscribedCalendar"), 1, 0, 1, 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", IsSubscribed);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forCustomKey:", v14, v13);

    v15 = CalCalendarCopyUUID();
    if (v15)
    {
      v16 = (const void *)v15;
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mobilecal_calendarIdentifier"), 1, 0, 0, 0);
      objc_msgSend(v11, "setValue:forCustomKey:", v16, v17);
      CFRelease(v16);

    }
    v4 = v11;
    if (v8)
    {
      objc_msgSend(v11, "setAccountIdentifier:", v8);
      CFRelease(v8);
    }
    v18 = (void *)CalCalendarCopySelfIdentityAddress();
    if (v18)
    {
      v19 = v18;
      objc_msgSend(v18, "resourceSpecifier");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
      {
        v99[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAccountHandles:", v22);

        v4 = v11;
      }
      CFRelease(v19);

      if (v7)
        goto LABEL_17;
    }
    else if (v7)
    {
LABEL_17:
      if (CalStoreIsDelegate())
      {
        v23 = (void *)CalStoreCopyName();
        objc_msgSend(v4, "setCalendarDelegateIdentifier:", v23);

      }
      if (CalStoreGetType() == 6)
        objc_msgSend(v4, "setDisableSearchInSpotlight:", MEMORY[0x1E0C9AAB0]);
      CFRelease(v6);
      goto LABEL_24;
    }
    v7 = v6;
LABEL_24:
    CFRelease(v7);
  }
  v24 = CalCalendarItemCopyUUID();
  if (v24)
  {
    v25 = (const void *)v24;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mobilecal_calendarItemIdentifier"), 1, 0, 0, 0);
    objc_msgSend(v4, "setValue:forCustomKey:", v25, v26);
    CFRelease(v25);

  }
  v27 = CalCalendarItemCopySummary();
  if (v27)
  {
    v28 = (const void *)v27;
    objc_msgSend(v4, "setTitle:", v27);
    CFRelease(v28);
  }
  v29 = CalCalendarItemCopyDescription();
  if (v29)
  {
    v30 = (const void *)v29;
    objc_msgSend(v4, "setComment:", v29);
    CFRelease(v30);
  }
  v31 = MEMORY[0x1E0C9AAB0];
  v98[0] = CFSTR("com.apple.calendar.spotlight.identifier");
  v98[1] = CFSTR("com.apple.calendar.ics");
  v98[2] = CFSTR("com.apple.ical.ics");
  objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProviderDataTypes:", v33);

  v34 = CalCalendarItemCopyLocation();
  if (v34)
  {
    v35 = (const void *)v34;
    v36 = CalLocationCopyTitle();
    if (v36)
    {
      v37 = (const void *)v36;
      objc_msgSend(v4, "setNamedLocation:", v36);
      CFRelease(v37);
    }
    if (CalLocationHasCoordinates())
    {
      CalLocationGetCoordinates();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLatitude:", v38);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setLongitude:", v39);

      objc_msgSend(v4, "setSupportsNavigation:", MEMORY[0x1E0C9AAB0]);
    }
    CFRelease(v35);
  }
  if (CalCalendarItemIsAllDay())
    v40 = v31;
  else
    v40 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v4, "setAllDay:", v40);
  v41 = CalCalendarItemCopyOrganizer();
  if (v41)
  {
    v42 = (const void *)v41;
    v43 = (void *)MEMORY[0x1BCC9C8E0]();
    v44 = (void *)MEMORY[0x1BCC9C8F8](v42);
    v45 = CalCalendarItemCopyAttendees();
    if (v45)
    {
      v46 = (const __CFArray *)v45;
      v80 = v42;
      v81 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      Count = CFArrayGetCount(v46);
      if (Count >= 1)
      {
        v48 = 0;
        v82 = *MEMORY[0x1E0C966A8];
        v84 = *MEMORY[0x1E0C967C0];
        v88 = v43;
        v89 = v44;
        v92 = v46;
        v94 = v47;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v46, v48);
          v50 = MEMORY[0x1BCC9B878]();
          v51 = (void *)MEMORY[0x1BCC9B884](ValueAtIndex);
          v52 = MEMORY[0x1BCC9B8B4](ValueAtIndex);
          cf = (CFTypeRef)v52;
          if (v43)
          {
            if ((objc_msgSend(v43, "isEqualToString:", v51) & 1) != 0)
              break;
          }
          if (v44)
          {
            v56 = objc_msgSend(v44, "isEqualToString:", v52);
            v53 = v51 != 0;
            if (v51)
              v57 = v51;
            else
              v57 = (void *)v52;
            v55 = v57;
            if (v55)
            {
              if (!v56)
                goto LABEL_68;
LABEL_57:
              objc_msgSend(v85, "addObject:", v55);
LABEL_58:
              v56 = 1;
            }
            if (!v50)
            {
              LODWORD(v52) = v52 != 0;
              if (v56)
              {
                if (v53)
                  goto LABEL_99;
                goto LABEL_102;
              }
              goto LABEL_96;
            }
            if (v56)
            {
              objc_msgSend(v91, "addObject:", v50);
              if (!v53)
              {
                if (!v52)
                {
                  CFRelease((CFTypeRef)v50);
                  goto LABEL_104;
                }
                v70 = 0;
                v64 = 1;
                goto LABEL_84;
              }
              v58 = v55;
              v59 = (const void *)v50;
              v60 = 1;
              goto LABEL_78;
            }
            v65 = v53;
            v58 = v55;
            goto LABEL_77;
          }
          v53 = v51 != 0;
          if (v51)
            v61 = v51;
          else
            v61 = (void *)v52;
          v62 = v61;
          if (v62)
          {
            v55 = v62;
LABEL_68:
            objc_msgSend(v83, "addObject:", v55);
            if (!v50)
              goto LABEL_95;
            v63 = v53;
            v58 = v55;
            v59 = (const void *)v50;
            objc_msgSend(v86, "addObject:", v50);
            v60 = 0;
            LODWORD(v50) = 0;
            v64 = 0;
            if (!v63)
              goto LABEL_82;
LABEL_78:
            v66 = objc_alloc(MEMORY[0x1E0CA6B10]);
            v97 = v51;
            LODWORD(v50) = 1;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = (void *)objc_msgSend(v66, "initWithDisplayName:handles:handleIdentifier:", v59, v67, v82);

            v52 = (uint64_t)cf;
            if (v60)
              v69 = v90;
            else
              v69 = v87;
            objc_msgSend(v69, "addObject:", v68);

            v64 = v60;
            goto LABEL_82;
          }
          if (!v50)
          {
            v55 = 0;
LABEL_95:
            v56 = 0;
            LODWORD(v52) = v52 != 0;
            goto LABEL_96;
          }
          v65 = v51 != 0;
          v58 = 0;
LABEL_77:
          v59 = (const void *)v50;
          objc_msgSend(v86, "addObject:", v50);
          v60 = 0;
          LODWORD(v50) = 0;
          v64 = 0;
          if (v65)
            goto LABEL_78;
LABEL_82:
          if (v52)
          {
            v70 = v50;
            v50 = (uint64_t)v59;
            v55 = v58;
LABEL_84:
            v71 = objc_alloc(MEMORY[0x1E0CA6B10]);
            v96 = v52;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = (void *)objc_msgSend(v71, "initWithDisplayName:handles:handleIdentifier:", v50, v72, v84);

            if (v64)
            {
              objc_msgSend(v90, "addObject:", v73);

              CFRelease((CFTypeRef)v50);
              if (v70)
                CFRelease(v51);
              v43 = v88;
              v44 = v89;
LABEL_103:
              CFRelease(cf);
              goto LABEL_104;
            }
            objc_msgSend(v87, "addObject:", v73);

            v56 = 1;
            LODWORD(v52) = 1;
            v53 = v70;
            v43 = v88;
            v44 = v89;
            goto LABEL_96;
          }
          v44 = v89;
          if ((v64 & 1) != 0)
          {
            v43 = v88;
            goto LABEL_98;
          }
          v56 = 1;
          v74 = v50;
          v43 = v88;
          v50 = (uint64_t)v59;
          v55 = v58;
          v53 = v74;
LABEL_96:
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CalAttendeeGetStatus());
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "addObject:", v75);

          if (v56)
          {
            v76 = v53;
            v58 = v55;
            v59 = (const void *)v50;
            LOBYTE(v50) = v76;
LABEL_98:
            CFRelease(v59);
            v55 = v58;
            if ((v50 & 1) != 0)
              goto LABEL_99;
            goto LABEL_102;
          }
          if (v53)
          {
LABEL_99:
            CFRelease(v51);
            if ((v52 & 1) == 0)
              goto LABEL_104;
            goto LABEL_103;
          }
LABEL_102:
          if ((_DWORD)v52)
            goto LABEL_103;
LABEL_104:

          ++v48;
          v46 = v92;
          v47 = v94;
          if (Count == v48)
            goto LABEL_107;
        }
        v53 = v51 != 0;
        if (v51)
          v54 = v51;
        else
          v54 = (void *)v52;
        v55 = v54;
        if (v55)
          goto LABEL_57;
        goto LABEL_58;
      }
LABEL_107:
      v4 = v81;
      if (objc_msgSend(v87, "count"))
        objc_msgSend(v81, "setPrimaryRecipients:", v87);
      if (objc_msgSend(v86, "count"))
        objc_msgSend(v81, "setRecipientNames:", v86);
      if (objc_msgSend(v83, "count"))
        objc_msgSend(v81, "setRecipientEmailAddresses:", v83);
      if (objc_msgSend(v47, "count"))
      {
        v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mobilecal_recipientParticipationStatuses"), 1, 0, 0, 1);
        objc_msgSend(v81, "setValue:forCustomKey:", v47, v77);

      }
      if (objc_msgSend(v90, "count"))
        objc_msgSend(v81, "setAuthors:", v90);
      v42 = v80;
      if (objc_msgSend(v91, "count"))
        objc_msgSend(v81, "setAuthorNames:", v91);
      if (objc_msgSend(v85, "count"))
        objc_msgSend(v81, "setAuthorEmailAddresses:", v85);
      CFRelease(v46);

    }
    CFRelease(v42);
    if (v43)
      CFRelease(v43);
    if (v44)
      CFRelease(v44);
  }
  v78 = v4;

  return v78;
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  int v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a5;
  -[CalCancellationTokenSource token](self->_cancellationTokenSource, "token");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isCancelled");

  if (v10)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      -[CADSpotlightIndexer reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:].cold.1();
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("calling ack handler and returning because indexer was shutdown"));
LABEL_11:
    v8[2](v8);
    goto LABEL_12;
  }
  v11 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D0C520]);
  v12 = CADSpotlightHandle;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      -[CADSpotlightIndexer reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:].cold.2((uint64_t)v7);
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_DEFAULT, "CADSpotlightDaemonClientHandler: Received request to reindex all searchable items for Core Spotlight for bundleID: %@", (uint8_t *)&v14, 0xCu);
  }
  v13 = (void *)os_transaction_create();
  -[CADSpotlightIndexer _fullReindexIfAllowedWithTransaction:reason:](self, "_fullReindexIfAllowedWithTransaction:reason:", v13, 0);
  v8[2](v8);

LABEL_12:
}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  int v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *queue;
  id v27;
  id v28;
  void *v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD))a6;
  -[CalCancellationTokenSource token](self->_cancellationTokenSource, "token");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isCancelled");

  if (v13)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
      -[CADSpotlightIndexer reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:].cold.1();
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("calling ack handler and returning because indexer was shutdown"));
LABEL_20:
    v11[2](v11);
    goto LABEL_21;
  }
  v14 = *MEMORY[0x1E0D0C520];
  v15 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D0C520]);
  v16 = CADSpotlightHandle;
  if ((v15 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v41 = v9;
      v42 = 2112;
      v43 = v10;
      v44 = 2112;
      v45 = v14;
      _os_log_error_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_ERROR, "CADSpotlightDaemonClientHandler: Aborting unexpected request to reindex searchable items for Core Spotlight: %@ for bundleID: %@ for donation manager with bundleID: %@", buf, 0x20u);
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v41 = v9;
    v42 = 2112;
    v43 = v10;
    _os_log_impl(&dword_1B6A18000, v16, OS_LOG_TYPE_DEFAULT, "CADSpotlightDaemonClientHandler: Received request to reindex searchable items for Core Spotlight: %@ for bundleID: %@", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = v9;
  v18 = v9;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v36;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v36 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v22), "componentsSeparatedByString:", CFSTR("."));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          objc_msgSend(v17, "addObject:", v24);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v20);
  }

  v25 = (void *)os_transaction_create();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke;
  block[3] = &unk_1E6A375D8;
  block[4] = self;
  v32 = v18;
  v33 = v17;
  v34 = v25;
  v27 = v25;
  v28 = v17;
  dispatch_async(queue, block);
  v11[2](v11);

  v10 = v29;
  v9 = v30;
LABEL_21:

}

void __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id v6;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_2;
  v3[3] = &unk_1E6A375B0;
  v2 = *(void **)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v4, "_enumerateDatabases:", v3);

}

void __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_personaID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(a1 + 40);
      v8 = v6;
      *(_DWORD *)buf = 134217984;
      v16 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_DEFAULT, "Indexing %lu events in this database because spotlight told us to.", buf, 0xCu);

    }
    v9 = (void *)objc_opt_class();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_138;
    v10[3] = &unk_1E6A37588;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    v14 = a2;
    v12 = v5;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v9, "_executeWithNumRetriesOnFailure:block:", 1, v10);

  }
}

uint64_t __99__CADSpotlightIndexer_reindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke_138(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(a1 + 32), "_pushBatchedUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), 1);
  if ((_DWORD)v4)
  {
    v5 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 56);
      v7 = v5;
      v12 = 134217984;
      v13 = objc_msgSend(v6, "count");
      v8 = "Finished indexing %lu events in this database because spotlight told us to.";
LABEL_7:
      _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, 0xCu);

    }
  }
  else if (a2)
  {
    v9 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 56);
      v7 = v9;
      v12 = 134217984;
      v13 = objc_msgSend(v10, "count");
      v8 = "Error indexing %lu events in this database because spotlight told us to, retrying...";
      goto LABEL_7;
    }
  }
  return v4;
}

- (id)_textRepresentationForEvent:(void *)a3
{
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t IsAllDay;
  void *started;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;

  v28 = (void *)CalCalendarItemCopySummary();
  v3 = (const void *)CalCalendarItemCopyLocation();
  v4 = (void *)CalLocationCopyTitle();
  if (v3)
    CFRelease(v3);
  v5 = (void *)CalCalendarItemCopyURL();
  v6 = (void *)CalCalendarItemCopyDescription();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E6A39768);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:");
  v8 = (void *)MEMORY[0x1E0C99D68];
  CalEventGetStartDate();
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0C99D68];
  CalEventGetEndDate();
  objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IsAllDay = CalEventIsAllDay();
  started = (void *)CalEventCopyStartTimeZone();
  objc_msgSend(MEMORY[0x1E0D0C2B0], "dateStringRepresentationForEventCompontentsStartDate:endDate:allDay:timeZone:", v9, v11, IsAllDay, started);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendString:", v15);
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v16);

  }
  if (v5)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "absoluteString");
    v18 = v9;
    v19 = v6;
    v20 = v5;
    v21 = v4;
    v22 = v11;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@\n"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v24);

    v11 = v22;
    v4 = v21;
    v5 = v20;
    v6 = v19;
    v9 = v18;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n"), v6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", v25);

  }
  return v7;
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (**v17)(id, _QWORD, void *);
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, _QWORD, void *);
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  CADSpotlightIndexer *v38;
  id v39;
  _BYTE *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  const __CFString *v47;
  _BYTE buf[24];
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  _QWORD v55[4];

  v55[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (uint64_t (*)(uint64_t, uint64_t))a6;
  v17 = (void (**)(id, _QWORD, void *))a8;
  -[CalCancellationTokenSource token](self->_cancellationTokenSource, "token");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isCancelled");

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB2938];
    v55[0] = CFSTR("CADSpotlightIndexer is shutdown");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("CADSpotlightDaemonClientHandlerErrorDomain"), 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v22);

    goto LABEL_18;
  }
  v23 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D0C520]);
  v24 = CADSpotlightHandle;
  if ((v23 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v49 = v16;
      _os_log_impl(&dword_1B6A18000, v24, OS_LOG_TYPE_DEFAULT, "CADSpotlightDaemonClientHandler: Received request to provide data for bundleID: %@, %@, %@", buf, 0x20u);
    }
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.calendar.spotlight.identifier")))
    {
      objc_msgSend(v15, "dataUsingEncoding:", 4);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v17)[2](v17, v21, 0);
      goto LABEL_18;
    }
    objc_msgSend(v15, "componentsSeparatedByString:", CFSTR("."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v49 = __Block_byref_object_copy__3;
    v50 = __Block_byref_object_dispose__3;
    v51 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __118__CADSpotlightIndexer_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
    v35[3] = &unk_1E6A37600;
    v34 = v27;
    v36 = v34;
    v37 = v16;
    v28 = v17;
    v38 = self;
    v39 = v28;
    v40 = buf;
    v41 = &v42;
    -[CADSpotlightIndexer _enumerateDatabases:](self, "_enumerateDatabases:", v35);
    v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
    if (*((_BYTE *)v43 + 24))
    {
      if (!v29)
        goto LABEL_17;
    }
    else if (!v29)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v46 = *MEMORY[0x1E0CB2938];
      v47 = CFSTR("Event Identifier not found");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("CADSpotlightDaemonClientHandlerErrorDomain"), 0, v31);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v32;

      v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
    }
    v28[2](v28, 0, v29);
LABEL_17:

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v42, 8);

    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
    -[CADSpotlightIndexer provideDataForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:].cold.1((uint64_t)v13);
  v25 = (void *)MEMORY[0x1E0CB35C8];
  v52 = *MEMORY[0x1E0CB2938];
  v53 = CFSTR("Incorrect Bundle ID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("CADSpotlightDaemonClientHandlerErrorDomain"), 0, v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2](v17, 0, v26);

LABEL_18:
}

void __118__CADSpotlightIndexer_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  const void *v6;
  CFTypeRef v7;
  CFArrayRef v8;
  CFArrayRef v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CFTypeRef cf;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = (const void *)CalDatabaseCopyCalendarItemWithUUID();
  cf = v6;
  if (v6)
  {
    v7 = v6;
    if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.calendar.ics")) & 1) != 0
      || objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("com.apple.ical.ics")))
    {
      v8 = CFArrayCreate(0, &cf, 1, MEMORY[0x1E0C9B378]);
      if (v8 && (v9 = v8, v10 = (void *)CalCreateiCalendarDataFromCalEntitiesWithOptions(), CFRelease(v9), v10))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v28 = *MEMORY[0x1E0CB2938];
        v29[0] = CFSTR("Failed to create ICS");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1, cf);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CADSpotlightDaemonClientHandlerErrorDomain"), 0, v10);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

      }
      v7 = cf;
    }
    else
    {
      v15 = *(void **)(a1 + 40);
      objc_msgSend((id)*MEMORY[0x1E0CEC630], "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v15, "isEqualToString:", v16);

      if ((_DWORD)v15)
      {
        objc_msgSend(*(id *)(a1 + 48), "_textRepresentationForEvent:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 56);
        objc_msgSend(v17, "dataUsingEncoding:", 4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v18 + 16))(v18, v19, 0);

      }
      else
      {
        v20 = (void *)MEMORY[0x1E0CB35C8];
        v26 = *MEMORY[0x1E0CB2938];
        v27 = CFSTR("Unrecognized type Identifier");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("CADSpotlightDaemonClientHandlerErrorDomain"), 0, v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v24 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;

      }
    }
    CFRelease(v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2938];
  v15[0] = CFSTR("FileURLs are not provided for events");
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = a8;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("CADSpotlightDaemonClientHandlerErrorDomain"), 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))a8 + 2))(v11, 0, v13);

}

- (BOOL)_pushBatchedUpdatesForCalendarItemsWithUUIDs:(id)a3 database:(CalDatabase *)a4 personaID:(id)a5 deleteBeforeInserting:(BOOL)a6
{
  return -[CADSpotlightIndexer _pushUpdatesForCalendarItemsWithUUIDs:inBatchesOf:database:personaID:deleteBeforeInserting:](self, "_pushUpdatesForCalendarItemsWithUUIDs:inBatchesOf:database:personaID:deleteBeforeInserting:", a3, 100, a4, a5, a6);
}

- (BOOL)_pushUpdatesForCalendarItemsWithUUIDs:(id)a3 inBatchesOf:(unint64_t)a4 database:(CalDatabase *)a5 personaID:(id)a6 deleteBeforeInserting:(BOOL)a7
{
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  _BOOL4 v25;
  void *v26;
  int v27;
  BOOL v28;
  NSObject *v29;
  id v31;
  _BOOL4 v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v32 = a7;
  v43 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v33 = a6;
  if (v11 && objc_msgSend(v11, "count"))
  {
    v12 = (void *)CADSpotlightHandle;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      v14 = v12;
      objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v40 = v15;
      v41 = 2112;
      v42 = v16;
      _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_INFO, "Pushing [%@] calendar items in batches of [%@]", buf, 0x16u);

    }
    v17 = objc_msgSend(v11, "count");
    if (v17 >= a4)
      v18 = a4;
    else
      v18 = v17;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v18);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v31 = v11;
    v20 = v11;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          if (objc_msgSend(v19, "count") >= a4)
          {
            v25 = -[CADSpotlightIndexer _pushUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:](self, "_pushUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:", v19, a5, v33, v32);
            -[CADSpotlightIndexer _resetDatabase:](self, "_resetDatabase:", a5);
            objc_msgSend(v19, "removeAllObjects");
            if (!v25)
              goto LABEL_24;
          }
          -[CalCancellationTokenSource token](self->_cancellationTokenSource, "token");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isCancelled");

          if (v27)
          {
            if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
              -[CADSpotlightIndexer _pushUpdatesForCalendarItemsWithUUIDs:inBatchesOf:database:personaID:deleteBeforeInserting:].cold.1();
            +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("returning NO because indexer was shutdown"));
LABEL_24:

            v28 = 0;
            goto LABEL_25;
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v22)
          continue;
        break;
      }
    }

    v28 = -[CADSpotlightIndexer _pushUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:](self, "_pushUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:", v19, a5, v33, v32);
LABEL_25:

    v11 = v31;
  }
  else
  {
    v29 = CADSpotlightHandle;
    v28 = 1;
    if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v29, OS_LOG_TYPE_INFO, "No UUIDs were given.  Will not push any calendar items to Spotlight in batches.", buf, 2u);
    }
  }

  return v28;
}

- (BOOL)_pushUpdatesForCalendarItemsWithUUIDs:(id)a3 database:(CalDatabase *)a4 personaID:(id)a5 deleteBeforeInserting:(BOOL)a6
{
  id v8;
  __CFArray *Mutable;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  const void *v17;
  NSObject *v18;
  BOOL v19;
  id v22;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v23 = a6;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = a5;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_DEBUG))
    -[CADSpotlightIndexer _pushUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:].cold.1();
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14);
        v16 = (const void *)CalDatabaseCopyCalendarItemWithUUID();
        if (v16)
        {
          v17 = v16;
          CFArrayAppendValue(Mutable, v16);
          CFRelease(v17);
        }
        else
        {
          v18 = CADSpotlightHandle;
          if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v15;
            _os_log_error_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_ERROR, "Could not find a calendar item with UUID [%@].  Will not push this item to Spotlight.", buf, 0xCu);
          }
          +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("Could not find a calendar item with UUID [%@].  Will not push this item to Spotlight."), v15);
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v12);
  }

  v19 = -[CADSpotlightIndexer _upsertToIndex:inDatabase:personaID:deleteBeforeInserting:](self, "_upsertToIndex:inDatabase:personaID:deleteBeforeInserting:", Mutable, a4, v22, v23);
  CFRelease(Mutable);

  return v19;
}

- (void)_resetDatabase:(CalDatabase *)a3
{
  CalDatabaseReset();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationTokenSource, 0);
  objc_storeStrong((id *)&self->_spotlightEntityAnnotator, 0);
  objc_storeStrong((id *)&self->_databaseConfiguration, 0);
  objc_storeStrong((id *)&self->_spotlightDefaults, 0);
  objc_storeStrong((id *)&self->_spotlightIndexProvider, 0);
  objc_storeStrong((id *)&self->_incrementalUpdateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = -1;
  OUTLINED_FUNCTION_1_0(&dword_1B6A18000, a1, a3, "Error fetching changes, %ld", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_3(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v2, (uint64_t)v2, "Returning because indexer was shutdown", v3);
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v2, (uint64_t)v2, "Spotlight error while upserting to the index, not advancing change sequence number", v3);
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v2, (uint64_t)v2, "Spotlight error while deleting from index, not advancing change sequence number", v3);
}

void __41__CADSpotlightIndexer__incrementalUpdate__block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v0, v1, "While fetching changes to do an incremental index, change tracking told us changes were truncated so we are registering for changes and doing a full-reindex", v2);
  OUTLINED_FUNCTION_1();
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1B6A18000, v0, v1, "Error deleting searchable items for calendar, error = %@", v2);
  OUTLINED_FUNCTION_5();
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1B6A18000, v0, v1, "Error deleting searchable items for calendar, error = %@. Retrying...", v2);
  OUTLINED_FUNCTION_5();
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_49_cold_1(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1B6A18000, v1, v3, "Error indexing %lu events in this database as part of a full-reindex, retrying...", v4);

  OUTLINED_FUNCTION_10();
}

void __46__CADSpotlightIndexer__fullReindexWithReason___block_invoke_2_49_cold_2(void *a1)
{
  NSObject *v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1B6A18000, v1, v3, "Error indexing %lu events in this database as part of a full-reindex, out of retries", v4);

  OUTLINED_FUNCTION_10();
}

+ (void)_personaID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v0, v1, "Error determining non-empty personaID for non-nil auxDatabase", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_upsertsAndDeletesFromChanges:(_BYTE *)a1 inDatabase:(_BYTE *)a2 personaID:outUpserts:outDeletes:.cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v2, (uint64_t)v2, "CADObjectId was nil for change, skipping", v3);
}

void __40__CADSpotlightIndexer__deleteFromIndex___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1B6A18000, v1, v2, "Failed to push spotlight deletes for domain ids: %{public}@, %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

- (void)_upsertToIndex:(_BYTE *)a1 inDatabase:(_BYTE *)a2 personaID:deleteBeforeInserting:.cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v2, (uint64_t)v2, "Skip indexing event because it has a row id of -1", v3);
}

- (void)_upsertToIndex:(_BYTE *)a1 inDatabase:(_BYTE *)a2 personaID:deleteBeforeInserting:.cold.2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_4(a1, a2);
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v2, (uint64_t)v2, "Returning NO because indexer was shutdown", v3);
}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_105_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1B6A18000, v0, v1, "Failed to push spotlight inserts/updates: %@", v2);
  OUTLINED_FUNCTION_5();
}

void __61__CADSpotlightIndexer__sendSpotlightUpdates_deletes_toIndex___block_invoke_108_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1B6A18000, v1, v2, "Failed to push spotlight deletes for ids before indexing: %{public}@, %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

+ (void)_spotlightDomainIDForItem:bundleID:personaID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_0(&dword_1B6A18000, v0, v1, "Unable to get valid domain ID when there's not a valid storeID. CalendarID: %@", v2);
  OUTLINED_FUNCTION_5();
}

- (void)reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v0, v1, "Calling ack handler and returning because indexer was shutdown", v2);
  OUTLINED_FUNCTION_1();
}

- (void)reindexAllItemsForBundleID:(uint64_t)a1 protectionClass:acknowledgementHandler:.cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1B6A18000, v1, v2, "CADSpotlightDaemonClientHandler: Aborting unexpected request to reindex all searchable items for Core Spotlight for bundleID: %@ for donation manager with bundleID: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

- (void)provideDataForBundleID:(uint64_t)a1 protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2(&dword_1B6A18000, v1, v2, "CADSpotlightDaemonClientHandler: Aborting unexpected request for data on searchable items for Core Spotlight for bundleID: %@ for donation manager with bundleID: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_5();
}

- (void)_pushUpdatesForCalendarItemsWithUUIDs:inBatchesOf:database:personaID:deleteBeforeInserting:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1B6A18000, v0, v1, "Returning NO because indexer was shutdown", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_pushUpdatesForCalendarItemsWithUUIDs:database:personaID:deleteBeforeInserting:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_debug_impl(&dword_1B6A18000, v0, OS_LOG_TYPE_DEBUG, "Attempting to push calendar items to Spotlight.  Calendar item UUIDs: [%@]", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

@end
