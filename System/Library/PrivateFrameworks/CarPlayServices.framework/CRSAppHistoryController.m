@implementation CRSAppHistoryController

- (CRSAppHistoryController)init
{
  CRSAppHistoryController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *SerialWithQoS;
  uint64_t v8;
  BSServiceConnection *connection;
  BSServiceConnection *v10;
  id v11;
  NSObject *v12;
  BSServiceConnection *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  CRSAppHistoryController *v19;
  id v20;
  objc_super v21;
  uint8_t buf[4];
  BSServiceConnection *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)CRSAppHistoryController;
  v2 = -[CRSAppHistoryController init](&v21, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BE0FA08];
    objc_msgSend(MEMORY[0x24BE15210], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.service"), v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE15210], "serviceQuality");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceClass");
    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();

    objc_storeStrong((id *)&v2->_callbackQueue, SerialWithQoS);
    objc_msgSend(MEMORY[0x24BE0FA00], "connectionWithEndpoint:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v8;

    v10 = v2->_connection;
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __31__CRSAppHistoryController_init__block_invoke;
    v18 = &unk_24CD38E90;
    v19 = v2;
    v11 = SerialWithQoS;
    v20 = v11;
    -[BSServiceConnection configureConnection:](v10, "configureConnection:", &v15);
    CRSLogForCategory(1uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v2->_connection;
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_212138000, v12, OS_LOG_TYPE_INFO, "Activating connection! %@", buf, 0xCu);
    }

    -[BSServiceConnection activate](v2->_connection, "activate", v15, v16, v17, v18);
  }
  return v2;
}

void __31__CRSAppHistoryController_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BE15210];
  v6 = a2;
  objc_msgSend(v3, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServiceQuality:", v4);

  objc_msgSend(MEMORY[0x24BE15210], "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setInterface:", v5);

  objc_msgSend(v6, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "setActivationHandler:", &__block_literal_global_6);
  objc_msgSend(v6, "setInterruptionHandler:", &__block_literal_global_29);
  objc_msgSend(v6, "setInvalidationHandler:", &__block_literal_global_31);
  objc_msgSend(v6, "setTargetQueue:", *(_QWORD *)(a1 + 40));

}

void __31__CRSAppHistoryController_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CRSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_INFO, "Connection activated! %@", (uint8_t *)&v4, 0xCu);
  }

}

void __31__CRSAppHistoryController_init__block_invoke_28(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CRSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_INFO, "[CRSAppHistoryController] connection interrupted! Reactivating... %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "activate");
}

void __31__CRSAppHistoryController_init__block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  CRSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)fetchDockAppForCategory:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    CRSLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl(&dword_212138000, v7, OS_LOG_TYPE_DEFAULT, "Received request for dock app in category %@.", buf, 0xCu);

    }
    -[CRSAppHistoryController connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteTarget");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__CRSAppHistoryController_fetchDockAppForCategory_completion___block_invoke;
    v12[3] = &unk_24CD38EB8;
    v13 = v6;
    objc_msgSend(v10, "fetchDockAppInCategory:completion:", v11, v12);

  }
}

uint64_t __62__CRSAppHistoryController_fetchDockAppForCategory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchUIContextsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    CRSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Received UI Context fetch.", buf, 2u);
    }

    -[CRSAppHistoryController connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __57__CRSAppHistoryController_fetchUIContextsWithCompletion___block_invoke;
    v8[3] = &unk_24CD38EE0;
    v9 = v4;
    objc_msgSend(v7, "fetchUIContextStatesWithCompletion:", v8);

  }
}

uint64_t __57__CRSAppHistoryController_fetchUIContextsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSessionUIContextsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    CRSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Received session UI Context fetch.", buf, 2u);
    }

    -[CRSAppHistoryController connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__CRSAppHistoryController_fetchSessionUIContextsWithCompletion___block_invoke;
    v8[3] = &unk_24CD38EE0;
    v9 = v4;
    objc_msgSend(v7, "fetchSessionUIContextStatesWithCompletion:", v8);

  }
}

uint64_t __64__CRSAppHistoryController_fetchSessionUIContextsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchSessionEchoContextsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    CRSLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212138000, v5, OS_LOG_TYPE_DEFAULT, "Received session Echo Context fetch.", buf, 2u);
    }

    -[CRSAppHistoryController connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__CRSAppHistoryController_fetchSessionEchoContextsWithCompletion___block_invoke;
    v8[3] = &unk_24CD38EE0;
    v9 = v4;
    objc_msgSend(v7, "fetchSessionEchoContextStatesWithCompletion:", v8);

  }
}

uint64_t __66__CRSAppHistoryController_fetchSessionEchoContextsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addAnalyticsValues:(id)a3 toEvent:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (a5)
  {
    v9 = a5;
    CRSLogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_212138000, v10, OS_LOG_TYPE_DEFAULT, "Sending session analytics payload for event %@ with %@ item(s).", (uint8_t *)&v16, 0x16u);

    }
    -[CRSAppHistoryController connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "remoteTarget");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAnalyticsValues:onEvent:completion:", v8, v15, v9);

  }
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  CRSLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_212138000, v3, OS_LOG_TYPE_INFO, "[CRSAppHistoryController] invalidating connection.", v5, 2u);
  }

  -[CRSAppHistoryController connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
