@implementation BKHIDDomainServiceServer

void __55__BKHIDDomainServiceServer_enumerateUserInfoWithBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v11, v10);

  }
}

- (id)userInfoForConnection:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)connectionForPID:(int)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSMutableIntegerMap objectForKey:](self->_lock_connectionsByPID, "objectForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)enumerateUserInfoWithBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;
  id v7;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[BSMutableIntegerMap copy](self->_lock_connectionsByPID, "copy");
  os_unfair_lock_unlock(p_lock);
  if (v5)
  {
    v7 = v6;
    BSIntegerMapEnumerateWithBlock();

  }
}

- (BKHIDDomainServiceServer)initWithDelegate:(id)a3 serverTarget:(id)a4 serverProtocol:(id)a5 clientProtocol:(id)a6 serviceName:(id)a7 queue:(id)a8 log:(id)a9 entitlement:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  BKHIDDomainServiceServer *v21;
  BKHIDDomainServiceServer *v22;
  uint64_t v23;
  NSString *serviceName;
  uint64_t v25;
  NSString *entitlement;
  void *v27;
  void *v28;
  void *v29;
  BSServiceInterface *interface;
  id v31;
  void *v32;
  BKHIDDomainServiceServer *v33;
  uint64_t v34;
  BSServiceConnectionListener *connectionListener;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  BKHIDDomainServiceServer *v43;
  objc_super v44;

  v40 = a3;
  v39 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v38 = a8;
  v37 = a9;
  v20 = a10;
  v44.receiver = self;
  v44.super_class = (Class)BKHIDDomainServiceServer;
  v21 = -[BKHIDDomainServiceServer init](&v44, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_delegate, a3);
    objc_storeStrong(&v22->_serviceTarget, a4);
    objc_storeStrong((id *)&v22->_queue, a8);
    v23 = objc_msgSend(v19, "copy", v37, v38, v39, v40);
    serviceName = v22->_serviceName;
    v22->_serviceName = (NSString *)v23;

    objc_storeStrong((id *)&v22->_log, a9);
    v25 = objc_msgSend(v20, "copy");
    entitlement = v22->_entitlement;
    v22->_entitlement = (NSString *)v25;

    objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", v18);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setServer:", v27);
    objc_msgSend(v29, "setClient:", v28);
    interface = v22->_interface;
    v22->_interface = (BSServiceInterface *)v29;
    v31 = v29;

    v32 = (void *)MEMORY[0x1E0D03460];
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __122__BKHIDDomainServiceServer_initWithDelegate_serverTarget_serverProtocol_clientProtocol_serviceName_queue_log_entitlement___block_invoke;
    v41[3] = &unk_1E81F6A30;
    v42 = v19;
    v33 = v22;
    v43 = v33;
    objc_msgSend(v32, "listenerWithConfigurator:", v41);
    v34 = objc_claimAutoreleasedReturnValue();
    connectionListener = v33->_connectionListener;
    v33->_connectionListener = (BSServiceConnectionListener *)v34;

  }
  return v22;
}

- (void)invalidate
{
  atomic_flag *p_invalid;
  unsigned __int8 v4;
  BSServiceConnectionListener *connectionListener;
  BKHIDDomainServiceDelegate *delegate;
  id serviceTarget;
  OS_dispatch_queue *queue;
  OS_os_log *log;

  p_invalid = &self->_invalid;
  do
    v4 = __ldaxr((unsigned __int8 *)p_invalid);
  while (__stlxr(1u, (unsigned __int8 *)p_invalid));
  if ((v4 & 1) == 0)
  {
    -[BSServiceConnectionListener invalidate](self->_connectionListener, "invalidate");
    connectionListener = self->_connectionListener;
    self->_connectionListener = 0;

    delegate = self->_delegate;
    self->_delegate = 0;

    serviceTarget = self->_serviceTarget;
    self->_serviceTarget = 0;

    queue = self->_queue;
    self->_queue = 0;

    log = self->_log;
    self->_log = 0;

  }
}

- (void)activate
{
  -[BSServiceConnectionListener activate](self->_connectionListener, "activate");
}

- (void)setUserInfo:(id)a3 forConnection:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  objc_msgSend(a4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (v9)
    objc_msgSend(v9, "setUserInfo:", v10);

}

- (BOOL)responsePendingForConnection:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  char v8;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  v8 = objc_msgSend(v7, "responsePending");
  return v8;
}

- (id)didRespondBlockForConnection:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setResponsePending:", 1);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__BKHIDDomainServiceServer_didRespondBlockForConnection___block_invoke;
  v12[3] = &unk_1E81F7460;
  v13 = v7;
  v8 = v7;
  v9 = (void *)MEMORY[0x1CAA37E74](v12);
  v10 = (void *)MEMORY[0x1CAA37E74]();

  return v10;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  int v8;
  NSObject *log;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  int v14;
  NSObject *v15;
  unsigned int v16;
  BSMutableIntegerMap *lock_connectionsByPID;
  BSMutableIntegerMap *v18;
  BSMutableIntegerMap *v19;
  NSObject *queue;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSString *entitlement;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *);
  void *v32;
  BKHIDDomainServiceServer *v33;
  id v34;
  _BYTE block[24];
  void *v36;
  BKHIDDomainServiceServer *v37;
  id v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pid");
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)block = 138543618;
    *(_QWORD *)&block[4] = v6;
    *(_WORD *)&block[12] = 1024;
    *(_DWORD *)&block[14] = v8;
    _os_log_debug_impl(&dword_1C8914000, log, OS_LOG_TYPE_DEBUG, "got a connection! -- %{public}@ pid:%d", block, 0x12u);
  }
  if (v8 <= 0)
  {
    v21 = self->_log;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      objc_msgSend(v6, "invalidate");
      goto LABEL_21;
    }
    *(_DWORD *)block = 67109378;
    *(_DWORD *)&block[4] = v8;
    *(_WORD *)&block[8] = 2114;
    *(_QWORD *)&block[10] = v6;
    v22 = "dropping connection with junk pid (%d) -- %{public}@, ";
    v23 = v21;
    v24 = 18;
LABEL_23:
    _os_log_error_impl(&dword_1C8914000, v23, OS_LOG_TYPE_ERROR, v22, block, v24);
    goto LABEL_16;
  }
  if (self->_entitlement && !objc_msgSend(v7, "hasEntitlement:"))
  {
    v25 = self->_log;
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    entitlement = self->_entitlement;
    *(_DWORD *)block = 138543618;
    *(_QWORD *)&block[4] = v7;
    *(_WORD *)&block[12] = 2114;
    *(_QWORD *)&block[14] = entitlement;
    v22 = "cannot connect to '%{public}@': missing entitlement %{public}@";
    v23 = v25;
    v24 = 22;
    goto LABEL_23;
  }
  v10 = MEMORY[0x1E0C809B0];
  v29 = MEMORY[0x1E0C809B0];
  v30 = 3221225472;
  v31 = __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke;
  v32 = &unk_1E81F6AA8;
  v33 = self;
  v11 = v7;
  v34 = v11;
  objc_msgSend(v6, "configureConnection:", &v29);
  objc_msgSend(v6, "activate", v29, v30, v31, v32, v33);
  v12 = v6;
  v13 = v11;
  v14 = objc_msgSend(v13, "pid");
  v15 = self->_log;
  if (v14 < 1)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)block = 138543362;
      *(_QWORD *)&block[4] = v12;
      _os_log_error_impl(&dword_1C8914000, v15, OS_LOG_TYPE_ERROR, "cannot get remote process for connection %{public}@", block, 0xCu);
    }
    objc_msgSend(v12, "invalidate");
  }
  else
  {
    v16 = v14;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    {
      v26 = v15;
      objc_msgSend(v12, "remoteTarget");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)block = 67109378;
      *(_DWORD *)&block[4] = v16;
      *(_WORD *)&block[8] = 2114;
      *(_QWORD *)&block[10] = v27;
      _os_log_debug_impl(&dword_1C8914000, v26, OS_LOG_TYPE_DEBUG, "pid:%d remote target: %{public}@", block, 0x12u);

    }
    os_unfair_lock_lock(&self->_lock);
    lock_connectionsByPID = self->_lock_connectionsByPID;
    if (!lock_connectionsByPID)
    {
      v18 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
      v19 = self->_lock_connectionsByPID;
      self->_lock_connectionsByPID = v18;

      lock_connectionsByPID = self->_lock_connectionsByPID;
    }
    -[BSMutableIntegerMap setObject:forKey:](lock_connectionsByPID, "setObject:forKey:", v12, v16);
    os_unfair_lock_unlock(&self->_lock);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      queue = self->_queue;
      *(_QWORD *)block = v10;
      *(_QWORD *)&block[8] = 3221225472;
      *(_QWORD *)&block[16] = __51__BKHIDDomainServiceServer__addConnection_process___block_invoke;
      v36 = &unk_1E81F7BE8;
      v37 = self;
      v38 = v12;
      v39 = v13;
      dispatch_sync(queue, block);

    }
  }

LABEL_21:
}

- (id)currentConnection
{
  return (id)objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
}

- (id)remoteTargetForServiceConnection:(id)a3
{
  return (id)objc_msgSend(a3, "remoteTarget");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connectionsByPID, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_serviceTarget, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

void __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BKHIDDomainClientRecord *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];
  id v12;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    objc_msgSend(v3, "setTargetQueue:");
  v5 = objc_alloc_init(_BKHIDDomainClientRecord);
  objc_msgSend(v3, "setUserInfo:", v5);

  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v11[3] = &unk_1E81F6A80;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v7;
  objc_msgSend(v3, "setInterruptionHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke_28;
  v9[3] = &unk_1E81F6A80;
  v8 = *(void **)(a1 + 40);
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(v3, "setInvalidationHandler:", v9);

}

uint64_t __51__BKHIDDomainServiceServer__addConnection_process___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "connectionDidBegin:process:", a1[5], a1[6]);
}

void __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 48);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1C8914000, v5, OS_LOG_TYPE_ERROR, "interrupted connection %{public}@", (uint8_t *)&v7, 0xCu);
    v4 = *(_QWORD *)(a1 + 32);
  }
  -[BKHIDDomainServiceServer _removeConnection:process:](v4, v3, *(void **)(a1 + 40));

}

void __70__BKHIDDomainServiceServer_listener_didReceiveConnection_withContext___block_invoke_28(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 48);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543362;
    v8 = v6;
    _os_log_error_impl(&dword_1C8914000, v5, OS_LOG_TYPE_ERROR, "invalidated connection %{public}@", (uint8_t *)&v7, 0xCu);
    v4 = *(_QWORD *)(a1 + 32);
  }
  -[BKHIDDomainServiceServer _removeConnection:process:](v4, v3, *(void **)(a1 + 40));

}

- (void)_removeConnection:(void *)a3 process:
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v7 = objc_msgSend(v6, "pid");
    v8 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = v8;
      objc_msgSend(v5, "remoteTarget");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = 67109378;
      v11[1] = v7;
      v12 = 2114;
      v13 = v10;
      _os_log_debug_impl(&dword_1C8914000, v9, OS_LOG_TYPE_DEBUG, "removing connection pid:%d remote target: %{public}@", (uint8_t *)v11, 0x12u);

    }
    objc_msgSend(*(id *)(a1 + 72), "removeObjectForKey:", (int)objc_msgSend(v6, "pid"));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 16), "connectionDidTerminate:process:", v5, v6);
  }

}

uint64_t __57__BKHIDDomainServiceServer_didRespondBlockForConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setResponsePending:", 0);
}

void __122__BKHIDDomainServiceServer_initWithDelegate_serverTarget_serverProtocol_clientProtocol_serviceName_queue_log_entitlement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *MEMORY[0x1E0D00AD8];
  v4 = a2;
  objc_msgSend(v4, "setDomain:", v3);
  objc_msgSend(v4, "setService:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 40));

}

@end
