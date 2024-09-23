@implementation HAP2AccessoryServerDiscoveryBonjour

- (HAP2AccessoryServerDiscoveryBonjour)init
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

- (HAP2AccessoryServerDiscoveryBonjour)initWithServiceType:(id)a3 domain:(id)a4
{
  id v7;
  id v8;
  HAP2AccessoryServerDiscoveryBonjour *v9;
  HAP2AccessoryServerDiscoveryBonjour *v10;
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
  v18.super_class = (Class)HAP2AccessoryServerDiscoveryBonjour;
  v9 = -[HAP2AccessoryServerDiscoveryBonjour init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v11 = (const char *)HAPDispatchQueueName(v9, CFSTR("workQueue"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v13;

    +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2AccessoryServerDiscoveryBonjour.propertyLock"));
    v15 = objc_claimAutoreleasedReturnValue();
    propertyLock = v10->_propertyLock;
    v10->_propertyLock = (HAP2PropertyLock *)v15;

    objc_storeStrong((id *)&v10->_type, a3);
    objc_storeStrong((id *)&v10->_domain, a4);
  }

  return v10;
}

- (HAP2AccessoryServerDiscoveryBonjour)initWithLocalDomainAndServiceType:(id)a3
{
  return -[HAP2AccessoryServerDiscoveryBonjour initWithServiceType:domain:](self, "initWithServiceType:domain:", a3, CFSTR("local."));
}

- (void)dealloc
{
  OS_nw_browser *browser;
  NSObject *v4;
  objc_super v5;

  browser = self->_browser;
  if (browser)
  {
    self->_browser = 0;
    v4 = browser;

    nw_browser_cancel(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)HAP2AccessoryServerDiscoveryBonjour;
  -[HAP2AccessoryServerDiscoveryBonjour dealloc](&v5, sel_dealloc);
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
  v10 = __Block_byref_object_copy__11314;
  v11 = __Block_byref_object_dispose__11315;
  v12 = 0;
  -[HAP2AccessoryServerDiscoveryBonjour propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HAP2AccessoryServerDiscoveryBonjour_delegate__block_invoke;
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
  -[HAP2AccessoryServerDiscoveryBonjour propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HAP2AccessoryServerDiscoveryBonjour_setDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWritingBlock:", v7);

}

- (BOOL)isDiscovering
{
  HAP2AccessoryServerDiscoveryBonjour *v2;
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
  -[HAP2AccessoryServerDiscoveryBonjour propertyLock](self, "propertyLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HAP2AccessoryServerDiscoveryBonjour_isDiscovering__block_invoke;
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

  -[HAP2AccessoryServerDiscoveryBonjour propertyLock](self, "propertyLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__HAP2AccessoryServerDiscoveryBonjour_setDiscovering___block_invoke;
  v6[3] = &unk_1E894D770;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "performWritingBlock:", v6);

}

- (OS_nw_browser)browser
{
  NSObject *v3;

  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  return self->_browser;
}

- (void)setBrowser:(id)a3
{
  OS_nw_browser *v4;
  NSObject *v5;
  OS_nw_browser *browser;

  v4 = (OS_nw_browser *)a3;
  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  browser = self->_browser;
  self->_browser = v4;

}

- (void)startDiscovering
{
  NSObject *v3;
  _QWORD block[5];

  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HAP2AccessoryServerDiscoveryBonjour_startDiscovering__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)stopDiscovering
{
  NSObject *v3;
  _QWORD block[5];

  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__HAP2AccessoryServerDiscoveryBonjour_stopDiscovering__block_invoke;
  block[3] = &unk_1E894DD08;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)reconfirmAccessory:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (void)_startDiscovering
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[HAP2AccessoryServerDiscoveryBonjour type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "Starting to discover services with type '%@'", (uint8_t *)&v7, 0xCu);

  }
  -[HAP2AccessoryServerDiscoveryBonjour _startBrowser](self, "_startBrowser");
}

- (void)_stopDiscovering
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[HAP2AccessoryServerDiscoveryBonjour type](self, "type");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "Stopping discovery of services with type '%@'", (uint8_t *)&v7, 0xCu);

  }
  -[HAP2AccessoryServerDiscoveryBonjour _stopBrowser](self, "_stopBrowser");
}

- (void)_startBrowser
{
  NSObject *v3;
  void *v4;
  id v5;
  const char *v6;
  id v7;
  NSObject *bonjour_service;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, uint64_t);
  void *v16;
  id v17;
  _QWORD state_changed_handler[4];
  NSObject *v19;
  id v20;
  id location;

  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAP2AccessoryServerDiscoveryBonjour browser](self, "browser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[HAP2AccessoryServerDiscoveryBonjour type](self, "type");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    -[HAP2AccessoryServerDiscoveryBonjour domain](self, "domain");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    bonjour_service = nw_browse_descriptor_create_bonjour_service(v6, (const char *)objc_msgSend(v7, "UTF8String"));

    nw_browse_descriptor_set_include_txt_record(bonjour_service, 1);
    v9 = nw_browser_create(bonjour_service, 0);
    -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    nw_browser_set_queue(v9, v10);

    objc_initWeak(&location, self);
    v11 = MEMORY[0x1E0C809B0];
    state_changed_handler[0] = MEMORY[0x1E0C809B0];
    state_changed_handler[1] = 3221225472;
    state_changed_handler[2] = __52__HAP2AccessoryServerDiscoveryBonjour__startBrowser__block_invoke;
    state_changed_handler[3] = &unk_1E894B7D0;
    objc_copyWeak(&v20, &location);
    v12 = v9;
    v19 = v12;
    nw_browser_set_state_changed_handler(v12, state_changed_handler);
    v13 = v11;
    v14 = 3221225472;
    v15 = __52__HAP2AccessoryServerDiscoveryBonjour__startBrowser__block_invoke_2;
    v16 = &unk_1E894B7F8;
    objc_copyWeak(&v17, &location);
    nw_browser_set_browse_results_changed_handler(v12, &v13);
    -[HAP2AccessoryServerDiscoveryBonjour setBrowser:](self, "setBrowser:", v12, v13, v14, v15, v16);
    nw_browser_start(v12);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

  }
}

- (void)_stopBrowser
{
  NSObject *v3;
  NSObject *browser;

  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HAP2AccessoryServerDiscoveryBonjour browser](self, "browser");
  browser = objc_claimAutoreleasedReturnValue();
  if (browser)
  {
    -[HAP2AccessoryServerDiscoveryBonjour setBrowser:](self, "setBrowser:", 0);
    nw_browser_cancel(browser);
  }

}

- (void)_handleStateChange:(int)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HAP2AccessoryServerDiscoveryBonjour *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = -[HAP2AccessoryServerDiscoveryBonjour isDiscovering](self, "isDiscovering");
  -[HAP2AccessoryServerDiscoveryBonjour delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 1)
  {
    if (v8)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v10 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_INFO))
      {
        LOWORD(v24) = 0;
        _os_log_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_INFO, "Received redundant ready message", (uint8_t *)&v24, 2u);
      }
      goto LABEL_33;
    }
    -[HAP2AccessoryServerDiscoveryBonjour setDiscovering:](self, "setDiscovering:", 1);
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v15 = (void *)hap2Log_browser;
    if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      -[HAP2AccessoryServerDiscoveryBonjour type](self, "type");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138412290;
      v25 = v17;
      _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_DEFAULT, "Now discovering services with type '%@'", (uint8_t *)&v24, 0xCu);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = v9;
      v19 = self;
      v20 = 0;
LABEL_32:
      objc_msgSend(v18, "discovery:didStartDiscoveringWithError:", v19, v20);
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  -[HAP2AccessoryServerDiscoveryBonjour setDiscovering:](self, "setDiscovering:", 0);
  if (a3 == 3)
  {
    if (!v8)
      goto LABEL_33;
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v21 = (void *)hap2Log_browser;
    if (!os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    v13 = v21;
    -[HAP2AccessoryServerDiscoveryBonjour type](self, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v14;
    _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEFAULT, "No longer discovering services with type '%@'", (uint8_t *)&v24, 0xCu);
    goto LABEL_25;
  }
  if (a3 != 2)
    goto LABEL_33;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v11 = (void *)hap2Log_browser;
  v12 = os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (!v12)
      goto LABEL_26;
    v13 = v11;
    -[HAP2AccessoryServerDiscoveryBonjour type](self, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v14;
    v26 = 2112;
    v27 = v6;
    _os_log_error_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_ERROR, "Browser failed while discovering services with type '%@': %@", (uint8_t *)&v24, 0x16u);
LABEL_25:

LABEL_26:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "discovery:didStopDiscoveringWithError:", self, v6);
    goto LABEL_33;
  }
  if (v12)
  {
    v22 = v11;
    -[HAP2AccessoryServerDiscoveryBonjour type](self, "type");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412546;
    v25 = v23;
    v26 = 2112;
    v27 = v6;
    _os_log_error_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_ERROR, "Browser failed to start discovering services with type '%@': %@", (uint8_t *)&v24, 0x16u);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18 = v9;
    v19 = self;
    v20 = v6;
    goto LABEL_32;
  }
LABEL_33:

}

- (void)_handleBrowseResultsChange:(id)a3 current:(id)a4 batchComplete:(BOOL)a5
{
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  nw_browse_result_change_t changes;
  HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple *v23;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if (-[HAP2AccessoryServerDiscoveryBonjour isDiscovering](self, "isDiscovering"))
  {
    changes = nw_browse_result_get_changes(v8, v9);
    if (changes)
    {
      if ((changes & 1) != 0)
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v19 = hap2Log_browser;
        if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1CCE01000, v19, OS_LOG_TYPE_DEBUG, "Ignoring identical results", buf, 2u);
        }
      }
      else
      {
        v12 = -[HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple initWithPreviousResult:currentResult:changes:]([HAP2AccessoryServerDiscoveryBonjourBrowseResultTuple alloc], "initWithPreviousResult:currentResult:changes:", v8, v9, changes);
        if (a5)
        {
          -[HAP2AccessoryServerDiscoveryBonjour browseResults](self, "browseResults");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            -[HAP2AccessoryServerDiscoveryBonjour browseResults](self, "browseResults");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v12);

            -[HAP2AccessoryServerDiscoveryBonjour browseResults](self, "browseResults");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v15, "copy");

            -[HAP2AccessoryServerDiscoveryBonjour setBrowseResults:](self, "setBrowseResults:", 0);
          }
          else
          {
            v23 = v12;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[HAP2AccessoryServerDiscoveryBonjour _handleBrowseResults:](self, "_handleBrowseResults:", v16);
        }
        else
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v20 = hap2Log_browser;
          if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_DEBUG, "Batching changes", buf, 2u);
          }
          -[HAP2AccessoryServerDiscoveryBonjour browseResults](self, "browseResults");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[HAP2AccessoryServerDiscoveryBonjour setBrowseResults:](self, "setBrowseResults:", v22);

          }
          -[HAP2AccessoryServerDiscoveryBonjour browseResults](self, "browseResults");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v12);
        }

      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v18 = hap2Log_browser;
      if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v8;
        v26 = 2112;
        v27 = v9;
        _os_log_error_impl(&dword_1CCE01000, v18, OS_LOG_TYPE_ERROR, "Failed to compare results: previous = %@ current = %@", buf, 0x16u);
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
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, "Ignoring result change while not discovering: %@", buf, 0xCu);
    }
  }

}

- (void)_handleBrowseResults:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  HAP2AccessoryServerDiscoveryBonjour *v12;
  _QWORD v13[4];
  id v14;
  HAP2AccessoryServerDiscoveryBonjour *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  -[HAP2AccessoryServerDiscoveryBonjour workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HAP2AccessoryServerDiscoveryBonjour delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__11314;
    v27 = __Block_byref_object_dispose__11315;
    v28 = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__11314;
    v21 = __Block_byref_object_dispose__11315;
    v22 = 0;
    v7 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke;
    v16[3] = &unk_1E894B820;
    v16[4] = &v23;
    v16[5] = &v17;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v16);
    if (objc_msgSend((id)v18[5], "count") && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = (void *)v18[5];
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke_41;
      v13[3] = &unk_1E894B848;
      v14 = v6;
      v15 = self;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v13);

    }
    v9 = (void *)v24[5];
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke_2;
    v10[3] = &unk_1E894B848;
    v11 = v6;
    v12 = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);

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

- (NSMutableArray)browseResults
{
  return self->_browseResults;
}

- (void)setBrowseResults:(id)a3
{
  objc_storeStrong((id *)&self->_browseResults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browseResults, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_browser, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "currentResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "currentResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    accessoryInfoForBrowseResult(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
  }
  objc_msgSend(v3, "previousResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "previousResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    accessoryInfoForBrowseResult(v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
LABEL_5:
      objc_msgSend(v6, "deviceID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v3, "changes") & 2) != 0 || (objc_msgSend(v3, "changes") & 0x20) != 0)
      {
        v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v18 = *(void **)(v17 + 40);
          *(_QWORD *)(v17 + 40) = v16;

          v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        }
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, v9);
        v14 = a1 + 40;
      }
      else
      {
        if ((objc_msgSend(v3, "changes") & 4) == 0)
        {
LABEL_15:

          goto LABEL_20;
        }
        v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v13 = *(void **)(v12 + 40);
          *(_QWORD *)(v12 + 40) = v11;

          v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v9);
        v14 = a1 + 32;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v14 + 8) + 40), "setObject:forKeyedSubscript:", 0, v9);
      goto LABEL_15;
    }
  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v19 = (void *)hap2Log_browser;
  if (os_log_type_enabled((os_log_t)hap2Log_browser, OS_LOG_TYPE_ERROR))
  {
    v20 = v19;
    objc_msgSend(v3, "previousResult");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentResult");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v21;
    v25 = 2112;
    v26 = v22;
    _os_log_error_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_ERROR, "Failed to parse previous and current browse results: previous = %@, current = %@", (uint8_t *)&v23, 0x16u);

  }
LABEL_20:

}

uint64_t __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke_41(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "discovery:didLoseAccessory:error:", *(_QWORD *)(a1 + 40), a3, 0);
}

uint64_t __60__HAP2AccessoryServerDiscoveryBonjour__handleBrowseResults___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "discovery:didDiscoverAccessory:", *(_QWORD *)(a1 + 40), a3);
}

void __52__HAP2AccessoryServerDiscoveryBonjour__startBrowser__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  CFErrorRef v6;
  NSObject *error;

  error = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (error)
    v6 = nw_error_copy_cf_error(error);
  else
    v6 = 0;
  objc_msgSend(WeakRetained, "_handleStateChange:error:", a2, v6);

  if ((_DWORD)a2 == 3)
  {
    nw_browser_set_browse_results_changed_handler(*(nw_browser_t *)(a1 + 32), 0);
    nw_browser_set_state_changed_handler(*(nw_browser_t *)(a1 + 32), 0);
  }

}

void __52__HAP2AccessoryServerDiscoveryBonjour__startBrowser__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a3;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleBrowseResultsChange:current:batchComplete:", v8, v7, a4);

}

uint64_t __54__HAP2AccessoryServerDiscoveryBonjour_stopDiscovering__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopDiscovering");
}

uint64_t __55__HAP2AccessoryServerDiscoveryBonjour_startDiscovering__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startDiscovering");
}

uint64_t __54__HAP2AccessoryServerDiscoveryBonjour_setDiscovering___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __52__HAP2AccessoryServerDiscoveryBonjour_isDiscovering__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

id __51__HAP2AccessoryServerDiscoveryBonjour_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __47__HAP2AccessoryServerDiscoveryBonjour_delegate__block_invoke(uint64_t a1)
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
