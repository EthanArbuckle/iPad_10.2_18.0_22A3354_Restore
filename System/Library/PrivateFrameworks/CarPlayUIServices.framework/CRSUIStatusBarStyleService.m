@implementation CRSUIStatusBarStyleService

- (CRSUIStatusBarStyleService)init
{
  CRSUIStatusBarStyleService *v2;
  uint64_t v3;
  CARObserverHashTable *observers;
  void *v5;
  uint64_t v6;
  OS_dispatch_queue *connectionQueue;
  uint64_t v8;
  NSHashTable *connections;
  uint64_t v10;
  NSMutableArray *lock_assertions;
  void *v12;
  id *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v19[4];
  id *v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)CRSUIStatusBarStyleService;
  v2 = -[CRSUIStatusBarStyleService init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BE15228]), "initWithProtocol:", &unk_2549E2968);
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v3;

    objc_msgSend(MEMORY[0x24BE0BE18], "serial");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = BSDispatchQueueCreate();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v8 = objc_claimAutoreleasedReturnValue();
    connections = v2->_connections;
    v2->_connections = (NSHashTable *)v8;

    v2->_lock._os_unfair_lock_opaque = 0;
    v10 = objc_opt_new();
    lock_assertions = v2->_lock_assertions;
    v2->_lock_assertions = (NSMutableArray *)v10;

    v12 = (void *)MEMORY[0x24BE383C8];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __34__CRSUIStatusBarStyleService_init__block_invoke;
    v19[3] = &unk_24C7697F8;
    v13 = v2;
    v20 = v13;
    objc_msgSend(v12, "listenerWithConfigurator:", v19);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v13[4];
    v13[4] = (id)v14;

    CRSUILogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v13[4];
      *(_DWORD *)buf = 138412290;
      v23 = v17;
      _os_log_impl(&dword_20D6CC000, v16, OS_LOG_TYPE_DEFAULT, "Activating listener! %@", buf, 0xCu);
    }

    objc_msgSend(v13[4], "activate");
  }
  return v2;
}

void __34__CRSUIStatusBarStyleService_init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setDomain:", CFSTR("com.apple.CarPlay.StatusBar"));
  +[CRSUIStatusBarStyleSpecification identifier](CRSUIStatusBarStyleSpecification, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setService:", v3);

  objc_msgSend(v4, "setDelegate:", *(_QWORD *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIStatusBarStyleService observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIStatusBarStyleService observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", v4);

}

- (int64_t)interfaceStyle
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *lock_assertions;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  lock_assertions = self->_lock_assertions;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__CRSUIStatusBarStyleService_interfaceStyle__block_invoke;
  v7[3] = &unk_24C769DF8;
  v7[4] = &v8;
  -[NSMutableArray enumerateObjectsUsingBlock:](lock_assertions, "enumerateObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_lock);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__CRSUIStatusBarStyleService_interfaceStyle__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "interfaceStyle"))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "interfaceStyle");
    *a4 = 1;
  }

}

- (int64_t)colorVariant
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *lock_assertions;
  int64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = -1;
  lock_assertions = self->_lock_assertions;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__CRSUIStatusBarStyleService_colorVariant__block_invoke;
  v7[3] = &unk_24C769DF8;
  v7[4] = &v8;
  -[NSMutableArray enumerateObjectsUsingBlock:](lock_assertions, "enumerateObjectsUsingBlock:", v7);
  os_unfair_lock_unlock(p_lock);
  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __42__CRSUIStatusBarStyleService_colorVariant__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "colorVariant") != -1)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v6, "colorVariant");
    *a4 = 1;
  }

}

- (BOOL)isSiriPresentation
{
  os_unfair_lock_s *p_lock;
  void *v4;
  char v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray lastObject](self->_lock_assertions, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSiriPresentation");
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)invalidate
{
  id v2;

  -[CRSUIStatusBarStyleService listener](self, "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD block[5];
  id v16;
  _QWORD v17[5];
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  CRSUILogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_20D6CC000, v7, OS_LOG_TYPE_INFO, "Received connection! %@", buf, 0xCu);
  }

  objc_msgSend(v6, "remoteProcess");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.private.CarPlayUIServices.status-bar-style"));

  if ((v9 & 1) != 0)
  {
    v10 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke;
    v17[3] = &unk_24C769E48;
    v17[4] = self;
    objc_msgSend(v6, "configureConnection:", v17);
    CRSUILogForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_20D6CC000, v11, OS_LOG_TYPE_DEFAULT, "Activating connection... %@", buf, 0xCu);
    }

    -[CRSUIStatusBarStyleService connectionQueue](self, "connectionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke_103;
    block[3] = &unk_24C7699F8;
    block[4] = self;
    v13 = v6;
    v16 = v13;
    dispatch_async(v12, block);

    objc_msgSend(v13, "activate");
  }
  else
  {
    CRSUILogForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CRSUIStatusBarStyleService listener:didReceiveConnection:withContext:].cold.1(v6, v14);

    objc_msgSend(v6, "invalidate");
  }

}

void __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = a2;
  +[CRSUIStatusBarStyleSpecification serviceQuality](CRSUIStatusBarStyleSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CRSUIStatusBarStyleSpecification interface](CRSUIStatusBarStyleSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_24C769E20;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTargetQueue:", v6);

}

void __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  CRSUILogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke_103(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(_QWORD *)(a1 + 40));
}

- (void)clientAcquireWithInterfaceStyle:(id)a3 colorVariant:(id)a4 fenceHandle:(id)a5 animationSettings:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *lock_assertions;
  id v21;
  uint64_t v22;
  CRSUIStatusBarStyleAssertionData *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  _QWORD block[4];
  id v30;
  CRSUIStatusBarStyleService *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v28 = a6;
  -[CRSUIStatusBarStyleService connectionQueue](self, "connectionQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  CRSUILogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    _os_log_impl(&dword_20D6CC000, v14, OS_LOG_TYPE_DEFAULT, "Received override request! Style: %@, color variant: %@", buf, 0x16u);
  }

  if (v10)
  {
    v27 = objc_msgSend(v10, "integerValue");
    if (v11)
    {
LABEL_5:
      v15 = objc_msgSend(v11, "integerValue");
      goto LABEL_8;
    }
  }
  else
  {
    v27 = 0;
    if (v11)
      goto LABEL_5;
  }
  v15 = -1;
LABEL_8:
  objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "instance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  v19 = MEMORY[0x24BDAC760];
  if (v17)
  {
    v26 = v12;
    lock_assertions = self->_lock_assertions;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __105__CRSUIStatusBarStyleService_clientAcquireWithInterfaceStyle_colorVariant_fenceHandle_animationSettings___block_invoke;
    v33[3] = &unk_24C769E70;
    v21 = v17;
    v34 = v21;
    v22 = -[NSMutableArray indexOfObjectPassingTest:](lock_assertions, "indexOfObjectPassingTest:", v33);
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_lock_assertions, "removeObjectAtIndex:", v22);
    v23 = objc_alloc_init(CRSUIStatusBarStyleAssertionData);
    -[CRSUIStatusBarStyleAssertionData setIdentifier:](v23, "setIdentifier:", v21);
    -[CRSUIStatusBarStyleAssertionData setInterfaceStyle:](v23, "setInterfaceStyle:", v27);
    -[CRSUIStatusBarStyleAssertionData setColorVariant:](v23, "setColorVariant:", v15);
    -[NSMutableArray addObject:](self->_lock_assertions, "addObject:", v23);

    v12 = v26;
    v19 = MEMORY[0x24BDAC760];
  }
  os_unfair_lock_unlock(&self->_lock);
  block[0] = v19;
  block[1] = 3221225472;
  block[2] = __105__CRSUIStatusBarStyleService_clientAcquireWithInterfaceStyle_colorVariant_fenceHandle_animationSettings___block_invoke_2;
  block[3] = &unk_24C769E98;
  v30 = v12;
  v31 = self;
  v32 = v28;
  v24 = v28;
  v25 = v12;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __105__CRSUIStatusBarStyleService_clientAcquireWithInterfaceStyle_colorVariant_fenceHandle_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __105__CRSUIStatusBarStyleService_clientAcquireWithInterfaceStyle_colorVariant_fenceHandle_animationSettings___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF7000], "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarStyleServiceUpdatedOverride:animationSettings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)clientAcquireForSiriPresentationWithFenceHandle:(id)a3 animationSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *lock_assertions;
  id v15;
  uint64_t v16;
  CRSUIStatusBarStyleAssertionData *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  CRSUIStatusBarStyleService *v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[CRSUIStatusBarStyleService connectionQueue](self, "connectionQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  CRSUILogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D6CC000, v9, OS_LOG_TYPE_DEFAULT, "Received Siri presentation override request!", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "instance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = MEMORY[0x24BDAC760];
  if (v11)
  {
    lock_assertions = self->_lock_assertions;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __96__CRSUIStatusBarStyleService_clientAcquireForSiriPresentationWithFenceHandle_animationSettings___block_invoke;
    v24[3] = &unk_24C769E70;
    v15 = v11;
    v25 = v15;
    v16 = -[NSMutableArray indexOfObjectPassingTest:](lock_assertions, "indexOfObjectPassingTest:", v24);
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_lock_assertions, "removeObjectAtIndex:", v16);
    v17 = objc_alloc_init(CRSUIStatusBarStyleAssertionData);
    -[CRSUIStatusBarStyleAssertionData setIdentifier:](v17, "setIdentifier:", v15);
    -[CRSUIStatusBarStyleAssertionData setInterfaceStyle:](v17, "setInterfaceStyle:", 0);
    -[CRSUIStatusBarStyleAssertionData setColorVariant:](v17, "setColorVariant:", -1);
    -[CRSUIStatusBarStyleAssertionData setSiriPresentation:](v17, "setSiriPresentation:", 1);
    -[NSMutableArray addObject:](self->_lock_assertions, "addObject:", v17);

  }
  os_unfair_lock_unlock(&self->_lock);
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __96__CRSUIStatusBarStyleService_clientAcquireForSiriPresentationWithFenceHandle_animationSettings___block_invoke_2;
  v20[3] = &unk_24C769E98;
  v21 = v6;
  v22 = self;
  v23 = v7;
  v18 = v7;
  v19 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v20);

}

uint64_t __96__CRSUIStatusBarStyleService_clientAcquireForSiriPresentationWithFenceHandle_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __96__CRSUIStatusBarStyleService_clientAcquireForSiriPresentationWithFenceHandle_animationSettings___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF7000], "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarStyleServiceUpdatedOverride:animationSettings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)clientReliquishWithFenceHandle:(id)a3 animationSettings:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *lock_assertions;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  CRSUIStatusBarStyleService *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  -[CRSUIStatusBarStyleService connectionQueue](self, "connectionQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x24BE383B0], "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "instance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = MEMORY[0x24BDAC760];
  if (v10)
  {
    lock_assertions = self->_lock_assertions;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __79__CRSUIStatusBarStyleService_clientReliquishWithFenceHandle_animationSettings___block_invoke;
    v21[3] = &unk_24C769E70;
    v22 = v10;
    v14 = -[NSMutableArray indexOfObjectPassingTest:](lock_assertions, "indexOfObjectPassingTest:", v21);
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_lock_assertions, "removeObjectAtIndex:", v14);

  }
  os_unfair_lock_unlock(&self->_lock);
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __79__CRSUIStatusBarStyleService_clientReliquishWithFenceHandle_animationSettings___block_invoke_2;
  v17[3] = &unk_24C769E98;
  v18 = v6;
  v19 = self;
  v20 = v7;
  v15 = v7;
  v16 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v17);

}

uint64_t __79__CRSUIStatusBarStyleService_clientReliquishWithFenceHandle_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __79__CRSUIStatusBarStyleService_clientReliquishWithFenceHandle_animationSettings___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF7000], "_synchronizeDrawingWithFence:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarStyleServiceUpdatedOverride:animationSettings:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CRSUIStatusBarStyleService connections](self, "connections");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *lock_assertions;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[CRSUIStatusBarStyleService connections](self, "connections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "instance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    lock_assertions = self->_lock_assertions;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__CRSUIStatusBarStyleService__connectionQueue_removeConnection___block_invoke;
    v11[3] = &unk_24C769E70;
    v12 = v6;
    v9 = -[NSMutableArray indexOfObjectPassingTest:](lock_assertions, "indexOfObjectPassingTest:", v11);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray removeObjectAtIndex:](self->_lock_assertions, "removeObjectAtIndex:", v9);

  }
  os_unfair_lock_unlock(&self->_lock);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __64__CRSUIStatusBarStyleService__connectionQueue_removeConnection___block_invoke_2;
  v10[3] = &unk_24C769C98;
  v10[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __64__CRSUIStatusBarStyleService__connectionQueue_removeConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __64__CRSUIStatusBarStyleService__connectionQueue_removeConnection___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarStyleServiceUpdatedOverride:animationSettings:", *(_QWORD *)(a1 + 32), 0);

}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_storeStrong((id *)&self->_listener, a3);
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

- (NSHashTable)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
  objc_storeStrong((id *)&self->_connections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lock_assertions, 0);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "remoteProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_1(&dword_20D6CC000, a2, v4, "Process does not have the required entitlement: %@", (uint8_t *)&v5);

}

@end
