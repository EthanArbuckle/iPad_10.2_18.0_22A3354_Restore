@implementation FSAgentClient

- (void)setupHandlers
{
  NSXPCConnection *conn;
  uint64_t v4;
  NSXPCConnection *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  conn = self->_conn;
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__FSAgentClient_setupHandlers__block_invoke;
  v8[3] = &unk_250C31E00;
  objc_copyWeak(&v9, &location);
  -[NSXPCConnection setInterruptionHandler:](conn, "setInterruptionHandler:", v8);
  v5 = self->_conn;
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __30__FSAgentClient_setupHandlers__block_invoke_3;
  v6[3] = &unk_250C31E00;
  objc_copyWeak(&v7, &location);
  -[NSXPCConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __30__FSAgentClient_setupHandlers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_get_global_queue(2, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__FSAgentClient_setupHandlers__block_invoke_2;
    block[3] = &unk_250C32490;
    block[4] = WeakRetained;
    dispatch_async(v2, block);

  }
}

uint64_t __30__FSAgentClient_setupHandlers__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInvalidated");
}

void __30__FSAgentClient_setupHandlers__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_get_global_queue(2, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __30__FSAgentClient_setupHandlers__block_invoke_4;
    block[3] = &unk_250C32490;
    block[4] = WeakRetained;
    dispatch_async(v2, block);

  }
}

uint64_t __30__FSAgentClient_setupHandlers__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInvalidated");
}

- (void)handleInvalidated
{
  FSAgentClient *v2;
  id interruptionHandler;
  void *v4;
  id v5;

  v2 = self;
  objc_sync_enter(v2);
  v5 = _Block_copy(v2->_interruptionHandler);
  interruptionHandler = v2->_interruptionHandler;
  v2->_interruptionHandler = 0;

  objc_sync_exit(v2);
  v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    v4 = v5;
  }

}

- (id)initToUser:(unsigned int)a3
{
  NSObject *v4;

  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[FSAgentClient initToUser:].cold.1(v4);

  return 0;
}

- (void)dealloc
{
  NSXPCConnection *conn;
  NSXPCConnection *v4;
  objc_super v5;

  conn = self->_conn;
  if (conn)
  {
    -[NSXPCConnection invalidate](conn, "invalidate");
    v4 = self->_conn;
    self->_conn = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)FSAgentClient;
  -[FSAgentClient dealloc](&v5, sel_dealloc);
}

- (void)setInstanceDeathHandler:(id)a3
{
  void *v4;
  id instanceDeathHandler;
  id v6;

  v6 = a3;
  v4 = _Block_copy(v6);
  instanceDeathHandler = self->_instanceDeathHandler;
  self->_instanceDeathHandler = v4;

  -[FSAgentClientDelegate setInstanceDeathHandler:](self->_delegate, "setInstanceDeathHandler:", v6);
}

- (void)installedExtensions:(id)a3
{
  id v4;
  NSXPCConnection *conn;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  conn = self->_conn;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __37__FSAgentClient_installedExtensions___block_invoke;
  v8[3] = &unk_250C31EC8;
  v9 = v4;
  v6 = v4;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "installedExtensions:", v6);

}

uint64_t __37__FSAgentClient_installedExtensions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startExtension:(id)a3 instanceID:(id)a4 replyHandler:(id)a5
{
  id v8;
  NSXPCConnection *conn;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  conn = self->_conn;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __56__FSAgentClient_startExtension_instanceID_replyHandler___block_invoke;
  v14[3] = &unk_250C31EC8;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startExtension:instanceID:replyHandler:", v12, v11, v10);

}

uint64_t __56__FSAgentClient_startExtension_instanceID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getNSXPCListenerEndpoint:(id)a3 instanceID:(id)a4 replyHandler:(id)a5
{
  id v8;
  NSXPCConnection *conn;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  conn = self->_conn;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __66__FSAgentClient_getNSXPCListenerEndpoint_instanceID_replyHandler___block_invoke;
  v14[3] = &unk_250C31EC8;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "getNSXPCListenerEndpoint:instanceID:replyHandler:", v12, v11, v10);

}

uint64_t __66__FSAgentClient_getNSXPCListenerEndpoint_instanceID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopExtension:(id)a3 instanceID:(id)a4 replyHandler:(id)a5
{
  id v8;
  NSXPCConnection *conn;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  conn = self->_conn;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __55__FSAgentClient_stopExtension_instanceID_replyHandler___block_invoke;
  v14[3] = &unk_250C31EC8;
  v15 = v8;
  v10 = v8;
  v11 = a4;
  v12 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stopExtension:instanceID:replyHandler:", v12, v11, v10);

}

uint64_t __55__FSAgentClient_stopExtension_instanceID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setEnabledState:(id)a3 newState:(BOOL)a4 replyHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  NSXPCConnection *conn;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v5 = a4;
  v8 = a5;
  conn = self->_conn;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __55__FSAgentClient_setEnabledState_newState_replyHandler___block_invoke;
  v13[3] = &unk_250C31EC8;
  v14 = v8;
  v10 = v8;
  v11 = a3;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](conn, "remoteObjectProxyWithErrorHandler:", v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabledState:newState:replyHandler:", v11, v5, v10);

}

uint64_t __55__FSAgentClient_setEnabledState_newState_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)interruptionHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (id)instanceDeathHandler
{
  return self->_instanceDeathHandler;
}

- (NSXPCConnection)conn
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConn:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (FSAgentClientDelegate)delegate
{
  return (FSAgentClientDelegate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_conn, 0);
  objc_storeStrong(&self->_instanceDeathHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
}

- (void)initToUser:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_23B2A6000, log, OS_LOG_TYPE_FAULT, "Initialization of FSAgentClient on iOS", v1, 2u);
}

@end
