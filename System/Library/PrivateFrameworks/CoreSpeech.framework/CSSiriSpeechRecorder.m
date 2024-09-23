@implementation CSSiriSpeechRecorder

- (CSSiriSpeechRecorder)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CSSiriSpeechRecorder *v17;
  CSSiriSpeechRecorder *v18;
  CSSiriAudioActivationInfo *v19;
  CSSiriAudioActivationInfo *currentActivationInfo;
  NSObject *v21;
  CSSiriAudioActivationInfo *v22;
  dispatch_group_t v23;
  OS_dispatch_group *recordingWillStartGroup;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  CSSiriAudioActivationInfo *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSSiriSpeechRecorder.m"), 370, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("audioSessionController != nil"));

    if (v15)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSSiriSpeechRecorder.m"), 369, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("speechController != nil"));

  if (!v14)
    goto LABEL_10;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSSiriSpeechRecorder.m"), 371, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("audioPlaybackService != nil"));

LABEL_4:
  v31.receiver = self;
  v31.super_class = (Class)CSSiriSpeechRecorder;
  v17 = -[CSSiriSpeechRecorder init](&v31, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_isSpeechControllerInitialized = 0;
    objc_storeStrong((id *)&v17->_speechController, a4);
    objc_storeStrong((id *)&v18->_audioSessionController, a5);
    objc_storeStrong((id *)&v18->_audioPlaybackService, a6);
    objc_storeStrong((id *)&v18->_experimentContext, a7);
    v19 = -[CSSiriAudioActivationInfo initWithSpeechRecordingMode:clientConfiguration:experimentContext:]([CSSiriAudioActivationInfo alloc], "initWithSpeechRecordingMode:clientConfiguration:experimentContext:", v18->_speechCapturingMode, 0, v18->_experimentContext);
    currentActivationInfo = v18->_currentActivationInfo;
    v18->_currentActivationInfo = v19;

    v21 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v22 = v18->_currentActivationInfo;
      *(_DWORD *)buf = 136315394;
      v33 = "-[CSSiriSpeechRecorder initWithQueue:speechController:audioSessionController:audioPlaybackService:experimentContext:]";
      v34 = 2112;
      v35 = v22;
      _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_INFO, "%s Set initial info as current %@.", buf, 0x16u);
    }
    objc_storeStrong((id *)&v18->_queue, a3);
    v23 = dispatch_group_create();
    recordingWillStartGroup = v18->_recordingWillStartGroup;
    v18->_recordingWillStartGroup = (OS_dispatch_group *)v23;

  }
  return v18;
}

- (void)dealloc
{
  OpaqueAudioConverter *decoder;
  objc_super v4;

  decoder = self->_decoder;
  if (decoder)
  {
    AudioConverterDispose(decoder);
    self->_decoder = 0;
  }
  -[NSXPCConnection invalidate](self->_speechRecordingEventListenerConnection, "invalidate");
  -[AFWatchdogTimer cancel](self->_fakeTwoShotTTSPromptWatchdogTimer, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)CSSiriSpeechRecorder;
  -[CSSiriSpeechRecorder dealloc](&v4, sel_dealloc);
}

- (id)_currentMHUUID:(BOOL)a3
{
  NSUUID *mhUUID;
  BOOL v5;
  _BOOL4 v6;
  NSUUID *v7;
  NSUUID *v8;
  NSObject *v9;
  const __CFString *v10;
  NSUUID *v11;
  int v13;
  const char *v14;
  __int16 v15;
  NSUUID *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  mhUUID = self->_mhUUID;
  if (mhUUID)
    v5 = !a3;
  else
    v5 = 0;
  if (!v5)
  {
    v6 = a3;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v8 = self->_mhUUID;
    self->_mhUUID = v7;

    v9 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("NO");
      v11 = self->_mhUUID;
      v14 = "-[CSSiriSpeechRecorder _currentMHUUID:]";
      v13 = 136315650;
      v15 = 2112;
      if (v6)
        v10 = CFSTR("YES");
      v16 = v11;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s Assign new MHUUID here to %@ (force = %@)", (uint8_t *)&v13, 0x20u);
    }
    mhUUID = self->_mhUUID;
  }
  return mhUUID;
}

- (id)_mhUUIDFromSpeechRequestOptions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject **v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "voiceTriggerEventInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D19560]);
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
LABEL_12:

        goto LABEL_14;
      }
    }
  }
  else
  {
    v6 = 0;
  }
  v10 = (NSObject **)MEMORY[0x1E0CFE6C0];
  v11 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v12 = v11;
    objc_msgSend(v4, "continuousConversationInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[CSSiriSpeechRecorder _mhUUIDFromSpeechRequestOptions:]";
    v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s continuousConversationInfo :%@", (uint8_t *)&v17, 0x16u);

  }
  if (objc_msgSend(v4, "activationEvent") != 30)
  {
    v9 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v4, "continuousConversationInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "continuousConversationInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("requestMHUUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    v15 = *v10;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = 136315394;
      v18 = "-[CSSiriSpeechRecorder _mhUUIDFromSpeechRequestOptions:]";
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_INFO, "%s requestMHUUID:%@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_12;
  }
LABEL_14:

  return v9;
}

- (id)_currentRtsSessionId:(BOOL)a3
{
  return 0;
}

- (id)_rtsSessionIdFromSpeechRequestOptions:(id)a3
{
  return 0;
}

- (void)_setSpeechCapturingMode:(int64_t)a3
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "-[CSSiriSpeechRecorder _setSpeechCapturingMode:]";
    v9 = 2048;
    v10 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s mode = %ld", (uint8_t *)&v7, 0x16u);
  }
  if (self->_speechCapturingMode != a3)
  {
    self->_speechCapturingMode = a3;
    v6 = 112;
    if (!self->_recordingState)
      v6 = 104;
    objc_msgSend(*(id *)((char *)&self->super.isa + v6), "setSpeechRecordingMode:", a3);
  }
}

- (void)_setEndpointerOperationMode:(int64_t)a3 forceUpdate:(BOOL)a4
{
  _BOOL4 v4;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int64_t endpointerOperationMode;
  os_log_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  NSObject *v19;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v8 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    AFSpeechEndpointerOperationModeGetName();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 136315650;
    v21 = "-[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:]";
    v22 = 2112;
    v23 = v10;
    v24 = 1024;
    LODWORD(v25) = v4;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s endpointerOperationMode = %@, forceUpdate = %d", (uint8_t *)&v20, 0x1Cu);

  }
  if (a3 || v4)
  {
    endpointerOperationMode = self->_endpointerOperationMode;
    if (a3 < 2 || endpointerOperationMode != 1 || v4)
    {
      if (endpointerOperationMode != a3 || v4)
      {
        self->_endpointerOperationMode = a3;
        -[CSSiriSpeechRecorder _speechController](self, "_speechController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setEndpointerOperationMode:", self->_endpointerOperationMode);
        v18 = a3 - 3;
        v19 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
        {
          v20 = 136315394;
          v21 = "-[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:]";
          v22 = 1024;
          LODWORD(v23) = v18 < 2;
          _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_INFO, "%s Set Use Automatic Endpointing %d", (uint8_t *)&v20, 0x12u);
        }
        -[CSSiriSpeechRecorder _setEndpointStyle:](self, "_setEndpointStyle:", 2 * (v18 > 1));
        if (v18 <= 1 && self->_didDetectEndpoint && self->_recordingState == 2)
          -[CSSiriSpeechRecorder _stopRecordingForEndpointReason:withEndpointMetrics:](self, "_stopRecordingForEndpointReason:withEndpointMetrics:", 3, 0);

      }
    }
    else
    {
      v13 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        v14 = v13;
        AFSpeechEndpointerOperationModeGetName();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        AFSpeechEndpointerOperationModeGetName();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 136315650;
        v21 = "-[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:]";
        v22 = 2112;
        v23 = v15;
        v24 = 2112;
        v25 = v16;
        _os_log_error_impl(&dword_1C2614000, v14, OS_LOG_TYPE_ERROR, "%s Ignored because endpointer operation mode can not be changed from %@ to %@.", (uint8_t *)&v20, 0x20u);

      }
    }
  }
  else
  {
    v11 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      v20 = 136315138;
      v21 = "-[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:]";
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s Ignored because endpointer operation mode is unspecified.", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)_setAlertsIfNeeded
{
  int64_t recordingAlertsConfiguration;
  unint64_t v4;
  os_log_t *v5;
  NSObject *v6;
  _BOOL8 v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  CSSiriAudioActivationInfo *pendingActivationInfo;
  CSSiriAudioActivationInfo *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSMutableDictionary *numberOfAVVCAlertPlaybacksByType;
  OS_dispatch_group *alertPlaybackGroup;
  NSMutableDictionary *v33;
  _QWORD v34[5];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  recordingAlertsConfiguration = self->_recordingAlertsConfiguration;
  v4 = self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFELL;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  if (v4 == 2)
  {
    self->_recordingAlertsConfiguration = 2;
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s Setting up recording alerts for Dictation.", buf, 0xCu);
    }
    v11 = recordingAlertsConfiguration != 2;
    objc_msgSend(MEMORY[0x1E0CFE840], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForSoundID:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForSoundID:", 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForSoundID:", 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriSpeechRecorder _speechController](self, "_speechController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAlertSoundFromURL:forType:force:", v12, 1, v11);
    objc_msgSend(v15, "setAlertSoundFromURL:forType:force:", v13, 2, v11);
    objc_msgSend(v15, "setAlertSoundFromURL:forType:force:", v14, 3, v11);
    v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_INFO, "%s Done setting recording alerts for Dictation.", buf, 0xCu);
    }

  }
  else
  {
    self->_recordingAlertsConfiguration = 1;
    v6 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Setting up recording alerts for Siri and other non-Dictation modes.", buf, 0xCu);
    }
    v7 = recordingAlertsConfiguration != 1;
    -[CSSiriSpeechRecorder _speechController](self, "_speechController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlertSoundFromURL:forType:force:", 0, 1, v7);
    objc_msgSend(v8, "setAlertSoundFromURL:forType:force:", 0, 2, v7);
    objc_msgSend(v8, "setAlertSoundFromURL:forType:force:", 0, 3, v7);
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s Done setting recording alerts for Siri and other non-Dictation modes.", buf, 0xCu);
    }
  }

  -[AFExperimentContext invocationFeedbackExperiment](self->_experimentContext, "invocationFeedbackExperiment");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isFeatureGroupOneEnabled");

  if (v4 != 2 && v18)
  {
    v19 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_INFO, "%s Overriding record starting alert for IFD feature group one.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLForResource:withExtension:", CFSTR("siri-begin-improved"), CFSTR("caf"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[CSSiriSpeechRecorder _speechController](self, "_speechController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setAlertSoundFromURL:forType:force:", v21, 1, 1);
      v23 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
        v37 = 2112;
        v38 = v21;
        _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_INFO, "%s Done overriding record starting alert for IFD feature group one (soundURL = %@).", buf, 0x16u);
      }
      self->_recordingAlertsConfiguration = 3;

    }
    else
    {
      v24 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
        _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, "%s Failed overriding record starting alert for IFD feature group one.", buf, 0xCu);
      }
    }

  }
  pendingActivationInfo = self->_pendingActivationInfo;
  if (!pendingActivationInfo)
    pendingActivationInfo = self->_currentActivationInfo;
  v26 = pendingActivationInfo;
  -[CSSiriAudioActivationInfo startingAlertBeepURL](v26, "startingAlertBeepURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    -[CSSiriSpeechRecorder _speechController](self, "_speechController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAlertSoundFromURL:forType:force:", v27, 1, 1);
    v29 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      v37 = 2112;
      v38 = v27;
      _os_log_impl(&dword_1C2614000, v29, OS_LOG_TYPE_INFO, "%s Done overriding record starting alert from override policy (soundURL = %@).", buf, 0x16u);
    }
    self->_recordingAlertsConfiguration = 3;

  }
  else
  {
    v30 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_error_impl(&dword_1C2614000, v30, OS_LOG_TYPE_ERROR, "%s Failed overriding record starting alert from override policy.", buf, 0xCu);
    }
  }
  if (self->_alertPlaybackGroup)
  {
    numberOfAVVCAlertPlaybacksByType = self->_numberOfAVVCAlertPlaybacksByType;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __42__CSSiriSpeechRecorder__setAlertsIfNeeded__block_invoke;
    v34[3] = &unk_1E7C28090;
    v34[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](numberOfAVVCAlertPlaybacksByType, "enumerateKeysAndObjectsUsingBlock:", v34);
    alertPlaybackGroup = self->_alertPlaybackGroup;
    self->_alertPlaybackGroup = 0;

  }
  v33 = self->_numberOfAVVCAlertPlaybacksByType;
  self->_numberOfAVVCAlertPlaybacksByType = 0;

}

- (void)_updateRecordBufferDuration
{
  CSSpeechController *speechController;
  os_log_t *v4;
  NSObject *v5;
  os_log_t v6;
  CSSpeechController *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  speechController = self->_speechController;
  if (speechController)
  {
    v4 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v5 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v10 = 136315394;
      v11 = "-[CSSiriSpeechRecorder _updateRecordBufferDuration]";
      v12 = 2048;
      v13 = 0x3FA47AE147AE147BLL;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s Trying to set record buffer duration to %lf", (uint8_t *)&v10, 0x16u);
      speechController = self->_speechController;
    }
    if (!-[CSSpeechController setRecordBufferDuration:](speechController, "setRecordBufferDuration:", 0.04))
    {
      v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        v7 = self->_speechController;
        v8 = v6;
        -[CSSpeechController getRecordBufferDuration](v7, "getRecordBufferDuration");
        v10 = 136315394;
        v11 = "-[CSSiriSpeechRecorder _updateRecordBufferDuration]";
        v12 = 2050;
        v13 = v9;
        _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Failed setting record buffer duration. Duration is %{public}lf", (uint8_t *)&v10, 0x16u);

      }
    }
  }
}

- (id)_speechController
{
  return -[CSSiriSpeechRecorder _speechControllerWithError:](self, "_speechControllerWithError:", 0);
}

- (id)_speechControllerWithError:(id *)a3
{
  void *v4;
  CSSiriAudioActivationInfo *pendingActivationInfo;
  CSSiriAudioActivationInfo *v6;
  CSSiriAudioActivationInfo *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  CSSiriAudioActivationInfo *v11;
  NSObject *v12;
  CSSiriAudioActivationInfo *currentActivationInfo;
  CSEndpointAnalyzer *v14;
  CSEndpointAnalyzer *endpointAnalyzer;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v26;
  int v27;
  const char *v28;
  __int16 v29;
  CSSiriAudioActivationInfo *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!self->_speechController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSSiriSpeechRecorder.m"), 595, CFSTR("Speech controller should not be nil."));

  }
  if (!self->_isSpeechControllerInitialized)
  {
    -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    pendingActivationInfo = self->_pendingActivationInfo;
    if (!pendingActivationInfo)
      pendingActivationInfo = self->_currentActivationInfo;
    v6 = pendingActivationInfo;
    -[CSSiriAudioActivationInfo recordContext](v6, "recordContext");
    v7 = (CSSiriAudioActivationInfo *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v27 = 136315394;
      v28 = "-[CSSiriSpeechRecorder _speechControllerWithError:]";
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s Initalizing speech controller with context %@", (uint8_t *)&v27, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logEventWithType:context:", 201, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logMHAssistantDaemonAudioInitContextWithMHUUID:withInitStarted:", v4, 1);

    kdebug_trace();
    if (-[CSSpeechController initializeRecordSessionWithRecordContext:](self->_speechController, "initializeRecordSessionWithRecordContext:", v7))
    {
      v11 = self->_pendingActivationInfo;
      self->_pendingActivationInfo = 0;

      objc_storeStrong((id *)&self->_currentActivationInfo, pendingActivationInfo);
      v12 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        currentActivationInfo = self->_currentActivationInfo;
        v27 = 136315394;
        v28 = "-[CSSiriSpeechRecorder _speechControllerWithError:]";
        v29 = 2112;
        v30 = currentActivationInfo;
        _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s Set pending info as current %@.", (uint8_t *)&v27, 0x16u);
      }
    }
    -[CSSpeechController endpointAnalyzer](self->_speechController, "endpointAnalyzer");
    v14 = (CSEndpointAnalyzer *)objc_claimAutoreleasedReturnValue();
    endpointAnalyzer = self->_endpointAnalyzer;
    self->_endpointAnalyzer = v14;

    -[CSEndpointAnalyzer setEndpointStyle:](self->_endpointAnalyzer, "setEndpointStyle:", 0);
    kdebug_trace();
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logEventWithType:context:", 202, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logMHAssistantDaemonAudioInitContextWithMHUUID:withInitStarted:", v4, 0);

    self->_isSpeechControllerInitialized = 1;
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logEventWithType:context:", 203, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logMHAssistantDaemonAudioConfigureContextWithMHUUID:withConfigureStarted:", v4, 1);

    kdebug_trace();
    -[CSSpeechController setMeteringEnabled:](self->_speechController, "setMeteringEnabled:", 1);
    -[CSSpeechController setEndpointAnalyzerDelegate:](self->_speechController, "setEndpointAnalyzerDelegate:", self);
    -[CSSpeechController setDelegate:](self->_speechController, "setDelegate:", self);
    -[CSSpeechController setSpeakerIdDelegate:](self->_speechController, "setSpeakerIdDelegate:", self);
    if (AFIsHorseman())
      -[CSSpeechController setDuckOthersOption:](self->_speechController, "setDuckOthersOption:", 1);
    -[CSSiriSpeechRecorder _updateRecordBufferDuration](self, "_updateRecordBufferDuration");
    kdebug_trace();
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logEventWithType:context:", 204, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logMHAssistantDaemonAudioConfigureContextWithMHUUID:withConfigureStarted:", v4, 0);

    v22 = +[CSAttSiriMagusSupportedPolicy sharedInstance](CSAttSiriMagusSupportedPolicy, "sharedInstance");
    v23 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v27 = 136315138;
      v28 = "-[CSSiriSpeechRecorder _speechControllerWithError:]";
      _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_INFO, "%s Done initializing voice controller", (uint8_t *)&v27, 0xCu);
    }

  }
  return self->_speechController;
}

- (void)_resetSpeechController
{
  NSObject *v3;
  CSEndpointAnalyzer *endpointAnalyzer;
  CSSiriSpeechRecordingContext *context;
  void *v6;
  CSSiriSpeechRecordingContext *v7;
  NSUUID *mhUUID;
  id v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = "-[CSSiriSpeechRecorder _resetSpeechController]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  self->_isSpeechControllerInitialized = 0;
  -[CSSpeechController setEndpointAnalyzerDelegate:](self->_speechController, "setEndpointAnalyzerDelegate:", 0);
  -[CSSpeechController setDelegate:](self->_speechController, "setDelegate:", 0);
  -[CSSpeechController setLanguageDetectorDelegate:](self->_speechController, "setLanguageDetectorDelegate:", 0);
  -[CSSpeechController setSpeakerIdDelegate:](self->_speechController, "setSpeakerIdDelegate:", 0);
  -[CSSpeechController resetAudioSession](self->_speechController, "resetAudioSession");
  -[CSEndpointAnalyzer reset](self->_endpointAnalyzer, "reset");
  endpointAnalyzer = self->_endpointAnalyzer;
  self->_endpointAnalyzer = 0;

  self->_recordingAlertsConfiguration = 0;
  context = self->_context;
  objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:", 227);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecordingContext didStopRecordingWithError:](context, "didStopRecordingWithError:", v6);

  v7 = self->_context;
  self->_context = 0;

  mhUUID = self->_mhUUID;
  self->_mhUUID = 0;

  v9 = -[CSSiriSpeechRecorder _speechController](self, "_speechController");
}

- (id)_fingerprinter
{
  CSSiriAcousticFingerprinter *fingerprinter;
  CSSiriAcousticFingerprinter *v4;
  CSSiriAcousticFingerprinter *v5;
  void *v6;
  void *v7;
  _OWORD v9[2];
  uint64_t v10;

  fingerprinter = self->_fingerprinter;
  if (!fingerprinter)
  {
    v4 = objc_alloc_init(CSSiriAcousticFingerprinter);
    v5 = self->_fingerprinter;
    self->_fingerprinter = v4;

    -[CSSiriAcousticFingerprinter setDelegate:](self->_fingerprinter, "setDelegate:", self);
    -[CSSiriSpeechRecorder _speechController](self, "_speechController", 0, 0, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "getLPCMAudioStreamBasicDescription");
    }
    else
    {
      v10 = 0;
      memset(v9, 0, sizeof(v9));
    }

    -[CSSiriAcousticFingerprinter setASBD:](self->_fingerprinter, "setASBD:", v9);
    fingerprinter = self->_fingerprinter;
  }
  return fingerprinter;
}

- (BOOL)_prepareSpeechControllerWithOptions:(unint64_t)a3 error:(id *)a4
{
  id *v4;
  CSSiriAudioActivationInfo *pendingActivationInfo;
  CSSiriAudioActivationInfo *v8;
  os_log_t *v9;
  void *v10;
  id v11;
  OS_dispatch_queue *queue;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  char v25;
  __CFString *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  id *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  __CFString *v57;
  id v58;
  _QWORD v59[4];
  id v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  const __CFString *v69;
  _QWORD v70[3];

  v4 = a4;
  v70[1] = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  pendingActivationInfo = self->_pendingActivationInfo;
  if (!pendingActivationInfo)
    pendingActivationInfo = self->_currentActivationInfo;
  v8 = pendingActivationInfo;
  v9 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  if ((a3 & 4) == 0
    || !CSIsMacMini()
    || (-[CSSiriAudioActivationInfo deviceIdentifier](v8, "deviceIdentifier"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    if (AFIsInternalInstall())
    {
      v11 = objc_alloc(MEMORY[0x1E0CFEAC8]);
      queue = self->_queue;
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke;
      v59[3] = &unk_1E7C292C8;
      v60 = 0;
      v13 = (void *)objc_msgSend(v11, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, v59, 6.0);
      objc_msgSend(v13, "start");

    }
    else
    {
      v13 = 0;
    }
    v69 = CFSTR("CSSpeechRecordSettingsKey_asrOnDevice");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldDisableSpeechPacketGeneration);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, &v69, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriAudioActivationInfo recordSettingsWithOptions:appendingSettings:](v8, "recordSettingsWithOptions:appendingSettings:", a3, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
      v63 = 2112;
      v64 = v16;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_INFO, "%s Preparing CSSpeechController with settings %@", buf, 0x16u);
    }
    v58 = 0;
    -[CSSiriSpeechRecorder _speechControllerWithError:](self, "_speechControllerWithError:", &v58);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (__CFString *)v58;
    v54 = (void *)v16;
    if (!v18)
    {
      v25 = 0;
      v26 = CFSTR("since we have no Voice Controller!");
      if (!v13)
      {
LABEL_42:
        v45 = *v9;
        v46 = *v9;
        if ((v25 & 1) != 0)
        {
          v47 = v54;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
            _os_log_impl(&dword_1C2614000, v45, OS_LOG_TYPE_INFO, "%s Done preparing CSSpeechController", buf, 0xCu);
          }
          objc_msgSend(v18, "setSpeakerIdDelegate:", self);
          -[CSSiriSpeechRecorder _setLanguageDetectorDelegateIfRequired](self, "_setLanguageDetectorDelegateIfRequired");
          -[CSAudioSessionController registerObserver:](self->_audioSessionController, "registerObserver:", self);
          if (!v4)
            goto LABEL_52;
        }
        else
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
            v63 = 2114;
            v64 = (uint64_t)v26;
            _os_log_error_impl(&dword_1C2614000, v45, OS_LOG_TYPE_ERROR, "%s Error setting up CSSpeechController %{public}@", buf, 0x16u);
          }
          -[CSSiriSpeechRecorder _resetSpeechController](self, "_resetSpeechController");
          v47 = v54;
          if (!v4)
            goto LABEL_52;
        }
        if (v19)
          *v4 = objc_retainAutorelease(v19);
LABEL_52:

        goto LABEL_53;
      }
LABEL_41:
      objc_msgSend(v13, "cancelIfNotAlreadyCanceled");

      goto LABEL_42;
    }
    v53 = v4;
    -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logEventWithType:context:", 207, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logMHAssistantDaemonAudioPrepareContextWithMHUUID:withPrepareStarted:", v20, 1);

    kdebug_trace();
    if (v8)
    {
      -[CSSiriAudioActivationInfo recordContext](v8, "recordContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isRequestDuringActiveCall");

      if (v24)
        -[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:](self, "_setAudioContextWithInfo:forReason:", v8, CFSTR("requestDuringActiveCall"));
    }
    v57 = v19;
    v25 = objc_msgSend(v18, "prepareRecordWithSettings:error:", v16, &v57);
    v26 = v57;

    if ((v25 & 1) != 0)
    {
      -[CSSiriAudioActivationInfo audioSessionActivated](self->_currentActivationInfo, "audioSessionActivated");
      v27 = 0;
      goto LABEL_40;
    }
    -[__CFString domain](v26, "domain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0CB2F90];
    if (objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CB2F90]))
    {
      if (-[__CFString code](v26, "code") == -11795
        || -[__CFString code](v26, "code") == -11784
        || -[__CFString code](v26, "code") == 2)
      {

      }
      else
      {
        v50 = -[__CFString code](v26, "code");

        if (v50 != 2003329396)
        {
LABEL_28:
          -[__CFString domain](v26, "domain");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v31, "isEqualToString:", v29))
          {
            v32 = -[__CFString code](v26, "code");

            if (v32 != 561017449)
            {
LABEL_34:
              if (v8)
              {
                -[CSSiriAudioActivationInfo recordContext](v8, "recordContext");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "isRequestDuringActiveCall");

                if (v37)
                  v38 = 236;
                else
                  v38 = 221;
              }
              else
              {
                v38 = 221;
              }
              AFAddInterruptingAudioSessionInfoToAnalyticsContext();
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "submitAudioIssueReport:withError:", *MEMORY[0x1E0D19378], v26);

              objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", v38, 0, v26);
              v40 = objc_claimAutoreleasedReturnValue();

              v26 = (__CFString *)v40;
LABEL_40:
              objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "systemUptime");
              self->_lastPrepareTimestamp = v42;

              kdebug_trace();
              objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "logEventWithType:context:", 208, v27);

              objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "logMHAssistantDaemonAudioPrepareContextWithMHUUID:withPrepareStarted:", v20, 0);

              v19 = v26;
              v4 = v53;
              v9 = (os_log_t *)MEMORY[0x1E0CFE6C0];
              if (!v13)
                goto LABEL_42;
              goto LABEL_41;
            }
            +[CSMXSessionMonitor GetCurrentlyActiveSessionCategory](CSMXSessionMonitor, "GetCurrentlyActiveSessionCategory");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[CSMXSessionMonitor GetCurrentlyActiveSessionMode](CSMXSessionMonitor, "GetCurrentlyActiveSessionMode");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = (void *)*MEMORY[0x1E0D18F38];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F38], OS_LOG_TYPE_ERROR))
            {
              v51 = v34;
              v52 = -[__CFString code](v26, "code");
              *(_DWORD *)buf = 136315906;
              v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
              v63 = 2048;
              v64 = v52;
              v65 = 2112;
              v66 = v31;
              v67 = 2112;
              v68 = v33;
              _os_log_error_impl(&dword_1C2614000, v51, OS_LOG_TYPE_ERROR, "%s Failed to prepare with Insufficient Priority(%ld), because %@ with %@ is currently active.", buf, 0x2Au);

            }
            objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "logMHAssistantDaemonAudioSessionActivationFailedWithInsufficientPriority:activeSessionDisplayIDs:audioSessionCategory:audioSessionMode:", v20, 0, v31, v33);

          }
          goto LABEL_34;
        }
      }
      objc_msgSend(MEMORY[0x1E0D19078], "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke_46;
      v55[3] = &unk_1E7C281B8;
      v56 = v20;
      objc_msgSend(v30, "getConnectedBluetoothDeviceAddressesWithCompletion:", v55);

      v28 = v56;
    }

    goto LABEL_28;
  }
  v49 = *v9;
  v25 = 0;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
    _os_log_impl(&dword_1C2614000, v49, OS_LOG_TYPE_DEFAULT, "%s Skip prewarming on MacMini's mic, since it doesn't have built-in mic", buf, 0xCu);
    v25 = 0;
  }
LABEL_53:

  return v25;
}

- (void)_stopRecordingWithReason:(id)a3 hostTime:(unint64_t)a4
{
  int var0;
  os_log_t *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  int64_t recordingState;
  CSSpeechController *speechController;
  void *v15;
  CSEndpointerMetrics *lastEndpointerMetrics;
  CSEndpointDelayReporter *endpointDelayReporter;
  double v18;
  NSObject *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  CSSpeechController *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  os_signpost_id_t v34;
  NSObject *v35;
  NSObject *v36;
  unint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  id v47;
  unint64_t stopRecordingReason;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id *v53;
  os_signpost_id_t v54;
  NSObject *v55;
  NSObject *v56;
  CSSpeechController *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  CSSpeechController *v62;
  _QWORD v63[4];
  unsigned int var1;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  _BYTE v68[14];
  __int16 v69;
  void *v70;
  __int16 v71;
  unint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  var0 = a3.var0.var0;
  v8 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v9 = *MEMORY[0x1E0CFE6C0];
  v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
  if (var0 == 5)
  {
    if (v10)
    {
      v11 = v9;
      AFSpeechEventGetDescription();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v66 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
      v67 = 1024;
      *(_DWORD *)v68 = 5;
      *(_WORD *)&v68[4] = 2048;
      *(_QWORD *)&v68[6] = a3.var0.var1;
      v69 = 2112;
      v70 = v12;
      v71 = 2048;
      v72 = a4;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s reason = %d, speechEvent = %zd (%@), hostTime = %llu", buf, 0x30u);

    }
  }
  else if (v10)
  {
    *(_DWORD *)buf = 136315650;
    v66 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
    v67 = 1024;
    *(_DWORD *)v68 = var0;
    *(_WORD *)&v68[4] = 2048;
    *(_QWORD *)&v68[6] = a4;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s reason = %d, hostTime = %llu", buf, 0x1Cu);
  }
  -[CSSiriSpeechRecordingContext willStopRecordingAtHostTime:](self->_context, "willStopRecordingAtHostTime:", a4);
  -[CSSiriSpeechRecorder _cancelExtendedEndpointTimer](self, "_cancelExtendedEndpointTimer");
  recordingState = self->_recordingState;
  if ((unint64_t)(recordingState - 1) >= 2)
  {
    if (recordingState != 3)
    {
LABEL_59:
      v59 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
        _os_log_error_impl(&dword_1C2614000, v59, OS_LOG_TYPE_ERROR, "%s Sending stop recording immediately because CSSpeechController isn't recording", buf, 0xCu);
      }
      -[CSSiriSpeechCapturingDelegate speechCapturingDidStopRecordingWithError:endpointMode:totalPacketCount:endpointerMetrics:](self->_delegate, "speechCapturingDidStopRecordingWithError:endpointMode:totalPacketCount:endpointerMetrics:", 0, 0, self->_packetCount, 0);
      return;
    }
    v19 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      v20 = CFSTR(" Forcing two shot mode to NO");
      if (!self->_didEnterTwoShotMode)
        v20 = &stru_1E7C296E8;
      *(_DWORD *)buf = 136315394;
      v66 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
      v67 = 2112;
      *(_QWORD *)v68 = v20;
      _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_INFO, "%s Someone else has already asked to stop recording.%@", buf, 0x16u);
    }
    self->_didEnterTwoShotMode = 0;
    self->_didPerformTwoShotPrompt = 0;
  }
  else
  {
    speechController = self->_speechController;
    if (speechController)
    {
      -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSEndpointDelayReporter setStopRecordingHostTime:](self->_endpointDelayReporter, "setStopRecordingHostTime:", mach_absolute_time());
      lastEndpointerMetrics = self->_lastEndpointerMetrics;
      endpointDelayReporter = self->_endpointDelayReporter;
      if (lastEndpointerMetrics)
        -[CSEndpointerMetrics totalAudioRecorded](lastEndpointerMetrics, "totalAudioRecorded");
      else
        v18 = 0.0;
      -[CSEndpointDelayReporter setEndpointTimeInMs:](endpointDelayReporter, "setEndpointTimeInMs:", v18);
      -[CSEndpointDelayReporter reportEndpointDelayIfNeed](self->_endpointDelayReporter, "reportEndpointDelayIfNeed");
      objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __58__CSSiriSpeechRecorder__stopRecordingWithReason_hostTime___block_invoke;
      v63[3] = &__block_descriptor_36_e19___NSDictionary_8__0l;
      var1 = a3.var1;
      objc_msgSend(v21, "logEventWithType:contextProvider:", 216, v63);

      objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMHAssistantDaemonAudioStopRecordingContextWithMHUUID:withStopRecordingStarted:withADStopRecordingEvent:", v15, 1, a3.var0.var0);

      if (-[CSSiriSpeechRecorder _shouldEmitInstrumentation](self, "_shouldEmitInstrumentation"))
      {
        v60 = v15;
        v23 = objc_alloc_init(MEMORY[0x1E0D9A3E8]);
        v24 = v23;
        v25 = speechController;
        if (a3.var0.var0 > 8u)
          v26 = 0;
        else
          v26 = dword_1C276CCC0[(__int16)a3.var0.var0];
        objc_msgSend(v23, "setStopReasonMajor:", v26, v60);
        v27 = (unsigned __int16)(a3.var0.var1 - 1);
        if (v27 < 0xB)
          v28 = v27 + 1;
        else
          v28 = 0;
        objc_msgSend(v24, "setStopReasonMinor:", v28);
        objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = mach_absolute_time();
        -[CSSiriAudioActivationInfo turnIdentifier](self->_currentActivationInfo, "turnIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v24, v30, v31);

        speechController = v25;
        v15 = v61;
      }
      if (AFIsInternalInstall())
      {
        v32 = *v8;
        v33 = os_signpost_id_generate(*v8);
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v34 = v33;
          if (os_signpost_enabled(v32))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1C2614000, v32, OS_SIGNPOST_EVENT, v34, "SpeechRecorder", "StopRecording", buf, 2u);
          }
        }

      }
      kdebug_trace();
      v35 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v66 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
        _os_log_impl(&dword_1C2614000, v35, OS_LOG_TYPE_INFO, "%s Really stopping recording", buf, 0xCu);
      }
      v36 = *MEMORY[0x1E0D18F60];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v66 = "_ADSpeechRecorderGetCSStopRecordingReason";
        v67 = 1024;
        *(_DWORD *)v68 = var0;
        _os_log_impl(&dword_1C2614000, v36, OS_LOG_TYPE_DEFAULT, "%s inReason.parts.event:%u", buf, 0x12u);
      }
      switch(a3.var0.var0)
      {
        case 2u:
        case 3u:
          v37 = 1;
          break;
        case 4u:
          v37 = 2;
          break;
        case 5u:
          v37 = 2 * ((a3.var1 & 0xFFFF0000) == 327680);
          break;
        case 6u:
          v37 = 4;
          break;
        case 7u:
          v37 = 3;
          break;
        default:
          v37 = 0;
          break;
      }
      self->_stopRecordingReason = v37;
      self->_stopRecordingMachContinuousTime = mach_continuous_time();
      if (objc_msgSend(MEMORY[0x1E0D19260], "isContinuousConversationSupported")
        && self->_shouldDisableSpeechPacketGeneration)
      {
        v62 = speechController;
        -[CSSiriSpeechRecorder _currentRecordRoute](self, "_currentRecordRoute");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSiriSpeechRecorder _currentPlaybackRoute](self, "_currentPlaybackRoute");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[CSSiriSpeechRecorder _audioSessionID](self, "_audioSessionID");
        +[CSAttSiriMagusSupportedPolicy sharedInstance](CSAttSiriMagusSupportedPolicy, "sharedInstance");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSiriAudioActivationInfo recordContext](self->_currentActivationInfo, "recordContext");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSSiriSpeechRecorder _currentRecordDeviceInfo](self, "_currentRecordDeviceInfo");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v41, "isMagusSupportedWithAudioRecordContext:recordRoute:playbackRoute:audioSessionId:recordDeviceInfo:", v42, v38, v39, v40, v43);

        if ((_DWORD)v44)
        {
          v45 = *MEMORY[0x1E0D18F60];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v66 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
            _os_log_impl(&dword_1C2614000, v45, OS_LOG_TYPE_DEFAULT, "%s Requesting audio stream hold until flexible followup pick up", buf, 0xCu);
          }
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19050]), "initWithTimeout:clientIdentity:requireRecordModeLock:requireListeningMicIndicatorLock:", 5, 0, 1, 1.0);
        }
        else
        {
          v46 = 0;
        }
        v8 = (os_log_t *)MEMORY[0x1E0CFE6C0];
        speechController = v62;

      }
      else
      {
        v44 = 0;
        v46 = 0;
      }
      v47 = objc_alloc(MEMORY[0x1E0D19038]);
      stopRecordingReason = self->_stopRecordingReason;
      -[CSEndpointerMetrics trailingSilenceDurationAtEndpoint](self->_lastEndpointerMetrics, "trailingSilenceDurationAtEndpoint");
      v49 = (void *)objc_msgSend(v47, "initWithStopRecordingReason:expectedStopHostTime:trailingSilenceDurationAtEndpoint:holdRequest:supportsMagus:", stopRecordingReason, a4, v46, v44);
      -[CSSpeechController stopRecordingWithOptions:](self->_speechController, "stopRecordingWithOptions:", v49);
      objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "logEventWithType:context:", 217, 0);

      objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "logMHAssistantDaemonAudioStopRecordingContextWithMHUUID:withStopRecordingStarted:withADStopRecordingEvent:", v15, 0, 0);

      if (self->_stopRecordingReason == 2)
      {
        objc_msgSend(v15, "UUIDString");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSEndpointLoggingHelper reportServerEndpointWithMhId:](CSEndpointLoggingHelper, "reportServerEndpointWithMhId:", v52);

        -[CSSiriSpeechRecorder _reportServerEndpointMetricsIfNeeded](self, "_reportServerEndpointMetricsIfNeeded");
      }
      v53 = (id *)MEMORY[0x1E0CFE6A0];
      v54 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E0CFE6A0]);
      v55 = *v53;
      v56 = v55;
      if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v54, "UsefulUserFacingResults", (const char *)&unk_1C27B3481, buf, 2u);
      }

      -[CSSiriSpeechCapturingDelegate speechCapturingWillStopRecordingWithSignpostID:](self->_delegate, "speechCapturingWillStopRecordingWithSignpostID:", v54);
      -[CSSiriSpeechRecorder _logFanState](self, "_logFanState");

      recordingState = self->_recordingState;
    }
    if (recordingState == 1)
    {
      v57 = self->_speechController;
      objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:", 216);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:](self, "_speechControllerDidStartRecording:successfully:error:", v57, 0, v58);

    }
    self->_recordingState = 3;
    if (!speechController)
      goto LABEL_59;
  }
}

- (void)_reportServerEndpointMetricsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t firstBufferHostTime;
  double skippedSamplesTimeInSec;
  unint64_t stopRecordingMachContinuousTime;
  NSObject *queue;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  unint64_t v17;
  double v18;
  unint64_t v19;

  -[NSDictionary objectForKey:](self->_speechRecognizedContextForServerEndpointInstrumentation, "objectForKey:", CFSTR("endTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_speechRecognizedContextForServerEndpointInstrumentation, "objectForKey:", CFSTR("leadingSilence"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](self->_speechRecognizedContextForServerEndpointInstrumentation, "objectForKey:", CFSTR("trailingSilence"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_stopRecordingReason == 2 && v3 != 0 && v5 != 0)
  {
    firstBufferHostTime = self->_firstBufferHostTime;
    skippedSamplesTimeInSec = self->_skippedSamplesTimeInSec;
    stopRecordingMachContinuousTime = self->_stopRecordingMachContinuousTime;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__CSSiriSpeechRecorder__reportServerEndpointMetricsIfNeeded__block_invoke;
    block[3] = &unk_1E7C28218;
    block[4] = self;
    v14 = v3;
    v15 = v4;
    v16 = v6;
    v17 = stopRecordingMachContinuousTime;
    v18 = skippedSamplesTimeInSec;
    v19 = firstBufferHostTime;
    dispatch_async(queue, block);

  }
}

- (BOOL)_shouldEmitInstrumentation
{
  void *v2;
  BOOL v3;

  -[CSSiriAudioActivationInfo turnIdentifier](self->_currentActivationInfo, "turnIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int)_mapInstrumentationEndpointTypeFromStopRecordingReason:(id)a3
{
  int result;

  result = 6;
  switch(a3.var0.var0)
  {
    case 1u:
      if ((unint64_t)(self->_endpointerOperationMode - 3) < 2
        || (self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        goto LABEL_6;
      }
      result = 1;
      break;
    case 2u:
    case 3u:
LABEL_6:
      result = 2;
      break;
    case 4u:
      if (self->_serverDidEndpoint)
        result = 3;
      else
        result = 2;
      break;
    case 5u:
      if ((unsigned __int16)(a3.var0.var1 - 1) >= 5u)
        result = 5;
      else
        result = dword_1C276CCE4[(unsigned __int16)(a3.var0.var1 - 1)];
      break;
    case 6u:
    case 7u:
    case 8u:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

- (void)_playAudioAlert:(int64_t)a3
{
  void *v5;
  NSMutableDictionary *numberOfAVVCAlertPlaybacksByType;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  NSObject *alertPlaybackGroup;
  OS_dispatch_group *v14;
  OS_dispatch_group *v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  int64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _updateAudioContextToPostVoiceForReason:](self, "_updateAudioContextToPostVoiceForReason:", v5);

  numberOfAVVCAlertPlaybacksByType = self->_numberOfAVVCAlertPlaybacksByType;
  if (numberOfAVVCAlertPlaybacksByType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](numberOfAVVCAlertPlaybacksByType, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    numberOfAVVCAlertPlaybacksByType = (NSMutableDictionary *)objc_msgSend(v8, "unsignedIntegerValue");

  }
  else
  {
    v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    v7 = self->_numberOfAVVCAlertPlaybacksByType;
    self->_numberOfAVVCAlertPlaybacksByType = v9;
  }

  v10 = self->_numberOfAVVCAlertPlaybacksByType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", (char *)&numberOfAVVCAlertPlaybacksByType->super.super.isa + 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v11, v12);

  if (!numberOfAVVCAlertPlaybacksByType)
  {
    alertPlaybackGroup = self->_alertPlaybackGroup;
    if (!alertPlaybackGroup)
    {
      v14 = (OS_dispatch_group *)dispatch_group_create();
      v15 = self->_alertPlaybackGroup;
      self->_alertPlaybackGroup = v14;

      alertPlaybackGroup = self->_alertPlaybackGroup;
    }
    dispatch_group_enter(alertPlaybackGroup);
  }
  v16 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v17 = 136315394;
    v18 = "-[CSSiriSpeechRecorder _playAudioAlert:]";
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_INFO, "%s Playing alert %ld", (uint8_t *)&v17, 0x16u);
  }
  -[CSSpeechController playAlertSoundForType:](self->_speechController, "playAlertSoundForType:", a3);
}

- (BOOL)_checkAudioLoggingLimits:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "limitedAudioLoggingEnabled");

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v6, "enumeratorAtPath:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nextObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = 0;
      do
      {
        v10 += objc_msgSend(v9, "hasSuffix:", CFSTR("wav"));
        objc_msgSend(v7, "nextObject");
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v11;
      }
      while (v11);
    }
    else
    {
      v10 = 0;
    }
    v12 = v10 < 0xA;
    v13 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v15 = 136315650;
      v16 = "-[CSSiriSpeechRecorder _checkAudioLoggingLimits:]";
      v17 = 1024;
      v18 = v10;
      v19 = 1024;
      v20 = v10 < 0xA;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_INFO, "%s Checked audio logging limits, count = %d -> %d", (uint8_t *)&v15, 0x18u);
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (BOOL)_prepareDirectoryAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v10;
  char v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  if (objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v3, &v11))
  {
    if (v11)
    {
      v5 = 1;
    }
    else
    {
      v8 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[CSSiriSpeechRecorder _prepareDirectoryAtPath:]";
        v14 = 2112;
        v15 = v3;
        _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s An item already exists at path %@, but it is not a directory.", buf, 0x16u);
      }
      v5 = 0;
    }
  }
  else
  {
    v10 = 0;
    v5 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v10);
    v6 = v10;
    if (v6)
      v5 = 0;
    if ((v5 & 1) == 0)
    {
      v7 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v13 = "-[CSSiriSpeechRecorder _prepareDirectoryAtPath:]";
        v14 = 2112;
        v15 = v3;
        v16 = 2112;
        v17 = v6;
        _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Failed to create directory at path %@ due to error %@.", buf, 0x20u);
      }
    }

  }
  return v5;
}

- (void)_setupAudioFileWritingForSpeechController:(id)a3 info:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  NSFileHandle *audioFileHandle;
  CSSiriAudioFileWriter *v14;
  int64_t audioFileType;
  CSSiriAudioFileWriter *v16;
  NSObject *v17;
  CSSiriAudioFileWriter *v18;
  CSSiriAudioFileWriter *audioFileWriter;
  NSObject *v20;
  CSSiriAudioFileWriter *v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  int IsVoiceTrigger;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  id v40;
  NSObject *v41;
  _QWORD v42[5];
  id v43;
  __CFString *v44;
  uint8_t v45[4];
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint8_t buf[32];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v12 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v10;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s info = %@, context = %@", buf, 0x20u);
  }
  if (self->_audioFileType)
  {
    audioFileHandle = self->_audioFileHandle;
    v14 = [CSSiriAudioFileWriter alloc];
    audioFileType = self->_audioFileType;
    if (audioFileHandle)
      v16 = -[CSSiriAudioFileWriter initWithType:fileHandle:priority:](v14, "initWithType:fileHandle:priority:", audioFileType, self->_audioFileHandle, 25);
    else
      v16 = -[CSSiriAudioFileWriter initWithType:pathGenerator:priority:](v14, "initWithType:pathGenerator:priority:", audioFileType, 0, 25);
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v16;

    v20 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      v21 = self->_audioFileWriter;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s Created _audioFileWriter %@.", buf, 0x16u);
    }
  }
  else
  {
    v17 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_INFO, "%s Did not create _audioFileWriter because audioFileType = %ld.", buf, 0x16u);
    }
    v18 = self->_audioFileWriter;
    self->_audioFileWriter = 0;

  }
  objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "isVoiceTriggerAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "cloudSyncEnabled");

  }
  else
  {
    v24 = 0;
  }

  v25 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v24;
    _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_INFO, "%s supportsVoiceIdentificationTraining = %d", buf, 0x12u);
  }
  v26 = AFSupportsSpeechExtraction();
  v27 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v26;
    _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_INFO, "%s supportsSpeechExtraction = %d", buf, 0x12u);
  }
  if (objc_msgSend(v9, "canGetPCMStream"))
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "fileLoggingIsEnabled");

  }
  else
  {
    v29 = 0;
  }
  v30 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v26;
    _os_log_impl(&dword_1C2614000, v30, OS_LOG_TYPE_INFO, "%s supportsSpeechLogging = %d", buf, 0x12u);
  }
  if (self->_audioFileWriter)
  {
    objc_msgSend(v8, "recordSettings");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    memset(buf, 0, sizeof(buf));
    _LPCMStreamASBDForSpeechControllerSettings((uint64_t)buf, v31);
    v32 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v45 = 136315394;
      v46 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
      v47 = 2112;
      v48 = v31;
      _os_log_impl(&dword_1C2614000, v32, OS_LOG_TYPE_INFO, "%s Configure _audioFileWriter with recordSettings = %@.", v45, 0x16u);
    }
    -[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:](self->_audioFileWriter, "configureWithAudioStreamBasicDescription:", buf);

  }
  if ((v24 | v26 | v29) == 1)
  {
    objc_msgSend(v8, "recordSettings");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    memset(buf, 0, sizeof(buf));
    _LPCMStreamASBDForSpeechControllerSettings((uint64_t)buf, v33);
    v34 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v45 = 136315650;
      v46 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
      v47 = 2112;
      v48 = v10;
      v49 = 2112;
      v50 = v33;
      _os_log_impl(&dword_1C2614000, v34, OS_LOG_TYPE_INFO, "%s Ask context %@ to configure and record with recordSettings = %@.", v45, 0x20u);
    }
    objc_msgSend(v10, "beginRecordingAudioWithAudioStreamBasicDescription:", buf);
    if (v29)
    {
      v35 = objc_alloc_init(MEMORY[0x1E0C99D68]);
      objc_msgSend(v9, "speechEvent");
      IsVoiceTrigger = AFSpeechEventIsVoiceTrigger();
      v37 = CFSTR("DT");
      if (IsVoiceTrigger)
        v37 = CFSTR("VT");
      v38 = v37;
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __79__CSSiriSpeechRecorder__setupAudioFileWritingForSpeechController_info_context___block_invoke;
      v42[3] = &unk_1E7C28240;
      v42[4] = self;
      v43 = v35;
      v44 = v38;
      v39 = v38;
      v40 = v35;
      objc_msgSend(v10, "acquireRecordedAudioWithHandler:", v42);

    }
  }
  v41 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    _os_log_impl(&dword_1C2614000, v41, OS_LOG_TYPE_INFO, "%s Done", buf, 0xCu);
  }

}

- (void)_setEndpointStyle:(int64_t)a3
{
  NSObject *v5;
  CSEndpointAnalyzer *endpointAnalyzer;
  double v7;
  int v8;
  const char *v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[CSSiriSpeechRecorder _setEndpointStyle:]";
    v10 = 2048;
    v11 = a3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %ld", (uint8_t *)&v8, 0x16u);
  }
  if (a3 == 2)
  {
    -[CSEndpointAnalyzer setStartWaitTime:](self->_endpointAnalyzer, "setStartWaitTime:", 60.0);
    -[CSEndpointAnalyzer setEndWaitTime:](self->_endpointAnalyzer, "setEndWaitTime:", 60.0);
  }
  else
  {
    if (a3 == 1)
    {
      -[CSEndpointAnalyzer setEndWaitTime:](self->_endpointAnalyzer, "setEndWaitTime:", 0.5);
      endpointAnalyzer = self->_endpointAnalyzer;
      v7 = 0.5;
    }
    else
    {
      if (a3)
        return;
      -[CSEndpointAnalyzer setStartWaitTime:](self->_endpointAnalyzer, "setStartWaitTime:", 5.0);
      -[CSEndpointAnalyzer setEndWaitTime:](self->_endpointAnalyzer, "setEndWaitTime:", 0.77);
      endpointAnalyzer = self->_endpointAnalyzer;
      v7 = 0.36;
    }
    -[CSEndpointAnalyzer setInterspeechWaitTime:](endpointAnalyzer, "setInterspeechWaitTime:", v7);
  }
}

- (void)_stopRecordingForEndpointReason:(id)a3 withEndpointMetrics:(id)a4
{
  id v6;
  int64_t recordingState;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  recordingState = self->_recordingState;
  v8 = *MEMORY[0x1E0CFE6C0];
  v9 = *MEMORY[0x1E0CFE6C0];
  if (recordingState == 2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = "-[CSSiriSpeechRecorder _stopRecordingForEndpointReason:withEndpointMetrics:]";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
    }
    -[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:](self, "_stopRecordingWithReason:hostTime:", a3.var1, objc_msgSend(v6, "endpointBufferHostTime"));
    if (!self->_didEnterTwoShotMode)
      -[CSSiriSpeechCapturingDelegate speechCapturingWillStopRecording](self->_delegate, "speechCapturingWillStopRecording");
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 136315394;
    v11 = "-[CSSiriSpeechRecorder _stopRecordingForEndpointReason:withEndpointMetrics:]";
    v12 = 2048;
    v13 = recordingState;
    _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Ignoring unexpected stop recording while in state %ld", (uint8_t *)&v10, 0x16u);
  }

}

- (void)eagerlyInitializeAudioRecording
{
  NSObject *v3;
  id v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "-[CSSiriSpeechRecorder eagerlyInitializeAudioRecording]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  v4 = -[CSSiriSpeechRecorder _speechController](self, "_speechController");
}

- (void)preheatWithOption:(id)a3
{
  CSSiriAudioActivationInfo *pendingActivationInfo;
  CSSiriAudioActivationInfo *v6;
  void *v7;
  void *v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  AFClientConfiguration *currentClientConfiguration;
  void *v17;
  NSObject *v18;
  os_log_t *v19;
  NSObject *v20;
  void *v21;
  _BOOL4 v22;
  CSSiriAudioActivationInfo *v23;
  NSObject *v24;
  CSSiriAudioActivationInfo *currentActivationInfo;
  id v26;
  int v27;
  const char *v28;
  __int16 v29;
  CSSiriAudioActivationInfo *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  pendingActivationInfo = self->_pendingActivationInfo;
  if (!pendingActivationInfo)
    pendingActivationInfo = self->_currentActivationInfo;
  v6 = pendingActivationInfo;
  if (-[CSSiriAudioActivationInfo canPrewarm](v6, "canPrewarm"))
  {
    -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriSpeechRecorder _speechController](self, "_speechController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v10 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v27 = 136315138;
      v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s Prewarming audio session in speech controller", (uint8_t *)&v27, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logEventWithType:context:", 205, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logMHAssistantDaemonAudioPrewarmContextWithMHUUID:withPrewarmStarted:", v7, 1);

    kdebug_trace();
    objc_msgSend(v8, "prewarmAudioSession");
    kdebug_trace();
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logEventWithType:context:", 206, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logMHAssistantDaemonAudioPrewarmContextWithMHUUID:withPrewarmStarted:", v7, 0);

    v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      v27 = 136315138;
      v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_INFO, "%s Done prewarm audio session in speech controller", (uint8_t *)&v27, 0xCu);
    }
    if (AFIsHorseman())
    {
      if (-[CSSiriSpeechRecorder _shouldPlaySummonedToneOnTopCapInvocationOnHorseman](self, "_shouldPlaySummonedToneOnTopCapInvocationOnHorseman"))
      {
        currentClientConfiguration = self->_currentClientConfiguration;
        if (currentClientConfiguration)
        {
          -[AFClientConfiguration tapToSiriAudioPlaybackRequest](currentClientConfiguration, "tapToSiriAudioPlaybackRequest");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            v18 = *v9;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v27 = 136315138;
              v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
              _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_INFO, "%s Prewarming start alert", (uint8_t *)&v27, 0xCu);
            }
            -[CSSiriAudioPlaybackService prewarmRequest:completion:](self->_audioPlaybackService, "prewarmRequest:completion:", v17, &__block_literal_global_24684);
          }

        }
      }
    }

  }
  else if (-[CSSiriAudioActivationInfo canPrepareWithoutInterruption](v6, "canPrepareWithoutInterruption"))
  {
    v19 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v20 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v27 = 136315138;
      v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s Preparing instead of preheating since we're not in the default mode", (uint8_t *)&v27, 0xCu);
    }
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:](self, "_setAudioContextWithInfo:forReason:", v6, v21);

    if (v22)
    {
      v23 = self->_pendingActivationInfo;
      self->_pendingActivationInfo = 0;

      objc_storeStrong((id *)&self->_currentActivationInfo, pendingActivationInfo);
      v24 = *v19;
      if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
      {
        currentActivationInfo = self->_currentActivationInfo;
        v27 = 136315394;
        v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
        v29 = 2112;
        v30 = currentActivationInfo;
        _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_INFO, "%s Set pending info as current %@.", (uint8_t *)&v27, 0x16u);
      }
    }
    -[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:](self, "_prepareSpeechControllerWithOptions:error:", 4, 0);
  }
  else
  {
    v26 = -[CSSiriSpeechRecorder _speechController](self, "_speechController");
  }

}

- (void)preheatRecognizerWithOption:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "isTest");
  if ((AFDeviceSupportsSiriUOD() & 1) != 0
    || AFOfflineDictationCapable()
    && (objc_msgSend(v6, "skipPersonalizedASR") & 1) == 0
    && ((v3 ^ 1) & 1) == 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D44468]), "initWithDelegate:", 0);
    if (v6)
    {
      objc_msgSend(v6, "preheatLanguage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v4, "preheatLocalSpeechRecognitionWithLanguage:source:", v5, 1);
    objc_msgSend(v4, "invalidate");

  }
}

- (BOOL)prepareSpeechCaptureWithOptions:(unint64_t)a3 error:(id *)a4
{
  _BOOL4 v6;
  void *v7;

  v6 = -[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:](self, "_prepareSpeechControllerWithOptions:error:", a3, a4);
  if (v6)
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:](self, "_updateAudioDeviceInfo:forReason:forcesUpdate:", 0, v7, 0);

  }
  return v6;
}

- (id)recordingInfoForPreheatWithEvent:(int64_t)a3
{
  NSObject *v5;
  id v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[CSSiriSpeechRecorder recordingInfoForPreheatWithEvent:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  v6 = -[CSSiriSpeechRecorder _speechController](self, "_speechController");
  -[CSSiriSpeechRecorder _recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:](self, "_recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:", a3, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)currentVTSatScore
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[CSSiriSpeechRecorder currentVTSatScore]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  -[CSSiriAudioActivationInfo speechEvent](self->_currentActivationInfo, "speechEvent");
  if (AFSpeechEventIsVoiceTrigger())
  {
    -[CSSpeechController voiceTriggerInfo](self->_speechController, "voiceTriggerInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("satScore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (void)suspendAutomaticEndpointingInRange:(AFTimeRange)a3
{
  -[CSEndpointAnalyzer setAutomaticEndpointingSuspensionEndTime:](self->_endpointAnalyzer, "setAutomaticEndpointingSuspensionEndTime:", a3.var0 + a3.var1);
}

- (void)prepareForMode:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315138;
    v7 = "-[CSSiriSpeechRecorder prepareForMode:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  -[CSSiriSpeechRecorder prepareForMode:withOptions:](self, "prepareForMode:withOptions:", a3, 0);
}

- (void)prepareForMode:(int64_t)a3 withOptions:(id)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  NSUUID *v10;
  NSUUID *mhUUID;
  NSUUID *v12;
  NSUUID *v13;
  _BYTE v14[24];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4)
      v8 = CFSTR("Off");
    else
      v8 = off_1E7C28810[a3 - 1];
    *(_DWORD *)v14 = 136315650;
    *(_QWORD *)&v14[4] = "-[CSSiriSpeechRecorder prepareForMode:withOptions:]";
    *(_WORD *)&v14[12] = 2112;
    *(_QWORD *)&v14[14] = v8;
    *(_WORD *)&v14[22] = 2112;
    v15 = v6;
    v9 = v7;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s Preparing speech capture for %@ options:%@", v14, 0x20u);

  }
  -[CSSiriSpeechRecorder _setSpeechCapturingMode:](self, "_setSpeechCapturingMode:", a3, *(_OWORD *)v14, *(_QWORD *)&v14[16], v15);
  -[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:](self, "_setEndpointerOperationMode:forceUpdate:", objc_msgSend(v6, "endpointerOperationMode"), 1);
  -[CSSiriSpeechRecorder _mhUUIDFromSpeechRequestOptions:](self, "_mhUUIDFromSpeechRequestOptions:", v6);
  v10 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  mhUUID = self->_mhUUID;
  self->_mhUUID = v10;

  if (!self->_mhUUID)
  {
    -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 1);
    v12 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v13 = self->_mhUUID;
    self->_mhUUID = v12;

  }
}

- (BOOL)startSpeechCaptureWithContext:(id)a3 willStartHandler:(id)a4 error:(id *)a5
{
  id v9;
  void (**v10)(_QWORD);
  id *v11;
  NSObject *v12;
  CSSiriAudioActivationInfo *currentActivationInfo;
  CSSiriAudioActivationInfo *pendingActivationInfo;
  _BOOL4 v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  double v22;
  BOOL v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  id v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  _BOOL4 v42;
  _BOOL4 v43;
  void *v44;
  double v45;
  double v46;
  NSObject *v47;
  int v48;
  NSObject *v49;
  double v50;
  NSObject *v51;
  void *v52;
  void *v53;
  char v54;
  char v55;
  char v56;
  void *v57;
  NSObject *v58;
  void *v59;
  CSSiriAudioActivationInfo *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int64_t speechCapturingMode;
  unint64_t startEvent;
  char v72;
  double v73;
  void *v74;
  double lastPrepareTimestamp;
  double v76;
  NSObject *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  NSObject *v83;
  os_signpost_id_t v84;
  os_signpost_id_t v85;
  CSSpeechController *speechController;
  _BOOL4 v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  CSSiriSpeechRecordingContext *context;
  OpaqueAudioConverter *decoder;
  void *v97;
  uint64_t v98;
  NSObject *v99;
  BOOL v100;
  NSObject *v101;
  const __CFString *v103;
  double v104;
  _BOOL4 v105;
  id *v106;
  char v107;
  void (**v108)(_QWORD);
  void *v109;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  _QWORD v116[4];
  id v117;
  CSSiriSpeechRecorder *v118;
  _QWORD v119[4];
  NSObject *v120;
  _QWORD v121[4];
  NSObject *v122;
  CSSiriSpeechRecorder *v123;
  id v124;
  uint8_t buf[4];
  const char *v126;
  __int16 v127;
  _BYTE v128[10];
  _BYTE v129[10];
  __int16 v130;
  const __CFString *v131;
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(_QWORD))a4;
  v11 = (id *)MEMORY[0x1E0CFE6C0];
  v12 = (id)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    currentActivationInfo = self->_currentActivationInfo;
    *(_DWORD *)buf = 136315650;
    v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    v127 = 2112;
    *(_QWORD *)v128 = v9;
    *(_WORD *)&v128[8] = 2112;
    *(_QWORD *)v129 = currentActivationInfo;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s context:%@, _currentActivationInfo :%@", buf, 0x20u);
  }

  pendingActivationInfo = self->_pendingActivationInfo;
  if (!pendingActivationInfo)
    pendingActivationInfo = self->_currentActivationInfo;
  objc_msgSend(v9, "willPrepareAndStartRecordingWithAudioActivationInfo:", pendingActivationInfo);
  v124 = 0;
  v15 = -[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:](self, "_prepareSpeechControllerWithOptions:error:", 9, &v124);
  v16 = v124;
  if (!v15)
  {
    -[CSSiriSpeechRecorder _logFanState](self, "_logFanState");
    goto LABEL_122;
  }
  -[CSSiriSpeechRecorder _setAlertsIfNeeded](self, "_setAlertsIfNeeded");
  if (self->_speechCapturingMode == 4)
    v17 = 2;
  else
    v17 = 2 * ((unint64_t)(self->_endpointerOperationMode - 3) > 1);
  -[CSSiriSpeechRecorder _setEndpointStyle:](self, "_setEndpointStyle:", v17);
  NSStringFromSelector(a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:](self, "_updateAudioDeviceInfo:forReason:forcesUpdate:", 0, v18, 1);

  -[CSSiriSpeechRecorder _currentRecordRoute](self, "_currentRecordRoute");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _currentPlaybackRoute](self, "_currentPlaybackRoute");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v15;
  v112 = v19;
  if (objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0C897E0]))
  {
    v20 = *v11;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s Using Bluetooth audio analyzer style", buf, 0xCu);
    }
    v107 = 0;
    v21 = 2;
  }
  else if ((objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0C89820]) & 1) != 0 || self->_isDriving)
  {
    v20 = *v11;
    v21 = 1;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      v21 = 1;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s Using driving audio analyzer style", buf, 0xCu);
    }
    v107 = 0;
  }
  else
  {
    v42 = -[CSSiriAudioActivationInfo shouldUseVoiceTriggerAnalyzerStyle](self->_currentActivationInfo, "shouldUseVoiceTriggerAnalyzerStyle");
    v20 = *v11;
    v43 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v42)
    {
      if (v43)
      {
        *(_DWORD *)buf = 136315138;
        v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s Using voice trigger audio analyzer style", buf, 0xCu);
      }
      v107 = 0;
      v21 = 3;
    }
    else if (v43)
    {
      *(_DWORD *)buf = 136315138;
      v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      v107 = 1;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s Using default audio analyzer style", buf, 0xCu);
      v21 = 0;
    }
    else
    {
      v21 = 0;
      v107 = 1;
    }
  }

  -[CSEndpointAnalyzer setEndpointStyle:](self->_endpointAnalyzer, "setEndpointStyle:", v21);
  if (-[CSSiriAudioActivationInfo audioAlertStyle](self->_currentActivationInfo, "audioAlertStyle") != 3
    || (v22 = 0.5, AFDeviceSupportsZLL()))
  {
    v22 = 0.0;
  }
  -[CSEndpointAnalyzer setMinimumDurationForEndpointer:](self->_endpointAnalyzer, "setMinimumDurationForEndpointer:", v22);
  if (self->_fingerprintingEnabled)
    -[CSSiriAcousticFingerprinter reset](self->_fingerprinter, "reset");
  -[CSSiriSpeechRecorder _clearEndpointHint](self, "_clearEndpointHint");
  if (v10)
    v10[2](v10);
  if (AFIsHorseman())
  {
    -[CSSiriAudioActivationInfo speechEvent](self->_currentActivationInfo, "speechEvent");
    if (AFSpeechEventIsHardwareTrigger()
      && (-[CSSiriAudioActivationInfo speechRecordingMode](self->_currentActivationInfo, "speechRecordingMode") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v23 = -[CSSiriSpeechRecorder _shouldPlaySummonedToneOnTopCapInvocationOnHorseman](self, "_shouldPlaySummonedToneOnTopCapInvocationOnHorseman");
      v24 = *v11;
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
      if (v23)
      {
        if (v25)
        {
          -[AFClientConfiguration tapToSiriAudioPlaybackRequest](self->_currentClientConfiguration, "tapToSiriAudioPlaybackRequest");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "itemURL");
          v27 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
          v127 = 2112;
          *(_QWORD *)v128 = v27;
          _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_INFO, "%s Playing start alert %@", buf, 0x16u);

        }
        -[AFClientConfiguration tapToSiriAudioPlaybackRequest](self->_currentClientConfiguration, "tapToSiriAudioPlaybackRequest");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v121[0] = MEMORY[0x1E0C809B0];
        v121[1] = 3221225472;
        v121[2] = __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke;
        v121[3] = &unk_1E7C282A8;
        v122 = v16;
        v123 = self;
        -[CSSiriSpeechRecorder _startAudioPlaybackRequest:options:completion:](self, "_startAudioPlaybackRequest:options:completion:", v28, 3, v121);

        v24 = v122;
        goto LABEL_50;
      }
      if (v25)
      {
        *(_DWORD *)buf = 136315138;
        v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        v41 = "%s Suppressing start alert";
        goto LABEL_49;
      }
    }
    else
    {
      -[CSSiriAudioActivationInfo speechRecordingAlertPolicy](self->_currentActivationInfo, "speechRecordingAlertPolicy");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "startingAlertBehavior");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "beepSoundID");

      if (v31)
      {
        -[CSSiriAudioActivationInfo speechRecordingAlertPolicy](self->_currentActivationInfo, "speechRecordingAlertPolicy");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "startingAlertBehavior");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "beepSoundID");

        objc_msgSend(MEMORY[0x1E0CFE840], "sharedManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "URLForSoundID:", v34);
        v24 = objc_claimAutoreleasedReturnValue();

        v36 = *v11;
        v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
        if (v24)
        {
          if (v37)
          {
            *(_DWORD *)buf = 136315394;
            v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
            v127 = 2112;
            *(_QWORD *)v128 = v24;
            _os_log_error_impl(&dword_1C2614000, v36, OS_LOG_TYPE_ERROR, "%s Playing start alert %@", buf, 0x16u);
          }

          v38 = objc_alloc(MEMORY[0x1E0CFE810]);
          v39 = MEMORY[0x1E0C809B0];
          v119[0] = MEMORY[0x1E0C809B0];
          v119[1] = 3221225472;
          v119[2] = __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke_91;
          v119[3] = &unk_1E7C282D0;
          v120 = v24;
          v40 = (void *)objc_msgSend(v38, "initWithBuilder:", v119);
          v116[0] = v39;
          v116[1] = 3221225472;
          v116[2] = __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke_2;
          v116[3] = &unk_1E7C282A8;
          v117 = v16;
          v118 = self;
          -[CSSiriSpeechRecorder _startAudioPlaybackRequest:options:completion:](self, "_startAudioPlaybackRequest:options:completion:", v40, 3, v116);

          v36 = v120;
        }
        else if (v37)
        {
          *(_DWORD *)buf = 136315138;
          v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
          _os_log_error_impl(&dword_1C2614000, v36, OS_LOG_TYPE_ERROR, "%s No SoundID URL", buf, 0xCu);
        }

        goto LABEL_50;
      }
      v24 = *v11;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        v41 = "%s No start recording alert";
LABEL_49:
        _os_log_impl(&dword_1C2614000, v24, OS_LOG_TYPE_INFO, v41, buf, 0xCu);
      }
    }
LABEL_50:

  }
  v106 = a5;
  v108 = v10;
  v113 = v16;
  v114 = v9;
  if (-[CSSiriAudioActivationInfo requiresBorealisConsumerCheck](self->_currentActivationInfo, "requiresBorealisConsumerCheck")&& (objc_msgSend(MEMORY[0x1E0DC8660], "isLastTriggerForced") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "systemUptime");
    v46 = v45;
    while (1)
    {
      v47 = *v11;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        _os_log_impl(&dword_1C2614000, v47, OS_LOG_TYPE_INFO, "%s Checking if VT has triggered", buf, 0xCu);
      }

      v48 = objc_msgSend(MEMORY[0x1E0DC8660], "isLastTriggerForced");
      v49 = *v11;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        v127 = 1024;
        *(_DWORD *)v128 = v48;
        _os_log_impl(&dword_1C2614000, v49, OS_LOG_TYPE_INFO, "%s VT has triggered %d", buf, 0x12u);
      }

      v11 = (id *)MEMORY[0x1E0CFE6C0];
      if ((v48 & 1) != 0)
        break;
      objc_msgSend(v44, "systemUptime");
      if (v50 - v46 > 5.0)
      {
        v51 = *v11;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v44, "systemUptime");
          *(_DWORD *)buf = 136315394;
          v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
          v127 = 2050;
          *(double *)v128 = v104 - v46;
          _os_log_error_impl(&dword_1C2614000, v51, OS_LOG_TYPE_ERROR, "%s Timed out after %{public}lfs waiting for Borealis buffer to become available.", buf, 0x16u);
        }

        break;
      }
      usleep(0x3A98u);
    }

    v9 = v114;
  }
  objc_msgSend(MEMORY[0x1E0DC8650], "sharedPreferences");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v52, "isVoiceTriggerAvailable"))
  {
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "cloudSyncEnabled");

  }
  else
  {
    v54 = 0;
  }

  v55 = AFSupportsSpeechExtraction();
  if (self->_audioFileType)
  {
    self->_needsAVVCLPCMCallbacks = 1;
  }
  else
  {
    v56 = v55;
    objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    self->_needsAVVCLPCMCallbacks = objc_msgSend(v57, "fileLoggingIsEnabled") | v54 | v56;

  }
  self->_hasReceivedEmptyLPCMRecordBuffer = 0;
  v58 = *v11;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    _os_log_impl(&dword_1C2614000, v58, OS_LOG_TYPE_INFO, "%s entering _recordingWillStartGroup", buf, 0xCu);
  }

  dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
  if (-[CSSiriAudioActivationInfo hasPlayedStartAlert](self->_currentActivationInfo, "hasPlayedStartAlert"))
    objc_msgSend(v9, "instrumentSiriCue:", 1);
  self->_startEvent = -[CSSiriAudioActivationInfo speechEvent](self->_currentActivationInfo, "speechEvent");
  -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = self->_currentActivationInfo;
  -[CSSiriSpeechRecorder _currentRecordingInfo](self, "_currentRecordingInfo");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriAudioActivationInfo startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:](v60, "startRecordingSettingsWithRecordRoute:recordingInfo:playbackRoute:", v112, v61, v111);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = (void *)objc_msgSend(v62, "mutableCopy");
  objc_msgSend(v9, "sessionUUID");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    objc_msgSend(v9, "sessionUUID");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setObject:forKey:", v65, CFSTR("CSSpeechRecordSettingsKey_siriSessionUUID"));

  }
  objc_msgSend(v59, "UUIDString");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (v66)
  {
    objc_msgSend(v59, "UUIDString");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setObject:forKey:", v67, CFSTR("CSSpeechRecordSettingsKey_requestMHUUID"));

    if ((objc_msgSend(MEMORY[0x1E0D19260], "isMedocFeatureEnabled") & 1) == 0)
      objc_msgSend(v9, "emitRequestLinkEventForMHUUID:", v59);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_shouldDisableSpeechPacketGeneration);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKey:", v68, CFSTR("CSSpeechRecordSettingsKey_asrOnDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hybridUODEnabled);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setObject:forKey:", v69, CFSTR("CSSpeechRecordSettingsKey_hybridUODEnabled"));

  speechCapturingMode = self->_speechCapturingMode;
  if ((speechCapturingMode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
LABEL_85:
    objc_msgSend(v63, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CSSpeechRecordSettingsKey_disablePrewarmLocalAsrAtStartRecording"));
    goto LABEL_86;
  }
  if ((speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    startEvent = self->_startEvent;
    if (startEvent <= 0xD && ((1 << startEvent) & 0x2102) != 0)
    {
      AFDeviceSupportsSiriUOD();
    }
    else if ((AFDeviceSupportsSiriUOD() & 1) != 0)
    {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
LABEL_86:
  -[CSSiriAudioActivationInfo recordContextForSpeechEvent:](self->_currentActivationInfo, "recordContextForSpeechEvent:", self->_startEvent);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateAudioRecordContext:");
  v72 = v107 ^ 1;
  v73 = 0.0;
  if (self->_startEvent != 1)
    v72 = 1;
  if ((v72 & 1) == 0)
  {
    objc_msgSend(v63, "objectForKey:", *MEMORY[0x1E0C89A40]);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    if (v74)
    {
      lastPrepareTimestamp = self->_lastPrepareTimestamp;
      -[CSSiriAudioActivationInfo activationSystemUptime](self->_currentActivationInfo, "activationSystemUptime");
      v73 = lastPrepareTimestamp - v76;
      v77 = *v11;
      if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        v127 = 2048;
        *(double *)v128 = v73;
        _os_log_impl(&dword_1C2614000, v77, OS_LOG_TYPE_INFO, "%s Setting delayed start delay %lf", buf, 0x16u);
      }

    }
  }
  -[CSEndpointAnalyzer setDelay:](self->_endpointAnalyzer, "setDelay:", v73);
  v78 = *v11;
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    v127 = 2112;
    *(_QWORD *)v128 = v63;
    _os_log_impl(&dword_1C2614000, v78, OS_LOG_TYPE_INFO, "%s Asking CSSpeechController to startRecording with settings %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "logEventWithType:context:", 211, 0);

  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "logMHAssistantDaemonAudioStartRecordingContextWithMHUUID:withStartRecordingContext:withFanInfoArray:withActiveSessionDisplayIDs:", v59, 1, 0, 0);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "systemUptime");
  self->_startRecordingTimestamp = v82;

  if (AFIsInternalInstall())
  {
    v83 = *v11;
    v84 = os_signpost_id_generate((os_log_t)*v11);
    if (v84 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v85 = v84;
      if (os_signpost_enabled(v83))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v83, OS_SIGNPOST_EVENT, v85, "SpeechRecorder", "StartRecording", buf, 2u);
      }
    }

  }
  kdebug_trace();
  speechController = self->_speechController;
  v115 = 0;
  v87 = -[CSSpeechController startRecordingWithSettings:error:](speechController, "startRecordingWithSettings:error:", v63, &v115);
  v88 = v115;
  objc_msgSend(v114, "updateRecordingSettings:", v63);
  kdebug_trace();
  v89 = 0;
  if (!v87)
  {
    AFAddInterruptingAudioSessionInfoToAnalyticsContext();
    v89 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "logEventWithType:context:", 212, v89);

  objc_msgSend(v89, "objectForKey:", CFSTR("kAudioSessionProperty_ActiveSessionDisplayIDs"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "logMHAssistantDaemonAudioStartRecordingContextWithMHUUID:withStartRecordingContext:withFanInfoArray:withActiveSessionDisplayIDs:", v59, 0, 0, v91);

  v93 = (id)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    _os_log_impl(&dword_1C2614000, v93, OS_LOG_TYPE_INFO, "%s Done asking CSSpeechController to startRecording", buf, 0xCu);
  }

  if (v87)
  {
    objc_storeStrong((id *)&self->_context, a3);
    v94 = (id)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
    {
      context = self->_context;
      *(_DWORD *)buf = 136315394;
      v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      v127 = 2112;
      *(_QWORD *)v128 = context;
      _os_log_impl(&dword_1C2614000, v94, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
    }

    self->_recordingState = 1;
    if (-[CSSiriAudioActivationInfo shouldExplicitlyPlayAlertOnStart](self->_currentActivationInfo, "shouldExplicitlyPlayAlertOnStart"))
    {
      -[CSSiriSpeechRecorder _playAudioAlert:](self, "_playAudioAlert:", 1);
    }
    v9 = v114;
    if ((self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL) == 1
      && (unint64_t)(self->_endpointerOperationMode - 3) <= 1)
    {
      -[CSSiriSpeechRecorder _scheduleExtendedEndpointTimer](self, "_scheduleExtendedEndpointTimer");
    }
    if (AFIsATV())
      self->_expectedFirstBufferTimestamp = self->_startRecordingTimestamp + 0.2;
    decoder = self->_decoder;
    if (decoder)
    {
      AudioConverterDispose(decoder);
      self->_decoder = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "submitAudioIssueReport:", *MEMORY[0x1E0D19380]);

    objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 200, 0, v88);
    v98 = objc_claimAutoreleasedReturnValue();

    self->_recordingState = 0;
    v99 = (id)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      _os_log_impl(&dword_1C2614000, v99, OS_LOG_TYPE_INFO, "%s leaving _recordingWillStartGroup", buf, 0xCu);
    }

    dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);
    v113 = (void *)v98;
    v9 = v114;
    v10 = v108;
  }

  -[CSSiriSpeechRecorder _logFanState](self, "_logFanState");
  if (v87)
  {
    v100 = 1;
    v16 = v113;
    goto LABEL_131;
  }
  v11 = (id *)MEMORY[0x1E0CFE6C0];
  a5 = v106;
  v15 = v105;
  v16 = v113;
LABEL_122:
  objc_msgSend(v9, "didStopRecordingWithError:", v16);
  if (a5)
    *a5 = objc_retainAutorelease(v16);
  if (v15
    && !-[CSSiriAudioActivationInfo shouldSuppressRecordingErrorAlert](self->_currentActivationInfo, "shouldSuppressRecordingErrorAlert"))
  {
    -[CSSiriSpeechRecorder _playAudioAlert:](self, "_playAudioAlert:", 3);
  }
  v101 = *v11;
  if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
  {
    v103 = &stru_1E7C296E8;
    *(_DWORD *)buf = 136316162;
    v126 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    if (v15)
      v103 = CFSTR(", playing error alert");
    v127 = 1024;
    *(_DWORD *)v128 = v15;
    *(_WORD *)&v128[4] = 1024;
    *(_DWORD *)&v128[6] = 0;
    *(_WORD *)v129 = 2114;
    *(_QWORD *)&v129[2] = v16;
    v130 = 2114;
    v131 = v103;
    _os_log_error_impl(&dword_1C2614000, v101, OS_LOG_TYPE_ERROR, "%s Could not set up recording (prepared = %d, started = %d), returning error %{public}@%{public}@ and resetting voice controller.", buf, 0x2Cu);
  }

  if (v15)
    -[CSSiriSpeechRecorder _resetSpeechController](self, "_resetSpeechController");
  v100 = 0;
LABEL_131:

  return v100;
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v5;
  unint64_t v6;
  id *p_mostRecentSpeechSynthesisRecord;
  unint64_t v8;
  NSObject *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "beginTimestamp");
  if (v6 >= -[AFSpeechSynthesisRecord beginTimestamp](self->_mostRecentSpeechSynthesisRecord, "beginTimestamp"))
  {
    p_mostRecentSpeechSynthesisRecord = (id *)&self->_mostRecentSpeechSynthesisRecord;
    v8 = objc_msgSend(v5, "endTimestamp");
    if (v8 >= objc_msgSend(*p_mostRecentSpeechSynthesisRecord, "endTimestamp"))
    {
      v9 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        v10 = *p_mostRecentSpeechSynthesisRecord;
        v11 = 136315650;
        v12 = "-[CSSiriSpeechRecorder updateSpeechSynthesisRecord:]";
        v13 = 2112;
        v14 = v10;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s Updated speech synthesis record from %@ to %@.", (uint8_t *)&v11, 0x20u);
      }
      objc_storeStrong(p_mostRecentSpeechSynthesisRecord, a3);
    }
  }

}

- (unsigned)fetchAudioSessionID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[CSSiriSpeechRecorder _audioSessionID](self, "_audioSessionID");
}

- (unsigned)_audioSessionID
{
  os_log_t *v3;
  NSObject *v4;
  unsigned int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[CSSiriSpeechRecorder _audioSessionID]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s Fetching audio session ID...", (uint8_t *)&v8, 0xCu);
  }
  v5 = -[CSAudioSessionController getAudioSessionID](self->_audioSessionController, "getAudioSessionID");
  v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[CSSiriSpeechRecorder _audioSessionID]";
    v10 = 2048;
    v11 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Done fetching audio session ID %lu.", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (id)fetchRecordingInfo
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return -[CSSiriSpeechRecorder _currentRecordingInfo](self, "_currentRecordingInfo");
}

- (id)fetchAudioDeviceInfo
{
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:](self, "_updateAudioDeviceInfo:forReason:forcesUpdate:", 0, v4, 0);

  return (id)-[CSFAudioDeviceInfo copy](self->_currentAudioDeviceInfo, "copy");
}

- (id)_getFanInfoArray
{
  return objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

- (void)_logBluetoothStateWithMHUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  AFBluetoothWirelessSplitterSessionStateObserver *v18;
  AFBluetoothWirelessSplitterSessionStateObserver *bluetoothWirelessSplitterSessionStateObserver;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C89AE8], "retrieveSessionWithID:", -[CSSiriSpeechRecorder _audioSessionID](self, "_audioSessionID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pickedRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D480D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D48168]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D48120]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
  {
    v13 = (id)*MEMORY[0x1E0D480F8];

    v8 = v13;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    objc_msgSend(v14, "timeIntervalSinceDate:", v5);
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSSiriSpeechRecorder _logBluetoothStateWithMHUUID:]";
    v27 = 2050;
    v28 = v17;
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_DEFAULT, "%s query picked route elapsed time = %{public}lf", buf, 0x16u);

  }
  if (v10)
  {
    if (AFSupportsWirelessSplitter())
    {
      if (!self->_bluetoothWirelessSplitterSessionStateObserver)
      {
        v18 = (AFBluetoothWirelessSplitterSessionStateObserver *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFE828]), "initWithQueue:delegate:", self->_queue, 0);
        bluetoothWirelessSplitterSessionStateObserver = self->_bluetoothWirelessSplitterSessionStateObserver;
        self->_bluetoothWirelessSplitterSessionStateObserver = v18;

      }
      objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __53__CSSiriSpeechRecorder__logBluetoothStateWithMHUUID___block_invoke;
      v22[3] = &unk_1E7C28320;
      v22[4] = self;
      v23 = v4;
      v24 = v8;
      objc_msgSend(v20, "logEventWithType:contextResolver:", 242, v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMHAssistantDaemonAudioBluetoothInfoWithMHUUID:withWirelessSplitterSessionState:withAudioDeviceCategory:", v4, 0, v8);

    }
  }

}

- (void)_logVoiceTriggerInfo:(id)a3 withMHUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKey:", CFSTR("earlyDetectFiredMachTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logEventWithType:machAbsoluteTime:context:", 2304, objc_msgSend(v8, "unsignedLongLongValue"), 0);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("triggerStartMachTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logEventWithType:machAbsoluteTime:context:", 2301, objc_msgSend(v10, "unsignedLongLongValue"), 0);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("triggerFireMachTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logEventWithType:machAbsoluteTime:context:", 2302, objc_msgSend(v12, "unsignedLongLongValue"), 0);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("triggerEndMachTime"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logEventWithType:machAbsoluteTime:context:", 2303, objc_msgSend(v14, "unsignedLongLongValue"), 0);

    if (-[CSSiriSpeechRecorder _shouldEmitInstrumentation](self, "_shouldEmitInstrumentation"))
    {
      v24 = v7;
      v16 = objc_alloc_init(MEMORY[0x1E0D9A4B8]);
      v17 = objc_alloc_init(MEMORY[0x1E0D9A4C8]);
      objc_msgSend(v17, "setExists:", 1);
      objc_msgSend(v16, "setStartedOrChanged:", v17);
      objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v14, "unsignedLongLongValue");
      -[CSSiriAudioActivationInfo turnIdentifier](self->_currentActivationInfo, "turnIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v16, v19, v20);

      v21 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[CSSiriSpeechRecorder _logVoiceTriggerInfo:withMHUUID:]";
        _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_INFO, "%s logInstrumentation for VT launch started", buf, 0xCu);
      }

      v7 = v24;
    }
  }
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "logStartEventWithFirstPassStartedInfo:withMHUUID:", v6, v7);

    objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logTriggerEventWithVTEI:withMHUUID:", v6, v7);

  }
}

- (void)_logAudioMetrics:(id)a3 mhUUID:(id)a4
{
  char isKindOfClass;
  void *v5;
  void *v6;
  char v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v25;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0C89A10]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v7 = objc_opt_isKindOfClass();
    v8 = (_QWORD *)MEMORY[0x1E0C89A20];
    v9 = (_QWORD *)MEMORY[0x1E0C89A28];
    if ((v7 & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C89A20]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", *v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = objc_msgSend(v10, "unsignedLongLongValue");
          v13 = objc_msgSend(v11, "unsignedLongLongValue");
          if (v12)
          {
            v14 = v13;
            if (v13)
            {
              objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "logEventWithType:machAbsoluteTime:context:", 233, v12, 0);

              objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "logEventWithType:machAbsoluteTime:context:", 234, v14, 0);

            }
          }
        }
      }

    }
    objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0C89A18]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v17, "objectForKey:", *v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKey:", *v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = objc_msgSend(v18, "unsignedLongLongValue");
          v21 = objc_msgSend(v19, "unsignedLongLongValue");
          if (v20)
          {
            v22 = v21;
            if (v21)
            {
              objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "logEventWithType:machAbsoluteTime:context:", 235, v20, 0);

              objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "logEventWithType:machAbsoluteTime:context:", 236, v22, 0);

            }
          }
        }
      }

    }
    v5 = v25;
  }

}

- (void)setSpeechRequestOptions:(id)a3
{
  id v5;
  os_log_t *v6;
  NSObject *v7;
  uint64_t v8;
  os_log_t v9;
  NSObject *v10;
  void *v11;
  os_log_t v12;
  NSObject *v13;
  void *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  os_log_t v18;
  CSSiriAudioActivationInfo *v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *recordDevice;
  _BYTE v24[32];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v7 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v24 = 136315394;
    *(_QWORD *)&v24[4] = "-[CSSiriSpeechRecorder setSpeechRequestOptions:]";
    *(_WORD *)&v24[12] = 2112;
    *(_QWORD *)&v24[14] = v5;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s %@", v24, 0x16u);
  }
  v8 = objc_msgSend(v5, "endpointerOperationMode");
  v9 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    AFSpeechEndpointerOperationModeGetName();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v24 = 136315394;
    *(_QWORD *)&v24[4] = "-[CSSiriSpeechRecorder setSpeechRequestOptions:]";
    *(_WORD *)&v24[12] = 2112;
    *(_QWORD *)&v24[14] = v11;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s endpointerOperationMode = %@", v24, 0x16u);

  }
  if (self->_speechCapturingMode == 4)
  {
    v12 = *v6;
    v8 = 1;
    if (!os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    v13 = v12;
    v8 = 1;
    AFSpeechEndpointerOperationModeGetName();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v24 = 136315394;
    *(_QWORD *)&v24[4] = "-[CSSiriSpeechRecorder setSpeechRequestOptions:]";
    *(_WORD *)&v24[12] = 2112;
    *(_QWORD *)&v24[14] = v14;
    v15 = "%s Fingerprinting mode, force (endpointerOperationMode = %@).";
    v16 = v13;
    v17 = 22;
    goto LABEL_13;
  }
  if (AFSpeechEndpointerOperationModeGetIsValid() && v8
    || !objc_msgSend(v5, "useAutomaticEndpointing"))
  {
    goto LABEL_14;
  }
  v18 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    v13 = v18;
    v8 = 3;
    AFSpeechEndpointerOperationModeGetName();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v24 = 136315650;
    *(_QWORD *)&v24[4] = "-[CSSiriSpeechRecorder setSpeechRequestOptions:]";
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = 1;
    *(_WORD *)&v24[18] = 2112;
    *(_QWORD *)&v24[20] = v14;
    v15 = "%s Legacy property set (useAutomaticEndpointing = %d), override (endpointerOperationMode = %@)";
    v16 = v13;
    v17 = 28;
LABEL_13:
    _os_log_impl(&dword_1C2614000, v16, OS_LOG_TYPE_INFO, v15, v24, v17);

    goto LABEL_14;
  }
  v8 = 3;
LABEL_14:
  -[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:](self, "_setEndpointerOperationMode:forceUpdate:", v8, 0, *(_OWORD *)v24, *(_QWORD *)&v24[16], *(_QWORD *)&v24[24]);
  if (objc_msgSend(v5, "activationEvent") == 21)
    -[CSSiriSpeechRecorder _setSpeechCapturingMode:](self, "_setSpeechCapturingMode:", 1);
  v19 = -[CSSiriAudioActivationInfo initWithSpeechRecordingMode:clientConfiguration:experimentContext:]([CSSiriAudioActivationInfo alloc], "initWithSpeechRecordingMode:clientConfiguration:experimentContext:", self->_speechCapturingMode, self->_currentClientConfiguration, self->_experimentContext);
  -[CSSiriAudioActivationInfo setSpeechRequestOptions:currentActivationInfo:](v19, "setSpeechRequestOptions:currentActivationInfo:", v5, self->_currentActivationInfo);
  NSStringFromSelector(a2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _updateAudioContextWithInfo:reason:](self, "_updateAudioContextWithInfo:reason:", v19, v20);

  objc_msgSend(v5, "recordDeviceIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (NSString *)objc_msgSend(v21, "copy");
  recordDevice = self->_recordDevice;
  self->_recordDevice = v22;

}

- (void)_updateAudioContextWithInfo:(id)a3 reason:(id)a4
{
  CSSiriAudioActivationInfo *v6;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  CSSiriAudioActivationInfo *pendingActivationInfo;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  CSSiriAudioActivationInfo *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = (CSSiriAudioActivationInfo *)a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v9 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v12 = 136315650;
    v13 = "-[CSSiriSpeechRecorder _updateAudioContextWithInfo:reason:]";
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s info = %@, reason = %@", (uint8_t *)&v12, 0x20u);
  }
  pendingActivationInfo = self->_pendingActivationInfo;
  if (pendingActivationInfo)
  {
    v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = 136315650;
      v13 = "-[CSSiriSpeechRecorder _updateAudioContextWithInfo:reason:]";
      v14 = 2112;
      v15 = pendingActivationInfo;
      v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEBUG, "%s Dropping previous pending activation info %@ for reason %@.", (uint8_t *)&v12, 0x20u);
      pendingActivationInfo = self->_pendingActivationInfo;
    }
  }
  self->_pendingActivationInfo = v6;

  if (!self->_recordingState)
    -[CSSiriSpeechRecorder _updateAudioContextWithPendingInfoForReason:](self, "_updateAudioContextWithPendingInfoForReason:", v7);

}

- (BOOL)_setAudioContextWithInfo:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject **v9;
  NSObject *v10;
  CSSpeechController *speechController;
  BOOL v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_speechController)
  {
    objc_msgSend(v6, "recordContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSObject **)MEMORY[0x1E0CFE6C0];
    v10 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v22 = "-[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:]";
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s Setting audio context %@ for reason %@.", buf, 0x20u);
    }
    mach_absolute_time();
    kdebug_trace();
    speechController = self->_speechController;
    v20 = 0;
    v12 = -[CSSpeechController setCurrentRecordContext:error:](speechController, "setCurrentRecordContext:error:", v8, &v20);
    v13 = v20;
    kdebug_trace();
    v14 = *v9;
    if (v13 || !v12)
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v15 = v14;
      mach_absolute_time();
      AFMachAbsoluteTimeGetTimeInterval();
      *(_DWORD *)buf = 136316162;
      v22 = "-[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:]";
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v7;
      v27 = 2114;
      v28 = v13;
      v29 = 2048;
      v30 = v19;
      _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s Error setting audio context %@ for reason %@ error %{public}@. (%f seconds)", buf, 0x34u);
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
LABEL_13:

        goto LABEL_14;
      }
      v15 = v14;
      mach_absolute_time();
      AFMachAbsoluteTimeGetTimeInterval();
      *(_DWORD *)buf = 136315906;
      v22 = "-[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:]";
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v7;
      v27 = 2048;
      v28 = v16;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_INFO, "%s Done setting audio context %@ for reason %@. (%f seconds)", buf, 0x2Au);
    }

    goto LABEL_13;
  }
  v17 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:]";
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_INFO, "%s Ignored setting audio context because there's no speech controller.", buf, 0xCu);
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (BOOL)_updateAudioContextToPostVoiceForReason:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  _BOOL8 v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CSSiriAudioActivationInfo needsUpdateToPostVoiceMode](self->_currentActivationInfo, "needsUpdateToPostVoiceMode"))
  {
    v5 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v9 = 136315394;
      v10 = "-[CSSiriSpeechRecorder _updateAudioContextToPostVoiceForReason:]";
      v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s Updating to post voice for reason %@.", (uint8_t *)&v9, 0x16u);
    }
    v6 = -[CSSiriAudioActivationInfo beginUpdateToPostVoice](self->_currentActivationInfo, "beginUpdateToPostVoice");
    v7 = -[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:](self, "_setAudioContextWithInfo:forReason:", self->_currentActivationInfo, v4);
    -[CSSiriAudioActivationInfo endUpdateToPostVoiceWithContext:success:](self->_currentActivationInfo, "endUpdateToPostVoiceWithContext:success:", v6, v7);
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_updateAudioContextWithPendingInfoForReason:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  CSSiriAudioActivationInfo *pendingActivationInfo;
  CSSiriAudioActivationInfo **p_currentActivationInfo;
  CSSiriAudioActivationInfo *v9;
  NSObject *v10;
  BOOL v11;
  CSSiriAudioActivationInfo *v12;
  int v14;
  const char *v15;
  __int16 v16;
  CSSiriAudioActivationInfo *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_pendingActivationInfo)
    goto LABEL_7;
  -[CSSiriSpeechRecorder _updateAudioContextToPostVoiceForReason:](self, "_updateAudioContextToPostVoiceForReason:", v4);
  v5 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    pendingActivationInfo = self->_pendingActivationInfo;
    v14 = 136315650;
    v15 = "-[CSSiriSpeechRecorder _updateAudioContextWithPendingInfoForReason:]";
    v16 = 2112;
    v17 = pendingActivationInfo;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s Updating using pending info %@ for reason %@.", (uint8_t *)&v14, 0x20u);
  }
  if (-[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:](self, "_setAudioContextWithInfo:forReason:", self->_pendingActivationInfo, v4))
  {
    p_currentActivationInfo = &self->_currentActivationInfo;
    objc_storeStrong((id *)&self->_currentActivationInfo, self->_pendingActivationInfo);
    v9 = self->_pendingActivationInfo;
    self->_pendingActivationInfo = 0;

    v10 = *v5;
    v11 = 1;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v12 = *p_currentActivationInfo;
      v14 = 136315394;
      v15 = "-[CSSiriSpeechRecorder _updateAudioContextWithPendingInfoForReason:]";
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s Set pending info as current %@.", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
LABEL_7:
    v11 = 0;
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void)releaseAudioSession
{
  _BOOL4 v3;
  NSObject **v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  CSSpeechController *speechController;
  id v11;
  CSFAudioDeviceInfo *currentAudioDeviceInfo;
  CSSiriAudioActivationInfo *currentActivationInfo;
  CSSiriAudioActivationInfo *pendingActivationInfo;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  CSSiriSpeechRecorder *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = -[CSSpeechController isRecording](self->_speechController, "isRecording");
  v4 = (NSObject **)MEMORY[0x1E0CFE6C0];
  if (v3)
  {
    v5 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CSSiriSpeechRecorder releaseAudioSession]";
      _os_log_error_impl(&dword_1C2614000, v5, OS_LOG_TYPE_ERROR, "%s Attempting to release audio session while CSSpeechController is still recording.", buf, 0xCu);
    }
    self->_suppressRecordingStoppedAlert = 1;
    -[CSSiriSpeechRecorder _stopRecordingForEndpointReason:withEndpointMetrics:](self, "_stopRecordingForEndpointReason:withEndpointMetrics:", 6, 0);
  }
  v6 = -[CSSiriSpeechRecorder suppressInterruptionEndedNotifications](self, "suppressInterruptionEndedNotifications");
  v7 = *v4;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = "notify";
    if (v6)
      v8 = "suppress (keep others interrupted forever)";
    *(_DWORD *)buf = 136315394;
    v22 = "-[CSSiriSpeechRecorder releaseAudioSession]";
    v23 = 2080;
    v24 = v8;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s releaseAudioSessionBehavior = %s", buf, 0x16u);
  }
  -[CSSpeechController releaseAudioSession:](self->_speechController, "releaseAudioSession:", !v6);
  -[CSSiriSpeechRecorder setSuppressInterruptionEndedNotifications:](self, "setSuppressInterruptionEndedNotifications:", 0);
  -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  speechController = self->_speechController;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __43__CSSiriSpeechRecorder_releaseAudioSession__block_invoke;
  v18 = &unk_1E7C28348;
  v19 = self;
  v11 = v9;
  v20 = v11;
  -[CSSpeechController fetchAudioMetricsWithCompletion:](speechController, "fetchAudioMetricsWithCompletion:", &v15);
  currentAudioDeviceInfo = self->_currentAudioDeviceInfo;
  self->_currentAudioDeviceInfo = 0;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[CSSiriSpeechCapturingDelegate speechCapturingDidUpdateAudioDeviceInfo:](self->_delegate, "speechCapturingDidUpdateAudioDeviceInfo:", 0, v15, v16, v17, v18, v19);
  currentActivationInfo = self->_currentActivationInfo;
  self->_currentActivationInfo = 0;

  pendingActivationInfo = self->_pendingActivationInfo;
  self->_pendingActivationInfo = 0;

  -[CSAudioSessionController unregisterObserver:](self->_audioSessionController, "unregisterObserver:", self);
}

- (void)setSpeechWasRecognizedForElapsedTime:(double)a3 isFinal:(BOOL)a4
{
  _BOOL4 v4;
  os_log_t *v7;
  NSObject *v8;
  double twoShotStartTime;
  double v10;
  BOOL v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v7 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v8 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    twoShotStartTime = self->_twoShotStartTime;
    v13 = 136315650;
    v14 = "-[CSSiriSpeechRecorder setSpeechWasRecognizedForElapsedTime:isFinal:]";
    v15 = 2048;
    v16 = a3;
    v17 = 2048;
    v18 = twoShotStartTime;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s %lf %lf", (uint8_t *)&v13, 0x20u);
  }
  self->_serverDidRecognizeSpeech = 1;
  if (v4)
    self->_serverDidEndpoint = 1;
  v10 = self->_twoShotStartTime;
  v11 = v10 > 0.0 && v10 < a3;
  if (v11 && !self->_didPerformTwoShotPrompt)
  {
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      v13 = 136315394;
      v14 = "-[CSSiriSpeechRecorder setSpeechWasRecognizedForElapsedTime:isFinal:]";
      v15 = 2050;
      v16 = 60.0;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s Endpointer setStartWaitTime is set to %{public}f", (uint8_t *)&v13, 0x16u);
    }
    -[CSEndpointAnalyzer setStartWaitTime:](self->_endpointAnalyzer, "setStartWaitTime:", 60.0);
  }
}

- (void)setFingerprintWasRecognized
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[CSSiriSpeechRecorder setFingerprintWasRecognized]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  self->_fingerprintWasRecognized = 1;
}

- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5
{
  _BOOL4 v6;
  NSObject *v9;
  BOOL v10;
  int v11;
  const char *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v11 = 136315906;
    v12 = "-[CSSiriSpeechRecorder stopSpeechCaptureForEvent:suppressAlert:hostTime:]";
    v13 = 2048;
    v14 = a3;
    v15 = 1024;
    v16 = v6;
    v17 = 2048;
    v18 = a5;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s (event = %ld, suppressAlert = %d, hostTime = %llu)", (uint8_t *)&v11, 0x26u);
  }
  if (a3 == 5)
    self->_serverDidEndpoint = 1;
  v10 = (AFIsNano() & 1) == 0
     && (self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL) == 1
     && self->_startEvent == a3
     && (unint64_t)(self->_endpointerOperationMode - 3) >= 2
     && -[CSSiriAudioActivationInfo audioAlertStyle](self->_currentActivationInfo, "audioAlertStyle") == 3;
  self->_suppressRecordingStoppedAlert = v6 || v10;
  -[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:](self, "_stopRecordingWithReason:hostTime:", ((_DWORD)a3 << 16) | 5, a5);
}

- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder cancelSpeechCaptureSuppressingAlert:]";
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s (suppressAlert = %d)", (uint8_t *)&v6, 0x12u);
  }
  self->_wasCanceled = 1;
  self->_suppressRecordingStoppedAlert = v3;
  -[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:](self, "_stopRecordingWithReason:hostTime:", 7, 0);
}

- (void)setFingerprintingEnabled:(BOOL)a3
{
  CSSiriAcousticFingerprinter *fingerprinter;

  if (self->_fingerprintingEnabled != a3)
  {
    self->_fingerprintingEnabled = a3;
    if (!a3)
    {
      -[CSSiriAcousticFingerprinter setDelegate:](self->_fingerprinter, "setDelegate:", 0);
      fingerprinter = self->_fingerprinter;
      self->_fingerprinter = 0;

      if (self->_speechCapturingMode == 4)
        -[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:](self, "_stopRecordingWithReason:hostTime:", 8, 0);
    }
  }
}

- (void)forceSuccessAudioAlertOnStop
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[CSSiriSpeechRecorder forceSuccessAudioAlertOnStop]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  self->_forceSuccessAlertOnStop = 1;
}

- (void)setAudioFileType:(int64_t)a3
{
  self->_audioFileType = a3;
}

- (void)setAudioFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_audioFileHandle, a3);
}

- (void)setIsDriving:(BOOL)a3
{
  self->_isDriving = a3;
}

- (void)disableSpeechPacketGeneration:(BOOL)a3
{
  self->_shouldDisableSpeechPacketGeneration = a3;
}

- (void)setHybridUODEnabled:(BOOL)a3
{
  self->_hybridUODEnabled = a3;
}

- (void)setSpeechRecordingEventListeningEndpoint:(id)a3
{
  id v4;
  NSXPCConnection *speechRecordingEventListenerConnection;
  NSXPCConnection *v6;
  NSXPCConnection *v7;
  NSXPCConnection *v8;
  NSXPCConnection *v9;
  void *v10;
  id v11;

  v4 = a3;
  speechRecordingEventListenerConnection = self->_speechRecordingEventListenerConnection;
  v11 = v4;
  if (speechRecordingEventListenerConnection)
  {
    -[NSXPCConnection invalidate](speechRecordingEventListenerConnection, "invalidate");
    v6 = self->_speechRecordingEventListenerConnection;
    self->_speechRecordingEventListenerConnection = 0;

    v4 = v11;
  }
  if (v4)
  {
    v7 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v11);
    v8 = self->_speechRecordingEventListenerConnection;
    self->_speechRecordingEventListenerConnection = v7;

    v9 = self->_speechRecordingEventListenerConnection;
    AFSpeechRecordingEventListenerGetXPCInterface();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v9, "setRemoteObjectInterface:", v10);

    -[NSXPCConnection resume](self->_speechRecordingEventListenerConnection, "resume");
    v4 = v11;
  }

}

- (id)_speechRecordingEventListener
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:](self->_speechRecordingEventListenerConnection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_122);
}

- (void)setClientConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  AFClientConfiguration *v6;
  AFClientConfiguration *currentClientConfiguration;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[CSSiriSpeechRecorder setClientConfiguration:]";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s clientConfiguration = %@", (uint8_t *)&v8, 0x16u);
  }
  v6 = (AFClientConfiguration *)objc_msgSend(v4, "copy");
  currentClientConfiguration = self->_currentClientConfiguration;
  self->_currentClientConfiguration = v6;

  -[CSSiriAudioActivationInfo setClientConfiguration:](self->_currentActivationInfo, "setClientConfiguration:", self->_currentClientConfiguration);
  -[CSSiriAudioActivationInfo setClientConfiguration:](self->_pendingActivationInfo, "setClientConfiguration:", self->_currentClientConfiguration);

}

- (void)getLastStartpointTimestampAndCurrentTime:(id)a3
{
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemUptime");

  if (v5)
  {
    -[CSEndpointAnalyzer lastStartOfVoiceActivityTime](self->_endpointAnalyzer, "lastStartOfVoiceActivityTime");
    v5[2]();
  }

}

- (void)playRecordingStartAlert
{
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  _QWORD block[5];

  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CSSiriSpeechRecorder_playRecordingStartAlert__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_group_notify(recordingWillStartGroup, queue, block);
}

- (void)updateASRFeatures:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSSiriSpeechRecorder _speechController](self, "_speechController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processASRFeatures:", v4);

}

- (id)_currentRecordRoute
{
  void *v2;
  void *v3;

  -[CSSiriSpeechRecorder _currentRecordDeviceInfo](self, "_currentRecordDeviceInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_currentRecordDeviceInfo
{
  void *v3;

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:](self, "_updateAudioDeviceInfo:forReason:forcesUpdate:", 0, v3, 0);

  return -[CSFAudioDeviceInfo recordDeviceInfo](self->_currentAudioDeviceInfo, "recordDeviceInfo");
}

- (id)_currentPlaybackRoute
{
  void *v3;

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:](self, "_updateAudioDeviceInfo:forReason:forcesUpdate:", 0, v3, 0);

  return -[CSFAudioDeviceInfo playbackRoute](self->_currentAudioDeviceInfo, "playbackRoute");
}

- (void)_updateAudioDeviceInfo:(id)a3 forReason:(id)a4 forcesUpdate:(BOOL)a5
{
  _BOOL4 v5;
  CSFAudioDeviceInfo *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  os_log_t *v14;
  NSObject *v15;
  CSFAudioDeviceInfo *v16;
  CSFAudioDeviceInfo *currentAudioDeviceInfo;
  NSObject *v18;
  void *v19;
  CSFAudioDeviceInfo *v20;
  CSFAudioDeviceInfo *v21;
  NSObject *v22;
  os_log_t v23;
  CSFAudioDeviceInfo *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  void *v33;
  const __CFString *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  _QWORD v40[3];
  _QWORD v41[3];
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  CSFAudioDeviceInfo *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  _BOOL4 v49;
  uint64_t v50;

  v5 = a5;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = (CSFAudioDeviceInfo *)a3;
  v9 = a4;
  if (v8 || (self->_currentAudioDeviceInfo ? (v10 = !v5) : (v10 = 0), !v10))
  {
    -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logEventWithType:context:", 209, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logMHAssistantDaemonAudioFetchRouteContextWithMHUUID:withFetchRouteContextStarted:", v11, 1);

    kdebug_trace();
    mach_absolute_time();
    v14 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v15 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v43 = "-[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:]";
      v44 = 2112;
      v45 = v8;
      v46 = 2112;
      v47 = v9;
      v48 = 1024;
      v49 = v5;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_INFO, "%s Begin updating audio device info %@. (reason = %@, forcesUpdate = %d)", buf, 0x26u);
    }
    if (v8)
    {
      v16 = (CSFAudioDeviceInfo *)-[CSFAudioDeviceInfo copy](v8, "copy");
      currentAudioDeviceInfo = self->_currentAudioDeviceInfo;
      self->_currentAudioDeviceInfo = v16;

    }
    else
    {
      v18 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:]";
        _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_INFO, "%s Fetching audio device info from CSSpeechController...", buf, 0xCu);
      }
      -[CSSpeechController audioDeviceInfo](self->_speechController, "audioDeviceInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (CSFAudioDeviceInfo *)objc_msgSend(v19, "copy");
      v21 = self->_currentAudioDeviceInfo;
      self->_currentAudioDeviceInfo = v20;

      v22 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:]";
        _os_log_impl(&dword_1C2614000, v22, OS_LOG_TYPE_INFO, "%s Done fetching audio device info from CSSpeechController.", buf, 0xCu);
      }
    }
    v23 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
    {
      v24 = self->_currentAudioDeviceInfo;
      v25 = v23;
      mach_absolute_time();
      AFMachAbsoluteTimeGetTimeInterval();
      *(_DWORD *)buf = 136315650;
      v43 = "-[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:]";
      v44 = 2112;
      v45 = v24;
      v46 = 2048;
      v47 = v26;
      _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_INFO, "%s End updating audio device info %@. (duration = %f)", buf, 0x20u);

    }
    kdebug_trace();
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSFAudioDeviceInfo recordDeviceInfo](self->_currentAudioDeviceInfo, "recordDeviceInfo", CFSTR("recordRoute"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "route");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    if (v29)
      v31 = (const __CFString *)v29;
    else
      v31 = CFSTR("Unavailable");
    v41[0] = v31;
    v40[1] = CFSTR("playbackRoute");
    -[CSFAudioDeviceInfo playbackRoute](self->_currentAudioDeviceInfo, "playbackRoute");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v32)
      v34 = (const __CFString *)v32;
    else
      v34 = CFSTR("Unavailable");
    v41[1] = v34;
    v40[2] = CFSTR("playbackDeviceTypes");
    -[CSFAudioDeviceInfo playbackDeviceTypeList](self->_currentAudioDeviceInfo, "playbackDeviceTypeList");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v35;
    if (v35)
      v37 = (const __CFString *)v35;
    else
      v37 = CFSTR("Unavailable");
    v41[2] = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 3);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logEventWithType:context:", 210, v38);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "logMHAssistantDaemonAudioFetchRouteContextWithMHUUID:withFetchRouteContextStarted:", v11, 0);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[CSSiriSpeechCapturingDelegate speechCapturingDidUpdateAudioDeviceInfo:](self->_delegate, "speechCapturingDidUpdateAudioDeviceInfo:", self->_currentAudioDeviceInfo);

  }
}

- (id)_currentRecordingInfo
{
  return -[CSSiriSpeechRecorder _recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:](self, "_recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:", -[CSSiriAudioActivationInfo speechEvent](self->_currentActivationInfo, "speechEvent"), -[CSSiriAudioActivationInfo audioAlertStyle](self->_currentActivationInfo, "audioAlertStyle"), 1, 1);
}

- (id)_recordingInfoForEvent:(int64_t)a3 audioAlertStyle:(int64_t)a4 includeBTInfo:(BOOL)a5 includeRecordDeviceInfo:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int IsVoiceTrigger;
  unint64_t v20;
  NSObject *v21;
  double v22;
  double v23;
  CSSiriRecordingInfo *v24;
  int64_t speechCapturingMode;
  _BOOL8 v27;
  void *v28;
  unsigned int v29;
  unsigned int v30;
  void *v31;
  CSSiriRecordingInfo *v32;
  NSObject *v33;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v39;
  BOOL v40;
  int64_t v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  int64_t v49;
  __int16 v50;
  _BOOL4 v51;
  __int16 v52;
  _BOOL4 v53;
  uint64_t v54;

  v6 = a6;
  v7 = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v11 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v12 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    AFSpeechEventGetDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136316418;
    v43 = "-[CSSiriSpeechRecorder _recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:]";
    v44 = 2048;
    v45 = a3;
    v46 = 2112;
    v47 = v14;
    v48 = 2048;
    v49 = a4;
    v50 = 1024;
    v51 = v7;
    v52 = 1024;
    v53 = v6;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_INFO, "%s Creating recording info (speechEvent = %ld (%@), audioAlertStyle = %ld, includeBTInfo = %d, includeRecordDeviceInfo = %d)", buf, 0x36u);

  }
  if (v6)
  {
    -[CSSiriSpeechRecorder _currentRecordDeviceInfo](self, "_currentRecordDeviceInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v15, "route");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  v40 = v7;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    -[CSSiriSpeechRecorder _currentRecordRoute](self, "_currentRecordRoute");
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v37 = v18;
  v38 = v15;
  v41 = a4;

  -[CSSiriSpeechRecorder _currentPlaybackRoute](self, "_currentPlaybackRoute");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = a3;
  IsVoiceTrigger = AFSpeechEventIsVoiceTrigger();
  v20 = -[CSSpeechController alertStartTime](self->_speechController, "alertStartTime");
  v21 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[CSSiriSpeechRecorder _recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:]";
    v44 = 2048;
    v45 = v20;
    _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_INFO, "%s alertStartTime = %llu", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0C89B10], "secondsForHostTime:", v20);
  v23 = v22;
  v24 = [CSSiriRecordingInfo alloc];
  speechCapturingMode = self->_speechCapturingMode;
  v27 = speechCapturingMode == 3 || speechCapturingMode == 5;
  -[CSSpeechController recordSettings](self->_speechController, "recordSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[CSSiriSpeechRecorder _audioDeviceID](self, "_audioDeviceID");
  v30 = -[CSSiriSpeechRecorder _audioSessionID](self, "_audioSessionID");
  if (IsVoiceTrigger)
  {
    -[CSSpeechController voiceTriggerInfo](self->_speechController, "voiceTriggerInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  LOBYTE(v35) = v40;
  v32 = -[CSSiriRecordingInfo initWithDictation:fingerprintOnly:secureOfflineOnly:audioAlertStyle:recordSettings:recordRoute:recordDeviceInfo:playbackRoute:audioDeviceID:audioSessionID:voiceTriggerEventInfo:activationAlertStartTimestamp:startRecordingTimestamp:firstBufferTimestamp:firstBufferHostTime:estimatedSpeechEndHostTime:deviceIdentifier:includeBTInfo:speechEvent:](v24, "initWithDictation:fingerprintOnly:secureOfflineOnly:audioAlertStyle:recordSettings:recordRoute:recordDeviceInfo:playbackRoute:audioDeviceID:audioSessionID:voiceTriggerEventInfo:activationAlertStartTimestamp:startRecordingTimestamp:firstBufferTimestamp:firstBufferHostTime:estimatedSpeechEndHostTime:deviceIdentifier:includeBTInfo:speechEvent:", (speechCapturingMode & 0xFFFFFFFFFFFFFFFELL) == 2, speechCapturingMode == 4, v27, v41, v28, v37, v23, self->_startRecordingTimestamp, self->_firstBufferTimestamp, v38, v36, __PAIR64__(v30, v29), v31, self->_firstBufferHostTime, self->_estimatedSpeechEndHostTime,
          self->_recordDevice,
          v35,
          v39);
  if (IsVoiceTrigger)

  v33 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[CSSiriSpeechRecorder _recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:]";
    v44 = 2112;
    v45 = (int64_t)v32;
    _os_log_impl(&dword_1C2614000, v33, OS_LOG_TYPE_INFO, "%s Done creating recording info %@.", buf, 0x16u);
  }

  return v32;
}

- (void)speechControllerDidStartRecording:(id)a3 audioDeviceInfo:(id)a4 successfully:(BOOL)a5 error:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *queue;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  BOOL v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v7 = a5;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = *MEMORY[0x1E0CFE6C0];
  v14 = *MEMORY[0x1E0CFE6C0];
  if (v7)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[CSSiriSpeechRecorder speechControllerDidStartRecording:audioDeviceInfo:successfully:error:]";
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[CSSiriSpeechRecorder speechControllerDidStartRecording:audioDeviceInfo:successfully:error:]";
    v26 = 2114;
    v27 = v12;
    _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CSSiriSpeechRecorder_speechControllerDidStartRecording_audioDeviceInfo_successfully_error___block_invoke;
  block[3] = &unk_1E7C28390;
  block[4] = self;
  v20 = v10;
  v23 = v7;
  v21 = v12;
  v22 = v11;
  v16 = v11;
  v17 = v12;
  v18 = v10;
  dispatch_async(queue, block);

}

- (void)_speechControllerDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  id v7;
  int v8;
  os_log_t *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  CSSiriSpeechRecordingContext *context;
  void *v17;
  CSSiriSpeechRecordingContext *v18;
  void *v19;
  _BOOL4 didEnterTwoShotMode;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  float v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  int64_t v47;
  void *v48;
  NSUUID *fakeTwoShotTTSPromptUUID;
  AFWatchdogTimer *fakeTwoShotTTSPromptWatchdogTimer;
  CSEndpointerMetrics *lastEndpointerMetrics;
  NSDictionary *speechRecognizedContextForServerEndpointInstrumentation;
  CSEndpointDelayReporter *v53;
  void *v54;
  void *v55;
  CSEndpointDelayReporter *v56;
  CSEndpointDelayReporter *endpointDelayReporter;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  NSObject *v62;
  uint64_t v63;
  os_log_t *v64;
  void *v65;
  int v66;
  void *v67;
  NSObject *v68;
  CSSiriSpeechCapturingDelegate *delegate;
  void *v70;
  void *v71;
  void *v72;
  char v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  const __CFString *v77;
  void *v78;
  void *v79;
  id v81;
  void *v82;
  _BOOL4 v83;
  uint8_t buf[4];
  const char *v85;
  __int16 v86;
  _WORD v87[17];

  v83 = a4;
  *(_QWORD *)&v87[13] = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v7 = a5;
  v8 = AFIsInternalInstall();
  v9 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  if (v8)
  {
    v10 = (id)*MEMORY[0x1E0CFE6C0];
    v11 = os_signpost_id_generate(*v9);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v10, OS_SIGNPOST_EVENT, v12, "SpeechRecorder", "AudioStart", buf, 2u);
      }
    }

  }
  kdebug_trace();
  v13 = mach_absolute_time();
  v14 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v85 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
    v86 = 1024;
    *(_DWORD *)v87 = v83;
    v87[2] = 2112;
    *(_QWORD *)&v87[3] = v7;
    _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_INFO, "%s success = %d, error = %@", buf, 0x1Cu);
  }
  dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);
  -[CSSiriSpeechRecorder _currentRecordingInfo](self, "_currentRecordingInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  objc_msgSend(v15, "deviceInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecordingContext updateAudioRecordDeviceInfo:](context, "updateAudioRecordDeviceInfo:", v17);

  v18 = self->_context;
  objc_msgSend(v15, "voiceTriggerEventInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecordingContext updateVoiceTriggerInfo:](v18, "updateVoiceTriggerInfo:", v19);

  -[CSSiriSpeechRecordingContext updateRecordingInfo:](self->_context, "updateRecordingInfo:", v15);
  if (!v83)
    -[CSSiriSpeechRecordingContext didStopRecordingWithError:](self->_context, "didStopRecordingWithError:", v7);
  v82 = v7;
  didEnterTwoShotMode = self->_didEnterTwoShotMode;
  v21 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v85 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
    v86 = 1024;
    *(_DWORD *)v87 = didEnterTwoShotMode;
    _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_INFO, "%s isTwoShot = %d", buf, 0x12u);
  }
  -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CSAnalyticsContextCreateWithRecordingInfo(v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "logEventWithType:machAbsoluteTime:context:", 213, v13, v24);

  -[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:](self, "getAudioRouteInstrumentationWithRecordingInfo:", v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[CSSiriSpeechRecorder convertSISchemaAudioInputRouteToMHRoute:withRecordingInfo:](self, "convertSISchemaAudioInputRouteToMHRoute:withRecordingInfo:", objc_msgSend(v25, "audioInputRoute"), v15);
  v79 = v25;
  objc_msgSend(v25, "hardwareInterfaceVendorID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v15, "mhSource");
  objc_msgSend(v27, "interfaceVendorID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v27;
  objc_msgSend(v27, "interfaceProductID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "logMHAssistantDaemonAudioRecordingContextWithMHUUID:withAudioRecordingStarted:withAudioInputRoute:withAudioSource:withAudioInterfaceVendorId:withAudioInterfaceProductId:", v22, 1, v26, v29, v30, v31);

  objc_msgSend(v15, "codec");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "voiceTriggerEventInfo");
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = 0.0;
  if (!v33)
    goto LABEL_15;
  v35 = (void *)v33;
  objc_msgSend(v15, "voiceTriggerEventInfo");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = *MEMORY[0x1E0D19600];
  objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0D19600]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend(v15, "voiceTriggerEventInfo");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "longLongValue");

    objc_msgSend(MEMORY[0x1E0D19090], "inputRecordingSampleRate");
    v34 = (double)v41 / v42;
  }
  else
  {
LABEL_15:
    v41 = 0;
  }
  self->_skippedSamplesTimeInSec = v34;
  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "logMHASRAudioConfigureStartedWithMHUUID:withAudioCodecString:withAudioSkippedNumSamples:", v22, v32, v41);

  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v45 = v34;
  objc_msgSend(v44, "logMHASRAudioConfigureStartedWithMHUUID:withAudioCodecString:withAudioSkippedTimeInNs:", v22, v32, objc_msgSend(MEMORY[0x1E0D19118], "secondsToNs:", v45));

  objc_msgSend(v15, "voiceTriggerEventInfo");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _logVoiceTriggerInfo:withMHUUID:](self, "_logVoiceTriggerInfo:withMHUUID:", v46, v22);

  v47 = 2;
  if (!v83)
    v47 = 0;
  self->_recordingState = v47;
  *(_WORD *)&self->_didReceiveFirstBuffer = 0;
  self->_accumulatedBufferDuration = 0.0;
  self->_firstBufferHostTime = 0;
  self->_estimatedSpeechEndHostTime = 0;
  self->_firstBufferTimestamp = 0.0;
  if (!didEnterTwoShotMode)
    self->_packetCount = 0;
  self->_didDetectStartpoint = didEnterTwoShotMode;
  *(_WORD *)&self->_didDetectEndpoint = 0;
  self->_didFakeTwoShotWithAlert = 0;
  *(_DWORD *)&self->_serverDidRecognizeSpeech = 0;
  *(_WORD *)&self->_wasCanceled = 0;
  self->_isRecordingUsingBTRoute = objc_msgSend(v15, "isBluetooth");
  v48 = v82;
  if (!didEnterTwoShotMode)
    self->_twoShotStartTime = 0.0;
  *(_WORD *)&self->_didPerformTwoShotPrompt = 0;
  fakeTwoShotTTSPromptUUID = self->_fakeTwoShotTTSPromptUUID;
  self->_fakeTwoShotTTSPromptUUID = 0;

  -[AFWatchdogTimer cancel](self->_fakeTwoShotTTSPromptWatchdogTimer, "cancel");
  fakeTwoShotTTSPromptWatchdogTimer = self->_fakeTwoShotTTSPromptWatchdogTimer;
  self->_fakeTwoShotTTSPromptWatchdogTimer = 0;

  self->_lastAudioRecordBufferStartTime = 0;
  self->_lastAudioRecordBufferReceiptTime = 0;
  lastEndpointerMetrics = self->_lastEndpointerMetrics;
  self->_lastEndpointerMetrics = 0;

  self->_stopRecordingReason = 0;
  self->_stopRecordingMachContinuousTime = 0;
  speechRecognizedContextForServerEndpointInstrumentation = self->_speechRecognizedContextForServerEndpointInstrumentation;
  self->_speechRecognizedContextForServerEndpointInstrumentation = 0;

  if (!objc_msgSend(MEMORY[0x1E0D19260], "isMedocFeatureEnabled")
    || !self->_shouldDisableSpeechPacketGeneration)
  {
    v53 = [CSEndpointDelayReporter alloc];
    objc_msgSend(v22, "UUIDString");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriAudioActivationInfo turnIdentifier](self->_currentActivationInfo, "turnIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = -[CSEndpointDelayReporter initWithRequestMHUUID:turnIdentifier:](v53, "initWithRequestMHUUID:turnIdentifier:", v54, v55);
    endpointDelayReporter = self->_endpointDelayReporter;
    self->_endpointDelayReporter = v56;

  }
  if (AFIsATV())
  {
    objc_msgSend(v81, "recordSettings");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    if (v58)
    {
      objc_msgSend(v58, "objectForKey:", *MEMORY[0x1E0C898E0]);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "intValue");

      self->_isOpus = v61 == 1869641075;
      v62 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
      {
        v77 = CFSTR("Speex");
        if (v61 == 1869641075)
          v77 = CFSTR("Opus");
        *(_DWORD *)buf = 136315394;
        v85 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
        v86 = 2112;
        *(_QWORD *)v87 = v77;
        _os_log_debug_impl(&dword_1C2614000, v62, OS_LOG_TYPE_DEBUG, "%s SPELLING recordSettings codec=%@", buf, 0x16u);
      }
    }

    v48 = v82;
  }
  v63 = objc_msgSend(v48, "code");
  v64 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  if (v63 == 216)
  {
    objc_msgSend(v48, "domain");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend(v65, "isEqualToString:", *MEMORY[0x1E0CFEB48]);

  }
  else
  {
    v66 = 0;
  }
  if (!v83)
  {
    objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 200, 0, v48);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (didEnterTwoShotMode)
      goto LABEL_34;
LABEL_37:
    v68 = *v64;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      delegate = self->_delegate;
      *(_DWORD *)buf = 136315394;
      v85 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
      v86 = 2112;
      *(_QWORD *)v87 = delegate;
      _os_log_impl(&dword_1C2614000, v68, OS_LOG_TYPE_INFO, "%s Sending speech did start to delegate %@", buf, 0x16u);
    }
    -[CSSiriSpeechCapturingDelegate speechCapturingDidStartRecordingSuccessfully:error:withInfo:](self->_delegate, "speechCapturingDidStartRecordingSuccessfully:error:withInfo:", v83, v67, v15);
    v64 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    if (((v83 | v66) & 1) != 0)
      goto LABEL_48;
    goto LABEL_40;
  }
  v67 = 0;
  if (!didEnterTwoShotMode)
    goto LABEL_37;
LABEL_34:
  -[CSSiriSpeechCapturingDelegate speechCapturingDidUpdateRecordingInfo:](self->_delegate, "speechCapturingDidUpdateRecordingInfo:", v15);
  if (((v83 | v66) & 1) != 0)
    goto LABEL_49;
  -[CSSiriSpeechCapturingDelegate speechCapturingDidStopRecordingWithError:endpointMode:totalPacketCount:endpointerMetrics:](self->_delegate, "speechCapturingDidStopRecordingWithError:endpointMode:totalPacketCount:endpointerMetrics:", v67, 0, self->_packetCount, 0);
LABEL_40:
  NSStringFromSelector(a2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _updateAudioContextToPostVoiceForReason:](self, "_updateAudioContextToPostVoiceForReason:", v70);

  if (!-[CSSiriAudioActivationInfo shouldSuppressRecordingErrorAlert](self->_currentActivationInfo, "shouldSuppressRecordingErrorAlert"))-[CSSiriSpeechRecorder _playAudioAlert:](self, "_playAudioAlert:", 3);
  NSStringFromSelector(a2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _updateAudioContextWithPendingInfoForReason:](self, "_updateAudioContextWithPendingInfoForReason:", v71);

  if (objc_msgSend(v48, "code") != -11786
    || (objc_msgSend(v82, "domain"),
        v72 = (void *)objc_claimAutoreleasedReturnValue(),
        v73 = objc_msgSend(v72, "isEqualToString:", *MEMORY[0x1E0CB2F90]),
        v72,
        (v73 & 1) == 0))
  {
    v74 = *v64;
    if (os_log_type_enabled(*v64, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
      _os_log_impl(&dword_1C2614000, v74, OS_LOG_TYPE_INFO, "%s Resetting VoiceController on startRecording failure", buf, 0xCu);
    }
    -[CSSiriSpeechRecorder _resetSpeechController](self, "_resetSpeechController");
  }
  v48 = v82;
  if (!didEnterTwoShotMode)
LABEL_48:
    -[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:](self, "_setupAudioFileWritingForSpeechController:info:context:", v81, self->_currentActivationInfo, self->_context);
LABEL_49:
  if (CSIsWatch() && (objc_msgSend(MEMORY[0x1E0D19260], "isM9Device") & 1) != 0)
  {
    v75 = *v64;
    if (os_log_type_enabled(*v64, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
      _os_log_impl(&dword_1C2614000, v75, OS_LOG_TYPE_INFO, "%s Skip bluetooth state logging for M9 watch", buf, 0xCu);
    }
  }
  else
  {
    -[CSSiriSpeechRecorder _logBluetoothStateWithMHUUID:](self, "_logBluetoothStateWithMHUUID:", v22);
  }
  v76 = *v64;
  if (os_log_type_enabled(*v64, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v85 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
    _os_log_impl(&dword_1C2614000, v76, OS_LOG_TYPE_INFO, "%s Done", buf, 0xCu);
  }

}

- (void)speechControllerDidDeliverLastBuffer:(id)a3 forReason:(int64_t)a4 estimatedSpeechEndHostTime:(unint64_t)a5
{
  id v8;
  NSObject *v9;
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  id v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  unint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[CSSiriSpeechRecorder speechControllerDidDeliverLastBuffer:forReason:estimatedSpeechEndHostTime:]";
    v19 = 2048;
    v20 = a4;
    v21 = 2048;
    v22 = a5;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s reason = %ld, estimatedSpeechEndHostTime = %llu", buf, 0x20u);
  }
  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__CSSiriSpeechRecorder_speechControllerDidDeliverLastBuffer_forReason_estimatedSpeechEndHostTime___block_invoke;
  v13[3] = &unk_1E7C283B8;
  v13[4] = self;
  v14 = v8;
  v15 = a4;
  v16 = a5;
  v12 = v8;
  dispatch_group_notify(recordingWillStartGroup, queue, v13);

}

- (void)speechControllerDidStopRecording:(id)a3 audioDeviceInfo:(id)a4 forReason:(int64_t)a5 estimatedSpeechEndHostTime:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *queue;
  id v15;
  NSObject *recordingWillStartGroup;
  NSObject *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  int64_t v23;
  unint64_t v24;
  _QWORD block[5];
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int64_t v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  kdebug_trace();
  v12 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[CSSiriSpeechRecorder speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpeechEndHostTime:]";
    v29 = 2048;
    v30 = a5;
    v31 = 2048;
    v32 = a6;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s reason = %ld, estimatedSpeechEndHostTime = %llu", buf, 0x20u);
  }
  v13 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __110__CSSiriSpeechRecorder_speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime___block_invoke;
  block[3] = &unk_1E7C292A0;
  block[4] = self;
  v15 = v10;
  v26 = v15;
  dispatch_async(queue, block);
  recordingWillStartGroup = self->_recordingWillStartGroup;
  v17 = self->_queue;
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __110__CSSiriSpeechRecorder_speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime___block_invoke_142;
  v20[3] = &unk_1E7C283E0;
  v20[4] = self;
  v21 = v15;
  v22 = v11;
  v23 = a5;
  v24 = a6;
  v18 = v11;
  v19 = v15;
  dispatch_group_notify(recordingWillStartGroup, v17, v20);

}

- (void)_speechControllerDidStopRecording:(id)a3 audioDeviceInfo:(id)a4 forReason:(int64_t)a5 estimatedSpeechEndHostTime:(unint64_t)a6 errorCodeOverride:(int64_t)a7 underlyingError:(id)a8
{
  id v15;
  id v16;
  NSObject *v17;
  int64_t recordingState;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CSEndpointerMetrics *lastEndpointerMetrics;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int64_t packetCount;
  double v38;
  _BOOL4 v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  CSSpeechController *speechController;
  BOOL v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  uint64_t v56;
  CSSpeechController *v57;
  CSEndpointerMetrics *v58;
  CSSiriAudioFileWriter *audioFileWriter;
  CSSiriAudioFileWriter *v60;
  CSSiriSpeechRecordingContext *context;
  NSObject *v62;
  CSSiriSpeechRecordingContext *v63;
  void *v64;
  id v65;
  _QWORD v66[6];
  _QWORD v67[5];
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  _BYTE buf[24];
  unint64_t v74;
  _BYTE v75[20];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  v15 = a4;
  v16 = a8;
  v17 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpe"
                         "echEndHostTime:errorCodeOverride:underlyingError:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a5;
    *(_WORD *)&buf[22] = 2048;
    v74 = a6;
    *(_WORD *)v75 = 2048;
    *(_QWORD *)&v75[2] = a7;
    *(_WORD *)&v75[10] = 2112;
    *(_QWORD *)&v75[12] = v16;
    _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_INFO, "%s reason = %ld, estimatedSpeechEndHostTime = %llu, errorCodeOverride = %ld, underlyingError = %@", buf, 0x34u);
  }
  recordingState = self->_recordingState;
  if ((recordingState & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (!self->_didReceiveLastBuffer)
      -[CSSiriSpeechRecorder _speechControllerDidReceiveLastAudioRecordBuffer:forReason:estimatedSpeechEndHostTime:isRecordingStopped:](self, "_speechControllerDidReceiveLastAudioRecordBuffer:forReason:estimatedSpeechEndHostTime:isRecordingStopped:", v65, a5, a6, 1);
    -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "logEventWithType:context:", 215, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logMHAssistantDaemonAudioRecordingContextWithMHUUID:withAudioRecordingStarted:withAudioInputRoute:withAudioSource:withAudioInterfaceVendorId:withAudioInterfaceProductId:", v64, 0, 0, 0, &stru_1E7C296E8, &stru_1E7C296E8);

    self->_estimatedSpeechEndHostTime = a6;
    self->_recordingState = 0;
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriSpeechRecorder _updateAudioContextToPostVoiceForReason:](self, "_updateAudioContextToPostVoiceForReason:", v21);

    NSStringFromSelector(a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:](self, "_updateAudioDeviceInfo:forReason:forcesUpdate:", v15, v22, 1);

    if (self->_didDetectEndpoint)
    {
      lastEndpointerMetrics = self->_lastEndpointerMetrics;
      if (lastEndpointerMetrics)
      {
        v24 = -[CSEndpointerMetrics endpointerType](lastEndpointerMetrics, "endpointerType");
        if (v24 < 5)
        {
          v25 = qword_1C276CCF8[v24];
          if (!a7)
            goto LABEL_22;
LABEL_35:
          if (v16)
          {
            v71 = *MEMORY[0x1E0CB3388];
            v72 = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v36 = 0;
          }
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CFEB48], a7, v36);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_39;
        }
        v25 = 0;
        if (a7)
          goto LABEL_35;
LABEL_22:
        a7 = 208;
        switch(a5)
        {
          case -11791:
            objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "submitAudioIssueReport:", *MEMORY[0x1E0D19348]);

            a7 = 235;
            goto LABEL_35;
          case -11790:
            objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "submitAudioIssueReport:", *MEMORY[0x1E0D19368]);

            a7 = 230;
            goto LABEL_35;
          case -11789:
LABEL_27:
            objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "submitAudioIssueReport:", *MEMORY[0x1E0D19388]);

            a7 = 201;
            goto LABEL_35;
          case -11788:
            objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "submitAudioIssueReport:", *MEMORY[0x1E0D192F8]);

            a7 = 202;
            goto LABEL_35;
          case -11787:
            objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "submitAudioIssueReport:", *MEMORY[0x1E0D19340]);

            a7 = 220;
            goto LABEL_35;
          case -11786:
            goto LABEL_35;
          case -11785:
            objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "submitAudioIssueReport:", *MEMORY[0x1E0D19358]);

            a7 = 228;
            goto LABEL_35;
          case -11784:
            objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "submitAudioIssueReport:", *MEMORY[0x1E0D19370]);

            a7 = 229;
            goto LABEL_35;
          default:
            v28 = 0;
            switch(a5)
            {
              case 0:
              case 2:
                goto LABEL_39;
              case 1:
                objc_msgSend(MEMORY[0x1E0D190B8], "sharedInstance");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "submitAudioIssueReport:", *MEMORY[0x1E0D19310]);

                a7 = 232;
                goto LABEL_35;
              case 3:
              case 4:
                goto LABEL_27;
              case 5:
                a7 = 233;
                goto LABEL_35;
              case 6:
                a7 = 234;
                goto LABEL_35;
              default:
                if (a5 != 1919115630)
                  goto LABEL_27;
                break;
            }
            break;
        }
LABEL_39:
        -[CSSiriSpeechRecorder _playStopAlertIfNecessaryForReason:endpointMode:error:](self, "_playStopAlertIfNecessaryForReason:endpointMode:error:", a5, v25, v28);
        if (self->_didEnterTwoShotMode)
        {
          packetCount = self->_packetCount;
          -[CSSpeechController getRecordBufferDuration](self->_speechController, "getRecordBufferDuration");
          self->_twoShotStartTime = v38 * (double)packetCount;
          v70 = 0;
          v39 = -[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:](self, "_prepareSpeechControllerWithOptions:error:", 8, &v70);
          v40 = v70;
          if (v39)
          {
            -[CSSiriSpeechRecorder _setEndpointStyle:](self, "_setEndpointStyle:", 0);
            v41 = *MEMORY[0x1E0CFE6C0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:es"
                                   "timatedSpeechEndHostTime:errorCodeOverride:underlyingError:]";
              _os_log_impl(&dword_1C2614000, v41, OS_LOG_TYPE_INFO, "%s entering _recordingWillStartGroup", buf, 0xCu);
            }
            dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
            objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "logEventWithType:context:", 211, 0);

            objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "logMHAssistantDaemonAudioStartRecordingContextWithMHUUID:withStartRecordingContext:withFanInfoArray:withActiveSessionDisplayIDs:", v64, 1, 0, 0);

            speechController = self->_speechController;
            v69 = v40;
            v45 = -[CSSpeechController startRecording:](speechController, "startRecording:", &v69);
            v46 = v69;

            if (v45)
            {
              v47 = 0;
            }
            else
            {
              AFAddInterruptingAudioSessionInfoToAnalyticsContext();
              v47 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "logEventWithType:context:", 212, v47);

            objc_msgSend(v47, "objectForKey:", CFSTR("kAudioSessionProperty_ActiveSessionDisplayIDs"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "logMHAssistantDaemonAudioStartRecordingContextWithMHUUID:withStartRecordingContext:withFanInfoArray:withActiveSessionDisplayIDs:", v64, 0, 0, v50);

            if (v45)
            {
              -[CSSiriSpeechRecorder _speechRecordingEventListener](self, "_speechRecordingEventListener");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "handleSpeechRecordingEvent:", 1);

              v53 = *MEMORY[0x1E0CFE6C0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:"
                                     "estimatedSpeechEndHostTime:errorCodeOverride:underlyingError:]";
                _os_log_impl(&dword_1C2614000, v53, OS_LOG_TYPE_INFO, "%s Starting new recording for two shot mode", buf, 0xCu);
              }
              self->_recordingState = 1;
LABEL_65:

              if (!v28)
                -[CSSiriAcousticFingerprinter flush](self->_fingerprinter, "flush");
              if (!self->_didEnterTwoShotMode)
              {
                audioFileWriter = self->_audioFileWriter;
                if (audioFileWriter)
                {
                  *(_QWORD *)buf = 0;
                  *(_QWORD *)&buf[8] = buf;
                  *(_QWORD *)&buf[16] = 0x3032000000;
                  v74 = (unint64_t)__Block_byref_object_copy__24421;
                  *(_QWORD *)v75 = __Block_byref_object_dispose__24422;
                  *(_QWORD *)&v75[8] = audioFileWriter;
                  v66[0] = MEMORY[0x1E0C809B0];
                  v66[1] = 3221225472;
                  v66[2] = __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_145;
                  v66[3] = &unk_1E7C28430;
                  v66[4] = self;
                  v66[5] = buf;
                  objc_msgSend(*(id *)&v75[8], "flushWithCompletion:", v66);
                  v60 = self->_audioFileWriter;
                  self->_audioFileWriter = 0;

                  _Block_object_dispose(buf, 8);
                }
                -[CSSiriSpeechRecordingContext endRecordingAudio](self->_context, "endRecordingAudio");
                if (!self->_didEnterTwoShotMode)
                  self->_needsAVVCLPCMCallbacks = 0;
              }
              self->_hasReceivedEmptyLPCMRecordBuffer = 0;
              context = self->_context;
              self->_context = 0;

              v62 = *MEMORY[0x1E0CFE6C0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
              {
                v63 = self->_context;
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:"
                                     "estimatedSpeechEndHostTime:errorCodeOverride:underlyingError:]";
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v63;
                _os_log_impl(&dword_1C2614000, v62, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
              }

              goto LABEL_75;
            }
            v54 = *MEMORY[0x1E0CFE6C0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:es"
                                   "timatedSpeechEndHostTime:errorCodeOverride:underlyingError:]";
              _os_log_impl(&dword_1C2614000, v54, OS_LOG_TYPE_INFO, "%s leaving _recordingWillStartGroup", buf, 0xCu);
            }
            dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);

            v48 = 215;
            v40 = v46;
          }
          else
          {
            v48 = 214;
          }
          v55 = *MEMORY[0x1E0CFE6C0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:esti"
                                 "matedSpeechEndHostTime:errorCodeOverride:underlyingError:]";
            _os_log_error_impl(&dword_1C2614000, v55, OS_LOG_TYPE_ERROR, "%s Failed starting recording for two shot mode", buf, 0xCu);
          }
          self->_recordingState = 0;
          objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", v48, 0, v40);
          v56 = objc_claimAutoreleasedReturnValue();

          if (!-[CSSiriAudioActivationInfo shouldSuppressRecordingErrorAlert](self->_currentActivationInfo, "shouldSuppressRecordingErrorAlert"))-[CSSiriSpeechRecorder _playAudioAlert:](self, "_playAudioAlert:", 3);
          self->_didEnterTwoShotMode = 0;

          v28 = (void *)v56;
        }
        -[CSSiriSpeechRecorder _currentRecordingInfo](self, "_currentRecordingInfo");
        v46 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setIsEndAlertInfo:", 1);
        if (AFIsHorseman())
        {
          v57 = self->_speechController;
          v67[0] = MEMORY[0x1E0C809B0];
          v67[1] = 3221225472;
          v67[2] = __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke;
          v67[3] = &unk_1E7C28348;
          v67[4] = self;
          v68 = v46;
          -[CSSpeechController fetchAudioMetricsWithCompletion:](v57, "fetchAudioMetricsWithCompletion:", v67);

        }
        -[CSSiriSpeechRecordingContext didStopRecordingWithError:](self->_context, "didStopRecordingWithError:", v28);
        -[CSSiriSpeechCapturingDelegate speechCapturingDidUpdateRecordingInfo:](self->_delegate, "speechCapturingDidUpdateRecordingInfo:", v46);
        if (self->_didDetectEndpoint)
          v58 = self->_lastEndpointerMetrics;
        else
          v58 = 0;
        -[CSSiriSpeechCapturingDelegate speechCapturingDidStopRecordingWithError:endpointMode:totalPacketCount:endpointerMetrics:](self->_delegate, "speechCapturingDidStopRecordingWithError:endpointMode:totalPacketCount:endpointerMetrics:", v28, v25, self->_packetCount, v58);
        -[CSEndpointAnalyzer reset](self->_endpointAnalyzer, "reset");
        -[CSSpeechController setSpeakerIdDelegate:](self->_speechController, "setSpeakerIdDelegate:", 0);
        goto LABEL_65;
      }
    }
    else if (!self->_serverDidEndpoint)
    {
      if (a5 == -11789)
        v25 = 1;
      else
        v25 = 2 * (a5 == 0);
      if (a7)
        goto LABEL_35;
      goto LABEL_22;
    }
    v25 = 1;
    if (a7)
      goto LABEL_35;
    goto LABEL_22;
  }
  v26 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpe"
                         "echEndHostTime:errorCodeOverride:underlyingError:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = recordingState;
    _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, "%s Ignoring unexpected didStop callback while in state %ld", buf, 0x16u);
  }
LABEL_75:

}

- (void)speechControllerRecordBufferAvailable:(id)a3 buffers:(id)a4 durationInSec:(float)a5 recordedAt:(unint64_t)a6 audioDeviceInfo:(id)a7
{
  id v11;
  id v12;
  int v13;
  os_log_t *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  os_signpost_id_t v17;
  uint64_t v18;
  os_log_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *queue;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  float v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  double v36;
  __int16 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = AFIsInternalInstall();
  v14 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  if (v13)
  {
    v15 = (id)*MEMORY[0x1E0CFE6C0];
    v16 = os_signpost_id_generate(*v14);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v17 = v16;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v15, OS_SIGNPOST_EVENT, v17, "SpeechRecorder", "RecordBufferAvailable", buf, 2u);
      }
    }

  }
  kdebug_trace();
  v18 = mach_absolute_time();
  if (-[CSSiriSpeechRecordingContext wantsRecordedAudioBufferLogs](self->_context, "wantsRecordedAudioBufferLogs"))
  {
    v19 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      v21 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 136315906;
      v32 = "-[CSSiriSpeechRecorder speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:audioDeviceInfo:]";
      v33 = 2048;
      v34 = v21;
      v35 = 2048;
      v36 = a5;
      v37 = 2048;
      v38 = a6;
      _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s buffers.count = %llu, durationInSec = %f, bufferStartHostTime = %llu", buf, 0x2Au);

    }
  }
  queue = self->_queue;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __111__CSSiriSpeechRecorder_speechControllerRecordBufferAvailable_buffers_durationInSec_recordedAt_audioDeviceInfo___block_invoke;
  v25[3] = &unk_1E7C28458;
  v25[4] = self;
  v26 = v11;
  v28 = a6;
  v29 = v18;
  v30 = a5;
  v27 = v12;
  v23 = v12;
  v24 = v11;
  dispatch_async(queue, v25);

}

- (void)_speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:(unint64_t)a3 atHostTime:(unint64_t)a4 mhUUID:(id)a5
{
  id v8;
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v10 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v21 = 136315650;
    v22 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:atHostTime:mhUUID:]";
    v23 = 2048;
    v24 = a3;
    v25 = 2048;
    v26 = a4;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s firstBufferStartHostTime = %llu, firstBufferReceiptHostTime = %llu", (uint8_t *)&v21, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logEventWithType:machAbsoluteTime:context:contextNoCopy:", 229, a3, 0, 1);

  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logEventWithType:machAbsoluteTime:context:contextNoCopy:", 230, a4, 0, 1);

  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logMHAssistantDaemonAudioRecordingFirstBufferWithMHUUID:withStartEvent:withFirstBufferStartTimeOffsetNs:withFirstBufferReceiptTimeOffsetNs:", v8, 1, objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", a3), 0);

  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "logMHAssistantDaemonAudioRecordingFirstBufferWithMHUUID:withStartEvent:withFirstBufferStartTimeOffsetNs:withFirstBufferReceiptTimeOffsetNs:", v8, 0, 0, objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", a4));

  self->_didReceiveFirstBuffer = 1;
  self->_firstBufferHostTime = a3;
  objc_msgSend(MEMORY[0x1E0C89B10], "secondsForHostTime:", a3);
  self->_firstBufferTimestamp = v15;
  -[CSSiriSpeechRecorder _currentRecordingInfo](self, "_currentRecordingInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechCapturingDelegate speechCapturingDidUpdateRecordingInfo:](self->_delegate, "speechCapturingDidUpdateRecordingInfo:", v16);
  if (-[CSSiriSpeechRecorder _shouldEmitInstrumentation](self, "_shouldEmitInstrumentation"))
  {
    -[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:](self, "getAudioRouteInstrumentationWithRecordingInfo:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriAudioActivationInfo turnIdentifier](self->_currentActivationInfo, "turnIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v17, a3, v19);

  }
  v20 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    v21 = 136315138;
    v22 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:atHostTime:mhUUID:]";
    _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s Done", (uint8_t *)&v21, 0xCu);
  }

}

- (int)convertSISchemaAudioInputRouteToMHRoute:(int)a3 withRecordingInfo:(id)a4
{
  int v4;
  void *v5;

  v4 = a3;
  if ((a3 - 1) >= 0xE)
  {
    objc_msgSend(a4, "route");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C89830]))
      v4 = 15;
    else
      v4 = 0;

  }
  return v4;
}

- (id)getAudioRouteInstrumentationWithRecordingInfo:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  NSObject *v33;
  void *v34;
  char v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:]";
    v42 = 2112;
    v43 = v4;
    _os_log_debug_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEBUG, "%s Getting audio route instrumentation with recording info %@...", buf, 0x16u);
  }
  v7 = objc_alloc_init(MEMORY[0x1E0D9A3E0]);
  v8 = objc_alloc_init(MEMORY[0x1E0D9A438]);
  objc_msgSend(v4, "route");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "containsString:", CFSTR("injectionDevice")))
    v10 = 14;
  else
    v10 = 0;
  if (objc_msgSend(v4, "isBluetooth"))
  {
    v36 = v4;
    objc_msgSend(v4, "bluetoothDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deviceInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "vendorID");
    v14 = objc_msgSend(v12, "productID");
    if ((_DWORD)v13 == 76)
    {
      if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C897E0]))
        LODWORD(v10) = 10;
      else
        LODWORD(v10) = 3;
      if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89A00]))
        v10 = 8;
      else
        v10 = v10;
    }
    else
    {
      v10 = 4;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInterfaceVendorID:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInterfaceProductID:", v18);

    v4 = v36;
    goto LABEL_18;
  }
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89868]) & 1) != 0)
  {
    v10 = 12;
    goto LABEL_19;
  }
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C897F8]) & 1) != 0)
  {
    v10 = 1;
    goto LABEL_19;
  }
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89820]) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89A30]))
  {
    objc_msgSend(v4, "modelName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setInterfaceProductID:", v11);
    v10 = 7;
LABEL_18:

    goto LABEL_19;
  }
  if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89840]) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C89850]))
  {
    objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributeForKey:", *MEMORY[0x1E0D48050]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKey:", *MEMORY[0x1E0D481D8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSiriSpeechRecorder convertVirtualAudioSubTypeToString:](self, "convertVirtualAudioSubTypeToString:", 1751410292);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", v23))
    {

      v10 = 6;
LABEL_40:
      v30 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v41 = "-[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:]";
        v42 = 2112;
        v43 = v22;
        _os_log_debug_impl(&dword_1C2614000, v30, OS_LOG_TYPE_DEBUG, "%s routeSubtype = %@", buf, 0x16u);
        v30 = *v5;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v39 = v21;
        v31 = v4;
        v32 = (void *)MEMORY[0x1E0CB37E8];
        v33 = v30;
        objc_msgSend(v32, "numberWithInt:", v10);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v41 = "-[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:]";
        v42 = 2112;
        v43 = v34;
        _os_log_debug_impl(&dword_1C2614000, v33, OS_LOG_TYPE_DEBUG, "%s route = %@", buf, 0x16u);

        v4 = v31;
        v21 = v39;

      }
      goto LABEL_18;
    }
    v38 = v21;
    v24 = v8;
    -[CSSiriSpeechRecorder convertVirtualAudioSubTypeToString:](self, "convertVirtualAudioSubTypeToString:", 1214539380);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", v25))
    {

      v10 = 6;
      v8 = v24;
LABEL_39:
      v21 = v38;
      goto LABEL_40;
    }
    v37 = v11;
    v26 = v4;
    -[CSSiriSpeechRecorder convertVirtualAudioSubTypeToString:](self, "convertVirtualAudioSubTypeToString:", 1752709424);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "isEqualToString:", v27))
    {

    }
    else
    {
      -[CSSiriSpeechRecorder convertVirtualAudioSubTypeToString:](self, "convertVirtualAudioSubTypeToString:", 2004367664);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v22, "isEqualToString:", v28);

      if ((v35 & 1) == 0)
      {
        objc_msgSend(&unk_1E7C63E18, "stringValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v24;
        objc_msgSend(v24, "setInterfaceVendorID:", v29);

        objc_msgSend(v24, "setInterfaceProductID:", v22);
        v10 = 5;
        goto LABEL_38;
      }
    }
    v10 = 6;
    v8 = v24;
LABEL_38:
    v4 = v26;
    v11 = v37;
    goto LABEL_39;
  }
LABEL_19:
  objc_msgSend(v7, "setHardwareInterfaceVendorID:", v8);
  objc_msgSend(v7, "setAudioInputRoute:", v10);
  v19 = *v5;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:]";
    v42 = 2112;
    v43 = v7;
    _os_log_debug_impl(&dword_1C2614000, v19, OS_LOG_TYPE_DEBUG, "%s Done getting audio route instrumentation %@.", buf, 0x16u);
  }

  return v7;
}

- (id)convertVirtualAudioSubTypeToString:(unsigned int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D19260], "audioPortSubtypeAsString:", *(_QWORD *)&a3);
}

- (void)speechControllerLPCMRecordBufferAvailable:(id)a3 buffer:(id)a4 recordedAt:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *queue;
  id v12;
  NSObject *recordingWillStartGroup;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD block[5];
  id v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 buf;
  Class (*v30)(uint64_t);
  void *v31;
  uint64_t *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CSSiriSpeechRecorder_speechControllerLPCMRecordBufferAvailable_buffer_recordedAt___block_invoke;
  block[3] = &unk_1E7C28B58;
  block[4] = self;
  v12 = v9;
  v23 = v12;
  v24 = a5;
  dispatch_async(queue, block);
  if (self->_needsAVVCLPCMCallbacks)
  {
    if (objc_msgSend(v12, "length"))
    {
      recordingWillStartGroup = self->_recordingWillStartGroup;
      v14 = self->_queue;
      v20[0] = v10;
      v20[1] = 3221225472;
      v20[2] = __84__CSSiriSpeechRecorder_speechControllerLPCMRecordBufferAvailable_buffer_recordedAt___block_invoke_158;
      v20[3] = &unk_1E7C292A0;
      v20[4] = self;
      v21 = v12;
      dispatch_group_notify(recordingWillStartGroup, v14, v20);

    }
    else
    {
      v15 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[CSSiriSpeechRecorder speechControllerLPCMRecordBufferAvailable:buffer:recordedAt:]";
        _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s LPCM record buffer is empty.", (uint8_t *)&buf, 0xCu);
      }
      if (!self->_hasReceivedEmptyLPCMRecordBuffer)
      {
        self->_hasReceivedEmptyLPCMRecordBuffer = 1;
        v25 = 0;
        v26 = &v25;
        v27 = 0x2050000000;
        v16 = (void *)getSiriCoreSymptomsReporterClass_softClass;
        v28 = getSiriCoreSymptomsReporterClass_softClass;
        if (!getSiriCoreSymptomsReporterClass_softClass)
        {
          *(_QWORD *)&buf = v10;
          *((_QWORD *)&buf + 1) = 3221225472;
          v30 = __getSiriCoreSymptomsReporterClass_block_invoke;
          v31 = &unk_1E7C287B8;
          v32 = &v25;
          __getSiriCoreSymptomsReporterClass_block_invoke((uint64_t)&buf);
          v16 = (void *)v26[3];
        }
        v17 = objc_retainAutorelease(v16);
        _Block_object_dispose(&v25, 8);
        objc_msgSend(v17, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "reportIssueForType:subType:context:processIdentifier:walkboutStatus:", CFSTR("audio_recording"), CFSTR("empty_lpcm_record_buffer"), 0, objc_msgSend(v19, "processIdentifier"), CSIsCarryDevice());

      }
    }
  }

}

- (void)_speechControllerDidReceiveLastAudioRecordBuffer:(id)a3 forReason:(int64_t)a4 estimatedSpeechEndHostTime:(unint64_t)a5 isRecordingStopped:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  os_log_t *v11;
  NSObject *v12;
  int64_t recordingState;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CSEndpointerMetrics *lastEndpointerMetrics;
  unint64_t v20;
  uint64_t v21;
  os_log_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  os_log_t v26;
  uint64_t v27;
  CSEndpointerMetrics *v28;
  int v29;
  const char *v30;
  __int16 v31;
  int64_t v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v6 = a6;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v12 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v29 = 136315906;
    v30 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveLastAudioRecordBuffer:forReason:estimatedSpeechEndHostTime:i"
          "sRecordingStopped:]";
    v31 = 2048;
    v32 = a4;
    v33 = 2048;
    v34 = a5;
    v35 = 1024;
    v36 = v6;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s reason = %zd, estimatedSpeechEndHostTime = %llu, isRecordingStopped = %d", (uint8_t *)&v29, 0x26u);
  }
  recordingState = self->_recordingState;
  if ((recordingState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v22 = *v11;
    if (!os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    v29 = 136315394;
    v30 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveLastAudioRecordBuffer:forReason:estimatedSpeechEndHostTime:i"
          "sRecordingStopped:]";
    v31 = 2048;
    v32 = recordingState;
    v23 = "%s Ignoring unexpected last buffer callback while in state %ld";
    v24 = v22;
    v25 = 22;
LABEL_18:
    _os_log_error_impl(&dword_1C2614000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v29, v25);
    goto LABEL_31;
  }
  if (!self->_didReceiveFirstBuffer)
  {
    v26 = *v11;
    if (!os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    v29 = 136315138;
    v30 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveLastAudioRecordBuffer:forReason:estimatedSpeechEndHostTime:i"
          "sRecordingStopped:]";
    v23 = "%s Ignoring unexpected last buffer callback without first buffer.";
    v24 = v26;
    v25 = 12;
    goto LABEL_18;
  }
  self->_didReceiveLastBuffer = 1;
  -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_lastAudioRecordBufferStartTime)
  {
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "logEventWithType:machAbsoluteTime:context:", 231, self->_lastAudioRecordBufferStartTime, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logMHAssistantDaemonAudioRecordingLastBufferWithMHUUID:withStartEvent:withLastBufferStartTimeOffsetNs:withLastBufferReceiptTimeOffsetNs:", v14, 1, objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", self->_lastAudioRecordBufferStartTime), 0);

  }
  if (self->_lastAudioRecordBufferReceiptTime)
  {
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logEventWithType:machAbsoluteTime:context:", 232, self->_lastAudioRecordBufferReceiptTime, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logMHAssistantDaemonAudioRecordingLastBufferWithMHUUID:withStartEvent:withLastBufferStartTimeOffsetNs:withLastBufferReceiptTimeOffsetNs:", v14, 0, 0, objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", self->_lastAudioRecordBufferReceiptTime));

  }
  if (!v6)
  {
    if (self->_didDetectEndpoint)
    {
      lastEndpointerMetrics = self->_lastEndpointerMetrics;
      if (lastEndpointerMetrics)
      {
        v20 = -[CSEndpointerMetrics endpointerType](lastEndpointerMetrics, "endpointerType");
        if (v20 >= 5)
          v21 = 0;
        else
          v21 = qword_1C276CCF8[v20];
      }
      else
      {
        v21 = 1;
      }
    }
    else
    {
      v27 = 2 * (a4 == 0);
      if (a4 == -11789)
        v27 = 1;
      if (self->_serverDidEndpoint)
        v21 = 1;
      else
        v21 = v27;
    }
    if (self->_didDetectEndpoint)
      v28 = self->_lastEndpointerMetrics;
    else
      v28 = 0;
    -[CSSiriSpeechCapturingDelegate speechCapturingDidReceiveLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:](self->_delegate, "speechCapturingDidReceiveLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:", v21, self->_packetCount, v28);
  }

LABEL_31:
}

- (void)speechControllerBeginRecordInterruption:(id)a3 withContext:(id)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  AFAddInterruptingAudioSessionInfoToAnalyticsContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "-[CSSiriSpeechRecorder speechControllerBeginRecordInterruption:withContext:]";
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v18, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kAudioSessionProperty_ActiveSessionDisplayIDs"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C89720]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C89718]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logMHAssistantDaemonAudioRecordingInterruptionContextWithMHUUID:withStartEvent:withLinkID:withAvAudioSessionInterruptorName:withAVAudioSessionInterrupterType:", v12, 1, v7, v9, v11);

  +[CSMXSessionMonitor GetCurrentlyActiveSessionCategory](CSMXSessionMonitor, "GetCurrentlyActiveSessionCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSMXSessionMonitor GetCurrentlyActiveSessionMode](CSMXSessionMonitor, "GetCurrentlyActiveSessionMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "logMHAssistantDaemonAudioRecordingInterruptionStartedTier1WithMHUUID:withLinkID:withActiveSessionDisplayIDs:audioSessionCategory:audioSessionMode:", v12, v7, v8, v14, v15);

  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logEventWithType:context:", 226, v5);

}

- (void)speechControllerEndRecordInterruption:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[CSSiriSpeechRecorder speechControllerEndRecordInterruption:]";
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventWithType:context:", 227, 0);

  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logMHAssistantDaemonAudioRecordingInterruptionContextWithMHUUID:withStartEvent:withLinkID:withAvAudioSessionInterruptorName:withAVAudioSessionInterrupterType:", v7, 0, 0, 0, 0);

}

- (void)speechControllerRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int64_t)a4
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder speechControllerRecordHardwareConfigurationDidChange:toConfiguration:]";
    v8 = 2048;
    v9 = a4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %ld", (uint8_t *)&v6, 0x16u);
  }
}

- (void)speechController:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriSpeechRecorder speechController:willSetAudioSessionActive:]";
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__CSSiriSpeechRecorder_speechController_willSetAudioSessionActive___block_invoke;
  v8[3] = &unk_1E7C28480;
  v8[4] = self;
  v9 = v4;
  dispatch_async(queue, v8);
}

- (void)speechController:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  NSObject *queue;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[CSSiriSpeechRecorder speechController:didSetAudioSessionActive:]";
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__CSSiriSpeechRecorder_speechController_didSetAudioSessionActive___block_invoke;
  v8[3] = &unk_1E7C28480;
  v8[4] = self;
  v9 = v4;
  dispatch_async(queue, v8);
}

- (void)speechControllerDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  _QWORD block[4];
  id v14;
  CSSiriSpeechRecorder *v15;
  int64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x1E0CFE6C0];
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]";
      v19 = 2048;
      v20 = a4;
      v21 = 2112;
      v22 = v9;
      _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s type = %ld, error = %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]";
    v19 = 2048;
    v20 = a4;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s type = %ld", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__CSSiriSpeechRecorder_speechControllerDidFinishAlertPlayback_ofType_error___block_invoke;
  block[3] = &unk_1E7C28B58;
  v14 = v9;
  v15 = self;
  v16 = a4;
  v12 = v9;
  dispatch_async(queue, block);

}

- (void)_setLanguageDetectorDelegateIfRequired
{
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CSSiriAudioActivationInfo languageDetectionUserContext](self->_currentActivationInfo, "languageDetectionUserContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _AFPreferencesDictationLanguageDetectorEnabled();
  v5 = *MEMORY[0x1E0CFE6C0];
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO);
  if (v4 && v3)
  {
    if (v6)
    {
      v7 = 136315138;
      v8 = "-[CSSiriSpeechRecorder _setLanguageDetectorDelegateIfRequired]";
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s Language detection delegate is active", (uint8_t *)&v7, 0xCu);
    }
    -[CSSpeechController setLanguageDetectorDelegate:](self->_speechController, "setLanguageDetectorDelegate:", self);
  }
  else if (v6)
  {
    v7 = 136315650;
    v8 = "-[CSSiriSpeechRecorder _setLanguageDetectorDelegateIfRequired]";
    v9 = 1024;
    v10 = v4;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s Language detection delegate is NOT active. %d, %@", (uint8_t *)&v7, 0x1Cu);
  }

}

- (BOOL)_shouldPlayTwoShotToneFeedbackOnHorseman
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "startAlertEnabled") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(MEMORY[0x1E0D19260], "supportStateFeedback");

  return v3;
}

- (BOOL)_shouldPlaySummonedToneOnTopCapInvocationOnHorseman
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startAlertEnabled");

  return v3;
}

- (void)_playStopAlertIfNecessaryForReason:(int64_t)a3 endpointMode:(int64_t)a4 error:(id)a5
{
  void *v8;
  int v9;
  int v10;
  NSObject *v11;
  unint64_t v12;
  int64_t v13;
  int v14;
  id *v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  _BOOL4 wasCanceled;
  _BOOL4 suppressRecordingStoppedAlert;
  int v22;
  int v23;
  char v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  const __CFString *v28;
  CSSiriSpeechRecorder *v29;
  uint64_t v30;
  int v31;
  const char *v32;
  __int16 v33;
  _BYTE v34[14];
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[CSSiriSpeechRecorder _currentRecordRoute](self, "_currentRecordRoute", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_speechCapturingMode == 4 && !self->_fingerprintWasRecognized;
  if ((unint64_t)(a3 + 11785) > 0xFFFFFFFFFFFFFFFDLL
    || self->_suppressRecordingStoppedAlert
    || self->_didEnterTwoShotMode
    || (AFIsHorseman() & 1) != 0
    || (AFIsNano() & 1) != 0
    || -[CSSiriAudioActivationInfo shouldSuppressRecordingStopAlert](self->_currentActivationInfo, "shouldSuppressRecordingStopAlert")|| !-[CSSiriAudioActivationInfo isVoiceOverTouchEnabled](self->_currentActivationInfo, "isVoiceOverTouchEnabled")&& (self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v10 = v9;
  }
  else
  {
    v10 = 1;
  }
  if (AFIsATV())
  {
    if (!-[CSSiriAudioActivationInfo isVoiceOverTouchEnabled](self->_currentActivationInfo, "isVoiceOverTouchEnabled"))
      goto LABEL_16;
  }
  else if (!v10)
  {
LABEL_16:
    v11 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v31 = 136315138;
      v32 = "-[CSSiriSpeechRecorder _playStopAlertIfNecessaryForReason:endpointMode:error:]";
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s Not explicitly playing alert", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_48;
  }
  v12 = self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL;
  v13 = -[CSSiriAudioActivationInfo speechEvent](self->_currentActivationInfo, "speechEvent");
  v14 = objc_msgSend(MEMORY[0x1E0D19260], "supportsSCDAFramework");
  v15 = (id *)0x1E0D97CF0;
  if (!v14)
    v15 = (id *)0x1E0CFE948;
  objc_msgSend(*v15, "sharedMonitor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "didWin");
  v18 = objc_msgSend(v16, "isMonitoring");
  v19 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    wasCanceled = self->_wasCanceled;
    suppressRecordingStoppedAlert = self->_suppressRecordingStoppedAlert;
    v31 = 136316930;
    v32 = "-[CSSiriSpeechRecorder _playStopAlertIfNecessaryForReason:endpointMode:error:]";
    v33 = 1024;
    *(_DWORD *)v34 = v12 == 1;
    *(_WORD *)&v34[4] = 2048;
    *(_QWORD *)&v34[6] = v13;
    v35 = 1024;
    v36 = wasCanceled;
    v37 = 1024;
    v38 = suppressRecordingStoppedAlert;
    v39 = 1024;
    v40 = v18;
    v41 = 1024;
    v42 = v17;
    v43 = 2112;
    v44 = v8;
    _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_INFO, "%s isSiriMode=%d, speechEvent=%ld, wasRequestCancelled=%d, shouldSuppressAlert=%d, isMonitoringMyriadEvents=%d, didMyriadWin=%d, recordRoute=%@", (uint8_t *)&v31, 0x3Eu);
  }
  if (v12 == 1
    && AFSpeechEventIsVoiceTrigger()
    && (!self->_wasCanceled ? (v22 = v18) : (v22 = 0),
        (v23 = v22 & v17, !self->_wasCanceled) ? (v24 = 1) : (v24 = v18),
        v23 != 1 && (v24 & 1) != 0))
  {
    v25 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v31 = 136315138;
      v32 = "-[CSSiriSpeechRecorder _playStopAlertIfNecessaryForReason:endpointMode:error:]";
      _os_log_impl(&dword_1C2614000, v25, OS_LOG_TYPE_INFO, "%s BTLE Myriad Not explicitly playing speech stop alert", (uint8_t *)&v31, 0xCu);
    }
  }
  else
  {
    v26 = (a5 || (!self->_wasCanceled & ~v9) == 0) && !self->_forceSuccessAlertOnStop;
    v27 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v28 = CFSTR("AVVoice_RecordStopped");
      if (v26)
        v28 = CFSTR("AVVoice_RecordStoppedWithError");
      v31 = 136315394;
      v32 = "-[CSSiriSpeechRecorder _playStopAlertIfNecessaryForReason:endpointMode:error:]";
      v33 = 2112;
      *(_QWORD *)v34 = v28;
      _os_log_impl(&dword_1C2614000, v27, OS_LOG_TYPE_INFO, "%s Explicitly playing %@ alert", (uint8_t *)&v31, 0x16u);
    }
    if (v26
      && !-[CSSiriAudioActivationInfo shouldSuppressRecordingErrorAlert](self->_currentActivationInfo, "shouldSuppressRecordingErrorAlert"))
    {
      v29 = self;
      v30 = 3;
    }
    else
    {
      v29 = self;
      v30 = 2;
    }
    -[CSSiriSpeechRecorder _playAudioAlert:](v29, "_playAudioAlert:", v30);
  }

LABEL_48:
}

- (void)languageDetectorDidDetectLanguageWithConfidence:(id)a3 confidence:(id)a4 isConfident:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315907;
    v19 = "-[CSSiriSpeechRecorder languageDetectorDidDetectLanguageWithConfidence:confidence:isConfident:]";
    v20 = 1025;
    v21 = v5;
    v22 = 2113;
    v23 = v8;
    v24 = 2113;
    v25 = v9;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s Language detector is confident:%{private}d of the detected language:'%{private}@' with language code likelihood: %{private}@", buf, 0x26u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__CSSiriSpeechRecorder_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke;
  v14[3] = &unk_1E7C29278;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v5;
  v12 = v9;
  v13 = v8;
  dispatch_async(queue, v14);

}

- (void)speechControllerDidDetectVoiceTriggerTwoShot:(id)a3 atTime:(double)a4 wantsAudibleFeedback:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  id v15;
  _QWORD block[5];
  id v17;
  _QWORD v18[6];
  BOOL v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v21 = "-[CSSiriSpeechRecorder speechControllerDidDetectVoiceTriggerTwoShot:atTime:wantsAudibleFeedback:]";
    v22 = 2048;
    v23 = a4;
    v24 = 1024;
    v25 = v5;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s time = %lf, wantsAudibleFeedback = %d", buf, 0x1Cu);
  }
  objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logTwoShotDetectedWithMHUUID:", v10);

  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke;
  v18[3] = &unk_1E7C284A8;
  v18[4] = self;
  *(double *)&v18[5] = a4;
  v19 = v5;
  v12 = (void *)MEMORY[0x1C3BC4734](v18);
  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_2;
  block[3] = &unk_1E7C29150;
  block[4] = self;
  v17 = v12;
  v15 = v12;
  dispatch_group_notify(recordingWillStartGroup, queue, block);

}

- (void)suppressUtteranceGradingIfRequired
{
  NSObject *v3;
  void *v4;
  int v5;
  id *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (AFIsHorseman())
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSSiriSpeechRecorder suppressUtteranceGradingIfRequired]";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s BTLE speech controller began waiting for Myriad decision", buf, 0xCu);
    }
    -[CSSiriSpeechRecorder _speechController](self, "_speechController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginWaitingForMyriad");
    v5 = objc_msgSend(MEMORY[0x1E0D19260], "supportsSCDAFramework");
    v6 = (id *)0x1E0D97CF0;
    if (!v5)
      v6 = (id *)0x1E0CFE948;
    objc_msgSend(*v6, "sharedMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__CSSiriSpeechRecorder_suppressUtteranceGradingIfRequired__block_invoke;
    v9[3] = &unk_1E7C284F8;
    v10 = v4;
    v8 = v4;
    objc_msgSend(v7, "waitForMyriadDecisionForReason:withCompletion:", CFSTR("Utterance Grading"), v9);

  }
}

- (void)speechControllerRequestsOperation:(unint64_t)a3 forReason:(unint64_t)a4
{
  NSObject *v7;
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  _QWORD block[7];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  unint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "-[CSSiriSpeechRecorder speechControllerRequestsOperation:forReason:]";
    v13 = 2048;
    v14 = a3;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s opType = %tu, reason = %tu", buf, 0x20u);
  }
  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__CSSiriSpeechRecorder_speechControllerRequestsOperation_forReason___block_invoke;
  block[3] = &unk_1E7C28520;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_group_notify(recordingWillStartGroup, queue, block);
}

- (void)speechControllerRequestsOperation:(unint64_t)a3 forReason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;
  unint64_t v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[CSSiriSpeechRecorder speechControllerRequestsOperation:forReason:completion:]";
    v19 = 2048;
    v20 = a3;
    v21 = 2048;
    v22 = a4;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s opType = %tu, reason = %tu", buf, 0x20u);
  }
  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__CSSiriSpeechRecorder_speechControllerRequestsOperation_forReason_completion___block_invoke;
  v13[3] = &unk_1E7C28660;
  v15 = a3;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  dispatch_group_notify(recordingWillStartGroup, queue, v13);

}

- (void)_speechControllerRequestsOperation:(unint64_t)a3 forReason:(unint64_t)a4 completion:(id)a5
{
  id v8;
  os_log_t *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v10 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v18 = "-[CSSiriSpeechRecorder _speechControllerRequestsOperation:forReason:completion:]";
    v19 = 2048;
    v20 = a3;
    v21 = 2048;
    v22 = a4;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s opType = %tu, reason = %tu", buf, 0x20u);
  }
  switch(a3)
  {
    case 0uLL:
      -[CSSiriSpeechCapturingDelegate speechCapturingDidRequestQuickStop:](self->_delegate, "speechCapturingDidRequestQuickStop:", self);
      break;
    case 1uLL:
      -[CSSiriSpeechCapturingDelegate speechCapturingDidRequestShutdownUI:](self->_delegate, "speechCapturingDidRequestShutdownUI:", self);
      break;
    case 2uLL:
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __80__CSSiriSpeechRecorder__speechControllerRequestsOperation_forReason_completion___block_invoke;
      v15[3] = &unk_1E7C28548;
      v16 = v8;
      -[CSSiriSpeechRecorder _playPhaticWithCompletion:](self, "_playPhaticWithCompletion:", v15);
      v12 = v16;
      goto LABEL_10;
    case 3uLL:
      -[CSSpeechController playRecordStartingAlertAndResetEndpointerWithAlertOverride:](self->_speechController, "playRecordStartingAlertAndResetEndpointerWithAlertOverride:", 2);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __80__CSSiriSpeechRecorder__speechControllerRequestsOperation_forReason_completion___block_invoke_2;
      v13[3] = &unk_1E7C28570;
      v14 = v8;
      -[CSSiriSpeechRecorder performBlockAfterAlerts:timeout:](self, "performBlockAfterAlerts:timeout:", v13, 0.5);
      v12 = v14;
LABEL_10:

      break;
    default:
      v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[CSSiriSpeechRecorder _speechControllerRequestsOperation:forReason:completion:]";
        v19 = 2048;
        v20 = a3;
        _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, "%s Unknown CSRequestOperationType (opType = %tu).", buf, 0x16u);
      }
      break;
  }

}

- (void)speechControllerDidUpdateSmartSiriVolume:(id)a3 forReason:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  int v8;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSSiriSpeechRecorder speechControllerDidUpdateSmartSiriVolume:forReason:]";
    v13 = 2048;
    v14 = a4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s reason = %tu", buf, 0x16u);
  }
  v8 = AFIsHorseman();
  if (a4 <= 5 && v8)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__CSSiriSpeechRecorder_speechControllerDidUpdateSmartSiriVolume_forReason___block_invoke;
    block[3] = &unk_1E7C292C8;
    block[4] = self;
    dispatch_async(queue, block);
  }

}

- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *recordingWillStartGroup;
  NSObject *queue;
  id v11;
  _QWORD block[5];
  id v13;
  double v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[CSSiriSpeechRecorder endpointer:didDetectStartpointAtTime:]";
    v17 = 2048;
    v18 = a4;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s time = %lf", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logEventWithType:context:", 219, 0);

  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__CSSiriSpeechRecorder_endpointer_didDetectStartpointAtTime___block_invoke;
  block[3] = &unk_1E7C28B58;
  block[4] = self;
  v13 = v6;
  v14 = a4;
  v11 = v6;
  dispatch_group_notify(recordingWillStartGroup, queue, block);

}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5
{
  id v8;
  id v9;
  id *v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  os_signpost_id_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *recordingWillStartGroup;
  dispatch_time_t v19;
  NSObject *v20;
  NSObject *queue;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  double v27;
  _QWORD v28[4];
  id v29;
  double v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (id *)MEMORY[0x1E0CFE6C0];
  v11 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[CSSiriSpeechRecorder endpointer:didDetectHardEndpointAtTime:withMetrics:]";
    v33 = 2048;
    v34 = a4;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s time = %lf", buf, 0x16u);
  }
  if (AFIsInternalInstall())
  {
    v12 = *v10;
    v13 = os_signpost_id_generate((os_log_t)*v10);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v12, OS_SIGNPOST_EVENT, v14, "SpeechRecorder", "Endpoint", buf, 2u);
      }
    }

  }
  kdebug_trace();
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __75__CSSiriSpeechRecorder_endpointer_didDetectHardEndpointAtTime_withMetrics___block_invoke;
  v28[3] = &unk_1E7C28598;
  v30 = a4;
  v17 = v9;
  v29 = v17;
  objc_msgSend(v15, "logEventWithType:contextProvider:", 220, v28);

  recordingWillStartGroup = self->_recordingWillStartGroup;
  v19 = dispatch_time(0, 15000000000);
  dispatch_group_wait(recordingWillStartGroup, v19);
  v20 = *v10;
  if (os_log_type_enabled((os_log_t)*v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CSSiriSpeechRecorder endpointer:didDetectHardEndpointAtTime:withMetrics:]";
    _os_log_impl(&dword_1C2614000, v20, OS_LOG_TYPE_INFO, "%s exited _recordingWillStartGroup", buf, 0xCu);
  }
  queue = self->_queue;
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __75__CSSiriSpeechRecorder_endpointer_didDetectHardEndpointAtTime_withMetrics___block_invoke_178;
  v24[3] = &unk_1E7C285C0;
  v24[4] = self;
  v25 = v8;
  v27 = a4;
  v26 = v17;
  v22 = v17;
  v23 = v8;
  dispatch_sync(queue, v24);

}

- (void)_hardEndpointWasDetectedWithMetrics:(id)a3 atTime:(double)a4
{
  id v7;
  id *v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  os_signpost_id_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  _BOOL4 didEnterTwoShotMode;
  _BOOL4 didFakeTwoShotWithAlert;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (id *)MEMORY[0x1E0CFE6C0];
  v9 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v19 = 136315394;
    v20 = "-[CSSiriSpeechRecorder _hardEndpointWasDetectedWithMetrics:atTime:]";
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s Detected hard end-point with metrics - %@", (uint8_t *)&v19, 0x16u);
  }
  if (AFIsInternalInstall())
  {
    v10 = *v8;
    v11 = os_signpost_id_generate((os_log_t)*v8);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v10))
      {
        LOWORD(v19) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v10, OS_SIGNPOST_EVENT, v12, "SpeechRecorder", "EndpointHandled", (uint8_t *)&v19, 2u);
      }
    }

  }
  kdebug_trace();
  self->_didDetectEndpoint = 1;
  objc_storeStrong((id *)&self->_lastEndpointerMetrics, a3);
  if (self->_didDetectStartpoint || self->_serverDidRecognizeSpeech || self->_didEnterTwoShotMode)
  {
    self->_didTimeout = 0;
  }
  else
  {
    didFakeTwoShotWithAlert = self->_didFakeTwoShotWithAlert;
    self->_didTimeout = !didFakeTwoShotWithAlert;
    if (!didFakeTwoShotWithAlert
      && -[CSSiriAudioActivationInfo shouldTreatTimeoutAsHardEndpoint](self->_currentActivationInfo, "shouldTreatTimeoutAsHardEndpoint"))
    {
      v18 = *v8;
      if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_INFO))
      {
        v19 = 136315138;
        v20 = "-[CSSiriSpeechRecorder _hardEndpointWasDetectedWithMetrics:atTime:]";
        _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_INFO, "%s Overriding timeout and start point on timeout", (uint8_t *)&v19, 0xCu);
      }
      self->_didTimeout = 0;
      self->_didDetectStartpoint = 1;
    }
  }
  if ((unint64_t)(self->_endpointerOperationMode - 3) < 2 || self->_didEnterTwoShotMode)
  {
    -[CSSiriSpeechRecorder _checkIfLastEndpointHintShouldBeAccepted:](self, "_checkIfLastEndpointHintShouldBeAccepted:", 0);
    -[CSSiriSpeechRecorder _stopRecordingForEndpointReason:withEndpointMetrics:](self, "_stopRecordingForEndpointReason:withEndpointMetrics:", 2, v7);
    -[CSSiriSpeechCapturingDelegate speechCapturing:didDetectEndpointAtTime:](self->_delegate, "speechCapturing:didDetectEndpointAtTime:", self, a4);
  }
  else
  {
    v13 = *v8;
    if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      AFSpeechEndpointerOperationModeGetName();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      didEnterTwoShotMode = self->_didEnterTwoShotMode;
      v19 = 136315650;
      v20 = "-[CSSiriSpeechRecorder _hardEndpointWasDetectedWithMetrics:atTime:]";
      v21 = 2112;
      v22 = v15;
      v23 = 1024;
      v24 = didEnterTwoShotMode;
      _os_log_impl(&dword_1C2614000, v14, OS_LOG_TYPE_INFO, "%s Ignoring hard endpoint since _endpointerOperationMode = %@, _didEnterTwoShotMode = %d", (uint8_t *)&v19, 0x1Cu);

    }
  }

}

- (void)_performTwoShotPromptForType:(int64_t)a3 withOverride:(int64_t)a4 atTime:(double)a5
{
  os_log_t *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSUUID *v21;
  NSUUID *fakeTwoShotTTSPromptUUID;
  AFWatchdogTimer *fakeTwoShotTTSPromptWatchdogTimer;
  NSUUID *v24;
  id v25;
  OS_dispatch_queue *queue;
  uint64_t v27;
  id v28;
  NSUUID *v29;
  AFWatchdogTimer *v30;
  AFWatchdogTimer *v31;
  NSUUID *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  CSSiriSpeechRecorder *v45;
  NSUUID *v46;
  int64_t v47;
  double v48;
  _QWORD v49[4];
  id v50;
  NSUUID *v51;
  id v52;
  _QWORD v53[5];
  const __CFString *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int64_t v61;
  __int16 v62;
  double v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v10 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v59 = "-[CSSiriSpeechRecorder _performTwoShotPromptForType:withOverride:atTime:]";
    v60 = 2048;
    v61 = a3;
    v62 = 2048;
    v63 = a5;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s promptType = %ld, time = %f", buf, 0x20u);
  }
  self->_didFakeTwoShotWithAlert = 1;
  self->_twoShotStartTime = a5;
  -[CSSiriSpeechRecorder _currentMHUUID:](self, "_currentMHUUID:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (a3 == 2)
    {
      -[CSEndpointAnalyzer setSaveSamplesSeenInReset:](self->_endpointAnalyzer, "setSaveSamplesSeenInReset:", 1);
      objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logTwoShotStartEventWithPromptType:withMHUUID:", 2, v11);

      objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CFSTR("type");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "logEventWithType:context:", 239, v20);

      v21 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
      fakeTwoShotTTSPromptUUID = self->_fakeTwoShotTTSPromptUUID;
      self->_fakeTwoShotTTSPromptUUID = v21;

      fakeTwoShotTTSPromptWatchdogTimer = self->_fakeTwoShotTTSPromptWatchdogTimer;
      if (fakeTwoShotTTSPromptWatchdogTimer)
        -[AFWatchdogTimer cancel](fakeTwoShotTTSPromptWatchdogTimer, "cancel");
      objc_initWeak((id *)buf, self);
      v24 = self->_fakeTwoShotTTSPromptUUID;
      v25 = objc_alloc(MEMORY[0x1E0CFEAC8]);
      queue = self->_queue;
      v27 = MEMORY[0x1E0C809B0];
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke_2;
      v49[3] = &unk_1E7C28610;
      v28 = v11;
      v50 = v28;
      objc_copyWeak(&v52, (id *)buf);
      v29 = v24;
      v51 = v29;
      v30 = (AFWatchdogTimer *)objc_msgSend(v25, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, v49, 4.0);
      v31 = self->_fakeTwoShotTTSPromptWatchdogTimer;
      self->_fakeTwoShotTTSPromptWatchdogTimer = v30;

      v43[0] = v27;
      v43[1] = 3221225472;
      v43[2] = __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke_190;
      v43[3] = &unk_1E7C28638;
      v44 = v28;
      v45 = self;
      v32 = v29;
      v46 = v32;
      v47 = a4;
      v48 = a5;
      -[CSSiriSpeechRecorder _playPhaticWithCompletion:](self, "_playPhaticWithCompletion:", v43);

      objc_destroyWeak(&v52);
      objc_destroyWeak((id *)buf);
    }
    else if (a3 == 1)
    {
      -[CSEndpointAnalyzer setSaveSamplesSeenInReset:](self->_endpointAnalyzer, "setSaveSamplesSeenInReset:", 1);
      objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("type");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logEventWithType:context:", 239, v14);

      objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logTwoShotStartEventWithPromptType:withMHUUID:", 1, v11);

      if (AFIsHorseman())
        v16 = !-[CSSiriSpeechRecorder _shouldPlayTwoShotToneFeedbackOnHorseman](self, "_shouldPlayTwoShotToneFeedbackOnHorseman");
      else
        v16 = 0;
      v35 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "-[CSSiriSpeechRecorder _performTwoShotPromptForType:withOverride:atTime:]";
        v60 = 1024;
        LODWORD(v61) = v16;
        _os_log_impl(&dword_1C2614000, v35, OS_LOG_TYPE_INFO, "%s suppressesTwoShotAlert = %d", buf, 0x12u);
      }
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logEventWithType:context:", 240, &unk_1E7C64BD8);

        objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "logTwoShotEndEventWithSuppresedAlert:withTimedOut:withMHUUID:", 1, 0, v11);

      }
      else
      {
        -[AFClientConfiguration twoShotAudioPlaybackRequest](self->_currentClientConfiguration, "twoShotAudioPlaybackRequest");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v53[0] = MEMORY[0x1E0C809B0];
        v53[1] = 3221225472;
        v53[2] = __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke;
        v53[3] = &unk_1E7C285E8;
        v53[4] = self;
        v39 = -[CSSiriSpeechRecorder _startAudioPlaybackRequest:options:completion:](self, "_startAudioPlaybackRequest:options:completion:", v38, 3, v53);

        if ((v39 & 1) == 0)
        {
          -[CSSpeechController playRecordStartingAlertAndResetEndpointerWithAlertOverride:](self->_speechController, "playRecordStartingAlertAndResetEndpointerWithAlertOverride:", a4);
          -[CSEndpointAnalyzer setStartWaitTime:](self->_endpointAnalyzer, "setStartWaitTime:", 5.0);
          objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "logEventWithType:context:", 240, 0);

          objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "logTwoShotEndEventWithSuppresedAlert:withTimedOut:withMHUUID:", 0, 1, v11);

        }
        self->_didPerformTwoShotPrompt = 1;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "logTwoShotStartEventWithPromptType:withMHUUID:", 0, v11);

    objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "logTwoShotEndEventWithSuppresedAlert:withTimedOut:withMHUUID:", 0, 0, v11);

  }
  -[CSSiriSpeechRecorder _currentRecordingInfo](self, "_currentRecordingInfo");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setTriggeredTwoShotBorealis:", 1);
  -[CSSiriSpeechCapturingDelegate speechCapturingDidUpdateRecordingInfo:](self->_delegate, "speechCapturingDidUpdateRecordingInfo:", v42);

}

- (void)_playPhaticWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CSSiriSpeechCapturingDelegate *v6;
  CSSiriSpeechRecordingContext *v7;
  CSSiriSpeechRecordingContext *v8;
  _QWORD v9[4];
  CSSiriSpeechRecordingContext *v10;
  CSSiriSpeechRecorder *v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v14 = "-[CSSiriSpeechRecorder _playPhaticWithCompletion:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  v6 = self->_delegate;
  if (v6)
  {
    v7 = self->_context;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__CSSiriSpeechRecorder__playPhaticWithCompletion___block_invoke;
    v9[3] = &unk_1E7C28688;
    v10 = v7;
    v11 = self;
    v12 = v4;
    v8 = v7;
    -[CSSiriSpeechCapturingDelegate speechCapturing:performTwoShotPromptWithType:completion:](v6, "speechCapturing:performTwoShotPromptWithType:completion:", self, 2, v9);

LABEL_7:
    goto LABEL_8;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:description:underlyingError:", 15, CFSTR("delegate is nil"), 0);
    v8 = (CSSiriSpeechRecordingContext *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, CSSiriSpeechRecordingContext *, double, double))v4 + 2))(v4, v8, 0.0, 0.0);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_handleFakeTwoShotPromptTimeoutWithUUID:(id)a3
{
  NSUUID *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  AFWatchdogTimer *fakeTwoShotTTSPromptWatchdogTimer;
  NSUUID *v9;
  NSUUID *fakeTwoShotTTSPromptUUID;
  NSUUID *v11;
  int v12;
  const char *v13;
  __int16 v14;
  NSUUID *v15;
  __int16 v16;
  NSUUID *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (NSUUID *)a3;
  v5 = -[NSUUID isEqual:](self->_fakeTwoShotTTSPromptUUID, "isEqual:", v4);
  v6 = *MEMORY[0x1E0CFE6C0];
  v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
    {
      fakeTwoShotTTSPromptUUID = self->_fakeTwoShotTTSPromptUUID;
      v12 = 136315394;
      v13 = "-[CSSiriSpeechRecorder _handleFakeTwoShotPromptTimeoutWithUUID:]";
      v14 = 2112;
      v15 = fakeTwoShotTTSPromptUUID;
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Fake two shot TTS prompt timed out (%@).", (uint8_t *)&v12, 0x16u);
    }
    -[AFWatchdogTimer cancel](self->_fakeTwoShotTTSPromptWatchdogTimer, "cancel");
    fakeTwoShotTTSPromptWatchdogTimer = self->_fakeTwoShotTTSPromptWatchdogTimer;
    self->_fakeTwoShotTTSPromptWatchdogTimer = 0;

    v9 = self->_fakeTwoShotTTSPromptUUID;
    self->_fakeTwoShotTTSPromptUUID = 0;

  }
  else if (v7)
  {
    v11 = self->_fakeTwoShotTTSPromptUUID;
    v12 = 136315650;
    v13 = "-[CSSiriSpeechRecorder _handleFakeTwoShotPromptTimeoutWithUUID:]";
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v11;
    _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s Fake two shot TTS prompt timeout is not handled due to context mismatch (fakeTwoShotPromptUUID = %@, _fakeTwoShotPromptUUID = %@).", (uint8_t *)&v12, 0x20u);
  }

}

- (void)_handleFakeTwoShotPromptCallbackWithUUID:(id)a3 timestamp:(double)a4 duration:(double)a5 error:(id)a6
{
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  AFWatchdogTimer *fakeTwoShotTTSPromptWatchdogTimer;
  NSUUID *fakeTwoShotTTSPromptUUID;
  NSUUID *v16;
  int v17;
  const char *v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  v12 = -[NSUUID isEqual:](self->_fakeTwoShotTTSPromptUUID, "isEqual:", v10);
  v13 = *MEMORY[0x1E0CFE6C0];
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v17 = 136315906;
      v18 = "-[CSSiriSpeechRecorder _handleFakeTwoShotPromptCallbackWithUUID:timestamp:duration:error:]";
      v19 = 2048;
      v20 = a4;
      v21 = 2048;
      v22 = a5;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_INFO, "%s Fake two shot TTS prompt called back (timestamp = %f, duration = %f, error = %@)", (uint8_t *)&v17, 0x2Au);
    }
    -[CSEndpointAnalyzer reset](self->_endpointAnalyzer, "reset");
    -[CSEndpointAnalyzer setStartWaitTime:](self->_endpointAnalyzer, "setStartWaitTime:", 5.0);
    -[AFWatchdogTimer cancel](self->_fakeTwoShotTTSPromptWatchdogTimer, "cancel");
    fakeTwoShotTTSPromptWatchdogTimer = self->_fakeTwoShotTTSPromptWatchdogTimer;
    self->_fakeTwoShotTTSPromptWatchdogTimer = 0;

    fakeTwoShotTTSPromptUUID = self->_fakeTwoShotTTSPromptUUID;
    self->_fakeTwoShotTTSPromptUUID = 0;

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v16 = self->_fakeTwoShotTTSPromptUUID;
    v17 = 136315650;
    v18 = "-[CSSiriSpeechRecorder _handleFakeTwoShotPromptCallbackWithUUID:timestamp:duration:error:]";
    v19 = 2112;
    v20 = *(double *)&v10;
    v21 = 2112;
    v22 = *(double *)&v16;
    _os_log_error_impl(&dword_1C2614000, v13, OS_LOG_TYPE_ERROR, "%s Fake two shot TTS prompt callback is not handled due to context mismatch (fakeTwoShotPromptUUID = %@, _fakeTwoShotPromptUUID = %@).", (uint8_t *)&v17, 0x20u);
  }

}

- (id)_convertToAFSpeechPackage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  float v15;
  double v16;
  double v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "recognition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "af_speechPhrases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "af_speechUtterances");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0CFEA58]);
  objc_msgSend(v3, "processedAudioDuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v9 = (void *)objc_msgSend(v7, "initWithPhrases:utterances:processedAudioDuration:", v5, v6);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA20]), "initWithSpeechRecognitionFeatures:acousticFeatures:snr:", 0, 0, 1.0);
  objc_msgSend(v3, "latticeRnnMitigatorIsProcessed");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CFEA40]);
    objc_msgSend(v3, "latticeRnnMitigatorModelId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "latticeRnnMitigatorScore");
    v15 = v14;
    objc_msgSend(v3, "latticeRnnMitigatorThreshold");
    *(float *)&v17 = v16;
    *(float *)&v16 = v15;
    v11 = (void *)objc_msgSend(v12, "initWithResults:score:threshold:", v13, v16, v17);

  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFEA48]), "initWithRecognition:rawRecognition:audioAnalytics:isFinal:utteranceStart:latticeMitigatorResult:", v9, v9, v10, 1, v11, 0.0);

  return v18;
}

- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v9;
  id v10;
  os_log_t *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id lastEndpointHintCompletion;
  NSObject *v18;
  int v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  -[CSSiriSpeechRecorder _clearEndpointHint](self, "_clearEndpointHint");
  v11 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v12 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v13 = v12;
    objc_msgSend(v9, "processedAudioDuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v19 = 136315394;
    v20 = "-[CSSiriSpeechRecorder updateEndpointHintForRC:forceAccept:completion:]";
    v21 = 2048;
    v22 = v15;
    _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_INFO, "%s duration = %lf", (uint8_t *)&v19, 0x16u);

  }
  objc_storeStrong((id *)&self->_lastEndpointHintRC, a3);
  v16 = (void *)MEMORY[0x1C3BC4734](v10);

  lastEndpointHintCompletion = self->_lastEndpointHintCompletion;
  self->_lastEndpointHintCompletion = v16;

  if (self->_didDetectEndpoint && (unint64_t)(self->_endpointerOperationMode - 3) < 2
    || self->_serverDidEndpoint)
  {
    -[CSSiriSpeechRecorder _checkIfLastEndpointHintShouldBeAccepted:](self, "_checkIfLastEndpointHintShouldBeAccepted:", v6);
  }
  else
  {
    v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      v19 = 136315138;
      v20 = "-[CSSiriSpeechRecorder updateEndpointHintForRC:forceAccept:completion:]";
      _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_INFO, "%s No endpoint yet, waiting", (uint8_t *)&v19, 0xCu);
    }
  }

}

- (void)_checkIfLastEndpointHintShouldBeAccepted:(BOOL)a3
{
  SASResultCandidate *lastEndpointHintRC;
  _BOOL8 v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  void *v25;
  float v26;
  float v27;
  NSObject *v28;
  CSSpeechController *speechController;
  _QWORD v30[6];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  double v38;
  __int16 v39;
  int v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  lastEndpointHintRC = self->_lastEndpointHintRC;
  if (lastEndpointHintRC)
  {
    v5 = a3;
    -[SASResultCandidate processedAudioDuration](lastEndpointHintRC, "processedAudioDuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    if (v8 > 0.0)
    {
      -[CSSiriSpeechRecorder _convertToAFSpeechPackage:](self, "_convertToAFSpeechPackage:", self->_lastEndpointHintRC);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASResultCandidate resultId](self->_lastEndpointHintRC, "resultId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

      -[SASResultCandidate speechRecognitionTask](self->_lastEndpointHintRC, "speechRecognitionTask");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASResultCandidate refId](self->_lastEndpointHintRC, "refId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SASResultCandidate latticeRnnMitigatorIsProcessed](self->_lastEndpointHintRC, "latticeRnnMitigatorIsProcessed");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      objc_msgSend(v9, "latticeMitigatorResult");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "score");
      v18 = v17;

      objc_msgSend(v9, "latticeMitigatorResult");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "threshold");
      v21 = v20;

      objc_msgSend(v9, "latticeMitigatorResult");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "calibrationScale");
      v24 = v23;

      objc_msgSend(v9, "latticeMitigatorResult");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "calibrationOffset");
      v27 = v26;

      v28 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136317442;
        v32 = "-[CSSiriSpeechRecorder _checkIfLastEndpointHintShouldBeAccepted:]";
        v33 = 2048;
        v34 = v11;
        v35 = 2112;
        v36 = v13;
        v37 = 2048;
        v38 = v8;
        v39 = 1024;
        v40 = v15;
        v41 = 2048;
        v42 = v18;
        v43 = 2048;
        v44 = v21;
        v45 = 2048;
        v46 = v24;
        v47 = 2048;
        v48 = v27;
        v49 = 2112;
        v50 = v12;
        _os_log_impl(&dword_1C2614000, v28, OS_LOG_TYPE_INFO, "%s rcID: %lu, requestId: %@, duration: %lf, lrnnProcessed:%d lrnnScore: %f, lrnnThreshold: %f, calibrationScale: %f, calibrationOffset: %f, taskId: %@", buf, 0x62u);
      }
      speechController = self->_speechController;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __65__CSSiriSpeechRecorder__checkIfLastEndpointHintShouldBeAccepted___block_invoke;
      v30[3] = &unk_1E7C286D8;
      v30[4] = self;
      *(double *)&v30[5] = v8;
      -[CSSpeechController processRCWithId:requestId:speechPackage:taskId:forceAccept:completionHandler:](speechController, "processRCWithId:requestId:speechPackage:taskId:forceAccept:completionHandler:", v11, v13, v9, v12, v5, v30);

    }
  }
}

- (void)_clearEndpointHint
{
  id lastEndpointHintCompletion;
  id v4;
  SASResultCandidate *lastEndpointHintRC;
  NSArray *lastEndpointHintFeatures;

  lastEndpointHintCompletion = self->_lastEndpointHintCompletion;
  if (lastEndpointHintCompletion)
  {
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))lastEndpointHintCompletion + 2))(lastEndpointHintCompletion, 0, 0, 0);
    v4 = self->_lastEndpointHintCompletion;
    self->_lastEndpointHintCompletion = 0;

  }
  lastEndpointHintRC = self->_lastEndpointHintRC;
  self->_lastEndpointHintRC = 0;

  self->_lastEndpointHintRCProcessedForMitigation = 0;
  lastEndpointHintFeatures = self->_lastEndpointHintFeatures;
  self->_lastEndpointHintFeatures = 0;

}

- (void)_enforceEndpointHintWithMitigation:(BOOL)a3
{
  _BOOL8 v3;
  void (**lastEndpointHintCompletion)(id, uint64_t, _BOOL8, NSArray *);
  id v6;
  NSObject *v7;
  const char *v8;
  SASResultCandidate *lastEndpointHintRC;
  NSArray *lastEndpointHintFeatures;
  int v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  -[CSSiriSpeechRecorder _stopRecordingForEndpointReason:withEndpointMetrics:](self, "_stopRecordingForEndpointReason:withEndpointMetrics:", 4, 0);
  lastEndpointHintCompletion = (void (**)(id, uint64_t, _BOOL8, NSArray *))self->_lastEndpointHintCompletion;
  if (lastEndpointHintCompletion)
  {
    lastEndpointHintCompletion[2](lastEndpointHintCompletion, 1, v3, self->_lastEndpointHintFeatures);
    v6 = self->_lastEndpointHintCompletion;
    self->_lastEndpointHintCompletion = 0;

    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[CSSiriSpeechRecorder _enforceEndpointHintWithMitigation:]";
      v8 = "%s Enforce previous endpointHint";
LABEL_6:
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[CSSiriSpeechRecorder _enforceEndpointHintWithMitigation:]";
      v8 = "%s Got an enforce message without a current completion. Ignoring";
      goto LABEL_6;
    }
  }
  lastEndpointHintRC = self->_lastEndpointHintRC;
  self->_lastEndpointHintRC = 0;

  self->_lastEndpointHintRCProcessedForMitigation = 0;
  lastEndpointHintFeatures = self->_lastEndpointHintFeatures;
  self->_lastEndpointHintFeatures = 0;

}

- (void)enforcePreviousEndpointHint
{
  SASResultCandidate *lastEndpointHintRC;
  void *v4;
  uint64_t v5;
  void *v6;
  CSSpeechController *speechController;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_serverDidEndpoint = 1;
  lastEndpointHintRC = self->_lastEndpointHintRC;
  if (lastEndpointHintRC)
  {
    if (self->_lastEndpointHintRCProcessedForMitigation)
    {
      -[SASResultCandidate resultId](lastEndpointHintRC, "resultId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "integerValue");

      -[SASResultCandidate refId](self->_lastEndpointHintRC, "refId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      speechController = self->_speechController;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__CSSiriSpeechRecorder_enforcePreviousEndpointHint__block_invoke;
      v10[3] = &unk_1E7C284F8;
      v10[4] = self;
      -[CSSpeechController getMitigationDecisionForRCId:requestId:completion:](speechController, "getMitigationDecisionForRCId:requestId:completion:", v5, v6, v10);

    }
    else
    {
      v9 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "-[CSSiriSpeechRecorder enforcePreviousEndpointHint]";
        _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s Processing RC for mitigation, force accept", buf, 0xCu);
      }
      -[CSSiriSpeechRecorder _checkIfLastEndpointHintShouldBeAccepted:](self, "_checkIfLastEndpointHintShouldBeAccepted:", 1);
    }
  }
  else
  {
    v8 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSSiriSpeechRecorder enforcePreviousEndpointHint]";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s Got an enforce message without a current RC. Stop Recording", buf, 0xCu);
    }
    -[CSSiriSpeechRecorder _enforceEndpointHintWithMitigation:](self, "_enforceEndpointHintWithMitigation:", 0);
  }
}

- (void)setEndpointerThreshold:(double)a3
{
  *(float *)&a3 = a3;
  -[CSSpeechController updateEndpointerThreshold:](self->_speechController, "updateEndpointerThreshold:", a3);
}

- (void)setEndpointerDelayedTrigger:(BOOL)a3
{
  -[CSSpeechController updateEndpointerDelayedTrigger:](self->_speechController, "updateEndpointerDelayedTrigger:", a3);
}

- (void)setSpeechRecognizedContext:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (self->_didDetectEndpoint && self->_lastEndpointerMetrics)
  {
    -[CSEndpointDelayReporter setSpeechRecognizedContext:withEndpointerMetrics:](self->_endpointDelayReporter, "setSpeechRecognizedContext:withEndpointerMetrics:", v5);
    -[CSEndpointDelayReporter reportEndpointDelayIfNeed](self->_endpointDelayReporter, "reportEndpointDelayIfNeed");
  }
  else
  {
    objc_storeStrong((id *)&self->_speechRecognizedContextForServerEndpointInstrumentation, a3);
    -[CSSiriSpeechRecorder _reportServerEndpointMetricsIfNeeded](self, "_reportServerEndpointMetricsIfNeeded");
  }

}

- (void)performBlockAfterAlerts:(id)a3 timeout:(double)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  OS_dispatch_queue *queue;
  uint64_t v14;
  void *v15;
  NSObject *alertPlaybackGroup;
  NSObject *v17;
  id v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  _BYTE *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _BYTE *v27;
  _BYTE buf[24];
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v8 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder performBlockAfterAlerts:timeout:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a4;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s timeout = %f", buf, 0x16u);
    }
    if (self->_alertPlaybackGroup)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v29 = __Block_byref_object_copy__24421;
      v30 = __Block_byref_object_dispose__24422;
      v31 = 0;
      v9 = objc_alloc(MEMORY[0x1E0CFE998]);
      v10 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke;
      v25[3] = &unk_1E7C28700;
      v27 = buf;
      v26 = v6;
      v11 = (void *)objc_msgSend(v9, "initWithBlock:", v25);
      if (a4 > 0.0)
      {
        v12 = objc_alloc(MEMORY[0x1E0CFEAC8]);
        queue = self->_queue;
        v23[0] = v10;
        v23[1] = 3221225472;
        v23[2] = __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke_200;
        v23[3] = &unk_1E7C292C8;
        v24 = v11;
        v14 = objc_msgSend(v12, "initWithTimeoutInterval:onQueue:timeoutHandler:", queue, v23, a4);
        v15 = *(void **)(*(_QWORD *)&buf[8] + 40);
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v14;

        objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "start");
      }
      alertPlaybackGroup = self->_alertPlaybackGroup;
      v17 = self->_queue;
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke_2;
      block[3] = &unk_1E7C29228;
      v21 = v11;
      v22 = buf;
      v18 = v11;
      dispatch_group_notify(alertPlaybackGroup, v17, block);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v19 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecorder performBlockAfterAlerts:timeout:]";
        _os_log_impl(&dword_1C2614000, v19, OS_LOG_TYPE_INFO, "%s Done", buf, 0xCu);
      }
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }

}

- (void)setEARLanguageDetectorSpeechRequestId:(id)a3
{
  -[CSSpeechController setLanguageDetectorInteractionID:](self->_speechController, "setLanguageDetectorInteractionID:", a3);
}

- (void)acousticFingerprinter:(id)a3 hasFingerprint:(id)a4 duration:(double)a5
{
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v12;
  double v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "-[CSSiriSpeechRecorder acousticFingerprinter:hasFingerprint:duration:]";
    v16 = 2048;
    v17 = a5;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s duration %lf", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__CSSiriSpeechRecorder_acousticFingerprinter_hasFingerprint_duration___block_invoke;
  block[3] = &unk_1E7C28B58;
  block[4] = self;
  v12 = v7;
  v13 = a5;
  v10 = v7;
  dispatch_async(queue, block);

}

- (BOOL)_startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  OS_dispatch_group *v10;
  NSObject *v11;
  CSSiriSpeechRecordingContext *v12;
  CSSiriAudioPlaybackService *audioPlaybackService;
  OS_dispatch_group *v14;
  CSSiriSpeechRecordingContext *v15;
  _QWORD v17[4];
  id v18;
  CSSiriSpeechRecordingContext *v19;
  OS_dispatch_group *v20;
  CSSiriSpeechRecorder *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    v10 = self->_alertPlaybackGroup;
    if (!v10)
    {
      v10 = (OS_dispatch_group *)dispatch_group_create();
      objc_storeStrong((id *)&self->_alertPlaybackGroup, v10);
    }
    dispatch_group_enter((dispatch_group_t)v10);
    v11 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CSSiriSpeechRecorder _startAudioPlaybackRequest:options:completion:]";
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s Starting audio playback request %@...", buf, 0x16u);
    }
    v12 = self->_context;
    audioPlaybackService = self->_audioPlaybackService;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__CSSiriSpeechRecorder__startAudioPlaybackRequest_options_completion___block_invoke;
    v17[3] = &unk_1E7C28728;
    v18 = v8;
    v19 = v12;
    v20 = v10;
    v21 = self;
    v22 = v9;
    v14 = v10;
    v15 = v12;
    -[CSSiriAudioPlaybackService startRequest:options:completion:](audioPlaybackService, "startRequest:options:completion:", v18, a4, v17);

  }
  return v8 != 0;
}

- (void)speakerIdentificationDidDetectSpeakerWithScores:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v33 = "-[CSSiriSpeechRecorder speakerIdentificationDidDetectSpeakerWithScores:]";
    v34 = 2113;
    v35 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s scores = %{private}@", buf, 0x16u);
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("spIdAudioProcessedDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("spIdUnknownUserScore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("spIdKnownUserScores"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("spIdUserScoresVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("spIdScoreThresholdingType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("spIdAssetVersion"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("userIdentityClassification"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("userClassified"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CSSiriSpeechRecorder_speakerIdentificationDidDetectSpeakerWithScores___block_invoke;
  block[3] = &unk_1E7C28790;
  block[4] = self;
  v24 = v9;
  v29 = v8;
  v30 = v22;
  v31 = v11;
  v25 = v16;
  v26 = v12;
  v27 = v13;
  v28 = v15;
  v18 = v13;
  v19 = v12;
  v20 = v16;
  v21 = v9;
  dispatch_async(queue, block);

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionInterruptionNotificationWithUserInfo:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E7C292A0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __115__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E7C292A0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *queue;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionOwnerLostNotification:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionOwnerLostNotification___block_invoke;
  v9[3] = &unk_1E7C292A0;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  dispatch_async(queue, v9);

}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionOwnerResetNotification:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v6, 0x16u);
  }

}

- (unsigned)_audioDeviceID
{
  return 0;
}

- (BOOL)suppressInterruptionEndedNotifications
{
  return self->_suppressInterruptionEndedNotifications;
}

- (void)setSuppressInterruptionEndedNotifications:(BOOL)a3
{
  self->_suppressInterruptionEndedNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mhUUID, 0);
  objc_storeStrong((id *)&self->_experimentContext, 0);
  objc_storeStrong((id *)&self->_bluetoothWirelessSplitterSessionStateObserver, 0);
  objc_storeStrong((id *)&self->_numberOfAVVCAlertPlaybacksByType, 0);
  objc_storeStrong((id *)&self->_alertPlaybackGroup, 0);
  objc_storeStrong((id *)&self->_currentClientConfiguration, 0);
  objc_storeStrong((id *)&self->_mostRecentSpeechSynthesisRecord, 0);
  objc_storeStrong((id *)&self->_lastEndpointHintRC, 0);
  objc_storeStrong(&self->_lastEndpointHintCompletion, 0);
  objc_storeStrong((id *)&self->_lastEndpointHintFeatures, 0);
  objc_storeStrong((id *)&self->_endpointDelayReporter, 0);
  objc_storeStrong((id *)&self->_lastEndpointerMetrics, 0);
  objc_storeStrong((id *)&self->_fakeTwoShotTTSPromptWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_speechRecordingEventListenerConnection, 0);
  objc_storeStrong((id *)&self->_recordDevice, 0);
  objc_storeStrong((id *)&self->_recordingWillStartGroup, 0);
  objc_storeStrong((id *)&self->_speechRecognizedContextForServerEndpointInstrumentation, 0);
  objc_storeStrong((id *)&self->_fakeTwoShotTTSPromptUUID, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_audioFileHandle, 0);
  objc_storeStrong((id *)&self->_fingerprinter, 0);
  objc_storeStrong((id *)&self->_currentAudioDeviceInfo, 0);
  objc_storeStrong((id *)&self->_pendingActivationInfo, 0);
  objc_storeStrong((id *)&self->_currentActivationInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_endpointAnalyzer, 0);
  objc_storeStrong((id *)&self->_extendedEndpointTimer, 0);
  objc_storeStrong((id *)&self->_audioPlaybackService, 0);
  objc_storeStrong((id *)&self->_audioSessionController, 0);
  objc_storeStrong((id *)&self->_speechController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

uint64_t __91__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionOwnerLostNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechCapturing:didLoseAudioSessionOwnerOrMediaServices:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __115__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechCapturing:didLoseAudioSessionOwnerOrMediaServices:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechCapturing:didInterruptAudioSession:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_currentMHUUID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_2;
  v6[3] = &unk_1E7C28348;
  v6[4] = v3;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v4, "fetchAudioMetricsWithCompletion:", v6);

}

void __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_3;
  block[3] = &unk_1E7C291C0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logAudioMetrics:mhUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __72__CSSiriSpeechRecorder_speakerIdentificationDidDetectSpeakerWithScores___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "speechCapturingDidProvideConfidenceScores:classification:classifiedUser:unknownUserScore:duration:version:thresholdingType:assetVersion:", a1[5], a1[9], a1[6], a1[10], a1[11], a1[12], a1[7], a1[8]);
}

void __70__CSSiriSpeechRecorder__startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6C0];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v13 = "-[CSSiriSpeechRecorder _startAudioPlaybackRequest:options:completion:]_block_invoke";
      v14 = 2112;
      v15 = v5;
      v16 = 2112;
      v17 = v3;
      _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s Failed audio playback request %@ due to error %@.", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v13 = "-[CSSiriSpeechRecorder _startAudioPlaybackRequest:options:completion:]_block_invoke";
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s Stopped audio playback request %@.", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "instrumentSiriCue:", 1);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  v7 = *(void **)(a1 + 64);
  if (v7)
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 16);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__CSSiriSpeechRecorder__startAudioPlaybackRequest_options_completion___block_invoke_201;
    v9[3] = &unk_1E7C29150;
    v11 = v7;
    v10 = v3;
    dispatch_async(v8, v9);

  }
}

uint64_t __70__CSSiriSpeechRecorder__startAudioPlaybackRequest_options_completion___block_invoke_201(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __70__CSSiriSpeechRecorder_acousticFingerprinter_hasFingerprint_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechCapturing:didReceiveFingerprint:duration:", *(double *)(a1 + 48));
}

void __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    objc_msgSend(v4, "cancel");
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
  v7 = *MEMORY[0x1E0CFE6C0];
  v8 = *MEMORY[0x1E0CFE6C0];
  if (a2 == -2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSSiriSpeechRecorder performBlockAfterAlerts:timeout:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v7, OS_LOG_TYPE_ERROR, "%s Watchdog timer timed out.", (uint8_t *)&v11, 0xCu);
    }
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:", 224);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 136315138;
      v12 = "-[CSSiriSpeechRecorder performBlockAfterAlerts:timeout:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s Done", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke_200(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", -2);
}

uint64_t __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "cancel");
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithSignal:", 0);
}

void __51__CSSiriSpeechRecorder_enforcePreviousEndpointHint__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__CSSiriSpeechRecorder_enforcePreviousEndpointHint__block_invoke_2;
  v4[3] = &unk_1E7C28480;
  v4[4] = v2;
  v5 = a2;
  dispatch_async(v3, v4);
}

uint64_t __51__CSSiriSpeechRecorder_enforcePreviousEndpointHint__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enforceEndpointHintWithMitigation:", *(unsigned __int8 *)(a1 + 40));
}

void __65__CSSiriSpeechRecorder__checkIfLastEndpointHintShouldBeAccepted___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  char v14;
  char v15;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 16);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__CSSiriSpeechRecorder__checkIfLastEndpointHintShouldBeAccepted___block_invoke_2;
  v11[3] = &unk_1E7C286B0;
  v14 = a2;
  v15 = a3;
  v13 = *(_QWORD *)(a1 + 40);
  v11[4] = v8;
  v12 = v7;
  v10 = v7;
  dispatch_async(v9, v11);

}

void __65__CSSiriSpeechRecorder__checkIfLastEndpointHintShouldBeAccepted___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v3 = *(unsigned __int8 *)(a1 + 56);
    v4 = *(unsigned __int8 *)(a1 + 57);
    v5 = *(_QWORD *)(a1 + 48);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
    v7 = v2;
    objc_msgSend(v6, "processedAudioDuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v14 = 136316162;
    v15 = "-[CSSiriSpeechRecorder _checkIfLastEndpointHintShouldBeAccepted:]_block_invoke_2";
    v16 = 1024;
    v17 = v3;
    v18 = 1024;
    v19 = v4;
    v20 = 2048;
    v21 = v5;
    v22 = 2048;
    v23 = v9;
    _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s Eager results - shouldAccept: %d, isMitigated: %d Duration: %lf last duration: %lf", (uint8_t *)&v14, 0x2Cu);

  }
  v10 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "processedAudioDuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (v10 == v13)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 416), *(id *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 440) = 1;
    if (*(_BYTE *)(a1 + 56))
      objc_msgSend(*(id *)(a1 + 32), "_enforceEndpointHintWithMitigation:", *(unsigned __int8 *)(a1 + 57));
  }
}

void __50__CSSiriSpeechRecorder__playPhaticWithCompletion___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  double v14;
  double v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *MEMORY[0x1E0CFE6C0];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CSSiriSpeechRecorder _playPhaticWithCompletion:]_block_invoke";
      v18 = 2112;
      v19 = v7;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSSiriSpeechRecorder _playPhaticWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s done", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "instrumentSiriCue:", 2);
  }
  v9 = *(void **)(a1 + 48);
  if (v9)
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 16);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __50__CSSiriSpeechRecorder__playPhaticWithCompletion___block_invoke_191;
    v11[3] = &unk_1E7C28660;
    v13 = v9;
    v14 = a3;
    v15 = a4;
    v12 = v7;
    dispatch_async(v10, v11);

  }
}

uint64_t __50__CSSiriSpeechRecorder__playPhaticWithCompletion___block_invoke_191(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, double, double))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "reset");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setStartWaitTime:", 5.0);
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventWithType:context:", 240, 0);

}

void __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logEventWithType:context:", 240, &unk_1E7C64C00);

  objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logTwoShotEndEventWithSuppresedAlert:withTimedOut:withMHUUID:", 0, 1, *(_QWORD *)(a1 + 32));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleFakeTwoShotPromptTimeoutWithUUID:", *(_QWORD *)(a1 + 40));

}

uint64_t __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke_190(uint64_t a1, void *a2, double a3, double a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t result;

  v7 = (void *)MEMORY[0x1E0CFE7D8];
  v8 = a2;
  objc_msgSend(v7, "sharedAnalytics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "logEventWithType:context:", 240, 0);

  objc_msgSend(MEMORY[0x1E0D19120], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logTwoShotEndEventWithSuppresedAlert:withTimedOut:withMHUUID:", 0, 0, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "_handleFakeTwoShotPromptCallbackWithUUID:timestamp:duration:error:", *(_QWORD *)(a1 + 48), v8, a3, a4);
  result = *(_QWORD *)(a1 + 40);
  if (v8 && (unint64_t)(*(_QWORD *)(result + 184) - 1) <= 1)
  {
    objc_msgSend((id)result, "_performTwoShotPromptForType:withOverride:atTime:", 1, *(_QWORD *)(a1 + 56), *(double *)(a1 + 64));
    result = *(_QWORD *)(a1 + 40);
  }
  *(_BYTE *)(result + 232) = 1;
  return result;
}

id __75__CSSiriSpeechRecorder_endpointer_didDetectHardEndpointAtTime_withMetrics___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, CFSTR("time"));

  objc_msgSend(*(id *)(a1 + 32), "additionalMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("additionalMetrics"));

  return v2;
}

void __75__CSSiriSpeechRecorder_endpointer_didDetectHardEndpointAtTime_withMetrics___block_invoke_178(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  double v16;
  __int16 v17;
  double v18;
  __int16 v19;
  double v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 88) != *(_QWORD *)(a1 + 40))
  {
    v2 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      return;
    v13 = 136315138;
    v14 = "-[CSSiriSpeechRecorder endpointer:didDetectHardEndpointAtTime:withMetrics:]_block_invoke";
    v3 = "%s Ignoring hard endpoint from stale CSEndpointAnalyzer";
    v4 = v2;
    v5 = 12;
    goto LABEL_4;
  }
  objc_msgSend(*(id *)(v1 + 448), "endTimestamp");
  AFMachAbsoluteTimeGetTimeInterval();
  v8 = *(_QWORD *)(a1 + 32);
  if ((*(_QWORD *)(v8 + 64) & 0xFFFFFFFFFFFFFFFBLL) != 1
    || (v9 = v7, v10 = *(double *)(v8 + 248), v10 >= v7)
    || (v11 = *(double *)(a1 + 56), v11 >= v7 - v10 + 0.5))
  {
    objc_msgSend((id)v8, "_hardEndpointWasDetectedWithMetrics:atTime:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    return;
  }
  v12 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v13 = 136316162;
    v14 = "-[CSSiriSpeechRecorder endpointer:didDetectHardEndpointAtTime:withMetrics:]_block_invoke";
    v15 = 2048;
    v16 = v11;
    v17 = 2048;
    v18 = v10;
    v19 = 2048;
    v20 = v9;
    v21 = 2048;
    v22 = 0x3FE0000000000000;
    v3 = "%s Ignoring hard endpoint because (endpointTime = %f, firstBufferTimestamp = %f, mostRecentTTSEndTimestamp = %f"
         ", extendedSuppressDuration = %f).";
    v4 = v12;
    v5 = 52;
LABEL_4:
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, v3, (uint8_t *)&v13, v5);
  }
}

void __61__CSSiriSpeechRecorder_endpointer_didDetectStartpointAtTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 88) == *(_QWORD *)(a1 + 40))
  {
    *(_BYTE *)(v1 + 202) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechCapturing:didDetectStartpointAtTime:", *(double *)(a1 + 48));
  }
  else
  {
    v2 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v3 = 136315138;
      v4 = "-[CSSiriSpeechRecorder endpointer:didDetectStartpointAtTime:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_INFO, "%s Ignoring startpoint from stale CSEndpointAnalyzer", (uint8_t *)&v3, 0xCu);
    }
  }
}

uint64_t __75__CSSiriSpeechRecorder_speechControllerDidUpdateSmartSiriVolume_forReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechCapturingDidRequestUpdateSiriOutputVolume:");
}

uint64_t __80__CSSiriSpeechRecorder__speechControllerRequestsOperation_forReason_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__CSSiriSpeechRecorder__speechControllerRequestsOperation_forReason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __79__CSSiriSpeechRecorder_speechControllerRequestsOperation_forReason_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_speechControllerRequestsOperation:forReason:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
}

uint64_t __68__CSSiriSpeechRecorder_speechControllerRequestsOperation_forReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_speechControllerRequestsOperation:forReason:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

uint64_t __58__CSSiriSpeechRecorder_suppressUtteranceGradingIfRequired__block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
    v3 = 1;
  else
    v3 = 2;
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder suppressUtteranceGradingIfRequired]_block_invoke";
    v8 = 2048;
    v9 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s BTLE speech controller end waiting for Myriad decision %lu", (uint8_t *)&v6, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "endWaitingForMyriadWithDecision:", v3);
}

void __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 203) && *(_QWORD *)(v1 + 184) == 2)
  {
    v3 = *(_QWORD *)(v1 + 112);
    if (!v3)
      v3 = *(_QWORD *)(v1 + 104);
    objc_msgSend(*(id *)(v1 + 96), "didDetectTwoShotWithAudioActivationInfo:atTime:", v3, *(double *)(a1 + 40));
    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 32), "_currentRecordRoute");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_currentPlaybackRoute");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "twoShotPromptTypeForRecordRoute:playbackRoute:", v10, v4);
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
      v7 = CSSupportsVibrator();
      v8 = objc_msgSend(v6, "twoShotFeedbackAlertOverrideForRecordRoute:playbackRoute:deviceSupportsVibrator:deviceSupportsEC:", v10, v4, v7, MEMORY[0x1C3BC3858]());
      v9 = *(_QWORD *)(a1 + 32);
      if (v5 && *(_QWORD *)(v9 + 176) != 17)
        objc_msgSend((id)v9, "_performTwoShotPromptForType:withOverride:atTime:", v5, v8, *(double *)(a1 + 40));
      else
        *(_BYTE *)(v9 + 204) = 1;

    }
  }
}

void __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  id *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((AFIsHorseman() & 1) != 0 || *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) == 15)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v2 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSSiriSpeechRecorder speechControllerDidDetectVoiceTriggerTwoShot:atTime:wantsAudibleFeedback:]_block_invoke_2";
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_INFO, "%s BTLE waiting for Myriad to finish", buf, 0xCu);
    }
    v3 = objc_msgSend(MEMORY[0x1E0D19260], "supportsSCDAFramework");
    v4 = (id *)0x1E0D97CF0;
    if (!v3)
      v4 = (id *)0x1E0CFE948;
    objc_msgSend(*v4, "sharedMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_167;
    v7[3] = &unk_1E7C284D0;
    v6 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v6;
    objc_msgSend(v5, "waitForMyriadDecisionForReason:withCompletion:", CFSTR("Two shot feedback"), v7);

  }
}

void __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_167(uint64_t a1, int a2)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_2_168;
    block[3] = &unk_1E7C28F10;
    v6 = v2;
    dispatch_async(v3, block);

  }
  else
  {
    v4 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[CSSiriSpeechRecorder speechControllerDidDetectVoiceTriggerTwoShot:atTime:wantsAudibleFeedback:]_block_invoke";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s BTLE Myriad loss cancelled two shot feedback", buf, 0xCu);
    }
  }
}

uint64_t __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_2_168(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__CSSiriSpeechRecorder_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechCapturing:didDetectLanguage:confidenceScores:isConfident:");
}

void __76__CSSiriSpeechRecorder_speechControllerDidFinishAlertPlayback_ofType_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_shouldEmitInstrumentation"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "instrumentSiriCueForAlertType:", *(_QWORD *)(a1 + 48));
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 472);
  if (!v2)
  {
    v10 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]_block_invoke";
    v11 = "%s numberOfAVVCAlertPlaybacksByType is nil.";
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (!v5)
  {
    v14 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      return;
    v15 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 136315394;
    v20 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]_block_invoke";
    v21 = 2048;
    v22 = v15;
    v11 = "%s numberOfAVVCAlertPlaybacksByType does not have AVVC alert playbacks of type %ld.";
    v12 = v14;
    v13 = 22;
LABEL_14:
    _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return;
  }
  v6 = v5 - 1;
  if (v5 != 1)
  {
    v16 = *(void **)(*(_QWORD *)(a1 + 40) + 472);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v18, v17);

    return;
  }
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 472);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  v9 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 464);
  if (v9)
  {
    dispatch_group_leave(v9);
    return;
  }
  v10 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]_block_invoke";
    v11 = "%s alertPlaybackGroup is nil.";
LABEL_11:
    v12 = v10;
    v13 = 12;
    goto LABEL_14;
  }
}

uint64_t __66__CSSiriSpeechRecorder_speechController_didSetAudioSessionActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechCapturing:didSetAudioSessionActive:");
}

uint64_t __67__CSSiriSpeechRecorder_speechController_willSetAudioSessionActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "speechCapturing:willSetAudioSessionActive:");
}

uint64_t __84__CSSiriSpeechRecorder_speechControllerLPCMRecordBufferAvailable_buffer_recordedAt___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 64) == 4)
  {
    objc_msgSend((id)v2, "_fingerprinter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendPCMData:", *(_QWORD *)(a1 + 40));

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 235))
  {
    v4 = mach_absolute_time();
    v5 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v5 + 200))
    {
      v6 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "_currentMHUUID:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "_speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:atHostTime:mhUUID:", v6, v4, v7);

      v5 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v5 + 384) = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392) = v4;
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 8), "speechCapturingDidRecordPCMAudioData:", *(_QWORD *)(a1 + 40));
}

uint64_t __84__CSSiriSpeechRecorder_speechControllerLPCMRecordBufferAvailable_buffer_recordedAt___block_invoke_158(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "appendAudioData:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "appendRecordedAudioBuffer:", *(_QWORD *)(a1 + 40));
}

void __111__CSSiriSpeechRecorder_speechControllerRecordBufferAvailable_buffers_durationInSec_recordedAt_audioDeviceInfo___block_invoke(uint64_t a1)
{
  int v2;
  os_log_t *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  os_signpost_id_t v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  os_log_t v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  os_signpost_id_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v2 = AFIsInternalInstall();
  v3 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  if (v2)
  {
    v4 = (id)*MEMORY[0x1E0CFE6C0];
    v5 = os_signpost_id_generate(*v3);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        LOWORD(v31) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v4, OS_SIGNPOST_EVENT, v6, "SpeechRecorder", "RecordBufferHandleBegin", (uint8_t *)&v31, 2u);
      }
    }

  }
  kdebug_trace();
  objc_msgSend(*(id *)(a1 + 32), "_currentMHUUID:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD **)(a1 + 32);
  v9 = v8[23];
  if (v9)
  {
    if (v9 == 1)
      objc_msgSend(v8, "_speechControllerDidStartRecording:successfully:error:", *(_QWORD *)(a1 + 40), 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logEventWithType:context:", 237, 0);

    objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logMHAssistantDaemonAudioRecordingMissedBufferDetectedWithMHUUID:", v7);

  }
  v12 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v12 + 200))
  {
    objc_msgSend((id)v12, "_speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:atHostTime:mhUUID:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v7);
    v12 = *(_QWORD *)(a1 + 32);
  }
  *(_QWORD *)(v12 + 384) = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392) = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(float *)(a1 + 72);
  v15 = *(double *)(v13 + 280) + v14;
  if (v15 > 60.0)
  {
    v20 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG))
    {
      v27 = *(_QWORD *)(a1 + 56);
      v28 = v20;
      AFMachAbsoluteTimeGetTimeInterval();
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280);
      v31 = 136316162;
      v32 = "-[CSSiriSpeechRecorder speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:audioDeviceInf"
            "o:]_block_invoke";
      v33 = 2048;
      v34 = v14;
      v35 = 2048;
      v36 = v27;
      v37 = 2048;
      v38 = v30;
      v39 = 2048;
      v40 = v29;
      _os_log_debug_impl(&dword_1C2614000, v28, OS_LOG_TYPE_DEBUG, "%s Dropped %f seconds of audio buffers recorded at %llu (%f seconds) due to audio recording restriction (accumulatedBufferDuration = %f seconds).", (uint8_t *)&v31, 0x34u);

      v13 = *(_QWORD *)(a1 + 32);
      v15 = *(double *)(v13 + 280) + *(float *)(a1 + 72);
    }
    *(double *)(v13 + 280) = v15;
  }
  else
  {
    *(double *)(v13 + 280) = v15;
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v17 = objc_msgSend(*(id *)(a1 + 48), "count") + v16;
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v19 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C89B10], "secondsForHostTime:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v18, "speechCapturingDidRecordSpeechPackets:atTimestamp:totalPacketCount:", v19, v17);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = v17;
  }
  if (AFIsATV())
  {
    AFMachAbsoluteTimeGetTimeInterval();
    if (v21 < *(double *)(*(_QWORD *)(a1 + 32) + 336))
    {
      objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logEventWithType:machAbsoluteTime:context:contextNoCopy:", 218, *(_QWORD *)(a1 + 64), 0, 0);

      objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logMHAssistantDaemonAudioLateBufferDetectedWithMHUUID:withBufferReceiptTimeInNs:", v7, objc_msgSend(MEMORY[0x1E0D19118], "hostTimeToNs:", *(_QWORD *)(a1 + 64)));

    }
  }
  if (AFIsInternalInstall())
  {
    v24 = *v3;
    v25 = os_signpost_id_generate(*v3);
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v26 = v25;
      if (os_signpost_enabled(v24))
      {
        LOWORD(v31) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v24, OS_SIGNPOST_EVENT, v26, "SpeechRecorder", "RecordBufferHandleEnd", (uint8_t *)&v31, 2u);
      }
    }

  }
  kdebug_trace();

}

void __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_2;
  v7[3] = &unk_1E7C292A0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_145(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;

  v6 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(NSObject **)(v8 + 16);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_2_146;
  v13[3] = &unk_1E7C28408;
  v13[4] = v8;
  v14 = v6;
  v15 = v7;
  v16 = v9;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, v13);

}

void __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_2_146(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(a1[4] + 8), "speechCapturing:didFinishWritingAudioFile:error:", a1[4], a1[5], a1[6]);
  v2 = *(_QWORD *)(a1[7] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

void __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpeechEndHostTime:e"
         "rrorCodeOverride:underlyingError:]_block_invoke_2";
    v8 = 2112;
    v9 = v2;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s audioMetrics = %@", (uint8_t *)&v6, 0x16u);
  }
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C89A10]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C89A28]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 40), "setAudioSessionSetActiveEndHostTime:", objc_msgSend(v5, "unsignedLongLongValue"));

  }
}

void __110__CSSiriSpeechRecorder_speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 32) == *(_QWORD *)(a1 + 40) && *(_QWORD *)(v1 + 184) == 1)
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[CSSiriSpeechRecorder speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpeechEndHostTime:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Synthesizing a didStart callback, on missing didStart", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CFE8B0], "errorWithCode:", 217);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_speechControllerDidStartRecording:successfully:error:", *(_QWORD *)(a1 + 40), 0, v4);

  }
}

uint64_t __110__CSSiriSpeechRecorder_speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime___block_invoke_142(uint64_t a1)
{
  os_log_t *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  os_signpost_id_t v5;
  uint8_t v7[16];

  if (AFIsInternalInstall())
  {
    v2 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v3 = (id)*MEMORY[0x1E0CFE6C0];
    v4 = os_signpost_id_generate(*v2);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C2614000, v3, OS_SIGNPOST_EVENT, v5, "SpeechRecorder", "AudioStop", v7, 2u);
      }
    }

  }
  kdebug_trace();
  return objc_msgSend(*(id *)(a1 + 32), "_speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpeechEndHostTime:errorCodeOverride:underlyingError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, 0);
}

uint64_t __98__CSSiriSpeechRecorder_speechControllerDidDeliverLastBuffer_forReason_estimatedSpeechEndHostTime___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (!*(_BYTE *)(result + 201))
    return objc_msgSend((id)result, "_speechControllerDidReceiveLastAudioRecordBuffer:forReason:estimatedSpeechEndHostTime:isRecordingStopped:", a1[5], a1[6], a1[7], *(_QWORD *)(result + 184) == 0);
  return result;
}

uint64_t __93__CSSiriSpeechRecorder_speechControllerDidStartRecording_audioDeviceInfo_successfully_error___block_invoke(uint64_t result)
{
  _QWORD *v1;
  _QWORD *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v1 = (_QWORD *)result;
  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(result + 32);
  if (v2[23] == 1)
    return objc_msgSend(*(id *)(result + 32), "_speechControllerDidStartRecording:successfully:error:", *(_QWORD *)(result + 40), *(unsigned __int8 *)(result + 64), *(_QWORD *)(result + 48));
  if (!*(_BYTE *)(result + 64))
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[CSSiriSpeechRecorder speechControllerDidStartRecording:audioDeviceInfo:successfully:error:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s Got a speech start failure after we already got audio buffers?!", (uint8_t *)&v4, 0xCu);
      v2 = (_QWORD *)v1[4];
    }
    return objc_msgSend(v2, "_speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpeechEndHostTime:errorCodeOverride:underlyingError:", v1[5], v1[7], 0, 0, 200, v1[6]);
  }
  return result;
}

void __47__CSSiriSpeechRecorder_playRecordingStartAlert__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  dispatch_group_t v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  dispatch_group_t v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 184) == 2 && objc_msgSend(*(id *)(v1 + 104), "shouldPlayAlertIfNotPrelistening"))
  {
    v3 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[CSSiriSpeechRecorder playRecordingStartAlert]_block_invoke";
      _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    v4 = (dispatch_group_t)*(id *)(*(_QWORD *)(a1 + 32) + 464);
    if (!v4)
    {
      v4 = dispatch_group_create();
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 464), v4);
    }
    dispatch_group_enter(v4);
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__CSSiriSpeechRecorder_playRecordingStartAlert__block_invoke_123;
    v8[3] = &unk_1E7C292A0;
    v9 = v5;
    v10 = v4;
    v6 = v4;
    v7 = v5;
    AudioServicesPlaySystemSoundWithCompletion(0x57Cu, v8);

  }
}

void __47__CSSiriSpeechRecorder_playRecordingStartAlert__block_invoke_123(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "instrumentSiriCue:", 3);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __53__CSSiriSpeechRecorder__speechRecordingEventListener__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "-[CSSiriSpeechRecorder _speechRecordingEventListener]_block_invoke";
    v6 = 2114;
    v7 = v2;
    _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v4, 0x16u);
  }

}

void __43__CSSiriSpeechRecorder_releaseAudioSession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CSSiriSpeechRecorder_releaseAudioSession__block_invoke_2;
  block[3] = &unk_1E7C291C0;
  block[4] = v4;
  v9 = v3;
  v10 = v5;
  v7 = v3;
  dispatch_async(v6, block);

}

uint64_t __43__CSSiriSpeechRecorder_releaseAudioSession__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logAudioMetrics:mhUUID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __53__CSSiriSpeechRecorder__logBluetoothStateWithMHUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 480);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CSSiriSpeechRecorder__logBluetoothStateWithMHUUID___block_invoke_2;
  v7[3] = &unk_1E7C282F8;
  v10 = v3;
  v8 = v4;
  v9 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v5, "getStateWithCompletion:", v7);

}

void __53__CSSiriSpeechRecorder__logBluetoothStateWithMHUUID___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a1[6];
  v8 = CFSTR("state");
  AFBluetoothWirelessSplitterSessionStateGetName();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logMHAssistantDaemonAudioBluetoothInfoWithMHUUID:withWirelessSplitterSessionState:withAudioDeviceCategory:", a1[4], a2, a1[5]);

}

void __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if ((unint64_t)(*(_QWORD *)(v4 + 184) - 1) <= 1)
    {
      v9 = v3;
      objc_msgSend(*(id *)(v4 + 88), "reset");
      objc_msgSend(*(id *)(a1 + 40), "_setEndpointStyle:", 2 * ((unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 192) - 3) > 1));
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 88);
      v7 = *(double *)(v5 + 272);
      objc_msgSend(*(id *)(v5 + 104), "activationSystemUptime");
      objc_msgSend(v6, "setDelay:", v7 - v8);
      v3 = v9;
    }
  }

}

void __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke_91(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setItemURL:", v2);
  objc_msgSend(v4, "setNumberOfLoops:", 0);
  LODWORD(v3) = 1.0;
  objc_msgSend(v4, "setVolume:", v3);
  objc_msgSend(v4, "setFadeInDuration:", 0.0);
  objc_msgSend(v4, "setFadeOutDuration:", 0.0);

}

void __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
  {
    v4 = *(_QWORD *)(a1 + 40);
    if ((unint64_t)(*(_QWORD *)(v4 + 184) - 1) <= 1)
    {
      v9 = v3;
      objc_msgSend(*(id *)(v4 + 88), "reset");
      objc_msgSend(*(id *)(a1 + 40), "_setEndpointStyle:", 2 * ((unint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 192) - 3) > 1));
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(void **)(v5 + 88);
      v7 = *(double *)(v5 + 272);
      objc_msgSend(*(id *)(v5 + 104), "activationSystemUptime");
      objc_msgSend(v6, "setDelay:", v7 - v8);
      v3 = v9;
    }
  }

}

void __42__CSSiriSpeechRecorder_preheatWithOption___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = *MEMORY[0x1E0CFE6C0];
  v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      v8 = 136315394;
      v9 = "-[CSSiriSpeechRecorder preheatWithOption:]_block_invoke";
      v10 = 2112;
      v11 = v2;
      v5 = "%s Failed to prewarm start alert due to %@";
      v6 = v3;
      v7 = 22;
LABEL_7:
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    v8 = 136315138;
    v9 = "-[CSSiriSpeechRecorder preheatWithOption:]_block_invoke";
    v5 = "%s Done prewarming start alert";
    v6 = v3;
    v7 = 12;
    goto LABEL_7;
  }

}

void __79__CSSiriSpeechRecorder__setupAudioFileWritingForSpeechController_info_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(_QWORD);
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v8 = *MEMORY[0x1E0CFE6C0];
  v9 = *MEMORY[0x1E0CFE6C0];
  if (!v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s Unable to acquire recorded audio for speech logging.", buf, 0xCu);
      if (!v6)
        goto LABEL_20;
    }
    else if (!v6)
    {
      goto LABEL_20;
    }
LABEL_19:
    v6[2](v6);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s Acquired recorded audio for speech logging: %@", buf, 0x16u);
  }
  AFSpeechLogsDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend(*(id *)(a1 + 32), "_prepareDirectoryAtPath:", v10))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_checkAudioLoggingLimits:", v10))
    {
      v11 = objc_alloc(MEMORY[0x1E0CB3940]);
      if (_CSSiriSpeechAudioRecordingDateFormatter_onceToken != -1)
        dispatch_once(&_CSSiriSpeechAudioRecordingDateFormatter_onceToken, &__block_literal_global_620);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = (id)_CSSiriSpeechAudioRecordingDateFormatter_dateFormatter;
      objc_msgSend(v13, "stringFromDate:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("PCM-%@-%@.wav"), v14, *(_QWORD *)(a1 + 48));

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLByAppendingPathComponent:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v19 = objc_msgSend(v18, "linkItemAtURL:toURL:error:", v5, v17, &v24);
      v20 = v24;

      v21 = *v7;
      if (!v19 || v20)
      {
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
          v27 = 2112;
          v28 = v20;
          _os_log_error_impl(&dword_1C2614000, v21, OS_LOG_TYPE_ERROR, "%s Unable to save recorded audio for speech logging due to error %@.", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
        v27 = 2112;
        v28 = v17;
        _os_log_impl(&dword_1C2614000, v21, OS_LOG_TYPE_INFO, "%s Speech Log: %@", buf, 0x16u);
      }

    }
    else
    {
      v23 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
        _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_INFO, "%s Skipped saving recorded audio for speech logging due to audio logging limit.", buf, 0xCu);
      }
    }
  }
  else
  {
    v22 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v22, OS_LOG_TYPE_ERROR, "%s Unable to prepare directory for speech logging.", buf, 0xCu);
    }
  }

  if (v6)
    goto LABEL_19;
LABEL_20:

}

uint64_t __60__CSSiriSpeechRecorder__reportServerEndpointMetricsIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 408);
  objc_msgSend(*(id *)(a1 + 40), "doubleValue");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 48), "doubleValue");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 56), "doubleValue");
  return objc_msgSend(v2, "instrumentEndpointSignpostsForServerEndpointWithEndTime:leadingSilence:trailingSilence:stopRecordingMachContinuousTime:skippedSamplesTimeInSec:firstAudioSampleSensorHostTime:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), v4, v6, v7, *(double *)(a1 + 72));
}

id __58__CSSiriSpeechRecorder__stopRecordingWithReason_hostTime___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("reason");
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d.%d"), *(unsigned __int16 *)(a1 + 32), *(unsigned __int16 *)(a1 + 34));
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v4 = 136315138;
    v5 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]_block_invoke";
    _os_log_error_impl(&dword_1C2614000, v2, OS_LOG_TYPE_ERROR, "%s CSSpeechController prepare watchdog firing", (uint8_t *)&v4, 0xCu);
  }
  WriteStackshotReport_async();
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id obj;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        +[CSSiriBluetoothManager sharedInstance](CSSiriBluetoothManager, "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deviceWithAddress:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v12[0] = v6;
        v12[1] = 3221225472;
        v12[2] = __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke_2;
        v12[3] = &unk_1E7C28190;
        v13 = *(id *)(a1 + 32);
        objc_msgSend(v10, "getDeviceInfo:", v12);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

void __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = objc_msgSend(v3, "vendorID");
  v5 = objc_msgSend(v3, "productID");

  objc_msgSend(MEMORY[0x1E0D190E8], "sharedLogger");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logMHAssistantDaemonAudioRecordingFailedWithMHUUID:withReason:vendorId:productId:", v6, 1, v8, v10);

}

void __42__CSSiriSpeechRecorder__setAlertsIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (objc_msgSend(a3, "unsignedIntegerValue"))
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 464));
}

@end
