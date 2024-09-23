@implementation GCPlayerIndicatorXPCProxyServerEndpoint

- (GCPlayerIndicatorXPCProxyServerEndpoint)initWithIdentifier:(id)a3 initialValue:(int64_t)a4
{
  id v6;
  GCPlayerIndicatorXPCProxyServerEndpoint *v7;
  uint64_t v8;
  NSObject *identifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GCPlayerIndicatorXPCProxyServerEndpoint;
  v7 = -[GCPlayerIndicatorXPCProxyServerEndpoint init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_playerIndex = a4;
  }

  return v7;
}

- (GCPlayerIndicatorXPCProxyServerEndpoint)initWithInitialValue:(int64_t)a3
{
  void *v5;
  GCPlayerIndicatorXPCProxyServerEndpoint *v6;

  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCPlayerIndicatorXPCProxyServerEndpoint initWithIdentifier:initialValue:](self, "initWithIdentifier:initialValue:", v5, a3);

  return v6;
}

- (_GCControllerComponentDescription)receiverDescription
{
  return (_GCControllerComponentDescription *)-[GCPlayerIndicatorXPCProxyClientEndpointDescription initWithIdentifier:initialPlayerIndex:]([GCPlayerIndicatorXPCProxyClientEndpointDescription alloc], "initWithIdentifier:initialPlayerIndex:", self->_identifier, self->_playerIndex);
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

  OUTLINED_FUNCTION_2_25();
  OUTLINED_FUNCTION_0_31(&dword_215181000, v0, v1, "Dropping remote endpoint for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_28();
}

- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id connectionInterruptionRegistration;
  id connectionInvalidationRegistration;
  _GCIPCEndpointConnection *connection;
  GCPlayerIndicatorXPCProxyRemoteClientEndpointInterface *clientEndpoint;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v20;
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
  v23 = __75__GCPlayerIndicatorXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke;
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
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[GCPlayerIndicatorXPCProxyServerEndpoint acceptClient:onConnection:error:].cold.1();

  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

void __75__GCPlayerIndicatorXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __75__GCPlayerIndicatorXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1();

    }
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

- (void)setPlayerIndex:(int64_t)a3
{
  GCPlayerIndicatorXPCProxyRemoteClientEndpointInterface *v4;
  unint64_t v5;
  int isInternalBuild;
  _GCIPCEndpointConnection *connection;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];

  if (self->_playerIndex != a3)
  {
    self->_playerIndex = a3;
    v4 = self->_clientEndpoint;
    if (v4)
    {
      v5 = self->_pendingUpdates + 1;
      self->_pendingUpdates = v5;
      if (v5 <= 6)
      {
        isInternalBuild = gc_isInternalBuild();
        if (v5 == 6)
        {
          if (isInternalBuild)
          {
            getGCLogger();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
              -[GCPlayerIndicatorXPCProxyServerEndpoint setPlayerIndex:].cold.1();

          }
          -[GCPlayerIndicatorXPCProxyRemoteClientEndpointInterface refreshPlayerIndex](v4, "refreshPlayerIndex");
        }
        else
        {
          if (isInternalBuild)
          {
            getGCLogger();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
              -[GCPlayerIndicatorXPCProxyServerEndpoint setPlayerIndex:].cold.2();

          }
          -[GCPlayerIndicatorXPCProxyRemoteClientEndpointInterface newPlayerIndex:](v4, "newPlayerIndex:", self->_playerIndex);
          if (self->_pendingUpdates == 3)
          {
            connection = self->_connection;
            v10[0] = MEMORY[0x24BDAC760];
            v10[1] = 3221225472;
            v10[2] = __58__GCPlayerIndicatorXPCProxyServerEndpoint_setPlayerIndex___block_invoke;
            v10[3] = &unk_24D2B2B20;
            v10[4] = self;
            -[_GCIPCEndpointConnection scheduleSendBarrierBlock:](connection, "scheduleSendBarrierBlock:", v10);
          }
        }
      }
    }

  }
}

uint64_t __58__GCPlayerIndicatorXPCProxyServerEndpoint_setPlayerIndex___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

- (void)newPlayerIndex:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__GCPlayerIndicatorXPCProxyServerEndpoint_newPlayerIndex___block_invoke;
  v3[3] = &unk_24D2B4240;
  v3[4] = self;
  v3[5] = a3;
  _os_activity_initiate(&dword_215181000, "(Player Indicator XPC Proxy Server Endpoint) New Player Index", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

void __58__GCPlayerIndicatorXPCProxyServerEndpoint_newPlayerIndex___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  if (v1 != *(_QWORD *)(v2 + 56))
  {
    *(_QWORD *)(v2 + 56) = v1;
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(WeakRetained, "playerIndicatorXPCProxyServerEndpoint:didReceivePlayerIndexChange:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)fetchPlayerIndexWithReply:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __69__GCPlayerIndicatorXPCProxyServerEndpoint_fetchPlayerIndexWithReply___block_invoke;
  activity_block[3] = &unk_24D2B2CA0;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(Player Indicator XPC Proxy Server Endpoint) Fetch Player Index", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __69__GCPlayerIndicatorXPCProxyServerEndpoint_fetchPlayerIndexWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__GCPlayerIndicatorXPCProxyServerEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Player Indicator XPC Proxy Server Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__GCPlayerIndicatorXPCProxyServerEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  -[GCPlayerIndicatorXPCProxyServerEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 48, 1);
}

- (int64_t)playerIndex
{
  return self->_playerIndex;
}

- (GCPlayerIndicatorXPCProxyServerEndpointDelegate)delegate
{
  return (GCPlayerIndicatorXPCProxyServerEndpointDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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

  OUTLINED_FUNCTION_2_25();
  OUTLINED_FUNCTION_0_31(&dword_215181000, v0, v1, "Client has arrived for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_28();
}

void __75__GCPlayerIndicatorXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_25();
  OUTLINED_FUNCTION_0_31(&dword_215181000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_28();
}

- (void)setPlayerIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_25();
  OUTLINED_FUNCTION_0_31(&dword_215181000, v0, v1, "Sending player index refresh request to remote endpoint: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_28();
}

- (void)setPlayerIndex:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_25();
  OUTLINED_FUNCTION_0_31(&dword_215181000, v0, v1, "Sending new player index to remote endpoint: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_28();
}

@end
