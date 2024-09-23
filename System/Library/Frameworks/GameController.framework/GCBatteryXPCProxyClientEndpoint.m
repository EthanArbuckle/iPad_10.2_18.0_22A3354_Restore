@implementation GCBatteryXPCProxyClientEndpoint

- (GCBatteryXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialBattery:(id)a4
{
  id v6;
  id v7;
  GCBatteryXPCProxyClientEndpoint *v8;
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
  v13.super_class = (Class)GCBatteryXPCProxyClientEndpoint;
  v8 = -[GCBatteryXPCProxyClientEndpoint init](&v13, sel_init);
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
        _os_log_impl(&dword_215181000, v12, OS_LOG_TYPE_INFO, "GCBatteryXPCProxyClientEndpoint initWithIdentifier: %@ initialBattery: %@", buf, 0x16u);
      }

    }
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = v9;

    objc_storeStrong((id *)&v8->_battery, a4);
  }

  return v8;
}

- (GCBatteryXPCProxyClientEndpoint)init
{
  -[GCBatteryXPCProxyClientEndpoint doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

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
  v17 = __64__GCBatteryXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
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
      -[GCBatteryXPCProxyClientEndpoint setRemoteEndpoint:connection:].cold.1();

  }
  -[GCBatteryXPCProxyClientEndpoint refreshBattery](self, "refreshBattery");

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __64__GCBatteryXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
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
        __64__GCBatteryXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();

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

- (void)_remoteEndpointHasSetBattery:(id)a3
{
  id v4;
  id WeakRetained;
  GCDeviceBattery *battery;
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
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_DEFAULT, "_remoteEndpointHasSetBattery: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("battery"));
  battery = self->_battery;
  objc_msgSend(v4, "batteryLevel");
  -[GCDeviceBattery _setBatteryLevel:](battery, "_setBatteryLevel:");
  -[GCDeviceBattery _setBatteryState:](self->_battery, "_setBatteryState:", objc_msgSend(v4, "batteryState"));
  objc_msgSend(WeakRetained, "didChangeValueForKey:", CFSTR("battery"));

}

- (void)newBattery:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __46__GCBatteryXPCProxyClientEndpoint_newBattery___block_invoke;
  activity_block[3] = &unk_24D2B2B48;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(Battery XPC Proxy Client Endpoint) New Battery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __46__GCBatteryXPCProxyClientEndpoint_newBattery___block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "(Battery XPC Proxy Client Endpoint) New Battery", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetBattery:", *(_QWORD *)(a1 + 40));
}

- (void)refreshBattery
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __49__GCBatteryXPCProxyClientEndpoint_refreshBattery__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Battery XPC Proxy Client Endpoint) Refresh Battery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __49__GCBatteryXPCProxyClientEndpoint_refreshBattery__block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "(Battery XPC Proxy Client Endpoint) Refresh Battery", buf, 2u);
    }

  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__GCBatteryXPCProxyClientEndpoint_refreshBattery__block_invoke_58;
  v6[3] = &unk_24D2B2C78;
  v6[4] = v2;
  return objc_msgSend(v3, "fetchBatteryWithReply:", v6);
}

uint64_t __49__GCBatteryXPCProxyClientEndpoint_refreshBattery__block_invoke_58(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetBattery:", a2);
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __55__GCBatteryXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Battery XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __55__GCBatteryXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  -[GCBatteryXPCProxyClientEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (GCDeviceBattery)battery
{
  return self->_battery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_battery, 0);
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

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_215181000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __64__GCBatteryXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_215181000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
