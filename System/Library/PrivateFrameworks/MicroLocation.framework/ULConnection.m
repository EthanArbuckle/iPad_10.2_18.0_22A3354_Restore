@implementation ULConnection

- (ULConnection)initWithDelegate:(id)a3 serviceIdentifier:(id)a4
{
  id v6;
  id v7;
  ULConnection *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  NSObject *v13;
  _QWORD block[4];
  ULConnection *v16;
  id v17;
  id v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ULConnection;
  v8 = -[ULConnection init](&v19, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.ULConnection.queue", v9);
    -[ULConnection setQueue:](v8, "setQueue:", v10);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.ULConnection.delegateQueue", v11);
    -[ULConnection setDelegateQueue:](v8, "setDelegateQueue:", v12);

    -[ULConnection queue](v8, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke;
    block[3] = &unk_2511CCB70;
    v16 = v8;
    v17 = v6;
    v18 = v7;
    dispatch_sync(v13, block);

  }
  return v8;
}

void __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setServiceIdentifier:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE669F0]), "initWithObject:", *(_QWORD *)(a1 + 32));
  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setConnection:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BE669D8]);
  objc_msgSend(*(id *)(a1 + 32), "setDarwinNotificationHelper:", v4);

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke_2;
  v15[3] = &unk_2511CCB48;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v5, "setInterruptionHandler:", v15);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke_3;
  v13[3] = &unk_2511CCB48;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v7, "setInvalidationHandler:", v13);

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setQueue:", v9);

  objc_msgSend(*(id *)(a1 + 32), "_manageConnectionAvailableNotificationObservation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v11 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2419C4000, v11, OS_LOG_TYPE_DEFAULT, "Initialized a new MiLo connection", v12, 2u);
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(v3, "_xpcInterruptionHandler");
    WeakRetained = v3;
  }

}

void __51__ULConnection_initWithDelegate_serviceIdentifier___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(v3, "_xpcInvalidationHandler");
    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[ULConnection _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ULConnection;
  -[ULConnection dealloc](&v3, sel_dealloc);
}

+ (id)createServiceIdentifierForToken:(id)a3
{
  id v3;
  void *v4;
  void *v5;
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
  void *v16;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  _QWORD v26[4];
  _QWORD v27[4];
  const __CFString *v28;
  const __CFString *v29;
  _QWORD v30[10];
  _QWORD v31[10];
  _QWORD v32[7];
  _QWORD v33[8];

  v33[7] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v32[0] = CFSTR("com.apple.intelligentroutingd");
  v30[0] = CFSTR("com.apple.mediaremoted");
  v30[1] = CFSTR("com.apple.Music");
  v31[0] = CFSTR("00000000-0000-0000-0000-000000000001");
  v31[1] = CFSTR("00000000-0000-0000-0000-000000000002");
  v30[2] = CFSTR("com.apple.TelephonyUtilities");
  v30[3] = CFSTR("com.apple.controlcenter");
  v31[2] = CFSTR("00000000-0000-0000-0000-000000000003");
  v31[3] = CFSTR("00000000-0000-0000-0000-000000000004");
  v30[4] = CFSTR("com.apple.AVKit.RoutePickerViewService");
  v30[5] = CFSTR("com.apple.tvremoted");
  v31[4] = CFSTR("00000000-0000-0000-0000-000000000005");
  v31[5] = CFSTR("00000000-0000-0000-0000-000000000006");
  v30[6] = CFSTR("com.apple.NeighborhoodActivityConduitService");
  v30[7] = CFSTR("com.apple.intelligentroutingclient.Media");
  v31[6] = CFSTR("00000000-0000-0000-0000-000000000007");
  v31[7] = CFSTR("00000000-0000-0000-0000-000000000008");
  v30[8] = CFSTR("com.apple.intelligentroutingclient.AppleTVControl");
  v30[9] = CFSTR("com.apple.IntelligentRoutingHostTests.xctrunner");
  v31[8] = CFSTR("00000000-0000-0000-0000-000000000009");
  v31[9] = CFSTR("00000000-0000-0000-0000-000000000010");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v4;
  v32[1] = CFSTR("com.apple.MicroLocationHostTests.xctrunner");
  v28 = CFSTR("com.apple.MicroLocationHostTests.xctrunner");
  v29 = CFSTR("00000000-0000-0000-0000-000000000011");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v5;
  v32[2] = CFSTR("com.apple.microlocationclient");
  v26[0] = CFSTR("com.apple.MicroLocationClientUnsupervised");
  v26[1] = CFSTR("com.apple.MicroLocationClientBinaryDetection");
  v27[0] = CFSTR("00000000-0000-0000-0000-000000000012");
  v27[1] = CFSTR("00000000-0000-0000-0000-000000000013");
  v26[2] = CFSTR("com.apple.MicroLocationClientMultiClass");
  v26[3] = CFSTR("com.apple.MicroLocationClientLSL");
  v27[2] = CFSTR("00000000-0000-0000-0000-000000000014");
  v27[3] = CFSTR("00000000-0000-0000-0000-000000000015");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v6;
  v32[3] = CFSTR("com.apple.MiLoDataCollection");
  v24 = CFSTR("com.apple.MiLoDataCollection");
  v25 = CFSTR("00000000-0000-0000-0000-000000000019");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v33[3] = v7;
  v32[4] = CFSTR("com.apple.MiLoLSL");
  v22 = CFSTR("com.apple.MiLoLSL");
  v23 = CFSTR("00000000-0000-0000-0000-000000000018");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[4] = v8;
  v32[5] = CFSTR("com.apple.MiLoWiFiHeatmap");
  v20 = CFSTR("com.apple.MiLoWiFiHeatmap");
  v21 = CFSTR("00000000-0000-0000-0000-000000000020");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[5] = v9;
  v32[6] = CFSTR("com.apple.MiLoPlaceholderApp");
  v18 = CFSTR("com.apple.MiLoPlaceholderApp");
  v19 = CFSTR("00000000-0000-0000-0000-000000000021");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33[6] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1988], "signingIdentityForSelf");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", v3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v15);
      else
        v16 = 0;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (void)createServiceWithServiceType:(unint64_t)a3 locationTypes:(id)a4 reply:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a4;
  v7 = (void (**)(id, _QWORD, void *))a5;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v8 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2419C4000, v8, OS_LOG_TYPE_ERROR, "Creating a service is not supported, only static tokens are supported", v10, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 21, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v9);

}

+ (void)deleteServiceWithIdentifier:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v7 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_2419C4000, v7, OS_LOG_TYPE_DEFAULT, "Deleting service:%@", buf, 0xCu);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = dispatch_queue_create("com.apple.MicroLocation.deleteServiceWithIdentifier", v8);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__ULConnection_deleteServiceWithIdentifier_reply___block_invoke;
  block[3] = &unk_2511CCBC0;
  v15 = v10;
  v16 = v5;
  v17 = v6;
  v11 = v6;
  v12 = v5;
  v13 = v10;
  dispatch_async(v9, block);

}

void __50__ULConnection_deleteServiceWithIdentifier_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__ULConnection_deleteServiceWithIdentifier_reply___block_invoke_2;
  v4[3] = &unk_2511CCB98;
  v5 = v3;
  v7 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "deleteServiceWithIdentifier:reply:", v5, v4);

}

void __50__ULConnection_deleteServiceWithIdentifier_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_2419C4000, v6, OS_LOG_TYPE_DEFAULT, "Deleting service, identifier: %@, error:%@", (uint8_t *)&v8, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (id)connect
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[ULConnection queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __23__ULConnection_connect__block_invoke;
  v7[3] = &unk_2511CCBE8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __23__ULConnection_connect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "connect", v10, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_checkAndRecoverIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "serviceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "legacyServiceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "connectWithServiceIdentifier:legacyServiceIdentifier:andRequestIdentifier:", v8, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (id)disconnect
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[ULConnection queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26__ULConnection_disconnect__block_invoke;
  v7[3] = &unk_2511CCBE8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __26__ULConnection_disconnect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "disconnect", v9, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_checkAndRecoverIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disconnectWithRequestIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  objc_msgSend(*(id *)(a1 + 32), "setServiceStatus:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setUpdateConfiguration:", 0);
}

- (id)requestPrediction
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[ULConnection queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__ULConnection_requestPrediction__block_invoke;
  v7[3] = &unk_2511CCBE8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__ULConnection_requestPrediction__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "requestPrediction", v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_checkAndRecoverIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestPredictionWithRequestIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (id)requestObservation
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[ULConnection queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__ULConnection_requestObservation__block_invoke;
  v7[3] = &unk_2511CCBE8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __34__ULConnection_requestObservation__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "requestObservation", v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_checkAndRecoverIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestObservationWithRequestIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (id)labelRequestIdentifier:(id)a3 withPlaceIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  ULConnection *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  -[ULConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = 0;
  -[ULConnection queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__ULConnection_labelRequestIdentifier_withPlaceIdentifier___block_invoke;
  v14[3] = &unk_2511CCC10;
  v15 = v6;
  v16 = v7;
  v17 = self;
  v18 = &v19;
  v10 = v7;
  v11 = v6;
  dispatch_sync(v9, v14);

  v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

void __59__ULConnection_labelRequestIdentifier_withPlaceIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v10 = 138412546;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "labelRequestIdentifier: %@, withPlaceIdentifier: %@", (uint8_t *)&v10, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 48), "_checkAndRecoverIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 48), "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "labelRequestIdentifier:withPlaceIdentifier:withReturnIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

- (id)startUpdatingWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v11;
  ULConnection *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  -[ULConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__ULConnection_startUpdatingWithConfiguration___block_invoke;
  block[3] = &unk_2511CCC38;
  v11 = v4;
  v12 = self;
  v13 = &v14;
  v7 = v4;
  dispatch_sync(v6, block);

  v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

void __47__ULConnection_startUpdatingWithConfiguration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "startUpdatingWithConfiguration: %@", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "_checkAndRecoverIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 40), "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startUpdatingWithConfiguration:withRequestIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(*(id *)(a1 + 40), "setUpdateConfiguration:", v9);

}

- (id)stopUpdating
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  -[ULConnection queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__ULConnection_stopUpdating__block_invoke;
  v7[3] = &unk_2511CCBE8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __28__ULConnection_stopUpdating__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v9[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "stopUpdating", v9, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_checkAndRecoverIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopUpdatingWithRequestIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  return objc_msgSend(*(id *)(a1 + 32), "setUpdateConfiguration:", 0);
}

- (void)enableMicrolocationAtCurrentLocation
{
  NSObject *v3;
  NSObject *v4;
  ULCustomLoiConfiguration *v5;
  uint8_t v6[16];

  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2419C4000, v4, OS_LOG_TYPE_DEFAULT, "Legacy SPI request, enableMicrolocationAtCurrentLocation, default to enable in room detection", v6, 2u);
  }
  v5 = -[ULCustomLoiConfiguration initWithEnableInRoomDetection:]([ULCustomLoiConfiguration alloc], "initWithEnableInRoomDetection:", 1);
  -[ULConnection enableMicrolocationAtCurrentLocationWithConfiguration:](self, "enableMicrolocationAtCurrentLocationWithConfiguration:", v5);

}

- (void)enableMicrolocationAtCurrentLocationWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  ULConnection *v10;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ULConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__ULConnection_enableMicrolocationAtCurrentLocationWithConfiguration___block_invoke;
  block[3] = &unk_2511CCC60;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __70__ULConnection_enableMicrolocationAtCurrentLocationWithConfiguration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "enableMicrolocationAtCurrentLocationWithConfiguration %@", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createCustomLocationOfInterestAtCurrentLocationWithConfiguration:", *(_QWORD *)(a1 + 32));

}

- (void)didUpdateServiceStatus:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  ULConnection *v12;
  id v13;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __39__ULConnection_didUpdateServiceStatus___block_invoke;
  v11 = &unk_2511CCC60;
  v12 = self;
  v13 = v4;
  v6 = v4;
  -[ULConnection _performAsyncOnDelegateQueueIfRespondsToSelector:block:](self, "_performAsyncOnDelegateQueueIfRespondsToSelector:block:", sel_connection_didUpdateServiceStatus_, &v8);
  v7 = (void *)objc_msgSend(v6, "copy", v8, v9, v10, v11, v12);
  -[ULConnection setServiceStatus:](self, "setServiceStatus:", v7);

}

void __39__ULConnection_didUpdateServiceStatus___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didUpdateServiceStatus:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didUpdatePrediction:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__ULConnection_didUpdatePrediction___block_invoke;
  v7[3] = &unk_2511CCC60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ULConnection _performAsyncOnDelegateQueueIfRespondsToSelector:block:](self, "_performAsyncOnDelegateQueueIfRespondsToSelector:block:", sel_connection_didUpdatePrediction_, v7);

}

void __36__ULConnection_didUpdatePrediction___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didUpdatePrediction:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didCompleteRequest:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ULConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __45__ULConnection_didCompleteRequest_withError___block_invoke;
  v11[3] = &unk_2511CCB70;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[ULConnection _performAsyncOnDelegateQueueIfRespondsToSelector:block:](self, "_performAsyncOnDelegateQueueIfRespondsToSelector:block:", sel_connection_didCompleteRequest_withError_, v11);

}

void __45__ULConnection_didCompleteRequest_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didCompleteRequest:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)didCreateCustomLocationOfInterestWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__ULConnection_didCreateCustomLocationOfInterestWithError___block_invoke;
  v7[3] = &unk_2511CCC60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ULConnection _performAsyncOnDelegateQueueIfRespondsToSelector:block:](self, "_performAsyncOnDelegateQueueIfRespondsToSelector:block:", sel_connection_didEnableMicrolocationAtCurrentLocationWithError_, v7);

}

void __59__ULConnection_didCreateCustomLocationOfInterestWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didEnableMicrolocationAtCurrentLocationWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didRemoveCustomLocationOfInterestWithIdentifier:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ULConnection queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__ULConnection_didRemoveCustomLocationOfInterestWithIdentifier_withError___block_invoke;
  v11[3] = &unk_2511CCB70;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[ULConnection _performAsyncOnDelegateQueueIfRespondsToSelector:block:](self, "_performAsyncOnDelegateQueueIfRespondsToSelector:block:", sel_connection_didDisableMicrolocationAtLocationWithIdentifier_withError_, v11);

}

void __74__ULConnection_didRemoveCustomLocationOfInterestWithIdentifier_withError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didDisableMicrolocationAtLocationWithIdentifier:withError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)didFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  ULConnection *v11;
  id v12;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __33__ULConnection_didFailWithError___block_invoke;
  v10 = &unk_2511CCC60;
  v11 = self;
  v12 = v4;
  v6 = v4;
  -[ULConnection _performAsyncOnDelegateQueueIfRespondsToSelector:block:](self, "_performAsyncOnDelegateQueueIfRespondsToSelector:block:", sel_connection_didFailWithError_, &v7);
  -[ULConnection _invalidate](self, "_invalidate", v7, v8, v9, v10, v11);

}

void __33__ULConnection_didFailWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didFailWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didSendGenericEvent:(unint64_t)a3 withDescription:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[ULConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __52__ULConnection_didSendGenericEvent_withDescription___block_invoke;
  v9[3] = &unk_2511CCC88;
  v10 = v6;
  v11 = a3;
  v9[4] = self;
  v8 = v6;
  -[ULConnection _performAsyncOnDelegateQueueIfRespondsToSelector:block:](self, "_performAsyncOnDelegateQueueIfRespondsToSelector:block:", sel_connection_didSendGenericEvent_withDescription_, v9);

}

void __52__ULConnection_didSendGenericEvent_withDescription___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didSendGenericEvent:withDescription:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (void)didCompleteObservationWithMetaInformation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__ULConnection_didCompleteObservationWithMetaInformation___block_invoke;
  v7[3] = &unk_2511CCC60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ULConnection _performAsyncOnDelegateQueueIfRespondsToSelector:block:](self, "_performAsyncOnDelegateQueueIfRespondsToSelector:block:", sel_connection_didCompleteObservationWithMetaInformation_, v7);

}

void __58__ULConnection_didCompleteObservationWithMetaInformation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didCompleteObservationWithMetaInformation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)didCompletePredictionWithMetaInformation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ULConnection_didCompletePredictionWithMetaInformation___block_invoke;
  v7[3] = &unk_2511CCC60;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[ULConnection _performAsyncOnDelegateQueueIfRespondsToSelector:block:](self, "_performAsyncOnDelegateQueueIfRespondsToSelector:block:", sel_connection_didCompletePredictionWithMetaInformation_, v7);

}

void __57__ULConnection_didCompletePredictionWithMetaInformation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connection:didCompletePredictionWithMetaInformation:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (id)_createNSXPCConnectionWithWeakProxy:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1988];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.milod.xpc.service"), 4096);
  +[ULXPCProtocols responseInterface](ULXPCProtocols, "responseInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", v4);
  +[ULXPCProtocols requestInterface](ULXPCProtocols, "requestInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v7);

  return v5;
}

- (void)_xpcInterruptionHandler
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ULServiceSuspendReason *v10;
  void *v11;
  void *v12;
  ULServiceSuspendReason *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ULConnection interrupted](self, "interrupted"))
  {
    -[ULConnection _xpcInterruptionHandler].cold.1();
  }
  else if (onceToken_MicroLocation_Default == -1)
  {
    goto LABEL_3;
  }
  dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
LABEL_3:
  v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[ULConnection connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signingIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl(&dword_2419C4000, v5, OS_LOG_TYPE_DEFAULT, "%@: connection interrupted", buf, 0xCu);

  }
  -[ULConnection serviceStatus](self, "serviceStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateServiceState:", 1);

  -[ULConnection serviceStatus](self, "serviceStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ULServiceSuspendReason initWithSuspendReasonEnum:]([ULServiceSuspendReason alloc], "initWithSuspendReasonEnum:", 4);
  v13 = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateServiceSuspendReasons:", v11);

  -[ULConnection serviceStatus](self, "serviceStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULConnection didUpdateServiceStatus:](self, "didUpdateServiceStatus:", v12);

  -[ULConnection setInterrupted:](self, "setInterrupted:", 1);
}

- (void)_xpcInvalidationHandler
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ULConnection interrupted](self, "interrupted"))
  {
    -[ULConnection _xpcInvalidationHandler].cold.1();
  }
  else if (onceToken_MicroLocation_Default == -1)
  {
    goto LABEL_3;
  }
  dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
LABEL_3:
  v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    -[ULConnection connection](self, "connection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "signingIdentity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_2419C4000, v5, OS_LOG_TYPE_DEFAULT, "%@: connection invalidated", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("ULLogicDomain"), 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ULConnection didFailWithError:](self, "didFailWithError:", v8);

}

- (void)_invalidate
{
  void *v3;
  void *v4;
  void *v5;

  -[ULConnection connection](self, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterruptionHandler:", 0);

  -[ULConnection connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInvalidationHandler:", 0);

  -[ULConnection connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[ULConnection setConnection:](self, "setConnection:", 0);
  -[ULConnection _manageConnectionAvailableNotificationObservation:](self, "_manageConnectionAvailableNotificationObservation:", 0);
}

- (void)_manageConnectionAvailableNotificationObservation:(BOOL)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (a3)
  {
    objc_initWeak(&location, self);
    -[ULConnection darwinNotificationHelper](self, "darwinNotificationHelper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __66__ULConnection__manageConnectionAvailableNotificationObservation___block_invoke;
    v6[3] = &unk_2511CCB48;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v4, "addObserverForNotificationName:handler:", CFSTR("ULConnectionAvailableNotification"), v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ULConnection darwinNotificationHelper](self, "darwinNotificationHelper");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserverForNotificationName:", CFSTR("ULConnectionAvailableNotification"));

  }
}

void __66__ULConnection__manageConnectionAvailableNotificationObservation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __66__ULConnection__manageConnectionAvailableNotificationObservation___block_invoke_2;
    block[3] = &unk_2511CCCB0;
    block[4] = v2;
    dispatch_async(v3, block);

  }
}

uint64_t __66__ULConnection__manageConnectionAvailableNotificationObservation___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "Handling connection available notification", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_checkAndRecoverIfNeeded");
}

- (void)_performAsyncOnDelegateQueueIfRespondsToSelector:(SEL)a3 block:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[ULConnection queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[ULConnection delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
    v9 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      NSStringFromSelector(a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_2419C4000, v10, OS_LOG_TYPE_DEFAULT, "Performing block for selector: %@", (uint8_t *)&v13, 0xCu);

    }
    -[ULConnection delegateQueue](self, "delegateQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v12, v6);

  }
}

- (void)_checkAndRecoverIfNeeded
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
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
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ULConnection interrupted](self, "interrupted"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
    v4 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      -[ULConnection serviceStatus](self, "serviceStatus");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULConnection updateConfiguration](self, "updateConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_2419C4000, v5, OS_LOG_TYPE_DEFAULT, "Recovering: serviceStatus: %@, updateConfiguration: %@", (uint8_t *)&v18, 0x16u);

    }
    -[ULConnection connection](self, "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "remoteObjectProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULConnection serviceIdentifier](self, "serviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULConnection legacyServiceIdentifier](self, "legacyServiceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connectWithServiceIdentifier:legacyServiceIdentifier:andRequestIdentifier:", v10, v11, v12);

    -[ULConnection updateConfiguration](self, "updateConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULConnection connection](self, "connection");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "remoteObjectProxy");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULConnection updateConfiguration](self, "updateConfiguration");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startUpdatingWithConfiguration:withRequestIdentifier:", v17, v14);

    }
    -[ULConnection setInterrupted:](self, "setInterrupted:", 0);
  }
}

- (ULConnectionDelegate)delegate
{
  return (ULConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (NSUUID)legacyServiceIdentifier
{
  return self->_legacyServiceIdentifier;
}

- (void)setLegacyServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_legacyServiceIdentifier, a3);
}

- (ULServiceStatus)serviceStatus
{
  return self->_serviceStatus;
}

- (void)setServiceStatus:(id)a3
{
  objc_storeStrong((id *)&self->_serviceStatus, a3);
}

- (ULUpdateConfiguration)updateConfiguration
{
  return self->_updateConfiguration;
}

- (void)setUpdateConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_updateConfiguration, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void)setInterrupted:(BOOL)a3
{
  self->_interrupted = a3;
}

- (ULDarwinNotificationHelper)darwinNotificationHelper
{
  return self->_darwinNotificationHelper;
}

- (void)setDarwinNotificationHelper:(id)a3
{
  objc_storeStrong((id *)&self->_darwinNotificationHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darwinNotificationHelper, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_updateConfiguration, 0);
  objc_storeStrong((id *)&self->_serviceStatus, 0);
  objc_storeStrong((id *)&self->_legacyServiceIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)exportDatabaseWithReply:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v3 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419C4000, v4, OS_LOG_TYPE_DEFAULT, "Exporting database", buf, 2u);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.MicroLocation.exportDatabaseWithReply", v5);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__ULConnection_Diagnostic__exportDatabaseWithReply___block_invoke;
  v10[3] = &unk_2511CCD00;
  v11 = v7;
  v12 = v3;
  v8 = v3;
  v9 = v7;
  dispatch_async(v6, v10);

}

void __52__ULConnection_Diagnostic__exportDatabaseWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__ULConnection_Diagnostic__exportDatabaseWithReply___block_invoke_2;
  v3[3] = &unk_2511CCCD8;
  v5 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "exportDatabaseWithReply:", v3);

}

void __52__ULConnection_Diagnostic__exportDatabaseWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2419C4000, v8, OS_LOG_TYPE_DEFAULT, "Export database response, URLS:%@, error:%@", (uint8_t *)&v10, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)purgeDatabaseWithReply:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v3 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419C4000, v4, OS_LOG_TYPE_DEFAULT, "Purging database", buf, 2u);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.MicroLocation.purgeDatabaseWithReply", v5);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__ULConnection_Diagnostic__purgeDatabaseWithReply___block_invoke;
  v10[3] = &unk_2511CCD00;
  v11 = v7;
  v12 = v3;
  v8 = v3;
  v9 = v7;
  dispatch_async(v6, v10);

}

void __51__ULConnection_Diagnostic__purgeDatabaseWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__ULConnection_Diagnostic__purgeDatabaseWithReply___block_invoke_2;
  v3[3] = &unk_2511CCD28;
  v5 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "purgeDatabaseWithReply:", v3);

}

void __51__ULConnection_Diagnostic__purgeDatabaseWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2419C4000, v5, OS_LOG_TYPE_DEFAULT, "Purge database response, error:%@", (uint8_t *)&v7, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)queryServicesWithReply:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[16];

  v3 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419C4000, v4, OS_LOG_TYPE_DEFAULT, "Querying services", buf, 2u);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.MicroLocation.queryServicesForClient", v5);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__ULConnection_Diagnostic__queryServicesWithReply___block_invoke;
  v10[3] = &unk_2511CCD00;
  v11 = v7;
  v12 = v3;
  v8 = v3;
  v9 = v7;
  dispatch_async(v6, v10);

}

void __51__ULConnection_Diagnostic__queryServicesWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__ULConnection_Diagnostic__queryServicesWithReply___block_invoke_2;
  v3[3] = &unk_2511CCCD8;
  v5 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "queryServicesWithReply:", v3);

}

void __51__ULConnection_Diagnostic__queryServicesWithReply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v7 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v5;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_2419C4000, v8, OS_LOG_TYPE_DEFAULT, "Query services response:%@, error:%@", (uint8_t *)&v10, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (id)requestAllModelsLearning
{
  NSObject *v3;
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
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  -[ULConnection queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__ULConnection_Diagnostic__requestAllModelsLearning__block_invoke;
  v6[3] = &unk_2511CCBE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__ULConnection_Diagnostic__requestAllModelsLearning__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "requestAllModelsLearning", v8, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_checkAndRecoverIfNeeded");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestAllModelsLearningWithRequestIdentifier:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

- (void)disableMicrolocationAtlocationWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  ULConnection *v10;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ULConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__ULConnection_Diagnostic__disableMicrolocationAtlocationWithIdentifier___block_invoke;
  block[3] = &unk_2511CCC60;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __73__ULConnection_Diagnostic__disableMicrolocationAtlocationWithIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "disableMicrolocationAtlocationWithIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 40), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeCustomLocationOfInterestWithIdentifier:", *(_QWORD *)(a1 + 32));

}

+ (id)getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4 handler:(id)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  char isKindOfClass;
  id v27;
  id v28;
  id v29;
  id v30;
  id v32;
  void *v33;
  NSObject *queue;
  id v35;
  BOOL v36;
  id obj;
  uint64_t v38;
  void *v39;
  _QWORD block[4];
  id v41;
  id v42;
  id v43;
  id v44;
  BOOL v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _QWORD v56[3];
  uint8_t buf[4];
  void *v58;
  uint64_t v59;

  v6 = a4;
  v59 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v35 = a5;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v8 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    v10 = v8;
    objc_msgSend(v9, "numberWithBool:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v58 = v11;
    _os_log_impl(&dword_2419C4000, v10, OS_LOG_TYPE_DEFAULT, "received recording scan request, forced: %@", buf, 0xCu);

  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v12 = objc_claimAutoreleasedReturnValue();
  queue = dispatch_queue_create("com.apple.MicroLocation.getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation", v12);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "resume");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", v7, 1);
  v32 = (id)v13;
  objc_msgSend(v14, "setValue:forKey:", v13, CFSTR("private.MicroLocation.recordingTriggerUUID"));
  v36 = v6;
  if (v6)
    v15 = MEMORY[0x24BDBD1C8];
  else
    v15 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("private.MicroLocation.forced.recordingRequest"));
  v56[0] = objc_opt_class();
  v56[1] = objc_opt_class();
  v56[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v7;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v16)
  {
    v17 = v16;
    v38 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v51 != v38)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v20 = v39;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v47;
          while (2)
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v47 != v23)
                objc_enumerationMutation(v20);
              objc_msgSend(v14, "objectForKeyedSubscript:", v19);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {

                goto LABEL_25;
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
            if (v22)
              continue;
            break;
          }
        }

        objc_msgSend(v14, "removeObjectForKey:", v19);
LABEL_25:
        ;
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v17);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __138__ULConnection_Legacy__getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke;
  block[3] = &unk_2511CCD78;
  v41 = v33;
  v42 = v14;
  v45 = v36;
  v43 = obj;
  v44 = v35;
  v27 = v35;
  v28 = obj;
  v29 = v14;
  v30 = v33;
  dispatch_async(queue, block);

  return v32;
}

void __138__ULConnection_Legacy__getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned __int8 *)(a1 + 64);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __138__ULConnection_Legacy__getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke_2;
  v5[3] = &unk_2511CCD50;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v9 = *(_BYTE *)(a1 + 64);
  v8 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation:shouldForceRecording:handler:", v4, v3, v5);

}

void __138__ULConnection_Legacy__getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v6 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)MEMORY[0x24BDD16E0];
    v9 = *(unsigned __int8 *)(a1 + 56);
    v10 = v6;
    objc_msgSend(v8, "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138413058;
    v15 = v7;
    v16 = 2112;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2112;
    v21 = v13;
    _os_log_impl(&dword_2419C4000, v10, OS_LOG_TYPE_DEFAULT, "get triggerUUID and request scan, information: %@, shouldForceRecording: %@, success: %@, error: %@", (uint8_t *)&v14, 0x2Au);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

+ (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 correspondingToTriggerUUID:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v10 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419C4000, v10, OS_LOG_TYPE_DEFAULT, "received truth label donation request for a recording trigger", buf, 2u);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("com.apple.MicroLocation.donateMicroLocationTruthTagWithTagUUID", v11);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume");
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __98__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke;
  v18[3] = &unk_2511CCDA0;
  v19 = v13;
  v20 = v7;
  v21 = v8;
  v22 = v9;
  v14 = v9;
  v15 = v8;
  v16 = v7;
  v17 = v13;
  dispatch_async(v12, v18);

}

void __98__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __98__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke_2;
  v5[3] = &unk_2511CCD28;
  v7 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "donateMicroLocationTruthTagWithTagUUID:correspondingToTriggerUUID:handler:", v3, v4, v5);

}

void __98__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_correspondingToTriggerUUID_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2419C4000, v5, OS_LOG_TYPE_DEFAULT, "donate truth tagUUID with corresponding triggerUUID, error:%@", (uint8_t *)&v7, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)donateMicroLocationTruthTagWithTagUUID:(id)a3 forRecordingEventsBetweenDate:(id)a4 andDate:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v13 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419C4000, v13, OS_LOG_TYPE_DEFAULT, "received truth label donation request between Dates", buf, 2u);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = dispatch_queue_create("com.apple.MicroLocation.donateMicroLocationTruthTagWithTagUUID", v14);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "resume");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __109__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke;
  block[3] = &unk_2511CCDC8;
  v23 = v10;
  v24 = v11;
  v26 = v9;
  v27 = v12;
  v25 = v16;
  v17 = v9;
  v18 = v16;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  dispatch_async(v15, block);

}

void __109__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "compare:", *(_QWORD *)(a1 + 40)) == 1)
  {
    v2 = *(_QWORD *)(a1 + 64);
    if (!v2)
      return;
    v3 = objc_alloc(MEMORY[0x24BDD1540]);
    v13 = *MEMORY[0x24BDD0FC8];
    v14[0] = CFSTR("donateTruthTagLabelForClient failed because startDate is later than endDate");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", CFSTR("ULConnectionDomain"), 38, v4);
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __109__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke_2;
    v10[3] = &unk_2511CCD28;
    v9 = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "donateMicroLocationTruthTagWithTagUUID:forRecordingEventsBetweenDate:andDate:handler:", v9, v7, v8, v10);

    v4 = v12;
  }

}

void __109__ULConnection_Legacy__donateMicroLocationTruthTagWithTagUUID_forRecordingEventsBetweenDate_andDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v4 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_2419C4000, v5, OS_LOG_TYPE_DEFAULT, "donate truth tagUUID between dates, error:%@", (uint8_t *)&v7, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

+ (void)requestMicroLocationRecordingScanWithAdditionalInformation:(id)a3 shouldForceRecording:(BOOL)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[4];
  id v13;
  _QWORD *v14;
  BOOL v15;
  _QWORD v16[5];
  id v17;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a3;
  v8 = dispatch_queue_create("com.apple.MicroLocation.requestMicroLocationRecordingScanWithAdditionalInformation", v6);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resume");
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", v7, 1);

  v17 = v10;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__ULConnection_Legacy__requestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording___block_invoke;
  block[3] = &unk_2511CCDF0;
  v15 = a4;
  v13 = v9;
  v14 = v16;
  v11 = v9;
  dispatch_async(v8, block);

  _Block_object_dispose(v16, 8);
}

void __104__ULConnection_Legacy__requestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  char isKindOfClass;
  void *v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _QWORD v36[5];

  v36[3] = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1);
  v6 = v5;
  if (*(_BYTE *)(a1 + 48))
    v7 = MEMORY[0x24BDBD1C8];
  else
    v7 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v5, "setValue:forKey:", v7, CFSTR("private.MicroLocation.forced.recordingRequest"));
  objc_msgSend(v6, "objectForKey:", CFSTR("private.MicroLocation.recordingTriggerUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v9, CFSTR("private.MicroLocation.recordingTriggerUUID"));

  }
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v22 = a1;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v24 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v31 != v24)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v14 = v25;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v16; ++j)
            {
              if (*(_QWORD *)v27 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(v6, "objectForKeyedSubscript:", v13, v22);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {

                goto LABEL_23;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v16)
              continue;
            break;
          }
        }

        objc_msgSend(v6, "removeObjectForKey:", v13);
LABEL_23:
        ;
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }

  objc_msgSend(*(id *)(v22 + 32), "remoteObjectProxy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "requestMicroLocationRecordingScanWithAdditionalInformation:", v6);

}

+ (void)requestCurrentMicroLocationWithAdditionalInformation:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t *v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v4 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419C4000, v4, OS_LOG_TYPE_DEFAULT, "received localization scan request", buf, 2u);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create("com.apple.MicroLocation.requestCurrentMicroLocationWithAdditionalInformation", v5);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume");
  *(_QWORD *)buf = 0;
  v13 = buf;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", v3, 1);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__ULConnection_Legacy__requestCurrentMicroLocationWithAdditionalInformation___block_invoke;
  v9[3] = &unk_2511CCE18;
  v10 = v7;
  v11 = buf;
  v8 = v7;
  dispatch_async(v6, v9);

  _Block_object_dispose(buf, 8);
}

void __77__ULConnection_Legacy__requestCurrentMicroLocationWithAdditionalInformation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  id obj;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  _QWORD v29[4];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v29[0] = objc_opt_class();
  v29[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:copyItems:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 1);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = a1;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v17 = *(_QWORD *)v24;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v5);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v7 = v18;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v20;
          while (2)
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v20 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(v2, "objectForKeyedSubscript:", v6, v15);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {

                goto LABEL_16;
              }
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v9)
              continue;
            break;
          }
        }

        objc_msgSend(v2, "removeObjectForKey:", v6);
LABEL_16:
        ++v5;
      }
      while (v5 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(v15 + 32), "remoteObjectProxy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requestCurrentMicroLocationWithAdditionalInformation:", v2);

}

+ (id)getMicroLocationInternalVersion
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  _QWORD block[4];
  id v15;
  NSObject *v16;
  uint8_t *v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v2 = logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2419C4000, v2, OS_LOG_TYPE_DEFAULT, "received internal version get request", buf, 2u);
  }
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("com.apple.MicroLocation.getMicroLocationInternalVersion", v3);

  +[ULConnection _createNSXPCConnectionWithWeakProxy:](ULConnection, "_createNSXPCConnectionWithWeakProxy:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");
  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v6 = dispatch_semaphore_create(0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__ULConnection_Legacy__getMicroLocationInternalVersion__block_invoke;
  block[3] = &unk_2511CCE68;
  v7 = v5;
  v15 = v7;
  v17 = buf;
  v8 = v6;
  v16 = v8;
  dispatch_async(v4, block);
  v9 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v8, v9);
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global);
  v10 = (id)logObject_MicroLocation_Default;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(objc_retainAutorelease(*((id *)v19 + 5)), "UTF8String");
    v24 = 68289282;
    v25 = 2082;
    v26 = &unk_2419D29C7;
    v27 = 2082;
    v28 = v11;
    _os_log_impl(&dword_2419C4000, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"MicroLocation Internal Version request\", \"version\":%{public, location:escape_only}s}", (uint8_t *)&v24, 0x1Cu);
  }

  v12 = *((id *)v19 + 5);
  _Block_object_dispose(buf, 8);

  return v12;
}

void __55__ULConnection_Legacy__getMicroLocationInternalVersion__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __55__ULConnection_Legacy__getMicroLocationInternalVersion__block_invoke_2;
  v4[3] = &unk_2511CCE40;
  v3 = *(void **)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v5 = v3;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v2, "getMicroLocationInternalVersionWithReply:", v4);

}

void __55__ULConnection_Legacy__getMicroLocationInternalVersion__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

+ (id)metadataForHomekitActionSetEventWithUUID:(id)a3 name:(id)a4 type:(id)a5 clientName:(id)a6 source:(id)a7 homeName:(id)a8
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v13 = (objc_class *)MEMORY[0x24BDBCED8];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = objc_alloc_init(v13);
  objc_msgSend(v20, "setValue:forKey:", v19, CFSTR("private.HomeKit.scene.actionSetUUID"));

  objc_msgSend(v20, "setValue:forKey:", v18, CFSTR("private.HomeKit.scene.actionSetName"));
  objc_msgSend(v20, "setValue:forKey:", v17, CFSTR("private.HomeKit.scene.actionSetType"));

  objc_msgSend(v20, "setValue:forKey:", v16, CFSTR("private.HomeKit.scene.clientName"));
  objc_msgSend(v20, "setValue:forKey:", v15, CFSTR("private.HomeKit.scene.source"));

  objc_msgSend(v20, "setValue:forKey:", v14, CFSTR("private.HomeKit.scene.homeName"));
  return v20;
}

+ (id)metadataForHomekitAccessoryControlEventWithUUID:(id)a3 stateString:(id)a4 serviceUUID:(id)a5 serviceType:(id)a6 characteristicType:(id)a7 serviceGroupUUID:(id)a8 source:(id)a9 roomUUID:(id)a10
{
  objc_class *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v16 = (objc_class *)MEMORY[0x24BDBCED8];
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = objc_alloc_init(v16);
  objc_msgSend(v25, "setValue:forKey:", v24, CFSTR("private.HomeKit.accessory.accessoryUUID"));

  objc_msgSend(v25, "setValue:forKey:", v23, CFSTR("private.HomeKit.accessory.stateString"));
  objc_msgSend(v25, "setValue:forKey:", v22, CFSTR("private.HomeKit.accessory.serviceUUID"));

  objc_msgSend(v25, "setValue:forKey:", v21, CFSTR("private.HomeKit.accessory.serviceType"));
  objc_msgSend(v25, "setValue:forKey:", v20, CFSTR("private.HomeKit.accessory.characteristicType"));

  objc_msgSend(v25, "setValue:forKey:", v19, CFSTR("private.HomeKit.accessory.serviceGroupUUID"));
  objc_msgSend(v25, "setValue:forKey:", v18, CFSTR("private.HomeKit.accessory.source"));

  objc_msgSend(v25, "setValue:forKey:", v17, CFSTR("private.HomeKit.accessory.roomUUID"));
  return v25;
}

- (void)updateLegacyServiceIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[ULConnection queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ULConnection queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__ULConnection_Legacy__updateLegacyServiceIdentifier___block_invoke;
  block[3] = &unk_2511CCC60;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

uint64_t __54__ULConnection_Legacy__updateLegacyServiceIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLegacyServiceIdentifier:", *(_QWORD *)(a1 + 40));
}

- (uint64_t)_xpcInterruptionHandler
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27;

  _CLLogObjectForCategory_MicroLocation_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_2419C4000, v2, v3, "{\"msg%{public}.0s\":\"Interruption handler called twice\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_MicroLocation_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_2419C4000, v9, v10, v11, "Interruption handler called twice", "{\"msg%{public}.0s\":\"Interruption handler called twice\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_MicroLocation_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_2419C4000, v15, v16, "{\"msg%{public}.0s\":\"Interruption handler called twice\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  v21 = abort_report_np();
  return -[ULConnection _xpcInvalidationHandler].cold.1(v21);
}

- (NSString)_xpcInvalidationHandler
{
  void *v0;
  NSObject *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  NSObject *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  objc_class *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27;

  _CLLogObjectForCategory_MicroLocation_Default();
  v1 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_5(v1))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_3(&dword_2419C4000, v2, v3, "{\"msg%{public}.0s\":\"Invalidation handler called after interruption handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_MicroLocation_Default();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_1(&dword_2419C4000, v9, v10, v11, "Invalidation handler called after interruption handler", "{\"msg%{public}.0s\":\"Invalidation handler called after interruption handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  _CLLogObjectForCategory_MicroLocation_Default();
  v14 = objc_claimAutoreleasedReturnValue();
  if (OUTLINED_FUNCTION_4(v14))
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2(&dword_2419C4000, v15, v16, "{\"msg%{public}.0s\":\"Invalidation handler called after interruption handler\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  v21 = (objc_class *)abort_report_np();
  return NSStringFromClass(v21);
}

@end
