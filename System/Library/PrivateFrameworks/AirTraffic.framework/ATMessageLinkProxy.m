@implementation ATMessageLinkProxy

- (ATMessageLinkProxy)initWithEndpoint:(id)a3
{
  id v5;
  ATMessageLinkProxy *v6;
  ATMessageLinkProxy *v7;
  uint64_t v8;
  NSHashTable *observers;
  uint64_t v10;
  NSMutableDictionary *requestHandlers;
  uint64_t v12;
  NSMutableSet *streams;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATMessageLinkProxy;
  v6 = -[ATMessageLink init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    v10 = objc_opt_new();
    requestHandlers = v7->_requestHandlers;
    v7->_requestHandlers = (NSMutableDictionary *)v10;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    streams = v7->_streams;
    v7->_streams = (NSMutableSet *)v12;

  }
  return v7;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)ATMessageLinkProxy;
  -[ATMessageLinkProxy dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATMessageLinkProxy identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p \"%@\" open=%d, initialized=%d, endpointType=%d>"), v5, self, v6, self->_open, self->_initialized, self->_endpointType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (ATMessageLinkProxy)initWithCoder:(id)a3
{
  id v4;
  ATMessageLinkProxy *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  NSXPCConnection *connection;
  void *v11;
  void *v12;
  NSXPCConnection *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v4 = a3;
  v5 = -[ATMessageLinkProxy initWithEndpoint:](self, "initWithEndpoint:", 0);
  if (v5)
  {
    v5->_open = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("open"));
    v5->_initialized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("initialized"));
    v5->_endpointType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("endpointType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endpoint"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v8);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v9;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473AA40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v11);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473AB20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5->_connection, "setExportedInterface:", v12);
    -[NSXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5);
    objc_initWeak(&location, v5);
    v13 = v5->_connection;
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __36__ATMessageLinkProxy_initWithCoder___block_invoke;
    v18 = &unk_24C4C9F30;
    objc_copyWeak(&v19, &location);
    -[NSXPCConnection setInvalidationHandler:](v13, "setInvalidationHandler:", &v15);
    -[NSXPCConnection resume](v5->_connection, "resume", v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSXPCListenerEndpoint *endpoint;
  id v5;

  endpoint = self->_endpoint;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", endpoint, CFSTR("endpoint"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_initialized, CFSTR("initialized"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_open, CFSTR("open"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_endpointType, CFSTR("endpointType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));

}

- (void)messageLinkWasOpened:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ATMessageLinkProxy_messageLinkWasOpened___block_invoke;
  block[3] = &unk_24C4CA300;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)messageLinkWasInitialized:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ATMessageLinkProxy_messageLinkWasInitialized___block_invoke;
  block[3] = &unk_24C4CA300;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)messageLinkWasClosed:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ATMessageLinkProxy_messageLinkWasClosed___block_invoke;
  block[3] = &unk_24C4CA300;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *requestHandlers;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  ATMessageLinkProxy *v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_requestHandlers;
  objc_sync_enter(v11);
  requestHandlers = self->_requestHandlers;
  objc_msgSend(v9, "dataClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](requestHandlers, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_get_global_queue(0, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __63__ATMessageLinkProxy_messageLink_didReceiveRequest_completion___block_invoke;
  v19[3] = &unk_24C4C99D8;
  v20 = v14;
  v21 = self;
  v22 = v9;
  v23 = v10;
  v16 = v10;
  v17 = v9;
  v18 = v14;
  dispatch_async(v15, v19);

  objc_sync_exit(v11);
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __49__ATMessageLinkProxy_sendRequest_withCompletion___block_invoke;
  v15[3] = &unk_24C4CA098;
  v9 = v6;
  v16 = v9;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __49__ATMessageLinkProxy_sendRequest_withCompletion___block_invoke_2;
  v13[3] = &unk_24C4C9A00;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "sendRequest:withCompletion:", v10, v13);

}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  id v6;
  NSXPCConnection *connection;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50__ATMessageLinkProxy_sendResponse_withCompletion___block_invoke;
  v15[3] = &unk_24C4CA098;
  v9 = v6;
  v16 = v9;
  v10 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __50__ATMessageLinkProxy_sendResponse_withCompletion___block_invoke_2;
  v13[3] = &unk_24C4CA098;
  v14 = v9;
  v12 = v9;
  objc_msgSend(v11, "sendResponse:withCompletion:", v10, v13);

}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *v5;
  dispatch_semaphore_t v6;
  NSXPCConnection *connection;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  NSObject *v13;
  _QWORD v14[5];
  NSObject *v15;

  v4 = a3;
  v5 = self->_observers;
  objc_sync_enter(v5);
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  objc_sync_exit(v5);

  v6 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __34__ATMessageLinkProxy_addObserver___block_invoke;
  v14[3] = &unk_24C4C9DC0;
  v14[4] = self;
  v9 = v6;
  v15 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __34__ATMessageLinkProxy_addObserver___block_invoke_93;
  v12[3] = &unk_24C4C9DC0;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "connectWithCompletion:", v12);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)removeObserver:(id)a3
{
  NSHashTable *v4;
  id v5;

  v5 = a3;
  v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);

}

- (void)addRequestHandler:(id)a3 forDataClass:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  dispatch_semaphore_t v9;
  NSXPCConnection *connection;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[5];
  NSObject *v16;
  _QWORD v17[5];
  NSObject *v18;

  v6 = a3;
  v7 = a4;
  v8 = self->_requestHandlers;
  objc_sync_enter(v8);
  -[NSMutableDictionary setObject:forKey:](self->_requestHandlers, "setObject:forKey:", v6, v7);
  v9 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v11 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __53__ATMessageLinkProxy_addRequestHandler_forDataClass___block_invoke;
  v17[3] = &unk_24C4C9DC0;
  v17[4] = self;
  v12 = v9;
  v18 = v12;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __53__ATMessageLinkProxy_addRequestHandler_forDataClass___block_invoke_94;
  v15[3] = &unk_24C4C9DC0;
  v15[4] = self;
  v14 = v12;
  v16 = v14;
  objc_msgSend(v13, "addRequestHandler:forDataClass:completion:", 0, v7, v15);

  dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
  objc_sync_exit(v8);

}

- (void)removeRequestHandlerForDataClass:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  dispatch_semaphore_t v6;
  NSXPCConnection *connection;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  ATMessageLinkProxy *v16;
  NSObject *v17;
  _QWORD v18[5];
  NSObject *v19;

  v4 = a3;
  v5 = self->_requestHandlers;
  objc_sync_enter(v5);
  v6 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v8 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55__ATMessageLinkProxy_removeRequestHandlerForDataClass___block_invoke;
  v18[3] = &unk_24C4C9DC0;
  v18[4] = self;
  v9 = v6;
  v19 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  v13 = 3221225472;
  v14 = __55__ATMessageLinkProxy_removeRequestHandlerForDataClass___block_invoke_95;
  v15 = &unk_24C4C9DC0;
  v16 = self;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v10, "removeRequestHandlerForDataClass:completion:", v4, &v12);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableDictionary removeObjectForKey:](self->_requestHandlers, "removeObjectForKey:", v4, v12, v13, v14, v15, v16);

  objc_sync_exit(v5);
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int)endpointType
{
  return self->_endpointType;
}

- (void)setEndpointType:(int)a3
{
  self->_endpointType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __55__ATMessageLinkProxy_removeRequestHandlerForDataClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error removing request handler. failed to connect to remote proxy with error:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__ATMessageLinkProxy_removeRequestHandlerForDataClass___block_invoke_95(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error:%{public}@ removing request handler.", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __53__ATMessageLinkProxy_addRequestHandler_forDataClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error adding request handler. failed to connect to remote proxy with error:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __53__ATMessageLinkProxy_addRequestHandler_forDataClass___block_invoke_94(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error:%{public}@ adding request handler.", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __34__ATMessageLinkProxy_addObserver___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138543618;
    v7 = v5;
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error adding observer. failed to connect to remote proxy with error:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __34__ATMessageLinkProxy_addObserver___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138543618;
      v7 = v5;
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error:%{public}@ adding observer.", (uint8_t *)&v6, 0x16u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __50__ATMessageLinkProxy_sendResponse_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __50__ATMessageLinkProxy_sendResponse_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __49__ATMessageLinkProxy_sendRequest_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __49__ATMessageLinkProxy_sendRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __63__ATMessageLinkProxy_messageLink_didReceiveRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "messageLink:didReceiveRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "dataStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "dataStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "streamStatus");

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __43__ATMessageLinkProxy_messageLinkWasClosed___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 48))
  {
    v3 = *(id *)(v1 + 24);
    objc_sync_enter(v3);
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v8, "messageLinkWasClosed:", *(_QWORD *)(a1 + 32), (_QWORD)v9);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    objc_sync_exit(v3);

  }
}

void __48__ATMessageLinkProxy_messageLinkWasInitialized___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 1;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  objc_sync_enter(v2);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "messageLinkWasInitialized:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

void __43__ATMessageLinkProxy_messageLinkWasOpened___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  objc_sync_enter(v2);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "messageLinkWasOpened:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

void __36__ATMessageLinkProxy_initWithCoder___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "messageLinkWasClosed:", 0);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
