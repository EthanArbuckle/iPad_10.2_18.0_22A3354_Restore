@implementation FMXPCTransactionManager

- (void)endTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[FMXPCTransactionManager txn_ops_queue](self, "txn_ops_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__FMXPCTransactionManager_endTransaction___block_invoke;
  block[3] = &unk_1E82AA4B8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)beginTransaction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  FMXPCTransactionManager *v9;

  v4 = a3;
  -[FMXPCTransactionManager txn_ops_queue](self, "txn_ops_queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__FMXPCTransactionManager_beginTransaction___block_invoke;
  block[3] = &unk_1E82AA4B8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_enableKeepAlive
{
  void *v3;
  NSObject *v4;
  xpc_object_t v5;
  id v6;
  const char *v7;
  uint8_t v8[16];

  -[FMXPCTransactionManager keepAliveActivityIdentifier](self, "keepAliveActivityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    LogCategory_Unspecified();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C9967000, v4, OS_LOG_TYPE_INFO, "Registering keep-alive-on-dirty XPC activity", v8, 2u);
    }

    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80898], 1);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C807A8], 600);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80738], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80868], 1);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80760], 600);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80790], 60);
    -[FMXPCTransactionManager keepAliveActivityIdentifier](self, "keepAliveActivityIdentifier");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "cStringUsingEncoding:", 4);

    xpc_activity_register(v7, v5, &__block_literal_global_6);
  }
}

- (void)_disableKeepAlive
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  -[FMXPCTransactionManager keepAliveActivityIdentifier](self, "keepAliveActivityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    LogCategory_Unspecified();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C9967000, v4, OS_LOG_TYPE_INFO, "Unregistering keep-alive-on-dirty XPC activity", v6, 2u);
    }

    -[FMXPCTransactionManager keepAliveActivityIdentifier](self, "keepAliveActivityIdentifier");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_activity_unregister((const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4));

  }
}

- (NSString)keepAliveActivityIdentifier
{
  return self->_keepAliveActivityIdentifier;
}

void __42__FMXPCTransactionManager_endTransaction___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activeTransactions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countForObject:", *(_QWORD *)(a1 + 40));

  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(void **)(a1 + 40);
      v12 = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1C9967000, v5, OS_LOG_TYPE_INFO, "Ending xpc transaction %@", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "activeTransactions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "activeTransactions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "_disableKeepAlive");
      objc_msgSend(*(id *)(a1 + 32), "setMasterTransaction:", 0);
    }
    LogCategory_Unspecified();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "activeTransactions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1C9967000, v5, OS_LOG_TYPE_INFO, "Active transactions : %@", (uint8_t *)&v12, 0xCu);

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 40);
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1C9967000, v5, OS_LOG_TYPE_DEFAULT, "Trying to end xpc transaction %@ too many times", (uint8_t *)&v12, 0xCu);
  }

}

- (NSCountedSet)activeTransactions
{
  return self->_activeTransactions;
}

void __44__FMXPCTransactionManager_beginTransaction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  LogCategory_Unspecified();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1C9967000, v2, OS_LOG_TYPE_INFO, "Beginning xpc transaction %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "activeTransactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "_enableKeepAlive");
    objc_msgSend(CFSTR("com.apple.icloud.FMCore.FMXPCTransactionManager"), "UTF8String");
    v6 = (void *)os_transaction_create();
    objc_msgSend(*(id *)(a1 + 40), "setMasterTransaction:", v6);

  }
  objc_msgSend(*(id *)(a1 + 40), "activeTransactions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 32));

  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 40), "activeTransactions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1C9967000, v8, OS_LOG_TYPE_INFO, "Active transactions : %@", (uint8_t *)&v10, 0xCu);

  }
}

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate != -1)
    dispatch_once(&sharedInstance_dispatch_predicate, &__block_literal_global);
  return (id)_instance;
}

- (OS_dispatch_queue)txn_ops_queue
{
  return self->_txn_ops_queue;
}

- (void)setMasterTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_masterTransaction, a3);
}

void __41__FMXPCTransactionManager_sharedInstance__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  LogCategory_Unspecified();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __41__FMXPCTransactionManager_sharedInstance__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  v8 = -[FMXPCTransactionManager initSingleton]([FMXPCTransactionManager alloc], "initSingleton");
  v9 = (void *)_instance;
  _instance = (uint64_t)v8;

}

- (FMXPCTransactionManager)init
{
  NSObject *v3;

  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[FMXPCTransactionManager init].cold.1(v3);

  return 0;
}

- (id)initSingleton
{
  FMXPCTransactionManager *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  dispatch_queue_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)FMXPCTransactionManager;
  v2 = -[FMXPCTransactionManager init](&v14, sel_init);
  if (v2)
  {
    LogCategory_Unspecified();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      -[FMXPCTransactionManager initSingleton].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

    v11 = dispatch_queue_create("com.apple.icloud.fmcore.xpcTransactionManagementQueue", 0);
    -[FMXPCTransactionManager setTxn_ops_queue:](v2, "setTxn_ops_queue:", v11);

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMXPCTransactionManager setActiveTransactions:](v2, "setActiveTransactions:", v12);

  }
  return v2;
}

- (void)setLaunchOnRebootActivity:(id)a3 keepAliveActivity:(id)a4
{
  id v6;

  v6 = a4;
  -[FMXPCTransactionManager _disableLaunchOnRebootActivity:](self, "_disableLaunchOnRebootActivity:", a3);
  -[FMXPCTransactionManager setKeepAliveActivityIdentifier:](self, "setKeepAliveActivityIdentifier:", v6);

  -[FMXPCTransactionManager _disableOldKeepAliveActivity](self, "_disableOldKeepAliveActivity");
}

- (void)dealloc
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fm_logID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1C9967000, a2, OS_LOG_TYPE_DEBUG, "%@ deallocating...", (uint8_t *)&v4, 0xCu);

}

- (id)dumpActiveTransactions
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
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  -[FMXPCTransactionManager txn_ops_queue](self, "txn_ops_queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__FMXPCTransactionManager_dumpActiveTransactions__block_invoke;
  v6[3] = &unk_1E82AA800;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__FMXPCTransactionManager_dumpActiveTransactions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "activeTransactions");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __43__FMXPCTransactionManager__enableKeepAlive__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v2;
  xpc_activity_state_t state;
  xpc_object_t v4;
  _BOOL4 v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v10;
  xpc_activity_state_t v11;
  __int16 v12;
  xpc_object_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  state = xpc_activity_get_state(v2);
  v4 = xpc_activity_copy_criteria(v2);
  if (state == 2)
  {
    v5 = xpc_activity_set_state(v2, 5);
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 67109120;
      LODWORD(v11) = v5;
      v7 = "keep-alive-on-dirty triggered. updating this repetition to done so that it can continue to wait for the next "
           "repetition. success : %d";
      v8 = v6;
      v9 = 8;
LABEL_6:
      _os_log_impl(&dword_1C9967000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, v9);
    }
  }
  else
  {
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 134218240;
      v11 = state;
      v12 = 2048;
      v13 = v4;
      v7 = "keep-alive-on-dirty XPC activity changed to state %ld with criteria %p";
      v8 = v6;
      v9 = 22;
      goto LABEL_6;
    }
  }

}

- (void)_disableLaunchOnRebootActivity:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  const char *v6;
  uint8_t v7[16];

  v3 = a3;
  LogCategory_Unspecified();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C9967000, v4, OS_LOG_TYPE_INFO, "Unregistering launch-on-reboot XPC activity", v7, 2u);
  }

  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "cStringUsingEncoding:", 4);

  xpc_activity_unregister(v6);
}

- (void)_disableOldKeepAliveActivity
{
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  LogCategory_Unspecified();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C9967000, v3, OS_LOG_TYPE_INFO, "Unregistering old keep-alive-on-dirty XPC activity", v5, 2u);
  }

  -[FMXPCTransactionManager keepAliveActivityIdentifier](self, "keepAliveActivityIdentifier");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_activity_unregister((const char *)objc_msgSend(v4, "cStringUsingEncoding:", 4));

}

- (void)setTxn_ops_queue:(id)a3
{
  objc_storeStrong((id *)&self->_txn_ops_queue, a3);
}

- (void)setActiveTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_activeTransactions, a3);
}

- (void)setKeepAliveActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keepAliveActivityIdentifier, a3);
}

- (OS_os_transaction)masterTransaction
{
  return self->_masterTransaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterTransaction, 0);
  objc_storeStrong((id *)&self->_keepAliveActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_activeTransactions, 0);
  objc_storeStrong((id *)&self->_txn_ops_queue, 0);
}

void __41__FMXPCTransactionManager_sharedInstance__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9967000, a1, a3, "Creating shared instance of FMXPCTransactionManager", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9967000, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init FMXPCTransactionManager. Use 'sharedInstance'", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initSingleton
{
  OUTLINED_FUNCTION_0_0(&dword_1C9967000, a1, a3, "FMXPCTransactionManager: initialize", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
