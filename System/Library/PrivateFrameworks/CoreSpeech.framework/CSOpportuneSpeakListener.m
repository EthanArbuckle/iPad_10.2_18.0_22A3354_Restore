@implementation CSOpportuneSpeakListener

- (CSOpportuneSpeakListener)init
{
  CSOpportuneSpeakListener *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *alignBufferQueue;
  CSSPGEndpointAnalyzer *v5;
  CSSPGEndpointAnalyzer *spgEndpointAnalyzer;
  uint64_t v7;
  NSMutableArray *remoteVADAlignBuffer;
  CSAudioTimeConverter *v9;
  CSAudioTimeConverter *audioTimeConverter;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CSOpportuneSpeakListener;
  v2 = -[CSOpportuneSpeakListener init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("RemoteVAD Align Queue", 0);
    alignBufferQueue = v2->_alignBufferQueue;
    v2->_alignBufferQueue = (OS_dispatch_queue *)v3;

    v5 = -[CSSPGEndpointAnalyzer initWithAnalyzeMode]([CSSPGEndpointAnalyzer alloc], "initWithAnalyzeMode");
    spgEndpointAnalyzer = v2->_spgEndpointAnalyzer;
    v2->_spgEndpointAnalyzer = v5;

    -[CSSPGEndpointAnalyzer setDelegate:](v2->_spgEndpointAnalyzer, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    remoteVADAlignBuffer = v2->_remoteVADAlignBuffer;
    v2->_remoteVADAlignBuffer = (NSMutableArray *)v7;

    v2->_remoteVADAlignCount = 0;
    v2->_runningSampleCount = 0;
    v9 = (CSAudioTimeConverter *)objc_alloc_init(MEMORY[0x1E0D19060]);
    audioTimeConverter = v2->_audioTimeConverter;
    v2->_audioTimeConverter = v9;

  }
  return v2;
}

- (void)startListenWithOption:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  CSPlainAudioFileWriter *v17;
  CSPlainAudioFileWriter *audioFileWriter;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CSAudioRecordContext *v24;
  CSAudioRecordContext *latestContext;
  CSAudioRecordContext *v26;
  NSObject *alignBufferQueue;
  CSXPCClient *v28;
  CSAudioRecordContext *v29;
  BOOL v30;
  id v31;
  void *v32;
  id v33;
  _QWORD block[5];
  _BYTE v35[40];
  _BYTE v36[40];
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __61__CSOpportuneSpeakListener_startListenWithOption_completion___block_invoke;
  v37[3] = &unk_1E7C290D8;
  v9 = v7;
  v38 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v37);
  v11 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    objc_msgSend(v6, "deviceId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v40 = "-[CSOpportuneSpeakListener startListenWithOption:completion:]";
    v41 = 2114;
    v42 = v13;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Start Listening request with deviceId : %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "opportuneSpeakingFileLoggingIsEnabled");

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0D18FE8];
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmNonInterleavedWithRemoteVADASBD");
    objc_msgSend(MEMORY[0x1E0D190F8], "lpcmInterleavedWithRemoteVADASBD");
    objc_msgSend(v16, "createAudioFileWriterForOpportuneSpeakListenerWithInputFormat:outputFormat:", v36, v35);
    v17 = (CSPlainAudioFileWriter *)objc_claimAutoreleasedReturnValue();
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v17;
  }
  else
  {
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = 0;
  }

  objc_msgSend(v6, "deviceId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    +[CSOpportuneSpeakListenerDeviceManager sharedManager](CSOpportuneSpeakListenerDeviceManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDeviceId:", v21);

    v22 = (void *)MEMORY[0x1E0D19008];
    objc_msgSend(v6, "deviceId");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "contextForHearstVoiceTriggerWithDeviceId:", v23);
    v24 = (CSAudioRecordContext *)objc_claimAutoreleasedReturnValue();
    latestContext = self->_latestContext;
    self->_latestContext = v24;

  }
  else
  {
    if (objc_msgSend(v6, "opportuneSpeakListeningType"))
    {
      if (objc_msgSend(v6, "opportuneSpeakListeningType") != 1)
        goto LABEL_14;
      objc_msgSend(MEMORY[0x1E0D19008], "contextForOpportuneSpeakerListenerWithCall");
      v26 = (CSAudioRecordContext *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D19008], "contextForOpportuneSpeakerListener");
      v26 = (CSAudioRecordContext *)objc_claimAutoreleasedReturnValue();
    }
    v23 = self->_latestContext;
    self->_latestContext = v26;
  }

LABEL_14:
  alignBufferQueue = self->_alignBufferQueue;
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __61__CSOpportuneSpeakListener_startListenWithOption_completion___block_invoke_9;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(alignBufferQueue, block);
  v28 = -[CSXPCClient initWithType:]([CSXPCClient alloc], "initWithType:", 1);
  -[CSXPCClient connect](v28, "connect");
  v29 = self->_latestContext;
  v33 = 0;
  v30 = -[CSXPCClient prepareAudioProviderWithContext:clientType:error:](v28, "prepareAudioProviderWithContext:clientType:error:", v29, 2, &v33);
  v31 = v33;
  if (v30)
  {
    objc_storeStrong((id *)&self->_audioStreamProvider, v28);
    objc_storeStrong((id *)&self->_audioSessionProvider, v28);
    if (self->_audioStreamProvider)
    {
      -[CSOpportuneSpeakListener _startRequestWithCompletion:](self, "_startRequestWithCompletion:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1004, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v32);

    }
  }
  else
  {
    ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v31);
  }

}

- (void)_resetAlignBuffer
{
  -[NSMutableArray removeAllObjects](self->_remoteVADAlignBuffer, "removeAllObjects");
  self->_remoteVADAlignCount = 0;
}

- (void)_startRequestWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  CSAudioStreamProviding *audioStreamProvider;
  objc_class *v10;
  void *v11;
  void *v12;
  id v13;
  float v14;
  void *v15;
  void *v16;
  NSObject *v17;
  float v18;
  int v19;
  int remoteVADSPGRatio;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD v25[5];
  void (**v26)(_QWORD, _QWORD, _QWORD);
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  _BYTE v33[10];
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __56__CSOpportuneSpeakListener__startRequestWithCompletion___block_invoke;
  v28[3] = &unk_1E7C290D8;
  v6 = v4;
  v29 = v6;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v28);
  if (self->_audioStreamProvider)
  {
    objc_msgSend(MEMORY[0x1E0D19058], "defaultRequestWithContext:", self->_latestContext);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequiresHistoricalBuffer:", 1);
    audioStreamProvider = self->_audioStreamProvider;
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    -[CSAudioStreamProviding audioStreamWithRequest:streamName:error:](audioStreamProvider, "audioStreamWithRequest:streamName:error:", v8, v11, &v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;

    if (v12)
    {
      -[CSOpportuneSpeakListener setAudioStream:](self, "setAudioStream:", v12);
      objc_msgSend(v12, "setDelegate:", self);
      -[CSSPGEndpointAnalyzer start](self->_spgEndpointAnalyzer, "start");
      if (-[CSSPGEndpointAnalyzer getFrameDurationMs](self->_spgEndpointAnalyzer, "getFrameDurationMs") >= 1)
      {
        objc_msgSend(MEMORY[0x1E0D19090], "remoteVADDuration");
        self->_remoteVADSPGRatio = (int)(float)((float)(v14 * 1000.0)
                                              / (float)-[CSSPGEndpointAnalyzer getFrameDurationMs](self->_spgEndpointAnalyzer, "getFrameDurationMs"));
        v15 = (void *)*MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        {
          v16 = (void *)MEMORY[0x1E0D19090];
          v17 = v15;
          objc_msgSend(v16, "remoteVADDuration");
          LODWORD(v16) = (int)(float)(v18 * 1000.0);
          v19 = -[CSSPGEndpointAnalyzer getFrameDurationMs](self->_spgEndpointAnalyzer, "getFrameDurationMs");
          remoteVADSPGRatio = self->_remoteVADSPGRatio;
          *(_DWORD *)buf = 136315906;
          v31 = "-[CSOpportuneSpeakListener _startRequestWithCompletion:]";
          v32 = 1026;
          *(_DWORD *)v33 = (_DWORD)v16;
          *(_WORD *)&v33[4] = 1026;
          *(_DWORD *)&v33[6] = v19;
          v34 = 1026;
          v35 = remoteVADSPGRatio;
          _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_DEFAULT, "%s remoteVADDuration = %{public}d, spgDuration = %{public}d, _remoteVADSPGRatio = %{public}d", buf, 0x1Eu);

        }
      }
      objc_msgSend(MEMORY[0x1E0D19030], "noAlertOption");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v5;
      v25[1] = 3221225472;
      v25[2] = __56__CSOpportuneSpeakListener__startRequestWithCompletion___block_invoke_16;
      v25[3] = &unk_1E7C29128;
      v25[4] = self;
      v26 = v7;
      objc_msgSend(v12, "startAudioStreamWithOption:completion:", v21, v25);

    }
    else
    {
      v22 = (void *)*MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        objc_msgSend(v13, "localizedDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v31 = "-[CSOpportuneSpeakListener _startRequestWithCompletion:]";
        v32 = 2114;
        *(_QWORD *)v33 = v24;
        _os_log_error_impl(&dword_1C2614000, v23, OS_LOG_TYPE_ERROR, "%s AudioStreamRequest has failed : %{public}@", buf, 0x16u);

      }
      ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v13);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1004, 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v7)[2](v7, 0, v13);
  }

}

- (void)stopListenWithStateReset:(BOOL)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  void (**v14)(_QWORD, _QWORD, _QWORD);
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__CSOpportuneSpeakListener_stopListenWithStateReset_completion___block_invoke;
  v15[3] = &unk_1E7C29128;
  v15[4] = self;
  v7 = v5;
  v16 = v7;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3BC4734](v15);
  v9 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[CSOpportuneSpeakListener stopListenWithStateReset:completion:]";
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_DEFAULT, "%s Request stop CSOpportuneSpeakListener", buf, 0xCu);
  }
  -[CSOpportuneSpeakListener audioStream](self, "audioStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[CSOpportuneSpeakListener audioStream](self, "audioStream");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    v13[1] = 3221225472;
    v13[2] = __64__CSOpportuneSpeakListener_stopListenWithStateReset_completion___block_invoke_20;
    v13[3] = &unk_1E7C29128;
    v13[4] = self;
    v14 = v8;
    objc_msgSend(v11, "stopAudioStreamWithOption:completion:", 0, v13);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18E80], 1003, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v12);

  }
}

- (void)stopListenWithCompletion:(id)a3
{
  -[CSOpportuneSpeakListener stopListenWithStateReset:completion:](self, "stopListenWithStateReset:completion:", 0, a3);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  id WeakRetained;
  char v6;
  id v7;

  -[CSSPGEndpointAnalyzer stop](self->_spgEndpointAnalyzer, "stop", a3, a4);
  -[CSOpportuneSpeakListener setAudioStream:](self, "setAudioStream:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "opportuneSpeakListener:didStopUnexpectedly:", self, 1);

  }
  -[CSPlainAudioFileWriter endAudio](self->_audioFileWriter, "endAudio");
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5;
  uint64_t v6;
  CSAudioTimeConverter *audioTimeConverter;
  unint64_t v8;
  CSSPGEndpointAnalyzer *spgEndpointAnalyzer;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  void *v19;
  char v20;
  NSObject *alignBufferQueue;
  char v22;
  void *v23;
  int v24;
  float v25;
  float v26;
  float v27;
  unint64_t v28;
  double v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _QWORD v33[5];
  char v34;
  uint8_t buf[4];
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_msgSend(v5, "numSamples");
  audioTimeConverter = self->_audioTimeConverter;
  v8 = self->_runningSampleCount + v6;
  self->_runningSampleCount = v8;
  -[CSAudioTimeConverter processSampleCount:hostTime:](audioTimeConverter, "processSampleCount:hostTime:", v8, objc_msgSend(v5, "hostTime"));
  spgEndpointAnalyzer = self->_spgEndpointAnalyzer;
  objc_msgSend(v5, "dataForChannel:", objc_msgSend(MEMORY[0x1E0D19090], "channelForProcessedInput"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSPGEndpointAnalyzer addAudio:numSamples:](spgEndpointAnalyzer, "addAudio:numSamples:", v10, objc_msgSend(v5, "numSamples"));

  objc_msgSend(v5, "remoteVAD");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v5, "remoteVAD");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "bytes");

    objc_msgSend(v5, "remoteVAD");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "length");

    if (v15 >= 1)
    {
      v16 = 0;
      v17 = MEMORY[0x1E0C809B0];
      do
      {
        v18 = *(unsigned __int8 *)(v13 + v16);
        objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "opportuneSpeakListenerBypassEnabled");

        alignBufferQueue = self->_alignBufferQueue;
        if (v18)
          v22 = 1;
        else
          v22 = v20;
        v33[0] = v17;
        v33[1] = 3221225472;
        v33[2] = __69__CSOpportuneSpeakListener_audioStreamProvider_audioBufferAvailable___block_invoke;
        v33[3] = &unk_1E7C28480;
        v33[4] = self;
        v34 = v22;
        dispatch_async(alignBufferQueue, v33);
        ++v16;
        objc_msgSend(v5, "remoteVAD");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

      }
      while (v16 < v24);
    }
    if (self->_audioFileWriter)
    {
      objc_msgSend(MEMORY[0x1E0D19090], "remoteVADDuration");
      v26 = v25;
      objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
      v28 = (unint64_t)(float)(v26 * v27);
      LODWORD(v29) = 1176256512;
      objc_msgSend(v5, "dataWithRemoteVADWithScaleFactor:numAudioSamplesPerRemoteVAD:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30;
      if (v30)
      {
        -[CSPlainAudioFileWriter addSamples:numSamples:](self->_audioFileWriter, "addSamples:numSamples:", objc_msgSend(objc_retainAutorelease(v30), "bytes"), objc_msgSend(v5, "numSamples"));
      }
      else
      {
        v32 = *MEMORY[0x1E0D18F60];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v36 = "-[CSOpportuneSpeakListener audioStreamProvider:audioBufferAvailable:]";
          _os_log_error_impl(&dword_1C2614000, v32, OS_LOG_TYPE_ERROR, "%s Audio coming from DoAP should contains RemoteVAD", buf, 0xCu);
        }
      }

    }
  }

}

- (void)_addRemoteVADSignal:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  NSMutableArray *remoteVADAlignBuffer;
  void *v7;

  if (self->_remoteVADSPGRatio >= 1)
  {
    v3 = a3;
    v5 = 0;
    do
    {
      remoteVADAlignBuffer = self->_remoteVADAlignBuffer;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](remoteVADAlignBuffer, "addObject:", v7);

      ++v5;
    }
    while (v5 < self->_remoteVADSPGRatio);
  }
}

- (BOOL)_popRemoteVADSignal
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = -[NSMutableArray count](self->_remoteVADAlignBuffer, "count");
  if (v3)
  {
    -[NSMutableArray objectAtIndex:](self->_remoteVADAlignBuffer, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    -[NSMutableArray removeObjectAtIndex:](self->_remoteVADAlignBuffer, "removeObjectAtIndex:", 0);
    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_shouldReportBoron
{
  unint64_t remoteVADAlignCount;

  remoteVADAlignCount = self->_remoteVADAlignCount;
  self->_remoteVADAlignCount = remoteVADAlignCount + 1;
  return remoteVADAlignCount & (-[CSAudioRecordContext type](self->_latestContext, "type") != 19);
}

- (void)spgEndpointAnalyzer:(id)a3 hasSilenceScoreEstimate:(double)a4 clientProcessedAudioTimeMS:(float)a5
{
  id v8;
  NSObject *alignBufferQueue;
  id WeakRetained;
  char v11;
  id v12;
  float v13;
  unint64_t v14;
  void *v15;
  unsigned int v16;
  id v17;
  char v18;
  id v19;
  double v20;
  id v21;
  uint64_t v22;
  char v23;
  NSObject *v24;
  int v25;
  int v26;
  _QWORD block[7];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  double v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  alignBufferQueue = self->_alignBufferQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__CSOpportuneSpeakListener_spgEndpointAnalyzer_hasSilenceScoreEstimate_clientProcessedAudioTimeMS___block_invoke;
  block[3] = &unk_1E7C27C98;
  block[4] = self;
  block[5] = &v32;
  block[6] = &v28;
  dispatch_sync(alignBufferQueue, block);
  if (*((_BYTE *)v33 + 24))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      v12 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v12, "opportuneSpeakListener:hasRemoteVADAvailable:", self, *((unsigned __int8 *)v29 + 24));

    }
  }
  objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
  v14 = -[CSAudioTimeConverter hostTimeFromSampleCount:](self->_audioTimeConverter, "hostTimeFromSampleCount:", (unint64_t)(float)((float)(v13 / 1000.0) * a5));
  objc_msgSend(MEMORY[0x1E0D19110], "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "opportuneSpeakListenerBypassEnabled");

  v17 = objc_loadWeakRetained((id *)&self->_delegate);
  v18 = objc_opt_respondsToSelector();

  v19 = objc_loadWeakRetained((id *)&self->_delegate);
  v21 = v19;
  v22 = (a4 <= 0.150000006) | v16;
  if ((v18 & 1) != 0)
  {
    *(float *)&v20 = (float)v14;
    objc_msgSend(v19, "opportuneSpeakListener:hasVADAvailable:withHostTime:", self, v22, v20);
  }
  else
  {
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) == 0)
      goto LABEL_9;
    v21 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v21, "opportuneSpeakListener:hasVADAvailable:", self, v22);
  }

LABEL_9:
  v24 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v25 = *((unsigned __int8 *)v29 + 24);
    v26 = *((unsigned __int8 *)v33 + 24);
    *(_DWORD *)buf = 136315906;
    v37 = "-[CSOpportuneSpeakListener spgEndpointAnalyzer:hasSilenceScoreEstimate:clientProcessedAudioTimeMS:]";
    v38 = 1026;
    v39 = v25;
    v40 = 1026;
    v41 = v26;
    v42 = 2050;
    v43 = a4;
    _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_DEFAULT, "%s boronScore : %{public}d, reportBoron : %{public}d, slienceScore : %{public}lf", buf, 0x22u);
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

}

- (CSOpportuneSpeakListenerDelegate)delegate
{
  return (CSOpportuneSpeakListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioStream:(id)a3
{
  objc_storeStrong((id *)&self->_audioStream, a3);
}

- (CSSPGEndpointAnalyzer)spgEndpointAnalyzer
{
  return self->_spgEndpointAnalyzer;
}

- (void)setSpgEndpointAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_spgEndpointAnalyzer, a3);
}

- (int)remoteVADSPGRatio
{
  return self->_remoteVADSPGRatio;
}

- (void)setRemoteVADSPGRatio:(int)a3
{
  self->_remoteVADSPGRatio = a3;
}

- (CSAudioStreamProviding)audioStreamProvider
{
  return self->_audioStreamProvider;
}

- (void)setAudioStreamProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioStreamProvider, a3);
}

- (CSAudioSessionProviding)audioSessionProvider
{
  return self->_audioSessionProvider;
}

- (void)setAudioSessionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_audioSessionProvider, a3);
}

- (CSAudioRecordContext)latestContext
{
  return self->_latestContext;
}

- (void)setLatestContext:(id)a3
{
  objc_storeStrong((id *)&self->_latestContext, a3);
}

- (BOOL)isMediaPlayingNow
{
  return self->_isMediaPlayingNow;
}

- (void)setIsMediaPlayingNow:(BOOL)a3
{
  self->_isMediaPlayingNow = a3;
}

- (NSMutableArray)remoteVADAlignBuffer
{
  return self->_remoteVADAlignBuffer;
}

- (void)setRemoteVADAlignBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteVADAlignBuffer, a3);
}

- (unint64_t)remoteVADAlignCount
{
  return self->_remoteVADAlignCount;
}

- (void)setRemoteVADAlignCount:(unint64_t)a3
{
  self->_remoteVADAlignCount = a3;
}

- (OS_dispatch_queue)alignBufferQueue
{
  return self->_alignBufferQueue;
}

- (void)setAlignBufferQueue:(id)a3
{
  objc_storeStrong((id *)&self->_alignBufferQueue, a3);
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setAudioFileWriter:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileWriter, a3);
}

- (unint64_t)runningSampleCount
{
  return self->_runningSampleCount;
}

- (void)setRunningSampleCount:(unint64_t)a3
{
  self->_runningSampleCount = a3;
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setAudioTimeConverter:(id)a3
{
  objc_storeStrong((id *)&self->_audioTimeConverter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_alignBufferQueue, 0);
  objc_storeStrong((id *)&self->_remoteVADAlignBuffer, 0);
  objc_storeStrong((id *)&self->_latestContext, 0);
  objc_storeStrong((id *)&self->_audioSessionProvider, 0);
  objc_storeStrong((id *)&self->_audioStreamProvider, 0);
  objc_storeStrong((id *)&self->_spgEndpointAnalyzer, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __99__CSOpportuneSpeakListener_spgEndpointAnalyzer_hasSilenceScoreEstimate_clientProcessedAudioTimeMS___block_invoke(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_shouldReportBoron");
  result = objc_msgSend(*(id *)(a1 + 32), "_popRemoteVADSignal");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __69__CSOpportuneSpeakListener_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRemoteVADSignal:", *(unsigned __int8 *)(a1 + 40));
}

void __64__CSOpportuneSpeakListener_stopListenWithStateReset_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[CSOpportuneSpeakListener stopListenWithStateReset:completion:]_block_invoke";
    v12 = 1026;
    v13 = a2;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s CSOpportuneSpeakListener received didStop : %{public}d, %{public}@", (uint8_t *)&v10, 0x1Cu);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "endAudio");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

void __64__CSOpportuneSpeakListener_stopListenWithStateReset_completion___block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5 = a3;
  objc_msgSend(v4, "stop");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __56__CSOpportuneSpeakListener__startRequestWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    objc_msgSend(v5, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "-[CSOpportuneSpeakListener _startRequestWithCompletion:]_block_invoke";
    v12 = 1026;
    v13 = a2;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s CSOpportuneSpeakListener received didStart : %{public}d, %{public}@", (uint8_t *)&v10, 0x1Cu);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);

}

void __56__CSOpportuneSpeakListener__startRequestWithCompletion___block_invoke_16(uint64_t a1, int a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    if (objc_msgSend(MEMORY[0x1E0D19260], "supportsUnderstandingOnDevice"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44468]), "initWithDelegate:", 0);
      objc_msgSend(MEMORY[0x1E0D19260], "getSiriLanguageWithFallback:", CFSTR("en-US"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "preheatLocalSpeechRecognitionWithLanguage:source:", v6, 3);

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "stop");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __61__CSOpportuneSpeakListener_startListenWithOption_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __61__CSOpportuneSpeakListener_startListenWithOption_completion___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetAlignBuffer");
}

@end
