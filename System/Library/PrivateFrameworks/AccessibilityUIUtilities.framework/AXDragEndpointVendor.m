@implementation AXDragEndpointVendor

- (AXDragEndpointVendor)initWithXPCListener:(id)a3
{
  id v5;
  AXDragEndpointVendor *v6;
  AXDragEndpointVendor *v7;
  uint64_t v8;
  NSMutableSet *activeConnections;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXDragEndpointVendor;
  v6 = -[AXDragEndpointVendor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_listener, a3);
    -[NSXPCListener setDelegate:](v7->_listener, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    activeConnections = v7->_activeConnections;
    v7->_activeConnections = (NSMutableSet *)v8;

  }
  return v7;
}

- (void)resume
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  AXDragEndpointRequestSatisfier *v6;

  v5 = a4;
  v6 = -[AXDragEndpointRequestSatisfier initWithConnection:]([AXDragEndpointRequestSatisfier alloc], "initWithConnection:", v5);

  -[AXDragEndpointRequestSatisfier setDelegate:](v6, "setDelegate:", self);
  -[NSMutableSet addObject:](self->_activeConnections, "addObject:", v6);

  return 1;
}

- (id)endpointForConnection:(id)a3 forEndpointRequestSatisfier:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[AXDragEndpointVendor delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endpointForRequestingConnection:fromEndpointVendor:", v5, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)endpointRequestSatisfierDidDisconnect:(id)a3
{
  -[NSMutableSet removeObject:](self->_activeConnections, "removeObject:", a3);
}

- (AXDragEndpointVendorDelegate)delegate
{
  return (AXDragEndpointVendorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeConnections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
