@implementation SFSpeechRecognitionTask

- (id)_initWithRequest:(id)a3 queue:(id)a4 languageCode:(id)a5 taskHint:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  SFSpeechRecognitionTask *v14;
  SFSpeechRecognitionTask *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *internalQueue;
  uint64_t v18;
  NSString *languageCode;
  void *v20;
  uint64_t v21;
  NSString *requestIdentifier;
  uint64_t v23;
  int64_t v24;
  NSObject *v25;
  _QWORD v27[4];
  SFSpeechRecognitionTask *v28;
  id v29;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v30.receiver = self;
  v30.super_class = (Class)SFSpeechRecognitionTask;
  v14 = -[SFSpeechRecognitionTask init](&v30, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_request, a3);
    objc_storeStrong((id *)&v15->_externalQueue, a4);
    v16 = dispatch_queue_create("com.apple.Speech.Task.Internal", 0);
    internalQueue = v15->_internalQueue;
    v15->_internalQueue = (OS_dispatch_queue *)v16;

    v18 = objc_msgSend(v13, "copy");
    languageCode = v15->_languageCode;
    v15->_languageCode = (NSString *)v18;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v15->_requestIdentifier;
    v15->_requestIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v11, "taskHint");
    if (v23)
      v24 = v23;
    else
      v24 = a6;
    v15->_taskHint = v24;
    v25 = v15->_internalQueue;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __72__SFSpeechRecognitionTask__initWithRequest_queue_languageCode_taskHint___block_invoke;
    v27[3] = &unk_1E6486378;
    v28 = v15;
    v29 = v13;
    dispatch_async(v25, v27);

  }
  return v15;
}

- (SFSpeechRecognitionTaskState)state
{
  NSObject *internalQueue;
  SFSpeechRecognitionTaskState v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SFSpeechRecognitionTask_state__block_invoke;
  v5[3] = &unk_1E64853B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)finish
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFSpeechRecognitionTask_finish__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)cancel
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFSpeechRecognitionTask_cancel__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (NSError)error
{
  NSObject *internalQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__SFSpeechRecognitionTask_error__block_invoke;
  v5[3] = &unk_1E64853B0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSError *)v3;
}

- (float)peakPower
{
  float result;

  -[AFDictationConnection peakPower](self->_dictationConnection, "peakPower");
  return result;
}

- (float)averagePower
{
  float result;

  -[AFDictationConnection averagePower](self->_dictationConnection, "averagePower");
  return result;
}

- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidBegin___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidEnd___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidCancel___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__SFSpeechRecognitionTask_dictationConnection_speechRecordingDidFail___block_invoke;
  v8[3] = &unk_1E6486378;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(internalQueue, v8);

}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  SFSpeechRecognitionRequest *request;
  SFSpeechRecognitionRequest *v6;
  id v7;

  v7 = a4;
  if (+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
  {
    request = self->_request;
    if (request)
      request = (SFSpeechRecognitionRequest *)request->_afDictationRequestParams;
    v6 = request;
    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:withAnalytics:](SFLocalSpeechRecognitionClient, "logCoreAnalyticsEvent:withAnalytics:", CFSTR("com.apple.speechapi.RequestFailed"), v6);

  }
  -[SFSpeechRecognitionTask handleSpeechRecognitionDidFailWithError:]((uint64_t)self, v7);

}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SFSpeechRecognitionTask_dictationConnectionSpeechRecognitionDidSucceed___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)localSpeechRecognitionClientSpeechRecordingDidCancel:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SFSpeechRecognitionTask_localSpeechRecognitionClientSpeechRecordingDidCancel___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
  -[SFLocalSpeechRecognitionClient invalidate](self->_sflsrClient, "invalidate");
}

- (void)localSpeechRecognitionClient:(id)a3 speechRecordingDidFail:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  SFSpeechRecognitionTask *v12;
  id v13;

  v5 = a4;
  internalQueue = self->_internalQueue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __79__SFSpeechRecognitionTask_localSpeechRecognitionClient_speechRecordingDidFail___block_invoke;
  v11 = &unk_1E6486378;
  v12 = self;
  v13 = v5;
  v7 = v5;
  dispatch_async(internalQueue, &v8);
  -[SFLocalSpeechRecognitionClient invalidate](self->_sflsrClient, "invalidate", v8, v9, v10, v11, v12);

}

- (void)localSpeechRecognitionClient:(id)a3 speechRecognitionDidFail:(id)a4
{
  -[SFSpeechRecognitionTask handleSpeechRecognitionDidFailWithError:]((uint64_t)self, a4);
  -[SFLocalSpeechRecognitionClient invalidate](self->_sflsrClient, "invalidate");
}

- (void)localSpeechRecognitionClientSpeechRecognitionDidSucceed:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SFSpeechRecognitionTask_localSpeechRecognitionClientSpeechRecognitionDidSucceed___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
  -[SFLocalSpeechRecognitionClient invalidate](self->_sflsrClient, "invalidate");
}

- (void)addRecordedSpeechSampleData:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__SFSpeechRecognitionTask_addRecordedSpeechSampleData___block_invoke;
  v7[3] = &unk_1E6486378;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

- (void)stopSpeech
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFSpeechRecognitionTask_stopSpeech__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (int64_t)_taskHint
{
  return self->_taskHint;
}

- (BOOL)isFinishing
{
  return self->_finishing;
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_externalQueue, 0);
  objc_storeStrong((id *)&self->_sflsrClient, 0);
  objc_storeStrong((id *)&self->_dictationConnection, 0);
}

uint64_t __37__SFSpeechRecognitionTask_stopSpeech__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopSpeechWithOptions:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stopSpeech");
}

uint64_t __55__SFSpeechRecognitionTask_addRecordedSpeechSampleData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addRecordedSpeechSampleData:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addAudioPacket:", *(_QWORD *)(a1 + 40));
}

uint64_t __83__SFSpeechRecognitionTask_localSpeechRecognitionClientSpeechRecognitionDidSucceed___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 64) = 1;
  return result;
}

- (void)handleSpeechRecognitionDidFailWithError:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 48);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__SFSpeechRecognitionTask_handleSpeechRecognitionDidFailWithError___block_invoke;
    v6[3] = &unk_1E6486378;
    v7 = v3;
    v8 = a1;
    dispatch_async(v5, v6);

  }
}

void __67__SFSpeechRecognitionTask_handleSpeechRecognitionDidFailWithError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(*(id *)(a1 + 32), "code");
  v4 = (uint64_t *)MEMORY[0x1E0CFEB48];
  v5 = (uint64_t *)MEMORY[0x1E0CB2D50];
  if (v3 == 1700)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CFEB48];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("User denied access to speech recognition");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, 1700, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v9;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "code") == 603)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *v4;
    v22 = *v5;
    v23 = CFSTR("On device models required for speech recognition on this platform. Set SFSpeechRecognitionRequest.requiresOnDeviceRecognition = true");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 603, v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v13;
  }
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56))
  {
    v14 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v18 = 136315394;
      v19 = "-[SFSpeechRecognitionTask handleSpeechRecognitionDidFailWithError:]_block_invoke";
      v20 = 2112;
      v21 = v2;
      _os_log_error_impl(&dword_1B2494000, v14, OS_LOG_TYPE_ERROR, "%s Ignoring subsequent recognition error: %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    v15 = objc_msgSend(v2, "copy");
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(v16 + 56);
    *(_QWORD *)(v16 + 56) = v15;

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 64) = 1;

}

void __79__SFSpeechRecognitionTask_localSpeechRecognitionClient_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v2 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v7 = 136315394;
      v8 = "-[SFSpeechRecognitionTask localSpeechRecognitionClient:speechRecordingDidFail:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1B2494000, v2, OS_LOG_TYPE_ERROR, "%s Ignoring subsequent local speech recording error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
}

uint64_t __80__SFSpeechRecognitionTask_localSpeechRecognitionClientSpeechRecordingDidCancel___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 67) = 1;
  return result;
}

void __74__SFSpeechRecognitionTask_dictationConnectionSpeechRecognitionDidSucceed___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;

  if (+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
  {
    v2 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 40);
    if (v2)
      v2 = (_QWORD *)v2[9];
    v3 = v2;
    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:withAnalytics:](SFLocalSpeechRecognitionClient, "logCoreAnalyticsEvent:withAnalytics:", CFSTR("com.apple.speechapi.RequestCompleted"), v3);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
}

void __70__SFSpeechRecognitionTask_dictationConnection_speechRecordingDidFail___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56))
  {
    v2 = SFLogFramework;
    if (os_log_type_enabled((os_log_t)SFLogFramework, OS_LOG_TYPE_ERROR))
    {
      v3 = *(_QWORD *)(a1 + 40);
      v7 = 136315394;
      v8 = "-[SFSpeechRecognitionTask dictationConnection:speechRecordingDidFail:]_block_invoke";
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1B2494000, v2, OS_LOG_TYPE_ERROR, "%s Ignoring subsequent recording error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v4;

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
}

uint64_t __71__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidCancel___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 67) = 1;
  return result;
}

uint64_t __68__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidEnd___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 66) = 1;
  return result;
}

uint64_t __70__SFSpeechRecognitionTask_dictationConnectionSpeechRecordingDidBegin___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 65) = 1;
  return result;
}

void __32__SFSpeechRecognitionTask_error__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __33__SFSpeechRecognitionTask_cancel__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 67) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancelSpeech");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cancelSpeech");
}

uint64_t __33__SFSpeechRecognitionTask_finish__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 66) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopSpeechWithOptions:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stopSpeech");
}

uint64_t __32__SFSpeechRecognitionTask_state__block_invoke(uint64_t result)
{
  _BYTE *v1;
  uint64_t v2;

  v1 = *(_BYTE **)(result + 32);
  if (v1[64])
  {
    v2 = 4;
  }
  else if (v1[67])
  {
    v2 = 3;
  }
  else if (v1[66])
  {
    v2 = 2;
  }
  else
  {
    if (!v1[65])
      return result;
    v2 = 1;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __72__SFSpeechRecognitionTask__initWithRequest_queue_languageCode_taskHint___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v16 = v2;
  if (objc_msgSend(v2, "requiresOnDeviceRecognition")
    && +[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
  {
    v4 = objc_msgSend(v16, "_forceUseSiriProcess") ^ 1;
  }
  else
  {
    v4 = 0;
  }
  if ((objc_msgSend(v16, "requiresOnDeviceRecognition") & 1) != 0
    || !+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled")
    || !AFOfflineDictationCapable()
    || !MGGetBoolAnswer()
    || v3 == 1001
    || objc_msgSend(v16, "_forceUseSiriProcess"))
  {
LABEL_15:
    if ((v4 & 1) == 0)
      goto LABEL_13;
LABEL_16:
    objc_msgSend(v16, "_setUseOnDeviceRecognition:", 1);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(v10 + 32);
    v12 = *(_QWORD *)(v10 + 80);
    objc_msgSend(v16, "taskIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_startedLocalConnectionWithLanguageCode:delegate:taskHint:requestIdentifier:taskIdentifier:", v11, v10, v3, v12, v8);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 16);
    *(_QWORD *)(v14 + 16) = v13;

    goto LABEL_17;
  }
  objc_msgSend(v16, "_searchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[SFSpeechAssetManager installedLanguagesForTaskHint:](SFSpeechAssetManager, "installedLanguagesForTaskHint:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 40)) | v4;

    goto LABEL_15;
  }
  if (v4)
    goto LABEL_16;
LABEL_13:
  objc_msgSend(v16, "_setUseOnDeviceRecognition:", 0);
  objc_msgSend(v16, "_startedConnectionWithLanguageCode:delegate:taskHint:requestIdentifier:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 8);
  *(_QWORD *)(v7 + 8) = v6;
LABEL_17:

}

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1 && SFLogInitIfNeeded_once != -1)
    dispatch_once(&SFLogInitIfNeeded_once, &__block_literal_global_2502);
}

@end
