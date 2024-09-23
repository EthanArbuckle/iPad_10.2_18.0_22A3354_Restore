@implementation AXLTClient

- (AXLTClient)init
{
  AXLTClient *v2;
  AXLTClient *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *clientQueue;
  uint64_t v7;
  NSMutableDictionary *dataReceivers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXLTClient;
  v2 = -[AXLTClient init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AXLTClient initializeServiceConnection](v2, "initializeServiceConnection");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.accessibility.liveTranscriptionClient.clientQueue", v4);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v5;

    v7 = objc_opt_new();
    dataReceivers = v3->_dataReceivers;
    v3->_dataReceivers = (NSMutableDictionary *)v7;

  }
  return v3;
}

- (void)initializeServiceConnection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.accessibility.LiveTranscriptionService"));
  -[AXLTClient setServiceConnection:](self, "setServiceConnection:", v3);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255D6CF18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_startTranscriptionWithRequestType_clientPID_withReply_, 1, 1);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_stopTranscriptionWithRequestType_clientPID_withReply_, 1, 1);

  v7 = objc_alloc(MEMORY[0x24BDBCF20]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_filterTranscriptionForApps_, 0, 0);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_startTranscriptionWithRequestType_targetPID_clientPID_withReply_, 1, 1);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_stopTranscriptionWithRequestType_targetPID_clientPID_withReply_, 1, 1);

  -[AXLTClient serviceConnection](self, "serviceConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemoteObjectInterface:", v4);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255D6B458);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v13, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_transcribedData_, 0, 0);

  -[AXLTClient serviceConnection](self, "serviceConnection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setExportedInterface:", v13);

  -[AXLTClient serviceConnection](self, "serviceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setExportedObject:", self);

  -[AXLTClient serviceConnection](self, "serviceConnection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "resume");

  objc_initWeak(&location, self);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __41__AXLTClient_initializeServiceConnection__block_invoke;
  v20[3] = &unk_24F875148;
  objc_copyWeak(&v21, &location);
  -[AXLTClient serviceConnection](self, "serviceConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setInterruptionHandler:", v20);

  -[AXLTClient serviceConnection](self, "serviceConnection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setInvalidationHandler:", &__block_literal_global_5);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __41__AXLTClient_initializeServiceConnection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  AXLogLiveTranscription();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22D27A000, v2, OS_LOG_TYPE_INFO, "LiveTranscriptionService interrupted, re-initializing connection", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "initializeServiceConnection");
  objc_msgSend(WeakRetained, "registerForTranscriptionIfNecessary");

}

void __41__AXLTClient_initializeServiceConnection__block_invoke_210()
{
  NSObject *v0;
  uint8_t v1[16];

  AXLogLiveTranscription();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22D27A000, v0, OS_LOG_TYPE_INFO, "LiveTranscriptionService invalidated", v1, 2u);
  }

}

- (void)registerForTranscriptionIfNecessary
{
  void *v7;

  objc_msgSend(a2, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_22D27A000, a4, OS_LOG_TYPE_ERROR, "unable to register for transcription: %@", a1, 0xCu);

}

- (BOOL)startTranscribing:(int64_t)a3 client:(id)a4 callbackBlock:(id)a5 error:(id *)a6
{
  return -[AXLTClient startTranscribing:targetPID:client:callbackBlock:error:](self, "startTranscribing:targetPID:client:callbackBlock:error:", a3, 0xFFFFFFFFLL, a4, a5, a6);
}

- (BOOL)startTranscribing:(int64_t)a3 targetPID:(int)a4 client:(id)a5 callbackBlock:(id)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  AXLTTranscribedDataReceiver *v24;
  NSObject *v25;
  AXLTTranscribedDataReceiver *v26;
  _QWORD block[5];
  id v29;
  AXLTTranscribedDataReceiver *v30;
  _QWORD v31[6];
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  _BYTE buf[32];
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  _QWORD v48[4];

  v9 = *(_QWORD *)&a4;
  v48[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  AXLogLiveTranscription();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v12, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v9;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v15;
    _os_log_impl(&dword_22D27A000, v14, OS_LOG_TYPE_INFO, "startTranscribing request: %ld, targetPID: %d, client: %@", buf, 0x1Cu);

  }
  if (!v13)
  {
    v19 = (void *)MEMORY[0x24BDD1540];
    v47 = *MEMORY[0x24BDD0BA0];
    v48[0] = CFSTR("callback handler is nil");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.accessibility.LiveTranscription"), 1, v20);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    v23 = 0;
    goto LABEL_17;
  }
  if (!v12)
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v45 = *MEMORY[0x24BDD0BA0];
    v46 = CFSTR("client uuid is nil");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.accessibility.LiveTranscription"), 3, v22);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = 0;
  -[AXLTClient serviceConnection](self, "serviceConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v37[0] = MEMORY[0x24BDAC760];
  v37[1] = 3221225472;
  v37[2] = __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke;
  v37[3] = &unk_24F875190;
  v37[4] = buf;
  v37[5] = &v38;
  objc_msgSend(v16, "synchronousRemoteObjectProxyWithErrorHandler:", v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (*((_BYTE *)v39 + 24))
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 1;
    if ((_DWORD)v9 == -1)
    {
      v31[0] = v17;
      v31[1] = 3221225472;
      v31[2] = __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_221;
      v31[3] = &unk_24F8751B8;
      v31[4] = buf;
      v31[5] = &v33;
      objc_msgSend(v18, "startTranscriptionWithRequestType:clientPID:withReply:", a3, getpid(), v31);
    }
    else
    {
      v32[0] = v17;
      v32[1] = 3221225472;
      v32[2] = __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_219;
      v32[3] = &unk_24F8751B8;
      v32[4] = buf;
      v32[5] = &v33;
      objc_msgSend(v18, "startTranscriptionWithRequestType:targetPID:clientPID:withReply:", a3, v9, getpid(), v32);
    }
    if (*((_BYTE *)v34 + 24))
    {
      v24 = -[AXLTTranscribedDataReceiver initWithRequestType:targetPID:handler:audioInfoBlock:]([AXLTTranscribedDataReceiver alloc], "initWithRequestType:targetPID:handler:audioInfoBlock:", a3, v9, v13, &__block_literal_global_225);
      -[AXLTClient clientQueue](self, "clientQueue");
      v25 = objc_claimAutoreleasedReturnValue();
      block[0] = v17;
      block[1] = 3221225472;
      block[2] = __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_2;
      block[3] = &unk_24F875220;
      block[4] = self;
      v29 = v12;
      v30 = v24;
      v26 = v24;
      dispatch_sync(v25, block);

    }
    *a7 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    v23 = *((_BYTE *)v34 + 24) != 0;
    _Block_object_dispose(&v33, 8);
  }
  else
  {
    v23 = 0;
    *a7 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
  }

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v38, 8);
LABEL_17:

  return v23;
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_219(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  if (a2)
  {
    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_219_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_219_cold_2(v6);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_221(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  if (a2)
  {
    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_219_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_219_cold_2(v6);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "dataReceivers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 40));

}

- (BOOL)stopTranscribing:(int64_t)a3 client:(id)a4 error:(id *)a5
{
  return -[AXLTClient stopTranscribing:targetPID:client:error:](self, "stopTranscribing:targetPID:client:error:", a3, 0xFFFFFFFFLL, a4, a5);
}

- (BOOL)stopTranscribing:(int64_t)a3 targetPID:(int)a4 client:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[6];
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _QWORD v27[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD block[5];
  id v33;
  _BYTE buf[32];
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  _QWORD v38[2];

  v7 = *(_QWORD *)&a4;
  v38[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  AXLogLiveTranscription();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v10, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v7;
    *(_WORD *)&buf[18] = 2112;
    *(_QWORD *)&buf[20] = v12;
    _os_log_impl(&dword_22D27A000, v11, OS_LOG_TYPE_INFO, "stopTranscribing request: %ld, targetPID: %d, client: %@", buf, 0x1Cu);

  }
  if (v10)
  {
    -[AXLTClient clientQueue](self, "clientQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke;
    block[3] = &unk_24F874E58;
    block[4] = self;
    v33 = v10;
    dispatch_sync(v13, block);

    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 1;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy_;
    v35 = __Block_byref_object_dispose_;
    v36 = 0;
    -[AXLTClient serviceConnection](self, "serviceConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_2;
    v27[3] = &unk_24F875190;
    v27[4] = buf;
    v27[5] = &v28;
    objc_msgSend(v15, "synchronousRemoteObjectProxyWithErrorHandler:", v27);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v29 + 24))
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 1;
      if ((_DWORD)v7 == -1)
      {
        v21[0] = v14;
        v21[1] = 3221225472;
        v21[2] = __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_227;
        v21[3] = &unk_24F8751B8;
        v21[4] = buf;
        v21[5] = &v23;
        objc_msgSend(v16, "stopTranscriptionWithRequestType:clientPID:withReply:", a3, getpid(), v21);
      }
      else
      {
        v22[0] = v14;
        v22[1] = 3221225472;
        v22[2] = __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_226;
        v22[3] = &unk_24F8751B8;
        v22[4] = buf;
        v22[5] = &v23;
        objc_msgSend(v16, "stopTranscriptionWithRequestType:targetPID:clientPID:withReply:", a3, v7, getpid(), v22);
      }
      *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      v19 = *((_BYTE *)v24 + 24) != 0;
      _Block_object_dispose(&v23, 8);
    }
    else
    {
      v19 = 0;
      *a6 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    }

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v37 = *MEMORY[0x24BDD0BA0];
    v38[0] = CFSTR("client uuid is nil");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.accessibility.LiveTranscription"), 3, v18);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
  }

  return v19;
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "dataReceivers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_cold_1(v3);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;
  v7 = v3;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_226(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  if (a2)
  {
    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_226_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_226_cold_2(v6);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_227(uint64_t a1, int a2, void *a3)
{
  id v6;
  NSObject *v7;

  v6 = a3;
  if (a2)
  {
    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_226_cold_1();
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_226_cold_2(v6);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
}

- (void)pingServiceWithHandler:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[AXLTClient serviceConnection](self, "serviceConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __37__AXLTClient_pingServiceWithHandler___block_invoke;
  v13[3] = &unk_24F875248;
  v7 = v4;
  v14 = v7;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = getpid();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __37__AXLTClient_pingServiceWithHandler___block_invoke_228;
  v11[3] = &unk_24F875270;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v8, "pingFromClient:withReply:", v9, v11);

}

void __37__AXLTClient_pingServiceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __37__AXLTClient_pingServiceWithHandler___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __37__AXLTClient_pingServiceWithHandler___block_invoke_228(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __37__AXLTClient_pingServiceWithHandler___block_invoke_228_cold_1();

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)transcribedData:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AXLTClient *v9;

  v4 = a3;
  -[AXLTClient clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __30__AXLTClient_transcribedData___block_invoke;
  v7[3] = &unk_24F874E58;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __30__AXLTClient_transcribedData___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void (**v11)(_QWORD, _QWORD);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __30__AXLTClient_transcribedData___block_invoke_cold_1(a1, v2);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "dataReceivers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "requestType");
        if (v10 == objc_msgSend(*(id *)(a1 + 32), "requestType"))
        {
          objc_msgSend(v9, "callbackBlock");
          v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v11[2](v11, *(_QWORD *)(a1 + 32));

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (NSXPCConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serviceConnection, a3);
}

- (NSMutableDictionary)dataReceivers
{
  return self->_dataReceivers;
}

- (void)setDataReceivers:(id)a3
{
  objc_storeStrong((id *)&self->_dataReceivers, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_dataReceivers, 0);
  objc_storeStrong((id *)&self->_serviceConnection, 0);
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_22D27A000, v2, v3, "unable to get service object: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_219_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "registered to get transcription data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __69__AXLTClient_startTranscribing_targetPID_client_callbackBlock_error___block_invoke_219_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_22D27A000, v2, v3, "unable to start transcription: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_226_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "unregistered to get transcription data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __54__AXLTClient_stopTranscribing_targetPID_client_error___block_invoke_226_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_22D27A000, v2, v3, "unable to stop transcription: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __37__AXLTClient_pingServiceWithHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_22D27A000, v2, v3, "unable to get service object: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __37__AXLTClient_pingServiceWithHandler___block_invoke_228_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22D27A000, v0, v1, "Response: %@", v2);
}

void __30__AXLTClient_transcribedData___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "transcribedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22D27A000, a2, v4, "received data with text: %@", v5);

  OUTLINED_FUNCTION_9();
}

@end
