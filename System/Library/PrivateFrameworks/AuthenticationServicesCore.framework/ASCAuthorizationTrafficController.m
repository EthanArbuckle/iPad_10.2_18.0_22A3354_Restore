@implementation ASCAuthorizationTrafficController

+ (ASCAuthorizationTrafficController)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  return (ASCAuthorizationTrafficController *)(id)sharedInstance_sharedInstance;
}

void __51__ASCAuthorizationTrafficController_sharedInstance__block_invoke()
{
  ASCAuthorizationTrafficController *v0;
  void *v1;

  v0 = objc_alloc_init(ASCAuthorizationTrafficController);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (ASCAuthorizationTrafficController)init
{
  ASCAuthorizationTrafficController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *appsWithActiveRequests;
  dispatch_queue_t v5;
  OS_dispatch_queue *clearanceQueue;
  dispatch_queue_t v7;
  OS_dispatch_queue *trafficQueue;
  _TtC26AuthenticationServicesCore27ASProgressiveBackoffManager *v9;
  _TtC26AuthenticationServicesCore27ASProgressiveBackoffManager *backoffManager;
  ASCAuthorizationTrafficController *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ASCAuthorizationTrafficController;
  v2 = -[ASCAuthorizationTrafficController init](&v13, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    appsWithActiveRequests = v2->_appsWithActiveRequests;
    v2->_appsWithActiveRequests = v3;

    v5 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationClearanceQueue", 0);
    clearanceQueue = v2->_clearanceQueue;
    v2->_clearanceQueue = (OS_dispatch_queue *)v5;

    v7 = dispatch_queue_create("com.apple.AuthenticationServicesCore.AuthorizationTrafficQueue", 0);
    trafficQueue = v2->_trafficQueue;
    v2->_trafficQueue = (OS_dispatch_queue *)v7;

    v9 = -[ASProgressiveBackoffManager initWithNumberOfOperationsBeforeTriggeringBackoff:minimumCooldownDurationSeconds:]([_TtC26AuthenticationServicesCore27ASProgressiveBackoffManager alloc], "initWithNumberOfOperationsBeforeTriggeringBackoff:minimumCooldownDurationSeconds:", 1, 10.0);
    backoffManager = v2->_backoffManager;
    v2->_backoffManager = v9;

    v11 = v2;
  }

  return v2;
}

+ (BOOL)_appWithAppIdentifierIsWebBrowser:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithApplicationIdentifier:error:", a3, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "entitlements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:ofClass:", CFSTR("com.apple.developer.web-browser"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)beginAuthorizationForApplicationIdentifier:(id)a3 token:(id)a4 withClearanceHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *trafficQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  ASCAuthorizationTrafficController *v17;
  id v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__0;
  v21[4] = __Block_byref_object_dispose__0;
  v22 = 0;
  trafficQueue = self->_trafficQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke;
  block[3] = &unk_24C97F818;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v20 = v21;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(trafficQueue, block);

  _Block_object_dispose(v21, 8);
}

void __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke(uint64_t a1)
{
  int v2;
  id v3;
  char v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  _QWORD block[4];
  id v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    if ((objc_msgSend(MEMORY[0x24BDD1488], "safari_isSafariFamilyBundleIdentifier:") & 1) != 0
      || +[ASCAuthorizationTrafficController _appWithAppIdentifierIsWebBrowser:](ASCAuthorizationTrafficController, "_appWithAppIdentifierIsWebBrowser:", *(_QWORD *)(a1 + 32)))
    {
      v2 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        v16 = (void *)MEMORY[0x24BDD1540];
        v30 = *MEMORY[0x24BDD0FD8];
        v31 = CFSTR("Request already in progress for specified application identifier.");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v17);
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;

        v4 = 0;
        goto LABEL_15;
      }
      v2 = 1;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 48));

    if (!v2)
    {
      v11 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v12 = *(void **)(v10 + 32);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_2;
      v24[3] = &unk_24C97F748;
      v24[4] = v10;
      v25 = *(id *)(a1 + 56);
      objc_msgSend(v12, "performAfterBackoffForContext:completionHandler:", v11, v24);
      v13 = v25;
LABEL_16:

      return;
    }
    v4 = 1;
LABEL_15:
    v21 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_20;
    block[3] = &unk_24C97F7F0;
    v22 = *(id *)(a1 + 56);
    v29 = v4;
    v23 = *(_QWORD *)(a1 + 64);
    v27 = v22;
    v28 = v23;
    dispatch_async(v21, block);
    v13 = v27;
    goto LABEL_16;
  }
  v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_cold_1(v5);
  v6 = *(_QWORD *)(a1 + 56);
  v7 = (void *)MEMORY[0x24BDD1540];
  v32 = *MEMORY[0x24BDD0FD8];
  v33[0] = CFSTR("No application identifier specified for authorization request.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.AuthenticationServicesCore.AuthorizationError"), 1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v9);

}

uint64_t __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = *(void **)(a1 + 40);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_3;
  block[3] = &unk_24C97EE30;
  v4 = v1;
  dispatch_async(v2, block);

}

uint64_t __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)endAuthorizationForAppIdentifier:(id)a3 token:(id)a4 clearanceHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *trafficQueue;
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
  trafficQueue = self->_trafficQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __93__ASCAuthorizationTrafficController_endAuthorizationForAppIdentifier_token_clearanceHandler___block_invoke;
  v15[3] = &unk_24C97F840;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(trafficQueue, v15);

}

void __93__ASCAuthorizationTrafficController_endAuthorizationForAppIdentifier_token_clearanceHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 48)))
  {
    objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 48));
    if (!objc_msgSend(v2, "count"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 40));
  }
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__ASCAuthorizationTrafficController_endAuthorizationForAppIdentifier_token_clearanceHandler___block_invoke_2;
  block[3] = &unk_24C97EE30;
  v5 = *(id *)(a1 + 56);
  dispatch_async(v3, block);

}

uint64_t __93__ASCAuthorizationTrafficController_endAuthorizationForAppIdentifier_token_clearanceHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)cancelAuthorizationForAppIdentifierIfNecessary:(id)a3 token:(id)a4
{
  id v6;
  id v7;
  NSObject *trafficQueue;
  _QWORD block[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    trafficQueue = self->_trafficQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __90__ASCAuthorizationTrafficController_cancelAuthorizationForAppIdentifierIfNecessary_token___block_invoke;
    block[3] = &unk_24C97F298;
    block[4] = self;
    v10 = v6;
    v11 = v7;
    dispatch_async(trafficQueue, block);

  }
}

void __90__ASCAuthorizationTrafficController_cancelAuthorizationForAppIdentifierIfNecessary_token___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKeyedSubscript:", a1[5]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsObject:", a1[6]))
  {
    objc_msgSend(v2, "removeObject:", a1[6]);
    if (!objc_msgSend(v2, "count"))
      objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", 0, a1[5]);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backoffManager, 0);
  objc_storeStrong((id *)&self->_trafficQueue, 0);
  objc_storeStrong((id *)&self->_clearanceQueue, 0);
  objc_storeStrong((id *)&self->_appsWithActiveRequests, 0);
}

void __107__ASCAuthorizationTrafficController_beginAuthorizationForApplicationIdentifier_token_withClearanceHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20E648000, log, OS_LOG_TYPE_FAULT, "Could not fetch bundle identifier for client process.", v1, 2u);
}

@end
