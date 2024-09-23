@implementation AXDragEndpointRequestSatisfier

- (AXDragEndpointRequestSatisfier)initWithConnection:(id)a3
{
  id v5;
  AXDragEndpointRequestSatisfier *v6;
  AXDragEndpointRequestSatisfier *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AXDragEndpointRequestSatisfier;
  v6 = -[AXDragEndpointRequestSatisfier init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF53E980);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v7->_connection, "setExportedInterface:", v8);

    -[NSXPCConnection setExportedObject:](v7->_connection, "setExportedObject:", v7);
    objc_initWeak(&location, v7);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __53__AXDragEndpointRequestSatisfier_initWithConnection___block_invoke;
    v13 = &unk_1E76AB200;
    objc_copyWeak(&v14, &location);
    -[NSXPCConnection setInvalidationHandler:](v7->_connection, "setInvalidationHandler:", &v10);
    -[NSXPCConnection resume](v7->_connection, "resume", v10, v11, v12, v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __53__AXDragEndpointRequestSatisfier_initWithConnection___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endpointRequestSatisfierDidDisconnect:", WeakRetained);

}

- (void)requestDragEndpoint:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = (void (**)(id, void *))a3;
    -[AXDragEndpointRequestSatisfier delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endpointForConnection:forEndpointRequestSatisfier:", self->_connection, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4[2](v4, v6);
  }
  -[NSXPCConnection invalidate](self->_connection, "invalidate");
}

- (AXDragEndpointRequestSatisfierDelegate)delegate
{
  return (AXDragEndpointRequestSatisfierDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
