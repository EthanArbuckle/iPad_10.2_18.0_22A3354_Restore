@implementation CADLocalXPCConnection

- (CADLocalXPCConnection)initWithRemoteObject:(id)a3
{
  id v5;
  CADLocalXPCConnection *v6;
  CADLocalXPCConnection *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CADLocalXPCConnection;
  v6 = -[CADLocalXPCConnection init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_remoteObject, a3);
    v7->_state = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("CADLocalXPCConnectionQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    dispatch_suspend((dispatch_object_t)v7->_queue);
  }

  return v7;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  __int128 v4;

  if (_auditTokenForCurrentProcess_onceToken != -1)
    dispatch_once(&_auditTokenForCurrentProcess_onceToken, &__block_literal_global_1);
  v4 = unk_1EF146158;
  *(_OWORD *)retstr->var0 = _auditTokenForCurrentProcess_token;
  *(_OWORD *)&retstr->var0[4] = v4;
  return self;
}

- (int)processIdentifier
{
  if (_processIdentifierForCurrentProcess_onceToken != -1)
    dispatch_once(&_processIdentifierForCurrentProcess_onceToken, &__block_literal_global_82);
  return _processIdentifierForCurrentProcess_pid;
}

- (void)resume
{
  OUTLINED_FUNCTION_0(&dword_1B6A18000, a1, a3, "Attempt to resume connection that is not suspended.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)invalidate
{
  void *v3;
  void (**v4)(void);

  self->_state = 2;
  -[CADLocalXPCConnection invalidationHandler](self, "invalidationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CADLocalXPCConnection invalidationHandler](self, "invalidationHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  return -[CADLocalXPCConnection _remoteObjectProxyWithErrorHandler:synchronous:](self, "_remoteObjectProxyWithErrorHandler:synchronous:", a3, 0);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return -[CADLocalXPCConnection _remoteObjectProxyWithErrorHandler:synchronous:](self, "_remoteObjectProxyWithErrorHandler:synchronous:", a3, 1);
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3 synchronous:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CADLocalXPCProxyObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  v6 = a3;
  if (self->_remoteObject)
  {
    v7 = -[CADLocalXPCProxyObject initWithWrappedObject:queue:errorHandler:synchronous:connection:]([CADLocalXPCProxyObject alloc], "initWithWrappedObject:queue:errorHandler:synchronous:connection:", self->_remoteObject, self->_queue, v6, v4, self);
  }
  else
  {
    v8 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_FAULT))
      -[CADLocalXPCConnection _remoteObjectProxyWithErrorHandler:synchronous:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

- (BOOL)isValid
{
  return self->_state != 2;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_remoteObject, 0);
}

- (void)_remoteObjectProxyWithErrorHandler:(uint64_t)a3 synchronous:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B6A18000, a1, a3, "Attempt to get a remote object proxy before assigning a remote object", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
