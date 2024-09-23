@implementation FSListener

- (id)initUsingInterface:(id)a3 clientClass:(Class)a4 queue:(id)a5 andProxy:(id)a6
{
  id v11;
  id v12;
  id v13;
  FSListener *v14;
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
  v24.super_class = (Class)FSListener;
  v14 = -[FSListener init](&v24, sel_init);
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
      if ((-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", &unk_256A15CA0) & 1) != 0)
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
      v22 = CFSTR("Attempt to create listener using proxy object which does not conform to FSConnectorMaker");
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

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  uint8_t v8[16];

  v5 = a4;
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23B2A6000, v6, OS_LOG_TYPE_INFO, "handling incoming connection", v8, 2u);
  }

  objc_msgSend(v5, "setExportedInterface:", self->_interface);
  objc_msgSend(v5, "setExportedObject:", self->_proxy);
  if (self->_queue)
    objc_msgSend(v5, "_setQueue:");
  objc_msgSend(v5, "resume");

  return 1;
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

- (NSObject)proxy
{
  return objc_getProperty(self, a2, 32, 1);
}

- (Class)clientClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientClass, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
