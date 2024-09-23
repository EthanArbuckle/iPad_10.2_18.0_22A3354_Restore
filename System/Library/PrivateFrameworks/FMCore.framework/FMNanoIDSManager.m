@implementation FMNanoIDSManager

- (FMNanoIDSManager)initWithServiceId:(id)a3 minimumVersion:(int64_t)a4
{
  id v7;
  FMNanoIDSManager *v8;
  FMNanoIDSManager *v9;
  uint64_t v10;
  NSMutableDictionary *outstandingRequests;
  dispatch_queue_t v12;
  OS_dispatch_queue *outstandingRequestsModQueue;
  uint64_t v14;
  NSMutableDictionary *registeredRequestHandlers;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMNanoIDSManager;
  v8 = -[FMNanoIDSManager init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_serviceId, a3);
    if ((unint64_t)a4 <= 4)
      v9->_minVersion = dword_1C997EC58[a4];
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    outstandingRequests = v9->_outstandingRequests;
    v9->_outstandingRequests = (NSMutableDictionary *)v10;

    v12 = dispatch_queue_create("com.apple.icloud.fmcore.nano_ids_mod_queue", 0);
    outstandingRequestsModQueue = v9->_outstandingRequestsModQueue;
    v9->_outstandingRequestsModQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    registeredRequestHandlers = v9->_registeredRequestHandlers;
    v9->_registeredRequestHandlers = (NSMutableDictionary *)v14;

  }
  return v9;
}

- (void)start
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  -[FMNanoIDSManager service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D34358]);
    -[FMNanoIDSManager serviceId](self, "serviceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithService:", v5);
    -[FMNanoIDSManager setService:](self, "setService:", v6);

    -[FMNanoIDSManager service](self, "service");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addDelegate:queue:", self, MEMORY[0x1E0C80D38]);

  }
}

- (NSArray)devices
{
  void *v2;
  void *v3;

  -[FMNanoIDSManager service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)sendMessageWithProtobuf:(id)a3 inResponseToRequest:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 bypassingDuet:(BOOL)a7 requestAcceptedHandler:(id)a8 responseHandler:(id)a9
{
  -[FMNanoIDSManager sendMessageWithProtobuf:inResponseToRequest:withPriority:timeout:bypassingDuet:deviceID:requestAcceptedHandler:responseHandler:](self, "sendMessageWithProtobuf:inResponseToRequest:withPriority:timeout:bypassingDuet:deviceID:requestAcceptedHandler:responseHandler:", a3, a4, a5, a7, 0, a8, a6, a9);
}

- (void)sendMessageWithProtobuf:(id)a3 inResponseToRequest:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 bypassingDuet:(BOOL)a7 deviceID:(id)a8 requestAcceptedHandler:(id)a9 responseHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int64_t v34;
  double v35;
  BOOL v36;

  v17 = a3;
  v18 = a4;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  dispatch_get_global_queue(0, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __147__FMNanoIDSManager_sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_requestAcceptedHandler_responseHandler___block_invoke;
  block[3] = &unk_1E82AA6C0;
  block[4] = self;
  v29 = v19;
  v33 = v20;
  v34 = a5;
  v30 = v17;
  v31 = v18;
  v35 = a6;
  v36 = a7;
  v32 = v21;
  v23 = v20;
  v24 = v18;
  v25 = v17;
  v26 = v21;
  v27 = v19;
  dispatch_async(v22, block);

}

void __147__FMNanoIDSManager_sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_requestAcceptedHandler_responseHandler___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_checkMinVersionDeviceID:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 80);
    if (v2 > 2)
      v3 = 0;
    else
      v3 = qword_1C997EC70[v2];
    objc_msgSend(*(id *)(a1 + 32), "_sendMessageWithProtobuf:inResponseToRequest:withPriority:timeout:bypassingDuet:deviceID:responseHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3, *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(double *)(a1 + 88));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 72);
    if (v9)
    {
      if (v8)
      {
        v10 = v8;
        (*(void (**)(void))(v9 + 16))();
        v8 = v10;
      }
    }

  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2D68];
      v12[0] = CFSTR("Min Version check failed");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("com.apple.icloud.FMCore"), 0, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v4 + 16))(v4, 0, 0, 0, v7);

    }
  }
}

- (id)_sendMessageWithProtobuf:(id)a3 inResponseToRequest:(id)a4 withPriority:(int64_t)a5 timeout:(double)a6 bypassingDuet:(BOOL)a7 deviceID:(id)a8 responseHandler:(id)a9
{
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  FMNanoIDSRequest *v22;
  void *v23;
  uint64_t v24;
  FMDispatchTimer *v25;
  void *v26;
  FMDispatchTimer *v27;
  NSObject *v28;
  FMNanoIDSRequest *v29;
  _QWORD block[5];
  id v32;
  FMNanoIDSRequest *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id location;

  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  -[FMNanoIDSManager _sendProtobuf:priority:responseIdentifier:expectsResponse:bypassingDuet:deviceID:](self, "_sendProtobuf:priority:responseIdentifier:expectsResponse:bypassingDuet:deviceID:", v16, a5, v17, v19 != 0, v11, v18);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  if (v19 && v20)
  {
    v22 = objc_alloc_init(FMNanoIDSRequest);
    v23 = (void *)objc_msgSend(v19, "copy");
    -[FMNanoIDSRequest setResponseHandler:](v22, "setResponseHandler:", v23);

    -[FMNanoIDSRequest setIdsMessageID:](v22, "setIdsMessageID:", v21);
    v24 = MEMORY[0x1E0C809B0];
    if (a6 <= 0.0)
    {
      v27 = 0;
    }
    else
    {
      objc_initWeak(&location, self);
      v25 = [FMDispatchTimer alloc];
      dispatch_get_global_queue(0, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __125__FMNanoIDSManager__sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_responseHandler___block_invoke;
      v34[3] = &unk_1E82AA6E8;
      objc_copyWeak(&v37, &location);
      v35 = v21;
      v36 = v19;
      v27 = -[FMDispatchTimer initWithQueue:timeout:completion:](v25, "initWithQueue:timeout:completion:", v26, v34, a6);

      -[FMNanoIDSRequest setTimer:](v22, "setTimer:", v27);
      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);
      v24 = MEMORY[0x1E0C809B0];
    }
    -[FMNanoIDSManager outstandingRequestsModQueue](self, "outstandingRequestsModQueue");
    v28 = objc_claimAutoreleasedReturnValue();
    block[0] = v24;
    block[1] = 3221225472;
    block[2] = __125__FMNanoIDSManager__sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_responseHandler___block_invoke_2;
    block[3] = &unk_1E82AA710;
    block[4] = self;
    v32 = v21;
    v33 = v22;
    v29 = v22;
    dispatch_sync(v28, block);

    -[FMDispatchTimer start](v27, "start");
  }

  return v21;
}

void __125__FMNanoIDSManager__sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "cancelMessageWithId:", *(_QWORD *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, 0, 1, 0, 0);

}

void __125__FMNanoIDSManager__sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_deviceID_responseHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "outstandingRequests");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (BOOL)cancelMessageWithId:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  LogCategory_Unspecified();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1C9967000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling message with ID %@", buf, 0xCu);
  }

  -[FMNanoIDSManager outstandingRequests](self, "outstandingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cancel");

  LogCategory_Unspecified();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("YES");
    if (!v7)
      v10 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v20 = v4;
    v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_1C9967000, v9, OS_LOG_TYPE_DEFAULT, "Did find outstanding message to cancel with ID %@ : %@", buf, 0x16u);
  }

  -[FMNanoIDSManager service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v11, "cancelIdentifier:error:", v4, &v18);
  v12 = v18;

  -[FMNanoIDSManager outstandingRequestsModQueue](self, "outstandingRequestsModQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__FMNanoIDSManager_cancelMessageWithId___block_invoke;
  block[3] = &unk_1E82AA4B8;
  block[4] = self;
  v17 = v4;
  v14 = v4;
  dispatch_sync(v13, block);

  return v7 != 0;
}

void __40__FMNanoIDSManager_cancelMessageWithId___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "outstandingRequests");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)handleRequestsOfType:(unsigned __int16)a3 withHandler:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = (id)objc_msgSend(a4, "copy");
  v6 = (void *)MEMORY[0x1CAA45B8C]();
  -[FMNanoIDSManager registeredRequestHandlers](self, "registeredRequestHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  int v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  NSObject *v33;
  _QWORD block[5];
  id v35;
  uint8_t buf[4];
  _DWORD v37[7];

  *(_QWORD *)&v37[5] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v12 = a7;
  objc_msgSend(v12, "incomingResponseIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LogCategory_Unspecified();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v37[0] = objc_msgSend(v10, "type");
    LOWORD(v37[1]) = 2112;
    *(_QWORD *)((char *)&v37[1] + 2) = v13;
    _os_log_impl(&dword_1C9967000, v14, OS_LOG_TYPE_DEFAULT, "Received request of type %d with message ID %@", buf, 0x12u);
  }

  if (!v13)
  {
    -[FMNanoIDSManager registeredRequestHandlers](self, "registeredRequestHandlers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v10, "type"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      dispatch_get_global_queue(21, 0);
      v23 = objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __77__FMNanoIDSManager_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke_40;
      v29[3] = &unk_1E82AA738;
      v33 = v16;
      v29[4] = self;
      v30 = v10;
      v31 = v12;
      v32 = v11;
      dispatch_async(v23, v29);

      v24 = v33;
    }
    else
    {
      LogCategory_Unspecified();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v28 = objc_msgSend(v10, "type");
        *(_DWORD *)buf = 67109120;
        v37[0] = v28;
        v25 = "No handler found for request of type %d. Ignoring the request...";
        v26 = v24;
        v27 = 8;
        goto LABEL_14;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  -[FMNanoIDSManager outstandingRequests](self, "outstandingRequests");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    LogCategory_Unspecified();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v37 = v13;
      v25 = "No outstanding request with message ID %@";
      v26 = v24;
      v27 = 12;
LABEL_14:
      _os_log_impl(&dword_1C9967000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  objc_msgSend(v16, "timer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cancel");

  -[FMNanoIDSManager outstandingRequestsModQueue](self, "outstandingRequestsModQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__FMNanoIDSManager_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke;
  block[3] = &unk_1E82AA4B8;
  block[4] = self;
  v35 = v13;
  dispatch_sync(v18, block);

  objc_msgSend(v16, "responseHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v16, "responseHandler");
    v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD, id, _QWORD))v20)[2](v20, v10, 0, v11, 0);

  }
LABEL_16:

}

void __77__FMNanoIDSManager_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "outstandingRequests");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __77__FMNanoIDSManager_service_account_incomingUnhandledProtobuf_fromID_context___block_invoke_40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "outgoingResponseIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t, id, _QWORD))(v2 + 16))(v2, v3, v4, v5, *(_QWORD *)(a1 + 56));

}

- (id)_sendProtobuf:(id)a3 priority:(int64_t)a4 responseIdentifier:(id)a5 expectsResponse:(BOOL)a6 bypassingDuet:(BOOL)a7 deviceID:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  int v28;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v9 = a7;
  v10 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v15)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D34198]);
  if (v10)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34158]);
  if (v9)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D34130]);
  if (v16)
    v19 = v16;
  else
    v19 = (id)*MEMORY[0x1E0D345D0];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMNanoIDSManager service](self, "service");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = 0;
  v22 = objc_msgSend(v21, "sendProtobuf:toDestinations:priority:options:identifier:error:", v14, v20, a4, v18, &v31, &v30);
  v23 = v31;
  v24 = v30;

  LogCategory_Unspecified();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if ((v22 & 1) != 0 || !v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_msgSend(v14, "type");
      *(_DWORD *)buf = 138412802;
      v33 = v20;
      v34 = 1024;
      v35 = v28;
      v36 = 2112;
      v37 = v23;
      _os_log_impl(&dword_1C9967000, v26, OS_LOG_TYPE_DEFAULT, "Sent message to %@ of type %d with id %@", buf, 0x1Cu);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v27 = objc_msgSend(v14, "type");
    *(_DWORD *)buf = 138412802;
    v33 = v20;
    v34 = 1024;
    v35 = v27;
    v36 = 2112;
    v37 = v24;
    _os_log_error_impl(&dword_1C9967000, v26, OS_LOG_TYPE_ERROR, "Error sending the message to %@ of type %d : %@", buf, 0x1Cu);
  }

  return v23;
}

- (BOOL)_checkMinVersionDeviceID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  NSObject *v10;
  unsigned int v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  BOOL v15;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__0;
  v24 = __Block_byref_object_dispose__0;
  v25 = 0;
  if (v4)
  {
    -[FMNanoIDSManager devices](self, "devices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogCategory_Unspecified();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FMNanoIDSManager _checkMinVersionDeviceID:].cold.1(v6);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__FMNanoIDSManager__checkMinVersionDeviceID___block_invoke;
    v17[3] = &unk_1E82AA760;
    v18 = v4;
    v19 = &v20;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
    v7 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getActivePairedDevice");
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v21[5];
    v21[5] = v8;
  }

  if (v21[5])
  {
    v9 = NRWatchOSVersionForRemoteDevice();
    if (v9 >= -[FMNanoIDSManager minVersion](self, "minVersion"))
    {
      v15 = 1;
      goto LABEL_15;
    }
    LogCategory_Unspecified();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[FMNanoIDSManager minVersion](self, "minVersion");
      *(_DWORD *)buf = 67109376;
      v27 = v9;
      v28 = 1024;
      v29 = v11;
      v12 = "Paired device version %X is older the minuimum supported version %X";
      v13 = v10;
      v14 = 14;
LABEL_12:
      _os_log_impl(&dword_1C9967000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    }
  }
  else
  {
    LogCategory_Unspecified();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "No paired device version found";
      v13 = v10;
      v14 = 2;
      goto LABEL_12;
    }
  }

  v15 = 0;
LABEL_15:
  _Block_object_dispose(&v20, 8);

  return v15;
}

void __45__FMNanoIDSManager__checkMinVersionDeviceID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a2;
  v7 = (void *)IDSCopyIDForDevice();
  LogCategory_Unspecified();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __45__FMNanoIDSManager__checkMinVersionDeviceID___block_invoke_cold_1((uint64_t)v7, a1, v8);

  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceForIDSDevice:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }

}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
  objc_storeStrong((id *)&self->_serviceId, a3);
}

- (unsigned)minVersion
{
  return self->_minVersion;
}

- (void)setMinVersion:(unsigned int)a3
{
  self->_minVersion = a3;
}

- (NSMutableDictionary)outstandingRequests
{
  return self->_outstandingRequests;
}

- (void)setOutstandingRequests:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingRequests, a3);
}

- (NSMutableDictionary)registeredRequestHandlers
{
  return self->_registeredRequestHandlers;
}

- (void)setRegisteredRequestHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_registeredRequestHandlers, a3);
}

- (OS_dispatch_queue)outstandingRequestsModQueue
{
  return self->_outstandingRequestsModQueue;
}

- (void)setOutstandingRequestsModQueue:(id)a3
{
  objc_storeStrong((id *)&self->_outstandingRequestsModQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outstandingRequestsModQueue, 0);
  objc_storeStrong((id *)&self->_registeredRequestHandlers, 0);
  objc_storeStrong((id *)&self->_outstandingRequests, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

- (void)_checkMinVersionDeviceID:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9967000, log, OS_LOG_TYPE_DEBUG, "Scanning through paired IDS devices to validate min version.", v1, 2u);
}

void __45__FMNanoIDSManager__checkMinVersionDeviceID___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a2 + 32);
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1C9967000, log, OS_LOG_TYPE_DEBUG, "Comparing %@ to %@ IDS identifiers", (uint8_t *)&v4, 0x16u);
}

@end
