@implementation BMXPCListener

+ (id)anonymousListenerWithQueue:(id)a3
{
  NSObject *v3;
  xpc_connection_t v4;
  id v5;

  v3 = a3;
  v4 = xpc_connection_create(0, v3);
  v5 = -[BMXPCListener _initWithType:connection:queue:]([BMXPCListener alloc], "_initWithType:connection:queue:", 1, v4, v3);

  return v5;
}

+ (id)serviceListener
{
  if (serviceListener_onceToken != -1)
    dispatch_once(&serviceListener_onceToken, &__block_literal_global_3);
  return (id)serviceListener_serviceListener;
}

void __32__BMXPCListener_serviceListener__block_invoke()
{
  BMXPCListener *v0;
  uint64_t v1;
  void *v2;

  v0 = [BMXPCListener alloc];
  v1 = -[BMXPCListener _initWithType:connection:queue:](v0, "_initWithType:connection:queue:", 0, 0, MEMORY[0x1E0C80D38]);
  v2 = (void *)serviceListener_serviceListener;
  serviceListener_serviceListener = v1;

}

- (BMXPCListener)initWithMachServiceName:(id)a3 queue:(id)a4
{
  id v6;
  NSObject *v7;
  xpc_connection_t mach_service;
  BMXPCListener *v9;

  v6 = objc_retainAutorelease(a3);
  v7 = a4;
  mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(v6, "UTF8String"), v7, 1uLL);
  v9 = -[BMXPCListener _initWithType:connection:queue:]([BMXPCListener alloc], "_initWithType:connection:queue:", 2, mach_service, v7);

  return v9;
}

- (id)_initWithType:(unint64_t)a3 connection:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  BMXPCListener *v11;
  id *p_isa;
  _xpc_connection_s *v13;
  void *v14;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMXPCListener;
  v11 = -[BMXPCListener init](&v16, sel_init);
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_queue, a5);
    if (v9)
    {
      objc_storeStrong(p_isa + 2, a4);
      v13 = (_xpc_connection_s *)p_isa[2];
      objc_msgSend(p_isa, "_eventHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_connection_set_event_handler(v13, v14);

    }
  }

  return p_isa;
}

- (id)_eventHandler
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__BMXPCListener__eventHandler__block_invoke;
  v3[3] = &unk_1E5E3CB88;
  v3[4] = self;
  return (id)MEMORY[0x1AF456B84](v3, a2);
}

void __30__BMXPCListener__eventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (MEMORY[0x1AF456F50]() == MEMORY[0x1E0C812E0])
    objc_msgSend(*(id *)(a1 + 32), "_handleConnection:", v3);

}

- (void)_handleConnection:(id)a3
{
  BMXPCListener *v3;
  void *v4;
  id v5;

  v3 = self;
  +[NSXPCConnection bm_connectionWithPeer:queue:](MEMORY[0x1E0CB3B38], a3, self->_queue);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BMXPCListener delegate](v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "listener:shouldAcceptNewConnection:", v3, v5);

  if ((v3 & 1) == 0)
    objc_msgSend(v5, "invalidate");

}

- (NSXPCListenerEndpoint)endpoint
{
  id v3;
  xpc_endpoint_t v4;

  if (self->_type)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
    v4 = xpc_endpoint_create(self->_listener);
    objc_msgSend(v3, "_setEndpoint:", v4);

  }
  else
  {
    v3 = 0;
  }
  return (NSXPCListenerEndpoint *)v3;
}

- (void)setQueue:(id)a3
{
  NSObject *targetq;

  targetq = a3;
  objc_storeStrong((id *)&self->_queue, a3);
  if (self->_type)
    xpc_connection_set_target_queue(self->_listener, targetq);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)activate
{
  if (!self->_type)
    xpc_main((xpc_connection_handler_t)bm_service_connection_handler);
  xpc_connection_activate(self->_listener);
}

- (void)invalidate
{
  if (self->_type)
    xpc_connection_cancel(self->_listener);
}

- (BMXPCListenerDelegate)delegate
{
  return (BMXPCListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
