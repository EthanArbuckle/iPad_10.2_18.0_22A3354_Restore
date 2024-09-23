@implementation EDMessageAuthenticationAndCategoryMigrator

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__EDMessageAuthenticationAndCategoryMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_44 != -1)
    dispatch_once(&log_onceToken_44, block);
  return (OS_os_log *)(id)log_log_44;
}

void __49__EDMessageAuthenticationAndCategoryMigrator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_44;
  log_log_44 = (uint64_t)v1;

}

- (EDMessageAuthenticationAndCategoryMigrator)initWithCategoryPersistence:(id)a3 categorizer:(id)a4 authenticator:(id)a5 messagePersistence:(id)a6 activityPersistence:(id)a7 reason:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  EDMessageAuthenticationAndCategoryMigrator *v18;
  EDMessageAuthenticationAndCategoryMigrator *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *contentProtectionQueue;
  uint64_t v24;
  EFScheduler *backgroundMessageMigrationScheduler;
  uint64_t v26;
  NSConditionLock *contentProtectionState;
  EDMessageAuthenticationStateMigrator *v28;
  EDMessageAuthenticationStateMigrator *authenticationStateMigrator;
  id v32;
  objc_super v33;

  v14 = a3;
  v32 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v33.receiver = self;
  v33.super_class = (Class)EDMessageAuthenticationAndCategoryMigrator;
  v18 = -[EDMessageAuthenticationAndCategoryMigrator init](&v33, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_categoryPersistence, a3);
    objc_storeStrong((id *)&v19->_messagePersistence, a6);
    objc_storeStrong((id *)&v19->_categorizer, a4);
    objc_storeStrong((id *)&v19->_authenticator, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.email.EDMessageAuthenticationAndCategoryMigrator", v21);
    contentProtectionQueue = v19->_contentProtectionQueue;
    v19->_contentProtectionQueue = (OS_dispatch_queue *)v22;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.email.MessageMigrator"), 9);
    v24 = objc_claimAutoreleasedReturnValue();
    backgroundMessageMigrationScheduler = v19->_backgroundMessageMigrationScheduler;
    v19->_backgroundMessageMigrationScheduler = (EFScheduler *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3538]), "initWithCondition:", 0);
    contentProtectionState = v19->_contentProtectionState;
    v19->_contentProtectionState = (NSConditionLock *)v26;

    v28 = -[EDMessageAuthenticationStateMigrator initWithCategoryPersistence:authenticator:messagePersistence:]([EDMessageAuthenticationStateMigrator alloc], "initWithCategoryPersistence:authenticator:messagePersistence:", v14, v15, v16);
    authenticationStateMigrator = v19->_authenticationStateMigrator;
    v19->_authenticationStateMigrator = v28;

    +[EDCategoryMigrator initializeIfNeededWithCategoryPersistence:categorizer:messagePersistence:activityPersistence:](EDCategoryMigrator, "initializeIfNeededWithCategoryPersistence:categorizer:messagePersistence:activityPersistence:", v14, v32, v16, v17);
    v19->_reason = a8;
  }

  return v19;
}

- (id)startMigrationIfNecessaryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    -[EDMessageAuthenticationAndCategoryMigrator categoryPersistence](self, "categoryPersistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDMessageCategorizer queryForMessagesToCategorizeForVersion:](EDMessageCategorizer, "queryForMessagesToCategorizeForVersion:", objc_msgSend(v5, "currentCategorizationVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDMessageAuthenticationStateMigrator queryForMessagesToAuthenticate](EDMessageAuthenticationStateMigrator, "queryForMessagesToAuthenticate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
    +[EDCategoryMigrator migrateCategoryForQuery:cancelationToken:reason:task:](EDCategoryMigrator, "migrateCategoryForQuery:cancelationToken:reason:task:", v6, v8, -[EDMessageAuthenticationAndCategoryMigrator reason](self, "reason"), v4);
    -[EDMessageAuthenticationAndCategoryMigrator authenticationStateMigrator](self, "authenticationStateMigrator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "migrateMessageAuthenticationStateForQuery:cancelationToken:", v7, v8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)startMigrationIfNecessaryWithCategorizationQuery:(id)a3 authenticationQuery:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
    EFRegisterContentProtectionObserver();
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[EDMessageAuthenticationAndCategoryMigrator backgroundMessageMigrationScheduler](self, "backgroundMessageMigrationScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __126__EDMessageAuthenticationAndCategoryMigrator_startMigrationIfNecessaryWithCategorizationQuery_authenticationQuery_completion___block_invoke;
    v17[3] = &unk_1E949CF60;
    objc_copyWeak(&v22, &location);
    v18 = v8;
    v13 = v11;
    v19 = v13;
    v20 = v9;
    v21 = v10;
    objc_msgSend(v12, "performBlock:", v17);

    v14 = v21;
    v15 = v13;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __126__EDMessageAuthenticationAndCategoryMigrator_startMigrationIfNecessaryWithCategorizationQuery_authenticationQuery_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint8_t v13[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_checkContentProtectionState");
    +[EDMessageAuthenticationAndCategoryMigrator log](EDMessageAuthenticationAndCategoryMigrator, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Starting to migrate messages", buf, 2u);
    }

    do
    {
      v5 = (void *)MEMORY[0x1D824B334]();
      objc_msgSend(v3, "contentProtectionState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lockWhenCondition:", 0);

      objc_msgSend(v3, "contentProtectionState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unlock");

      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        +[EDCategoryMigrator migrateCategoryForQuery:cancelationToken:reason:](EDCategoryMigrator, "migrateCategoryForQuery:cancelationToken:reason:", v8, *(_QWORD *)(a1 + 40), 3);
      objc_msgSend(v3, "authenticationStateMigrator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "migrateMessageAuthenticationStateForQuery:cancelationToken:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

      if ((objc_msgSend(*(id *)(a1 + 40), "isCanceled") & 1) == 0)
      {
        if (!objc_msgSend(v3, "_checkContentProtectionState"))
        {
          v11 = 0;
          goto LABEL_14;
        }
        +[EDMessageAuthenticationAndCategoryMigrator log](EDMessageAuthenticationAndCategoryMigrator, "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "No messages found to recategorize.", v13, 2u);
        }

      }
      v11 = 1;
LABEL_14:
      objc_autoreleasePoolPop(v5);
    }
    while (!v11);
  }
  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);

}

- (BOOL)_checkContentProtectionState
{
  EDMessageAuthenticationAndCategoryMigrator *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[EDMessageAuthenticationAndCategoryMigrator contentProtectionQueue](self, "contentProtectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__EDMessageAuthenticationAndCategoryMigrator__checkContentProtectionState__block_invoke;
  v5[3] = &unk_1E949BE40;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __74__EDMessageAuthenticationAndCategoryMigrator__checkContentProtectionState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = EFProtectedDataAvailable();
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "contentProtectionState");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "lock");

    objc_msgSend(*(id *)(a1 + 32), "contentProtectionState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unlockWithCondition:", 1);

    +[EDMessageAuthenticationAndCategoryMigrator log](EDMessageAuthenticationAndCategoryMigrator, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_DEFAULT, "Protected Index unavailable", v5, 2u);
    }

  }
}

- (void)contentProtectionStateChanged:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  -[EDMessageAuthenticationAndCategoryMigrator contentProtectionQueue](self, "contentProtectionQueue", a3, a4);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (a3 == 2)
  {
    +[EDMessageAuthenticationAndCategoryMigrator log](EDMessageAuthenticationAndCategoryMigrator, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Device about to lock", v12, 2u);
    }

    -[EDMessageAuthenticationAndCategoryMigrator contentProtectionState](self, "contentProtectionState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lock");

    -[EDMessageAuthenticationAndCategoryMigrator contentProtectionState](self, "contentProtectionState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlockWithCondition:", 1);
  }
  else
  {
    if (a3)
      return;
    +[EDMessageAuthenticationAndCategoryMigrator log](EDMessageAuthenticationAndCategoryMigrator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "Protected Index became available", buf, 2u);
    }

    -[EDMessageAuthenticationAndCategoryMigrator contentProtectionState](self, "contentProtectionState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lock");

    -[EDMessageAuthenticationAndCategoryMigrator contentProtectionState](self, "contentProtectionState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unlockWithCondition:", 0);
  }

}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EDMessageCategorizer)categorizer
{
  return self->_categorizer;
}

- (EDMessageAuthenticator)authenticator
{
  return self->_authenticator;
}

- (EDMessageAuthenticationStateMigrator)authenticationStateMigrator
{
  return self->_authenticationStateMigrator;
}

- (EDCategoryMigrator)categoryMigrator
{
  return self->_categoryMigrator;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EFScheduler)backgroundMessageMigrationScheduler
{
  return self->_backgroundMessageMigrationScheduler;
}

- (NSConditionLock)contentProtectionState
{
  return self->_contentProtectionState;
}

- (OS_dispatch_queue)contentProtectionQueue
{
  return self->_contentProtectionQueue;
}

- (void)setContentProtectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_contentProtectionQueue, a3);
}

- (int64_t)reason
{
  return self->_reason;
}

- (void)setReason:(int64_t)a3
{
  self->_reason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtectionQueue, 0);
  objc_storeStrong((id *)&self->_contentProtectionState, 0);
  objc_storeStrong((id *)&self->_backgroundMessageMigrationScheduler, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_categoryMigrator, 0);
  objc_storeStrong((id *)&self->_authenticationStateMigrator, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_categorizer, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
}

@end
