@implementation EKDaemonConnection

- (int)databaseRestoreGeneration
{
  EKDaemonConnection *v2;
  os_unfair_lock_s *p_internalStateLock;

  v2 = self;
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  LODWORD(v2) = v2->_databaseRestoreGeneration;
  os_unfair_lock_unlock(p_internalStateLock);
  return (int)v2;
}

- (CADInterface)CADOperationProxySync
{
  NSObject *connectionLock;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  connectionLock = self->_connectionLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__EKDaemonConnection_CADOperationProxySync__block_invoke;
  v5[3] = &unk_1E47850A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CADInterface *)v3;
}

- (BOOL)shouldValidateObjectIDs
{
  EKDaemonConnection *v2;
  os_unfair_lock_s *p_internalStateLock;

  v2 = self;
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  LOBYTE(v2) = v2->_databaseRestoreGenerationHasEverChangedSignificantly;
  os_unfair_lock_unlock(p_internalStateLock);
  return (char)v2;
}

void __32__EKDaemonConnection_disconnect__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = 0;

}

void __32__EKDaemonConnection_disconnect__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  v6 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

}

+ (id)anyAvailableDaemonConnection
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "preferredAvailableDaemonConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&livingConnectionLock);
    objc_msgSend((id)storedWeakReferenceDaemonConnection, "anyObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)&livingConnectionLock);
  }

  return v4;
}

- (int64_t)eventAuthorization
{
  int64_t v3;

  v3 = 0;
  -[EKDaemonConnection _eventAuthorization:remindersAuthorization:](self, "_eventAuthorization:remindersAuthorization:", &v3, 0);
  return v3;
}

- (void)_eventAuthorization:(int64_t *)a3 remindersAuthorization:(int64_t *)a4
{
  os_unfair_lock_s *p_internalStateLock;
  void *v8;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  if (self->_accessDetermined)
  {
    if (a3)
      *a3 = self->_eventAuthorization;
    if (a4)
      *a4 = self->_remindersAuthorization;
    os_unfair_lock_unlock(p_internalStateLock);
  }
  else
  {
    os_unfair_lock_unlock(p_internalStateLock);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    -[EKDaemonConnection CADOperationProxySync](self, "CADOperationProxySync");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__EKDaemonConnection__eventAuthorization_remindersAuthorization___block_invoke;
    v9[3] = &unk_1E47851B8;
    v9[4] = &v10;
    v9[5] = &v18;
    v9[6] = &v14;
    objc_msgSend(v8, "CADDatabaseGetAccess:", v9);

    if (*((_BYTE *)v11 + 24))
    {
      os_unfair_lock_lock(p_internalStateLock);
      self->_accessDetermined = 1;
      self->_eventAuthorization = v19[3];
      self->_remindersAuthorization = v15[3];
      os_unfair_lock_unlock(p_internalStateLock);
      if (a3)
        *a3 = v19[3];
      if (a4)
        *a4 = v15[3];
    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
  }
}

void __43__EKDaemonConnection_CADOperationProxySync__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createConnectionAndOperationProxyIfNeeded");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)_createConnectionAndOperationProxyIfNeeded
{
  if (!self->_xpcConnection
    && -[EKDaemonConnection _connectToServer](self, "_connectToServer")
    && !self->_registeredForStartNote)
  {
    objc_msgSend(MEMORY[0x1E0D0C2E0], "addObserver:selector:name:", self, sel__daemonRestarted, *MEMORY[0x1E0D0A158]);
    self->_registeredForStartNote = 1;
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setInitializationOptions:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *connectionLock;
  id v7;
  void *v8;
  CADDatabaseInitializationOptions *initializationOptions;
  _QWORD v10[5];
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  connectionLock = self->_connectionLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__EKDaemonConnection_setInitializationOptions___block_invoke;
  block[3] = &unk_1E47850C8;
  block[4] = self;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  dispatch_sync(connectionLock, block);
  if (*((_BYTE *)v15 + 24))
  {
    -[EKDaemonConnection CADOperationProxy](self, "CADOperationProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    initializationOptions = self->_initializationOptions;
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __47__EKDaemonConnection_setInitializationOptions___block_invoke_2;
    v10[3] = &unk_1E47850F0;
    v10[4] = self;
    objc_msgSend(v8, "CADDatabaseSetInitializationOptions:reply:", initializationOptions, v10);

  }
  -[EKDaemonConnection clearCachedAuthStatus](self, "clearCachedAuthStatus");

  _Block_object_dispose(&v14, 8);
}

- (void)clearCachedAuthStatus
{
  os_unfair_lock_s *p_internalStateLock;

  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  self->_accessDetermined = 0;
  os_unfair_lock_unlock(p_internalStateLock);
}

+ (void)addLivingDaemonConnection:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&livingConnectionLock);
  v3 = (void *)storedWeakReferenceDaemonConnection;
  if (!storedWeakReferenceDaemonConnection)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)storedWeakReferenceDaemonConnection;
    storedWeakReferenceDaemonConnection = v4;

    v3 = (void *)storedWeakReferenceDaemonConnection;
  }
  objc_msgSend(v3, "addObject:", v6);
  os_unfair_lock_unlock((os_unfair_lock_t)&livingConnectionLock);

}

- (BOOL)_connectToServer
{
  EKXPCConnectionFactory *connectionFactory;
  CADXPCConnection *v4;
  CADXPCConnection *xpcConnection;
  void *v6;
  void *v7;
  CADInterface *v8;
  CADInterface *remoteOperationProxy;
  CADInterface *v10;
  CADInterface *syncRemoteOperationProxy;
  os_log_type_t v12;
  NSObject *v13;
  uint8_t v15[16];
  _QWORD v16[4];
  id v17;
  id location;

  if (!self->_xpcConnection && !self->_wasAbortedDueToExcessiveConnections)
  {
    objc_initWeak(&location, self);
    connectionFactory = self->_connectionFactory;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __38__EKDaemonConnection__connectToServer__block_invoke;
    v16[3] = &unk_1E4785050;
    objc_copyWeak(&v17, &location);
    -[EKXPCConnectionFactory tryNewConnectionWithExportedObject:interruptionHandler:](connectionFactory, "tryNewConnectionWithExportedObject:interruptionHandler:", self, v16);
    v4 = (CADXPCConnection *)objc_claimAutoreleasedReturnValue();
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v4;

    -[EKDaemonConnection initializationOptions](self, "initializationOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (self->_xpcConnection)
    {
      v8 = (CADInterface *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A130]), "initWithXPCConnection:protocol:synchronous:", self->_xpcConnection, &unk_1EE6A1E28, 0);
      remoteOperationProxy = self->_remoteOperationProxy;
      self->_remoteOperationProxy = v8;

      v10 = (CADInterface *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0A130]), "initWithXPCConnection:protocol:synchronous:", self->_xpcConnection, &unk_1EE6A1E28, 1);
      syncRemoteOperationProxy = self->_syncRemoteOperationProxy;
      self->_syncRemoteOperationProxy = v10;

      -[CADInterface setDelegate:](self->_remoteOperationProxy, "setDelegate:", self);
      -[CADInterface setDelegate:](self->_syncRemoteOperationProxy, "setDelegate:", self);
      -[CADInterface setInitializationOptions:](self->_remoteOperationProxy, "setInitializationOptions:", v7);
      -[CADInterface setInitializationOptions:](self->_syncRemoteOperationProxy, "setInitializationOptions:", v7);
      -[CADXPCConnection resume](self->_xpcConnection, "resume");
    }
    else
    {
      self->_wasAbortedDueToExcessiveConnections = 1;
      if (objc_msgSend(v6, "unitTesting"))
        v12 = OS_LOG_TYPE_DEFAULT;
      else
        v12 = OS_LOG_TYPE_FAULT;
      v13 = EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, v12))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1A2318000, v13, v12, "Client tried to open too many connections to calaccessd. Refusing to open another", v15, 2u);
      }
    }
    -[EKDaemonConnection setHasEverConnected:](self, "setHasEverConnected:", 1);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return 1;
}

- (void)setHasEverConnected:(BOOL)a3
{
  self->_hasEverConnected = a3;
}

- (CADDatabaseInitializationOptions)initializationOptions
{
  return self->_initializationOptions;
}

- (void)dealloc
{
  objc_super v3;

  -[EKDaemonConnection disconnect](self, "disconnect");
  v3.receiver = self;
  v3.super_class = (Class)EKDaemonConnection;
  -[EKDaemonConnection dealloc](&v3, sel_dealloc);
}

- (void)disconnect
{
  uint64_t v3;
  NSObject *replyHandlerLock;
  NSObject *connectionLock;
  _QWORD v6[5];
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0D0C2E0], "removeObserver:name:", self, *MEMORY[0x1E0D0A158]);
  v3 = MEMORY[0x1E0C809B0];
  replyHandlerLock = self->_replyHandlerLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__EKDaemonConnection_disconnect__block_invoke;
  block[3] = &unk_1E4785078;
  block[4] = self;
  dispatch_sync(replyHandlerLock, block);
  connectionLock = self->_connectionLock;
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __32__EKDaemonConnection_disconnect__block_invoke_2;
  v6[3] = &unk_1E4785078;
  v6[4] = self;
  dispatch_sync(connectionLock, v6);
}

void __47__EKDaemonConnection_setInitializationOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setInitializationOptions:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setInitializationOptions:", *(_QWORD *)(a1 + 40));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationOptions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancellableOperations, 0);
  objc_storeStrong((id *)&self->_replyHandlerLock, 0);
  objc_storeStrong((id *)&self->_syncRemoteOperationProxy, 0);
  objc_storeStrong((id *)&self->_remoteOperationProxy, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_connectionFactory, 0);
}

- (void)setDatabaseRestoreGeneration:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_internalStateLock;
  int databaseRestoreGeneration;
  id v8;

  v3 = *(_QWORD *)&a3;
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  databaseRestoreGeneration = self->_databaseRestoreGeneration;
  if (databaseRestoreGeneration == -1 || databaseRestoreGeneration == (_DWORD)v3)
  {
    self->_databaseRestoreGeneration = v3;
    os_unfair_lock_unlock(p_internalStateLock);
  }
  else
  {
    self->_databaseRestoreGenerationHasEverChangedSignificantly = 1;
    self->_databaseRestoreGeneration = v3;
    os_unfair_lock_unlock(p_internalStateLock);
    -[EKDaemonConnection delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "databaseRestoreGenerationChangedExternally:", v3);

  }
}

- (void)removeCancellableRemoteOperation:(unsigned int)a3
{
  NSObject *replyHandlerLock;
  _QWORD v4[5];
  unsigned int v5;

  replyHandlerLock = self->_replyHandlerLock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__EKDaemonConnection_removeCancellableRemoteOperation___block_invoke;
  v4[3] = &unk_1E4785140;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(replyHandlerLock, v4);
}

void __55__EKDaemonConnection_removeCancellableRemoteOperation___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

void __65__EKDaemonConnection__eventAuthorization_remindersAuthorization___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = (_DWORD)a2 == 0;
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
  v4 = EKLogHandle;
  if (*(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      v7 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v9[0] = 67109376;
      v9[1] = v6;
      v10 = 1024;
      v11 = v7;
      _os_log_impl(&dword_1A2318000, v4, OS_LOG_TYPE_INFO, "Loaded access. eventAuth = %d, remindersAuth = %d", (uint8_t *)v9, 0xEu);
    }
  }
  else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
  {
    __65__EKDaemonConnection__eventAuthorization_remindersAuthorization___block_invoke_cold_1(v4, a2);
  }
}

- (EKDaemonConnection)initWithConnectionFactory:(id)a3
{
  id v5;
  EKDaemonConnection *v6;
  EKDaemonConnection *v7;
  id v8;
  const char *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *connectionLock;
  id v12;
  const char *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *replyHandlerLock;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EKDaemonConnection;
  v6 = -[EKDaemonConnection init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connectionFactory, a3);
    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (const char *)objc_msgSend(v8, "UTF8String");

    v10 = dispatch_queue_create(v9, 0);
    connectionLock = v7->_connectionLock;
    v7->_connectionLock = (OS_dispatch_queue *)v10;

    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");

    v14 = dispatch_queue_create(v13, 0);
    replyHandlerLock = v7->_replyHandlerLock;
    v7->_replyHandlerLock = (OS_dispatch_queue *)v14;

    v7->_databaseRestoreGeneration = -1;
    v7->_internalStateLock._os_unfair_lock_opaque = 0;
    +[EKDaemonConnection addLivingDaemonConnection:](EKDaemonConnection, "addLivingDaemonConnection:", v7);
  }

  return v7;
}

void __38__EKDaemonConnection__connectToServer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;

  v2 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __38__EKDaemonConnection__connectToServer__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_finishAllRepliesOnServerDeath");

}

+ (EKDaemonConnection)preferredAvailableDaemonConnection
{
  id WeakRetained;

  os_unfair_lock_lock((os_unfair_lock_t)&livingConnectionLock);
  WeakRetained = objc_loadWeakRetained(&_preferredAvailableDaemonConnection);
  os_unfair_lock_unlock((os_unfair_lock_t)&livingConnectionLock);
  return (EKDaemonConnection *)WeakRetained;
}

+ (void)setPreferredAvailableDaemonConnection:(id)a3
{
  id v3;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&livingConnectionLock);
  objc_storeWeak(&_preferredAvailableDaemonConnection, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&livingConnectionLock);
}

- (CADInterface)CADOperationProxy
{
  NSObject *connectionLock;
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  connectionLock = self->_connectionLock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__EKDaemonConnection_CADOperationProxy__block_invoke;
  v5[3] = &unk_1E47850A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionLock, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CADInterface *)v3;
}

void __39__EKDaemonConnection_CADOperationProxy__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_createConnectionAndOperationProxyIfNeeded");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)_daemonRestarted
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "daemonRestarted");
    WeakRetained = v3;
  }

}

void __47__EKDaemonConnection_setInitializationOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  if ((_DWORD)a2)
  {
    v3 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __47__EKDaemonConnection_setInitializationOptions___block_invoke_2_cold_1(v3, a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDatabaseRestoreGeneration:");
  }
}

- (void)databaseRestoreGenerationChangedByThisClient:(int)a3
{
  os_unfair_lock_s *p_internalStateLock;

  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock(&self->_internalStateLock);
  self->_databaseRestoreGeneration = a3;
  self->_databaseRestoreGenerationHasEverChangedSignificantly = 1;
  os_unfair_lock_unlock(p_internalStateLock);
}

- (unsigned)addCancellableRemoteOperation:(id)a3
{
  id v4;
  NSObject *replyHandlerLock;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  replyHandlerLock = self->_replyHandlerLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EKDaemonConnection_addCancellableRemoteOperation___block_invoke;
  block[3] = &unk_1E4785118;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(replyHandlerLock, block);
  LODWORD(replyHandlerLock) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return replyHandlerLock;
}

void __52__EKDaemonConnection_addCancellableRemoteOperation___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 56))
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    v4 = a1[4];
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    v2 = a1[4];
  }
  v6 = *(_DWORD *)(v2 + 64);
  *(_DWORD *)(v2 + 64) = v6 + 1;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v6;
  v7 = a1[5];
  v8 = *(void **)(a1[4] + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1[6] + 8) + 24));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, v9);

}

- (void)cancelRemoteOperation:(unsigned int)a3
{
  NSObject *replyHandlerLock;
  _QWORD block[6];
  unsigned int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  replyHandlerLock = self->_replyHandlerLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__EKDaemonConnection_cancelRemoteOperation___block_invoke;
  block[3] = &unk_1E4785168;
  block[4] = self;
  block[5] = &v6;
  v5 = a3;
  dispatch_sync(replyHandlerLock, block);
  objc_msgSend((id)v7[5], "cancel");
  _Block_object_dispose(&v6, 8);

}

void __44__EKDaemonConnection_cancelRemoteOperation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (void)_finishAllRepliesOnServerDeath
{
  NSObject *replyHandlerLock;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  replyHandlerLock = self->_replyHandlerLock;
  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke;
  block[3] = &unk_1E4785190;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(replyHandlerLock, block);
  if (objc_msgSend((id)v7[5], "count"))
  {
    if (_finishAllRepliesOnServerDeath_onceToken != -1)
      dispatch_once(&_finishAllRepliesOnServerDeath_onceToken, &__block_literal_global_8);
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3;
    v4[3] = &unk_1E4784C68;
    v4[4] = &v6;
    dispatch_async((dispatch_queue_t)_finishAllRepliesOnServerDeath_disconnectionQueue, v4);
  }
  _Block_object_dispose(&v6, 8);

}

uint64_t __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
}

void __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("EventKitClientDisconnectionQ", v2);
  v1 = (void *)_finishAllRepliesOnServerDeath_disconnectionQueue;
  _finishAllRepliesOnServerDeath_disconnectionQueue = (uint64_t)v0;

}

void __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3_cold_2(a1, v2);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7), (_QWORD)v17);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "disconnected");

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v9 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
}

- (id)operationForToken:(unsigned int)a3 respondingToSelector:(SEL)a4 finished:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  NSObject *replyHandlerLock;
  void *v9;
  id v10;
  _QWORD block[6];
  unsigned int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__0;
  v18 = __Block_byref_object_dispose__0;
  v19 = 0;
  replyHandlerLock = self->_replyHandlerLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__EKDaemonConnection_operationForToken_respondingToSelector_finished___block_invoke;
  block[3] = &unk_1E4785168;
  block[4] = self;
  block[5] = &v14;
  v13 = a3;
  dispatch_sync(replyHandlerLock, block);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v9 = (void *)v15[5];
    v15[5] = 0;

  }
  if (v5)
    -[EKDaemonConnection removeCancellableRemoteOperation:](self, "removeCancellableRemoteOperation:", v6);
  v10 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __70__EKDaemonConnection_operationForToken_respondingToSelector_finished___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)CADClientReceiveOccurrenceCacheSearchResults:(id)a3 forSearchToken:(unsigned int)a4 finished:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[EKDaemonConnection operationForToken:respondingToSelector:finished:](self, "operationForToken:respondingToSelector:finished:", v6, sel_receivedBatchResultsFromServer_finished_, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "receivedBatchResultsFromServer:finished:", v8, v5);

}

- (void)CADClientReceiveDiagnosticsCollectionResults:(id)a3 forToken:(unsigned int)a4 finished:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[EKDaemonConnection operationForToken:respondingToSelector:finished:](self, "operationForToken:respondingToSelector:finished:", v6, sel_receivedBatchResultsFromServer_finished_, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "receivedBatchResultsFromServer:finished:", v8, v5);

}

- (void)CADClientReceiveDatabaseIntegrityErrors:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKDaemonConnection CADClientReceiveDatabaseIntegrityErrors:].cold.1((uint64_t)v4, v5, v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("integrityErrors");
    v11[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("EKEventStoreIntegrityErrorsFoundNotification"), WeakRetained, v9);

  }
}

- (int64_t)remindersAuthorization
{
  int64_t v3;

  v3 = 0;
  -[EKDaemonConnection _eventAuthorization:remindersAuthorization:](self, "_eventAuthorization:remindersAuthorization:", 0, &v3);
  return v3;
}

- (int)eventAccessLevel
{
  -[EKDaemonConnection eventAuthorization](self, "eventAuthorization");
  return CADEventAccessTypeFromAuthStatus();
}

- (BOOL)hasAccessToReminders
{
  return -[EKDaemonConnection remindersAuthorization](self, "remindersAuthorization") == 3;
}

- (EKDaemonConnectionDelegate)delegate
{
  return (EKDaemonConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)hasEverConnected
{
  return self->_hasEverConnected;
}

void __38__EKDaemonConnection__connectToServer__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Connection interrupted!", a5, a6, a7, a8, 0);
}

void __47__EKDaemonConnection_setInitializationOptions___block_invoke_2_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a1;
  objc_msgSend(v3, "errorWithCADResult:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v5;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v4, v6, "Error setting initialization options: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

void __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Finished notifying asynchronous operations about the dropped XPC connection", a5, a6, a7, a8, 0);
}

void __52__EKDaemonConnection__finishAllRepliesOnServerDeath__block_invoke_3_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v3 = a2;
  v4[0] = 67109120;
  v4[1] = objc_msgSend(v2, "count");
  _os_log_error_impl(&dword_1A2318000, v3, OS_LOG_TYPE_ERROR, "Notifying %d asynchronous operations about the dropped XPC connection", (uint8_t *)v4, 8u);

}

- (void)CADClientReceiveDatabaseIntegrityErrors:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, a2, a3, "Detected database integrity errors: %@", (uint8_t *)&v3);
}

void __65__EKDaemonConnection__eventAuthorization_remindersAuthorization___block_invoke_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a1;
  objc_msgSend(v3, "errorWithCADResult:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v5;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v4, v6, "Error loading access: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

@end
