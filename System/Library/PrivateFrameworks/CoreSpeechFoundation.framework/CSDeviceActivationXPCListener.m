@implementation CSDeviceActivationXPCListener

- (CSDeviceActivationXPCListener)initWithMachServiceName:(const char *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  xpc_connection_t mach_service;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)CSDeviceActivationXPCListener;
  v4 = -[CSDeviceActivationXPCListener init](&v13, sel_init);
  if (v4)
  {
    +[CSUtils getSerialQueue:qualityOfService:](CSUtils, "getSerialQueue:qualityOfService:", CFSTR("CSActivationXPCListener"), 33);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v5;

    mach_service = xpc_connection_create_mach_service(a3, *((dispatch_queue_t *)v4 + 1), 1uLL);
    v8 = (void *)*((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = mach_service;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v9;

  }
  CSLogInitIfNeededWithSubsystemType(0);
  v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CSDeviceActivationXPCListener initWithMachServiceName:]";
    v16 = 2080;
    v17 = a3;
    _os_log_impl(&dword_1B502E000, v11, OS_LOG_TYPE_DEFAULT, "%s machServiceName: %s", buf, 0x16u);
  }
  return (CSDeviceActivationXPCListener *)v4;
}

- (CSDeviceActivationXPCListener)init
{
  return -[CSDeviceActivationXPCListener initWithMachServiceName:](self, "initWithMachServiceName:", "com.apple.corespeech.corespeechd.activation.xpc");
}

- (void)listen
{
  NSObject *v3;
  OS_xpc_object *listener;
  _QWORD handler[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[CSDeviceActivationXPCListener listen]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s CSActivationXPCListener start listening", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  listener = self->_listener;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __39__CSDeviceActivationXPCListener_listen__block_invoke;
  handler[3] = &unk_1E6881020;
  objc_copyWeak(&v6, (id *)buf);
  xpc_connection_set_event_handler(listener, handler);
  xpc_connection_activate(self->_listener);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

- (void)_handleListenerEvent:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSDeviceActivationXPCListener _handleListenerEvent:]";
    _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Received new remote control connection request", (uint8_t *)&v7, 0xCu);
  }
  if (v4)
  {
    if (MEMORY[0x1B5E46F84](v4) == MEMORY[0x1E0C81310])
      -[CSDeviceActivationXPCListener _handleListenerError:](self, "_handleListenerError:", v4);
    else
      -[CSDeviceActivationXPCListener _handleNewRemoteConnection:](self, "_handleNewRemoteConnection:", v4);
  }
  else
  {
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[CSDeviceActivationXPCListener _handleListenerEvent:]";
      _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s Connection request is nil", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)_handleListenerError:(id)a3
{
  void *v4;
  const char *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *string;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v5 = (const char *)*MEMORY[0x1E0C81270];
    v6 = v4;
    v7 = 136315394;
    v8 = "-[CSDeviceActivationXPCListener _handleListenerError:]";
    v9 = 2082;
    string = xpc_dictionary_get_string(a3, v5);
    _os_log_error_impl(&dword_1B502E000, v6, OS_LOG_TYPE_ERROR, "%s Error = %{public}s", (uint8_t *)&v7, 0x16u);

  }
}

- (void)_handleNewRemoteConnection:(id)a3
{
  id v4;
  NSObject *v5;
  CSDeviceActivationXPCConnection *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CSLogContextFacilityCoreSpeech;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315394;
      v8 = "-[CSDeviceActivationXPCListener _handleNewRemoteConnection:]";
      v9 = 2050;
      v10 = v4;
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s Getting new client connection : %{public}p", (uint8_t *)&v7, 0x16u);
    }
    if (+[CSUtils machXPCConnection:hasEntitlement:](CSUtils, "machXPCConnection:hasEntitlement:", v4, CFSTR("corespeechd.activation")))
    {
      v6 = -[CSDeviceActivationXPCConnection initWithConnection:]([CSDeviceActivationXPCConnection alloc], "initWithConnection:", v4);
      -[CSDeviceActivationXPCConnection activateConnection](v6, "activateConnection");
      -[CSDeviceActivationXPCConnection setDelegate:](v6, "setDelegate:", self);
      if (v6)
        -[NSMutableArray addObject:](self->_connections, "addObject:", v6);

    }
  }
  else if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315138;
    v8 = "-[CSDeviceActivationXPCListener _handleNewRemoteConnection:]";
    _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Connection request is nil", (uint8_t *)&v7, 0xCu);
  }

}

- (void)CSActivationXPCConnectionReceivedClientError:(id)a3 clientError:(id)a4 client:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  CSDeviceActivationXPCListener *v15;

  v7 = a3;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__CSDeviceActivationXPCListener_CSActivationXPCConnectionReceivedClientError_clientError_client___block_invoke;
  block[3] = &unk_1E6880BF0;
  v13 = v8;
  v14 = v7;
  v15 = self;
  v10 = v7;
  v11 = v8;
  dispatch_async(queue, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __97__CSDeviceActivationXPCListener_CSActivationXPCConnectionReceivedClientError_clientError_client___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = 136315394;
    v5 = "-[CSDeviceActivationXPCListener CSActivationXPCConnectionReceivedClientError:clientError:client:]_block_invoke";
    v6 = 2050;
    v7 = v3;
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s Client connection disconnected, removing %{public}p from client connection pool", (uint8_t *)&v4, 0x16u);
  }
  if (a1[5])
    objc_msgSend(*(id *)(a1[6] + 24), "removeObject:");
}

void __39__CSDeviceActivationXPCListener_listen__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleListenerEvent:", v3);

}

@end
