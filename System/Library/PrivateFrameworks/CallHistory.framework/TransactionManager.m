@implementation TransactionManager

+ (id)instance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__TransactionManager_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance_once != -1)
    dispatch_once(&instance_once, block);
  return (id)instance_instance;
}

uint64_t __41__TransactionManager_createXpcConnection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createXpcConnection_sync");
}

void __30__TransactionManager_instance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)instance_instance;
  instance_instance = (uint64_t)v1;

}

- (TransactionManager)init
{
  TransactionManager *v2;
  TransactionManager *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransactionManager;
  v2 = -[CHSynchronizedLoggable initWithName:](&v5, sel_initWithName_, "TransactionManager");
  v3 = v2;
  if (v2)
    -[TransactionManager createXpcConnection](v2, "createXpcConnection");
  return v3;
}

- (void)createXpcConnection
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41__TransactionManager_createXpcConnection__block_invoke;
  v2[3] = &unk_1E6746460;
  v2[4] = self;
  -[CHSynchronizedLoggable execute:](self, "execute:", v2);
}

- (void)createXpcConnection_sync
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "XPC connection is already valid!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setupConnectionHandlers_sync
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id syncHelperReadyNotificationRef;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0C809B0];
  if (!self->_syncHelperReadyNotificationRef)
  {
    -[CHSynchronizedLoggable logHandle](self, "logHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = CFSTR("kCallHistorySyncHelperReadyNotification");
      _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "Registering for %{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    v13[1] = 3221225472;
    v13[2] = __50__TransactionManager_setupConnectionHandlers_sync__block_invoke;
    v13[3] = &unk_1E6747560;
    v13[4] = self;
    objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", CFSTR("kCallHistorySyncHelperReadyNotification"), 0, 0, v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    syncHelperReadyNotificationRef = self->_syncHelperReadyNotificationRef;
    self->_syncHelperReadyNotificationRef = v6;

  }
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3FA4000, v8, OS_LOG_TYPE_DEFAULT, "Setting up invalidation handler", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_66;
  v11[3] = &unk_1E6746588;
  objc_copyWeak(&v12, (id *)buf);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v11);
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "Setting up interruption handler", v10, 2u);
  }

  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_13);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self->_syncHelperReadyNotificationRef, CFSTR("kCallHistorySyncHelperReadyNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)TransactionManager;
  -[TransactionManager dealloc](&v4, sel_dealloc);
}

- (void)appendTransactions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__TransactionManager_appendTransactions___block_invoke;
  v6[3] = &unk_1E6746520;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[CHSynchronizedLoggable execute:](self, "execute:", v6);

}

uint64_t __41__TransactionManager_appendTransactions___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendTransactions_sync:", *(_QWORD *)(a1 + 40));
}

- (void)appendTransactions_sync:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CHSynchronizedLoggable logHandle](self, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1B3FA4000, v5, OS_LOG_TYPE_DEFAULT, "Appending %lu transactions", buf, 0xCu);
  }

  if (objc_msgSend(v4, "count"))
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__TransactionManager_appendTransactions_sync___block_invoke;
    v12[3] = &unk_1E6747510;
    v12[4] = self;
    v7 = v4;
    v13 = v7;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __46__TransactionManager_appendTransactions_sync___block_invoke_63;
    v9[3] = &unk_1E6747538;
    v9[4] = self;
    v11 = (id)MEMORY[0x1B5E33208](v12);
    v10 = v7;
    v8 = v11;
    -[CHSynchronizedLoggable execute:](self, "execute:", v9);

  }
}

void __46__TransactionManager_appendTransactions_sync___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __46__TransactionManager_appendTransactions_sync___block_invoke_cold_2();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "logHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__TransactionManager_appendTransactions_sync___block_invoke_cold_1((uint64_t)v3, v5);

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__TransactionManager_appendTransactions_sync___block_invoke_60;
  v7[3] = &unk_1E6746520;
  v6 = *(void **)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v8, "execute:", v7);

}

void __46__TransactionManager_appendTransactions_sync___block_invoke_60(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_opt_new();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  objc_msgSend(v2, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "logHandle");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
    v8 = 134217984;
    v9 = v7;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "Now have %lu queued transactions", (uint8_t *)&v8, 0xCu);
  }

}

void __46__TransactionManager_appendTransactions_sync___block_invoke_63(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[3])
  {
    objc_msgSend(v2, "logHandle");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B3FA4000, v3, OS_LOG_TYPE_DEFAULT, "Invalid XPC connection, attempting to create", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "createXpcConnection_sync");
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "logHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "Forwarding to XPC Service", v6, 2u);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxyWithErrorHandler:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendTransactions:", *(_QWORD *)(a1 + 40));

}

uint64_t __50__TransactionManager_setupConnectionHandlers_sync__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_2;
  v3[3] = &unk_1E6746460;
  v3[4] = v1;
  return objc_msgSend(v1, "execute:", v3);
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logHandleForDomain:", "TransactionManager");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1B3FA4000, v3, OS_LOG_TYPE_DEFAULT, "Received Sync Helper ready notification", v7, 2u);
  }

  v4 = *(_QWORD **)(a1 + 32);
  if (!v4[3])
  {
    objc_msgSend(v4, "createXpcConnection_sync");
    v4 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v4, "appendTransactions:", v4[6]);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = 0;

}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_66(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  NSObject *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_67;
    v5[3] = &unk_1E6746460;
    v6 = WeakRetained;
    -[NSObject execute:](v6, "execute:", v5);
    v3 = v6;
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "logHandleForDomain:", "TransactionManager");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_66_cold_1();
  }

}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_67(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logHandleForDomain:", "TransactionManager");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_67_cold_1();

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = 0;

}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_68()
{
  void *v0;
  NSObject *v1;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "logHandleForDomain:", "TransactionManager");
  v1 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_68_cold_1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedTransactions, 0);
  objc_storeStrong(&self->_syncHelperReadyNotificationRef, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __46__TransactionManager_appendTransactions_sync___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1B3FA4000, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void __46__TransactionManager_appendTransactions_sync___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Failed to send transactions to XPC service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_66_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Could not get strong handle to SyncManager!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_67_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Handling invalidated XPC connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __50__TransactionManager_setupConnectionHandlers_sync__block_invoke_68_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Interrupted XPC connection, should be reestablished when needed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
