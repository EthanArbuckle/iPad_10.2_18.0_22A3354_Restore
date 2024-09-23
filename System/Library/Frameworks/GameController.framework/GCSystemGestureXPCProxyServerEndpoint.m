@implementation GCSystemGestureXPCProxyServerEndpoint

- (GCSystemGestureXPCProxyServerEndpoint)initWithIdentifier:(id)a3
{
  id v4;
  GCSystemGestureXPCProxyServerEndpoint *v5;
  GCSystemGestureXPCProxyServerEndpoint *v6;
  uint64_t v7;
  NSObject *identifier;
  GCSystemGesturesState *v9;
  GCSystemGesturesState *systemGesturesState;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GCSystemGestureXPCProxyServerEndpoint;
  v5 = -[GCSystemGestureXPCProxyServerEndpoint init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_isSystemGestureObserver = 0;
    v7 = objc_msgSend(v4, "copyWithZone:", 0);
    identifier = v6->_identifier;
    v6->_identifier = v7;

    v9 = objc_alloc_init(GCSystemGesturesState);
    systemGesturesState = v6->_systemGesturesState;
    v6->_systemGesturesState = v9;

  }
  return v6;
}

- (id)initSystemGestureObserverWithIdentifier:(id)a3 initialValue:(id)a4
{
  id v6;
  id v7;
  GCSystemGestureXPCProxyServerEndpoint *v8;
  GCSystemGestureXPCProxyServerEndpoint *v9;
  uint64_t v10;
  NSObject *identifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GCSystemGestureXPCProxyServerEndpoint;
  v8 = -[GCSystemGestureXPCProxyServerEndpoint init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_isSystemGestureObserver = 1;
    v10 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v9->_identifier;
    v9->_identifier = v10;

    objc_storeStrong((id *)&v9->_systemGesturesState, a4);
  }

  return v9;
}

- (id)initSystemGestureObserverWithInitialValue:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[NSUUID UUID](&off_254DEEE48, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GCSystemGestureXPCProxyServerEndpoint initSystemGestureObserverWithIdentifier:initialValue:](self, "initSystemGestureObserverWithIdentifier:initialValue:", v5, v4);

  return v6;
}

- (BOOL)isSystemGestureObserver
{
  return self->_isSystemGestureObserver;
}

- (_GCControllerComponentDescription)receiverDescription
{
  return (_GCControllerComponentDescription *)-[GCSystemGestureXPCProxyClientEndpointDescription initWithIdentifier:initialSystemGesture:isSystemGestureObserver:]([GCSystemGestureXPCProxyClientEndpointDescription alloc], "initWithIdentifier:initialSystemGesture:isSystemGestureObserver:", self->_identifier, self->_systemGesturesState, self->_isSystemGestureObserver);
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

  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_0_25(&dword_215181000, v0, v1, "Dropping remote endpoint for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_24();
}

- (BOOL)acceptClient:(id)a3 onConnection:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id connectionInterruptionRegistration;
  id connectionInvalidationRegistration;
  _GCIPCEndpointConnection *connection;
  GCSystemGestureXPCProxyRemoteClientEndpointInterface *clientEndpoint;
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
  v23 = __73__GCSystemGestureXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke;
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
      -[GCSystemGestureXPCProxyServerEndpoint acceptClient:onConnection:error:].cold.1();

  }
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

void __73__GCSystemGestureXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke(uint64_t a1)
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
        __73__GCSystemGestureXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1();

    }
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v3 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v4 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

- (void)setSystemGesturesState:(id)a3
{
  GCSystemGesturesState *v5;
  GCSystemGestureXPCProxyRemoteClientEndpointInterface *v6;
  unint64_t v7;
  int isInternalBuild;
  _GCIPCEndpointConnection *connection;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];

  v5 = (GCSystemGesturesState *)a3;
  if (self->_systemGesturesState != v5)
  {
    objc_storeStrong((id *)&self->_systemGesturesState, a3);
    v6 = self->_clientEndpoint;
    if (v6)
    {
      v7 = self->_pendingUpdates + 1;
      self->_pendingUpdates = v7;
      if (v7 <= 6)
      {
        isInternalBuild = gc_isInternalBuild();
        if (v7 == 6)
        {
          if (isInternalBuild)
          {
            getGCLogger();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              -[GCSystemGestureXPCProxyServerEndpoint setSystemGesturesState:].cold.1();

          }
          -[GCSystemGestureXPCProxyRemoteClientEndpointInterface refreshSystemGesturesState](v6, "refreshSystemGesturesState");
        }
        else
        {
          if (isInternalBuild)
          {
            getGCLogger();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              -[GCSystemGestureXPCProxyServerEndpoint setSystemGesturesState:].cold.2();

          }
          -[GCSystemGestureXPCProxyRemoteClientEndpointInterface newSystemGesturesState:](v6, "newSystemGesturesState:", self->_systemGesturesState);
          if (self->_pendingUpdates == 3)
          {
            connection = self->_connection;
            v12[0] = MEMORY[0x24BDAC760];
            v12[1] = 3221225472;
            v12[2] = __64__GCSystemGestureXPCProxyServerEndpoint_setSystemGesturesState___block_invoke;
            v12[3] = &unk_24D2B2B20;
            v12[4] = self;
            -[_GCIPCEndpointConnection scheduleSendBarrierBlock:](connection, "scheduleSendBarrierBlock:", v12);
          }
        }
      }
    }

  }
}

uint64_t __64__GCSystemGestureXPCProxyServerEndpoint_setSystemGesturesState___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

- (void)disableSystemGestureForInput:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __70__GCSystemGestureXPCProxyServerEndpoint_disableSystemGestureForInput___block_invoke;
  activity_block[3] = &unk_24D2B2B48;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(SystemGesture XPC Proxy Server Endpoint) Disable system gesture with input name", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __70__GCSystemGestureXPCProxyServerEndpoint_disableSystemGestureForInput___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(WeakRetained, "systemGestureXPCProxyServerEndpoint:disableSystemGestureForInput:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)enableSystemGestureForInput:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __69__GCSystemGestureXPCProxyServerEndpoint_enableSystemGestureForInput___block_invoke;
  activity_block[3] = &unk_24D2B2B48;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(SystemGesture XPC Proxy Server Endpoint) Enable system gesture with input name", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __69__GCSystemGestureXPCProxyServerEndpoint_enableSystemGestureForInput___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 72));
  objc_msgSend(WeakRetained, "systemGestureXPCProxyServerEndpoint:enableSystemGestureForInput:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)fetchSystemGesturesStateWithReply:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __75__GCSystemGestureXPCProxyServerEndpoint_fetchSystemGesturesStateWithReply___block_invoke;
  activity_block[3] = &unk_24D2B2CA0;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(SystemGesture XPC Proxy Server Endpoint) Fetch GCSystemGesturesState", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __75__GCSystemGestureXPCProxyServerEndpoint_fetchSystemGesturesStateWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__GCSystemGestureXPCProxyServerEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(SystemGesture XPC Proxy Server Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __61__GCSystemGestureXPCProxyServerEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  -[GCSystemGestureXPCProxyServerEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 56, 1);
}

- (GCSystemGesturesState)systemGesturesState
{
  return self->_systemGesturesState;
}

- (GCSystemGestureXPCProxyServerEndpointDelegate)delegate
{
  return (GCSystemGestureXPCProxyServerEndpointDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_systemGesturesState, 0);
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

  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_0_25(&dword_215181000, v0, v1, "Client has arrived for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_24();
}

void __73__GCSystemGestureXPCProxyServerEndpoint_acceptClient_onConnection_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_0_25(&dword_215181000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_24();
}

- (void)setSystemGesturesState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_0_25(&dword_215181000, v0, v1, "Sending systemGesture refresh request to remote endpoint: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_24();
}

- (void)setSystemGesturesState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_0_25(&dword_215181000, v0, v1, "Sending new systemGesture to remote endpoint: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_24();
}

@end
