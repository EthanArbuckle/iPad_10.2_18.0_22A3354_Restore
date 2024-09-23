@implementation CHSWidgetEventServiceListener

- (CHSWidgetEventServiceListener)initWithServiceDomain:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CHSWidgetEventServiceListener *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *connectionQueue;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *calloutQueue;
  void *v16;
  CHSWidgetEventServiceListener *v17;
  uint64_t v18;
  BSServiceConnectionListener *connectionListener;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  CHSWidgetEventServiceListener *v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v29.receiver = self;
  v29.super_class = (Class)CHSWidgetEventServiceListener;
  v9 = -[CHSWidgetEventServiceListener init](&v29, sel_init);
  if (v9)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("CHSWidgetEventServiceListener.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceDomain"));

    }
    objc_storeWeak((id *)&v9->_delegate, v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.chronoservices.CHSWidgetEventServiceListener.connection", v10);
    connectionQueue = v9->_connectionQueue;
    v9->_connectionQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.chronoservices.CHSWidgetEventServiceListener.callout", v13);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v14;

    v16 = (void *)MEMORY[0x1E0D03460];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __64__CHSWidgetEventServiceListener_initWithServiceDomain_delegate___block_invoke;
    v26[3] = &unk_1E2A5B328;
    v27 = v7;
    v17 = v9;
    v28 = v17;
    objc_msgSend(v16, "listenerWithConfigurator:", v26);
    v18 = objc_claimAutoreleasedReturnValue();
    connectionListener = v17->_connectionListener;
    v17->_connectionListener = (BSServiceConnectionListener *)v18;

    CHSLogChronoServices();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetEventServiceListener description](v17, "description");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v22;
      v32 = 2114;
      v33 = v23;
      _os_log_impl(&dword_18FB18000, v20, OS_LOG_TYPE_DEFAULT, "Initializing new %{public}@ instance: %{public}@", buf, 0x16u);

    }
  }

  return v9;
}

void __64__CHSWidgetEventServiceListener_initWithServiceDomain_delegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", *(_QWORD *)(a1 + 32));
  +[CHSWidgetEventServiceSpecification identifier](CHSWidgetEventServiceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 40));
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[BSServiceConnectionListener domain](self->_connectionListener, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; serviceDomain: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = -[CHSWidgetEventServiceListener _isConnectingProcessAuthorized:error:](self, "_isConnectingProcessAuthorized:error:", v7, &v15);
  v9 = v15;

  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke;
    v14[3] = &unk_1E2A5A790;
    v14[4] = self;
    objc_msgSend(v6, "configureConnection:", v14);
    -[CHSWidgetEventServiceListener _addConnection:](self, "_addConnection:", v6);
  }
  else
  {
    CHSLogChronoServices();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CHSWidgetEventServiceListener listener:didReceiveConnection:withContext:].cold.1(v12, v13, buf, v10);
    }

    objc_msgSend(v6, "invalidate");
  }

}

void __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  +[CHSWidgetEventServiceSpecification serviceQuality](CHSWidgetEventServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CHSWidgetEventServiceSpecification interface](CHSWidgetEventServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E2A5B350;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setActivationHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke_16;
  v7[3] = &unk_1E2A5B378;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ (client-side) connection did activate", (uint8_t *)&v6, 0xCu);

  }
}

void __75__CHSWidgetEventServiceListener_listener_didReceiveConnection_withContext___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CHSLogChronoServices();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ (client-side) connection invalidated", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(WeakRetained, "_removeConnection:", v3);

}

- (void)handleOpenEventWithURL:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *calloutQueue;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_initWeak(&location, self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__CHSWidgetEventServiceListener_handleOpenEventWithURL___block_invoke;
    v7[3] = &unk_1E2A5B3A0;
    v8 = WeakRetained;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    dispatch_async(calloutQueue, v7);

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);

}

void __56__CHSWidgetEventServiceListener_handleOpenEventWithURL___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v1, "eventServiceListener:didReceiveOpenEventWithURL:");

}

- (void)handleOpenEventWithUserActivityData:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *calloutQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_initWeak(&location, self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "_initWithUserActivityData:", v4);
    calloutQueue = self->_calloutQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__CHSWidgetEventServiceListener_handleOpenEventWithUserActivityData___block_invoke;
    v9[3] = &unk_1E2A5B3A0;
    v10 = WeakRetained;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    v8 = v6;
    dispatch_async(calloutQueue, v9);

    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&location);

}

void __69__CHSWidgetEventServiceListener_handleOpenEventWithUserActivityData___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  v1 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v1, "eventServiceListener:didReceiveOpenEventWithUserActivity:");

}

- (void)activate
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_18FB18000, log, OS_LOG_TYPE_FAULT, "%{public}@ unable to start event lister, connection listener is nil.", buf, 0xCu);

}

- (BOOL)_isConnectingProcessAuthorized:(id)a3 error:(id *)a4
{
  id v5;
  char v6;
  BOOL v7;
  char v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "hasEntitlement:", CFSTR("com.apple.chrono.event-service-publisher"));
  v7 = v6;
  if (a4)
    v8 = v6;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "chs_initWithErrorCode:", 2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_addConnection:(id)a3
{
  CHSWidgetEventServiceListener *v4;
  NSMutableArray *connections;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  connections = v4->_connections;
  if (!connections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = v4->_connections;
    v4->_connections = v6;

    connections = v4->_connections;
  }
  -[NSMutableArray addObject:](connections, "addObject:", v8);
  objc_msgSend(v8, "activate");
  objc_sync_exit(v4);

}

- (void)_removeConnection:(id)a3
{
  CHSWidgetEventServiceListener *v4;
  NSMutableArray *connections;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableArray removeObject:](v4->_connections, "removeObject:", v6);
  if (!-[NSMutableArray count](v4->_connections, "count"))
  {
    connections = v4->_connections;
    v4->_connections = 0;

  }
  objc_sync_exit(v4);

}

- (CHSWidgetEventServiceListenerDelegate)delegate
{
  return (CHSWidgetEventServiceListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
}

- (void)listener:(uint8_t *)buf didReceiveConnection:(os_log_t)log withContext:.cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_18FB18000, log, OS_LOG_TYPE_ERROR, "%{public}@ (client-side) connection failed to authenticate: %{public}@", buf, 0x16u);

}

@end
