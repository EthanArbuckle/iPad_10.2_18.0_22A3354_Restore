@implementation _CAFCarDataClientProxy

- (_CAFCarDataClientProxy)initWithCarManager:(id)a3
{
  id v4;
  _CAFCarDataClientProxy *v5;
  _CAFCarDataClientProxy *v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  uint64_t v11;
  NSXPCConnection *connection;
  NSXPCConnection *v13;
  void *v14;
  NSXPCConnection *v15;
  void *v16;
  NSXPCConnection *v17;
  uint64_t v18;
  NSXPCConnection *v19;
  NSObject *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_CAFCarDataClientProxy;
  v5 = -[_CAFCarDataClientProxy init](&v30, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_invalidatedLock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v5->_carManager, v4);
    v7 = (const char *)objc_msgSend(CFSTR("com.apple.caraccessoryframework.cardata"), "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.caraccessoryframework.cardata"), 4096);
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v11;

    v13 = v6->_connection;
    CAFCarDataClientInterface();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v13, "setExportedInterface:", v14);

    -[NSXPCConnection setExportedObject:](v6->_connection, "setExportedObject:", v6);
    v15 = v6->_connection;
    CAFCarDataServiceInterface();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v15, "setRemoteObjectInterface:", v16);

    objc_initWeak(&location, v6);
    v17 = v6->_connection;
    v18 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __45___CAFCarDataClientProxy_initWithCarManager___block_invoke;
    v27[3] = &unk_2508FE640;
    objc_copyWeak(&v28, &location);
    -[NSXPCConnection setInterruptionHandler:](v17, "setInterruptionHandler:", v27);
    v19 = v6->_connection;
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_206;
    v25[3] = &unk_2508FE640;
    objc_copyWeak(&v26, &location);
    -[NSXPCConnection setInvalidationHandler:](v19, "setInvalidationHandler:", v25);
    CAFDataClientLogging();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[_CAFCarDataClientProxy initWithCarManager:].cold.1();

    -[NSXPCConnection activate](v6->_connection, "activate");
    -[_CAFCarDataClientProxy remoteProxy](v6, "remoteProxy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __45___CAFCarDataClientProxy_initWithCarManager___block_invoke_207;
    v23[3] = &unk_2508FE668;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v21, "fetchCurrentCarConfigWithReply:", v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (CAFCarDataService)remoteProxy
{
  id v3;
  void *v4;
  id v5;

  if (-[_CAFCarDataClientProxy invalidated](self, "invalidated"))
  {
    v3 = 0;
  }
  else
  {
    -[_CAFCarDataClientProxy connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_25682EA08))
      v3 = v5;
    else
      v3 = 0;

  }
  return (CAFCarDataService *)v3;
}

- (void)didUpdateCurrentCarConfig:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[_CAFCarDataClientProxy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52___CAFCarDataClientProxy_didUpdateCurrentCarConfig___block_invoke;
  v7[3] = &unk_2508FD240;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didUpdateConfig:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[_CAFCarDataClientProxy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42___CAFCarDataClientProxy_didUpdateConfig___block_invoke;
  v7[3] = &unk_2508FD240;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)didUpdatePluginID:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[_CAFCarDataClientProxy workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51___CAFCarDataClientProxy_didUpdatePluginID_values___block_invoke;
  block[3] = &unk_2508FD358;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)didNotifyPluginID:(id)a3 instanceID:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_CAFCarDataClientProxy workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61___CAFCarDataClientProxy_didNotifyPluginID_instanceID_value___block_invoke;
  v15[3] = &unk_2508FE478;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)didRequestPluginID:(id)a3 instanceID:(id)a4 value:(id)a5 withResponse:(id)a6
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
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[_CAFCarDataClientProxy workQueue](self, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75___CAFCarDataClientProxy_didRequestPluginID_instanceID_value_withResponse___block_invoke;
  block[3] = &unk_2508FE690;
  v22 = v12;
  v23 = v13;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = v13;
  dispatch_async(v14, block);

}

- (void)invalidate
{
  os_unfair_lock_s *p_invalidatedLock;
  void *v4;

  p_invalidatedLock = &self->_invalidatedLock;
  os_unfair_lock_lock(&self->_invalidatedLock);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[_CAFCarDataClientProxy connection](self, "connection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
  os_unfair_lock_unlock(p_invalidatedLock);
}

- (BOOL)invalidated
{
  _CAFCarDataClientProxy *v2;
  os_unfair_lock_s *p_invalidatedLock;

  v2 = self;
  p_invalidatedLock = &self->_invalidatedLock;
  os_unfair_lock_lock(&self->_invalidatedLock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_invalidatedLock);
  return (char)v2;
}

- (os_unfair_lock_s)invalidatedLock
{
  return self->_invalidatedLock;
}

- (void)setInvalidatedLock:(os_unfair_lock_s)a3
{
  self->_invalidatedLock = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (CAFCarManager)carManager
{
  return (CAFCarManager *)objc_loadWeakRetained((id *)&self->_carManager);
}

- (void)setCarManager:(id)a3
{
  objc_storeWeak((id *)&self->_carManager, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (CAFCarConfiguration)currentCarConfig
{
  return self->_currentCarConfig;
}

- (void)setCurrentCarConfig:(id)a3
{
  objc_storeStrong((id *)&self->_currentCarConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCarConfig, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_carManager);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithCarManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_9_0(&dword_237717000, v0, v1, "Connecting to cafd car data service.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_15();
}

@end
