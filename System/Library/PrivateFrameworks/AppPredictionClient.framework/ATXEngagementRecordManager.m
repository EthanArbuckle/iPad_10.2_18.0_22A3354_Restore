@implementation ATXEngagementRecordManager

- (void)_removeEngagedSuggestionsIfPossibleNoSync
{
  void *v3;
  void *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[ATXExecutableReferenceManager purgeReferencesIfPossible](self->_referenceManager, "purgeReferencesIfPossible");
  -[ATXEngagementRecordManager _engagedEntriesNoSyncOfType:queryOptions:](self, "_engagedEntriesNoSyncOfType:queryOptions:", 1021, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ATXEngagementRecordManager__removeEngagedSuggestionsIfPossibleNoSync__block_invoke;
  v8[3] = &unk_1E4D594D8;
  v8[4] = self;
  objc_msgSend(v3, "objectsPassingTest:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v10 = v7;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "%@ - removing executables with ref count of zero: %@", buf, 0x16u);

    }
    objc_msgSend(v3, "minusSet:", v4);
    -[ATXEngagementRecordManager _serializeAndWriteNoSyncSet:](self, "_serializeAndWriteNoSyncSet:", v3);
  }

}

- (id)_engagedEntriesNoSyncOfType:(unint64_t)a3 queryOptions:(unint64_t)a4
{
  char v4;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  ATXExecutableReferenceManager *referenceManager;
  void *v15;
  ATXExecutableReferenceManager *v16;
  void *v17;
  ATXEngagementRecordManager *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v19 = self;
  -[ATXEngagementRecordManager _engagedEntriesNoSync](self, "_engagedEntriesNoSync");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(v13, "engagementRecordType") & a3) != 0)
        {
          if ((v4 & 1) != 0)
          {
            if ((v4 & 2) == 0 || objc_msgSend(v13, "engagementRecordType") == a3)
            {
              referenceManager = v19->_referenceManager;
              objc_msgSend(v13, "executable");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(referenceManager) = -[ATXExecutableReferenceManager isExecutableHidden:](referenceManager, "isExecutableHidden:", v15);

              if ((referenceManager & 1) != 0
                || (v16 = v19->_referenceManager,
                    objc_msgSend(v13, "executable"),
                    v17 = (void *)objc_claimAutoreleasedReturnValue(),
                    LOBYTE(v16) = -[ATXExecutableReferenceManager canExecutableClearOnEngagement:](v16, "canExecutableClearOnEngagement:", v17), v17, (v16 & 1) != 0))
              {
LABEL_15:
                objc_msgSend(v7, "addObject:", v13);
                continue;
              }
            }
          }
          else if ((v4 & 2) == 0 || objc_msgSend(v13, "engagementRecordType") == a3)
          {
            goto LABEL_15;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_engagedEntriesNoSync
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__ATXEngagementRecordManager__engagedEntriesNoSync__block_invoke;
  v17[3] = &unk_1E4D590F8;
  v17[4] = self;
  v17[5] = &v18;
  v3 = +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:block:](ATXRunningBoardAssertion, "performWorkWithFinishTaskAssertionName:block:", CFSTR("ATXEngagementRecordManager"), v17);
  if (v19[5])
  {
    v4 = (void *)MEMORY[0x1A85A4F90](v3);
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v19[5];
    v16 = 0;
    objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v8, v9, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;

    objc_autoreleasePoolPop(v4);
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      __atxlog_handle_default();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXEngagementRecordManager _engagedEntriesNoSync].cold.1((uint64_t)v11, v14);

      v12 = (id)objc_opt_new();
    }
    v13 = v12;

  }
  else
  {
    v13 = (void *)objc_opt_new();
  }
  _Block_object_dispose(&v18, 8);

  return v13;
}

- (id)_readData
{
  int v2;
  int v3;
  NSObject *v4;
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = open(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), 0);
  if (v2 == -1)
  {
    v6 = *__error();
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == 2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "No recently engaged cache file found.", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[ATXEngagementRecordManager _readData].cold.1();
    }

    v5 = 0;
  }
  else
  {
    v3 = v2;
    ATXCacheFileRead();
    if ((v3 & 0x80000000) == 0)
      close(v3);
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = CFSTR("ATXEngagementRecords.pb");
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "Successfully read data from cache file: %@", buf, 0xCu);
    }

    v5 = 0;
  }
  return v5;
}

void __76__ATXEngagementRecordManager_updateForClientModelCacheUpdate_clientModelId___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)os_transaction_create();
  __atxlog_handle_default();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v14 = v4;
    _os_log_impl(&dword_1A49EF000, v3, OS_LOG_TYPE_DEFAULT, "Began updating recently engaged cache for client model with id: %@", buf, 0xCu);
  }

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(void **)(v5 + 8);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__ATXEngagementRecordManager_updateForClientModelCacheUpdate_clientModelId___block_invoke_13;
  v10[3] = &unk_1E4D57FE0;
  v10[4] = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  objc_msgSend(v7, "performBatchUpdateOfReferencesWithBlock:", v10);
  __atxlog_handle_default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v14 = v9;
    _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "Finished updating recently engaged cache for client model with id: %@", buf, 0xCu);
  }

}

- (void)updateForClientModelCacheUpdate:(id)a3 clientModelId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATXEngagementRecordManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__ATXEngagementRecordManager_updateForClientModelCacheUpdate_clientModelId___block_invoke;
  block[3] = &unk_1E4D57FE0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

+ (ATXEngagementRecordManager)sharedInstance
{
  if (sharedInstance__pasOnceToken6_5 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_5, &__block_literal_global_33);
  return (ATXEngagementRecordManager *)(id)sharedInstance__pasExprOnceResult_6;
}

void __44__ATXEngagementRecordManager_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A85A4F90]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_6;
  sharedInstance__pasExprOnceResult_6 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXEngagementRecordManager)init
{
  void *v3;
  ATXEngagementRecordManager *v4;

  objc_msgSend(MEMORY[0x1E0CF94D8], "appPredictionCacheDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ATXEngagementRecordManager initWithCacheDirectory:](self, "initWithCacheDirectory:", v3);

  return v4;
}

- (ATXEngagementRecordManager)initWithCacheDirectory:(id)a3
{
  id v4;
  ATXEngagementRecordManager *v5;
  ATXEngagementRecordManager *v6;
  uint64_t v7;
  NSString *path;
  objc_class *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  ATXExecutableReferenceManager *v15;
  ATXExecutableReferenceManager *referenceManager;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXEngagementRecordManager;
  v5 = -[ATXEngagementRecordManager init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_minDurationForTrackedReferencesToStayAround = 900.0;
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("ATXEngagementRecords.pb"));
    v7 = objc_claimAutoreleasedReturnValue();
    path = v6->_path;
    v6->_path = (NSString *)v7;

    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    v15 = -[ATXExecutableReferenceManager initWithCacheDirectory:minDurationForTrackedReferencesToStayAround:]([ATXExecutableReferenceManager alloc], "initWithCacheDirectory:minDurationForTrackedReferencesToStayAround:", v4, v6->_minDurationForTrackedReferencesToStayAround);
    referenceManager = v6->_referenceManager;
    v6->_referenceManager = v15;

  }
  return v6;
}

- (NSString)description
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__6;
  v10 = __Block_byref_object_dispose__6;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__ATXEngagementRecordManager_description__block_invoke;
  v5[3] = &unk_1E4D590F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __41__ATXEngagementRecordManager_description__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_engagedEntriesNoSync");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)jsonDict
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  _QWORD block[5];
  id v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ATXEngagementRecordManager_jsonDict__block_invoke;
  block[3] = &unk_1E4D57258;
  block[4] = self;
  v9 = v3;
  v5 = v3;
  dispatch_sync(queue, block);
  v10 = CFSTR("engagedEntries");
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __38__ATXEngagementRecordManager_jsonDict__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
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
  objc_msgSend(*(id *)(a1 + 32), "_engagedEntriesNoSync", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "jsonDict");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

uint64_t __76__ATXEngagementRecordManager_updateForClientModelCacheUpdate_clientModelId___block_invoke_13(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "_removeEngagedSuggestionsIfPossibleNoSync");
  if (!objc_msgSend(*(id *)(a1 + 40), "count"))
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientModelSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "engagementResetPolicy");

  if (v4 == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "updateReferencesForProactiveSuggestions:clientModelId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    return objc_msgSend(*(id *)(a1 + 32), "_removeEngagedSuggestionsIfPossibleNoSync");
  }
  if (!v4)
  {
LABEL_4:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "markReferencesAsPurgableFromClientModelIdIfPossible:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "purgeReferencesForSuggestions:clientModelId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "_removeEngagedSuggestionsIfPossibleNoSync");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addReferencesForSuggestions:clientModelId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  return objc_msgSend(*(id *)(a1 + 32), "_removeEngagedSuggestionsIfPossibleNoSync");
}

- (BOOL)hasEngagedWithSuggestion:(id)a3 engagementRecordType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__ATXEngagementRecordManager_hasEngagedWithSuggestion_engagementRecordType___block_invoke;
  v10[3] = &unk_1E4D59410;
  v12 = &v14;
  v13 = a4;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __76__ATXEngagementRecordManager_hasEngagedWithSuggestion_engagementRecordType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__ATXEngagementRecordManager_hasEngagedWithSuggestion_engagementRecordType___block_invoke_2;
  v6[3] = &unk_1E4D59410;
  v3 = *(_QWORD *)(a1 + 56);
  v6[4] = v1;
  v8 = v3;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "performBatchUpdateOfReferencesWithBlock:", v6);

}

void __76__ATXEngagementRecordManager_hasEngagedWithSuggestion_engagementRecordType___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_removeEngagedSuggestionsIfPossibleNoSync");
  objc_msgSend(*(id *)(a1 + 32), "_engagedEntriesNoSyncOfType:queryOptions:", *(_QWORD *)(a1 + 56), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_filterOutExplicitEngagementsThatShouldNotClearOnEngagement:", v5);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "_identifiersFromEntries:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "hasEngagedWithSuggestion:engagedExecutables:", v3, v4);

}

- (BOOL)hasEngagedWithSuggestion:(id)a3 engagedExecutables:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;

  v5 = a3;
  v6 = a4;
  ATXAllowedEngagementRecordManagerClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executableClassString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "containsObject:", v9);

  if (v10)
  {
    ATXExecutableIdentifierForSuggestion(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "containsObject:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)hasEngagedWithExecutable:(id)a3 engagementRecordType:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__ATXEngagementRecordManager_hasEngagedWithExecutable_engagementRecordType___block_invoke;
  v10[3] = &unk_1E4D59410;
  v12 = &v14;
  v13 = a4;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __76__ATXEngagementRecordManager_hasEngagedWithExecutable_engagementRecordType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[5];
  __int128 v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__ATXEngagementRecordManager_hasEngagedWithExecutable_engagementRecordType___block_invoke_2;
  v6[3] = &unk_1E4D59410;
  v3 = *(_QWORD *)(a1 + 56);
  v6[4] = v1;
  v8 = v3;
  v5 = *(_OWORD *)(a1 + 40);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v2, "performBatchUpdateOfReferencesWithBlock:", v6);

}

void __76__ATXEngagementRecordManager_hasEngagedWithExecutable_engagementRecordType___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_removeEngagedSuggestionsIfPossibleNoSync");
  objc_msgSend(*(id *)(a1 + 32), "_engagedEntriesNoSyncOfType:queryOptions:", *(_QWORD *)(a1 + 56), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_filterOutExplicitEngagementsThatShouldNotClearOnEngagement:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_identifiersFromEntries:", v3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "hasEngagedWithExecutable:engagedExecutables:", *(_QWORD *)(a1 + 40), v2);

}

- (BOOL)hasEngagedWithExecutable:(id)a3 engagedExecutables:(id)a4
{
  id v5;
  id v6;
  ATXExecutableIdentifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ATXExecutableIdentifier initWithString:]([ATXExecutableIdentifier alloc], "initWithString:", v6);

  LOBYTE(v6) = objc_msgSend(v5, "containsObject:", v7);
  return (char)v6;
}

- (void)_filterOutExplicitEngagementsThatShouldNotClearOnEngagement:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = (void *)MEMORY[0x1E0CB3880];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __90__ATXEngagementRecordManager__filterOutExplicitEngagementsThatShouldNotClearOnEngagement___block_invoke;
  v6[3] = &unk_1E4D59438;
  v6[4] = self;
  v4 = a3;
  objc_msgSend(v3, "predicateWithBlock:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterUsingPredicate:", v5);

}

uint64_t __90__ATXEngagementRecordManager__filterOutExplicitEngagementsThatShouldNotClearOnEngagement___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "engagementRecordType") & 0x78) == 0 && (objc_msgSend(v3, "engagementRecordType") & 1) != 0)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v3, "executable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "canExecutableClearOnEngagement:", v6);

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)engagedExecutablesOfType:(unint64_t)a3 queryOptions:(unint64_t)a4
{
  NSObject *queue;
  id v5;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__ATXEngagementRecordManager_engagedExecutablesOfType_queryOptions___block_invoke;
  v7[3] = &unk_1E4D59460;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  v7[7] = a4;
  dispatch_sync(queue, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __68__ATXEngagementRecordManager_engagedExecutablesOfType_queryOptions___block_invoke(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  void *v3;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__ATXEngagementRecordManager_engagedExecutablesOfType_queryOptions___block_invoke_2;
  v5[3] = &unk_1E4D59460;
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 48);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v6 = v1;
  v7 = v2;
  return objc_msgSend(v3, "performBatchUpdateOfReferencesWithBlock:", v5);
}

void __68__ATXEngagementRecordManager_engagedExecutablesOfType_queryOptions___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_removeEngagedSuggestionsIfPossibleNoSync");
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_engagedEntriesNoSyncOfType:queryOptions:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_identifiersFromEntries:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)addEngagedSuggestion:(id)a3 engagementRecordType:(unint64_t)a4
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
  block[2] = __72__ATXEngagementRecordManager_addEngagedSuggestion_engagementRecordType___block_invoke;
  block[3] = &unk_1E4D59488;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

uint64_t __72__ATXEngagementRecordManager_addEngagedSuggestion_engagementRecordType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeEngagedSuggestionsIfPossibleNoSync");
  return objc_msgSend(*(id *)(a1 + 32), "_addEngagedSuggestionNoSync:type:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)addEngagedExecutable:(id)a3 clientModelId:(id)a4 engagementRecordType:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *queue;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    queue = self->_queue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __86__ATXEngagementRecordManager_addEngagedExecutable_clientModelId_engagementRecordType___block_invoke;
    v18[3] = &unk_1E4D594B0;
    v18[4] = self;
    v19 = v8;
    v20 = v9;
    v21 = a5;
    dispatch_async(queue, v18);

  }
  else
  {
    __atxlog_handle_context_heuristic();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[ATXEngagementRecordManager addEngagedExecutable:clientModelId:engagementRecordType:].cold.1(a5, v11, v12, v13, v14, v15, v16, v17);

  }
}

void __86__ATXEngagementRecordManager_addEngagedExecutable_clientModelId_engagementRecordType___block_invoke(uint64_t a1)
{
  ATXExecutableIdentifier *v2;

  objc_msgSend(*(id *)(a1 + 32), "_removeEngagedSuggestionsIfPossibleNoSync");
  v2 = -[ATXExecutableIdentifier initWithString:]([ATXExecutableIdentifier alloc], "initWithString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "recordExecutable:clientModelId:shouldClearEngagement:", v2, *(_QWORD *)(a1 + 48), 0);
  objc_msgSend(*(id *)(a1 + 32), "_addEngagedExcutableNoSync:clientModelId:type:", v2, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)addHiddenSuggestion:(id)a3 duration:(double)a4 engagementRecordType:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  unint64_t v14;

  v8 = a3;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__ATXEngagementRecordManager_addHiddenSuggestion_duration_engagementRecordType___block_invoke;
  v11[3] = &unk_1E4D57F90;
  v11[4] = self;
  v12 = v8;
  v13 = a4;
  v14 = a5;
  v10 = v8;
  dispatch_async(queue, v11);

}

uint64_t __80__ATXEngagementRecordManager_addHiddenSuggestion_duration_engagementRecordType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addHiddenSuggestionNoSync:duration:engagementRecordType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(double *)(a1 + 48));
}

BOOL __71__ATXEngagementRecordManager__removeEngagedSuggestionsIfPossibleNoSync__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;

  v3 = a2;
  if ((objc_msgSend(v3, "engagementRecordType") & 0x380) != 0)
    goto LABEL_2;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v3, "executable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "referenceCountForExecutable:", v7);

  if (!v8)
  {
    v4 = 1;
    goto LABEL_3;
  }
  if ((objc_msgSend(v3, "engagementRecordType") & 0x78) != 0)
  {
LABEL_2:
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "dateEngaged");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceNow");
    v4 = fabs(v10) > 14400.0;

  }
LABEL_3:

  return v4;
}

- (void)removeEngagementForSuggestion:(id)a3 recordType:(unint64_t)a4
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  unint64_t v10;

  ATXExecutableIdentifierForSuggestion(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__ATXEngagementRecordManager_removeEngagementForSuggestion_recordType___block_invoke;
  v8[3] = &unk_1E4D59500;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  -[ATXEngagementRecordManager _removeEngagementsOnQueuePassingTest:](self, "_removeEngagementsOnQueuePassingTest:", v8);

}

BOOL __71__ATXEngagementRecordManager_removeEngagementForSuggestion_recordType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BOOL8 v5;

  v3 = a2;
  objc_msgSend(v3, "executable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
    v5 = objc_msgSend(v3, "engagementRecordType") == *(_QWORD *)(a1 + 40);
  else
    v5 = 0;

  return v5;
}

- (void)removeAllEngagementsForSuggestion:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  ATXExecutableIdentifierForSuggestion(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__ATXEngagementRecordManager_removeAllEngagementsForSuggestion___block_invoke;
  v6[3] = &unk_1E4D59528;
  v7 = v4;
  v5 = v4;
  -[ATXEngagementRecordManager _removeEngagementsOnQueuePassingTest:](self, "_removeEngagementsOnQueuePassingTest:", v6);

}

uint64_t __64__ATXEngagementRecordManager_removeAllEngagementsForSuggestion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "executable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)removeAllEngagementsOfRecordType:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__ATXEngagementRecordManager_removeAllEngagementsOfRecordType___block_invoke;
  v3[3] = &__block_descriptor_40_e34_B16__0__ATXEngagementRecordEntry_8l;
  v3[4] = a3;
  -[ATXEngagementRecordManager _removeEngagementsOnQueuePassingTest:](self, "_removeEngagementsOnQueuePassingTest:", v3);
}

BOOL __63__ATXEngagementRecordManager_removeAllEngagementsOfRecordType___block_invoke(uint64_t a1, void *a2)
{
  return (*(_QWORD *)(a1 + 32) & objc_msgSend(a2, "engagementRecordType")) != 0;
}

- (void)removeEngagementForExecutableIdentifier:(id)a3 recordType:(unint64_t)a4 abortingRemovalIfEngagementDateIsLaterThanDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;

  v8 = a3;
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __128__ATXEngagementRecordManager_removeEngagementForExecutableIdentifier_recordType_abortingRemovalIfEngagementDateIsLaterThanDate___block_invoke;
  v12[3] = &unk_1E4D59570;
  v14 = v9;
  v15 = a4;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[ATXEngagementRecordManager _removeEngagementsOnQueuePassingTest:](self, "_removeEngagementsOnQueuePassingTest:", v12);

}

uint64_t __128__ATXEngagementRecordManager_removeEngagementForExecutableIdentifier_recordType_abortingRemovalIfEngagementDateIsLaterThanDate___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "executable");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqual:](v4, "isEqual:", a1[4]))
  {
LABEL_6:

    goto LABEL_7;
  }
  v5 = objc_msgSend(v3, "engagementRecordType");
  v6 = a1[6];

  if (v5 != v6)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v7 = (void *)a1[5];
  objc_msgSend(v3, "dateEngaged");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "laterDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)a1[5];

  __atxlog_handle_home_screen();
  v4 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v9 != v10)
  {
    if (v11)
    {
      v12 = a1[6];
      v13 = a1[4];
      v18 = 134218242;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "EngagementRecordManager: not removing engagement (type %lu) for executable identifier %@ because it was engaged too recently", (uint8_t *)&v18, 0x16u);
    }
    goto LABEL_6;
  }
  if (v11)
  {
    v16 = a1[6];
    v17 = a1[4];
    v18 = 134218242;
    v19 = v16;
    v20 = 2112;
    v21 = v17;
    _os_log_impl(&dword_1A49EF000, v4, OS_LOG_TYPE_DEFAULT, "EngagementRecordManager: removing engagement (type %lu) for executable identifier %@", (uint8_t *)&v18, 0x16u);
  }

  v14 = 1;
LABEL_8:

  return v14;
}

- (void)_removeEngagementsOnQueuePassingTest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ATXEngagementRecordManager__removeEngagementsOnQueuePassingTest___block_invoke;
  v7[3] = &unk_1E4D57678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __67__ATXEngagementRecordManager__removeEngagementsOnQueuePassingTest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
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

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_engagedEntriesNoSync");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)))
          objc_msgSend(v3, "addObject:", v9, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "minusSet:", v3);
    objc_msgSend(*(id *)(a1 + 32), "_serializeAndWriteNoSyncSet:", v4);
  }

}

- (void)removeAllEngagementsWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ATXEngagementRecordManager_removeAllEngagementsWithCompletion___block_invoke;
  v7[3] = &unk_1E4D57678;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __65__ATXEngagementRecordManager_removeAllEngagementsWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "_serializeAndWriteNoSyncSet:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)hasReferenceForSuggestion:(id)a3
{
  void *v4;

  ATXExecutableIdentifierForSuggestion(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ATXEngagementRecordManager _referenceCountForExecutable:](self, "_referenceCountForExecutable:", v4) != 0;

  return (char)self;
}

- (id)_identifiersFromEntries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "executable", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)fetchEngagedEntriesWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__ATXEngagementRecordManager_fetchEngagedEntriesWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4D58780;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __71__ATXEngagementRecordManager_fetchEngagedEntriesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_engagedEntriesNoSync");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __51__ATXEngagementRecordManager__engagedEntriesNoSync__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_readData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_addEngagedSuggestionNoSync:(id)a3 type:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_class *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ATXAllowedEngagementRecordManagerClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executableClassString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "containsObject:", v9);

  if (v10)
  {
    ATXExecutableIdentifierForSuggestion(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientModelSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientModelId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXEngagementRecordManager _addEngagedExcutableNoSync:clientModelId:type:](self, "_addEngagedExcutableNoSync:clientModelId:type:", v11, v13, a4);
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "%@ - adding engaged suggestion to engagement record manager: %@", (uint8_t *)&v20, 0x16u);

    }
    if (a4 == 4)
    {
      __atxlog_handle_home_screen();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "executableSpecification");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "executableIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v19;
        _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "EngagementRecordManager: adding inferred engagement for suggestion with executable spec ID %@", (uint8_t *)&v20, 0xCu);

      }
    }

  }
}

- (void)_addEngagedExcutableNoSync:(id)a3 clientModelId:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  ATXExecutableReferenceManager *referenceManager;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a4;
  referenceManager = self->_referenceManager;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__ATXEngagementRecordManager__addEngagedExcutableNoSync_clientModelId_type___block_invoke;
  v13[3] = &unk_1E4D594B0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a5;
  v11 = v9;
  v12 = v8;
  -[ATXExecutableReferenceManager performBatchUpdateOfReferencesWithBlock:](referenceManager, "performBatchUpdateOfReferencesWithBlock:", v13);

}

void __76__ATXEngagementRecordManager__addEngagedExcutableNoSync_clientModelId_type___block_invoke(uint64_t a1)
{
  ATXEngagementRecordEntry *v2;
  uint64_t v3;
  void *v4;
  ATXEngagementRecordEntry *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "updateDateOfReferenceForExecutable:clientModelId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_engagedEntriesNoSync");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [ATXEngagementRecordEntry alloc];
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXEngagementRecordEntry initWithExecutable:dateEngaged:engagementRecordType:](v2, "initWithExecutable:dateEngaged:engagementRecordType:", v3, v4, *(_QWORD *)(a1 + 56));

  objc_msgSend(v6, "removeObject:", v5);
  objc_msgSend(v6, "addObject:", v5);
  objc_msgSend(*(id *)(a1 + 32), "_serializeAndWriteNoSyncSet:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_logDidAddEntryToBiomeStream:", v5);

}

- (void)_addHiddenSuggestionNoSync:(id)a3 duration:(double)a4 engagementRecordType:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  ATXExecutableReferenceManager *referenceManager;
  id v15;
  id v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  double v23;
  unint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ATXAllowedEngagementRecordManagerClasses();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executableSpecification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executableClassString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "containsObject:", v11);

  if (v12)
  {
    ATXExecutableIdentifierForSuggestion(v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    referenceManager = self->_referenceManager;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __87__ATXEngagementRecordManager__addHiddenSuggestionNoSync_duration_engagementRecordType___block_invoke;
    v20[3] = &unk_1E4D59598;
    v23 = a4;
    v20[4] = self;
    v21 = v13;
    v15 = v8;
    v22 = v15;
    v24 = a5;
    v16 = v13;
    -[ATXExecutableReferenceManager performBatchUpdateOfReferencesWithBlock:](referenceManager, "performBatchUpdateOfReferencesWithBlock:", v20);
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v19;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "%@ - adding explicitly rejected suggestion to engagement record manager: %@", buf, 0x16u);

    }
  }

}

void __87__ATXEngagementRecordManager__addHiddenSuggestionNoSync_duration_engagementRecordType___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ATXEngagementRecordEntry *v9;
  uint64_t v10;
  void *v11;
  ATXEngagementRecordEntry *v12;
  id v13;

  v2 = *(double *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2 < *(double *)(v3 + 40))
    v2 = *(double *)(v3 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v2);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 48), "clientModelSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markReferenceAsHiddenForExecutable:clientModelId:untilDate:", v4, v7, v13);

  objc_msgSend(*(id *)(a1 + 32), "_engagedEntriesNoSync");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [ATXEngagementRecordEntry alloc];
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXEngagementRecordEntry initWithExecutable:dateEngaged:engagementRecordType:](v9, "initWithExecutable:dateEngaged:engagementRecordType:", v10, v11, *(_QWORD *)(a1 + 64));

  objc_msgSend(v8, "addObject:", v12);
  objc_msgSend(*(id *)(a1 + 32), "_serializeAndWriteNoSyncSet:", v8);
  objc_msgSend(*(id *)(a1 + 32), "_logDidAddEntryToBiomeStream:", v12);

}

- (void)_logDidAddEntryToBiomeStream:(id)a3
{
  NSObject *queue;
  id v5;
  ATXBiomeERMStream *v6;
  ATXBiomeERMStream *eventStream;
  ATXExecutableReferenceManager *referenceManager;
  void *v9;
  ATXERMEvent *v10;
  void *v11;
  ATXERMEvent *v12;
  void *v13;
  id v14;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  if (!self->_eventStream)
  {
    v6 = objc_alloc_init(ATXBiomeERMStream);
    eventStream = self->_eventStream;
    self->_eventStream = v6;

  }
  referenceManager = self->_referenceManager;
  objc_msgSend(v5, "executable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXExecutableReferenceManager clientModelIdsForExecutable:](referenceManager, "clientModelIdsForExecutable:", v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v10 = [ATXERMEvent alloc];
  v11 = (void *)objc_opt_new();
  v12 = -[ATXERMEvent initWithEventDate:eventType:recordEntry:clientModelIds:](v10, "initWithEventDate:eventType:recordEntry:clientModelIds:", v11, 1, v5, v14);

  -[ATXBiomeERMStream source](self->_eventStream, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:", v12);

}

- (void)_serializeAndWriteNoSyncSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t v17[8];
  _QWORD v18[5];
  id v19;
  id v20;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)MEMORY[0x1A85A4F90]();
  v6 = (void *)MEMORY[0x1A85A4F90]();
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v20;
  objc_autoreleasePoolPop(v6);
  if (v7)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__ATXEngagementRecordManager__serializeAndWriteNoSyncSet___block_invoke;
    v18[3] = &unk_1E4D57258;
    v18[4] = self;
    v19 = v7;
    +[ATXRunningBoardAssertion performWorkWithFinishTaskAssertionName:block:](ATXRunningBoardAssertion, "performWorkWithFinishTaskAssertionName:block:", CFSTR("ATXEngagementRecordManager"), v18);
    __atxlog_handle_blending();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_DEFAULT, "Refreshing blending after engagement record manager update", v17, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D81198], "refreshBlendingLayerWithReason:", CFSTR("ERM change"));
  }
  else
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ATXEngagementRecordManager _serializeAndWriteNoSyncSet:].cold.1((uint64_t)v8, v10, v11, v12, v13, v14, v15, v16);

  }
  objc_autoreleasePoolPop(v5);

}

uint64_t __58__ATXEngagementRecordManager__serializeAndWriteNoSyncSet___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeData:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_writeData:(id)a3
{
  id v4;
  int v5;
  int v6;
  char v7;
  NSObject *v8;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = open(-[NSString fileSystemRepresentation](self->_path, "fileSystemRepresentation"), 514, 384);
  if (v5 == -1)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXEngagementRecordManager _writeData:].cold.1();
    v7 = 0;
  }
  else
  {
    v6 = v5;
    v7 = ATXCacheFileWrite();
    if ((v6 & 0x80000000) == 0)
      close(v6);
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = CFSTR("ATXEngagementRecords.pb");
      _os_log_impl(&dword_1A49EF000, v8, OS_LOG_TYPE_DEFAULT, "Successfully wrote data to cache file: %@", buf, 0xCu);
    }
  }

  return v7;
}

- (unint64_t)_referenceCountForExecutable:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ATXEngagementRecordManager__referenceCountForExecutable___block_invoke;
  block[3] = &unk_1E4D595C0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __59__ATXEngagementRecordManager__referenceCountForExecutable___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 8), "referenceCountForExecutable:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (double)minDurationForTrackedReferencesToStayAround
{
  return self->_minDurationForTrackedReferencesToStayAround;
}

- (void)setMinDurationForTrackedReferencesToStayAround:(double)a3
{
  self->_minDurationForTrackedReferencesToStayAround = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_referenceManager, 0);
}

- (void)addEngagedExecutable:(uint64_t)a3 clientModelId:(uint64_t)a4 engagementRecordType:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a2, a3, "EngagementRecordManager: addEngagedExecutable null for engagementRecordType: %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

- (void)_engagedEntriesNoSync
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Unable to get recent suggestions: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_serializeAndWriteNoSyncSet:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1A49EF000, a2, a3, "Unable to serialize recent engagements. Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_writeData:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_17(&dword_1A49EF000, v1, v2, "Couldn't create cache file: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

- (void)_readData
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_17(&dword_1A49EF000, v1, v2, "Couldn't open recently engaged cache file: [%i] %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3();
}

@end
