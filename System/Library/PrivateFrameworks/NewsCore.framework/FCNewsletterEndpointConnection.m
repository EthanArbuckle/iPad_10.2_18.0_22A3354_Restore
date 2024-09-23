@implementation FCNewsletterEndpointConnection

void __82__FCNewsletterEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "configurationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__FCNewsletterEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke_2;
  v6[3] = &unk_1E463F0E8;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "fetchConfigurationIfNeededWithCompletion:", v6);

}

void __82__FCNewsletterEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  objc_msgSend(*(id *)(a1 + 32), "updateBaseURL:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)updateBaseURL:(id)a3
{
  id v4;

  +[FCBaseURLConfiguration newsletterBaseURLForConfiguration:](FCBaseURLConfiguration, "newsletterBaseURLForConfiguration:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FCNewsletterEndpointConnection setBaseURL:](self, "setBaseURL:", v4);

}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (FCNewsletterEndpointConnection)initWithConfigurationManager:(id)a3
{
  id v4;
  FCEndpointConnection *v5;
  FCNewsletterEndpointConnection *v6;

  v4 = a3;
  v5 = objc_alloc_init(FCEndpointConnection);
  v6 = -[FCNewsletterEndpointConnection initWithEndpointConnection:configurationManager:](self, "initWithEndpointConnection:configurationManager:", v5, v4);

  return v6;
}

- (FCNewsletterEndpointConnection)initWithEndpointConnection:(id)a3 configurationManager:(id)a4
{
  id v7;
  id v8;
  FCNewsletterEndpointConnection *v9;
  FCNewsletterEndpointConnection *v10;
  FCAsyncSerialQueue *v11;
  FCAsyncSerialQueue *serialQueue;
  void *v13;
  void *v14;
  _QWORD v16[4];
  FCNewsletterEndpointConnection *v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FCNewsletterEndpointConnection;
  v9 = -[FCNewsletterEndpointConnection init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointConnection, a3);
    v11 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = v11;

    objc_storeStrong((id *)&v10->_configurationManager, a4);
    -[FCNewsletterEndpointConnection configurationManager](v10, "configurationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:", v10);

    -[FCNewsletterEndpointConnection serialQueue](v10, "serialQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__FCNewsletterEndpointConnection_initWithEndpointConnection_configurationManager___block_invoke;
    v16[3] = &unk_1E463BA48;
    v17 = v10;
    objc_msgSend(v14, "enqueueBlock:", v16);

  }
  return v10;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

- (void)getNewsletterSubscriptionWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FCNewsletterEndpointConnection serialQueue](self, "serialQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__FCNewsletterEndpointConnection_getNewsletterSubscriptionWithCallbackQueue_completion___block_invoke;
  v11[3] = &unk_1E4649DB0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enqueueBlock:", v11);

}

void __88__FCNewsletterEndpointConnection_getNewsletterSubscriptionWithCallbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  double v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  (*(void (**)(uint64_t))(a2 + 16))(a2);
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "baseURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("v1/subscriptions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "endpointConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C92BC8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __88__FCNewsletterEndpointConnection_getNewsletterSubscriptionWithCallbackQueue_completion___block_invoke_2;
    v13[3] = &unk_1E4642CA8;
    v14 = v5;
    v8 = *(_QWORD *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v9 = v5;
    LODWORD(v10) = v7;
    objc_msgSend(v6, "performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:callbackQueue:completion:", v9, 0, CFSTR("Signed_GET"), 0, CFSTR("application/json"), 1, v10, v8, v13);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v11 + 16))(v11, 0, 0, v12);

    }
  }
}

void __88__FCNewsletterEndpointConnection_getNewsletterSubscriptionWithCallbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(v7, "statusCode"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v17, 0, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v11 = v10;
        else
          v11 = 0;
      }
      else
      {
        v11 = 0;
      }
      v13 = v11;

    }
    else
    {
      v13 = 0;
    }
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("enrolledTo"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("include"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *))(v14 + 16))(v14, v15, v16, v9);

    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v12 + 16))(v12, 0, 0, v8);
  }

}

- (void)newsletterSubscribeTo:(id)a3 includeArray:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[FCNewsletterEndpointConnection serialQueue](self, "serialQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__FCNewsletterEndpointConnection_newsletterSubscribeTo_includeArray_callbackQueue_completion___block_invoke;
  v19[3] = &unk_1E4646120;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "enqueueBlock:", v19);

}

void __94__FCNewsletterEndpointConnection_newsletterSubscribeTo_includeArray_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  double v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "baseURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("v1/subscriptions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = CFSTR("enrollment");
    v19[1] = CFSTR("include");
    v6 = *(_QWORD *)(a1 + 48);
    if (!v6)
      v6 = MEMORY[0x1E0C9AA60];
    v20[0] = *(_QWORD *)(a1 + 40);
    v20[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endpointConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C92BC8];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __94__FCNewsletterEndpointConnection_newsletterSubscribeTo_includeArray_callbackQueue_completion___block_invoke_2;
    v16[3] = &unk_1E4642CA8;
    v17 = v5;
    v11 = *(_QWORD *)(a1 + 56);
    v18 = *(id *)(a1 + 64);
    v12 = v5;
    LODWORD(v13) = v10;
    objc_msgSend(v8, "performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:callbackQueue:completion:", v12, 0, CFSTR("POST"), v9, CFSTR("application/json"), 1, v13, v11, v16);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 64);
    if (v14)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, 0, 0);

    }
  }
}

void __94__FCNewsletterEndpointConnection_newsletterSubscribeTo_includeArray_callbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(v7, "statusCode"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v16, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("enrolledTo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("include"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *))(v12 + 16))(v12, v13, v14, v9);

    }
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v15 + 16))(v15, 0, 0, v8);
  }

}

- (void)submitPersonalizationVector:(id)a3 withCallbackQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8)
  {
    -[FCNewsletterEndpointConnection serialQueue](self, "serialQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke_2;
    v13[3] = &unk_1E46460F8;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v16 = v11;
    objc_msgSend(v12, "enqueueBlock:", v13);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v10 + 2))(v10, 0, 0, 0, 0);
  }

}

void __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  double v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "baseURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("v1/vectors"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(_QWORD *)(a1 + 40);
    v19 = CFSTR("vector");
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endpointConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0C92BC8];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke_3;
    v16[3] = &unk_1E4642CA8;
    v17 = v5;
    v11 = *(_QWORD *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v12 = v5;
    LODWORD(v13) = v10;
    objc_msgSend(v8, "performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:callbackQueue:completion:", v12, 0, CFSTR("POST"), v9, CFSTR("application/json"), 1, v13, v11, v16);

  }
  else
  {
    v14 = *(_QWORD *)(a1 + 56);
    if (v14)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v14 + 16))(v14, 0, 0, 0);

    }
  }
}

void __91__FCNewsletterEndpointConnection_submitPersonalizationVector_withCallbackQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(v7, "statusCode"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v16, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("enrolledTo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("include"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, BOOL, void *, void *, void *))(v12 + 16))(v12, v9 == 0, v13, v14, v9);

    }
  }
  else
  {
    v15 = *(_QWORD *)(a1 + 40);
    if (v15)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id))(v15 + 16))(v15, 0, 0, 0, v8);
  }

}

- (void)deletePersonalizationVectorWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FCNewsletterEndpointConnection serialQueue](self, "serialQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__FCNewsletterEndpointConnection_deletePersonalizationVectorWithCallbackQueue_completion___block_invoke;
  v11[3] = &unk_1E4649DB0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enqueueBlock:", v11);

}

void __90__FCNewsletterEndpointConnection_deletePersonalizationVectorWithCallbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  double v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  (*(void (**)(uint64_t))(a2 + 16))(a2);
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "baseURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("v1/vectors"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "endpointConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C92BC8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __90__FCNewsletterEndpointConnection_deletePersonalizationVectorWithCallbackQueue_completion___block_invoke_2;
    v13[3] = &unk_1E4642CA8;
    v14 = v5;
    v8 = *(_QWORD *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v9 = v5;
    LODWORD(v10) = v7;
    objc_msgSend(v6, "performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:callbackQueue:completion:", v9, 0, CFSTR("Signed_DELETE"), 0, CFSTR("application/json"), 1, v10, v8, v13);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v12);

    }
  }
}

void __90__FCNewsletterEndpointConnection_deletePersonalizationVectorWithCallbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(v7, "statusCode"), *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, BOOL, void *))(v10 + 16))(v10, v9 == 0, v9);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v8);
  }

}

- (void)getWebTokenWithCallbackQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FCNewsletterEndpointConnection serialQueue](self, "serialQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__FCNewsletterEndpointConnection_getWebTokenWithCallbackQueue_completion___block_invoke;
  v11[3] = &unk_1E4649DB0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enqueueBlock:", v11);

}

void __74__FCNewsletterEndpointConnection_getWebTokenWithCallbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  double v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  (*(void (**)(uint64_t))(a2 + 16))(a2);
  objc_msgSend(*(id *)(a1 + 32), "baseURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "baseURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("v1/webToken"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "endpointConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0C92BC8];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __74__FCNewsletterEndpointConnection_getWebTokenWithCallbackQueue_completion___block_invoke_2;
    v13[3] = &unk_1E4642CA8;
    v14 = v5;
    v8 = *(_QWORD *)(a1 + 40);
    v15 = *(id *)(a1 + 48);
    v9 = v5;
    LODWORD(v10) = v7;
    objc_msgSend(v6, "performAuthenticatedHTTPRequestWithURL:valuesByHTTPHeaderField:method:data:contentType:priority:reauthenticateIfNeeded:callbackQueue:completion:", v9, 0, CFSTR("Signed_GET"), 0, CFSTR("application/json"), 1, v10, v8, v13);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    if (v11)
    {
      +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", -2000, 0);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, id))(v11 + 16))(v11, 0, v12);

    }
  }
}

void __74__FCNewsletterEndpointConnection_getWebTokenWithCallbackQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", objc_msgSend(v8, "statusCode"), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v12 = FCDefaultLog;
      if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
      {
        v19 = 138543362;
        v20 = v10;
        _os_log_error_impl(&dword_1A1B90000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch web token with error: %{public}@", (uint8_t *)&v19, 0xCu);
      }
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("diagnostics"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 != v14)
      {
        v15 = FCDefaultLog;
        if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
        {
          v19 = 138543362;
          v20 = v13;
          _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, "Fetch web token returned diagnostics: %{public}@", (uint8_t *)&v19, 0xCu);
        }
      }
    }
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("webToken"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v10);

    }
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
      (*(void (**)(uint64_t, _QWORD, id))(v18 + 16))(v18, 0, v9);
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
  -[FCNewsletterEndpointConnection serialQueue](self, "serialQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __78__FCNewsletterEndpointConnection_configurationManager_configurationDidChange___block_invoke;
  v8[3] = &unk_1E463FC88;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "enqueueBlock:", v8);

}

void __78__FCNewsletterEndpointConnection_configurationManager_configurationDidChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void (**v4)(void);

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "updateBaseURL:", v3);
  v4[2]();

}

- (FCEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
  objc_storeStrong((id *)&self->_endpointConnection, a3);
}

- (void)setSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialQueue, a3);
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (NSURL)baseURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

@end
