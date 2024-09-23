@implementation SGDaemonConnection

+ (BOOL)usingSyncXPC
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SGSyncXPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (SGDaemonConnection)initWithMachServiceName:(id)a3 xpcInterface:(id)a4
{
  id v6;
  id v7;
  SGDaemonConnection *v8;
  uint64_t v9;
  NSString *machServiceName;
  dispatch_queue_t v11;
  OS_dispatch_queue *connectLock;
  uint64_t v13;
  NSMutableArray *abortBlocks;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGDaemonConnection;
  v8 = -[SGDaemonConnection init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    machServiceName = v8->_machServiceName;
    v8->_machServiceName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_xpcInterface, a4);
    v11 = dispatch_queue_create("com.apple.suggestions.daemon.connectlock", 0);
    connectLock = v8->_connectLock;
    v8->_connectLock = (OS_dispatch_queue *)v11;

    v13 = objc_opt_new();
    abortBlocks = v8->_abortBlocks;
    v8->_abortBlocks = (NSMutableArray *)v13;

    pthread_mutex_init(&v8->_abortLock, 0);
  }

  return v8;
}

void __35__SGDaemonConnection_xpcConnection__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[13];
  if (!v3)
  {
    objc_msgSend(v2, "_connectToServer");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)_connectToServer
{
  NSObject *v3;
  NSXPCConnection *v4;
  NSXPCConnection *xpcConnection;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location[2];

  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(location[0]) = 0;
    _os_log_debug_impl(&dword_1A2267000, v3, OS_LOG_TYPE_DEBUG, "SGDaemonConnection _connectToRemoteSuggestionsService", (uint8_t *)location, 2u);
  }

  v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", self->_machServiceName, 0);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v4;

  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", self->_xpcInterface);
  location[0] = 0;
  objc_initWeak(location, self);
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__SGDaemonConnection__connectToServer__block_invoke;
  v12[3] = &unk_1E47627C8;
  objc_copyWeak(&v13, location);
  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v12);
  v7 = v6;
  v8 = 3221225472;
  v9 = __38__SGDaemonConnection__connectToServer__block_invoke_6;
  v10 = &unk_1E47627C8;
  objc_copyWeak(&v11, location);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", &v7);
  -[NSXPCConnection resume](self->_xpcConnection, "resume", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(location);
}

- (id)waitUntilReturn:(id)a3 withTimeout:(double)a4 error:(id *)a5
{
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  uint64_t v13;
  NSObject *v14;
  id *v15;
  NSObject *v16;
  void *v17;
  dispatch_source_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  id v23;
  dispatch_time_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  __CFString *v29;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD handler[4];
  NSObject *v36;
  SGDaemonConnection *v37;
  uint64_t *v38;
  _QWORD v39[4];
  NSObject *v40;
  NSObject *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint8_t buf[4];
  unint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v8 = (uint64_t)fmax(a4 * 1000000000.0, 1.0);
  if (fabs(a4 * 1000000000.0) == INFINITY)
    v8 = 0;
  v9 = v8;
  v10 = dispatch_group_create();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("SGDaemonConnection-waitUntilReturn", v11);

  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__8513;
  v59 = __Block_byref_object_dispose__8514;
  v60 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__8513;
  v53 = __Block_byref_object_dispose__8514;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  dispatch_group_enter(v10);
  v13 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke;
  v39[3] = &unk_1E4762880;
  v14 = v12;
  v40 = v14;
  v42 = &v45;
  v43 = &v55;
  v15 = a5;
  v44 = &v49;
  v16 = v10;
  v41 = v16;
  v17 = (void *)MEMORY[0x1A8583BFC](v39);
  if (v9)
  {
    v18 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v14);
    if (v18)
    {
      v19 = v18;
      v20 = dispatch_time(0, v9);
      dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      handler[0] = v13;
      handler[1] = 3221225472;
      handler[2] = __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_12;
      handler[3] = &unk_1E47628A8;
      v37 = self;
      v38 = &v45;
      v36 = v16;
      dispatch_source_set_event_handler(v19, handler);
      dispatch_resume(v19);

      goto LABEL_10;
    }
    sgLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A2267000, v21, OS_LOG_TYPE_FAULT, "Could not create timeoutTimer", buf, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }
  v19 = 0;
LABEL_10:
  v32[0] = v13;
  v32[1] = 3221225472;
  v32[2] = __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_13;
  v32[3] = &unk_1E47628D0;
  v22 = v31;
  v33 = v22;
  v23 = v17;
  v34 = v23;
  +[SGDaemonConnection _useSyncXPCWithBlock:](SGDaemonConnection, "_useSyncXPCWithBlock:", v32);
  if (v9)
    v24 = dispatch_time(0, v9);
  else
    v24 = -1;
  if (dispatch_group_wait(v16, v24) || *((_BYTE *)v46 + 24))
  {
    sgLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v62 = v9 / 0xF4240;
      _os_log_impl(&dword_1A2267000, v25, OS_LOG_TYPE_INFO, "SGDaemonConnection remote call taking longer than %llu milliseconds(s). Returning empty result with timeout error.", buf, 0xCu);
    }

    *((_BYTE *)v46 + 24) = 1;
    if (os_variant_has_internal_diagnostics())
    {
      sgLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v62 = (unint64_t)v27;
        _os_log_impl(&dword_1A2267000, v26, OS_LOG_TYPE_INFO, "SGDaemonConnection %@", buf, 0xCu);

      }
    }
  }
  if (v19)
    dispatch_source_cancel(v19);
  if (*((_BYTE *)v46 + 24))
  {
    incrementKeyWithSuffix(CFSTR("apicalls.all.timedout"));
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGErrorDomain"), 10, 0);
      v28 = 0;
      *v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = 0;
    }
  }
  else
  {
    if (v15)
      *v15 = objc_retainAutorelease((id)v50[5]);
    if (v50[5])
      v29 = CFSTR("apicalls.all.errored");
    else
      v29 = CFSTR("apicalls.all.succeeded");
    incrementKeyWithSuffix(v29);
    v28 = (id)v56[5];
  }

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v28;
}

+ (void)_useSyncXPCWithBlock:(id)a3
{
  void (**v3)(_QWORD);
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = (void (**)(_QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("SGSyncXPC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  if ((v7 & 1) == 0)
    v8 = objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SGSyncXPC"));
  v9 = (void *)MEMORY[0x1A8583A40](v8);
  sgLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1A2267000, v10, OS_LOG_TYPE_DEBUG, "SGDaemonConnection beginning sync XPC block", buf, 2u);
  }

  v3[2](v3);
  sgLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v14 = 0;
    _os_log_debug_impl(&dword_1A2267000, v11, OS_LOG_TYPE_DEBUG, "SGDaemonConnection ending sync XPC block", v14, 2u);
  }

  objc_autoreleasePoolPop(v9);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "threadDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", CFSTR("SGSyncXPC"));

  }
}

uint64_t __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A8583A40]();
  -[SGDaemonConnection xpcConnection](self, "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t v12[16];

  v4 = a3;
  v5 = +[SGDaemonConnection usingSyncXPC](SGDaemonConnection, "usingSyncXPC");
  v6 = (void *)MEMORY[0x1A8583A40]();
  if (v5)
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_debug_impl(&dword_1A2267000, v7, OS_LOG_TYPE_DEBUG, "SGDaemonConnection providing sync XPC remote object proxy", v12, 2u);
    }

    -[SGDaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SGDaemonConnection xpcConnection](self, "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v4);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;

  objc_autoreleasePoolPop(v6);
  return v10;
}

- (id)xpcConnection
{
  NSObject *connectLock;
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
  v9 = __Block_byref_object_copy__8513;
  v10 = __Block_byref_object_dispose__8514;
  v11 = 0;
  connectLock = self->_connectLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__SGDaemonConnection_xpcConnection__block_invoke;
  v5[3] = &unk_1E47627F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10[2];
  _QWORD block[4];
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_2;
  block[3] = &unk_1E4762858;
  v15 = *(_OWORD *)(a1 + 56);
  v12 = v5;
  v13 = v6;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 40);
  v8 = v10[0];
  v14 = *(_OWORD *)v10;
  v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);

}

void __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 32));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 40));
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      sgLogHandle();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        v4 = 138412290;
        v5 = v3;
        _os_log_error_impl(&dword_1A2267000, v2, OS_LOG_TYPE_ERROR, "SGDaemonConnection Error! %@", (uint8_t *)&v4, 0xCu);
      }

    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

- (void)dealloc
{
  objc_super v3;

  -[SGDaemonConnection disconnect](self, "disconnect");
  pthread_mutex_destroy(&self->_abortLock);
  v3.receiver = self;
  v3.super_class = (Class)SGDaemonConnection;
  -[SGDaemonConnection dealloc](&v3, sel_dealloc);
}

- (void)disconnect
{
  NSObject *connectLock;
  _QWORD block[5];

  connectLock = self->_connectLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SGDaemonConnection_disconnect__block_invoke;
  block[3] = &unk_1E47627A0;
  block[4] = self;
  dispatch_sync(connectLock, block);
}

- (void)_callAbortBlocks
{
  _opaque_pthread_mutex_t *p_abortLock;
  void *v4;
  id v5;
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
  p_abortLock = &self->_abortLock;
  pthread_mutex_lock(&self->_abortLock);
  v4 = (void *)-[NSMutableArray copy](self->_abortBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_abortBlocks, "removeAllObjects");
  pthread_mutex_unlock(p_abortLock);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)remoteObjectProxy
{
  return -[SGDaemonConnection remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_8544);
}

- (void)addConnectionInterruptedHandler:(id)a3
{
  _opaque_pthread_mutex_t *p_abortLock;
  id v5;
  NSMutableArray *abortBlocks;
  void *v7;

  p_abortLock = &self->_abortLock;
  v5 = a3;
  pthread_mutex_lock(p_abortLock);
  abortBlocks = self->_abortBlocks;
  v7 = (void *)MEMORY[0x1A8583BFC](v5);

  -[NSMutableArray addObject:](abortBlocks, "addObject:", v7);
  pthread_mutex_unlock(p_abortLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_abortBlocks, 0);
  objc_storeStrong((id *)&self->_connectLock, 0);
  objc_storeStrong((id *)&self->_xpcInterface, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

void __56__SGDaemonConnection_waitUntilReturn_withTimeout_error___block_invoke_12(uint64_t a1)
{
  intptr_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0);
  sgLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2267000, v3, OS_LOG_TYPE_INFO, "SGDaemonConnection remote call timed out. Disconnecting XPC...", buf, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "disconnect");
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1A2267000, v3, OS_LOG_TYPE_INFO, "(SGDaemonConnection dispatch timer triggered just as task finished.)", v5, 2u);
    }

  }
}

void __38__SGDaemonConnection__connectToServer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1A2267000, v2, OS_LOG_TYPE_ERROR, "SGDaemonConnection got an interrupt", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_callAbortBlocks");

}

void __38__SGDaemonConnection__connectToServer__block_invoke_6(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  sgLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1A2267000, v2, OS_LOG_TYPE_DEBUG, "SGDaemonConnection connection invalidated", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_callAbortBlocks");

}

void __32__SGDaemonConnection_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 104);
  *(_QWORD *)(v2 + 104) = 0;

}

@end
