@implementation XPCServiceListener

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)XPCServiceListener;
  -[XPCServiceListener description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: name %@, connection %p, delegate %p"), v4, self->_serviceName, self->_listener, self->_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (XPCServiceListener)initWithServiceName:(id)a3 queue:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  XPCServiceListenerDelegate *v11;
  XPCServiceListener *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableSet *v19;
  NSMutableSet *serviceConnections;
  xpc_connection_t mach_service;
  OS_xpc_object *listener;
  _xpc_connection_s *v23;
  XPCServiceListener *v24;
  XPCServiceListener *v25;
  _QWORD handler[4];
  XPCServiceListener *v28;
  id v29;
  id location;
  objc_super v31;

  v9 = a3;
  v10 = a4;
  v11 = (XPCServiceListenerDelegate *)a5;
  v31.receiver = self;
  v31.super_class = (Class)XPCServiceListener;
  v12 = -[XPCServiceListener init](&v31, sel_init);
  if (v12)
  {
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(6, CFSTR("Creating service listener for service name %@."), v13, v14, v15, v16, v17, v18, (uint64_t)v9);
    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    serviceConnections = v12->_serviceConnections;
    v12->_serviceConnections = v19;

    objc_storeStrong((id *)&v12->_workQueue, a4);
    v12->_delegate = v11;
    objc_storeStrong((id *)&v12->_serviceName, a3);
    mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), (dispatch_queue_t)v12->_workQueue, 1uLL);
    listener = v12->_listener;
    v12->_listener = mach_service;

    objc_initWeak(&location, v12);
    v23 = v12->_listener;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __57__XPCServiceListener_initWithServiceName_queue_delegate___block_invoke;
    handler[3] = &unk_1E994DCB0;
    v24 = v12;
    v28 = v24;
    objc_copyWeak(&v29, &location);
    xpc_connection_set_event_handler(v23, handler);
    v25 = v24;
    objc_destroyWeak(&v29);

    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)start
{
  _xpc_connection_s *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  -[XPCServiceListener listener](self, "listener");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_resume(v3);

  if (_shouldLogBlock)
  {
    if ((*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(6, CFSTR("%@: Service listener now listening for events for service name %@."), v4, v5, v6, v7, v8, v9, (uint64_t)self);
  }
}

- (void)_workQueueShutDownServiceConnections:(id)a3 index:(unint64_t)a4 completionBlock:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  _QWORD v11[5];
  id v12;
  void (**v13)(_QWORD);
  unint64_t v14;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count") <= a4)
  {
    if (v9)
      v9[2](v9);
  }
  else
  {
    objc_msgSend(v8, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__XPCServiceListener__workQueueShutDownServiceConnections_index_completionBlock___block_invoke;
    v11[3] = &unk_1E994DCD8;
    v11[4] = self;
    v12 = v8;
    v14 = a4;
    v13 = v9;
    objc_msgSend(v10, "shutDownCompletionBlock:", v11);

  }
}

- (void)shutDownCompletionBlock:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;

  v4 = a3;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    _XPCLog(6, CFSTR("%@: Shutting down service listener for service name “%@”."), v5, v6, v7, v8, v9, v10, (uint64_t)self);
  -[XPCServiceListener workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__XPCServiceListener_shutDownCompletionBlock___block_invoke;
  block[3] = &unk_1E994DC10;
  block[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_async(v11, block);

}

- (void)workQueueHandleIncomingConnection:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  XPCServiceListenerDelegate *v10;
  id v11;
  dispatch_queue_t v12;
  XPCServiceConnection *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _xpc_connection_s *connection;

  connection = (_xpc_connection_s *)a3;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    _XPCLog(6, CFSTR("%@: Client connected: %p"), v4, v5, v6, v7, v8, v9, (uint64_t)self);
  v10 = self->_delegate;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && !-[XPCServiceListenerDelegate XPCServiceListener:shouldAcceptNewConnection:](v10, "XPCServiceListener:shouldAcceptNewConnection:", self, connection))
  {
    xpc_connection_cancel(connection);
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
    {
      xpc_connection_get_pid(connection);
      _XPCLog(6, CFSTR("%@: Rejecting client connection from PID %d"), v20, v21, v22, v23, v24, v25, (uint64_t)self);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPCKit.%@.client.%lu"), self->_serviceName, self->_clientCount);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    v13 = -[XPCServiceConnection initWithServiceName:client:queue:]([XPCServiceConnection alloc], "initWithServiceName:client:queue:", self->_serviceName, connection, v12);
    -[XPCServiceConnection setServiceListener:](v13, "setServiceListener:", self);
    -[NSMutableSet addObject:](self->_serviceConnections, "addObject:", v13);
    ++self->_clientCount;
    if (_shouldLogBlock
      && (*(unsigned int (**)(uint64_t, uint64_t))(_shouldLogBlock + 16))(_shouldLogBlock, 6))
    {
      xpc_connection_get_pid(connection);
      _XPCLog(6, CFSTR("%@: Established new client connection from PID %d"), v14, v15, v16, v17, v18, v19, (uint64_t)self);
    }
    -[XPCServiceListenerDelegate XPCServiceListener:didReceiveNewConnection:](v10, "XPCServiceListener:didReceiveNewConnection:", self, v13);
    -[XPCServiceConnection resume](v13, "resume");

  }
}

- (void)serviceConnectionDidDisconnect:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;

  v4 = a3;
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    _XPCLog(6, CFSTR("%@: Service connection disconnected."), v5, v6, v7, v8, v9, v10, (uint64_t)self);
  -[XPCServiceListener workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__XPCServiceListener_serviceConnectionDidDisconnect___block_invoke;
  block[3] = &unk_1E994DD00;
  block[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_async(v11, block);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (XPCServiceListenerDelegate)delegate
{
  return self->_delegate;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (NSMutableSet)serviceConnections
{
  return self->_serviceConnections;
}

- (void)setServiceConnections:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnections, a3);
}

- (unint64_t)clientCount
{
  return self->_clientCount;
}

- (void)setClientCount:(unint64_t)a3
{
  self->_clientCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

uint64_t __53__XPCServiceListener_serviceConnectionDidDisconnect___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

void __46__XPCServiceListener_shutDownCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_xpc_connection_s **)(v2 + 32);
  if (v3)
  {
    xpc_connection_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 40), "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__XPCServiceListener_shutDownCompletionBlock___block_invoke_2;
  v8[3] = &unk_1E994DC10;
  v7 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v10 = v7;
  objc_msgSend(v9, "_workQueueShutDownServiceConnections:index:completionBlock:", v6, 0, v8);

}

uint64_t __46__XPCServiceListener_shutDownCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    _XPCLog(6, CFSTR("%@: Shutdown complete."), v2, v3, v4, v5, v6, v7, *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __81__XPCServiceListener__workQueueShutDownServiceConnections_index_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__XPCServiceListener__workQueueShutDownServiceConnections_index_completionBlock___block_invoke_2;
  v7[3] = &unk_1E994DCD8;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v6 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8 = v4;
  v10 = v5;
  v9 = v6;
  dispatch_async(v2, v7);

}

uint64_t __81__XPCServiceListener__workQueueShutDownServiceConnections_index_completionBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueueShutDownServiceConnections:index:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

void __57__XPCServiceListener_initWithServiceName_queue_delegate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _xpc_connection_s *v30;
  uint64_t v31;
  void *v32;
  xpc_object_t xdict;

  xdict = a2;
  v3 = MEMORY[0x1D82700DC]();
  if (v3 == MEMORY[0x1E0C812E0])
  {
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(6, CFSTR("%@: Received new client connection."), v10, v11, v12, v13, v14, v15, *(_QWORD *)(a1 + 32));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "workQueueHandleIncomingConnection:", xdict);

  }
  else if (v3 == MEMORY[0x1E0C81310])
  {
    if (xdict == (xpc_object_t)MEMORY[0x1E0C81260])
    {
      if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
        _XPCLog(6, CFSTR("%@: Client disconnected."), v24, v25, v26, v27, v28, v29, *(_QWORD *)(a1 + 32));
    }
    else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    {
      v17 = *(_QWORD *)(a1 + 32);
      xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
      _XPCLog(3, CFSTR("%@: Found XPC error related to a client connection: %s"), v18, v19, v20, v21, v22, v23, v17);
    }
    v30 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 32) + 32);
    if (v30)
    {
      xpc_connection_cancel(v30);
      v31 = *(_QWORD *)(a1 + 32);
      v32 = *(void **)(v31 + 32);
      *(_QWORD *)(v31 + 32) = 0;

    }
  }
  else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
  {
    _XPCLog(3, CFSTR("%@: Ignoring unexpected XPC event type."), v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 32));
  }

}

@end
