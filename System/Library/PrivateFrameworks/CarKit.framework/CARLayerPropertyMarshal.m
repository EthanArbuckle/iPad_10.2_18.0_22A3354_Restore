@implementation CARLayerPropertyMarshal

- (CARLayerPropertyMarshal)init
{
  CARLayerPropertyMarshal *v2;
  CARLayerPropertyMarshal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CARLayerPropertyMarshal;
  v2 = -[CARLayerPropertyMarshal init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CARLayerPropertyMarshal _setupConnection](v2, "_setupConnection");
  return v3;
}

- (void)sendLayerProperties:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CARLayerPropertyMarshal connection](self, "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendLayerProperties:", v4);

}

- (void)invalidate
{
  void *v3;

  -[CARLayerPropertyMarshal connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[CARLayerPropertyMarshal setConnection:](self, "setConnection:", 0);
}

- (void)_setupConnection
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.carkit.layer-metadata"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9AC2B8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__CARLayerPropertyMarshal__setupConnection__block_invoke;
  v8[3] = &unk_1E5428130;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __43__CARLayerPropertyMarshal__setupConnection__block_invoke_2;
  v6[3] = &unk_1E5428130;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_msgSend(v3, "resume");
  -[CARLayerPropertyMarshal setConnection:](self, "setConnection:", v3);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __43__CARLayerPropertyMarshal__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionReset");

}

void __43__CARLayerPropertyMarshal__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)_handleConnectionReset
{
  -[CARLayerPropertyMarshal setConnection:](self, "setConnection:", 0);
  -[CARLayerPropertyMarshal _setupConnection](self, "_setupConnection");
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
