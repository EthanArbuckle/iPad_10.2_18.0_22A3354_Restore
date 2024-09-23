@implementation CXChannelSourceManager

- (CXChannelSourceManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  CXChannelSourceManager *v8;
  CXChannelSourceManager *v9;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  OS_dispatch_queue *v15;
  OS_dispatch_queue *delegateQueue;
  OS_dispatch_queue *v17;
  id v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *identifierToChannelSource;
  CXTransactionManager *v21;
  CXTransactionManager *transactionManager;
  CXTransactionGroup *v23;
  CXTransactionGroup *uncommittedTransactionGroup;
  CXChannelServiceServer *v25;
  CXChannelServiceServer *serviceServer;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CXChannelSourceManager;
  v8 = -[CXChannelSourceManager init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_accessorLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.callkit.queue.%@.%p"), objc_opt_class(), v8);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v9->_delegate, v6);
    if (v7)
    {
      v15 = (OS_dispatch_queue *)v7;
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = v15;
    }
    else
    {
      v17 = (OS_dispatch_queue *)MEMORY[0x1E0C80D38];
      v18 = MEMORY[0x1E0C80D38];
      delegateQueue = v9->_delegateQueue;
      v9->_delegateQueue = v17;
    }

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identifierToChannelSource = v9->_identifierToChannelSource;
    v9->_identifierToChannelSource = v19;

    v21 = -[CXTransactionManager initWithQueue:]([CXTransactionManager alloc], "initWithQueue:", v9->_queue);
    transactionManager = v9->_transactionManager;
    v9->_transactionManager = v21;

    -[CXTransactionManager setDelegate:](v9->_transactionManager, "setDelegate:", v9);
    v23 = objc_alloc_init(CXTransactionGroup);
    uncommittedTransactionGroup = v9->_uncommittedTransactionGroup;
    v9->_uncommittedTransactionGroup = v23;

    v25 = objc_alloc_init(CXChannelServiceServer);
    serviceServer = v9->_serviceServer;
    v9->_serviceServer = v25;

    -[CXChannelServiceServer setDelegate:](v9->_serviceServer, "setDelegate:", v9);
    -[CXChannelServiceServer activate](v9->_serviceServer, "activate");

  }
  return v9;
}

- (void)addChannelSource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to add channel source %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_accessorLock);
  -[CXChannelSourceManager identifierToChannelSource](self, "identifierToChannelSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, v7);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__CXChannelSourceManager_addChannelSource___block_invoke;
  v8[3] = &unk_1E4B88AE8;
  v8[4] = self;
  -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v8);
  os_unfair_lock_unlock(&self->_accessorLock);

}

void __43__CXChannelSourceManager_addChannelSource___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channelSourcesChangedForChannelSourceManager:", *(_QWORD *)(a1 + 32));

}

- (id)channelSourceForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_accessorLock;
  void *v6;
  void *v7;

  v4 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  -[CXChannelSourceManager identifierToChannelSource](self, "identifierToChannelSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_accessorLock);
  return v7;
}

- (NSArray)channelSources
{
  os_unfair_lock_s *p_accessorLock;
  void *v4;
  void *v5;

  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  -[CXChannelSourceManager identifierToChannelSource](self, "identifierToChannelSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_accessorLock);
  return (NSArray *)v5;
}

- (void)removeChannelSource:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to remove channel source %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_accessorLock);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXChannelSourceManager identifierToChannelSource](self, "identifierToChannelSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v4);

  if (v9)
  {
    -[CXChannelSourceManager identifierToChannelSource](self, "identifierToChannelSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v6);

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__CXChannelSourceManager_removeChannelSource___block_invoke;
    v11[3] = &unk_1E4B88AE8;
    v11[4] = self;
    -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v11);
  }

  os_unfair_lock_unlock(&self->_accessorLock);
}

void __46__CXChannelSourceManager_removeChannelSource___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channelSourcesChangedForChannelSourceManager:", *(_QWORD *)(a1 + 32));

}

- (void)performDelegateCallback:(id)a3
{
  void *v4;
  NSObject *v5;
  dispatch_block_t block;

  block = a3;
  -[CXChannelSourceManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CXChannelSourceManager delegateQueue](self, "delegateQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, block);

  }
}

- (void)addAction:(id)a3 toUncommittedTransactionForChannelSource:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  CXChannelSourceManager *v14;

  v6 = a3;
  v7 = a4;
  -[CXChannelSourceManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__CXChannelSourceManager_addAction_toUncommittedTransactionForChannelSource___block_invoke;
  block[3] = &unk_1E4B88AC0;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __77__CXChannelSourceManager_addAction_toUncommittedTransactionForChannelSource___block_invoke(id *a1)
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
  v12 = __77__CXChannelSourceManager_addAction_toUncommittedTransactionForChannelSource___block_invoke_6;
  v13 = &unk_1E4B88A20;
  v14 = v4;
  v15 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, &v10);

  objc_msgSend(a1[6], "uncommittedTransactionGroup", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:forProviderSource:", a1[4], a1[5]);

}

void __77__CXChannelSourceManager_addAction_toUncommittedTransactionForChannelSource___block_invoke_6(uint64_t a1)
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
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to add action %@ to uncommitted transaction for channel source %@", (uint8_t *)&v5, 0x16u);
  }

}

- (void)failOutstandingActionsForChannelWithUUID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXChannelSourceManager queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__CXChannelSourceManager_failOutstandingActionsForChannelWithUUID___block_invoke;
  v7[3] = &unk_1E4B88A20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__CXChannelSourceManager_failOutstandingActionsForChannelWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "transactionManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "failOutstandingActionsForChannelWithUUID:", *(_QWORD *)(a1 + 40));

}

- (void)commitUncommittedTransactions
{
  NSObject *v3;
  _QWORD block[5];

  -[CXChannelSourceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CXChannelSourceManager_commitUncommittedTransactions__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = self;
  dispatch_async(v3, block);

}

void __55__CXChannelSourceManager_commitUncommittedTransactions__block_invoke(uint64_t a1)
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
  objc_msgSend(v6, "providerSources");
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
        objc_msgSend(v13, "transactionForProviderSource:", v12);
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

- (void)serviceServer:(id)a3 client:(id)a4 actionCompleted:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[CXChannelSourceManager queue](self, "queue");
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__CXChannelSourceManager_serviceServer_client_actionCompleted___block_invoke;
      block[3] = &unk_1E4B88AC0;
      block[4] = self;
      v13 = v10;
      v14 = v8;
      dispatch_async(v11, block);

    }
  }

}

void __63__CXChannelSourceManager_serviceServer_client_actionCompleted___block_invoke(uint64_t a1)
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
  v5 = objc_msgSend(v2, "channelSource:shouldProcessAction:error:", v3, v4, &v13);
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
      _os_log_impl(&dword_1A402D000, v7, OS_LOG_TYPE_DEFAULT, "Determined that channelSource: %@, should process action: %@, error: %@", buf, 0x20u);
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
      _os_log_error_impl(&dword_1A402D000, v10, OS_LOG_TYPE_ERROR, "Determined that channelSource: %@, should not process action: %@, error: %@", buf, 0x20u);
    }
  }

}

- (void)serviceServer:(id)a3 didAddClient:(id)a4
{
  CXXPCChannelSource *v5;
  id v6;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[CXXPCChannelSource initWithClient:]([CXXPCChannelSource alloc], "initWithClient:", v6);
    -[CXChannelSourceManager addChannelSource:](self, "addChannelSource:", v5);

  }
}

- (void)serviceServer:(id)a3 didRemoveClient:(id)a4
{
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v9, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[CXChannelSourceManager removeChannelSource:](self, "removeChannelSource:", v8);

    v6 = v9;
  }

}

- (void)serviceServer:(id)a3 client:(id)a4 registeredWithConfiguration:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __75__CXChannelSourceManager_serviceServer_client_registeredWithConfiguration___block_invoke;
      v11[3] = &unk_1E4B88AC0;
      v11[4] = self;
      v12 = v10;
      v13 = v8;
      -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v11);

    }
  }

}

void __75__CXChannelSourceManager_serviceServer_client_registeredWithConfiguration___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerSource:registeredWithConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)serviceServer:(id)a3 client:(id)a4 reportedAudioFinishedForChannelWithUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __87__CXChannelSourceManager_serviceServer_client_reportedAudioFinishedForChannelWithUUID___block_invoke;
      v11[3] = &unk_1E4B88AC0;
      v11[4] = self;
      v12 = v10;
      v13 = v8;
      -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v11);

    }
  }

}

void __87__CXChannelSourceManager_serviceServer_client_reportedAudioFinishedForChannelWithUUID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerSource:reportedAudioFinishedForChannelWithUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 startedConnectingAtDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __95__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_startedConnectingAtDate___block_invoke;
      v14[3] = &unk_1E4B88DF0;
      v14[4] = self;
      v15 = v13;
      v16 = v10;
      v17 = v11;
      -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

    }
  }

}

void __95__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_startedConnectingAtDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerSource:reportedChannelWithUUID:startedConnectingAtDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 connectedAtDate:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __87__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_connectedAtDate___block_invoke;
      v14[3] = &unk_1E4B88DF0;
      v14[4] = self;
      v15 = v13;
      v16 = v10;
      v17 = v11;
      -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

    }
  }

}

void __87__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_connectedAtDate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerSource:reportedChannelWithUUID:connectedAtDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 disconnectedAtDate:(id)a6 disconnectedReason:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __109__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke;
      v16[3] = &unk_1E4B88E40;
      v16[4] = self;
      v17 = v15;
      v18 = v12;
      v19 = v13;
      v20 = a7;
      -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v16);

    }
  }

}

void __109__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_disconnectedAtDate_disconnectedReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerSource:reportedChannelWithUUID:disconnectedAtDate:disconnectedReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)serviceServer:(id)a3 client:(id)a4 reportedChannelWithUUID:(id)a5 updated:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __79__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_updated___block_invoke;
      v14[3] = &unk_1E4B88DF0;
      v14[4] = self;
      v15 = v13;
      v16 = v10;
      v17 = v11;
      -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

    }
  }

}

void __79__CXChannelSourceManager_serviceServer_client_reportedChannelWithUUID_updated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerSource:reportedChannelWithUUID:updated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)serviceServer:(id)a3 client:(id)a4 reportedIncomingTransmissionEndedForChannelWithUUID:(id)a5 reason:(int64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  int64_t v20;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __124__CXChannelSourceManager_serviceServer_client_reportedIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke;
      v16[3] = &unk_1E4B891A8;
      v16[4] = self;
      v17 = v15;
      v18 = v12;
      v20 = a6;
      v19 = v13;
      -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v16);

    }
  }

}

void __124__CXChannelSourceManager_serviceServer_client_reportedIncomingTransmissionEndedForChannelWithUUID_reason_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerSource:reportedIncomingTransmissionEndedForChannelWithUUID:reason:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (void)serviceServer:(id)a3 client:(id)a4 reportedIncomingTransmissionStartedForChannelWithUUID:(id)a5 update:(id)a6 shouldReplaceOutgoingTransmission:(BOOL)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v13, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __160__CXChannelSourceManager_serviceServer_client_reportedIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke;
      v19[3] = &unk_1E4B891D0;
      v19[4] = self;
      v20 = v18;
      v21 = v14;
      v22 = v15;
      v24 = a7;
      v23 = v16;
      -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v19);

    }
  }

}

void __160__CXChannelSourceManager_serviceServer_client_reportedIncomingTransmissionStartedForChannelWithUUID_update_shouldReplaceOutgoingTransmission_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerSource:reportedIncomingTransmissionStartedForChannelWithUUID:update:shouldReplaceOutgoingTransmission:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 64));

}

- (void)serviceServer:(id)a3 client:(id)a4 requestedTransaction:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXChannelSourceManager channelSourceForIdentifier:](self, "channelSourceForIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __86__CXChannelSourceManager_serviceServer_client_requestedTransaction_completionHandler___block_invoke;
      v14[3] = &unk_1E4B88C18;
      v14[4] = self;
      v15 = v13;
      v16 = v10;
      v17 = v11;
      -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v14);

    }
  }

}

void __86__CXChannelSourceManager_serviceServer_client_requestedTransaction_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerSource:requestedTransaction:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

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
  v8[2] = __71__CXChannelSourceManager_transactionManager_transactionGroupCompleted___block_invoke;
  v8[3] = &unk_1E4B88A20;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  -[CXChannelSourceManager performDelegateCallback:](self, "performDelegateCallback:", v8);

}

void __71__CXChannelSourceManager_transactionManager_transactionGroupCompleted___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channelSourceManager:completedTransactionGroup:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CXChannelSourceManagerDelegate)delegate
{
  return (CXChannelSourceManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (NSMutableDictionary)identifierToChannelSource
{
  return self->_identifierToChannelSource;
}

- (CXChannelServiceServer)serviceServer
{
  return self->_serviceServer;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncommittedTransactionGroup, 0);
  objc_storeStrong((id *)&self->_transactionManager, 0);
  objc_storeStrong((id *)&self->_serviceServer, 0);
  objc_storeStrong((id *)&self->_identifierToChannelSource, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
