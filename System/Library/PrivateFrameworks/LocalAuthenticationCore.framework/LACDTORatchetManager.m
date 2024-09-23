@implementation LACDTORatchetManager

- (LACDTORatchetManager)initWithContextProvider:(id)a3
{
  id v4;
  LACDTORatchetManager *v5;
  uint64_t v6;
  NSHashTable *observers;
  uint64_t v8;
  LACDarwinNotificationCenter *notificationCenter;
  uint64_t v10;
  LACDTOServiceXPCClient *remoteObjectProxy;
  _QWORD v13[4];
  id v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)LACDTORatchetManager;
  v5 = -[LACDTORatchetManager init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    +[LACDarwinNotificationCenter sharedInstance](LACDarwinNotificationCenter, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    notificationCenter = v5->_notificationCenter;
    v5->_notificationCenter = (LACDarwinNotificationCenter *)v8;

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __48__LACDTORatchetManager_initWithContextProvider___block_invoke;
    v13[3] = &unk_2510C0CB8;
    v14 = v4;
    __48__LACDTORatchetManager_initWithContextProvider___block_invoke((uint64_t)v13);
    v10 = objc_claimAutoreleasedReturnValue();
    remoteObjectProxy = v5->_remoteObjectProxy;
    v5->_remoteObjectProxy = (LACDTOServiceXPCClient *)v10;

  }
  return v5;
}

LACDTOServiceXPCClient *__48__LACDTORatchetManager_initWithContextProvider___block_invoke(uint64_t a1)
{
  LACDTORatchetEndpointProvider *v2;
  LACDTOServiceXPCClient *v3;

  if (objc_opt_class())
  {
    v2 = -[LACDTORatchetEndpointProvider initWithContextProvider:]([LACDTORatchetEndpointProvider alloc], "initWithContextProvider:", *(_QWORD *)(a1 + 32));
    v3 = -[LACDTOServiceXPCClient initWithEndpointProvider:]([LACDTOServiceXPCClient alloc], "initWithEndpointProvider:", v2);

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isFeatureEnabled
{
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  LACLogDTOClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[LACDTORatchetManager isFeatureEnabled]";
    _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled");

  LACLogDTOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5)
      v7 = "YES";
    v9 = 136315138;
    v10 = v7;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "isFeatureEnabled returned %s", (uint8_t *)&v9, 0xCu);
  }

  return v5;
}

- (BOOL)isFeatureSupported
{
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  LACLogDTOClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[LACDTORatchetManager isFeatureSupported]";
    _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &__block_literal_global_7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureSupported");

  LACLogDTOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5)
      v7 = "YES";
    v9 = 136315394;
    v10 = "-[LACDTORatchetManager isFeatureSupported]";
    v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)isFeatureAvailable
{
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  LACLogDTOClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[LACDTORatchetManager isFeatureAvailable]";
    _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &__block_literal_global_8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureAvailable");

  LACLogDTOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5)
      v7 = "YES";
    v9 = 136315394;
    v10 = "-[LACDTORatchetManager isFeatureAvailable]";
    v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)isFeatureStrictModeEnabled
{
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  LACLogDTOClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[LACDTORatchetManager isFeatureStrictModeEnabled]";
    _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &__block_literal_global_9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureStrictModeEnabled");

  LACLogDTOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5)
      v7 = "YES";
    v9 = 136315394;
    v10 = "-[LACDTORatchetManager isFeatureStrictModeEnabled]";
    v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (BOOL)isSensorTrusted
{
  NSObject *v3;
  void *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  LACLogDTOClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[LACDTORatchetManager isSensorTrusted]";
    _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSensorTrusted");

  LACLogDTOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "NO";
    if (v5)
      v7 = "YES";
    v9 = 136315394;
    v10 = "-[LACDTORatchetManager isSensorTrusted]";
    v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %s", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (LACDTORatchetState)ratchetState
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  LACLogDTOClient();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[LACDTORatchetManager ratchetState]";
    _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", &__block_literal_global_11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ratchetState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LACLogDTOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[LACDTORatchetManager ratchetState]";
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%s returned %{public}@", (uint8_t *)&v8, 0x16u);
  }

  return (LACDTORatchetState *)v5;
}

- (void)stateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[LACDTORatchetManager stateWithCompletion:]";
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __44__LACDTORatchetManager_stateWithCompletion___block_invoke;
  v13[3] = &unk_2510C0D20;
  v7 = v4;
  v14 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __44__LACDTORatchetManager_stateWithCompletion___block_invoke_12;
  v10[3] = &unk_2510C0D48;
  objc_copyWeak(&v12, (id *)buf);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "ratchetStateWithCompletion:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __44__LACDTORatchetManager_stateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __44__LACDTORatchetManager_stateWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__LACDTORatchetManager_stateWithCompletion___block_invoke_12(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void (*v10)(void);
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOClient();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __44__LACDTORatchetManager_stateWithCompletion___block_invoke_cold_1();

      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315394;
        v12 = "-[LACDTORatchetManager stateWithCompletion:]_block_invoke";
        v13 = 2114;
        v14 = v5;
        _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "%s finished with state: %{public}@", (uint8_t *)&v11, 0x16u);
      }

      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v10();
  }

}

- (void)stateCompositeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[LACDTORatchetManager stateCompositeWithCompletion:]";
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke;
  v13[3] = &unk_2510C0D20;
  v7 = v4;
  v14 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_14;
  v10[3] = &unk_2510C0D70;
  objc_copyWeak(&v12, (id *)buf);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "ratchetStateCompositeWithCompletion:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void (*v10)(void);
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    LACLogDTOClient();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_cold_1();

      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315394;
        v12 = "-[LACDTORatchetManager stateCompositeWithCompletion:]_block_invoke";
        v13 = 2114;
        v14 = v5;
        _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "%s finished with state: %{public}@", (uint8_t *)&v11, 0x16u);
      }

      v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v10();
  }

}

- (void)checkCanEnableFeatureWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[LACDTORatchetManager checkCanEnableFeatureWithCompletion:]";
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke;
  v12[3] = &unk_2510C0D20;
  v7 = v4;
  v13 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_16;
  v10[3] = &unk_2510C0D98;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "checkCanEnableFeatureWithCompletion:", v10);

}

void __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LACLogDTOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = 136315650;
    v10 = "-[LACDTORatchetManager checkCanEnableFeatureWithCompletion:]_block_invoke";
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_2409DC000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableFeatureWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[LACDTORatchetManager enableFeatureWithReply:]";
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke;
  v12[3] = &unk_2510C0D20;
  v7 = v4;
  v13 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_18;
  v10[3] = &unk_2510C0D98;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "enableFeatureWithCompletion:", v10);

}

void __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LACLogDTOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = 136315650;
    v10 = "-[LACDTORatchetManager enableFeatureWithReply:]_block_invoke";
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_2409DC000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableFeatureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  LACLogDTOClient();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[LACDTORatchetManager disableFeatureWithContext:completion:]";
    _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke;
  v16[3] = &unk_2510C0D20;
  v10 = v6;
  v17 = v10;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_19;
  v14[3] = &unk_2510C0D20;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "disableFeatureWithContext:completion:", v12, v14);

}

void __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[LACDTORatchetManager disableFeatureWithContext:completion:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_2409DC000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enableFeatureStrictModeWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[LACDTORatchetManager enableFeatureStrictModeWithCompletion:]";
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke;
  v12[3] = &unk_2510C0D20;
  v7 = v4;
  v13 = v7;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_20;
  v10[3] = &unk_2510C0D20;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "enableFeatureStrictModeWithCompletion:", v10);

}

void __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[LACDTORatchetManager enableFeatureStrictModeWithCompletion:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_2409DC000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)disableFeatureStrictModeWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  LACLogDTOClient();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[LACDTORatchetManager disableFeatureStrictModeWithContext:completion:]";
    _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke;
  v16[3] = &unk_2510C0D20;
  v10 = v6;
  v17 = v10;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_21;
  v14[3] = &unk_2510C0D20;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v11, "disableFeatureStrictModeWithContext:completion:", v12, v14);

}

void __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[LACDTORatchetManager disableFeatureStrictModeWithContext:completion:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_2409DC000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[LACDTORatchetManager addObserver:]";
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  if (!-[LACDarwinNotificationCenter hasObserver:](self->_notificationCenter, "hasObserver:", self))
    -[LACDarwinNotificationCenter addObserver:notification:](self->_notificationCenter, "addObserver:notification:", self, CFSTR("com.apple.LocalAuthentication.ratchet.StateDidChange"));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LACLogDTOClient();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[LACDTORatchetManager removeObserver:]";
    _os_log_impl(&dword_2409DC000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
  if (!-[NSHashTable count](self->_observers, "count"))
    -[LACDarwinNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:", self);
}

- (void)reset
{
  -[NSHashTable removeAllObjects](self->_observers, "removeAllObjects");
  -[LACDarwinNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:", self);
}

- (void)performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  LACLogDTOClient();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[LACDTORatchetManager performArmRequestWithIdentifier:context:options:completion:]";
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v10;
    v24 = 2114;
    v25 = v12;
    _os_log_impl(&dword_2409DC000, v14, OS_LOG_TYPE_DEFAULT, "%s context:%{public}@ identifier:%{public}@ options:%{public}@", buf, 0x2Au);
  }

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__LACDTORatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke;
  v16[3] = &unk_2510C0D98;
  v17 = v13;
  v15 = v13;
  -[LACDTORatchetManager _performArmRequestWithIdentifier:context:options:completion:](self, "_performArmRequestWithIdentifier:context:options:completion:", v10, v11, v12, v16);

}

void __83__LACDTORatchetManager_performArmRequestWithIdentifier_context_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LACLogDTOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = 136315650;
    v10 = "-[LACDTORatchetManager performArmRequestWithIdentifier:context:options:completion:]_block_invoke";
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_2409DC000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stateInContext:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  LACLogDTOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[LACDTORatchetManager stateInContext:completion:]";
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__LACDTORatchetManager_stateInContext_completion___block_invoke;
  v8[3] = &unk_2510C0DC0;
  v9 = v5;
  v7 = v5;
  -[LACDTORatchetManager stateWithCompletion:](self, "stateWithCompletion:", v8);

}

void __50__LACDTORatchetManager_stateInContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LACLogDTOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = 136315650;
    v10 = "-[LACDTORatchetManager stateInContext:completion:]_block_invoke";
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_2409DC000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stateCompositeInContext:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  LACLogDTOClient();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v11 = "-[LACDTORatchetManager stateCompositeInContext:completion:]";
    _os_log_impl(&dword_2409DC000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__LACDTORatchetManager_stateCompositeInContext_completion___block_invoke;
  v8[3] = &unk_2510C0DE8;
  v9 = v5;
  v7 = v5;
  -[LACDTORatchetManager stateCompositeWithCompletion:](self, "stateCompositeWithCompletion:", v8);

}

void __59__LACDTORatchetManager_stateCompositeInContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LACLogDTOClient();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 16 * (v6 != 0);
  if (os_log_type_enabled(v7, v8))
  {
    v9 = 136315650;
    v10 = "-[LACDTORatchetManager stateCompositeInContext:completion:]_block_invoke";
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl(&dword_2409DC000, v7, v8, "%s finished with result: %{public}@, error: %{public}@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelArmRequestWithIdentifier:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
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
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LACLogDTOClient();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[LACDTORatchetManager cancelArmRequestWithIdentifier:reason:completion:]";
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_2409DC000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier:%{public}@, reason:%{public}@", buf, 0x20u);
  }

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke;
  v18[3] = &unk_2510C0D20;
  v13 = v10;
  v19 = v13;
  -[LACDTORatchetManager _remoteObjectProxyWithErrorHandler:](self, "_remoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_22;
  v16[3] = &unk_2510C0D20;
  v17 = v13;
  v15 = v13;
  objc_msgSend(v14, "cancelPendingEvaluationWithRatchetIdentifier:reason:completion:", v8, v9, v16);

}

void __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LACLogDTOClient();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 16 * (v3 != 0);
  if (os_log_type_enabled(v4, v5))
  {
    v6 = 136315394;
    v7 = "-[LACDTORatchetManager cancelArmRequestWithIdentifier:reason:completion:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    _os_log_impl(&dword_2409DC000, v4, v5, "%s finished with error: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performArmRequestWithIdentifier:(id)a3 context:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  v14 = -[LACDTORatchetManager _armPolicy](self, "_armPolicy");
  v15 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke;
  v25[3] = &unk_2510C0E10;
  v16 = v12;
  v26 = v16;
  v17 = v10;
  v27 = v17;
  __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke((uint64_t)v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_2;
  v21[3] = &unk_2510C0E60;
  objc_copyWeak(&v24, &location);
  v19 = v11;
  v22 = v19;
  v20 = v13;
  v23 = v20;
  objc_msgSend(v19, "evaluateCorePolicy:options:reply:", v14, v18, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

id __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v5 = v4;

  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1066);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v7);

  return v5;
}

void __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v8 = a1[4];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_3;
    v9[3] = &unk_2510C0E38;
    objc_copyWeak(&v14, a1 + 6);
    v13 = a1[5];
    v10 = v6;
    v11 = a1[4];
    v12 = v5;
    objc_msgSend(WeakRetained, "stateCompositeInContext:completion:", v8, v9);

    objc_destroyWeak(&v14);
  }

}

void __84__LACDTORatchetManager__performArmRequestWithIdentifier_context_options_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  _QWORD v38[6];

  v38[5] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      v8 = *(void **)(a1 + 32);
      if (v8)
      {
        objc_msgSend(v8, "userInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");
        v11 = v10;
        if (v10)
          v12 = v10;
        else
          v12 = (id)objc_opt_new();
        v26 = v12;

        objc_msgSend(v5, "ratchetState");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, CFSTR("RatchetState"));

        objc_msgSend(v26, "setObject:forKeyedSubscript:", v5, CFSTR("RatchetStateComposite"));
        v28 = objc_alloc(MEMORY[0x24BDD1540]);
        objc_msgSend(*(id *)(a1 + 32), "domain");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v28, "initWithDomain:code:userInfo:", v29, objc_msgSend(*(id *)(a1 + 32), "code"), v26);

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      else
      {
        v33 = *(_QWORD *)(a1 + 56);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 21);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = v36;
        v38[0] = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 22);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v37[1] = v35;
        objc_msgSend(v5, "ratchetState");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v34;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 23);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v37[2] = v32;
        v38[2] = v5;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v37[3] = v31;
        v13 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = MEMORY[0x24BDBD1C0];
        if (v15)
          v18 = v15;
        else
          v18 = MEMORY[0x24BDBD1C0];
        v38[3] = v18;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v37[4] = v19;
        v20 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v21);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v22)
          v24 = v22;
        else
          v24 = v17;
        v38[4] = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD))(v33 + 16))(v33, v25, 0);

      }
    }
  }

}

- (int64_t)_armPolicy
{
  return 1026;
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_notificationCenter == a3
    && LACDarwinNotificationsEqual(a4, CFSTR("com.apple.LocalAuthentication.ratchet.StateDidChange")))
  {
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke;
    v5[3] = &unk_2510C0EB0;
    objc_copyWeak(&v6, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke_2;
    v3[3] = &unk_2510C0E88;
    objc_copyWeak(&v4, v1);
    objc_msgSend(WeakRetained, "stateWithCompletion:", v3);
    objc_destroyWeak(&v4);
  }

}

void __66__LACDTORatchetManager_notificationCenter_didReceiveNotification___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id *WeakRetained;
  id *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (!a3 && WeakRetained)
  {
    LACLogDTOClient();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v7[1], "count");
      *(_DWORD *)buf = 67109378;
      v21 = v9;
      v22 = 2114;
      v23 = v5;
      _os_log_impl(&dword_2409DC000, v8, OS_LOG_TYPE_DEFAULT, "Will notify %d observers about new state: %{public}@", buf, 0x12u);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = v7[1];
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "ratchetStateDidChange:", v5, (_QWORD)v15);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  LACDTOServiceXPCClient *remoteObjectProxy;
  LACDTOServiceXPCClient *v4;
  id v6;
  void *v7;

  remoteObjectProxy = self->_remoteObjectProxy;
  if (remoteObjectProxy)
  {
    v4 = remoteObjectProxy;
  }
  else
  {
    v6 = a3;
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, CFSTR("Platform not supported"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))a3 + 2))(v6, v7);

  }
  return remoteObjectProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __44__LACDTORatchetManager_stateWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2409DC000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __53__LACDTORatchetManager_stateCompositeWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2409DC000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __60__LACDTORatchetManager_checkCanEnableFeatureWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2409DC000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __47__LACDTORatchetManager_enableFeatureWithReply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2409DC000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __61__LACDTORatchetManager_disableFeatureWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2409DC000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __62__LACDTORatchetManager_enableFeatureStrictModeWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2409DC000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __71__LACDTORatchetManager_disableFeatureStrictModeWithContext_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2409DC000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __73__LACDTORatchetManager_cancelArmRequestWithIdentifier_reason_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2409DC000, v0, v1, "%s finished with error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
