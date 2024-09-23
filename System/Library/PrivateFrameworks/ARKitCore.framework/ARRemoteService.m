@implementation ARRemoteService

- (void)_skipRemoteObjectProxyErrorHandlers
{
  self->_skipRemoteObjectErrorHandlers = 1;
}

- (ARRemoteService)init
{
  return -[ARRemoteService initWithDispatchChannelQueue:](self, "initWithDispatchChannelQueue:", 0);
}

- (ARRemoteService)initWithDispatchChannelQueue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ARRemoteService *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "remoteServiceInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "daemonServiceInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ARRemoteService initWithMachServiceName:exportedInterface:remoteObjectInterface:dispatchChannelQueue:](self, "initWithMachServiceName:exportedInterface:remoteObjectInterface:dispatchChannelQueue:", v5, v6, v7, v4);

  return v8;
}

- (ARRemoteService)initWithEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ARRemoteService *v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "remoteServiceInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "daemonServiceInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ARRemoteService initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:](self, "initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:", v5, v6, v7, v4, 0, 0);

  return v8;
}

- (ARRemoteService)initWithEndpoint:(id)a3 startConnection:(BOOL)a4 dispatchChannelQueue:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  ARRemoteService *v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "remoteServiceInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "daemonServiceInterface");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ARRemoteService initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:](self, "initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:", v10, v11, v12, v9, v5, v8);

  return v13;
}

- (ARRemoteService)initWithMachServiceName:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5 dispatchChannelQueue:(id)a6
{
  return -[ARRemoteService initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:](self, "initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:", a3, a4, a5, 0, 1, a6);
}

- (ARRemoteService)initWithMachServiceName:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5 endpoint:(id)a6
{
  return -[ARRemoteService initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:](self, "initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:", a3, a4, a5, a6, 1, 0);
}

- (ARRemoteService)initWithMachServiceName:(id)a3 exportedInterface:(id)a4 remoteObjectInterface:(id)a5 endpoint:(id)a6 startConnection:(BOOL)a7 dispatchChannelQueue:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  os_activity_t v17;
  void *v18;
  dispatch_group_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  id v25;
  const char *v26;
  NSObject *v27;
  dispatch_queue_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BOOL4 v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  _QWORD v53[4];
  id v54;
  id location;
  os_activity_scope_state_s state;
  objc_super v57;
  _BYTE buf[12];
  __int16 v59;
  id v60;
  uint64_t v61;

  v48 = a7;
  v61 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v50 = a4;
  v14 = a5;
  v15 = a6;
  v49 = a8;
  v57.receiver = self;
  v57.super_class = (Class)ARRemoteService;
  v16 = -[ARRemoteService init](&v57, sel_init);
  if (v16)
  {
    v17 = _os_activity_create(&dword_1B3A68000, "Remote service", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v18 = (void *)*((_QWORD *)v16 + 6);
    *((_QWORD *)v16 + 6) = v17;

    *((_DWORD *)v16 + 10) = 0;
    v19 = dispatch_group_create();
    v20 = (void *)*((_QWORD *)v16 + 4);
    *((_QWORD *)v16 + 4) = v19;

    *((_BYTE *)v16 + 232) = 0;
    dispatch_group_enter(*((dispatch_group_t *)v16 + 4));
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v21 = _os_activity_create(&dword_1B3A68000, "Remote service init", *((os_activity_t *)v16 + 6), OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v21, &state);

    _ARLogGeneral_5();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v24;
      v59 = 2048;
      v60 = v16;
      _os_log_impl(&dword_1B3A68000, v22, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Remote service init", buf, 0x16u);

    }
    objc_msgSend(v13, "stringByAppendingString:", CFSTR(".asyncServiceQueue"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = (const char *)objc_msgSend(v25, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create(v26, v27);
    v29 = (void *)*((_QWORD *)v16 + 3);
    *((_QWORD *)v16 + 3) = v28;

    if (v15)
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v15);
    else
      v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v13, 4096);
    v31 = (void *)*((_QWORD *)v16 + 30);
    *((_QWORD *)v16 + 30) = v30;

    +[ARWeakReference weakReferenceWithObject:](ARWeakReference, "weakReferenceWithObject:", v16);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v16 + 30), "setExportedObject:", v32);

    objc_msgSend(*((id *)v16 + 30), "setExportedInterface:", v50);
    objc_msgSend(*((id *)v16 + 30), "setRemoteObjectInterface:", v14);
    objc_initWeak(&location, v16);
    v33 = (void *)*((_QWORD *)v16 + 30);
    v34 = MEMORY[0x1E0C809B0];
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __129__ARRemoteService_initWithMachServiceName_exportedInterface_remoteObjectInterface_endpoint_startConnection_dispatchChannelQueue___block_invoke;
    v53[3] = &unk_1E66722C0;
    objc_copyWeak(&v54, &location);
    objc_msgSend(v33, "setInterruptionHandler:", v53);
    v35 = (void *)*((_QWORD *)v16 + 30);
    v51[0] = v34;
    v51[1] = 3221225472;
    v51[2] = __129__ARRemoteService_initWithMachServiceName_exportedInterface_remoteObjectInterface_endpoint_startConnection_dispatchChannelQueue___block_invoke_2;
    v51[3] = &unk_1E66722C0;
    objc_copyWeak(&v52, &location);
    objc_msgSend(v35, "setInvalidationHandler:", v51);
    objc_msgSend(*((id *)v16 + 30), "resume");
    objc_msgSend(v16, "setStatus:", 0);
    v36 = objc_opt_new();
    v37 = (void *)*((_QWORD *)v16 + 1);
    *((_QWORD *)v16 + 1) = v36;

    *((_DWORD *)v16 + 4) = 0;
    *((_BYTE *)v16 + 64) = objc_msgSend(v16, "conformsToProtocol:", &unk_1EF0AB428);
    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("."));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "lastObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v40 = v39;
    LODWORD(v34) = objc_msgSend(v40, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buf, 8, 0, 1, 0, 0, objc_msgSend(v40, "length"), 0);

    v41 = *(_QWORD *)buf;
    if (!(_DWORD)v34)
      v41 = 0;
    *((_QWORD *)v16 + 7) = v41;

    v42 = MEMORY[0x1E0C83FF0];
    v43 = *MEMORY[0x1E0C83FF0];
    v44 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
    *((_OWORD *)v16 + 5) = *MEMORY[0x1E0C83FF0];
    *((_OWORD *)v16 + 6) = v44;
    v45 = *(_OWORD *)(v42 + 32);
    v46 = *(_OWORD *)(v42 + 48);
    *((_OWORD *)v16 + 7) = v45;
    *((_OWORD *)v16 + 8) = v46;
    *((_OWORD *)v16 + 9) = v43;
    *((_OWORD *)v16 + 10) = v44;
    *((_OWORD *)v16 + 11) = v45;
    *((_OWORD *)v16 + 12) = v46;
    *((_DWORD *)v16 + 52) = 0;
    objc_msgSend(v16, "setUpdateUnmodifiedAnchors:", 1);
    objc_msgSend(v16, "_commonInit");
    if (v48)
      objc_msgSend(v16, "_startService");
    objc_destroyWeak(&v52);
    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);

    os_activity_scope_leave(&state);
  }

  return (ARRemoteService *)v16;
}

void __129__ARRemoteService_initWithMachServiceName_exportedInterface_remoteObjectInterface_endpoint_startConnection_dispatchChannelQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serverConnectionInterrupted");

}

void __129__ARRemoteService_initWithMachServiceName_exportedInterface_remoteObjectInterface_endpoint_startConnection_dispatchChannelQueue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serverConnectionInvalidated");

}

- (void)dealloc
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *messageBuffer;
  objc_super v8;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARRemoteService *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1B3A68000, "dealloc", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  _ARLogGeneral_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    v12 = 2048;
    v13 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: dealloc", buf, 0x16u);

  }
  -[ARRemoteService setServiceDidInvalidateBlock:](self, "setServiceDidInvalidateBlock:", 0);
  -[ARRemoteService invalidate](self, "invalidate");
  -[ARRemoteService connectionDispatchGroupLeave](self, "connectionDispatchGroupLeave");
  messageBuffer = self->_messageBuffer;
  if (messageBuffer)
  {
    free(messageBuffer);
    self->_messageBuffer = 0;
  }
  os_activity_scope_leave(&state);
  v8.receiver = self;
  v8.super_class = (Class)ARRemoteService;
  -[ARRemoteService dealloc](&v8, sel_dealloc);
}

- (id)_getAsyncServiceQueue
{
  return self->_asyncServiceQueue;
}

- (void)connectionDispatchGroupLeave
{
  os_unfair_lock_s *p_connectionDispatchGroupLock;
  NSObject *connectionDispatchGroup;
  OS_dispatch_group *v5;

  p_connectionDispatchGroupLock = &self->_connectionDispatchGroupLock;
  os_unfair_lock_lock(&self->_connectionDispatchGroupLock);
  connectionDispatchGroup = self->_connectionDispatchGroup;
  if (connectionDispatchGroup)
  {
    dispatch_group_leave(connectionDispatchGroup);
    v5 = self->_connectionDispatchGroup;
    self->_connectionDispatchGroup = 0;

  }
  os_unfair_lock_unlock(p_connectionDispatchGroupLock);
}

- (void)_startService
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  BOOL skipRemoteObjectErrorHandlers;
  void *v8;
  ARDaemonServiceBaseProtocol *v9;
  ARDaemonServiceBaseProtocol *service;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  BOOL v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  ARRemoteService *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1B3A68000, "_startService", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  _ARLogGeneral_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v6;
    v20 = 2048;
    v21 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: _startService", buf, 0x16u);

  }
  skipRemoteObjectErrorHandlers = self->_skipRemoteObjectErrorHandlers;
  objc_initWeak((id *)buf, self);
  -[ARRemoteService connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __32__ARRemoteService__startService__block_invoke;
  v14 = &unk_1E6672E00;
  v16 = skipRemoteObjectErrorHandlers;
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &v11);
  v9 = (ARDaemonServiceBaseProtocol *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  self->_service = v9;

  if (self->_service)
  {
    -[ARRemoteService setStatus:](self, "setStatus:", 1, v11, v12, v13, v14);
    -[ARDaemonServiceBaseProtocol startService:](self->_service, "startService:", &__block_literal_global_16);
  }
  else
  {
    -[ARRemoteService serviceFailedWithError:](self, "serviceFailedWithError:", 0, v11, v12, v13, v14);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
  os_activity_scope_leave(&state);
}

void __32__ARRemoteService__startService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_BYTE *)(a1 + 40))
  {
    _ARLogGeneral_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_ERROR, "ARRemoteService: remote object proxy failed with error: %@", (uint8_t *)&v9, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "serviceFailedWithError:", v3);
    }
    else
    {
      _ARLogGeneral_5();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "ARRemoteService: weak self released before invalidation", (uint8_t *)&v9, 2u);
      }

    }
  }

}

void __32__ARRemoteService__startService__block_invoke_57(uint64_t a1, int a2)
{
  NSObject *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = CFSTR("unsuccessfully");
    if (a2)
      v4 = CFSTR("successfully");
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_DEBUG, "Connected to arkitd %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)invalidate
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  ARDaemonServiceBaseProtocol *service;
  ARDaemonServiceBaseProtocol *syncService;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  os_activity_scope_state_s v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  ARRemoteService *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1B3A68000, "invalidate", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v12);

  _ARLogGeneral_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2048;
    v16 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: invalidate", buf, 0x16u);

  }
  -[ARRemoteService connection](self, "connection", v12.opaque[0], v12.opaque[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[ARRemoteService setConnection:](self, "setConnection:", 0);
  service = self->_service;
  self->_service = 0;

  syncService = self->_syncService;
  self->_syncService = 0;

  -[ARRemoteService serviceDidInvalidateBlock](self, "serviceDidInvalidateBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ARRemoteService serviceDidInvalidateBlock](self, "serviceDidInvalidateBlock");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, ARRemoteService *))v11)[2](v11, self);

  }
  os_activity_scope_leave(&v12);
}

- (int64_t)_waitForDispatchGroup:(unint64_t)a3
{
  os_unfair_lock_s *p_connectionDispatchGroupLock;
  OS_dispatch_group *v6;
  intptr_t v7;

  p_connectionDispatchGroupLock = &self->_connectionDispatchGroupLock;
  os_unfair_lock_lock(&self->_connectionDispatchGroupLock);
  v6 = self->_connectionDispatchGroup;
  os_unfair_lock_unlock(p_connectionDispatchGroupLock);
  if (v6)
    v7 = dispatch_group_wait((dispatch_group_t)v6, a3);
  else
    v7 = 0;

  return v7;
}

- (BOOL)_waitUntilStarted:(unint64_t)a3
{
  int64_t v5;
  id v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  id location;

  objc_initWeak(&location, self);
  v5 = -[ARRemoteService _waitForDispatchGroup:](self, "_waitForDispatchGroup:", a3);
  v6 = objc_loadWeakRetained(&location);
  v7 = objc_msgSend(v6, "status");

  if (v5)
    v8 = 1;
  else
    v8 = (unint64_t)(v7 - 3) >= 2;
  v9 = !v8;
  objc_destroyWeak(&location);
  return v9;
}

- (BOOL)waitUntilStarted:(unint64_t)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__ARRemoteService_waitUntilStarted___block_invoke;
  v5[3] = &unk_1E6672E48;
  v5[4] = &v6;
  -[ARRemoteService syncServiceWithTimeout:callback:](self, "syncServiceWithTimeout:callback:", a3, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__ARRemoteService_waitUntilStarted___block_invoke(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 != 0;
  return result;
}

- (void)reconnect
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  dispatch_time_t v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  ARRemoteService *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1B3A68000, "reconnect", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  _ARLogGeneral_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v6;
    v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: reconnect", buf, 0x16u);

  }
  if (-[ARRemoteService status](self, "status") != 3)
  {
    if (-[ARRemoteService status](self, "status") == 4)
    {
      _ARLogGeneral_5();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v9;
        v19 = 2048;
        v20 = self;
        _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Service not started - delaying reconnection attempt", buf, 0x16u);

      }
      objc_initWeak((id *)buf, self);
      v10 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__ARRemoteService_reconnect__block_invoke;
      block[3] = &unk_1E66722C0;
      objc_copyWeak(&v15, (id *)buf);
      dispatch_after(v10, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v15);
      objc_destroyWeak((id *)buf);
    }
    _ARLogGeneral_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v13;
      v19 = 2048;
      v20 = self;
      _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Attempting reconnection", buf, 0x16u);

    }
    -[ARDaemonServiceBaseProtocol startService:](self->_service, "startService:", &__block_literal_global_65);
  }
  os_activity_scope_leave(&state);
}

void __28__ARRemoteService_reconnect__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reconnect");

}

void __28__ARRemoteService_reconnect__block_invoke_64()
{
  NSObject *v0;
  uint8_t v1[16];

  _ARLogGeneral_5();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B3A68000, v0, OS_LOG_TYPE_INFO, "Reconnected to arkitd", v1, 2u);
  }

}

- (void)syncServiceWithTimeout:(unint64_t)a3 callback:(id)a4
{
  id v4;
  void (**v7)(id, void *);
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  objc_class *v12;
  __CFString *v13;
  id v14;
  id location;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, void *))a4;
  objc_initWeak(&location, self);
  if (-[ARRemoteService _waitUntilStarted:](self, "_waitUntilStarted:", a3))
  {
    v8 = objc_loadWeakRetained(&location);
    objc_msgSend(v8, "syncService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

  }
  else
  {
    _ARLogGeneral_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_loadWeakRetained(&location);
      if (v11)
      {
        v4 = objc_loadWeakRetained(&location);
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = CFSTR("ARRemoteService");
      }
      v14 = objc_loadWeakRetained(&location);
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      v18 = 2048;
      v19 = v14;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%@ <%p>: syncService timed out.", buf, 0x16u);

      if (v11)
      {

      }
    }

    v7[2](v7, 0);
  }
  objc_destroyWeak(&location);

}

- (void)asyncServiceWithCallback:(id)a3
{
  id v4;
  NSObject *asyncServiceQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  asyncServiceQueue = self->_asyncServiceQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ARRemoteService_asyncServiceWithCallback___block_invoke;
  block[3] = &unk_1E6672E90;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(asyncServiceQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __44__ARRemoteService_asyncServiceWithCallback___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "_waitUntilStarted:", -1);

  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v7 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }
}

- (void)setService:(id)a3 syncService:(id)a4
{
  ARDaemonServiceBaseProtocol *v6;
  ARDaemonServiceBaseProtocol *v7;
  ARDaemonServiceBaseProtocol *service;
  ARDaemonServiceBaseProtocol *syncService;
  ARDaemonServiceBaseProtocol *v10;

  v6 = (ARDaemonServiceBaseProtocol *)a3;
  v7 = (ARDaemonServiceBaseProtocol *)a4;
  service = self->_service;
  self->_service = v6;
  v10 = v6;

  syncService = self->_syncService;
  self->_syncService = v7;

}

- (void)_serverConnectionInterrupted
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  ARRemoteService *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1B3A68000, "Connection interrupted", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v10);

  _ARLogGeneral_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2048;
    v14 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Connection interrupted", buf, 0x16u);

  }
  -[ARRemoteService connection](self, "connection", v10.opaque[0], v10.opaque[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {

  }
  else
  {
    v9 = -[ARRemoteService status](self, "status") == 0;

    if (!v9)
    {
      -[ARRemoteService setStatus:](self, "setStatus:", 4);
      -[ARRemoteService reconnect](self, "reconnect");
    }
  }
  os_activity_scope_leave(&v10);
}

- (void)_serverConnectionInvalidated
{
  NSObject *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  os_activity_scope_state_s v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  ARRemoteService *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1B3A68000, "Connection invalidated", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &v7);

  _ARLogGeneral_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v9 = v6;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Connection invalidated", buf, 0x16u);

  }
  -[ARRemoteService setConnection:](self, "setConnection:", 0, v7.opaque[0], v7.opaque[1]);
  os_activity_scope_leave(&v7);
}

- (id)clientProcessName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)clientProcessIdentifier
{
  void *v2;
  int v3;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

+ (id)serviceName
{
  return &stru_1E6676798;
}

+ (id)createRemoteServiceInterface:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", a3);
}

+ (id)createDaemonServiceInterface:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", a3);
}

+ (NSXPCInterface)remoteServiceInterface
{
  return 0;
}

+ (NSXPCInterface)daemonServiceInterface
{
  return 0;
}

- (void)serviceConfiguredWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (void)serviceFailedWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  os_activity_scope_state_s v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ARRemoteService *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  v5 = _os_activity_create(&dword_1B3A68000, "serviceFailedWithError", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v9);

  _ARLogGeneral_5();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v11 = v8;
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: serviceFailedWithError: %@", buf, 0x20u);

  }
  -[ARRemoteService setStatus:](self, "setStatus:", 2, v9.opaque[0], v9.opaque[1]);
  -[ARRemoteService connectionDispatchGroupLeave](self, "connectionDispatchGroupLeave");
  os_activity_scope_leave(&v9);

}

- (void)serviceConfiguredWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id location;
  _BYTE buf[22];
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _ARLogGeneral_5();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = self;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Service configured with error: %@", buf, 0x20u);

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1B3A68000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Service successfully configured", buf, 0x16u);

  }
  if (-[ARRemoteService status](self, "status") == 4)
    -[ARRemoteService serviceDidReconnect:](self, "serviceDidReconnect:", v4 == 0);
  if (v4)
  {
    -[ARRemoteService invalidate](self, "invalidate");
    -[ARRemoteService serviceFailedWithError:](self, "serviceFailedWithError:", v4);
  }
  else
  {
    -[ARRemoteService setStatus:](self, "setStatus:", 3);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = 0;
    v11 = _os_activity_create(&dword_1B3A68000, "serviceConfiguredWithNOError", (os_activity_t)self->_remoteServiceActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v11, (os_activity_scope_state_t)buf);

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__ARRemoteService_serviceConfiguredWithError___block_invoke;
    v12[3] = &unk_1E66722C0;
    objc_copyWeak(&v13, &location);
    -[ARRemoteService serviceConfiguredWithCompletionHandler:](self, "serviceConfiguredWithCompletionHandler:", v12);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    os_activity_scope_leave((os_activity_scope_state_t)buf);
  }

}

void __46__ARRemoteService_serviceConfiguredWithError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  objc_class *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _ARLogGeneral_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_INFO, "%{public}@ - Preparing sync service and leaving dispatch group", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__ARRemoteService_serviceConfiguredWithError___block_invoke_72;
    v8[3] = &unk_1E6672EB8;
    v9 = v3;
    v6 = v3;
    objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setSyncService:", v7);

    objc_msgSend(WeakRetained, "connectionDispatchGroupLeave");
  }

}

void __46__ARRemoteService_serviceConfiguredWithError___block_invoke_72(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _ARLogGeneral_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_ERROR, "%{public}@ - Synchronous remote object proxy failed with error: %@", (uint8_t *)&v6, 0x16u);
  }

}

+ (BOOL)isSupportedWithError:(id *)a3
{
  return 0;
}

+ (BOOL)isSupported
{
  return objc_msgSend(a1, "isSupportedWithError:", 0);
}

- (ARRemoteService)initWithDaemon:(id)a3
{
  return -[ARRemoteService initWithDaemon:startConnection:dispatchChannelQueue:](self, "initWithDaemon:startConnection:dispatchChannelQueue:", a3, 0, 0);
}

- (ARRemoteService)initWithDaemon:(id)a3 dispatchChannelQueue:(id)a4
{
  return -[ARRemoteService initWithDaemon:startConnection:dispatchChannelQueue:](self, "initWithDaemon:startConnection:dispatchChannelQueue:", a3, 0, a4);
}

- (ARRemoteService)initWithDaemon:(id)a3 startConnection:(BOOL)a4
{
  return -[ARRemoteService initWithDaemon:startConnection:dispatchChannelQueue:](self, "initWithDaemon:startConnection:dispatchChannelQueue:", a3, a4, 0);
}

- (ARRemoteService)initWithDaemon:(id)a3 startConnection:(BOOL)a4 dispatchChannelQueue:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  ARRemoteService *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "performSelector:", sel_serviceName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listenerEndPointForServiceNamed:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = -[ARRemoteService initWithEndpoint:startConnection:dispatchChannelQueue:](self, "initWithEndpoint:startConnection:dispatchChannelQueue:", v11, v5, v8);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "serviceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "remoteServiceInterface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "daemonServiceInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ARRemoteService initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:](self, "initWithMachServiceName:exportedInterface:remoteObjectInterface:endpoint:startConnection:dispatchChannelQueue:", v13, v14, v15, 0, v5, v8);

  }
  return v12;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 240, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (__n128)worldFromOrigin
{
  return a1[18];
}

- (__n128)originFromWorld
{
  return a1[22];
}

- (ARDaemonServiceBaseProtocol)syncService
{
  return (ARDaemonServiceBaseProtocol *)objc_getProperty(self, a2, 256, 1);
}

- (void)setSyncService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (ARDaemonServiceBaseProtocol)service
{
  return self->_service;
}

- (ARRemoteServiceAnchorDelegate)anchorDelegate
{
  return (ARRemoteServiceAnchorDelegate *)objc_loadWeakRetained((id *)&self->_anchorDelegate);
}

- (void)setAnchorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_anchorDelegate, a3);
}

- (BOOL)updateUnmodifiedAnchors
{
  return self->_updateUnmodifiedAnchors;
}

- (void)setUpdateUnmodifiedAnchors:(BOOL)a3
{
  self->_updateUnmodifiedAnchors = a3;
}

- (id)serviceDidInvalidateBlock
{
  return self->_serviceDidInvalidateBlock;
}

- (void)setServiceDidInvalidateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serviceDidInvalidateBlock, 0);
  objc_destroyWeak((id *)&self->_anchorDelegate);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_syncService, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteServiceActivity, 0);
  objc_storeStrong((id *)&self->_connectionDispatchGroup, 0);
  objc_storeStrong((id *)&self->_asyncServiceQueue, 0);
  objc_storeStrong((id *)&self->_anchorsByIdentifier, 0);
}

@end
