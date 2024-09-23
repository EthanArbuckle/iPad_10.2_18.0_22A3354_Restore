@implementation LBLocalSpeechRecognizerClient

- (LBLocalSpeechRecognizerClient)initWithDelegate:(id)a3 xpcListenerEndpoint:(id)a4 audioCapture:(id)a5
{
  id v8;
  id v9;
  id v10;
  LBLocalSpeechRecognizerClient *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  LBAudioCapture *v15;
  LBAudioCapture *audioCapture;
  void *v17;
  uint64_t v18;
  NSString *uuidString;
  NSObject *v20;
  NSString *v21;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  NSString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)LBLocalSpeechRecognizerClient;
  v11 = -[LBLocalSpeechRecognizerClient init](&v23, sel_init);
  if (v11)
  {
    if (LBLogInitIfNeeded_once != -1)
      dispatch_once(&LBLogInitIfNeeded_once, &__block_literal_global);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("LBLocalSpeechRecognizerClient Queue", v12);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v13;

    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v11->_xpcListenerEndpoint, a4);
    if (v10)
      v15 = (LBAudioCapture *)v10;
    else
      v15 = -[LBAudioCapture initWithQueue:]([LBAudioCapture alloc], "initWithQueue:", v11->_queue);
    audioCapture = v11->_audioCapture;
    v11->_audioCapture = v15;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = objc_claimAutoreleasedReturnValue();
    uuidString = v11->_uuidString;
    v11->_uuidString = (NSString *)v18;

    v20 = LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v11->_uuidString;
      *(_DWORD *)buf = 136315394;
      v25 = "-[LBLocalSpeechRecognizerClient initWithDelegate:xpcListenerEndpoint:audioCapture:]";
      v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_2141AA000, v20, OS_LOG_TYPE_DEFAULT, "%s Created LBLocalSpeechRecognizerClient with uuid [%@]", buf, 0x16u);
    }

  }
  return v11;
}

- (LBLocalSpeechRecognizerClient)initWithDelegate:(id)a3
{
  return -[LBLocalSpeechRecognizerClient initWithDelegate:xpcListenerEndpoint:audioCapture:](self, "initWithDelegate:xpcListenerEndpoint:audioCapture:", a3, 0, 0);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[LBLocalSpeechRecognizerClient dealloc]";
    _os_log_impl(&dword_2141AA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  -[LBLocalSpeechRecognizerClient _invalidate](self, "_invalidate");
  v4.receiver = self;
  v4.super_class = (Class)LBLocalSpeechRecognizerClient;
  -[LBLocalSpeechRecognizerClient dealloc](&v4, sel_dealloc);
}

- (void)setLocalSpeechRecognizerClientDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__LBLocalSpeechRecognizerClient_setLocalSpeechRecognizerClientDelegate___block_invoke;
  v7[3] = &unk_24D1707B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)connectToServiceIfNeeded
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__LBLocalSpeechRecognizerClient_connectToServiceIfNeeded__block_invoke;
  block[3] = &unk_24D170880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)preheatLocalSpeechRecognitionWithLanguage:(id)a3 source:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__LBLocalSpeechRecognizerClient_preheatLocalSpeechRecognitionWithLanguage_source___block_invoke;
  block[3] = &unk_24D170648;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

- (void)startSpeechRecognitionResultsWithSettings:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke;
  v7[3] = &unk_24D1707B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stopLocalSpeechRecognitionTaskWithReason:(unint64_t)a3
{
  -[LBLocalSpeechRecognizerClient stopSpeechRecognitionTaskWithReason:requestId:](self, "stopSpeechRecognitionTaskWithReason:requestId:", a3, 0);
}

- (void)stopSpeechRecognitionTaskWithReason:(unint64_t)a3 requestId:(id)a4
{
  -[LBLocalSpeechRecognizerClient stopSpeechRecognitionTaskWithReason:requestId:completion:](self, "stopSpeechRecognitionTaskWithReason:requestId:completion:", a3, a4, 0);
}

- (void)stopSpeechRecognitionTaskWithReason:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __90__LBLocalSpeechRecognizerClient_stopSpeechRecognitionTaskWithReason_requestId_completion___block_invoke;
  v13[3] = &unk_24D1706C0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)stopSpeechRecognitionTaskAndInvalidateWithReason:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __103__LBLocalSpeechRecognizerClient_stopSpeechRecognitionTaskAndInvalidateWithReason_requestId_completion___block_invoke;
  v13[3] = &unk_24D1706C0;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

- (void)_stopSpeechRecognitionTaskWithReason:(unint64_t)a3 requestId:(id)a4 shouldInvalidateAfterStop:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  LBAudioCapture *audioCapture;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  unint64_t v21;
  BOOL v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v7 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a6;
  v12 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v24 = "-[LBLocalSpeechRecognizerClient _stopSpeechRecognitionTaskWithReason:requestId:shouldInvalidateAfterStop:completion:]";
    v25 = 2112;
    v26 = v14;
    v27 = 2112;
    v28 = v15;
    v29 = 2050;
    v30 = a3;
    v31 = 2112;
    v32 = v10;
    v33 = 1024;
    v34 = v7;
    _os_log_impl(&dword_2141AA000, v13, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:reason : %{public}lu, requestId %@, shouldInvalidate %d", buf, 0x3Au);

  }
  if (self->_shouldEnableAudioCapture && (audioCapture = self->_audioCapture) != 0)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __117__LBLocalSpeechRecognizerClient__stopSpeechRecognitionTaskWithReason_requestId_shouldInvalidateAfterStop_completion___block_invoke;
    v18[3] = &unk_24D1706E8;
    v18[4] = self;
    v21 = a3;
    v19 = v10;
    v22 = v7;
    v20 = v11;
    -[LBAudioCapture stopAudioCaptureWithReason:requestId:completion:](audioCapture, "stopAudioCaptureWithReason:requestId:completion:", a3, v19, v18);

  }
  else
  {
    -[LBLocalSpeechRecognizerClient _service](self, "_service");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stopSpeechRecognitionWithReason:requestId:", a3, v10);

    if (v7)
      -[LBLocalSpeechRecognizerClient _invalidate](self, "_invalidate");
    if (v11)
      (*((void (**)(id, uint64_t, _QWORD))v11 + 2))(v11, 1, 0);
  }

}

- (void)disableLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__LBLocalSpeechRecognizerClient_disableLocalSpeechRecognitionForRequestId___block_invoke;
  v7[3] = &unk_24D1707B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)pauseLocalSpeechRecognitionForRequestId:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__LBLocalSpeechRecognizerClient_pauseLocalSpeechRecognitionForRequestId___block_invoke;
  v7[3] = &unk_24D1707B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)resumeLocalRecognitionWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __105__LBLocalSpeechRecognizerClient_resumeLocalRecognitionWithRequestId_prefixText_postfixText_selectedText___block_invoke;
  block[3] = &unk_24D170710;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(queue, block);

}

- (void)updateVoiceCommandContextWithRequestId:(id)a3 prefixText:(id)a4 postfixText:(id)a5 selectedText:(id)a6 disambiguationActive:(id)a7 cursorInVisibleText:(id)a8 favorCommandSuppression:(id)a9 abortCommandSuppression:(id)a10 undoEvent:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  NSObject *queue;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  _QWORD block[5];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v35 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __207__LBLocalSpeechRecognizerClient_updateVoiceCommandContextWithRequestId_prefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent___block_invoke;
  block[3] = &unk_24D170738;
  block[4] = self;
  v37 = v35;
  v38 = v17;
  v39 = v18;
  v40 = v19;
  v41 = v20;
  v42 = v21;
  v43 = v22;
  v44 = v23;
  v45 = v24;
  v26 = v24;
  v27 = v23;
  v28 = v22;
  v29 = v21;
  v30 = v20;
  v31 = v19;
  v32 = v18;
  v33 = v17;
  v34 = v35;
  dispatch_async(queue, block);

}

- (void)resetCacheAndCompileAllAssets
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEBUG))
  {
    v3 = 136315138;
    v4 = "-[LBLocalSpeechRecognizerClient resetCacheAndCompileAllAssets]";
    _os_log_debug_impl(&dword_2141AA000, v2, OS_LOG_TYPE_DEBUG, "%s No longer supported.", (uint8_t *)&v3, 0xCu);
  }
}

- (void)sendSpeechCorrectionInfo:(id)a3 interactionIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__LBLocalSpeechRecognizerClient_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke;
  block[3] = &unk_24D170760;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)updateTCUState:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__LBLocalSpeechRecognizerClient_updateTCUState___block_invoke;
  v7[3] = &unk_24D1707B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)trpCandidateReadyForExecutionForRequestId:(id)a3 withTrpId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__LBLocalSpeechRecognizerClient_trpCandidateReadyForExecutionForRequestId_withTrpId___block_invoke;
  block[3] = &unk_24D170760;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (void)invalidate
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[LBLocalSpeechRecognizerClient invalidate]";
    _os_log_impl(&dword_2141AA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__LBLocalSpeechRecognizerClient_invalidate__block_invoke;
  block[3] = &unk_24D170880;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_invalidate
{
  NSXPCConnection *xpcConnection;
  NSObject *v4;
  NSXPCConnection *v5;
  NSString *xpcConnectionUUIDString;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = "-[LBLocalSpeechRecognizerClient _invalidate]";
      _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v7, 0xCu);
      xpcConnection = self->_xpcConnection;
    }
    -[NSXPCConnection setInvalidationHandler:](xpcConnection, "setInvalidationHandler:", 0);
    -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
    v5 = self->_xpcConnection;
    self->_xpcConnection = 0;

    xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
    self->_xpcConnectionUUIDString = 0;

  }
}

- (void)localSpeechServiceDidReceivedPartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5
{
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  id WeakRetained;

  queue = self->_queue;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  dispatch_assert_queue_V2(queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognizerClient:receivedPartialResultWithRequestId:language:tokens:", self, v11, v10, v9);

}

- (void)localSpeechServiceDidReceivedPartialResultWithRequestId:(id)a3 language:(id)a4 tokens:(id)a5 metadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  char v14;
  id v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "localSpeechRecognizerClient:receivedPartialResultWithRequestId:language:tokens:metadata:", self, v16, v10, v11, v12);

  }
}

- (void)localSpeechServiceDidReceivedPartialResultWithRequestId:(id)a3 language:(id)a4 speechPackage:(id)a5 metadata:(id)a6
{
  id v10;
  id v11;
  id v12;
  id WeakRetained;
  char v14;
  id v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "localSpeechRecognizerClient:receivedPartialResultWithRequestId:language:speechPackage:metadata:", self, v16, v10, v11, v12);

  }
}

- (void)localSpeechServiceDidReceivedFinalResultCandidateWithRequestId:(id)a3 speechPackage:(id)a4
{
  id v6;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "localSpeechRecognizerClient:receivedFinalResultCandidateWithRequestId:speechPackage:", self, v10, v6);

  }
}

- (void)localSpeechServiceDidReceivedVoiceCommandCandidateWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "localSpeechRecognizerClient:receivedVoiceCommandCandidateWithRequestId:speechPackage:metadata:", self, v13, v8, v9);

  }
}

- (void)localSpeechServiceDidReceivedFinalResultWithRequestId:(id)a3 speechPackage:(id)a4
{
  NSObject *queue;
  id v7;
  id v8;
  id WeakRetained;

  queue = self->_queue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "localSpeechRecognizerClient:receivedFinalResultWithRequestId:speechPackage:", self, v8, v7);

}

- (void)localSpeechServiceDidReceivedFinalResultWithRequestId:(id)a3 speechPackage:(id)a4 metadata:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "localSpeechRecognizerClient:receivedFinalResultWithRequestId:speechPackage:metadata:", self, v13, v8, v9);

  }
}

- (void)localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6
{
  id v10;
  id WeakRetained;
  char v12;
  id v13;
  id v14;

  v14 = a3;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "localSpeechRecognizerClient:receivedEagerRecognitionCandidateWithRequestId:rcId:speechPackage:duration:", self, v14, a4, v10, a6);

  }
}

- (void)localSpeechServiceDidReceivedEagerRecognitionCandidateWithRequestId:(id)a3 rcId:(unint64_t)a4 speechPackage:(id)a5 duration:(double)a6 metadata:(id)a7
{
  id v12;
  id v13;
  id WeakRetained;
  char v15;
  id v16;
  id v17;

  v17 = a3;
  v12 = a5;
  v13 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    v16 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v16, "localSpeechRecognizerClient:receivedEagerRecognitionCandidateWithRequestId:rcId:speechPackage:duration:metadata:", self, v17, a4, v12, v13, a6);

  }
}

- (void)localSpeechServiceDidReceivedEagerResultWithRequestId:(id)a3 rcId:(unint64_t)a4 shouldAccept:(BOOL)a5 mitigationSignal:(BOOL)a6 featuresToLog:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v8 = a6;
  v9 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 136315906;
    v20 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceivedEagerResultWithRequestId:rcId:shouldAccept:mitiga"
          "tionSignal:featuresToLog:]";
    v21 = 2112;
    v22 = v16;
    v23 = 2112;
    v24 = v17;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_2141AA000, v15, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Sending EagerResult for request:%@", (uint8_t *)&v19, 0x2Au);

  }
  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "localSpeechRecognizerClient:didAcceptedEagerResultWithRequestId:rcId:mitigationSignal:featuresToLog:", self, v12, a4, v8, v13);

  }
}

- (void)localSpeechServiceDidCompletionRecognitionWithStatistics:(id)a3 requestId:(id)a4 endpointMode:(int64_t)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id WeakRetained;
  char v19;
  id v20;
  id v21;
  char v22;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v13 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 136316418;
    v24 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidCompletionRecognitionWithStatistics:requestId:endpointMode:error:]";
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    v29 = 2112;
    v30 = v11;
    v31 = 2050;
    v32 = a5;
    v33 = 2114;
    v34 = v17;
    _os_log_impl(&dword_2141AA000, v14, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Notify task %@ completed with endpointMode %{public}ld, error : %{public}@", (uint8_t *)&v23, 0x3Eu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = objc_opt_respondsToSelector();

  v20 = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = v20;
  if ((v19 & 1) != 0)
  {
    objc_msgSend(v20, "localSpeechRecognizerClient:didCompletionRecognitionWithStatistics:requestId:endpointMode:error:", self, v10, v11, a5, v12);
LABEL_7:

    goto LABEL_8;
  }
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    v21 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v21, "localSpeechRecognizerClient:didCompletionRecognitionWithStatistics:requestId:error:", self, v10, v11, v12);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)localSpeechServiceDidReceivedVoiceIdScoreCard:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "spIdKnownUserScores");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315906;
    v14 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceivedVoiceIdScoreCard:]";
    v15 = 2112;
    v16 = v7;
    v17 = 2112;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2141AA000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Client received voiceId scores: %@", (uint8_t *)&v13, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "localSpeechRecognizerClient:receivedVoiceIdScoreCard:", self, v4);

  }
}

- (void)localSpeechServiceDidReceiveTRPCandidatePackage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315650;
    v13 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveTRPCandidatePackage:]";
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_2141AA000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received TRP Candidate Package", (uint8_t *)&v12, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "localSpeechRecognizerClient:receivedTRPCandidatePackage:", self, v4);

  }
}

- (void)localSpeechServiceDidReceiveContinuityEndDetected:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 136315906;
    v17 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveContinuityEndDetected:]";
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2141AA000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received Continuity End Detected: %@", (uint8_t *)&v16, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 136315906;
      v17 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveContinuityEndDetected:]";
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_2141AA000, v12, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Delegate - Received Continuity End Detected: %@", (uint8_t *)&v16, 0x2Au);

    }
    v15 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v15, "localSpeechRecognizerClient:receivedContinuityEndDetected:", self, v4);

  }
}

- (void)localSpeechServiceDidReceiveTCUStateUpdate:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315906;
    v13 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveTCUStateUpdate:]";
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2141AA000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received TCU state update: %@", (uint8_t *)&v12, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "localSpeechRecognizerClient:receivedTCUStateUpdate:", self, v4);

  }
}

- (void)localSpeechServiceDidReceiveTRPDetected:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315906;
    v13 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveTRPDetected:]";
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2141AA000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received TRP Detected: %@", (uint8_t *)&v12, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "localSpeechRecognizerClient:receivedTRPDetected:", self, v4);

  }
}

- (void)localSpeechServiceDidReceiveMultiUserTRPCandidatePackage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  id v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 136315906;
    v13 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidReceiveMultiUserTRPCandidatePackage:]";
    v14 = 2112;
    v15 = v7;
    v16 = 2112;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_2141AA000, v6, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Received MultiUserTRP candidate: %@", (uint8_t *)&v12, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v11, "localSpeechRecognizerClient:receivedMultiUserTRPCandidatePackage:", self, v4);

  }
}

- (void)localSpeechServiceDidDetectedFinalEndpoint
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  LBAudioCapture *audioCapture;
  NSString *requestId;
  _QWORD v9[5];
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v11 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidDetectedFinalEndpoint]";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", buf, 0x20u);

  }
  if (self->_shouldEnableAudioCapture)
  {
    audioCapture = self->_audioCapture;
    requestId = self->_requestId;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __75__LBLocalSpeechRecognizerClient_localSpeechServiceDidDetectedFinalEndpoint__block_invoke;
    v9[3] = &unk_24D170788;
    v9[4] = self;
    -[LBAudioCapture stopAudioCaptureWithReason:requestId:completion:](audioCapture, "stopAudioCaptureWithReason:requestId:completion:", 0, requestId, v9);
  }
}

- (void)localSpeechServiceRequestAttentionAssetDownload
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  char v8;
  id v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[LBLocalSpeechRecognizerClient localSpeechServiceRequestAttentionAssetDownload]";
    v12 = 2112;
    v13 = v5;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v10, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v9, "localSpeechRecognizerClient:requestAttentionAssetDownload:", self, 1);

  }
}

- (id)_newConnection
{
  NSXPCListenerEndpoint *xpcListenerEndpoint;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  xpcListenerEndpoint = self->_xpcListenerEndpoint;
  v4 = objc_alloc(MEMORY[0x24BDD1988]);
  if (xpcListenerEndpoint)
    v5 = objc_msgSend(v4, "initWithListenerEndpoint:", self->_xpcListenerEndpoint);
  else
    v5 = objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.siri.localspeechrecognitionbridge.xpc"), 0);
  v6 = (void *)v5;
  LBLocalSpeechServiceGetXPCInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  LBLocalSpeechServiceDelegateGetXPCInterface();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setExportedInterface:", v8);

  objc_msgSend(v6, "setExportedObject:", self);
  objc_msgSend(v6, "_setQueue:", self->_queue);
  return v6;
}

- (id)_connection
{
  NSXPCConnection *xpcConnection;
  void *v4;
  NSString *v5;
  NSString *xpcConnectionUUIDString;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSXPCConnection *v11;
  NSXPCConnection *v12;
  NSString *v13;
  NSXPCConnection *v14;
  uint64_t v15;
  NSString *v16;
  NSXPCConnection *v17;
  NSString *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  NSString *v24;
  id v25;
  _QWORD v26[4];
  NSString *v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    xpcConnectionUUIDString = self->_xpcConnectionUUIDString;
    self->_xpcConnectionUUIDString = v5;

    v7 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      -[LBLocalSpeechRecognizerClient uuidString](self, "uuidString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[LBLocalSpeechRecognizerClient xpcConnectionUUIDString](self, "xpcConnectionUUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v30 = "-[LBLocalSpeechRecognizerClient _connection]";
      v31 = 2112;
      v32 = v9;
      v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_2141AA000, v8, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Creating new xpc connection...", buf, 0x20u);

    }
    v11 = -[LBLocalSpeechRecognizerClient _newConnection](self, "_newConnection");
    v12 = self->_xpcConnection;
    self->_xpcConnection = v11;

    objc_initWeak((id *)buf, self);
    v13 = self->_xpcConnectionUUIDString;
    v14 = self->_xpcConnection;
    v15 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __44__LBLocalSpeechRecognizerClient__connection__block_invoke;
    v26[3] = &unk_24D1707E0;
    objc_copyWeak(&v28, (id *)buf);
    v16 = v13;
    v27 = v16;
    -[NSXPCConnection setInterruptionHandler:](v14, "setInterruptionHandler:", v26);
    v17 = self->_xpcConnection;
    v20 = v15;
    v21 = 3221225472;
    v22 = __44__LBLocalSpeechRecognizerClient__connection__block_invoke_222;
    v23 = &unk_24D1707E0;
    objc_copyWeak(&v25, (id *)buf);
    v18 = v16;
    v24 = v18;
    -[NSXPCConnection setInvalidationHandler:](v17, "setInvalidationHandler:", &v20);
    -[NSXPCConnection resume](self->_xpcConnection, "resume", v20, v21, v22, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v28);

    objc_destroyWeak((id *)buf);
    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

- (id)_service
{
  void *v2;
  void *v3;

  -[LBLocalSpeechRecognizerClient _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_shouldSetSpeechEventForRecordType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x1C) & (0xED00000u >> a3);
}

- (LBLocalSpeechRecognizerClientDelegate)delegate
{
  return (LBLocalSpeechRecognizerClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_storeStrong((id *)&self->_uuidString, a3);
}

- (NSString)xpcConnectionUUIDString
{
  return self->_xpcConnectionUUIDString;
}

- (void)setXpcConnectionUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnectionUUIDString, a3);
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_xpcConnectionUUIDString, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_audioCapture, 0);
  objc_storeStrong((id *)&self->_xpcListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __44__LBLocalSpeechRecognizerClient__connection__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[LBLocalSpeechRecognizerClient _connection]_block_invoke";
    v16 = 2112;
    v17 = CFSTR("com.apple.siri.localspeechrecognitionbridge.xpc");
    _os_log_impl(&dword_2141AA000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Interrupted", (uint8_t *)&v14, 0x16u);
  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v4[2], "invalidate");
      v7 = v4[2];
      v4[2] = 0;

      v8 = objc_loadWeakRetained(v4 + 6);
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained(v4 + 6);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.localsrbridge"), 102, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject localSpeechRecognizerClient:didCompletionRecognitionWithStatistics:requestId:endpointMode:error:](v10, "localSpeechRecognizerClient:didCompletionRecognitionWithStatistics:requestId:endpointMode:error:", v4, 0, 0, 0, v11);
LABEL_9:

      }
    }
    else
    {
      v12 = (void *)LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
      {
        v13 = *(const __CFString **)(a1 + 32);
        v10 = v12;
        objc_msgSend(v4, "xpcConnectionUUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[LBLocalSpeechRecognizerClient _connection]_block_invoke";
        v16 = 2112;
        v17 = v13;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_2141AA000, v10, OS_LOG_TYPE_INFO, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v14, 0x20u);
        goto LABEL_9;
      }
    }
  }

}

void __44__LBLocalSpeechRecognizerClient__connection__block_invoke_222(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[LBLocalSpeechRecognizerClient _connection]_block_invoke";
    v16 = 2112;
    v17 = CFSTR("com.apple.siri.localspeechrecognitionbridge.xpc");
    _os_log_impl(&dword_2141AA000, v2, OS_LOG_TYPE_DEFAULT, "%s xpc connection %@ Invalidated", (uint8_t *)&v14, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "isEqualToString:", v6);

    if ((v5 & 1) != 0)
    {
      v7 = (void *)*((_QWORD *)v4 + 2);
      *((_QWORD *)v4 + 2) = 0;

      v8 = objc_loadWeakRetained((id *)v4 + 6);
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)v4 + 6);
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.localsrbridge"), 102, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject localSpeechRecognizerClient:didCompletionRecognitionWithStatistics:requestId:endpointMode:error:](v10, "localSpeechRecognizerClient:didCompletionRecognitionWithStatistics:requestId:endpointMode:error:", v4, 0, 0, 0, v11);
LABEL_9:

      }
    }
    else
    {
      v12 = (void *)LBLogContextFacilityLocalSRBridge;
      if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_INFO))
      {
        v13 = *(const __CFString **)(a1 + 32);
        v10 = v12;
        objc_msgSend(v4, "xpcConnectionUUIDString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 136315650;
        v15 = "-[LBLocalSpeechRecognizerClient _connection]_block_invoke";
        v16 = 2112;
        v17 = v13;
        v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_2141AA000, v10, OS_LOG_TYPE_INFO, "%s Ignore since the UUID of xpc connection not match : %@ vs. %@", (uint8_t *)&v14, 0x20u);
        goto LABEL_9;
      }
    }
  }

}

void __75__LBLocalSpeechRecognizerClient_localSpeechServiceDidDetectedFinalEndpoint__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      v9 = v6;
      objc_msgSend(v5, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315394;
      v12 = "-[LBLocalSpeechRecognizerClient localSpeechServiceDidDetectedFinalEndpoint]_block_invoke";
      v13 = 2112;
      v14 = v10;
      _os_log_error_impl(&dword_2141AA000, v9, OS_LOG_TYPE_ERROR, "%s Failed to stop audio capture, error : %@", (uint8_t *)&v11, 0x16u);

    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = 0;

}

uint64_t __43__LBLocalSpeechRecognizerClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

void __85__LBLocalSpeechRecognizerClient_trpCandidateReadyForExecutionForRequestId_withTrpId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[LBLocalSpeechRecognizerClient trpCandidateReadyForExecutionForRequestId:withTrpId:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trpCandidateReadyForExecutionForRequestId:withTrpId:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __48__LBLocalSpeechRecognizerClient_updateTCUState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[LBLocalSpeechRecognizerClient updateTCUState:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateTCUState:", *(_QWORD *)(a1 + 40));

}

void __80__LBLocalSpeechRecognizerClient_sendSpeechCorrectionInfo_interactionIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[LBLocalSpeechRecognizerClient sendSpeechCorrectionInfo:interactionIdentifier:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendSpeechCorrectionInfo:interactionIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __207__LBLocalSpeechRecognizerClient_updateVoiceCommandContextWithRequestId_prefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315906;
    v10 = "-[LBLocalSpeechRecognizerClient updateVoiceCommandContextWithRequestId:prefixText:postfixText:selectedText:dis"
          "ambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:requestId : %@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateVoiceCommandContextWithRequestId:prefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104));

}

void __105__LBLocalSpeechRecognizerClient_resumeLocalRecognitionWithRequestId_prefixText_postfixText_selectedText___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 136315906;
    v10 = "-[LBLocalSpeechRecognizerClient resumeLocalRecognitionWithRequestId:prefixText:postfixText:selectedText:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:requestId : %@", (uint8_t *)&v9, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resumeLocalRecognitionWithRequestId:prefixText:postfixText:selectedText:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

void __73__LBLocalSpeechRecognizerClient_pauseLocalSpeechRecognitionForRequestId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 136315906;
    v10 = "-[LBLocalSpeechRecognizerClient pauseLocalSpeechRecognitionForRequestId:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:requestId : %@", (uint8_t *)&v9, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pauseLocalSpeechRecognitionForRequestId:", *(_QWORD *)(a1 + 40));

}

void __75__LBLocalSpeechRecognizerClient_disableLocalSpeechRecognitionForRequestId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v9 = 136315906;
    v10 = "-[LBLocalSpeechRecognizerClient disableLocalSpeechRecognitionForRequestId:]_block_invoke";
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:requestId : %@", (uint8_t *)&v9, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "disableLocalSpeechRecognitionForRequestId:", *(_QWORD *)(a1 + 40));

}

void __117__LBLocalSpeechRecognizerClient__stopSpeechRecognitionTaskWithReason_requestId_shouldInvalidateAfterStop_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopSpeechRecognitionWithReason:requestId:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "_invalidate");
  v6 = *(_QWORD *)(a1 + 48);
  v7 = v8;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v8);
    v7 = v8;
  }

}

uint64_t __103__LBLocalSpeechRecognizerClient_stopSpeechRecognitionTaskAndInvalidateWithReason_requestId_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSpeechRecognitionTaskWithReason:requestId:shouldInvalidateAfterStop:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

uint64_t __90__LBLocalSpeechRecognizerClient_stopSpeechRecognitionTaskWithReason_requestId_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopSpeechRecognitionTaskWithReason:requestId:shouldInvalidateAfterStop:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

void __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v29 = "-[LBLocalSpeechRecognizerClient startSpeechRecognitionResultsWithSettings:]_block_invoke";
    v30 = 2112;
    v31 = v5;
    v32 = 2112;
    v33 = v6;
    v34 = 2114;
    v35 = v7;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:settings : %{public}@", buf, 0x2Au);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = objc_msgSend(*(id *)(a1 + 40), "shouldStartAudioCapture");
  objc_msgSend(*(id *)(a1 + 40), "requestId");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = v8;

  v11 = *(_BYTE **)(a1 + 32);
  if (v11[40])
  {
    v12 = objc_alloc(MEMORY[0x24BE283C0]);
    v13 = objc_msgSend(*(id *)(a1 + 40), "audioRecordType");
    objc_msgSend(*(id *)(a1 + 40), "audioRecordDeviceId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithRecordType:deviceId:", v13, v14);

    v16 = objc_msgSend(*(id *)(a1 + 40), "audioCaptureStartHostTime");
    v17 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(void **)(a1 + 32);
      v19 = v17;
      objc_msgSend(v18, "uuidString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v29 = "-[LBLocalSpeechRecognizerClient startSpeechRecognitionResultsWithSettings:]_block_invoke";
      v30 = 2112;
      v31 = v20;
      v32 = 2112;
      v33 = v21;
      v34 = 2114;
      v35 = v22;
      v36 = 2048;
      v37 = v16;
      _os_log_impl(&dword_2141AA000, v19, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:start audio capture in parallel with record context : %{public}@, startTime : %llu", buf, 0x34u);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldSetSpeechEventForRecordType:", objc_msgSend(*(id *)(a1 + 40), "audioRecordType")))objc_msgSend(v15, "setSpeechEvent:", +[CSRecordTypeSpeechEventConverter getSpeechEventForRecordType:](CSRecordTypeSpeechEventConverter, "getSpeechEventForRecordType:", objc_msgSend(*(id *)(a1 + 40), "audioRecordType")));
    v23 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    objc_msgSend(*(id *)(a1 + 40), "requestId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke_184;
    v26[3] = &unk_24D170698;
    v25 = *(void **)(a1 + 40);
    v26[4] = *(_QWORD *)(a1 + 32);
    v27 = v25;
    objc_msgSend(v23, "startAudioCaptureWithRecordContext:startHostTime:siriSessionUUID:completion:", v15, v16, v24, v26);

  }
  else
  {
    objc_msgSend(v11, "_service");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startSpeechRecognitionResultsWithSettings:", *(_QWORD *)(a1 + 40));
  }

}

void __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke_184(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  char v13;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(v6 + 8);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke_2;
  v10[3] = &unk_24D170670;
  v13 = a2;
  v10[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, v10);

}

void __75__LBLocalSpeechRecognizerClient_startSpeechRecognitionResultsWithSettings___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_service");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startSpeechRecognitionResultsWithSettings:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v2 = (void *)LBLogContextFacilityLocalSRBridge;
    if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_ERROR))
    {
      v5 = *(void **)(a1 + 48);
      v6 = v2;
      objc_msgSend(v5, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v10 = "-[LBLocalSpeechRecognizerClient startSpeechRecognitionResultsWithSettings:]_block_invoke_2";
      v11 = 2112;
      v12 = v7;
      _os_log_error_impl(&dword_2141AA000, v6, OS_LOG_TYPE_ERROR, "%s Failed to start audio capture with error : %@", buf, 0x16u);

    }
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "requestId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localSpeechServiceDidCompletionRecognitionWithStatistics:requestId:endpointMode:error:", 0, v4, 0, *(_QWORD *)(a1 + 48));

  }
}

void __82__LBLocalSpeechRecognizerClient_preheatLocalSpeechRecognitionWithLanguage_source___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[LBLocalSpeechRecognizerClient preheatLocalSpeechRecognitionWithLanguage:source:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:Preheating local ASR", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preheatLocalSpeechRecognitionWithLanguage:source:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __57__LBLocalSpeechRecognizerClient_connectToServiceIfNeeded__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_service");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "connectToServiceIfNeeded");

}

id __72__LBLocalSpeechRecognizerClient_setLocalSpeechRecognizerClientDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)LBLogContextFacilityLocalSRBridge;
  if (os_log_type_enabled((os_log_t)LBLogContextFacilityLocalSRBridge, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "uuidString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "xpcConnectionUUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[LBLocalSpeechRecognizerClient setLocalSpeechRecognizerClientDelegate:]_block_invoke";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2141AA000, v4, OS_LOG_TYPE_DEFAULT, "%s LBLocalSpeechRecognizerClient[%@], xpcConnection[%@]:", (uint8_t *)&v8, 0x20u);

  }
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
}

+ (BOOL)isInstalledFromStatusString:(id)a3
{
  return objc_msgSend(a3, "hasPrefix:", CFSTR("Version:"));
}

@end
