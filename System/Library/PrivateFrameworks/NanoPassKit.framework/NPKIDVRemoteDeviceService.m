@implementation NPKIDVRemoteDeviceService

- (NPKIDVRemoteDeviceService)initWithServiceName:(id)a3 delegate:(id)a4 callbackQueue:(id)a5
{
  id v8;
  id v9;
  id v10;
  NPKIDVRemoteDeviceService *v11;
  uint64_t v12;
  NSString *serviceName;
  NSMutableSet *v14;
  NSMutableSet *serviceServers;
  NSXPCListener *v16;
  NSXPCListener *xpcListener;
  NSXPCListener *v18;
  NSObject *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  NPKIDVRemoteDeviceService *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)NPKIDVRemoteDeviceService;
  v11 = -[NPKIDVRemoteDeviceService init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    serviceName = v11->_serviceName;
    v11->_serviceName = (NSString *)v12;

    objc_storeWeak((id *)&v11->_delegate, v9);
    objc_storeStrong((id *)&v11->_delegateCallBackQueue, a5);
    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    serviceServers = v11->_serviceServers;
    v11->_serviceServers = v14;

    v16 = (NSXPCListener *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", v8);
    -[NSXPCListener setDelegate:](v16, "setDelegate:", v11);
    xpcListener = v11->_xpcListener;
    v11->_xpcListener = v16;
    v18 = v16;

    -[NSXPCListener resume](v18, "resume");
    pk_Payment_log();
    v19 = objc_claimAutoreleasedReturnValue();
    LODWORD(xpcListener) = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if ((_DWORD)xpcListener)
    {
      pk_Payment_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v24 = v11;
        v25 = 2112;
        v26 = v8;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: New Remote Device service Listener created:%@ with serviceName:%@", buf, 0x16u);
      }

    }
  }

  return v11;
}

- (NPKIDVRemoteDeviceServiceDelegate)delegate
{
  NSObject *delegateCallBackQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  delegateCallBackQueue = self->_delegateCallBackQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __37__NPKIDVRemoteDeviceService_delegate__block_invoke;
  v5[3] = &unk_24CFE8318;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(delegateCallBackQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NPKIDVRemoteDeviceServiceDelegate *)v3;
}

void __37__NPKIDVRemoteDeviceService_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *delegateCallBackQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delegateCallBackQueue = self->_delegateCallBackQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__NPKIDVRemoteDeviceService_setDelegate___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateCallBackQueue, v7);

}

id __41__NPKIDVRemoteDeviceService_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)dealloc
{
  NSMutableSet *serviceServers;
  objc_super v4;

  -[NSMutableSet enumerateObjectsUsingBlock:](self->_serviceServers, "enumerateObjectsUsingBlock:", &__block_literal_global_1);
  serviceServers = self->_serviceServers;
  self->_serviceServers = 0;

  v4.receiver = self;
  v4.super_class = (Class)NPKIDVRemoteDeviceService;
  -[NPKIDVRemoteDeviceService dealloc](&v4, sel_dealloc);
}

void __36__NPKIDVRemoteDeviceService_dealloc__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

  objc_msgSend(v3, "clearConnectionReference");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSXPCListener *v6;
  NSXPCListener *v7;
  NSXPCListener *xpcListener;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int v18;
  NSXPCListener *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (NSXPCListener *)a3;
  v7 = (NSXPCListener *)a4;
  xpcListener = self->_xpcListener;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (xpcListener == v6)
  {
    v12 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Requested new connection:%@", (uint8_t *)&v18, 0xCu);
      }

    }
    -[NSXPCListener valueForEntitlement:](v7, "valueForEntitlement:", CFSTR("com.apple.NanoPassbook.IDVRemoteDeviceService.client"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (-[NSObject BOOLValue](v11, "BOOLValue") & 1) != 0)
    {
      -[NPKIDVRemoteDeviceService _addConnection:](self, "_addConnection:", v7);
      LOBYTE(self) = 1;
      goto LABEL_14;
    }
    pk_Payment_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: client doesn't have required entitlement to establish the connection", (uint8_t *)&v18, 2u);
      }

    }
LABEL_5:
    LOBYTE(self) = 0;
LABEL_14:

    goto LABEL_15;
  }
  LODWORD(self) = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

  if ((_DWORD)self)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: NPKIDVRemoteDeviceService: Unknown requested connection from listener:%@", (uint8_t *)&v18, 0xCu);
    }
    goto LABEL_5;
  }
LABEL_15:

  return (char)self;
}

- (void)_addConnection:(id)a3
{
  id v4;
  NPKIDVRemoteDeviceServiceServer *v5;
  void *v6;
  uint64_t v7;
  NPKIDVRemoteDeviceServiceServer *v8;
  NPKIDVRemoteDeviceServiceServer *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  NPKIDVRemoteDeviceServiceServer *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  NPKIDVRemoteDeviceServiceServer *v22;
  id v23;
  id v24;
  id from;
  id location;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NPKIDVRemoteDeviceServiceServer initWithConnection:delegate:]([NPKIDVRemoteDeviceServiceServer alloc], "initWithConnection:delegate:", v4, self);
  NPKIDVRemoteDeviceServiceServerProtocolInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExportedInterface:", v6);

  objc_msgSend(v4, "setExportedObject:", v5);
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  v7 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __44__NPKIDVRemoteDeviceService__addConnection___block_invoke;
  v21[3] = &unk_24CFE8380;
  objc_copyWeak(&v23, &location);
  objc_copyWeak(&v24, &from);
  v8 = v5;
  v22 = v8;
  objc_msgSend(v4, "setInvalidationHandler:", v21);
  v14 = v7;
  v15 = 3221225472;
  v16 = __44__NPKIDVRemoteDeviceService__addConnection___block_invoke_7;
  v17 = &unk_24CFE8380;
  objc_copyWeak(&v19, &location);
  objc_copyWeak(&v20, &from);
  v9 = v8;
  v18 = v9;
  objc_msgSend(v4, "setInterruptionHandler:", &v14);
  -[NPKIDVRemoteDeviceService _addServer:](self, "_addServer:", v9, v14, v15, v16, v17);
  objc_msgSend(v4, "resume");
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v4, "processIdentifier");
      *(_DWORD *)buf = 138412546;
      v28 = v4;
      v29 = 1024;
      v30 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Added new connection:{%@, PID:%d}", buf, 0x12u);
    }

  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v19);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __44__NPKIDVRemoteDeviceService__addConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "_removeServer:", *(_QWORD *)(a1 + 32));
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      v11 = 1024;
      v12 = objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@ Connection invalidated:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

void __44__NPKIDVRemoteDeviceService__addConnection___block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "_removeServer:", *(_QWORD *)(a1 + 32));
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412802;
      v8 = v3;
      v9 = 2112;
      v10 = WeakRetained;
      v11 = 1024;
      v12 = objc_msgSend(WeakRetained, "processIdentifier");
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: %@ Connection interrupted:{%@, PID:%d}", (uint8_t *)&v7, 0x1Cu);
    }

  }
}

- (void)_addServer:(id)a3
{
  if (a3)
    -[NSMutableSet addObject:](self->_serviceServers, "addObject:");
}

- (void)_removeServer:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  objc_msgSend(v5, "clearConnectionReference");
  -[NSMutableSet removeObject:](self->_serviceServers, "removeObject:", v5);

}

- (void)registerForEvents:(unint64_t)a3 withSession:(id)a4 completion:(id)a5
{
  objc_msgSend(a4, "registerForEvents:withRemoteProcessServiceName:completion:", a3, self->_serviceName, a5);
}

- (void)unregisterFromEvents:(unint64_t)a3 withSession:(id)a4 completion:(id)a5
{
  objc_msgSend(a4, "unregisterFromEvents:withRemoteProcessServiceName:completion:", a3, self->_serviceName, a5);
}

- (void)identityRemoteDeviceServiceServer:(id)a3 didReceiveEvent:(unint64_t)a4 fromRemoteDeviceWithID:(id)a5
{
  id v7;
  NSObject *delegateCallBackQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v7 = a5;
  delegateCallBackQueue = self->_delegateCallBackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__NPKIDVRemoteDeviceService_identityRemoteDeviceServiceServer_didReceiveEvent_fromRemoteDeviceWithID___block_invoke;
  block[3] = &unk_24CFE83A8;
  v11 = v7;
  v12 = a4;
  block[4] = self;
  v9 = v7;
  dispatch_async(delegateCallBackQueue, block);

}

void __102__NPKIDVRemoteDeviceService_identityRemoteDeviceServiceServer_didReceiveEvent_fromRemoteDeviceWithID___block_invoke(_QWORD *a1)
{
  id WeakRetained;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 32));
  objc_msgSend(WeakRetained, "identityRemoteDeviceService:didReceiveEvent:fromRemoteDeviceWithID:", a1[4], a1[6], a1[5]);

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_loadWeakRetained((id *)(a1[4] + 32));
      stringsArrayFromNPKIDVRemoteDeviceServiceEvents(a1[6]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = a1[5];
      v9 = 138412802;
      v10 = v6;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Did notify delegate:%@ received event: %@ from remote Device with ID:%@", (uint8_t *)&v9, 0x20u);

    }
  }
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceServers, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateCallBackQueue, 0);
}

@end
