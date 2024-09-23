@implementation _SFSpeechRecognitionBlockTask

- (id)_initWithRequest:(id)a3 queue:(id)a4 languageCode:(id)a5 taskHint:(int64_t)a6 resultHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)_SFSpeechRecognitionBlockTask;
  v16 = -[SFSpeechRecognitionTask _initWithRequest:queue:languageCode:taskHint:](&v27, sel__initWithRequest_queue_languageCode_taskHint_, v12, v13, v14, a6);
  v17 = v16;
  if (v16)
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy_;
    v25[4] = __Block_byref_object_dispose_;
    v18 = v16;
    v26 = v18;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __92___SFSpeechRecognitionBlockTask__initWithRequest_queue_languageCode_taskHint_resultHandler___block_invoke;
    v22[3] = &unk_1E64853D8;
    v23 = v15;
    v24 = v25;
    v19 = objc_msgSend(v22, "copy");
    v20 = (void *)v18[11];
    v18[11] = v19;

    _Block_object_dispose(v25, 8);
  }

  return v17;
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SFSpeechRecognitionBlockTask;
  -[SFSpeechRecognitionTask dictationConnection:speechRecordingDidFail:](&v11, sel_dictationConnection_speechRecordingDidFail_, a3, v6);
  internalQueue = self->super._internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76___SFSpeechRecognitionBlockTask_dictationConnection_speechRecordingDidFail___block_invoke;
  v9[3] = &unk_1E6486378;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(internalQueue, v9);

}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFSpeechRecognitionBlockTask;
  -[SFSpeechRecognitionTask dictationConnectionSpeechRecordingDidCancel:](&v6, sel_dictationConnectionSpeechRecordingDidCancel_, a3);
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77___SFSpeechRecognitionBlockTask_dictationConnectionSpeechRecordingDidCancel___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  NSObject *internalQueue;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFSpeechRecognitionBlockTask;
  -[SFSpeechRecognitionTask dictationConnection:speechRecognitionDidFail:](&v7, sel_dictationConnection_speechRecognitionDidFail_, a3, a4);
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78___SFSpeechRecognitionBlockTask_dictationConnection_speechRecognitionDidFail___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFSpeechRecognitionBlockTask;
  -[SFSpeechRecognitionTask dictationConnectionSpeechRecognitionDidSucceed:](&v6, sel_dictationConnectionSpeechRecognitionDidSucceed_, a3);
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80___SFSpeechRecognitionBlockTask_dictationConnectionSpeechRecognitionDidSucceed___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)dictationConnection:(id)a3 didRecognizePackage:(id)a4
{
  id v5;
  void *v6;
  NSObject *internalQueue;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a4;
  +[SFUtilities recognizedResultFromPackage:](SFUtilities, "recognizedResultFromPackage:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73___SFSpeechRecognitionBlockTask_dictationConnection_didRecognizePackage___block_invoke;
  block[3] = &unk_1E6485CE0;
  block[4] = self;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(internalQueue, block);

}

- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  internalQueue = self->super._internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86___SFSpeechRecognitionBlockTask_dictationConnection_didRecognizeTokens_languageModel___block_invoke;
  v9[3] = &unk_1E6486378;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(internalQueue, v9);

}

- (void)localSpeechRecognitionClientSpeechRecordingDidCancel:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFSpeechRecognitionBlockTask;
  -[SFSpeechRecognitionTask localSpeechRecognitionClientSpeechRecordingDidCancel:](&v6, sel_localSpeechRecognitionClientSpeechRecordingDidCancel_, a3);
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86___SFSpeechRecognitionBlockTask_localSpeechRecognitionClientSpeechRecordingDidCancel___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)localSpeechRecognitionClient:(id)a3 speechRecordingDidFail:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[5];
  id v10;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SFSpeechRecognitionBlockTask;
  -[SFSpeechRecognitionTask localSpeechRecognitionClient:speechRecordingDidFail:](&v11, sel_localSpeechRecognitionClient_speechRecordingDidFail_, a3, v6);
  internalQueue = self->super._internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __85___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_speechRecordingDidFail___block_invoke;
  v9[3] = &unk_1E6486378;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(internalQueue, v9);

}

- (void)localSpeechRecognitionClient:(id)a3 speechRecognitionDidFail:(id)a4
{
  NSObject *internalQueue;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SFSpeechRecognitionBlockTask;
  -[SFSpeechRecognitionTask localSpeechRecognitionClient:speechRecognitionDidFail:](&v7, sel_localSpeechRecognitionClient_speechRecognitionDidFail_, a3, a4);
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_speechRecognitionDidFail___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)localSpeechRecognitionClient:(id)a3 didRecognizePartialResult:(id)a4 rawPartialResult:(id)a5
{
  id v7;
  id v8;
  NSObject *internalQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_didRecognizePartialResult_rawPartialResult___block_invoke;
  block[3] = &unk_1E6485CE0;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(internalQueue, block);

}

- (void)localSpeechRecognitionClient:(id)a3 didFinishRecognition:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  internalQueue = self->super._internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83___SFSpeechRecognitionBlockTask_localSpeechRecognitionClient_didFinishRecognition___block_invoke;
  v8[3] = &unk_1E6486378;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(internalQueue, v8);

}

- (void)localSpeechRecognitionClientSpeechRecognitionDidSucceed:(id)a3
{
  NSObject *internalQueue;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFSpeechRecognitionBlockTask;
  -[SFSpeechRecognitionTask localSpeechRecognitionClientSpeechRecognitionDidSucceed:](&v6, sel_localSpeechRecognitionClientSpeechRecognitionDidSucceed_, a3);
  internalQueue = self->super._internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89___SFSpeechRecognitionBlockTask_localSpeechRecognitionClientSpeechRecognitionDidSucceed___block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
}

- (uint64_t)_finalizeResultHandler
{
  uint64_t v1;
  void *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 48));
    if (!*(_BYTE *)(v1 + 96))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], 203, 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFSpeechRecognitionBlockTask _fireResultHandlerWithResult:error:](v1, 0, v2);

    }
    v3 = *(void **)(v1 + 88);
    *(_QWORD *)(v1 + 88) = 0;

    objc_msgSend(*(id *)(v1 + 8), "stopSpeechWithOptions:", 0);
    return objc_msgSend(*(id *)(v1 + 16), "stopSpeech");
  }
  return result;
}

- (void)_fireResultHandlerWithResult:(void *)a3 error:
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    v7 = objc_msgSend(v5, "isFinal");
    if (v6 || v7)
      *(_BYTE *)(a1 + 96) = 1;
    v8 = (void *)objc_msgSend(*(id *)(a1 + 88), "copy");
    v9 = v8;
    if (v8)
    {
      v10 = *(void **)(a1 + 24);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __68___SFSpeechRecognitionBlockTask__fireResultHandlerWithResult_error___block_invoke;
      v11[3] = &unk_1E6485AA8;
      v14 = v8;
      v12 = v5;
      v13 = v6;
      objc_msgSend(v10, "addOperationWithBlock:", v11);

    }
  }

}

@end
