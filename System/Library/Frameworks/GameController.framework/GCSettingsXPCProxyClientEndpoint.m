@implementation GCSettingsXPCProxyClientEndpoint

- (GCSettingsXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialValueForProfile:(id)a4
{
  id v6;
  id v7;
  GCSettingsXPCProxyClientEndpoint *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *identifier;
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
  v13.super_class = (Class)GCSettingsXPCProxyClientEndpoint;
  v8 = -[GCSettingsXPCProxyClientEndpoint init](&v13, sel_init);
  if (v8)
  {
    getGCSettingsLogger();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_215181000, v9, OS_LOG_TYPE_INFO, "GCSettingsXPCProxyClientEndpoint initWithIdentifier: %@ initialProfile: %@", buf, 0x16u);
    }

    v10 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = v10;

    objc_storeStrong((id *)&v8->_settingsProfile, a4);
  }

  return v8;
}

- (GCSettingsXPCProxyClientEndpoint)init
{
  -[GCSettingsXPCProxyClientEndpoint doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

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
  v17 = __65__GCSettingsXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
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
  getGCSettingsLogger();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[GCSettingsXPCProxyClientEndpoint setRemoteEndpoint:connection:].cold.1();

  -[GCSettingsXPCProxyClientEndpoint refreshProfile](self, "refreshProfile");
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __65__GCSettingsXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
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
      __65__GCSettingsXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();

    v3 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;

    v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

    v5 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;

  }
}

- (void)setController:(id)a3
{
  objc_storeWeak((id *)&self->_controller, a3);
}

- (void)_remoteEndpointHasSetProfile:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  GCSettingsXPCProxyClientEndpoint *v10;
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__GCSettingsXPCProxyClientEndpoint__remoteEndpointHasSetProfile___block_invoke;
  block[3] = &unk_24D2B3D70;
  v9 = WeakRetained;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = WeakRetained;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __65__GCSettingsXPCProxyClientEndpoint__remoteEndpointHasSetProfile___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("settingsProfile"));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 48), *(id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("settingsProfile"));
  result = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)newProfile:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __47__GCSettingsXPCProxyClientEndpoint_newProfile___block_invoke;
  activity_block[3] = &unk_24D2B2B48;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(Settings XPC Proxy Client Endpoint) New Profile", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __47__GCSettingsXPCProxyClientEndpoint_newProfile___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  getGCSettingsLogger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_INFO, "(Settings XPC Proxy Client Endpoint) New Profile", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetProfile:", *(_QWORD *)(a1 + 40));
}

- (void)refreshProfile
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __50__GCSettingsXPCProxyClientEndpoint_refreshProfile__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Settings XPC Proxy Client Endpoint) Refresh Profile", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __50__GCSettingsXPCProxyClientEndpoint_refreshProfile__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[16];

  getGCSettingsLogger();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_INFO, "(Settings XPC Proxy Client Endpoint) Refresh Profile", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__GCSettingsXPCProxyClientEndpoint_refreshProfile__block_invoke_58;
  v6[3] = &unk_24D2B4F28;
  v6[4] = v3;
  return objc_msgSend(v4, "fetchProfileWithReply:", v6);
}

uint64_t __50__GCSettingsXPCProxyClientEndpoint_refreshProfile__block_invoke_58(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetProfile:", a2);
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__GCSettingsXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Settings XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __56__GCSettingsXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  -[GCSettingsXPCProxyClientEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (GCSProfile)settingsProfile
{
  return self->_settingsProfile;
}

- (id)changedHandler
{
  return self->_changedHandler;
}

- (void)setChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changedHandler, 0);
  objc_storeStrong((id *)&self->_settingsProfile, 0);
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

  OUTLINED_FUNCTION_2_15();
  OUTLINED_FUNCTION_0_17(&dword_215181000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_16();
}

void __65__GCSettingsXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
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

@end
