@implementation anonymousDaemon

- (id)initUsingInterface:(id)a3 clientClass:(Class)a4 queue:(id)a5 andProxy:(id)a6
{
  id v11;
  id v12;
  id v13;
  anonymousDaemon *v14;
  void *v15;
  char v16;
  uint64_t v17;
  NSXPCListener *listener;
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  id v23;
  objc_super v24;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)anonymousDaemon;
  v14 = -[anonymousDaemon init](&v24, sel_init);
  if (v14)
  {
    if (a4
      && v11
      && v13
      && (objc_msgSend(v11, "protocol"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = -[objc_class conformsToProtocol:](a4, "conformsToProtocol:", v15),
          v15,
          (v16 & 1) != 0))
    {
      if ((-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &unk_255C00BB8) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
        v17 = objc_claimAutoreleasedReturnValue();
        listener = v14->_listener;
        v14->_listener = (NSXPCListener *)v17;

        -[NSXPCListener setDelegate:](v14->_listener, "setDelegate:", v14);
        -[NSXPCListener resume](v14->_listener, "resume");
        objc_storeStrong((id *)&v14->_interface, a3);
        objc_storeStrong((id *)&v14->_clientClass, a4);
        objc_storeStrong((id *)&v14->_proxy, a6);
        objc_storeStrong((id *)&v14->_queue, a5);
        goto LABEL_8;
      }
      v20 = (void *)MEMORY[0x24BDBCE88];
      v21 = *MEMORY[0x24BDBCAB0];
      v22 = CFSTR("Attempt to create listener using proxy object which does not conform to LiveFSConnectorMaker");
    }
    else
    {
      v20 = (void *)MEMORY[0x24BDBCE88];
      v21 = *MEMORY[0x24BDBCAB0];
      v22 = CFSTR("Attempt to create listener using proxy object which does not conform to exported protocol");
    }
    objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v23);
  }
LABEL_8:

  return v14;
}

- (anonymousDaemon)initWithListener:(id)a3
{
  id v5;
  anonymousDaemon *v6;
  anonymousDaemon *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)anonymousDaemon;
  v6 = -[anonymousDaemon init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_endpoint, a3);

  return v7;
}

- (void)dealloc
{
  NSObject *proxy;
  NSXPCInterface *interface;
  NSXPCListener *listener;
  objc_super v6;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  proxy = self->_proxy;
  self->_proxy = 0;

  interface = self->_interface;
  self->_interface = 0;

  listener = self->_listener;
  self->_listener = 0;

  v6.receiver = self;
  v6.super_class = (Class)anonymousDaemon;
  -[anonymousDaemon dealloc](&v6, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Class clientClass;
  NSObject *proxy;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35;

  v5 = a4;
  livefs_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[anonymousDaemon listener:shouldAcceptNewConnection:].cold.3(v6, v7, v8, v9, v10, v11, v12, v13);

  objc_msgSend(v5, "setExportedInterface:", self->_interface);
  clientClass = self->_clientClass;
  proxy = self->_proxy;
  v35 = 0;
  v16 = (void *)-[objc_class newExportObjectForObject:connection:error:](clientClass, "newExportObjectForObject:connection:error:", proxy, v5, &v35);
  v17 = v35;
  objc_msgSend(v5, "setExportedObject:", v16);
  +[LiveFSVolumeClient exportedClientInterface](LiveFSVolumeClient, "exportedClientInterface");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v18);

  if (v17)
  {
    livefs_std_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[anonymousDaemon listener:shouldAcceptNewConnection:].cold.2((uint64_t)v17, v19);
  }
  else
  {
    v20 = MEMORY[0x24BDAC760];
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __54__anonymousDaemon_listener_shouldAcceptNewConnection___block_invoke;
    v33[3] = &unk_24F64C220;
    v21 = v16;
    v34 = v21;
    objc_msgSend(v5, "setInvalidationHandler:", v33);
    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __54__anonymousDaemon_listener_shouldAcceptNewConnection___block_invoke_2;
    v31[3] = &unk_24F64C220;
    v32 = v21;
    objc_msgSend(v5, "setInterruptionHandler:", v31);
    if (self->_queue)
      objc_msgSend(v5, "_setQueue:");
    objc_msgSend(v5, "resume");
    livefs_std_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[anonymousDaemon listener:shouldAcceptNewConnection:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

    v19 = v34;
  }

  return v17 == 0;
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCInterface)interface
{
  return (NSXPCInterface *)objc_getProperty(self, a2, 16, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (Class)clientClass
{
  return (Class)objc_getProperty(self, a2, 32, 1);
}

- (NSObject)proxy
{
  return objc_getProperty(self, a2, 40, 1);
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_clientClass, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_22BD61000, a1, a3, "%s: accepting connection", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[anonymousDaemon listener:shouldAcceptNewConnection:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_22BD61000, a2, OS_LOG_TYPE_ERROR, "%s: error allocating client: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_22BD61000, a1, a3, "%s: start.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
