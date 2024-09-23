@implementation HIDPreferencesHelperListener

- (HIDPreferencesHelperListener)init
{
  HIDPreferencesHelperListener *v2;
  NSMutableArray *v3;
  NSMutableArray *clients;
  HIDPreferencesHelperListener *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HIDPreferencesHelperListener;
  v2 = -[HIDPreferencesHelperListener init](&v15, sel_init);
  if (!v2)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  clients = v2->_clients;
  v2->_clients = v3;

  if (!-[HIDPreferencesHelperListener setupListener](v2, "setupListener"))
  {
    _IOHIDLogCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[HIDPreferencesHelperListener init].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    goto LABEL_7;
  }
  v5 = v2;
LABEL_8:

  return v5;
}

- (void)acceptConnection:(id)a3 onQueue:(id)a4
{
  id v6;
  id v7;
  HIDPreferencesHelperClient *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v7 = a3;
  v8 = -[HIDPreferencesHelperClient initWithConnection:listener:onQueue:]([HIDPreferencesHelperClient alloc], "initWithConnection:listener:onQueue:", v7, self, v6);

  if (v8)
  {
    -[NSMutableArray addObject:](self->_clients, "addObject:", v8);
  }
  else
  {
    _IOHIDLogCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[HIDPreferencesHelperListener acceptConnection:onQueue:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  }
}

- (void)removeClient:(id)a3
{
  id v4;
  NSMutableArray *clients;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  clients = self->_clients;
  if (clients)
  {
    if (-[NSMutableArray containsObject:](clients, "containsObject:", v4))
    {
      -[NSMutableArray removeObject:](self->_clients, "removeObject:", v4);
    }
    else
    {
      _IOHIDLogCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[HIDPreferencesHelperListener removeClient:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    }
  }

}

- (BOOL)setupListener
{
  NSObject *v3;
  OS_xpc_object *mach_service;
  OS_xpc_object *listener;
  OS_xpc_object *v6;
  OS_xpc_object *v7;
  _QWORD handler[4];
  NSObject *v10;
  id v11;
  id location;

  v3 = dispatch_queue_create("com.apple.hidpreferenceshelperlistener", 0);
  mach_service = xpc_connection_create_mach_service("com.apple.hidpreferenceshelper", v3, 1uLL);
  listener = self->_listener;
  self->_listener = mach_service;

  v6 = self->_listener;
  if (v6)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7 = self->_listener;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __45__HIDPreferencesHelperListener_setupListener__block_invoke;
    handler[3] = &unk_24DE4E6B8;
    objc_copyWeak(&v11, &location);
    v10 = v3;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_activate(self->_listener);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v6 != 0;
}

void __45__HIDPreferencesHelperListener_setupListener__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  NSObject *v6;

  v3 = a2;
  v4 = MEMORY[0x22075DA18]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && v4 == MEMORY[0x24BDACF88])
  {
    _IOHIDLogCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __45__HIDPreferencesHelperListener_setupListener__block_invoke_cold_1((uint64_t)v3, v6);

    objc_msgSend(WeakRetained, "acceptConnection:onQueue:", v3, *(_QWORD *)(a1 + 32));
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0(&dword_21B143000, a1, a3, "HIDPreferencesHelper failed to create listener\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)acceptConnection:(uint64_t)a3 onQueue:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B143000, a1, a3, "HIDPreferencesHelper failed to accept connection\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)removeClient:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B143000, a1, a3, "HIDPreferencesHelper invalid client removal requested\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __45__HIDPreferencesHelperListener_setupListener__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21B143000, a2, OS_LOG_TYPE_DEBUG, "HIDPreferencesHelper new connection %@\n", (uint8_t *)&v2, 0xCu);
}

@end
