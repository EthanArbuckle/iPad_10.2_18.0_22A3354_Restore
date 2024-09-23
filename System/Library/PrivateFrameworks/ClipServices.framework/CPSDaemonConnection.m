@implementation CPSDaemonConnection

+ (CPSDaemonConnection)sharedConnection
{
  if (sharedConnection_onceToken != -1)
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_12);
  return (CPSDaemonConnection *)(id)sharedConnection_connection;
}

void __39__CPSDaemonConnection_sharedConnection__block_invoke()
{
  CPSDaemonConnection *v0;
  void *v1;

  v0 = objc_alloc_init(CPSDaemonConnection);
  v1 = (void *)sharedConnection_connection;
  sharedConnection_connection = (uint64_t)v0;

}

- (CPSDaemonConnection)init
{
  CPSDaemonConnection *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *connectionQueue;
  CPSDaemonConnection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSDaemonConnection;
  v2 = -[CPSDaemonConnection init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ClipServices.clipserviced.CPSDaemonConnection", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSXPCConnection)xpcConnection
{
  NSXPCConnection *xpcConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = xpcConnection;
  }
  else
  {
    v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ClipServices.clipserviced"), 4096);
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    if (xpcConnection_onceToken != -1)
      dispatch_once(&xpcConnection_onceToken, &__block_literal_global_14_1);
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", xpcConnection_interface);
    -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", xpcConnection_clientInterface);
    -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
    objc_initWeak(&location, self);
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__CPSDaemonConnection_xpcConnection__block_invoke_2;
    v11[3] = &unk_24C3B9950;
    objc_copyWeak(&v12, &location);
    -[NSXPCConnection setInvalidationHandler:](self->_xpcConnection, "setInvalidationHandler:", v11);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __36__CPSDaemonConnection_xpcConnection__block_invoke_3;
    v9[3] = &unk_24C3B9950;
    objc_copyWeak(&v10, &location);
    -[NSXPCConnection setInterruptionHandler:](self->_xpcConnection, "setInterruptionHandler:", v9);
    -[NSXPCConnection resume](self->_xpcConnection, "resume");
    v4 = self->_xpcConnection;
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __36__CPSDaemonConnection_xpcConnection__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2546334E0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcConnection_interface;
  xpcConnection_interface = v0;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25462A308);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)xpcConnection_clientInterface;
  xpcConnection_clientInterface = v2;

}

void __36__CPSDaemonConnection_xpcConnection__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __36__CPSDaemonConnection_xpcConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "remoteServiceDidCrash");

}

- (NSXPCConnection)xpcConnectionNotEntitled
{
  NSXPCConnection *xpcConnectionNotEntitled;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  xpcConnectionNotEntitled = self->_xpcConnectionNotEntitled;
  if (xpcConnectionNotEntitled)
    return xpcConnectionNotEntitled;
  v5 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.ClipServices.clipserviced"), 4096);
  v6 = self->_xpcConnectionNotEntitled;
  self->_xpcConnectionNotEntitled = v5;

  if (xpcConnectionNotEntitled_onceToken != -1)
    dispatch_once(&xpcConnectionNotEntitled_onceToken, &__block_literal_global_119);
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnectionNotEntitled, "setRemoteObjectInterface:", xpcConnectionNotEntitled_interface);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __47__CPSDaemonConnection_xpcConnectionNotEntitled__block_invoke_2;
  v11 = &unk_24C3B9950;
  objc_copyWeak(&v12, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_xpcConnectionNotEntitled, "setInvalidationHandler:", &v8);
  -[NSXPCConnection resume](self->_xpcConnectionNotEntitled, "resume", v8, v9, v10, v11);
  v7 = self->_xpcConnectionNotEntitled;
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v7;
}

void __47__CPSDaemonConnection_xpcConnectionNotEntitled__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254630948);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)xpcConnectionNotEntitled_interface;
  xpcConnectionNotEntitled_interface = v0;

}

void __47__CPSDaemonConnection_xpcConnectionNotEntitled__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (void)remoteServiceDidCrash
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CPSDaemonConnection_remoteServiceDidCrash__block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(connectionQueue, block);
}

uint64_t __44__CPSDaemonConnection_remoteServiceDidCrash__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "remoteServiceDidCrash");
}

- (void)didDetermineAvailability:(BOOL)a3 options:(id)a4
{
  id v6;
  NSObject *connectionQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CPSDaemonConnection_didDetermineAvailability_options___block_invoke;
  block[3] = &unk_24C3BA8B8;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(connectionQueue, block);

}

uint64_t __56__CPSDaemonConnection_didDetermineAvailability_options___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setUsedByPPT:", objc_msgSend(*(id *)(a1 + 40), "safari_BOOLForKey:", CFSTR("RegisteredForTest")));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setOriginIsControlCenter:", objc_msgSend(*(id *)(a1 + 40), "safari_BOOLForKey:", CFSTR("OriginIsControlCenter")));
  objc_msgSend(*(id *)(a1 + 40), "safari_stringForKey:", CFSTR("LaunchReason"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setLaunchReason:", v2);

  objc_msgSend(*(id *)(a1 + 40), "safari_stringForKey:", CFSTR("SourceBundleID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setSourceBundleID:", v3);

  objc_msgSend(*(id *)(a1 + 40), "safari_stringForKey:", CFSTR("ReferrerBundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setReferrerBundleID:", v4);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "didDetermineAvailability:", *(unsigned __int8 *)(a1 + 48));
}

- (void)didUpdateMetadata:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__CPSDaemonConnection_didUpdateMetadata___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

uint64_t __41__CPSDaemonConnection_didUpdateMetadata___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "didUpdateMetadata:", *(_QWORD *)(a1 + 40));
}

- (void)didFinishLoadingWithError:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__CPSDaemonConnection_didFinishLoadingWithError___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

uint64_t __49__CPSDaemonConnection_didFinishLoadingWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "didFinishLoadingWithError:", *(_QWORD *)(a1 + 40));
}

- (void)didUpdateInstallProgress:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__CPSDaemonConnection_didUpdateInstallProgress___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

uint64_t __48__CPSDaemonConnection_didUpdateInstallProgress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "didUpdateInstallProgress:", *(_QWORD *)(a1 + 40));
}

- (void)didInstallApplicationPlaceholder
{
  NSObject *connectionQueue;
  _QWORD block[5];

  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CPSDaemonConnection_didInstallApplicationPlaceholder__block_invoke;
  block[3] = &unk_24C3B94A8;
  block[4] = self;
  dispatch_async(connectionQueue, block);
}

uint64_t __55__CPSDaemonConnection_didInstallApplicationPlaceholder__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "didInstallApplicationPlaceholder");
}

- (void)didRetrieveApplicationIcon:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__CPSDaemonConnection_didRetrieveApplicationIcon___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

uint64_t __50__CPSDaemonConnection_didRetrieveApplicationIcon___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "didRetrieveApplicationIcon:", *(_QWORD *)(a1 + 40));
}

- (void)didRetrieveHeroImage:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__CPSDaemonConnection_didRetrieveHeroImage___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

uint64_t __44__CPSDaemonConnection_didRetrieveHeroImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "didRetrieveHeroImage:", *(_QWORD *)(a1 + 40));
}

- (void)didFinishTestingAtTime:(double)a3
{
  NSObject *connectionQueue;
  _QWORD v4[6];

  connectionQueue = self->_connectionQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__CPSDaemonConnection_didFinishTestingAtTime___block_invoke;
  v4[3] = &unk_24C3B9928;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(connectionQueue, v4);
}

uint64_t __46__CPSDaemonConnection_didFinishTestingAtTime___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "usedByPPT");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "didFinishTestingAtTime:", *(double *)(a1 + 40));
  return result;
}

- (void)didRetrieveBusinessIcon:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__CPSDaemonConnection_didRetrieveBusinessIcon___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

uint64_t __47__CPSDaemonConnection_didRetrieveBusinessIcon___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "didRetrieveBusinessIcon:", *(_QWORD *)(a1 + 40));
}

- (void)registerSessionProxy:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__CPSDaemonConnection_registerSessionProxy___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

void __44__CPSDaemonConnection_registerSessionProxy___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __44__CPSDaemonConnection_registerSessionProxy___block_invoke_cold_1((uint64_t)v2, a1, v3);
    objc_msgSend(*v2, "unregisterSessionProxy:", *((_QWORD *)*v2 + 4));
  }
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v10 = 134217984;
    v11 = v5;
    _os_log_impl(&dword_20AD44000, v4, OS_LOG_TYPE_INFO, "registerSessionProxy: Registering new session proxy (%p)", (uint8_t *)&v10, 0xCu);
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_122);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerSessionWithURL:configuration:", v8, v9);

}

void __44__CPSDaemonConnection_registerSessionProxy___block_invoke_120(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __44__CPSDaemonConnection_registerSessionProxy___block_invoke_120_cold_1(v3);

}

- (void)unregisterSessionProxy:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CPSDaemonConnection *v9;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke;
  v7[3] = &unk_24C3B94D0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

void __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = (uint64_t *)(a1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v6 = v5;
  if (v3 == v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = *v2;
      v13 = 134217984;
      v14 = v7;
      _os_log_impl(&dword_20AD44000, v6, OS_LOG_TYPE_INFO, "unregisterSessionProxy: Unregistering session proxy (%p)", (uint8_t *)&v13, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 40), "xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_124);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unregisterSessionWithURL:", v10);

    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(void **)(v11 + 32);
    *(_QWORD *)(v11 + 32) = 0;

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_cold_1(v2, v6);
  }
}

void __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_123(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_123_cold_1(v3);

}

- (void)isClipURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_2;
  v8[3] = &unk_24C3B9B00;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_125;
  v6[3] = &unk_24C3B9AD8;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "isClipURL:reply:", v5, v6);

}

void __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_2_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_125(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchClipMetadataAndImagesWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_2;
  v9[3] = &unk_24C3B9B00;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_127;
  v6[3] = &unk_24C3B9228;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "fetchClipMetadataAndImagesWithURL:reply:", v7, v6);

}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_2_cold_1(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_127(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_127_cold_1(v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138739971;
    v9 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "fetchClipMetadataAndImagesWithURL: successfully prewarmed clip with URL: %{sensitive}@", (uint8_t *)&v8, 0xCu);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)prewarmClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_2;
  v9[3] = &unk_24C3B9B00;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_128;
  v6[3] = &unk_24C3B9228;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "prewarmClipWithURL:reply:", v7, v6);

}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_128_cold_1(v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138739971;
    v9 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "prewarmClip: successfully prewarmed clip with URL: %{sensitive}@", (uint8_t *)&v8, 0xCu);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)cancelPrewarmingClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_2;
  v9[3] = &unk_24C3B9B00;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_129;
  v6[3] = &unk_24C3B9228;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "cancelPrewarmingClipWithURL:reply:", v7, v6);

}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_129(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_129_cold_1(v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138739971;
    v9 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "cancelPrewarm: successfully canceled prewarming clip with URL: %{sensitive}@", (uint8_t *)&v8, 0xCu);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)openClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_2;
  v9[3] = &unk_24C3B9B00;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 40);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_130;
  v6[3] = &unk_24C3B9228;
  v7 = v5;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "openClipWithURL:launchOptions:reply:", v7, 0, v6);

}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_130_cold_1(v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138739971;
    v9 = v6;
    _os_log_impl(&dword_20AD44000, v5, OS_LOG_TYPE_INFO, "openClip: successfully opened clip with URL: %{sensitive}@", (uint8_t *)&v8, 0xCu);
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)installClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_2;
  v8[3] = &unk_24C3B9B00;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_131;
  v6[3] = &unk_24C3B9B00;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "installClipWithURL:reply:", v5, v6);

}

void __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_131(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)uninstallClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2;
  v8[3] = &unk_24C3B9B00;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_132;
  v6[3] = &unk_24C3B9B00;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "uninstallClipWithURL:reply:", v5, v6);

}

void __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_132(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)uninstallClipsWithBundleIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke_2;
  v8[3] = &unk_24C3B9B00;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke_133;
  v6[3] = &unk_24C3B9B00;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "uninstallClipsWithBundleIDs:reply:", v5, v6);

}

void __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

uint64_t __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke_133(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchClipMetadataWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_2;
  v8[3] = &unk_24C3B9B00;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_134;
  v6[3] = &unk_24C3BA920;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "fetchClipMetadataWithURL:reply:", v5, v6);

}

void __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_2_cold_1(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);

}

uint64_t __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)fetchClipURLWithURLHash:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke_2;
  v7[3] = &unk_24C3B9B00;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchClipURLWithURLHash:sourceBundleID:reply:", v4, v6, *(_QWORD *)(a1 + 48));

}

void __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke_2_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)openClipWithInvocationUIIfNeededWithURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_2;
  v8[3] = &unk_24C3B9B00;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_137;
  v6[3] = &unk_24C3B9B00;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "openClipWithInvocationUIIfNeededWithURL:reply:", v5, v6);

}

void __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_2_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_137(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stopStallingCurrentInstallationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *connectionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C3B93C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(connectionQueue, v7);

}

void __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_24C3B9B00;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_138;
  v5[3] = &unk_24C3B9AD8;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "stopStallingCurrentInstallationWithReply:", v5);

}

void __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_2_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_138(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openClipWithURL:(id)a3 launchOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *connectionQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  connectionQueue = self->_connectionQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke;
  v15[3] = &unk_24C3BA948;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(connectionQueue, v15);

}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_2;
  v9[3] = &unk_24C3B9B00;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_139;
  v7[3] = &unk_24C3B9B00;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "openClipWithURL:launchOptions:reply:", v5, v6, v7);

}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_2_cold_1(v4);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_139_cold_1(v4);
  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

- (void)getUserNotificationConsentForBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_2;
  v8[3] = &unk_24C3B9B00;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_140;
  v6[3] = &unk_24C3BA970;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "getUserNotificationConsentForBundleID:reply:", v5, v6);

}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_2_cold_1(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_140(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_140_cold_1(v8);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)notifyWebClipActivationWithBundleID:(id)a3 referrerBundleID:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke;
  block[3] = &unk_24C3B97E8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(connectionQueue, block);

}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_142);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyWebClipActivationWithBundleID:referrerBundleID:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), &__block_literal_global_144);

}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_2_cold_1(v3);

}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_143(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_143_cold_1(v3);
  }

}

- (void)getLastLaunchOptionsWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(connectionQueue, block);

}

void __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_145);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLastLaunchOptionsWithBundleID:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke_2_cold_1(v3);

}

- (void)checkAndConsumeShowsAppAttributionBannerForBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke_2;
  v4[3] = &unk_24C3B9B00;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkAndConsumeShowsAppAttributionBannerForBundleID:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke_2_cold_1(v4);

}

- (void)confirmLocationWithURL:(id)a3 inRegion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *connectionQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  connectionQueue = self->_connectionQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke;
  v15[3] = &unk_24C3B9748;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(connectionQueue, v15);

}

void __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnectionNotEntitled");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_146);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "confirmLocationWithURL:inRegion:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke_2_cold_1(v3);

}

- (void)performValidationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke;
  block[3] = &unk_24C3B9350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(connectionQueue, block);

}

void __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_147);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performValidationWithRequest:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke_2_cold_1(v3);

}

- (void)fetchAMPMetadataForDiagnosticsWithBundleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke_2;
  v4[3] = &unk_24C3B9B00;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAMPMetadataForDiagnosticsWithBundleID:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke_2_cold_1(v4);

}

- (void)fetchABRMetadataForDiagnosticsWithURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *connectionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke;
  block[3] = &unk_24C3BA7A8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(connectionQueue, block);

}

void __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke_2;
  v4[3] = &unk_24C3B9B00;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchABRMetadataForDiagnosticsWithURL:reply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke_2_cold_1(v4);

}

- (CPSSessionProxy)sessionProxy
{
  return self->_sessionProxy;
}

- (void)setSessionProxy:(id)a3
{
  objc_storeStrong((id *)&self->_sessionProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnectionNotEntitled, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

void __44__CPSDaemonConnection_registerSessionProxy___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  v5 = 134218240;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  _os_log_error_impl(&dword_20AD44000, log, OS_LOG_TYPE_ERROR, "registerSessionProxy: Existing session proxy (%p) is about to be overwritten with a new one (%p)", (uint8_t *)&v5, 0x16u);
}

void __44__CPSDaemonConnection_registerSessionProxy___block_invoke_120_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "registerSessionProxy: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_20AD44000, a2, OS_LOG_TYPE_ERROR, "unregisterSessionProxy: try to unregister a stale session proxy (%p)", (uint8_t *)&v3, 0xCu);
}

void __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_123_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "unregisterSessionProxy: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "isClipURL: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "fetchClipMetadataAndImagesWithURL: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_127_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "fetchClipMetadataAndImagesWithURL: error when prewarming clip via daemon: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "prewarmClip: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_128_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "prewarmClip: error when prewarming clip via daemon: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "cancelPrewarm: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_129_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "cancelPrewarm: error when cancelling prewarming clip via daemon: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "openClip: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_130_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "openClip: error when opening clip via daemon: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "installClipWithURL: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "uninstallClipWithURL: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "fetchClipMetadataWithURL: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "fetchClipMetadataWithURLHash: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "openClipWithInvocationUIIfNeededWithURL: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "stopStallingCurrentInstallation: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "openClipWithURL:launchOptions: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_139_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "openClipWithURL:launchOptions: Fail to open clip with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "getUserNotificationConsentForBundleID: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_140_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "getUserNotificationConsentForBundleID: Fail to get clip notification consent with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "notifyWebClipActivationWithBundleID: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_143_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "notifyWebClipActivationWithBundleID: failed with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "getLastLaunchOptionsWithBundleID: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "checkAndConsumeShowsAppAttributionBannerForBundleID: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "confirmLocationWithURL: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "performValidationWithRequest: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "fetchAMPMetadataForDiagnosticsWithBundleID: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

void __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_2(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "cps_privacyPreservingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_20AD44000, v3, v4, "fetchABRMetadataForDiagnosticsWithURL: Cannot connect to daemon with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1();
}

@end
