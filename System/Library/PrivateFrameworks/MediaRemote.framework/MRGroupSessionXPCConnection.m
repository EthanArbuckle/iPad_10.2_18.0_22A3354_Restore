@implementation MRGroupSessionXPCConnection

- (MRGroupSessionXPCConnection)initWithClientObject:(id)a3 invalidationHandler:(id)a4
{
  id v7;
  id v8;
  MRGroupSessionXPCConnection *v9;
  MRGroupSessionXPCConnection *v10;
  uint64_t v11;
  id invalidationHandler;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  NSObject *v17;
  _QWORD block[4];
  MRGroupSessionXPCConnection *v20;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)MRGroupSessionXPCConnection;
  v9 = -[MRGroupSessionXPCConnection init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientObject, a3);
    v11 = MEMORY[0x194036C44](v8);
    invalidationHandler = v10->_invalidationHandler;
    v10->_invalidationHandler = (id)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    MRGroupSessionSubsystemGetQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create_with_target_V2("com.apple.MRDGroupSessionClient.queue", v13, v14);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    v17 = v10->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__MRGroupSessionXPCConnection_initWithClientObject_invalidationHandler___block_invoke;
    block[3] = &unk_1E30C5CA8;
    v20 = v10;
    dispatch_async(v17, block);

  }
  return v10;
}

uint64_t __72__MRGroupSessionXPCConnection_initWithClientObject_invalidationHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "initializeConnection");
}

- (void)dealloc
{
  id invalidationHandler;
  objc_super v4;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)MRGroupSessionXPCConnection;
  -[MRGroupSessionXPCConnection dealloc](&v4, sel_dealloc);
}

- (void)initializeConnection
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "[MRGroupSessionXPCConnection] <%p> Received nil XPC endpoint. Failing.", (uint8_t *)&v2, 0xCu);
}

void __51__MRGroupSessionXPCConnection_initializeConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _MRLogForCategory(0xCuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = WeakRetained;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionXPCConnection] <%p> XPC interrupted.", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "connection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

  }
}

void __51__MRGroupSessionXPCConnection_initializeConnection__block_invoke_58(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void (**v3)(void);
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _MRLogForCategory(0xCuLL);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 134217984;
      v5 = WeakRetained;
      _os_log_impl(&dword_193827000, v2, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionXPCConnection] <%p> XPC invalidated.", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(WeakRetained, "invalidationHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (id)server
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[MRGroupSessionXPCConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__MRGroupSessionXPCConnection_server__block_invoke;
  v6[3] = &unk_1E30C6918;
  v6[4] = self;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __37__MRGroupSessionXPCConnection_server__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _MRLogForCategory(0xCuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRGroupSessionXPCConnection] <%p> Server proxy error %@.", (uint8_t *)&v6, 0x16u);
  }

}

- (void)sendMessage:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MRGroupSessionXPCConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__MRGroupSessionXPCConnection_sendMessage___block_invoke;
  v7[3] = &unk_1E30C6568;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __43__MRGroupSessionXPCConnection_sendMessage___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "server");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (MRGroupSessionClientXPCProtocol)clientObject
{
  return self->_clientObject;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientObject, 0);
}

@end
