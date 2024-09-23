@implementation MSNPillDataSourceController

- (MSNPillDataSourceController)initWithQueue:(id)a3
{
  id v5;
  MSNPillDataSourceController *v6;
  MSNPillDataSourceController *v7;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  id location;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSNPillDataSourceController;
  v6 = -[MSNPillDataSourceController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_initWeak(&location, v7);
    queue = v7->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__MSNPillDataSourceController_initWithQueue___block_invoke;
    v10[3] = &unk_1E97760D8;
    objc_copyWeak(&v11, &location);
    notify_register_dispatch("com.apple.MediaSafetyNet.connectionrequest", &v7->_token, queue, v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __45__MSNPillDataSourceController_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__MSNPillDataSourceController_initWithQueue___block_invoke_2;
    block[3] = &unk_1E9775FF8;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void __45__MSNPillDataSourceController_initWithQueue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "com.apple.MediaSafetyNet.connectionrequest";
    _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_INFO, "Handling %s by setting up XPC connection", (uint8_t *)&v6, 0xCu);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerPillDataSource:forIdentifiers:", v4, v5);

}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_token);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MSNPillDataSourceController;
  -[MSNPillDataSourceController dealloc](&v3, sel_dealloc);
}

- (void)registerPillDataSource:(id)a3 forIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  _QWORD v26[4];
  __CFString *v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MSNPillDataSourceController queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mediasafetynet.pill"), 0);
  -[MSNPillDataSourceController setXpcConnection:](self, "setXpcConnection:", v9);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE39808);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSNPillDataSourceController xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v10);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE3A498);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSNPillDataSourceController xpcConnection](self, "xpcConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setExportedInterface:", v12);

  -[MSNPillDataSourceController xpcConnection](self, "xpcConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExportedObject:", v6);

  -[MSNPillDataSourceController xpcConnection](self, "xpcConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSNPillDataSourceController queue](self, "queue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setQueue:", v16);

  v17 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __69__MSNPillDataSourceController_registerPillDataSource_forIdentifiers___block_invoke;
  v26[3] = &unk_1E9775FF8;
  v27 = CFSTR("com.apple.mediasafetynet.pill");
  -[MSNPillDataSourceController xpcConnection](self, "xpcConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setInterruptionHandler:", v26);

  v25 = CFSTR("com.apple.mediasafetynet.pill");
  -[MSNPillDataSourceController xpcConnection](self, "xpcConnection", v17, 3221225472, __69__MSNPillDataSourceController_registerPillDataSource_forIdentifiers___block_invoke_13, &unk_1E9775FF8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInvalidationHandler:", &v24);

  -[MSNPillDataSourceController xpcConnection](self, "xpcConnection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "resume");

  -[MSNPillDataSourceController setDataSource:](self, "setDataSource:", v6);
  -[MSNPillDataSourceController setIdentifiers:](self, "setIdentifiers:", v7);
  MSNLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v6;
    v30 = 2112;
    v31 = v7;
    _os_log_impl(&dword_1D416F000, v21, OS_LOG_TYPE_INFO, "Registering dataSource: (%@) with identifiers: %@", buf, 0x16u);
  }

  -[MSNPillDataSourceController xpcConnection](self, "xpcConnection");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "remoteObjectProxy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "registerPillDataSourceForIdentifiers:", v7);

}

void __69__MSNPillDataSourceController_registerPillDataSource_forIdentifiers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_INFO, "Interrupted (%@): If this happens at connection-time or when setting an exception, a required entitlement is likely missing.", (uint8_t *)&v4, 0xCu);
  }

}

void __69__MSNPillDataSourceController_registerPillDataSource_forIdentifiers___block_invoke_13(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  MSNLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_INFO, "Invalidated (%@).", (uint8_t *)&v4, 0xCu);
  }

}

- (MSNPillDataSourceProtocol)dataSource
{
  return (MSNPillDataSourceProtocol *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (int)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
