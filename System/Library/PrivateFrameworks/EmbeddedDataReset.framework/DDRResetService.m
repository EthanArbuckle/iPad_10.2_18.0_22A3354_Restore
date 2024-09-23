@implementation DDRResetService

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__DDRResetService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_dataResetService;
}

uint64_t __33__DDRResetService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  dispatch_queue_t v4;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_dataResetService;
  sharedInstance_dataResetService = (uint64_t)v1;

  objc_msgSend((id)sharedInstance_dataResetService, "setCurrentResetState:", 0);
  objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedInstance_dataResetService, "setObervers:", v3);

  objc_msgSend((id)sharedInstance_dataResetService, "setInvalidated:", 0);
  v4 = dispatch_queue_create("com.apple.devicedatareset.observer", 0);
  objc_msgSend((id)sharedInstance_dataResetService, "setObserverQueue:", v4);

  return objc_msgSend((id)sharedInstance_dataResetService, "setLock:", 0);
}

- (void)addOberver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  DDRResetService *v9;

  v4 = a3;
  -[DDRResetService observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__DDRResetService_addOberver___block_invoke;
  block[3] = &unk_24D0CB680;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __30__DDRResetService_addOberver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  DDRLogForCategory(3uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "obervers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    v17 = 138412802;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_213BB6000, v2, OS_LOG_TYPE_DEFAULT, "adding observer %@ to array: %@, self = %@", (uint8_t *)&v17, 0x20u);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "obervers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

    if ((v7 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "obervers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (!v9)
      {
        objc_msgSend(*(id *)(a1 + 40), "observerNonLaunchingXPCConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "remoteObjectProxy");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "connect");

      }
      objc_msgSend(*(id *)(a1 + 40), "obervers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", *(_QWORD *)(a1 + 32));

      DDRLogForCategory(3uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "obervers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = *(_QWORD *)(a1 + 40);
        v17 = 138412802;
        v18 = v14;
        v19 = 2112;
        v20 = v15;
        v21 = 2112;
        v22 = v16;
        _os_log_impl(&dword_213BB6000, v13, OS_LOG_TYPE_DEFAULT, "added observer %@ to array: %@, self = %@", (uint8_t *)&v17, 0x20u);

      }
    }
  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  DDRResetService *v9;

  v4 = a3;
  -[DDRResetService observerQueue](self, "observerQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__DDRResetService_removeObserver___block_invoke;
  block[3] = &unk_24D0CB680;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(v5, block);

}

void __34__DDRResetService_removeObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  DDRLogForCategory(3uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "obervers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v3;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_213BB6000, v2, OS_LOG_TYPE_DEFAULT, "removing observer %@ from array: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "obervers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "obervers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 40), "obervers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "invalidate");
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(v10 + 32);
      *(_QWORD *)(v10 + 32) = 0;

    }
  }
}

- (NSXPCConnection)observerNonLaunchingXPCConnection
{
  NSObject *v3;
  void *v4;
  NSXPCConnection *observerNonLaunchingXPCConnection;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  DDRLogForCategory(3uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[DDRResetService obervers](self, "obervers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_213BB6000, v3, OS_LOG_TYPE_DEFAULT, "Observer table in observerNonLaunchingXPCConnection: %@", buf, 0xCu);

  }
  observerNonLaunchingXPCConnection = self->_observerNonLaunchingXPCConnection;
  if (!observerNonLaunchingXPCConnection)
  {
    v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.devicedatareset.DeviceDataResetObservationService.NonLaunching"), 4096);
    v7 = self->_observerNonLaunchingXPCConnection;
    self->_observerNonLaunchingXPCConnection = v6;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D270E8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_observerNonLaunchingXPCConnection, "setRemoteObjectInterface:", v8);
    -[NSXPCConnection setExportedObject:](self->_observerNonLaunchingXPCConnection, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D26750);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_observerNonLaunchingXPCConnection, "setExportedInterface:", v9);

    objc_initWeak((id *)buf, self);
    v10 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __52__DDRResetService_observerNonLaunchingXPCConnection__block_invoke;
    v18[3] = &unk_24D0CB6A8;
    objc_copyWeak(&v19, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](self->_observerNonLaunchingXPCConnection, "setInvalidationHandler:", v18);
    v13 = v10;
    v14 = 3221225472;
    v15 = __52__DDRResetService_observerNonLaunchingXPCConnection__block_invoke_57;
    v16 = &unk_24D0CB6A8;
    objc_copyWeak(&v17, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](self->_observerNonLaunchingXPCConnection, "setInterruptionHandler:", &v13);
    -[NSXPCConnection _xpcConnection](self->_observerNonLaunchingXPCConnection, "_xpcConnection", v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_non_launching();

    -[NSXPCConnection resume](self->_observerNonLaunchingXPCConnection, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);

    observerNonLaunchingXPCConnection = self->_observerNonLaunchingXPCConnection;
  }
  return observerNonLaunchingXPCConnection;
}

void __52__DDRResetService_observerNonLaunchingXPCConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  DDRLogForCategory(3uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213BB6000, v2, OS_LOG_TYPE_DEFAULT, "ObserverXPCConnection invalidated at DDRResetService!", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyClientsOfResetFailedWithErrorCode:", 4099);

}

void __52__DDRResetService_observerNonLaunchingXPCConnection__block_invoke_57(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  DDRLogForCategory(3uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213BB6000, v2, OS_LOG_TYPE_DEFAULT, "ObserverXPCConnection interrupted at DDRResetService!", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyClientsOfResetFailedWithErrorCode:", 4097);

}

- (NSXPCConnection)dataResetXPCConnection
{
  NSObject *v3;
  void *v4;
  NSXPCConnection *dataResetXPCConnection;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  DDRLogForCategory(3uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[DDRResetService obervers](self, "obervers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v4;
    _os_log_impl(&dword_213BB6000, v3, OS_LOG_TYPE_DEFAULT, "Observer table in dataResetXPCConnection: %@", buf, 0xCu);

  }
  dataResetXPCConnection = self->_dataResetXPCConnection;
  if (!dataResetXPCConnection)
  {
    v6 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.devicedatareset.DeviceDataResetService"), 4096);
    v7 = self->_dataResetXPCConnection;
    self->_dataResetXPCConnection = v6;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D27148);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_resetDataWithRequest_completion_, 0, 0);

    -[NSXPCConnection setRemoteObjectInterface:](self->_dataResetXPCConnection, "setRemoteObjectInterface:", v8);
    -[NSXPCConnection setExportedObject:](self->_dataResetXPCConnection, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D26680);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_dataResetXPCConnection, "setExportedInterface:", v13);

    objc_initWeak((id *)buf, self);
    v14 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __41__DDRResetService_dataResetXPCConnection__block_invoke;
    v18[3] = &unk_24D0CB6A8;
    objc_copyWeak(&v19, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](self->_dataResetXPCConnection, "setInvalidationHandler:", v18);
    v16[0] = v14;
    v16[1] = 3221225472;
    v16[2] = __41__DDRResetService_dataResetXPCConnection__block_invoke_70;
    v16[3] = &unk_24D0CB6A8;
    objc_copyWeak(&v17, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](self->_dataResetXPCConnection, "setInterruptionHandler:", v16);
    -[NSXPCConnection resume](self->_dataResetXPCConnection, "resume");
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);

    dataResetXPCConnection = self->_dataResetXPCConnection;
  }
  return dataResetXPCConnection;
}

void __41__DDRResetService_dataResetXPCConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  DDRLogForCategory(3uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213BB6000, v2, OS_LOG_TYPE_DEFAULT, "DataResetConnection invalidated at DDRResetService!", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyClientsOfResetFailedWithErrorCode:", 4099);

}

void __41__DDRResetService_dataResetXPCConnection__block_invoke_70(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  DDRLogForCategory(3uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213BB6000, v2, OS_LOG_TYPE_DEFAULT, "DataResetConnection interrupted at DDRResetService!", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifyClientsOfResetFailedWithErrorCode:", 4097);

}

- (void)notifyClientsOfResetFailedWithErrorCode:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  NSXPCConnection *dataResetXPCConnection;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dataResetXPCConnection = self->_dataResetXPCConnection;
  self->_dataResetXPCConnection = 0;

  if (-[DDRResetService currentResetState](self, "currentResetState") == 1)
  {
    DDRLogForCategory(3uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213BB6000, v7, OS_LOG_TYPE_DEFAULT, "Notifying clients of failed reset in framework", v9, 2u);
    }

    -[DDRResetService setCurrentResetState:](self, "setCurrentResetState:", 2);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.devicedatareset.errorDomain.ddrservice"), a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDRResetService didCompleteDataResetMode:withError:completion:](self, "didCompleteDataResetMode:withError:completion:", -[DDRResetService mode](self, "mode"), v8, 0);

  }
  os_unfair_lock_unlock(p_lock);
}

- (void)resetWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  _BYTE *v25;
  uint8_t v26[4];
  void *v27;
  __int16 v28;
  DDRResetService *v29;
  _BYTE buf[24];
  __int128 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DDRResetService setMode:](self, "setMode:", objc_msgSend(v6, "mode"));
  -[DDRResetService setCurrentResetState:](self, "setCurrentResetState:", 1);
  if (-[DDRResetService mode](self, "mode"))
  {
    DDRLogForCategory(3uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v6, "mode");
      objc_msgSend(v6, "options");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hideProgress");
      objc_msgSend(v6, "options");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "eraseDataPlan");
      objc_msgSend(v6, "reason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v13;
      LOWORD(v31) = 2112;
      *(_QWORD *)((char *)&v31 + 2) = v14;
      _os_log_impl(&dword_213BB6000, v8, OS_LOG_TYPE_DEFAULT, "Reset mode: %ld, hide progress:%d, erase data plan: %d, reason: %@", buf, 0x22u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&v31 = __Block_byref_object_copy_;
    *((_QWORD *)&v31 + 1) = __Block_byref_object_dispose_;
    v32 = 0;
    -[DDRResetService dataResetXPCConnection](self, "dataResetXPCConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __47__DDRResetService_resetWithRequest_completion___block_invoke;
    v23[3] = &unk_24D0CB6D0;
    v23[4] = self;
    v25 = buf;
    v17 = v7;
    v24 = v17;
    objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18 && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      DDRLogForCategory(3uLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        -[DDRResetService obervers](self, "obervers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v26 = 138412546;
        v27 = v20;
        v28 = 2112;
        v29 = self;
        _os_log_impl(&dword_213BB6000, v19, OS_LOG_TYPE_DEFAULT, "Observer table in resetWithRequest: %@, self = %@", v26, 0x16u);

      }
      v21[0] = v16;
      v21[1] = 3221225472;
      v21[2] = __47__DDRResetService_resetWithRequest_completion___block_invoke_73;
      v21[3] = &unk_24D0CB6F8;
      v21[4] = self;
      v22 = v17;
      objc_msgSend(v18, "resetDataWithRequest:completion:", v6, v21);

    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    -[DDRResetService setCurrentResetState:](self, "setCurrentResetState:", 2);
    if (v7)
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __47__DDRResetService_resetWithRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  DDRLogForCategory(3uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_213BB6000, v5, OS_LOG_TYPE_DEFAULT, "Connection to daemon failed with error: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setCurrentResetState:", 2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);

}

void __47__DDRResetService_resetWithRequest_completion___block_invoke_73(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];

  v3 = a2;
  DDRLogForCategory(3uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_213BB6000, v4, OS_LOG_TYPE_DEFAULT, "Completed data reset", v6, 2u);
  }

  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentResetState:", 2);

}

- (void)invalidate
{
  NSObject *v3;
  NSXPCConnection *dataResetXPCConnection;
  uint8_t v5[16];

  DDRLogForCategory(3uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213BB6000, v3, OS_LOG_TYPE_DEFAULT, "Invalidate current connection to devicedataresetd", v5, 2u);
  }

  self->_invalidated = 1;
  dataResetXPCConnection = self->_dataResetXPCConnection;
  if (dataResetXPCConnection)
    -[NSXPCConnection invalidate](dataResetXPCConnection, "invalidate");
}

- (void)willBeginDataResetWithMode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  DDRLogForCategory(3uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213BB6000, v5, OS_LOG_TYPE_DEFAULT, "Broadcast willBeginDataResetWithMode to observers in framework", buf, 2u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DDRResetService obervers](self, "obervers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        DDRLogForCategory(3uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v11;
          _os_log_impl(&dword_213BB6000, v12, OS_LOG_TYPE_DEFAULT, "Data reset willbegin delegate oberver: %@", buf, 0xCu);
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          DDRLogForCategory(3uLL);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v11;
            _os_log_impl(&dword_213BB6000, v13, OS_LOG_TYPE_DEFAULT, "Oberver:%@ responds to willBeginDataResetWithMode", buf, 0xCu);
          }

          objc_msgSend(v11, "resetService:willBeginDataResetWithMode:", self, a3);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

}

- (void)didBeginDataResetWithMode:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  DDRLogForCategory(3uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213BB6000, v5, OS_LOG_TYPE_DEFAULT, "Broadcast didBeginDataResetWithMode to observers in framework", buf, 2u);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DDRResetService obervers](self, "obervers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        DDRLogForCategory(3uLL);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = v11;
          _os_log_impl(&dword_213BB6000, v12, OS_LOG_TYPE_DEFAULT, "Data reset didbegin delegate oberver: %@", buf, 0xCu);
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          DDRLogForCategory(3uLL);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v19 = v11;
            _os_log_impl(&dword_213BB6000, v13, OS_LOG_TYPE_DEFAULT, "Oberver:%@ responds to didBeginDataResetWithMode", buf, 0xCu);
          }

          objc_msgSend(v11, "resetService:didBeginDataResetWithMode:", self, a3);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

}

- (void)didCompleteDataResetMode:(int64_t)a3 withError:(id)a4 completion:(id)a5
{
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v17 = a4;
  v16 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  DDRLogForCategory(3uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213BB6000, v7, OS_LOG_TYPE_DEFAULT, "Data reset completion delegate call back in framework", buf, 2u);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[DDRResetService obervers](self, "obervers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        DDRLogForCategory(3uLL);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v12;
          _os_log_impl(&dword_213BB6000, v13, OS_LOG_TYPE_DEFAULT, "Data reset completion delegate oberver: %@", buf, 0xCu);
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          DDRLogForCategory(3uLL);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v12;
            _os_log_impl(&dword_213BB6000, v14, OS_LOG_TYPE_DEFAULT, "Oberver:%@ responds to didCompleteDataResetMode", buf, 0xCu);
          }

          ++*((_DWORD *)v26 + 6);
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __65__DDRResetService_didCompleteDataResetMode_withError_completion___block_invoke;
          v18[3] = &unk_24D0CB720;
          v20 = &v25;
          v19 = v16;
          objc_msgSend(v12, "resetService:didCompleteDataResetMode:withError:completion:", self, a3, v17, v18);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v9);
  }

  _Block_object_dispose(&v25, 8);
}

uint64_t __65__DDRResetService_didCompleteDataResetMode_withError_completion___block_invoke(uint64_t result)
{
  if (!--*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setDataResetXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_dataResetXPCConnection, a3);
}

- (void)setObserverNonLaunchingXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_observerNonLaunchingXPCConnection, a3);
}

- (int)currentResetState
{
  return self->_currentResetState;
}

- (void)setCurrentResetState:(int)a3
{
  self->_currentResetState = a3;
}

- (NSHashTable)obervers
{
  return self->_obervers;
}

- (void)setObervers:(id)a3
{
  objc_storeStrong((id *)&self->_obervers, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observerQueue, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_obervers, 0);
  objc_storeStrong((id *)&self->_observerNonLaunchingXPCConnection, 0);
  objc_storeStrong((id *)&self->_dataResetXPCConnection, 0);
}

@end
