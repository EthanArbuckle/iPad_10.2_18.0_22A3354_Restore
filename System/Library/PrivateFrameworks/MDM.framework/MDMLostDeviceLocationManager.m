@implementation MDMLostDeviceLocationManager

- (MDMLostDeviceLocationManager)init
{
  MDMLostDeviceLocationManager *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MDMLostDeviceLocationManager;
  v2 = -[MDMLostDeviceLocationManager init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("MDMDLDLMServiceQueue"), "UTF8String"), v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)getCurrentLocationForOriginator:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[MDMLostDeviceLocationManager queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__MDMLostDeviceLocationManager_getCurrentLocationForOriginator_completion___block_invoke;
  block[3] = &unk_24EB68428;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __75__MDMLostDeviceLocationManager_getCurrentLocationForOriginator_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  NSObject *v14;
  dispatch_source_t v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD handler[5];
  id v24;

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2A670], 7000, 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletionBlock:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setOriginator:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBFA58], "newAssertionForBundle:withReason:", v3, CFSTR("MDMDLostDeviceLocationManager getCurrentLocationForOriginator:completion:"));
    objc_msgSend(MEMORY[0x24BDBFA88], "setAuthorizationStatusByType:forBundle:", 3, v3);
    v5 = objc_alloc(MEMORY[0x24BDBFA88]);
    objc_msgSend(v3, "bundlePath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "queue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithEffectiveBundlePath:delegate:onQueue:", v6, v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "setLocationManager:", v9);

    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "locationManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v10);

    v12 = *MEMORY[0x24BDBFB28];
    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDesiredAccuracy:", v12);

    objc_msgSend(*(id *)(a1 + 32), "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v14);
    objc_msgSend(*(id *)(a1 + 32), "setTimeoutTimerDispatchSource:", v15);

    objc_msgSend(*(id *)(a1 + 32), "timeoutTimerDispatchSource");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 30000000000);
    dispatch_source_set_timer(v16, v17, 0x3B9ACA00uLL, 0x3B9ACA00uLL);

    objc_msgSend(*(id *)(a1 + 32), "timeoutTimerDispatchSource");
    v18 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __75__MDMLostDeviceLocationManager_getCurrentLocationForOriginator_completion___block_invoke_2;
    handler[3] = &unk_24EB68258;
    handler[4] = *(_QWORD *)(a1 + 32);
    v24 = v4;
    v19 = v4;
    dispatch_source_set_event_handler(v18, handler);

    objc_msgSend(*(id *)(a1 + 32), "timeoutTimerDispatchSource");
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_activate(v20);

    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "requestLocation");

  }
}

void __75__MDMLostDeviceLocationManager_getCurrentLocationForOriginator_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint8_t v6[16];

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_ERROR, "Location Manager timed out", v6, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_cleanupAfterResponseFromLocationManagerOrTimeout");
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2A670], 7001, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v4)[2](v4, 0, v5);

  }
}

- (void)clearLastLocationRequestedDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF48];
  DMCSystemLostModeRequestPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v5 = (void *)objc_opt_new();
  v11 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__MDMLostDeviceLocationManager_clearLastLocationRequestedDate__block_invoke;
  v8[3] = &unk_24EB68450;
  v9 = 0;
  v10 = &v12;
  objc_msgSend(v5, "coordinateWritingItemAtURL:options:error:byAccessor:", v4, 1, &v11, v8);
  v6 = v11;

  if (!*((_BYTE *)v13 + 24))
  {
    v7 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v6;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_ERROR, "Could not read device last location requested file: %@", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v12, 8);
}

void __62__MDMLostDeviceLocationManager_clearLastLocationRequestedDate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v3 = (void *)MEMORY[0x24BDD1580];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v11);

  v7 = v11;
  if (v6)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "code");

      if (v9 == 4)
        goto LABEL_9;
    }
    else
    {

    }
    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_222CB9000, v10, OS_LOG_TYPE_ERROR, "Could not remove device last located file: %@", buf, 0xCu);
    }
  }
LABEL_9:

}

- (NSString)lastLocationRequestedDateMessage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  _QWORD v25[7];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF48];
  DMCSystemLostModeRequestPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3;
  v31 = __Block_byref_object_dispose__3;
  v32 = 0;
  v5 = (void *)objc_opt_new();
  v26 = 0;
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __64__MDMLostDeviceLocationManager_lastLocationRequestedDateMessage__block_invoke;
  v25[3] = &unk_24EB68478;
  v25[4] = &v33;
  v25[5] = &v27;
  v25[6] = &v37;
  objc_msgSend(v5, "coordinateReadingItemAtURL:options:error:byAccessor:", v4, 0, &v26, v25);
  v24 = v26;

  if (!*((_BYTE *)v34 + 24))
  {
    v6 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v24;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_DEFAULT, "Could not read device last located time interval: %@", buf, 0xCu);
    }
  }
  v7 = (void *)v38[5];
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v44 = v9;
      _os_log_impl(&dword_222CB9000, v10, OS_LOG_TYPE_DEFAULT, "Device last located on %{public}@. Creating localized message.", buf, 0xCu);
    }
    v11 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLocale:", v12);

    objc_msgSend(v11, "setTimeStyle:", 1);
    objc_msgSend(v11, "stringFromDate:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeStyle:", 0);
    objc_msgSend(v11, "setDateStyle:", 3);
    objc_msgSend(v11, "stringFromDate:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("originator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("organizationName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("serverName"));
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v15 = v18;

    }
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("The location of this device was sent to %@ at %@ on %@."), &stru_24EB6A400, CFSTR("MDMNotifications"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v22, v15, v13, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = 0;
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return (NSString *)v19;
}

void __64__MDMLostDeviceLocationManager_lastLocationRequestedDateMessage__block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "objectForKeyedSubscript:", *MEMORY[0x24BE63E20]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _BOOL4 v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v5 = a4;
  -[MDMLostDeviceLocationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_DEFAULT, "Location Manager returned a location.", buf, 2u);
  }
  -[MDMLostDeviceLocationManager originator](self, "originator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MDMLostDeviceLocationManager _updateLostModeFileForOriginator:](self, "_updateLostModeFileForOriginator:", v9);

  -[MDMLostDeviceLocationManager completionBlock](self, "completionBlock");
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[MDMLostDeviceLocationManager _cleanupAfterResponseFromLocationManagerOrTimeout](self, "_cleanupAfterResponseFromLocationManagerOrTimeout");
  if (v10)
  {
    if (v11)
      ((void (**)(_QWORD, void *, _QWORD))v11)[2](v11, v7, 0);
  }
  else
  {
    v12 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_ERROR, "Location Manager returned a location, but we can't report it because we can't record that fact. Throwing location information away.", v14, 2u);
    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE2A670], 7002, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v11)[2](v11, 0, v13);

    }
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[MDMLostDeviceLocationManager queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = 138543362;
    v10 = v5;
    _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_ERROR, "Location Manager failed: error=%{public}@", (uint8_t *)&v9, 0xCu);
  }
  -[MDMLostDeviceLocationManager completionBlock](self, "completionBlock");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[MDMLostDeviceLocationManager _cleanupAfterResponseFromLocationManagerOrTimeout](self, "_cleanupAfterResponseFromLocationManagerOrTimeout");
  if (v8)
    ((void (**)(_QWORD, _QWORD, id))v8)[2](v8, 0, v5);

}

- (void)_cleanupAfterResponseFromLocationManagerOrTimeout
{
  void *v3;
  NSObject *v4;
  NSObject *v5;

  -[MDMLostDeviceLocationManager locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopUpdatingLocation");

  -[MDMLostDeviceLocationManager setLocationManager:](self, "setLocationManager:", 0);
  -[MDMLostDeviceLocationManager setCompletionBlock:](self, "setCompletionBlock:", 0);
  -[MDMLostDeviceLocationManager timeoutTimerDispatchSource](self, "timeoutTimerDispatchSource");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    dispatch_source_cancel(v4);
    -[MDMLostDeviceLocationManager setTimeoutTimerDispatchSource:](self, "setTimeoutTimerDispatchSource:", 0);
    v4 = v5;
  }

}

- (BOOL)_updateLostModeFileForOriginator:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BDBCF48];
  DMCSystemLostModeRequestPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v7 = (void *)objc_opt_new();
  v17 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__MDMLostDeviceLocationManager__updateLostModeFileForOriginator___block_invoke;
  v13[3] = &unk_24EB684A0;
  v15 = &v22;
  v8 = v3;
  v14 = v8;
  v16 = &v18;
  objc_msgSend(v7, "coordinateWritingItemAtURL:options:error:byAccessor:", v6, 0, &v17, v13);
  v9 = v17;

  if (!*((_BYTE *)v23 + 24))
  {
    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      _os_log_impl(&dword_222CB9000, v10, OS_LOG_TYPE_DEFAULT, "Could not read device last located time interval for update: %@", buf, 0xCu);
    }
  }
  v11 = *((_BYTE *)v19 + 24) != 0;

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

  return v11;
}

void __65__MDMLostDeviceLocationManager__updateLostModeFileForOriginator___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = *MEMORY[0x24BE63E20];
  v21[1] = CFSTR("originator");
  v7 = a1[4];
  v22[0] = v6;
  v22[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "writeToURL:atomically:", v3, 1))
  {
    v9 = *MEMORY[0x24BDD0CF8];
    v10 = *MEMORY[0x24BDBCC68];
    v19[0] = *MEMORY[0x24BDD0CF0];
    v19[1] = v10;
    v20[0] = v9;
    v20[1] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v12 = objc_msgSend(v3, "setResourceValues:error:", v11, &v16);
    v13 = v16;

    if (v12)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }
    else
    {
      v15 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_222CB9000, v15, OS_LOG_TYPE_ERROR, "Could not write device last located time interval URL resourve values: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    v14 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v14, OS_LOG_TYPE_ERROR, "Could not write device last located time interval", buf, 2u);
    }
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)originator
{
  return self->_originator;
}

- (void)setOriginator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (OS_dispatch_source)timeoutTimerDispatchSource
{
  return self->_timeoutTimerDispatchSource;
}

- (void)setTimeoutTimerDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutTimerDispatchSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimerDispatchSource, 0);
  objc_storeStrong((id *)&self->_originator, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
