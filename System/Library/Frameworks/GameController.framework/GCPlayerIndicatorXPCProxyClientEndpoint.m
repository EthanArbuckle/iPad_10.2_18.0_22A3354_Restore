@implementation GCPlayerIndicatorXPCProxyClientEndpoint

- (GCPlayerIndicatorXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialPlayerIndex:(int64_t)a4
{
  id v6;
  GCPlayerIndicatorXPCProxyClientEndpoint *v7;
  uint64_t v8;
  NSObject *identifier;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCPlayerIndicatorXPCProxyClientEndpoint;
  v7 = -[GCPlayerIndicatorXPCProxyClientEndpoint init](&v12, sel_init);
  if (v7)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v6;
        v15 = 2048;
        v16 = a4;
        _os_log_impl(&dword_215181000, v11, OS_LOG_TYPE_INFO, "GCPlayerIndicatorXPCProxyClientEndpoint initWithIdentifier: %@ initialPlayerIndex: %ld", buf, 0x16u);
      }

    }
    v8 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v7->_identifier;
    v7->_identifier = v8;

    v7->_playerIndex = a4;
  }

  return v7;
}

- (GCPlayerIndicatorXPCProxyClientEndpoint)init
{
  -[GCPlayerIndicatorXPCProxyClientEndpoint doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)setRemoteEndpoint:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id connectionInterruptionRegistration;
  void *v12;
  id connectionInvalidationRegistration;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v7 = a3;
  v8 = a4;
  objc_initWeak(&location, self);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __72__GCPlayerIndicatorXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
  v18 = &unk_24D2B2C50;
  objc_copyWeak(&v19, &location);
  v9 = (void *)MEMORY[0x2199DEBB0](&v15);
  objc_msgSend(v8, "addInterruptionHandler:", v9, v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  connectionInterruptionRegistration = self->_connectionInterruptionRegistration;
  self->_connectionInterruptionRegistration = v10;

  objc_msgSend(v8, "addInvalidationHandler:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  connectionInvalidationRegistration = self->_connectionInvalidationRegistration;
  self->_connectionInvalidationRegistration = v12;

  objc_storeStrong((id *)&self->_serverEndpoint, a3);
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[GCPlayerIndicatorXPCProxyClientEndpoint setRemoteEndpoint:connection:].cold.1();

  }
  -[GCPlayerIndicatorXPCProxyClientEndpoint refreshPlayerIndex](self, "refreshPlayerIndex");

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __72__GCPlayerIndicatorXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
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
        __72__GCPlayerIndicatorXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();

    }
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v4 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

  }
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void)setPlayerIndex:(int64_t)a3
{
  self->_playerIndex = a3;
  -[GCPlayerIndicatorXPCProxyRemoteServerEndpointInterface newPlayerIndex:](self->_serverEndpoint, "newPlayerIndex:");
}

- (void)_remoteEndpointSetPlayerIndex:(int64_t)a3
{
  id WeakRetained;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("playerIndex"));
    self->_playerIndex = a3;
    objc_msgSend(v6, "didChangeValueForKey:", CFSTR("playerIndex"));
    WeakRetained = v6;
  }

}

- (void)newPlayerIndex:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__GCPlayerIndicatorXPCProxyClientEndpoint_newPlayerIndex___block_invoke;
  v3[3] = &unk_24D2B4240;
  v3[4] = self;
  v3[5] = a3;
  _os_activity_initiate(&dword_215181000, "(Player Indicator XPC Proxy Client Endpoint) New Player Index", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

uint64_t __58__GCPlayerIndicatorXPCProxyClientEndpoint_newPlayerIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointSetPlayerIndex:", *(_QWORD *)(a1 + 40));
}

- (void)refreshPlayerIndex
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__GCPlayerIndicatorXPCProxyClientEndpoint_refreshPlayerIndex__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Player Indicator XPC Proxy Client Endpoint) Refresh Player Index", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __61__GCPlayerIndicatorXPCProxyClientEndpoint_refreshPlayerIndex__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__GCPlayerIndicatorXPCProxyClientEndpoint_refreshPlayerIndex__block_invoke_2;
  v4[3] = &unk_24D2B65E0;
  v4[4] = v1;
  return objc_msgSend(v2, "fetchPlayerIndexWithReply:", v4);
}

uint64_t __61__GCPlayerIndicatorXPCProxyClientEndpoint_refreshPlayerIndex__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointSetPlayerIndex:", a2);
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __63__GCPlayerIndicatorXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Player Indicator XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __63__GCPlayerIndicatorXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = 0;

}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[GCPlayerIndicatorXPCProxyClientEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (int64_t)playerIndex
{
  return self->_playerIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_connectionInvalidationRegistration, 0);
  objc_storeStrong(&self->_connectionInterruptionRegistration, 0);
  objc_storeStrong((id *)&self->_serverEndpoint, 0);
  objc_destroyWeak((id *)&self->_controller);
}

- (void)setRemoteEndpoint:connection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_25();
  OUTLINED_FUNCTION_0_31(&dword_215181000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_28();
}

void __72__GCPlayerIndicatorXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
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

@end
