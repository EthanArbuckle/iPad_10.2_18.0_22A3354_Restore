@implementation IRCompanionLinkClient

- (IRCompanionLinkClient)initWithRapportProvider:(id)a3 targetQueue:(id)a4
{
  id v6;
  id v7;
  IRCompanionLinkClient *v8;
  IRCompanionLinkClient *v9;
  OS_dispatch_queue *v10;
  NSObject *dispatchQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)IRCompanionLinkClient;
  v8 = -[IRCompanionLinkClient init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_rapportProvider, v6);
    if (v7)
    {
      v10 = (OS_dispatch_queue *)v7;
      dispatchQueue = v9->_dispatchQueue;
      v9->_dispatchQueue = v10;
    }
    else
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatchQueue = objc_claimAutoreleasedReturnValue();
      v12 = dispatch_queue_create("com.apple.intelligentroutingd.IRCompanionLinkClient", dispatchQueue);
      v13 = v9->_dispatchQueue;
      v9->_dispatchQueue = (OS_dispatch_queue *)v12;

    }
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[IRCompanionLinkClient stopDiscovery](self, "stopDiscovery");
  v3.receiver = self;
  v3.super_class = (Class)IRCompanionLinkClient;
  -[IRCompanionLinkClient dealloc](&v3, sel_dealloc);
}

- (RPCompanionLinkClient)client
{
  RPCompanionLinkClient *client;
  RPCompanionLinkClient *v4;
  RPCompanionLinkClient *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  client = self->_client;
  if (!client)
  {
    v4 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x24BE7CBF0]);
    v5 = self->_client;
    self->_client = v4;

    -[IRCompanionLinkClient dispatchQueue](self, "dispatchQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[IRCompanionLinkClient dispatchQueue](self, "dispatchQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPCompanionLinkClient setDispatchQueue:](self->_client, "setDispatchQueue:", v7);

    }
    -[IRCompanionLinkClient client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "controlFlags");

    -[RPCompanionLinkClient setControlFlags:](self->_client, "setControlFlags:", v9 | 0x1C04);
    -[RPCompanionLinkClient setRssiThreshold:](self->_client, "setRssiThreshold:", -75);
    client = self->_client;
  }
  return client;
}

- (void)startDiscovery
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  objc_initWeak(&location, self);
  -[IRCompanionLinkClient client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke;
  v20[3] = &unk_251044B58;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v3, "setDeviceFoundHandler:", v20);

  -[IRCompanionLinkClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_4;
  v18[3] = &unk_251044B58;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v5, "setDeviceLostHandler:", v18);

  -[IRCompanionLinkClient client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_5;
  v16[3] = &unk_251044B80;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v6, "setDeviceChangedHandler:", v16);

  -[IRCompanionLinkClient client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_7;
  v14[3] = &unk_251043FF8;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v14);

  -[IRCompanionLinkClient client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_10;
  v12[3] = &unk_251043FF8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "setInvalidationHandler:", v12);

  if (!self->_companionLinkClientActive)
  {
    -[IRCompanionLinkClient client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __39__IRCompanionLinkClient_startDiscovery__block_invoke_11;
    v10[3] = &unk_251044BA8;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v9, "activateWithCompletion:", v10);

    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
      __39__IRCompanionLinkClient_startDiscovery__block_invoke_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    objc_msgSend(v5, "_didUpdateRapportDevices");
  }

}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
      __39__IRCompanionLinkClient_startDiscovery__block_invoke_4_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    objc_msgSend(v5, "_didUpdateRapportDevices");
  }

}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
      __39__IRCompanionLinkClient_startDiscovery__block_invoke_5_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    objc_msgSend(v5, "_didUpdateRapportDevices");
  }

}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    v4 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_DEFAULT, "#companionlink-client, Rapport discovery companionLinkClient connection interrupted, reset knownDevices", v7, 2u);
    }
    objc_msgSend(v2, "rapportProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didUpdateRapportDevices:", v6);

  }
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_10(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    v4 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_DEFAULT, "#companionlink-client, Rapport discovery companionLinkClient connection invalidated, reset knownDevices", v7, 2u);
    }
    objc_msgSend(v2, "rapportProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didUpdateRapportDevices:", v6);

  }
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  _BYTE *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "dispatchQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    if (v3)
    {
      v7 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v3;
        _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#companionlink-client, Rapport discovery companionLinkClient failed to activate. Error - %@", (uint8_t *)&v9, 0xCu);
      }
      objc_msgSend(v5, "stopDiscovery");
    }
    else
    {
      v5[8] = 1;
      v8 = *MEMORY[0x24BE5B270];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_DEFAULT, "#companionlink-client, Rapport discovery client activated. Searching for Rapport devices...", (uint8_t *)&v9, 2u);
      }
    }
  }

}

- (void)_didUpdateRapportDevices
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  -[IRCompanionLinkClient client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "copy");

  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__IRCompanionLinkClient__didUpdateRapportDevices__block_invoke;
  v10[3] = &unk_251044BD0;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  -[IRCompanionLinkClient rapportProvider](self, "rapportProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v7, "didUpdateRapportDevices:", v8);

}

void __49__IRCompanionLinkClient__didUpdateRapportDevices__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "effectiveIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "idsDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaRemoteIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaRouteIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[IRRapportDeviceDO rapportDeviceDOWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:](IRRapportDeviceDO, "rapportDeviceDOWithRapportEffectiveID:idsID:name:deviceModel:mediaRemoteIdentifier:iCloudId:mediaRouteIdentifier:", v4, v5, v6, v7, v8, v9, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
}

- (void)stopDiscovery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[IRCompanionLinkClient client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceFoundHandler:", 0);

  -[IRCompanionLinkClient client](self, "client");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDeviceLostHandler:", 0);

  -[IRCompanionLinkClient client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInterruptionHandler:", 0);

  -[IRCompanionLinkClient client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInvalidationHandler:", 0);

  -[IRCompanionLinkClient client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[IRCompanionLinkClient setClient:](self, "setClient:", 0);
  self->_companionLinkClientActive = 0;
}

- (unint64_t)currentControlFlags
{
  void *v2;
  unint64_t v3;

  -[IRCompanionLinkClient client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "controlFlags");

  return v3;
}

- (int64_t)currentRssiThreshold
{
  void *v2;
  int64_t v3;

  -[IRCompanionLinkClient client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rssiThreshold");

  return v3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (IRRapportProvider)rapportProvider
{
  return (IRRapportProvider *)objc_loadWeakRetained((id *)&self->_rapportProvider);
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_rapportProvider);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23FFBA000, a2, a3, "#companionlink-client, Found device: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_4_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23FFBA000, a2, a3, "#companionlink-client, Lost device: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __39__IRCompanionLinkClient_startDiscovery__block_invoke_5_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23FFBA000, a2, a3, "#companionlink-client, Changed device: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
