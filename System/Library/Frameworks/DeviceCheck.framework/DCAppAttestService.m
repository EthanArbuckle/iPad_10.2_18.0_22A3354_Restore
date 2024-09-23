@implementation DCAppAttestService

- (BOOL)isSupported
{
  BOOL v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v2 = -[DCAppAttestService _isSupportedReturningError:](self, "_isSupportedReturningError:", &v12);
  v3 = v12;
  if (v3)
  {
    _DCLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[DCAppAttestService isSupported].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  return v2;
}

- (BOOL)_isSupportedReturningError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x24BDAC760];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__DCAppAttestService__isSupportedReturningError___block_invoke;
  v14[3] = &unk_24F1E9968;
  v14[4] = &v21;
  v14[5] = &v15;
  objc_msgSend(v4, "synchronousRemoteObjectProxy:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __49__DCAppAttestService__isSupportedReturningError___block_invoke_3;
  v10[3] = &unk_24F1E9990;
  v12 = &v21;
  v13 = &v15;
  v7 = v4;
  v11 = v7;
  objc_msgSend(v6, "appAttestationIsSupportedWithCompletion:", v10);
  if (a3)
    *a3 = objc_retainAutorelease((id)v16[5]);
  v8 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v8;
}

void __49__DCAppAttestService__isSupportedReturningError___block_invoke_3(uint64_t a1, char a2, id obj)
{
  id v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "invalidate");
}

+ (DCAppAttestService)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_0);
  return (DCAppAttestService *)(id)sharedService_sharedService;
}

void __35__DCAppAttestService_sharedService__block_invoke()
{
  DCAppAttestService *v0;
  void *v1;

  v0 = objc_alloc_init(DCAppAttestService);
  v1 = (void *)sharedService_sharedService;
  sharedService_sharedService = (uint64_t)v0;

}

void __49__DCAppAttestService__isSupportedReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  _DCLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __49__DCAppAttestService__isSupportedReturningError___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

- (id)_loadAppUUID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("com.apple.DC.AppAttestAppUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);
  if (v4)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

- (void)_saveAppUUID:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("com.apple.DC.AppAttestAppUUID"));

}

- (id)_rewrapAsDCError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.appattest.error"));

    if (v6 && (v7 = objc_msgSend(v4, "code"), (unint64_t)(v7 + 7) <= 5))
      v8 = *((_QWORD *)&unk_229235B38 + v7 + 7);
    else
      v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1540], "dc_errorWithCode:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _DCLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[DCAppAttestService _rewrapAsDCError:].cold.1((uint64_t)v9, (uint64_t)v4, v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)generateKeyWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  DCDeviceMetadataDaemonConnection *v24;

  v4 = completionHandler;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  v24 = objc_alloc_init(DCDeviceMetadataDaemonConnection);
  v5 = (void *)v20[5];
  v6 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke;
  v17[3] = &unk_24F1E99B8;
  v7 = v4;
  v18 = v7;
  objc_msgSend(v5, "remoteObjectProxy:", v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCAppAttestService _loadAppUUID](self, "_loadAppUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_current_queue();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_24F1E9A08;
  v13[4] = self;
  v11 = v7;
  v15 = v11;
  v16 = &v19;
  v12 = v10;
  v14 = v12;
  objc_msgSend(v8, "appAttestationCreateKey:completion:", v9, v13);

  _Block_object_dispose(&v19, 8);
}

void __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "dc_errorWithCode:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke_3;
  v17[3] = &unk_24F1E99E0;
  v17[4] = v10;
  v18 = v7;
  v11 = *(id *)(a1 + 48);
  v19 = v8;
  v20 = v9;
  v12 = *(_QWORD *)(a1 + 56);
  v21 = v11;
  v22 = v12;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = v9;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v10, "dispatchCompletionHandler:ontoQueue:", v17, v13);

}

void __55__DCAppAttestService_generateKeyWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_saveAppUUID:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_rewrapAsDCError:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v3, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

}

- (void)attestKey:(NSString *)keyId clientDataHash:(NSData *)clientDataHash completionHandler:(void *)completionHandler
{
  NSString *v8;
  NSData *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  DCDeviceMetadataDaemonConnection *v30;

  v8 = keyId;
  v9 = clientDataHash;
  v10 = completionHandler;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = objc_alloc_init(DCDeviceMetadataDaemonConnection);
  v11 = (void *)v26[5];
  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke;
  v23[3] = &unk_24F1E99B8;
  v13 = v10;
  v24 = v13;
  objc_msgSend(v11, "remoteObjectProxy:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCAppAttestService _loadAppUUID](self, "_loadAppUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_current_queue();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke_2;
  v19[3] = &unk_24F1E9A58;
  v19[4] = self;
  v17 = v13;
  v21 = v17;
  v22 = &v25;
  v18 = v16;
  v20 = v18;
  objc_msgSend(v14, "appAttestationAttestKey:keyId:clientDataHash:completion:", v15, v8, v9, v19);

  _Block_object_dispose(&v25, 8);
}

void __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "dc_errorWithCode:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke_3;
  v13[3] = &unk_24F1E9A30;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v14 = v5;
  v15 = v9;
  v16 = v6;
  v17 = v8;
  v18 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v12 = v5;
  objc_msgSend(v7, "dispatchCompletionHandler:ontoQueue:", v13, v10);

}

void __65__DCAppAttestService_attestKey_clientDataHash_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "_rewrapAsDCError:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

}

- (void)generateAssertion:(NSString *)keyId clientDataHash:(NSData *)clientDataHash completionHandler:(void *)completionHandler
{
  NSString *v8;
  NSData *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  DCDeviceMetadataDaemonConnection *v30;

  v8 = keyId;
  v9 = clientDataHash;
  v10 = completionHandler;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = objc_alloc_init(DCDeviceMetadataDaemonConnection);
  v11 = (void *)v26[5];
  v12 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke;
  v23[3] = &unk_24F1E99B8;
  v13 = v10;
  v24 = v13;
  objc_msgSend(v11, "remoteObjectProxy:", v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCAppAttestService _loadAppUUID](self, "_loadAppUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_current_queue();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  v19[1] = 3221225472;
  v19[2] = __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke_2;
  v19[3] = &unk_24F1E9A58;
  v19[4] = self;
  v17 = v13;
  v21 = v17;
  v22 = &v25;
  v18 = v16;
  v20 = v18;
  objc_msgSend(v14, "appAttestationAssert:keyId:clientDataHash:completion:", v15, v8, v9, v19);

  _Block_object_dispose(&v25, 8);
}

void __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "dc_errorWithCode:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke_3;
  v13[3] = &unk_24F1E9A30;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v14 = v5;
  v15 = v9;
  v16 = v6;
  v17 = v8;
  v18 = *(_QWORD *)(a1 + 56);
  v11 = v6;
  v12 = v5;
  objc_msgSend(v7, "dispatchCompletionHandler:ontoQueue:", v13, v10);

}

void __73__DCAppAttestService_generateAssertion_clientDataHash_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "_rewrapAsDCError:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v2, v4);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "connection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

}

- (void)dispatchCompletionHandler:(id)a3 ontoQueue:(id)a4
{
  void (**v5)(_QWORD);
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *label;
  NSObject *v11;
  _QWORD block[4];
  void (**v13)(_QWORD);
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(_QWORD))a3;
  v6 = a4;
  copy_current_process_name();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithObjects:", CFSTR("CommCenter"), 0);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DeviceCheck"));
  if (objc_msgSend(v9, "BOOLForKey:", CFSTR("dispatchTestDaemonToCallingQueue")))
    objc_msgSend(v8, "addObject:", CFSTR("dctestd"));
  if (objc_msgSend(v8, "containsObject:", v7) && v6)
  {
    label = dispatch_queue_get_label(v6);
    _DCLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v15 = label;
      _os_log_impl(&dword_229232000, v11, OS_LOG_TYPE_DEFAULT, "Dispatching completion handler onto calling queue. { queueLabel=%s }", buf, 0xCu);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__DCAppAttestService_dispatchCompletionHandler_ontoQueue___block_invoke;
    block[3] = &unk_24F1E9A80;
    v13 = v5;
    dispatch_async(v6, block);

  }
  else
  {
    v5[2](v5);
  }

}

uint64_t __58__DCAppAttestService_dispatchCompletionHandler_ontoQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __49__DCAppAttestService__isSupportedReturningError___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_229232000, a2, a3, "XPCConnection failed with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)isSupported
{
  OUTLINED_FUNCTION_0(&dword_229232000, a2, a3, "isSupported error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_rewrapAsDCError:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_229232000, log, OS_LOG_TYPE_DEBUG, "Remap to DCError (%@) <- (%@)\n", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
