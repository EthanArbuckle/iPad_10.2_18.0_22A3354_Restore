@implementation IOSurfaceRemoteServer

- (IOSurfaceRemoteServer)initWithListener:(id)a3 options:(id)a4
{
  _xpc_connection_s *v6;
  id v7;
  IOSurfaceRemoteServer *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD handler[4];
  id v14;
  id location;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_connection_s *)a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IOSurfaceRemoteServer;
  v8 = -[IOSurfaceRemoteServer init](&v16, sel_init);
  -[IOSurfaceRemoteServer setListener:](v8, "setListener:", v6);
  v9 = (void *)objc_opt_new();
  -[IOSurfaceRemoteServer setClients:](v8, "setClients:", v9);

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("com.apple.IOSurfaceRemoteServer", v10);
  -[IOSurfaceRemoteServer setQueue:](v8, "setQueue:", v11);
  objc_initWeak(&location, v8);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __50__IOSurfaceRemoteServer_initWithListener_options___block_invoke;
  handler[3] = &unk_1E4DE7628;
  objc_copyWeak(&v14, &location);
  xpc_connection_set_event_handler(v6, handler);
  xpc_connection_set_target_queue(v6, v11);
  xpc_connection_activate(v6);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __50__IOSurfaceRemoteServer_initWithListener_options___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (MEMORY[0x1A85A6ECC](v5) == MEMORY[0x1E0C812E0])
  {
    objc_msgSend(WeakRetained, "_handleClientConnection:", v5);
  }
  else if (v5 == (id)MEMORY[0x1E0C81260])
  {
    objc_msgSend(WeakRetained, "clients");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");

  }
}

- (void)dealloc
{
  _xpc_connection_s *v3;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[IOSurfaceRemoteServer listener](self, "listener");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)IOSurfaceRemoteServer;
  -[IOSurfaceRemoteServer dealloc](&v4, sel_dealloc);
}

- (void)shutdown
{
  _xpc_connection_s *v2;

  -[IOSurfaceRemoteServer listener](self, "listener");
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_cancel(v2);

}

- (void)_handleClientConnection:(id)a3
{
  _xpc_connection_s *v4;
  IOSurfaceRemoteRemoteClient *v5;
  void *v6;
  IOSurfaceRemoteRemoteClient *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = (_xpc_connection_s *)a3;
  xpc_connection_get_pid(v4);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[IOSurfaceRemoteServer _handleClientConnection:].cold.1();
  objc_initWeak(location, self);
  v5 = [IOSurfaceRemoteRemoteClient alloc];
  -[IOSurfaceRemoteServer queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__IOSurfaceRemoteServer__handleClientConnection___block_invoke;
  v10[3] = &unk_1E4DE7650;
  objc_copyWeak(&v11, location);
  v7 = -[IOSurfaceRemoteRemoteClient initWithRemoteConnection:disconnectedQueue:disconnectedHandler:](v5, "initWithRemoteConnection:disconnectedQueue:disconnectedHandler:", v4, v6, v10);

  -[IOSurfaceRemoteServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[IOSurfaceRemoteServer clients](self, "clients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v7);

  objc_destroyWeak(&v11);
  objc_destroyWeak(location);

}

void __49__IOSurfaceRemoteServer__handleClientConnection___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientDisconnected:", v3);

}

- (void)_handleClientDisconnected:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "pid");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[IOSurfaceRemoteServer _handleClientDisconnected:].cold.1();
  -[IOSurfaceRemoteServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[IOSurfaceRemoteServer clients](self, "clients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
  objc_storeStrong((id *)&self->_clients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)_handleClientConnection:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A4CDD000, MEMORY[0x1E0C81028], v0, "Client connected pid=%d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)_handleClientDisconnected:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A4CDD000, MEMORY[0x1E0C81028], v0, "Client disconnected pid=%d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
