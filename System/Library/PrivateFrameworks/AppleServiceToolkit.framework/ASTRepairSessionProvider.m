@implementation ASTRepairSessionProvider

- (ASTRepairSessionProvider)initWithServiceName:(id)a3
{
  return -[ASTRepairSessionProvider initWithServiceName:entitlements:](self, "initWithServiceName:entitlements:", a3, 0);
}

- (ASTRepairSessionProvider)initWithServiceName:(id)a3 entitlements:(id)a4
{
  id v6;
  id v7;
  ASTRepairSessionProvider *v8;
  ASTRepairSessionProvider *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASTRepairSessionProvider;
  v8 = -[ASTRepairSessionProvider init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[ASTRepairSessionProvider setServiceName:](v8, "setServiceName:", v6);
    -[ASTRepairSessionProvider setEntitlements:](v9, "setEntitlements:", v7);
  }

  return v9;
}

- (void)setClientConnection:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_clientConnection, a3);
  v5 = a3;
  -[ASTRepairSessionProvider setReceiver:](self, "setReceiver:", v5);

}

- (void)setListenerConnection:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_listenerConnection, a3);
  v5 = a3;
  -[ASTRepairSessionProvider setDelegate:](self, "setDelegate:", v5);

}

- (void)establishConnectionWithCompletionHandler:(id)a3
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *serviceCheckQueue;
  NSObject *v22;
  id v23;
  NSObject *v24;
  dispatch_time_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void (**v30)(id, void *);
  uint8_t v31[16];
  _QWORD block[4];
  id v33;
  uint8_t *v34;
  uint8_t v35[8];
  uint8_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  dispatch_semaphore_t v40;
  _QWORD v41[5];
  id v42;
  id location;
  __int128 buf;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[2];
  _QWORD v50[3];

  v50[1] = *MEMORY[0x24BDAC8D0];
  v30 = (void (**)(id, void *))a3;
  ASTLogHandleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[ASTRepairSessionProvider establishConnectionWithCompletionHandler:]";
    _os_log_impl(&dword_22D91B000, v4, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&buf, 0xCu);
  }

  v5 = objc_alloc(MEMORY[0x24BDD1988]);
  -[ASTRepairSessionProvider serviceName](self, "serviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithMachServiceName:options:", v6, 4096);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DAB068);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v50[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_requestSuiteStart_withCompletionHandler_, 0, 0);

  v12 = (void *)MEMORY[0x24BDBCF20];
  v49[0] = objc_opt_class();
  v49[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v49, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_requestSuitesAvailableWithCompletionHandler_, 0, 1);

  objc_msgSend(v7, "setRemoteObjectInterface:", v8);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DAC788);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v15);
  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(v7, "activate");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__0;
  v47 = __Block_byref_object_dispose__0;
  v48 = 0;
  objc_initWeak(&location, self);
  v16 = MEMORY[0x24BDAC760];
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke;
  v41[3] = &unk_24F969F38;
  v41[4] = &buf;
  objc_copyWeak(&v42, &location);
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", v41);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
  if (v17)
  {
    if (!v18)
    {
      ASTLogHandleForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_22D91B000, v19, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Establishing connection...", v35, 2u);
      }

      v20 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.Diagnostics.ServiceAliveCheckQueue", MEMORY[0x24BDAC9C0]);
      serviceCheckQueue = self->_serviceCheckQueue;
      self->_serviceCheckQueue = v20;

      *(_QWORD *)v35 = 0;
      v36 = v35;
      v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__0;
      v39 = __Block_byref_object_dispose__0;
      v40 = dispatch_semaphore_create(0);
      v22 = self->_serviceCheckQueue;
      block[0] = v16;
      block[1] = 3221225472;
      block[2] = __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke_52;
      block[3] = &unk_24F969F88;
      v23 = v17;
      v33 = v23;
      v34 = v35;
      dispatch_async(v22, block);
      v24 = *((_QWORD *)v36 + 5);
      v25 = dispatch_time(0, 2000000000);
      if (dispatch_semaphore_wait(v24, v25))
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -6000, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30[2](v30, v26);

      }
      else
      {
        ASTLogHandleForCategory(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_22D91B000, v29, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Connection established!", v31, 2u);
        }

        -[ASTRepairSessionProvider setConnection:](self, "setConnection:", v7);
        -[ASTRepairSessionProvider setClientConnection:](self, "setClientConnection:", v23);
        v30[2](v30, 0);
      }

      _Block_object_dispose(v35, 8);
      goto LABEL_18;
    }
LABEL_10:
    ((void (*)(void))v30[2])();
    goto LABEL_18;
  }
  if (v18)
    goto LABEL_10;
  ASTLogHandleForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_22D91B000, v27, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Unknown error while creating connection..", v35, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ASTErrorDomain"), -1, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2](v30, v28);

LABEL_18:
  objc_destroyWeak(&v42);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);

}

void __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "setConnection:", 0);

  }
}

uint64_t __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke_52(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_24F969F60;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v1, "ping:", v3);
}

intptr_t __69__ASTRepairSessionProvider_establishConnectionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider startWithCompletionHandler:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  -[ASTRepairSessionProvider receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startWithCompletionHandler:", v4);

}

- (void)endWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider endWithCompletionHandler:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  -[ASTRepairSessionProvider receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endWithCompletionHandler:", v4);

}

- (void)requestSuitesAvailableWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider requestSuitesAvailableWithCompletionHandler:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  -[ASTRepairSessionProvider receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestSuitesAvailableWithCompletionHandler:", v4);

}

- (void)requestSuiteStart:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ASTRepairSessionProvider requestSuiteStart:withCompletionHandler:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  -[ASTRepairSessionProvider receiver](self, "receiver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestSuiteStart:withCompletionHandler:", v7, v6);

}

- (void)sendTestResult:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ASTRepairSessionProvider sendTestResult:withCompletion:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  -[ASTRepairSessionProvider receiver](self, "receiver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendTestResult:withCompletion:", v7, v6);

}

- (void)requestSuiteResult:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ASTRepairSessionProvider requestSuiteResult:withCompletion:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  -[ASTRepairSessionProvider receiver](self, "receiver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestSuiteResult:withCompletion:", v7, v6);

}

- (void)requestAsset:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ASTRepairSessionProvider requestAsset:withCompletion:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  -[ASTRepairSessionProvider receiver](self, "receiver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestAsset:withCompletion:", v7, v6);

}

- (void)ping:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider ping:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  -[ASTRepairSessionProvider receiver](self, "receiver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ping:", v4);

}

- (void)startListening
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[ASTRepairSessionProvider startListening]";
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v9, 0xCu);
  }

  v4 = objc_alloc(MEMORY[0x24BDD1998]);
  -[ASTRepairSessionProvider serviceName](self, "serviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithMachServiceName:", v5);
  -[ASTRepairSessionProvider setListener:](self, "setListener:", v6);

  -[ASTRepairSessionProvider listener](self, "listener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", self);

  -[ASTRepairSessionProvider listener](self, "listener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resume");

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  void *v15;
  char v16;
  NSObject *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v24;
  _QWORD v25[5];
  id v26;
  id location;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[4];
  id v33;
  _BYTE buf[24];
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v6 = a4;
  ASTLogHandleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[ASTRepairSessionProvider listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", buf, 0xCu);
  }

  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[ASTRepairSessionProvider serviceName](self, "serviceName", v24);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] New connection %@ requested for %@", buf, 0x16u);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[ASTRepairSessionProvider entitlements](self, "entitlements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    v13 = 1;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(v6, "valueForEntitlement:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i), v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v16 = objc_msgSend(v15, "BOOLValue");
        else
          v16 = 0;

        v13 &= v16;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v11);

    if ((v13 & 1) == 0)
    {
      ASTLogHandleForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22D91B000, v17, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Failed entitlements check, invalidating connection", buf, 2u);
      }

      objc_msgSend(v6, "invalidate");
      v18 = 0;
      goto LABEL_27;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DAB068, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "setExportedInterface:", v19);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255DAC788);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v35 = __Block_byref_object_copy__0;
  v36 = __Block_byref_object_dispose__0;
  v37 = 0;
  objc_initWeak(&location, v6);
  objc_msgSend(v6, "setRemoteObjectInterface:", v20);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __63__ASTRepairSessionProvider_listener_shouldAcceptNewConnection___block_invoke;
  v25[3] = &unk_24F969F38;
  v25[4] = buf;
  objc_copyWeak(&v26, &location);
  objc_msgSend(v6, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 && !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    -[ASTRepairSessionProvider setListenerConnection:](self, "setListenerConnection:", v21);
    objc_msgSend(v6, "resume");
    ASTLogHandleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 138412290;
      v33 = v6;
      _os_log_impl(&dword_22D91B000, v22, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Connection %@ established with remote runner service", v32, 0xCu);
    }

    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

LABEL_27:
  return v18;
}

void __63__ASTRepairSessionProvider_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id *v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v5);

  if (WeakRetained)
  {
    ASTLogHandleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained(v5);
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_22D91B000, v7, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] Connection %@ broke with error %@", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)cancelSuite
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ASTLogHandleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ASTRepairSessionProvider cancelSuite]";
    _os_log_impl(&dword_22D91B000, v3, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v5, 0xCu);
  }

  -[ASTRepairSessionProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelSuite");

}

- (void)completeTestSuite:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ASTRepairSessionProvider completeTestSuite:description:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  -[ASTRepairSessionProvider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "completeTestSuite:description:", v7, v6);

}

- (void)estimatedTimeRemainingForTest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ASTRepairSessionProvider estimatedTimeRemainingForTest:completion:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  -[ASTRepairSessionProvider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "estimatedTimeRemainingForTest:completion:", v7, v6);

}

- (void)progressForTest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ASTRepairSessionProvider progressForTest:completion:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  -[ASTRepairSessionProvider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "progressForTest:completion:", v7, v6);

}

- (void)startTest:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ASTRepairSessionProvider startTest:parameters:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  -[ASTRepairSessionProvider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startTest:parameters:", v7, v6);

}

- (void)updateTestSuiteImage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider updateTestSuiteImage:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  -[ASTRepairSessionProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateTestSuiteImage:", v4);

}

- (void)updateTestSuiteProgress:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ASTLogHandleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[ASTRepairSessionProvider updateTestSuiteProgress:]";
    _os_log_impl(&dword_22D91B000, v5, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v7, 0xCu);
  }

  -[ASTRepairSessionProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateTestSuiteProgress:", v4);

}

- (void)showInstructionalPrompt:(id)a3 withConfirmation:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ASTLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[ASTRepairSessionProvider showInstructionalPrompt:withConfirmation:]";
    _os_log_impl(&dword_22D91B000, v8, OS_LOG_TYPE_DEFAULT, "[ASTSessionRepairProvider] %s", (uint8_t *)&v10, 0xCu);
  }

  -[ASTRepairSessionProvider delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "showInstructionalPrompt:withConfirmation:", v7, v6);

}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSArray)entitlements
{
  return self->_entitlements;
}

- (void)setEntitlements:(id)a3
{
  objc_storeStrong((id *)&self->_entitlements, a3);
}

- (ASTRepairProtocol)receiver
{
  return (ASTRepairProtocol *)objc_loadWeakRetained((id *)&self->_receiver);
}

- (void)setReceiver:(id)a3
{
  objc_storeWeak((id *)&self->_receiver, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)serviceCheckQueue
{
  return self->_serviceCheckQueue;
}

- (void)setServiceCheckQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serviceCheckQueue, a3);
}

- (ASTRepairProtocol)clientConnection
{
  return self->_clientConnection;
}

- (ASTRepairDelegateProtocol)listenerConnection
{
  return self->_listenerConnection;
}

- (ASTRepairDelegateProtocol)delegate
{
  return (ASTRepairDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_listenerConnection, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_serviceCheckQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_receiver);
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
