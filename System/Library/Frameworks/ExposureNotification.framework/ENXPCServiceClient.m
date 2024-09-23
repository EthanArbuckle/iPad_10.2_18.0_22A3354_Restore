@implementation ENXPCServiceClient

- (ENXPCServiceClient)init
{
  ENXPCServiceClient *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ENXPCServiceClient;
  v2 = -[ENXPCServiceClient init](&v4, sel_init);
  if (v2)
  {
    if (DefaultDispatchQueue_onceToken != -1)
      dispatch_once(&DefaultDispatchQueue_onceToken, &__block_literal_global_1);
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)DefaultDispatchQueue_defaultQueue);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ENXPCServiceClient _invalidateForced:](self, "_invalidateForced:", 1);
  v3.receiver = self;
  v3.super_class = (Class)ENXPCServiceClient;
  -[ENXPCServiceClient dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[ENXPCServiceClient _invalidateForced:](self, "_invalidateForced:", 1);
}

- (void)_invalidateForced:(BOOL)a3
{
  os_unfair_lock_s *p_lock;
  OS_xpc_object *xpcConnection;
  _BOOL4 invalidated;
  OS_xpc_object *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
    xpc_connection_cancel(xpcConnection);
  invalidated = self->_invalidated;
  self->_invalidated = 1;
  v8 = self->_xpcConnection;
  self->_xpcConnection = 0;

  os_unfair_lock_unlock(p_lock);
  if (!invalidated
    && !a3
    && gLogCategory__ENXPCServiceClient <= 90
    && (gLogCategory__ENXPCServiceClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (id)getXPCConnectionAndReturnError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[ENXPCServiceClient _ensureXPCStartedAndReturnError:](self, "_ensureXPCStartedAndReturnError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_ensureXPCStartedAndReturnError:(id *)a3
{
  OS_xpc_object *v5;
  OS_xpc_object *v6;
  OS_xpc_object *v7;
  OS_xpc_object *v8;
  _xpc_connection_s *v9;
  _xpc_connection_s *v10;
  objc_class *v12;
  void *v13;
  _QWORD handler[5];
  _xpc_connection_s *v15;

  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_invalidated)
  {
    if (a3)
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ENErrorF(10);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
  else
  {
    v5 = self->_xpcConnection;
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      v7 = self->_testListenerEndpoint;
      v8 = v7;
      if (v7)
      {
        v9 = xpc_connection_create_from_endpoint(v7);
        xpc_connection_set_target_queue(v9, (dispatch_queue_t)self->_dispatchQueue);
      }
      else
      {
        v9 = xpc_connection_create("com.apple.ExposureNotificationService", (dispatch_queue_t)self->_dispatchQueue);
      }
      objc_storeStrong((id *)&self->_xpcConnection, v9);
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __54__ENXPCServiceClient__ensureXPCStartedAndReturnError___block_invoke;
      handler[3] = &unk_24C38B4B0;
      handler[4] = self;
      v10 = v9;
      v15 = v10;
      xpc_connection_set_event_handler(v10, handler);
      xpc_connection_activate(v10);
      v6 = v10;

    }
    return v6;
  }
}

_QWORD *__54__ENXPCServiceClient__ensureXPCStartedAndReturnError___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[2] == *(_QWORD *)(a1 + 40))
    return (_QWORD *)objc_msgSend(result, "_xpcReceivedEvent:", a2);
  return result;
}

- (void)_xpcReceivedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (v4 != (id)MEMORY[0x24BDACF30])
  {
    v13 = v4;
    if (v4 == (id)MEMORY[0x24BDACF38])
    {
      -[ENXPCServiceClient _invalidateForced:](self, "_invalidateForced:", 0);
    }
    else
    {
      CUXPCDecodeNSErrorIfNeeded();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        ENErrorF(1);
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;

      if (gLogCategory__ENXPCServiceClient <= 90
        && (gLogCategory__ENXPCServiceClient != -1 || _LogCategory_Initialize()))
      {
        CUPrintNSError();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintXPC();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
    goto LABEL_17;
  }
  if (gLogCategory__ENXPCServiceClient <= 90)
  {
    v13 = v4;
    if (gLogCategory__ENXPCServiceClient != -1 || (v11 = _LogCategory_Initialize(), v5 = v13, v11))
    {
      LogPrintF_safe();
LABEL_17:
      v5 = v13;
    }
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (OS_xpc_object)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
