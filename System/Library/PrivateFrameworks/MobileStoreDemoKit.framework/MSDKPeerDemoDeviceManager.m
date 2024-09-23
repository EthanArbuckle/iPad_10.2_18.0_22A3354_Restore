@implementation MSDKPeerDemoDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_4);
  return (id)sharedInstance_sharedInstance_0;
}

void __43__MSDKPeerDemoDeviceManager_sharedInstance__block_invoke()
{
  MSDKPeerDemoDeviceManager *v0;
  void *v1;

  v0 = objc_alloc_init(MSDKPeerDemoDeviceManager);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (MSDKPeerDemoDeviceManager)init
{
  MSDKPeerDemoDeviceManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDKPeerDemoDeviceManager;
  v2 = -[MSDKPeerDemoDeviceManager init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSDKPeerDemoDeviceManager setPeers:](v2, "setPeers:", v3);

  }
  return v2;
}

- (NSArray)discoveredPeers
{
  MSDKPeerDemoDeviceManager *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[MSDKPeerDemoDeviceManager peers](v2, "peers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSArray *)v4;
}

- (BOOL)registerPeerEventsObserver:(id)a3
{
  id v4;
  NSObject *v5;
  char v6;
  MSDKPeerDemoDeviceManager *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[MSDKPeerDemoDeviceManager registerPeerEventsObserver:]";
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  v6 = objc_msgSend(v4, "conformsToProtocol:", &unk_254D1F3F0);
  if ((v6 & 1) != 0)
  {
    v7 = self;
    objc_sync_enter(v7);
    -[MSDKPeerDemoDeviceManager setObserver:](v7, "setObserver:", v4);
    -[MSDKPeerDemoDeviceManager peers](v7, "peers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
          -[MSDKPeerDemoDeviceManager observer](v7, "observer", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "managerDidFindPeer:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_sync_exit(v7);
  }
  else
  {
    defaultLogHandle();
    v7 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager registerPeerEventsObserver:].cold.1();
  }

  return v6;
}

- (void)unregisterPeerEventsObserver
{
  NSObject *v3;
  MSDKPeerDemoDeviceManager *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  defaultLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[MSDKPeerDemoDeviceManager unregisterPeerEventsObserver]";
    _os_log_impl(&dword_213A7E000, v3, OS_LOG_TYPE_DEFAULT, "%s: called.", (uint8_t *)&v5, 0xCu);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[MSDKPeerDemoDeviceManager setObserver:](v4, "setObserver:", 0);
  objc_sync_exit(v4);

}

- (void)startPeerDiscoveryWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  MSDKPeerDemoDeviceManager *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[MSDKPeerDemoDeviceManager startPeerDiscoveryWithCompletion:]";
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v4)
  {
    v6 = self;
    objc_sync_enter(v6);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __62__MSDKPeerDemoDeviceManager_startPeerDiscoveryWithCompletion___block_invoke;
    v16[3] = &unk_24D0ADA48;
    v7 = v4;
    v17 = v7;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v6, "_remoteObjectProxyWithErrorHandler:", v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startPeerDiscoveryWithCompletion:", v7);

    objc_sync_exit(v6);
  }
  else
  {
    defaultLogHandle();
    v6 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager startPeerDiscoveryWithCompletion:].cold.1(&v6->super, v9, v10, v11, v12, v13, v14, v15);
  }

}

uint64_t __62__MSDKPeerDemoDeviceManager_startPeerDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)attemptPairingWithPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager attemptPairingWithPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __67__MSDKPeerDemoDeviceManager_attemptPairingWithPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __67__MSDKPeerDemoDeviceManager_attemptPairingWithPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADA48;
    v22 = v11;
    objc_msgSend(v12, "attemptPairingWithPeerOfID:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager attemptPairingWithPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __67__MSDKPeerDemoDeviceManager_attemptPairingWithPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__MSDKPeerDemoDeviceManager_attemptPairingWithPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)subscribeDeviceInfoFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager subscribeDeviceInfoFromPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __72__MSDKPeerDemoDeviceManager_subscribeDeviceInfoFromPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __72__MSDKPeerDemoDeviceManager_subscribeDeviceInfoFromPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADA48;
    v22 = v11;
    objc_msgSend(v12, "subscribeDeviceInfoFromPeerOfID:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager subscribeDeviceInfoFromPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __72__MSDKPeerDemoDeviceManager_subscribeDeviceInfoFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__MSDKPeerDemoDeviceManager_subscribeDeviceInfoFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchDeviceInfoFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager fetchDeviceInfoFromPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __68__MSDKPeerDemoDeviceManager_fetchDeviceInfoFromPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __68__MSDKPeerDemoDeviceManager_fetchDeviceInfoFromPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADA48;
    v22 = v11;
    objc_msgSend(v12, "fetchDeviceInfoFromPeerOfID:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager fetchDeviceInfoFromPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __68__MSDKPeerDemoDeviceManager_fetchDeviceInfoFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__MSDKPeerDemoDeviceManager_fetchDeviceInfoFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initiateAirPlayAssistedFromPeer:(id)a3 usingParameters:(id)a4 discoveryMode:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  MSDKPeerDemoDeviceManager *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  defaultLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[MSDKPeerDemoDeviceManager initiateAirPlayAssistedFromPeer:usingParameters:discoveryMode:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v13, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v12)
  {
    v14 = self;
    objc_sync_enter(v14);
    v15 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __106__MSDKPeerDemoDeviceManager_initiateAirPlayAssistedFromPeer_usingParameters_discoveryMode_withCompletion___block_invoke;
    v28[3] = &unk_24D0ADA48;
    v16 = v12;
    v29 = v16;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v14, "_remoteObjectProxyWithErrorHandler:", v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __106__MSDKPeerDemoDeviceManager_initiateAirPlayAssistedFromPeer_usingParameters_discoveryMode_withCompletion___block_invoke_2;
    v26[3] = &unk_24D0ADA48;
    v27 = v16;
    objc_msgSend(v17, "initiateAirPlayAssistedFromPeerOfID:usingParameters:discoveryMode:withCompletion:", v18, v11, a5, v26);

    objc_sync_exit(v14);
  }
  else
  {
    defaultLogHandle();
    v14 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager initiateAirPlayAssistedFromPeer:usingParameters:discoveryMode:withCompletion:].cold.1(&v14->super, v19, v20, v21, v22, v23, v24, v25);
  }

}

uint64_t __106__MSDKPeerDemoDeviceManager_initiateAirPlayAssistedFromPeer_usingParameters_discoveryMode_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __106__MSDKPeerDemoDeviceManager_initiateAirPlayAssistedFromPeer_usingParameters_discoveryMode_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerSnapshotRevertOnPeer:(id)a3 rebootDevice:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  MSDKPeerDemoDeviceManager *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  defaultLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[MSDKPeerDemoDeviceManager triggerSnapshotRevertOnPeer:rebootDevice:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v10, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v9)
  {
    v11 = self;
    objc_sync_enter(v11);
    -[MSDKPeerDemoDeviceManager xpcConnection](v11, "xpcConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __85__MSDKPeerDemoDeviceManager_triggerSnapshotRevertOnPeer_rebootDevice_withCompletion___block_invoke;
    v26[3] = &unk_24D0ADA48;
    v14 = v9;
    v27 = v14;
    objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __85__MSDKPeerDemoDeviceManager_triggerSnapshotRevertOnPeer_rebootDevice_withCompletion___block_invoke_2;
    v24[3] = &unk_24D0ADA48;
    v25 = v14;
    objc_msgSend(v15, "triggerSnapshotRevertOnPeerOfID:rebootDevice:withCompletion:", v16, v6, v24);

    objc_sync_exit(v11);
  }
  else
  {
    defaultLogHandle();
    v11 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager triggerSnapshotRevertOnPeer:rebootDevice:withCompletion:].cold.1(&v11->super, v17, v18, v19, v20, v21, v22, v23);
  }

}

uint64_t __85__MSDKPeerDemoDeviceManager_triggerSnapshotRevertOnPeer_rebootDevice_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__MSDKPeerDemoDeviceManager_triggerSnapshotRevertOnPeer_rebootDevice_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerSnapshotRevertOnPeer:(id)a3 withCompletion:(id)a4
{
  -[MSDKPeerDemoDeviceManager triggerSnapshotRevertOnPeer:rebootDevice:withCompletion:](self, "triggerSnapshotRevertOnPeer:rebootDevice:withCompletion:", a3, 0, a4);
}

- (void)invokeInputRecoveryOnPeer:(id)a3 forType:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  MSDKPeerDemoDeviceManager *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  defaultLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[MSDKPeerDemoDeviceManager invokeInputRecoveryOnPeer:forType:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v10, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v9)
  {
    v11 = self;
    objc_sync_enter(v11);
    v12 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __78__MSDKPeerDemoDeviceManager_invokeInputRecoveryOnPeer_forType_withCompletion___block_invoke;
    v25[3] = &unk_24D0ADA48;
    v13 = v9;
    v26 = v13;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v11, "_remoteObjectProxyWithErrorHandler:", v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __78__MSDKPeerDemoDeviceManager_invokeInputRecoveryOnPeer_forType_withCompletion___block_invoke_2;
    v23[3] = &unk_24D0ADA48;
    v24 = v13;
    objc_msgSend(v14, "invokeInputRecoveryOnPeerOfID:forType:withCompletion:", v15, a4, v23);

    objc_sync_exit(v11);
  }
  else
  {
    defaultLogHandle();
    v11 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager invokeInputRecoveryOnPeer:forType:withCompletion:].cold.1(&v11->super, v16, v17, v18, v19, v20, v21, v22);
  }

}

uint64_t __78__MSDKPeerDemoDeviceManager_invokeInputRecoveryOnPeer_forType_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78__MSDKPeerDemoDeviceManager_invokeInputRecoveryOnPeer_forType_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)adjustVolumeOnPeer:(id)a3 toValue:(float)a4 forCategory:(unint64_t)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  MSDKPeerDemoDeviceManager *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  defaultLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[MSDKPeerDemoDeviceManager adjustVolumeOnPeer:toValue:forCategory:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v12, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v11)
  {
    v13 = self;
    objc_sync_enter(v13);
    v14 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __83__MSDKPeerDemoDeviceManager_adjustVolumeOnPeer_toValue_forCategory_withCompletion___block_invoke;
    v28[3] = &unk_24D0ADA48;
    v15 = v11;
    v29 = v15;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v13, "_remoteObjectProxyWithErrorHandler:", v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v14;
    v26[1] = 3221225472;
    v26[2] = __83__MSDKPeerDemoDeviceManager_adjustVolumeOnPeer_toValue_forCategory_withCompletion___block_invoke_2;
    v26[3] = &unk_24D0ADA48;
    v27 = v15;
    *(float *)&v18 = a4;
    objc_msgSend(v16, "adjustVolumeOnPeerOfID:toValue:forCategory:withCompletion:", v17, a5, v26, v18);

    objc_sync_exit(v13);
  }
  else
  {
    defaultLogHandle();
    v13 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager adjustVolumeOnPeer:toValue:forCategory:withCompletion:].cold.1(&v13->super, v19, v20, v21, v22, v23, v24, v25);
  }

}

uint64_t __83__MSDKPeerDemoDeviceManager_adjustVolumeOnPeer_toValue_forCategory_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __83__MSDKPeerDemoDeviceManager_adjustVolumeOnPeer_toValue_forCategory_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)listAppsOnPeer:(id)a3 appKind:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  MSDKPeerDemoDeviceManager *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  defaultLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[MSDKPeerDemoDeviceManager listAppsOnPeer:appKind:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v10, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v9)
  {
    v11 = self;
    objc_sync_enter(v11);
    v12 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __67__MSDKPeerDemoDeviceManager_listAppsOnPeer_appKind_withCompletion___block_invoke;
    v25[3] = &unk_24D0ADA48;
    v13 = v9;
    v26 = v13;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v11, "_remoteObjectProxyWithErrorHandler:", v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    v23[1] = 3221225472;
    v23[2] = __67__MSDKPeerDemoDeviceManager_listAppsOnPeer_appKind_withCompletion___block_invoke_2;
    v23[3] = &unk_24D0ADA70;
    v24 = v13;
    objc_msgSend(v14, "listAppsOnPeerOfID:appKind:withCompletion:", v15, a4, v23);

    objc_sync_exit(v11);
  }
  else
  {
    defaultLogHandle();
    v11 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager listAppsOnPeer:appKind:withCompletion:].cold.1(&v11->super, v16, v17, v18, v19, v20, v21, v22);
  }

}

uint64_t __67__MSDKPeerDemoDeviceManager_listAppsOnPeer_appKind_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__MSDKPeerDemoDeviceManager_listAppsOnPeer_appKind_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)launchAppOnPeer:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  MSDKPeerDemoDeviceManager *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[MSDKPeerDemoDeviceManager launchAppOnPeer:appIdentifier:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    v12 = self;
    objc_sync_enter(v12);
    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __74__MSDKPeerDemoDeviceManager_launchAppOnPeer_appIdentifier_withCompletion___block_invoke;
    v26[3] = &unk_24D0ADA48;
    v14 = v10;
    v27 = v14;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v12, "_remoteObjectProxyWithErrorHandler:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __74__MSDKPeerDemoDeviceManager_launchAppOnPeer_appIdentifier_withCompletion___block_invoke_2;
    v24[3] = &unk_24D0ADA48;
    v25 = v14;
    objc_msgSend(v15, "launchAppOnPeerOfID:appIdentifier:withCompletion:", v16, v9, v24);

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager launchAppOnPeer:appIdentifier:withCompletion:].cold.1(&v12->super, v17, v18, v19, v20, v21, v22, v23);
  }

}

uint64_t __74__MSDKPeerDemoDeviceManager_launchAppOnPeer_appIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__MSDKPeerDemoDeviceManager_launchAppOnPeer_appIdentifier_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)terminateAppOnPeer:(id)a3 appIdentifier:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  MSDKPeerDemoDeviceManager *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[MSDKPeerDemoDeviceManager terminateAppOnPeer:appIdentifier:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    v12 = self;
    objc_sync_enter(v12);
    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __77__MSDKPeerDemoDeviceManager_terminateAppOnPeer_appIdentifier_withCompletion___block_invoke;
    v26[3] = &unk_24D0ADA48;
    v14 = v10;
    v27 = v14;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v12, "_remoteObjectProxyWithErrorHandler:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __77__MSDKPeerDemoDeviceManager_terminateAppOnPeer_appIdentifier_withCompletion___block_invoke_2;
    v24[3] = &unk_24D0ADA48;
    v25 = v14;
    objc_msgSend(v15, "terminateAppOnPeerOfID:appIdentifier:withCompletion:", v16, v9, v24);

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager terminateAppOnPeer:appIdentifier:withCompletion:].cold.1(&v12->super, v17, v18, v19, v20, v21, v22, v23);
  }

}

uint64_t __77__MSDKPeerDemoDeviceManager_terminateAppOnPeer_appIdentifier_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__MSDKPeerDemoDeviceManager_terminateAppOnPeer_appIdentifier_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)listAvailableEnvironmentsOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager listAvailableEnvironmentsOnPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __76__MSDKPeerDemoDeviceManager_listAvailableEnvironmentsOnPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __76__MSDKPeerDemoDeviceManager_listAvailableEnvironmentsOnPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADA70;
    v22 = v11;
    objc_msgSend(v12, "listAvailableEnvironmentsOnPeerOfID:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager listAvailableEnvironmentsOnPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __76__MSDKPeerDemoDeviceManager_listAvailableEnvironmentsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__MSDKPeerDemoDeviceManager_listAvailableEnvironmentsOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setActiveEnvironmentOnPeer:(id)a3 environmentID:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  MSDKPeerDemoDeviceManager *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v29 = "-[MSDKPeerDemoDeviceManager setActiveEnvironmentOnPeer:environmentID:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    v12 = self;
    objc_sync_enter(v12);
    v13 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __85__MSDKPeerDemoDeviceManager_setActiveEnvironmentOnPeer_environmentID_withCompletion___block_invoke;
    v26[3] = &unk_24D0ADA48;
    v14 = v10;
    v27 = v14;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v12, "_remoteObjectProxyWithErrorHandler:", v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    v24[1] = 3221225472;
    v24[2] = __85__MSDKPeerDemoDeviceManager_setActiveEnvironmentOnPeer_environmentID_withCompletion___block_invoke_2;
    v24[3] = &unk_24D0ADA48;
    v25 = v14;
    objc_msgSend(v15, "setActiveEnvironmentOnPeerOfID:environmentID:withCompletion:", v16, v9, v24);

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager setActiveEnvironmentOnPeer:environmentID:withCompletion:].cold.1(&v12->super, v17, v18, v19, v20, v21, v22, v23);
  }

}

uint64_t __85__MSDKPeerDemoDeviceManager_setActiveEnvironmentOnPeer_environmentID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __85__MSDKPeerDemoDeviceManager_setActiveEnvironmentOnPeer_environmentID_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setImmersionLevelOnPeer:(id)a3 immersionLevel:(float)a4 animationDuration:(float)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  MSDKPeerDemoDeviceManager *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  defaultLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[MSDKPeerDemoDeviceManager setImmersionLevelOnPeer:immersionLevel:animationDuration:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v12, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v11)
  {
    v13 = self;
    objc_sync_enter(v13);
    v14 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __101__MSDKPeerDemoDeviceManager_setImmersionLevelOnPeer_immersionLevel_animationDuration_withCompletion___block_invoke;
    v29[3] = &unk_24D0ADA48;
    v15 = v11;
    v30 = v15;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v13, "_remoteObjectProxyWithErrorHandler:", v29);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __101__MSDKPeerDemoDeviceManager_setImmersionLevelOnPeer_immersionLevel_animationDuration_withCompletion___block_invoke_2;
    v27[3] = &unk_24D0ADA48;
    v28 = v15;
    *(float *)&v18 = a4;
    *(float *)&v19 = a5;
    objc_msgSend(v16, "seImmersionLevelOnPeerOfID:immersionLevel:animationDuration:withCompletion:", v17, v27, v18, v19);

    objc_sync_exit(v13);
  }
  else
  {
    defaultLogHandle();
    v13 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager setImmersionLevelOnPeer:immersionLevel:animationDuration:withCompletion:].cold.1(&v13->super, v20, v21, v22, v23, v24, v25, v26);
  }

}

uint64_t __101__MSDKPeerDemoDeviceManager_setImmersionLevelOnPeer_immersionLevel_animationDuration_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __101__MSDKPeerDemoDeviceManager_setImmersionLevelOnPeer_immersionLevel_animationDuration_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetToPassThroughOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager resetToPassThroughOnPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __69__MSDKPeerDemoDeviceManager_resetToPassThroughOnPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __69__MSDKPeerDemoDeviceManager_resetToPassThroughOnPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADA48;
    v22 = v11;
    objc_msgSend(v12, "resetToPassThroughOnPeerOfID:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager resetToPassThroughOnPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __69__MSDKPeerDemoDeviceManager_resetToPassThroughOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__MSDKPeerDemoDeviceManager_resetToPassThroughOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateTestScriptsOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager enumerateTestScriptsOnPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __71__MSDKPeerDemoDeviceManager_enumerateTestScriptsOnPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __71__MSDKPeerDemoDeviceManager_enumerateTestScriptsOnPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADA70;
    v22 = v11;
    objc_msgSend(v12, "enumerateTestScriptsOnPeerOfID:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager enumerateTestScriptsOnPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __71__MSDKPeerDemoDeviceManager_enumerateTestScriptsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__MSDKPeerDemoDeviceManager_enumerateTestScriptsOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)launchTestScriptOnPeer:(id)a3 ofIdentifier:(id)a4 withCompletion:(id)a5
{
  -[MSDKPeerDemoDeviceManager launchTestScriptOnPeer:ofIdentifier:asRoot:withCompletion:](self, "launchTestScriptOnPeer:ofIdentifier:asRoot:withCompletion:", a3, a4, 0, a5);
}

- (void)launchTestScriptOnPeer:(id)a3 ofIdentifier:(id)a4 asRoot:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  MSDKPeerDemoDeviceManager *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v7 = a5;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  defaultLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[MSDKPeerDemoDeviceManager launchTestScriptOnPeer:ofIdentifier:asRoot:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v13, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v12)
  {
    v14 = self;
    objc_sync_enter(v14);
    v15 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __87__MSDKPeerDemoDeviceManager_launchTestScriptOnPeer_ofIdentifier_asRoot_withCompletion___block_invoke;
    v28[3] = &unk_24D0ADA48;
    v16 = v12;
    v29 = v16;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v14, "_remoteObjectProxyWithErrorHandler:", v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __87__MSDKPeerDemoDeviceManager_launchTestScriptOnPeer_ofIdentifier_asRoot_withCompletion___block_invoke_2;
    v26[3] = &unk_24D0ADA48;
    v27 = v16;
    objc_msgSend(v17, "launchTestScriptOnPeerOfID:ofIdentifier:asRoot:withCompletion:", v18, v11, v7, v26);

    objc_sync_exit(v14);
  }
  else
  {
    defaultLogHandle();
    v14 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager launchTestScriptOnPeer:ofIdentifier:asRoot:withCompletion:].cold.1(&v14->super, v19, v20, v21, v22, v23, v24, v25);
  }

}

uint64_t __87__MSDKPeerDemoDeviceManager_launchTestScriptOnPeer_ofIdentifier_asRoot_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__MSDKPeerDemoDeviceManager_launchTestScriptOnPeer_ofIdentifier_asRoot_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)obtainGKResultsFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager obtainGKResultsFromPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __68__MSDKPeerDemoDeviceManager_obtainGKResultsFromPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __68__MSDKPeerDemoDeviceManager_obtainGKResultsFromPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADA98;
    v22 = v11;
    objc_msgSend(v12, "obtainGKResultsOnPeerOfID:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager obtainGKResultsFromPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __68__MSDKPeerDemoDeviceManager_obtainGKResultsFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__MSDKPeerDemoDeviceManager_obtainGKResultsFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)obtainGKMetricsFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager obtainGKMetricsFromPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __68__MSDKPeerDemoDeviceManager_obtainGKMetricsFromPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __68__MSDKPeerDemoDeviceManager_obtainGKMetricsFromPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADAC0;
    v22 = v11;
    objc_msgSend(v12, "obtainGKMetricsOnPeerOfID:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager obtainGKMetricsFromPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __68__MSDKPeerDemoDeviceManager_obtainGKMetricsFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__MSDKPeerDemoDeviceManager_obtainGKMetricsFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadLSMeasurementsOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager loadLSMeasurementsOnPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __69__MSDKPeerDemoDeviceManager_loadLSMeasurementsOnPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __69__MSDKPeerDemoDeviceManager_loadLSMeasurementsOnPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADAE8;
    v22 = v11;
    objc_msgSend(v12, "loadLSMeasurementsOnPeerOfID:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager loadLSMeasurementsOnPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __69__MSDKPeerDemoDeviceManager_loadLSMeasurementsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __69__MSDKPeerDemoDeviceManager_loadLSMeasurementsOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retrieveHSCoachingSuggestionFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager retrieveHSCoachingSuggestionFromPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __81__MSDKPeerDemoDeviceManager_retrieveHSCoachingSuggestionFromPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __81__MSDKPeerDemoDeviceManager_retrieveHSCoachingSuggestionFromPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADB10;
    v22 = v11;
    objc_msgSend(v12, "retrieveHSCoachingSuggestionFromPeer:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager retrieveHSCoachingSuggestionFromPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __81__MSDKPeerDemoDeviceManager_retrieveHSCoachingSuggestionFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __81__MSDKPeerDemoDeviceManager_retrieveHSCoachingSuggestionFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)readIPDStatusFromPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager readIPDStatusFromPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __66__MSDKPeerDemoDeviceManager_readIPDStatusFromPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __66__MSDKPeerDemoDeviceManager_readIPDStatusFromPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADB38;
    v22 = v11;
    objc_msgSend(v12, "readIPDStatusFromPeer:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager readIPDStatusFromPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __66__MSDKPeerDemoDeviceManager_readIPDStatusFromPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__MSDKPeerDemoDeviceManager_readIPDStatusFromPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)skipAutoIPDAdjustmentOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager skipAutoIPDAdjustmentOnPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __72__MSDKPeerDemoDeviceManager_skipAutoIPDAdjustmentOnPeer_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v11 = v7;
    v24 = v11;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __72__MSDKPeerDemoDeviceManager_skipAutoIPDAdjustmentOnPeer_withCompletion___block_invoke_2;
    v21[3] = &unk_24D0ADA48;
    v22 = v11;
    objc_msgSend(v12, "skipAutoIPDAdjustmentFromPeer:withCompletion:", v13, v21);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager skipAutoIPDAdjustmentOnPeer:withCompletion:].cold.1(&v9->super, v14, v15, v16, v17, v18, v19, v20);
  }

}

uint64_t __72__MSDKPeerDemoDeviceManager_skipAutoIPDAdjustmentOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__MSDKPeerDemoDeviceManager_skipAutoIPDAdjustmentOnPeer_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initiateIPDResetOnPeer:(id)a3 targetIPD:(double)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  MSDKPeerDemoDeviceManager *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  defaultLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[MSDKPeerDemoDeviceManager initiateIPDResetOnPeer:targetIPD:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v10, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v9)
  {
    v11 = self;
    objc_sync_enter(v11);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __77__MSDKPeerDemoDeviceManager_initiateIPDResetOnPeer_targetIPD_withCompletion___block_invoke;
    v22[3] = &unk_24D0ADA48;
    v12 = v9;
    v23 = v12;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v11, "_remoteObjectProxyWithErrorHandler:", v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "initiateIPDResetOnPeer:targetIPD:withCompletion:", v14, v12, a4);

    objc_sync_exit(v11);
  }
  else
  {
    defaultLogHandle();
    v11 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager initiateIPDResetOnPeer:targetIPD:withCompletion:].cold.1(&v11->super, v15, v16, v17, v18, v19, v20, v21);
  }

}

uint64_t __77__MSDKPeerDemoDeviceManager_initiateIPDResetOnPeer_targetIPD_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

- (void)queryIPDResetStageOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[MSDKPeerDemoDeviceManager queryIPDResetStageOnPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __69__MSDKPeerDemoDeviceManager_queryIPDResetStageOnPeer_withCompletion___block_invoke;
    v20[3] = &unk_24D0ADA48;
    v10 = v7;
    v21 = v10;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryIPDResetStageOnPeer:withCompletion:", v12, v10);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager queryIPDResetStageOnPeer:withCompletion:].cold.1(&v9->super, v13, v14, v15, v16, v17, v18, v19);
  }

}

uint64_t __69__MSDKPeerDemoDeviceManager_queryIPDResetStageOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAccessibiltiySettingsOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[MSDKPeerDemoDeviceManager getAccessibiltiySettingsOnPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __75__MSDKPeerDemoDeviceManager_getAccessibiltiySettingsOnPeer_withCompletion___block_invoke;
    v20[3] = &unk_24D0ADA48;
    v10 = v7;
    v21 = v10;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getAccessibiltiySettingsOnPeer:withCompletion:", v12, v10);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager getAccessibiltiySettingsOnPeer:withCompletion:].cold.1(&v9->super, v13, v14, v15, v16, v17, v18, v19);
  }

}

uint64_t __75__MSDKPeerDemoDeviceManager_getAccessibiltiySettingsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAccessibiltiySettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  MSDKPeerDemoDeviceManager *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager setAccessibiltiySettingsOnPeer:newSettings:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    v12 = self;
    objc_sync_enter(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __87__MSDKPeerDemoDeviceManager_setAccessibiltiySettingsOnPeer_newSettings_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v13 = v10;
    v24 = v13;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v12, "_remoteObjectProxyWithErrorHandler:", v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibiltiySettingsOnPeer:newSettings:withCompletion:", v15, v9, v13);

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager setAccessibiltiySettingsOnPeer:newSettings:withCompletion:].cold.1(&v12->super, v16, v17, v18, v19, v20, v21, v22);
  }

}

uint64_t __87__MSDKPeerDemoDeviceManager_setAccessibiltiySettingsOnPeer_newSettings_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)wipeCustomerAssetsOnPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[MSDKPeerDemoDeviceManager wipeCustomerAssetsOnPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __69__MSDKPeerDemoDeviceManager_wipeCustomerAssetsOnPeer_withCompletion___block_invoke;
    v20[3] = &unk_24D0ADA48;
    v10 = v7;
    v21 = v10;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wipeCustomerAssetsOnPeer:withCompletion:", v12, v10);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager wipeCustomerAssetsOnPeer:withCompletion:].cold.1(&v9->super, v13, v14, v15, v16, v17, v18, v19);
  }

}

uint64_t __69__MSDKPeerDemoDeviceManager_wipeCustomerAssetsOnPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)syncCurrentWiFiSettingsToPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[MSDKPeerDemoDeviceManager syncCurrentWiFiSettingsToPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __74__MSDKPeerDemoDeviceManager_syncCurrentWiFiSettingsToPeer_withCompletion___block_invoke;
    v20[3] = &unk_24D0ADA48;
    v10 = v7;
    v21 = v10;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "syncCurrentWiFiSettingsToPeer:withCompletion:", v12, v10);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager syncCurrentWiFiSettingsToPeer:withCompletion:].cold.1(&v9->super, v13, v14, v15, v16, v17, v18, v19);
  }

}

uint64_t __74__MSDKPeerDemoDeviceManager_syncCurrentWiFiSettingsToPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)changeWiFiSettingsOnPeer:(id)a3 newSettings:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  MSDKPeerDemoDeviceManager *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  defaultLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[MSDKPeerDemoDeviceManager changeWiFiSettingsOnPeer:newSettings:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v11, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v10)
  {
    v12 = self;
    objc_sync_enter(v12);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __81__MSDKPeerDemoDeviceManager_changeWiFiSettingsOnPeer_newSettings_withCompletion___block_invoke;
    v23[3] = &unk_24D0ADA48;
    v13 = v10;
    v24 = v13;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v12, "_remoteObjectProxyWithErrorHandler:", v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "changeWiFiSettingsOnPeer:newSettings:withCompletion:", v15, v9, v13);

    objc_sync_exit(v12);
  }
  else
  {
    defaultLogHandle();
    v12 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager changeWiFiSettingsOnPeer:newSettings:withCompletion:].cold.1(&v12->super, v16, v17, v18, v19, v20, v21, v22);
  }

}

uint64_t __81__MSDKPeerDemoDeviceManager_changeWiFiSettingsOnPeer_newSettings_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removePairedPeer:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MSDKPeerDemoDeviceManager *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  defaultLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[MSDKPeerDemoDeviceManager removePairedPeer:withCompletion:]";
    _os_log_impl(&dword_213A7E000, v8, OS_LOG_TYPE_DEFAULT, "%s: called.", buf, 0xCu);
  }

  if (v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __61__MSDKPeerDemoDeviceManager_removePairedPeer_withCompletion___block_invoke;
    v20[3] = &unk_24D0ADA48;
    v10 = v7;
    v21 = v10;
    -[MSDKPeerDemoDeviceManager _remoteObjectProxyWithErrorHandler:](v9, "_remoteObjectProxyWithErrorHandler:", v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removePairedPeer:withCompletion:", v12, v10);

    objc_sync_exit(v9);
  }
  else
  {
    defaultLogHandle();
    v9 = (MSDKPeerDemoDeviceManager *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager removePairedPeer:withCompletion:].cold.1(&v9->super, v13, v14, v15, v16, v17, v18, v19);
  }

}

uint64_t __61__MSDKPeerDemoDeviceManager_removePairedPeer_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_setUpXPCConnectionIfNeeded
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[4];
  id v56;
  id buf[2];

  -[MSDKPeerDemoDeviceManager xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 1;
  defaultLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_213A7E000, v5, OS_LOG_TYPE_DEFAULT, "MSDKPeerDemoDeviceManager: Setting up XPC connection.", (uint8_t *)buf, 2u);
  }

  +[MSDKManagedDevice sharedInstance](MSDKManagedDevice, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "retrieveXPCConnectionToPeerService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDeviceManager setXpcConnection:](self, "setXpcConnection:", v7);

  -[MSDKPeerDemoDeviceManager xpcConnection](self, "xpcConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8 != 0;

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D1A4A8);
    v52 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D1F450);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_listAppsOnPeerOfID_appKind_withCompletion_, 0, 1);

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_listAvailableEnvironmentsOnPeerOfID_withCompletion_, 0, 1);

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    v20 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v21, sel_enumerateTestScriptsOnPeerOfID_withCompletion_, 0, 1);

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v51 = objc_opt_class();
    v25 = v52;
    objc_msgSend(v22, "setWithObjects:", v23, v24, v51, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_obtainGKMetricsOnPeerOfID_withCompletion_, 0, 1);

    v27 = (void *)MEMORY[0x24BDBCF20];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v30, sel_obtainGKResultsOnPeerOfID_withCompletion_, 0, 1);

    v31 = (void *)MEMORY[0x24BDBCF20];
    v32 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v33, sel_readIPDStatusFromPeer_withCompletion_, 0, 1);

    v34 = (void *)MEMORY[0x24BDBCF20];
    v35 = objc_opt_class();
    objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v36, sel_getAccessibiltiySettingsOnPeer_withCompletion_, 0, 1);

    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v39, sel_setAccessibiltiySettingsOnPeer_newSettings_withCompletion_, 0, 1);

    v40 = (void *)MEMORY[0x24BDBCF20];
    v41 = objc_opt_class();
    objc_msgSend(v40, "setWithObjects:", v41, objc_opt_class(), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClasses:forSelector:argumentIndex:ofReply:", v42, sel_changeWiFiSettingsOnPeer_newSettings_withCompletion_, 0, 1);

    objc_initWeak(buf, self);
    -[MSDKPeerDemoDeviceManager xpcConnection](self, "xpcConnection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setExportedInterface:", v52);

    -[MSDKPeerDemoDeviceManager xpcConnection](self, "xpcConnection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setExportedObject:", self);

    -[MSDKPeerDemoDeviceManager xpcConnection](self, "xpcConnection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setRemoteObjectInterface:", v9);

    v46 = MEMORY[0x24BDAC760];
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke;
    v55[3] = &unk_24D0ADB60;
    objc_copyWeak(&v56, buf);
    -[MSDKPeerDemoDeviceManager xpcConnection](self, "xpcConnection");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setInterruptionHandler:", v55);

    v53[0] = v46;
    v53[1] = 3221225472;
    v53[2] = __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_149;
    v53[3] = &unk_24D0ADB60;
    objc_copyWeak(&v54, buf);
    -[MSDKPeerDemoDeviceManager xpcConnection](self, "xpcConnection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setInvalidationHandler:", v53);

    -[MSDKPeerDemoDeviceManager xpcConnection](self, "xpcConnection");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "activate");

    objc_destroyWeak(&v54);
    objc_destroyWeak(&v56);
    objc_destroyWeak(buf);

  }
  else
  {
    defaultLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager _setUpXPCConnectionIfNeeded].cold.1();
  }

  return v4;
}

void __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;

  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_cold_1();

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(WeakRetained);
  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "_cleanUpUponXPCDisconnection");

  objc_sync_exit(WeakRetained);
}

void __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_149(uint64_t a1)
{
  NSObject *v2;
  id *v3;
  id WeakRetained;
  id v5;

  defaultLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_149_cold_1();

  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(WeakRetained);
  v5 = objc_loadWeakRetained(v3);
  objc_msgSend(v5, "_cleanUpUponXPCDisconnection");

  objc_sync_exit(WeakRetained);
}

- (void)_cleanUpUponXPCDisconnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[MSDKPeerDemoDeviceManager setXpcConnection:](self, "setXpcConnection:", 0);
  v3 = (void *)MEMORY[0x24BDBCE30];
  -[MSDKPeerDemoDeviceManager peers](self, "peers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MSDKPeerDemoDeviceManager peers](self, "peers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[MSDKPeerDemoDeviceManager observer](self, "observer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13);
          -[MSDKPeerDemoDeviceManager observer](self, "observer", (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "managerDidLosePeer:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v11);
    }

  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  if (-[MSDKPeerDemoDeviceManager _setUpXPCConnectionIfNeeded](self, "_setUpXPCConnectionIfNeeded"))
  {
    -[MSDKPeerDemoDeviceManager xpcConnection](self, "xpcConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __64__MSDKPeerDemoDeviceManager__remoteObjectProxyWithErrorHandler___block_invoke;
    v9[3] = &unk_24D0ADA48;
    v10 = v4;
    objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorDomainMSDWithCode:message:", 3727741186, CFSTR("Failed to establish xpc connection to demod."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v7);

    v6 = 0;
  }

  return v6;
}

void __64__MSDKPeerDemoDeviceManager__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorDomainMSDWithCode:message:reason:", 3727741186, CFSTR("Failed to establish xpc connection to demod."), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)providerDidDiscoverNewPeer:(id)a3
{
  id v4;
  MSDKPeerDemoDeviceManager *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MSDKPeerDemoDeviceManager peers](v5, "peers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager providerDidDiscoverNewPeer:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_6;
  }
  -[MSDKPeerDemoDeviceManager peers](v5, "peers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v4, v6);

  -[MSDKPeerDemoDeviceManager observer](v5, "observer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[MSDKPeerDemoDeviceManager observer](v5, "observer");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject managerDidFindPeer:](v9, "managerDidFindPeer:", v4);
LABEL_6:

  }
  objc_sync_exit(v5);

}

- (void)providerDidLoseExistingPeerOfID:(id)a3
{
  id v4;
  MSDKPeerDemoDeviceManager *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[MSDKPeerDemoDeviceManager peers](v5, "peers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    defaultLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager providerDidLoseExistingPeerOfID:].cold.1((uint64_t)v4, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_8;
  }
  -[MSDKPeerDemoDeviceManager peers](v5, "peers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", v4);

  defaultLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MSDKPeerDemoDeviceManager providerDidLoseExistingPeerOfID:].cold.2((uint64_t)v4, v9);

  -[MSDKPeerDemoDeviceManager observer](v5, "observer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MSDKPeerDemoDeviceManager observer](v5, "observer");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject managerDidLosePeer:](v11, "managerDidLosePeer:", v7);
LABEL_8:

  }
  objc_sync_exit(v5);

}

- (void)providerDidUpdateDeviceInfoOnPeerOfID:(id)a3 withNewProperties:(id)a4
{
  id v6;
  id v7;
  MSDKPeerDemoDeviceManager *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[MSDKPeerDemoDeviceManager peers](v8, "peers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    defaultLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MSDKPeerDemoDeviceManager providerDidLoseExistingPeerOfID:].cold.1((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_6;
  }
  objc_msgSend(v10, "refreshDevicePropertiesUsingProperties:", v7);
  -[MSDKPeerDemoDeviceManager observer](v8, "observer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[MSDKPeerDemoDeviceManager observer](v8, "observer");
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject managerDidUpdateDeviceInfoForPeer:](v12, "managerDidUpdateDeviceInfoForPeer:", v10);
LABEL_6:

  }
  objc_sync_exit(v8);

}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSMutableDictionary)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
  objc_storeStrong((id *)&self->_peers, a3);
}

- (MSDKPeerEventsObserverProtocol)observer
{
  return (MSDKPeerEventsObserverProtocol *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

- (void)registerPeerEventsObserver:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "MSDKPeerDemoDeviceManager: Observer must conform to MSDKPeerEventsObserverProtocol.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)startPeerDiscoveryWithCompletion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)attemptPairingWithPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)subscribeDeviceInfoFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchDeviceInfoFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initiateAirPlayAssistedFromPeer:(uint64_t)a3 usingParameters:(uint64_t)a4 discoveryMode:(uint64_t)a5 withCompletion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)triggerSnapshotRevertOnPeer:(uint64_t)a3 rebootDevice:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)invokeInputRecoveryOnPeer:(uint64_t)a3 forType:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)adjustVolumeOnPeer:(uint64_t)a3 toValue:(uint64_t)a4 forCategory:(uint64_t)a5 withCompletion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)listAppsOnPeer:(uint64_t)a3 appKind:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)launchAppOnPeer:(uint64_t)a3 appIdentifier:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)terminateAppOnPeer:(uint64_t)a3 appIdentifier:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)listAvailableEnvironmentsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setActiveEnvironmentOnPeer:(uint64_t)a3 environmentID:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setImmersionLevelOnPeer:(uint64_t)a3 immersionLevel:(uint64_t)a4 animationDuration:(uint64_t)a5 withCompletion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)resetToPassThroughOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)enumerateTestScriptsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)launchTestScriptOnPeer:(uint64_t)a3 ofIdentifier:(uint64_t)a4 asRoot:(uint64_t)a5 withCompletion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)obtainGKResultsFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)obtainGKMetricsFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)loadLSMeasurementsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)retrieveHSCoachingSuggestionFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)readIPDStatusFromPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)skipAutoIPDAdjustmentOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initiateIPDResetOnPeer:(uint64_t)a3 targetIPD:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)queryIPDResetStageOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getAccessibiltiySettingsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setAccessibiltiySettingsOnPeer:(uint64_t)a3 newSettings:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)wipeCustomerAssetsOnPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)syncCurrentWiFiSettingsToPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)changeWiFiSettingsOnPeer:(uint64_t)a3 newSettings:(uint64_t)a4 withCompletion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removePairedPeer:(uint64_t)a3 withCompletion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a1, a3, "%s: No completion handler provided.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_setUpXPCConnectionIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "MSDKPeerDemoDeviceManager: Failed to retrieve XPC connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "MSDKPeerDemoDeviceManager: XPC connection to demod interrupred.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __56__MSDKPeerDemoDeviceManager__setUpXPCConnectionIfNeeded__block_invoke_149_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_1(&dword_213A7E000, v0, v1, "MSDKPeerDemoDeviceManager: XPC connection to demod invalidated.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)providerDidDiscoverNewPeer:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a2, a3, "MSDKPeerDemoDeviceManager: Received duplicated demo peer: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)providerDidLoseExistingPeerOfID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_213A7E000, a2, a3, "MSDKPeerDemoDeviceManager: No demo peer found with ID: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)providerDidLoseExistingPeerOfID:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[MSDKPeerDemoDeviceManager providerDidLoseExistingPeerOfID:]";
  v4 = 2114;
  v5 = a1;
  _os_log_debug_impl(&dword_213A7E000, a2, OS_LOG_TYPE_DEBUG, "%s - Removing peer with id:  %{public}@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
