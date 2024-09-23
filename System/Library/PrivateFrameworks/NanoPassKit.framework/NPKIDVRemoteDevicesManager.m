@implementation NPKIDVRemoteDevicesManager

- (NPKIDVRemoteDevicesManager)initWithDataSource:(id)a3
{
  id v4;
  NPKIDVRemoteDevicesManager *v5;
  NPKIDVRemoteDevicesManager *v6;
  NPKIDVRemoteDeviceServiceEventsCoordinator *v7;
  NPKIDVRemoteDeviceServiceEventsCoordinator *eventsCoordinator;
  NPKIDVRemoteDeviceConnectionCoordinator *v9;
  NPKIDVRemoteDeviceConnectionCoordinator *connectionCoordinator;
  NPKBiometricPassPreflightManager *v11;
  NPKBiometricPassPreflightManager *preflightManager;
  NPKIDVRemoteDeviceSessionService *v13;
  NPKIDVRemoteDeviceSessionService *remoteDeviceService;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NPKIDVRemoteDevicesManager;
  v5 = -[NPKIDVRemoteDevicesManager init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v7 = objc_alloc_init(NPKIDVRemoteDeviceServiceEventsCoordinator);
    eventsCoordinator = v6->_eventsCoordinator;
    v6->_eventsCoordinator = v7;

    v9 = objc_alloc_init(NPKIDVRemoteDeviceConnectionCoordinator);
    connectionCoordinator = v6->_connectionCoordinator;
    v6->_connectionCoordinator = v9;

    v11 = -[NPKBiometricPassPreflightManager initWithDataSource:]([NPKBiometricPassPreflightManager alloc], "initWithDataSource:", v6);
    preflightManager = v6->_preflightManager;
    v6->_preflightManager = v11;

    v13 = -[NPKIDVRemoteDeviceSessionService initWithRemoteDeviceEventsCoordinator:connectionCoordinator:preflightManager:]([NPKIDVRemoteDeviceSessionService alloc], "initWithRemoteDeviceEventsCoordinator:connectionCoordinator:preflightManager:", v6->_eventsCoordinator, v6->_connectionCoordinator, v6->_preflightManager);
    remoteDeviceService = v6->_remoteDeviceService;
    v6->_remoteDeviceService = v13;

    -[NPKIDVRemoteDeviceSessionService setDataSource:](v6->_remoteDeviceService, "setDataSource:", v6);
    -[NPKIDVRemoteDevicesManager _registerForDeviceEvents](v6, "_registerForDeviceEvents");
  }

  return v6;
}

- (void)deviceDidBecomeActive:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Handling Device did become activate", v8, 2u);
    }

  }
  -[NPKIDVRemoteDeviceServiceEventsCoordinator initializeWithDevice:](self->_eventsCoordinator, "initializeWithDevice:", v4);
  -[NPKIDVRemoteDeviceConnectionCoordinator startCurrentRemoteDeviceConnection](self->_connectionCoordinator, "startCurrentRemoteDeviceConnection");

}

- (void)deviceDidBecomeInactive
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint8_t v6[16];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Handling Device did became Inactive", v6, 2u);
    }

  }
  -[NPKIDVRemoteDevicesManager _teardownConnections](self, "_teardownConnections");
  -[NPKIDVRemoteDeviceServiceEventsCoordinator teardownCurrentRemoteDeviceContextWithReason:](self->_eventsCoordinator, "teardownCurrentRemoteDeviceContextWithReason:", 0);
}

- (void)deviceDidDeletePass:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Handling device pass deletion event", v8, 2u);
    }

  }
  -[NPKIDVRemoteDeviceServiceEventsCoordinator handlePassDeletionForPass:](self->_eventsCoordinator, "handlePassDeletionForPass:", v4);

}

- (void)_handleDeviceDidUnpair:(id)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint8_t v7[16];

  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Handling Device did unpair", v7, 2u);
    }

  }
  -[NPKIDVRemoteDevicesManager _teardownConnections](self, "_teardownConnections");
  -[NPKIDVRemoteDeviceServiceEventsCoordinator teardownCurrentRemoteDeviceContextWithReason:](self->_eventsCoordinator, "teardownCurrentRemoteDeviceContextWithReason:", 1);
}

- (void)remoteDeviceConnectionCoordinator:(id)a3 didReceivePrearmStatusUpdate:(int64_t)a4
{
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v10;
  NPKIDVRemoteDevicesManager *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromNPKIDVDeviceCredentialPrearmStatus(a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: :%@ Received credential prearm status update:%@", (uint8_t *)&v10, 0x16u);

    }
  }
  -[NPKIDVRemoteDeviceServiceEventsCoordinator setNeedsPrearmCredential:](self->_eventsCoordinator, "setNeedsPrearmCredential:", a4 == 1);
}

- (id)biometricPassPreflightManagerPairedDeviceOSVersion:(id)a3
{
  void *v4;
  void *v5;

  -[NPKIDVRemoteDevicesManager dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteDevicesManagerPairedDeviceOSVersion:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)biometricPassPreflightManager:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[NPKIDVRemoteDevicesManager dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteDevicesManager:provisionedCredentialCountsForType:completion:", self, a4, v7);

}

- (void)remoteDevicesSessionService:(id)a3 provisionedCredentialCountsForType:(unint64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  -[NPKIDVRemoteDevicesManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __104__NPKIDVRemoteDevicesManager_remoteDevicesSessionService_provisionedCredentialCountsForType_completion___block_invoke;
  v10[3] = &unk_24CFE9F80;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "remoteDevicesManager:provisionedCredentialCountsForType:completion:", self, a4, v10);

}

uint64_t __104__NPKIDVRemoteDevicesManager_remoteDevicesSessionService_provisionedCredentialCountsForType_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)remoteDevicesSessionService:(id)a3 remoteBiometricAuthenticationStatusForCredentialType:(unint64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  -[NPKIDVRemoteDevicesManager dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __122__NPKIDVRemoteDevicesManager_remoteDevicesSessionService_remoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke;
  v10[3] = &unk_24CFE9328;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "remoteDevicesManager:remoteBiometricAuthenticationStatusForCredentialType:completion:", self, a4, v10);

}

uint64_t __122__NPKIDVRemoteDevicesManager_remoteDevicesSessionService_remoteBiometricAuthenticationStatusForCredentialType_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, a2, 0);
  return result;
}

- (void)_teardownConnections
{
  -[NPKIDVRemoteDeviceConnectionCoordinator teardownCurrentRemoteDeviceConnection](self->_connectionCoordinator, "teardownCurrentRemoteDeviceConnection");
  -[NPKIDVRemoteDeviceSessionService teardownCurrentRemoteDeviceSessions](self->_remoteDeviceService, "teardownCurrentRemoteDeviceSessions");
}

- (void)_registerForDeviceEvents
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleDeviceDidUnpair_, *MEMORY[0x24BE6B450], v4);
  -[NPKIDVRemoteDeviceConnectionCoordinator addObserver:](self->_connectionCoordinator, "addObserver:", self);

}

- (NPKIDVRemoteDevicesManagerDataSource)dataSource
{
  return (NPKIDVRemoteDevicesManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_preflightManager, 0);
  objc_storeStrong((id *)&self->_connectionCoordinator, 0);
  objc_storeStrong((id *)&self->_remoteDeviceService, 0);
  objc_storeStrong((id *)&self->_eventsCoordinator, 0);
}

@end
