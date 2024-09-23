@implementation AXLTSpeechTranscriber

- (AXLTSpeechTranscriber)initWithDelegate:(id)a3
{
  id v4;
  AXLTSpeechTranscriber *v5;
  AXLTSpeechTranscriber *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXLTSpeechTranscriber;
  v5 = -[AXLTSpeechTranscriber init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_pid = -4;
    v6->_isTranscribing = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel_audioEngineConfigurationDidChange_, *MEMORY[0x24BDB1580], 0);

  }
  return v6;
}

- (BOOL)startTranscription:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSDate *v16;
  NSDate *sessionStartTime;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v23;

  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXLTSpeechTranscriber startTranscription:].cold.2(v4, v5, v6, v7, v8, v9, v10, v11);

  if (!-[AXLTSpeechTranscriber isTranscribing](self, "isTranscribing"))
  {
    +[AXLTTranscriber sharedInstance](AXLTTranscriber, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLTSpeechTranscriber setTranscriber:](self, "setTranscriber:", v13);

    -[AXLTSpeechTranscriber transcriber](self, "transcriber");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "downloadState");

    if (v15 == -1)
    {
      -[AXLTSpeechTranscriber transcriber](self, "transcriber");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDownloadState:", -2);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
      sessionStartTime = self->_sessionStartTime;
      self->_sessionStartTime = v16;

      -[AXLTSpeechTranscriber setupAudioSession](self, "setupAudioSession");
      -[AXLTSpeechTranscriber initializeAudioTap](self, "initializeAudioTap");
      -[AXLTSpeechTranscriber audioEngine](self, "audioEngine");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "prepare");

      -[AXLTSpeechTranscriber audioEngine](self, "audioEngine");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      objc_msgSend(v19, "startAndReturnError:", &v23);
      v20 = v23;

      if (!v20)
        goto LABEL_10;
      AXLogLiveTranscription();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[AXLTSpeechTranscriber startTranscription:].cold.1(v20, v21);

      if (objc_msgSend(v20, "code") == -10868)
      {
LABEL_10:
        v12 = 1;
        -[AXLTSpeechTranscriber setIsTranscribing:](self, "setIsTranscribing:", 1);
LABEL_14:

        return v12;
      }
      -[AXLTSpeechTranscriber cleanUp](self, "cleanUp");
    }
    v12 = 0;
    goto LABEL_14;
  }
  return 1;
}

- (void)initializeAudioTap
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D27A000, v0, v1, "error initializing audio engine: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__AXLTSpeechTranscriber_initializeAudioTap__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __43__AXLTSpeechTranscriber_initializeAudioTap__block_invoke_cold_1(v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "setupTranscriberIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "calcHistogramForBuffer:", v3);
  objc_msgSend(*(id *)(a1 + 32), "transcriber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendAudioPCMBuffer:forPID:", v3, objc_msgSend(*(id *)(a1 + 32), "pid"));

  +[AXLTAudioTextDumper sharedInstance](AXLTAudioTextDumper, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionStartTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveAudioBuffer:appName:sessionStartTime:", v3, CFSTR("Mic"), v7);

  objc_msgSend(*(id *)(a1 + 32), "bufferLogTime");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_5;
  v9 = (void *)v8;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bufferLogTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  if (v13 > 5.0)
  {
LABEL_5:
    AXLogLiveTranscription();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v3, "frameCapacity"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_22D27A000, v14, OS_LOG_TYPE_DEFAULT, "Sent audio buffer with size: %@ for Mic", (uint8_t *)&v17, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setBufferLogTime:", v16);

  }
}

- (void)setupAudioSession
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D27A000, v0, v1, "Audio session setup category error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mediaServicesWereReset:(id)a3
{
  id v3;
  NSObject *v4;

  v3 = a3;
  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[AXLTSpeechTranscriber mediaServicesWereReset:].cold.1();

}

- (void)setupTranscriberIfNeeded
{
  void *v3;
  char v4;
  _QWORD block[5];

  -[AXLTSpeechTranscriber transcriber](self, "transcriber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscribingForPID:", -[AXLTSpeechTranscriber pid](self, "pid"));

  if ((v4 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke;
    block[3] = &unk_24F874E30;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[4];
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "transcriber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "pid");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_2;
  v5[3] = &unk_24F874E08;
  v6 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_195;
  v4[3] = &unk_24F874E30;
  v4[4] = v6;
  objc_msgSend(v2, "startTranscriptionForPID:appName:callback:completionCallback:", v3, CFSTR("liveCaptions.microphone"), v5, v4);

}

void __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AXLTTranscribedData *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  AXLTTranscribedData *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  AXLogLiveTranscription();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_2_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "textLogTime");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textLogTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  if (v12 > 5.0)
  {
LABEL_5:
    AXLogLiveTranscription();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "formattedString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v29 = v16;
      _os_log_impl(&dword_22D27A000, v13, OS_LOG_TYPE_DEFAULT, "Transcribed text: %@ for Mic", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setTextLogTime:", v17);

  }
  v18 = [AXLTTranscribedData alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = getpid();
  AXLCLocString(CFSTR("liveCaptions.microphone"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = 0;
  v22 = -[AXLTTranscribedData initWithTranscription:requestType:timestamp:pid:appID:appName:downloadProgress:silence:](v18, "initWithTranscription:requestType:timestamp:pid:appID:appName:downloadProgress:silence:", v5, 0, v19, v20, CFSTR("Mic"), v21, a3, v27);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "transcriberOutputData:", v22);

  +[AXLTAudioTextDumper sharedInstance](AXLTAudioTextDumper, "sharedInstance");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sessionStartTime");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "saveTranscribedText:appName:sessionStartTime:", v25, CFSTR("Mic"), v26);

}

void __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_195(uint64_t a1)
{
  AXLTTranscribedData *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AXLTTranscribedData *v8;

  v2 = [AXLTTranscribedData alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = getpid();
  AXLCLocString(CFSTR("liveCaptions.microphone"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 0;
  v8 = -[AXLTTranscribedData initWithTranscription:requestType:timestamp:pid:appID:appName:downloadProgress:silence:](v2, "initWithTranscription:requestType:timestamp:pid:appID:appName:downloadProgress:silence:", 0, 0, v3, v4, CFSTR("Mic"), v5, -2, v7);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transcriberOutputData:", v8);

}

- (void)calcHistogramForBuffer:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  AXLTSpeechTranscriber *v11;

  v4 = a3;
  -[AXLTSpeechTranscriber transcriber](self, "transcriber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTranscribingForPID:", -[AXLTSpeechTranscriber pid](self, "pid"));

  if (v6)
  {
    +[AXLTHistogramCalculator histogramForAudioPCMBuffer:](AXLTHistogramCalculator, "histogramForAudioPCMBuffer:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __48__AXLTSpeechTranscriber_calcHistogramForBuffer___block_invoke;
    v9[3] = &unk_24F874E58;
    v10 = v7;
    v11 = self;
    v8 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

  }
}

void __48__AXLTSpeechTranscriber_calcHistogramForBuffer___block_invoke(uint64_t a1)
{
  void *v2;
  AXLTAudioInfo *v3;

  v3 = -[AXLTAudioInfo initWithAudioInfo:requestType:pid:]([AXLTAudioInfo alloc], "initWithAudioInfo:requestType:pid:", *(_QWORD *)(a1 + 32), 0, getpid());
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioInfoData:", v3);

}

- (BOOL)stopTranscription:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXLTSpeechTranscriber stopTranscription:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  if (-[AXLTSpeechTranscriber isTranscribing](self, "isTranscribing"))
  {
    -[AXLTSpeechTranscriber cleanUp](self, "cleanUp");
    -[AXLTSpeechTranscriber setIsTranscribing:](self, "setIsTranscribing:", 0);
  }
  return 1;
}

- (void)resetTranscription
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D27A000, v0, v1, "Reset transcription, stop error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)audioEngineConfigurationDidChange:(id)a3
{
  if (-[AXLTSpeechTranscriber isTranscribing](self, "isTranscribing", a3))
    -[AXLTSpeechTranscriber resetTranscription](self, "resetTranscription");
}

- (void)cleanUp
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[16];

  AXLogLiveTranscription();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D27A000, v3, OS_LOG_TYPE_DEFAULT, "MicTranscriber: clean up", buf, 2u);
  }

  -[AXLTSpeechTranscriber audioEngine](self, "audioEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXLTSpeechTranscriber audioEngine](self, "audioEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeTapOnBus:", 0);

    -[AXLTSpeechTranscriber audioEngine](self, "audioEngine");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stop");

    -[AXLTSpeechTranscriber setAudioEngine:](self, "setAudioEngine:", 0);
  }
  -[AXLTSpeechTranscriber audioSession](self, "audioSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v8, "setActive:withOptions:error:", 0, 1, &v14);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDB1610];
  -[AXLTSpeechTranscriber audioSession](self, "audioSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObserver:name:object:", self, v10, v11);

  -[AXLTSpeechTranscriber transcriber](self, "transcriber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stopTranscriptionForPID:", -[AXLTSpeechTranscriber pid](self, "pid"));

  +[AXLTAudioTextDumper sharedInstance](AXLTAudioTextDumper, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cleanUp");

}

- (BOOL)isTranscribing
{
  return self->_isTranscribing;
}

- (void)setIsTranscribing:(BOOL)a3
{
  self->_isTranscribing = a3;
}

- (AXLTTranscriberDelegateProtocol)delegate
{
  return (AXLTTranscriberDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVAudioEngine)audioEngine
{
  return self->_audioEngine;
}

- (void)setAudioEngine:(id)a3
{
  objc_storeStrong((id *)&self->_audioEngine, a3);
}

- (AVAudioSession)audioSession
{
  return self->_audioSession;
}

- (void)setAudioSession:(id)a3
{
  objc_storeStrong((id *)&self->_audioSession, a3);
}

- (AXLTTranscriber)transcriber
{
  return self->_transcriber;
}

- (void)setTranscriber:(id)a3
{
  objc_storeStrong((id *)&self->_transcriber, a3);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSDate)bufferLogTime
{
  return self->_bufferLogTime;
}

- (void)setBufferLogTime:(id)a3
{
  objc_storeStrong((id *)&self->_bufferLogTime, a3);
}

- (NSDate)textLogTime
{
  return self->_textLogTime;
}

- (void)setTextLogTime:(id)a3
{
  objc_storeStrong((id *)&self->_textLogTime, a3);
}

- (NSDate)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStartTime, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartTime, 0);
  objc_storeStrong((id *)&self->_textLogTime, 0);
  objc_storeStrong((id *)&self->_bufferLogTime, 0);
  objc_storeStrong((id *)&self->_transcriber, 0);
  objc_storeStrong((id *)&self->_audioSession, 0);
  objc_storeStrong((id *)&self->_audioEngine, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startTranscription:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22D27A000, a2, OS_LOG_TYPE_ERROR, "error starting audioengine: %@", v4, 0xCu);

}

- (void)startTranscription:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D27A000, a1, a3, "start speech transcription", a5, a6, a7, a8, 0);
}

void __43__AXLTSpeechTranscriber_initializeAudioTap__block_invoke_cold_1(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "frameLength");
  _os_log_debug_impl(&dword_22D27A000, a2, OS_LOG_TYPE_DEBUG, "mic tap block: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)mediaServicesWereReset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22D27A000, v0, v1, "Media Services notification: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__AXLTSpeechTranscriber_setupTranscriberIfNeeded__block_invoke_2_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22D27A000, v0, OS_LOG_TYPE_DEBUG, "download progress: %ld", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)stopTranscription:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_22D27A000, a1, a3, "stop speech transcription", a5, a6, a7, a8, 0);
}

@end
