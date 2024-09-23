@implementation ACCTransportClientBridge

- (ACCTransportClientBridge)init
{
  ACCTransportClientBridge *v2;
  ACCTransportClient *v3;
  ACCTransportClient *transportClient;
  id connectionAuthStatusChangedHandler;
  id connectionPropertiesChangedHandler;
  id endpointPropertiesChangedHandler;
  id serverDisconnectedHandler;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ACCTransportClientBridge;
  v2 = -[ACCTransportClientBridge init](&v10, sel_init);
  if (v2)
  {
    v3 = -[ACCTransportClient _init]([ACCTransportClient alloc], "_init");
    transportClient = v2->_transportClient;
    v2->_transportClient = v3;

    -[ACCTransportClient setDelegate:](v2->_transportClient, "setDelegate:", v2);
    connectionAuthStatusChangedHandler = v2->_connectionAuthStatusChangedHandler;
    v2->_connectionAuthStatusChangedHandler = 0;

    connectionPropertiesChangedHandler = v2->_connectionPropertiesChangedHandler;
    v2->_connectionPropertiesChangedHandler = 0;

    endpointPropertiesChangedHandler = v2->_endpointPropertiesChangedHandler;
    v2->_endpointPropertiesChangedHandler = 0;

    serverDisconnectedHandler = v2->_serverDisconnectedHandler;
    v2->_serverDisconnectedHandler = 0;

  }
  return v2;
}

- (void)transportClient:(id)a3 authStatusDidChange:(BOOL)a4 forConnectionWithUUID:(id)a5
{
  _BOOL8 v5;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v5 = a4;
  v9 = a5;
  -[ACCTransportClientBridge connectionAuthStatusChangedHandler](self, "connectionAuthStatusChangedHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[ACCTransportClientBridge connectionAuthStatusChangedHandler](self, "connectionAuthStatusChangedHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _BOOL8))v8)[2](v8, v9, v5);

  }
}

- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forConnectionWithUUID:(id)a5 previousProperties:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v13;

  v13 = a4;
  v9 = a5;
  v10 = a6;
  -[ACCTransportClientBridge connectionPropertiesChangedHandler](self, "connectionPropertiesChangedHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ACCTransportClientBridge connectionPropertiesChangedHandler](self, "connectionPropertiesChangedHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id))v12)[2](v12, v9, v13, v10);

  }
}

- (void)transportClient:(id)a3 propertiesDidChange:(id)a4 forEndpointWithUUID:(id)a5 previousProperties:(id)a6 connectionUUID:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v16;

  v16 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  -[ACCTransportClientBridge endpointPropertiesChangedHandler](self, "endpointPropertiesChangedHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[ACCTransportClientBridge endpointPropertiesChangedHandler](self, "endpointPropertiesChangedHandler");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, id))v15)[2](v15, v11, v16, v12, v13);

  }
}

- (void)transportClientServerDisconnected:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[ACCTransportClientBridge serverDisconnectedHandler](self, "serverDisconnectedHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ACCTransportClientBridge serverDisconnectedHandler](self, "serverDisconnectedHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
}

+ (id)sharedBridge
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ACCTransportClientBridge_sharedBridge__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBridge_once != -1)
    dispatch_once(&sharedBridge_once, block);
  return (id)sharedBridge_sharedInstance;
}

void __40__ACCTransportClientBridge_sharedBridge__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedBridge_sharedInstance;
  sharedBridge_sharedInstance = (uint64_t)v1;

}

- (ACCTransportClient)transportClient
{
  return self->_transportClient;
}

- (void)setTransportClient:(id)a3
{
  objc_storeStrong((id *)&self->_transportClient, a3);
}

- (id)connectionAuthStatusChangedHandler
{
  return self->_connectionAuthStatusChangedHandler;
}

- (void)setConnectionAuthStatusChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)connectionPropertiesChangedHandler
{
  return self->_connectionPropertiesChangedHandler;
}

- (void)setConnectionPropertiesChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)endpointPropertiesChangedHandler
{
  return self->_endpointPropertiesChangedHandler;
}

- (void)setEndpointPropertiesChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)serverDisconnectedHandler
{
  return self->_serverDisconnectedHandler;
}

- (void)setServerDisconnectedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serverDisconnectedHandler, 0);
  objc_storeStrong(&self->_endpointPropertiesChangedHandler, 0);
  objc_storeStrong(&self->_connectionPropertiesChangedHandler, 0);
  objc_storeStrong(&self->_connectionAuthStatusChangedHandler, 0);
  objc_storeStrong((id *)&self->_transportClient, 0);
}

@end
