@implementation CUMessageSessionServer

- (CUMessageSessionServer)init
{
  CUMessageSessionServer *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUMessageSessionServer;
  v2 = -[CUMessageSessionServer init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
  }
  return v2;
}

- (void)activate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSXPCListener *v7;
  NSXPCListener *xpcListener;
  CUMessageSession *v9;
  CUMessageSession *templateSession;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUMessageSession <= 30
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionServer activate]", 0x1Eu, (uint64_t)"Activate\n", v3, v4, v5, v6, v17);
  }
  if (!self->_xpcListener)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v7 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    xpcListener = self->_xpcListener;
    self->_xpcListener = v7;

    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcListener, "resume");
    v9 = objc_alloc_init(CUMessageSession);
    templateSession = self->_templateSession;
    self->_templateSession = v9;

    -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUMessageSession setListenerEndpoint:](self->_templateSession, "setListenerEndpoint:", v11);

    -[CUMessageSession listenerEndpoint](self->_templateSession, "listenerEndpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12
      && gLogCategory_CUMessageSession <= 90
      && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x5Au)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionServer activate]", 0x5Au, (uint64_t)"### No XPC endpoint?\n", v13, v14, v15, v16, v18);
    }
  }
}

- (void)invalidate
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSXPCListener *xpcListener;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSMutableSet *xpcConnections;
  void (**invalidationHandler)(void);
  id v16;
  id registerRequestHandler;
  id deregisterRequestHandler;
  id sendRequestHandler;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUMessageSession <= 30
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionServer invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v3, v4, v5, v6, v20);
  }
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_xpcConnections;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        *(_BYTE *)(v13 + 16) = 1;
        objc_msgSend(*(id *)(v13 + 40), "invalidate", (_QWORD)v20);
      }
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  -[NSMutableSet removeAllObjects](self->_xpcConnections, "removeAllObjects");
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2]();
    v16 = self->_invalidationHandler;
  }
  else
  {
    v16 = 0;
  }
  self->_invalidationHandler = 0;

  registerRequestHandler = self->_registerRequestHandler;
  self->_registerRequestHandler = 0;

  deregisterRequestHandler = self->_deregisterRequestHandler;
  self->_deregisterRequestHandler = 0;

  sendRequestHandler = self->_sendRequestHandler;
  self->_sendRequestHandler = 0;

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  CUMessageSessionXPCConnection *v7;
  NSMutableSet *xpcConnections;
  NSMutableSet *v9;
  NSMutableSet *v10;
  void *v11;
  CUMessageSessionXPCConnection *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[5];
  CUMessageSessionXPCConnection *v21;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = objc_alloc_init(CUMessageSessionXPCConnection);
  objc_storeStrong((id *)&v7->_server, self);
  objc_storeStrong((id *)&v7->_dispatchQueue, self->_dispatchQueue);
  objc_storeStrong((id *)&v7->_xpcCnx, a4);
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = self->_xpcConnections;
    self->_xpcConnections = v9;

    xpcConnections = self->_xpcConnections;
  }
  -[NSMutableSet addObject:](xpcConnections, "addObject:", v7);
  objc_msgSend(v6, "_setQueue:", self->_dispatchQueue);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE073C18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v11);

  objc_msgSend(v6, "setExportedObject:", v7);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__CUMessageSessionServer_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_1E25DE628;
  v20[4] = self;
  v12 = v7;
  v21 = v12;
  objc_msgSend(v6, "setInvalidationHandler:", v20);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0735B0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v13);

  objc_msgSend(v6, "resume");
  if (gLogCategory_CUMessageSession <= 20
    && (gLogCategory_CUMessageSession != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUMessageSession, 0x14u)))
  {
    v14 = objc_msgSend(v6, "processIdentifier");
    LogPrintF((uint64_t)&gLogCategory_CUMessageSession, (uint64_t)"-[CUMessageSessionServer listener:shouldAcceptNewConnection:]", 0x14u, (uint64_t)"XPC connection started from %#{pid}\n", v15, v16, v17, v18, v14);
  }

  return 1;
}

- (void)_connectionInvalidated:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  objc_msgSend(v5, "connectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcConnections, "removeObject:", v5);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)registerRequestHandler
{
  return self->_registerRequestHandler;
}

- (void)setRegisterRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)deregisterRequestHandler
{
  return self->_deregisterRequestHandler;
}

- (void)setDeregisterRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)sendRequestHandler
{
  return self->_sendRequestHandler;
}

- (void)setSendRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CUMessageSession)templateSession
{
  return self->_templateSession;
}

- (void)setTemplateSession:(id)a3
{
  objc_storeStrong((id *)&self->_templateSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateSession, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong(&self->_sendRequestHandler, 0);
  objc_storeStrong(&self->_deregisterRequestHandler, 0);
  objc_storeStrong(&self->_registerRequestHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

uint64_t __61__CUMessageSessionServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionInvalidated:", *(_QWORD *)(a1 + 40));
}

@end
