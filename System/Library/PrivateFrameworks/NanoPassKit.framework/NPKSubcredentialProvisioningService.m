@implementation NPKSubcredentialProvisioningService

- (NPKSubcredentialProvisioningService)init
{
  NPKSubcredentialProvisioningService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *subcredentialProvisioningQueue;
  uint64_t v5;
  IDSService *subcredentialService;
  uint64_t v7;
  NSMutableDictionary *outstandingRequests;
  NSObject *v9;
  _QWORD block[4];
  NPKSubcredentialProvisioningService *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NPKSubcredentialProvisioningService;
  v2 = -[NPKSubcredentialProvisioningService init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.NanoPassKit.NPKSubcredentialProvisioningService", 0);
    subcredentialProvisioningQueue = v2->_subcredentialProvisioningQueue;
    v2->_subcredentialProvisioningQueue = (OS_dispatch_queue *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", CFSTR("com.apple.private.alloy.passbook.maintenance"));
    subcredentialService = v2->_subcredentialService;
    v2->_subcredentialService = (IDSService *)v5;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    outstandingRequests = v2->_outstandingRequests;
    v2->_outstandingRequests = (NSMutableDictionary *)v7;

    v9 = v2->_subcredentialProvisioningQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __43__NPKSubcredentialProvisioningService_init__block_invoke;
    block[3] = &unk_24CFE7998;
    v12 = v2;
    dispatch_sync(v9, block);

  }
  return v2;
}

uint64_t __43__NPKSubcredentialProvisioningService_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setUpSubcredentialProvisioningQueue");
  return objc_msgSend(*(id *)(a1 + 32), "_setUpSubcredentialProvisioningService");
}

- (void)registerProtobufActionsForService:(id)a3
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    pk_General_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

    if (v4)
    {
      pk_General_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = 136446722;
        v7 = "-[NPKSubcredentialProvisioningService registerProtobufActionsForService:]";
        v8 = 2082;
        v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKSubcredentialProvisioningService.m";
        v10 = 2048;
        v11 = 47;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Expected service to be non-nil!)", (uint8_t *)&v6, 0x20u);
      }

    }
    _NPKAssertAbort();
  }
}

- (id)sendProtobuf:(id)a3 responseExpected:(BOOL)a4
{
  return -[NPKSubcredentialProvisioningService _sendProtobuf:responseExpected:extraOptions:](self, "_sendProtobuf:responseExpected:extraOptions:", a3, a4, 0);
}

- (BOOL)isPairedDeviceConnected
{
  void *v2;
  char v3;

  -[NPKSubcredentialProvisioningService subcredentialService](self, "subcredentialService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = NPKIsConnectedToPairedOrPairingDeviceFromService(v2);

  return v3;
}

- (void)_setUpSubcredentialProvisioningQueue
{
  NSObject *subcredentialProvisioningQueue;
  NSObject *v3;

  subcredentialProvisioningQueue = self->_subcredentialProvisioningQueue;
  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(subcredentialProvisioningQueue, v3);

}

- (void)_setUpSubcredentialProvisioningService
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[NPKSubcredentialProvisioningService subcredentialProvisioningQueue](self, "subcredentialProvisioningQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[NPKSubcredentialProvisioningService subcredentialService](self, "subcredentialService");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[NPKSubcredentialProvisioningService subcredentialProvisioningQueue](self, "subcredentialProvisioningQueue"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    -[NPKSubcredentialProvisioningService subcredentialService](self, "subcredentialService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKSubcredentialProvisioningService registerProtobufActionsForService:](self, "registerProtobufActionsForService:", v7);

    -[NPKSubcredentialProvisioningService subcredentialService](self, "subcredentialService");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[NPKSubcredentialProvisioningService subcredentialProvisioningQueue](self, "subcredentialProvisioningQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addDelegate:queue:", self, v8);

  }
  else
  {
    pk_General_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_General_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKSubcredentialProvisioningService subcredentialService](self, "subcredentialService");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NPKSubcredentialProvisioningService subcredentialProvisioningQueue](self, "subcredentialProvisioningQueue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v18 = v13;
        v19 = 2112;
        v20 = v14;
        v21 = 2112;
        v22 = v15;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Warning: %{public}@: Expected subcredentialProvisioningService and subcredentialProvisioningQueue to be non-nil! subcredentialProvisioningService: %@ subcredentialProvisioningQueue: %@", buf, 0x20u);

      }
    }
  }
}

- (id)_sendOptions
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE4FAC0];
  v4[0] = *MEMORY[0x24BE4FA90];
  v4[1] = v2;
  v5[0] = MEMORY[0x24BDBD1C8];
  v5[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_sendProtobuf:(id)a3 responseExpected:(BOOL)a4 extraOptions:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v6 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_General_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_General_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "npkDescription");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("NO");
      *(_DWORD *)buf = 138544130;
      v29 = v14;
      if (v6)
        v17 = CFSTR("YES");
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v17;
      v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: Sending protobuf: %@ with response expected: %@ extra options: %@", buf, 0x2Au);

    }
  }
  -[NPKSubcredentialProvisioningService _sendOptions](self, "_sendOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  if (v6)
    v20 = &unk_24D0566C0;
  else
    v20 = &unk_24D0566D0;
  objc_msgSend(v19, "setObject:forKey:", v20, *MEMORY[0x24BE4FB30]);
  if (v9)
    objc_msgSend(v19, "addEntriesFromDictionary:", v9);
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __83__NPKSubcredentialProvisioningService__sendProtobuf_responseExpected_extraOptions___block_invoke;
  v26[3] = &unk_24CFE79C0;
  v27 = v8;
  v21 = v8;
  v22 = (void *)MEMORY[0x2199B6780](v26);
  -[NPKSubcredentialProvisioningService subcredentialService](self, "subcredentialService");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  NPKProtoSendWithOptions(v23, v21, 200, 0, v6, v22, v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

void __83__NPKSubcredentialProvisioningService__sendProtobuf_responseExpected_extraOptions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_ERROR, "Error: IDS failed to send protobuf %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)_trackOutstandingRequestWithMessageIdentifier:(id)a3 completionHandler:(id)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NPKProvisioningServiceOutstandingRequest *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(NPKProvisioningServiceOutstandingRequest);
  -[NPKProvisioningServiceOutstandingRequest setCompletionHandler:](v11, "setCompletionHandler:", v9);
  -[NPKProvisioningServiceOutstandingRequest setErrorHandler:](v11, "setErrorHandler:", v10);
  -[NPKProvisioningServiceOutstandingRequest setMessageIdentifier:](v11, "setMessageIdentifier:", v8);
  objc_initWeak(&location, self);
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __116__NPKSubcredentialProvisioningService__trackOutstandingRequestWithMessageIdentifier_completionHandler_errorHandler___block_invoke;
  v18 = &unk_24CFE8538;
  objc_copyWeak(&v21, &location);
  v12 = v8;
  v19 = v12;
  v13 = v10;
  v20 = v13;
  -[NPKProvisioningServiceOutstandingRequest setTimeoutHandler:](v11, "setTimeoutHandler:", &v15);
  -[NPKProvisioningServiceOutstandingRequest setTimeoutQueue:](v11, "setTimeoutQueue:", self->_subcredentialProvisioningQueue, v15, v16, v17, v18);
  -[NPKSubcredentialProvisioningService outstandingRequests](self, "outstandingRequests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", v11, v12);

  -[NPKProvisioningServiceOutstandingRequest setOrResetCleanupTimer](v11, "setOrResetCleanupTimer");
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __116__NPKSubcredentialProvisioningService__trackOutstandingRequestWithMessageIdentifier_completionHandler_errorHandler___block_invoke(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    -[dispatch_queue_t outstandingRequests](v3, "outstandingRequests");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "errorHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[dispatch_queue_t outstandingRequests](v3, "outstandingRequests");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

    if (*(_QWORD *)(a1 + 40))
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        pk_Payment_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v18 = v11;
          _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Timed out waiting for response; invoking error handler for message %@",
            buf,
            0xCu);
        }

      }
      NPKGetIDSCommunicationError();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __116__NPKSubcredentialProvisioningService__trackOutstandingRequestWithMessageIdentifier_completionHandler_errorHandler___block_invoke_23;
      v14[3] = &unk_24CFE9188;
      v15 = v12;
      v16 = v6;
      v13 = v12;
      dispatch_async(MEMORY[0x24BDAC9B8], v14);

    }
  }

}

uint64_t __116__NPKSubcredentialProvisioningService__trackOutstandingRequestWithMessageIdentifier_completionHandler_errorHandler___block_invoke_23(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: IDS service accounts changed: %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: IDS service devices changed: %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  BOOL v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v8 = a6;
  v41 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  pk_General_log();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v30 = v20;
      v31 = 2112;
      v32 = v12;
      v33 = 2112;
      v34 = v13;
      v35 = 2112;
      v36 = v14;
      v37 = 1024;
      v38 = v8;
      v39 = 2112;
      v40 = v15;
      _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: IDS service did send with success: %@ %@ %@ %d %@", buf, 0x3Au);

    }
  }
  objc_initWeak((id *)buf, self);
  -[NPKSubcredentialProvisioningService subcredentialProvisioningQueue](self, "subcredentialProvisioningQueue");
  v21 = objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __91__NPKSubcredentialProvisioningService_service_account_identifier_didSendWithSuccess_error___block_invoke;
  v24[3] = &unk_24CFE9E98;
  objc_copyWeak(&v27, (id *)buf);
  v28 = v8;
  v25 = v14;
  v26 = v15;
  v22 = v15;
  v23 = v14;
  dispatch_async(v21, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

}

void __91__NPKSubcredentialProvisioningService_service_account_identifier_didSendWithSuccess_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "outstandingRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v4, "errorHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x2199B6780]();
      *(_DWORD *)buf = 138544130;
      v32 = v9;
      v33 = 2112;
      v34 = v10;
      v35 = 2112;
      v36 = v4;
      v37 = 2112;
      v38 = v12;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %{public}@: identifier: %@ request: %@ error handler: %@", buf, 0x2Au);

    }
  }
  if (v4 && !*(_BYTE *)(a1 + 56))
  {
    NPKGetIDSCommunicationError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
      objc_msgSend(v14, "setObject:forKey:", v16, *MEMORY[0x24BDD1398]);
    objc_msgSend(v13, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v13, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKey:", v18, *MEMORY[0x24BDD0FC8]);

    }
    v19 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v13, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, objc_msgSend(v13, "code"), v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "errorHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      dispatch_get_global_queue(0, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v25 = MEMORY[0x24BDAC760];
      v26 = 3221225472;
      v27 = __91__NPKSubcredentialProvisioningService_service_account_identifier_didSendWithSuccess_error___block_invoke_25;
      v28 = &unk_24CFE9188;
      v30 = v22;
      v29 = v21;
      dispatch_async(v23, &v25);

    }
    objc_msgSend(WeakRetained, "outstandingRequests", v25, v26, v27, v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __91__NPKSubcredentialProvisioningService_service_account_identifier_didSendWithSuccess_error___block_invoke_25(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (OS_dispatch_queue)subcredentialProvisioningQueue
{
  return self->_subcredentialProvisioningQueue;
}

- (NSMutableDictionary)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingRequests, a3);
}

- (IDSService)subcredentialService
{
  return self->_subcredentialService;
}

- (void)setSubcredentialService:(id)a3
{
  objc_storeStrong((id *)&self->_subcredentialService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentialService, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_subcredentialProvisioningQueue, 0);
}

@end
