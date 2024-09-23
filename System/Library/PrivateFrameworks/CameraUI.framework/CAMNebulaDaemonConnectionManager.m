@implementation CAMNebulaDaemonConnectionManager

- (CAMNebulaDaemonConnectionManager)initWithConnection:(id)a3 name:(id)a4 bundleIdentifier:(id)a5 queue:(id)a6 clientAccess:(id)a7 allowedProtocol:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CAMNebulaDaemonConnectionManager *v20;
  CAMNebulaDaemonConnectionManager *v21;
  uint64_t v22;
  NSString *name;
  NSMutableDictionary *v24;
  NSMutableDictionary *tasksPerIdentifier;
  uint64_t v26;
  NSString *clientAccess;
  NSMutableArray *v28;
  NSMutableArray *registeredTargets;
  NSMutableArray *v30;
  NSMutableArray *registeredProtocols;
  void *v32;
  void *v33;
  id v35;
  _QWORD v36[4];
  CAMNebulaDaemonConnectionManager *v37;
  id v38;
  id location;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v35 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v40.receiver = self;
  v40.super_class = (Class)CAMNebulaDaemonConnectionManager;
  v20 = -[CAMNebulaDaemonConnectionManager init](&v40, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_bundleIdentifier, a5);
    objc_storeStrong((id *)&v21->__connection, a3);
    v22 = objc_msgSend(v16, "copy", v35);
    name = v21->__name;
    v21->__name = (NSString *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tasksPerIdentifier = v21->__tasksPerIdentifier;
    v21->__tasksPerIdentifier = v24;

    objc_storeStrong((id *)&v21->__queue, a6);
    v26 = objc_msgSend(v18, "copy");
    clientAccess = v21->_clientAccess;
    v21->_clientAccess = (NSString *)v26;

    objc_storeStrong((id *)&v21->_allowedProtocol, a8);
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registeredTargets = v21->__registeredTargets;
    v21->__registeredTargets = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    registeredProtocols = v21->__registeredProtocols;
    v21->__registeredProtocols = v30;

    objc_msgSend((id)objc_opt_class(), "_daemonProtocolInterface");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_clientProtocolInterface");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setExportedObject:", v21);
    objc_msgSend(v15, "setExportedInterface:", v32);
    objc_msgSend(v15, "setRemoteObjectInterface:", v33);
    objc_msgSend(v15, "_setQueue:", v21->__queue);
    objc_msgSend(v15, "setDelegate:", v21);
    objc_initWeak(&location, v15);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __112__CAMNebulaDaemonConnectionManager_initWithConnection_name_bundleIdentifier_queue_clientAccess_allowedProtocol___block_invoke;
    v36[3] = &unk_1EA328F00;
    objc_copyWeak(&v38, &location);
    v37 = v21;
    objc_msgSend(v15, "setInvalidationHandler:", v36);
    objc_msgSend(v15, "resume");

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
  return v21;
}

void __112__CAMNebulaDaemonConnectionManager_initWithConnection_name_bundleIdentifier_queue_clientAccess_allowedProtocol___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDelegate:", 0);
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "daemonConnectionManagerHasBeenDisconnected:", *(_QWORD *)(a1 + 32));

    objc_msgSend(WeakRetained, "setInvalidationHandler:", 0);
  }

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *name;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  name = self->__name;
  v6 = -[NSXPCConnection processIdentifier](self->__connection, "processIdentifier");
  NSStringFromProtocol(self->_allowedProtocol);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p '%@' pid: %d allowed: %@>"), v4, self, name, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)addTarget:(id)a3 forProtocol:(id)a4
{
  NSMutableArray *registeredTargets;
  id v7;

  if (a3)
  {
    if (a4)
    {
      registeredTargets = self->__registeredTargets;
      v7 = a4;
      -[NSMutableArray addObject:](registeredTargets, "addObject:", a3);
      -[NSMutableArray addObject:](self->__registeredProtocols, "addObject:", v7);

    }
  }
}

+ (id)_daemonProtocolInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F036EDB0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_enqueueIrisVideoJobs_, 0, 0);

  return v2;
}

+ (id)_clientProtocolInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F0350A90);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  CAMNebulaDaemonConnectionManager *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v5)
  {
    objc_msgSend(v10, "invoke");
  }
  else
  {
    v12 = (const char *)objc_msgSend(v10, "selector");
    if ((unint64_t)protocol_getMethodDescription(self->_allowedProtocol, v12, 1, 1).name)
    {
      -[CAMNebulaDaemonConnectionManager _targetsForSelector:](self, "_targetsForSelector:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        v14 = (void *)os_transaction_create();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __72__CAMNebulaDaemonConnectionManager_connection_handleInvocation_isReply___block_invoke;
        block[3] = &unk_1EA329360;
        v19 = v13;
        v20 = v11;
        v21 = v14;
        v15 = v14;
        dispatch_async(MEMORY[0x1E0C80D38], block);

      }
      else
      {
        objc_msgSend(v11, "invoke");
      }

    }
    else
    {
      v16 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = self;
        v24 = 2114;
        v25 = v17;
        _os_log_impl(&dword_1DB760000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ tried to call %{public}@ but is not allowed to", buf, 0x16u);

      }
    }
  }

}

void __72__CAMNebulaDaemonConnectionManager_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "invokeWithTarget:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)_targetsForSelector:(SEL)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  Protocol *v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = -[NSMutableArray count](self->__registeredProtocols, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->__registeredTargets, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray objectAtIndexedSubscript:](self->__registeredProtocols, "objectAtIndexedSubscript:", i);
      v10 = (Protocol *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)protocol_getMethodDescription(v10, a3, 1, 1).name)
        objc_msgSend(v5, "addObject:", v9);

    }
  }
  if (sel_pingAfterInterruption == a3)
    objc_msgSend(v5, "addObject:", self);
  return v5;
}

- (void)pingAfterInterruption
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "Handling ping from client after interruption", v3, 2u);
  }

}

- (void)_getProxyForExecutingBlock:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->__queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__CAMNebulaDaemonConnectionManager__getProxyForExecutingBlock___block_invoke;
  block[3] = &unk_1EA32B1C8;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__CAMNebulaDaemonConnectionManager__getProxyForExecutingBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__CAMNebulaDaemonConnectionManager__getProxyForExecutingBlock___block_invoke_77;
  v6[3] = &unk_1EA32B1A0;
  v6[4] = &v7;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v4, v8[5]);

  _Block_object_dispose(&v7, 8);
}

void __63__CAMNebulaDaemonConnectionManager__getProxyForExecutingBlock___block_invoke_77(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "Error getting proxy object %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)forceStopTimelapseCaptureWithReasons:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73__CAMNebulaDaemonConnectionManager_forceStopTimelapseCaptureWithReasons___block_invoke;
  v3[3] = &__block_descriptor_40_e53_v24__0___CAMNebulaDaemonClientProtocol__8__NSError_16l;
  v3[4] = a3;
  -[CAMNebulaDaemonConnectionManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", v3);
}

uint64_t __73__CAMNebulaDaemonConnectionManager_forceStopTimelapseCaptureWithReasons___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forceStopTimelapseCaptureWithReasons:", *(_QWORD *)(a1 + 32));
}

- (void)nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __91__CAMNebulaDaemonConnectionManager_nebulaDaemonDidCompleteLocalVideoPersistenceWithResult___block_invoke;
  v6[3] = &unk_1EA32B210;
  v7 = v4;
  v5 = v4;
  -[CAMNebulaDaemonConnectionManager _getProxyForExecutingBlock:](self, "_getProxyForExecutingBlock:", v6);

}

uint64_t __91__CAMNebulaDaemonConnectionManager_nebulaDaemonDidCompleteLocalVideoPersistenceWithResult___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:", *(_QWORD *)(a1 + 32));
}

- (CAMNebulaDaemonConnectionManagerDelegate)delegate
{
  return (CAMNebulaDaemonConnectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)clientAccess
{
  return self->_clientAccess;
}

- (Protocol)allowedProtocol
{
  return self->_allowedProtocol;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (NSString)_name
{
  return self->__name;
}

- (OS_dispatch_queue)_queue
{
  return self->__queue;
}

- (NSMutableDictionary)_tasksPerIdentifier
{
  return self->__tasksPerIdentifier;
}

- (NSMutableArray)_registeredTargets
{
  return self->__registeredTargets;
}

- (NSMutableArray)_registeredProtocols
{
  return self->__registeredProtocols;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__registeredProtocols, 0);
  objc_storeStrong((id *)&self->__registeredTargets, 0);
  objc_storeStrong((id *)&self->__tasksPerIdentifier, 0);
  objc_storeStrong((id *)&self->__queue, 0);
  objc_storeStrong((id *)&self->__name, 0);
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedProtocol, 0);
  objc_storeStrong((id *)&self->_clientAccess, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
