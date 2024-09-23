@implementation EDMailboxPredictionController

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EDMailboxPredictionController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_41 != -1)
    dispatch_once(&log_onceToken_41, block);
  return (OS_os_log *)(id)log_log_41;
}

void __36__EDMailboxPredictionController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_41;
  log_log_41 = (uint64_t)v1;

}

- (EDMailboxPredictionController)initWithMessagePersistence:(id)a3 mailboxPersistence:(id)a4 hookRegistry:(id)a5 userProfileProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  EDMailboxPredictionController *v15;
  EDMailboxPredictionController *v16;
  NSObject *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *processingQueue;
  uint64_t v21;
  EDCachingMailboxPredictor *cachingPredictor;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EDMailboxPredictionController;
  v15 = -[EDMailboxPredictionController init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mailboxPersistence, a4);
    objc_storeStrong((id *)&v16->_messagePersistence, a3);
    objc_storeStrong((id *)&v16->_userProfileProvider, a6);
    objc_storeStrong((id *)&v16->_messagePersistence, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create_with_target_V2("com.apple.mail.MailboxPrediction.processing", v17, v18);
    processingQueue = v16->_processingQueue;
    v16->_processingQueue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v16->_hookRegistry, a5);
    -[EDMailboxPredictionController _createPredictor](v16, "_createPredictor");
    v21 = objc_claimAutoreleasedReturnValue();
    cachingPredictor = v16->_cachingPredictor;
    v16->_cachingPredictor = (EDCachingMailboxPredictor *)v21;

    objc_msgSend(v13, "registerMessageChangeHookResponder:", v16);
  }

  return v16;
}

- (id)predictMailboxForMovingObjectIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D1EE90]);
  if ((unint64_t)objc_msgSend(v6, "count") < 4)
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, 3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  -[EDMailboxPredictionController processingQueue](self, "processingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__EDMailboxPredictionController_predictMailboxForMovingObjectIDs_completionHandler___block_invoke;
  v18[3] = &unk_1E949CB00;
  v18[4] = self;
  v19 = v10;
  v12 = v8;
  v20 = v12;
  v21 = v7;
  v13 = v7;
  v14 = v10;
  dispatch_async(v11, v18);

  v15 = v21;
  v16 = v12;

  return v16;
}

void __84__EDMailboxPredictionController_predictMailboxForMovingObjectIDs_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "messagePersistence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistedMessagesForObjectIDs:requireProtectedData:", *(_QWORD *)(a1 + 40), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_predictMailboxForMovingMessages:cancelationToken:completionHandler:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_predictMailboxForMovingMessages:(id)a3 cancelationToken:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((unint64_t)objc_msgSend(v8, "count") >= 4)
  {
    objc_msgSend(v8, "subarrayWithRange:", 0, 3);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v11;
  }
  objc_msgSend(v8, "ef_map:", &__block_literal_global_30);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v12;
    _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Predicting move mailbox for messages: %{public}@", buf, 0xCu);
  }

  if ((objc_msgSend(v9, "isCanceled") & 1) == 0)
  {
    -[EDMailboxPredictionController _processPredictionForMessages:](self, "_processPredictionForMessages:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_DEFAULT, "Found mailbox for moving message(s).", buf, 2u);
      }

      -[EDMailboxPredictionController mailboxPersistence](self, "mailboxPersistence");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke_6;
      v18[3] = &unk_1E949CB50;
      v19 = v14;
      v20 = v10;
      objc_msgSend(v16, "allMailboxesWithCompletionHandler:", v18);

    }
    else
    {
      +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[EDMailboxPredictionController _predictMailboxForMovingMessages:cancelationToken:completionHandler:].cold.1(v17);

      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }

  }
}

id __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v2, "globalMessageID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke_2;
  v7[3] = &unk_1E949CB28;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v3, "ef_firstObjectPassingTest:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ef_publicDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Found mailbox '%{public}@'.", buf, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __101__EDMailboxPredictionController__predictMailboxForMovingMessages_cancelationToken_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_processPredictionForMessages:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  int v15;
  void *v16;
  _QWORD v18[5];
  uint8_t buf[4];
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDMailboxPredictionController processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[EDMailboxPredictionController cachingPredictor](self, "cachingPredictor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predictMailboxIDsForMessages:limit:", v4, 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_compactMap:", &__block_literal_global_10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    -[EDMailboxPredictionController _accountsForMessages:](self, "_accountsForMessages:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v9, "count") == 1)
    {
      -[NSObject anyObject](v9, "anyObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v11 = objc_claimAutoreleasedReturnValue();

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __63__EDMailboxPredictionController__processPredictionForMessages___block_invoke_13;
      v18[3] = &unk_1E949CB98;
      v18[4] = v11;
      objc_msgSend(v8, "ef_filter:", v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = objc_msgSend(v12, "count");
        v15 = objc_msgSend(v8, "count");
        *(_DWORD *)buf = 67109376;
        v20 = v14;
        v21 = 1024;
        v22 = v15;
        _os_log_impl(&dword_1D2F2C000, v13, OS_LOG_TYPE_DEFAULT, "Found %u mailbox(es) for moving message(s). Filtered from %u.", buf, 0xEu);
      }

      objc_msgSend(v12, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v20 = -[NSObject count](v9, "count");
        _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "%u accounts. No prediction for moving message(s).", buf, 8u);
      }
      v16 = 0;
    }

  }
  else
  {
    +[EDMailboxPredictionController log](EDMailboxPredictionController, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v9, OS_LOG_TYPE_DEFAULT, "Found no mailbox for moving message(s).", buf, 2u);
    }
    v16 = 0;
  }

  return v16;
}

id __63__EDMailboxPredictionController__processPredictionForMessages___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E1D8]), "initWithURL:", v2);
  else
    v3 = 0;

  return v3;
}

uint64_t __63__EDMailboxPredictionController__processPredictionForMessages___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "ef_caseInsensitiveIsEqualToString:", *(_QWORD *)(a1 + 32));
  return v5;
}

- (id)_accountsForMessages:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "account", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v4, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)_invalidateCacheForAddedMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[EDMailboxPredictionController processingQueue](self, "processingQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__EDMailboxPredictionController__invalidateCacheForAddedMessage___block_invoke;
  v7[3] = &unk_1E949B6D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __65__EDMailboxPredictionController__invalidateCacheForAddedMessage___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "cachingPredictor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidatePredictionsAffectedByMessage:", *(_QWORD *)(a1 + 40));

}

- (id)_createPredictor
{
  EDHeuristicsMailboxPredictor *v3;
  void *v4;
  void *v5;
  void *v6;
  EDHeuristicsMailboxPredictor *v7;
  EDCachingMailboxPredictor *v8;

  v3 = [EDHeuristicsMailboxPredictor alloc];
  -[EDMailboxPredictionController userProfileProvider](self, "userProfileProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMailboxPredictionController messagePersistence](self, "messagePersistence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDMailboxPredictionController mailboxPersistence](self, "mailboxPersistence");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EDHeuristicsMailboxPredictor initWithUserProfileProvider:messagePersistence:mailboxPersistence:parameters:](v3, "initWithUserProfileProvider:messagePersistence:mailboxPersistence:parameters:", v4, v5, v6, &unk_1E94E56F0);

  v8 = -[EDCachingMailboxPredictor initWithPredictor:]([EDCachingMailboxPredictor alloc], "initWithPredictor:", v7);
  return v8;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (EDCachingMailboxPredictor)cachingPredictor
{
  return self->_cachingPredictor;
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EDPersistenceHookRegistry)hookRegistry
{
  return self->_hookRegistry;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_hookRegistry, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_cachingPredictor, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
}

- (void)_predictMailboxForMovingMessages:(os_log_t)log cancelationToken:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2F2C000, log, OS_LOG_TYPE_ERROR, "Did not find any mailboxes for moving message(s).", v1, 2u);
}

@end
