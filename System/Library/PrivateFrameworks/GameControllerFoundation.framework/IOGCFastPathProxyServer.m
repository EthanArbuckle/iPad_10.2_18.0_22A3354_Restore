@implementation IOGCFastPathProxyServer

- (IOGCFastPathProxyServer)initWithServerName:(id)a3
{
  id v3;
  id v4;
  dispatch_queue_t v5;
  void *v6;
  id v7;
  const char *v8;
  xpc_connection_t mach_service;
  void *v10;
  _xpc_connection_s *v11;
  IOGCFastPathProxyServer *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)IOGCFastPathProxyServer;
  v3 = a3;
  v4 = -[IOGCFastPathProxyServer init](&v14, sel_init);
  v5 = dispatch_queue_create("IOGCFastPathProxyServer", 0);
  v6 = (void *)*((_QWORD *)v4 + 1);
  *((_QWORD *)v4 + 1) = v5;

  v7 = objc_retainAutorelease(v3);
  v8 = (const char *)objc_msgSend(v7, "UTF8String", v14.receiver, v14.super_class);

  mach_service = xpc_connection_create_mach_service(v8, *((dispatch_queue_t *)v4 + 1), 1uLL);
  v10 = (void *)*((_QWORD *)v4 + 2);
  *((_QWORD *)v4 + 2) = mach_service;

  v11 = (_xpc_connection_s *)*((_QWORD *)v4 + 2);
  if (v11)
  {
    xpc_connection_set_event_handler(v11, &__block_literal_global_58);
    v12 = (IOGCFastPathProxyServer *)v4;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __46__IOGCFastPathProxyServer_initWithServerName___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  os_activity_scope_state_s v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = MEMORY[0x1DF0CE66C]();
  if (v3 == MEMORY[0x1E0C812E0])
  {
    v5 = _os_activity_create(&dword_1DC79E000, "Incoming Connection", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v15.opaque[0] = 0;
    v15.opaque[1] = 0;
    os_activity_scope_enter(v5, &v15);
    _gc_log_iokit();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v2;
      _os_log_impl(&dword_1DC79E000, v13, OS_LOG_TYPE_INFO, "Accepting connection '%@' to fast path proxy.", buf, 0xCu);
    }

    +[_IOGCFastPathProxyClient withIncomingConnection:]((uint64_t)_IOGCFastPathProxyClient, v2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      xpc_connection_cancel((xpc_connection_t)v2);

    os_activity_scope_leave(&v15);
  }
  else
  {
    v4 = v3 == MEMORY[0x1E0C81310];
    _gc_log_iokit();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v6)
        __46__IOGCFastPathProxyServer_initWithServerName___block_invoke_cold_1((uint64_t)v2, v5, v7, v8, v9, v10, v11, v12);
    }
    else if (v6)
    {
      __46__IOGCFastPathProxyServer_initWithServerName___block_invoke_cold_2((uint64_t)v2, v5, v7, v8, v9, v10, v11, v12);
    }
  }

}

- (IOGCFastPathProxyServer)init
{
  -[IOGCFastPathProxyServer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)activate
{
  xpc_connection_activate(self->_listener);
}

- (void)invalidate
{
  xpc_connection_cancel(self->_listener);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __46__IOGCFastPathProxyServer_initWithServerName___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1DC79E000, a2, a3, "Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_7();
}

void __46__IOGCFastPathProxyServer_initWithServerName___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_7(&dword_1DC79E000, a2, a3, "Unknown event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_7();
}

@end
