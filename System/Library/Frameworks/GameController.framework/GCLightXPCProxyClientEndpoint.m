@implementation GCLightXPCProxyClientEndpoint

- (GCLightXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialLight:(id)a4
{
  id v6;
  id v7;
  GCLightXPCProxyClientEndpoint *v8;
  uint64_t v9;
  NSObject *identifier;
  NSObject *v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)GCLightXPCProxyClientEndpoint;
  v8 = -[GCLightXPCProxyClientEndpoint init](&v13, sel_init);
  if (v8)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "GCLightXPCProxyClientEndpoint initWithIdentifier: %@ initialLight: %@", buf, 0x16u);
      }

    }
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_light, a4);
    -[GCLightXPCProxyClientEndpoint observeChangesForLight:](v8, "observeChangesForLight:", v8->_light);
  }

  return v8;
}

- (GCLightXPCProxyClientEndpoint)init
{
  -[GCLightXPCProxyClientEndpoint doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)observeChangesForLight:(id)a3
{
  objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("color"), 0, 0);
}

- (void)stopObservingChangesForLight:(id)a3
{
  objc_msgSend(a3, "removeObserver:forKeyPath:", self, CFSTR("color"));
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
  v17 = __62__GCLightXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
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
      -[GCLightXPCProxyClientEndpoint setRemoteEndpoint:connection:].cold.1();

  }
  -[GCLightXPCProxyClientEndpoint refreshLight](self, "refreshLight");

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __62__GCLightXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
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
        __62__GCLightXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();

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

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (self->_light == a4)
  {
    -[GCLightXPCProxyRemoteServerEndpointInterface newLight:](self->_serverEndpoint, "newLight:", a4);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)GCLightXPCProxyClientEndpoint;
    -[GCLightXPCProxyClientEndpoint observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3);
  }
}

- (void)_remoteEndpointHasSetLight:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "_remoteEndpointHasSetLight: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  -[GCLightXPCProxyClientEndpoint stopObservingChangesForLight:](self, "stopObservingChangesForLight:", self->_light);
  objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("light"));
  objc_msgSend(v4, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCDeviceLight setColor:](self->_light, "setColor:", v6);

  objc_msgSend(WeakRetained, "didChangeValueForKey:", CFSTR("light"));
  -[GCLightXPCProxyClientEndpoint observeChangesForLight:](self, "observeChangesForLight:", self->_light);

}

- (void)newLight:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __42__GCLightXPCProxyClientEndpoint_newLight___block_invoke;
  activity_block[3] = &unk_24D2B2B48;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(Light XPC Proxy Client Endpoint) New Light", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __42__GCLightXPCProxyClientEndpoint_newLight___block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "(Light XPC Proxy Client Endpoint) New Light", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetLight:", *(_QWORD *)(a1 + 40));
}

- (void)refreshLight
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __45__GCLightXPCProxyClientEndpoint_refreshLight__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Light XPC Proxy Client Endpoint) Refresh Light", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __45__GCLightXPCProxyClientEndpoint_refreshLight__block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "(Light XPC Proxy Client Endpoint) Refresh Light", buf, 2u);
    }

  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__GCLightXPCProxyClientEndpoint_refreshLight__block_invoke_62;
  v6[3] = &unk_24D2B4B60;
  v6[4] = v2;
  return objc_msgSend(v3, "fetchLightWithReply:", v6);
}

uint64_t __45__GCLightXPCProxyClientEndpoint_refreshLight__block_invoke_62(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetLight:", a2);
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __53__GCLightXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Light XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __53__GCLightXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  -[GCLightXPCProxyClientEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (GCDeviceLight)light
{
  return self->_light;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_light, 0);
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

  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_0_13(&dword_215181000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_12();
}

void __62__GCLightXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_0_13(&dword_215181000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_12();
}

@end
