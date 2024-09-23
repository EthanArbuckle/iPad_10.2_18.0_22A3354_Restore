@implementation CSSiriSpeechRecordingContext

- (void)dealloc
{
  NSObject *v3;
  NSString *sessionUUID;
  OS_dispatch_group *v5;
  OS_dispatch_group *v6;
  objc_super v7;
  _QWORD v8[4];
  OS_dispatch_group *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    sessionUUID = self->_sessionUUID;
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext dealloc]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = sessionUUID;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s %p (sessionUUID = %@)", buf, 0x20u);
  }
  v5 = self->_recordingAudioGroup;
  v6 = v5;
  if (self->_shouldUseLocalFileWriter)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__CSSiriSpeechRecordingContext_dealloc__block_invoke;
    v8[3] = &unk_1E7C24420;
    v9 = v5;
    -[CSSiriSpeechRecordingContext _finalizeAudioFileWriterWithCompletion:](self, "_finalizeAudioFileWriterWithCompletion:", v8);

  }
  -[CSSiriSpeechRecordingContext _removeRecordedAudio](self, "_removeRecordedAudio");
  -[CSSiriAudioMessageRequestClient releaseAudioMessageRetainLockFromRequestId:](self->_audioMessageRequestClient, "releaseAudioMessageRetainLockFromRequestId:", self->_sessionUUID);

  v7.receiver = self;
  v7.super_class = (Class)CSSiriSpeechRecordingContext;
  -[CSSiriSpeechRecordingContext dealloc](&v7, sel_dealloc);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)CSSiriSpeechRecordingContext;
  -[CSSiriSpeechRecordingContext description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ (sessionUUID = %@)"), v4, self->_sessionUUID);

  return v5;
}

- (CSSiriSpeechRecordingContext)initWithSessionUUID:(id)a3 turnIdentifier:(id)a4
{
  id v6;
  id v7;
  CSSiriSpeechRecordingContext *v8;
  id v9;
  uint64_t v10;
  NSString *sessionUUID;
  NSObject *v12;
  NSString *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  dispatch_group_t v17;
  OS_dispatch_group *recordingAudioGroup;
  void *v19;
  CSSiriAudioMessageRequestClient *v20;
  CSSiriAudioMessageRequestClient *audioMessageRequestClient;
  objc_super v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  CSSiriSpeechRecordingContext *v27;
  __int16 v28;
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CSSiriSpeechRecordingContext;
  v8 = -[CSSiriSpeechRecordingContext init](&v23, sel_init);
  if (v8)
  {
    if (!v6)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      objc_msgSend(v9, "UUIDString");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v10 = objc_msgSend(v6, "copy");
    sessionUUID = v8->_sessionUUID;
    v8->_sessionUUID = (NSString *)v10;

    v12 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v13 = v8->_sessionUUID;
      *(_DWORD *)buf = 136315650;
      v25 = "-[CSSiriSpeechRecordingContext initWithSessionUUID:turnIdentifier:]";
      v26 = 2048;
      v27 = v8;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s %p (sessionUUID = %@", buf, 0x20u);
    }
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.assistant.request.speech-context", v14);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v15;

    v17 = dispatch_group_create();
    recordingAudioGroup = v8->_recordingAudioGroup;
    v8->_recordingAudioGroup = (OS_dispatch_group *)v17;

    objc_storeStrong((id *)&v8->_turnIdentifier, a4);
    if ((AFIsInternalInstall() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CFE978], "sharedPreferences");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_wantsRecordedAudioBufferLogs = objc_msgSend(v19, "shouldLogForQA");

    }
    else
    {
      v8->_wantsRecordedAudioBufferLogs = 0;
    }
    v20 = objc_alloc_init(CSSiriAudioMessageRequestClient);
    audioMessageRequestClient = v8->_audioMessageRequestClient;
    v8->_audioMessageRequestClient = v20;

    v8->_shouldUseLocalFileWriter = 1;
  }

  return v8;
}

- (void)becomeCurrent
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  CSSiriSpeechRecordingContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSSiriSpeechRecordingContext becomeCurrent]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSSiriSpeechRecordingContext_becomeCurrent__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)resignCurrent
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  CSSiriSpeechRecordingContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSSiriSpeechRecordingContext resignCurrent]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CSSiriSpeechRecordingContext_resignCurrent__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateStartSpeechId:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext updateStartSpeechId:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p (startSpeechId = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CSSiriSpeechRecordingContext_updateStartSpeechId___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)updateSelectedResultCandidateId:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext updateSelectedResultCandidateId:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p (selectedResultCandidateId = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CSSiriSpeechRecordingContext_updateSelectedResultCandidateId___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)updateAccessToRecordedAudioForVoiceIdentificationTraining:(BOOL)a3 forResultCandidateId:(id)a4 sharedUserId:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CSSiriSpeechRecordingContext *v16;
  id v17;
  BOOL v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  CSSiriSpeechRecordingContext *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v6 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v20 = "-[CSSiriSpeechRecordingContext updateAccessToRecordedAudioForVoiceIdentificationTraining:forResultCandidateId:sharedUserId:]";
    v21 = 2048;
    v22 = self;
    v23 = 1024;
    v24 = v6;
    v25 = 2112;
    v26 = v8;
    _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s %p (allows = %d, resultCandidateId = %@)", buf, 0x26u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __124__CSSiriSpeechRecordingContext_updateAccessToRecordedAudioForVoiceIdentificationTraining_forResultCandidateId_sharedUserId___block_invoke;
  v14[3] = &unk_1E7C29278;
  v18 = v6;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(queue, v14);

}

- (void)getAudioRecordRouteAndDeviceIdentificationWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __89__CSSiriSpeechRecordingContext_getAudioRecordRouteAndDeviceIdentificationWithCompletion___block_invoke;
    v7[3] = &unk_1E7C29150;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)acquireRecordedAudioWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  CSSiriSpeechRecordingContext *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[CSSiriSpeechRecordingContext acquireRecordedAudioWithHandler:]";
      v11 = 2048;
      v12 = self;
      _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
    }
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke;
    v7[3] = &unk_1E7C29150;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)updateAudioRecordContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext updateAudioRecordContext:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p (audioRecordContext = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__CSSiriSpeechRecordingContext_updateAudioRecordContext___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)updateAudioRecordDeviceInfo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext updateAudioRecordDeviceInfo:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p (audioRecordDeviceInfo = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__CSSiriSpeechRecordingContext_updateAudioRecordDeviceInfo___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)updateVoiceTriggerInfo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext updateVoiceTriggerInfo:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p (voiceTriggerInfo = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__CSSiriSpeechRecordingContext_updateVoiceTriggerInfo___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)updateRecordingInfo:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext updateRecordingInfo:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p (recordingInfo = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__CSSiriSpeechRecordingContext_updateRecordingInfo___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)updateRecordingSettings:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext updateRecordingSettings:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p (recordingSettings = %@)", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__CSSiriSpeechRecordingContext_updateRecordingSettings___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)willPrepareAndStartRecordingWithAudioActivationInfo:(id)a3
{
  id v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  os_log_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *queue;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  CSSiriSpeechRecordingContext *v26;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  CSSiriSpeechRecordingContext *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]";
    v30 = 2048;
    v31 = self;
    v32 = 2112;
    v33 = v4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s %p audioActivationInfo = %@", buf, 0x20u);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    objc_msgSend(v4, "audioSessionActivationTargetDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      objc_msgSend(v7, "timeIntervalSinceNow");
      *(_DWORD *)buf = 136315906;
      v29 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]";
      v30 = 2048;
      v31 = self;
      v32 = 2112;
      v33 = v7;
      v34 = 2048;
      v35 = v10;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s %p effectiveDate = %@ (%f)", buf, 0x2Au);

    }
    objc_initWeak(&location, self);
    AFAudioSessionAssertionGetCurrentAcquisitionService();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CFE800];
    v13 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke;
    v24[3] = &unk_1E7C244B8;
    v14 = v7;
    v25 = v14;
    v26 = self;
    v15 = (void *)objc_msgSend(v12, "newWithBuilder:", v24);
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke_2;
    v22[3] = &unk_1E7C244E0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v11, "acquireAudioSessionAssertionWithContext:relinquishmentHandler:", v15, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v29 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]";
      v30 = 2048;
      v31 = self;
      v32 = 2112;
      v33 = v16;
      _os_log_impl(&dword_1C2614000, v17, OS_LOG_TYPE_INFO, "%s %p startRecordingAudioSessionAssertion = %@", buf, 0x20u);
    }
    queue = self->_queue;
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke_33;
    v20[3] = &unk_1E7C292A0;
    v20[4] = self;
    v21 = v16;
    v19 = v16;
    dispatch_async(queue, v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

- (void)didDetectTwoShotWithAudioActivationInfo:(id)a3 atTime:(double)a4
{
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  os_log_t v14;
  NSObject *v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *queue;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  CSSiriSpeechRecordingContext *v32;
  id location;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  CSSiriSpeechRecordingContext *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v8 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v35 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]";
    v36 = 2048;
    v37 = self;
    v38 = 2112;
    v39 = v6;
    v40 = 2048;
    v41 = a4;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s %p audioActivationInfo = %@, time = %f", buf, 0x2Au);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    objc_msgSend(v6, "dateByAddingTimeIntervalSinceActivation:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

    objc_msgSend(v12, "dateByAddingTimeInterval:", 0.2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      v15 = v14;
      objc_msgSend(v13, "timeIntervalSinceNow");
      *(_DWORD *)buf = 136315906;
      v35 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]";
      v36 = 2048;
      v37 = self;
      v38 = 2112;
      v39 = v13;
      v40 = 2048;
      v41 = v16;
      _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_INFO, "%s %p effectiveDate = %@ (%f)", buf, 0x2Au);

    }
    objc_initWeak(&location, self);
    AFAudioSessionAssertionGetCurrentAcquisitionService();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0CFE800];
    v19 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke;
    v30[3] = &unk_1E7C244B8;
    v20 = v13;
    v31 = v20;
    v32 = self;
    v21 = (void *)objc_msgSend(v18, "newWithBuilder:", v30);
    v28[0] = v19;
    v28[1] = 3221225472;
    v28[2] = __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke_2;
    v28[3] = &unk_1E7C244E0;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v17, "acquireAudioSessionAssertionWithContext:relinquishmentHandler:", v21, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]";
      v36 = 2048;
      v37 = self;
      v38 = 2112;
      v39 = v22;
      _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_INFO, "%s %p twoShotDetectionAudioSessionAssertion = %@", buf, 0x20u);
    }
    queue = self->_queue;
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke_38;
    v26[3] = &unk_1E7C292A0;
    v26[4] = self;
    v27 = v22;
    v25 = v22;
    dispatch_async(queue, v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
}

- (void)willStopRecordingAtHostTime:(unint64_t)a3
{
  os_log_t *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  CSSiriSpeechRecordingContext *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v16 = "-[CSSiriSpeechRecordingContext willStopRecordingAtHostTime:]";
    v17 = 2048;
    v18 = self;
    v19 = 2048;
    v20 = a3;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s %p hostTime = %llu", buf, 0x20u);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__CSSiriSpeechRecordingContext_willStopRecordingAtHostTime___block_invoke;
    v14[3] = &__block_descriptor_40_e38_v16__0___AFAssertionContextMutating__8l;
    v14[4] = a3;
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CFE800], "newWithBuilder:", v14);
    v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSSiriSpeechRecordingContext willStopRecordingAtHostTime:]";
      v17 = 2048;
      v18 = self;
      v19 = 2112;
      v20 = (unint64_t)v8;
      _os_log_impl(&dword_1C2614000, v9, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
    }
    queue = self->_queue;
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __60__CSSiriSpeechRecordingContext_willStopRecordingAtHostTime___block_invoke_42;
    block[3] = &unk_1E7C292A0;
    block[4] = self;
    v13 = v8;
    v11 = v8;
    dispatch_async(queue, block);

  }
}

- (void)didStopRecordingWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  CSSiriSpeechRecordingContext *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSSiriSpeechRecordingContext didStopRecordingWithError:]";
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p error = %@", buf, 0x20u);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__CSSiriSpeechRecordingContext_didStopRecordingWithError___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)relinquishAudioSessionAssertionsWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext relinquishAudioSessionAssertionsWithContext:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p context = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__CSSiriSpeechRecordingContext_relinquishAudioSessionAssertionsWithContext___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)relinquishAudioSessionAssertionsWithError:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  CSSiriSpeechRecordingContext *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext relinquishAudioSessionAssertionsWithError:]";
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p error = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __74__CSSiriSpeechRecordingContext_relinquishAudioSessionAssertionsWithError___block_invoke;
  v8[3] = &unk_1E7C292A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

- (void)beginRecordingAudioWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3
{
  NSObject *v5;
  __int128 v6;
  NSObject *queue;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  CSSiriSpeechRecordingContext *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSSiriSpeechRecordingContext beginRecordingAudioWithAudioStreamBasicDescription:]";
    v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  v6 = *(_OWORD *)&a3->mBytesPerPacket;
  v9 = *(_OWORD *)&a3->mSampleRate;
  v10 = v6;
  v11 = *(_QWORD *)&a3->mBitsPerChannel;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__CSSiriSpeechRecordingContext_beginRecordingAudioWithAudioStreamBasicDescription___block_invoke;
  v8[3] = &unk_1E7C24528;
  v8[4] = self;
  dispatch_async(queue, v8);
}

- (void)appendRecordedAudioBuffer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CSSiriSpeechRecordingContext_appendRecordedAudioBuffer___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)endRecordingAudio
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  CSSiriSpeechRecordingContext *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSSiriSpeechRecordingContext endRecordingAudio]";
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CSSiriSpeechRecordingContext_endRecordingAudio__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_initializeAudioFileWriterWithAudioStreamBasicDescription:(const AudioStreamBasicDescription *)a3
{
  CSSiriAudioFileWriter *v5;
  CSSiriAudioFileWriter *v6;
  CSSiriAudioFileWriter *audioFileWriter;
  _QWORD v8[5];

  v5 = [CSSiriAudioFileWriter alloc];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__CSSiriSpeechRecordingContext__initializeAudioFileWriterWithAudioStreamBasicDescription___block_invoke;
  v8[3] = &unk_1E7C24550;
  v8[4] = self;
  v6 = -[CSSiriAudioFileWriter initWithType:pathGenerator:priority:](v5, "initWithType:pathGenerator:priority:", 2, v8, 21);
  audioFileWriter = self->_audioFileWriter;
  self->_audioFileWriter = v6;

  -[CSSiriAudioFileWriter configureWithAudioStreamBasicDescription:](self->_audioFileWriter, "configureWithAudioStreamBasicDescription:", a3);
}

- (void)_finalizeAudioFileWriterWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  CSSiriAudioFileWriter *audioFileWriter;
  OS_dispatch_queue *v7;
  CSSiriAudioFileWriter *v8;
  OS_dispatch_queue *v9;
  CSSiriAudioFileWriter *v10;
  _QWORD v11[4];
  OS_dispatch_queue *v12;
  id v13;
  _BYTE *v14;
  _BYTE buf[24];
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  CSSiriAudioFileWriter *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    audioFileWriter = self->_audioFileWriter;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecordingContext _finalizeAudioFileWriterWithCompletion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2112;
    v16 = (uint64_t (*)(uint64_t, uint64_t))audioFileWriter;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p (_audioFileWriter = %@)", buf, 0x20u);
  }
  if (self->_audioFileWriter)
  {
    v7 = self->_queue;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v16 = __Block_byref_object_copy__3546;
    v17 = __Block_byref_object_dispose__3547;
    v8 = self->_audioFileWriter;
    v18 = v8;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__CSSiriSpeechRecordingContext__finalizeAudioFileWriterWithCompletion___block_invoke;
    v11[3] = &unk_1E7C245A0;
    v9 = v7;
    v12 = v9;
    v13 = v4;
    v14 = buf;
    -[CSSiriAudioFileWriter flushWithCompletion:](v8, "flushWithCompletion:", v11);
    v10 = self->_audioFileWriter;
    self->_audioFileWriter = 0;

    _Block_object_dispose(buf, 8);
  }

}

- (void)instrumentSiriCue:(int)a3
{
  NSObject *queue;
  _QWORD v4[5];
  int v5;

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__CSSiriSpeechRecordingContext_instrumentSiriCue___block_invoke;
  v4[3] = &unk_1E7C27848;
  v4[4] = self;
  v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_instrumentSiriCue:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  v6 = objc_alloc_init(MEMORY[0x1E0D9A4A0]);
  objc_msgSend(v6, "setSiriCueType:", v3);
  objc_msgSend(MEMORY[0x1E0CFE7D8], "sharedAnalytics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logInstrumentation:machAbsoluteTime:turnIdentifier:", v6, mach_absolute_time(), self->_turnIdentifier);

}

- (void)instrumentSiriCueForAlertType:(int64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__CSSiriSpeechRecordingContext_instrumentSiriCueForAlertType___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)emitRequestLinkEventForMHUUID:(id)a3
{
  NSString *sessionUUID;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  sessionUUID = self->_sessionUUID;
  v5 = a3;
  -[CSSiriSpeechRecordingContext _createRequestLinkInfo:component:](self, "_createRequestLinkInfo:component:", sessionUUID, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSSiriSpeechRecordingContext _createRequestLinkInfo:component:](self, "_createRequestLinkInfo:component:", v7, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0D9A488]);
  objc_msgSend(v9, "setSource:", v6);
  objc_msgSend(v9, "setTarget:", v8);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitMessage:", v9);

  v11 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v12 = 136315138;
    v13 = "-[CSSiriSpeechRecordingContext emitRequestLinkEventForMHUUID:]";
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v12, 0xCu);
  }

}

- (void)emitRequestLinkEventForRtsSessionId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSString *sessionUUID;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSSiriSpeechRecordingContext _createRequestLinkInfo:component:](self, "_createRequestLinkInfo:component:", self->_sessionUUID, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSiriSpeechRecordingContext _createRequestLinkInfo:component:](self, "_createRequestLinkInfo:component:", v6, 41);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0D9A488]);
  objc_msgSend(v8, "setSource:", v5);
  objc_msgSend(v8, "setTarget:", v7);
  objc_msgSend(MEMORY[0x1E0D97898], "sharedStream");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emitMessage:", v8);

  v10 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_msgSend(v4, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    sessionUUID = self->_sessionUUID;
    v14 = 136315651;
    v15 = "-[CSSiriSpeechRecordingContext emitRequestLinkEventForRtsSessionId:]";
    v16 = 2113;
    v17 = v12;
    v18 = 2113;
    v19 = sessionUUID;
    _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_INFO, "%s rtsSessionId: %{private}@, requestId: %{private}@", (uint8_t *)&v14, 0x20u);

  }
}

- (id)_createRequestLinkInfo:(id)a3 component:(int)a4
{
  uint64_t v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *(_QWORD *)&a4;
  v5 = (objc_class *)MEMORY[0x1E0D9A500];
  v6 = a3;
  v7 = [v5 alloc];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);

  v9 = (void *)objc_msgSend(v7, "initWithNSUUID:", v8);
  v10 = objc_alloc_init(MEMORY[0x1E0D9A498]);
  objc_msgSend(v10, "setUuid:", v9);
  objc_msgSend(v10, "setComponent:", v4);

  return v10;
}

- (void)_didBecomeCurrent
{
  NSObject *v3;
  NSString *sessionUUID;
  int v5;
  const char *v6;
  __int16 v7;
  CSSiriSpeechRecordingContext *v8;
  __int16 v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    sessionUUID = self->_sessionUUID;
    v5 = 136315650;
    v6 = "-[CSSiriSpeechRecordingContext _didBecomeCurrent]";
    v7 = 2048;
    v8 = self;
    v9 = 2112;
    v10 = sessionUUID;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s %p (sessionUUID = %@)", (uint8_t *)&v5, 0x20u);
  }
}

- (void)_didResignCurrent
{
  NSObject *v3;
  NSString *sessionUUID;
  int v5;
  id *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  CSSiriSpeechRecordingContext *v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    sessionUUID = self->_sessionUUID;
    *(_DWORD *)buf = 136315650;
    v10 = "-[CSSiriSpeechRecordingContext _didResignCurrent]";
    v11 = 2048;
    v12 = self;
    v13 = 2112;
    v14 = sessionUUID;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s %p (sessionUUID = %@)", buf, 0x20u);
  }
  v5 = objc_msgSend(MEMORY[0x1E0D19260], "supportsSCDAFramework");
  v6 = (id *)0x1E0D97CF0;
  if (!v5)
    v6 = (id *)0x1E0CFE948;
  objc_msgSend(*v6, "sharedMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__CSSiriSpeechRecordingContext__didResignCurrent__block_invoke;
  v8[3] = &unk_1E7C284F8;
  v8[4] = self;
  objc_msgSend(v7, "waitForMyriadDecisionForReason:withCompletion:", CFSTR("Donating recorded audio to CoreSpeech"), v8);

}

- (void)_donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *recordingAudioGroup;
  NSObject *queue;
  _QWORD v8[5];
  void (**v9)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = v4;
  recordingAudioGroup = self->_recordingAudioGroup;
  if (recordingAudioGroup)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke;
    v8[3] = &unk_1E7C29150;
    v8[4] = self;
    v9 = v4;
    dispatch_group_notify(recordingAudioGroup, queue, v8);

  }
  else if (v4)
  {
    v4[2](v4);
  }

}

- (void)_removeRecordedAudio
{
  os_log_t *v3;
  NSObject *v4;
  NSURL *recordedAudioFileURL;
  void *v6;
  NSURL *v7;
  int v8;
  id v9;
  NSObject *v10;
  NSURL *v11;
  NSURL *v12;
  NSURL *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  CSSiriSpeechRecordingContext *v18;
  __int16 v19;
  NSURL *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_recordedAudioFileURL
    && (!AFIsInternalInstall() || (_AFPreferencesKeepRecorededAudioFiles() & 1) == 0))
  {
    v3 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v4 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      recordedAudioFileURL = self->_recordedAudioFileURL;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSSiriSpeechRecordingContext _removeRecordedAudio]";
      v17 = 2048;
      v18 = self;
      v19 = 2112;
      v20 = recordedAudioFileURL;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s %p Removing recorded audio at %@...", buf, 0x20u);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_recordedAudioFileURL;
    v14 = 0;
    v8 = objc_msgSend(v6, "removeItemAtURL:error:", v7, &v14);
    v9 = v14;

    v10 = *v3;
    if (!v8 || v9)
    {
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        v13 = self->_recordedAudioFileURL;
        *(_DWORD *)buf = 136315906;
        v16 = "-[CSSiriSpeechRecordingContext _removeRecordedAudio]";
        v17 = 2048;
        v18 = self;
        v19 = 2112;
        v20 = v13;
        v21 = 2112;
        v22 = v9;
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s %p Failed to remove recorded audio at %@ (error = %@).", buf, 0x2Au);
      }
    }
    else if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      v11 = self->_recordedAudioFileURL;
      *(_DWORD *)buf = 136315650;
      v16 = "-[CSSiriSpeechRecordingContext _removeRecordedAudio]";
      v17 = 2048;
      v18 = self;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_INFO, "%s %p Removed recorded audio at %@.", buf, 0x20u);
    }
    v12 = self->_recordedAudioFileURL;
    self->_recordedAudioFileURL = 0;

  }
}

- (BOOL)allowContinuousConversation
{
  return -[CSAudioRecordContext isAudioRecordTypeSupportedByContinuousConversation](self->_audioRecordContext, "isAudioRecordTypeSupportedByContinuousConversation");
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (BOOL)wantsRecordedAudioBufferLogs
{
  return self->_wantsRecordedAudioBufferLogs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_audioMessageRequestClient, 0);
  objc_storeStrong((id *)&self->_voiceIdentificationTraining_withoutResultCandidateSharedUserId, 0);
  objc_storeStrong((id *)&self->_turnIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceIdentificationTraining_resultCandidateToSharedUserIdMap, 0);
  objc_storeStrong((id *)&self->_voiceIdentificationTraining_allowedResultCandidateIds, 0);
  objc_storeStrong((id *)&self->_recordingAudioGroup, 0);
  objc_storeStrong((id *)&self->_twoShotDetectionAudioSessionAssertion, 0);
  objc_storeStrong((id *)&self->_startRecordingAudioSessionAssertion, 0);
  objc_storeStrong((id *)&self->_recordedAudioFileURL, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_recordingInfo, 0);
  objc_storeStrong((id *)&self->_recordingSettings, 0);
  objc_storeStrong((id *)&self->_voiceTriggerInfo, 0);
  objc_storeStrong((id *)&self->_audioRecordDeviceInfo, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_selectedResultCandidateId, 0);
  objc_storeStrong((id *)&self->_startSpeechId, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  os_log_t *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 88))
  {
    if (*(_QWORD *)(v2 + 32))
      v3 = objc_msgSend(*(id *)(v2 + 128), "containsObject:");
    else
      v3 = *(_BYTE *)(v2 + 120) != 0;
    v6 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v7 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 88);
      v10 = CFSTR("DENIED");
      if ((_DWORD)v3)
        v10 = CFSTR("ALLOWED");
      *(_DWORD *)buf = 136315906;
      v25 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke";
      v26 = 2048;
      v27 = v8;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_INFO, "%s %p Access to payload audio at %@ is %@, setting payload recording flag for CoreSpeech.", buf, 0x2Au);
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("shouldRecordPayload"));

    v13 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(_QWORD *)(v14 + 88);
      *(_DWORD *)buf = 136315650;
      v25 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke";
      v26 = 2048;
      v27 = v14;
      v28 = 2112;
      v29 = v15;
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_INFO, "%s %p Donating recorded audio at %@...", buf, 0x20u);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "relativePath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD **)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v20 = v17[5];
    v19 = v17[6];
    v21 = v17[7];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke_70;
    v22[3] = &unk_1E7C29128;
    v22[4] = v17;
    v23 = v18;
    +[CSVoiceIdXPCClient notifyImplicitUtterance:audioDeviceType:audioRecordType:voiceTriggerEventInfo:otherCtxt:completion:](CSVoiceIdXPCClient, "notifyImplicitUtterance:audioDeviceType:audioRecordType:voiceTriggerEventInfo:otherCtxt:completion:", v16, v19, v20, v21, v11, v22);

  }
  else
  {
    v4 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke";
      v26 = 2048;
      v27 = v2;
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s %p No recorded audio.", buf, 0x16u);
    }
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
  }
}

void __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke_70(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(v5 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke_2;
  block[3] = &unk_1E7C28EC8;
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v8 = v4;
  dispatch_async(v7, block);

}

uint64_t __97__CSSiriSpeechRecordingContext__donateRecordedAudioForVoiceIdentificationTrainingWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = *MEMORY[0x1E0CFE6C0];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = a1[5];
      v6 = *(_QWORD *)(v5 + 88);
      v10 = 136315906;
      v11 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke_2";
      v12 = 2048;
      v13 = v5;
      v14 = 2112;
      v15 = v6;
      v16 = 2112;
      v17 = v2;
      _os_log_error_impl(&dword_1C2614000, v3, OS_LOG_TYPE_ERROR, "%s %p Failed to donate recorded audio at %@ for  VoiceID training (error = %@).", (uint8_t *)&v10, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = a1[5];
    v8 = *(_QWORD *)(v7 + 88);
    v10 = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext _donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:]_block_invoke";
    v12 = 2048;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s %p Donated recorded audio at %@ for  Voice VoiceID training.", (uint8_t *)&v10, 0x20u);
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __49__CSSiriSpeechRecordingContext__didResignCurrent__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[5];
  char v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__CSSiriSpeechRecordingContext__didResignCurrent__block_invoke_2;
  v4[3] = &unk_1E7C28480;
  v5 = a2;
  v4[4] = v2;
  dispatch_async(v3, v4);
}

uint64_t __49__CSSiriSpeechRecordingContext__didResignCurrent__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  _QWORD *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(result + 40))
  {
    v1 = result;
    v2 = *(_QWORD **)(result + 32);
    if (v2[7])
    {
      v3 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        v4 = 136315138;
        v5 = "-[CSSiriSpeechRecordingContext _didResignCurrent]_block_invoke_2";
        _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s Myriad won & voice trigger present, donating recorded audio to CoreSpeech.", (uint8_t *)&v4, 0xCu);
        v2 = *(_QWORD **)(v1 + 32);
      }
      return objc_msgSend(v2, "_donateRecordedAudioForVoiceIdentificationTrainingWithCompletion:", 0);
    }
  }
  return result;
}

void __62__CSSiriSpeechRecordingContext_instrumentSiriCueForAlertType___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 40) == 1)
  {
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    if (v2)
    {
      objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0C899F8]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "count"))
      {
        v9 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
        {
          v11 = 136315138;
          v12 = "-[CSSiriSpeechRecordingContext instrumentSiriCueForAlertType:]_block_invoke";
          _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s No alert behavior in recordingSettings", (uint8_t *)&v11, 0xCu);
        }
        goto LABEL_17;
      }
      objc_msgSend(v3, "objectForKey:", &unk_1E7C63758);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (!v4)
      {
        v10 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
        {
          v11 = 136315138;
          v12 = "-[CSSiriSpeechRecordingContext instrumentSiriCueForAlertType:]_block_invoke";
          _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s No alert style specified for record starting", (uint8_t *)&v11, 0xCu);
        }
        goto LABEL_16;
      }
      v6 = objc_msgSend(v4, "integerValue");
      if (v6 == 2)
      {
        v7 = 1;
      }
      else
      {
        if (v6 != 1)
        {
LABEL_16:

LABEL_17:
          return;
        }
        v7 = 3;
      }
      objc_msgSend(*(id *)(a1 + 32), "_instrumentSiriCue:", v7);
      goto LABEL_16;
    }
    v8 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSSiriSpeechRecordingContext instrumentSiriCueForAlertType:]_block_invoke";
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s recordingSettings was nil", (uint8_t *)&v11, 0xCu);
    }
  }
}

uint64_t __50__CSSiriSpeechRecordingContext_instrumentSiriCue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_instrumentSiriCue:", *(unsigned int *)(a1 + 40));
}

void __71__CSSiriSpeechRecordingContext__finalizeAudioFileWriterWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__CSSiriSpeechRecordingContext__finalizeAudioFileWriterWithCompletion___block_invoke_2;
  v13[3] = &unk_1E7C24578;
  v8 = *(NSObject **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v6;
  v15 = v7;
  v10 = *(_QWORD *)(a1 + 48);
  v16 = v9;
  v17 = v10;
  v11 = v7;
  v12 = v6;
  dispatch_async(v8, v13);

}

void __71__CSSiriSpeechRecordingContext__finalizeAudioFileWriterWithCompletion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[6];
  if (v2)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v2 + 16))(v2, a1[4], a1[5]);
  v3 = *(_QWORD *)(a1[7] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

id __90__CSSiriSpeechRecordingContext__initializeAudioFileWriterWithAudioStreamBasicDescription___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  CSSiriSpeechRecordingRecordedAudioDirectoryPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, 0);

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 184);
  if (!v5)
    v5 = CFSTR("Unknown");
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@.wav"), v5);
  objc_msgSend(v2, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

_BYTE *__49__CSSiriSpeechRecordingContext_endRecordingAudio__block_invoke(uint64_t a1)
{
  _BYTE *result;
  _QWORD v2[5];

  result = *(_BYTE **)(a1 + 32);
  if (result[161])
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __49__CSSiriSpeechRecordingContext_endRecordingAudio__block_invoke_2;
    v2[3] = &unk_1E7C24420;
    v2[4] = result;
    return (_BYTE *)objc_msgSend(result, "_finalizeAudioFileWriterWithCompletion:", v2);
  }
  return result;
}

void __49__CSSiriSpeechRecordingContext_endRecordingAudio__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  if (v6)
  {
    v8 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = 136315650;
      v17 = "-[CSSiriSpeechRecordingContext endRecordingAudio]_block_invoke_2";
      v18 = 2048;
      v19 = v15;
      v20 = 2112;
      v21 = v6;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s %p (error = %@)", (uint8_t *)&v16, 0x20u);
    }
  }
  v9 = objc_msgSend(v5, "copy");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 88);
  *(_QWORD *)(v10 + 88) = v9;

  v12 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 88);
    v16 = 136315650;
    v17 = "-[CSSiriSpeechRecordingContext endRecordingAudio]_block_invoke";
    v18 = 2048;
    v19 = v13;
    v20 = 2112;
    v21 = v14;
    _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_INFO, "%s %p (_recordedAudioFileURL = %@)", (uint8_t *)&v16, 0x20u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));

}

uint64_t __58__CSSiriSpeechRecordingContext_appendRecordedAudioBuffer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "appendAudioData:", *(_QWORD *)(a1 + 40));
}

void __83__CSSiriSpeechRecordingContext_beginRecordingAudioWithAudioStreamBasicDescription___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _BYTE *v4;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 161) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "shouldUseLocalAudioFileWriter");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isRequestDuringActiveCall") & 1) != 0)
  {
    v2 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v7 = "-[CSSiriSpeechRecordingContext beginRecordingAudioWithAudioStreamBasicDescription:]_block_invoke";
      v8 = 2048;
      v9 = v3;
      _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_INFO, "%s %p, ignore begin recording audio due to active phone call", buf, 0x16u);
    }
  }
  else
  {
    v4 = *(_BYTE **)(a1 + 32);
    if (v4[161])
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __83__CSSiriSpeechRecordingContext_beginRecordingAudioWithAudioStreamBasicDescription___block_invoke_2;
      v5[3] = &unk_1E7C24420;
      v5[4] = v4;
      objc_msgSend(v4, "_finalizeAudioFileWriterWithCompletion:", v5);
      dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));
      objc_msgSend(*(id *)(a1 + 32), "_initializeAudioFileWriterWithAudioStreamBasicDescription:", a1 + 40);
    }
  }
}

void __83__CSSiriSpeechRecordingContext_beginRecordingAudioWithAudioStreamBasicDescription___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 112));
}

uint64_t __74__CSSiriSpeechRecordingContext_relinquishAudioSessionAssertionsWithError___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "relinquishWithError:options:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "relinquishWithError:options:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __76__CSSiriSpeechRecordingContext_relinquishAudioSessionAssertionsWithContext___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "relinquishWithContext:options:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "relinquishWithContext:options:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __58__CSSiriSpeechRecordingContext_didStopRecordingWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "relinquishWithError:options:", *(_QWORD *)(a1 + 40), 1);
}

void __60__CSSiriSpeechRecordingContext_willStopRecordingAtHostTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if (!v4)
  {
    v4 = mach_absolute_time();
    v3 = v5;
  }
  objc_msgSend(v3, "setTimestamp:", v4);
  objc_msgSend(v5, "setReason:", CFSTR("Stop Recording"));

}

uint64_t __60__CSSiriSpeechRecordingContext_willStopRecordingAtHostTime___block_invoke_42(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "relinquishWithContext:options:", *(_QWORD *)(a1 + 40), 1);
}

void __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", mach_absolute_time());
  objc_msgSend(v3, "setReason:", CFSTR("Two Shot Detection"));
  objc_msgSend(v3, "setEffectiveDate:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184);
  v6 = CFSTR("sessionUUID");
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v5);

}

void __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0CFE6C0];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v10 = 136315650;
      v11 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]_block_invoke_2";
      v12 = 2048;
      v13 = WeakRetained;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s %p (error = %@)", (uint8_t *)&v10, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext didDetectTwoShotWithAudioActivationInfo:atTime:]_block_invoke";
    v12 = 2048;
    v13 = WeakRetained;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s %p (relinquishmentContext = %@)", (uint8_t *)&v10, 0x20u);
    goto LABEL_6;
  }

}

void __79__CSSiriSpeechRecordingContext_didDetectTwoShotWithAudioActivationInfo_atTime___block_invoke_38(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
}

void __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", mach_absolute_time());
  objc_msgSend(v3, "setReason:", CFSTR("Start Recording"));
  objc_msgSend(v3, "setEffectiveDate:", *(_QWORD *)(a1 + 32));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 184);
  v6 = CFSTR("sessionUUID");
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v5);

}

void __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)*MEMORY[0x1E0CFE6C0];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v8 = v7;
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      v10 = 136315650;
      v11 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]_block_invoke_2";
      v12 = 2048;
      v13 = WeakRetained;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1C2614000, v8, OS_LOG_TYPE_ERROR, "%s %p (error = %@)", (uint8_t *)&v10, 0x20u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = 136315650;
    v11 = "-[CSSiriSpeechRecordingContext willPrepareAndStartRecordingWithAudioActivationInfo:]_block_invoke";
    v12 = 2048;
    v13 = WeakRetained;
    v14 = 2112;
    v15 = v5;
    _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s %p (relinquishmentContext = %@)", (uint8_t *)&v10, 0x20u);
    goto LABEL_6;
  }

}

void __84__CSSiriSpeechRecordingContext_willPrepareAndStartRecordingWithAudioActivationInfo___block_invoke_33(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
}

void __56__CSSiriSpeechRecordingContext_updateRecordingSettings___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

void __52__CSSiriSpeechRecordingContext_updateRecordingInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

void __55__CSSiriSpeechRecordingContext_updateVoiceTriggerInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

void __60__CSSiriSpeechRecordingContext_updateAudioRecordDeviceInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;

}

void __57__CSSiriSpeechRecordingContext_updateAudioRecordContext___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 112);
  v4 = *(NSObject **)(v1 + 8);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_2;
  v5[3] = &unk_1E7C29150;
  v5[4] = v1;
  v6 = v2;
  dispatch_group_notify(v3, v4, v5);

}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "isRequestDuringActiveCall") & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, &__block_literal_global_3597);
  }
  else
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "shouldUseLocalAudioFileWriter");
    v3 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      v4 = (uint64_t (*)(uint64_t, uint64_t))*(id *)(v3 + 88);
      v5 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[CSSiriSpeechRecordingContext acquireRecordedAudioWithHandler:]_block_invoke_2";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2112;
        v20 = v4;
        _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_INFO, "%s %p (recordedAudioFileURL = %@)", buf, 0x20u);
      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v20 = __Block_byref_object_copy__3546;
      v21 = __Block_byref_object_dispose__3547;
      v22 = *(id *)(a1 + 32);
      v7 = objc_alloc(MEMORY[0x1E0CFE998]);
      v8 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_20;
      v18[3] = &unk_1E7C24448;
      v18[4] = buf;
      v9 = (void *)objc_msgSend(v7, "initWithBlock:", v18);
      v10 = *(_QWORD *)(a1 + 40);
      v16[0] = v8;
      v16[1] = 3221225472;
      v16[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_2_22;
      v16[3] = &unk_1E7C292C8;
      v11 = v9;
      v17 = v11;
      (*(void (**)(uint64_t, uint64_t (*)(uint64_t, uint64_t), _QWORD *))(v10 + 16))(v10, v4, v16);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v12 = *(void **)(v3 + 168);
      v13 = *(_QWORD *)(v3 + 184);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_3;
      v14[3] = &unk_1E7C24470;
      v14[4] = v3;
      v15 = *(id *)(a1 + 40);
      objc_msgSend(v12, "getAudioFileWithRequestId:completion:", v13, v14);

    }
  }
}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_20(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

uint64_t __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_2_22(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];
  id v13;

  v3 = a2;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = __Block_byref_object_copy__3546;
  v12[4] = __Block_byref_object_dispose__3547;
  v13 = *(id *)(a1 + 32);
  v4 = objc_alloc(MEMORY[0x1E0CFE998]);
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_4;
  v11[3] = &unk_1E7C24448;
  v11[4] = v12;
  v6 = (void *)objc_msgSend(v4, "initWithBlock:", v11);
  v7 = *(_QWORD *)(a1 + 40);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_5;
  v9[3] = &unk_1E7C292C8;
  v8 = v6;
  v10 = v8;
  (*(void (**)(uint64_t, id, _QWORD *))(v7 + 16))(v7, v3, v9);

  _Block_object_dispose(v12, 8);
}

void __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

uint64_t __64__CSSiriSpeechRecordingContext_acquireRecordedAudioWithHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

void __89__CSSiriSpeechRecordingContext_getAudioRecordRouteAndDeviceIdentificationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "remoteDeviceUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "UUIDString");
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v7 = 136315906;
    v8 = "-[CSSiriSpeechRecordingContext getAudioRecordRouteAndDeviceIdentificationWithCompletion:]_block_invoke";
    v9 = 2112;
    v10 = v2;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_INFO, "%s route = %@, deviceIdentifier = %@, deviceUID = %@", (uint8_t *)&v7, 0x2Au);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __124__CSSiriSpeechRecordingContext_updateAccessToRecordedAudioForVoiceIdentificationTraining_forResultCandidateId_sharedUserId___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v2 = *(unsigned __int8 *)(a1 + 56);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(void **)(v3 + 128);
    if (v2)
    {
      if (!v4)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v6 = *(_QWORD *)(a1 + 40);
        v7 = *(void **)(v6 + 128);
        *(_QWORD *)(v6 + 128) = v5;

        v3 = *(_QWORD *)(a1 + 40);
      }
      if (!*(_QWORD *)(v3 + 136))
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(void **)(v9 + 136);
        *(_QWORD *)(v9 + 136) = v8;

        v3 = *(_QWORD *)(a1 + 40);
      }
      objc_msgSend(*(id *)(v3 + 128), "addObject:", *(_QWORD *)(a1 + 32));
      v11 = *(_QWORD *)(a1 + 48);
      if (v11)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "setObject:forKey:", v11, *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(v4, "removeObject:");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 120) = v2;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 152), *(id *)(a1 + 48));
  }
}

void __64__CSSiriSpeechRecordingContext_updateSelectedResultCandidateId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

void __52__CSSiriSpeechRecordingContext_updateStartSpeechId___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

uint64_t __45__CSSiriSpeechRecordingContext_resignCurrent__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 0;
    return objc_msgSend(*(id *)(result + 32), "_didResignCurrent");
  }
  return result;
}

uint64_t __45__CSSiriSpeechRecordingContext_becomeCurrent__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    return objc_msgSend(*(id *)(result + 32), "_didBecomeCurrent");
  }
  return result;
}

void __39__CSSiriSpeechRecordingContext_dealloc__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a2;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

@end
