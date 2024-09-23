@implementation NPSManager

- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4
{
  -[NPSManager synchronizeNanoDomain:keys:cloudEnabled:](self, "synchronizeNanoDomain:keys:cloudEnabled:", a3, a4, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NPSManager *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  -[NPSManager unsafe_invalidate](self, "unsafe_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)NPSManager;
  -[NPSManager dealloc](&v4, sel_dealloc);
}

- (void)unsafe_invalidate
{
  NSXPCConnection *xpcConnection;

  -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", 0);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", 0);
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6 cloudEnabled:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *internalQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    v32 = 2112;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    _os_log_impl(&dword_1B5280000, v16, OS_LOG_TYPE_DEFAULT, "synchronizeUserDefaultsDomain: (%@); keys: (%@); container: (%@); appGroupContainer: (%@)",
      buf,
      0x2Au);
  }
  internalQueue = self->_internalQueue;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __90__NPSManager_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_cloudEnabled___block_invoke;
  v22[3] = &unk_1E68E5F28;
  v22[4] = self;
  v23 = v12;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = a7;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  dispatch_sync(internalQueue, v22);

}

- (void)synchronizeNanoDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *internalQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[NPSManager synchronizeNanoDomain:keys:cloudEnabled:]";
    v20 = 2114;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_1B5280000, v10, OS_LOG_TYPE_DEFAULT, "%s: (%{public}@); keys: (%@)", buf, 0x20u);
  }
  internalQueue = self->_internalQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__NPSManager_synchronizeNanoDomain_keys_cloudEnabled___block_invoke;
  v14[3] = &unk_1E68E5F78;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a5;
  v12 = v9;
  v13 = v8;
  dispatch_sync(internalQueue, v14);

}

- (NPSManager)init
{
  NPSManager *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *internalQueue;
  objc_super v10;
  uint8_t buf[4];
  NPSManager *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10.receiver = self;
  v10.super_class = (Class)NPSManager;
  v2 = -[NPSManager init](&v10, sel_init);
  if (v2)
  {
    v3 = nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = v2;
      _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.nanoprefsync.NPSManager.%p"), v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_retainAutorelease(v4);
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

void __90__NPSManager_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_cloudEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD *, void *);
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __90__NPSManager_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_cloudEnabled___block_invoke_2;
  v7 = &unk_1E68E5F00;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 64);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), v4, v5, v6, v7);

}

void __54__NPSManager_synchronizeNanoDomain_keys_cloudEnabled___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __54__NPSManager_synchronizeNanoDomain_keys_cloudEnabled___block_invoke_2;
  v7 = &unk_1E68E5F50;
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeNanoDomain:keys:cloudEnabled:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), v4, v5, v6, v7);

}

- (id)connection
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v5;
  NSObject *v6;
  _QWORD v8[4];
  id v9;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  if (NPSShouldRun() && objc_msgSend((id)objc_opt_class(), "supportsWatch"))
  {
    if (!self->_xpcConnection)
    {
      if (connection_onceToken != -1)
        dispatch_once(&connection_onceToken, &__block_literal_global_0);
      v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.nanoprefsync"), 4096);
      xpcConnection = self->_xpcConnection;
      self->_xpcConnection = v3;

      -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", connection_remoteObjectInterface);
      objc_initWeak(location, self);
      -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", &__block_literal_global_65);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __24__NPSManager_connection__block_invoke_66;
      v8[3] = &unk_1E68E5ED8;
      objc_copyWeak(&v9, location);
      -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v8);
      -[NSXPCConnection resume](self->_xpcConnection, "resume");
      objc_destroyWeak(&v9);
      objc_destroyWeak(location);
    }
  }
  else if (self->_xpcConnection)
  {
    -[NPSManager unsafe_invalidate](self, "unsafe_invalidate");
  }
  v5 = self->_xpcConnection;
  if (!v5)
  {
    v6 = nps_framework_log;
    if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[NPSManager connection]";
      _os_log_impl(&dword_1B5280000, v6, OS_LOG_TYPE_DEFAULT, "%s: Can't get xpcConnection- either there's a daemon failure or the daemon can't be launched because no watches are paired", (uint8_t *)location, 0xCu);
    }
    v5 = self->_xpcConnection;
  }
  return v5;
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6
{
  -[NPSManager synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:](self, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:", a3, a4, a5, a6, 0);
}

void __24__NPSManager_connection__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0CB3B50];
  v3 = &unk_1EF0FEC90;
  objc_msgSend(v0, "interfaceWithProtocol:", v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)connection_remoteObjectInterface;
  connection_remoteObjectInterface = v1;

}

void __24__NPSManager_connection__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B5280000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }
}

void __24__NPSManager_connection__block_invoke_66(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  v2 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B5280000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", buf, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "internalQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__NPSManager_connection__block_invoke_67;
    block[3] = &unk_1E68E5CF0;
    v7 = v4;
    dispatch_async(v5, block);

  }
}

uint64_t __24__NPSManager_connection__block_invoke_67(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  NPSManager *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v7 = self;
    _os_log_impl(&dword_1B5280000, v3, OS_LOG_TYPE_DEFAULT, "self: (%p)", buf, 0xCu);
  }
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__NPSManager_invalidate__block_invoke;
  block[3] = &unk_1E68E5CF0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __24__NPSManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unsafe_invalidate");
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4
{
  -[NPSManager synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:](self, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:", a3, a4, 0, 0, 0);
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 cloudEnabled:(BOOL)a5
{
  -[NPSManager synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:](self, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:", a3, a4, 0, 0, a5);
}

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5
{
  -[NPSManager synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:](self, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:cloudEnabled:", a3, a4, a5, 0, 0);
}

void __90__NPSManager_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_cloudEnabled___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = a1[5];
    v7 = a1[6];
    v8 = a1[7];
    v9 = 138413314;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v3;
    _os_log_impl(&dword_1B5280000, v4, OS_LOG_TYPE_DEFAULT, "domain: (%@); keys: (%@); container: (%@); appGroupContainer: (%@) failed with error %@",
      (uint8_t *)&v9,
      0x34u);
  }

}

void __54__NPSManager_synchronizeNanoDomain_keys_cloudEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = nps_framework_log;
  if (os_log_type_enabled((os_log_t)nps_framework_log, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412802;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1B5280000, v4, OS_LOG_TYPE_DEFAULT, "synchronizeNanoDomain: (%@); keys: (%@) failed with error %@",
      (uint8_t *)&v7,
      0x20u);
  }

}

+ (BOOL)supportsWatch
{
  if (supportsWatch_onceToken != -1)
    dispatch_once(&supportsWatch_onceToken, &__block_literal_global_69);
  return supportsWatch_supportsWatch;
}

void __27__NPSManager_supportsWatch__block_invoke()
{
  char v0;
  id v1;

  if (MGGetBoolAnswer())
  {
    v1 = (id)MGGetStringAnswer();
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Watch")) & 1) != 0)
      v0 = 1;
    else
      v0 = MGGetBoolAnswer();
    supportsWatch_supportsWatch = v0;

  }
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

@end
