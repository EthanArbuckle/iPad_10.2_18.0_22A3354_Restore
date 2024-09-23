@implementation SFSpeechAudioBufferRecognitionRequest

- (id)_initWithNarrowband:(BOOL)a3
{
  SFSpeechAudioBufferRecognitionRequest *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFSpeechAudioBufferRecognitionRequest;
  v4 = -[SFSpeechRecognitionRequest init](&v8, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.SFSpeechAudioBufferRecognitionRequest", 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v5;

    v4->_narrowband = a3;
  }
  return v4;
}

- (SFSpeechAudioBufferRecognitionRequest)init
{
  return (SFSpeechAudioBufferRecognitionRequest *)-[SFSpeechAudioBufferRecognitionRequest _initWithNarrowband:](self, "_initWithNarrowband:", 0);
}

- (AVAudioFormat)nativeAudioFormat
{
  _OWORD v3[2];
  uint64_t v4;

  v3[0] = SupportedASBD;
  v3[1] = unk_1B25E26C8;
  v4 = 16;
  if (self->_narrowband)
    *(_QWORD *)&v3[0] = 0x40BF400000000000;
  return (AVAudioFormat *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:", v3);
}

- (id)_startedConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6
{
  __CFString *v11;
  id v12;
  id v13;
  id WeakRetained;
  id v15;
  void *v16;
  __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[6];

  v30[5] = *MEMORY[0x1E0C80C00];
  v11 = (__CFString *)a3;
  v12 = a4;
  v13 = a6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_bufferDelegate);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSpeechRecognitionRequest.m"), 485, CFSTR("%@ cannot be re-used"), objc_opt_class());

  }
  v15 = objc_alloc_init(MEMORY[0x1E0CFE888]);
  objc_msgSend(v15, "setDelegate:", v12);
  -[SFSpeechRecognitionRequest _dictationOptionsWithTaskHint:requestIdentifier:]((uint64_t)self, a5, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setFieldLabel:", CFSTR("SFSpeechPreecordedRequest"));
  if (!-[__CFString caseInsensitiveCompare:](v11, "caseInsensitiveCompare:", CFSTR("hi-IN-translit")))
  {
    v17 = CFSTR("hi-IN");

    objc_msgSend(v16, "setKeyboardIdentifier:", CFSTR("Translit"));
    v11 = CFSTR("hi-IN");
  }
  if (+[SFUtilities isSpeechXPCEnabled](SFUtilities, "isSpeechXPCEnabled"))
  {
    if (v11)
      v18 = v11;
    else
      v18 = CFSTR("none");
    v30[0] = v18;
    v29[0] = CFSTR("language");
    v29[1] = CFSTR("task");
    +[SFUtilities taskNameFromTaskHint:](SFUtilities, "taskNameFromTaskHint:", a5);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (v19)
      v21 = (const __CFString *)v19;
    else
      v21 = CFSTR("none");
    v30[1] = v21;
    v29[2] = CFSTR("narrowband");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_narrowband);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v22;
    v29[3] = CFSTR("appname");
    objc_msgSend(v16, "applicationName");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v23)
      v25 = (const __CFString *)v23;
    else
      v25 = CFSTR("none");
    v29[4] = CFSTR("ondevice");
    v30[3] = v25;
    v30[4] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    +[SFLocalSpeechRecognitionClient logCoreAnalyticsEvent:withAnalytics:](SFLocalSpeechRecognitionClient, "logCoreAnalyticsEvent:withAnalytics:", CFSTR("com.apple.speechapi.RequestStarted"), v26);
    -[SFSpeechRecognitionRequest _setAFDictationRequestParams:]((uint64_t)self, v26);

  }
  objc_msgSend(v15, "startRecordedAudioDictationWithOptions:forLanguage:", v16, v11);
  -[SFSpeechAudioBufferRecognitionRequest _handleAudioBuffersWithDelegate:]((uint64_t)self, v12);

  return v15;
}

- (id)_startedLocalConnectionWithLanguageCode:(id)a3 delegate:(id)a4 taskHint:(int64_t)a5 requestIdentifier:(id)a6 taskIdentifier:(id)a7
{
  SFSpeechRecognitionBufferDelegate **p_bufferDelegate;
  id v14;
  id v15;
  id v16;
  id v17;
  id WeakRetained;
  SFLocalSpeechRecognitionClient *v19;
  void *v20;
  void *v21;
  void *v23;

  p_bufferDelegate = &self->_bufferDelegate;
  v14 = a7;
  v15 = a6;
  v16 = a4;
  v17 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_bufferDelegate);

  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SFSpeechRecognitionRequest.m"), 517, CFSTR("%@ cannot be re-used"), objc_opt_class());

  }
  v19 = -[SFLocalSpeechRecognitionClient initWithDelegate:]([SFLocalSpeechRecognitionClient alloc], "initWithDelegate:", v16);
  -[SFSpeechRecognitionRequest _requestParametersWithTaskHint:requestIdentifier:taskIdentifier:narrowband:language:]((uint64_t)self, a5, v15, v14, self->_narrowband, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFSpeechRecognitionRequest _sandboxExtensionsWithError:]((uint64_t)self);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFLocalSpeechRecognitionClient initializeWithSandboxExtensions:](v19, "initializeWithSandboxExtensions:", v21);
  -[SFLocalSpeechRecognitionClient startRecordedAudioDictationWithParameters:](v19, "startRecordedAudioDictationWithParameters:", v20);
  -[SFSpeechAudioBufferRecognitionRequest _handleAudioBuffersWithDelegate:]((uint64_t)self, v16);

  return v19;
}

- (void)appendAudioPCMBuffer:(AVAudioPCMBuffer *)audioPCMBuffer
{
  AVAudioPCMBuffer *v4;
  NSObject *queue;
  AVAudioPCMBuffer *v6;
  _QWORD v7[5];
  AVAudioPCMBuffer *v8;

  v4 = audioPCMBuffer;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SFSpeechAudioBufferRecognitionRequest_appendAudioPCMBuffer___block_invoke;
  v7[3] = &unk_1E6486378;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)appendAudioSampleBuffer:(CMSampleBufferRef)sampleBuffer
{
  const opaqueCMFormatDescription *FormatDescription;
  void *v6;
  int32_t NumSamples;
  id v8;

  FormatDescription = CMSampleBufferGetFormatDescription(sampleBuffer);
  if (FormatDescription)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AA8]), "initWithStreamDescription:", CMAudioFormatDescriptionGetStreamBasicDescription(FormatDescription));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C89AC0]), "initWithPCMFormat:frameCapacity:", v8, CMSampleBufferGetNumSamples(sampleBuffer));
    objc_msgSend(v6, "setFrameLength:", CMSampleBufferGetNumSamples(sampleBuffer));
    NumSamples = CMSampleBufferGetNumSamples(sampleBuffer);
    CMSampleBufferCopyPCMDataIntoAudioBufferList(sampleBuffer, 0, NumSamples, (AudioBufferList *)objc_msgSend(v6, "mutableAudioBufferList"));
    -[SFSpeechAudioBufferRecognitionRequest appendAudioPCMBuffer:](self, "appendAudioPCMBuffer:", v6);

  }
}

- (void)endAudio
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SFSpeechAudioBufferRecognitionRequest_endAudio__block_invoke;
  block[3] = &unk_1E6486328;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_queuedBuffers, 0);
  objc_destroyWeak((id *)&self->_bufferDelegate);
}

void __49__SFSpeechAudioBufferRecognitionRequest_endAudio__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));

  v3 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
    -[SFSpeechAudioBufferRecognitionRequest _endAudio](v3);
  else
    *(_BYTE *)(v3 + 152) = 1;
}

- (void)_endAudio
{
  id WeakRetained;

  if (a1)
  {
    -[SFSpeechAudioBufferRecognitionRequest _drainAndClearAudioConverter](a1);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
    objc_msgSend(WeakRetained, "stopSpeech");

  }
}

- (void)_drainAndClearAudioConverter
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  if (*(_QWORD *)(a1 + 144))
  {
    while (1)
    {
      v2 = objc_alloc(MEMORY[0x1E0C89AC0]);
      objc_msgSend((id)a1, "nativeAudioFormat");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v2, "initWithPCMFormat:frameCapacity:", v3, 8000);

      objc_msgSend(v4, "setFrameLength:", 8000);
      v5 = *(void **)(a1 + 144);
      v12 = 0;
      v6 = objc_msgSend(v5, "convertToBuffer:error:withInputFromBlock:", v4, &v12, &__block_literal_global_1957);
      v7 = v12;
      v8 = v7;
      if (v6 == 2)
        break;
      if (v6 == 3)
      {
        NSLog(CFSTR("Could not drain converter %@"), v7);
        break;
      }
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)objc_msgSend(v4, "int16ChannelData"), 2 * objc_msgSend(v4, "frameLength"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "addRecordedSpeechSampleData:", v10);

      if (v6 == 1)
        break;

    }
    v11 = *(void **)(a1 + 144);
    *(_QWORD *)(a1 + 144) = 0;

  }
}

uint64_t __69__SFSpeechAudioBufferRecognitionRequest__drainAndClearAudioConverter__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = 2;
  return 0;
}

void __62__SFSpeechAudioBufferRecognitionRequest_appendAudioPCMBuffer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));

  v3 = *(_QWORD *)(a1 + 32);
  if (WeakRetained)
  {
    -[SFSpeechAudioBufferRecognitionRequest _appendAudioPCMBuffer:](*(id **)(a1 + 32), *(void **)(a1 + 40));
  }
  else
  {
    v4 = *(void **)(v3 + 128);
    if (v4)
    {
      v5 = v4;
      v6 = *(void **)(v3 + 128);
      *(_QWORD *)(v3 + 128) = v5;
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v8 + 128);
      *(_QWORD *)(v8 + 128) = v7;
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", *(_QWORD *)(a1 + 40));
  }
}

- (void)_appendAudioPCMBuffer:(id *)a1
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  _QWORD *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD *v32;
  id v33;
  _QWORD v34[3];
  char v35;

  v3 = a2;
  if (a1)
  {
    v29 = v3;
    objc_msgSend(a1, "nativeAudioFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "format");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if (v6)
    {
      -[SFSpeechAudioBufferRecognitionRequest _drainAndClearAudioConverter]((uint64_t)a1);
      v7 = (_QWORD *)objc_msgSend(v29, "int16ChannelData");
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__appendAudioPCMBuffer_, a1, CFSTR("SFSpeechRecognitionRequest.m"), 538, CFSTR("Invalid audio format"));

      }
      WeakRetained = objc_loadWeakRetained(a1 + 15);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *v7, 2 * objc_msgSend(v29, "frameLength"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "addRecordedSpeechSampleData:", v9);

    }
    else
    {
      v10 = v29;
      objc_msgSend(v10, "format");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "nativeAudioFormat");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[18], "inputFormat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v11);

      if ((v14 & 1) == 0)
      {
        -[SFSpeechAudioBufferRecognitionRequest _drainAndClearAudioConverter]((uint64_t)a1);
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C89A80]), "initFromFormat:toFormat:", v11, v12);
        v16 = a1[18];
        a1[18] = (id)v15;

        objc_msgSend(a1[18], "setSampleRateConverterQuality:", 127);
      }
      v28 = (void *)v12;
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      v35 = 0;
      while (1)
      {
        v17 = objc_alloc(MEMORY[0x1E0C89AC0]);
        objc_msgSend(a1, "nativeAudioFormat");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v17, "initWithPCMFormat:frameCapacity:", v18, 8000);

        objc_msgSend(v19, "setFrameLength:", 8000);
        v20 = a1[18];
        v33 = 0;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __66__SFSpeechAudioBufferRecognitionRequest__convertAndFeedPCMBuffer___block_invoke;
        v30[3] = &unk_1E64863E0;
        v32 = v34;
        v21 = v10;
        v31 = v21;
        v22 = objc_msgSend(v20, "convertToBuffer:error:withInputFromBlock:", v19, &v33, v30);
        v23 = v33;
        v24 = v23;
        if (v22 == 2)
          break;
        if (v22 == 3)
        {
          NSLog(CFSTR("Could not run audio converter %@"), v23);
          break;
        }
        v25 = objc_loadWeakRetained(a1 + 15);
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)objc_msgSend(v19, "int16ChannelData"), 2 * objc_msgSend(v19, "frameLength"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addRecordedSpeechSampleData:", v26);

        if (v22 == 1)
          goto LABEL_15;
      }

LABEL_15:
      _Block_object_dispose(v34, 8);

    }
    v3 = v29;
  }

}

id __66__SFSpeechAudioBufferRecognitionRequest__convertAndFeedPCMBuffer___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    *a3 = 1;
    return 0;
  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
    *a3 = 0;
    return *(id *)(a1 + 32);
  }
}

- (void)_handleAudioBuffersWithDelegate:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 136);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__SFSpeechAudioBufferRecognitionRequest__handleAudioBuffersWithDelegate___block_invoke;
    v6[3] = &unk_1E6486378;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __73__SFSpeechAudioBufferRecognitionRequest__handleAudioBuffersWithDelegate___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 128);
  if (objc_msgSend(v2, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[SFSpeechAudioBufferRecognitionRequest _appendAudioPCMBuffer:](*(id **)(a1 + 32), v8);
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 128);
  *(_QWORD *)(v9 + 128) = 0;

  v11 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v11 + 152))
    -[SFSpeechAudioBufferRecognitionRequest _endAudio](v11);

}

@end
