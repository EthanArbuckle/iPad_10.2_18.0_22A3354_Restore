@implementation EDMessageAuthenticationStateMigrator

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EDMessageAuthenticationStateMigrator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_45 != -1)
    dispatch_once(&log_onceToken_45, block);
  return (OS_os_log *)(id)log_log_45;
}

void __43__EDMessageAuthenticationStateMigrator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_45;
  log_log_45 = (uint64_t)v1;

}

- (EDMessageAuthenticationStateMigrator)initWithCategoryPersistence:(id)a3 authenticator:(id)a4 messagePersistence:(id)a5
{
  id v9;
  id v10;
  id v11;
  EDMessageAuthenticationStateMigrator *v12;
  EDMessageAuthenticationStateMigrator *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)EDMessageAuthenticationStateMigrator;
  v12 = -[EDMessageAuthenticationStateMigrator init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_categoryPersistence, a3);
    objc_storeStrong((id *)&v13->_messagePersistence, a5);
    objc_storeStrong((id *)&v13->_authenticator, a4);
  }

  return v13;
}

+ (id)queryForMessagesToAuthenticate
{
  void *v2;
  id v3;
  void *v4;

  +[EDMessageListItemPredicates predicateForUnauthenticatedMessages](EDMessageListItemPredicates, "predicateForUnauthenticatedMessages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D1E2C0]);
  v4 = (void *)objc_msgSend(v3, "initWithTargetClass:predicate:sortDescriptors:", objc_opt_class(), v2, MEMORY[0x1E0C9AA60]);

  return v4;
}

- (void)migrateMessageAuthenticationStateForQuery:(id)a3 cancelationToken:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  EDMessageAuthenticationStateMigrator *v16;
  id v17;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    +[EDMessageAuthenticationStateMigrator log](EDMessageAuthenticationStateMigrator, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Querying for messages to authenticate", buf, 2u);
    }

    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __99__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken___block_invoke;
    v15 = &unk_1E949CF88;
    v16 = self;
    v9 = v7;
    v17 = v9;
    -[EDMessageAuthenticationStateMigrator _iteratePersistedMessagesDroppingLockForMatchingQuery:limit:batchSize:cancelationToken:requireProtectedData:handler:](self, "_iteratePersistedMessagesDroppingLockForMatchingQuery:limit:batchSize:cancelationToken:requireProtectedData:handler:", v6, 0x7FFFFFFFFFFFFFFFLL, 100, v9, 1, &v12);
    +[EDMessageAuthenticationStateMigrator log](EDMessageAuthenticationStateMigrator, "log", v12, v13, v14, v15, v16);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Finished authenticating messages", buf, 2u);
    }

    if (objc_msgSend(v9, "isCanceled"))
    {
      +[EDMessageAuthenticationStateMigrator log](EDMessageAuthenticationStateMigrator, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2F2C000, v11, OS_LOG_TYPE_DEFAULT, "Migration was canceled. Returning early", buf, 2u);
      }

    }
  }

}

void __99__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    +[EDMessageAuthenticationStateMigrator log](EDMessageAuthenticationStateMigrator, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __99__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken___block_invoke_cold_1(v8, (uint64_t)v9, v7);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_authenticateMessageBatch:cancelationToken:", v5, *(_QWORD *)(a1 + 40));
  }

}

- (void)_iteratePersistedMessagesDroppingLockForMatchingQuery:(id)a3 limit:(int64_t)a4 batchSize:(int64_t)a5 cancelationToken:(id)a6 requireProtectedData:(BOOL)a7 handler:(id)a8
{
  _BOOL8 v9;
  id v14;
  void (**v15)(id, _QWORD);
  void *v16;
  BOOL v17;
  void *v18;
  int64_t v19;
  void *v20;
  BOOL v21;
  uint64_t v22;
  id v23;
  _QWORD aBlock[7];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;

  v9 = a7;
  v23 = a3;
  v14 = a6;
  v15 = (void (**)(id, _QWORD))a8;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__13;
  v35 = __Block_byref_object_dispose__13;
  v36 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__13;
  v29 = __Block_byref_object_dispose__13;
  v30 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __156__EDMessageAuthenticationStateMigrator__iteratePersistedMessagesDroppingLockForMatchingQuery_limit_batchSize_cancelationToken_requireProtectedData_handler___block_invoke;
  aBlock[3] = &unk_1E949CFB0;
  aBlock[4] = &v37;
  aBlock[5] = &v31;
  aBlock[6] = &v25;
  v16 = _Block_copy(aBlock);
  v17 = 1;
  while (!v26[5] && v38[3] < a4 && v17)
  {
    v18 = (void *)MEMORY[0x1D824B334]();
    if (a4 - v38[3] >= a5)
      v19 = a5;
    else
      v19 = a4 - v38[3];
    -[EDMessageAuthenticationStateMigrator messagePersistence](self, "messagePersistence");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "iteratePersistedMessagesMatchingQuery:limit:cancelationToken:requireProtectedData:handler:", v23, v19, v14, v9, v16);

    if (objc_msgSend((id)v32[5], "count"))
      v21 = 0;
    else
      v21 = v26[5] == 0;
    if (!v21)
      v15[2](v15, v32[5]);
    v22 = objc_msgSend((id)v32[5], "count");
    objc_msgSend((id)v32[5], "removeAllObjects");
    v17 = v22 == v19;
    objc_autoreleasePoolPop(v18);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
}

void __156__EDMessageAuthenticationStateMigrator__iteratePersistedMessagesDroppingLockForMatchingQuery_limit_batchSize_cancelationToken_requireProtectedData_handler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) += objc_msgSend(v9, "count");
  if (objc_msgSend(v9, "count"))
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObjectsFromArray:", v9);
  v6 = objc_msgSend(v5, "copy");
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)_authenticateMessageBatch:(id)a3 cancelationToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[EDMessageAuthenticationStateMigrator authenticator](self, "authenticator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "authenticateMessages:", v6);

  if (v9)
  {
    +[EDMessageAuthenticationStateMigrator log](EDMessageAuthenticationStateMigrator, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 134217984;
      v13 = objc_msgSend(v6, "count");
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "Successfully authenticated a batch of messages (count:%lu)", (uint8_t *)&v12, 0xCu);
    }

  }
  else
  {
    +[EDMessageAuthenticationStateMigrator log](EDMessageAuthenticationStateMigrator, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[EDMessageAuthenticationStateMigrator _authenticateMessageBatch:cancelationToken:].cold.1((uint64_t)&v12, objc_msgSend(v6, "count"), v11);

    if (v7)
      objc_msgSend(v7, "cancel");
  }

}

- (EDCategoryPersistence)categoryPersistence
{
  return self->_categoryPersistence;
}

- (EDMessagePersistence)messagePersistence
{
  return self->_messagePersistence;
}

- (EDMessageAuthenticator)authenticator
{
  return self->_authenticator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
}

void __99__EDMessageAuthenticationStateMigrator_migrateMessageAuthenticationStateForQuery_cancelationToken___block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, a2, a3, "Message authentication state migrator query failed with error %{public}@", (uint8_t *)a2);

}

- (void)_authenticateMessageBatch:(NSObject *)a3 cancelationToken:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_1(&dword_1D2F2C000, a2, a3, "Failed to successfully authenticate messages (count:%lu)", (uint8_t *)a1);
}

@end
