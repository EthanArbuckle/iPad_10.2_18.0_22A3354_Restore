@implementation DNDSRemoteAppConfigurationServiceProvider

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

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  BSServiceConnectionListener *v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id location;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = (BSServiceConnectionListener *)a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  if (self->_requestListener == v8)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke;
    v12[3] = &unk_1E86A5EA8;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v9, "configureConnection:", v12);
    objc_destroyWeak(&v13);
    -[DNDSRemoteAppConfigurationServiceProvider _addConnection:](self, "_addConnection:", v9);
    objc_msgSend(v9, "activate");
    v11 = DNDSLogAppConfigurationServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v9;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "XPC connection successfully accepted: connection=%{public}@", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v9, "invalidate");
  }
  objc_destroyWeak(&location);

}

- (void)getCurrentAppConfigurationForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void (**v9)(id, void *, id);
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (void (**)(id, void *, id))a5;
  v10 = a3;
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v11);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  v13 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v14, "remoteProcess");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "auditToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "realToken");
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }

  objc_msgSend(v14, "remoteProcess");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)buf = v28;
  v31 = v29;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", buf, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "bundleIdentifier");
    v21 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v21;
  }
  _DNDSPrimaryBundleIdentifier(v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = DNDSLogAppConfigurationServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v22;
    _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Client request to get current app configuration: bundleIdentifier=%{public}@", buf, 0xCu);
  }
  -[DNDSRemoteAppConfigurationServiceProvider delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v24, "remoteAppConfigurationServiceProvider:getCurrentAppConfigurationForActionIdentifier:bundleIdentifier:withError:", self, v10, v22, &v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v27;
  v9[2](v9, v25, v26);

}

- (DNDSRemoteAppConfigurationServiceProviderDelegate)delegate
{
  return (DNDSRemoteAppConfigurationServiceProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
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

  DNDRemoteAppConfigurationServiceServerInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2;
  v9[3] = &unk_1E86A5E80;
  a1 += 40;
  objc_copyWeak(&v10, (id *)a1);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3;
  v7[3] = &unk_1E86A5E80;
  objc_copyWeak(&v8, (id *)a1);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);

}

- (DNDSRemoteAppConfigurationServiceProvider)initWithClientDetailsProvider:(id)a3
{
  id v5;
  DNDSRemoteAppConfigurationServiceProvider *v6;
  DNDSRemoteAppConfigurationServiceProvider *v7;
  NSMutableSet *v8;
  NSMutableSet *connections;
  void *v10;
  DNDSRemoteAppConfigurationServiceProvider *v11;
  uint64_t v12;
  BSServiceConnectionListener *requestListener;
  _QWORD v15[4];
  DNDSRemoteAppConfigurationServiceProvider *v16;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DNDSRemoteAppConfigurationServiceProvider;
  v6 = -[DNDSRemoteAppConfigurationServiceProvider init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_accessLock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    connections = v7->_connections;
    v7->_connections = v8;

    v10 = (void *)MEMORY[0x1E0D03460];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__DNDSRemoteAppConfigurationServiceProvider_initWithClientDetailsProvider___block_invoke;
    v15[3] = &unk_1E86A5E58;
    v11 = v7;
    v16 = v11;
    objc_msgSend(v10, "listenerWithConfigurator:", v15);
    v12 = objc_claimAutoreleasedReturnValue();
    requestListener = v11->_requestListener;
    v11->_requestListener = (BSServiceConnectionListener *)v12;

    objc_storeStrong((id *)&v11->_clientDetailsProvider, a3);
  }

  return v7;
}

void __75__DNDSRemoteAppConfigurationServiceProvider_initWithClientDetailsProvider___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "setDomain:", CFSTR("com.apple.donotdisturb.appconfiguration.service.launching"));
  DNDRemoteAppConfigurationServiceServerInterface();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setService:", v4);

  objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)dealloc
{
  objc_super v3;

  -[DNDSRemoteAppConfigurationServiceProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)DNDSRemoteAppConfigurationServiceProvider;
  -[DNDSRemoteAppConfigurationServiceProvider dealloc](&v3, sel_dealloc);
}

- (void)resume
{
  id v2;

  -[BSServiceConnectionListener activate](self->_requestListener, "activate");
  v2 = (id)objc_msgSend(MEMORY[0x1E0D03488], "activateManualDomain:", CFSTR("com.apple.donotdisturb.appconfiguration.service.launching"));
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_requestListener, "invalidate");
}

void __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientConnectionInterrupted:", v3);

}

void __87__DNDSRemoteAppConfigurationServiceProvider_listener_didReceiveConnection_withContext___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientConnectionInvalidated:", v3);

}

- (void)invalidateAppContextForActionIdentifier:(id)a3 withRequestDetails:(id)a4 completionHandler:(id)a5
{
  void *v8;
  void (**v9)(id, void *, id);
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[16];
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (void (**)(id, void *, id))a5;
  v10 = a3;
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.donotdisturbd.%@"), v11);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  v13 = (void *)os_transaction_create();

  objc_msgSend(MEMORY[0x1E0D03448], "currentContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v14, "remoteProcess");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "auditToken");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "realToken");
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }

  objc_msgSend(v14, "remoteProcess");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)buf = v28;
  v31 = v29;
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForAuditToken:error:", buf, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v20, "containingBundleRecord");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bundleIdentifier");
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = v21;
    v19 = (void *)v22;
  }
  v23 = DNDSLogAppConfigurationServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v19;
    _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Client request to invalidate app context: bundleIdentifier=%{public}@", buf, 0xCu);
  }
  -[DNDSRemoteAppConfigurationServiceProvider delegate](self, "delegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v24, "remoteAppConfigurationServiceProvider:invalidateAppContextForActionIdentifier:bundleIdentifier:withError:", self, v10, v19, &v27);

  v25 = v27;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25 == 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2](v9, v26, v25);

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
  v5 = DNDSLogAppConfigurationServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was interrupted: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[DNDSRemoteAppConfigurationServiceProvider _removeConnection:](self, "_removeConnection:", v4);

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
  v5 = DNDSLogAppConfigurationServiceProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Client XPC connection was invalidated: connection=%{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[DNDSRemoteAppConfigurationServiceProvider _removeConnection:](self, "_removeConnection:", v4);

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
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_requestListener, 0);
}

@end
