@implementation BLTRemoteGlobalSettingsSyncServer

- (BLTRemoteGlobalSettingsSyncServer)initWithLocalEndpoint:(id)a3 remoteEndpoint:(id)a4 initialSyncCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLTRemoteGlobalSettingsSyncServer *v11;
  BLTRemoteGlobalSettingsSyncServer *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  objc_super v17;
  uint8_t buf[4];
  BLTRemoteGlobalSettingsSyncServer *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BLTRemoteGlobalSettingsSyncServer;
  v11 = -[BLTRemoteGlobalSettingsSyncServer init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    -[BLTRemoteGlobalSettingsSyncServer setLocalEndpoint:](v11, "setLocalEndpoint:", v8);
    -[BLTRemoteGlobalSettingsSyncServer setRemoteEndpoint:](v12, "setRemoteEndpoint:", v9);
    -[BLTRemoteGlobalSettingsSyncServer sendInitialChangsetWithCompletion:](v12, "sendInitialChangsetWithCompletion:", v10);
    blt_global_settings_sync_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[BLTRemoteGlobalSettingsSyncServer localEndpoint](v12, "localEndpoint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[BLTRemoteGlobalSettingsSyncServer remoteEndpoint](v12, "remoteEndpoint");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_2173D9000, v13, OS_LOG_TYPE_DEFAULT, "%@ initWithLocalEndpoint: %@ remoteEndpoint: %@", buf, 0x20u);

    }
  }

  return v12;
}

+ (id)remoteGlobalSettingsSyncServerWithLocalEndpoint:(id)a3 remoteEndpoint:(id)a4 initialSyncCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocalEndpoint:remoteEndpoint:initialSyncCompletion:", v10, v9, v8);

  return v11;
}

+ (id)remoteGlobalSettingsSyncServerWithLocalEndpoint:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLocalEndpoint:remoteEndpoint:initialSyncCompletion:", v7, v6, 0);

  return v8;
}

- (void)updateLocalSettingsWithProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  BLTRemoteGlobalSettingsSyncServer *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[BLTRemoteGlobalSettingsChangeset remoteGlobalSettingsChangesetWithProvider:](BLTRemoteGlobalSettingsChangeset, "remoteGlobalSettingsChangesetWithProvider:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTRemoteGlobalSettingsSyncServer localEndpoint](self, "localEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTRemoteGlobalSettingsChangeset remoteGlobalSettingsChangesetWithProvider:](BLTRemoteGlobalSettingsChangeset, "remoteGlobalSettingsChangesetWithProvider:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "isEqual:", v7);
  blt_global_settings_sync_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v12 = 138412802;
      v13 = self;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "%@ updateLocalSettingsWithProvider: %@ remoteChangeSet: %@ NOT UPDATING", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    if (v10)
    {
      v12 = 138412802;
      v13 = self;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_2173D9000, v9, OS_LOG_TYPE_DEFAULT, "%@ updateLocalSettingsWithProvider: %@ remoteChangeSet: %@ UPDATING", (uint8_t *)&v12, 0x20u);
    }

    -[BLTRemoteGlobalSettingsSyncServer localEndpoint](self, "localEndpoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEffectiveGlobalScheduledDeliverySetting:", objc_msgSend(v5, "globalScheduledDeliverySetting"));

    -[BLTRemoteGlobalSettingsSyncServer localEndpoint](self, "localEndpoint");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setEffectiveGlobalSummarizationSetting:](v9, "setEffectiveGlobalSummarizationSetting:", objc_msgSend(v5, "globalSummarizationSetting"));
  }

}

- (void)observer:(id)a3 updateGlobalSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  BLTRemoteGlobalSettingsSyncServer *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  blt_global_settings_sync_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412802;
    v10 = self;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_2173D9000, v8, OS_LOG_TYPE_DEFAULT, "%@ observer: %@ updateGlobalSettings: %@ UPDATING", (uint8_t *)&v9, 0x20u);
  }

  -[BLTRemoteGlobalSettingsSyncServer checkAndThenSendGlobalSettings:](self, "checkAndThenSendGlobalSettings:", v7);
}

- (void)sendInitialChangsetWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  BLTRemoteGlobalSettingsSyncServer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  blt_global_settings_sync_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl(&dword_2173D9000, v5, OS_LOG_TYPE_DEFAULT, "%@ sendInitialChangsetWithCompletion", buf, 0xCu);
  }

  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__BLTRemoteGlobalSettingsSyncServer_sendInitialChangsetWithCompletion___block_invoke;
  v8[3] = &unk_24D762270;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __71__BLTRemoteGlobalSettingsSyncServer_sendInitialChangsetWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "localEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLTRemoteGlobalSettingsChangeset remoteGlobalSettingsChangesetWithProvider:](BLTRemoteGlobalSettingsChangeset, "remoteGlobalSettingsChangesetWithProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "globalScheduledDeliverySetting");
  blt_global_settings_sync_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *v2;
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_2173D9000, v7, OS_LOG_TYPE_DEFAULT, "%@ sendInitialChangsetWithCompletion: %@", (uint8_t *)&v11, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "remoteEndpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteGlobalSettingsSyncServer:sendChangeset:", *(_QWORD *)(a1 + 32), v4);

    objc_msgSend(v4, "sendSuccess");
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __71__BLTRemoteGlobalSettingsSyncServer_sendInitialChangsetWithCompletion___block_invoke_cold_1(v2, (uint64_t)v4, v7);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

- (void)checkAndThenSendGlobalSettings:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  BLTRemoteGlobalSettingsSyncServer *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  +[BLTRemoteGlobalSettingsChangeset remoteGlobalSettingsChangesetWithProvider:](BLTRemoteGlobalSettingsChangeset, "remoteGlobalSettingsChangesetWithProvider:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "needsSend");
  blt_global_settings_sync_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_DEFAULT, "%@ checkAndThenSendGlobalSettings: %@ - sending", (uint8_t *)&v9, 0x16u);
    }

    -[BLTRemoteGlobalSettingsSyncServer remoteEndpoint](self, "remoteEndpoint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteGlobalSettingsSyncServer:sendChangeset:", self, v4);

    objc_msgSend(v4, "sendSuccess");
  }
  else
  {
    if (v7)
    {
      v9 = 138412546;
      v10 = self;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_2173D9000, v6, OS_LOG_TYPE_DEFAULT, "%@ checkAndThenSendGlobalSettings: %@ - not sending", (uint8_t *)&v9, 0x16u);
    }

  }
}

- (BLTRemoteGlobalSettingsSyncServerRemoteEndpoint)remoteEndpoint
{
  return (BLTRemoteGlobalSettingsSyncServerRemoteEndpoint *)objc_loadWeakRetained((id *)&self->_remoteEndpoint);
}

- (void)setRemoteEndpoint:(id)a3
{
  objc_storeWeak((id *)&self->_remoteEndpoint, a3);
}

- (BLTRemoteGlobalSettingsSyncServerLocalEndpoint)localEndpoint
{
  return (BLTRemoteGlobalSettingsSyncServerLocalEndpoint *)objc_loadWeakRetained((id *)&self->_localEndpoint);
}

- (void)setLocalEndpoint:(id)a3
{
  objc_storeWeak((id *)&self->_localEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_localEndpoint);
  objc_destroyWeak((id *)&self->_remoteEndpoint);
}

void __71__BLTRemoteGlobalSettingsSyncServer_sendInitialChangsetWithCompletion___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2173D9000, log, OS_LOG_TYPE_ERROR, "%@ not sending DEFAULT received from BB: %@", (uint8_t *)&v4, 0x16u);
}

@end
