@implementation AXLTTranscriber

+ (AXLTTranscriber)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__AXLTTranscriber_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (AXLTTranscriber *)(id)sharedInstance_sharedInstance;
}

void __33__AXLTTranscriber_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (AXLTTranscriber)init
{
  AXLTTranscriber *v2;
  uint64_t v3;
  AXLTLanguageAssetManager *languageAssetManager;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v12.receiver = self;
  v12.super_class = (Class)AXLTTranscriber;
  v2 = -[AXLTTranscriber init](&v12, sel_init);
  if (v2)
  {
    +[AXLTLanguageAssetManager sharedInstance](AXLTLanguageAssetManager, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    languageAssetManager = v2->_languageAssetManager;
    v2->_languageAssetManager = (AXLTLanguageAssetManager *)v3;

    -[AXLTTranscriber languageAssetManager](v2, "languageAssetManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    AXLogLiveTranscription();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "localeIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_22D27A000, v7, OS_LOG_TYPE_DEFAULT, "Transcriber: Using locale: %@", buf, 0xCu);

    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDE9E40]), "initWithLocale:", v6);
    -[AXLTTranscriber setRecognizer:](v2, "setRecognizer:", v9);

    -[AXLTTranscriber recognizer](v2, "recognizer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDelegate:", v2);

    v2->_downloadState = -2;
  }
  return v2;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "AXLTTranscriber dealloc", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (int64_t)recognitionTaskHint
{
  if (self->_taskHint)
    return -[AXLTTranscriber mapUserTaskHint](self, "mapUserTaskHint");
  else
    return -[AXLTTranscriber defaultTaskHint](self, "defaultTaskHint");
}

- (int64_t)mapUserTaskHint
{
  int64_t result;

  result = -[AXLTTranscriber taskHint](self, "taskHint") - 1;
  if ((unint64_t)result >= 4)
    return -[AXLTTranscriber defaultTaskHint](self, "defaultTaskHint");
  return result;
}

- (int64_t)defaultTaskHint
{
  void *v2;
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("en_US"));

  if (v4)
    return 1004;
  else
    return 1;
}

- (void)startTranscriptionForPID:(int)a3 appName:(id)a4 callback:(id)a5 completionCallback:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  int64_t v18;
  _QWORD v19[5];
  int v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v8 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (-[AXLTTranscriber isAssetPending](self, "isAssetPending"))
  {
    AXLogLiveTranscription();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AXLTTranscriber startTranscriptionForPID:appName:callback:completionCallback:].cold.1();

    goto LABEL_16;
  }
  v14 = -[AXLTTranscriber isTranscribing](self, "isTranscribing");
  AXLogLiveTranscription();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[AXLTTranscriber startTranscriptionForPID:appName:callback:completionCallback:].cold.2((uint64_t)v10, self, v16);
    goto LABEL_15;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v22 = v10;
    v23 = 2112;
    v24 = v17;
    v25 = 1024;
    v26 = -[AXLTTranscriber isPending](self, "isPending");
    _os_log_impl(&dword_22D27A000, v16, OS_LOG_TYPE_DEFAULT, "Transcriber: Starting transcription for app: %@, pid: %@, pending: %d", buf, 0x1Cu);

  }
  if (-[AXLTTranscriber pid](self, "pid") != (_DWORD)v8 || !-[AXLTTranscriber isPending](self, "isPending"))
    -[AXLTTranscriber stopTranscriptionForPID:](self, "stopTranscriptionForPID:", -[AXLTTranscriber pid](self, "pid"));
  -[AXLTTranscriber setPid:](self, "setPid:", v8);
  -[AXLTTranscriber setAppName:](self, "setAppName:", v10);
  -[AXLTTranscriber setTranscriptionCallback:](self, "setTranscriptionCallback:", v11);
  -[AXLTTranscriber setCompletionCallback:](self, "setCompletionCallback:", v12);
  -[AXLTTranscriber setCurrentTranscription:](self, "setCurrentTranscription:", 0);
  if (!-[AXLTTranscriber isPending](self, "isPending"))
  {
    -[AXLTTranscriber setIsPending:](self, "setIsPending:", 1);
    -[AXLTTranscriber languageAssetManager](self, "languageAssetManager");
    v16 = objc_claimAutoreleasedReturnValue();
    v18 = -[AXLTTranscriber recognitionTaskHint](self, "recognitionTaskHint");
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __80__AXLTTranscriber_startTranscriptionForPID_appName_callback_completionCallback___block_invoke;
    v19[3] = &unk_24F874FB0;
    v19[4] = self;
    v20 = v8;
    -[NSObject languageAssetAvaliableForTaskHint:completion:](v16, "languageAssetAvaliableForTaskHint:completion:", v18, v19);
LABEL_15:

  }
LABEL_16:

}

uint64_t __80__AXLTTranscriber_startTranscriptionForPID_appName_callback_completionCallback___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_22D27A000, v4, OS_LOG_TYPE_DEFAULT, "Transcriber: Language asset is available: %@", (uint8_t *)&v8, 0xCu);

  }
  v6 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
    return objc_msgSend(v6, "resumeTranscriptionForPID:", *(unsigned int *)(a1 + 40));
  else
    return objc_msgSend(v6, "_downloadAndInstallSpeechRecognizer");
}

- (void)stopTranscriptionForPID:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  if (-[AXLTTranscriber pid](self, "pid") == a3)
  {
    -[AXLTTranscriber setIsPending:](self, "setIsPending:", 0);
    -[AXLTTranscriber setIsTranscribing:](self, "setIsTranscribing:", 0);
    AXLogLiveTranscription();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[AXLTTranscriber appName](self, "appName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[AXLTTranscriber pid](self, "pid"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v6;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_22D27A000, v5, OS_LOG_TYPE_DEFAULT, "Transcriber: Stopping transcription for app: %@, pid: %@", (uint8_t *)&v14, 0x16u);

    }
    -[AXLTTranscriber setCurrentTranscription:](self, "setCurrentTranscription:", 0);
    -[AXLTTranscriber setPid:](self, "setPid:", 0);
    -[AXLTTranscriber setAppName:](self, "setAppName:", 0);
    -[AXLTTranscriber recognitionTask](self, "recognitionTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      AXLogLiveTranscription();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[AXLTTranscriber stopTranscriptionForPID:].cold.1();

      -[AXLTTranscriber recognitionTask](self, "recognitionTask");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cancel");

      -[AXLTTranscriber recognitionTask](self, "recognitionTask");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "finish");

      -[AXLTTranscriber setRecognitionTask:](self, "setRecognitionTask:", 0);
    }
    -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endAudio");

    -[AXLTTranscriber setRecognitionRequest:](self, "setRecognitionRequest:", 0);
  }
  else
  {
    AXLogLiveTranscription();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[AXLTTranscriber stopTranscriptionForPID:].cold.2(v3, self, v13);

  }
}

- (void)resumeTranscriptionForPID:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v3 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x24BDAC8D0];
  if (-[AXLTTranscriber isTranscribing](self, "isTranscribing"))
  {
    AXLogLiveTranscription();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[AXLTTranscriber resumeTranscriptionForPID:].cold.1();
  }
  else if (-[AXLTTranscriber pid](self, "pid"))
  {
    if (-[AXLTTranscriber pid](self, "pid") == (_DWORD)v3)
    {
      -[AXLTTranscriber recognizer](self, "recognizer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "supportsOnDeviceRecognition");

      if ((v7 & 1) != 0)
      {
        -[AXLTTranscriber setIsPending:](self, "setIsPending:", 0);
        -[AXLTTranscriber setIsTranscribing:](self, "setIsTranscribing:", 1);
        -[AXLTTranscriber setCurrentTranscription:](self, "setCurrentTranscription:", 0);
        v8 = objc_alloc_init(MEMORY[0x24BDE9E20]);
        -[AXLTTranscriber setRecognitionRequest:](self, "setRecognitionRequest:", v8);

        -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setTaskIdentifier:", CFSTR("systemlivecaptions"));

        -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setShouldReportPartialResults:", 1);

        -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDetectMultipleUtterances:", 0);

        -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_setMaximumRecognitionDuration:", 7200.0);

        -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setRequiresOnDeviceRecognition:", 1);

        if (_os_feature_enabled_impl())
        {
          v14 = -[AXLTTranscriber noPunctuation](self, "noPunctuation") ^ 1;
          -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setAddsPunctuation:", v14);

        }
        AXLogLiveTranscription();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          -[AXLTTranscriber resumeTranscriptionForPID:].cold.2(self);

        v17 = -[AXLTTranscriber recognitionTaskHint](self, "recognitionTaskHint");
        -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setTaskHint:", v17);

        -[AXLTTranscriber recognizer](self, "recognizer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "recognitionTaskWithRequest:delegate:", v20, self);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXLTTranscriber setRecognitionTask:](self, "setRecognitionTask:", v21);

        AXLogLiveTranscription();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          -[AXLTTranscriber appName](self, "appName");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[AXLTTranscriber pid](self, "pid"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412546;
          v26 = v22;
          v27 = 2112;
          v28 = v23;
          _os_log_impl(&dword_22D27A000, v5, OS_LOG_TYPE_DEFAULT, "Transcriber: Resuming transcription for app: %@, pid: %@", (uint8_t *)&v25, 0x16u);

        }
      }
      else
      {
        AXLogLiveTranscription();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_22D27A000, v5, OS_LOG_TYPE_DEFAULT, "Transcriber: Cannot start on-device recognition for Live Captions", (uint8_t *)&v25, 2u);
        }
      }
    }
    else
    {
      AXLogLiveTranscription();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[AXLTTranscriber resumeTranscriptionForPID:].cold.3(v3, self, v5);
    }
  }
  else
  {
    AXLogLiveTranscription();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v24;
      _os_log_impl(&dword_22D27A000, v5, OS_LOG_TYPE_DEFAULT, "Transcriber: Can't resume transcription for pid: %@, startTranscription wasn't called", (uint8_t *)&v25, 0xCu);

    }
  }

}

- (BOOL)isTranscribingForPID:(int)a3
{
  _BOOL4 v5;

  v5 = -[AXLTTranscriber isTranscribing](self, "isTranscribing");
  if (v5)
    LOBYTE(v5) = -[AXLTTranscriber pid](self, "pid") == a3;
  return v5;
}

- (void)appendAudioPCMBuffer:(id)a3 forPID:(int)a4
{
  uint64_t v4;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!-[AXLTTranscriber pid](self, "pid"))
  {
    AXLogLiveTranscription();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v10;
    v15 = 1024;
    LODWORD(v16) = -[AXLTTranscriber isTranscribing](self, "isTranscribing");
    _os_log_impl(&dword_22D27A000, v9, OS_LOG_TYPE_DEFAULT, "Transcriber: Can't appendAudioPCMBuffer for pid: %@, no active transcribing session, isTranscribing: %d", (uint8_t *)&v13, 0x12u);
LABEL_10:

    goto LABEL_11;
  }
  v7 = -[AXLTTranscriber pid](self, "pid");
  AXLogLiveTranscription();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7 != (_DWORD)v4)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[AXLTTranscriber pid](self, "pid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLTTranscriber appName](self, "appName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_22D27A000, v9, OS_LOG_TYPE_DEFAULT, "Transcriber: Can't appendAudioPCMBuffer for pid: %@, transcribing for pid: %@ app: %@", (uint8_t *)&v13, 0x20u);

    goto LABEL_10;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AXLTTranscriber appendAudioPCMBuffer:forPID:].cold.1(v6, self, v9);

  -[AXLTTranscriber recognitionRequest](self, "recognitionRequest");
  v9 = objc_claimAutoreleasedReturnValue();
  -[NSObject appendAudioPCMBuffer:](v9, "appendAudioPCMBuffer:", v6);
LABEL_11:

}

- (void)_restartTranscription
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[AXLTTranscriber pid](self, "pid");
  -[AXLTTranscriber appName](self, "appName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXLTTranscriber transcriptionCallback](self, "transcriptionCallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLTTranscriber completionCallback](self, "completionCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXLTTranscriber startTranscriptionForPID:appName:callback:completionCallback:](self, "startTranscriptionForPID:appName:callback:completionCallback:", v3, v6, v4, v5);

}

- (BOOL)isAssetPending
{
  int64_t v4;
  NSObject *v5;
  _BOOL4 v6;

  if (-[AXLTTranscriber downloadState](self, "downloadState") == -2
    || -[AXLTTranscriber downloadState](self, "downloadState") == 100)
  {
    return 0;
  }
  v4 = -[AXLTTranscriber downloadState](self, "downloadState");
  AXLogLiveTranscription();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4 == -1)
  {
    if (v6)
      -[AXLTTranscriber isAssetPending].cold.1();
  }
  else if (v6)
  {
    -[AXLTTranscriber isAssetPending].cold.2();
  }

  return 1;
}

- (void)_downloadAndInstallSpeechRecognizer
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "downloadState"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_22D27A000, v2, v3, "Transcriber: Downloading asset can't start, state: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

void __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_2;
  v2[3] = &unk_24F874FD8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

void __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl(&dword_22D27A000, v2, OS_LOG_TYPE_DEFAULT, "Transcriber: Language asset download fractionCompleted %lu", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "transcriptionCallback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "transcriptionCallback");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0, *(_QWORD *)(a1 + 40), 1);

  }
}

void __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_192(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_2_193;
  v6[3] = &unk_24F874E58;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __54__AXLTTranscriber__downloadAndInstallSpeechRecognizer__block_invoke_2_193(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  AXLogLiveTranscription();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_22D27A000, v2, OS_LOG_TYPE_DEFAULT, "Transcriber: Language asset finished, error: %@", (uint8_t *)&v10, 0xCu);
  }

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "transcriptionCallback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "transcriptionCallback");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v7 = -1;
      v6[2](v6, 0, -1, 1);

    }
    else
    {
      v7 = -1;
    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "transcriptionCallback");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, 100, 1);

    }
    objc_msgSend(*(id *)(a1 + 40), "resumeTranscriptionForPID:", objc_msgSend(*(id *)(a1 + 40), "pid"));
    v7 = 100;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setDownloadState:", v7);
}

- (void)_handleAssetDownloadError:(id)a3
{
  void (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);

  -[AXLTTranscriber transcriptionCallback](self, "transcriptionCallback", a3);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4[2](v4, 0, -1, 1);

  -[AXLTTranscriber setDownloadState:](self, "setDownloadState:", -1);
}

- (void)speechRecognitionDidDetectSpeech:(id)a3
{
  NSObject *v3;

  AXLogLiveTranscription();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AXLTTranscriber speechRecognitionDidDetectSpeech:].cold.1();

}

- (void)speechRecognitionTaskFinishedReadingAudio:(id)a3
{
  NSObject *v3;

  AXLogLiveTranscription();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AXLTTranscriber speechRecognitionTaskFinishedReadingAudio:].cold.1();

}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  NSObject *v3;

  AXLogLiveTranscription();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[AXLTTranscriber speechRecognitionTaskWasCancelled:].cold.1();

}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  uint8_t v12[16];

  v6 = a3;
  AXLogLiveTranscription();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[AXLTTranscriber speechRecognitionTask:didFinishSuccessfully:].cold.1();

  if (!a4)
  {
    AXLogLiveTranscription();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_22D27A000, v8, OS_LOG_TYPE_DEFAULT, "Transcriber: Task was unsuccessful", v12, 2u);
    }

  }
  -[AXLTTranscriber setCurrentTranscription:](self, "setCurrentTranscription:", 0);
  -[AXLTTranscriber transcriptionCallback](self, "transcriptionCallback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AXLTTranscriber transcriptionCallback](self, "transcriptionCallback");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[AXLTTranscriber recognitionTask](self, "recognitionTask");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, -2, objc_msgSend(v6, "isEqual:", v11));

  }
}

- (void)speechRecognitionTask:(id)a3 didHypothesizeTranscription:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  AXLTTranscription *v10;
  void *v11;
  AXLTTranscription *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  AXLogLiveTranscription();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AXLTTranscriber speechRecognitionTask:didHypothesizeTranscription:].cold.1(v7);

  -[AXLTTranscriber transcriptionCallback](self, "transcriptionCallback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [AXLTTranscription alloc];
    -[AXLTTranscriber currentTranscription](self, "currentTranscription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AXLTTranscription initWithRecognitionTask:transcription:previousTranscription:](v10, "initWithRecognitionTask:transcription:previousTranscription:", v6, v7, v11);

    -[AXLTTranscriber setCurrentTranscription:](self, "setCurrentTranscription:", v12);
    -[AXLTTranscriber transcriptionCallback](self, "transcriptionCallback");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[AXLTTranscriber currentTranscription](self, "currentTranscription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLTTranscriber recognitionTask](self, "recognitionTask");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t, uint64_t))v13)[2](v13, v14, -2, objc_msgSend(v6, "isEqual:", v15));

  }
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  AXLTTranscription *v10;
  void *v11;
  void *v12;
  AXLTTranscription *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v15;
  void *v16;
  void (**v17)(void);

  v6 = a3;
  v7 = a4;
  AXLogLiveTranscription();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[AXLTTranscriber speechRecognitionTask:didFinishRecognition:].cold.1();

  -[AXLTTranscriber setCurrentTranscription:](self, "setCurrentTranscription:", 0);
  -[AXLTTranscriber transcriptionCallback](self, "transcriptionCallback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [AXLTTranscription alloc];
    objc_msgSend(v7, "bestTranscription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXLTTranscriber currentTranscription](self, "currentTranscription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[AXLTTranscription initWithRecognitionTask:transcription:previousTranscription:](v10, "initWithRecognitionTask:transcription:previousTranscription:", v6, v11, v12);

    -[AXLTTranscriber transcriptionCallback](self, "transcriptionCallback");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[AXLTTranscriber recognitionTask](self, "recognitionTask");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, AXLTTranscription *, uint64_t, uint64_t))v14)[2](v14, v13, -2, objc_msgSend(v6, "isEqual:", v15));

  }
  -[AXLTTranscriber completionCallback](self, "completionCallback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[AXLTTranscriber completionCallback](self, "completionCallback");
    v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v17[2]();

  }
}

- (float)_coalsecingTime
{
  float result;

  if (_coalsecingTime_onceToken != -1)
    dispatch_once(&_coalsecingTime_onceToken, &__block_literal_global_2);
  objc_msgSend((id)_coalsecingTime_s_userDefaults, "floatForKey:", CFSTR("CoalesceCaptionsTimeKey"));
  if (result == 0.0)
    return 0.5;
  return result;
}

void __34__AXLTTranscriber__coalsecingTime__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.accessibility.LiveCaptions"));
  v1 = (void *)_coalsecingTime_s_userDefaults;
  _coalsecingTime_s_userDefaults = v0;

}

- (int64_t)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(int64_t)a3
{
  self->_downloadState = a3;
}

- (BOOL)noPunctuation
{
  return self->_noPunctuation;
}

- (void)setNoPunctuation:(BOOL)a3
{
  self->_noPunctuation = a3;
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (SFSpeechRecognizer)recognizer
{
  return self->_recognizer;
}

- (void)setRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_recognizer, a3);
}

- (SFSpeechAudioBufferRecognitionRequest)recognitionRequest
{
  return self->_recognitionRequest;
}

- (void)setRecognitionRequest:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionRequest, a3);
}

- (SFSpeechRecognitionTask)recognitionTask
{
  return self->_recognitionTask;
}

- (void)setRecognitionTask:(id)a3
{
  objc_storeStrong((id *)&self->_recognitionTask, a3);
}

- (AXLTTranscription)currentTranscription
{
  return self->_currentTranscription;
}

- (void)setCurrentTranscription:(id)a3
{
  objc_storeStrong((id *)&self->_currentTranscription, a3);
}

- (id)transcriptionCallback
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setTranscriptionCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (id)completionCallback
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setCompletionCallback:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAppName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (BOOL)isTranscribing
{
  return self->_isTranscribing;
}

- (void)setIsTranscribing:(BOOL)a3
{
  self->_isTranscribing = a3;
}

- (BOOL)isPending
{
  return self->_isPending;
}

- (void)setIsPending:(BOOL)a3
{
  self->_isPending = a3;
}

- (AXLTLanguageAssetManager)languageAssetManager
{
  return (AXLTLanguageAssetManager *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLanguageAssetManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSTimer)audioBufferTimeoutTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAudioBufferTimeoutTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioBufferTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_languageAssetManager, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong(&self->_completionCallback, 0);
  objc_storeStrong(&self->_transcriptionCallback, 0);
  objc_storeStrong((id *)&self->_currentTranscription, 0);
  objc_storeStrong((id *)&self->_recognitionTask, 0);
  objc_storeStrong((id *)&self->_recognitionRequest, 0);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

- (void)startTranscriptionForPID:appName:callback:completionCallback:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_22D27A000, v0, OS_LOG_TYPE_DEBUG, "Transcriber: Can't start transcription for app, asset is not ready: %@", v1, 0xCu);
}

- (void)startTranscriptionForPID:(NSObject *)a3 appName:callback:completionCallback:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "appName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(a2, "pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_22D27A000, a3, v8, "Transcriber: Can't start transcription for app: %@, transcribing for app: %@, pid: %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_4();
}

- (void)stopTranscriptionForPID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "Transcriber: signaling recognition task finish", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)stopTranscriptionForPID:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "appName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)0x24BDD1000, "numberWithInt:", OUTLINED_FUNCTION_7());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_22D27A000, a3, v8, "Transcriber: Can't stop transcription for pid: %@, active app: %@, pid %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_4();
}

- (void)resumeTranscriptionForPID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "Transcriber: Resume transcription, already transcribing, no action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)resumeTranscriptionForPID:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v1 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a1, "recognitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "numberWithBool:", objc_msgSend(v2, "addsPunctuation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_22D27A000, v4, v5, "addsPunctuation is set to: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8();
}

- (void)resumeTranscriptionForPID:(NSObject *)a3 .cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v3;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "appName");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)0x24BDD1000, "numberWithInt:", OUTLINED_FUNCTION_7());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_22D27A000, a3, v8, "Transcriber: Can't resume transcription for pid: %@, active app: %@, pid: %@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_4();
}

- (void)appendAudioPCMBuffer:(NSObject *)a3 forPID:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(a1, "frameCapacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "appName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_22D27A000, a3, OS_LOG_TYPE_DEBUG, "Transcriber: appendAudioPCMBuffer buffer size: %@, app: %@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_8();
}

- (void)isAssetPending
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "Transcriber: Asset downloading is in progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)speechRecognitionDidDetectSpeech:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "speechRecognitionDidDetectSpeech:(SFSpeechRecognitionTask *)task", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)speechRecognitionTaskFinishedReadingAudio:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "speechRecognitionTaskFinishedReadingAudio:(SFSpeechRecognitionTask *)task", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)speechRecognitionTaskWasCancelled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "speechRecognitionTaskWasCancelled:(SFSpeechRecognitionTask *)task", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)speechRecognitionTask:didFinishSuccessfully:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "speechRecognitionTask:(SFSpeechRecognitionTask *)task didFinishSuccessfully:(BOOL)successfully", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)speechRecognitionTask:(void *)a1 didHypothesizeTranscription:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "formattedString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_22D27A000, v2, v3, "Transcriber: transcription didHypothesizeTranscription: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)speechRecognitionTask:didFinishRecognition:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "Transcriber: transcription didFinishRecognition", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
