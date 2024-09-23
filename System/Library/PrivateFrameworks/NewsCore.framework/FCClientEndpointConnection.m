@implementation FCClientEndpointConnection

void __78__FCClientEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "configurationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__FCClientEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke_2;
  v8[3] = &unk_1E463F0E8;
  v9 = WeakRetained;
  v10 = v3;
  v6 = v3;
  v7 = WeakRetained;
  objc_msgSend(v5, "fetchConfigurationIfNeededWithCompletion:", v8);

}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

void __78__FCClientEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v6;
      _os_log_error_impl(&dword_1A1B90000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch endpoint configuration with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "updateBaseURLWith:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateBaseURLWith:(id)a3
{
  id v4;

  +[FCBaseURLConfiguration CAPIBaseURLForConfiguration:](FCBaseURLConfiguration, "CAPIBaseURLForConfiguration:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCClientEndpointConnection setBaseURL:](self, "setBaseURL:", v4);

}

- (void)setBaseURL:(id)a3
{
  objc_storeStrong((id *)&self->_baseURL, a3);
}

- (FCClientEndpointConnection)initWithConfigurationManager:(id)a3
{
  id v4;
  FCEndpointConnection *v5;
  FCClientEndpointConnection *v6;

  v4 = a3;
  v5 = objc_alloc_init(FCEndpointConnection);
  v6 = -[FCClientEndpointConnection initWithEndpointConnection:configurationManager:](self, "initWithEndpointConnection:configurationManager:", v5, v4);

  return v6;
}

- (FCClientEndpointConnection)initWithEndpointConnection:(id)a3 configurationManager:(id)a4
{
  id v7;
  id v8;
  FCClientEndpointConnection *v9;
  FCClientEndpointConnection *v10;
  FCAsyncSerialQueue *v11;
  FCAsyncSerialQueue *serialQueue;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FCClientEndpointConnection;
  v9 = -[FCClientEndpointConnection init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointConnection, a3);
    objc_storeStrong((id *)&v10->_configurationManager, a4);
    v11 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = v11;

    -[FCClientEndpointConnection configurationManager](v10, "configurationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", v10);

    objc_initWeak(&location, v10);
    -[FCClientEndpointConnection serialQueue](v10, "serialQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __78__FCClientEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke;
    v16[3] = &unk_1E463FBE8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v14, "enqueueBlock:", v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

- (void)reportConcernV2:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[FCClientEndpointConnection serialQueue](self, "serialQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__FCClientEndpointConnection_reportConcernV2_callbackQueue_completion___block_invoke;
  v15[3] = &unk_1E463FC38;
  objc_copyWeak(&v19, &location);
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v11, "enqueueBlock:", v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __71__FCClientEndpointConnection_reportConcernV2_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(_QWORD);
  id v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "baseURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("v2/userConcern"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "endpointConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C92BC8];
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__FCClientEndpointConnection_reportConcernV2_callbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E463FC10;
    v17 = v7;
    v18 = v3;
    v19 = *(id *)(a1 + 48);
    v12 = v7;
    LODWORD(v13) = v9;
    objc_msgSend(v8, "performHTTPRequestWithURL:method:data:contentType:priority:requiresMescalSigning:callbackQueue:completion:", v12, CFSTR("POST"), v10, CFSTR("application/json"), 1, v11, v13, v16);

  }
  else
  {
    v3[2](v3);
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

    }
  }

}

void __71__FCClientEndpointConnection_reportConcernV2_callbackQueue_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  if (a3)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(a3, "statusCode"), a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();
    v7 = a1[6];
    if (v7)
      (*(void (**)(uint64_t, BOOL, void *))(v7 + 16))(v7, v6 == 0, v6);

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    v8 = a1[6];
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);
  }

}

- (void)reportConcern:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[FCClientEndpointConnection serialQueue](self, "serialQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__FCClientEndpointConnection_reportConcern_callbackQueue_completion___block_invoke;
  v15[3] = &unk_1E463FC38;
  objc_copyWeak(&v19, &location);
  v12 = v8;
  v16 = v12;
  v13 = v9;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v11, "enqueueBlock:", v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __69__FCClientEndpointConnection_reportConcern_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(_QWORD);
  id v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "baseURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("reportConcern"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "endpointConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C92BC8];
    v11 = *(_QWORD *)(a1 + 40);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __69__FCClientEndpointConnection_reportConcern_callbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E463FC60;
    v17 = v7;
    v18 = v3;
    v19 = *(id *)(a1 + 48);
    v12 = v7;
    LODWORD(v13) = v10;
    objc_msgSend(v8, "performHTTPRequestWithURL:method:data:contentType:priority:requiresMescalSigning:callbackQueue:completion:", v12, CFSTR("POST"), v9, CFSTR("application/x-protobuf"), 1, v11, v13, v16);

  }
  else
  {
    v3[2](v3);
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

    }
  }

}

void __69__FCClientEndpointConnection_reportConcern_callbackQueue_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = a4;
  (*(void (**)(void))(a1[5] + 16))();
  if (v10)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(v10, "statusCode"), a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[6];
    if (v8)
      (*(void (**)(uint64_t, BOOL, void *))(v8 + 16))(v8, v7 == 0, v7);

  }
  else
  {
    v9 = a1[6];
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }

}

- (void)submitWebAccessWithTagID:(id)a3 purchaseID:(id)a4 emailAddress:(id)a5 purchaseReceipt:(id)a6 countryCode:(id)a7 languageCode:(id)a8 callbackQueue:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id location;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = objc_alloc_init(MEMORY[0x1E0D627B8]);
  objc_msgSend(v23, "setChannelId:", v15);
  objc_msgSend(v23, "setIapId:", v16);
  objc_msgSend(v23, "setEmail:", v17);
  objc_msgSend(v23, "setPurchaseReceipt:", v18);
  objc_msgSend(v23, "setCountry:", v19);
  objc_msgSend(v23, "setLanguage:", v20);
  objc_initWeak(&location, self);
  -[FCClientEndpointConnection serialQueue](self, "serialQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __145__FCClientEndpointConnection_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_countryCode_languageCode_callbackQueue_completion___block_invoke;
  v29[3] = &unk_1E463FC38;
  objc_copyWeak(&v33, &location);
  v25 = v23;
  v30 = v25;
  v26 = v21;
  v31 = v26;
  v27 = v22;
  v32 = v27;
  objc_msgSend(v24, "enqueueBlock:", v29);

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

}

void __145__FCClientEndpointConnection_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_countryCode_languageCode_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  double v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  void (**v18)(_QWORD);
  id v19;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(WeakRetained, "baseURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("publisherWebAccessOptIn"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "endpointConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C92BC8];
    v11 = *(_QWORD *)(a1 + 40);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __145__FCClientEndpointConnection_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_countryCode_languageCode_callbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E463FC10;
    v17 = v7;
    v18 = v3;
    v19 = *(id *)(a1 + 48);
    v12 = v7;
    LODWORD(v13) = v10;
    objc_msgSend(v8, "performHTTPRequestWithURL:method:data:contentType:priority:requiresMescalSigning:callbackQueue:completion:", v12, CFSTR("POST"), v9, CFSTR("application/x-protobuf"), 1, v11, v13, v16);

  }
  else
  {
    v3[2](v3);
    v14 = *(_QWORD *)(a1 + 48);
    if (v14)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v15);

    }
  }

}

void __145__FCClientEndpointConnection_submitWebAccessWithTagID_purchaseID_emailAddress_purchaseReceipt_countryCode_languageCode_callbackQueue_completion___block_invoke_2(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  if (a3)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(a3, "statusCode"), a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[5] + 16))();
    v7 = a1[6];
    if (v7)
      (*(void (**)(uint64_t, BOOL, void *))(v7 + 16))(v7, v6 == 0, v6);

  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    v8 = a1[6];
    if (v8)
      (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v9);
  }

}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[FCClientEndpointConnection serialQueue](self, "serialQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__FCClientEndpointConnection_configurationManager_configurationDidChange___block_invoke;
  v8[3] = &unk_1E463FC88;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enqueueBlock:", v8);

}

void __74__FCClientEndpointConnection_configurationManager_configurationDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void (**v4)(void);

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "updateBaseURLWith:", v3);
  v4[2]();

}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (FCEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnection, a3);
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
