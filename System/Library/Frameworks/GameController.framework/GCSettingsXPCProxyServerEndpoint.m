@implementation GCSettingsXPCProxyServerEndpoint

- (GCSettingsXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialValueForProfile:(id)a4
{
  id v6;
  id v7;
  GCSettingsXPCProxyServerEndpoint *v8;
  uint64_t v9;
  NSObject *identifier;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GCSettingsXPCProxyServerEndpoint;
  v8 = -[GCSettingsXPCProxyServerEndpoint init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_settingsProfile, a4);
  }

  return v8;
}

- (GCSettingsXPCProxyServerEndpoint)initWithInitialValueForProfile:(id)a3
{
  id v4;
  void *v5;
  GCSettingsXPCProxyServerEndpoint *v6;

  v4 = a3;
  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCSettingsXPCProxyServerEndpoint initWithIdentifier:initialValueForProfile:](self, "initWithIdentifier:initialValueForProfile:", v5, v4);

  return v6;
}

- (_GCControllerComponentDescription)receiverDescription
{
  return (_GCControllerComponentDescription *)-[GCSettingsXPCProxyClientEndpointDescription initWithIdentifier:initialValueForProfile:]([GCSettingsXPCProxyClientEndpointDescription alloc], "initWithIdentifier:initialValueForProfile:", self->_identifier, self->_settingsProfile);
}

- (void)invalidateClient
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_17(&dword_215181000, v0, v1, "Dropping remote endpoint for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_16();
}

- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id connectionInterruptionRegistration;
  id connectionInvalidationRegistration;
  _GCIPCEndpointConnection *connection;
  GCSettingsXPCProxyRemoteClientEndpointInterface *clientEndpoint;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  connectionInterruptionRegistration = self->_connectionInterruptionRegistration;
  self->_connectionInterruptionRegistration = 0;

  connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_connectionInvalidationRegistration = 0;

  connection = self->_connection;
  self->_connection = 0;

  clientEndpoint = self->_clientEndpoint;
  self->_clientEndpoint = 0;

  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __68__GCSettingsXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke;
  v24 = &unk_24D2B2C50;
  objc_copyWeak(&v25, &location);
  v14 = (void *)MEMORY[0x2199DEBB0](&v21);
  objc_msgSend(v9, "addInterruptionHandler:", v14, v21, v22, v23, v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self->_connectionInterruptionRegistration;
  self->_connectionInterruptionRegistration = v15;

  objc_msgSend(v9, "addInvalidationHandler:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_connectionInvalidationRegistration;
  self->_connectionInvalidationRegistration = v17;

  objc_storeStrong((id *)&self->_connection, a4);
  objc_storeStrong((id *)&self->_clientEndpoint, a3);
  self->_pendingUpdates = 0;
  getGCSettingsLogger();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[GCSettingsXPCProxyServerEndpoint acceptClient:onConnection:error:].cold.1();

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

void __68__GCSettingsXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    getGCSettingsLogger();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __68__GCSettingsXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1();

    v3 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v5 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

- (void)setSettingsProfile:(id)a3
{
  id v5;
  GCSettingsXPCProxyRemoteClientEndpointInterface *v6;
  unint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _GCIPCEndpointConnection *connection;
  _QWORD v11[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_settingsProfile, a3);
  v6 = self->_clientEndpoint;
  if (v6)
  {
    v7 = self->_pendingUpdates + 1;
    self->_pendingUpdates = v7;
    if (v7 <= 6)
    {
      getGCSettingsLogger();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
      if (v7 == 6)
      {
        if (v9)
          -[GCSettingsXPCProxyServerEndpoint setSettingsProfile:].cold.1();

        -[GCSettingsXPCProxyRemoteClientEndpointInterface refreshProfile](v6, "refreshProfile");
      }
      else
      {
        if (v9)
          -[GCSettingsXPCProxyServerEndpoint setSettingsProfile:].cold.2();

        -[GCSettingsXPCProxyRemoteClientEndpointInterface newProfile:](v6, "newProfile:", v5);
        if (self->_pendingUpdates == 3)
        {
          connection = self->_connection;
          v11[0] = MEMORY[0x24BDAC760];
          v11[1] = 3221225472;
          v11[2] = __55__GCSettingsXPCProxyServerEndpoint_setSettingsProfile___block_invoke;
          v11[3] = &unk_24D2B2B20;
          v11[4] = self;
          -[_GCIPCEndpointConnection scheduleSendBarrierBlock:](connection, "scheduleSendBarrierBlock:", v11);
        }
      }
    }
  }

}

uint64_t __55__GCSettingsXPCProxyServerEndpoint_setSettingsProfile___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

- (void)fetchProfileWithReply:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __58__GCSettingsXPCProxyServerEndpoint_fetchProfileWithReply___block_invoke;
  activity_block[3] = &unk_24D2B2CA0;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(Settings XPC Proxy Server Endpoint) Fetch Profile", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __58__GCSettingsXPCProxyServerEndpoint_fetchProfileWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__GCSettingsXPCProxyServerEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Settings XPC Proxy Server Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __56__GCSettingsXPCProxyServerEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = 0;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = 0;

}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[GCSettingsXPCProxyServerEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 48, 1);
}

- (GCSProfile)settingsProfile
{
  return self->_settingsProfile;
}

- (GCSettingsXPCProxyServerEndpointDelegate)delegate
{
  return (GCSettingsXPCProxyServerEndpointDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settingsProfile, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_clientEndpoint, 0);
}

- (void)acceptClient:onConnection:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_17(&dword_215181000, v0, v1, "Client has arrived for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_16();
}

void __68__GCSettingsXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_17(&dword_215181000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_16();
}

- (void)setSettingsProfile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_17(&dword_215181000, v0, v1, "Sending settings refresh request to remote endpoint: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_16();
}

- (void)setSettingsProfile:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_17(&dword_215181000, v0, v1, "Sending new settings to remote endpoint: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_16();
}

@end
