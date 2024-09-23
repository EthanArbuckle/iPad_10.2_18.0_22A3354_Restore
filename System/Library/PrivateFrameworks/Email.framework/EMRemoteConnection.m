@implementation EMRemoteConnection

- (void)_sendInvocation:(id)a3 withProxy:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *queue;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  EMRemoteConnection *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  SEL v29;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "reattemptHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isSynchronous"))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke;
    block[3] = &unk_1E70F57B8;
    block[4] = self;
    v28 = v9;
    v29 = a2;
    v27 = v7;
    v11 = v9;
    dispatch_sync(queue, block);

  }
  else
  {
    CopyInvocation(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "retainArguments");
    objc_msgSend(v7, "methodSignature");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "_classForObjectAtArgumentIndex:", -1);
    if (v13 == objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v25 = v14;
      objc_msgSend(v7, "setReturnValue:", &v25);
    }
    else
    {
      v14 = 0;
    }
    v15 = self->_queue;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_64;
    v19[3] = &unk_1E70F5808;
    v24 = v9;
    v20 = v12;
    v21 = self;
    v22 = v8;
    v23 = v14;
    v16 = v14;
    v17 = v12;
    v18 = v9;
    dispatch_async(v15, v19);

  }
}

- (id)proxyCreator:(id *)a3
{
  os_unfair_lock_s *p_proxyLock;
  NSXPCProxyCreating *v6;
  id WeakRetained;
  void *v8;
  Protocol *protocol;
  NSXPCProxyCreating *v10;
  id v11;
  NSXPCProxyCreating *currentProxy;
  id v14;

  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  v6 = self->_currentProxy;
  if (!v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
    v8 = WeakRetained;
    if (WeakRetained)
    {
      protocol = self->_protocol;
      v14 = 0;
      objc_msgSend(WeakRetained, "generateProxyForProtocol:error:", protocol, &v14);
      v10 = (NSXPCProxyCreating *)objc_claimAutoreleasedReturnValue();
      v11 = v14;
      currentProxy = self->_currentProxy;
      self->_currentProxy = v10;

      v6 = v10;
    }
    else if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EMErrorDomain"), 2, 0);
      v11 = 0;
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
      v6 = 0;
    }

  }
  os_unfair_lock_unlock(p_proxyLock);
  return v6;
}

- (id)reattemptingRemoteObjectProxy
{
  _EMRemoteInterfaceDistantObject *v3;
  id WeakRetained;
  void *v5;
  _EMRemoteInterfaceDistantObject *v6;

  v3 = [_EMRemoteInterfaceDistantObject alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  defaultReattemptingHandlerForConnection(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_EMRemoteInterfaceDistantObject initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:](v3, "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", self, WeakRetained, 0, v5);

  return v6;
}

- (id)remoteObjectProxy
{
  _EMRemoteInterfaceDistantObject *v3;
  id WeakRetained;
  void *v5;
  _EMRemoteInterfaceDistantObject *v6;

  v3 = [_EMRemoteInterfaceDistantObject alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  defaultNonReattemptingHandlerForConnection(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_EMRemoteInterfaceDistantObject initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:](v3, "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", self, WeakRetained, 0, v5);

  return v6;
}

- (id)requestRecoveryAssertion
{
  return -[EMRemoteConnectionRecoveryAssertion initWithConnection:]([EMRemoteConnectionRecoveryAssertion alloc], "initWithConnection:", self);
}

- (void)voucherInitialized
{
  unsigned int *p_activeVouchers;
  unsigned int v3;

  p_activeVouchers = &self->_activeVouchers;
  do
    v3 = __ldaxr(p_activeVouchers);
  while (__stlxr(v3 + 1, p_activeVouchers));
}

- (id)_methodSignatureForRemoteSelector:(SEL)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  CFDictionaryGetValue(self->_knownSelectors, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    if ((unint64_t)protocol_getMethodDescription(self->_protocol, a3, 1, 1).name
      || (unint64_t)protocol_getMethodDescription(self->_protocol, a3, 0, 1).name)
    {
      objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", _protocol_getMethodTypeEncoding());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_lock(p_lock);
      CFDictionarySetValue(self->_knownSelectors, a3, v6);
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (void)voucherInvalidated
{
  unsigned int *p_activeVouchers;
  unsigned int v3;

  p_activeVouchers = &self->_activeVouchers;
  do
    v3 = __ldaxr(p_activeVouchers);
  while (__stlxr(v3 - 1, p_activeVouchers));
}

- (EMRemoteConnection)initWithProtocol:(id)a3 proxyGenerator:(id)a4
{
  Protocol *v7;
  id v8;
  EMRemoteConnection *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  NSMutableArray *v19;
  NSMutableArray *resetHandlers;
  NSMutableArray *v21;
  NSMutableArray *recoveryHandlers;
  NSMutableArray *v23;
  NSMutableArray *pendingReattempts;
  objc_super v26;

  v7 = (Protocol *)a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)EMRemoteConnection;
  v9 = -[EMRemoteConnection init](&v26, sel_init);
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromProtocol(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.email.EMRemoteConnection.%@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_retainAutorelease(v12);
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create_with_target_V2(v14, v15, v16);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v17;

    objc_storeWeak((id *)&v9->_generator, v8);
    objc_storeStrong((id *)&v9->_protocol, a3);
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    resetHandlers = v9->_resetHandlers;
    v9->_resetHandlers = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recoveryHandlers = v9->_recoveryHandlers;
    v9->_recoveryHandlers = v21;

    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingReattempts = v9->_pendingReattempts;
    v9->_pendingReattempts = v23;

    v9->_knownSelectors = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
    atomic_store(0, &v9->_activeVouchers);

  }
  return v9;
}

- (void)addResetHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *resetHandlers;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  resetHandlers = self->_resetHandlers;
  v7 = (void *)objc_msgSend(v5, "copy");

  v8 = (void *)MEMORY[0x1BCCC8C10](v7);
  -[NSMutableArray addObject:](resetHandlers, "addObject:", v8);

  os_unfair_lock_unlock(p_lock);
}

- (void)addRecoveryHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableArray *recoveryHandlers;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  recoveryHandlers = self->_recoveryHandlers;
  v7 = (void *)objc_msgSend(v5, "copy");

  v8 = (void *)MEMORY[0x1BCCC8C10](v7);
  -[NSMutableArray addObject:](recoveryHandlers, "addObject:", v8);

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_knownSelectors);
  v3.receiver = self;
  v3.super_class = (Class)EMRemoteConnection;
  -[EMRemoteConnection dealloc](&v3, sel_dealloc);
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  _EMRemoteInterfaceDistantObject *v5;
  id WeakRetained;
  void *v7;
  _EMRemoteInterfaceDistantObject *v8;

  v4 = a3;
  v5 = [_EMRemoteInterfaceDistantObject alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  nonReattemptingHandlerForErrorHandler(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_EMRemoteInterfaceDistantObject initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:](v5, "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", self, WeakRetained, 0, v7);

  return v8;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  _EMRemoteInterfaceDistantObject *v5;
  id WeakRetained;
  void *v7;
  _EMRemoteInterfaceDistantObject *v8;

  v4 = a3;
  v5 = [_EMRemoteInterfaceDistantObject alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  nonReattemptingHandlerForErrorHandler(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_EMRemoteInterfaceDistantObject initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:](v5, "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", self, WeakRetained, 1, v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_generator);
  objc_storeStrong((id *)&self->_currentProxy, 0);
  objc_storeStrong((id *)&self->_pendingReattempts, 0);
  objc_storeStrong((id *)&self->_recoveryHandlers, 0);
  objc_storeStrong((id *)&self->_resetHandlers, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *, void *);
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v23 = 0;
  objc_msgSend(v2, "proxyCreator:", &v23);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
  v5 = v4;
  if (v3)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_2;
    v19 = &unk_1E70F5790;
    v6 = *(id *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 56);
    v21 = v6;
    v22 = v7;
    v20 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", &v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "invokeWithTarget:", v8, v16, v17, v18, v19);

    v9 = v21;
LABEL_3:

    goto LABEL_4;
  }
  v13 = *(_QWORD *)(a1 + 48);
  if (v13)
  {
    v14 = v4;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Creating an proxy creator failed but we didn't got an error"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v15 = (*(uint64_t (**)(uint64_t, void *))(v13 + 16))(v13, v14);
    if (!v5)

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("EMRemoteConnection.m"), 393, CFSTR("reattempt handler returned YES for a synchronous message which is not allowed."));
      goto LABEL_3;
    }
  }
LABEL_4:
  if (v5)
  {
    +[EMRemoteConnection log](EMRemoteConnection, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "ef_publicDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v11;
      v26 = 2114;
      v27 = v12;
      _os_log_impl(&dword_1B99BB000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Failed to retrive a valid proxyCreator due to error: %{public}@", buf, 0x16u);

    }
  }

}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__EMRemoteConnection_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_34 != -1)
    dispatch_once(&log_onceToken_34, block);
  return (OS_os_log *)(id)log_log_34;
}

void __25__EMRemoteConnection_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_34;
  log_log_34 = (uint64_t)v1;

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  NSStringFromProtocol(self->_protocol);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRemoteConnection proxy](self, "proxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("active");
  if (!v6)
    v7 = CFSTR("inactive");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@ (%@)"), v4, self, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[NSMutableArray count](self->_resetHandlers, "count");
  v5 = -[NSMutableArray count](self->_recoveryHandlers, "count");
  v6 = (void *)-[NSMutableArray copy](self->_pendingReattempts, "copy");
  os_unfair_lock_unlock(p_lock);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = objc_opt_class();
  NSStringFromProtocol(self->_protocol);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMRemoteConnection proxy](self, "proxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p> %@: %ld reset, %ld recovery, currentProxy=%p, pendingReattempts=%@"), v8, self, v9, v4, v5, v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)reset
{
  os_unfair_lock_s *p_lock;
  void *v4;
  NSXPCProxyCreating *currentProxy;
  id v6;
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
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_waitingForRecovery = 1;
  v4 = (void *)-[NSMutableArray copy](self->_resetHandlers, "copy");
  os_unfair_lock_unlock(p_lock);
  os_unfair_lock_lock(&self->_proxyLock);
  currentProxy = self->_currentProxy;
  self->_currentProxy = 0;

  os_unfair_lock_unlock(&self->_proxyLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)recover
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_waitingForRecovery = 0;
  v4 = (void *)-[NSMutableArray copy](self->_pendingReattempts, "copy");
  v5 = (void *)-[NSMutableArray copy](self->_recoveryHandlers, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingReattempts, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v7);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "perform", (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }

}

- (id)proxy
{
  os_unfair_lock_s *p_proxyLock;
  NSXPCProxyCreating *v4;

  p_proxyLock = &self->_proxyLock;
  os_unfair_lock_lock(&self->_proxyLock);
  v4 = self->_currentProxy;
  os_unfair_lock_unlock(p_proxyLock);
  return v4;
}

- (BOOL)prefersImmediateActivity
{
  unsigned int v2;

  v2 = atomic_load(&self->_activeVouchers);
  return v2 != 0;
}

- (BOOL)_respondsToRemoteSelector:(SEL)a3
{
  SEL name;

  name = protocol_getMethodDescription(self->_protocol, a3, 1, 1).name;
  if (!name)
    name = protocol_getMethodDescription(self->_protocol, a3, 0, 1).name;
  return name != 0;
}

- (void)_reattemptInvocation:(id)a3 withProxy:(id)a4 originalError:(id)a5
{
  id v6;

  +[_EMRemoteInterfaceDistantObjectReattempt recordedAttemptWithOriginalInvocation:target:error:](_EMRemoteInterfaceDistantObjectReattempt, "recordedAttemptWithOriginalInvocation:target:error:", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (self->_waitingForRecovery)
  {
    -[NSMutableArray addObject:](self->_pendingReattempts, "addObject:", v6);
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    objc_msgSend(v6, "perform");
  }

}

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = a1[5];
  if (v4)
  {
    v7 = v3;
    v5 = (*(uint64_t (**)(void))(v4 + 16))();
    v3 = v7;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("EMRemoteConnection.m"), 386, CFSTR("reattempt handler returned YES for a synchronous message which is not allowed."));

      v3 = v7;
    }
  }

}

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_64(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  void (**v14)(_QWORD, _QWORD);
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v2 = MEMORY[0x1E0C809B0];
  if (*(_QWORD *)(a1 + 64))
  {
    CopyInvocation(*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTarget:", 0);
    objc_msgSend(v3, "retainArguments");
    v16[0] = v2;
    v16[1] = 3221225472;
    v16[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_2_65;
    v16[3] = &unk_1E70F57E0;
    v19 = *(id *)(a1 + 64);
    v4 = *(void **)(a1 + 48);
    v16[4] = *(_QWORD *)(a1 + 40);
    v17 = v3;
    v18 = v4;
    v5 = v3;
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1BCCC8C10](v16);

  }
  else
  {
    v6 = 0;
  }
  v7 = *(void **)(a1 + 40);
  v15 = 0;
  objc_msgSend(v7, "proxyCreator:", &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    if (v6)
    {
      v13[0] = v2;
      v13[1] = 3221225472;
      v13[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_3;
      v13[3] = &unk_1E70F4ED8;
      v13[4] = *(_QWORD *)(a1 + 40);
      v14 = v6;
      objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "remoteObjectProxy");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", v11);
    if (*(_QWORD *)(a1 + 56))
    {
      v12 = 0;
      objc_msgSend(*(id *)(a1 + 32), "getReturnValue:", &v12);
      if (v12)
        objc_msgSend(*(id *)(a1 + 56), "addChild:withPendingUnitCount:", v12, 1);
    }
LABEL_16:

    goto LABEL_17;
  }
  if (v6)
  {
    v11 = v9;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "em_internalErrorWithReason:", CFSTR("Creating an proxy creator failed but we didn't got an error"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    ((void (**)(_QWORD, void *))v6)[2](v6, v11);
    if (!v10)
      goto LABEL_16;
  }
LABEL_17:

}

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_2_65(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 56) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "_reattemptInvocation:withProxy:originalError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3);

}

void __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_4;
  v7[3] = &unk_1E70F2F18;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __48__EMRemoteConnection__sendInvocation_withProxy___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)reattemptingRemoteObjectProxyWithReattemptHandler:(id)a3
{
  id v4;
  _EMRemoteInterfaceDistantObject *v5;
  id WeakRetained;
  _EMRemoteInterfaceDistantObject *v7;

  v4 = a3;
  v5 = [_EMRemoteInterfaceDistantObject alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_generator);
  v7 = -[_EMRemoteInterfaceDistantObject initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:](v5, "initWithRemoteInterface:proxyGenerator:synchronous:reattemptHandler:", self, WeakRetained, 0, v4);

  return v7;
}

- (Protocol)protocol
{
  return (Protocol *)objc_getProperty(self, a2, 16, 1);
}

- (EMRemoteProxyGenerator)generator
{
  return (EMRemoteProxyGenerator *)objc_loadWeakRetained((id *)&self->_generator);
}

- (void)setGenerator:(id)a3
{
  objc_storeWeak((id *)&self->_generator, a3);
}

@end
