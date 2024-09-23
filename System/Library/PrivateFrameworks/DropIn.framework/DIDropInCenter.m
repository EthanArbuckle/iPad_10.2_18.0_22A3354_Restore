@implementation DIDropInCenter

- (DIDropInCenter)initWithHomeIdentifier:(id)a3
{
  return -[DIDropInCenter initWithHomeIdentifier:queue:](self, "initWithHomeIdentifier:queue:", a3, 0);
}

- (DIDropInCenter)initWithNullableHomeIdentifier:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  DIDropInCenter *v9;
  NSObject *v10;
  DIClientContext *v11;
  DIXPCDispatcher *v12;
  DIXPCManager *v13;
  DIXPCConnectionManager *v14;
  DIXPCConnectionManager *connectionManager;
  objc_super v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DIDropInCenter;
  v9 = -[DIDropInCenter init](&v17, sel_init);
  if (v9)
  {
    DILogHandleDropInCenter();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v19 = &stru_250B97E20;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_23A742000, v10, OS_LOG_TYPE_DEFAULT, "%@Creating Drop In Center with Home Identifier %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v9->_homeIdentifier, a3);
    v11 = -[DIClientContext initWithHomeIdentifier:]([DIClientContext alloc], "initWithHomeIdentifier:", v9->_homeIdentifier);
    v12 = -[DIXPCDispatcher initWithClientContext:]([DIXPCDispatcher alloc], "initWithClientContext:", v11);
    v13 = -[DIXPCManager initWithClientContext:dispatcher:clientQueue:]([DIXPCManager alloc], "initWithClientContext:dispatcher:clientQueue:", v11, v12, v8);
    -[DIXPCManager setDelegate:](v13, "setDelegate:", v9);
    v14 = -[DIXPCConnectionManager initWithXPCManager:dispatcher:]([DIXPCConnectionManager alloc], "initWithXPCManager:dispatcher:", v13, v12);
    connectionManager = v9->_connectionManager;
    v9->_connectionManager = v14;

  }
  return v9;
}

- (DIDropInCenter)init
{
  return -[DIDropInCenter initWithNullableHomeIdentifier:queue:](self, "initWithNullableHomeIdentifier:queue:", 0, 0);
}

+ (id)new
{
  return objc_alloc_init(DIDropInCenter);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInCenter();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = &stru_250B97E20;
    _os_log_impl(&dword_23A742000, v3, OS_LOG_TYPE_DEFAULT, "%@Tearing down Drop In Center", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)DIDropInCenter;
  -[DIDropInCenter dealloc](&v4, sel_dealloc);
}

- (DIDeviceManager)deviceManager
{
  DIDeviceManager *deviceManager;
  DIDeviceManager *v4;
  void *v5;
  DIDeviceManager *v6;
  DIDeviceManager *v7;

  deviceManager = self->_deviceManager;
  if (!deviceManager)
  {
    v4 = [DIDeviceManager alloc];
    -[DIDropInCenter connectionManager](self, "connectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DIDeviceManager initWithConnectionManager:](v4, "initWithConnectionManager:", v5);
    v7 = self->_deviceManager;
    self->_deviceManager = v6;

    deviceManager = self->_deviceManager;
  }
  return deviceManager;
}

- (DIDropInSessionManager)sessionManager
{
  DIDropInSessionManager *sessionManager;
  DIDropInSessionManager *v4;
  void *v5;
  DIDropInSessionManager *v6;
  DIDropInSessionManager *v7;

  sessionManager = self->_sessionManager;
  if (!sessionManager)
  {
    v4 = [DIDropInSessionManager alloc];
    -[DIDropInCenter connectionManager](self, "connectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DIDropInSessionManager initWithConnectionManager:](v4, "initWithConnectionManager:", v5);
    v7 = self->_sessionManager;
    self->_sessionManager = v6;

    sessionManager = self->_sessionManager;
  }
  return sessionManager;
}

- (DIAudioPowerController)audioPowerController
{
  DIAudioPowerController *audioPowerController;
  DIAudioPowerController *v4;
  void *v5;
  DIAudioPowerController *v6;
  DIAudioPowerController *v7;

  audioPowerController = self->_audioPowerController;
  if (!audioPowerController)
  {
    v4 = [DIAudioPowerController alloc];
    -[DIDropInCenter connectionManager](self, "connectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DIAudioPowerController initWithConnectionManager:](v4, "initWithConnectionManager:", v5);
    v7 = self->_audioPowerController;
    self->_audioPowerController = v6;

    audioPowerController = self->_audioPowerController;
  }
  return audioPowerController;
}

- (DIAudioSystemController)audioSystemController
{
  DIAudioSystemController *audioSystemController;
  DIAudioSystemController *v4;
  void *v5;
  DIAudioSystemController *v6;
  DIAudioSystemController *v7;

  audioSystemController = self->_audioSystemController;
  if (!audioSystemController)
  {
    v4 = [DIAudioSystemController alloc];
    -[DIDropInCenter connectionManager](self, "connectionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[DIAudioSystemController initWithConnectionManager:](v4, "initWithConnectionManager:", v5);
    v7 = self->_audioSystemController;
    self->_audioSystemController = v6;

    audioSystemController = self->_audioSystemController;
  }
  return audioSystemController;
}

- (void)startSessionWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[DIDropInCenter connectionManager](self, "connectionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  DILogHandleDropInCenter();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = &stru_250B97E20;
    v25 = 2112;
    v26 = v6;
    _os_log_impl(&dword_23A742000, v11, OS_LOG_TYPE_DEFAULT, "%@Start session with request %@", buf, 0x16u);
  }

  -[DIDropInCenter connectionManager](self, "connectionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "manager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke;
  v21[3] = &unk_250B96310;
  v21[4] = self;
  v16 = v7;
  v22 = v16;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_2;
  v19[3] = &unk_250B96338;
  v19[4] = self;
  v20 = v16;
  v18 = v16;
  objc_msgSend(v17, "startSessionWithContext:request:completionHandler:", v10, v6, v19);

}

void __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  DILogHandleDropInCenter();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v14 = &stru_250B97E20;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_23A742000, v4, OS_LOG_TYPE_ERROR, "%@Failed to start Session %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_12;
  v10[3] = &unk_250B962E8;
  v8 = *(id *)(a1 + 40);
  v11 = v3;
  v12 = v8;
  v9 = v3;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v7, v10);

}

uint64_t __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConnectionManager:", v7);

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActiveSession:", v5);

  DILogHandleDropInCenter();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v25 = &stru_250B97E20;
      v26 = 2112;
      v27 = v6;
      v11 = "%@Failed to start Session %@";
      v12 = v10;
      v13 = OS_LOG_TYPE_ERROR;
LABEL_6:
      _os_log_impl(&dword_23A742000, v12, v13, v11, buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = &stru_250B97E20;
    v26 = 2112;
    v27 = v5;
    v11 = "%@Started Session: %@";
    v12 = v10;
    v13 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 32), "connectionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "manager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientQueue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_15;
  v20[3] = &unk_250B966C0;
  v17 = *(id *)(a1 + 40);
  v22 = v6;
  v23 = v17;
  v21 = v5;
  v18 = v6;
  v19 = v5;
  +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v16, v20);

}

uint64_t __60__DIDropInCenter_startSessionWithRequest_completionHandler___block_invoke_15(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)managerDidInterruptConnection:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[DIDropInCenter delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[DIDropInCenter connectionManager](self, "connectionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "manager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clientQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__DIDropInCenter_managerDidInterruptConnection___block_invoke;
    v9[3] = &unk_250B96588;
    v9[4] = self;
    +[DIUtilities onQueue:block:](DIUtilities, "onQueue:block:", v8, v9);

  }
}

void __48__DIDropInCenter_managerDidInterruptConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  DILogHandleDropInCenter();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412546;
    v6 = &stru_250B97E20;
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_23A742000, v2, OS_LOG_TYPE_DEFAULT, "%@Notify delegate: Server Disconnected for Center = %@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serverDisconnectedForDropInCenter:", *(_QWORD *)(a1 + 32));

}

- (void)setDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManager, a3);
}

- (void)setSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_sessionManager, a3);
}

- (void)setAudioPowerController:(id)a3
{
  objc_storeStrong((id *)&self->_audioPowerController, a3);
}

- (void)setAudioSystemController:(id)a3
{
  objc_storeStrong((id *)&self->_audioSystemController, a3);
}

- (DIDropInCenterDelegate)delegate
{
  return (DIDropInCenterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)homeIdentifier
{
  return self->_homeIdentifier;
}

- (DIXPCConnectionManager)connectionManager
{
  return self->_connectionManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionManager, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioSystemController, 0);
  objc_storeStrong((id *)&self->_audioPowerController, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
}

@end
