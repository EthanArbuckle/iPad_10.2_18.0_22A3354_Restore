@implementation MROutputDevicePicker

- (MROutputDevicePicker)initWithConfiguration:(id)a3
{
  id v5;
  MROutputDevicePicker *v6;
  MROutputDevicePicker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MROutputDevicePicker;
  v6 = -[MROutputDevicePicker init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_configuration, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MROutputDevicePicker;
  -[MROutputDevicePicker dealloc](&v3, sel_dealloc);
}

- (void)present
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = (void *)MEMORY[0x1E0CB36F8];
  -[MROutputDevicePicker configuration](self, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[MROutputDevicePicker listener](self, "listener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_endpoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C80D38];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __31__MROutputDevicePicker_present__block_invoke;
  v11[3] = &unk_1E30CEDB8;
  objc_copyWeak(&v12, &location);
  MRMediaRemotePresentOutputDevicePicker(v5, v8, v9, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __31__MROutputDevicePicker_present__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "reset");

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_storeStrong((id *)&self->_connection, a4);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE306468);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRemoteObjectInterface:", v8);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2F2500);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __59__MROutputDevicePicker_listener_shouldAcceptNewConnection___block_invoke;
  v14 = &unk_1E30C6AA0;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v7, "setInvalidationHandler:", &v11);
  objc_msgSend(v7, "resume", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return 1;
}

void __59__MROutputDevicePicker_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reset");

}

- (NSXPCListener)listener
{
  NSXPCListener *listener;
  NSXPCListener *v4;
  NSXPCListener *v5;

  listener = self->_listener;
  if (!listener)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v4 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    v5 = self->_listener;
    self->_listener = v4;

    -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
    -[NSXPCListener activate](self->_listener, "activate");
    listener = self->_listener;
  }
  return listener;
}

- (void)reset
{
  if (self->_dismissHandler)
    dispatch_async(MEMORY[0x1E0C80D38], self->_dismissHandler);
}

- (MROutputDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
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
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
