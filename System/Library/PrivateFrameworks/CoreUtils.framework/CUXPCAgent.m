@implementation CUXPCAgent

- (CUXPCAgent)init
{
  CUXPCAgent *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUXPCAgent;
  v2 = -[CUXPCAgent init](&v4, sel_init);
  if (v2)
  {
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUXPCAgent;
  }
  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUXPCAgent;
  -[CUXPCAgent dealloc](&v4, sel_dealloc);
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE0680A0;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__CUXPCAgent_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E25DE600;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (BOOL)activateDirectAndReturnError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LogCategory *ucat;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSXPCListenerEndpoint *v16;
  NSXPCConnection *v17;
  NSXPCConnection *xpcCnx;
  uint64_t v19;
  NSXPCListener *v20;
  NSXPCListener *xpcListener;
  NSXPCListenerEndpoint *v22;
  NSXPCListenerEndpoint *listenerEndpoint;
  BOOL v24;
  id v25;
  BOOL v26;
  void *v28;
  uint64_t v29[5];
  _QWORD v30[5];

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent activateDirectAndReturnError:]", 0x1Eu, (uint64_t)"Activate\n", v3, v4, v5, v6, v29[0]);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v16 = self->_listenerEndpoint;
  if (v16)
  {
    if (!self->_xpcCnx)
    {
      v17 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v16);
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = v17;

      -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
      -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", self->_exportedInterface);
      -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self->_exportedObject);
      -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", self->_remoteObjectInterface);
      v19 = MEMORY[0x1E0C809B0];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __43__CUXPCAgent_activateDirectAndReturnError___block_invoke;
      v30[3] = &unk_1E25DF2A0;
      v30[4] = self;
      -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v30);
      v29[0] = v19;
      v29[1] = 3221225472;
      v29[2] = (uint64_t)__43__CUXPCAgent_activateDirectAndReturnError___block_invoke_2;
      v29[3] = (uint64_t)&unk_1E25DF2A0;
      v29[4] = (uint64_t)self;
      -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v29);
      -[NSXPCConnection resume](self->_xpcCnx, "resume");
LABEL_10:
      v24 = 0;
      v25 = 0;
      goto LABEL_11;
    }
  }
  else if (!self->_xpcListener)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v20 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    xpcListener = self->_xpcListener;
    self->_xpcListener = v20;

    -[NSXPCListener _setQueue:](self->_xpcListener, "_setQueue:", self->_dispatchQueue);
    -[NSXPCListener setDelegate:](self->_xpcListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcListener, "resume");
    -[NSXPCListener endpoint](self->_xpcListener, "endpoint");
    v22 = (NSXPCListenerEndpoint *)objc_claimAutoreleasedReturnValue();
    listenerEndpoint = self->_listenerEndpoint;
    self->_listenerEndpoint = v22;

    goto LABEL_10;
  }
  NSErrorWithOSStatusF(4294960575, (uint64_t)"Activate already called", v10, v11, v12, v13, v14, v15, v29[0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v28;
  v24 = v28 != 0;
  if (a3 && v28)
  {
    v25 = objc_retainAutorelease(v28);
    *a3 = v25;
    v24 = 1;
  }
LABEL_11:
  v26 = !v24;

  return v26;
}

- (void)_interrupted
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LogCategory *ucat;
  void (**interruptionHandler)(void);
  uint64_t v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  ucat = self->_ucat;
  if (ucat->var0 > 30)
    goto LABEL_5;
  if (ucat->var0 != -1)
    goto LABEL_3;
  if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
  {
    ucat = self->_ucat;
LABEL_3:
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent _interrupted]", 0x1Eu, (uint64_t)"Interrupted\n", v3, v4, v5, v6, v9);
  }
LABEL_5:
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__CUXPCAgent_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  NSXPCListener *xpcListener;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSMutableSet *xpcCnxSet;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_invalidateCalled)
    return;
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
        goto LABEL_6;
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v15);
  }
LABEL_6:
  -[NSXPCListener invalidate](self->_xpcListener, "invalidate");
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)-[NSMutableSet copy](self->_xpcCnxSet, "copy", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[CUXPCAgent _connectionInvalidated:](self, "_connectionInvalidated:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[NSMutableSet removeAllObjects](self->_xpcCnxSet, "removeAllObjects");
  xpcCnxSet = self->_xpcCnxSet;
  self->_xpcCnxSet = 0;

  -[NSXPCConnection invalidate](self->_xpcCnx, "invalidate");
  -[CUXPCAgent _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LogCategory *ucat;
  void (**invalidationHandler)(void);
  id connectionStartedHandler;
  id connectionEndedHandler;
  id interruptionHandler;
  id v12;
  NSXPCListenerEndpoint *listenerEndpoint;
  NSXPCInterface *exportedInterface;
  id exportedObject;
  NSXPCInterface *remoteObjectInterface;
  NSXPCInterface *v17;
  uint64_t v18;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateDone)
    return;
  if (!self->_invalidateCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
          goto LABEL_7;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent _invalidated]", 0x3Cu, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v18);
    }
  }
LABEL_7:
  if (!self->_xpcCnx && !self->_xpcListener)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    connectionStartedHandler = self->_connectionStartedHandler;
    self->_connectionStartedHandler = 0;

    connectionEndedHandler = self->_connectionEndedHandler;
    self->_connectionEndedHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v12 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    listenerEndpoint = self->_listenerEndpoint;
    self->_listenerEndpoint = 0;

    exportedInterface = self->_exportedInterface;
    self->_exportedInterface = 0;

    exportedObject = self->_exportedObject;
    self->_exportedObject = 0;

    remoteObjectInterface = self->_remoteObjectInterface;
    self->_remoteObjectInterface = 0;

    v17 = self->_exportedInterface;
    self->_exportedInterface = 0;

    self->_invalidateDone = 1;
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  CUXPCAgentConnection *v7;
  NSMutableSet *xpcCnxSet;
  NSMutableSet *v9;
  NSMutableSet *v10;
  CUXPCAgentConnection *v11;
  LogCategory *ucat;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**connectionStartedHandler)(id, id);
  _QWORD v20[5];
  CUXPCAgentConnection *v21;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = objc_alloc_init(CUXPCAgentConnection);
  objc_storeStrong((id *)&v7->_agent, self);
  objc_storeStrong((id *)&v7->_dispatchQueue, self->_dispatchQueue);
  objc_storeStrong((id *)&v7->_xpcCnx, a4);
  xpcCnxSet = self->_xpcCnxSet;
  if (!xpcCnxSet)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v10 = self->_xpcCnxSet;
    self->_xpcCnxSet = v9;

    xpcCnxSet = self->_xpcCnxSet;
  }
  -[NSMutableSet addObject:](xpcCnxSet, "addObject:", v7);
  objc_msgSend(v6, "_setQueue:", self->_dispatchQueue);
  objc_msgSend(v6, "setExportedInterface:", self->_exportedInterface);
  objc_msgSend(v6, "setExportedObject:", self->_exportedObject);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __49__CUXPCAgent_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_1E25DE628;
  v20[4] = self;
  v11 = v7;
  v21 = v11;
  objc_msgSend(v6, "setInvalidationHandler:", v20);
  objc_msgSend(v6, "setRemoteObjectInterface:", self->_remoteObjectInterface);
  objc_msgSend(v6, "resume");
  ucat = self->_ucat;
  if (ucat->var0 <= 20)
  {
    if (ucat->var0 != -1)
    {
LABEL_5:
      v13 = objc_msgSend(v6, "processIdentifier");
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent listener:shouldAcceptNewConnection:]", 0x14u, (uint64_t)"XPC connection started from %#{pid}\n", v14, v15, v16, v17, v13);
      goto LABEL_7;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x14u))
    {
      ucat = self->_ucat;
      goto LABEL_5;
    }
  }
LABEL_7:
  connectionStartedHandler = (void (**)(id, id))self->_connectionStartedHandler;
  if (connectionStartedHandler)
    connectionStartedHandler[2](connectionStartedHandler, v11);

  return 1;
}

- (void)_connectionInvalidated:(id)a3
{
  void (**connectionEndedHandler)(id, id);
  id v5;

  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(v5, "connectionInvalidated");
  -[NSMutableSet removeObject:](self->_xpcCnxSet, "removeObject:", v5);
  connectionEndedHandler = (void (**)(id, id))self->_connectionEndedHandler;
  if (connectionEndedHandler)
    connectionEndedHandler[2](connectionEndedHandler, v5);

}

- (id)remoteObjectProxy
{
  NSXPCConnection *xpcCnx;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  LogCategory *ucat;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection remoteObjectProxy](xpcCnx, "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if ((unint64_t)-[NSMutableSet count](self->_xpcCnxSet, "count") >= 2)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
          goto LABEL_8;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent remoteObjectProxy]", 0x3Cu, (uint64_t)"### Multiple connections...using arbitrary one\n", v5, v6, v7, v8, v13);
    }
  }
LABEL_8:
  -[NSMutableSet anyObject](self->_xpcCnxSet, "anyObject");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    objc_msgSend(*(id *)(v10 + 24), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  NSXPCConnection *xpcCnx;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v4 = a3;
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if ((unint64_t)-[NSMutableSet count](self->_xpcCnxSet, "count") >= 2)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 60)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x3Cu))
          goto LABEL_8;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUXPCAgent remoteObjectProxyWithErrorHandler:]", 0x3Cu, (uint64_t)"### Multiple connections...using arbitrary one\n", v7, v8, v9, v10, v15);
    }
  }
LABEL_8:
  -[NSMutableSet anyObject](self->_xpcCnxSet, "anyObject");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    objc_msgSend(*(id *)(v12 + 24), "remoteObjectProxyWithErrorHandler:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

LABEL_12:
  return v6;
}

- (id)connectionStartedHandler
{
  return self->_connectionStartedHandler;
}

- (void)setConnectionStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)connectionEndedHandler
{
  return self->_connectionEndedHandler;
}

- (void)setConnectionEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)label
{
  return self->_label;
}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return self->_listenerEndpoint;
}

- (void)setListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_listenerEndpoint, a3);
}

- (NSXPCInterface)exportedInterface
{
  return self->_exportedInterface;
}

- (void)setExportedInterface:(id)a3
{
  objc_storeStrong((id *)&self->_exportedInterface, a3);
}

- (id)exportedObject
{
  return self->_exportedObject;
}

- (void)setExportedObject:(id)a3
{
  objc_storeStrong(&self->_exportedObject, a3);
}

- (NSXPCInterface)remoteObjectInterface
{
  return self->_remoteObjectInterface;
}

- (void)setRemoteObjectInterface:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_connectionEndedHandler, 0);
  objc_storeStrong(&self->_connectionStartedHandler, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcCnxSet, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

uint64_t __49__CUXPCAgent_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionInvalidated:", *(_QWORD *)(a1 + 40));
}

uint64_t __24__CUXPCAgent_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __43__CUXPCAgent_activateDirectAndReturnError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __43__CUXPCAgent_activateDirectAndReturnError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v14;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(int **)(v9 + 16);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD *)(a1 + 32);
      if (!v11)
        goto LABEL_5;
      v10 = *(int **)(v9 + 16);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUXPCAgent activateDirectAndReturnError:]_block_invoke_2", 0x1Eu, (uint64_t)"Invalidated\n", a5, a6, a7, a8, v14);
    v9 = *(_QWORD *)(a1 + 32);
  }
LABEL_5:
  v12 = *(void **)(v9 + 24);
  *(_QWORD *)(v9 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __37__CUXPCAgent_activateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v5 = 0;
  objc_msgSend(v2, "activateDirectAndReturnError:", &v5);
  v3 = v5;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

@end
