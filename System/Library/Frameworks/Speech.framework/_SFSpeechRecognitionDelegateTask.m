@implementation _SFSpeechRecognitionDelegateTask

- (id)_initWithRequest:(id)a3 queue:(id)a4 languageCode:(id)a5 taskHint:(int64_t)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id *v14;
  id *v15;
  void *v16;
  char v17;
  objc_super v19;

  v12 = a3;
  v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_SFSpeechRecognitionDelegateTask;
  v14 = -[SFSpeechRecognitionTask _initWithRequest:queue:languageCode:taskHint:](&v19, sel__initWithRequest_queue_languageCode_taskHint_, v12, a4, a5, a6);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak(v14 + 11, v13);
    objc_msgSend(v12, "_searchRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      v17 = objc_msgSend(v12, "requiresOnDeviceRecognition") ^ 1;
    else
      v17 = 0;
    *((_BYTE *)v15 + 112) = v17;

    objc_storeStrong(v15 + 13, v15);
  }

  return v15;
}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFSpeechRecognitionDelegateTask;
  -[SFSpeechRecognitionTask dictationConnectionSpeechRecordingDidCancel:](&v4, sel_dictationConnectionSpeechRecordingDidCancel_, a3);
  -[_SFSpeechRecognitionDelegateTask _handleSpeechRecordingDidCancel]((uint64_t)self);
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFSpeechRecognitionDelegateTask;
  -[SFSpeechRecognitionTask dictationConnection:speechRecordingDidFail:](&v5, sel_dictationConnection_speechRecordingDidFail_, a3, a4);
  -[_SFSpeechRecognitionDelegateTask _tellDelegateDidFinishSuccessfully:]((uint64_t)self, 0);
}

- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3
{
  id WeakRetained;
  NSOperationQueue *externalQueue;
  _QWORD v6[4];
  id v7;
  _SFSpeechRecognitionDelegateTask *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    externalQueue = self->super._externalQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __77___SFSpeechRecognitionDelegateTask_dictationConnectionSpeechRecordingDidEnd___block_invoke;
    v6[3] = &unk_1E6486378;
    v7 = WeakRetained;
    v8 = self;
    -[NSOperationQueue addOperationWithBlock:](externalQueue, "addOperationWithBlock:", v6);

  }
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFSpeechRecognitionDelegateTask;
  -[SFSpeechRecognitionTask dictationConnection:speechRecognitionDidFail:](&v5, sel_dictationConnection_speechRecognitionDidFail_, a3, a4);
  -[_SFSpeechRecognitionDelegateTask _tellDelegateDidFinishSuccessfully:]((uint64_t)self, 0);
}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFSpeechRecognitionDelegateTask;
  -[SFSpeechRecognitionTask dictationConnectionSpeechRecognitionDidSucceed:](&v4, sel_dictationConnectionSpeechRecognitionDidSucceed_, a3);
  -[_SFSpeechRecognitionDelegateTask _tellDelegateDidFinishSuccessfully:]((uint64_t)self, 1);
}

- (void)dictationConnection:(id)a3 didRecognizePackage:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  _SFSpeechRecognitionDelegateTask *v10;

  v5 = a4;
  internalQueue = self->super._internalQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76___SFSpeechRecognitionDelegateTask_dictationConnection_didRecognizePackage___block_invoke;
  v8[3] = &unk_1E6486378;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(internalQueue, v8);

}

- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  _SFSpeechRecognitionDelegateTask *v11;

  v6 = a4;
  internalQueue = self->super._internalQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __89___SFSpeechRecognitionDelegateTask_dictationConnection_didRecognizeTokens_languageModel___block_invoke;
  v9[3] = &unk_1E6486378;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(internalQueue, v9);

}

- (void)dictationConnection:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7
{
  id v11;
  id v12;
  NSObject *internalQueue;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;
  BOOL v20;

  v11 = a4;
  v12 = a5;
  internalQueue = self->super._internalQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __108___SFSpeechRecognitionDelegateTask_dictationConnection_didReceiveSearchResults_recognizedText_stable_final___block_invoke;
  v16[3] = &unk_1E6485400;
  v16[4] = self;
  v17 = v11;
  v18 = v12;
  v19 = a6;
  v20 = a7;
  v14 = v12;
  v15 = v11;
  dispatch_async(internalQueue, v16);

}

- (void)localSpeechRecognitionClientSpeechRecordingDidCancel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFSpeechRecognitionDelegateTask;
  -[SFSpeechRecognitionTask localSpeechRecognitionClientSpeechRecordingDidCancel:](&v4, sel_localSpeechRecognitionClientSpeechRecordingDidCancel_, a3);
  -[_SFSpeechRecognitionDelegateTask _handleSpeechRecordingDidCancel]((uint64_t)self);
}

- (void)localSpeechRecognitionClient:(id)a3 speechRecordingDidFail:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFSpeechRecognitionDelegateTask;
  -[SFSpeechRecognitionTask localSpeechRecognitionClient:speechRecordingDidFail:](&v5, sel_localSpeechRecognitionClient_speechRecordingDidFail_, a3, a4);
  -[_SFSpeechRecognitionDelegateTask _tellDelegateDidFinishSuccessfully:]((uint64_t)self, 0);
}

- (void)localSpeechRecognitionClient:(id)a3 speechRecognitionDidFail:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_SFSpeechRecognitionDelegateTask;
  -[SFSpeechRecognitionTask localSpeechRecognitionClient:speechRecognitionDidFail:](&v5, sel_localSpeechRecognitionClient_speechRecognitionDidFail_, a3, a4);
  -[_SFSpeechRecognitionDelegateTask _tellDelegateDidFinishSuccessfully:]((uint64_t)self, 0);
}

- (void)localSpeechRecognitionClient:(id)a3 didRecognizePartialResult:(id)a4 rawPartialResult:(id)a5
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
  v9[2] = __108___SFSpeechRecognitionDelegateTask_localSpeechRecognitionClient_didRecognizePartialResult_rawPartialResult___block_invoke;
  v9[3] = &unk_1E6486378;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(internalQueue, v9);

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
  v8[2] = __86___SFSpeechRecognitionDelegateTask_localSpeechRecognitionClient_didFinishRecognition___block_invoke;
  v8[3] = &unk_1E6486378;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(internalQueue, v8);

}

- (void)localSpeechRecognitionClientSpeechRecognitionDidSucceed:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_SFSpeechRecognitionDelegateTask;
  -[SFSpeechRecognitionTask localSpeechRecognitionClientSpeechRecognitionDidSucceed:](&v4, sel_localSpeechRecognitionClientSpeechRecognitionDidSucceed_, a3);
  -[_SFSpeechRecognitionDelegateTask _tellDelegateDidFinishSuccessfully:]((uint64_t)self, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selfReference, 0);
  objc_storeStrong((id *)&self->_recognitionResultToReportAfterFinalSearchResults, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_tellDelegateDidFinishSuccessfully:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[5];
  char v4;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 48);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __71___SFSpeechRecognitionDelegateTask__tellDelegateDidFinishSuccessfully___block_invoke;
    v3[3] = &unk_1E6485478;
    v3[4] = a1;
    v4 = a2;
    dispatch_async(v2, v3);
  }
}

- (void)_handleDidProcessAudioDuration:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 48);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __67___SFSpeechRecognitionDelegateTask__handleDidProcessAudioDuration___block_invoke;
    v3[3] = &unk_1E6485C68;
    v3[4] = a1;
    *(double *)&v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

- (void)_handleDidFinishRecognition:(uint64_t)a1
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;

  v4 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    if (*(_BYTE *)(a1 + 112))
    {
      objc_storeStrong((id *)(a1 + 96), a2);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
      v6 = *(void **)(a1 + 24);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __64___SFSpeechRecognitionDelegateTask__handleDidFinishRecognition___block_invoke;
      v8[3] = &unk_1E6485CE0;
      v9 = WeakRetained;
      v10 = a1;
      v11 = v4;
      v7 = WeakRetained;
      objc_msgSend(v6, "addOperationWithBlock:", v8);

    }
  }

}

- (void)_handleDidRecognizePartialResult:(uint64_t)a1
{
  id v3;
  char v4;
  char v5;
  id WeakRetained;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  char v13;
  char v14;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    if (objc_msgSend(*(id *)(a1 + 40), "shouldReportPartialResults"))
    {
      v4 = *(_BYTE *)(a1 + 112);
      v5 = *(_BYTE *)(a1 + 113);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
      v7 = *(void **)(a1 + 24);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __69___SFSpeechRecognitionDelegateTask__handleDidRecognizePartialResult___block_invoke;
      v9[3] = &unk_1E6485400;
      v10 = WeakRetained;
      v11 = a1;
      v12 = v3;
      v13 = v4;
      v14 = v5;
      v8 = WeakRetained;
      objc_msgSend(v7, "addOperationWithBlock:", v9);

    }
  }

}

- (void)_handleSpeechRecordingDidCancel
{
  id WeakRetained;
  char v3;
  void *v4;
  _QWORD v5[5];

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    v3 = objc_opt_respondsToSelector();

    if ((v3 & 1) != 0)
    {
      v4 = *(void **)(a1 + 24);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __67___SFSpeechRecognitionDelegateTask__handleSpeechRecordingDidCancel__block_invoke;
      v5[3] = &unk_1E6486328;
      v5[4] = a1;
      objc_msgSend(v4, "addOperationWithBlock:", v5);
    }
  }
}

@end
