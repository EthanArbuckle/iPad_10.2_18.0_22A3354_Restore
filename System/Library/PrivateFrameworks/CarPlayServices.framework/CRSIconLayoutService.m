@implementation CRSIconLayoutService

- (CRSIconLayoutService)initWithDelegate:(id)a3
{
  id v4;
  CRSIconLayoutService *v5;
  CRSIconLayoutService *v6;
  void *v7;
  uint64_t v8;
  OS_dispatch_queue *connectionQueue;
  uint64_t v10;
  NSHashTable *connections;
  void *v12;
  id *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  id *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRSIconLayoutService;
  v5 = -[CRSIconLayoutService init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = BSDispatchQueueCreate();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v10 = objc_claimAutoreleasedReturnValue();
    connections = v6->_connections;
    v6->_connections = (NSHashTable *)v10;

    v12 = (void *)MEMORY[0x24BE0FA28];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __41__CRSIconLayoutService_initWithDelegate___block_invoke;
    v19[3] = &unk_24CD388E8;
    v13 = v6;
    v20 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v19);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v13[2];
    v13[2] = (id)v14;

    CRSLogForCategory(1uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = v13[2];
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_212138000, v16, OS_LOG_TYPE_INFO, "Activating listener! %@", buf, 0xCu);
    }

    objc_msgSend(v13[2], "activate");
  }

  return v6;
}

void __41__CRSIconLayoutService_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.CarPlay"));
  +[CRSIconLayoutServiceSpecification identifier](CRSIconLayoutServiceSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)invalidate
{
  -[BSServiceConnectionListener invalidate](self->_listener, "invalidate");
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CRSLogForCategory(1uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_212138000, v7, OS_LOG_TYPE_INFO, "Received connection! %@", buf, 0xCu);
  }

  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.private.CarPlayServices.icon-layout"));

  if ((v9 & 1) != 0)
  {
    v10 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke;
    v16[3] = &unk_24CD38938;
    v16[4] = self;
    objc_msgSend(v6, "configureConnection:", v16);
    CRSLogForCategory(1uLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl(&dword_212138000, v11, OS_LOG_TYPE_INFO, "Activating connection... %@", buf, 0xCu);
    }

    -[CRSIconLayoutService connectionQueue](self, "connectionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke_13;
    block[3] = &unk_24CD38960;
    block[4] = self;
    v15 = v6;
    dispatch_async(v12, block);

  }
  else
  {
    CRSLogForCategory(1uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CRSIconLayoutService listener:didReceiveConnection:withContext:].cold.1(v6, v13);

    objc_msgSend(v6, "invalidate");
  }

}

void __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  +[CRSIconLayoutServiceSpecification serviceQuality](CRSIconLayoutServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSIconLayoutServiceSpecification interface](CRSIconLayoutServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_24CD38910;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v6);

}

void __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CRSLogForCategory(1uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_212138000, v4, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke_13(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 40), "activate");
}

- (void)fetchIconStateForVehicleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CRSIconLayoutService *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CRSLogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v6;
    _os_log_impl(&dword_212138000, v8, OS_LOG_TYPE_DEFAULT, "Received request for icon state for vehicle: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__CRSIconLayoutService_fetchIconStateForVehicleID_completion___block_invoke;
  block[3] = &unk_24CD38988;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __62__CRSIconLayoutService_fetchIconStateForVehicleID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "iconLayoutService:dataProviderForVehicleID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "getIconStateWithCompletion:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (!v3)
      return;
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "_newInvalidRequestErrorDueToNilVehicleID");
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

- (void)setIconState:(id)a3 forVehicleID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CRSLogForCategory(1uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v7;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_212138000, v8, OS_LOG_TYPE_DEFAULT, "Received request to set icon state for vehicle: %{public}@ to %@", buf, 0x16u);
  }

  if (v7)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__CRSIconLayoutService_setIconState_forVehicleID___block_invoke;
    block[3] = &unk_24CD389B0;
    block[4] = self;
    v18 = v7;
    v19 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    CRSLogForCategory(1uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CRSIconLayoutService setIconState:forVehicleID:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

void __50__CRSIconLayoutService_setIconState_forVehicleID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconLayoutService:dataProviderForVehicleID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIconState:", *(_QWORD *)(a1 + 48));
}

- (void)resetIconStateForVehicleID:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CRSLogForCategory(1uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v4;
    _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Received request to reset icon state for vehicle: %{public}@", buf, 0xCu);
  }

  if (v4)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __51__CRSIconLayoutService_resetIconStateForVehicleID___block_invoke;
    v14[3] = &unk_24CD38960;
    v14[4] = self;
    v15 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v14);

  }
  else
  {
    CRSLogForCategory(1uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CRSIconLayoutService resetIconStateForVehicleID:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  }
}

void __51__CRSIconLayoutService_resetIconStateForVehicleID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconLayoutService:dataProviderForVehicleID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "resetIconState");
}

- (void)fetchApplicationIconInformationForBundleIdentifier:(id)a3 vehicleID:(id)a4 drawBorder:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  CRSIconLayoutService *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  CRSLogForCategory(1uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_212138000, v14, OS_LOG_TYPE_DEFAULT, "Received request for icon information for %{public}@, vehicle: %{public}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__CRSIconLayoutService_fetchApplicationIconInformationForBundleIdentifier_vehicleID_drawBorder_completion___block_invoke;
  block[3] = &unk_24CD389D8;
  v23 = v12;
  v24 = v13;
  v20 = v11;
  v21 = self;
  v22 = v10;
  v15 = v12;
  v16 = v10;
  v17 = v13;
  v18 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __107__CRSIconLayoutService_fetchApplicationIconInformationForBundleIdentifier_vehicleID_drawBorder_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "iconLayoutService:dataProviderForVehicleID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "getApplicationIconInformationForBundleID:drawBorder:completion:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "BOOLValue"), *(_QWORD *)(a1 + 64));
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 64);
    if (!v3)
      return;
    v4 = (id)objc_msgSend(*(id *)(a1 + 40), "_newInvalidRequestErrorDueToNilVehicleID");
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[CRSIconLayoutService connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[CRSIconLayoutService temporaryWatchdogMonitoringAssertion](self, "temporaryWatchdogMonitoringAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BE38120], "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assertWatchdogEnabledForLimitedDurationForReason:", CFSTR("CarPlayIconLayoutService"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRSIconLayoutService setTemporaryWatchdogMonitoringAssertion:](self, "setTemporaryWatchdogMonitoringAssertion:", v7);

  }
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[CRSIconLayoutService connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[CRSIconLayoutService connections](self, "connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    -[CRSIconLayoutService temporaryWatchdogMonitoringAssertion](self, "temporaryWatchdogMonitoringAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[CRSIconLayoutService setTemporaryWatchdogMonitoringAssertion:](self, "setTemporaryWatchdogMonitoringAssertion:", 0);
  }
}

- (id)_newInvalidRequestErrorDueToNilVehicleID
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = CRSIconLayoutServiceErrorDomain;
  v7 = *MEMORY[0x24BDD0FC8];
  v8[0] = CFSTR("Invalid request for a nil vehicle ID");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CRSIconLayoutServiceDelegate)delegate
{
  return (CRSIconLayoutServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (NSHashTable)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (BSInvalidatable)temporaryWatchdogMonitoringAssertion
{
  return self->_temporaryWatchdogMonitoringAssertion;
}

- (void)setTemporaryWatchdogMonitoringAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryWatchdogMonitoringAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryWatchdogMonitoringAssertion, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_212138000, a2, OS_LOG_TYPE_ERROR, "Process does not have the required entitlement: %@", (uint8_t *)&v4, 0xCu);

}

- (void)setIconState:(uint64_t)a3 forVehicleID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_212138000, a1, a3, "Invalid request to set icon state for nil vehicle ID", a5, a6, a7, a8, 0);
}

- (void)resetIconStateForVehicleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_212138000, a1, a3, "Invalid request to reset icon state for nil vehicle ID", a5, a6, a7, a8, 0);
}

@end
