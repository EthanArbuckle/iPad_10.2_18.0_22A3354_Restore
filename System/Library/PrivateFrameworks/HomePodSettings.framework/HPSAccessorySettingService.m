@implementation HPSAccessorySettingService

- (HPSAccessorySettingService)initWithConnectionProvider:(id)a3 delegate:(id)a4
{
  HPSAccessorySettingService *v6;
  NSObject *v7;
  uint64_t v8;
  NSXPCConnection *xpcConnection;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSXPCConnection *v20;
  uint64_t v21;
  NSXPCConnection *v22;
  HPAccessorySettingServiceMediator *v23;
  id v24;
  uint32_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id obj;
  void *v34;
  _QWORD handler[4];
  id v36;
  int out_token;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  objc_super v42;
  uint8_t buf[4];
  const char *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  obj = a4;
  v42.receiver = self;
  v42.super_class = (Class)HPSAccessorySettingService;
  v6 = -[HPSAccessorySettingService init](&v42, sel_init);
  if (v6)
  {
    _HPSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v44 = "-[HPSAccessorySettingService initWithConnectionProvider:delegate:]";
      _os_log_impl(&dword_22DF16000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    v6->_notifyRegisterToken = -1;
    objc_storeWeak((id *)&v6->_delegate, obj);
    objc_msgSend(v32, "accessorySettingServiceConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    xpcConnection = v6->_xpcConnection;
    v6->_xpcConnection = (NSXPCConnection *)v8;

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E019A0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DF4CA8);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x24BDBCF20];
    v30 = objc_opt_class();
    v29 = objc_opt_class();
    v28 = objc_opt_class();
    v27 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v30, v29, v28, v27, v11, v12, v13, v14, v15, v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_settingsForKeyPaths_completionHandler_, 0, 1);
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_aggregateSettingsInScope_completionHandler_, 0, 1);
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_reconcileSettingsInScope_withCompletionHandler_, 0, 1);
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_mergeSettingsInScope_withCompletionHandler_, 0, 1);
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_updateSettingForKeyPath_setting_completionHandler_, 0, 1);
    objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler_, 0, 1);
    objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_notifyDidUpdateSetting_forKeyPath_, 0, 0);
    objc_msgSend(v34, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_didUpdateHH2State_, 0, 0);
    objc_initWeak((id *)buf, v6);
    v20 = v6->_xpcConnection;
    v21 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke;
    v40[3] = &unk_24F9AF630;
    objc_copyWeak(&v41, (id *)buf);
    -[NSXPCConnection setInterruptionHandler:](v20, "setInterruptionHandler:", v40);
    v22 = v6->_xpcConnection;
    v38[0] = v21;
    v38[1] = 3221225472;
    v38[2] = __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_294;
    v38[3] = &unk_24F9AF630;
    objc_copyWeak(&v39, (id *)buf);
    -[NSXPCConnection setInvalidationHandler:](v22, "setInvalidationHandler:", v38);
    v23 = -[HPAccessorySettingServiceMediator initWithInterface:]([HPAccessorySettingServiceMediator alloc], "initWithInterface:", v6);
    -[NSXPCConnection setExportedObject:](v6->_xpcConnection, "setExportedObject:", v23);
    -[NSXPCConnection setRemoteObjectInterface:](v6->_xpcConnection, "setRemoteObjectInterface:", v10);
    -[NSXPCConnection setExportedInterface:](v6->_xpcConnection, "setExportedInterface:", v34);
    -[NSXPCConnection resume](v6->_xpcConnection, "resume");
    -[HPSAccessorySettingService startXPCConnection](v6, "startXPCConnection");
    if (-[HPSAccessorySettingService notifyRegisterToken](v6, "notifyRegisterToken") == -1)
    {
      out_token = 0;
      v24 = MEMORY[0x24BDAC9B8];
      handler[0] = v21;
      handler[1] = 3221225472;
      handler[2] = __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_296;
      handler[3] = &unk_24F9AF9A8;
      objc_copyWeak(&v36, (id *)buf);
      v25 = notify_register_dispatch("com.apple.homepodsettingsd.ready", &out_token, MEMORY[0x24BDAC9B8], handler);

      if (!v25)
        -[HPSAccessorySettingService setNotifyRegisterToken:](v6, "setNotifyRegisterToken:", out_token);
      objc_destroyWeak(&v36);
    }

    objc_destroyWeak(&v39);
    objc_destroyWeak(&v41);
    objc_destroyWeak((id *)buf);

  }
  return v6;
}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;

  _HPSLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_cold_1(v2, v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionInterrupted");

}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_294(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;

  _HPSLoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_294_cold_1(v2, v3, v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionInterrupted");

}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_296(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _HPSLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22DF16000, v2, OS_LOG_TYPE_DEFAULT, "Received notification that homepodsettingsd daemon is ready", buf, 2u);
    }

    objc_msgSend(WeakRetained, "startXPCConnection");
    objc_msgSend(WeakRetained, "delegate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      objc_msgSend(WeakRetained, "delegate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        _HPSLoggingFacility();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_22DF16000, v7, OS_LOG_TYPE_DEFAULT, "Inform clients that homepodsettingsd is reconnected and ready!", v9, 2u);
        }

        objc_msgSend(WeakRetained, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "didReconnect");

      }
    }
  }

}

- (HPSAccessorySettingService)initWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  _HPSAccessorySettingServiceConnectionProvider *v6;
  HPSAccessorySettingService *v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HPSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[HPSAccessorySettingService initWithDelegate:]";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_22DF16000, v5, OS_LOG_TYPE_DEFAULT, "%s Delegate %@", (uint8_t *)&v9, 0x16u);
  }

  v6 = objc_alloc_init(_HPSAccessorySettingServiceConnectionProvider);
  v7 = -[HPSAccessorySettingService initWithConnectionProvider:delegate:](self, "initWithConnectionProvider:delegate:", v6, v4);

  return v7;
}

- (HPSAccessorySettingService)init
{
  NSObject *v3;
  _HPSAccessorySettingServiceConnectionProvider *v4;
  HPSAccessorySettingService *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[HPSAccessorySettingService init]";
    _os_log_impl(&dword_22DF16000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

  v4 = objc_alloc_init(_HPSAccessorySettingServiceConnectionProvider);
  v5 = -[HPSAccessorySettingService initWithConnectionProvider:delegate:](self, "initWithConnectionProvider:delegate:", v4, 0);

  return v5;
}

- (void)startXPCConnection
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[HPSAccessorySettingService startXPCConnection]";
    _os_log_impl(&dword_22DF16000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startXPCConnection");

}

void __48__HPSAccessorySettingService_startXPCConnection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __48__HPSAccessorySettingService_startXPCConnection__block_invoke_cold_1(v2, v3);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[HPSAccessorySettingService notifyRegisterToken](self, "notifyRegisterToken") != -1)
    notify_cancel(-[HPSAccessorySettingService notifyRegisterToken](self, "notifyRegisterToken"));
  objc_storeWeak((id *)&self->_delegate, 0);
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)HPSAccessorySettingService;
  -[HPSAccessorySettingService dealloc](&v4, sel_dealloc);
}

- (void)updateSettingForKeyPath:(id)a3 setting:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void (**v18)(id, _QWORD, void *);
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(id, _QWORD, void *);
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  _HPSLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v28 = "-[HPSAccessorySettingService updateSettingForKeyPath:setting:completionHandler:]";
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_22DF16000, v11, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  if (+[HPSSettingHelper shouldDisableUpdateSettingForKeyPath:](HPSSettingHelper, "shouldDisableUpdateSettingForKeyPath:", v8))
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    v26 = CFSTR("Keypath not supported for updating value");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.homepodsettings"), 10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, MEMORY[0x24BDBD1A8], v15);
  }
  else
  {
    -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke;
    v23[3] = &unk_24F9AF698;
    v18 = v10;
    v24 = v18;
    objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSHomeKitSettingHelper compatibleWriteSetting:](HPSHomeKitSettingHelper, "compatibleWriteSetting:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke_310;
    v21[3] = &unk_24F9AF9F0;
    v22 = v18;
    objc_msgSend(v19, "updateSettingForKeyPath:setting:completionHandler:", v8, v20, v21);

    v15 = v24;
  }

}

void __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke_310(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  +[HPSHomeKitSettingHelper compatibleReadResults:](HPSHomeKitSettingHelper, "compatibleReadResults:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)updateSettingWithoutSynchronizationForKeyPath:(id)a3 setting:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void (**v18)(id, _QWORD, void *);
  void *v19;
  void *v20;
  _QWORD v21[4];
  void (**v22)(id, _QWORD, void *);
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  _HPSLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v28 = "-[HPSAccessorySettingService updateSettingWithoutSynchronizationForKeyPath:setting:completionHandler:]";
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_22DF16000, v11, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  if (+[HPSSettingHelper shouldDisableUpdateSettingForKeyPath:](HPSSettingHelper, "shouldDisableUpdateSettingForKeyPath:", v8))
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v25 = *MEMORY[0x24BDD0FC8];
    v26 = CFSTR("Keypath not supported for updating value");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.homepodsettings"), 10, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10[2](v10, MEMORY[0x24BDBD1A8], v15);
  }
  else
  {
    -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke;
    v23[3] = &unk_24F9AF698;
    v18 = v10;
    v24 = v18;
    objc_msgSend(v16, "remoteObjectProxyWithErrorHandler:", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSHomeKitSettingHelper compatibleWriteSetting:](HPSHomeKitSettingHelper, "compatibleWriteSetting:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v17;
    v21[1] = 3221225472;
    v21[2] = __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke_312;
    v21[3] = &unk_24F9AF9F0;
    v22 = v18;
    objc_msgSend(v19, "updateSettingWithoutSynchronizationForKeyPath:setting:completionHandler:", v8, v20, v21);

    v15 = v24;
  }

}

void __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke_312(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  +[HPSHomeKitSettingHelper compatibleReadResults:](HPSHomeKitSettingHelper, "compatibleReadResults:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (id)updateSettingForKeyPath:(id)a3 setting:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  const __CFString *v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HPSLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[HPSAccessorySettingService updateSettingForKeyPath:setting:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_22DF16000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  if (+[HPSSettingHelper shouldDisableUpdateSettingForKeyPath:](HPSSettingHelper, "shouldDisableUpdateSettingForKeyPath:", v6))
  {
    -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke;
    v19[3] = &unk_24F9AFA18;
    v19[4] = buf;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSHomeKitSettingHelper compatibleWriteSetting:](HPSHomeKitSettingHelper, "compatibleWriteSetting:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke_313;
    v18[3] = &unk_24F9AFA40;
    v18[4] = buf;
    objc_msgSend(v12, "updateSettingForKeyPath:setting:completionHandler:", v6, v13, v18);

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FC8];
    v21 = CFSTR("Keypath not supported for updating value");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.homepodsettings"), 10, v10);
    v15 = objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v15;
  }

  v16 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v16;
}

void __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke_cold_1(v3, v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke_313(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _HPSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_22DF16000, v7, OS_LOG_TYPE_DEFAULT, "Results: %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

}

- (id)updateSettingWithoutSynchronizationForKeyPath:(id)a3 setting:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  const __CFString *v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HPSLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[HPSAccessorySettingService updateSettingWithoutSynchronizationForKeyPath:setting:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_22DF16000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  if (+[HPSSettingHelper shouldDisableUpdateSettingForKeyPath:](HPSSettingHelper, "shouldDisableUpdateSettingForKeyPath:", v6))
  {
    -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke;
    v19[3] = &unk_24F9AFA18;
    v19[4] = buf;
    objc_msgSend(v10, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HPSHomeKitSettingHelper compatibleWriteSetting:](HPSHomeKitSettingHelper, "compatibleWriteSetting:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    v18[1] = 3221225472;
    v18[2] = __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke_314;
    v18[3] = &unk_24F9AFA40;
    v18[4] = buf;
    objc_msgSend(v12, "updateSettingWithoutSynchronizationForKeyPath:setting:completionHandler:", v6, v13, v18);

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FC8];
    v21 = CFSTR("Keypath not supported for updating value");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.homepodsettings"), 10, v10);
    v15 = objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v15;
  }

  v16 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v16;
}

void __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke_cold_1(v3, v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke_314(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _HPSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_22DF16000, v7, OS_LOG_TYPE_DEFAULT, "Results: %@", (uint8_t *)&v10, 0xCu);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v6;

}

- (void)settingsForKeyPaths:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HPSLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v21 = "-[HPSAccessorySettingService settingsForKeyPaths:completionHandler:]";
    v22 = 2112;
    v23 = v9;
    _os_log_impl(&dword_22DF16000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  _HPSLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[HPSAccessorySettingService settingsForKeyPaths:completionHandler:]";
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_22DF16000, v10, OS_LOG_TYPE_DEFAULT, "%s KeyPaths %@", buf, 0x16u);
  }

  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke;
  v18[3] = &unk_24F9AF698;
  v13 = v7;
  v19 = v13;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke_315;
  v16[3] = &unk_24F9AFA68;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "settingsForKeyPaths:completionHandler:", v6, v16);

}

void __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke_315(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  +[HPSHomeKitSettingHelper compatibleReadResults:](HPSHomeKitSettingHelper, "compatibleReadResults:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

}

- (void)settingForKeyPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HPSLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "-[HPSAccessorySettingService settingForKeyPath:completionHandler:]";
    v24 = 2112;
    v25 = v9;
    _os_log_impl(&dword_22DF16000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  v21 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _HPSLoggingFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "-[HPSAccessorySettingService settingForKeyPath:completionHandler:]";
    v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_22DF16000, v11, OS_LOG_TYPE_DEFAULT, "%s KeyPath %@", buf, 0x16u);
  }

  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke;
  v19[3] = &unk_24F9AF698;
  v14 = v7;
  v20 = v14;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke_317;
  v17[3] = &unk_24F9AFA68;
  v18 = v14;
  v16 = v14;
  objc_msgSend(v15, "settingsForKeyPaths:completionHandler:", v10, v17);

}

void __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke_317(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setting");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    +[HPSHomeKitSettingHelper compatibleReadSetting:](HPSHomeKitSettingHelper, "compatibleReadSetting:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
  }
  else
  {
    objc_msgSend(v3, "error");
    v7 = objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }
  v8 = (id)v7;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)settingForKeyPath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _BYTE buf[24];
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HPSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[HPSAccessorySettingService settingForKeyPath:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_22DF16000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = 0;
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_318);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_319;
  v11[3] = &unk_24F9AFAB0;
  v11[4] = buf;
  objc_msgSend(v8, "settingForKeyPath:completionHandler:", v4, v11);

  v9 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v9;
}

void __48__HPSAccessorySettingService_settingForKeyPath___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_cold_1();

}

void __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_319(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HPSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_cold_1();

  }
  +[HPSHomeKitSettingHelper compatibleReadSetting:](HPSHomeKitSettingHelper, "compatibleReadSetting:", v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)isSettingAvailableForKeyPath:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HPSLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v17 = "-[HPSAccessorySettingService isSettingAvailableForKeyPath:completionHandler:]";
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_22DF16000, v8, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  _HPSLoggingFacility();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[HPSAccessorySettingService isSettingAvailableForKeyPath:completionHandler:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_22DF16000, v10, OS_LOG_TYPE_DEFAULT, "%s KeyPath %@", buf, 0x16u);
  }

  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __77__HPSAccessorySettingService_isSettingAvailableForKeyPath_completionHandler___block_invoke;
  v14[3] = &unk_24F9AF698;
  v15 = v7;
  v12 = v7;
  objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "isSettingAvailableForKeyPath:completionHandler:", v6, v12);

}

void __77__HPSAccessorySettingService_isSettingAvailableForKeyPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__HPSAccessorySettingService_isSettingAvailableForKeyPath_completionHandler___block_invoke_cold_1(v3, v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getKeyPathsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HPSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v13 = "-[HPSAccessorySettingService getKeyPathsWithCompletionHandler:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_22DF16000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__HPSAccessorySettingService_getKeyPathsWithCompletionHandler___block_invoke;
  v10[3] = &unk_24F9AF698;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getKeyPathsWithCompletionHandler:", v8);

}

void __63__HPSAccessorySettingService_getKeyPathsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __63__HPSAccessorySettingService_getKeyPathsWithCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getKeyPathsAvailabilityWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HPSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v13 = "-[HPSAccessorySettingService getKeyPathsAvailabilityWithCompletionHandler:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_22DF16000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__HPSAccessorySettingService_getKeyPathsAvailabilityWithCompletionHandler___block_invoke;
  v10[3] = &unk_24F9AF698;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "getKeyPathsAvailabilityWithCompletionHandler:", v8);

}

void __75__HPSAccessorySettingService_getKeyPathsAvailabilityWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __75__HPSAccessorySettingService_getKeyPathsAvailabilityWithCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reconcileSettingsInScope:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _HPSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v15 = "-[HPSAccessorySettingService reconcileSettingsInScope:withCompletionHandler:]";
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_22DF16000, v7, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __77__HPSAccessorySettingService_reconcileSettingsInScope_withCompletionHandler___block_invoke;
  v12[3] = &unk_24F9AF698;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reconcileSettingsInScope:withCompletionHandler:", a3, v10);

}

void __77__HPSAccessorySettingService_reconcileSettingsInScope_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __77__HPSAccessorySettingService_reconcileSettingsInScope_withCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)mergeSettingsInScope:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _HPSLoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v15 = "-[HPSAccessorySettingService mergeSettingsInScope:withCompletionHandler:]";
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_22DF16000, v7, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__HPSAccessorySettingService_mergeSettingsInScope_withCompletionHandler___block_invoke;
  v12[3] = &unk_24F9AF698;
  v13 = v6;
  v10 = v6;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mergeSettingsInScope:withCompletionHandler:", a3, v10);

}

void __73__HPSAccessorySettingService_mergeSettingsInScope_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__HPSAccessorySettingService_mergeSettingsInScope_withCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)heldAssertionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HPSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v13 = "-[HPSAccessorySettingService heldAssertionsWithCompletionHandler:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_22DF16000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__HPSAccessorySettingService_heldAssertionsWithCompletionHandler___block_invoke;
  v10[3] = &unk_24F9AF698;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "heldAssertionsWithCompletionHandler:", v8);

}

void __66__HPSAccessorySettingService_heldAssertionsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __66__HPSAccessorySettingService_heldAssertionsWithCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllSettingsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HPSLoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[HPSAccessorySettingService fetchAllSettingsWithCompletionHandler:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_22DF16000, v5, OS_LOG_TYPE_DEFAULT, "%s backtrace: %@", buf, 0x16u);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke;
  v8[3] = &unk_24F9AFB28;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HPSAccessorySettingService getKeyPathsWithCompletionHandler:](self, "getKeyPathsWithCompletionHandler:", v8);

}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v4 = MEMORY[0x24BDAC760];
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_24F9AFAD8;
  v9[4] = &v10;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  v5 = v11[5];
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_24F9AF9F0;
  v6 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v6, "settingsForKeyPaths:completionHandler:", v5, v7);

  _Block_object_dispose(&v10, 8);
}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  v11 = v4;
  if (v6)
  {
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    v10 = v4;
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;
  }

}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HPSLoggingFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_3_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_323;
    v10[3] = &unk_24F9AFB00;
    v11 = v8;
    v9 = v8;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_323(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "setting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)getAllSettingsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke;
  v6[3] = &unk_24F9AFB28;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HPSAccessorySettingService getKeyPathsWithCompletionHandler:](self, "getKeyPathsWithCompletionHandler:", v6);

}

void __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v4 = MEMORY[0x24BDAC760];
  v15 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_24F9AFAD8;
  v9[4] = &v10;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);
  v5 = v11[5];
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_3;
  v7[3] = &unk_24F9AF9F0;
  v6 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v6, "settingsForKeyPaths:completionHandler:", v5, v7);

  _Block_object_dispose(&v10, 8);
}

void __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  v11 = v4;
  if (v6)
  {
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    v10 = v4;
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;
  }

}

void __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = (objc_class *)MEMORY[0x24BDBCEB8];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_4;
  v7[3] = &unk_24F9AFB00;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __66__HPSAccessorySettingService_getAllSettingsWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "setting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)aggregateAllSettingsInScope:(unint64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke;
  v14[3] = &unk_24F9AF698;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_326;
  v12[3] = &unk_24F9AFB50;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "aggregateSettingsInScope:completionHandler:", a3, v12);

}

void __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_326(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
        objc_msgSend(v4, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x24BDAC760];
        v14[1] = 3221225472;
        v14[2] = __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_2;
        v14[3] = &unk_24F9AFB00;
        v15 = v10;
        v12 = v10;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

        objc_msgSend(v3, "setObject:forKey:", v12, v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "setting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "setting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)aggregateAllSettingsWithCompletionHandler:(id)a3
{
  -[HPSAccessorySettingService aggregateAllSettingsInScope:withCompletionHandler:](self, "aggregateAllSettingsInScope:withCompletionHandler:", 1, a3);
}

- (NSDictionary)keyPaths
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __38__HPSAccessorySettingService_keyPaths__block_invoke;
  v8[3] = &unk_24F9AFA18;
  v8[4] = &v9;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __38__HPSAccessorySettingService_keyPaths__block_invoke_328;
  v7[3] = &unk_24F9AFB78;
  v7[4] = &v9;
  objc_msgSend(v4, "getKeyPathsWithCompletionHandler:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v5;
}

void __38__HPSAccessorySettingService_keyPaths__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__HPSAccessorySettingService_keyPaths__block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1B8];

}

void __38__HPSAccessorySettingService_keyPaths__block_invoke_328(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (NSDictionary)heldAssertions
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__HPSAccessorySettingService_heldAssertions__block_invoke;
  v8[3] = &unk_24F9AFA18;
  v8[4] = &v9;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __44__HPSAccessorySettingService_heldAssertions__block_invoke_329;
  v7[3] = &unk_24F9AFB78;
  v7[4] = &v9;
  objc_msgSend(v4, "heldAssertionsWithCompletionHandler:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSDictionary *)v5;
}

void __44__HPSAccessorySettingService_heldAssertions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44__HPSAccessorySettingService_heldAssertions__block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1B8];

}

void __44__HPSAccessorySettingService_heldAssertions__block_invoke_329(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)keyPathsAvailability
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke;
  v8[3] = &unk_24F9AFA18;
  v8[4] = &v9;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke_330;
  v7[3] = &unk_24F9AFB78;
  v7[4] = &v9;
  objc_msgSend(v4, "getKeyPathsAvailabilityWithCompletionHandler:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke_cold_1();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = MEMORY[0x24BDBD1B8];

}

void __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke_330(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)hasOptedToHH2
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__HPSAccessorySettingService_hasOptedToHH2__block_invoke;
  v7[3] = &unk_24F9AFA18;
  v7[4] = &v8;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __43__HPSAccessorySettingService_hasOptedToHH2__block_invoke_2;
  v6[3] = &unk_24F9AFBA0;
  v6[4] = &v8;
  objc_msgSend(v4, "optedToHH2WithCompletionHandler:", v6);

  LOBYTE(v2) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

uint64_t __43__HPSAccessorySettingService_hasOptedToHH2__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __43__HPSAccessorySettingService_hasOptedToHH2__block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)optedToHH2WithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__HPSAccessorySettingService_optedToHH2WithCompletionHandler___block_invoke;
  v8[3] = &unk_24F9AF698;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "optedToHH2WithCompletionHandler:", v6);

}

void __62__HPSAccessorySettingService_optedToHH2WithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HPSLoggingFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__HPSAccessorySettingService_optedToHH2WithCompletionHandler___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)overrideOptedToHH2State:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[HPSAccessorySettingService xpcConnection](self, "xpcConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_332);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "overrideOptedToHH2State:", v3);

}

void __54__HPSAccessorySettingService_overrideOptedToHH2State___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _HPSLoggingFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __54__HPSAccessorySettingService_overrideOptedToHH2State___block_invoke_cold_1();

}

- (void)notifyDidUpdateSetting:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HPSLoggingFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315650;
    v14 = "-[HPSAccessorySettingService notifyDidUpdateSetting:forKeyPath:]";
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_22DF16000, v8, OS_LOG_TYPE_DEFAULT, "%s Notify Setting %@ updated for keyPath %@ ", (uint8_t *)&v13, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (v6)
    {
      +[HPSHomeKitSettingHelper compatibleReadSetting:](HPSHomeKitSettingHelper, "compatibleReadSetting:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(WeakRetained, "didUpdateSetting:forKeyPath:", v12, v7);

  }
}

- (void)_handleConnectionInterrupted
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[HPSAccessorySettingService _handleConnectionInterrupted]";
  OUTLINED_FUNCTION_4_0(&dword_22DF16000, a1, a3, "%s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

- (HPSAccessorySettingServiceConnectionProvider)provider
{
  return self->_provider;
}

- (HPSAccessorySettingServiceDelegate)delegate
{
  return (HPSAccessorySettingServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (int)notifyRegisterToken
{
  return self->_notifyRegisterToken;
}

- (void)setNotifyRegisterToken:(int)a3
{
  self->_notifyRegisterToken = a3;
}

- (BOOL)isMigrationToHH2Complete
{
  return self->_migrationToHH2Complete;
}

- (void)setMigrationToHH2Complete:(BOOL)a3
{
  self->_migrationToHH2Complete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_provider, 0);
}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[HPSAccessorySettingService initWithConnectionProvider:delegate:]_block_invoke";
  OUTLINED_FUNCTION_4_0(&dword_22DF16000, a1, a3, "%s Connection to HomePodSettings server was interrupted!", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void __66__HPSAccessorySettingService_initWithConnectionProvider_delegate___block_invoke_294_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[HPSAccessorySettingService initWithConnectionProvider:delegate:]_block_invoke";
  OUTLINED_FUNCTION_4_0(&dword_22DF16000, a1, a3, "%s Connection to HomePodSettings server was invalidated!", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4();
}

void __48__HPSAccessorySettingService_startXPCConnection__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_4_0(&dword_22DF16000, a2, v4, "Failed to start Connection. Error = %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_3_0();
}

void __80__HPSAccessorySettingService_updateSettingForKeyPath_setting_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, a2, v4, "%s Error %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_3_0();
}

void __102__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, a2, v4, "%s Error %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_3_0();
}

void __62__HPSAccessorySettingService_updateSettingForKeyPath_setting___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, a2, v4, "%s Error %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_3_0();
}

void __84__HPSAccessorySettingService_updateSettingWithoutSynchronizationForKeyPath_setting___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, a2, v4, "%s Error %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_3_0();
}

void __68__HPSAccessorySettingService_settingsForKeyPaths_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, a2, v4, "%s Error %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_3_0();
}

void __66__HPSAccessorySettingService_settingForKeyPath_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, a2, v4, "%s Error %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_3_0();
}

void __48__HPSAccessorySettingService_settingForKeyPath___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __77__HPSAccessorySettingService_isSettingAvailableForKeyPath_completionHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, a2, v4, "%s Error %@", (uint8_t *)v5);

  OUTLINED_FUNCTION_3_0();
}

void __63__HPSAccessorySettingService_getKeyPathsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __75__HPSAccessorySettingService_getKeyPathsAvailabilityWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __77__HPSAccessorySettingService_reconcileSettingsInScope_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __73__HPSAccessorySettingService_mergeSettingsInScope_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __66__HPSAccessorySettingService_heldAssertionsWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __68__HPSAccessorySettingService_fetchAllSettingsWithCompletionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __80__HPSAccessorySettingService_aggregateAllSettingsInScope_withCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __38__HPSAccessorySettingService_keyPaths__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __44__HPSAccessorySettingService_heldAssertions__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __50__HPSAccessorySettingService_keyPathsAvailability__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __62__HPSAccessorySettingService_optedToHH2WithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

void __54__HPSAccessorySettingService_overrideOptedToHH2State___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_22DF16000, v0, v1, "%s Error %@", (uint8_t *)v2);
  OUTLINED_FUNCTION_4();
}

@end
