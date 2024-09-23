@implementation LBAudioCapture

- (LBAudioCapture)initWithQueue:(id)a3
{
  id v5;
  LBAudioCapture *v6;
  LBAudioCapture *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LBAudioCapture;
  v6 = -[LBAudioCapture init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queue, a3);

  return v7;
}

- (void)startAudioCaptureWithRecordContext:(id)a3 startHostTime:(unint64_t)a4 siriSessionUUID:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  CSXPCClient *xpcClient;
  void *v20;
  objc_class *v21;
  CSXPCClient *v22;
  CSXPCClient *v23;
  char v24;
  id v25;
  CSXPCClient *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE buf[24];
  void *v39;
  _QWORD v40[4];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    objc_msgSend(v10, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[LBAudioCapture startAudioCaptureWithRecordContext:startHostTime:siriSessionUUID:completion:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2048;
    v39 = (void *)a4;
    LOWORD(v40[0]) = 2112;
    *(_QWORD *)((char *)v40 + 2) = v11;
    _os_log_impl(&dword_2141AA000, v14, OS_LOG_TYPE_DEFAULT, "%s start audio capture with recordContext : %{public}@, hostTime : %llu siriSessionUUID:%@", buf, 0x2Au);

  }
  v16 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __94__LBAudioCapture_startAudioCaptureWithRecordContext_startHostTime_siriSessionUUID_completion___block_invoke;
  v32[3] = &unk_24D170808;
  v17 = v12;
  v33 = v17;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199CAD80](v32);
  xpcClient = self->_xpcClient;
  if (!xpcClient)
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v20 = (void *)getCSXPCClientClass_softClass;
    v37 = getCSXPCClientClass_softClass;
    if (!getCSXPCClientClass_softClass)
    {
      *(_QWORD *)buf = v16;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getCSXPCClientClass_block_invoke;
      v39 = &unk_24D170928;
      v40[0] = &v34;
      __getCSXPCClientClass_block_invoke((uint64_t)buf);
      v20 = (void *)v35[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v34, 8);
    v22 = (CSXPCClient *)objc_msgSend([v21 alloc], "initWithType:", 1);
    v23 = self->_xpcClient;
    self->_xpcClient = v22;

    -[CSXPCClient setDelegate:](self->_xpcClient, "setDelegate:", self);
    -[CSXPCClient connect](self->_xpcClient, "connect");
    xpcClient = self->_xpcClient;
  }
  v31 = 0;
  v24 = -[CSXPCClient prepareAudioProviderWithContext:clientType:error:](xpcClient, "prepareAudioProviderWithContext:clientType:error:", v10, 4, &v31);
  v25 = v31;
  if ((v24 & 1) != 0)
  {
    v26 = self->_xpcClient;
    if (v26)
    {
      objc_msgSend(MEMORY[0x24BE283D0], "noAlertOption");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setRequestHistoricalAudioDataWithHostTime:", 1);
      objc_msgSend(v27, "setStartRecordingHostTime:", a4);
      objc_msgSend(v27, "setSiriSessionUUID:", v11);
      objc_msgSend(v27, "setDisableRCSelection:", 1);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "UUIDString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "setRequestMHUUID:", v29);
      v30 = LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[LBAudioCapture startAudioCaptureWithRecordContext:startHostTime:siriSessionUUID:completion:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v29;
        *(_WORD *)&buf[22] = 2112;
        v39 = v11;
        _os_log_impl(&dword_2141AA000, v30, OS_LOG_TYPE_DEFAULT, "%s Minting MHId %@ for requestId %@", buf, 0x20u);
      }
      -[LBAudioCapture _startRequestWithAudioContext:streamOption:streamProvider:completion:](self, "_startRequestWithAudioContext:streamOption:streamProvider:completion:", v10, v27, v26, v18);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.localsrbridge"), 202, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v18)[2](v18, 0, v27);
    }

  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v18)[2](v18, 0, v25);
  }

}

- (void)_startRequestWithAudioContext:(id)a3 streamOption:(id)a4 streamProvider:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[4];
  void (**v28)(_QWORD, _QWORD, _QWORD);
  id v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __87__LBAudioCapture__startRequestWithAudioContext_streamOption_streamProvider_completion___block_invoke;
  v30[3] = &unk_24D170808;
  v15 = v13;
  v31 = v15;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199CAD80](v30);
  if (v12)
  {
    v25 = v10;
    v26 = v11;
    objc_msgSend(MEMORY[0x24BE283E0], "defaultRequestWithContext:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClientIdentity:", 4);
    objc_msgSend(v17, "setRequestListeningMicIndicatorLock:", 1);
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v12, "audioStreamWithRequest:streamName:error:", v17, v19, &v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v29;

    if (v20)
    {
      -[LBAudioCapture setAudioStream:](self, "setAudioStream:", v20);
      objc_msgSend(v20, "setDelegate:", 0);
      v27[0] = v14;
      v27[1] = 3221225472;
      v27[2] = __87__LBAudioCapture__startRequestWithAudioContext_streamOption_streamProvider_completion___block_invoke_4;
      v27[3] = &unk_24D170808;
      v28 = v16;
      v11 = v26;
      objc_msgSend(v20, "startAudioStreamWithOption:completion:", v26, v27);

    }
    else
    {
      v22 = (void *)LBLogContextFacilityLocalSRBridge;
      v11 = v26;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        objc_msgSend(v21, "localizedDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v33 = "-[LBAudioCapture _startRequestWithAudioContext:streamOption:streamProvider:completion:]";
        v34 = 2114;
        v35 = v24;
        _os_log_error_impl(&dword_2141AA000, v23, OS_LOG_TYPE_ERROR, "%s AudioStreamRequest has failed : %{public}@", buf, 0x16u);

        v11 = v26;
      }
      ((void (**)(_QWORD, _QWORD, id))v16)[2](v16, 0, v21);
    }

    v10 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.localsrbridge"), 202, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v16)[2](v16, 0, v21);
  }

}

- (void)stopAudioCaptureWithReason:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(_QWORD, _QWORD, _QWORD);
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v10 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[LBAudioCapture stopAudioCaptureWithReason:requestId:completion:]";
    _os_log_impl(&dword_2141AA000, v10, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v11 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke;
  v19[3] = &unk_24D170808;
  v12 = v9;
  v20 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199CAD80](v19);
  -[LBAudioCapture audioStream](self, "audioStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[LBAudioCapture _stopStreamOptionWithReason:forRequestId:](self, "_stopStreamOptionWithReason:forRequestId:", a3, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBAudioCapture audioStream](self, "audioStream");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke_5;
    v17[3] = &unk_24D170858;
    v17[4] = self;
    v18 = v13;
    objc_msgSend(v16, "stopAudioStreamWithOption:completion:", v15, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.localsrbridge"), 202, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v15);
  }

}

- (id)_stopStreamOptionWithReason:(unint64_t)a3 forRequestId:(id)a4
{
  uint64_t v4;
  objc_class *v5;
  id v6;
  void *v7;

  if (a3 == 1)
    v4 = 3;
  else
    v4 = 0;
  v5 = (objc_class *)MEMORY[0x24BE283D8];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithStopRecordingReason:expectedStopHostTime:trailingSilenceDurationAtEndpoint:holdRequest:supportsMagus:requestId:", v4, 0, 0, 1, v6, 0.0);

  return v7;
}

- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__LBAudioCapture_CSXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_24D170880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (CSXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __44__LBAudioCapture_CSXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[LBAudioCapture CSXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_2141AA000, v2, OS_LOG_TYPE_DEFAULT, "%s Received xpc disconnection", (uint8_t *)&v6, 0xCu);
  }
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v3)
  {
    objc_msgSend(v3, "disconnect");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
}

void __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[LBAudioCapture stopAudioCaptureWithReason:requestId:completion:]_block_invoke";
    v12 = 1024;
    v13 = a2;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_2141AA000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling didStop with result : %d, error : %{public}@", (uint8_t *)&v10, 0x1Cu);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

void __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke_5(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke_2;
  block[3] = &unk_24D170830;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __66__LBAudioCapture_stopAudioCaptureWithReason_requestId_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __87__LBAudioCapture__startRequestWithAudioContext_streamOption_streamProvider_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[LBAudioCapture _startRequestWithAudioContext:streamOption:streamProvider:completion:]_block_invoke";
    v12 = 1024;
    v13 = a2;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_2141AA000, v7, OS_LOG_TYPE_DEFAULT, "%s Calling didStart with result : %d, error : %{public}@", (uint8_t *)&v10, 0x1Cu);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

uint64_t __87__LBAudioCapture__startRequestWithAudioContext_streamOption_streamProvider_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __94__LBAudioCapture_startAudioCaptureWithRecordContext_startHostTime_siriSessionUUID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[LBAudioCapture startAudioCaptureWithRecordContext:startHostTime:siriSessionUUID:completion:]_block_invoke";
    v12 = 1024;
    v13 = a2;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_2141AA000, v7, OS_LOG_TYPE_DEFAULT, "%s audio capture start with result : %d, error : %{public}@", (uint8_t *)&v10, 0x1Cu);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

@end
