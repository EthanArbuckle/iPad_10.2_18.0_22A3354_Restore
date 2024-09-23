@implementation ATXPCServer

- (id)_connections
{
  NSMutableSet *connections;
  NSMutableSet *v4;
  NSMutableSet *v5;

  connections = self->_connections;
  if (!connections)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v5 = self->_connections;
    self->_connections = v4;

    connections = self->_connections;
  }
  return connections;
}

- (id)_highAvailabilityQueue
{
  void *v2;
  id v3;

  v2 = (void *)MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC9B8];
  return v2;
}

- (id)_handlerForMessageName:(id)a3
{
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->_handlerMap, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = (void *)MEMORY[0x20BD3C8B4](self->_defaultMessageHandler);
  v5 = (void *)MEMORY[0x20BD3C8B4](v4);

  return v5;
}

- (void)_handleNewConnection:(id)a3
{
  id v4;
  ATXPCConnection *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id from;
  id location;

  v4 = a3;
  -[ATXPCServer _resetMessageFlag](self, "_resetMessageFlag");
  objc_initWeak(&location, self);
  v5 = -[ATXPCConnection initWithXPCConnection:]([ATXPCConnection alloc], "initWithXPCConnection:", v4);
  objc_initWeak(&from, v5);
  -[ATXPCServer _connections](self, "_connections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  v7 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __36__ATXPCServer__handleNewConnection___block_invoke;
  v14[3] = &unk_24C4CA3A0;
  objc_copyWeak(&v15, &location);
  objc_copyWeak(&v16, &from);
  -[ATXPCConnection setMessageHandler:](v5, "setMessageHandler:", v14);
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __36__ATXPCServer__handleNewConnection___block_invoke_2;
  v11[3] = &unk_24C4CA3C8;
  objc_copyWeak(&v12, &location);
  objc_copyWeak(&v13, &from);
  -[ATXPCConnection setDisconnectHandler:](v5, "setDisconnectHandler:", v11);
  v8[0] = v7;
  v8[1] = 3221225472;
  v8[2] = __36__ATXPCServer__handleNewConnection___block_invoke_3;
  v8[3] = &unk_24C4CA3F0;
  objc_copyWeak(&v9, &location);
  objc_copyWeak(&v10, &from);
  -[ATXPCConnection setLockdownHandler:](v5, "setLockdownHandler:", v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

- (id)initListenerWithServiceName:(id)a3
{
  id v4;
  ATXPCServer *v5;
  const char *v6;
  NSObject *v7;
  xpc_connection_t mach_service;
  OS_xpc_object *conn;
  ATXPCServer *v10;
  _xpc_connection_s *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *timerQueue;
  _QWORD handler[5];
  _QWORD v16[5];
  ATXPCServer *v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXPCServer;
  v5 = -[ATXPCServer init](&v18, sel_init);
  if (v5)
  {
    v6 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    -[ATXPCServer _highAvailabilityQueue](v5, "_highAvailabilityQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service(v6, v7, 1uLL);
    conn = v5->_conn;
    v5->_conn = mach_service;

    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__1545;
    v16[4] = __Block_byref_object_dispose__1546;
    v10 = v5;
    v17 = v10;
    v11 = v5->_conn;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __43__ATXPCServer_initListenerWithServiceName___block_invoke;
    handler[3] = &unk_24C4CA328;
    handler[4] = v16;
    xpc_connection_set_event_handler(v11, handler);
    xpc_connection_resume(v5->_conn);
    v12 = dispatch_queue_create("idle_timer", 0);
    timerQueue = v10->_timerQueue;
    v10->_timerQueue = (OS_dispatch_queue *)v12;

    _Block_object_dispose(v16, 8);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ATXPCServer;
  -[ATXPCServer dealloc](&v2, sel_dealloc);
}

- (void)setHandlerForMessageName:(id)a3 handler:(id)a4
{
  id v6;
  NSMutableDictionary *handlerMap;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    handlerMap = self->_handlerMap;
    if (!handlerMap)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v9 = self->_handlerMap;
      self->_handlerMap = v8;

      handlerMap = self->_handlerMap;
    }
    v10 = (void *)objc_msgSend(v6, "copy");
    -[NSMutableDictionary setObject:forKey:](handlerMap, "setObject:forKey:", v10, v11);

  }
  else
  {
    -[ATXPCServer setDefaultMessageHandler:](self, "setDefaultMessageHandler:", v6);
  }

}

- (void)_runShutdownHandler
{
  void (**shutdownHandler)(void);

  shutdownHandler = (void (**)(void))self->_shutdownHandler;
  if (shutdownHandler)
    shutdownHandler[2]();
}

- (void)_resetMessageFlag
{
  NSObject *timerQueue;
  _QWORD block[5];

  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__ATXPCServer__resetMessageFlag__block_invoke;
  block[3] = &unk_24C4CA300;
  block[4] = self;
  dispatch_async(timerQueue, block);
}

- (BOOL)_doingWork
{
  NSMutableSet *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_connections;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "_outstandingMessages", (_QWORD)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_rescheduleIdleTimerSourceWithInterval:(double)a3
{
  NSObject *idleTimerSource;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  _QWORD handler[5];

  idleTimerSource = self->_idleTimerSource;
  if (idleTimerSource)
  {
    dispatch_source_cancel(idleTimerSource);
    v6 = self->_idleTimerSource;
    self->_idleTimerSource = 0;

  }
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_timerQueue);
  v8 = self->_idleTimerSource;
  self->_idleTimerSource = v7;

  dispatch_source_set_timer((dispatch_source_t)self->_idleTimerSource, 0, 1000000000 * (unint64_t)a3, 0);
  v9 = self->_idleTimerSource;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __54__ATXPCServer__rescheduleIdleTimerSourceWithInterval___block_invoke;
  handler[3] = &unk_24C4CA300;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_idleTimerSource);
}

- (void)setIdleTimerInterval:(double)a3
{
  NSObject *timerQueue;
  _QWORD v4[6];

  timerQueue = self->_timerQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__ATXPCServer_setIdleTimerInterval___block_invoke;
  v4[3] = &unk_24C4CA418;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(timerQueue, v4);
}

- (NSSet)connections
{
  return &self->_connections->super;
}

- (id)lockdownHandler
{
  return self->_lockdownHandler;
}

- (void)setLockdownHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)defaultMessageHandler
{
  return self->_defaultMessageHandler;
}

- (void)setDefaultMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDisconnectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)shutdownHandler
{
  return self->_shutdownHandler;
}

- (void)setShutdownHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerSource, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong(&self->_defaultMessageHandler, 0);
  objc_storeStrong(&self->_shutdownHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_lockdownHandler, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

uint64_t __36__ATXPCServer_setIdleTimerInterval___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescheduleIdleTimerSourceWithInterval:", *(double *)(a1 + 40));
}

void __54__ATXPCServer__rescheduleIdleTimerSourceWithInterval___block_invoke(uint64_t a1)
{
  char v2;
  char v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_doingWork");
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 80) && (v2 & 1) == 0)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v4 + 72));
    v4 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v4 + 80) = v3 ^ 1;
}

uint64_t __32__ATXPCServer__resetMessageFlag__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = 0;
  return result;
}

void __43__ATXPCServer_initListenerWithServiceName___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = MEMORY[0x20BD3CAB8]();
  if (v4 == MEMORY[0x24BDACF88])
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_handleNewConnection:", v3);
  }
  else
  {
    v5 = v4;
    v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v8 = 138543618;
      v9 = v7;
      v10 = 2080;
      v11 = _StringForXPCType(v5);
      _os_log_impl(&dword_20BB5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);
    }

  }
}

void __36__ATXPCServer__handleNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resetMessageFlag");
  objc_msgSend(v7, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handlerForMessageName:", v4);
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    ((void (**)(_QWORD, id, id))v5)[2](v5, v6, v7);

  }
}

void __36__ATXPCServer__handleNewConnection___block_invoke_2(uint64_t a1)
{
  id v2;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "disconnectHandler");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(WeakRetained, "_connections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v2);

  }
  if (v3)
    ((void (**)(_QWORD, id))v3)[2](v3, v2);

}

void __36__ATXPCServer__handleNewConnection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;
  void (**v6)(id, id, _QWORD);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "lockdownHandler");
  v6 = (void (**)(id, id, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6[2](v6, v5, a2);

  }
}

@end
