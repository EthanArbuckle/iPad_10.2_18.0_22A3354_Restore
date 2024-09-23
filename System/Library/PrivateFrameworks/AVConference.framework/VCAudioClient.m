@implementation VCAudioClient

- (VCAudioClient)initWithProcessId:(int)a3
{
  VCAudioClient *v4;
  VCAudioClient *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioClient;
  v4 = -[VCAudioClient init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_processId = a3;
    v4->_state = 0;
    v4->_audioSession = (VCAudioSession *)+[VCAudioSession sharedVoiceChatInstance](VCAudioSession, "sharedVoiceChatInstance");
    v5->_audioManager = (VCAudioManager *)+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance");
    pthread_mutex_init(&v5->_stateMutex, 0);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  pthread_mutex_destroy(&self->_stateMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioClient;
  -[VCAudioClient dealloc](&v3, sel_dealloc);
}

- (void)lock
{
  pthread_mutex_lock(&self->_stateMutex);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->_stateMutex);
}

- (BOOL)isMuted
{
  if (VCFeatureFlagManager_SessionBasedMutingEnabled())
    return -[VCAudioSession microphoneMuted](self->_audioSession, "microphoneMuted");
  else
    return self->_muted;
}

- (void)setIsMuted:(BOOL)a3
{
  self->_muted = a3;
  if (VCFeatureFlagManager_SessionBasedMutingEnabled())
    -[VCAudioSession setMicrophoneMuted:](self->_audioSession, "setMicrophoneMuted:", self->_muted);
  -[VCAudioManager setMicrophoneMuted:](self->_audioManager, "setMicrophoneMuted:", self->_muted);
}

- (void)setMixingVoiceWithMediaEnabled:(BOOL)a3
{
  self->_mixingVoiceWithMediaEnabled = a3;
  -[VCAudioManager setMixingVoiceWithMediaEnabled:](self->_audioManager, "setMixingVoiceWithMediaEnabled:");
}

- (void)setFollowSystemInput:(BOOL)a3
{
  self->_followSystemInput = a3;
}

- (void)setFollowSystemOutput:(BOOL)a3
{
  self->_followSystemOutput = a3;
}

- (BOOL)resetAudioSessionOutputPortOverride:(id *)a3
{
  -[VCAudioSession resetOverrideRoute](self->_audioSession, "resetOverrideRoute", a3);
  return 1;
}

- (void)setAudioSessionProperties:(id)a3
{
  void *v5;

  self->_requestedSettings.isValid = +[VCAudioSession convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDeviceEnabled:networkUplinkClockUsesBaseband:](VCAudioSession, "convertAudioSessionProperties:operatingMode:deviceRole:enableAudioPreWarming:audioClockDeviceEnabled:networkUplinkClockUsesBaseband:", a3, &self->_requestedSettings.operatingMode, &self->_requestedSettings.deviceRole, &self->_requestedSettings.enableAudioPreWarming, &self->_requestedSettings.audioClockDeviceEnabled, &self->_requestedSettings.networkUplinkClockUsesBaseband);
  -[VCAudioSession setAudioSessionProperties:](self->_audioSession, "setAudioSessionProperties:", a3);
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("kAUVoiceIOProperty_MediaPlaybackOnExternalDevice"));
  if (v5)
    objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "setMediaPlaybackOnExternalDevice:", objc_msgSend(v5, "BOOLValue"));
}

- (BOOL)startWithError:(id *)a3
{
  float v5;
  NSObject *v6;
  dispatch_time_t v7;
  const __CFString *v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  VCAudioClient *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  v21 = 0;
  v5 = micro();
  self->_lastAudioSessionStart = v5;
  if (self->_requestedSettings.isValid)
  {
    if (self->_requestedSettings.enableAudioPreWarming)
    {
      v6 = dispatch_semaphore_create(0);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __32__VCAudioClient_startWithError___block_invoke;
      v15[3] = &unk_1E9E557C0;
      v15[6] = &v16;
      v15[4] = v6;
      v15[5] = &v22;
      -[VCAudioClient startAudioIOWithCompletionHandler:](self, "startAudioIOWithCompletionHandler:", v15);
      v7 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v6, v7))
      {
        if ((VCAudioClient *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioClient startWithError:].cold.3();
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v8 = (const __CFString *)-[VCAudioClient performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v8 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136316162;
              v27 = v11;
              v28 = 2080;
              v29 = "-[VCAudioClient startWithError:]";
              v30 = 1024;
              v31 = 177;
              v32 = 2112;
              v33 = v8;
              v34 = 2048;
              v35 = self;
              _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Timeout occured while waiting for audio IO start!", buf, 0x30u);
              if (!a3)
                goto LABEL_28;
              goto LABEL_26;
            }
          }
        }
        if (a3)
        {
LABEL_26:
          v10 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32005, 0, CFSTR("Timeout while starting the client"));
          goto LABEL_27;
        }
      }
      else if (a3)
      {
        v10 = (void *)v17[5];
LABEL_27:
        *a3 = v10;
      }
LABEL_28:
      v13 = (id)v17[5];
      dispatch_release(v6);
      v9 = *((_BYTE *)v23 + 24) != 0;
      goto LABEL_29;
    }
    v9 = -[VCAudioClient startAudioSessionWithError:](self, "startAudioSessionWithError:", a3);
    *((_BYTE *)v23 + 24) = v9;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioClient startWithError:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCAudioClient startWithError:].cold.2();
      }
    }
    v9 = 0;
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32006, 0, CFSTR("Session parameters have not been set"));
  }
LABEL_29:
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v9;
}

intptr_t __32__VCAudioClient_startWithError___block_invoke(uint64_t a1, char a2, void *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)stopWithError:(id *)a3
{
  NSObject *v5;
  dispatch_time_t v6;
  const __CFString *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  VCAudioClient *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__14;
  v19 = __Block_byref_object_dispose__14;
  v20 = 0;
  if (self->_selectedSettings.enableAudioPreWarming)
  {
    v5 = dispatch_semaphore_create(0);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __31__VCAudioClient_stopWithError___block_invoke;
    v14[3] = &unk_1E9E557E8;
    v14[7] = &v15;
    v14[8] = a3;
    v14[5] = v5;
    v14[6] = &v21;
    v14[4] = self;
    -[VCAudioClient stopAudioIOWithCompletionHandler:](self, "stopAudioIOWithCompletionHandler:", v14);
    v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      if ((VCAudioClient *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioClient stopWithError:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v7 = (const __CFString *)-[VCAudioClient performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v7 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v26 = v10;
            v27 = 2080;
            v28 = "-[VCAudioClient stopWithError:]";
            v29 = 1024;
            v30 = 213;
            v31 = 2112;
            v32 = v7;
            v33 = 2048;
            v34 = self;
            _os_log_error_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Timeout occured while waiting for audio IO stop!", buf, 0x30u);
            if (!a3)
              goto LABEL_18;
            goto LABEL_16;
          }
        }
      }
      if (a3)
      {
LABEL_16:
        v9 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32005, 0, CFSTR("Timeout while stopping the client"));
        goto LABEL_17;
      }
    }
    else if (a3)
    {
      v9 = (void *)v16[5];
LABEL_17:
      *a3 = v9;
    }
LABEL_18:
    v12 = (id)v16[5];
    dispatch_release(v5);
    v8 = *((_BYTE *)v22 + 24) != 0;
    goto LABEL_19;
  }
  v8 = -[VCAudioClient stopAudioSessionWithError:](self, "stopAudioSessionWithError:", a3);
  *((_BYTE *)v22 + 24) = v8;
LABEL_19:
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
  return v8;
}

intptr_t __31__VCAudioClient_stopWithError___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 136315906;
      v11 = v6;
      v12 = 2080;
      v13 = "-[VCAudioClient stopWithError:]_block_invoke";
      v14 = 1024;
      v15 = 202;
      v16 = 2048;
      v17 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioClient=%p", (uint8_t *)&v10, 0x26u);
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  if ((a2 & 1) == 0 && *(_QWORD *)(a1 + 64))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)startAudioSessionWithError:(id *)a3
{
  __int128 v5;
  uint64_t v6;
  NSObject *v7;
  int processId;
  unsigned int state;
  _BOOL4 v10;
  VCAudioSessionMediaProperties *v11;
  _OWORD v13[2];
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  double v17;
  _BYTE v18[40];
  unsigned int v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19 = -1431655766;
  v17 = NAN;
  *(_QWORD *)v18 = -1;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v18[8] = v5;
  *(_OWORD *)&v18[24] = v5;
  -[VCAudioClient lock](self, "lock");
  if (self->_state)
  {
    -[VCAudioSession refreshAudioSessionProperties](self->_audioSession, "refreshAudioSessionProperties");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        processId = self->_processId;
        state = self->_state;
        *(_DWORD *)buf = 136316162;
        v21 = v6;
        v22 = 2080;
        v23 = "-[VCAudioClient startAudioSessionWithError:]";
        v24 = 1024;
        v25 = 265;
        v26 = 1024;
        v27 = processId;
        v28 = 1024;
        v29 = state;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d client is already running! (client PID=%d) state=%d", buf, 0x28u);
      }
    }
    LOBYTE(v10) = 0;
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32025, 0, CFSTR("Audio client was already started"));
  }
  else
  {
    -[VCAudioManager getPreferredFormat:blockSize:vpOperatingMode:forOperatingMode:deviceRole:suggestedFormat:](self->_audioManager, "getPreferredFormat:blockSize:vpOperatingMode:forOperatingMode:deviceRole:suggestedFormat:", v18, &v17, &v19, self->_requestedSettings.operatingMode, self->_requestedSettings.deviceRole, 0);
    v11 = objc_alloc_init(VCAudioSessionMediaProperties);
    -[VCAudioSessionMediaProperties setPreferredSampleRate:](v11, "setPreferredSampleRate:", *(double *)v18);
    -[VCAudioSessionMediaProperties setPreferredBlockSize:](v11, "setPreferredBlockSize:", v17);
    -[VCAudioSessionMediaProperties setOperatingMode:](v11, "setOperatingMode:", self->_requestedSettings.operatingMode);
    -[VCAudioSessionMediaProperties setVpOperatingMode:](v11, "setVpOperatingMode:", v19);
    v15[0] = *(_OWORD *)v18;
    v15[1] = *(_OWORD *)&v18[16];
    v16 = *(_QWORD *)&v18[32];
    -[VCAudioSessionMediaProperties setInputFormat:](v11, "setInputFormat:", v15);
    v13[0] = *(_OWORD *)v18;
    v13[1] = *(_OWORD *)&v18[16];
    v14 = *(_QWORD *)&v18[32];
    -[VCAudioSessionMediaProperties setOutputFormat:](v11, "setOutputFormat:", v13);
    -[VCAudioSessionMediaProperties setProcessId:](v11, "setProcessId:", self->_processId);
    -[VCAudioSessionMediaProperties setNetworkUplinkClockUsesBaseband:](v11, "setNetworkUplinkClockUsesBaseband:", self->_requestedSettings.networkUplinkClockUsesBaseband);
    -[VCAudioSessionMediaProperties setAudioClockDeviceEnabled:](v11, "setAudioClockDeviceEnabled:", self->_requestedSettings.audioClockDeviceEnabled);
    v10 = -[VCAudioSession startClient:clientType:mediaProperties:sessionRef:](self->_audioSession, "startClient:clientType:mediaProperties:sessionRef:", self, 2, v11, 0);
    if (v10)
    {
      self->_state = 5;
      self->_selectedSettings = self->_requestedSettings;
    }

  }
  -[VCAudioClient unlock](self, "unlock");
  return v10;
}

- (BOOL)stopAudioSessionWithError:(id *)a3
{
  unsigned int state;
  uint64_t v5;
  NSObject *v6;
  int processId;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[VCAudioClient lock](self, "lock", a3);
  state = self->_state;
  if (state == 5)
  {
    -[VCAudioSession stopClient:](self->_audioSession, "stopClient:", self);
    self->_state = 0;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      processId = self->_processId;
      v9 = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCAudioClient stopAudioSessionWithError:]";
      v13 = 1024;
      v14 = 290;
      v15 = 1024;
      v16 = processId;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stop requested but the client is not started! (client PID=%d)", (uint8_t *)&v9, 0x22u);
    }
  }
  -[VCAudioClient unlock](self, "unlock");
  return state == 5;
}

- (void)setupSpatialAudio
{
  int v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (+[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"))
  {
    v3 = -[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:](self->_audioManager, "registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:", self->_audioSessionId, 1, 32, 0);
    if (v3 < 0)
    {
      v4 = v3;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315906;
          v8 = v5;
          v9 = 2080;
          v10 = "-[VCAudioClient setupSpatialAudio]";
          v11 = 1024;
          v12 = 313;
          v13 = 1024;
          v14 = v4;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Failed to register for spatial audio. status=%08x", (uint8_t *)&v7, 0x22u);
        }
      }
    }
  }
}

- (void)cleanupSpatialAudio
{
  if (+[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"))
    -[VCAudioManager unregisterAudioSessionId:](self->_audioManager, "unregisterAudioSessionId:", self->_audioSessionId);
}

- (BOOL)setupAudioIO
{
  int64_t v3;
  double v4;
  uint64_t v5;
  VCAudioIO *v6;
  VCAudioIO *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23[0] = xmmword_1D910CFF0;
  v23[1] = unk_1D910D000;
  v24 = xmmword_1D910D010;
  v3 = +[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass");
  v4 = dbl_1D910CFE0[+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") == 8];
  if (v3 == 8)
    v5 = 48000;
  else
    v5 = 24000;
  *(double *)v23 = (double)(int)VCDefaults_GetIntValueForKey(CFSTR("forceAudioSampleRate"), v5);
  DWORD2(v24) = (VCDefaults_GetDoubleValueForKey(CFSTR("forceAudioBlockSize"), v4) * *(double *)v23);
  self->_audioSessionId = VCUniqueIDGenerator_GenerateID();
  self->_selectedSettings = self->_requestedSettings;
  -[VCAudioClient setupSpatialAudio](self, "setupSpatialAudio");
  v9 = 0u;
  v10 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  LODWORD(v9) = self->_audioSessionId;
  *((_QWORD *)&v9 + 1) = *(_QWORD *)&self->_selectedSettings.operatingMode;
  BYTE4(v10) = 3;
  LODWORD(v11) = self->_processId;
  BYTE12(v11) = 1;
  DWORD2(v12) = 1;
  v13 = 0uLL;
  BYTE8(v22) = self->_selectedSettings.networkUplinkClockUsesBaseband;
  v6 = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", &v9);
  v7 = v6;
  self->_audioIO = v6;
  if (v6)
  {
    -[VCAudioIO setClientFormat:](v6, "setClientFormat:", v23, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioClient setupAudioIO].cold.1();
    }
    -[VCAudioClient cleanupAudioIO](self, "cleanupAudioIO", v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, *(_QWORD *)&v23[0]);
  }
  return v7 != 0;
}

- (void)cleanupAudioIO
{
  -[VCAudioClient setAudioIO:](self, "setAudioIO:", 0);
  -[VCAudioClient cleanupSpatialAudio](self, "cleanupSpatialAudio");
  self->_audioSessionId = 0;
}

- (void)startAudioIOWithCompletionHandler:(id)a3
{
  unsigned int state;
  unsigned int v7;
  uint64_t v8;
  char IsOSFaultDisabled;
  NSObject *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  int processId;
  unsigned int v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[VCAudioClient lock](self, "lock", MEMORY[0x1E0C809B0], 3221225472, __51__VCAudioClient_startAudioIOWithCompletionHandler___block_invoke, &unk_1E9E53C70, self, a3);
  state = self->_state;
  if (state == 5 || state == 0)
    -[VCAudioClient setupAudioIO](self, "setupAudioIO");
  if (self->_audioIO)
  {
    v7 = self->_state;
    if (v7)
    {
      if (v7 != 5)
      {
        if (v7 == 3)
        {
          -[VCAudioClient unlock](self, "unlock");
          if (a3)
            (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32026, 0, CFSTR("Audio IO is busy")));
          return;
        }
        -[VCAudioSession refreshAudioSessionProperties](self->_audioSession, "refreshAudioSessionProperties");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            processId = self->_processId;
            v20 = self->_state;
            *(_DWORD *)buf = 136316162;
            v28 = v17;
            v29 = 2080;
            v30 = "-[VCAudioClient startAudioIOWithCompletionHandler:]";
            v31 = 1024;
            v32 = 452;
            v33 = 1024;
            v34 = processId;
            v35 = 1024;
            v36 = v20;
            _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d client is already running! (client PID=%d) state=%d", buf, 0x28u);
          }
        }
        -[VCAudioClient unlock](self, "unlock");
        if (a3)
        {
          v21 = (void *)MEMORY[0x1E0CB35C8];
          v22 = CFSTR("Audio client was already started");
          v23 = 32025;
LABEL_32:
          (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, objc_msgSend(v21, "AVConferenceServiceError:detailCode:description:", v23, 0, v22));
          return;
        }
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_state;
          *(_DWORD *)buf = 136315906;
          v28 = v14;
          v29 = 2080;
          v30 = "-[VCAudioClient startAudioIOWithCompletionHandler:]";
          v31 = 1024;
          v32 = 442;
          v33 = 1024;
          v34 = v16;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Upgrade detected. Need to start audioIO, state = %d", buf, 0x22u);
        }
      }
      -[VCAudioSession refreshAudioSessionProperties](self->_audioSession, "refreshAudioSessionProperties");
      v13 = 4;
    }
    else
    {
      v13 = 1;
    }
    self->_state = v13;
    -[VCAudioClient unlock](self, "unlock");
    -[VCAudioIO startWithCompletionHandler:](self->_audioIO, "startWithCompletionHandler:", &v26);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
    v10 = *MEMORY[0x1E0CF2758];
    if ((IsOSFaultDisabled & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v11 = self->_processId;
        v12 = self->_state;
        *(_DWORD *)buf = 136316162;
        v28 = v8;
        v29 = 2080;
        v30 = "-[VCAudioClient startAudioIOWithCompletionHandler:]";
        v31 = 1024;
        v32 = 421;
        v33 = 1024;
        v34 = v11;
        v35 = 1024;
        v36 = v12;
        _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d AudioIO is nil! (client PID=%d), state:%d", buf, 0x28u);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      v24 = self->_processId;
      v25 = self->_state;
      *(_DWORD *)buf = 136316162;
      v28 = v8;
      v29 = 2080;
      v30 = "-[VCAudioClient startAudioIOWithCompletionHandler:]";
      v31 = 1024;
      v32 = 421;
      v33 = 1024;
      v34 = v24;
      v35 = 1024;
      v36 = v25;
      _os_log_fault_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_FAULT, " [%s] %s:%d AudioIO is nil! (client PID=%d), state:%d", buf, 0x28u);
    }
  }
  -[VCAudioClient unlock](self, "unlock");
  if (a3)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = CFSTR("Audio IO is nil");
    v23 = 32015;
    goto LABEL_32;
  }
}

uint64_t __51__VCAudioClient_startAudioIOWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28);
      v13 = 136316162;
      v14 = v6;
      v15 = 2080;
      v16 = "-[VCAudioClient startAudioIOWithCompletionHandler:]_block_invoke";
      v17 = 1024;
      v18 = 392;
      v19 = 1024;
      v20 = v8;
      v21 = 1024;
      v22 = a2;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Completion handler. State=%d, success=%d", (uint8_t *)&v13, 0x28u);
    }
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_DWORD *)(v9 + 28);
  if (v10 == 4)
  {
    objc_msgSend(*(id *)(v9 + 152), "stopClient:");
    if ((_DWORD)a2)
      v11 = 2;
    else
      v11 = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 28) = v11;
  }
  else if (v10 == 1)
  {
    if ((_DWORD)a2)
    {
      *(_DWORD *)(v9 + 28) = 2;
    }
    else
    {
      *(_DWORD *)(v9 + 28) = 0;
      objc_msgSend(*(id *)(a1 + 32), "cleanupAudioIO");
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)stopAudioIOWithCompletionHandler:(id)a3
{
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__VCAudioClient_stopAudioIOWithCompletionHandler___block_invoke;
  v5[3] = &unk_1E9E53C70;
  v5[4] = self;
  v5[5] = a3;
  -[VCAudioClient lock](self, "lock");
  if (self->_state - 1 <= 1)
  {
    self->_state = 3;
    -[VCAudioClient unlock](self, "unlock");
    -[VCAudioIO stopWithCompletionHandler:](self->_audioIO, "stopWithCompletionHandler:", v5);
    return;
  }
  -[VCAudioClient unlock](self, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3
    && (VRTraceErrorLogLevelToCSTR(), os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
  {
    -[VCAudioClient stopAudioIOWithCompletionHandler:].cold.1();
    if (!a3)
      return;
  }
  else if (!a3)
  {
    return;
  }
  (*((void (**)(id, _QWORD, uint64_t))a3 + 2))(a3, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32012, 0, CFSTR("Audio client is not running")));
}

uint64_t __50__VCAudioClient_stopAudioIOWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 136315906;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VCAudioClient stopAudioIOWithCompletionHandler:]_block_invoke";
      v15 = 1024;
      v16 = 466;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCAudioClient=%p", (uint8_t *)&v11, 0x26u);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v9 = *(_QWORD *)(a1 + 32);
  if ((_DWORD)a2)
  {
    *(_DWORD *)(v9 + 28) = 0;
    objc_msgSend(*(id *)(a1 + 32), "cleanupAudioIO");
  }
  else
  {
    *(_DWORD *)(v9 + 28) = 2;
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (id)getCurrentAudioDeviceWithType:(BOOL)a3
{
  return 0;
}

- (BOOL)setCurrentAudioDevice:(id)a3 type:(BOOL)a4
{
  return 1;
}

- (AVAudioDevice)inputDevice
{
  return 0;
}

- (AVAudioDevice)outputDevice
{
  return 0;
}

- (void)serverDidDie
{
  NSObject *global_queue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(2, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __29__VCAudioClient_serverDidDie__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

uint64_t __29__VCAudioClient_serverDidDie__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopWithError:", 0);
}

- (int)processId
{
  return self->_processId;
}

- (VCAudioIO)audioIO
{
  return self->_audioIO;
}

- (void)setAudioIO:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)isMutedTalkerNotificationRegistered
{
  return self->_isMutedTalkerNotificationRegistered;
}

- (void)setIsMutedTalkerNotificationRegistered:(BOOL)a3
{
  self->_isMutedTalkerNotificationRegistered = a3;
}

- (BOOL)isMixingVoiceWithMediaEnabled
{
  return self->_mixingVoiceWithMediaEnabled;
}

- (BOOL)isFollowSystemInputEnabled
{
  return self->_followSystemInput;
}

- (BOOL)isFollowSystemOutputEnabled
{
  return self->_followSystemOutput;
}

- (BOOL)isMutedStateChangeHandlerRegistered
{
  return self->_isMutedStateChangeHandlerRegistered;
}

- (void)setIsMutedStateChangeHandlerRegistered:(BOOL)a3
{
  self->_isMutedStateChangeHandlerRegistered = a3;
}

- (void)startWithError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Audio client is trying to start but session parameters have not been set! (client PID=%d)", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)startWithError:.cold.2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_2_6();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d Audio client is trying to start but session parameters have not been set! (client PID=%d)", v1, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)startWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Timeout occured while waiting for audio IO start!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Timeout occured while waiting for audio IO stop!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupAudioIO
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopAudioIOWithCompletionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCAudioClient stopAudioIOWithCompletionHandler:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d client is not running! (client PID=%d)", v2, *(const char **)v3, (unint64_t)"-[VCAudioClient stopAudioIOWithCompletionHandler:]" >> 16, 492);
  OUTLINED_FUNCTION_3();
}

@end
