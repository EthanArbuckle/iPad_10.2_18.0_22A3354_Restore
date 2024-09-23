@implementation GCAdaptiveTriggersXPCProxyClientEndpoint

- (GCAdaptiveTriggersXPCProxyClientEndpoint)initWithIdentifier:(id)a3 initialStatuses:(id)a4
{
  id v6;
  id v7;
  GCAdaptiveTriggersXPCProxyClientEndpoint *v8;
  uint64_t v9;
  NSObject *identifier;
  GCDeviceAdaptiveTriggersPayload *v11;
  GCDeviceAdaptiveTriggersPayload *leftTrigger;
  GCDeviceAdaptiveTriggersPayload *v13;
  GCDeviceAdaptiveTriggersPayload *rightTrigger;
  uint64_t v15;
  GCDeviceAdaptiveTriggersStatusPayload *leftStatus;
  uint64_t v17;
  GCDeviceAdaptiveTriggersStatusPayload *rightStatus;
  NSObject *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)GCAdaptiveTriggersXPCProxyClientEndpoint;
  v8 = -[GCAdaptiveTriggersXPCProxyClientEndpoint init](&v21, sel_init);
  if (v8)
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v6;
        _os_log_impl(&dword_215181000, v20, OS_LOG_TYPE_INFO, "GCAdaptiveTriggersXPCProxyClientEndpoint initWithIdentifier: %@", buf, 0xCu);
      }

    }
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    identifier = v8->_identifier;
    v8->_identifier = v9;

    v11 = -[GCDeviceAdaptiveTriggersPayload initOff]([GCDeviceAdaptiveTriggersPayload alloc], "initOff");
    leftTrigger = v8->_leftTrigger;
    v8->_leftTrigger = v11;

    v13 = -[GCDeviceAdaptiveTriggersPayload initOff]([GCDeviceAdaptiveTriggersPayload alloc], "initOff");
    rightTrigger = v8->_rightTrigger;
    v8->_rightTrigger = v13;

    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v15 = objc_claimAutoreleasedReturnValue();
      leftStatus = v8->_leftStatus;
      v8->_leftStatus = (GCDeviceAdaptiveTriggersStatusPayload *)v15;

      objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
      v17 = objc_claimAutoreleasedReturnValue();
      rightStatus = v8->_rightStatus;
      v8->_rightStatus = (GCDeviceAdaptiveTriggersStatusPayload *)v17;

    }
  }

  return v8;
}

- (GCAdaptiveTriggersXPCProxyClientEndpoint)init
{
  -[GCAdaptiveTriggersXPCProxyClientEndpoint doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

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
  v17 = __73__GCAdaptiveTriggersXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke;
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
      -[GCAdaptiveTriggersXPCProxyClientEndpoint setRemoteEndpoint:connection:].cold.1();

  }
  -[GCAdaptiveTriggersXPCProxyClientEndpoint refreshStatuses](self, "refreshStatuses");

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __73__GCAdaptiveTriggersXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke(uint64_t a1)
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
        __73__GCAdaptiveTriggersXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1();

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

- (void)setLeftTrigger:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_leftTrigger, a3);
  v5 = a3;
  -[GCAdaptiveTriggersXPCProxyRemoteServerEndpointInterface newAdaptiveTriggerPayload:index:](self->_serverEndpoint, "newAdaptiveTriggerPayload:index:", self->_leftTrigger, 0);

}

- (void)setRightTrigger:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_rightTrigger, a3);
  v5 = a3;
  -[GCAdaptiveTriggersXPCProxyRemoteServerEndpointInterface newAdaptiveTriggerPayload:index:](self->_serverEndpoint, "newAdaptiveTriggerPayload:index:", self->_rightTrigger, 1);

}

- (void)_remoteEndpointHasSetStatuses:(id)a3
{
  id v4;
  void *v5;
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
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_215181000, v7, OS_LOG_TYPE_INFO, "_remoteEndpointHasSetStatuses: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCAdaptiveTriggersXPCProxyClientEndpoint setLeftStatus:](self, "setLeftStatus:", v5);

    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCAdaptiveTriggersXPCProxyClientEndpoint setRightStatus:](self, "setRightStatus:", v6);

  }
}

- (void)newStatuses:(id)a3
{
  id v4;
  id v5;
  _QWORD activity_block[5];
  id v7;

  v4 = a3;
  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __56__GCAdaptiveTriggersXPCProxyClientEndpoint_newStatuses___block_invoke;
  activity_block[3] = &unk_24D2B2B48;
  activity_block[4] = self;
  v7 = v4;
  v5 = v4;
  _os_activity_initiate(&dword_215181000, "(Adaptive Trigger XPC Proxy Client Endpoint) New Statuses", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

uint64_t __56__GCAdaptiveTriggersXPCProxyClientEndpoint_newStatuses___block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_215181000, v3, OS_LOG_TYPE_INFO, "(Adaptive Trigger XPC Proxy Client Endpoint) New Statuses", v4, 2u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetStatuses:", *(_QWORD *)(a1 + 40));
}

- (void)refreshStatuses
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __59__GCAdaptiveTriggersXPCProxyClientEndpoint_refreshStatuses__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Adaptive Trigger XPC Proxy Client Endpoint) Refresh Statuses", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __59__GCAdaptiveTriggersXPCProxyClientEndpoint_refreshStatuses__block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_215181000, v5, OS_LOG_TYPE_INFO, "(Adaptive Trigger XPC Proxy Client Endpoint) Refresh Statuses", buf, 2u);
    }

  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__GCAdaptiveTriggersXPCProxyClientEndpoint_refreshStatuses__block_invoke_56;
  v6[3] = &unk_24D2B5288;
  v6[4] = v2;
  return objc_msgSend(v3, "fetchStatusesWithReply:", v6);
}

uint64_t __59__GCAdaptiveTriggersXPCProxyClientEndpoint_refreshStatuses__block_invoke_56(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_remoteEndpointHasSetStatuses:", a2);
}

- (void)invalidateConnection
{
  _QWORD activity_block[5];

  activity_block[0] = MEMORY[0x24BDAC760];
  activity_block[1] = 3221225472;
  activity_block[2] = __64__GCAdaptiveTriggersXPCProxyClientEndpoint_invalidateConnection__block_invoke;
  activity_block[3] = &unk_24D2B2B20;
  activity_block[4] = self;
  _os_activity_initiate(&dword_215181000, "(Adaptive Trigger XPC Proxy Client Endpoint) Invalidate Connection", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __64__GCAdaptiveTriggersXPCProxyClientEndpoint_invalidateConnection__block_invoke(uint64_t a1)
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
  -[GCAdaptiveTriggersXPCProxyClientEndpoint identifier](self, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (NSObject)identifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (GCDeviceAdaptiveTriggersPayload)leftTrigger
{
  return self->_leftTrigger;
}

- (GCDeviceAdaptiveTriggersPayload)rightTrigger
{
  return self->_rightTrigger;
}

- (GCDeviceAdaptiveTriggersStatusPayload)leftStatus
{
  return self->_leftStatus;
}

- (void)setLeftStatus:(id)a3
{
  objc_storeStrong((id *)&self->_leftStatus, a3);
}

- (GCDeviceAdaptiveTriggersStatusPayload)rightStatus
{
  return self->_rightStatus;
}

- (void)setRightStatus:(id)a3
{
  objc_storeStrong((id *)&self->_rightStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightStatus, 0);
  objc_storeStrong((id *)&self->_leftStatus, 0);
  objc_storeStrong((id *)&self->_rightTrigger, 0);
  objc_storeStrong((id *)&self->_leftTrigger, 0);
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

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_22(&dword_215181000, v0, v1, "Server connection established for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_21();
}

void __73__GCAdaptiveTriggersXPCProxyClientEndpoint_setRemoteEndpoint_connection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_19();
  OUTLINED_FUNCTION_0_22(&dword_215181000, v0, v1, "%@ has lost its connection to the remote endpoint.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_21();
}

@end
