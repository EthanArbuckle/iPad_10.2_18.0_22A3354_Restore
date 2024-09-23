@implementation NRNSXPCConnection

- (NRNSXPCConnection)initWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  id v6;
  NRNSXPCConnection *v7;
  uint64_t v8;
  NSXPCConnection *connection;

  v6 = a3;
  v7 = -[NRNSXPCConnection init](self, "init");
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", v6, a4);
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v8;

  }
  return v7;
}

- (void)setRemoteObjectInterface:(id)a3
{
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", a3);
}

- (void)setExportedObject:(id)a3
{
  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", a3);
}

- (void)setExportedInterface:(id)a3
{
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", a3);
}

- (void)resume
{
  -[NSXPCConnection resume](self->_connection, "resume");
}

- (id)valueForEntitlement:(id)a3
{
  return (id)-[NSXPCConnection valueForEntitlement:](self->_connection, "valueForEntitlement:", a3);
}

- (NSString)processName
{
  int v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[NRNSXPCConnection processIdentifier](self, "processIdentifier");
  v4 = malloc_type_malloc(0x1000uLL, 0x5C857C46uLL);
  if (!v4)
    goto LABEL_5;
  v5 = v4;
  if (proc_pidpath(v3, v4, 0x1000u) <= 0)
  {
    free(v5);
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PID_%ld"), -[NRNSXPCConnection processIdentifier](self, "processIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    return (NSString *)v6;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  free(v5);
  return (NSString *)v6;
}

- (int)processIdentifier
{
  return -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
}

- (void)setInvalidationHandler:(id)a3
{
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", a3);
}

- (void)setInterruptionHandler:(id)a3
{
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", a3);
}

- (void)_setQueue:(id)a3
{
  -[NSXPCConnection _setQueue:](self->_connection, "_setQueue:", a3);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void *v3;
  NRLoggingXPCProxy *v4;

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](self->_connection, "synchronousRemoteObjectProxyWithErrorHandler:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [NRLoggingXPCProxy alloc];
  -[NRLoggingXPCProxy initWithBlahBlahBlahProxy:]((id *)&v4->super.isa, v3);

  return v4;
}

- (void)runCompletionBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (NRNSXPCConnection)initWithConnection:(id)a3
{
  id v5;
  NRNSXPCConnection *v6;
  NRNSXPCConnection *v7;

  v5 = a3;
  v6 = -[NRNSXPCConnection init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (NSXPCInterface)exportedInterface
{
  return -[NSXPCConnection exportedInterface](self->_connection, "exportedInterface");
}

- (id)exportedObject
{
  return -[NSXPCConnection exportedObject](self->_connection, "exportedObject");
}

- (NSXPCInterface)remoteObjectInterface
{
  return -[NSXPCConnection remoteObjectInterface](self->_connection, "remoteObjectInterface");
}

- (id)remoteObjectProxy
{
  void *v2;
  NRLoggingXPCProxy *v3;

  -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [NRLoggingXPCProxy alloc];
  -[NRLoggingXPCProxy initWithBlahBlahBlahProxy:]((id *)&v3->super.isa, v2);

  return v3;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void *v3;
  NRLoggingXPCProxy *v4;

  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_connection, "remoteObjectProxyWithErrorHandler:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [NRLoggingXPCProxy alloc];
  -[NRLoggingXPCProxy initWithBlahBlahBlahProxy:]((id *)&v4->super.isa, v3);

  return v4;
}

- (id)interruptionHandler
{
  return -[NSXPCConnection interruptionHandler](self->_connection, "interruptionHandler");
}

- (id)invalidationHandler
{
  return -[NSXPCConnection invalidationHandler](self->_connection, "invalidationHandler");
}

- (void)suspend
{
  -[NSXPCConnection suspend](self->_connection, "suspend");
}

- (void)invalidate
{
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
