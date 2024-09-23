@implementation BNBannerHostMonitor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    BNRegisterBannerKitLogging();
}

- (void)dealloc
{
  objc_super v3;

  -[BNBannerHostMonitor _invalidateConnection](self, "_invalidateConnection");
  v3.receiver = self;
  v3.super_class = (Class)BNBannerHostMonitor;
  -[BNBannerHostMonitor dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; machName: %@>"),
               objc_opt_class(),
               self,
               self->_machName);
}

- (BNBannerHostMonitor)initWithMachName:(id)a3
{
  id v5;
  BNBannerHostMonitor *v6;
  uint64_t v7;
  NSString *machName;
  uint64_t Serial;
  OS_dispatch_queue *connectionQueue;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerHostMonitor.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("machName"));

  }
  v18.receiver = self;
  v18.super_class = (Class)BNBannerHostMonitor;
  v6 = -[BNBannerHostMonitor init](&v18, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    machName = v6->_machName;
    v6->_machName = (NSString *)v7;

    Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)Serial;

    v11 = (void *)BNLogHostingHost;
    if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BNBannerHostMonitor description](v6, "description");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v14;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1B9628000, v12, OS_LOG_TYPE_DEFAULT, "Initializing new %{public}@ instance: %{public}@", buf, 0x16u);

    }
  }

  return v6;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)activate
{
  id v2;

  v2 = -[BNBannerHostMonitor _activeConnection](self, "_activeConnection");
}

- (void)deactivate
{
  -[BSServiceConnection invalidate](self->_connection, "invalidate");
}

- (id)_activeConnection
{
  BNBannerHostMonitor *v2;
  void *v3;
  NSString *machName;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_connection)
  {
    v3 = (void *)MEMORY[0x1E0D228C0];
    machName = v2->_machName;
    +[BNBannerHostMonitorSessionSpecification identifier](BNBannerHostMonitorSessionSpecification, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endpointForMachName:service:instance:", machName, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D228B8], "connectionWithEndpoint:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__BNBannerHostMonitor__activeConnection__block_invoke;
    v9[3] = &unk_1E70442E8;
    v9[4] = v2;
    objc_msgSend(v7, "configureConnection:", v9);
    objc_storeStrong((id *)&v2->_connection, v7);
    -[BSServiceConnection activate](v2->_connection, "activate");

  }
  objc_sync_exit(v2);

  return v2->_connection;
}

void __40__BNBannerHostMonitor__activeConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = a2;
  +[BNBannerHostMonitorSessionSpecification serviceQuality](BNBannerHostMonitorSessionSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[BNBannerHostMonitorSessionSpecification interface](BNBannerHostMonitorSessionSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "setInterface:", v5);
    objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__BNBannerHostMonitor__activeConnection__block_invoke_2;
  v11[3] = &unk_1E70442C0;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setActivationHandler:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __40__BNBannerHostMonitor__activeConnection__block_invoke_17;
  v9[3] = &unk_1E70442C0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __40__BNBannerHostMonitor__activeConnection__block_invoke_18;
  v7[3] = &unk_1E70442C0;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __40__BNBannerHostMonitor__activeConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)BNLogHostingHost;
  if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection activated", (uint8_t *)&v10, 0xCu);

  }
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_sync_enter(v9);
    objc_msgSend(v9, "_setActive:", 1);
    objc_sync_exit(v9);

  }
}

void __40__BNBannerHostMonitor__activeConnection__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)BNLogHostingService;
  if (os_log_type_enabled((os_log_t)BNLogHostingService, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (service-side) connection interrupted", (uint8_t *)&v10, 0xCu);

  }
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_sync_enter(v9);
    objc_msgSend(v9, "_setActive:", 0);
    objc_msgSend(v3, "activate");
    objc_sync_exit(v9);

  }
}

void __40__BNBannerHostMonitor__activeConnection__block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)BNLogHostingHost;
  if (os_log_type_enabled((os_log_t)BNLogHostingHost, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ (host-side) connection invalidated", (uint8_t *)&v10, 0xCu);

  }
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_sync_enter(v9);
    objc_msgSend(v9, "_setActive:", 0);
    objc_msgSend(v9, "_invalidateConnection");
    objc_sync_exit(v9);

  }
}

- (void)_invalidateConnection
{
  BNBannerHostMonitor *v2;
  BSServiceConnection *connection;
  BSServiceConnection *v4;
  BNBannerHostMonitor *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  connection = obj->_connection;
  if (connection)
  {
    -[BSServiceConnection invalidate](connection, "invalidate");
    v4 = obj->_connection;
    obj->_connection = 0;

    v2 = obj;
  }
  objc_sync_exit(v2);

}

- (void)_setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BSServiceConnection)_connection
{
  return self->_connection;
}

- (void)_setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_machName, 0);
}

@end
