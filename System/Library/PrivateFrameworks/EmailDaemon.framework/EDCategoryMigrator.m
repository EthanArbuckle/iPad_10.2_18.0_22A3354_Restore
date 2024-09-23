@implementation EDCategoryMigrator

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__EDCategoryMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_14 != -1)
    dispatch_once(&log_onceToken_14, block);
  return (OS_os_log *)(id)log_log_14;
}

void __25__EDCategoryMigrator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_14;
  log_log_14 = (uint64_t)v1;

}

+ (void)initializeIfNeededWithCategoryPersistence:(id)a3 categorizer:(id)a4 messagePersistence:(id)a5 activityPersistence:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__EDCategoryMigrator_initializeIfNeededWithCategoryPersistence_categorizer_messagePersistence_activityPersistence___block_invoke;
  block[3] = &unk_1E949B680;
  v19 = v9;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v13 = initializeIfNeededWithCategoryPersistence_categorizer_messagePersistence_activityPersistence__once;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  v17 = v9;
  if (v13 != -1)
    dispatch_once(&initializeIfNeededWithCategoryPersistence_categorizer_messagePersistence_activityPersistence__once, block);

}

void __115__EDCategoryMigrator_initializeIfNeededWithCategoryPersistence_categorizer_messagePersistence_activityPersistence___block_invoke(_QWORD *a1)
{
  EDCategoryMigrator *v1;
  void *v2;

  v1 = -[EDCategoryMigrator initWithCategoryPersistence:categorizer:messagePersistence:activityPersistence:]([EDCategoryMigrator alloc], "initWithCategoryPersistence:categorizer:messagePersistence:activityPersistence:", a1[4], a1[5], a1[6], a1[7]);
  v2 = (void *)sDefaultInstance;
  sDefaultInstance = (uint64_t)v1;

}

+ (void)migrateCategoryForQuery:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5 task:(id)a6
{
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v9 = a4;
  v10 = a6;
  if (v11)
    objc_msgSend((id)sDefaultInstance, "_migrateCategoryForQuery:cancelationToken:reason:task:", v11, v9, a5, v10);

}

+ (void)migrateCategoryForQuery:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5
{
  objc_msgSend((id)sDefaultInstance, "_categorizeMessagesForQuery:cancelationToken:", a3, a4, a5);
}

- (EDCategoryMigrator)initWithCategoryPersistence:(id)a3 categorizer:(id)a4 messagePersistence:(id)a5 activityPersistence:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDCategoryMigrator *v15;
  uint64_t v16;
  EFScheduler *categorizationWriterScheduler;
  EFCancelable *haveAccessToDb;
  NSObject *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *categorizationQueue;
  id v23;
  id v24;
  uint64_t v25;
  EFLocked *activityForMailboxID;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v28.receiver = self;
  v28.super_class = (Class)EDCategoryMigrator;
  v15 = -[EDCategoryMigrator init](&v28, sel_init);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.CategoryMigrator.writer"), 9);
    v16 = objc_claimAutoreleasedReturnValue();
    categorizationWriterScheduler = v15->_categorizationWriterScheduler;
    v15->_categorizationWriterScheduler = (EFScheduler *)v16;

    objc_storeStrong((id *)&v15->_categoryPersistence, a3);
    objc_storeStrong((id *)&v15->_messagePersistence, a5);
    objc_storeStrong((id *)&v15->_categorizer, a4);
    haveAccessToDb = v15->_haveAccessToDb;
    v15->_haveAccessToDb = 0;

    v15->_canBeResumed = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_DEFAULT, 0);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = dispatch_queue_create(0, v20);
    categorizationQueue = v15->_categorizationQueue;
    v15->_categorizationQueue = (OS_dispatch_queue *)v21;

    objc_storeStrong((id *)&v15->_activityPersistence, a6);
    v23 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v25 = objc_msgSend(v23, "initWithObject:", v24);
    activityForMailboxID = v15->_activityForMailboxID;
    v15->_activityForMailboxID = (EFLocked *)v25;

  }
  return v15;
}

- (void)_migrateCategoryForQuery:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5 task:(id)a6
{
  id v11;
  id v12;
  id v13;
  EDCategoryPersistence *categoryPersistence;
  EFCancelable *v15;
  id v16;
  EFCancelable *haveAccessToDb;
  NSObject *v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!self->_haveAccessToDb)
  {
    categoryPersistence = self->_categoryPersistence;
    v20 = 0;
    -[EDCategoryPersistence requestProtectedDatabaseBackgroundProcessingForDuration:error:](categoryPersistence, "requestProtectedDatabaseBackgroundProcessingForDuration:error:", &v20, 14400.0);
    v15 = (EFCancelable *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    haveAccessToDb = self->_haveAccessToDb;
    self->_haveAccessToDb = v15;

    if (v16)
    {
      +[EDCategoryMigrator log](EDCategoryMigrator, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "description");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v19;
        _os_log_impl(&dword_1D2F2C000, v18, OS_LOG_TYPE_DEFAULT, "Category migrator failed to obtain background processing permission : %@", buf, 0xCu);

      }
    }

  }
  objc_storeStrong((id *)&self->_categorizationQuery, a3);
  objc_storeStrong((id *)&self->_categorizationCancelationToken, a4);
  self->_reason = a5;
  -[EDCategoryMigrator _handleCategoryMigration:](self, "_handleCategoryMigration:", v13);

}

- (void)_handleCategoryMigration:(id)a3
{
  id v4;
  char v5;
  __CFString *v6;
  NSObject *v7;
  const __CFString *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__EDCategoryMigrator__handleCategoryMigration___block_invoke;
  v16[3] = &unk_1E949AEB8;
  v16[4] = self;
  objc_msgSend(v4, "setExpirationHandler:", v16);
  -[EDCategoryMigrator _categorizeMessagesForQuery:cancelationToken:](self, "_categorizeMessagesForQuery:cancelationToken:", self->_categorizationQuery, self->_categorizationCancelationToken);
  if (!self->_canBeResumed)
  {
    if (-[EFCancelationToken isCanceled](self->_categorizationCancelationToken, "isCanceled"))
    {
      +[EDCategoryMigrator log](EDCategoryMigrator, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Category migrator was canceled. Returning early", buf, 2u);
      }

      -[EDCategoryMigrator _endCategorizationTask:](self, "_endCategorizationTask:", v4);
      goto LABEL_20;
    }
    -[EDCategoryMigrator _endCategorizationTask:](self, "_endCategorizationTask:", v4);
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.email.categorization.FastPass"));

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D00E58], "reportFeatureCheckpoint:forFeature:error:", 30, 300, 0);
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.mail.blackpearl.categorizer")))
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("markedCategorizationAvailable"));

        if ((v14 & 1) != 0
          || !objc_msgSend(MEMORY[0x1E0D00E58], "reportFeatureCheckpoint:forFeature:error:", 50, 300, 0))
        {
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setBool:forKey:", 1, CFSTR("markedCategorizationAvailable"));
      }

    }
LABEL_20:
    objc_msgSend(v4, "setTaskCompleted");
    goto LABEL_21;
  }
  -[EDCategoryMigrator _endCategorizationTask:](self, "_endCategorizationTask:", v4);
  v15 = 0;
  v5 = objc_msgSend(v4, "setTaskExpiredWithRetryAfter:error:", &v15, 0.0);
  v6 = (__CFString *)v15;
  if ((v5 & 1) == 0)
  {
    +[EDCategoryMigrator log](EDCategoryMigrator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = CFSTR("Unknown");
      if (v6)
        v8 = v6;
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Category migrator failed to expire task with error: %@", buf, 0xCu);
    }

    objc_msgSend(v4, "setTaskCompleted");
  }

LABEL_21:
}

uint64_t __47__EDCategoryMigrator__handleCategoryMigration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[EDCategoryMigrator log](EDCategoryMigrator, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Category migrator %@ expired by DASD", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "categorizationCancelationToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  return objc_msgSend(*(id *)(a1 + 32), "setCanBeResumed:", 1);
}

- (void)_endCategorizationTask:(id)a3
{
  EFCancelable *haveAccessToDb;
  EMQuery *categorizationQuery;
  EFCancelationToken *categorizationCancelationToken;

  -[EFCancelable cancel](self->_haveAccessToDb, "cancel", a3);
  haveAccessToDb = self->_haveAccessToDb;
  self->_haveAccessToDb = 0;

  categorizationQuery = self->_categorizationQuery;
  self->_categorizationQuery = 0;

  categorizationCancelationToken = self->_categorizationCancelationToken;
  self->_categorizationCancelationToken = 0;

  self->_canBeResumed = 0;
}

- (void)_categorizeMessagesForQuery:(id)a3 cancelationToken:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint8_t v17[16];
  _QWORD v18[4];
  id v19;
  EDCategoryMigrator *v20;
  id v21;
  uint8_t *v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDCategoryMigrator-BlackPearl.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

  }
  objc_msgSend(MEMORY[0x1E0D1EF58], "transactionWithDescription:", CFSTR("com.apple.email.categoryMigrator.categorizeMessages"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  +[EDCategoryMigrator log](EDCategoryMigrator, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Category migrator querying for messages to recategorize", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x2020000000;
  v26 = 0;
  -[EDCategoryMigrator messagePersistence](self, "messagePersistence");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken___block_invoke;
  v18[3] = &unk_1E949BB20;
  v13 = v10;
  v22 = buf;
  v19 = v13;
  v20 = self;
  v14 = v8;
  v21 = v14;
  objc_msgSend(v12, "iteratePersistedMessagesMatchingQuery:limit:cancelationToken:requireProtectedData:handler:", v7, 0x7FFFFFFFFFFFFFFFLL, v14, 1, v18);

  if (objc_msgSend(v14, "isCanceled"))
  {
    +[EDCategoryMigrator log](EDCategoryMigrator, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Migration was canceled. Returning early", v17, 2u);
    }
    goto LABEL_10;
  }
  if (objc_msgSend(v13, "count"))
  {
    v15 = objc_msgSend(v13, "copy");
    -[EDCategoryMigrator _categorizeMessageBatch:cancelationToken:reason:](self, "_categorizeMessageBatch:cancelationToken:reason:", v15, v14, self->_reason);
LABEL_10:

  }
  objc_msgSend(v9, "invalidate");

  _Block_object_dispose(buf, 8);
}

void __67__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[EDCategoryMigrator log](EDCategoryMigrator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __67__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken___block_invoke_cold_1(v8, (uint8_t *)&v12, v7);
    }
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= 0x64)
  {
    +[EDCategoryMigrator log](EDCategoryMigrator, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(_QWORD *)(v10 + 24) + 1;
      *(_QWORD *)(v10 + 24) = v11;
      v12 = 134217984;
      v13 = v11;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Category migrator reached maximum batch size batchCount:%ld", (uint8_t *)&v12, 0xCu);
    }

    v7 = objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 40), "_categorizeMessageBatch:cancelationToken:reason:", v7, *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "reason"));
    goto LABEL_8;
  }
LABEL_9:

}

- (void)_categorizeMessageBatch:(id)a3 cancelationToken:(id)a4 reason:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a4;
  -[EDCategoryMigrator categorizationWriterScheduler](self, "categorizationWriterScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__EDCategoryMigrator__categorizeMessageBatch_cancelationToken_reason___block_invoke;
  v13[3] = &unk_1E949BB48;
  v13[4] = self;
  v11 = v8;
  v14 = v11;
  v12 = v9;
  v15 = v12;
  v16 = a5;
  objc_msgSend(v10, "performBlock:", v13);

}

void __70__EDCategoryMigrator__categorizeMessageBatch_cancelationToken_reason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_updateCategorizationActivityForMessageBatch:isFinished:cancelationToken:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
  +[EDCategoryMigrator log](EDCategoryMigrator, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 134217984;
    v10 = v3;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Category migrator recategorizing %lu messages to match current categorization version.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "categorizer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "categorizeMessages:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 32), "_updateCategorizationActivityForMessageBatch:isFinished:cancelationToken:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
  +[EDCategoryMigrator log](EDCategoryMigrator, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Category migrator successfully categorized a batch of messages", (uint8_t *)&v9, 2u);
    }

  }
  else
  {
    if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_DEFAULT, "Category migrator failed to successfully recategorize messages", (uint8_t *)&v9, 2u);
    }

    v8 = *(void **)(a1 + 48);
    if (v8)
      objc_msgSend(v8, "cancel");
  }
}

- (EFScheduler)categorizationWriterScheduler
{
  return self->_categorizationWriterScheduler;
}

- (BOOL)canBeResumed
{
  return self->_canBeResumed;
}

- (void)setCanBeResumed:(BOOL)a3
{
  self->_canBeResumed = a3;
}

- (EFCancelable)haveAccessToDb
{
  return self->_haveAccessToDb;
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDActivityPersistence)activityPersistence
{
  return self->_activityPersistence;
}

- (EFLocked)activityForMailboxID
{
  return self->_activityForMailboxID;
}

- (void)setActivityForMailboxID:(id)a3
{
  objc_storeStrong((id *)&self->_activityForMailboxID, a3);
}

- (EDMessageCategorizer)categorizer
{
  return self->_categorizer;
}

- (OS_dispatch_queue)categorizationQueue
{
  return self->_categorizationQueue;
}

- (EMQuery)categorizationQuery
{
  return self->_categorizationQuery;
}

- (EFCancelationToken)categorizationCancelationToken
{
  return self->_categorizationCancelationToken;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categorizationCancelationToken, 0);
  objc_storeStrong((id *)&self->_categorizationQuery, 0);
  objc_storeStrong((id *)&self->_categorizationQueue, 0);
  objc_storeStrong((id *)&self->_categorizer, 0);
  objc_storeStrong((id *)&self->_activityForMailboxID, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_haveAccessToDb, 0);
  objc_storeStrong((id *)&self->_categorizationWriterScheduler, 0);
}

void __67__EDCategoryMigrator__categorizeMessagesForQuery_cancelationToken___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Category migrator query failed with error %{public}@", buf, 0xCu);

}

@end
