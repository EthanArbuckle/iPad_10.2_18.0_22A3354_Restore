@implementation CXCallSourceManager

- (CXCallSourceManager)init
{

  return 0;
}

- (CXCallSourceManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  CXCallSourceManager *v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *delegateQueue;
  OS_dispatch_queue *v15;
  id v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *identifierToCallSource;
  CXTransactionManager *v19;
  CXTransactionManager *transactionManager;
  CXTransactionGroup *v21;
  CXTransactionGroup *uncommittedTransactionGroup;
  uint64_t v23;
  NSXPCListener *xpcListener;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CXCallSourceManager;
  v8 = -[CXCallSourceManager init](&v26, sel_init);
  if (v8)
  {
    v9 = (const char *)objc_msgSend(CFSTR("com.apple.callkit.callsourcehost"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(v9, v10);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    objc_storeWeak((id *)&v8->_delegate, v6);
    if (v7)
    {
      v13 = (OS_dispatch_queue *)v7;
      delegateQueue = v8->_delegateQueue;
      v8->_delegateQueue = v13;
    }
    else
    {
      v15 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v16 = MEMORY[0x1E0C80D38];
      delegateQueue = v8->_delegateQueue;
      v8->_delegateQueue = v15;
    }

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identifierToCallSource = v8->_identifierToCallSource;
    v8->_identifierToCallSource = v17;

    v19 = -[CXTransactionManager initWithQueue:]([CXTransactionManager alloc], "initWithQueue:", v8->_queue);
    transactionManager = v8->_transactionManager;
    v8->_transactionManager = v19;

    -[CXTransactionManager setDelegate:](v8->_transactionManager, "setDelegate:", v8);
    v21 = objc_alloc_init(CXTransactionGroup);
    uncommittedTransactionGroup = v8->_uncommittedTransactionGroup;
    v8->_uncommittedTransactionGroup = v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.callkit.callsourcehost"));
    xpcListener = v8->_xpcListener;
    v8->_xpcListener = (NSXPCListener *)v23;

    -[NSXPCListener setDelegate:](v8->_xpcListener, "setDelegate:", v8);
    -[NSXPCListener resume](v8->_xpcListener, "resume");
    notify_post("com.apple.callkit.callsourcehost.started");
  }

  return v8;
}

- (NSArray)callSources
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[CXCallSourceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__CXCallSourceManager_callSources__block_invoke;
  v6[3] = &unk_1E4B88C60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __34__CXCallSourceManager_callSources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "identifierToCallSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addCallSource:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to add call source %@", buf, 0xCu);
  }

  objc_msgSend(v4, "setDelegate:", self);
  -[CXCallSourceManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__CXCallSourceManager_addCallSource___block_invoke;
  v8[3] = &unk_1E4B88A20;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __37__CXCallSourceManager_addCallSource___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  void *v10;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "identifierToCallSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, v4);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__CXCallSourceManager_addCallSource___block_invoke_2;
  v8[3] = &unk_1E4B88A20;
  v6 = *(void **)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(v6, "_performDelegateCallback:", v8);

}

uint64_t __37__CXCallSourceManager_addCallSource___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callSourcesChangedForCallSourceManager:", *(_QWORD *)(a1 + 40));
}

- (id)callSourceWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[CXCallSourceManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CXCallSourceManager_callSourceWithIdentifier___block_invoke;
  block[3] = &unk_1E4B88DA0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __48__CXCallSourceManager_callSourceWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "identifierToCallSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeCallSource:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  CXCallSourceManager *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to remove call source %@", buf, 0xCu);
  }

  -[CXCallSourceManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__CXCallSourceManager_removeCallSource___block_invoke;
  v8[3] = &unk_1E4B88A20;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __40__CXCallSourceManager_removeCallSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  void *v12;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifierToCallSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "identifierToCallSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v2);

    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __40__CXCallSourceManager_removeCallSource___block_invoke_2;
    v10[3] = &unk_1E4B88A20;
    v8 = *(void **)(a1 + 40);
    v11 = v7;
    v12 = v8;
    v9 = v7;
    objc_msgSend(v8, "_performDelegateCallback:", v10);

  }
}

uint64_t __40__CXCallSourceManager_removeCallSource___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callSourcesChangedForCallSourceManager:", *(_QWORD *)(a1 + 40));
}

- (void)addAction:(id)a3 toUncommittedTransactionForCallSource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  CXCallSourceManager *v14;

  v6 = a3;
  v7 = a4;
  -[CXCallSourceManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CXCallSourceManager_addAction_toUncommittedTransactionForCallSource___block_invoke;
  block[3] = &unk_1E4B88AC0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __71__CXCallSourceManager_addAction_toUncommittedTransactionForCallSource___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1[4], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to add action UUID=%@", buf, 0xCu);

  }
  objc_msgSend(a1[4], "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CXOversizedLogQueue();
  v6 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __71__CXCallSourceManager_addAction_toUncommittedTransactionForCallSource___block_invoke_4;
  v13 = &unk_1E4B88A20;
  v14 = v4;
  v15 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, &v10);

  objc_msgSend(a1[6], "uncommittedTransactionGroup", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:forCallSource:", a1[4], a1[5]);

}

void __71__CXCallSourceManager_addAction_toUncommittedTransactionForCallSource___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  CXOversizedLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138412546;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to add action %@ to uncommitted transaction for call source %@", (uint8_t *)&v5, 0x16u);
  }

}

- (void)commitUncommittedTransactions
{
  NSObject *v3;
  _QWORD block[5];

  -[CXCallSourceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CXCallSourceManager_commitUncommittedTransactions__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __52__CXCallSourceManager_commitUncommittedTransactions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  CXTransactionGroup *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to commit uncommitted transactions: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "transactionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addOutstandingTransactionGroup:", v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "callSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "uncommittedTransactionGroup");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "transactionForCallSource:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "commitTransaction:", v14);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v15 = objc_alloc_init(CXTransactionGroup);
  objc_msgSend(*(id *)(a1 + 32), "setUncommittedTransactionGroup:", v15);

}

- (void)failOutstandingActionsForCallWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallSourceManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__CXCallSourceManager_failOutstandingActionsForCallWithUUID___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __61__CXCallSourceManager_failOutstandingActionsForCallWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "transactionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failOutstandingActionsForCallWithUUID:", *(_QWORD *)(a1 + 40));

}

- (void)performDelegateCallback:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallSourceManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__CXCallSourceManager_performDelegateCallback___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __47__CXCallSourceManager_performDelegateCallback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDelegateCallback:", *(_QWORD *)(a1 + 40));
}

- (void)_performDelegateCallback:(id)a3
{
  void *v4;
  NSObject *v5;
  dispatch_block_t block;

  block = a3;
  -[CXCallSourceManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CXCallSourceManager delegateQueue](self, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, block);

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CXXPCCallSource *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "listener: %@ newConnection: %@", (uint8_t *)&v12, 0x16u);
  }

  v9 = -[CXXPCCallSource initWithConnection:]([CXXPCCallSource alloc], "initWithConnection:", v7);
  if (v9)
  {
    -[CXCallSourceManager addCallSource:](self, "addCallSource:", v9);
  }
  else
  {
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1A402D000, v10, OS_LOG_TYPE_DEFAULT, "[WARN] Not accepting connection %@ because a CXXPCCallSource couldn't be created", (uint8_t *)&v12, 0xCu);
    }

  }
  return v9 != 0;
}

- (void)callSourceConnectionStarted:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Call source connection started: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)callSourceConnectionEnded:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  CXDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Call source connection ended: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)callSourceInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Call source invalidated: %@", (uint8_t *)&v6, 0xCu);
  }

  -[CXCallSourceManager removeCallSource:](self, "removeCallSource:", v4);
}

- (void)callSource:(id)a3 registeredWithConfiguration:(id)a4
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
  v10[2] = __62__CXCallSourceManager_callSource_registeredWithConfiguration___block_invoke;
  v10[3] = &unk_1E4B88AC0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v10);

}

void __62__CXCallSourceManager_callSource_registeredWithConfiguration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:registeredWithConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)callSource:(id)a3 reportedNewIncomingCallWithUUID:(id)a4 update:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__CXCallSourceManager_callSource_reportedNewIncomingCallWithUUID_update_completion___block_invoke;
  v18[3] = &unk_1E4B88DC8;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v22 = v13;
  v14 = v13;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v18);

}

void __84__CXCallSourceManager_callSource_reportedNewIncomingCallWithUUID_update_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedNewIncomingCallWithUUID:update:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 updated:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__CXCallSourceManager_callSource_reportedCallWithUUID_updated___block_invoke;
  v14[3] = &unk_1E4B88DF0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

}

void __63__CXCallSourceManager_callSource_reportedCallWithUUID_updated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedCallWithUUID:updated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 receivedDTMFUpdate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __74__CXCallSourceManager_callSource_reportedCallWithUUID_receivedDTMFUpdate___block_invoke;
  v14[3] = &unk_1E4B88DF0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

}

void __74__CXCallSourceManager_callSource_reportedCallWithUUID_receivedDTMFUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedCallWithUUID:receivedDTMFUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 endedAtDate:(id)a5 privateReason:(int64_t)a6 failureContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__CXCallSourceManager_callSource_reportedCallWithUUID_endedAtDate_privateReason_failureContext___block_invoke;
  v20[3] = &unk_1E4B88E18;
  v20[4] = self;
  v21 = v12;
  v22 = v13;
  v23 = v14;
  v24 = v15;
  v25 = a6;
  v16 = v15;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v20);

}

void __96__CXCallSourceManager_callSource_reportedCallWithUUID_endedAtDate_privateReason_failureContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedCallWithUUID:endedAtDate:privateReason:failureContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 64));

}

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 sentInvitationAtDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __84__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_sentInvitationAtDate___block_invoke;
  v14[3] = &unk_1E4B88DF0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

}

void __84__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_sentInvitationAtDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedOutgoingCallWithUUID:sentInvitationAtDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 startedConnectingAtDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_startedConnectingAtDate___block_invoke;
  v14[3] = &unk_1E4B88DF0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

}

void __87__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_startedConnectingAtDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedOutgoingCallWithUUID:startedConnectingAtDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)callSource:(id)a3 reportedOutgoingCallWithUUID:(id)a4 connectedAtDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_connectedAtDate___block_invoke;
  v14[3] = &unk_1E4B88DF0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

}

void __79__CXCallSourceManager_callSource_reportedOutgoingCallWithUUID_connectedAtDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedOutgoingCallWithUUID:connectedAtDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)callSource:(id)a3 reportedNewOutgoingCallWithUUID:(id)a4 update:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__CXCallSourceManager_callSource_reportedNewOutgoingCallWithUUID_update___block_invoke;
  v14[3] = &unk_1E4B88DF0;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

}

void __73__CXCallSourceManager_callSource_reportedNewOutgoingCallWithUUID_update___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedNewOutgoingCallWithUUID:update:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)callSource:(id)a3 reportedAudioFinishedForCallWithUUID:(id)a4
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
  v10[2] = __71__CXCallSourceManager_callSource_reportedAudioFinishedForCallWithUUID___block_invoke;
  v10[3] = &unk_1E4B88AC0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v10);

}

void __71__CXCallSourceManager_callSource_reportedAudioFinishedForCallWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedAudioFinishedForCallWithUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedFrequencyData:(id)a5 forDirection:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__CXCallSourceManager_callSource_reportedCallWithUUID_changedFrequencyData_forDirection___block_invoke;
  v16[3] = &unk_1E4B88E40;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a6;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v16);

}

void __89__CXCallSourceManager_callSource_reportedCallWithUUID_changedFrequencyData_forDirection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedCallWithUUID:changedFrequencyData:forDirection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 changedMeterLevel:(float)a5 forDirection:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  int64_t v17;
  float v18;

  v10 = a3;
  v11 = a4;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __86__CXCallSourceManager_callSource_reportedCallWithUUID_changedMeterLevel_forDirection___block_invoke;
  v14[3] = &unk_1E4B88E68;
  v14[4] = self;
  v15 = v10;
  v18 = a5;
  v16 = v11;
  v17 = a6;
  v12 = v11;
  v13 = v10;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

}

void __86__CXCallSourceManager_callSource_reportedCallWithUUID_changedMeterLevel_forDirection___block_invoke(uint64_t a1)
{
  double v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  objc_msgSend(v3, "callSource:reportedCallWithUUID:changedMeterLevel:forDirection:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v2);

}

- (void)callSource:(id)a3 reportedCallWithUUID:(id)a4 crossDeviceIdentifier:(id)a5 changedBytesOfDataUsed:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __100__CXCallSourceManager_callSource_reportedCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed___block_invoke;
  v16[3] = &unk_1E4B88E40;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a6;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v16);

}

void __100__CXCallSourceManager_callSource_reportedCallWithUUID_crossDeviceIdentifier_changedBytesOfDataUsed___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:reportedCallWithUUID:crossDeviceIdentifier:changedBytesOfDataUsed:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)callSource:(id)a3 requestedTransaction:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__CXCallSourceManager_callSource_requestedTransaction_completion___block_invoke;
  v14[3] = &unk_1E4B88C18;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

}

void __66__CXCallSourceManager_callSource_requestedTransaction_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSource:requestedTransaction:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)callSource:(id)a3 actionCompleted:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CXCallSourceManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__CXCallSourceManager_callSource_actionCompleted___block_invoke;
  block[3] = &unk_1E4B88AC0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __50__CXCallSourceManager_callSource_actionCompleted___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v13 = 0;
  v5 = objc_msgSend(v2, "callSource:shouldProcessAction:error:", v3, v4, &v13);
  v6 = v13;

  if ((v5 & 1) != 0 || v6 && (objc_msgSend(v6, "code") == 5 || objc_msgSend(v6, "code") == 7))
  {
    CXDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1A402D000, v7, OS_LOG_TYPE_DEFAULT, "Determined that callSource: %@, should process action: %@, error: %@", buf, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "transactionManager");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject updateWithCompletedAction:](v10, "updateWithCompletedAction:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    CXDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v6;
      _os_log_error_impl(&dword_1A402D000, v10, OS_LOG_TYPE_ERROR, "Determined that callSource: %@, should not process action: %@, error: %@", buf, 0x20u);
    }
  }

}

- (void)transactionManager:(id)a3 actionTimedOut:(id)a4 forCallSource:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  CXDefaultLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1A402D000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Action %@ timed out for call source %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(v7, "handleActionTimeout:", v6);
}

- (void)transactionManager:(id)a3 transactionGroupCompleted:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  CXDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_1A402D000, v6, OS_LOG_TYPE_DEFAULT, "Notifying delegate of completed transaction group: %@", buf, 0xCu);
  }

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__CXCallSourceManager_transactionManager_transactionGroupCompleted___block_invoke;
  v8[3] = &unk_1E4B88A20;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[CXCallSourceManager performDelegateCallback:](self, "performDelegateCallback:", v8);

}

void __68__CXCallSourceManager_transactionManager_transactionGroupCompleted___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callSourceManager:completedTransactionGroup:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXCallSourceManagerDelegate)delegate
{
  return (CXCallSourceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSMutableDictionary)identifierToCallSource
{
  return self->_identifierToCallSource;
}

- (CXTransactionManager)transactionManager
{
  return self->_transactionManager;
}

- (CXTransactionGroup)uncommittedTransactionGroup
{
  return self->_uncommittedTransactionGroup;
}

- (void)setUncommittedTransactionGroup:(id)a3
{
  objc_storeStrong((id *)&self->_uncommittedTransactionGroup, a3);
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_uncommittedTransactionGroup, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_identifierToCallSource, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
