@implementation EDCategorySubsystem

- (void)scheduleRecurringActivity
{
  id v3;

  -[EDCategorySubsystem petLog](self, "petLog");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[EDCategorySubsystem _schedulePETSubmissionActivityForLog:](self, "_schedulePETSubmissionActivityForLog:");

}

- (EDPETInteractionEventLog)petLog
{
  return self->_petLog;
}

- (void)_schedulePETSubmissionActivityForLog:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v7;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__EDCategorySubsystem__schedulePETSubmissionActivityForLog___block_invoke_2;
  aBlock[3] = &unk_1E949BC90;
  v7 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);
  ef_xpc_activity_register();

}

void __60__EDCategorySubsystem__schedulePETSubmissionActivityForLog___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808D0], 0);

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__EDCategorySubsystem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_16 != -1)
    dispatch_once(&log_onceToken_16, block);
  return (OS_os_log *)(id)log_log_16;
}

void __26__EDCategorySubsystem_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_16;
  log_log_16 = (uint64_t)v1;

}

- (EDCategorySubsystem)initWithPersistence:(id)a3 userProfileProvider:(id)a4 vipManager:(id)a5 sourceApplicationBundleIdentifier:(id)a6 categorizationAnalyticsLogger:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDCategorySubsystem *v15;
  void *v16;
  uint64_t v17;
  EDMessagePersistence *messagePersistence;
  void *v19;
  EDPETInteractionEventLog *v20;
  EDPETInteractionEventLog *petLog;
  uint64_t v22;
  EDBiomeInteractionEventLog *biomeLog;
  EDInteractionEventLogMultiplexer *v24;
  EDInteractionLogger *v25;
  EDMessagePersistence *v26;
  void *v27;
  uint64_t v28;
  EDInteractionLogger *interactionLogger;
  uint64_t v30;
  EDCategoryPersistence *categoryPersistence;
  uint64_t v32;
  EDActivityPersistence *activityPersistence;
  EDMessageCategorizer *v34;
  EDCategoryPersistence *v35;
  void *v36;
  uint64_t v37;
  EDMessageCategorizer *messageCategorizer;
  EDMessageAuthenticator *v39;
  EDMessageAuthenticator *messageAuthenticator;
  EDMessageCategorizer *v41;
  void *v42;
  EDMessageAuthenticator *v43;
  void *v44;
  void *v46;
  id v47;
  void *v48;
  objc_super v49;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v49.receiver = self;
  v49.super_class = (Class)EDCategorySubsystem;
  v15 = -[EDCategorySubsystem init](&v49, sel_init);
  if (v15)
  {
    v47 = v14;
    objc_msgSend(v11, "hookRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97298], "em_authorizedContactStore");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "messagePersistence");
    v17 = objc_claimAutoreleasedReturnValue();
    messagePersistence = v15->_messagePersistence;
    v15->_messagePersistence = (EDMessagePersistence *)v17;

    if (EMInteractionLoggerShouldLog())
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0D1E2B8], "mailDataDirectory");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[EDPETInteractionEventLog initWithDirectory:userProfileProvider:contactStore:vipManager:]([EDPETInteractionEventLog alloc], "initWithDirectory:userProfileProvider:contactStore:vipManager:", v46, v12, v48, v13);
      petLog = v15->_petLog;
      v15->_petLog = v20;

      objc_msgSend(v19, "addObject:", v15->_petLog);
      v22 = objc_opt_new();
      biomeLog = v15->_biomeLog;
      v15->_biomeLog = (EDBiomeInteractionEventLog *)v22;

      objc_msgSend(v19, "addObject:", v15->_biomeLog);
      v24 = -[EDInteractionEventLogMultiplexer initWithLogs:]([EDInteractionEventLogMultiplexer alloc], "initWithLogs:", v19);
      v25 = [EDInteractionLogger alloc];
      v26 = v15->_messagePersistence;
      objc_msgSend(v11, "mailboxPersistence");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[EDInteractionLogger initWithMessagePersistence:mailboxPersistence:eventLog:](v25, "initWithMessagePersistence:mailboxPersistence:eventLog:", v26, v27, v24);
      interactionLogger = v15->_interactionLogger;
      v15->_interactionLogger = (EDInteractionLogger *)v28;

      objc_msgSend(v16, "registerMessageChangeHookResponder:", v15->_interactionLogger);
      objc_msgSend(v16, "registerMessageDeliveryHookResponder:", v15->_interactionLogger);
      objc_msgSend(v16, "registerCategoryChangeHookResponder:", v15->_interactionLogger);

    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v11, "categoryPersistence");
    v30 = objc_claimAutoreleasedReturnValue();
    categoryPersistence = v15->_categoryPersistence;
    v15->_categoryPersistence = (EDCategoryPersistence *)v30;

    objc_msgSend(v11, "activityPersistence");
    v32 = objc_claimAutoreleasedReturnValue();
    activityPersistence = v15->_activityPersistence;
    v15->_activityPersistence = (EDActivityPersistence *)v32;

    v34 = [EDMessageCategorizer alloc];
    v35 = v15->_categoryPersistence;
    objc_msgSend(v11, "senderPersistence");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[EDMessageCategorizer initWithCategoryPersistence:eventLog:vipManager:contactStore:analyticsLogger:senderPersistence:hookRegistry:](v34, "initWithCategoryPersistence:eventLog:vipManager:contactStore:analyticsLogger:senderPersistence:hookRegistry:", v35, v24, v13, v48, v47, v36, v16);
    messageCategorizer = v15->_messageCategorizer;
    v15->_messageCategorizer = (EDMessageCategorizer *)v37;

    v39 = -[EDMessageAuthenticator initWithMessagePersistence:hookRegistry:]([EDMessageAuthenticator alloc], "initWithMessagePersistence:hookRegistry:", v15->_messagePersistence, v16);
    messageAuthenticator = v15->_messageAuthenticator;
    v15->_messageAuthenticator = v39;

    v41 = v15->_messageCategorizer;
    objc_msgSend(v11, "messageChangeManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setMessageCategorizer:", v41);

    v43 = v15->_messageAuthenticator;
    objc_msgSend(v11, "messageChangeManager");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setMessageAuthenticator:", v43);

    v14 = v47;
  }

  return v15;
}

- (void)start
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[8];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  +[EDCategorySubsystem log](EDCategorySubsystem, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_DEFAULT, "Registering Mail Categorization FastPass task.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__EDCategorySubsystem_start__block_invoke;
  v9[3] = &unk_1E949BC20;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.email.categorization.FastPass"), 0, v9);

  +[EDCategorySubsystem log](EDCategorySubsystem, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Registering Mail Categorization task.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __28__EDCategorySubsystem_start__block_invoke_16;
  v7[3] = &unk_1E949BC48;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.mail.blackpearl.categorizer"), 0, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __28__EDCategorySubsystem_start__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[EDCategorySubsystem log](EDCategorySubsystem, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Mail Categorization FastPass started.", v6, 2u);
    }

    objc_msgSend(WeakRetained, "_startCategoryMigrationWithBGTask:andReason:", v3, 1);
  }

}

void __28__EDCategorySubsystem_start__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    +[EDCategorySubsystem log](EDCategorySubsystem, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Mail Categorization started.", v6, 2u);
    }

    objc_msgSend(WeakRetained, "_startCategoryMigrationWithBGTask:andReason:", v3, 1);
  }

}

- (void)_startCategoryMigrationWithBGTask:(id)a3 andReason:(int64_t)a4
{
  id v6;
  EDMessageAuthenticationAndCategoryMigrator *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  EDMessageAuthenticationAndCategoryMigrator *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (_os_feature_enabled_impl())
  {
    v7 = [EDMessageAuthenticationAndCategoryMigrator alloc];
    -[EDCategorySubsystem categoryPersistence](self, "categoryPersistence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDCategorySubsystem messageCategorizer](self, "messageCategorizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDCategorySubsystem messageAuthenticator](self, "messageAuthenticator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDCategorySubsystem messagePersistence](self, "messagePersistence");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDCategorySubsystem activityPersistence](self, "activityPersistence");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EDMessageAuthenticationAndCategoryMigrator initWithCategoryPersistence:categorizer:authenticator:messagePersistence:activityPersistence:reason:](v7, "initWithCategoryPersistence:categorizer:authenticator:messagePersistence:activityPersistence:reason:", v8, v9, v10, v11, v12, a4);
    -[EDCategorySubsystem setMigrator:](self, "setMigrator:", v13);

    -[EDCategorySubsystem migrator](self, "migrator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "startMigrationIfNecessaryWithCompletion:", v6);

  }
  else
  {
    +[EDCategorySubsystem log](EDCategorySubsystem, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1D2F2C000, v16, OS_LOG_TYPE_DEFAULT, "BlackPearl disabled - Mail Categorization Task %@ being marked as complete", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v6, "setTaskCompleted");
  }

}

void __60__EDCategorySubsystem__schedulePETSubmissionActivityForLog___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "batchedEventsForSubmission");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v3 = v1;
    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "logMessage:", v3);

    v1 = v3;
  }

}

- (EDInteractionLogger)interactionLogger
{
  return self->_interactionLogger;
}

- (EDBiomeInteractionEventLog)biomeLog
{
  return self->_biomeLog;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EDActivityPersistence)activityPersistence
{
  return self->_activityPersistence;
}

- (EDMessageAuthenticationAndCategoryMigrator)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
  objc_storeStrong((id *)&self->_migrator, a3);
}

- (EDMessageCategorizer)messageCategorizer
{
  return self->_messageCategorizer;
}

- (EDMessageAuthenticator)messageAuthenticator
{
  return self->_messageAuthenticator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageAuthenticator, 0);
  objc_storeStrong((id *)&self->_messageCategorizer, 0);
  objc_storeStrong((id *)&self->_migrator, 0);
  objc_storeStrong((id *)&self->_activityPersistence, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_biomeLog, 0);
  objc_storeStrong((id *)&self->_petLog, 0);
  objc_storeStrong((id *)&self->_interactionLogger, 0);
}

@end
