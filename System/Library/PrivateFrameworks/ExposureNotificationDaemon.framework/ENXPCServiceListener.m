@implementation ENXPCServiceListener

+ (id)sharedServiceListener
{
  if (sharedServiceListener_once != -1)
    dispatch_once(&sharedServiceListener_once, &__block_literal_global_0);
  return (id)sharedServiceListener_sharedListener;
}

void __45__ENXPCServiceListener_sharedServiceListener__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ENXPCServiceListener _init]([ENXPCServiceListener alloc], "_init");
  v1 = (void *)sharedServiceListener_sharedListener;
  sharedServiceListener_sharedListener = (uint64_t)v0;

}

- (id)_init
{
  ENXPCServiceListener *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *dispatchQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ENXPCServiceListener;
  v2 = -[ENXPCServiceListener init](&v10, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (id)initAnonymousListener
{
  dispatch_queue_t *v2;
  dispatch_queue_t *v3;
  xpc_connection_t v4;
  dispatch_queue_t v5;

  v2 = -[ENXPCServiceListener _init](self, "_init");
  v3 = v2;
  if (v2)
  {
    v4 = xpc_connection_create(0, v2[3]);
    v5 = v3[2];
    v3[2] = (dispatch_queue_t)v4;

  }
  return v3;
}

- (void)activate
{
  OS_xpc_object *v3;
  _xpc_connection_s *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD handler[5];

  v3 = self->_xpcListener;
  if (v3)
  {
    v4 = v3;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __32__ENXPCServiceListener_activate__block_invoke;
    handler[3] = &unk_1E87D9D60;
    handler[4] = self;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_activate(v4);

  }
  else
  {
    v5 = FatalErrorF();
    __32__ENXPCServiceListener_activate__block_invoke(v5, v6);
  }
}

uint64_t __32__ENXPCServiceListener_activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "xpcListenerEvent:", a2);
}

- (void)invalidate
{
  OS_xpc_object *xpcListener;
  OS_xpc_object *v4;
  _xpc_connection_s *v5;

  xpcListener = self->_xpcListener;
  if (xpcListener)
  {
    v5 = xpcListener;
    xpc_connection_cancel(v5);
    v4 = self->_xpcListener;
    self->_xpcListener = 0;

  }
}

- (void)main
{
  if (gLogCategory_ENXPCServiceConnection <= 50
    && (gLogCategory_ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  xpc_main((xpc_connection_handler_t)SharedServiceConnectionHandler);
}

- (void)xpcConnectionAccept:(id)a3
{
  void *v4;
  NSMutableSet *connections;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  _xpc_connection_s *v9;

  v9 = (_xpc_connection_s *)a3;
  xpc_connection_get_pid(v9);
  if (gLogCategory_ENXPCServiceConnection <= 20
    && (gLogCategory_ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
  {
    CUPrintPID();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  +[ENXPCServiceConnection connectionWithXPCConnection:serviceListener:dispatchQueue:](ENXPCServiceConnection, "connectionWithXPCConnection:serviceListener:dispatchQueue:", v9, self, self->_dispatchQueue, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  connections = self->_connections;
  if (!connections)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E28]);
    v7 = self->_connections;
    self->_connections = v6;

    connections = self->_connections;
  }
  -[NSMutableSet addObject:](connections, "addObject:", v4);
  objc_msgSend(v4, "activate");

}

- (OS_xpc_object)xpcEndpoint
{
  OS_xpc_object *xpcListener;

  xpcListener = self->_xpcListener;
  if (xpcListener)
    xpcListener = xpc_endpoint_create(xpcListener);
  return xpcListener;
}

- (void)xpcListenerEvent:(id)a3
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  id v8;

  v8 = a3;
  if (MEMORY[0x1D17A8408]() == MEMORY[0x1E0C812E0])
  {
    -[ENXPCServiceListener xpcConnectionAccept:](self, "xpcConnectionAccept:", v8);
    goto LABEL_7;
  }
  v4 = v8;
  if (v8 == (id)MEMORY[0x1E0C81260])
  {
    if (gLogCategory_ENXPCServiceConnection <= 30)
    {
      if (gLogCategory_ENXPCServiceConnection != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
      {
        LogPrintF_safe();
        goto LABEL_7;
      }
    }
  }
  else if (gLogCategory__ENXPCServiceConnection <= 90)
  {
    if (gLogCategory__ENXPCServiceConnection != -1 || (v5 = _LogCategory_Initialize(), v4 = v8, v5))
    {
      CUPrintXPC();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

LABEL_7:
      v4 = v8;
    }
  }

}

- (void)connectionInvalidated:(id)a3
{
  -[NSMutableSet removeObject:](self->_connections, "removeObject:", a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_connections, 0);
}

@end
