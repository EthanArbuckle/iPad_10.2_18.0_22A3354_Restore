@implementation HAP2AccessoryServerDiscoveryBonjourLegacy

- (HAP2AccessoryServerDiscoveryBonjourLegacy)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HAP2AccessoryServerDiscoveryBonjourLegacy)initWithServiceType:(id)a3 domain:(id)a4
{
  id v7;
  id v8;
  HAP2AccessoryServerDiscoveryBonjourLegacy *v9;
  HAP2AccessoryServerDiscoveryBonjourLegacy *v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  uint64_t v15;
  HAP2PropertyLock *propertyLock;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HAP2AccessoryServerDiscoveryBonjourLegacy;
  v9 = -[HAP2AccessoryServerDiscoveryBonjourLegacy init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = (const char *)HAPDispatchQueueName(v9, CFSTR("workQueue"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v13;

    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2AccessoryServerDiscoveryBonjourLegacy.propertyLock"));
    v15 = objc_claimAutoreleasedReturnValue();
    propertyLock = v10->_propertyLock;
    v10->_propertyLock = (HAP2PropertyLock *)v15;

    objc_storeStrong((id *)&v10->_type, a3);
    objc_storeStrong((id *)&v10->_domain, a4);
  }

  return v10;
}

- (HAP2AccessoryServerDiscoveryBonjourLegacy)initWithLocalDomainAndServiceType:(id)a3
{
  return -[HAP2AccessoryServerDiscoveryBonjourLegacy initWithServiceType:domain:](self, "initWithServiceType:domain:", a3, CFSTR("local."));
}

- (void)dealloc
{
  CUBonjourBrowser *browser;
  objc_super v4;

  browser = self->_browser;
  if (browser)
    -[CUBonjourBrowser invalidate](browser, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)HAP2AccessoryServerDiscoveryBonjourLegacy;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy dealloc](&v4, sel_dealloc);
}

- (HAP2AccessoryServerDiscoveryDelegate)delegate
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__11138;
  v11 = __Block_byref_object_dispose__11139;
  v12 = 0;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__HAP2AccessoryServerDiscoveryBonjourLegacy_delegate__block_invoke;
  v6[3] = &unk_1E894DEE8;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performReadingBlock:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (HAP2AccessoryServerDiscoveryDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__HAP2AccessoryServerDiscoveryBonjourLegacy_setDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (BOOL)isDiscovering
{
  HAP2AccessoryServerDiscoveryBonjourLegacy *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HAP2AccessoryServerDiscoveryBonjourLegacy_isDiscovering__block_invoke;
  v5[3] = &unk_1E894DEE8;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performReadingBlock:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setDiscovering:(BOOL)a3
{
  void *v5;
  _QWORD v6[5];
  BOOL v7;

  -[HAP2AccessoryServerDiscoveryBonjourLegacy propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__HAP2AccessoryServerDiscoveryBonjourLegacy_setDiscovering___block_invoke;
  v6[3] = &unk_1E894D770;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performWritingBlock:", v6);

}

- (CUBonjourBrowser)browser
{
  NSObject *v3;

  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  CUBonjourBrowser *v4;
  NSObject *v5;
  CUBonjourBrowser *browser;

  v4 = (CUBonjourBrowser *)a3;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  browser = self->_browser;
  self->_browser = v4;

}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)dispatch_get_global_queue(0, 0);
}

- (void)startDiscovering
{
  NSObject *v3;
  _QWORD block[5];

  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__HAP2AccessoryServerDiscoveryBonjourLegacy_startDiscovering__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscovering
{
  NSObject *v3;
  _QWORD block[5];

  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HAP2AccessoryServerDiscoveryBonjourLegacy_stopDiscovering__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)reconfirmAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HAP2AccessoryServerDiscoveryBonjourLegacy_reconfirmAccessory___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_startDiscovering
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  HAP2AccessoryServerDiscoveryBonjourLegacy *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[HAP2AccessoryServerDiscoveryBonjourLegacy isDiscovering](self, "isDiscovering");
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_browser;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "Already discovering", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[HAP2AccessoryServerDiscoveryBonjourLegacy type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "Starting to discover services with type '%@'", buf, 0xCu);

    }
    -[HAP2AccessoryServerDiscoveryBonjourLegacy _startBrowser](self, "_startBrowser");
    -[HAP2AccessoryServerDiscoveryBonjourLegacy setDiscovering:](self, "setDiscovering:", 1);
    -[HAP2AccessoryServerDiscoveryBonjourLegacy delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[HAP2AccessoryServerDiscoveryBonjourLegacy delegateQueue](self, "delegateQueue");
      v9 = objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __62__HAP2AccessoryServerDiscoveryBonjourLegacy__startDiscovering__block_invoke;
      v14 = &unk_1E894E0F8;
      v15 = v8;
      v16 = self;
      dispatch_async(v9, &v11);

    }
    -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue", v11, v12, v13, v14);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v10, &__block_literal_global_11135);

  }
}

- (void)_stopDiscovering
{
  NSObject *v3;
  BOOL v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = -[HAP2AccessoryServerDiscoveryBonjourLegacy isDiscovering](self, "isDiscovering");
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_browser;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      -[HAP2AccessoryServerDiscoveryBonjourLegacy type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412290;
      v9 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "Stopping discovery of services with type '%@'", (uint8_t *)&v8, 0xCu);

    }
    -[HAP2AccessoryServerDiscoveryBonjourLegacy setDiscovering:](self, "setDiscovering:", 0);
    -[HAP2AccessoryServerDiscoveryBonjourLegacy _stopBrowser](self, "_stopBrowser");
  }
  else if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "Not discovering", (uint8_t *)&v8, 2u);
  }
}

- (void)_reconfirmAccessory:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  __int128 *p_buf;
  uint8_t v16[4];
  id v17;
  __int128 buf;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HAP2AccessoryServerDiscoveryBonjourLegacy isDiscovering](self, "isDiscovering"))
  {
    objc_msgSend(v4, "deviceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to reconfirm accessory '%@'", (uint8_t *)&buf, 0xCu);
    }
    -[HAP2AccessoryServerDiscoveryBonjourLegacy browser](self, "browser");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "devices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x2020000000;
    v20 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__HAP2AccessoryServerDiscoveryBonjourLegacy__reconfirmAccessory___block_invoke;
    v13[3] = &unk_1E894B730;
    v10 = v6;
    v14 = v10;
    p_buf = &buf;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
    if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v11 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v16 = 138412290;
        v17 = v10;
        _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "Unable to reconfirm accessory '%@'", v16, 0xCu);
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v12 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "Not discovering", (uint8_t *)&buf, 2u);
    }
  }

}

- (void)_startBrowser
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = objc_alloc_init(MEMORY[0x1E0D1B348]);
  objc_msgSend(v4, "setBrowseFlags:", 0x800000000000000);
  objc_msgSend(v4, "setChangeFlags:", 0xFFFFFFFFLL);
  objc_msgSend(v4, "setControlFlags:", 1);
  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDispatchQueue:", v5);

  -[HAP2AccessoryServerDiscoveryBonjourLegacy domain](self, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDomain:", v6);

  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLabel:", v8);

  -[HAP2AccessoryServerDiscoveryBonjourLegacy type](self, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceType:", v9);

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke;
  v23[3] = &unk_1E894B758;
  objc_copyWeak(&v24, &location);
  objc_msgSend(v4, "setDeviceFoundHandler:", v23);
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_16;
  v21[3] = &unk_1E894B758;
  objc_copyWeak(&v22, &location);
  objc_msgSend(v4, "setDeviceLostHandler:", v21);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_17;
  v19[3] = &unk_1E894B780;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v4, "setDeviceChangedHandler:", v19);
  objc_msgSend(v4, "setInterruptionHandler:", &__block_literal_global_20);
  v13 = v10;
  v14 = 3221225472;
  v15 = __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_21;
  v16 = &unk_1E894DF38;
  objc_copyWeak(&v18, &location);
  v11 = v4;
  v17 = v11;
  v12 = (void *)MEMORY[0x1D17B7400](&v13);
  objc_msgSend(v11, "setInvalidationHandler:", v12, v13, v14, v15, v16);
  objc_msgSend(v11, "activate");
  -[HAP2AccessoryServerDiscoveryBonjourLegacy setBrowser:](self, "setBrowser:", v11);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)_stopBrowser
{
  NSObject *v3;
  id v4;

  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAP2AccessoryServerDiscoveryBonjourLegacy browser](self, "browser");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServerDiscoveryBonjourLegacy setBrowser:](self, "setBrowser:", 0);
  objc_msgSend(v4, "invalidate");

}

- (void)_handleDeviceFoundOrChanged:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HAP2AccessoryServerDiscoveryBonjourLegacy isDiscovering](self, "isDiscovering"))
  {
    -[HAP2AccessoryServerDiscoveryBonjourLegacy delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HAP2AccessoryServerDiscoveryBonjourLegacy type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2AccessoryServerDiscoveryBonjourLegacy domain](self, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      accessoryInfoForBonjourDevice(v4, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v10 = (void *)hap2Log_browser;
        if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          objc_msgSend(v9, "rawDiscoveryInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bonjourServiceName"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "rawDiscoveryInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bonjourServiceType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deviceID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138478339;
          v19 = v13;
          v20 = 2112;
          v21 = v15;
          v22 = 2112;
          v23 = v16;
          _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "Found accessory: %{private}@.%@: %@", (uint8_t *)&v18, 0x20u);

        }
        objc_msgSend(v6, "discovery:didDiscoverAccessory:", self, v9);
      }

    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v17 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "Ignoring found/changed event while not discovering", (uint8_t *)&v18, 2u);
    }
  }

}

- (void)_handleDeviceLost:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HAP2AccessoryServerDiscoveryBonjourLegacy isDiscovering](self, "isDiscovering"))
  {
    -[HAP2AccessoryServerDiscoveryBonjourLegacy delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[HAP2AccessoryServerDiscoveryBonjourLegacy type](self, "type");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HAP2AccessoryServerDiscoveryBonjourLegacy domain](self, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      accessoryInfoForBonjourDevice(v4, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v10 = (void *)hap2Log_browser;
        if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
        {
          v11 = v10;
          objc_msgSend(v9, "rawDiscoveryInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bonjourServiceName"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "rawDiscoveryInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("bonjourServiceType"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "deviceID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138478339;
          v19 = v13;
          v20 = 2112;
          v21 = v15;
          v22 = 2112;
          v23 = v16;
          _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_DEFAULT, "Lost accessory: %{private}@.%@: %@", (uint8_t *)&v18, 0x20u);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "discovery:didLoseAccessory:error:", self, v9, 0);
      }

    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v17 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "Ignoring lost event while not discovering", (uint8_t *)&v18, 2u);
    }
  }

}

- (void)_handleBrowserStopped:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  HAP2AccessoryServerDiscoveryBonjourLegacy *v13;
  id v14;
  uint8_t buf[16];

  v4 = a3;
  -[HAP2AccessoryServerDiscoveryBonjourLegacy workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAP2AccessoryServerDiscoveryBonjourLegacy browser](self, "browser");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v7 = hap2Log_browser;
  if (v6 == v4)
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "Failed to start browser", buf, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerDiscoveryBonjourLegacy setBrowser:](self, "setBrowser:", 0);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEFAULT, "No longer discovering", buf, 2u);
    }
    v8 = 0;
  }
  -[HAP2AccessoryServerDiscoveryBonjourLegacy setDiscovering:](self, "setDiscovering:", 0);
  -[HAP2AccessoryServerDiscoveryBonjourLegacy delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[HAP2AccessoryServerDiscoveryBonjourLegacy delegateQueue](self, "delegateQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HAP2AccessoryServerDiscoveryBonjourLegacy__handleBrowserStopped___block_invoke;
    block[3] = &unk_1E894E120;
    v12 = v9;
    v13 = self;
    v14 = v8;
    dispatch_async(v10, block);

  }
}

- (NSString)type
{
  return self->_type;
}

- (NSString)domain
{
  return self->_domain;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HAP2PropertyLock)propertyLock
{
  return self->_propertyLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __67__HAP2AccessoryServerDiscoveryBonjourLegacy__handleBrowserStopped___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "discovery:didStopDiscoveringWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleDeviceFoundOrChanged:", v3);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "Bonjour browser found event after discovery died", v7, 2u);
    }
  }

}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleDeviceLost:", v3);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "Bonjour browser lost event after discovery died", v7, 2u);
    }
  }

}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleDeviceFoundOrChanged:", v3);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "Bonjour browser changed event after discovery died", v7, 2u);
    }
  }

}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_handleBrowserStopped:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "Bonjour browser invalidate event after discovery died", v5, 2u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setInvalidationHandler:", 0);

}

void __58__HAP2AccessoryServerDiscoveryBonjourLegacy__startBrowser__block_invoke_19()
{
  NSObject *v0;
  uint8_t v1[16];

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v0 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1CCE01000, v0, OS_LOG_TYPE_ERROR, "Bonjour browser crashed", v1, 2u);
  }
}

void __65__HAP2AccessoryServerDiscoveryBonjourLegacy__reconfirmAccessory___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  HAPDeviceID *v6;
  HAPDeviceID *v7;
  HAPDeviceID *v8;
  HAPDeviceID *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  HAPDeviceID *v14;
  __int16 v15;
  HAPDeviceID *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  -[HAPDeviceID identifierStr](v6, "identifierStr");
  v7 = (HAPDeviceID *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[HAPDeviceID initWithDeviceIDString:]([HAPDeviceID alloc], "initWithDeviceIDString:", v7);
    v9 = v8;
    if (v8)
    {
      if (-[HAPDeviceID isEqualToDeviceID:](v8, "isEqualToDeviceID:", *(_QWORD *)(a1 + 32)))
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v10 = hap2Log_browser;
        if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
        {
          v13 = 138412290;
          v14 = v9;
          _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "Reconfirming accessory '%@'", (uint8_t *)&v13, 0xCu);
        }
        -[HAPDeviceID reconfirm](v6, "reconfirm");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v12 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = v7;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_INFO, "Ignoring bonjour device that has an invalid device id '%@': %@", (uint8_t *)&v13, 0x16u);
      }
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_INFO, "Ignoring bonjour device that has a no device id: %@", (uint8_t *)&v13, 0xCu);
    }
  }

}

uint64_t __62__HAP2AccessoryServerDiscoveryBonjourLegacy__startDiscovering__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "discovery:didStartDiscoveringWithError:", *(_QWORD *)(a1 + 40), 0);
}

void __62__HAP2AccessoryServerDiscoveryBonjourLegacy__startDiscovering__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v0 = hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1CCE01000, v0, OS_LOG_TYPE_DEFAULT, "Now discovering", v1, 2u);
  }
}

uint64_t __64__HAP2AccessoryServerDiscoveryBonjourLegacy_reconfirmAccessory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reconfirmAccessory:", *(_QWORD *)(a1 + 40));
}

uint64_t __60__HAP2AccessoryServerDiscoveryBonjourLegacy_stopDiscovering__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopDiscovering");
}

uint64_t __61__HAP2AccessoryServerDiscoveryBonjourLegacy_startDiscovering__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDiscovering");
}

uint64_t __60__HAP2AccessoryServerDiscoveryBonjourLegacy_setDiscovering___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __58__HAP2AccessoryServerDiscoveryBonjourLegacy_isDiscovering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

id __57__HAP2AccessoryServerDiscoveryBonjourLegacy_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __53__HAP2AccessoryServerDiscoveryBonjourLegacy_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

@end
