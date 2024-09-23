@implementation BAGResourceVendor

- (BAGResourceVendor)initWithQueue:(id)a3 daemonController:(id)a4
{
  id v8;
  id v9;
  void *v10;
  BAGResourceVendor *v11;
  BAGResourceVendor *v12;
  uint64_t v13;
  NSUUID *vendorID;
  NSMutableDictionary *v15;
  NSMutableDictionary *updateBlocksByOptions;
  NSObject *v17;
  NSUUID *v18;
  void *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  NSUUID *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGResourceVendor.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGResourceVendor.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("daemonController"));

LABEL_3:
  v22.receiver = self;
  v22.super_class = (Class)BAGResourceVendor;
  v11 = -[BAGResourceVendor init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_queue, a3);
    objc_storeStrong((id *)&v12->_daemonController, a4);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = objc_claimAutoreleasedReturnValue();
    vendorID = v12->_vendorID;
    v12->_vendorID = (NSUUID *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    updateBlocksByOptions = v12->_updateBlocksByOptions;
    v12->_updateBlocksByOptions = v15;

    +[BAGLog resourceVending](BAGLog, "resourceVending");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = v12->_vendorID;
      *(_DWORD *)buf = 138412290;
      v24 = v18;
      _os_log_impl(&dword_2175C7000, v17, OS_LOG_TYPE_DEFAULT, "Init vendor %@", buf, 0xCu);
    }

  }
  return v12;
}

- (BAGResourceVendor)initWithQueue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BAGResourceVendor *v7;

  v4 = (void *)MEMORY[0x24BE4FCE8];
  v5 = a3;
  objc_msgSend(v4, "weakSharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BAGResourceVendor initWithQueue:daemonController:](self, "initWithQueue:daemonController:", v5, v6);

  return v7;
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  +[BAGLog resourceVending](BAGLog, "resourceVending");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[BAGResourceVendor vendorID](self, "vendorID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v7 = v4;
    _os_log_impl(&dword_2175C7000, v3, OS_LOG_TYPE_DEFAULT, "Dealloced vendor %@", buf, 0xCu);

  }
  -[IDSXPCDaemonController removeInterruptionHandlerForTarget:](self->_daemonController, "removeInterruptionHandlerForTarget:", self);
  v5.receiver = self;
  v5.super_class = (Class)BAGResourceVendor;
  -[BAGResourceVendor dealloc](&v5, sel_dealloc);
}

- (void)trackResourceForOptions:(id)a3 updateBlock:(id)a4
{
  id v7;
  void (**v8)(id, BAGResourceVendor *, _QWORD, BAGResourceUpdateContext *);
  NSObject *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  BAGResourceUpdateContext *v16;
  BAGResourceUpdateContext *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, BAGResourceVendor *, _QWORD, BAGResourceUpdateContext *))a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BAGResourceVendor.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

  }
  +[BAGLog resourceVending](BAGLog, "resourceVending");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[BAGResourceVendor vendorID](self, "vendorID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v10;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_2175C7000, v9, OS_LOG_TYPE_DEFAULT, "%@ Requested fetch for options %@", buf, 0x16u);

  }
  if (v7)
  {
    -[BAGResourceVendor updateBlocksByOptions](self, "updateBlocksByOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v7);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x219A0EB2C](v8);
    -[BAGResourceVendor updateBlocksByOptions](self, "updateBlocksByOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v7);

    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BAGResourceVendorErrorDomain"), 2, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[BAGResourceUpdateContext initWithLoadState:error:]([BAGResourceUpdateContext alloc], "initWithLoadState:error:", 0, v15);
      ((void (**)(_QWORD, BAGResourceVendor *, _QWORD, BAGResourceUpdateContext *))v12)[2](v12, self, 0, v16);

    }
    -[BAGResourceVendor _performFetchForOptions:](self, "_performFetchForOptions:", v7);
    goto LABEL_11;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BAGResourceVendorErrorDomain"), 1, 0);
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v17 = -[BAGResourceUpdateContext initWithLoadState:error:]([BAGResourceUpdateContext alloc], "initWithLoadState:error:", 0, v12);
    v8[2](v8, self, 0, v17);

LABEL_11:
  }

}

- (void)stopTrackingResourceForOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[BAGLog resourceVending](BAGLog, "resourceVending");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[BAGResourceVendor vendorID](self, "vendorID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2175C7000, v5, OS_LOG_TYPE_DEFAULT, "%@ Canceled fetch for options %@", (uint8_t *)&v10, 0x16u);

  }
  if (v4)
  {
    -[BAGResourceVendor updateBlocksByOptions](self, "updateBlocksByOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[BAGResourceVendor updateBlocksByOptions](self, "updateBlocksByOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v4);

      -[BAGResourceVendor _performCancelForOptions:](self, "_performCancelForOptions:", v4);
    }
  }

}

- (void)resourceUpdated:(id)a3 forOptions:(id)a4 withContext:(id)a5
{
  -[BAGResourceVendor _calloutToBlocksForOptions:withResource:andContext:](self, "_calloutToBlocksForOptions:withResource:andContext:", a4, a3, a5);
}

- (void)_handleInterruption
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "vendorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_2175C7000, a2, OS_LOG_TYPE_ERROR, "%@ XPC connection interrupted. Requesting bags", (uint8_t *)&v4, 0xCu);

}

- (void)_performFetchForOptions:(id)a3
{
  id v4;
  IDSXPCDaemonController *daemonController;
  uint64_t v6;
  IDSXPCDaemonController *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  daemonController = self->_daemonController;
  v6 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __45__BAGResourceVendor__performFetchForOptions___block_invoke;
  v12[3] = &unk_24D7BE9C0;
  objc_copyWeak(&v13, &location);
  -[IDSXPCDaemonController addInterruptionHandler:forTarget:](daemonController, "addInterruptionHandler:forTarget:", v12, self);
  v7 = self->_daemonController;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __45__BAGResourceVendor__performFetchForOptions___block_invoke_21;
  v9[3] = &unk_24D7BEA10;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  -[IDSXPCDaemonController performTask:](v7, "performTask:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleInterruption");
  }
  else
  {
    +[BAGLog resourceVending](BAGLog, "resourceVending");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __45__BAGResourceVendor__performFetchForOptions___block_invoke_cold_1(v3);

  }
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __45__BAGResourceVendor__performFetchForOptions___block_invoke_22;
    v20 = &unk_24D7BE9E8;
    objc_copyWeak(&v22, (id *)(a1 + 40));
    v21 = *(id *)(a1 + 32);
    objc_msgSend(v3, "bagKitCollaboratorWithErrorHandler:", &v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[BAGLog resourceVending](BAGLog, "resourceVending", v17, v18, v19, v20);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "vendorID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v24 = v7;
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_2175C7000, v6, OS_LOG_TYPE_DEFAULT, "%@ Performing fetch for options %@", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "vendorID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setupBagKitClient:withUUID:forOptions:", WeakRetained, v9, *(_QWORD *)(a1 + 32));

    objc_destroyWeak(&v22);
  }
  else
  {
    +[BAGLog resourceVending](BAGLog, "resourceVending");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __45__BAGResourceVendor__performFetchForOptions___block_invoke_21_cold_1(a1, v10, v11, v12, v13, v14, v15, v16);

  }
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_22(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  BAGResourceUpdateContext *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[BAGLog resourceVending](BAGLog, "resourceVending");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __45__BAGResourceVendor__performFetchForOptions___block_invoke_22_cold_2((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      v15 = *MEMORY[0x24BDD1398];
      v16[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BAGResourceVendorErrorDomain"), 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[BAGResourceUpdateContext initWithLoadState:error:]([BAGResourceUpdateContext alloc], "initWithLoadState:error:", 0, v13);
    objc_msgSend(WeakRetained, "_calloutToBlocksForOptions:withResource:andContext:", *(_QWORD *)(a1 + 32), 0, v14);

  }
  else
  {
    +[BAGLog resourceVending](BAGLog, "resourceVending");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __45__BAGResourceVendor__performFetchForOptions___block_invoke_22_cold_1(a1, (uint64_t)v3, v12);
  }

}

- (void)_performCancelForOptions:(id)a3
{
  id v4;
  IDSXPCDaemonController *daemonController;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  daemonController = self->_daemonController;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__BAGResourceVendor__performCancelForOptions___block_invoke;
  v7[3] = &unk_24D7BEA10;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  -[IDSXPCDaemonController performTask:](daemonController, "performTask:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __46__BAGResourceVendor__performCancelForOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v3, "bagKitCollaboratorWithErrorHandler:", &__block_literal_global);
    v5 = objc_claimAutoreleasedReturnValue();
    +[BAGLog resourceVending](BAGLog, "resourceVending");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "vendorID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_2175C7000, v6, OS_LOG_TYPE_DEFAULT, "%@ Performing cancel for options %@", (uint8_t *)&v16, 0x16u);

    }
    objc_msgSend(WeakRetained, "vendorID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject cancelBagKitClientWithUUID:forOptions:](v5, "cancelBagKitClientWithUUID:forOptions:", v9, *(_QWORD *)(a1 + 32));

  }
  else
  {
    +[BAGLog resourceVending](BAGLog, "resourceVending");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __46__BAGResourceVendor__performCancelForOptions___block_invoke_cold_1(a1, v5, v10, v11, v12, v13, v14, v15);
  }

}

void __46__BAGResourceVendor__performCancelForOptions___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  +[BAGLog resourceVending](BAGLog, "resourceVending");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__BAGResourceVendor__performFetchForOptions___block_invoke_22_cold_2((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)_calloutToBlocksForOptions:(id)a3 withResource:(id)a4 andContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BAGResourceVendor queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__BAGResourceVendor__calloutToBlocksForOptions_withResource_andContext___block_invoke;
  v15[3] = &unk_24D7BEA78;
  v15[4] = self;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __72__BAGResourceVendor__calloutToBlocksForOptions_withResource_andContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  +[BAGLog resourceVending](BAGLog, "resourceVending");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "vendorID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(_QWORD *)(a1 + 56);
    v9 = 138413058;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_2175C7000, v2, OS_LOG_TYPE_DEFAULT, "%@ Calling out to update blocks for { options : %@, context : %@, resource : %@ }", (uint8_t *)&v9, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "updateBlocksByOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v8)
    v8[2](v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (IDSXPCDaemonController)daemonController
{
  return self->_daemonController;
}

- (void)setDaemonController:(id)a3
{
  objc_storeStrong((id *)&self->_daemonController, a3);
}

- (NSMutableDictionary)updateBlocksByOptions
{
  return self->_updateBlocksByOptions;
}

- (void)setUpdateBlocksByOptions:(id)a3
{
  objc_storeStrong((id *)&self->_updateBlocksByOptions, a3);
}

- (NSUUID)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(id)a3
{
  objc_storeStrong((id *)&self->_vendorID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_updateBlocksByOptions, 0);
  objc_storeStrong((id *)&self->_daemonController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2175C7000, log, OS_LOG_TYPE_ERROR, "Self dealloced. Not handling interruption.", v1, 2u);
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_21_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2175C7000, a2, a3, "Self dealloced. Not performing fetch for options %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_22_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_2175C7000, log, OS_LOG_TYPE_ERROR, "Self dealloced. Not performing collaborator error update { options: %@, error: %@ }", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __45__BAGResourceVendor__performFetchForOptions___block_invoke_22_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2175C7000, a2, a3, "Error fetching bag kit collaborator {error: %@}", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __46__BAGResourceVendor__performCancelForOptions___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2175C7000, a2, a3, "Self dealloced. Not performing cancel for options %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
