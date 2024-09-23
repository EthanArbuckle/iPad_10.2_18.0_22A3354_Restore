@implementation ITIdleTimerStateServer

- (void)addIdleTimerServiceConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSMutableDictionary *clientTargetsByConfigIdentifier;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[ITIdleTimerStateServer _hasIdleTimerServicesEntitlementForProcess:missingEntitlementError:](self, "_hasIdleTimerServicesEntitlementForProcess:missingEntitlementError:", v11, a5))
  {
    ITLogIdleTimer();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v22;
      v27 = 2114;
      v28 = v11;
      v29 = 2114;
      v30 = v8;
      _os_log_error_impl(&dword_2063D2000, v14, OS_LOG_TYPE_ERROR, "%{public}@ - Missing entitlement. Rejecting unauthorized access from %{public}@ to add a configuration: %{public}@.", buf, 0x20u);

    }
    goto LABEL_7;
  }
  -[ITIdleTimerStateServer delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "addIdleTimerConfiguration:fromProcess:forReason:", v8, v11, v9);

  if (v13)
  {
    if (objc_msgSend(v8, "_idleEventMask"))
    {
      objc_msgSend(v8, "_identifier");
      v14 = objc_claimAutoreleasedReturnValue();
      clientTargetsByConfigIdentifier = self->_clientTargetsByConfigIdentifier;
      objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "remoteTarget");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](clientTargetsByConfigIdentifier, "setObject:forKey:", v17, v14);

LABEL_7:
    }
  }
  else if (a5)
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v8, "description", CFSTR("ITIdleTimerServicesErrorConfigurationDescriptionKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = CFSTR("ITIdleTimerServicesErrorReasonKey");
    v24[0] = v19;
    v24[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("ITIdleTimerConfigurationErrorDomain"), 3, v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (ITIdleTimerStateServerDelegate)delegate
{
  return (ITIdleTimerStateServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_hasIdleTimerServicesEntitlementForProcess:(id)a3 missingEntitlementError:(id *)a4
{
  char v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "hasEntitlement:", CFSTR("com.apple.idle-timer-services"));
  v6 = v5;
  if (a4 && (v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing <%@> Entitlement"), CFSTR("com.apple.idle-timer-services"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BDD0FD8];
    v12[0] = *MEMORY[0x24BDD0FC8];
    v12[1] = v9;
    v13[0] = v7;
    v13[1] = CFSTR("Missing Entitlement");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("ITIdleTimerConfigurationErrorDomain"), 2, v10);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (ITIdleTimerStateServer)initWithCalloutQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  ITIdleTimerStateServer *v9;
  ITIdleTimerStateServer *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *clientTargetsByConfigIdentifier;
  NSMutableSet *v13;
  NSMutableSet *connections;
  void *v15;
  id *v16;
  uint64_t v17;
  id v18;
  _QWORD v20[4];
  id *v21;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ITIdleTimerStateServer;
  v9 = -[ITIdleTimerStateServer init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_accessLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_calloutQueue, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clientTargetsByConfigIdentifier = v10->_clientTargetsByConfigIdentifier;
    v10->_clientTargetsByConfigIdentifier = v11;

    v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    connections = v10->_connections;
    v10->_connections = v13;

    v15 = (void *)MEMORY[0x24BE0FA28];
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __56__ITIdleTimerStateServer_initWithCalloutQueue_delegate___block_invoke;
    v20[3] = &unk_24BF08AB0;
    v16 = v10;
    v21 = v16;
    objc_msgSend(v15, "listenerWithConfigurator:", v20);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v16[3];
    v16[3] = (id)v17;

    objc_msgSend(v16[3], "activate");
  }

  return v10;
}

void __56__ITIdleTimerStateServer_initWithCalloutQueue_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("com.apple.frontboard"));
  objc_msgSend(v3, "setService:", CFSTR("com.apple.idletimer-service"));
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (BOOL)clientConfiguration:(id)a3 handleIdleEvent:(unint64_t)a4
{
  id v6;
  void *v7;
  os_unfair_lock_s *p_accessLock;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  BSDispatchQueueAssert();
  objc_msgSend(v6, "_identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  p_accessLock = &self->_accessLock;
  os_unfair_lock_assert_not_owner(&self->_accessLock);
  os_unfair_lock_lock(&self->_accessLock);
  -[NSMutableDictionary objectForKey:](self->_clientTargetsByConfigIdentifier, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_accessLock);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "handleIdleEvent:usingConfigurationWithIdentifier:", v10, v7);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isIdleTimerServiceAvailableWithError:(id *)a3
{
  return 1;
}

- (void)removeIdleTimerServiceConfiguration:(id)a3 forReason:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BE0FA00], "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteProcess");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[ITIdleTimerStateServer _hasIdleTimerServicesEntitlementForProcess:missingEntitlementError:](self, "_hasIdleTimerServicesEntitlementForProcess:missingEntitlementError:", v11, a5))
  {
    -[ITIdleTimerStateServer delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeIdleTimerConfigurationFromProcess:forReason:", v11, v9);

    objc_msgSend(v8, "_identifier");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](self->_clientTargetsByConfigIdentifier, "removeObjectForKey:", v13);
  }
  else
  {
    ITLogIdleTimer();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v15;
      v18 = 2114;
      v19 = v11;
      v20 = 2114;
      v21 = v8;
      _os_log_error_impl(&dword_2063D2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ - Missing entitlement. Rejecting unauthorized access from %{public}@ to remove a configuration: %{public}@.", (uint8_t *)&v16, 0x20u);

    }
  }

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  ITIdleTimerStateServer *v13;
  int v14;

  v6 = a4;
  objc_msgSend(v6, "remoteProcess");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "pid");
  ITLogIdleTimer();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ITIdleTimerStateServer listener:didReceiveConnection:withContext:].cold.2((uint64_t)v6, v8, v9);

  if (v8 <= 0)
  {
    ITLogIdleTimer();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ITIdleTimerStateServer listener:didReceiveConnection:withContext:].cold.1((uint64_t)v6, v8, v10);

    objc_msgSend(v6, "invalidate");
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke;
    v11[3] = &unk_24BF08B00;
    v14 = v8;
    v12 = v7;
    v13 = self;
    objc_msgSend(v6, "configureConnection:", v11);
    -[ITIdleTimerStateServer _addConnection:](self, "_addConnection:", v6);
    objc_msgSend(v6, "activate");

  }
}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ITLogIdleTimer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 138543618;
    v21 = v5;
    v22 = 1024;
    v23 = v6;
    _os_log_impl(&dword_2063D2000, v4, OS_LOG_TYPE_DEFAULT, "configuring connection from client bundleID: %{public}@, pid:%d", buf, 0x12u);

  }
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2544F67F8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2544F6BA0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0FA30], "interfaceWithServer:client:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0FA38], "utility");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v10);

  objc_msgSend(v3, "setInterface:", v9);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v11 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_62;
  v16[3] = &unk_24BF08AD8;
  v17 = *(id *)(a1 + 32);
  v19 = *(_DWORD *)(a1 + 48);
  objc_copyWeak(&v18, (id *)buf);
  objc_msgSend(v3, "setInterruptionHandler:", v16);
  v12[0] = v11;
  v12[1] = 3221225472;
  v12[2] = __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_64;
  v12[3] = &unk_24BF08AD8;
  v13 = *(id *)(a1 + 32);
  v15 = *(_DWORD *)(a1 + 48);
  objc_copyWeak(&v14, (id *)buf);
  objc_msgSend(v3, "setInvalidationHandler:", v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);

}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_62(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;

  ITLogIdleTimer();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_62_cold_1(a1, v2);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientDidDisconnect:", *(_QWORD *)(a1 + 32));

  }
}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;

  v3 = a2;
  ITLogIdleTimer();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_64_cold_1(a1, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientDidDisconnect:", *(_QWORD *)(a1 + 32));

    objc_msgSend(v6, "_removeConnection:", v3);
  }

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
  objc_storeStrong((id *)&self->_clientTargetsByConfigIdentifier, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(int)a2 withContext:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2114;
  v5 = a1;
  OUTLINED_FUNCTION_0(&dword_2063D2000, a3, (uint64_t)a3, "dropping connection with junk pid (%d) -- %{public}@, ", (uint8_t *)v3);
}

- (void)listener:(uint64_t)a1 didReceiveConnection:(int)a2 withContext:(os_log_t)log .cold.2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_debug_impl(&dword_2063D2000, log, OS_LOG_TYPE_DEBUG, "got a connection! -- %{public}@ pid:%d", (uint8_t *)&v3, 0x12u);
}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_62_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2063D2000, a2, v4, "interrupted connection from client bundleID: %{public}@, pid:%d", v5);

  OUTLINED_FUNCTION_2();
}

void __68__ITIdleTimerStateServer_listener_didReceiveConnection_withContext___block_invoke_64_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2063D2000, a2, v4, "invalidated connection from client bundleID: %{public}@, pid:%d", v5);

  OUTLINED_FUNCTION_2();
}

@end
