@implementation CRSUIClusterThemeManager

- (CRSUIClusterThemeManager)init
{
  CRSUIClusterThemeManager *v2;
  CRSUIClusterThemeManager *v3;
  uint64_t v4;
  NSUUID *identifier;
  void *v6;
  uint64_t v7;
  OS_dispatch_queue *connectionQueue;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BSServiceConnection *connection;
  BSServiceConnection *v15;
  NSObject *v16;
  BSServiceConnection *v17;
  _QWORD v19[4];
  CRSUIClusterThemeManager *v20;
  id v21;
  id location;
  objc_super v23;
  uint8_t buf[4];
  BSServiceConnection *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v23.receiver = self;
  v23.super_class = (Class)CRSUIClusterThemeManager;
  v2 = -[CRSUIClusterThemeManager init](&v23, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = objc_claimAutoreleasedReturnValue();
    identifier = v3->_identifier;
    v3->_identifier = (NSUUID *)v4;

    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = BSDispatchQueueCreate();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)MEMORY[0x24BE383B8];
    +[CRSUIClusterThemeSpecification identifier](CRSUIClusterThemeSpecification, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSUUID UUIDString](v3->_identifier, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endpointForMachName:service:instance:", CFSTR("com.apple.CarPlayApp.cluster-theme-service"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE383B0], "connectionWithEndpoint:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    connection = v3->_connection;
    v3->_connection = (BSServiceConnection *)v13;

    objc_initWeak(&location, v3);
    v15 = v3->_connection;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __32__CRSUIClusterThemeManager_init__block_invoke;
    v19[3] = &unk_24C769848;
    v20 = v3;
    objc_copyWeak(&v21, &location);
    -[BSServiceConnection configureConnection:](v15, "configureConnection:", v19);
    CRSUILogForCategory(6uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v3->_connection;
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_20D6CC000, v16, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    -[BSServiceConnection activate](v3->_connection, "activate");
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __32__CRSUIClusterThemeManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  +[CRSUIClusterThemeSpecification serviceQuality](CRSUIClusterThemeSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSUIClusterThemeSpecification interface](CRSUIClusterThemeSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __32__CRSUIClusterThemeManager_init__block_invoke_2;
  v8[3] = &unk_24C769820;
  a1 += 40;
  objc_copyWeak(&v9, (id *)a1);
  objc_msgSend(v3, "setActivationHandler:", v8);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_6);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_24);
  WeakRetained = objc_loadWeakRetained((id *)a1);
  objc_msgSend(WeakRetained, "connectionQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v7);

  objc_destroyWeak(&v9);
}

void __32__CRSUIClusterThemeManager_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  CRSUILogForCategory(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleConnectionActivated");

}

void __32__CRSUIClusterThemeManager_init__block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CRSUILogForCategory(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __32__CRSUIClusterThemeManager_init__block_invoke_22_cold_1();

}

void __32__CRSUIClusterThemeManager_init__block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  CRSUILogForCategory(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __32__CRSUIClusterThemeManager_init__block_invoke_23_cold_1();

}

- (NSArray)displays
{
  os_unfair_lock_s *p_lock;
  NSArray *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_displays;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSSecurityScopedURLWrapper)extraAssetsURL
{
  os_unfair_lock_s *p_lock;
  NSSecurityScopedURLWrapper *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_extraAssetsURL;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setThemeData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated && !self->_lock_invalidated)
  {
    -[CRSUIClusterThemeManager _setThemeData:completion:](self, "_setThemeData:completion:", v6, v7);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__CRSUIClusterThemeManager_setThemeData_completion___block_invoke;
    block[3] = &unk_24C769AA8;
    v9 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __52__CRSUIClusterThemeManager_setThemeData_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_connectionActivated && !self->_lock_invalidated)
  {
    -[CRSUIClusterThemeManager _getURLForAssetWithIdentifier:displayID:completion:](self, "_getURLForAssetWithIdentifier:displayID:completion:", v8, v9, v10);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __78__CRSUIClusterThemeManager_getURLForAssetWithIdentifier_displayID_completion___block_invoke;
    block[3] = &unk_24C769AA8;
    v12 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  os_unfair_lock_unlock(&self->_lock);

}

uint64_t __78__CRSUIClusterThemeManager_getURLForAssetWithIdentifier_displayID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_invalidated)
  {
    CRSUILogForCategory(6uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      -[CRSUIClusterThemeManager connection](self, "connection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection! %@", (uint8_t *)&v7, 0xCu);

    }
    -[CRSUIClusterThemeManager connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    *(_WORD *)&self->_lock_connectionActivated = 256;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)updateExtraAssetsURL:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CRSUILogForCategory(6uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl(&dword_20D6CC000, v6, OS_LOG_TYPE_DEFAULT, "manager extraAssetsURL=%@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_extraAssetsURL, a3);
  os_unfair_lock_unlock(&self->_lock);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__CRSUIClusterThemeManager_updateExtraAssetsURL___block_invoke;
  v8[3] = &unk_24C7699F8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __49__CRSUIClusterThemeManager_updateExtraAssetsURL___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clusterThemeManager:didUpdateExtraAssetsURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

- (void)_handleConnectionActivated
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  BSDispatchQueueAssert();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_connectionActivated = 1;
  CRSUILogForCategory(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_20D6CC000, v4, OS_LOG_TYPE_DEFAULT, "Requesting cluster layouts", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[CRSUIClusterThemeManager connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__CRSUIClusterThemeManager__handleConnectionActivated__block_invoke;
  v7[3] = &unk_24C769AD0;
  objc_copyWeak(&v8, buf);
  objc_msgSend(v6, "getClusterThemeLayoutData:", v7);
  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v8);

  objc_destroyWeak(buf);
}

void __54__CRSUIClusterThemeManager__handleConnectionActivated__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_processThemeLayoutData:error:", v6, v5);

}

- (void)_processThemeLayoutData:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSArray *displays;
  NSDictionary *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  NSObject *v13;
  NSDictionary *themeData;
  NSDictionary *v15;
  id v16;
  id v17;
  void *v18;
  _QWORD block[5];
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  displays = self->_displays;
  v18 = v7;
  if (v6)
  {
    objc_msgSend(v6, "themeData");
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displays");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extraAssetsURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "assetVersion");
    CRSUILogForCategory(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v24 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_20D6CC000, v13, OS_LOG_TYPE_INFO, "Received %d displays", buf, 8u);
    }
  }
  else
  {
    CRSUILogForCategory(6uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CRSUIClusterThemeManager _processThemeLayoutData:error:].cold.1();
    v11 = 0;
    v12 = 0;
    v9 = (NSDictionary *)MEMORY[0x24BDBD1B8];
    v10 = (void *)MEMORY[0x24BDBD1A8];
  }

  os_unfair_lock_lock(&self->_lock);
  themeData = self->_themeData;
  self->_themeData = v9;
  v15 = v9;

  objc_storeStrong((id *)&self->_displays, v10);
  objc_storeStrong((id *)&self->_extraAssetsURL, v11);
  self->_assetVersion = v12;
  os_unfair_lock_unlock(&self->_lock);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CRSUIClusterThemeManager__processThemeLayoutData_error___block_invoke;
  block[3] = &unk_24C769AF8;
  block[4] = self;
  v20 = v11;
  v22 = displays != 0;
  v21 = v10;
  v16 = v10;
  v17 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__CRSUIClusterThemeManager__processThemeLayoutData_error___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clusterThemeManagerDidFinishLoading:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clusterThemeManager:didUpdateExtraAssetsURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  if (!*(_BYTE *)(a1 + 56) && *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "dataProviderDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "dataProviderDelegate");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataProviderIsReady:", *(_QWORD *)(a1 + 32));

    }
  }
}

- (void)_setThemeData:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _CRSUIClusterThemeData *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  CRSUILogForCategory(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    _os_log_impl(&dword_20D6CC000, v8, OS_LOG_TYPE_DEFAULT, "Setting theme data: %@", buf, 0xCu);
  }

  v9 = -[_CRSUIClusterThemeData initWithThemeData:]([_CRSUIClusterThemeData alloc], "initWithThemeData:", v6);
  -[CRSUIClusterThemeManager connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke;
  v13[3] = &unk_24C769898;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v11, "setThemeData:reply:", v9, v13);

}

void __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  uint8_t buf[16];

  v3 = a2;
  CRSUILogForCategory(6uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6CC000, v5, OS_LOG_TYPE_DEFAULT, "Successfully set theme data", buf, 2u);
  }

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke_35;
  v6[3] = &unk_24C769B20;
  v7 = *(id *)(a1 + 32);
  v8 = v3 == 0;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)_getURLForAssetWithIdentifier:(id)a3 displayID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CRSUIClusterThemeManager connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "remoteTarget");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke;
  v16[3] = &unk_24C769B70;
  v17 = v9;
  v18 = v8;
  v19 = v10;
  v13 = v10;
  v14 = v8;
  v15 = v9;
  objc_msgSend(v12, "getURLForAssetWithIdentifier:displayID:reply:", v14, v15, v16);

}

void __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    CRSUILogForCategory(6uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke_37;
  v10[3] = &unk_24C769B48;
  v8 = *(id *)(a1 + 48);
  v11 = v5;
  v12 = v8;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)isReady
{
  return self->_displays != 0;
}

- (unint64_t)version
{
  return self->_assetVersion;
}

- (id)displayID
{
  return 0;
}

- (id)wallpapers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CRSUIAssetWallpaper *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  CRSUIAssetWallpaper *v18;
  void *v19;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[CRSUIClusterThemeManager displays](self, "displays");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v23)
  {
    v22 = *(_QWORD *)v41;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(obj);
        v24 = v3;
        v4 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v3);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v31 = v4;
        objc_msgSend(v4, "layouts");
        v25 = (id)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v27)
        {
          v26 = *(_QWORD *)v37;
          do
          {
            v5 = 0;
            do
            {
              if (*(_QWORD *)v37 != v26)
                objc_enumerationMutation(v25);
              v28 = v5;
              v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v5);
              v32 = 0u;
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              objc_msgSend(v6, "wallpapers");
              v29 = (id)objc_claimAutoreleasedReturnValue();
              v7 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
              if (v7)
              {
                v8 = v7;
                v9 = *(_QWORD *)v33;
                do
                {
                  v10 = 0;
                  do
                  {
                    if (*(_QWORD *)v33 != v9)
                      objc_enumerationMutation(v29);
                    v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v10);
                    v12 = [CRSUIAssetWallpaper alloc];
                    objc_msgSend(v11, "identifier");
                    v13 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "identifier");
                    v14 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "identifier");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "cacheID");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v11, "traits");
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    v18 = -[CRSUIAssetWallpaper initWithIdentifier:displayID:layoutID:cacheID:traits:](v12, "initWithIdentifier:displayID:layoutID:cacheID:traits:", v13, v14, v15, v16, v17);
                    objc_msgSend(v30, "addObject:", v18);

                    ++v10;
                  }
                  while (v8 != v10);
                  v8 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v32, v44, 16);
                }
                while (v8);
              }

              v5 = v28 + 1;
            }
            while (v28 + 1 != v27);
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v27);
        }

        v3 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v23);
  }

  v19 = (void *)objc_msgSend(v30, "copy");
  return v19;
}

- (id)defaultWallpapers
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  CRSUIAssetWallpaper *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CRSUIAssetWallpaper *v19;
  void *v20;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v30 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[CRSUIClusterThemeManager displays](self, "displays");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v42;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v42 != v23)
          objc_enumerationMutation(obj);
        v25 = v3;
        v4 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v3);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v31 = v4;
        objc_msgSend(v4, "layouts");
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v28)
        {
          v27 = *(_QWORD *)v38;
          do
          {
            v5 = 0;
            do
            {
              if (*(_QWORD *)v38 != v27)
                objc_enumerationMutation(v26);
              v29 = v5;
              v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v5);
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              v32 = v6;
              objc_msgSend(v6, "wallpapers");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
              if (v8)
              {
                v9 = v8;
                v10 = *(_QWORD *)v34;
                do
                {
                  for (i = 0; i != v9; ++i)
                  {
                    if (*(_QWORD *)v34 != v10)
                      objc_enumerationMutation(v7);
                    v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                    if (objc_msgSend(v12, "isDefault"))
                    {
                      v13 = [CRSUIAssetWallpaper alloc];
                      objc_msgSend(v12, "identifier");
                      v14 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "identifier");
                      v15 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "identifier");
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "cacheID");
                      v17 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "traits");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      v19 = -[CRSUIAssetWallpaper initWithIdentifier:displayID:layoutID:cacheID:traits:](v13, "initWithIdentifier:displayID:layoutID:cacheID:traits:", v14, v15, v16, v17, v18);
                      objc_msgSend(v30, "addObject:", v19);

                    }
                  }
                  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
                }
                while (v9);
              }

              v5 = v29 + 1;
            }
            while (v29 + 1 != v28);
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
          }
          while (v28);
        }

        v3 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v24);
  }

  v20 = (void *)objc_msgSend(v30, "copy");
  return v20;
}

- (id)dynamicAppearanceWallpapersForVehicle:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  id v27;
  CRSUIClusterThemeManager *v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "displayThemeData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = self;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[CRSUIClusterThemeManager displays](self, "displays");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v32;
      *(_QWORD *)&v7 = 138412546;
      v26 = v7;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
          objc_msgSend(v11, "identifier", v26);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKey:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v11, "layouts");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v29[0] = MEMORY[0x24BDAC760];
            v29[1] = 3221225472;
            v29[2] = __66__CRSUIClusterThemeManager_dynamicAppearanceWallpapersForVehicle___block_invoke;
            v29[3] = &unk_24C769B98;
            v30 = v13;
            objc_msgSend(v14, "bs_firstObjectPassingTest:", v29);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v15, "wallpapers");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "bs_firstObjectPassingTest:", &__block_literal_global_43);
              v17 = objc_claimAutoreleasedReturnValue();

              if (v17
                || (objc_msgSend(v15, "wallpapers"),
                    v18 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v18, "bs_firstObjectPassingTest:", &__block_literal_global_44),
                    v17 = objc_claimAutoreleasedReturnValue(),
                    v18,
                    v17))
              {
                -[NSObject data](v17, "data");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                -[CRSUIClusterThemeManager loadWallpaperFromData:](v28, "loadWallpaperFromData:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                if (v20)
                  objc_msgSend(v27, "addObject:", v20);

              }
              else
              {
                CRSUILogForCategory(6uLL);
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v11, "identifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "displayName");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v26;
                  v36 = v21;
                  v37 = 2112;
                  v38 = v22;
                  _os_log_impl(&dword_20D6CC000, v17, OS_LOG_TYPE_DEFAULT, "No wallpaper supports dynamic appearance for %@:%@", buf, 0x16u);

                }
              }

            }
          }

          ++v10;
        }
        while (v8 != v10);
        v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        v8 = v23;
      }
      while (v23);
    }

    v24 = (void *)objc_msgSend(v27, "copy");
  }
  else
  {
    v24 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v24;
}

uint64_t __66__CRSUIClusterThemeManager_dynamicAppearanceWallpapersForVehicle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentLayoutID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __66__CRSUIClusterThemeManager_dynamicAppearanceWallpapersForVehicle___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  if (objc_msgSend(v2, "isDefault"))
  {
    objc_msgSend(v2, "traits");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "supportsDynamicAppearance");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __66__CRSUIClusterThemeManager_dynamicAppearanceWallpapersForVehicle___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "traits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsDynamicAppearance");

  return v3;
}

- (id)loadWallpaperFromData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CRSUIAssetWallpaper *v19;
  void *v21;
  CRSUIAssetWallpaper *v22;
  _QWORD v23[4];
  NSObject *v24;
  _QWORD v25[4];
  NSObject *v26;
  _QWORD v27[4];
  NSObject *v28;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CRSUIClusterThemeManager displays](self, "displays");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke;
    v27[3] = &unk_24C769C00;
    v8 = v5;
    v28 = v8;
    objc_msgSend(v6, "bs_firstObjectPassingTest:", v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "layouts");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v7;
      v25[1] = 3221225472;
      v25[2] = __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke_2;
      v25[3] = &unk_24C769B98;
      v11 = v8;
      v26 = v11;
      objc_msgSend(v10, "bs_firstObjectPassingTest:", v25);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v12, "wallpapers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v7;
        v23[1] = 3221225472;
        v23[2] = __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke_3;
        v23[3] = &unk_24C769C28;
        v24 = v11;
        objc_msgSend(v13, "bs_firstObjectPassingTest:", v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v22 = [CRSUIAssetWallpaper alloc];
          objc_msgSend(v14, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "cacheID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "traits");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[CRSUIAssetWallpaper initWithIdentifier:displayID:layoutID:cacheID:traits:](v22, "initWithIdentifier:displayID:layoutID:cacheID:traits:", v21, v15, v16, v17, v18);

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {

    CRSUILogForCategory(6uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[CRSUIClusterThemeManager loadWallpaperFromData:].cold.1((uint64_t)v5, v8);
    v19 = 0;
  }

  return v19;
}

uint64_t __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "layoutID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __50__CRSUIClusterThemeManager_loadWallpaperFromData___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "wallpaperID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)resolveWallpaper:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  id v28;
  id v29;
  CRSUIResolvedWallpaper *v30;
  void *v31;
  CRSUIResolvedWallpaper *v32;
  CRSUIResolvedWallpaper *v33;
  void *v34;
  CRSUIResolvedWallpaper *v35;
  CRSUIResolvedWallpaper *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  int v48;
  CRSUIStatefulCAPackage *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id obj;
  id obja;
  id v68;
  _QWORD v69[4];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "data");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (v6)
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    -[CRSUIClusterThemeManager displays](self, "displays");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    if (v58)
    {
      v8 = *(_QWORD *)v80;
      v61 = v4;
      v62 = v7;
      v57 = *(_QWORD *)v80;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v80 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v9);
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          v59 = v9;
          v60 = v10;
          objc_msgSend(v10, "layouts");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v76;
            v64 = *(_QWORD *)v76;
            do
            {
              v14 = 0;
              v65 = v12;
              do
              {
                if (*(_QWORD *)v76 != v13)
                  objc_enumerationMutation(obj);
                v15 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v14);
                objc_msgSend(v15, "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "layoutID");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v16, "isEqualToString:", v17);

                if (!v18)
                  goto LABEL_27;
                v73 = 0u;
                v74 = 0u;
                v71 = 0u;
                v72 = 0u;
                objc_msgSend(v15, "wallpapers");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
                if (!v20)
                  goto LABEL_25;
                v21 = v20;
                v22 = *(_QWORD *)v72;
                while (2)
                {
                  for (i = 0; i != v21; ++i)
                  {
                    if (*(_QWORD *)v72 != v22)
                      objc_enumerationMutation(v19);
                    v24 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
                    objc_msgSend(v24, "identifier");
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "wallpaperID");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    v27 = objc_msgSend(v25, "isEqualToString:", v26);

                    if ((v27 & 1) != 0)
                    {
                      v28 = v24;

                      v13 = v64;
                      v12 = v65;
                      if (!v28)
                        goto LABEL_27;

                      v29 = v60;
                      if (!v29)
                        goto LABEL_42;
                      objc_msgSend(v28, "color");
                      v31 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v31)
                      {
                        v32 = [CRSUIResolvedWallpaper alloc];
                        objc_msgSend(v28, "color");
                        v7 = (void *)objc_claimAutoreleasedReturnValue();
                        v33 = v32;
                        v4 = v61;
                        v30 = -[CRSUIResolvedWallpaper initWithWallpaperInformation:color:](v33, "initWithWallpaperInformation:color:", v61, v7);
                        goto LABEL_49;
                      }
                      objc_msgSend(v28, "image");
                      v34 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v34)
                      {
                        v35 = [CRSUIResolvedWallpaper alloc];
                        v69[0] = MEMORY[0x24BDAC760];
                        v69[1] = 3221225472;
                        v69[2] = __45__CRSUIClusterThemeManager_resolveWallpaper___block_invoke;
                        v69[3] = &unk_24C769C50;
                        v28 = v28;
                        v70 = v28;
                        v36 = v35;
                        v4 = v61;
                        v30 = -[CRSUIResolvedWallpaper initWithWallpaperInformation:imageResolver:](v36, "initWithWallpaperInformation:imageResolver:", v61, v69);
                        v7 = v70;
                        goto LABEL_49;
                      }
                      objc_msgSend(v28, "package");
                      v37 = (void *)objc_claimAutoreleasedReturnValue();

                      if (!v37)
                      {
LABEL_42:
                        v30 = 0;
                        v4 = v61;
                        goto LABEL_50;
                      }
                      v38 = (void *)MEMORY[0x24BDE5718];
                      objc_msgSend(v28, "package");
                      obja = (id)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(obja, "asset");
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v39, "url");
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "url");
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "package");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v42, "asset");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v43, "packageType");
                      v44 = (void *)objc_claimAutoreleasedReturnValue();
                      v68 = 0;
                      objc_msgSend(v38, "packageWithContentsOfURL:type:options:error:", v41, v44, 0, &v68);
                      v45 = objc_claimAutoreleasedReturnValue();
                      v63 = v68;

                      v46 = (void *)v45;
                      if (v45)
                      {
                        objc_msgSend(v28, "traits");
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        v48 = objc_msgSend(v47, "supportsDynamicAppearance");

                        v49 = [CRSUIStatefulCAPackage alloc];
                        objc_msgSend(v28, "package");
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        v51 = v50;
                        if (v48)
                        {
                          objc_msgSend(v50, "stateForInterfaceStyle:", 1);
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v28, "package");
                          v53 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v53, "stateForInterfaceStyle:", 2);
                          v54 = (void *)objc_claimAutoreleasedReturnValue();
                          v55 = -[CRSUIStatefulCAPackage initWithPackage:lightModeState:darkModeState:](v49, "initWithPackage:lightModeState:darkModeState:", v46, v52, v54);

                        }
                        else
                        {
                          objc_msgSend(v50, "stateForInterfaceStyle:", 0);
                          v52 = (void *)objc_claimAutoreleasedReturnValue();
                          v55 = -[CRSUIStatefulCAPackage initWithPackage:state:](v49, "initWithPackage:state:", v46, v52);
                        }
                        v4 = v61;

                        v30 = -[CRSUIResolvedWallpaper initWithWallpaperInformation:statefulPackage:]([CRSUIResolvedWallpaper alloc], "initWithWallpaperInformation:statefulPackage:", v61, v55);
LABEL_47:
                        v7 = v63;
                      }
                      else
                      {
                        CRSUILogForCategory(6uLL);
                        v55 = objc_claimAutoreleasedReturnValue();
                        if (!os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                        {
                          v30 = 0;
                          v4 = v61;
                          goto LABEL_47;
                        }
                        v7 = v63;
                        -[CRSUIClusterThemeManager resolveWallpaper:].cold.1(v28, (uint64_t)v63, v55);
                        v30 = 0;
                        v4 = v61;
                      }

                      goto LABEL_49;
                    }
                  }
                  v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
                  if (v21)
                    continue;
                  break;
                }
LABEL_25:

                v13 = v64;
                v12 = v65;
LABEL_27:
                ++v14;
              }
              while (v14 != v12);
              v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
            }
            while (v12);
          }

          v9 = v59 + 1;
          v4 = v61;
          v7 = v62;
          v8 = v57;
        }
        while (v59 + 1 != v58);
        v58 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
      }
      while (v58);
    }
    v29 = 0;
    v28 = 0;
    v30 = 0;
LABEL_49:

LABEL_50:
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

id __45__CRSUIClusterThemeManager_resolveWallpaper___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "userInterfaceStyle");

  objc_msgSend(v4, "assetForInterfaceStyle:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend(v6, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithContentsOfURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CRSUILogForCategory(6uLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __45__CRSUIClusterThemeManager_resolveWallpaper___block_invoke_cold_1(v6, v12);

    v11 = 0;
  }

  return v11;
}

- (CRSUIWallpaperDataProvidingDelegate)dataProviderDelegate
{
  return (CRSUIWallpaperDataProvidingDelegate *)objc_loadWeakRetained((id *)&self->_dataProviderDelegate);
}

- (void)setDataProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dataProviderDelegate, a3);
}

- (CRSUIClusterThemeManagerDelegate)delegate
{
  return (CRSUIClusterThemeManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSDictionary)themeData
{
  return self->_themeData;
}

- (void)setThemeData:(id)a3
{
  objc_storeStrong((id *)&self->_themeData, a3);
}

- (void)setDisplays:(id)a3
{
  objc_storeStrong((id *)&self->_displays, a3);
}

- (void)setExtraAssetsURL:(id)a3
{
  objc_storeStrong((id *)&self->_extraAssetsURL, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(unint64_t)a3
{
  self->_assetVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_extraAssetsURL, 0);
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->_themeData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataProviderDelegate);
}

void __32__CRSUIClusterThemeManager_init__block_invoke_22_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_20D6CC000, v0, v1, "Connection interrupted! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __32__CRSUIClusterThemeManager_init__block_invoke_23_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_20D6CC000, v0, v1, "Connection invalidated! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_processThemeLayoutData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_20D6CC000, v0, v1, "Error retrieving cluster layouts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __53__CRSUIClusterThemeManager__setThemeData_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_0(&dword_20D6CC000, v0, v1, "Error setting theme data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __79__CRSUIClusterThemeManager__getURLForAssetWithIdentifier_displayID_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_error_impl(&dword_20D6CC000, log, OS_LOG_TYPE_ERROR, "Error getting url of %@:%@: %@", (uint8_t *)&v5, 0x20u);
}

- (void)loadWallpaperFromData:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  _os_log_fault_impl(&dword_20D6CC000, a2, OS_LOG_TYPE_FAULT, "Unsupported wallpaper type: %{public}@", v5, 0xCu);

}

- (void)resolveWallpaper:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[12];
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "package");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  v10 = 2112;
  v11 = a2;
  _os_log_error_impl(&dword_20D6CC000, a3, OS_LOG_TYPE_ERROR, "Error loading CAPackage from %@: %@", v9, 0x16u);

}

void __45__CRSUIClusterThemeManager_resolveWallpaper___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_20D6CC000, a2, OS_LOG_TYPE_ERROR, "Error loading image from %@", v5, 0xCu);

}

@end
