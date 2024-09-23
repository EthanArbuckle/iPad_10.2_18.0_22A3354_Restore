@implementation DDUIEndpointPairingInitiator

- (id)initForDeviceTypes:(unsigned int)a3 withTransport:(id)a4
{
  id v7;
  DDUIEndpointPairingInitiator *v8;
  DDUIEndpointPairingInitiator *v9;
  NSObject *v10;
  void *v11;
  objc_super v13;
  uint8_t buf[4];
  DDUIEndpointPairingInitiator *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DDUIEndpointPairingInitiator;
  v8 = -[DDUIEndpointPairingInitiator init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_acceptedDeviceTypes = a3;
    objc_storeStrong((id *)&v8->_transport, a4);
    _DDUICoreLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      DDUIDeviceTypeString(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v15 = v9;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_1C87B2000, v10, OS_LOG_TYPE_DEFAULT, "-[DDUIEndpointPairingInitiator init] {self: %p, deviceTypes: %@, transport: %@}", buf, 0x20u);

    }
  }

  return v9;
}

- (void)setAvailableDevicesChangedHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id availableDevicesChangedHandler;
  int v9;
  DDUIEndpointPairingInitiator *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_availableDevicesChangedHandler != v4)
  {
    _DDUICoreLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x1CAA33E80](v4);
      v9 = 134218242;
      v10 = self;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingInitiator set devices changed handler {self: %p, availableDevicesChangedHandler: %@}", (uint8_t *)&v9, 0x16u);

    }
    v7 = (void *)MEMORY[0x1CAA33E80](v4);
    availableDevicesChangedHandler = self->_availableDevicesChangedHandler;
    self->_availableDevicesChangedHandler = v7;

    -[DDUIEndpointPairingBrowsingTransport setAvailableDevicesChangedHandler:](self->_transport, "setAvailableDevicesChangedHandler:", v4);
  }

}

- (NSArray)availableDevices
{
  return (NSArray *)-[DDUIEndpointPairingBrowsingTransport availableDevices](self->_transport, "availableDevices");
}

- (void)beginWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  DDUIEndpointPairingInitiator *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _DDUICoreLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)MEMORY[0x1CAA33E80](v4);
    v7 = 134218242;
    v8 = self;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1C87B2000, v5, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingInitiator beginning {self: %p, completion: %@}", (uint8_t *)&v7, 0x16u);

  }
  -[DDUIEndpointPairingBrowsingTransport activateForDeviceTypes:withCompletion:](self->_transport, "activateForDeviceTypes:withCompletion:", self->_acceptedDeviceTypes, v4);

}

- (id)pairingSessionForDevice:(id)a3 bundleID:(id)a4 serviceIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  DDUIEndpointPairingBrowsingTransport *transport;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  NSObject *v16;
  DDUIEndpointPairingSession *v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  DDUIEndpointPairingInitiator *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  transport = self->_transport;
  v20 = 0;
  -[DDUIEndpointPairingBrowsingTransport sessionForDevice:bundleID:serviceIdentifier:error:](transport, "sessionForDevice:bundleID:serviceIdentifier:error:", v10, a4, a5, &v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v20;
  v14 = v13;
  if (v12)
    v15 = v13 == 0;
  else
    v15 = 0;
  if (v15)
  {
    _DDUICoreLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v22 = self;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_1C87B2000, v18, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingInitiator creating pairing session {self: %p, device: %@}", buf, 0x16u);
    }

    v17 = -[DDUIEndpointPairingSession initWithTransportSession:mode:]([DDUIEndpointPairingSession alloc], "initWithTransportSession:mode:", v12, 0);
  }
  else
  {
    if (a6)
      *a6 = objc_retainAutorelease(v13);
    _DDUICoreLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v22 = self;
      v23 = 2112;
      v24 = v14;
      v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_1C87B2000, v16, OS_LOG_TYPE_DEFAULT, "DDUIEndpointPairingInitiator failed to creater a pairing session {self: %p, sessionCreationError: %@, device: %@}", buf, 0x20u);
    }

    v17 = 0;
  }

  return v17;
}

- (void)invalidate
{
  DDUIEndpointPairingBrowsingTransport *transport;

  -[DDUIEndpointPairingBrowsingTransport invalidate](self->_transport, "invalidate");
  transport = self->_transport;
  self->_transport = 0;

}

- (id)availableDevicesChangedHandler
{
  return self->_availableDevicesChangedHandler;
}

- (unsigned)acceptedDeviceTypes
{
  return self->_acceptedDeviceTypes;
}

- (void)setAcceptedDeviceTypes:(unsigned int)a3
{
  self->_acceptedDeviceTypes = a3;
}

- (DDUIEndpointPairingBrowsingTransport)transport
{
  return self->_transport;
}

- (void)setTransport:(id)a3
{
  objc_storeStrong((id *)&self->_transport, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong(&self->_availableDevicesChangedHandler, 0);
}

@end
