@implementation HKProxyProvider

+ (id)_relaunchQueue
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__HKProxyProvider__relaunchQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_relaunchQueue_onceToken != -1)
    dispatch_once(&_relaunchQueue_onceToken, block);
  return (id)_relaunchQueue_relaunchQueue;
}

void __33__HKProxyProvider__relaunchQueue__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  HKCreateSerialDispatchQueue(*(void **)(a1 + 32), CFSTR("server-relaunch"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_relaunchQueue_relaunchQueue;
  _relaunchQueue_relaunchQueue = v1;

}

- (HKProxyProvider)initWithSource:(id)a3 serviceIdentifier:(id)a4 exportedObject:(id)a5 exportedInterface:(id)a6 remoteInterface:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  HKProxyProvider *v19;
  HKProxyProvider *v20;
  uint64_t v21;
  NSString *serviceIdentifier;
  void *v23;
  void *v24;
  OS_dispatch_queue *v25;
  OS_dispatch_queue *clientQueue;
  uint64_t v27;
  NSString *daemonLaunchNotificationName;
  objc_super v30;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (!v13)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[HKProxyProvider initWithSource:serviceIdentifier:exportedObject:exportedInterface:remoteInterface:].cold.1((uint64_t)self, v18);

  }
  v30.receiver = self;
  v30.super_class = (Class)HKProxyProvider;
  v19 = -[HKProxyProvider init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_source, a3);
    v21 = objc_msgSend(v14, "copy");
    serviceIdentifier = v20->_serviceIdentifier;
    v20->_serviceIdentifier = (NSString *)v21;

    objc_storeWeak((id *)&v20->_exportedObject, v15);
    objc_storeStrong((id *)&v20->_exportedInterface, a6);
    objc_storeStrong((id *)&v20->_remoteInterface, a7);
    v20->_shouldRetryOnInterruption = 1;
    *(_QWORD *)&v20->_lock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
    objc_msgSend(v13, "clientQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      HKCreateSerialDispatchQueue(v20, 0);
      v25 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    clientQueue = v20->_clientQueue;
    v20->_clientQueue = v25;

    objc_msgSend(v13, "daemonLaunchDarwinNotificationName");
    v27 = objc_claimAutoreleasedReturnValue();
    daemonLaunchNotificationName = v20->_daemonLaunchNotificationName;
    v20->_daemonLaunchNotificationName = (NSString *)v27;

  }
  return v20;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  int notifyToken;
  objc_super v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[_HKXPCConnection invalidate](self->_connection, "invalidate");
  if (self->_lock_automaticProxyReconnectionHandler)
  {
    notifyToken = self->_notifyToken;
    if (notifyToken != -1)
      notify_cancel(notifyToken);
  }
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)HKProxyProvider;
  -[HKProxyProvider dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_invalidated = 1;
  -[_HKXPCConnection invalidate](self->_connection, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 119, CFSTR("Proxy provider invalidated"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKProxyProvider _lock_flushContinuationsWithConnection:error:](self, "_lock_flushContinuationsWithConnection:error:", 0, v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_serviceIdentifier);
}

- (id)debugIdentifier
{
  return self->_serviceIdentifier;
}

- (void)referenceSourceWeakly
{
  HKProxyProviderSource *source;
  HKProxyProviderSource **p_weakSource;
  HKProxyProviderSource *v5;
  HKProxyProviderSource *v6;

  source = self->_source;
  if (source)
  {
    p_weakSource = &self->_weakSource;
    v6 = source;
    objc_storeWeak((id *)p_weakSource, v6);
    v5 = self->_source;
    self->_source = 0;

  }
}

- (id)_lock_sourceWithError:(id *)a3
{
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HKProxyProviderSource *source;
  HKProxyProviderSource *WeakRetained;
  void *v16;
  objc_class *v17;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_invalidated)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = objc_opt_class();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v7, a2, CFSTR("%@ for %@ invalidated"), v9, self->_serviceIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    source = self->_source;
    if (source)
    {
      WeakRetained = source;
      return WeakRetained;
    }
    WeakRetained = (HKProxyProviderSource *)objc_loadWeakRetained((id *)&self->_weakSource);
    if (WeakRetained)
      return WeakRetained;
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "hk_error:format:", 100, CFSTR("%@ source became nil for %@"), v9, self->_serviceIdentifier);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  v12 = v11;
  if (v11)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v11);
    else
      _HKLogDroppedError(v11);
  }

  WeakRetained = 0;
  return WeakRetained;
}

- (void)_handleError:(id)a3 connectionGeneration:(int64_t)a4
{
  if (objc_msgSend(a3, "hk_isXPCConnectionError"))
    -[HKProxyProvider _resetConnectionWithGeneration:](self, "_resetConnectionWithGeneration:", a4);
}

- (void)_resetConnectionWithGeneration:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  _HKXPCConnection *connection;
  _HKXPCConnection *v7;
  NSObject *clientQueue;
  _QWORD block[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated && self->_connectionGeneration == a3)
  {
    connection = self->_connection;
    if (connection)
    {
      self->_connectionGeneration = a3 + 1;
      -[_HKXPCConnection invalidate](connection, "invalidate");
      v7 = self->_connection;
      self->_connection = 0;

      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__HKProxyProvider__resetConnectionWithGeneration___block_invoke;
      block[3] = &unk_1E37E6770;
      block[4] = self;
      dispatch_async(clientQueue, block);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

void __50__HKProxyProvider__resetConnectionWithGeneration___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v4, "connectionInterrupted");

  }
}

- (id)_fetchConnectionAndGeneration:(int64_t *)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  _HKXPCConnection *connection;
  _HKXPCConnection *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  id v17;
  void *v18;
  _HKXPCConnection *v19;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (connection)
  {
    v10 = connection;
    *a3 = self->_connectionGeneration;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[HKProxyProvider _lock_sourceWithError:](self, "_lock_sourceWithError:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    if (v11)
    {
      -[HKProxyProvider proxyServiceEndpointFromSource:serviceIdentifier:error:](self, "proxyServiceEndpointFromSource:serviceIdentifier:error:", v11, self->_serviceIdentifier, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        os_unfair_lock_lock(p_lock);
        if (self->_invalidated)
        {
          v13 = (void *)MEMORY[0x1E0CB35C8];
          v14 = objc_opt_class();
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), v14, a2, CFSTR("%@ for %@ invalidated"), v16, self->_serviceIdentifier);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            if (a4)
              *a4 = objc_retainAutorelease(v17);
            else
              _HKLogDroppedError(v17);
          }

          v10 = 0;
        }
        else
        {
          v19 = self->_connection;
          if (!v19)
          {
            -[HKProxyProvider _lock_setUpConnectionWithEndpoint:](self, "_lock_setUpConnectionWithEndpoint:", v12);
            v19 = self->_connection;
          }
          v10 = v19;
          *a3 = self->_connectionGeneration;
        }
        os_unfair_lock_unlock(p_lock);
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void)_fetchEndpointAndConnectionWithContinuation:(id)a3
{
  void (**v4)(id, _HKXPCConnection *, int64_t, _QWORD);
  os_unfair_lock_s *p_lock;
  _HKXPCConnection *connection;
  NSMutableArray *pendingFetchContinuations;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSString *serviceIdentifier;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;

  v4 = (void (**)(id, _HKXPCConnection *, int64_t, _QWORD))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (connection)
  {
    v4[2](v4, connection, self->_connectionGeneration, 0);
LABEL_5:
    os_unfair_lock_unlock(p_lock);
    goto LABEL_6;
  }
  pendingFetchContinuations = self->_pendingFetchContinuations;
  if (pendingFetchContinuations)
  {
    v8 = (void *)objc_msgSend(v4, "copy");
    v9 = _Block_copy(v8);
    -[NSMutableArray addObject:](pendingFetchContinuations, "addObject:", v9);

    goto LABEL_5;
  }
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = self->_pendingFetchContinuations;
  self->_pendingFetchContinuations = v10;

  v12 = self->_pendingFetchContinuations;
  v13 = (void *)objc_msgSend(v4, "copy");
  v14 = _Block_copy(v13);
  -[NSMutableArray addObject:](v12, "addObject:", v14);

  v20 = 0;
  -[HKProxyProvider _lock_sourceWithError:](self, "_lock_sourceWithError:", &v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v20;
  if (v15)
  {
    os_unfair_lock_unlock(&self->_lock);
    serviceIdentifier = self->_serviceIdentifier;
    v18[4] = self;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __63__HKProxyProvider__fetchEndpointAndConnectionWithContinuation___block_invoke;
    v19[3] = &unk_1E37E9E98;
    v19[4] = self;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__HKProxyProvider__fetchEndpointAndConnectionWithContinuation___block_invoke_2;
    v18[3] = &unk_1E37E6A70;
    -[HKProxyProvider fetchProxyServiceEndpointFromSource:serviceIdentifier:endpointHandler:errorHandler:](self, "fetchProxyServiceEndpointFromSource:serviceIdentifier:endpointHandler:errorHandler:", v15, serviceIdentifier, v19, v18);
  }
  else
  {
    -[HKProxyProvider _lock_flushContinuationsWithConnection:error:](self, "_lock_flushContinuationsWithConnection:error:", 0, v16);
    os_unfair_lock_unlock(&self->_lock);
  }

LABEL_6:
}

void __63__HKProxyProvider__fetchEndpointAndConnectionWithContinuation___block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 32), "_lock_setUpConnectionWithEndpoint:", v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
}

void __63__HKProxyProvider__fetchEndpointAndConnectionWithContinuation___block_invoke_2(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 80);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(a1 + 32), "_lock_flushContinuationsWithConnection:error:", 0, v4);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)_lock_setUpConnectionWithEndpoint:(id)a3
{
  id v4;
  id WeakRetained;
  _HKXPCConnection *v6;
  _HKXPCConnection *connection;
  _HKXPCConnection *v8;
  void *v9;
  void *connectionGeneration;
  _HKXPCConnection *v11;
  uint64_t v12;
  _HKXPCConnection *v13;
  void *v14;
  _QWORD v15[4];
  id v16[2];
  _QWORD v17[4];
  id v18[2];
  id location;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_connection)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_exportedObject);
    if (WeakRetained)
    {
      v6 = -[_HKXPCConnection initWithListenerEndpoint:]([_HKXPCConnection alloc], "initWithListenerEndpoint:", v4);
      connection = self->_connection;
      self->_connection = v6;

      v8 = self->_connection;
      -[HKProxyProvider debugIdentifier](self, "debugIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKXPCConnection setDebugIdentifier:](v8, "setDebugIdentifier:", v9);

      objc_initWeak(&location, self);
      connectionGeneration = (void *)self->_connectionGeneration;
      v11 = self->_connection;
      v12 = MEMORY[0x1E0C809B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __53__HKProxyProvider__lock_setUpConnectionWithEndpoint___block_invoke;
      v17[3] = &unk_1E37E9EC0;
      objc_copyWeak(v18, &location);
      v18[1] = connectionGeneration;
      -[_HKXPCConnection setInterruptionHandler:](v11, "setInterruptionHandler:", v17);
      v13 = self->_connection;
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __53__HKProxyProvider__lock_setUpConnectionWithEndpoint___block_invoke_2;
      v15[3] = &unk_1E37E9EC0;
      objc_copyWeak(v16, &location);
      v16[1] = connectionGeneration;
      -[_HKXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", v15);
      -[_HKXPCConnection setExportedObject:](self->_connection, "setExportedObject:", WeakRetained);
      -[_HKXPCConnection resumeWithExportedInterface:remoteInterface:](self->_connection, "resumeWithExportedInterface:remoteInterface:", self->_exportedInterface, self->_remoteInterface);
      -[HKProxyProvider _lock_flushContinuationsWithConnection:error:](self, "_lock_flushContinuationsWithConnection:error:", self->_connection, 0);
      objc_destroyWeak(v16);
      objc_destroyWeak(v18);
      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("exportedObject became nil for %@"), self->_serviceIdentifier);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKProxyProvider _lock_flushContinuationsWithConnection:error:](self, "_lock_flushContinuationsWithConnection:error:", 0, v14);

    }
  }

}

void __53__HKProxyProvider__lock_setUpConnectionWithEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetConnectionWithGeneration:", *(_QWORD *)(a1 + 40));

}

void __53__HKProxyProvider__lock_setUpConnectionWithEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetConnectionWithGeneration:", *(_QWORD *)(a1 + 40));

}

- (void)_lock_flushContinuationsWithConnection:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *pendingFetchContinuations;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_pendingFetchContinuations;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  pendingFetchContinuations = self->_pendingFetchContinuations;
  self->_pendingFetchContinuations = 0;

}

- (void)_fetchRetryingProxyWithErrorCount:(int64_t)a3 handler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;
  _QWORD block[5];

  v8 = a4;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  if (_fetchRetryingProxyWithErrorCount_handler_errorHandler__onceToken != -1)
    dispatch_once(&_fetchRetryingProxyWithErrorCount_handler_errorHandler__onceToken, block);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke_2;
  v13[3] = &unk_1E37E9F10;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  -[HKProxyProvider _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v12, v13);

}

void __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)objc_opt_class();
  HKCreateSerialDispatchQueue(v0, CFSTR("retry"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_fetchRetryingProxyWithErrorCount_handler_errorHandler__retryQueue;
  _fetchRetryingProxyWithErrorCount_handler_errorHandler__retryQueue = v1;

}

void __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  long double v5;
  dispatch_time_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  if (objc_msgSend(v3, "hk_isXPCConnectionError") && (v4 = *(_QWORD *)(a1 + 56), v4 <= 3))
  {
    v5 = pow(1.5, (double)v4);
    v6 = dispatch_time(0, (uint64_t)(v5 * 0.25 * 1000000000.0));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[2] = __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke_3;
    v10[3] = &unk_1E37E9EE8;
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v13 = v7;
    v9 = _fetchRetryingProxyWithErrorCount_handler_errorHandler__retryQueue;
    v10[1] = 3221225472;
    v11 = v8;
    v12 = *(id *)(a1 + 48);
    dispatch_after(v6, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __74__HKProxyProvider__fetchRetryingProxyWithErrorCount_handler_errorHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchRetryingProxyWithErrorCount:handler:errorHandler:", *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  if (-[HKProxyProvider shouldRetryOnInterruption](self, "shouldRetryOnInterruption"))
    -[HKProxyProvider _fetchRetryingProxyWithErrorCount:handler:errorHandler:](self, "_fetchRetryingProxyWithErrorCount:handler:errorHandler:", 0, v7, v6);
  else
    -[HKProxyProvider _fetchProxyWithHandler:errorHandler:](self, "_fetchProxyWithHandler:errorHandler:", v7, v6);

}

- (void)_fetchProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;
  OS_dispatch_queue *v8;
  id v9;
  OS_dispatch_queue *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, void *);
  void *v16;
  HKProxyProvider *v17;
  OS_dispatch_queue *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = self->_clientQueue;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke;
  v16 = &unk_1E37E9F60;
  v17 = self;
  v18 = v8;
  v19 = v7;
  v20 = v6;
  v9 = v6;
  v10 = v8;
  v11 = v7;
  v12 = _Block_copy(&v13);
  -[HKProxyProvider _fetchEndpointAndConnectionWithContinuation:](self, "_fetchEndpointAndConnectionWithContinuation:", v12, v13, v14, v15, v16, v17);

}

void __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  _QWORD aBlock[5];
  id v23;
  uint64_t v24;

  v7 = a2;
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_2;
  aBlock[3] = &unk_1E37E9F38;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v24 = a3;
  v23 = *(id *)(a1 + 48);
  v10 = _Block_copy(aBlock);
  if (v7)
  {
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(NSObject **)(a1 + 40);
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_3;
    block[3] = &unk_1E37E6D40;
    v13 = *(id *)(a1 + 56);
    v20 = v11;
    v21 = v13;
    v14 = v11;
    dispatch_async(v12, block);

  }
  else
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to fetch proxy connection."));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = *(NSObject **)(a1 + 40);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_4;
    v16[3] = &unk_1E37E6D40;
    v18 = v10;
    v8 = v8;
    v17 = v8;
    dispatch_async(v15, v16);

    v14 = v18;
  }

}

void __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "_handleError:connectionGeneration:", v5, v4);
  (*(void (**)(void))(a1[5] + 16))();

}

uint64_t __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __55__HKProxyProvider__fetchProxyWithHandler_errorHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getSynchronousProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  if (-[HKProxyProvider shouldRetryOnInterruption](self, "shouldRetryOnInterruption"))
    -[HKProxyProvider _getSynchronousProxyWithErrorCount:handler:errorHandler:](self, "_getSynchronousProxyWithErrorCount:handler:errorHandler:", 0, v7, v6);
  else
    -[HKProxyProvider _getSynchronousProxyWithHandler:errorHandler:](self, "_getSynchronousProxyWithHandler:errorHandler:", v7, v6);

}

- (void)_getSynchronousProxyWithErrorCount:(int64_t)a3 handler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__HKProxyProvider__getSynchronousProxyWithErrorCount_handler_errorHandler___block_invoke;
  v12[3] = &unk_1E37E9F10;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a3;
  v10 = v9;
  v11 = v8;
  -[HKProxyProvider _getSynchronousProxyWithHandler:errorHandler:](self, "_getSynchronousProxyWithHandler:errorHandler:", v11, v12);

}

void __75__HKProxyProvider__getSynchronousProxyWithErrorCount_handler_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "hk_isXPCConnectionError") && (v3 = *(_QWORD *)(a1 + 56), v3 <= 3))
    objc_msgSend(*(id *)(a1 + 32), "_getSynchronousProxyWithErrorCount:handler:errorHandler:", v3 + 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_getSynchronousProxyWithHandler:(id)a3 errorHandler:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;

  v6 = (void (**)(id, void *))a3;
  v7 = a4;
  v17 = 0;
  v16 = 0;
  -[HKProxyProvider _fetchConnectionAndGeneration:error:](self, "_fetchConnectionAndGeneration:error:", &v17, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  v10 = v9;
  if (v8)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__HKProxyProvider__getSynchronousProxyWithHandler_errorHandler___block_invoke;
    v13[3] = &unk_1E37E9F38;
    v13[4] = self;
    v15 = v17;
    v14 = v7;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11);

  }
  else if (v9)
  {
    (*((void (**)(id, id))v7 + 2))(v7, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to fetch proxy connection."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);

  }
}

void __64__HKProxyProvider__getSynchronousProxyWithHandler_errorHandler___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a1[6];
  v5 = a2;
  objc_msgSend(v3, "_handleError:connectionGeneration:", v5, v4);
  (*(void (**)(void))(a1[5] + 16))();

}

- (void)setAutomaticProxyReconnectionHandler:(id)a3
{
  id v4;
  id lock_automaticProxyReconnectionHandler;
  const char *v6;
  NSObject *v7;
  int notifyToken;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  lock_automaticProxyReconnectionHandler = self->_lock_automaticProxyReconnectionHandler;
  if (v4)
  {
    if (!lock_automaticProxyReconnectionHandler && self->_daemonLaunchNotificationName)
    {
      objc_initWeak(&location, self);
      v6 = -[NSString UTF8String](self->_daemonLaunchNotificationName, "UTF8String");
      objc_msgSend((id)objc_opt_class(), "_relaunchQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __56__HKProxyProvider_setAutomaticProxyReconnectionHandler___block_invoke;
      v14 = &unk_1E37E9F88;
      objc_copyWeak(&v15, &location);
      notify_register_dispatch(v6, &self->_notifyToken, v7, &v11);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  else if (lock_automaticProxyReconnectionHandler)
  {
    notifyToken = self->_notifyToken;
    if (notifyToken != -1)
    {
      notify_cancel(notifyToken);
      self->_notifyToken = -1;
    }
  }
  v9 = (void *)objc_msgSend(v4, "copy", v11, v12, v13, v14);
  v10 = self->_lock_automaticProxyReconnectionHandler;
  self->_lock_automaticProxyReconnectionHandler = v9;

  os_unfair_lock_unlock(&self->_lock);
}

void __56__HKProxyProvider_setAutomaticProxyReconnectionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_serverDidFinishLaunching");

}

- (id)automaticProxyReconnectionHandler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = _Block_copy(self->_lock_automaticProxyReconnectionHandler);
  os_unfair_lock_unlock(p_lock);
  v5 = _Block_copy(v4);

  return v5;
}

- (void)_serverDidFinishLaunching
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD aBlock[5];
  id v10;

  -[HKProxyProvider automaticProxyReconnectionHandler](self, "automaticProxyReconnectionHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__HKProxyProvider__serverDidFinishLaunching__block_invoke;
    aBlock[3] = &unk_1E37E9FB0;
    aBlock[4] = self;
    v10 = v3;
    v6 = _Block_copy(aBlock);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __44__HKProxyProvider__serverDidFinishLaunching__block_invoke_34;
    v8[3] = &unk_1E37E6A70;
    v8[4] = self;
    v7 = _Block_copy(v8);
    if (-[HKProxyProvider shouldRetryOnInterruption](self, "shouldRetryOnInterruption"))
      -[HKProxyProvider _getSynchronousProxyWithErrorCount:handler:errorHandler:](self, "_getSynchronousProxyWithErrorCount:handler:errorHandler:", 0, v6, v7);
    else
      -[HKProxyProvider _getSynchronousProxyWithHandler:errorHandler:](self, "_getSynchronousProxyWithHandler:errorHandler:", v6, v7);

  }
}

void __44__HKProxyProvider__serverDidFinishLaunching__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "%{public}@: Fetched proxy after detecting server relaunch.", (uint8_t *)&v8, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __44__HKProxyProvider__serverDidFinishLaunching__block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44__HKProxyProvider__serverDidFinishLaunching__block_invoke_34_cold_1(a1, (uint64_t)v3, v4);

}

- (id)clientQueueErrorHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  -[HKProxyProvider exportedObject](self, "exportedObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HKProxyProvider_clientQueueErrorHandlerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37EA000;
  aBlock[4] = self;
  v9 = v4;
  v10 = v11;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);
  return v6;
}

void __57__HKProxyProvider_clientQueueErrorHandlerWithCompletion___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[5];
  v5 = *(NSObject **)(a1[4] + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HKProxyProvider_clientQueueErrorHandlerWithCompletion___block_invoke_2;
  block[3] = &unk_1E37E9FD8;
  v8 = v3;
  v9 = v4;
  v10 = a1[6];
  v6 = v3;
  dispatch_async(v5, block);

}

void __57__HKProxyProvider_clientQueueErrorHandlerWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[4]);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)clientQueueActionHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  -[HKProxyProvider exportedObject](self, "exportedObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HKProxyProvider_clientQueueActionHandlerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37EA050;
  aBlock[4] = self;
  v9 = v4;
  v10 = v11;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);
  return v6;
}

void __58__HKProxyProvider_clientQueueActionHandlerWithCompletion___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v5 = a3;
  v6 = (void *)a1[5];
  v7 = *(NSObject **)(a1[4] + 104);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HKProxyProvider_clientQueueActionHandlerWithCompletion___block_invoke_2;
  v9[3] = &unk_1E37EA028;
  v13 = a2;
  v10 = v5;
  v11 = v6;
  v12 = a1[6];
  v8 = v5;
  dispatch_async(v7, v9);

}

void __58__HKProxyProvider_clientQueueActionHandlerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)clientQueueObjectHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  -[HKProxyProvider exportedObject](self, "exportedObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__HKProxyProvider_clientQueueObjectHandlerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37EA0A0;
  aBlock[4] = self;
  v9 = v4;
  v10 = v11;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);
  return v6;
}

void __58__HKProxyProvider_clientQueueObjectHandlerWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  v7 = (void *)a1[5];
  v8 = *(NSObject **)(a1[4] + 104);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__HKProxyProvider_clientQueueObjectHandlerWithCompletion___block_invoke_2;
  v13[3] = &unk_1E37EA078;
  v9 = v7;
  v14 = v5;
  v15 = v6;
  v10 = a1[6];
  v16 = v9;
  v17 = v10;
  v11 = v6;
  v12 = v5;
  dispatch_async(v8, v13);

}

void __58__HKProxyProvider_clientQueueObjectHandlerWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5]);
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)clientQueueDoubleObjectHandlerWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  -[HKProxyProvider exportedObject](self, "exportedObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__HKProxyProvider_clientQueueDoubleObjectHandlerWithCompletion___block_invoke;
  aBlock[3] = &unk_1E37EA0F0;
  aBlock[4] = self;
  v9 = v4;
  v10 = v11;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);
  return v6;
}

void __64__HKProxyProvider_clientQueueDoubleObjectHandlerWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (void *)a1[5];
  v11 = *(NSObject **)(a1[4] + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__HKProxyProvider_clientQueueDoubleObjectHandlerWithCompletion___block_invoke_2;
  block[3] = &unk_1E37EA0C8;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v20 = a1[6];
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v11, block);

}

void __64__HKProxyProvider_clientQueueDoubleObjectHandlerWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[7];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5], a1[6]);
  v3 = *(_QWORD *)(a1[8] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)clientQueueProgressHandlerWithHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD aBlock[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__5;
  v11[4] = __Block_byref_object_dispose__5;
  -[HKProxyProvider exportedObject](self, "exportedObject");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__HKProxyProvider_clientQueueProgressHandlerWithHandler___block_invoke;
  aBlock[3] = &unk_1E37EA118;
  aBlock[4] = self;
  v9 = v4;
  v10 = v11;
  v5 = v4;
  v6 = _Block_copy(aBlock);

  _Block_object_dispose(v11, 8);
  return v6;
}

void __57__HKProxyProvider_clientQueueProgressHandlerWithHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = (void *)a1[5];
  v5 = *(NSObject **)(a1[4] + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__HKProxyProvider_clientQueueProgressHandlerWithHandler___block_invoke_2;
  block[3] = &unk_1E37E9FD8;
  v8 = v3;
  v9 = v4;
  v10 = a1[6];
  v6 = v3;
  dispatch_async(v5, block);

}

void __57__HKProxyProvider_clientQueueProgressHandlerWithHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[5];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, a1[4]);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (_HKXPCExportable)exportedObject
{
  return (_HKXPCExportable *)objc_loadWeakRetained((id *)&self->_exportedObject);
}

- (BOOL)shouldRetryOnInterruption
{
  return self->_shouldRetryOnInterruption;
}

- (void)setShouldRetryOnInterruption:(BOOL)a3
{
  self->_shouldRetryOnInterruption = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_exportedObject);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_pendingFetchContinuations, 0);
  objc_storeStrong(&self->_lock_automaticProxyReconnectionHandler, 0);
  objc_storeStrong((id *)&self->_remoteInterface, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_daemonLaunchNotificationName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_weakSource);
  objc_storeStrong((id *)&self->_source, 0);
}

- (id)proxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 error:(id *)a5
{
  OUTLINED_FUNCTION_1_2();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)fetchProxyServiceEndpointFromSource:(id)a3 serviceIdentifier:(id)a4 endpointHandler:(id)a5 errorHandler:(id)a6
{
  OUTLINED_FUNCTION_1_2();
  NSRequestConcreteImplementation();
}

- (void)initWithSource:(uint64_t)a1 serviceIdentifier:(NSObject *)a2 exportedObject:exportedInterface:remoteInterface:.cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_fault_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_FAULT, "%{public}@: source unexpectedly nil", (uint8_t *)&v4, 0xCu);

}

void __44__HKProxyProvider__serverDidFinishLaunching__block_invoke_34_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_19A0E6000, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch proxy after detecting server relaunch: %{public}@", (uint8_t *)&v4, 0x16u);
}

@end
