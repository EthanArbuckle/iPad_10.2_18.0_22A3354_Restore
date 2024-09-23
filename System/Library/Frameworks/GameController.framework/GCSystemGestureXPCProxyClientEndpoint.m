@implementation GCSystemGestureXPCProxyClientEndpoint

- (GCSystemGestureXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialSystemGesture:(id)a4 isSystemGestureObserver:(BOOL)a5
{
  id v8;
  id v9;
  GCSystemGestureXPCProxyClientEndpoint *v10;
  uint64_t v11;
  NSObject *identifier;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GCSystemGestureXPCProxyClientEndpoint;
  v10 = -[GCSystemGestureXPCProxyClientEndpoint init](&v15, sel_init);
  if (v10)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v8;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_215181000, v14, OS_LOG_TYPE_INFO, "GCSystemGestureXPCProxyClientEndpoint initWithIdentifier: %@ initialSystemGesture: %@", buf, 0x16u);
      }

    }
    v11 = objc_msgSend(v8, "copyWithZone:", 0);
    identifier = v10->_identifier;
    v10->_identifier = v11;

    objc_storeStrong((id *)&v10->_systemGesturesState, a4);
    v10->_isSystemGestureObserver = a5;
  }

  return v10;
}

- (GCSystemGestureXPCProxyClientEndpoint)init
{
  -[GCSystemGestureXPCProxyClientEndpoint doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

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
  v17 = __70__GCSystemGestureXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
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
      -[GCSystemGestureXPCProxyClientEndpoint setRemoteEndpoint:connection:].cold.1();

  }
  -[GCSystemGestureXPCProxyClientEndpoint refreshSystemGesturesState](self, "refreshSystemGesturesState");

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __70__GCSystemGestureXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
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
        __70__GCSystemGestureXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();

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

- (void)_remoteEndpointHasSetSystemGesturesState:(id)a3
{
  GCSystemGesturesState *v4;
  GCSystemGesturesState *systemGesturesState;
  NSObject *v6;
  int v7;
  GCSystemGesturesState *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (GCSystemGesturesState *)a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_DEFAULT, "_remoteEndpointHasSetSystemGesturesState: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[GCSystemGestureXPCProxyClientEndpoint willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("systemGesturesState"));
  systemGesturesState = self->_systemGesturesState;
  self->_systemGesturesState = v4;

  -[GCSystemGestureXPCProxyClientEndpoint didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("systemGesturesState"));
}

- (void)newSystemGesturesState:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  if (self->_isSystemGestureObserver)
  {
    activity_block[1] = 3221225472;
    activity_block[2] = __64__GCSystemGestureXPCProxyClientEndpoint_newSystemGesturesState___block_invoke;
    activity_block[3] = &unk_24D2B2B48;
    activity_block[4] = self;
    v5 = v4;
    activity_block[0] = MEMORY[0x24BDAC760];
    v7 = v4;
    _os_activity_initiate(&dword_215181000, "(SystemGesture XPC Proxy Client Endpoint) New GCSystemGesturesState", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    v4 = v5;
  }

}

uint64_t __64__GCSystemGestureXPCProxyClientEndpoint_newSystemGesturesState___block_invoke(uint64_t a1)
{
  NSObject *v3;
  uint8_t v4[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "(SystemGesture XPC Proxy Client Endpoint) New GCSystemGesturesState", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetSystemGesturesState:", *(_QWORD *)(a1 + 40));
}

- (void)refreshSystemGesturesState
{
  _QWORD activity_block[5];

  if (self->_isSystemGestureObserver)
  {
    activity_block[0] = MEMORY[0x24BDAC760];
    activity_block[1] = 3221225472;
    activity_block[2] = __67__GCSystemGestureXPCProxyClientEndpoint_refreshSystemGesturesState__block_invoke;
    activity_block[3] = &unk_24D2B2B20;
    activity_block[4] = self;
    _os_activity_initiate(&dword_215181000, "(SystemGesture XPC Proxy Client Endpoint) Refresh GCSystemGesturesState", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

uint64_t __67__GCSystemGestureXPCProxyClientEndpoint_refreshSystemGesturesState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "(SystemGesture XPC Proxy Client Endpoint) Refresh GCSystemGesturesState", buf, 2u);
    }

  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__GCSystemGestureXPCProxyClientEndpoint_refreshSystemGesturesState__block_invoke_58;
  v6[3] = &unk_24D2B5B90;
  v6[4] = v2;
  return objc_msgSend(v3, "fetchSystemGesturesStateWithReply:", v6);
}

uint64_t __67__GCSystemGestureXPCProxyClientEndpoint_refreshSystemGesturesState__block_invoke_58(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetSystemGesturesState:", a2);
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__GCSystemGestureXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(SystemGesture XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __61__GCSystemGestureXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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

- (BOOL)isSystemGestureObserver
{
  return self->_isSystemGestureObserver;
}

- (void)fetchObjectIdentifierWithReply:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[GCSystemGestureXPCProxyClientEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)disableSystemGestureForInput:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  if (!self->_isSystemGestureObserver)
  {
    activity_block[1] = 3221225472;
    activity_block[2] = __70__GCSystemGestureXPCProxyClientEndpoint_disableSystemGestureForInput___block_invoke;
    activity_block[3] = &unk_24D2B2B48;
    activity_block[4] = self;
    v5 = v4;
    activity_block[0] = MEMORY[0x24BDAC760];
    v7 = v4;
    _os_activity_initiate(&dword_215181000, "(SystemGesture XPC Proxy Client Endpoint) Disable system gesture for input name", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    v4 = v5;
  }

}

uint64_t __70__GCSystemGestureXPCProxyClientEndpoint_disableSystemGestureForInput___block_invoke(uint64_t a1)
{
  NSObject *v3;
  uint8_t v4[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "(SystemGesture XPC Proxy Client Endpoint) Disable system gesture for input name", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "disableSystemGestureForInput:", *(_QWORD *)(a1 + 40));
}

- (void)enableSystemGestureForInput:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  if (!self->_isSystemGestureObserver)
  {
    activity_block[1] = 3221225472;
    activity_block[2] = __69__GCSystemGestureXPCProxyClientEndpoint_enableSystemGestureForInput___block_invoke;
    activity_block[3] = &unk_24D2B2B48;
    activity_block[4] = self;
    v5 = v4;
    activity_block[0] = MEMORY[0x24BDAC760];
    v7 = v4;
    _os_activity_initiate(&dword_215181000, "(SystemGesture XPC Proxy Client Endpoint) Enable system gesture for input name", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    v4 = v5;
  }

}

uint64_t __69__GCSystemGestureXPCProxyClientEndpoint_enableSystemGestureForInput___block_invoke(uint64_t a1)
{
  NSObject *v3;
  uint8_t v4[16];

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "(SystemGesture XPC Proxy Client Endpoint) Enable system gesture for input name", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "enableSystemGestureForInput:", *(_QWORD *)(a1 + 40));
}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 48, 1);
}

- (GCSystemGesturesState)systemGesturesState
{
  return self->_systemGesturesState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGesturesState, 0);
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

  OUTLINED_FUNCTION_2_22();
  OUTLINED_FUNCTION_0_25(&dword_215181000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_24();
}

void __70__GCSystemGestureXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
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

@end
