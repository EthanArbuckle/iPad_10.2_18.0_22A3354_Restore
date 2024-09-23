@implementation DNDSRemoteServiceProvider

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  BSServiceConnectionListener *v8;
  id v9;
  id v10;
  id *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;
  id location;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = (BSServiceConnectionListener *)a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  if (self->_requestListener == v8)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke;
    v16[3] = &unk_1E86A5EA8;
    v16[4] = self;
    v11 = &v17;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v9, "configureConnection:", v16);
  }
  else
  {
    if (self->_monitorListener != v8)
    {
      objc_msgSend(v9, "invalidate");
      goto LABEL_11;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_4;
    v14[3] = &unk_1E86A5EA8;
    v14[4] = self;
    v11 = &v15;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v9, "configureConnection:", v14);
  }
  objc_destroyWeak(v11);
  if (objc_msgSend(v9, "dnds_hasAnyValidEntitlement"))
  {
    -[DNDSRemoteServiceProvider _addConnection:](self, "_addConnection:", v9);
    objc_msgSend(v9, "activate");
    v12 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v9;
      _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "XPC connection successfully accepted: connection=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v9, "invalidate");
    v13 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider listener:didReceiveConnection:withContext:].cold.1((uint64_t)v9, v13);
  }
LABEL_11:
  objc_destroyWeak(&location);

}

- (void)_addConnection:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[NSMutableSet addObject:](self->_connections, "addObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)queryStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasStateRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider _queryStateWithCompletionHandler:](self, "_queryStateWithCompletionHandler:", v8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider queryStateWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)registerForStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasStateUpdatesEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider _registerOrMutateConnectionDetailsForClientConnection:handler:](self, "_registerOrMutateConnectionDetailsForClientConnection:handler:", v13, &__block_literal_global_35);
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AAB0], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider registerForStateUpdatesWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)_registerOrMutateConnectionDetailsForClientConnection:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, DNDSClientConnectionDetails *);
  NSMapTable *v8;
  DNDSClientConnectionDetails *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, DNDSClientConnectionDetails *))a4;
  v8 = self->_clientConnectionDetailsByConnection;
  objc_sync_enter(v8);
  -[NSMapTable objectForKey:](self->_clientConnectionDetailsByConnection, "objectForKey:", v6);
  v9 = (DNDSClientConnectionDetails *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v10 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v6;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Registering new connection details for connection: connection=%{public}@", (uint8_t *)&v13, 0xCu);
    }
    v9 = objc_alloc_init(DNDSClientConnectionDetails);
  }
  v7[2](v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[DNDSClientConnectionDetails isEqual:](v9, "isEqual:", v11) & 1) == 0)
  {
    v12 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543618;
      v14 = v6;
      v15 = 2114;
      v16 = v11;
      _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "Updating connection details for connection: connection=%{public}@, updatedConnectionDetails=%{public}@", (uint8_t *)&v13, 0x16u);
    }
    -[NSMapTable setObject:forKey:](self->_clientConnectionDetailsByConnection, "setObject:forKey:", v11, v6);
  }

  objc_sync_exit(v8);
}

id __89__DNDSRemoteServiceProvider_registerForStateUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "setWantsStateUpdates:", 1);
  return v2;
}

- (void)_queryStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void (**)(id, void *, id))a3;
  -[DNDSRemoteServiceProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "remoteServiceProvider:currentStateWithError:", self, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (DNDSRemoteServiceProviderDelegate)delegate
{
  return (DNDSRemoteServiceProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  DNDRemoteMonitorServerInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_5;
  v9[3] = &unk_1E86A5E80;
  a1 += 40;
  objc_copyWeak(&v10, (id *)a1);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_6;
  v7[3] = &unk_1E86A5E80;
  objc_copyWeak(&v8, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  DNDRemoteServiceServerInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E86A5E80;
  a1 += 40;
  objc_copyWeak(&v10, (id *)a1);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3;
  v7[3] = &unk_1E86A5E80;
  objc_copyWeak(&v8, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

}

- (DNDSRemoteServiceProvider)initWithClientDetailsProvider:(id)a3
{
  id v5;
  DNDSRemoteServiceProvider *v6;
  DNDSRemoteServiceProvider *v7;
  NSMutableSet *v8;
  NSMutableSet *connections;
  void *v10;
  uint64_t v11;
  DNDSRemoteServiceProvider *v12;
  uint64_t v13;
  BSServiceConnectionListener *requestListener;
  void *v15;
  DNDSRemoteServiceProvider *v16;
  uint64_t v17;
  BSServiceConnectionListener *monitorListener;
  uint64_t v19;
  NSMapTable *clientConnectionDetailsByConnection;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *clientNotificationQueue;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  DNDSRemoteServiceProvider *v29;
  _QWORD v30[4];
  DNDSRemoteServiceProvider *v31;
  objc_super v32;

  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)DNDSRemoteServiceProvider;
  v6 = -[DNDSRemoteServiceProvider init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connections = v7->_connections;
    v7->_connections = v8;

    v10 = (void *)MEMORY[0x1E0D03460];
    v11 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __59__DNDSRemoteServiceProvider_initWithClientDetailsProvider___block_invoke;
    v30[3] = &unk_1E86A5E58;
    v12 = v7;
    v31 = v12;
    objc_msgSend(v10, "listenerWithConfigurator:", v30);
    v13 = objc_claimAutoreleasedReturnValue();
    requestListener = v12->_requestListener;
    v12->_requestListener = (BSServiceConnectionListener *)v13;

    v15 = (void *)MEMORY[0x1E0D03460];
    v25 = v11;
    v26 = 3221225472;
    v27 = __59__DNDSRemoteServiceProvider_initWithClientDetailsProvider___block_invoke_2;
    v28 = &unk_1E86A5E58;
    v16 = v12;
    v29 = v16;
    objc_msgSend(v15, "listenerWithConfigurator:", &v25);
    v17 = objc_claimAutoreleasedReturnValue();
    monitorListener = v16->_monitorListener;
    v16->_monitorListener = (BSServiceConnectionListener *)v17;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable", v25, v26, v27, v28);
    v19 = objc_claimAutoreleasedReturnValue();
    clientConnectionDetailsByConnection = v16->_clientConnectionDetailsByConnection;
    v16->_clientConnectionDetailsByConnection = (NSMapTable *)v19;

    objc_storeStrong((id *)&v16->_clientDetailsProvider, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.donotdisturbd.remoteserviceprovider", v21);
    clientNotificationQueue = v16->_clientNotificationQueue;
    v16->_clientNotificationQueue = (OS_dispatch_queue *)v22;

  }
  return v7;
}

void __59__DNDSRemoteServiceProvider_initWithClientDetailsProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setDomain:", CFSTR("com.apple.donotdisturb.service.launching"));
  DNDRemoteServiceServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
}

void __59__DNDSRemoteServiceProvider_initWithClientDetailsProvider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setDomain:", CFSTR("com.apple.donotdisturb.service.non-launching"));
  DNDRemoteMonitorServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  -[DNDSRemoteServiceProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DNDSRemoteServiceProvider;
  -[DNDSRemoteServiceProvider dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  id v3;
  id v4;

  -[BSServiceConnectionListener activate](self->_monitorListener, "activate");
  -[BSServiceConnectionListener activate](self->_requestListener, "activate");
  v3 = (id)objc_msgSend(MEMORY[0x1E0D03488], "activateManualDomain:", CFSTR("com.apple.donotdisturb.service.launching"));
  v4 = (id)objc_msgSend(MEMORY[0x1E0D03488], "activateManualDomain:", CFSTR("com.apple.donotdisturb.service.non-launching"));
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_monitorListener, "invalidate");
  -[BSServiceConnectionListener invalidate](self->_requestListener, "invalidate");
}

- (void)handleStateUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  DNDSRemoteServiceProvider *v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Did receive state update, will handle; stateUpdate=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__DNDSRemoteServiceProvider_handleStateUpdate___block_invoke;
  v7[3] = &unk_1E86A81E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[DNDSRemoteServiceProvider _iterateClientConnectionsToSendWithHandler:](self, "_iterateClientConnectionsToSendWithHandler:", v7);

}

void __47__DNDSRemoteServiceProvider_handleStateUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id obj;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint8_t v40[128];
  uint8_t buf[4];
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v33 = a3;
  if (objc_msgSend(v5, "wantsStateUpdates"))
  {
    v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v33, "remoteProcess");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "pid");
      v10 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 67109634;
      v42 = v9;
      v43 = 2114;
      v44 = v10;
      v45 = 2114;
      v46 = v33;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Delivering state update: pid=%d, stateUpdate=%{public}@, connection=%{public}@", buf, 0x1Cu);

    }
    objc_msgSend(v33, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deliverStateUpdate:", *(_QWORD *)(a1 + 32));

  }
  if (objc_msgSend(v5, "wantsActiveModeUpdates"))
  {
    v12 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v33, "remoteProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "pid");
      objc_msgSend(*(id *)(a1 + 32), "state");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activeModeIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109634;
      v42 = v15;
      v43 = 2114;
      v44 = v17;
      v45 = 2114;
      v46 = v33;
      _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Delivering active mode update: pid=%d, activeModeIdentifier=%{public}@, connection=%{public}@", buf, 0x1Cu);

    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v5, "activeAssertionUpdateClientIdentifiers");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v18)
    {
      v19 = v18;
      v31 = v5;
      v20 = 0;
      v21 = *(_QWORD *)v36;
      do
      {
        v22 = 0;
        v23 = v20;
        do
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(obj);
          v24 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v22);
          objc_msgSend(*(id *)(a1 + 40), "delegate", v31);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *(_QWORD *)(a1 + 40);
          v34 = v23;
          objc_msgSend(v25, "remoteServiceProvider:activeAssertionWithClientIdentifer:error:", v26, v24, &v34);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v34;

          objc_msgSend(v33, "remoteTarget");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = *(_QWORD *)(a1 + 32);
          v39 = v24;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "deliverActiveModeAssertion:stateUpdate:clientIdentifiers:", v27, v29, v30);

          ++v22;
          v23 = v20;
        }
        while (v19 != v22);
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v19);

      v5 = v31;
    }

  }
}

- (void)handleModeAssertionUpdateResult:(id)a3
{
  id v4;
  NSObject *clientNotificationQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  DNDSRemoteServiceProvider *v9;

  v4 = a3;
  clientNotificationQueue = self->_clientNotificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke;
  v7[3] = &unk_1E86A59E8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(clientNotificationQueue, v7);

}

void __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  void *obj;
  _QWORD v42[4];
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  void *v52;
  _QWORD v53[5];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v2 = (void *)DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "assertions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    objc_msgSend(*(id *)(a1 + 32), "invalidations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    v62 = v6;
    v63 = 2048;
    v64 = v8;
    v65 = 2114;
    v66 = v9;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Did receive update result with %lu assertion(s) & %lu invalidation(s), will handle; updateResult=%{public}@",
      buf,
      0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "assertions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "invalidations");
  obj = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v56;
    *(_QWORD *)&v13 = 138412290;
    v40 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v56 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v18 = DNDSLogServiceProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v40;
          v62 = (uint64_t)v17;
          _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Handling invalidation: %@", buf, 0xCu);
        }
        objc_msgSend(v17, "assertion", v40);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "source");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "clientIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "clientDetailsForIdentifier:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_18;
        v53[3] = &unk_1E86A6EB0;
        v53[4] = *(_QWORD *)(a1 + 40);
        v23 = v22;
        v54 = v23;
        objc_msgSend(v11, "bs_firstObjectPassingTest:", v53);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(v11, "removeObject:", v24);
        v25 = *(void **)(a1 + 40);
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_2;
        v49[3] = &unk_1E86A8238;
        v50 = v23;
        v51 = v24;
        v52 = v17;
        v26 = v24;
        v27 = v23;
        objc_msgSend(v25, "_iterateClientConnectionsToSendWithHandler:", v49);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v14);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v28 = v11;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v46 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
        v34 = DNDSLogServiceProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v62 = (uint64_t)v33;
          _os_log_impl(&dword_1CB895000, v34, OS_LOG_TYPE_DEFAULT, "Handling assertion: %@", buf, 0xCu);
        }
        objc_msgSend(v33, "source");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "clientIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "clientDetailsForIdentifier:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(a1 + 40);
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_21;
        v42[3] = &unk_1E86A81E8;
        v43 = v37;
        v44 = v33;
        v39 = v37;
        objc_msgSend(v38, "_iterateClientConnectionsToSendWithHandler:", v42);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    }
    while (v30);
  }

}

uint64_t __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_18(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(a2, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDetailsForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(*(id *)(a1 + 40), "isEqual:", v6);
  return v7;
}

void __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_3;
  v14[3] = &unk_1E86A8210;
  v8 = v5;
  v15 = v8;
  objc_msgSend(v7, "bs_filter:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v17 = v11;
      v18 = 2114;
      v19 = v12;
      v20 = 2114;
      v21 = v6;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Delivering assertion update with invalidation: assertion=%{public}@, invalidation=%{public}@, connection=%{public}@", buf, 0x20u);
    }
    objc_msgSend(v6, "remoteTarget");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deliverActiveModeAssertionUpdate:invalidation:clientIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v9);

  }
}

uint64_t __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "assertionUpdateClientIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

void __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_2_22;
  v13[3] = &unk_1E86A8210;
  v8 = v5;
  v14 = v8;
  objc_msgSend(v7, "bs_filter:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v10 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2114;
      v18 = v6;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Delivering assertion update: assertion=%{public}@, connection=%{public}@", buf, 0x16u);
    }
    objc_msgSend(v6, "remoteTarget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deliverActiveModeAssertionUpdate:invalidation:clientIdentifiers:", *(_QWORD *)(a1 + 40), 0, v9);

  }
}

uint64_t __61__DNDSRemoteServiceProvider_handleModeAssertionUpdateResult___block_invoke_2_22(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "assertionUpdateClientIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

- (void)handleUpdatedBehaviorSettings:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Did receive updated behavior settings, will handle; settings=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__DNDSRemoteServiceProvider_handleUpdatedBehaviorSettings___block_invoke;
  v7[3] = &unk_1E86A8260;
  v8 = v4;
  v6 = v4;
  -[DNDSRemoteServiceProvider _iterateClientConnectionsToSendWithHandler:](self, "_iterateClientConnectionsToSendWithHandler:", v7);

}

void __59__DNDSRemoteServiceProvider_handleUpdatedBehaviorSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a2, "wantsSettingsUpdates"))
  {
    v6 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Delivering settings update: settings=%{public}@, connection=%{public}@", (uint8_t *)&v9, 0x16u);
    }
    objc_msgSend(v5, "remoteTarget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deliverUpdatedBehaviorSettings:", *(_QWORD *)(a1 + 32));

  }
}

- (void)handleUpdatedPhoneCallBypassSettings:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Did receive updated phone call bypass settings, will handle; settings=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__DNDSRemoteServiceProvider_handleUpdatedPhoneCallBypassSettings___block_invoke;
  v7[3] = &unk_1E86A8260;
  v8 = v4;
  v6 = v4;
  -[DNDSRemoteServiceProvider _iterateClientConnectionsToSendWithHandler:](self, "_iterateClientConnectionsToSendWithHandler:", v7);

}

void __66__DNDSRemoteServiceProvider_handleUpdatedPhoneCallBypassSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "wantsGlobalConfigurationUpdates") & 1) != 0
    || objc_msgSend(v5, "wantsSettingsUpdates"))
  {
    v7 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Delivering bypass update: settings=%{public}@, connection=%{public}@", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend(v6, "remoteTarget");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deliverUpdatedPhoneCallBypassSettings:", *(_QWORD *)(a1 + 32));

  }
}

- (void)handleUpdatedPairSyncState:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithUnsignedInteger:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Did receive updated pair sync state, will handle; state=%{public}@",
      buf,
      0xCu);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__DNDSRemoteServiceProvider_handleUpdatedPairSyncState___block_invoke;
  v9[3] = &__block_descriptor_40_e89_v24__0__DNDSClientConnectionDetails_8__BSServiceConnection_BSServiceConnectionContext__16l;
  v9[4] = a3;
  -[DNDSRemoteServiceProvider _iterateClientConnectionsToSendWithHandler:](self, "_iterateClientConnectionsToSendWithHandler:", v9);
}

void __56__DNDSRemoteServiceProvider_handleUpdatedPairSyncState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a2, "wantsGlobalConfigurationUpdates"))
  {
    v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      v8 = *(_QWORD *)(a1 + 32);
      v9 = v6;
      objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Delivering pair sync state: state=%{public}@, connection=%{public}@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(v5, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deliverUpdatedPairSyncState:", v12);

  }
}

- (void)handleUpdatedPreventAutoReplySetting:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  BOOL v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v5 = (void *)DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = v5;
    objc_msgSend(v6, "numberWithBool:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v8;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Did receive updated prevent auto reply settings, will handle; settings=%{public}@",
      buf,
      0xCu);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__DNDSRemoteServiceProvider_handleUpdatedPreventAutoReplySetting___block_invoke;
  v9[3] = &__block_descriptor_33_e89_v24__0__DNDSClientConnectionDetails_8__BSServiceConnection_BSServiceConnectionContext__16l;
  v10 = v3;
  -[DNDSRemoteServiceProvider _iterateClientConnectionsToSendWithHandler:](self, "_iterateClientConnectionsToSendWithHandler:", v9);
}

void __66__DNDSRemoteServiceProvider_handleUpdatedPreventAutoReplySetting___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v5, "wantsGlobalConfigurationUpdates") & 1) != 0
    || objc_msgSend(v5, "wantsSettingsUpdates"))
  {
    v7 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      v9 = *(unsigned __int8 *)(a1 + 32);
      v10 = v7;
      objc_msgSend(v8, "numberWithBool:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v6;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Delivering prevent auto reply update: settings=%{public}@, connection=%{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v6, "remoteTarget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deliverUpdatedPreventAutoReplySetting:", v13);

  }
}

- (void)handleUpdatedScheduleSettings:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Did receive updated schedule settings, will handle; settings=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__DNDSRemoteServiceProvider_handleUpdatedScheduleSettings___block_invoke;
  v7[3] = &unk_1E86A8260;
  v8 = v4;
  v6 = v4;
  -[DNDSRemoteServiceProvider _iterateClientConnectionsToSendWithHandler:](self, "_iterateClientConnectionsToSendWithHandler:", v7);

}

void __59__DNDSRemoteServiceProvider_handleUpdatedScheduleSettings___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a2, "wantsSettingsUpdates"))
  {
    v6 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Delivering settings update: settings=%{public}@, connection=%{public}@", (uint8_t *)&v9, 0x16u);
    }
    objc_msgSend(v5, "remoteTarget");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deliverUpdatedScheduleSettings:", *(_QWORD *)(a1 + 32));

  }
}

- (void)handleUpdatedModes:(id)a3 availableModes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Did receive updated available modes, will handle; modes=%{public}@",
      buf,
      0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__DNDSRemoteServiceProvider_handleUpdatedModes_availableModes___block_invoke;
  v11[3] = &unk_1E86A81E8;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  -[DNDSRemoteServiceProvider _iterateClientConnectionsToSendWithHandler:](self, "_iterateClientConnectionsToSendWithHandler:", v11);

}

void __63__DNDSRemoteServiceProvider_handleUpdatedModes_availableModes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a2, "wantsModeUpdates"))
  {
    v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v5, "remoteProcess");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "pid");
      v10 = *(_QWORD *)(a1 + 32);
      v18 = 67109634;
      v19 = v9;
      v20 = 2114;
      v21 = v10;
      v22 = 2114;
      v23 = v5;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Delivering modes update: pid=%d, modes=%{public}@, connection=%{public}@", (uint8_t *)&v18, 0x1Cu);

    }
    objc_msgSend(v5, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deliverAllModes:", *(_QWORD *)(a1 + 40));

    v12 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      objc_msgSend(v5, "remoteProcess");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "pid");
      v16 = *(_QWORD *)(a1 + 32);
      v18 = 67109634;
      v19 = v15;
      v20 = 2114;
      v21 = v16;
      v22 = 2114;
      v23 = v5;
      _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Delivering available modes update: pid=%d, modes=%{public}@, connection=%{public}@", (uint8_t *)&v18, 0x1Cu);

    }
    objc_msgSend(v5, "remoteTarget");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "deliverAvailableModes:", *(_QWORD *)(a1 + 32));

  }
}

- (void)handleAppConfigurationContextUpdateForModeIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Mode did receive updated app configuration context, will handle; mode=%{public}@",
      buf,
      0xCu);
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__DNDSRemoteServiceProvider_handleAppConfigurationContextUpdateForModeIdentifier___block_invoke;
  v7[3] = &unk_1E86A8260;
  v8 = v4;
  v6 = v4;
  -[DNDSRemoteServiceProvider _iterateClientConnectionsToSendWithHandler:](self, "_iterateClientConnectionsToSendWithHandler:", v7);

}

void __82__DNDSRemoteServiceProvider_handleAppConfigurationContextUpdateForModeIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a2, "wantsModeUpdates"))
  {
    v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v5, "remoteProcess");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "pid");
      v10 = *(_QWORD *)(a1 + 32);
      v12[0] = 67109634;
      v12[1] = v9;
      v13 = 2114;
      v14 = v10;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Signaling mode app configuration context update: pid=%d, mode=%{public}@, connection=%{public}@", (uint8_t *)v12, 0x1Cu);

    }
    objc_msgSend(v5, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "signalAppConfigurationContextUpdateForModeIdentifier:", *(_QWORD *)(a1 + 32));

  }
}

- (void)handleMeDeviceStateUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "meDeviceStatus");
    DNDMeDeviceStatusToString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "meDeviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v7;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Did receive updated 'Me Device' state, will handle; meDeviceStatus=%{public}@, meDeviceName=%{public}@",
      buf,
      0x16u);

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__DNDSRemoteServiceProvider_handleMeDeviceStateUpdate___block_invoke;
  v10[3] = &unk_1E86A8260;
  v11 = v4;
  v9 = v4;
  -[DNDSRemoteServiceProvider _iterateClientConnectionsToSendWithHandler:](self, "_iterateClientConnectionsToSendWithHandler:", v10);

}

void __55__DNDSRemoteServiceProvider_handleMeDeviceStateUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(a2, "wantsMeDeviceStateUpdates"))
  {
    v6 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      objc_msgSend(v5, "remoteProcess");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "pid");
      objc_msgSend(*(id *)(a1 + 32), "meDeviceStatus");
      DNDMeDeviceStatusToString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "meDeviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = 67109890;
      v13[1] = v9;
      v14 = 2114;
      v15 = v10;
      v16 = 2114;
      v17 = v11;
      v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Delivering 'Me Device' state update: pid=%d, meDeviceStatus=%{public}@, meDeviceName=%{public}@, connection=%{public}@", (uint8_t *)v13, 0x26u);

    }
    objc_msgSend(v5, "remoteTarget");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deliverMeDeviceState:", *(_QWORD *)(a1 + 32));

  }
}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientConnectionInterrupted:", v3);
  objc_msgSend(WeakRetained, "_removeConnection:", v3);

}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientConnectionInvalidated:", v3);
  objc_msgSend(WeakRetained, "_removeConnection:", v3);

}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_5(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientConnectionInterrupted:", v3);
  objc_msgSend(WeakRetained, "_removeConnection:", v3);

}

void __71__DNDSRemoteServiceProvider_listener_didReceiveConnection_withContext___block_invoke_6(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientConnectionInvalidated:", v3);
  objc_msgSend(WeakRetained, "_removeConnection:", v3);

}

- (void)resolveBehaviorForEventDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void (**v26)(_QWORD, void *, id);
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "dnds_hasBehaviorResolutionEntitlementForClientIdentifier:", v17))
  {
    -[DNDSRemoteServiceProvider _clientDetailsForClientIdentifier:clientConnection:](self, "_clientDetailsForClientIdentifier:clientConnection:", v17, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v26 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v19, "remoteServiceProvider:resolveBehaviorForEventDetails:clientDetails:date:error:", self, v9, v18, v20, &v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v10;
    v23 = v15;
    v24 = v9;
    v25 = v27;

    v11 = v26;
    v26[2](v26, v21, v25);

    v9 = v24;
    v15 = v23;
    v10 = v22;

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider resolveBehaviorForEventDetails:requestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)takeModeAssertionWithDetails:(id)a3 requestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "dnds_hasEntitlementsToRequestAssertionWithDetails:clientIdentifier:", v9, v17))
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v18, "remoteServiceProvider:takeModeAssertionWithDetails:clientIdentifier:error:", self, v9, v17, &v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;

    if (v19)
    {
      -[DNDSClientDetailsProvider clientDetailsForIdentifier:](self->_clientDetailsProvider, "clientDetailsForIdentifier:", v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isPersistentAssertionClient") & 1) == 0)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __91__DNDSRemoteServiceProvider_takeModeAssertionWithDetails_requestDetails_completionHandler___block_invoke;
        v23[3] = &unk_1E86A82C8;
        v24 = v19;
        -[DNDSRemoteServiceProvider _registerOrMutateConnectionDetailsForClientConnection:handler:](self, "_registerOrMutateConnectionDetailsForClientConnection:handler:", v16, v23);

      }
    }
    v11[2](v11, v19, v20);

  }
  else
  {
    v22 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v27 = v10;
      v28 = 2114;
      v29 = v16;
      v30 = 2114;
      v31 = v9;
      _os_log_error_impl(&dword_1CB895000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] XPC connection without any valid entitlements tried to take mode assertion, will invalidate: connection=%{public}@, assertionDetails=%{public}@", buf, 0x20u);
    }
    objc_msgSend(v16, "invalidate");
  }

}

id __91__DNDSRemoteServiceProvider_takeModeAssertionWithDetails_requestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterruptionInvalidationAssertionUUID:", v4);

  return v3;
}

- (void)invalidateActiveModeAssertionWithDetails:(id)a3 reasonOverride:(id)a4 requestDetails:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, id);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, id))a6;
  v15 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "UTF8String");
  v18 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v20))
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v21, "remoteServiceProvider:invalidateModeAssertionForClientIdentifier:reason:reasonOverride:details:error:", self, v20, 3, objc_msgSend(v12, "unsignedIntegerValue"), v11, &v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v24;

    v14[2](v14, v22, v23);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider invalidateActiveModeAssertionWithDetails:reasonOverride:requestDetails:completionHandler:].cold.1();
    objc_msgSend(v19, "invalidate");
  }

}

- (void)getActiveModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v15, "remoteServiceProvider:assertionWithClientIdentifer:error:", self, v14, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getActiveModeAssertionWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)getLatestModeAssertionInvalidationWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v15, "remoteServiceProvider:latestInvalidationWithClientIdentifer:error:", self, v14, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getLatestModeAssertionInvalidationWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)invalidateAllActiveModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14)
    && objc_msgSend(v13, "dnds_hasUserRequestedModeAssertionEntitlementForClientIdentifier:", v14))
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v15, "remoteServiceProvider:invalidateAllModeAssertionsTakenBeforeDate:forReason:clientIdentifier:error:", self, v16, 2, v14, &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17 != 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v19, v18);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider invalidateAllActiveModeAssertionsWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)getAllModeAssertionsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v15, "remoteServiceProvider:allActiveModeAssertionsWithError:", self, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAllModeAssertionsWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)registerForAssertionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __93__DNDSRemoteServiceProvider_registerForAssertionUpdatesWithRequestDetails_completionHandler___block_invoke;
    v15[3] = &unk_1E86A82C8;
    v16 = v14;
    -[DNDSRemoteServiceProvider _registerOrMutateConnectionDetailsForClientConnection:handler:](self, "_registerOrMutateConnectionDetailsForClientConnection:handler:", v13, v15);
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AAB0], 0);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider registerForAssertionUpdatesWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

id __93__DNDSRemoteServiceProvider_registerForAssertionUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "assertionUpdateClientIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObject:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAssertionUpdateClientIdentifiers:", v5);
  return v3;
}

- (void)queryStateForUpdateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasStateUpdatesEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider _queryStateWithCompletionHandler:](self, "_queryStateWithCompletionHandler:", v8);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider queryStateForUpdateWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)setScreenIsShared:(id)a3 screenIsMirrored:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, id);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, id))a6;
  v15 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "UTF8String");
  v18 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "dnds_hasAuxiliaryStateModificationEntitlementForClientIdentifier:", v20);

  if (v21)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v23 = objc_msgSend(v22, "remoteServiceProvider:setScreenIsShared:screenIsMirrored:withError:", self, objc_msgSend(v11, "BOOLValue"), objc_msgSend(v12, "BOOLValue"), &v26);
    v24 = v26;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v25, v24);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setScreenIsShared:screenIsMirrored:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v19, "invalidate");
  }

}

- (void)getBehaviorSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "remoteServiceProvider:behaviorSettingsWithError:", self, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getBehaviorSettingsWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)setBehaviorSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v20 = objc_msgSend(v19, "remoteServiceProvider:setBehaviorSettings:withError:", self, v9, &v23);
    v21 = v23;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v22, v21);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setBehaviorSettings:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)getScheduleSettingsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "remoteServiceProvider:scheduleSettingsWithError:", self, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getScheduleSettingsWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)setScheduleSettings:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v20 = objc_msgSend(v19, "remoteServiceProvider:setScheduleSettings:withError:", self, v9, &v23);
    v21 = v23;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v22, v21);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setScheduleSettings:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)registerForSettingsUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsUpdatesEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider _registerOrMutateConnectionDetailsForClientConnection:handler:](self, "_registerOrMutateConnectionDetailsForClientConnection:handler:", v13, &__block_literal_global_35);
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AAB0], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setScheduleSettings:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

id __92__DNDSRemoteServiceProvider_registerForSettingsUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "setWantsSettingsUpdates:", 1);
  return v2;
}

- (void)setPreventAutoReply:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v20 = objc_msgSend(v19, "remoteServiceProvider:setPreventAutoReply:withError:", self, objc_msgSend(v9, "BOOLValue"), &v23);
    v21 = v23;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v22, v21);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setPreventAutoReply:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)getPreventAutoReplyWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17 = objc_msgSend(v16, "remoteServiceProvider:getPreventAutoReplyReturningError:", self, &v20);
    v18 = v20;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v19, v18);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getPreventAutoReplyWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)setModesCanImpactAvailability:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v20 = objc_msgSend(v19, "remoteServiceProvider:setModesCanImpactAvailability:withError:", self, objc_msgSend(v9, "BOOLValue"), &v23);
    v21 = v23;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v22, v21);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setPreventAutoReply:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)getModesCanImpactAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17 = objc_msgSend(v16, "remoteServiceProvider:getModesCanImpactAvailabilityReturningError:", self, &v20);
    v18 = v20;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v19, v18);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getModesCanImpactAvailabilityWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)registerForGlobalConfigurationUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsUpdatesEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider _registerOrMutateConnectionDetailsForClientConnection:handler:](self, "_registerOrMutateConnectionDetailsForClientConnection:handler:", v13, &__block_literal_global_36_1);
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AAB0], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider registerForGlobalConfigurationUpdatesWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

id __103__DNDSRemoteServiceProvider_registerForGlobalConfigurationUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "setWantsGlobalConfigurationUpdates:", 1);
  return v2;
}

- (void)getCloudSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17 = objc_msgSend(v16, "remoteServiceProvider:getCloudSyncStateReturningError:", self, &v20);
    v18 = v20;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v19, v18);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getCloudSyncStateWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)setCloudSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v20 = objc_msgSend(v19, "remoteServiceProvider:setCloudSyncPreferenceEnabled:withError:", self, objc_msgSend(v9, "BOOLValue"), &v23);
    v21 = v23;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v22, v21);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setCloudSyncPreferenceEnabled:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)getPairSyncStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17 = objc_msgSend(v16, "remoteServiceProvider:getPairSyncStateReturningError:", self, &v20);
    v18 = v20;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v19, v18);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getPairSyncStateWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)setPairSyncPreferenceEnabled:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v20 = objc_msgSend(v19, "remoteServiceProvider:setPairSyncPreferenceEnabled:withError:", self, objc_msgSend(v9, "BOOLValue"), &v23);
    v21 = v23;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v22, v21);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setPairSyncPreferenceEnabled:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)getAccountFeatureSupportWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "remoteServiceProvider:getAccountFeatureSupportWithError:", self, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAccountFeatureSupportWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)getStateDumpWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v11 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v13);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    DNDSCollectSysdiagnoseState(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v16, 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getStateDumpWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v12, "invalidate");
  }

}

- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "remoteServiceProvider:didChangeFocusStatusSharingSettingForApplicationIdentifier:", self, v9);

    (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, MEMORY[0x1E0C9AAB0], 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider didChangeFocusStatusSharingSettingForApplicationIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)setModeConfiguration:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v20 = objc_msgSend(v19, "remoteServiceProvider:setModeConfiguration:withError:", self, v9, &v23);
    v21 = v23;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v22, v21);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setModeConfiguration:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, id);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, id))a6;
  v15 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "UTF8String");
  v18 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v20);

  if (v21)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v23 = objc_msgSend(v22, "remoteServiceProvider:removeModeConfigurationWithModeIdentifier:deletePlaceholder:withError:", self, v11, objc_msgSend(v12, "BOOLValue"), &v26);
    v24 = v26;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v25, v24);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider removeModeConfigurationForModeIdentifier:deletePlaceholder:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v19, "invalidate");
  }

}

- (void)getModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v16, "remoteServiceProvider:modeConfigurationsWithError:", self, &v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v20;

    objc_msgSend(v17, "allValues");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v19, v18);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getModeConfigurationsWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)getModeConfigurationForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v19, "remoteServiceProvider:modeConfigurationForModeIdentifier:withError:", self, v9, &v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22;

    v11[2](v11, v20, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getModeConfigurationForModeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)getAllModesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "remoteServiceProvider:allModesReturningError:", self, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAllModesWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)getAvailableModesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "remoteServiceProvider:availableModesReturningError:", self, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAvailableModesWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)syncModeConfigurationsWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasSettingsModificationEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17 = objc_msgSend(v16, "remoteServiceProvider:syncModeConfigurationsReturningError:", self, &v20);
    v18 = v20;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v19, v18);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider syncModeConfigurationsWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)getAllowedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v19, "remoteServiceProvider:allowedModesForContactHandle:withError:", self, v9, &v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;

    if (v21)
    {
      v22 = 0;
      v23 = v21;
    }
    else
    {
      v22 = v20;
      v23 = 0;
    }
    v11[2](v11, v22, v23);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAllowedModesForContactHandle:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)getSilencedModesForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v19, "remoteServiceProvider:silencedModesForContactHandle:withError:", self, v9, &v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v24;

    if (v21)
    {
      v22 = 0;
      v23 = v21;
    }
    else
    {
      v22 = v20;
      v23 = 0;
    }
    v11[2](v11, v22, v23);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAllowedModesForContactHandle:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)getUserAvailabilityInActiveModeForContactHandle:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v20 = objc_msgSend(v19, "remoteServiceProvider:userAvailabilityInActiveModeForContactHandle:withError:", self, v9, &v23);
    v21 = v23;

    if (v21)
    {
      v11[2](v11, MEMORY[0x1E0C9AAB0], v21);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, id))v11)[2](v11, v22, 0);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getUserAvailabilityInActiveModeForContactHandle:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)publishStatusKitAvailabilityWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasModeConfigurationAvailabilityEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "remoteServiceProvider:publishStatusKitAvailabilityReturningError:", self, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider publishStatusKitAvailabilityWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)activateModeWithDetails:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v18);
  v20 = DNDSLogServiceProvider;
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v9;
      v32 = 2112;
      v33 = v10;
      _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Activating mode %@ with details %@", buf, 0x16u);
    }
    v27 = v15;
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v17)
    {
      v29 = 0;
      objc_msgSend(v21, "remoteServiceProvider:takeModeAssertionWithDetails:clientIdentifier:error:", self, v9, v18, &v29);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v29;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      objc_msgSend(v22, "remoteServiceProvider:invalidateAllModeAssertionsTakenBeforeDate:forReason:clientIdentifier:error:", self, v25, 2, v18, &v28);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v28;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23 != 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v26, v24);

    v15 = v27;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v31 = v10;
      v32 = 2114;
      v33 = v16;
      v34 = 2114;
      v35 = v17;
      _os_log_error_impl(&dword_1CB895000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] XPC connection without any valid entitlements tried to activate a mode, will invalidate: connection=%{public}@, modeIdentifier=%{public}@", buf, 0x20u);
    }
    objc_msgSend(v16, "invalidate");
  }

}

- (void)activeModeAssertionWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v14))
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v15, "remoteServiceProvider:activeAssertionWithClientIdentifer:error:", self, v14, &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v18;

    v8[2](v8, v16, v17);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider activeModeAssertionWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)invalidateModeAssertionWithUUID:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, uint64_t);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id WeakRetained;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, uint64_t))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeAssertionEntitlementForClientIdentifier:", v17);
  v19 = DNDSLogServiceProvider;
  if (v18)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1CB895000, v19, OS_LOG_TYPE_DEFAULT, "Invalidating mode with UUID %@ with details %@", buf, 0x16u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v27 = 0;
    objc_msgSend(WeakRetained, "remoteServiceProvider:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v9, 2, 0, v17, &v27);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (uint64_t)v27;

    if (!(v22 | v21))
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0D1D3E0];
      v34 = *MEMORY[0x1E0CB2D50];
      v35[0] = CFSTR("Mode assertion not found for assertion UUID.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 1005, v25);
      v22 = objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21 != 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v26, v22);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v29 = v10;
      v30 = 2114;
      v31 = v16;
      v32 = 2114;
      v33 = v9;
      _os_log_error_impl(&dword_1CB895000, v19, OS_LOG_TYPE_ERROR, "[%{public}@] XPC connection without any valid entitlements tried to invalidate a mode, will invalidate: connection=%{public}@, assertionUUID=%{public}@", buf, 0x20u);
    }
    objc_msgSend(v16, "invalidate");
  }

}

- (void)registerForModeSelectionUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  char v24;
  char v25;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasModeConfigurationUpdatesEntitlementForClientIdentifier:", v14);

  objc_msgSend(v7, "clientIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "dnds_hasActiveModeUpdatesEntitlementForClientIdentifier:", v16);

  if ((v15 & 1) != 0 || v17)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __97__DNDSRemoteServiceProvider_registerForModeSelectionUpdatesWithRequestDetails_completionHandler___block_invoke;
    v22[3] = &unk_1E86A8370;
    v24 = v15;
    v25 = v17;
    v18 = v7;
    v23 = v18;
    -[DNDSRemoteServiceProvider _registerOrMutateConnectionDetailsForClientConnection:handler:](self, "_registerOrMutateConnectionDetailsForClientConnection:handler:", v13, v22);
    if (v17)
    {
      -[DNDSRemoteServiceProvider delegate](self, "delegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clientIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "remoteServiceProvider:activeAssertionWithClientIdentifer:error:", self, v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
    (*((void (**)(id, _QWORD, void *, _QWORD))v8 + 2))(v8, MEMORY[0x1E0C9AAB0], v21, 0);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider registerForModeSelectionUpdatesWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

id __97__DNDSRemoteServiceProvider_registerForModeSelectionUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(a2, "mutableCopy");
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(v3, "setWantsModeUpdates:", 1);
  if (*(_BYTE *)(a1 + 41))
  {
    objc_msgSend(v4, "setWantsActiveModeUpdates:", 1);
    objc_msgSend(v4, "activeAssertionUpdateClientIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setByAddingObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setActiveAssertionUpdateClientIdentifiers:", v7);
  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (void)getAppInfoForBundleIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v19, "remoteServiceProvider:getAppInfoForBundleIdentifier:withError:", self, v9, &v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22;

    v11[2](v11, v20, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAppInfoForBundleIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)getAppInfoForBundleIdentifiers:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasSettingsRequestEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v19, "remoteServiceProvider:getAppInfoForBundleIdentifiers:withError:", self, v9, &v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v22;

    v11[2](v11, v20, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAppInfoForBundleIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)queryMeDeviceStateWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasMeDeviceStateEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "remoteServiceProvider:currentMeDeviceStateWithError:", self, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;

    v8[2](v8, v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider queryMeDeviceStateWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

- (void)registerForMeDeviceStateUpdatesWithRequestDetails:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *, id);
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *, id))a4;
  v9 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v10);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "dnds_hasMeDeviceStateEntitlementForClientIdentifier:", v14);

  if (v15)
  {
    -[DNDSRemoteServiceProvider _registerOrMutateConnectionDetailsForClientConnection:handler:](self, "_registerOrMutateConnectionDetailsForClientConnection:handler:", v13, &__block_literal_global_41_0);
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v16, "remoteServiceProvider:currentMeDeviceStateWithError:", self, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v19;

    v8[2](v8, MEMORY[0x1E0C9AAB0], v17, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider registerForMeDeviceStateUpdatesWithRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v13, "invalidate");
  }

}

id __97__DNDSRemoteServiceProvider_registerForMeDeviceStateUpdatesWithRequestDetails_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v2, "setWantsMeDeviceStateUpdates:", 1);
  return v2;
}

- (void)setAppConfigurationPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *, id);
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, void *, id))a8;
  v20 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v21);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v22, "UTF8String");
  v23 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clientIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v25);

  if (v26)
  {
    v36 = v23;
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v28 = v17;
    v29 = v16;
    v30 = v15;
    v31 = v14;
    v32 = objc_msgSend(v27, "remoteServiceProvider:setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withError:", self, v14, v30, v29, v28, &v38);
    v33 = v38;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, v34, v33);

    v35 = v31;
    v15 = v30;
    v16 = v29;
    v17 = v28;
    v23 = v36;
  }
  else
  {
    v35 = v14;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v24, "invalidate");
  }

}

- (void)getAppConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *, id);
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, void *, id))a7;
  v18 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v19);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "UTF8String");
  v21 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v23);

  if (v24)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v25, "remoteServiceProvider:getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:withError:", self, v13, v14, v15, &v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v28;

    v17[2](v17, v26, v27);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v22, "invalidate");
  }

}

- (void)setAppConfigurationTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withRequestDetails:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *, id);
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, void *, id))a8;
  v20 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v21);
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v22, "UTF8String");
  v23 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clientIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v24, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v25);

  if (v26)
  {
    v36 = v23;
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v28 = v17;
    v29 = v16;
    v30 = v15;
    v31 = v14;
    v32 = objc_msgSend(v27, "remoteServiceProvider:setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withError:", self, v14, v30, v29, v28, &v38);
    v33 = v38;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2](v19, v34, v33);

    v35 = v31;
    v15 = v30;
    v16 = v29;
    v17 = v28;
    v23 = v36;
  }
  else
  {
    v35 = v14;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v24, "invalidate");
  }

}

- (void)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSRemoteServiceProvider delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v16, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v18);

  if (v19)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.focus.current-sentinel")))
    {
      v27 = 0;
      objc_msgSend(v17, "remoteServiceProvider:currentStateWithError:", self, &v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v27;
      objc_msgSend(v20, "activeModeIdentifier");
      v22 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v22;
    }
    else
    {
      v21 = 0;
    }
    v23 = objc_alloc_init(MEMORY[0x1E0D1D580]);
    if (v9)
    {
      v26 = v21;
      objc_msgSend(v17, "remoteServiceProvider:getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:withError:", self, v9, &v26);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v26;

      v21 = v25;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v23, "setAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:", v24);

    v11[2](v11, v23, v21);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *, id);
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, void *, id))a7;
  v18 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v19);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "UTF8String");
  v21 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v23);

  if (v24)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v26 = objc_msgSend(v25, "remoteServiceProvider:setAppAction:forApplicationIdentifier:modeIdentifier:withError:", self, v13, v14, v15, &v29);
    v27 = v29;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v28, v27);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setAppAction:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v22, "invalidate");
  }

}

- (void)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 withRequestDetails:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(id, void *, id);
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = (void (**)(id, void *, id))a7;
  v18 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v19);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v20, "UTF8String");
  v21 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clientIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v22, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v23);

  if (v24)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v26 = objc_msgSend(v25, "remoteServiceProvider:clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:withError:", self, v13, v14, v15, &v29);
    v27 = v29;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, v28, v27);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v22, "invalidate");
  }

}

- (void)getAppActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, id, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, id, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeConfigurationRequestEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v19, "remoteServiceProvider:getAppActionsForModeIdentifier:withError:", self, v9, &v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v23;

    v22 = objc_alloc_init(MEMORY[0x1E0D1D578]);
    objc_msgSend(v22, "setAppActionsForModeIdentifier:", v20);
    v11[2](v11, v22, v21);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getAppActionsForModeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)clearSystemActionWithIdentifier:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, id);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, id))a6;
  v15 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "UTF8String");
  v18 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v20);

  if (v21)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v23 = objc_msgSend(v22, "remoteServiceProvider:clearSystemActionWithIdentifier:forModeIdentifier:withError:", self, v11, v12, &v26);
    v24 = v26;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v25, v24);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider clearSystemActionWithIdentifier:forModeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v19, "invalidate");
  }

}

- (void)getSystemActionsForModeIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, id))a5;
  v12 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "UTF8String");
  v15 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v17);

  if (v18)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v19, "remoteServiceProvider:getSystemActionsForModeIdentifier:withError:", self, v9, &v23);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v23;

    objc_msgSend(v20, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v22, v21);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider getSystemActionsForModeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v16, "invalidate");
  }

}

- (void)setSystemAction:(id)a3 forModeIdentifier:(id)a4 withRequestDetails:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, void *, id);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void (**)(id, void *, id))a6;
  v15 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v17, "UTF8String");
  v18 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "dnds_hasModeConfigurationModificationEntitlementForClientIdentifier:", v20);

  if (v21)
  {
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    v23 = objc_msgSend(v22, "remoteServiceProvider:setSystemAction:forModeIdentifier:withError:", self, v11, v12, &v26);
    v24 = v26;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v25, v24);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_ERROR))
      -[DNDSRemoteServiceProvider setSystemAction:forModeIdentifier:withRequestDetails:completionHandler:].cold.1();
    objc_msgSend(v19, "invalidate");
  }

}

- (void)_handleClientConnectionInterrupted:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was interrupted: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[DNDSRemoteServiceProvider _unregisterConnectionDetailsForClientConnection:](self, "_unregisterConnectionDetailsForClientConnection:", v4);

}

- (void)_handleClientConnectionInvalidated:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was invalidated: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[DNDSRemoteServiceProvider _unregisterConnectionDetailsForClientConnection:](self, "_unregisterConnectionDetailsForClientConnection:", v4);

}

- (void)_unregisterConnectionDetailsForClientConnection:(id)a3
{
  id v4;
  NSMapTable *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_clientConnectionDetailsByConnection;
  objc_sync_enter(v5);
  -[NSMapTable objectForKey:](self->_clientConnectionDetailsByConnection, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_clientConnectionDetailsByConnection, "removeObjectForKey:", v4);
  -[DNDSRemoteServiceProvider _removeConnection:](self, "_removeConnection:", v4);
  v7 = DNDSLogServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543618;
    v13 = v4;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Connection details unregistered: connection=%{public}@, clientDetails=%{public}@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend(v6, "interruptionInvalidationAssertionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138543618;
      v13 = v4;
      v14 = 2114;
      v15 = v8;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Invalidating assertion due to client disconnect: connection=%{public}@, UUID=%{public}@", (uint8_t *)&v12, 0x16u);
    }
    -[DNDSRemoteServiceProvider delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "remoteServiceProvider:invalidateModeAssertionWithUUID:reason:reasonOverride:clientIdentifier:error:", self, v8, 6, 1, 0, 0);

  }
  objc_sync_exit(v5);

}

- (void)_iterateClientConnectionsToSendWithHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSMapTable *v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = self->_clientConnectionDetailsByConnection;
  objc_sync_enter(v5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_clientConnectionDetailsByConnection;
  v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_clientConnectionDetailsByConnection, "objectForKey:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v11, v10);

      }
      v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (id)_clientDetailsForClientIdentifier:(id)a3 clientConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;

  v6 = a3;
  v7 = a4;
  -[DNDSClientDetailsProvider findClientDetailsForIdentifier:](self->_clientDetailsProvider, "findClientDetailsForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "remoteProcess", 0, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "auditToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "realToken");
    }
    else
    {
      v16 = 0u;
      v17 = 0u;
    }

    BSPIDForAuditToken();
    BSExecutablePathForPID();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)_CFBundleCopyBundleURLForExecutableURL();

    }
    else
    {
      v14 = 0;
    }
    -[DNDSClientDetailsProvider clientDetailsForIdentifier:applicationBundleURL:](self->_clientDetailsProvider, "clientDetailsForIdentifier:applicationBundleURL:", v6, v14, v16, v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_removeConnection:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v5;

  p_accessLock = &self->_accessLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_accessLock);
  os_unfair_lock_lock(p_accessLock);
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", v5);

  os_unfair_lock_unlock(p_accessLock);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientNotificationQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_clientConnectionDetailsByConnection, 0);
  objc_storeStrong((id *)&self->_monitorListener, 0);
  objc_storeStrong((id *)&self->_requestListener, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "XPC connection without any valid entitlements tried to connect, will reject: connection=%{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)resolveBehaviorForEventDetails:requestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to process event, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)invalidateActiveModeAssertionWithDetails:reasonOverride:requestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to invalidate mode assertion, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getActiveModeAssertionWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode assertion, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getLatestModeAssertionInvalidationWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode assertion invalidation, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)invalidateAllActiveModeAssertionsWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to invalidate all mode assertions, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getAllModeAssertionsWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to request all mode assertions, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)registerForAssertionUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to register for assertion updates, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)queryStateWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to query state, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)queryStateForUpdateWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to query state as a part of registering for updates, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)registerForStateUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to register for state updates, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setScreenIsShared:screenIsMirrored:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set screen sharing / mirroring settings, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getBehaviorSettingsWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get behavior settings, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setBehaviorSettings:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set behavior settings, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getScheduleSettingsWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get schedule settings, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setScheduleSettings:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set schedule settings, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setPreventAutoReply:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set global configuration, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getPreventAutoReplyWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get auto reply prevention state, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getModesCanImpactAvailabilityWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get global availability state, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)registerForGlobalConfigurationUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to register for global configuration updates; will inva"
    "lidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getCloudSyncStateWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get cloud sync state, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setCloudSyncPreferenceEnabled:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to change cloud sync preference enabled state, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getPairSyncStateWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get pair sync state, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setPairSyncPreferenceEnabled:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to change pair sync preference enabled state, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getAccountFeatureSupportWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get supported account features, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getStateDumpWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to fetch state dump, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)didChangeFocusStatusSharingSettingForApplicationIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to notify of focus status sharing change, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setModeConfiguration:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set mode configuration, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)removeModeConfigurationForModeIdentifier:deletePlaceholder:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to remove mode configuration, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getModeConfigurationsWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode configurations, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getModeConfigurationForModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode configuration, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getAllModesWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get all modes, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getAvailableModesWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get available modes, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)syncModeConfigurationsWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to sync modes, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getAllowedModesForContactHandle:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get silenced modes for a contact, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getUserAvailabilityInActiveModeForContactHandle:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get availability state, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)publishStatusKitAvailabilityWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to publish statuskit availability, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)activeModeAssertionWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get mode assertion, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)registerForModeSelectionUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to register for available mode identifiers; will invali"
    "date: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getAppInfoForBundleIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to fetch app info; will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)queryMeDeviceStateWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to query 'Me Device' state; will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)registerForMeDeviceStateUpdatesWithRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without valid entitlements tried to register for 'Me Device' state updates; will invalid"
    "ate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setAppConfigurationPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set app predicate, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getAppConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get app predicate, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setAppConfigurationTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set target content identifier prefix, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get target content identifier prefixes, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setAppAction:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set app action, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to clear app action, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getAppActionsForModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get app actions, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)clearSystemActionWithIdentifier:forModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to clear system action, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)getSystemActionsForModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to get system actions, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)setSystemAction:forModeIdentifier:withRequestDetails:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "[%{public}@] XPC connection without any valid entitlements tried to set system action, will invalidate: connection=%{public}@");
  OUTLINED_FUNCTION_1();
}

@end
