@implementation ATServiceProxy

- (ATServiceProxy)initWithConnection:(id)a3
{
  id v4;
  ATServiceProxy *v5;
  NSXPCConnection *v6;
  void *connection;
  uint64_t v8;
  NSXPCConnection *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATServiceProxy;
  v5 = -[ATService init](&v15, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (NSXPCConnection *)v4;
      connection = v5->_connection;
      v5->_connection = v6;
    }
    else
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.atc.xpc.service"), 0);
      v9 = v5->_connection;
      v5->_connection = (NSXPCConnection *)v8;

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473AE08);
      connection = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(connection, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_service_willOpenMessageLink_completion_, 1, 0);
      -[NSXPCConnection setExportedInterface:](v5->_connection, "setExportedInterface:", connection);
      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25473AED0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BDBCF20];
      v12 = objc_opt_class();
      objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_fetchMessageLinksWithCompletion_, 0, 1);

      -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v10);
      -[NSXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v5);
      -[NSXPCConnection setInterruptionHandler:](v5->_connection, "setInterruptionHandler:", &__block_literal_global_371);
      -[NSXPCConnection setInvalidationHandler:](v5->_connection, "setInvalidationHandler:", &__block_literal_global_58);
      -[NSXPCConnection resume](v5->_connection, "resume");

    }
  }

  return v5;
}

- (void)dealloc
{
  NSXPCConnection *connection;
  objc_super v4;

  connection = self->_connection;
  if (connection)
    -[NSXPCConnection invalidate](connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)ATServiceProxy;
  -[ATServiceProxy dealloc](&v4, sel_dealloc);
}

- (ATServiceProxy)init
{
  return -[ATServiceProxy initWithConnection:](self, "initWithConnection:", 0);
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[5];

  v4 = a3;
  -[ATServiceProxy connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__ATServiceProxy_addObserver___block_invoke;
  v8[3] = &unk_24C4C9EE0;
  v8[4] = self;
  objc_msgSend(v6, "connectWithCompletion:", v8);

  v7.receiver = self;
  v7.super_class = (Class)ATServiceProxy;
  -[ATService addObserver:](&v7, sel_addObserver_, v4);

}

- (id)messageLinks
{
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSXPCConnection *connection;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[16];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__359;
  v22 = __Block_byref_object_dispose__360;
  v23 = 0;
  v3 = dispatch_semaphore_create(0);
  v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_DEFAULT, "get message links", buf, 2u);
  }

  connection = self->_connection;
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __30__ATServiceProxy_messageLinks__block_invoke;
  v15[3] = &unk_24C4C9EE0;
  v7 = v3;
  v16 = v7;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __30__ATServiceProxy_messageLinks__block_invoke_64;
  v12[3] = &unk_24C4C9D28;
  v14 = &v18;
  v9 = v7;
  v13 = v9;
  objc_msgSend(v8, "fetchMessageLinksWithCompletion:", v12);

  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (void)service:(id)a3 willOpenMessageLink:(id)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ATService observers](self, "observers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "service:willOpenMessageLink:", self, v7);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  v8[2](v8, 0);
}

- (void)service:(id)a3 willOpenMessageLink:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[ATService observers](self, "observers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "service:willOpenMessageLink:", self, v5);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

void __30__ATServiceProxy_messageLinks__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_20BB5D000, v4, OS_LOG_TYPE_ERROR, "get message links - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __30__ATServiceProxy_messageLinks__block_invoke_64(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    v10 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_20BB5D000, v10, OS_LOG_TYPE_ERROR, "failed to get message links from service. err=%{public}@", (uint8_t *)&v11, 0xCu);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a2);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __30__ATServiceProxy_addObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = 138543362;
      v6 = v4;
      _os_log_impl(&dword_20BB5D000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed to connect to remote service", (uint8_t *)&v5, 0xCu);
    }

  }
}

void __37__ATServiceProxy_initWithConnection___block_invoke_57()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20BB5D000, v0, OS_LOG_TYPE_DEFAULT, "xpc connection invalidated", v1, 2u);
  }

}

void __37__ATServiceProxy_initWithConnection___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_20BB5D000, v0, OS_LOG_TYPE_DEFAULT, "xpc connection interrupted", v1, 2u);
  }

}

@end
