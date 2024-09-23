@implementation VCAudioManager

+ (id)sharedVoiceChatInstance
{
  if (sharedVoiceChatInstance_onceToken != -1)
    dispatch_once(&sharedVoiceChatInstance_onceToken, &__block_literal_global_0);
  return (id)sharedVoiceChatInstance__VCAudioManagerVoiceChat;
}

VCAudioManager *__41__VCAudioManager_sharedVoiceChatInstance__block_invoke()
{
  VCAudioManager *result;

  result = -[VCAudioManager initWithAudioSessionMode:]([VCAudioManager alloc], "initWithAudioSessionMode:", 0);
  sharedVoiceChatInstance__VCAudioManagerVoiceChat = (uint64_t)result;
  return result;
}

+ (id)sharedSystemAudioOutputInstance
{
  if (sharedSystemAudioOutputInstance_onceToken != -1)
    dispatch_once(&sharedSystemAudioOutputInstance_onceToken, &__block_literal_global_11);
  return (id)sharedSystemAudioOutputInstance__VCAudioManagerSystemAudio;
}

VCAudioManager *__49__VCAudioManager_sharedSystemAudioOutputInstance__block_invoke()
{
  VCAudioManager *result;

  result = -[VCAudioManager initWithAudioSessionMode:]([VCAudioManager alloc], "initWithAudioSessionMode:", 1);
  sharedSystemAudioOutputInstance__VCAudioManagerSystemAudio = (uint64_t)result;
  return result;
}

+ (id)sharedSystemAudioInputInstance
{
  if (sharedSystemAudioInputInstance_onceToken != -1)
    dispatch_once(&sharedSystemAudioInputInstance_onceToken, &__block_literal_global_12);
  return (id)sharedSystemAudioInputInstance__VCAudioManagerSystemAudioInput;
}

VCAudioManager *__48__VCAudioManager_sharedSystemAudioInputInstance__block_invoke()
{
  VCAudioManager *result;

  result = -[VCAudioManager initWithAudioSessionMode:]([VCAudioManager alloc], "initWithAudioSessionMode:", 2);
  sharedSystemAudioInputInstance__VCAudioManagerSystemAudioInput = (uint64_t)result;
  return result;
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
  VCTerminateProcess((uint64_t)a3, a4, (uint64_t)a5);
}

- (unint64_t)retainCount
{
  return -1;
}

- (_VCAudioIOControllerIOState)sinkIO
{
  return &self->_sinkData;
}

- (_VCAudioIOControllerIOState)sourceIO
{
  return &self->_sourceData;
}

- (void)getPreferredFormat:(AudioStreamBasicDescription *)a3 blockSize:(double *)a4 vpOperatingMode:(unsigned int *)a5 forOperatingMode:(int)a6 deviceRole:(int)a7 suggestedFormat:(AudioStreamBasicDescription *)a8
{
  double mSampleRate;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  unsigned int v20;
  int v21;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  int v32;
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  VCAudioManager *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (a8)
    mSampleRate = a8->mSampleRate;
  else
    mSampleRate = 24000.0;
  v14 = -[VCAudioManager vpOperationModeForConferenceOperatingMode:deviceRole:](self, "vpOperationModeForConferenceOperatingMode:deviceRole:", *(_QWORD *)&a6, *(_QWORD *)&a7);
  if (-[VCHardwareSettingsEmbedded deviceClass](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "deviceClass") == 6&& -[VCHardwareSettingsEmbedded chipId](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "chipId") < 0x8000)
  {
    mSampleRate = 16000.0;
  }
  v15 = -[NSDictionary objectForKeyedSubscript:](self->_vpOperatingModeToAudioSessionMediaFormatMapping, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14));
  if (v15)
  {
    v16 = v15;
    objc_msgSend(v15, "preferredBlockSize");
    v18 = v17;
    objc_msgSend(v16, "preferredSampleRate");
    mSampleRate = v19;
  }
  else
  {
    v18 = 0x3F947AE147AE147BLL;
  }
  v20 = -[VCDefaults forceAudioChannelCount](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioChannelCount");
  if (v20 <= 1)
    v21 = 1;
  else
    v21 = v20;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v32 = 136315906;
        v33 = v23;
        v34 = 2080;
        v35 = "-[VCAudioManager getPreferredFormat:blockSize:vpOperatingMode:forOperatingMode:deviceRole:suggestedFormat:]";
        v36 = 1024;
        v37 = 395;
        v38 = 1024;
        LODWORD(v39) = v21;
        v25 = " [%s] %s:%d using audio channelCount[%d]";
        v26 = v24;
        v27 = 34;
LABEL_23:
        _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&v32, v27);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v32 = 136316418;
        v33 = v28;
        v34 = 2080;
        v35 = "-[VCAudioManager getPreferredFormat:blockSize:vpOperatingMode:forOperatingMode:deviceRole:suggestedFormat:]";
        v36 = 1024;
        v37 = 395;
        v38 = 2112;
        v39 = v22;
        v40 = 2048;
        v41 = self;
        v42 = 1024;
        v43 = v21;
        v25 = " [%s] %s:%d %@(%p) using audio channelCount[%d]";
        v26 = v29;
        v27 = 54;
        goto LABEL_23;
      }
    }
  }
  if (!a3)
    goto LABEL_27;
  if (a8)
  {
    v31 = *(_OWORD *)&a8->mSampleRate;
    v30 = *(_OWORD *)&a8->mBytesPerPacket;
    *(_QWORD *)&a3->mBitsPerChannel = *(_QWORD *)&a8->mBitsPerChannel;
    *(_OWORD *)&a3->mSampleRate = v31;
    *(_OWORD *)&a3->mBytesPerPacket = v30;
    a3->mSampleRate = mSampleRate;
LABEL_27:
    if (!a4)
      goto LABEL_29;
    goto LABEL_28;
  }
  Format_Float((uint64_t)a3, v21, (int)mSampleRate);
  if (a4)
LABEL_28:
    *(_QWORD *)a4 = v18;
LABEL_29:
  if (a5)
    *a5 = v14;
}

+ (id)audioSessionForMode:(int)a3
{
  switch(a3)
  {
    case 2:
      return +[VCAudioSession sharedSystemAudioInputInstance](VCAudioSession, "sharedSystemAudioInputInstance");
    case 1:
      return +[VCAudioSession sharedSystemAudioOutputInstance](VCAudioSession, "sharedSystemAudioOutputInstance");
    case 0:
      return +[VCAudioSession sharedVoiceChatInstance](VCAudioSession, "sharedVoiceChatInstance");
  }
  return result;
}

- (VCAudioManager)initWithAudioSessionMode:(int)a3
{
  uint64_t v3;
  VCAudioManager *v4;
  const char *v5;
  id v6;
  uint64_t v7;
  VCAudioSession *v8;
  NSObject *CustomRootQueue;
  dispatch_queue_t v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  const __CFAllocator *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  NSObject *global_queue;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD block[5];
  objc_super v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  VCAudioManager *v53;
  uint64_t v54;

  v3 = *(_QWORD *)&a3;
  v54 = *MEMORY[0x1E0C80C00];
  v43.receiver = self;
  v43.super_class = (Class)VCAudioManager;
  v4 = -[VCObject init](&v43, sel_init);
  if (!v4)
    return v4;
  v5 = "SystemAudioOutput";
  if ((_DWORD)v3 == 2)
    v5 = "SystemAudioInput";
  if (!(_DWORD)v3)
    v5 = "VoiceChat";
  -[VCObject setLogPrefix:](v4, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("controllerType=%s "), v5));
  snprintf(v4->_sourceData.logPrefix, 0x28uLL, "%s (speaker)", -[NSString UTF8String](-[VCObject logPrefix](v4, "logPrefix"), "UTF8String"));
  snprintf(v4->_sinkData.logPrefix, 0x28uLL, "%s (mic)", -[NSString UTF8String](-[VCObject logPrefix](v4, "logPrefix"), "UTF8String"));
  v4->_playbackMode = v3;
  v6 = objc_alloc(MEMORY[0x1E0C99D20]);
  v7 = objc_msgSend(v6, "initWithObjects:", _stateNotSet, _stateIdle, _stateSessionStarted, _stateRunning, _stateInterrupted, 0);
  v4->_stateStrings = (NSArray *)v7;
  if (!v7)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.1();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v18 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v29;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 436;
    v50 = 2112;
    v51 = v18;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to allocate stateStrings array";
    goto LABEL_136;
  }
  v4->_useOptimizedHandoversForTelephony = 0;
  v4->_useOptimizedHandoversForTelephony = +[VCHardwareSettings supportsOptimizedHandoversForTelephony](VCHardwareSettings, "supportsOptimizedHandoversForTelephony");
  v8 = +[VCAudioManager audioSessionForMode:](VCAudioManager, "audioSessionForMode:", v3);
  v4->_audioSession = v8;
  if (!v8)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.2();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v32 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v32;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 441;
    v50 = 2112;
    v51 = v19;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to pass a valid audio session";
    goto LABEL_136;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(62);
  v10 = dispatch_queue_create_with_target_V2("com.apple.AVConference.audiomanagerqueue", 0, CustomRootQueue);
  v4->_dispatchQueue = (OS_dispatch_queue *)v10;
  if (!v10)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.3();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v33 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v33;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 444;
    v50 = 2112;
    v51 = v20;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to allocate the dispatch queue";
    goto LABEL_136;
  }
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4->_allClients = v11;
  if (!v11)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.4();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v34 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v34;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 446;
    v50 = 2112;
    v51 = v21;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to allocate client array";
    goto LABEL_136;
  }
  v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4->_startingIOClients = v12;
  if (!v12)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.5();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v35 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v35;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 448;
    v50 = 2112;
    v51 = v22;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to allocate starting IO client array";
    goto LABEL_136;
  }
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 100, &v4->_sourceData.eventQueue) < 0)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.6();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v36 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v36;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 450;
    v50 = 2112;
    v51 = v23;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to allocate source event queue";
    goto LABEL_136;
  }
  if (CMSimpleQueueCreate(v13, 100, &v4->_sinkData.eventQueue) < 0)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.7();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v37 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v37;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 452;
    v50 = 2112;
    v51 = v24;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to allocate sink event queue";
    goto LABEL_136;
  }
  if ((VCSingleLinkedListInitialize((uint64_t)&v4->_sourceData.clientIOList, (uint64_t)_VCAudioManger_CompareControllerEntries) & 1) == 0)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.12();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v38 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v38;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 454;
    v50 = 2112;
    v51 = v25;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to initialize source data link list";
    goto LABEL_136;
  }
  if ((VCSingleLinkedListInitialize((uint64_t)&v4->_sinkData.clientIOList, (uint64_t)_VCAudioManger_CompareControllerEntries) & 1) == 0)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.11();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v39 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v39;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 456;
    v50 = 2112;
    v51 = v26;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to initialize sink data link list";
    goto LABEL_136;
  }
  v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4->_spatialContexts = v14;
  if (!v14)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.8();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_137;
    v40 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_137;
    *(_DWORD *)buf = 136316162;
    v45 = v40;
    v46 = 2080;
    v47 = "-[VCAudioManager initWithAudioSessionMode:]";
    v48 = 1024;
    v49 = 458;
    v50 = 2112;
    v51 = v27;
    v52 = 2048;
    v53 = v4;
    v31 = " [%s] %s:%d %@(%p) Failed to create allocate the spatial context dictionary";
LABEL_136:
    _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0x30u);
    goto LABEL_137;
  }
  v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4->_audioSessionSinkMuted = v15;
  if (!v15)
  {
    if ((VCAudioManager *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager initWithAudioSessionMode:].cold.9();
      }
      goto LABEL_137;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (const __CFString *)-[VCAudioManager performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v28 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v45 = v41;
        v46 = 2080;
        v47 = "-[VCAudioManager initWithAudioSessionMode:]";
        v48 = 1024;
        v49 = 460;
        v50 = 2112;
        v51 = v28;
        v52 = 2048;
        v53 = v4;
        v31 = " [%s] %s:%d %@(%p) Failed to create allocate the audio session muted dictionary";
        goto LABEL_136;
      }
    }
LABEL_137:

    return 0;
  }
  if (v4->_playbackMode)
    goto LABEL_20;
  if (!-[VCAudioManager setupVAD](v4, "setupVAD"))
    goto LABEL_137;
  if (!-[VCAudioManager setupInterruptThread](v4, "setupInterruptThread"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager initWithAudioSessionMode:].cold.10();
    }
    goto LABEL_137;
  }
LABEL_20:
  v4->_state = 1;
  v4->_interruptThreadState = 1;
  v4->_hAUIO = (tagHANDLE *)0xFFFFFFFFLL;
  pthread_mutex_init(&v4->_interruptingMutex, 0);
  pthread_mutex_init(&v4->_inputDeviceMutex, 0);
  pthread_mutex_init(&v4->_outputDeviceMutex, 0);
  v4->_isInterrupting = 0;
  if (!v4->_playbackMode)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__VCAudioManager_initWithAudioSessionMode___block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = v4;
    dispatch_async(global_queue, block);
  }
  return v4;
}

uint64_t __43__VCAudioManager_initWithAudioSessionMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "computeHardwarePreferences");
}

- (NSString)description
{
  void *v3;
  NSString *v4;
  const char *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)VCAudioManager;
  v4 = -[VCAudioManager description](&v7, sel_description);
  if (self->_playbackMode)
    v5 = "System";
  else
    v5 = "VoiceChat";
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@ controllerType=%s }"), v4, v5);
}

- (void)dealloc
{
  opaqueCMSimpleQueue *eventQueue;
  opaqueCMSimpleQueue *v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];

  -[VCAudioManager cleanupInterruptThread](self, "cleanupInterruptThread");
  VCVoiceDetector_Destroy((void **)&self->_sinkData.voiceDetector);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
  eventQueue = self->_sourceData.eventQueue;
  if (eventQueue)
    CFRelease(eventQueue);
  v4 = self->_sinkData.eventQueue;
  if (v4)
    CFRelease(v4);

  dispatch_release((dispatch_object_t)self->_dispatchQueue);
  pthread_mutex_destroy(&self->_outputDeviceMutex);
  pthread_mutex_destroy(&self->_inputDeviceMutex);
  pthread_mutex_destroy(&self->_interruptingMutex);
  v5.receiver = self;
  v5.super_class = (Class)VCAudioManager;
  -[VCObject dealloc](&v5, sel_dealloc);
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__VCAudioManager_setMicrophoneMuted___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, block);
}

void __37__VCAudioManager_setMicrophoneMuted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_DWORD *)(v2 + 904))
  {
    *(_BYTE *)(v2 + 249) = *(_BYTE *)(a1 + 40);
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v15 = *(unsigned __int8 *)(a1 + 40);
          v24 = 136315906;
          v25 = v13;
          v26 = 2080;
          v27 = "-[VCAudioManager setMicrophoneMuted:]_block_invoke";
          v28 = 1024;
          v29 = 557;
          v30 = 1024;
          LODWORD(v31) = v15;
          v16 = " [%s] %s:%d setMicrophoneMuted:%d";
          v17 = v14;
          v18 = 34;
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v18);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 32);
          v22 = *(unsigned __int8 *)(a1 + 40);
          v24 = 136316418;
          v25 = v19;
          v26 = 2080;
          v27 = "-[VCAudioManager setMicrophoneMuted:]_block_invoke";
          v28 = 1024;
          v29 = 557;
          v30 = 2112;
          v31 = v4;
          v32 = 2048;
          v33 = v21;
          v34 = 1024;
          v35 = v22;
          v16 = " [%s] %s:%d %@(%p) setMicrophoneMuted:%d";
          v17 = v20;
          v18 = 54;
          goto LABEL_23;
        }
      }
    }
    v23 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v23 + 168) != 0xFFFFFFFFLL)
    {
      *(_BYTE *)(v23 + 432) = *(_BYTE *)(a1 + 40);
      AUIOSetMute(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), *(unsigned __int8 *)(a1 + 40));
    }
    return;
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315650;
        v25 = v5;
        v26 = 2080;
        v27 = "-[VCAudioManager setMicrophoneMuted:]_block_invoke";
        v28 = 1024;
        v29 = 553;
        v7 = " [%s] %s:%d Not applying mute to the AUIO because this manager does not support it.";
        v8 = v6;
        v9 = 28;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v24, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v24 = 136316162;
        v25 = v10;
        v26 = 2080;
        v27 = "-[VCAudioManager setMicrophoneMuted:]_block_invoke";
        v28 = 1024;
        v29 = 553;
        v30 = 2112;
        v31 = v3;
        v32 = 2048;
        v33 = v12;
        v7 = " [%s] %s:%d %@(%p) Not applying mute to the AUIO because this manager does not support it.";
        v8 = v11;
        v9 = 48;
        goto LABEL_15;
      }
    }
  }
}

- (void)setMixingVoiceWithMediaEnabled:(BOOL)a3
{
  const __CFString *v4;
  _BOOL8 v5;
  id v6;
  NSObject *dispatchQueue;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCAudioManager *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_playbackMode)
  {
    v5 = a3;
    v6 = +[VCAudioSession sharedVoiceChatInstance](VCAudioSession, "sharedVoiceChatInstance");
    v17 = *MEMORY[0x1E0D498C0];
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    objc_msgSend(v6, "updateAudioSessionPropertiesWithProperties:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    dispatchQueue = self->_dispatchQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__VCAudioManager_setMixingVoiceWithMediaEnabled___block_invoke;
    v15[3] = &unk_1E9E521E8;
    v15[4] = self;
    v16 = v5;
    dispatch_async(dispatchQueue, v15);
    return;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v20 = v8;
        v21 = 2080;
        v22 = "-[VCAudioManager setMixingVoiceWithMediaEnabled:]";
        v23 = 1024;
        v24 = 567;
        v10 = " [%s] %s:%d ignore";
        v11 = v9;
        v12 = 28;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v20 = v13;
        v21 = 2080;
        v22 = "-[VCAudioManager setMixingVoiceWithMediaEnabled:]";
        v23 = 1024;
        v24 = 567;
        v25 = 2112;
        v26 = v4;
        v27 = 2048;
        v28 = self;
        v10 = " [%s] %s:%d %@(%p) ignore";
        v11 = v14;
        v12 = 48;
        goto LABEL_13;
      }
    }
  }
}

uint64_t __49__VCAudioManager_setMixingVoiceWithMediaEnabled___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 250) = *(_BYTE *)(a1 + 40);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v5 = *(unsigned __int8 *)(a1 + 40);
    v14 = 136315906;
    v15 = v3;
    v16 = 2080;
    v17 = "-[VCAudioManager setMixingVoiceWithMediaEnabled:]_block_invoke";
    v18 = 1024;
    v19 = 579;
    v20 = 1024;
    LODWORD(v21) = v5;
    v6 = " [%s] %s:%d setMixingVoiceWithMediaEnabled:%d";
    v7 = v4;
    v8 = 34;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
  else
    v2 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(unsigned __int8 *)(a1 + 40);
      v14 = 136316418;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VCAudioManager setMixingVoiceWithMediaEnabled:]_block_invoke";
      v18 = 1024;
      v19 = 579;
      v20 = 2112;
      v21 = v2;
      v22 = 2048;
      v23 = v11;
      v24 = 1024;
      v25 = v12;
      v6 = " [%s] %s:%d %@(%p) setMixingVoiceWithMediaEnabled:%d";
      v7 = v10;
      v8 = 54;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v14, v8);
    }
  }
LABEL_12:
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  if (result != 0xFFFFFFFFLL)
    return AUIOSetVoiceMixingMedia(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)setMute:(BOOL)a3 forClient:(id)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__VCAudioManager_setMute_forClient___block_invoke;
  v5[3] = &unk_1E9E52210;
  v5[4] = self;
  v5[5] = a4;
  v6 = a3;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __36__VCAudioManager_setMute_forClient___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  int v18;
  _BYTE v19[24];
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() != *(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)v19 = 136316674;
    *(_QWORD *)&v19[4] = v10;
    *(_WORD *)&v19[12] = 2080;
    *(_QWORD *)&v19[14] = "-[VCAudioManager setMute:forClient:]_block_invoke";
    *(_WORD *)&v19[22] = 1024;
    LODWORD(v20) = 588;
    WORD2(v20) = 2112;
    *(_QWORD *)((char *)&v20 + 6) = v2;
    HIWORD(v20) = 2048;
    v21 = v12;
    LOWORD(v22) = 2048;
    *(_QWORD *)((char *)&v22 + 2) = v13;
    WORD5(v22) = 1024;
    HIDWORD(v22) = v14;
    v7 = " [%s] %s:%d %@(%p) client=%p mute=%d";
    v8 = v11;
    v9 = 64;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(unsigned __int8 *)(a1 + 48);
      *(_DWORD *)v19 = 136316162;
      *(_QWORD *)&v19[4] = v3;
      *(_WORD *)&v19[12] = 2080;
      *(_QWORD *)&v19[14] = "-[VCAudioManager setMute:forClient:]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 588;
      WORD2(v20) = 2048;
      *(_QWORD *)((char *)&v20 + 6) = v5;
      HIWORD(v20) = 1024;
      LODWORD(v21) = v6;
      v7 = " [%s] %s:%d client=%p mute=%d";
      v8 = v4;
      v9 = 44;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v19, v9);
    }
  }
LABEL_12:
  v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48), *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, v21, v22);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 920), "setObject:forKeyedSubscript:", v15, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(a1 + 40), "audioSessionId")));
  v17 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v17 + 184) >= 3u)
  {
    v18 = objc_msgSend(*(id *)(v17 + 200), "audioSessionId");
    result = objc_msgSend(*(id *)(a1 + 40), "audioSessionId");
    if (v18 == (_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "applyAudioSessionMute");
  }
  return result;
}

- (void)applyAudioSessionMute
{
  const __CFString *v3;
  void *v4;
  int isMicrophoneMuted;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BYTE v30[10];
  VCAudioManager *v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (!self->_playbackMode)
  {
    v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_audioSessionSinkMuted, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCAudioUnitProperties audioSessionId](self->_currentAudioUnitProperties, "audioSessionId")));
    if (v4)
      isMicrophoneMuted = objc_msgSend(v4, "BOOLValue");
    else
      isMicrophoneMuted = self->_isMicrophoneMuted;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_27;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v16 = -[VCAudioUnitProperties audioSessionId](self->_currentAudioUnitProperties, "audioSessionId");
      v23 = 136316162;
      v24 = v14;
      v25 = 2080;
      v26 = "-[VCAudioManager applyAudioSessionMute]";
      v27 = 1024;
      v28 = 603;
      v29 = 1024;
      *(_DWORD *)v30 = v16;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = isMicrophoneMuted;
      v17 = " [%s] %s:%d Applying mute property for audioSessionId=%d, isMuted=%d";
      v18 = v15;
      v19 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_27;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      v22 = -[VCAudioUnitProperties audioSessionId](self->_currentAudioUnitProperties, "audioSessionId");
      v23 = 136316674;
      v24 = v20;
      v25 = 2080;
      v26 = "-[VCAudioManager applyAudioSessionMute]";
      v27 = 1024;
      v28 = 603;
      v29 = 2112;
      *(_QWORD *)v30 = v13;
      *(_WORD *)&v30[8] = 2048;
      v31 = self;
      v32 = 1024;
      v33 = v22;
      v34 = 1024;
      v35 = isMicrophoneMuted;
      v17 = " [%s] %s:%d %@(%p) Applying mute property for audioSessionId=%d, isMuted=%d";
      v18 = v21;
      v19 = 60;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, v19);
LABEL_27:
    self->_sinkData.isMuted = isMicrophoneMuted;
    AUIOSetMute((uint64_t)self->_hAUIO, isMicrophoneMuted);
    return;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315650;
        v24 = v6;
        v25 = 2080;
        v26 = "-[VCAudioManager applyAudioSessionMute]";
        v27 = 1024;
        v28 = 598;
        v8 = " [%s] %s:%d Not applying mute to the AUIO because this manager does not support it.";
        v9 = v7;
        v10 = 28;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v23, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136316162;
        v24 = v11;
        v25 = 2080;
        v26 = "-[VCAudioManager applyAudioSessionMute]";
        v27 = 1024;
        v28 = 598;
        v29 = 2112;
        *(_QWORD *)v30 = v3;
        *(_WORD *)&v30[8] = 2048;
        v31 = self;
        v8 = " [%s] %s:%d %@(%p) Not applying mute to the AUIO because this manager does not support it.";
        v9 = v12;
        v10 = 48;
        goto LABEL_14;
      }
    }
  }
}

- (void)setInputMetering
{
  NSMutableArray *allClients;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_hAUIO != (tagHANDLE *)0xFFFFFFFFLL)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    allClients = self->_allClients;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(allClients);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isInputMeteringEnabled") & 1) != 0)
          {
            v8 = 1;
            goto LABEL_12;
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
        if (v5)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_12:
    self->_isInputMeteringEnabled = v8;
    AUIOSetInputMeterEnabled((uint64_t)self->_hAUIO, v8);
  }
}

- (void)setOutputMetering
{
  NSMutableArray *allClients;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_hAUIO != (tagHANDLE *)0xFFFFFFFFLL)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    allClients = self->_allClients;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(allClients);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isOuputMeteringEnabled") & 1) != 0)
          {
            v8 = 1;
            goto LABEL_12;
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
        if (v5)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_12:
    self->_isOutputMeteringEnabled = v8;
    AUIOSetOutputMeterEnabled((uint64_t)self->_hAUIO, v8);
  }
}

- (BOOL)getAudioSessionMediaProperties:(id)a3 forVPOperatingMode:(unsigned int)a4
{
  OpaqueAudioComponent *Next;
  OSStatus v7;
  OSStatus v8;
  OSStatus Property;
  const __CFString *v10;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  int v20;
  _BOOL8 v22;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  double v47;
  UInt32 ioDataSize;
  double outData;
  OSStatus v50;
  AudioComponentDescription inDesc;
  AudioComponentInstance outInstance;
  unsigned int inData;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  _BYTE v61[10];
  __int128 v62;
  int v63;
  __int16 v64;
  _BYTE v65[14];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  inData = a4;
  if (!a3)
    return 0;
  outInstance = 0;
  BYTE1(inDesc.componentFlags) = 0;
  HIWORD(inDesc.componentFlags) = 0;
  inDesc.componentFlagsMask = 0;
  strcpy((char *)&inDesc, "uouaoipvlppa");
  Next = AudioComponentFindNext(0, &inDesc);
  if (!Next)
  {
    v19 = -2145714154;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:].cold.1();
      }
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v31 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v31 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_39;
    v40 = VRTraceErrorLogLevelToCSTR();
    v41 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_DWORD *)buf = 136316162;
    v55 = v40;
    v56 = 2080;
    v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
    v58 = 1024;
    v59 = 663;
    v60 = 2112;
    *(_QWORD *)v61 = v31;
    *(_WORD *)&v61[8] = 2048;
    *(_QWORD *)&v62 = self;
    v37 = " [%s] %s:%d %@(%p) AudioComponentFindNext failed";
LABEL_74:
    v38 = v41;
    v39 = 48;
    goto LABEL_83;
  }
  v7 = AudioComponentInstanceNew(Next, &outInstance);
  v50 = v7;
  if (v7)
  {
    v19 = v7 | 0xA01B0000;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:].cold.3();
      }
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v32 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v32 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_39;
    v42 = VRTraceErrorLogLevelToCSTR();
    v41 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_DWORD *)buf = 136316162;
    v55 = v42;
    v56 = 2080;
    v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
    v58 = 1024;
    v59 = 666;
    v60 = 2112;
    *(_QWORD *)v61 = v32;
    *(_WORD *)&v61[8] = 2048;
    *(_QWORD *)&v62 = self;
    v37 = " [%s] %s:%d %@(%p) AudioComponentInstanceNew failed";
    goto LABEL_74;
  }
  v8 = AudioUnitSetProperty(outInstance, 0x846u, 0, 0, &inData, 4u);
  v50 = v8;
  if (v8)
  {
    v19 = v8 | 0xA01B0000;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_39;
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_DWORD *)buf = 136316674;
      v55 = v35;
      v56 = 2080;
      v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
      v58 = 1024;
      v59 = 670;
      v60 = 1024;
      *(_DWORD *)v61 = inData;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = v50;
      LOWORD(v62) = 1040;
      *(_DWORD *)((char *)&v62 + 2) = 4;
      WORD3(v62) = 2080;
      *((_QWORD *)&v62 + 1) = &v50;
      v37 = " [%s] %s:%d AudioUnitSetProperty failed to set property kAUVoiceIOProperty_OperationMode %d %d %.4s";
      v38 = v36;
      v39 = 56;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v33 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v33 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_39;
      v43 = VRTraceErrorLogLevelToCSTR();
      v44 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_DWORD *)buf = 136317186;
      v55 = v43;
      v56 = 2080;
      v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
      v58 = 1024;
      v59 = 670;
      v60 = 2112;
      *(_QWORD *)v61 = v33;
      *(_WORD *)&v61[8] = 2048;
      *(_QWORD *)&v62 = self;
      WORD4(v62) = 1024;
      *(_DWORD *)((char *)&v62 + 10) = inData;
      HIWORD(v62) = 1024;
      v63 = v50;
      v64 = 1040;
      *(_DWORD *)v65 = 4;
      *(_WORD *)&v65[4] = 2080;
      *(_QWORD *)&v65[6] = &v50;
      v37 = " [%s] %s:%d %@(%p) AudioUnitSetProperty failed to set property kAUVoiceIOProperty_OperationMode %d %d %.4s";
      v38 = v44;
      v39 = 76;
    }
    goto LABEL_83;
  }
  outData = 0.0;
  ioDataSize = 8;
  Property = AudioUnitGetProperty(outInstance, 0x84Du, 0, 0, &outData, &ioDataSize);
  if (Property < 0 || outData == 0.0)
  {
    outData = dbl_1D9108BE0[inData == 6];
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v55 = v12;
          v56 = 2080;
          v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
          v58 = 1024;
          v59 = 677;
          v60 = 1024;
          *(_DWORD *)v61 = inData;
          *(_WORD *)&v61[4] = 1024;
          *(_DWORD *)&v61[6] = Property;
          LOWORD(v62) = 2048;
          *(double *)((char *)&v62 + 2) = outData;
          v14 = " [%s] %s:%d Failed to get retrieve preferred sample rate for VP operating mode:%d err=0x%x. Defaulting to: %f";
          v15 = v13;
          v16 = 50;
LABEL_18:
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316930;
          v55 = v17;
          v56 = 2080;
          v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
          v58 = 1024;
          v59 = 677;
          v60 = 2112;
          *(_QWORD *)v61 = v10;
          *(_WORD *)&v61[8] = 2048;
          *(_QWORD *)&v62 = self;
          WORD4(v62) = 1024;
          *(_DWORD *)((char *)&v62 + 10) = inData;
          HIWORD(v62) = 1024;
          v63 = Property;
          v64 = 2048;
          *(double *)v65 = outData;
          v14 = " [%s] %s:%d %@(%p) Failed to get retrieve preferred sample rate for VP operating mode:%d err=0x%x. Defaulting to: %f";
          v15 = v18;
          v16 = 70;
          goto LABEL_18;
        }
      }
    }
  }
  v47 = NAN;
  ioDataSize = 8;
  v19 = AudioUnitGetProperty(outInstance, 0x84Eu, 0, 0, &v47, &ioDataSize);
  if (v19 < 0)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:].cold.2();
      }
      goto LABEL_39;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v34 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_39;
    v45 = VRTraceErrorLogLevelToCSTR();
    v46 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_39;
    *(_DWORD *)buf = 136316418;
    v55 = v45;
    v56 = 2080;
    v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
    v58 = 1024;
    v59 = 683;
    v60 = 2112;
    *(_QWORD *)v61 = v34;
    *(_WORD *)&v61[8] = 2048;
    *(_QWORD *)&v62 = self;
    WORD4(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 10) = v19;
    v37 = " [%s] %s:%d %@(%p) Get property failed (block size): %x";
    v38 = v46;
    v39 = 54;
LABEL_83:
    _os_log_error_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_ERROR, v37, buf, v39);
    goto LABEL_39;
  }
  v20 = -[VCDefaults forceAudioHardwareSampleRate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioHardwareSampleRate");
  if (v20)
    outData = (double)v20;
  objc_msgSend(a3, "setPreferredSampleRate:");
  objc_msgSend(a3, "setPreferredBlockSize:", v47);
  objc_msgSend(a3, "setOperatingMode:", 0);
  v22 = self->_useOptimizedHandoversForTelephony && inData == 6;
  objc_msgSend(a3, "setAudioClockDeviceEnabled:", v22);
  objc_msgSend(a3, "setNetworkUplinkClockUsesBaseband:", 0);
  if ((VCAudioManager *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v23 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v23 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_39;
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_DWORD *)buf = 136316930;
    v55 = v29;
    v56 = 2080;
    v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
    v58 = 1024;
    v59 = 695;
    v60 = 2112;
    *(_QWORD *)v61 = v23;
    *(_WORD *)&v61[8] = 2048;
    *(_QWORD *)&v62 = self;
    WORD4(v62) = 1024;
    *(_DWORD *)((char *)&v62 + 10) = inData;
    HIWORD(v62) = 1024;
    v63 = (int)outData;
    v64 = 2048;
    *(double *)v65 = v47;
    v26 = " [%s] %s:%d %@(%p) Hardware preference for VP operating mode: %d -> sampleRate=%d blockSize=%f";
    v27 = v30;
    v28 = 70;
    goto LABEL_38;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v55 = v24;
      v56 = 2080;
      v57 = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
      v58 = 1024;
      v59 = 695;
      v60 = 1024;
      *(_DWORD *)v61 = inData;
      *(_WORD *)&v61[4] = 1024;
      *(_DWORD *)&v61[6] = (int)outData;
      LOWORD(v62) = 2048;
      *(double *)((char *)&v62 + 2) = v47;
      v26 = " [%s] %s:%d Hardware preference for VP operating mode: %d -> sampleRate=%d blockSize=%f";
      v27 = v25;
      v28 = 50;
LABEL_38:
      _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    }
  }
LABEL_39:
  if (outInstance)
    AudioComponentInstanceDispose(outInstance);
  return v19 >= 0;
}

- (void)computeHardwarePreferences
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  VCAudioSessionMediaProperties *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  __int128 v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCAudioManager *v32;
  __int16 v33;
  int v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v3 = objc_msgSend(&unk_1E9EF9A28, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v37;
    *(_QWORD *)&v4 = 136315906;
    v21 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(&unk_1E9EF9A28);
        v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v7);
        v9 = objc_alloc_init(VCAudioSessionMediaProperties);
        if (-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:](self, "getAudioSessionMediaProperties:forVPOperatingMode:", v9, objc_msgSend(v8, "unsignedIntValue")))
        {
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v9, v8);
          goto LABEL_16;
        }
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v19 = objc_msgSend(v8, "unsignedIntValue");
              *(_DWORD *)buf = v21;
              v24 = v17;
              v25 = 2080;
              v26 = "-[VCAudioManager computeHardwarePreferences]";
              v27 = 1024;
              v28 = 722;
              v29 = 1024;
              LODWORD(v30) = v19;
              v14 = v18;
              v15 = " [%s] %s:%d Failed to get media properties for VP operatingMode:%u";
              v16 = 34;
              goto LABEL_19;
            }
          }
        }
        else
        {
          v10 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v10 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v13 = objc_msgSend(v8, "unsignedIntValue");
              *(_DWORD *)buf = 136316418;
              v24 = v11;
              v25 = 2080;
              v26 = "-[VCAudioManager computeHardwarePreferences]";
              v27 = 1024;
              v28 = 722;
              v29 = 2112;
              v30 = v10;
              v31 = 2048;
              v32 = self;
              v33 = 1024;
              v34 = v13;
              v14 = v12;
              v15 = " [%s] %s:%d %@(%p) Failed to get media properties for VP operatingMode:%u";
              v16 = 54;
LABEL_19:
              _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, v15, buf, v16);
            }
          }
        }
LABEL_16:

        ++v7;
      }
      while (v5 != v7);
      v20 = objc_msgSend(&unk_1E9EF9A28, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
      v5 = v20;
    }
    while (v20);
  }
  -[VCAudioManager setVpOperatingModeToAudioSessionMediaFormatMapping:](self, "setVpOperatingModeToAudioSessionMediaFormatMapping:", v22, v21);

}

- (void)resetAudioTimestamps
{
  VCAudioIOControllerIOState_ResetControllerTime(&self->_sinkData.timestampInitialized);
  VCAudioIOControllerIOState_ResetControllerTime(&self->_sourceData.timestampInitialized);
}

- (int)prewarmingClientOperatingMode
{
  NSMutableArray *allClients;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  allClients = self->_allClients;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(allClients);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if ((objc_msgSend(v7, "isPrewarmingClient") & 1) != 0)
        {
          LODWORD(v3) = objc_msgSend(v7, "operatingMode");
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return v3;
}

- (void)flushEventQueue:(opaqueCMSimpleQueue *)a3
{
  double v4;
  void *v5;
  _QWORD *v6;
  int i;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = 0.0;
  if (VRTraceIsInternalOSInstalled())
    v4 = micro();
  v5 = (void *)objc_opt_new();
  v6 = CMSimpleQueueDequeue(a3);
  v18[0] = (uint64_t)v6;
  for (i = 0; v6; v18[0] = (uint64_t)v6)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v6[1]);
    v9 = objc_msgSend(v5, "containsObject:", v8);
    if ((v9 & 1) == 0)
      objc_msgSend(v5, "addObject:", v8);
    VCAudioManager_ReleaseAudioEvent(v18, v9 ^ 1);
    ++i;
    v6 = CMSimpleQueueDequeue(a3);
  }
  objc_msgSend(v5, "removeAllObjects");

  LogProfileTimeOverLimit(v4, v10, v11, v12, v13, v14, v15, v16, v17, (char)"-[VCAudioManager flushEventQueue:]");
}

- (void)removeAllClientsForIO:(_VCAudioIOControllerIOState *)a3
{
  uint64_t *p_clientIOList;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  p_clientIOList = (uint64_t *)&a3->clientIOList;
  while (1)
  {
    v4[0] = (uint64_t)VCSingleLinkedListPop(p_clientIOList);
    if (!v4[0])
      break;
    VCAudioManager_ReleaseAudioEvent(v4, 1);
  }
}

- (BOOL)addClient:(id)a3
{
  char v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int state;
  int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  _BYTE v23[24];
  __int128 v24;
  VCAudioManager *v25;
  _BYTE v26[32];
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableArray containsObject:](self->_allClients, "containsObject:");
  if ((v5 & 1) == 0)
  {
    -[VCAudioManager enableSpatialStreamParametersForClient:](self, "enableSpatialStreamParametersForClient:", a3);
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v9 = objc_msgSend(a3, "sinkIO");
      v10 = objc_msgSend(a3, "sourceIO");
      state = self->_state;
      v12 = -[NSMutableArray count](self->_allClients, "count");
      *(_DWORD *)v23 = 136316930;
      *(_QWORD *)&v23[4] = v7;
      *(_WORD *)&v23[12] = 2080;
      *(_QWORD *)&v23[14] = "-[VCAudioManager addClient:]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 810;
      WORD2(v24) = 2048;
      *(_QWORD *)((char *)&v24 + 6) = a3;
      HIWORD(v24) = 2048;
      v25 = (VCAudioManager *)v9;
      *(_WORD *)v26 = 2048;
      *(_QWORD *)&v26[2] = v10;
      *(_WORD *)&v26[10] = 1024;
      *(_DWORD *)&v26[12] = state;
      *(_WORD *)&v26[16] = 1024;
      *(_DWORD *)&v26[18] = v12;
      v13 = " [%s] %s:%d Adding client[%p] with sinkIO[%p], sourceIO[%p] in current manager state=%d clientCount (before add)=%d";
      v14 = v8;
      v15 = 70;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v18 = objc_msgSend(a3, "sinkIO");
      v19 = objc_msgSend(a3, "sourceIO");
      v20 = self->_state;
      v21 = -[NSMutableArray count](self->_allClients, "count");
      *(_DWORD *)v23 = 136317442;
      *(_QWORD *)&v23[4] = v16;
      *(_WORD *)&v23[12] = 2080;
      *(_QWORD *)&v23[14] = "-[VCAudioManager addClient:]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 810;
      WORD2(v24) = 2112;
      *(_QWORD *)((char *)&v24 + 6) = v6;
      HIWORD(v24) = 2048;
      v25 = self;
      *(_WORD *)v26 = 2048;
      *(_QWORD *)&v26[2] = a3;
      *(_WORD *)&v26[10] = 2048;
      *(_QWORD *)&v26[12] = v18;
      *(_WORD *)&v26[20] = 2048;
      *(_QWORD *)&v26[22] = v19;
      *(_WORD *)&v26[30] = 1024;
      LODWORD(v27) = v20;
      WORD2(v27) = 1024;
      *(_DWORD *)((char *)&v27 + 6) = v21;
      v13 = " [%s] %s:%d %@(%p) Adding client[%p] with sinkIO[%p], sourceIO[%p] in current manager state=%d clientCount (before add)=%d";
      v14 = v17;
      v15 = 90;
    }
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, v23, v15);
LABEL_13:
    -[NSMutableArray addObject:](self->_allClients, "addObject:", a3, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25, *(_OWORD *)v26, *(_OWORD *)&v26[16], v27);
    +[VCAudioSmartRoutingManager addClient:](VCAudioSmartRoutingManager, "addClient:", a3);
  }
  return v5 ^ 1;
}

- (void)waitIdleForClient:(id)a3
{
  const __CFString *v5;
  dispatch_time_t v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _VCAudioIOControllerIOState *p_sourceData;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  dispatch_time_t v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  _BYTE v34[24];
  __int128 v35;
  VCAudioManager *v36;
  _BYTE v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!+[VCDefaults BOOLeanValueForKey:defaultValue:](VCDefaults, "BOOLeanValueForKey:defaultValue:", CFSTR("skipAudioManagerIdleWait"), 0))
  {
    if ((objc_msgSend(a3, "direction") & 2) == 0)
      goto LABEL_29;
    v6 = dispatch_time(0, 1000000000);
    if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(objc_msgSend(a3, "sinkIO") + 16), v6))
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(objc_msgSend(a3, "sinkIO") + 16));
      goto LABEL_29;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_28;
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_DWORD *)v34 = 136316162;
      *(_QWORD *)&v34[4] = v16;
      *(_WORD *)&v34[12] = 2080;
      *(_QWORD *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 829;
      WORD2(v35) = 2048;
      *(_QWORD *)((char *)&v35 + 6) = a3;
      HIWORD(v35) = 2048;
      v36 = (VCAudioManager *)objc_msgSend(a3, "sinkIO");
      v18 = " [%s] %s:%d Sink run lock semaphore was not signaled! client=%p sinkIO=%p";
      v19 = v17;
      v20 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_28;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_DWORD *)v34 = 136316674;
      *(_QWORD *)&v34[4] = v21;
      *(_WORD *)&v34[12] = 2080;
      *(_QWORD *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 829;
      WORD2(v35) = 2112;
      *(_QWORD *)((char *)&v35 + 6) = v7;
      HIWORD(v35) = 2048;
      v36 = self;
      *(_WORD *)v37 = 2048;
      *(_QWORD *)&v37[2] = a3;
      *(_WORD *)&v37[10] = 2048;
      *(_QWORD *)&v37[12] = objc_msgSend(a3, "sinkIO");
      v18 = " [%s] %s:%d %@(%p) Sink run lock semaphore was not signaled! client=%p sinkIO=%p";
      v19 = v22;
      v20 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, v34, v20);
LABEL_28:
    _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sinkData);
LABEL_29:
    if ((objc_msgSend(a3, "direction", *(_QWORD *)v34, *(_OWORD *)&v34[8], v35, v36, *(_QWORD *)v37, *(_OWORD *)&v37[8]) & 1) == 0)return;
    v23 = dispatch_time(0, 1000000000);
    if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(objc_msgSend(a3, "sourceIO") + 16), v23))
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(objc_msgSend(a3, "sourceIO") + 16));
      return;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_43;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      v27 = objc_msgSend(a3, "sourceIO");
      *(_DWORD *)v34 = 136316162;
      *(_QWORD *)&v34[4] = v25;
      *(_WORD *)&v34[12] = 2080;
      *(_QWORD *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 839;
      WORD2(v35) = 2048;
      *(_QWORD *)((char *)&v35 + 6) = a3;
      HIWORD(v35) = 2048;
      v36 = (VCAudioManager *)v27;
      v28 = " [%s] %s:%d Source run lock semaphore was not signaled! client=%p sourceIO=%p";
      v29 = v26;
      v30 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_43;
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_43;
      v33 = objc_msgSend(a3, "sourceIO");
      *(_DWORD *)v34 = 136316674;
      *(_QWORD *)&v34[4] = v31;
      *(_WORD *)&v34[12] = 2080;
      *(_QWORD *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
      *(_WORD *)&v34[22] = 1024;
      LODWORD(v35) = 839;
      WORD2(v35) = 2112;
      *(_QWORD *)((char *)&v35 + 6) = v24;
      HIWORD(v35) = 2048;
      v36 = self;
      *(_WORD *)v37 = 2048;
      *(_QWORD *)&v37[2] = a3;
      *(_WORD *)&v37[10] = 2048;
      *(_QWORD *)&v37[12] = v33;
      v28 = " [%s] %s:%d %@(%p) Source run lock semaphore was not signaled! client=%p sourceIO=%p";
      v29 = v32;
      v30 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, v28, v34, v30);
LABEL_43:
    p_sourceData = &self->_sourceData;
    goto LABEL_44;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_18;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_DWORD *)v34 = 136315906;
    *(_QWORD *)&v34[4] = v8;
    *(_WORD *)&v34[12] = 2080;
    *(_QWORD *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = 820;
    WORD2(v35) = 2112;
    *(_QWORD *)((char *)&v35 + 6) = CFSTR("skipAudioManagerIdleWait");
    v10 = " [%s] %s:%d %@ set. Skipping idle wait";
    v11 = v9;
    v12 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_18;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_DWORD *)v34 = 136316418;
    *(_QWORD *)&v34[4] = v13;
    *(_WORD *)&v34[12] = 2080;
    *(_QWORD *)&v34[14] = "-[VCAudioManager waitIdleForClient:]";
    *(_WORD *)&v34[22] = 1024;
    LODWORD(v35) = 820;
    WORD2(v35) = 2112;
    *(_QWORD *)((char *)&v35 + 6) = v5;
    HIWORD(v35) = 2048;
    v36 = self;
    *(_WORD *)v37 = 2112;
    *(_QWORD *)&v37[2] = CFSTR("skipAudioManagerIdleWait");
    v10 = " [%s] %s:%d %@(%p) %@ set. Skipping idle wait";
    v11 = v14;
    v12 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v34, v12);
LABEL_18:
  _VCAudioManager_ProcessEventQueue((uint64_t)-[VCAudioManager sinkIO](self, "sinkIO", *(_OWORD *)v34, *(_QWORD *)&v34[16], v35, v36, *(_OWORD *)v37));
  p_sourceData = -[VCAudioManager sourceIO](self, "sourceIO");
LABEL_44:
  _VCAudioManager_ProcessEventQueue((uint64_t)p_sourceData);
}

- (BOOL)removeClient:(id)a3
{
  int v5;

  v5 = -[NSMutableArray containsObject:](self->_allClients, "containsObject:");
  if (v5)
  {
    if ((objc_msgSend(a3, "direction") & 2) != 0)
      -[VCAudioManager unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", objc_msgSend(a3, "sinkIO"), &self->_sinkData);
    if ((objc_msgSend(a3, "direction") & 1) != 0)
      -[VCAudioManager unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", objc_msgSend(a3, "sourceIO"), &self->_sourceData);
    -[VCAudioManager waitIdleForClient:](self, "waitIdleForClient:", a3);
    +[VCAudioSmartRoutingManager removeClient:](VCAudioSmartRoutingManager, "removeClient:", a3);
    -[NSMutableArray removeObject:](self->_allClients, "removeObject:", a3);
    -[NSMutableArray removeObject:](self->_startingIOClients, "removeObject:", a3);
    -[VCAudioManager disableSpatialStreamParametersForClient:](self, "disableSpatialStreamParametersForClient:", a3);
  }
  return v5;
}

- (void)_cleanupDeadClients
{
  void *v3;
  NSMutableArray *allClients;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCAudioManager *v28;
  __int16 v29;
  __CFString *v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  allClients = self->_allClients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(allClients);
        v9 = *(__CFString **)(*((_QWORD *)&v32 + 1) + 8 * v8);
        if (!-[__CFString delegate](v9, "delegate"))
        {
          if ((VCAudioManager *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v16 = VRTraceErrorLogLevelToCSTR();
              v17 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                v20 = v16;
                v21 = 2080;
                v22 = "-[VCAudioManager _cleanupDeadClients]";
                v23 = 1024;
                v24 = 874;
                v25 = 2048;
                v26 = v9;
                v13 = v17;
                v14 = " [%s] %s:%d Removing dead client (%p)!";
                v15 = 38;
LABEL_19:
                _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, v14, buf, v15);
              }
            }
          }
          else
          {
            v10 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v10 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v11 = VRTraceErrorLogLevelToCSTR();
              v12 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316418;
                v20 = v11;
                v21 = 2080;
                v22 = "-[VCAudioManager _cleanupDeadClients]";
                v23 = 1024;
                v24 = 874;
                v25 = 2112;
                v26 = v10;
                v27 = 2048;
                v28 = self;
                v29 = 2048;
                v30 = v9;
                v13 = v12;
                v14 = " [%s] %s:%d %@(%p) Removing dead client (%p)!";
                v15 = 58;
                goto LABEL_19;
              }
            }
          }
          objc_msgSend(v3, "setObject:atIndexedSubscript:", v9, objc_msgSend(v3, "count"));
          +[VCAudioSmartRoutingManager removeClient:](VCAudioSmartRoutingManager, "removeClient:", v9);
        }
        ++v8;
      }
      while (v6 != v8);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
      v6 = v18;
    }
    while (v18);
  }
  -[NSMutableArray removeObjectsInArray:](self->_allClients, "removeObjectsInArray:", v3);
}

- (unsigned)vpOperationModeForConferenceOperatingMode:(int)a3 deviceRole:(int)a4
{
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_isGKVoiceChat)
  {
    v6 = 3;
  }
  else
  {
    v6 = 0;
    switch(a3)
    {
      case 1:
      case 4:
      case 6:
        v6 = 2;
        break;
      case 2:
        if (a4 == 1)
          v6 = 5;
        else
          v6 = 4;
        break;
      case 3:
        v6 = 6;
        break;
      case 5:
      case 11:
        v6 = 7;
        break;
      case 7:
        v6 = 8;
        break;
      default:
        break;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316418;
      v11 = v7;
      v12 = 2080;
      v13 = "-[VCAudioManager vpOperationModeForConferenceOperatingMode:deviceRole:]";
      v14 = 1024;
      v15 = 910;
      v16 = 1024;
      v17 = a3;
      v18 = 1024;
      v19 = a4;
      v20 = 1024;
      v21 = v6;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d conferenceMode=%d, deviceRole=%d, vpOperatingMode=%d", (uint8_t *)&v10, 0x2Eu);
    }
  }
  return v6;
}

- (void)computeFormatDescription:(AudioStreamBasicDescription *)a3 withPreferredClient:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  NSMutableArray *allClients;
  uint64_t v11;
  uint64_t v12;
  UInt32 v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  UInt32 v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a4, "clientFormat");
  v8 = *(_QWORD *)(v7 + 32);
  v9 = *(_OWORD *)(v7 + 16);
  *(_OWORD *)&a3->mSampleRate = *(_OWORD *)v7;
  *(_OWORD *)&a3->mBytesPerPacket = v9;
  *(_QWORD *)&a3->mBitsPerChannel = v8;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  allClients = self->_allClients;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(allClients);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(a4, "deviceRole") != 2 || objc_msgSend(v16, "deviceRole") == 2)
          && (objc_msgSend(a4, "deviceRole") == 2 || objc_msgSend(v16, "deviceRole") != 2))
        {
          v17 = *(_DWORD *)(objc_msgSend(v16, "clientFormat") + 28);
          if (v17 > v13)
            v13 = v17;
        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }
  a3->mChannelsPerFrame = v13;
}

- (unsigned)computeSamplePerFrameWithPreferredClient:(id)a3 sampleRate:(unsigned int)a4
{
  NSMutableArray *allClients;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  unsigned int v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  allClients = self->_allClients;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (!v7)
    return -1;
  v8 = v7;
  v9 = *(_QWORD *)v20;
  v10 = (double)a4;
  v11 = -1;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(allClients);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      if ((objc_msgSend(a3, "deviceRole") != 2 || objc_msgSend(v13, "deviceRole") == 2)
        && (objc_msgSend(a3, "deviceRole") == 2 || objc_msgSend(v13, "deviceRole") != 2))
      {
        v14 = objc_msgSend(v13, "clientFormat");
        LODWORD(v15) = *(_DWORD *)(v14 + 40);
        v16 = vcvtad_u64_f64(v10 * (double)v15 / *(double *)v14);
        if (v11 >= v16)
          v11 = v16;
      }
    }
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  }
  while (v8);
  return v11;
}

- (BOOL)computeAllowAudioRecordingWithPreferredClient:(id)a3
{
  NSMutableArray *allClients;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;
  int v11;
  char v12;
  uint64_t v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  allClients = self->_allClients;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (!v5)
  {
    v8 = 1;
    return v8 & 1;
  }
  v6 = v5;
  v7 = *(_QWORD *)v17;
  v8 = 1;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(allClients);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
      if (objc_msgSend(a3, "deviceRole") != 2 || objc_msgSend(v10, "deviceRole") == 2)
      {
        if (objc_msgSend(a3, "deviceRole") == 2)
        {
          if ((v8 & 1) == 0)
          {
            v8 = 0;
            goto LABEL_14;
          }
LABEL_13:
          v8 = objc_msgSend(v10, "allowAudioRecording");
          goto LABEL_14;
        }
        v11 = objc_msgSend(v10, "deviceRole");
        if (v11 != 2)
        {
          v12 = v8 ^ 1;
          v8 &= v11 == 2;
          if ((v12 & 1) != 0)
            goto LABEL_14;
          goto LABEL_13;
        }
        v8 &= 1u;
      }
LABEL_14:
      ++v9;
    }
    while (v6 != v9);
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    v6 = v13;
  }
  while (v13);
  return v8 & 1;
}

- (id)newAudioUnitPropertiesWithPreferredClient:(id)a3
{
  const __CFString *v5;
  VCAudioUnitProperties *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  unsigned int v13;
  uint64_t v14;
  tagVCAudioFrameFormat *v15;
  tagVCAudioFrameFormat *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  char *v24;
  char *v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  unsigned int v34;
  char *v35;
  char *v36;
  unsigned int v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  NSObject *v41;
  VCAudioUnitProperties *currentAudioUnitProperties;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  uint64_t v46;
  NSObject *v47;
  VCAudioUnitProperties *v48;
  _BYTE v50[40];
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  _BYTE v58[36];
  char *v59;
  __int16 v60;
  unsigned int v61;
  __int16 v62;
  int v63;
  __int16 v64;
  unsigned int v65;
  _OWORD v66[4];
  _OWORD __str[4];
  _OWORD v68[8];
  int v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  int v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (objc_msgSend(a3, "isPrewarmingClient") && self->_state >= 2)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return self->_currentAudioUnitProperties;
      v40 = VRTraceErrorLogLevelToCSTR();
      v41 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return self->_currentAudioUnitProperties;
      currentAudioUnitProperties = self->_currentAudioUnitProperties;
      *(_DWORD *)buf = 136315906;
      v52 = v40;
      v53 = 2080;
      v54 = "-[VCAudioManager newAudioUnitPropertiesWithPreferredClient:]";
      v55 = 1024;
      v56 = 969;
      v57 = 2112;
      *(_QWORD *)v58 = currentAudioUnitProperties;
      v43 = " [%s] %s:%d Last client is prewarming, ignore its settings. _currentAudioUnitProperties=%@";
      v44 = v41;
      v45 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return self->_currentAudioUnitProperties;
      v46 = VRTraceErrorLogLevelToCSTR();
      v47 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return self->_currentAudioUnitProperties;
      v48 = self->_currentAudioUnitProperties;
      *(_DWORD *)buf = 136316418;
      v52 = v46;
      v53 = 2080;
      v54 = "-[VCAudioManager newAudioUnitPropertiesWithPreferredClient:]";
      v55 = 1024;
      v56 = 969;
      v57 = 2112;
      *(_QWORD *)v58 = v5;
      *(_WORD *)&v58[8] = 2048;
      *(_QWORD *)&v58[10] = self;
      *(_WORD *)&v58[18] = 2112;
      *(_QWORD *)&v58[20] = v48;
      v43 = " [%s] %s:%d %@(%p) Last client is prewarming, ignore its settings. _currentAudioUnitProperties=%@";
      v44 = v47;
      v45 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
    return self->_currentAudioUnitProperties;
  }
  v6 = objc_alloc_init(VCAudioUnitProperties);
  v7 = -[VCAudioManager vpOperationModeForConferenceOperatingMode:deviceRole:](self, "vpOperationModeForConferenceOperatingMode:deviceRole:", objc_msgSend(a3, "operatingMode"), objc_msgSend(a3, "deviceRole"));
  *(_QWORD *)v50 = -1;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v50[8] = v8;
  *(_OWORD *)&v50[24] = v8;
  -[VCAudioManager computeFormatDescription:withPreferredClient:](self, "computeFormatDescription:withPreferredClient:", v50, a3);
  if (objc_msgSend(a3, "deviceRole") == 2)
    v9 = 2;
  else
    v9 = 1;
  -[VCAudioUnitProperties setAudioUnitType:](v6, "setAudioUnitType:", v9);
  v10 = -[VCAudioUnitProperties frameFormatMic](v6, "frameFormatMic");
  v11 = *(_OWORD *)&v50[16];
  v12 = *(_OWORD *)v50;
  *(_QWORD *)(v10 + 32) = *(_QWORD *)&v50[32];
  *(_OWORD *)v10 = v12;
  *(_OWORD *)(v10 + 16) = v11;
  v13 = -[VCAudioManager computeSamplePerFrameWithPreferredClient:sampleRate:](self, "computeSamplePerFrameWithPreferredClient:sampleRate:", a3, *(double *)v50);
  *(_DWORD *)(-[VCAudioUnitProperties frameFormatMic](v6, "frameFormatMic") + 40) = v13;
  -[VCAudioUnitProperties setAllowAudioRecording:](v6, "setAllowAudioRecording:", -[VCAudioManager computeAllowAudioRecordingWithPreferredClient:](self, "computeAllowAudioRecordingWithPreferredClient:", a3));
  -[VCAudioUnitProperties setDeviceRole:](v6, "setDeviceRole:", objc_msgSend(a3, "deviceRole"));
  -[VCAudioUnitProperties setOperatingMode:](v6, "setOperatingMode:", objc_msgSend(a3, "operatingMode"));
  -[VCAudioUnitProperties setVpOperatingMode:](v6, "setVpOperatingMode:", v7);
  -[VCAudioUnitProperties setAudioSessionId:](v6, "setAudioSessionId:", objc_msgSend(a3, "audioSessionId"));
  if (objc_msgSend(a3, "isRemoteCodecInfoValid"))
  {
    objc_msgSend(a3, "remoteCodecSampleRate");
    -[VCAudioUnitProperties setRemoteCodecSampleRate:](v6, "setRemoteCodecSampleRate:");
    v14 = objc_msgSend(a3, "remoteCodecType");
  }
  else
  {
    -[VCAudioUnitProperties setRemoteCodecSampleRate:](v6, "setRemoteCodecSampleRate:", 24000.0);
    v14 = 0;
  }
  -[VCAudioUnitProperties setRemoteCodecType:](v6, "setRemoteCodecType:", v14);
  if (objc_msgSend(a3, "isRemoteVersionInfoValid"))
  {
    objc_msgSend(a3, "farEndVersionInfo");
    v68[6] = v76;
    v68[7] = v77;
    v69 = v78;
    v68[2] = v72;
    v68[3] = v73;
    v68[4] = v74;
    v68[5] = v75;
    v68[0] = v70;
    v68[1] = v71;
    -[VCAudioUnitProperties setFarEndVersionInfo:](v6, "setFarEndVersionInfo:", v68);
  }
  v15 = -[VCAudioUnitProperties frameFormatSpeaker](v6, "frameFormatSpeaker");
  v16 = -[VCAudioUnitProperties frameFormatMic](v6, "frameFormatMic");
  v18 = *(_OWORD *)&v16->format.mBytesPerPacket;
  v17 = *(_OWORD *)&v16->format.mBitsPerChannel;
  *(_OWORD *)&v15->format.mSampleRate = *(_OWORD *)&v16->format.mSampleRate;
  *(_OWORD *)&v15->format.mBytesPerPacket = v18;
  *(_OWORD *)&v15->format.mBitsPerChannel = v17;
  if (-[VCAudioUnitProperties operatingMode](v6, "operatingMode") != 3)
    -[VCAudioManager applySessionContextToAudioUnitProperties:preferredClient:](self, "applySessionContextToAudioUnitProperties:preferredClient:", v6, a3);
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __str[2] = v19;
  __str[3] = v19;
  __str[0] = v19;
  __str[1] = v19;
  v66[2] = v19;
  v66[3] = v19;
  v66[0] = v19;
  v66[1] = v19;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = -[VCAudioUnitProperties audioUnitType](v6, "audioUnitType");
        v24 = FormatToCStr((uint64_t)-[VCAudioUnitProperties frameFormatMic](v6, "frameFormatMic"), (char *)__str, 0x40uLL);
        v25 = FormatToCStr((uint64_t)-[VCAudioUnitProperties frameFormatSpeaker](v6, "frameFormatSpeaker"), (char *)v66, 0x40uLL);
        v26 = -[VCAudioUnitProperties audioSessionId](v6, "audioSessionId");
        v27 = (int)-[VCAudioUnitProperties frameFormatMic](v6, "frameFormatMic")[40];
        v28 = -[VCAudioUnitProperties vpOperatingMode](v6, "vpOperatingMode");
        *(_DWORD *)buf = 136317186;
        v52 = v21;
        v53 = 2080;
        v54 = "-[VCAudioManager newAudioUnitPropertiesWithPreferredClient:]";
        v55 = 1024;
        v56 = 1005;
        v57 = 1024;
        *(_DWORD *)v58 = v23;
        *(_WORD *)&v58[4] = 2080;
        *(_QWORD *)&v58[6] = v24;
        *(_WORD *)&v58[14] = 2080;
        *(_QWORD *)&v58[16] = v25;
        *(_WORD *)&v58[24] = 1024;
        *(_DWORD *)&v58[26] = v26;
        *(_WORD *)&v58[30] = 1024;
        *(_DWORD *)&v58[32] = v27;
        LOWORD(v59) = 1024;
        *(_DWORD *)((char *)&v59 + 2) = v28;
        v29 = " [%s] %s:%d Selected audio unit properties: UnitType=%d, micFormat=%s speakerFormat=%s audioSessionId=%u s"
              "amplesPerFrame=%d VPOperatingMode=%d";
        v30 = v22;
        v31 = 72;
LABEL_28:
        _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v34 = -[VCAudioUnitProperties audioUnitType](v6, "audioUnitType");
        v35 = FormatToCStr((uint64_t)-[VCAudioUnitProperties frameFormatMic](v6, "frameFormatMic"), (char *)__str, 0x40uLL);
        v36 = FormatToCStr((uint64_t)-[VCAudioUnitProperties frameFormatSpeaker](v6, "frameFormatSpeaker"), (char *)v66, 0x40uLL);
        v37 = -[VCAudioUnitProperties audioSessionId](v6, "audioSessionId");
        v38 = (int)-[VCAudioUnitProperties frameFormatMic](v6, "frameFormatMic")[40];
        v39 = -[VCAudioUnitProperties vpOperatingMode](v6, "vpOperatingMode");
        *(_DWORD *)buf = 136317698;
        v52 = v32;
        v53 = 2080;
        v54 = "-[VCAudioManager newAudioUnitPropertiesWithPreferredClient:]";
        v55 = 1024;
        v56 = 1005;
        v57 = 2112;
        *(_QWORD *)v58 = v20;
        *(_WORD *)&v58[8] = 2048;
        *(_QWORD *)&v58[10] = self;
        *(_WORD *)&v58[18] = 1024;
        *(_DWORD *)&v58[20] = v34;
        *(_WORD *)&v58[24] = 2080;
        *(_QWORD *)&v58[26] = v35;
        *(_WORD *)&v58[34] = 2080;
        v59 = v36;
        v60 = 1024;
        v61 = v37;
        v62 = 1024;
        v63 = v38;
        v64 = 1024;
        v65 = v39;
        v29 = " [%s] %s:%d %@(%p) Selected audio unit properties: UnitType=%d, micFormat=%s speakerFormat=%s audioSession"
              "Id=%u samplesPerFrame=%d VPOperatingMode=%d";
        v30 = v33;
        v31 = 92;
        goto LABEL_28;
      }
    }
  }
  return v6;
}

- (id)newAudioUnitPropertiesForSystemAudioWithPreferredClient:(id)a3 isInput:(BOOL)a4
{
  _BOOL4 v4;
  VCAudioUnitProperties *v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  unsigned int v12;
  __int128 v13;
  const __CFString *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  unsigned int v18;
  __int128 v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned int v23;
  char *v24;
  int v25;
  const char *v26;
  uint64_t v27;
  unsigned int v28;
  char *v29;
  int v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  unsigned int v35;
  char *v36;
  int v37;
  uint64_t v38;
  unsigned int v39;
  char *v40;
  int v41;
  _BYTE v43[40];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  _BYTE v51[20];
  unsigned int v52;
  __int16 v53;
  char *v54;
  __int16 v55;
  int v56;
  char __str[16];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a4;
  v7 = objc_alloc_init(VCAudioUnitProperties);
  *(_QWORD *)v43 = -1;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v43[8] = v8;
  *(_OWORD *)&v43[24] = v8;
  -[VCAudioManager computeFormatDescription:withPreferredClient:](self, "computeFormatDescription:withPreferredClient:", v43, a3);
  -[VCAudioUnitProperties setAudioUnitType:](v7, "setAudioUnitType:", 1);
  -[VCAudioUnitProperties setDeviceRole:](v7, "setDeviceRole:", objc_msgSend(a3, "deviceRole"));
  -[VCAudioUnitProperties setOperatingMode:](v7, "setOperatingMode:", objc_msgSend(a3, "operatingMode"));
  -[VCAudioUnitProperties setAudioSessionId:](v7, "setAudioSessionId:", objc_msgSend(a3, "audioSessionId"));
  if (v4)
  {
    v9 = -[VCAudioUnitProperties frameFormatMic](v7, "frameFormatMic");
    v10 = *(_OWORD *)&v43[16];
    v11 = *(_OWORD *)v43;
    *(_QWORD *)(v9 + 32) = *(_QWORD *)&v43[32];
    *(_OWORD *)v9 = v11;
    *(_OWORD *)(v9 + 16) = v10;
    v12 = -[VCAudioManager computeSamplePerFrameWithPreferredClient:sampleRate:](self, "computeSamplePerFrameWithPreferredClient:sampleRate:", a3, *(double *)v43);
    *(_DWORD *)(-[VCAudioUnitProperties frameFormatMic](v7, "frameFormatMic") + 40) = v12;
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v59 = v13;
    v60 = v13;
    v58 = v13;
    *(_OWORD *)__str = v13;
    if ((VCAudioManager *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v33 = VRTraceErrorLogLevelToCSTR();
        v34 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v35 = -[VCAudioUnitProperties audioUnitType](v7, "audioUnitType");
          v36 = FormatToCStr((uint64_t)-[VCAudioUnitProperties frameFormatMic](v7, "frameFormatMic"), __str, 0x40uLL);
          v37 = (int)-[VCAudioUnitProperties frameFormatMic](v7, "frameFormatMic")[40];
          *(_DWORD *)buf = 136316930;
          v45 = v33;
          v46 = 2080;
          v47 = "-[VCAudioManager newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:]";
          v48 = 1024;
          v49 = 1027;
          v50 = 2112;
          *(_QWORD *)v51 = v14;
          *(_WORD *)&v51[8] = 2048;
          *(_QWORD *)&v51[10] = self;
          *(_WORD *)&v51[18] = 1024;
          v52 = v35;
          v53 = 2080;
          v54 = v36;
          v55 = 1024;
          v56 = v37;
          v26 = " [%s] %s:%d %@(%p) System audio unit properties: UnitType=%d, micFormat=%s samplesPerFrame=%d";
LABEL_25:
          v31 = v34;
          v32 = 70;
          goto LABEL_26;
        }
      }
      return v7;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return v7;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return v7;
    v23 = -[VCAudioUnitProperties audioUnitType](v7, "audioUnitType");
    v24 = FormatToCStr((uint64_t)-[VCAudioUnitProperties frameFormatMic](v7, "frameFormatMic"), __str, 0x40uLL);
    v25 = (int)-[VCAudioUnitProperties frameFormatMic](v7, "frameFormatMic")[40];
    *(_DWORD *)buf = 136316418;
    v45 = v21;
    v46 = 2080;
    v47 = "-[VCAudioManager newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:]";
    v48 = 1024;
    v49 = 1027;
    v50 = 1024;
    *(_DWORD *)v51 = v23;
    *(_WORD *)&v51[4] = 2080;
    *(_QWORD *)&v51[6] = v24;
    *(_WORD *)&v51[14] = 1024;
    *(_DWORD *)&v51[16] = v25;
    v26 = " [%s] %s:%d System audio unit properties: UnitType=%d, micFormat=%s samplesPerFrame=%d";
LABEL_16:
    v31 = v22;
    v32 = 50;
LABEL_26:
    _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v26, buf, v32);
    return v7;
  }
  v15 = -[VCAudioUnitProperties frameFormatSpeaker](v7, "frameFormatSpeaker");
  v16 = *(_OWORD *)&v43[16];
  v17 = *(_OWORD *)v43;
  *(_QWORD *)(v15 + 32) = *(_QWORD *)&v43[32];
  *(_OWORD *)v15 = v17;
  *(_OWORD *)(v15 + 16) = v16;
  v18 = -[VCAudioManager computeSamplePerFrameWithPreferredClient:sampleRate:](self, "computeSamplePerFrameWithPreferredClient:sampleRate:", a3, *(double *)v43);
  *(_DWORD *)(-[VCAudioUnitProperties frameFormatSpeaker](v7, "frameFormatSpeaker") + 40) = v18;
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v59 = v19;
  v60 = v19;
  v58 = v19;
  *(_OWORD *)__str = v19;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return v7;
    v27 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return v7;
    v28 = -[VCAudioUnitProperties audioUnitType](v7, "audioUnitType");
    v29 = FormatToCStr((uint64_t)-[VCAudioUnitProperties frameFormatSpeaker](v7, "frameFormatSpeaker"), __str, 0x40uLL);
    v30 = (int)-[VCAudioUnitProperties frameFormatSpeaker](v7, "frameFormatSpeaker")[40];
    *(_DWORD *)buf = 136316418;
    v45 = v27;
    v46 = 2080;
    v47 = "-[VCAudioManager newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:]";
    v48 = 1024;
    v49 = 1032;
    v50 = 1024;
    *(_DWORD *)v51 = v28;
    *(_WORD *)&v51[4] = 2080;
    *(_QWORD *)&v51[6] = v29;
    *(_WORD *)&v51[14] = 1024;
    *(_DWORD *)&v51[16] = v30;
    v26 = " [%s] %s:%d System audio unit properties: UnitType=%d, speakerFormat=%s samplesPerFrame=%d";
    goto LABEL_16;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v20 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v20 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v38 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v39 = -[VCAudioUnitProperties audioUnitType](v7, "audioUnitType");
      v40 = FormatToCStr((uint64_t)-[VCAudioUnitProperties frameFormatSpeaker](v7, "frameFormatSpeaker"), __str, 0x40uLL);
      v41 = (int)-[VCAudioUnitProperties frameFormatSpeaker](v7, "frameFormatSpeaker")[40];
      *(_DWORD *)buf = 136316930;
      v45 = v38;
      v46 = 2080;
      v47 = "-[VCAudioManager newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:]";
      v48 = 1024;
      v49 = 1032;
      v50 = 2112;
      *(_QWORD *)v51 = v20;
      *(_WORD *)&v51[8] = 2048;
      *(_QWORD *)&v51[10] = self;
      *(_WORD *)&v51[18] = 1024;
      v52 = v39;
      v53 = 2080;
      v54 = v40;
      v55 = 1024;
      v56 = v41;
      v26 = " [%s] %s:%d %@(%p) System audio unit properties: UnitType=%d, speakerFormat=%s samplesPerFrame=%d";
      goto LABEL_25;
    }
  }
  return v7;
}

- (id)newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:(id)a3 audioUnitProperties:(id)a4 isInput:(BOOL)a5
{
  _BOOL4 v5;
  VCAudioSessionMediaProperties *v9;
  int v10;
  double *v11;
  uint64_t v12;
  double IntValueForKey;
  unsigned int v14;
  double *v15;
  double v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD v28[2];
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  _QWORD v34[2];
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  VCAudioManager *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v5 = a5;
  v9 = objc_alloc_init(VCAudioSessionMediaProperties);
  v10 = *(_DWORD *)(objc_msgSend(a4, "frameFormatSpeaker") + 28);
  if (v5)
    v11 = (double *)objc_msgSend(a4, "frameFormatMic");
  else
    v11 = (double *)objc_msgSend(a4, "frameFormatSpeaker");
  if (*v11 == 48000)
    v12 = 48000;
  else
    v12 = 24000;
  IntValueForKey = (double)(int)VCDefaults_GetIntValueForKey(CFSTR("forceAudioSampleRate"), v12);
  if (v5)
  {
    v14 = *(_DWORD *)(objc_msgSend(a4, "frameFormatMic") + 40);
    v15 = (double *)objc_msgSend(a4, "frameFormatMic");
  }
  else
  {
    v14 = *(_DWORD *)(objc_msgSend(a4, "frameFormatSpeaker") + 40);
    v15 = (double *)objc_msgSend(a4, "frameFormatSpeaker");
  }
  v16 = (double)v14 / *v15;
  -[VCAudioSessionMediaProperties setPreferredSampleRate:](v9, "setPreferredSampleRate:", IntValueForKey);
  -[VCAudioSessionMediaProperties setPreferredBlockSize:](v9, "setPreferredBlockSize:", v16);
  -[VCAudioSessionMediaProperties setOperatingMode:](v9, "setOperatingMode:", objc_msgSend(a3, "operatingMode"));
  *(double *)v34 = IntValueForKey;
  v34[1] = 0x296C70636DLL;
  v35 = 4 * (v10 & 0x7FFFFFF);
  v36 = 1;
  v37 = v35;
  v38 = v10;
  v39 = 32;
  -[VCAudioSessionMediaProperties setInputFormat:](v9, "setInputFormat:", v34);
  *(double *)v28 = IntValueForKey;
  v28[1] = 0x296C70636DLL;
  v29 = 4 * (v10 & 0x7FFFFFF);
  v30 = 1;
  v31 = v29;
  v32 = v10;
  v33 = 32;
  -[VCAudioSessionMediaProperties setOutputFormat:](v9, "setOutputFormat:", v28);
  -[VCAudioSessionMediaProperties setProcessId:](v9, "setProcessId:", objc_msgSend(a3, "clientPid"));
  -[VCAudioSessionMediaProperties setSessionActive:](v9, "setSessionActive:", 1);
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = -[VCAudioSessionMediaProperties description](v9, "description");
        *(_DWORD *)buf = 136315906;
        v41 = v18;
        v42 = 2080;
        v43 = "-[VCAudioManager newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:audioUnitProperties:isInput:]";
        v44 = 1024;
        v45 = 1074;
        v46 = 2112;
        v47 = v20;
        v21 = " [%s] %s:%d System audio session media properties: %@";
        v22 = v19;
        v23 = 38;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v26 = -[VCAudioSessionMediaProperties description](v9, "description");
        *(_DWORD *)buf = 136316418;
        v41 = v24;
        v42 = 2080;
        v43 = "-[VCAudioManager newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:audioUnitProperties:isInput:]";
        v44 = 1024;
        v45 = 1074;
        v46 = 2112;
        v47 = (uint64_t)v17;
        v48 = 2048;
        v49 = self;
        v50 = 2112;
        v51 = v26;
        v21 = " [%s] %s:%d %@(%p) System audio session media properties: %@";
        v22 = v25;
        v23 = 58;
        goto LABEL_22;
      }
    }
  }
  return v9;
}

+ (AudioStreamBasicDescription)sessionFormatForSampleRate:(SEL)a3
{
  retstr->mSampleRate = a4;
  *(_OWORD *)&retstr->mFormatID = xmmword_1D9108BF0;
  *(_OWORD *)&retstr->mBytesPerFrame = xmmword_1D9108C00;
  return result;
}

- (id)newAudioSessionMediaPropertiesWithPreferredClient:(id)a3 audioUnitProperties:(id)a4
{
  VCAudioSessionMediaProperties *v7;
  const __CFString *v8;
  uint64_t v9;
  id v10;
  double v11;
  double v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  VCAudioSessionMediaProperties *currentAudioSessionMediaProperties;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  VCAudioSessionMediaProperties *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  double *v32;
  double v33;
  __int128 v34;
  double v35;
  float DoubleValueForKey;
  unint64_t v37;
  float v38;
  int v40;
  _BOOL8 v41;
  _BOOL8 v42;
  const __CFString *v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  const char *v47;
  NSObject *v48;
  uint32_t v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  _OWORD v54[2];
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  _BYTE v59[40];
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  VCAudioManager *v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(VCAudioSessionMediaProperties);
  if (objc_msgSend(a3, "isPrewarmingClient") && self->_state >= 2)
  {

    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return self->_currentAudioSessionMediaProperties;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return self->_currentAudioSessionMediaProperties;
      currentAudioSessionMediaProperties = self->_currentAudioSessionMediaProperties;
      *(_DWORD *)buf = 136315906;
      v61 = v14;
      v62 = 2080;
      v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
      v64 = 1024;
      v65 = 1111;
      v66 = 2112;
      v67 = (uint64_t)currentAudioSessionMediaProperties;
      v17 = " [%s] %s:%d Last client is prewarming, ignore its settings. Use _currentAudioSessionMediaProperties=%@";
      v18 = v15;
      v19 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return self->_currentAudioSessionMediaProperties;
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return self->_currentAudioSessionMediaProperties;
      v28 = self->_currentAudioSessionMediaProperties;
      *(_DWORD *)buf = 136316418;
      v61 = v26;
      v62 = 2080;
      v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
      v64 = 1024;
      v65 = 1111;
      v66 = 2112;
      v67 = (uint64_t)v8;
      v68 = 2048;
      v69 = self;
      v70 = 2112;
      v71 = (uint64_t)v28;
      v17 = " [%s] %s:%d %@(%p) Last client is prewarming, ignore its settings. Use _currentAudioSessionMediaProperties=%@";
      v18 = v27;
      v19 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    return self->_currentAudioSessionMediaProperties;
  }
  v9 = -[VCAudioManager vpOperationModeForConferenceOperatingMode:deviceRole:](self, "vpOperationModeForConferenceOperatingMode:deviceRole:", objc_msgSend(a3, "operatingMode"), objc_msgSend(a3, "deviceRole"));
  v10 = -[NSDictionary objectForKeyedSubscript:](self->_vpOperatingModeToAudioSessionMediaFormatMapping, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9));
  objc_msgSend(v10, "setOperatingMode:", objc_msgSend(a3, "operatingMode"));
  objc_msgSend(v10, "preferredSampleRate");
  v12 = v11;
  if (a4 && v11 == 0.0)
  {
    if (*(double *)objc_msgSend(a4, "frameFormatSpeaker") == 0.0)
      goto LABEL_32;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_31;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      v22 = *(_QWORD *)objc_msgSend(a4, "frameFormatSpeaker");
      *(_DWORD *)buf = 136315906;
      v61 = v20;
      v62 = 2080;
      v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
      v64 = 1024;
      v65 = 1122;
      v66 = 2048;
      v67 = v22;
      v23 = " [%s] %s:%d Override sampleRate=%f from audioUnitProperties, due to vpOperatingModeToAudioSessionMediaFormat"
            "Mapping unavailability";
      v24 = v21;
      v25 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_31;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_31;
      v31 = *(_QWORD *)objc_msgSend(a4, "frameFormatSpeaker");
      *(_DWORD *)buf = 136316418;
      v61 = v29;
      v62 = 2080;
      v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
      v64 = 1024;
      v65 = 1122;
      v66 = 2112;
      v67 = (uint64_t)v13;
      v68 = 2048;
      v69 = self;
      v70 = 2048;
      v71 = v31;
      v23 = " [%s] %s:%d %@(%p) Override sampleRate=%f from audioUnitProperties, due to vpOperatingModeToAudioSessionMedi"
            "aFormatMapping unavailability";
      v24 = v30;
      v25 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
LABEL_31:
    v12 = *(double *)objc_msgSend(a4, "frameFormatSpeaker");
LABEL_32:
    v32 = (double *)objc_msgSend(a4, "frameFormatSpeaker");
    v33 = 48000.0;
    if (*v32 == 48000.0)
      goto LABEL_34;
    goto LABEL_33;
  }
  if (a4)
    goto LABEL_32;
LABEL_33:
  v33 = v12;
LABEL_34:
  *(_QWORD *)v59 = -1;
  *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v59[8] = v34;
  *(_OWORD *)&v59[24] = v34;
  +[VCAudioManager sessionFormatForSampleRate:](VCAudioManager, "sessionFormatForSampleRate:", v33);
  objc_msgSend(v10, "preferredBlockSize");
  DoubleValueForKey = VCDefaults_GetDoubleValueForKey(CFSTR("forceAudioBlockSize"), v35);
  if (a4)
  {
    LODWORD(v37) = *(_DWORD *)(objc_msgSend(a4, "frameFormatSpeaker") + 40);
    v38 = (double)v37 / *(double *)objc_msgSend(a4, "frameFormatSpeaker");
    if (DoubleValueForKey >= v38 || DoubleValueForKey == 0.0)
      DoubleValueForKey = v38;
    -[VCAudioSessionMediaProperties setPreferredSampleRate:](v7, "setPreferredSampleRate:", *(double *)v59);
    -[VCAudioSessionMediaProperties setPreferredBlockSize:](v7, "setPreferredBlockSize:", DoubleValueForKey);
    -[VCAudioSessionMediaProperties setOperatingMode:](v7, "setOperatingMode:", objc_msgSend(v10, "operatingMode"));
    -[VCAudioSessionMediaProperties setVpOperatingMode:](v7, "setVpOperatingMode:", v9);
    v56 = *(_OWORD *)v59;
    v57 = *(_OWORD *)&v59[16];
    v58 = *(_QWORD *)&v59[32];
    -[VCAudioSessionMediaProperties setInputFormat:](v7, "setInputFormat:", &v56);
    v40 = *(_DWORD *)(objc_msgSend(a4, "frameFormatSpeaker") + 28);
  }
  else
  {
    -[VCAudioSessionMediaProperties setPreferredSampleRate:](v7, "setPreferredSampleRate:", *(double *)v59);
    -[VCAudioSessionMediaProperties setPreferredBlockSize:](v7, "setPreferredBlockSize:", DoubleValueForKey);
    -[VCAudioSessionMediaProperties setOperatingMode:](v7, "setOperatingMode:", objc_msgSend(v10, "operatingMode"));
    -[VCAudioSessionMediaProperties setVpOperatingMode:](v7, "setVpOperatingMode:", v9);
    v56 = *(_OWORD *)v59;
    v57 = *(_OWORD *)&v59[16];
    v58 = *(_QWORD *)&v59[32];
    -[VCAudioSessionMediaProperties setInputFormat:](v7, "setInputFormat:", &v56);
    v40 = 1;
  }
  *(_DWORD *)&v59[28] = v40;
  v55 = *(_QWORD *)&v59[32];
  v54[0] = *(_OWORD *)v59;
  v54[1] = *(_OWORD *)&v59[16];
  -[VCAudioSessionMediaProperties setOutputFormat:](v7, "setOutputFormat:", v54);
  -[VCAudioSessionMediaProperties setProcessId:](v7, "setProcessId:", objc_msgSend(a3, "clientPid"));
  if (self->_isGKVoiceChat)
    v41 = 0;
  else
    v41 = !self->_isInDaemon || objc_msgSend(a3, "deviceRole") != 2;
  -[VCAudioSessionMediaProperties setSessionActive:](v7, "setSessionActive:", v41);
  v42 = self->_useOptimizedHandoversForTelephony && objc_msgSend(v10, "operatingMode") == 3;
  -[VCAudioSessionMediaProperties setAudioClockDeviceEnabled:](v7, "setAudioClockDeviceEnabled:", v42);
  -[VCAudioSessionMediaProperties setNetworkUplinkClockUsesBaseband:](v7, "setNetworkUplinkClockUsesBaseband:", objc_msgSend(a3, "networkUplinkClockUsesBaseband"));
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v46 = -[VCAudioSessionMediaProperties description](v7, "description");
        *(_DWORD *)buf = 136315906;
        v61 = v44;
        v62 = 2080;
        v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
        v64 = 1024;
        v65 = 1149;
        v66 = 2112;
        v67 = v46;
        v47 = " [%s] %s:%d Selected audio session media properties: %@";
        v48 = v45;
        v49 = 38;
LABEL_61:
        _os_log_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_DEFAULT, v47, buf, v49);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v43 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v43 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v50 = VRTraceErrorLogLevelToCSTR();
      v51 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v52 = -[VCAudioSessionMediaProperties description](v7, "description");
        *(_DWORD *)buf = 136316418;
        v61 = v50;
        v62 = 2080;
        v63 = "-[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:]";
        v64 = 1024;
        v65 = 1149;
        v66 = 2112;
        v67 = (uint64_t)v43;
        v68 = 2048;
        v69 = self;
        v70 = 2112;
        v71 = v52;
        v47 = " [%s] %s:%d %@(%p) Selected audio session media properties: %@";
        v48 = v51;
        v49 = 58;
        goto LABEL_61;
      }
    }
  }
  return v7;
}

- (AVAudioDevice)currentInputDevice
{
  _opaque_pthread_mutex_t *p_inputDeviceMutex;
  AVAudioDevice *v4;

  p_inputDeviceMutex = &self->_inputDeviceMutex;
  pthread_mutex_lock(&self->_inputDeviceMutex);
  v4 = self->_inputDevice;
  pthread_mutex_unlock(p_inputDeviceMutex);
  return v4;
}

- (void)setCurrentInputDeviceInternal:(id)a3
{
  _opaque_pthread_mutex_t *p_inputDeviceMutex;

  p_inputDeviceMutex = &self->_inputDeviceMutex;
  pthread_mutex_lock(&self->_inputDeviceMutex);

  self->_inputDevice = (AVAudioDevice *)a3;
  pthread_mutex_unlock(p_inputDeviceMutex);
}

- (void)updateCurrentInputDevice:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCAudioManager_updateCurrentInputDevice___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__VCAudioManager_updateCurrentInputDevice___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  _BYTE v21[24];
  __int128 v22;
  _BYTE v23[24];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "deviceID"), "unsignedIntValue");
  if (v2 != (_DWORD)result)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
      v7 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "deviceName"), "UTF8String");
      v8 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "deviceID"), "unsignedIntValue");
      v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceName"), "UTF8String");
      v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
      *(_DWORD *)v21 = 136316674;
      *(_QWORD *)&v21[4] = v5;
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "-[VCAudioManager updateCurrentInputDevice:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1194;
      WORD2(v22) = 2080;
      *(_QWORD *)((char *)&v22 + 6) = v7;
      HIWORD(v22) = 1024;
      *(_DWORD *)v23 = v8;
      *(_WORD *)&v23[4] = 2080;
      *(_QWORD *)&v23[6] = v9;
      *(_WORD *)&v23[14] = 1024;
      *(_DWORD *)&v23[16] = v10;
      v11 = " [%s] %s:%d Input device changed via default change listener. current input device=%s deviceID=%u new input "
            "device=%s deviceID=%u";
      v12 = v6;
      v13 = 60;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 232), "deviceName"), "UTF8String");
      v18 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 232), "deviceID"), "unsignedIntValue");
      v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceName"), "UTF8String");
      v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
      *(_DWORD *)v21 = 136317186;
      *(_QWORD *)&v21[4] = v14;
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "-[VCAudioManager updateCurrentInputDevice:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1194;
      WORD2(v22) = 2112;
      *(_QWORD *)((char *)&v22 + 6) = v4;
      HIWORD(v22) = 2048;
      *(_QWORD *)v23 = v16;
      *(_WORD *)&v23[8] = 2080;
      *(_QWORD *)&v23[10] = v17;
      *(_WORD *)&v23[18] = 1024;
      *(_DWORD *)&v23[20] = v18;
      LOWORD(v24) = 2080;
      *(_QWORD *)((char *)&v24 + 2) = v19;
      WORD5(v24) = 1024;
      HIDWORD(v24) = v20;
      v11 = " [%s] %s:%d %@(%p) Input device changed via default change listener. current input device=%s deviceID=%u new"
            " input device=%s deviceID=%u";
      v12 = v15;
      v13 = 80;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v21, v13);
    return objc_msgSend(*(id *)(a1 + 40), "setCurrentInputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
  }
  return result;
}

- (void)setCurrentInputDevice:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VCAudioManager_setCurrentInputDevice___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

void __40__VCAudioManager_setCurrentInputDevice___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  NSObject *v52;
  uint32_t v53;
  uint64_t v54;
  int v55;
  _BYTE v56[24];
  __int128 v57;
  _BYTE v58[32];
  int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 256))
  {
    v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
    if (v3 == objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "deviceID"), "unsignedIntValue"))return;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_msgSend(*(id *)(a1 + 40), "description");
          v26 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "description");
          *(_DWORD *)v56 = 136316162;
          *(_QWORD *)&v56[4] = v23;
          *(_WORD *)&v56[12] = 2080;
          *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1207;
          WORD2(v57) = 2112;
          *(_QWORD *)((char *)&v57 + 6) = v25;
          HIWORD(v57) = 2112;
          *(_QWORD *)v58 = v26;
          v27 = " [%s] %s:%d Setting input device=%@, previous input device=%@";
          v28 = v24;
          v29 = 48;
LABEL_24:
          _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v27, v56, v29);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(_QWORD *)(a1 + 32);
          v33 = objc_msgSend(*(id *)(a1 + 40), "description");
          v34 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "description");
          *(_DWORD *)v56 = 136316674;
          *(_QWORD *)&v56[4] = v30;
          *(_WORD *)&v56[12] = 2080;
          *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1207;
          WORD2(v57) = 2112;
          *(_QWORD *)((char *)&v57 + 6) = v4;
          HIWORD(v57) = 2048;
          *(_QWORD *)v58 = v32;
          *(_WORD *)&v58[8] = 2112;
          *(_QWORD *)&v58[10] = v33;
          *(_WORD *)&v58[18] = 2112;
          *(_QWORD *)&v58[20] = v34;
          v27 = " [%s] %s:%d %@(%p) Setting input device=%@, previous input device=%@";
          v28 = v31;
          v29 = 68;
          goto LABEL_24;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setCurrentInputDeviceInternal:", *(_QWORD *)(a1 + 40), *(_OWORD *)v56, *(_QWORD *)&v56[16], v57, *(_QWORD *)v58, *(_OWORD *)&v58[8], *(_QWORD *)&v58[24]);
    v35 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v35 + 184) != 3)
      return;
    objc_msgSend((id)v35, "setupIODevicesForAUIO:", *(_QWORD *)(v35 + 168));
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        return;
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      v39 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "deviceName"), "UTF8String");
          v41 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
          *(_DWORD *)v56 = 136316162;
          *(_QWORD *)&v56[4] = v37;
          *(_WORD *)&v56[12] = 2080;
          *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1211;
          WORD2(v57) = 2080;
          *(_QWORD *)((char *)&v57 + 6) = v40;
          HIWORD(v57) = 1024;
          *(_DWORD *)v58 = v41;
          v12 = " [%s] %s:%d Input device change completed. New device=%s deviceID=%u";
          v13 = v38;
          v14 = 44;
          goto LABEL_16;
        }
        return;
      }
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        return;
      v54 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "deviceName"), "UTF8String");
      v55 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
      *(_DWORD *)v56 = 136316162;
      *(_QWORD *)&v56[4] = v37;
      *(_WORD *)&v56[12] = 2080;
      *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
      *(_WORD *)&v56[22] = 1024;
      LODWORD(v57) = 1211;
      WORD2(v57) = 2080;
      *(_QWORD *)((char *)&v57 + 6) = v54;
      HIWORD(v57) = 1024;
      *(_DWORD *)v58 = v55;
      v51 = " [%s] %s:%d Input device change completed. New device=%s deviceID=%u";
      v52 = v38;
      v53 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v36 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v36 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        return;
      v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E0CF2758];
      v44 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = *(_QWORD *)(a1 + 32);
          v46 = objc_msgSend((id)objc_msgSend(*(id *)(v45 + 232), "deviceName"), "UTF8String");
          v47 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
          *(_DWORD *)v56 = 136316674;
          *(_QWORD *)&v56[4] = v42;
          *(_WORD *)&v56[12] = 2080;
          *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1211;
          WORD2(v57) = 2112;
          *(_QWORD *)((char *)&v57 + 6) = v36;
          HIWORD(v57) = 2048;
          *(_QWORD *)v58 = v45;
          *(_WORD *)&v58[8] = 2080;
          *(_QWORD *)&v58[10] = v46;
          *(_WORD *)&v58[18] = 1024;
          *(_DWORD *)&v58[20] = v47;
          v12 = " [%s] %s:%d %@(%p) Input device change completed. New device=%s deviceID=%u";
          v13 = v43;
          v14 = 64;
          goto LABEL_16;
        }
        return;
      }
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        return;
      v48 = *(_QWORD *)(a1 + 32);
      v49 = objc_msgSend((id)objc_msgSend(*(id *)(v48 + 232), "deviceName"), "UTF8String");
      v50 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
      *(_DWORD *)v56 = 136316674;
      *(_QWORD *)&v56[4] = v42;
      *(_WORD *)&v56[12] = 2080;
      *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
      *(_WORD *)&v56[22] = 1024;
      LODWORD(v57) = 1211;
      WORD2(v57) = 2112;
      *(_QWORD *)((char *)&v57 + 6) = v36;
      HIWORD(v57) = 2048;
      *(_QWORD *)v58 = v48;
      *(_WORD *)&v58[8] = 2080;
      *(_QWORD *)&v58[10] = v49;
      *(_WORD *)&v58[18] = 1024;
      *(_DWORD *)&v58[20] = v50;
      v51 = " [%s] %s:%d %@(%p) Input device change completed. New device=%s deviceID=%u";
      v52 = v43;
      v53 = 64;
    }
    _os_log_debug_impl(&dword_1D8A54000, v52, OS_LOG_TYPE_DEBUG, v51, v56, v53);
    return;
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(unsigned __int8 *)(v8 + 256);
        v10 = objc_msgSend((id)objc_msgSend(*(id *)(v8 + 232), "deviceName"), "UTF8String");
        v11 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
        *(_DWORD *)v56 = 136316674;
        *(_QWORD *)&v56[4] = v5;
        *(_WORD *)&v56[12] = 2080;
        *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
        *(_WORD *)&v56[22] = 1024;
        LODWORD(v57) = 1203;
        WORD2(v57) = 1024;
        *(_DWORD *)((char *)&v57 + 6) = v7;
        WORD5(v57) = 1024;
        HIDWORD(v57) = v9;
        *(_WORD *)v58 = 2080;
        *(_QWORD *)&v58[2] = v10;
        *(_WORD *)&v58[10] = 1024;
        *(_DWORD *)&v58[12] = v11;
        v12 = " [%s] %s:%d Ignoring attempt to set newInputDevice=%u since _followSystemInput=%d. Current inputDevice=%s deviceID=%u";
        v13 = v6;
        v14 = 56;
LABEL_16:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v56, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(unsigned __int8 *)(v19 + 256);
        v21 = objc_msgSend((id)objc_msgSend(*(id *)(v19 + 232), "deviceName"), "UTF8String");
        v22 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "deviceID"), "unsignedIntegerValue");
        *(_DWORD *)v56 = 136317186;
        *(_QWORD *)&v56[4] = v15;
        *(_WORD *)&v56[12] = 2080;
        *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentInputDevice:]_block_invoke";
        *(_WORD *)&v56[22] = 1024;
        LODWORD(v57) = 1203;
        WORD2(v57) = 2112;
        *(_QWORD *)((char *)&v57 + 6) = v2;
        HIWORD(v57) = 2048;
        *(_QWORD *)v58 = v17;
        *(_WORD *)&v58[8] = 1024;
        *(_DWORD *)&v58[10] = v18;
        *(_WORD *)&v58[14] = 1024;
        *(_DWORD *)&v58[16] = v20;
        *(_WORD *)&v58[20] = 2080;
        *(_QWORD *)&v58[22] = v21;
        *(_WORD *)&v58[30] = 1024;
        v59 = v22;
        v12 = " [%s] %s:%d %@(%p) Ignoring attempt to set newInputDevice=%u since _followSystemInput=%d. Current inputDev"
              "ice=%s deviceID=%u";
        v13 = v16;
        v14 = 76;
        goto LABEL_16;
      }
    }
  }
}

- (AVAudioDevice)currentOutputDevice
{
  _opaque_pthread_mutex_t *p_outputDeviceMutex;
  AVAudioDevice *v4;

  p_outputDeviceMutex = &self->_outputDeviceMutex;
  pthread_mutex_lock(&self->_outputDeviceMutex);
  v4 = self->_outputDevice;
  pthread_mutex_unlock(p_outputDeviceMutex);
  return v4;
}

- (void)setCurrentOutputDeviceInternal:(id)a3
{
  _opaque_pthread_mutex_t *p_outputDeviceMutex;

  p_outputDeviceMutex = &self->_outputDeviceMutex;
  pthread_mutex_lock(&self->_outputDeviceMutex);

  self->_outputDevice = (AVAudioDevice *)a3;
  pthread_mutex_unlock(p_outputDeviceMutex);
}

- (void)setCurrentOutputDevice:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__VCAudioManager_setCurrentOutputDevice___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(dispatchQueue, block);
}

void __41__VCAudioManager_setCurrentOutputDevice___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  int v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  int v33;
  int v34;
  uint64_t v35;
  const __CFString *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  NSObject *v52;
  uint32_t v53;
  uint64_t v54;
  int v55;
  _BYTE v56[24];
  __int128 v57;
  _BYTE v58[30];
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 257))
  {
    v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
    if (v3 == objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceID"), "unsignedIntValue"))return;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
          v26 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceID"), "unsignedIntValue");
          *(_DWORD *)v56 = 136316162;
          *(_QWORD *)&v56[4] = v23;
          *(_WORD *)&v56[12] = 2080;
          *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1240;
          WORD2(v57) = 1024;
          *(_DWORD *)((char *)&v57 + 6) = v25;
          WORD5(v57) = 1024;
          HIDWORD(v57) = v26;
          v27 = " [%s] %s:%d Setting output deviceID=%u, previous output deviceID=%u";
          v28 = v24;
          v29 = 40;
LABEL_24:
          _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v27, v56, v29);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(_QWORD *)(a1 + 32);
          v33 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
          v34 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceID"), "unsignedIntValue");
          *(_DWORD *)v56 = 136316674;
          *(_QWORD *)&v56[4] = v30;
          *(_WORD *)&v56[12] = 2080;
          *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1240;
          WORD2(v57) = 2112;
          *(_QWORD *)((char *)&v57 + 6) = v4;
          HIWORD(v57) = 2048;
          *(_QWORD *)v58 = v32;
          *(_WORD *)&v58[8] = 1024;
          *(_DWORD *)&v58[10] = v33;
          *(_WORD *)&v58[14] = 1024;
          *(_DWORD *)&v58[16] = v34;
          v27 = " [%s] %s:%d %@(%p) Setting output deviceID=%u, previous output deviceID=%u";
          v28 = v31;
          v29 = 60;
          goto LABEL_24;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "setCurrentOutputDeviceInternal:", *(_QWORD *)(a1 + 40), *(_OWORD *)v56, *(_QWORD *)&v56[16], v57, *(_QWORD *)v58, *(_OWORD *)&v58[8]);
    v35 = *(_QWORD *)(a1 + 32);
    if (*(_DWORD *)(v35 + 184) != 3)
      return;
    objc_msgSend((id)v35, "setupIODevicesForAUIO:", *(_QWORD *)(v35 + 168));
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        return;
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      v39 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceName"), "UTF8String");
          v41 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
          *(_DWORD *)v56 = 136316162;
          *(_QWORD *)&v56[4] = v37;
          *(_WORD *)&v56[12] = 2080;
          *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1244;
          WORD2(v57) = 2080;
          *(_QWORD *)((char *)&v57 + 6) = v40;
          HIWORD(v57) = 1024;
          *(_DWORD *)v58 = v41;
          v12 = " [%s] %s:%d Output device change completed. New device=%s deviceID=%u";
          v13 = v38;
          v14 = 44;
          goto LABEL_16;
        }
        return;
      }
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        return;
      v54 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceName"), "UTF8String");
      v55 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
      *(_DWORD *)v56 = 136316162;
      *(_QWORD *)&v56[4] = v37;
      *(_WORD *)&v56[12] = 2080;
      *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
      *(_WORD *)&v56[22] = 1024;
      LODWORD(v57) = 1244;
      WORD2(v57) = 2080;
      *(_QWORD *)((char *)&v57 + 6) = v54;
      HIWORD(v57) = 1024;
      *(_DWORD *)v58 = v55;
      v51 = " [%s] %s:%d Output device change completed. New device=%s deviceID=%u";
      v52 = v38;
      v53 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v36 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v36 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        return;
      v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E0CF2758];
      v44 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          v45 = *(_QWORD *)(a1 + 32);
          v46 = objc_msgSend((id)objc_msgSend(*(id *)(v45 + 240), "deviceName"), "UTF8String");
          v47 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
          *(_DWORD *)v56 = 136316674;
          *(_QWORD *)&v56[4] = v42;
          *(_WORD *)&v56[12] = 2080;
          *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
          *(_WORD *)&v56[22] = 1024;
          LODWORD(v57) = 1244;
          WORD2(v57) = 2112;
          *(_QWORD *)((char *)&v57 + 6) = v36;
          HIWORD(v57) = 2048;
          *(_QWORD *)v58 = v45;
          *(_WORD *)&v58[8] = 2080;
          *(_QWORD *)&v58[10] = v46;
          *(_WORD *)&v58[18] = 1024;
          *(_DWORD *)&v58[20] = v47;
          v12 = " [%s] %s:%d %@(%p) Output device change completed. New device=%s deviceID=%u";
          v13 = v43;
          v14 = 64;
          goto LABEL_16;
        }
        return;
      }
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        return;
      v48 = *(_QWORD *)(a1 + 32);
      v49 = objc_msgSend((id)objc_msgSend(*(id *)(v48 + 240), "deviceName"), "UTF8String");
      v50 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
      *(_DWORD *)v56 = 136316674;
      *(_QWORD *)&v56[4] = v42;
      *(_WORD *)&v56[12] = 2080;
      *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
      *(_WORD *)&v56[22] = 1024;
      LODWORD(v57) = 1244;
      WORD2(v57) = 2112;
      *(_QWORD *)((char *)&v57 + 6) = v36;
      HIWORD(v57) = 2048;
      *(_QWORD *)v58 = v48;
      *(_WORD *)&v58[8] = 2080;
      *(_QWORD *)&v58[10] = v49;
      *(_WORD *)&v58[18] = 1024;
      *(_DWORD *)&v58[20] = v50;
      v51 = " [%s] %s:%d %@(%p) Output device change completed. New device=%s deviceID=%u";
      v52 = v43;
      v53 = 64;
    }
    _os_log_debug_impl(&dword_1D8A54000, v52, OS_LOG_TYPE_DEBUG, v51, v56, v53);
    return;
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(unsigned __int8 *)(v8 + 257);
        v10 = objc_msgSend((id)objc_msgSend(*(id *)(v8 + 240), "deviceName"), "UTF8String");
        v11 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
        *(_DWORD *)v56 = 136316674;
        *(_QWORD *)&v56[4] = v5;
        *(_WORD *)&v56[12] = 2080;
        *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
        *(_WORD *)&v56[22] = 1024;
        LODWORD(v57) = 1236;
        WORD2(v57) = 1024;
        *(_DWORD *)((char *)&v57 + 6) = v7;
        WORD5(v57) = 1024;
        HIDWORD(v57) = v9;
        *(_WORD *)v58 = 2080;
        *(_QWORD *)&v58[2] = v10;
        *(_WORD *)&v58[10] = 1024;
        *(_DWORD *)&v58[12] = v11;
        v12 = " [%s] %s:%d Ignoring attempt to set newOutputDevice=%u since _followSystemOutput=%d. Current outputDevice=%s deviceID=%u";
        v13 = v6;
        v14 = 56;
LABEL_16:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v56, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "deviceID"), "unsignedIntValue");
        v19 = *(_QWORD *)(a1 + 32);
        v20 = *(unsigned __int8 *)(v19 + 257);
        v21 = objc_msgSend((id)objc_msgSend(*(id *)(v19 + 240), "deviceName"), "UTF8String");
        v22 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "deviceID"), "unsignedIntegerValue");
        *(_DWORD *)v56 = 136317186;
        *(_QWORD *)&v56[4] = v15;
        *(_WORD *)&v56[12] = 2080;
        *(_QWORD *)&v56[14] = "-[VCAudioManager setCurrentOutputDevice:]_block_invoke";
        *(_WORD *)&v56[22] = 1024;
        LODWORD(v57) = 1236;
        WORD2(v57) = 2112;
        *(_QWORD *)((char *)&v57 + 6) = v2;
        HIWORD(v57) = 2048;
        *(_QWORD *)v58 = v17;
        *(_WORD *)&v58[8] = 1024;
        *(_DWORD *)&v58[10] = v18;
        *(_WORD *)&v58[14] = 1024;
        *(_DWORD *)&v58[16] = v20;
        *(_WORD *)&v58[20] = 2080;
        *(_QWORD *)&v58[22] = v21;
        v59 = 1024;
        v60 = v22;
        v12 = " [%s] %s:%d %@(%p) Ignoring attempt to set newOutputDevice=%u since _followSystemOutput=%d. Current output"
              "Device=%s deviceID=%u";
        v13 = v16;
        v14 = 76;
        goto LABEL_16;
      }
    }
  }
}

- (void)updateCurrentOutputDevice:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCAudioManager_updateCurrentOutputDevice___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __44__VCAudioManager_updateCurrentOutputDevice___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t result;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  _BYTE v21[24];
  __int128 v22;
  _BYTE v23[24];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
  result = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "deviceID"), "unsignedIntValue");
  if (v2 != (_DWORD)result)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
      v7 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "deviceName"), "UTF8String");
      v8 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "deviceID"), "unsignedIntValue");
      v9 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceName"), "UTF8String");
      v10 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
      *(_DWORD *)v21 = 136316674;
      *(_QWORD *)&v21[4] = v5;
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "-[VCAudioManager updateCurrentOutputDevice:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1253;
      WORD2(v22) = 2080;
      *(_QWORD *)((char *)&v22 + 6) = v7;
      HIWORD(v22) = 1024;
      *(_DWORD *)v23 = v8;
      *(_WORD *)&v23[4] = 2080;
      *(_QWORD *)&v23[6] = v9;
      *(_WORD *)&v23[14] = 1024;
      *(_DWORD *)&v23[16] = v10;
      v11 = " [%s] %s:%d Output device changed via default change listener. current output device=%s deviceID=%u new outp"
            "ut device=%s deviceID=%u";
      v12 = v6;
      v13 = 60;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
      v16 = *(_QWORD *)(a1 + 40);
      v17 = objc_msgSend((id)objc_msgSend(*(id *)(v16 + 240), "deviceName"), "UTF8String");
      v18 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 240), "deviceID"), "unsignedIntValue");
      v19 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceName"), "UTF8String");
      v20 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "deviceID"), "unsignedIntValue");
      *(_DWORD *)v21 = 136317186;
      *(_QWORD *)&v21[4] = v14;
      *(_WORD *)&v21[12] = 2080;
      *(_QWORD *)&v21[14] = "-[VCAudioManager updateCurrentOutputDevice:]_block_invoke";
      *(_WORD *)&v21[22] = 1024;
      LODWORD(v22) = 1253;
      WORD2(v22) = 2112;
      *(_QWORD *)((char *)&v22 + 6) = v4;
      HIWORD(v22) = 2048;
      *(_QWORD *)v23 = v16;
      *(_WORD *)&v23[8] = 2080;
      *(_QWORD *)&v23[10] = v17;
      *(_WORD *)&v23[18] = 1024;
      *(_DWORD *)&v23[20] = v18;
      LOWORD(v24) = 2080;
      *(_QWORD *)((char *)&v24 + 2) = v19;
      WORD5(v24) = 1024;
      HIDWORD(v24) = v20;
      v11 = " [%s] %s:%d %@(%p) Output device changed via default change listener. current output device=%s deviceID=%u n"
            "ew output device=%s deviceID=%u";
      v12 = v15;
      v13 = 80;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v21, v13);
    return objc_msgSend(*(id *)(a1 + 40), "setCurrentOutputDeviceInternal:", *(_QWORD *)(a1 + 32), *(_OWORD *)v21, *(_QWORD *)&v21[16], v22, *(_QWORD *)v23, *(_QWORD *)&v23[8], *(_QWORD *)&v23[16], v24);
  }
  return result;
}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCAudioManager_setMediaPlaybackOnExternalDevice___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, block);
}

uint64_t __51__VCAudioManager_setMediaPlaybackOnExternalDevice___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 960) = *(_BYTE *)(a1 + 40);
  return AUIOSetMediaPlaybackOnExternalDevice(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 960));
}

- (BOOL)startAUIOWithProperties:(id)a3
{
  const __CFString *v4;
  SnapshotTimer *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  int v15;
  char *v16;
  _BOOL4 isMicrophoneMuted;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  char *v27;
  _BOOL4 v28;
  uint64_t v29;
  unsigned int audioSessionId;
  const __CFString *v31;
  uint64_t v32;
  NSObject *v33;
  int v34;
  unsigned int v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  uint64_t v39;
  NSObject *v40;
  int v41;
  unsigned int v42;
  unsigned int v43;
  _OWORD *v44;
  __int128 v45;
  __int128 v46;
  __int128 *v47;
  __int128 v48;
  __int128 v49;
  unsigned __int8 v50;
  VCAudioSession *audioSession;
  int playbackMode;
  _OWORD *v53;
  int v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  __int128 *v58;
  __int128 *v59;
  int v60;
  int v61;
  int v62;
  unsigned int v63;
  double v64;
  int v65;
  int v66;
  int v67;
  SnapshotTimer *v68;
  const __CFString *v69;
  uint64_t v70;
  NSObject *v71;
  const char *v72;
  NSObject *v73;
  uint32_t v74;
  int v75;
  const __CFString *v76;
  uint64_t v77;
  NSObject *v78;
  opaqueVCAudioLimiter *v80;
  uint64_t v81;
  NSObject *v82;
  int v83;
  uint64_t v84;
  NSObject *v85;
  int v86;
  const __CFString *v87;
  int v88;
  uint64_t v89;
  NSObject *v90;
  int v91;
  uint64_t v92;
  NSObject *v93;
  int v94;
  ATSpatialStreamDescriptions *spatialStreamDescriptions;
  int v96;
  SnapshotTimer *v97;
  _OWORD v98[4];
  __int128 v99;
  _OWORD v100[6];
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  int v110;
  uint8_t buf[4];
  uint64_t v112;
  __int16 v113;
  const char *v114;
  __int16 v115;
  int v116;
  __int16 v117;
  _BYTE v118[10];
  __int128 v119;
  _BYTE v120[10];
  __int16 v121;
  char *v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  _BOOL4 v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  if (self->_hAUIO == (tagHANDLE *)0xFFFFFFFFLL)
  {
    v6 = objc_alloc_init(SnapshotTimer);
    -[SnapshotTimer checkinWithTimeout:forTask:](v6, "checkinWithTimeout:forTask:", CFSTR("startAudioIO"), 5.0);
    v97 = v6;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(a3, "audioSessionId");
          v14 = objc_msgSend(a3, "operatingMode");
          v15 = objc_msgSend(a3, "deviceRole");
          v16 = FourccToCStr(objc_msgSend(a3, "remoteCodecType"));
          objc_msgSend(a3, "remoteCodecSampleRate");
          isMicrophoneMuted = self->_isMicrophoneMuted;
          *(_DWORD *)buf = 136317186;
          v112 = v11;
          v113 = 2080;
          v114 = "-[VCAudioManager startAUIOWithProperties:]";
          v115 = 1024;
          v116 = 1315;
          v117 = 1024;
          *(_DWORD *)v118 = v13;
          *(_WORD *)&v118[4] = 1024;
          *(_DWORD *)&v118[6] = v14;
          LOWORD(v119) = 1024;
          *(_DWORD *)((char *)&v119 + 2) = v15;
          WORD3(v119) = 2080;
          *((_QWORD *)&v119 + 1) = v16;
          *(_WORD *)v120 = 2048;
          *(_QWORD *)&v120[2] = v18;
          v121 = 1024;
          LODWORD(v122) = isMicrophoneMuted;
          v19 = " [%s] %s:%d CMSession:[%u] Starting AUIO operatingMode[%d] deviceRole[%d] remoteCodecType[%s] remoteCode"
                "cRate[%f] isMicrophoneMuted[%d]";
          v20 = v12;
          v21 = 72;
LABEL_23:
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_msgSend(a3, "audioSessionId");
          v25 = objc_msgSend(a3, "operatingMode");
          v26 = objc_msgSend(a3, "deviceRole");
          v27 = FourccToCStr(objc_msgSend(a3, "remoteCodecType"));
          objc_msgSend(a3, "remoteCodecSampleRate");
          v28 = self->_isMicrophoneMuted;
          *(_DWORD *)buf = 136317698;
          v112 = v22;
          v113 = 2080;
          v114 = "-[VCAudioManager startAUIOWithProperties:]";
          v115 = 1024;
          v116 = 1315;
          v117 = 2112;
          *(_QWORD *)v118 = v7;
          *(_WORD *)&v118[8] = 2048;
          *(_QWORD *)&v119 = self;
          WORD4(v119) = 1024;
          *(_DWORD *)((char *)&v119 + 10) = v24;
          HIWORD(v119) = 1024;
          *(_DWORD *)v120 = v25;
          *(_WORD *)&v120[4] = 1024;
          *(_DWORD *)&v120[6] = v26;
          v121 = 2080;
          v122 = v27;
          v123 = 2048;
          v124 = v29;
          v125 = 1024;
          v126 = v28;
          v19 = " [%s] %s:%d %@(%p) CMSession:[%u] Starting AUIO operatingMode[%d] deviceRole[%d] remoteCodecType[%s] rem"
                "oteCodecRate[%f] isMicrophoneMuted[%d]";
          v20 = v23;
          v21 = 92;
          goto LABEL_23;
        }
      }
    }
    -[VCAudioManager startVADWithAudioUnitProperties:](self, "startVADWithAudioUnitProperties:", a3);
    v101 = 0xFFFFFFFFLL;
    if (self->_isGKVoiceChat)
    {
      v96 = 0;
      self->_sourceData.audioLimiter = 0;
      goto LABEL_28;
    }
    if (self->_playbackMode)
    {
      v96 = 0;
      goto LABEL_28;
    }
    v80 = (opaqueVCAudioLimiter *)VCAudioLimiter_Allocate((__int128 *)objc_msgSend(a3, "frameFormatMic"));
    self->_sourceData.audioLimiter = v80;
    if (v80)
    {
      if ((VCAudioLimiter_Start((uint64_t)v80) & 1) != 0)
      {
        v96 = 1;
LABEL_28:
        audioSessionId = self->_sourceData.audioSessionId;
        if (audioSessionId == objc_msgSend(a3, "audioSessionId"))
          goto LABEL_40;
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v32 = VRTraceErrorLogLevelToCSTR();
            v33 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v34 = objc_msgSend(a3, "audioSessionId");
              v35 = self->_sourceData.audioSessionId;
              *(_DWORD *)buf = 136316162;
              v112 = v32;
              v113 = 2080;
              v114 = "-[VCAudioManager startAUIOWithProperties:]";
              v115 = 1024;
              v116 = 1331;
              v117 = 1024;
              *(_DWORD *)v118 = v34;
              *(_WORD *)&v118[4] = 1024;
              *(_DWORD *)&v118[6] = v35;
              v36 = " [%s] %s:%d New active audioSessionId=%u previousAudioSessionID=%u";
              v37 = v33;
              v38 = 40;
LABEL_39:
              _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
            }
          }
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v31 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v31 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v39 = VRTraceErrorLogLevelToCSTR();
            v40 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v41 = objc_msgSend(a3, "audioSessionId");
              v42 = self->_sourceData.audioSessionId;
              *(_DWORD *)buf = 136316674;
              v112 = v39;
              v113 = 2080;
              v114 = "-[VCAudioManager startAUIOWithProperties:]";
              v115 = 1024;
              v116 = 1331;
              v117 = 2112;
              *(_QWORD *)v118 = v31;
              *(_WORD *)&v118[8] = 2048;
              *(_QWORD *)&v119 = self;
              WORD4(v119) = 1024;
              *(_DWORD *)((char *)&v119 + 10) = v41;
              HIWORD(v119) = 1024;
              *(_DWORD *)v120 = v42;
              v36 = " [%s] %s:%d %@(%p) New active audioSessionId=%u previousAudioSessionID=%u";
              v37 = v40;
              v38 = 60;
              goto LABEL_39;
            }
          }
        }
LABEL_40:
        v43 = objc_msgSend(a3, "audioSessionId");
        self->_sourceData.audioSessionId = v43;
        self->_sinkData.audioSessionId = v43;
        memset(&v100[3], 170, 48);
        v99 = xmmword_1D9108C60;
        memset(v100, 170, 48);
        v98[0] = xmmword_1D9108C20;
        memset(&v98[1], 170, 48);
        v44 = (_OWORD *)objc_msgSend(a3, "frameFormatSpeaker");
        v46 = v44[1];
        v45 = v44[2];
        v98[0] = *v44;
        v98[1] = v46;
        v98[2] = v45;
        *(_QWORD *)&v98[3] = &self->_sourceData;
        *((_QWORD *)&v98[3] + 1) = VCAudioManager_PullAudioSamples;
        v47 = (__int128 *)objc_msgSend(a3, "frameFormatMic");
        v49 = v47[1];
        v48 = v47[2];
        v99 = *v47;
        v100[0] = v49;
        v100[1] = v48;
        *(_QWORD *)&v100[2] = &self->_sinkData;
        *((_QWORD *)&v100[2] + 1) = VCAudioManager_PushAudioSamples;
        *(_QWORD *)&v100[3] = VCAudioManager_ErrorProc;
        BYTE8(v100[3]) = !self->_isGKVoiceChat;
        BYTE9(v100[3]) = objc_msgSend(a3, "audioUnitType") == 2;
        v50 = +[VCAudioManager audioIOType:shouldEnableAudioInput:](VCAudioManager, "audioIOType:shouldEnableAudioInput:", a3, self->_playbackMode != 1);
        audioSession = self->_audioSession;
        BYTE10(v100[3]) = v50;
        *(_QWORD *)&v100[4] = audioSession;
        *((_QWORD *)&v100[4] + 1) = self;
        *(_QWORD *)&v100[5] = VCAudioManager_InputDeviceSelectionCallback;
        *((_QWORD *)&v100[5] + 1) = VCAudioManager_OutputDeviceSelectionCallback;
        playbackMode = self->_playbackMode;
        if (playbackMode == 1)
        {
          v53 = &v100[2];
        }
        else
        {
          if (playbackMode != 2)
            goto LABEL_45;
          v53 = &v98[3];
        }
        BYTE8(v100[3]) = 0;
        *(_QWORD *)v53 = 0;
        *((_QWORD *)v53 + 1) = 0;
LABEL_45:
        v54 = AUIOCreateHandle(&v101, (uint64_t)v98);
        if (v54 < 0)
        {
          v83 = v54;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            v84 = VRTraceErrorLogLevelToCSTR();
            v85 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            {
              v94 = objc_msgSend(a3, "audioSessionId");
              *(_DWORD *)buf = 136316418;
              v112 = v84;
              v113 = 2080;
              v114 = "-[VCAudioManager startAUIOWithProperties:]";
              v115 = 1024;
              v116 = 1363;
              v117 = 1024;
              *(_DWORD *)v118 = 1363;
              *(_WORD *)&v118[4] = 1024;
              *(_DWORD *)&v118[6] = v94;
              LOWORD(v119) = 1024;
              *(_DWORD *)((char *)&v119 + 2) = v83;
              _os_log_error_impl(&dword_1D8A54000, v85, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioManager.m:%d: CMSession:[%u] AUIOCreateHandle failed(%X)", buf, 0x2Eu);
            }
          }
          v68 = v6;
        }
        else
        {
          if (!self->_playbackMode)
            -[VCAudioManager setupIODevicesForAUIO:](self, "setupIODevicesForAUIO:", v101);
          if (self->_isMediaPlaybackOnExternalDevice)
            AUIOSetMediaPlaybackOnExternalDevice(v101, 1);
          if (!self->_playbackMode)
            -[VCAudioManager setupDynamicDuckingVolumeHandlerForAUIO:](self, "setupDynamicDuckingVolumeHandlerForAUIO:", v101);
          v110 = -1431655766;
          *(_QWORD *)&v55 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v108 = v55;
          v109 = v55;
          v106 = v55;
          v107 = v55;
          v104 = v55;
          v105 = v55;
          v102 = v55;
          v103 = v55;
          if (a3)
          {
            objc_msgSend(a3, "farEndVersionInfo");
          }
          else
          {
            v110 = 0;
            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            v104 = 0u;
            v105 = 0u;
            v102 = 0u;
            v103 = 0u;
          }
          v56 = v101;
          v57 = objc_msgSend(a3, "frameFormatMic");
          v58 = (__int128 *)objc_msgSend(a3, "frameFormatSpeaker");
          if (objc_msgSend(a3, "isFarEndVersionInfoValid"))
            v59 = &v102;
          else
            v59 = 0;
          v60 = objc_msgSend(a3, "allowAudioRecording");
          v61 = objc_msgSend(a3, "vpOperatingMode");
          v62 = objc_msgSend(a3, "vpEnableSpatialChat");
          v63 = objc_msgSend(a3, "remoteCodecType");
          objc_msgSend(a3, "remoteCodecSampleRate");
          spatialStreamDescriptions = self->_spatialStreamDescriptions;
          v65 = AUIOSetupFormats(v64, v56, v57, v58, (uint64_t)v59, v60, v61, v62, v63);
          if (v65 < 0)
          {
            v86 = v65;
            if ((VCAudioManager *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCAudioManager startAUIOWithProperties:].cold.2();
              }
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v87 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix, spatialStreamDescriptions);
              else
                v87 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                v92 = VRTraceErrorLogLevelToCSTR();
                v93 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136316418;
                  v112 = v92;
                  v113 = 2080;
                  v114 = "-[VCAudioManager startAUIOWithProperties:]";
                  v115 = 1024;
                  v116 = 1377;
                  v117 = 2112;
                  *(_QWORD *)v118 = v87;
                  *(_WORD *)&v118[8] = 2048;
                  *(_QWORD *)&v119 = self;
                  WORD4(v119) = 1024;
                  *(_DWORD *)((char *)&v119 + 10) = v86;
                  _os_log_error_impl(&dword_1D8A54000, v93, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) AUIOSetupFormats() failed. hResult=0x%08X", buf, 0x36u);
                }
              }
            }
            v68 = v97;
          }
          else
          {
            v66 = -[VCAudioManager registerForMutedTalkerNotificationWithAUIO:](self, "registerForMutedTalkerNotificationWithAUIO:", v101, spatialStreamDescriptions);
            if (v66 < 0)
            {
              v75 = v66;
              if ((VCAudioManager *)objc_opt_class() == self)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCAudioManager startAUIOWithProperties:].cold.3();
                }
              }
              else
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v76 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
                else
                  v76 = &stru_1E9E58EE0;
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  v81 = VRTraceErrorLogLevelToCSTR();
                  v82 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136316418;
                    v112 = v81;
                    v113 = 2080;
                    v114 = "-[VCAudioManager startAUIOWithProperties:]";
                    v115 = 1024;
                    v116 = 1381;
                    v117 = 2112;
                    *(_QWORD *)v118 = v76;
                    *(_WORD *)&v118[8] = 2048;
                    *(_QWORD *)&v119 = self;
                    WORD4(v119) = 1024;
                    *(_DWORD *)((char *)&v119 + 10) = v75;
                    _os_log_error_impl(&dword_1D8A54000, v82, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to register muted talker notification callback hResult=0x%08X", buf, 0x36u);
                  }
                }
              }
            }
            self->_hAUIO = (tagHANDLE *)v101;
            -[VCAudioManager setupSpatialContextWithAudioUnitProperties:forceUpdate:](self, "setupSpatialContextWithAudioUnitProperties:forceUpdate:", a3, 1);
            -[VCAudioManager applyAudioSessionMute](self, "applyAudioSessionMute");
            v67 = AUIOStart(v101);
            if ((v67 & 0x80000000) == 0)
            {
              -[VCAudioManager setInputMetering](self, "setInputMetering");
              -[VCAudioManager setOutputMetering](self, "setOutputMetering");
              v101 = 0xFFFFFFFFLL;
              v10 = 1;
              v68 = v97;
              goto LABEL_62;
            }
            v88 = v67;
            v68 = v97;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v89 = VRTraceErrorLogLevelToCSTR();
              v90 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v91 = objc_msgSend(a3, "audioSessionId");
                *(_DWORD *)buf = 136316418;
                v112 = v89;
                v113 = 2080;
                v114 = "-[VCAudioManager startAUIOWithProperties:]";
                v115 = 1024;
                v116 = 1395;
                v117 = 1024;
                *(_DWORD *)v118 = 1395;
                *(_WORD *)&v118[4] = 1024;
                *(_DWORD *)&v118[6] = v91;
                LOWORD(v119) = 2048;
                *(_QWORD *)((char *)&v119 + 2) = v88;
                _os_log_error_impl(&dword_1D8A54000, v90, OS_LOG_TYPE_ERROR, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioManager.m:%d: [CMSession]:%u AUIOStart failed(%08lX)", buf, 0x32u);
              }
            }
          }
        }
LABEL_106:
        if (v101 != 0xFFFFFFFFLL)
        {
          self->_hAUIO = (tagHANDLE *)0xFFFFFFFFLL;
          AUIOCloseHandle();
          if (v96)
            VCAudioLimiter_Stop((uint64_t)self->_sourceData.audioLimiter);
          VCAudioDucker_Destroy((void **)&self->_sourceData.audioLimiter);
          VCVoiceDetector_Stop(self->_sinkData.voiceDetector);
          v10 = 0;
          goto LABEL_76;
        }
        v10 = 0;
LABEL_62:
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_76;
          v70 = VRTraceErrorLogLevelToCSTR();
          v71 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_76;
          *(_DWORD *)buf = 136315650;
          v112 = v70;
          v113 = 2080;
          v114 = "-[VCAudioManager startAUIOWithProperties:]";
          v115 = 1024;
          v116 = 1413;
          v72 = " [%s] %s:%d startAudioIO is completed";
          v73 = v71;
          v74 = 28;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v69 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v69 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_76;
          v77 = VRTraceErrorLogLevelToCSTR();
          v78 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_76;
          *(_DWORD *)buf = 136316162;
          v112 = v77;
          v113 = 2080;
          v114 = "-[VCAudioManager startAUIOWithProperties:]";
          v115 = 1024;
          v116 = 1413;
          v117 = 2112;
          *(_QWORD *)v118 = v69;
          *(_WORD *)&v118[8] = 2048;
          *(_QWORD *)&v119 = self;
          v72 = " [%s] %s:%d %@(%p) startAudioIO is completed";
          v73 = v78;
          v74 = 48;
        }
        _os_log_impl(&dword_1D8A54000, v73, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
LABEL_76:
        -[SnapshotTimer checkout](v68, "checkout", spatialStreamDescriptions);

        return v10;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager startAUIOWithProperties:].cold.4();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager startAUIOWithProperties:].cold.1();
    }
    v96 = 0;
    v68 = v6;
    goto LABEL_106;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager startAUIOWithProperties:].cold.5();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v112 = v8;
        v113 = 2080;
        v114 = "-[VCAudioManager startAUIOWithProperties:]";
        v115 = 1024;
        v116 = 1306;
        v117 = 2112;
        *(_QWORD *)v118 = v4;
        *(_WORD *)&v118[8] = 2048;
        *(_QWORD *)&v119 = self;
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) AUIO already exists", buf, 0x30u);
      }
    }
  }
  return 0;
}

+ (unsigned)audioIOType:(id)a3 shouldEnableAudioInput:(BOOL)a4
{
  if (!a4)
    return 2;
  if (objc_msgSend(a3, "operatingMode") == 12)
    return 1;
  if (objc_msgSend(a3, "audioUnitType") == 2)
    return 3;
  return 4;
}

- (BOOL)shouldResetAudioUnitWithProperties:(id)a3
{
  int v5;
  const __CFString *v6;
  double v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  int v13;
  int v14;
  double v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;
  const __CFString *v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  unsigned int v43;
  int v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  int v49;
  int v50;
  const __CFString *v51;
  const __CFString *v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  unsigned int v57;
  int v58;
  const __CFString *v59;
  uint64_t v60;
  int v61;
  int v62;
  uint64_t v63;
  unsigned int v64;
  int v65;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t v71;
  _BOOL4 v72;
  NSObject *v73;
  uint32_t v74;
  uint64_t v75;
  _BOOL4 v76;
  int v77;
  uint64_t v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  __int16 v83;
  _BYTE v84[10];
  VCAudioManager *v85;
  __int16 v86;
  unsigned int v87;
  __int16 v88;
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v5 = -[VCAudioUnitProperties allowAudioRecording](self->_currentAudioUnitProperties, "allowAudioRecording");
  if (v5 == objc_msgSend(a3, "allowAudioRecording"))
  {
    v7 = *(double *)-[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic");
    if (v7 == *(double *)objc_msgSend(a3, "frameFormatMic"))
    {
      v13 = (int)-[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic")[40];
      if (v13 == *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 40))
      {
        v14 = (int)-[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic")[28];
        if (v14 == *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 28))
        {
          v15 = *(double *)-[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker");
          if (v15 == *(double *)objc_msgSend(a3, "frameFormatSpeaker"))
          {
            v34 = (int)-[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker")[40];
            if (v34 == *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 40))
            {
              v35 = (int)-[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker")[28];
              if (v35 == *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 28))
              {
                v36 = -[VCAudioUnitProperties vpOperatingMode](self->_currentAudioUnitProperties, "vpOperatingMode");
                if (v36 == objc_msgSend(a3, "vpOperatingMode"))
                {
                  v37 = -[VCAudioUnitProperties vpEnableSpatialChat](self->_currentAudioUnitProperties, "vpEnableSpatialChat");
                  if (v37 == objc_msgSend(a3, "vpEnableSpatialChat"))
                    return 0;
                  if ((VCAudioManager *)objc_opt_class() == self)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                      return 1;
                    v71 = VRTraceErrorLogLevelToCSTR();
                    v10 = *MEMORY[0x1E0CF2758];
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                      return 1;
                    v72 = -[VCAudioUnitProperties vpEnableSpatialChat](self->_currentAudioUnitProperties, "vpEnableSpatialChat");
                    v77 = 136316162;
                    v78 = v71;
                    v79 = 2080;
                    v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                    v81 = 1024;
                    v82 = 1486;
                    v83 = 1024;
                    *(_DWORD *)v84 = v72;
                    *(_WORD *)&v84[4] = 1024;
                    *(_DWORD *)&v84[6] = objc_msgSend(a3, "vpEnableSpatialChat");
                    v12 = " [%s] %s:%d VP spatial chat flag changed: %d->%d";
                    goto LABEL_97;
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v38 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
                  else
                    v38 = &stru_1E9E58EE0;
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                    return 1;
                  v75 = VRTraceErrorLogLevelToCSTR();
                  v18 = *MEMORY[0x1E0CF2758];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    return 1;
                  v76 = -[VCAudioUnitProperties vpEnableSpatialChat](self->_currentAudioUnitProperties, "vpEnableSpatialChat");
                  v77 = 136316674;
                  v78 = v75;
                  v79 = 2080;
                  v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                  v81 = 1024;
                  v82 = 1486;
                  v83 = 2112;
                  *(_QWORD *)v84 = v38;
                  *(_WORD *)&v84[8] = 2048;
                  v85 = self;
                  v86 = 1024;
                  v87 = v76;
                  v88 = 1024;
                  v89 = objc_msgSend(a3, "vpEnableSpatialChat");
                  v12 = " [%s] %s:%d %@(%p) VP spatial chat flag changed: %d->%d";
                }
                else
                {
                  if ((VCAudioManager *)objc_opt_class() == self)
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                      return 1;
                    v67 = VRTraceErrorLogLevelToCSTR();
                    v10 = *MEMORY[0x1E0CF2758];
                    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                      return 1;
                    v68 = -[VCAudioUnitProperties vpOperatingMode](self->_currentAudioUnitProperties, "vpOperatingMode");
                    v77 = 136316162;
                    v78 = v67;
                    v79 = 2080;
                    v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                    v81 = 1024;
                    v82 = 1482;
                    v83 = 1024;
                    *(_DWORD *)v84 = v68;
                    *(_WORD *)&v84[4] = 1024;
                    *(_DWORD *)&v84[6] = objc_msgSend(a3, "vpOperatingMode");
                    v12 = " [%s] %s:%d VP operating mode changed: %d->%d";
                    goto LABEL_97;
                  }
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                    v59 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
                  else
                    v59 = &stru_1E9E58EE0;
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                    return 1;
                  v69 = VRTraceErrorLogLevelToCSTR();
                  v18 = *MEMORY[0x1E0CF2758];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    return 1;
                  v70 = -[VCAudioUnitProperties vpOperatingMode](self->_currentAudioUnitProperties, "vpOperatingMode");
                  v77 = 136316674;
                  v78 = v69;
                  v79 = 2080;
                  v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                  v81 = 1024;
                  v82 = 1482;
                  v83 = 2112;
                  *(_QWORD *)v84 = v59;
                  *(_WORD *)&v84[8] = 2048;
                  v85 = self;
                  v86 = 1024;
                  v87 = v70;
                  v88 = 1024;
                  v89 = objc_msgSend(a3, "vpOperatingMode");
                  v12 = " [%s] %s:%d %@(%p) VP operating mode changed: %d->%d";
                }
              }
              else
              {
                if ((VCAudioManager *)objc_opt_class() == self)
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                    return 1;
                  v60 = VRTraceErrorLogLevelToCSTR();
                  v10 = *MEMORY[0x1E0CF2758];
                  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                    return 1;
                  v61 = (int)-[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker")[28];
                  v62 = *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 28);
                  v77 = 136316162;
                  v78 = v60;
                  v79 = 2080;
                  v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                  v81 = 1024;
                  v82 = 1478;
                  v83 = 1024;
                  *(_DWORD *)v84 = v61;
                  *(_WORD *)&v84[4] = 1024;
                  *(_DWORD *)&v84[6] = v62;
                  v12 = " [%s] %s:%d Speaker channels per frame changed: %d->%d";
                  goto LABEL_97;
                }
                if ((objc_opt_respondsToSelector() & 1) != 0)
                  v52 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
                else
                  v52 = &stru_1E9E58EE0;
                if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                  return 1;
                v63 = VRTraceErrorLogLevelToCSTR();
                v18 = *MEMORY[0x1E0CF2758];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  return 1;
                v64 = -[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker")[28];
                v65 = *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 28);
                v77 = 136316674;
                v78 = v63;
                v79 = 2080;
                v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                v81 = 1024;
                v82 = 1478;
                v83 = 2112;
                *(_QWORD *)v84 = v52;
                *(_WORD *)&v84[8] = 2048;
                v85 = self;
                v86 = 1024;
                v87 = v64;
                v88 = 1024;
                v89 = v65;
                v12 = " [%s] %s:%d %@(%p) Speaker channels per frame changed: %d->%d";
              }
            }
            else
            {
              if ((VCAudioManager *)objc_opt_class() == self)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                  return 1;
                v53 = VRTraceErrorLogLevelToCSTR();
                v10 = *MEMORY[0x1E0CF2758];
                if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  return 1;
                v54 = (int)-[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker")[40];
                v55 = *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 40);
                v77 = 136316162;
                v78 = v53;
                v79 = 2080;
                v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
                v81 = 1024;
                v82 = 1474;
                v83 = 1024;
                *(_DWORD *)v84 = v54;
                *(_WORD *)&v84[4] = 1024;
                *(_DWORD *)&v84[6] = v55;
                v12 = " [%s] %s:%d Speaker samples per frame changed: %d->%d";
                goto LABEL_97;
              }
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v51 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
              else
                v51 = &stru_1E9E58EE0;
              if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                return 1;
              v56 = VRTraceErrorLogLevelToCSTR();
              v18 = *MEMORY[0x1E0CF2758];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                return 1;
              v57 = -[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker")[40];
              v58 = *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 40);
              v77 = 136316674;
              v78 = v56;
              v79 = 2080;
              v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
              v81 = 1024;
              v82 = 1474;
              v83 = 2112;
              *(_QWORD *)v84 = v51;
              *(_WORD *)&v84[8] = 2048;
              v85 = self;
              v86 = 1024;
              v87 = v57;
              v88 = 1024;
              v89 = v58;
              v12 = " [%s] %s:%d %@(%p) Speaker samples per frame changed: %d->%d";
            }
          }
          else
          {
            if ((VCAudioManager *)objc_opt_class() == self)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() < 7)
                return 1;
              v45 = VRTraceErrorLogLevelToCSTR();
              v10 = *MEMORY[0x1E0CF2758];
              if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                return 1;
              v46 = (int)*(double *)-[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker");
              v47 = (int)*(double *)objc_msgSend(a3, "frameFormatSpeaker");
              v77 = 136316162;
              v78 = v45;
              v79 = 2080;
              v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
              v81 = 1024;
              v82 = 1470;
              v83 = 1024;
              *(_DWORD *)v84 = v46;
              *(_WORD *)&v84[4] = 1024;
              *(_DWORD *)&v84[6] = v47;
              v12 = " [%s] %s:%d Speaker sample rate changed: %d->%d";
              goto LABEL_97;
            }
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v16 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v16 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 7)
              return 1;
            v48 = VRTraceErrorLogLevelToCSTR();
            v18 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              return 1;
            v49 = (int)*(double *)-[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker");
            v50 = (int)*(double *)objc_msgSend(a3, "frameFormatSpeaker");
            v77 = 136316674;
            v78 = v48;
            v79 = 2080;
            v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
            v81 = 1024;
            v82 = 1470;
            v83 = 2112;
            *(_QWORD *)v84 = v16;
            *(_WORD *)&v84[8] = 2048;
            v85 = self;
            v86 = 1024;
            v87 = v49;
            v88 = 1024;
            v89 = v50;
            v12 = " [%s] %s:%d %@(%p) Speaker sample rate changed: %d->%d";
          }
        }
        else
        {
          if ((VCAudioManager *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 7)
              return 1;
            v39 = VRTraceErrorLogLevelToCSTR();
            v10 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              return 1;
            v40 = (int)-[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic")[28];
            v41 = *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 28);
            v77 = 136316162;
            v78 = v39;
            v79 = 2080;
            v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
            v81 = 1024;
            v82 = 1466;
            v83 = 1024;
            *(_DWORD *)v84 = v40;
            *(_WORD *)&v84[4] = 1024;
            *(_DWORD *)&v84[6] = v41;
            v12 = " [%s] %s:%d Mic channels per frame changed: %d->%d";
            goto LABEL_97;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v27 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v27 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return 1;
          v42 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return 1;
          v43 = -[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic")[28];
          v44 = *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 28);
          v77 = 136316674;
          v78 = v42;
          v79 = 2080;
          v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
          v81 = 1024;
          v82 = 1466;
          v83 = 2112;
          *(_QWORD *)v84 = v27;
          *(_WORD *)&v84[8] = 2048;
          v85 = self;
          v86 = 1024;
          v87 = v43;
          v88 = 1024;
          v89 = v44;
          v12 = " [%s] %s:%d %@(%p) Mic channels per frame changed: %d->%d";
        }
      }
      else
      {
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            return 1;
          v28 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            return 1;
          v29 = (int)-[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic")[40];
          v30 = *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 40);
          v77 = 136316162;
          v78 = v28;
          v79 = 2080;
          v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
          v81 = 1024;
          v82 = 1462;
          v83 = 1024;
          *(_DWORD *)v84 = v29;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = v30;
          v12 = " [%s] %s:%d Mic samples per frame changed: %d->%d";
          goto LABEL_97;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v26 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v26 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return 1;
        v31 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return 1;
        v32 = -[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic")[40];
        v33 = *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 40);
        v77 = 136316674;
        v78 = v31;
        v79 = 2080;
        v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
        v81 = 1024;
        v82 = 1462;
        v83 = 2112;
        *(_QWORD *)v84 = v26;
        *(_WORD *)&v84[8] = 2048;
        v85 = self;
        v86 = 1024;
        v87 = v32;
        v88 = 1024;
        v89 = v33;
        v12 = " [%s] %s:%d %@(%p) Mic samples per frame changed: %d->%d";
      }
    }
    else
    {
      if ((VCAudioManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return 1;
        v20 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return 1;
        v21 = (int)*(double *)-[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic");
        v22 = (int)*(double *)objc_msgSend(a3, "frameFormatMic");
        v77 = 136316162;
        v78 = v20;
        v79 = 2080;
        v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
        v81 = 1024;
        v82 = 1458;
        v83 = 1024;
        *(_DWORD *)v84 = v21;
        *(_WORD *)&v84[4] = 1024;
        *(_DWORD *)&v84[6] = v22;
        v12 = " [%s] %s:%d Mic sample rate changed: %d->%d";
        goto LABEL_97;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 1;
      v23 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 1;
      v24 = (int)*(double *)-[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic");
      v25 = (int)*(double *)objc_msgSend(a3, "frameFormatMic");
      v77 = 136316674;
      v78 = v23;
      v79 = 2080;
      v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
      v81 = 1024;
      v82 = 1458;
      v83 = 2112;
      *(_QWORD *)v84 = v8;
      *(_WORD *)&v84[8] = 2048;
      v85 = self;
      v86 = 1024;
      v87 = v24;
      v88 = 1024;
      v89 = v25;
      v12 = " [%s] %s:%d %@(%p) Mic sample rate changed: %d->%d";
    }
LABEL_102:
    v73 = v18;
    v74 = 60;
    goto LABEL_103;
  }
  if ((VCAudioManager *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 1;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 1;
    v19 = -[VCAudioUnitProperties allowAudioRecording](self->_currentAudioUnitProperties, "allowAudioRecording");
    v77 = 136316674;
    v78 = v17;
    v79 = 2080;
    v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
    v81 = 1024;
    v82 = 1454;
    v83 = 2112;
    *(_QWORD *)v84 = v6;
    *(_WORD *)&v84[8] = 2048;
    v85 = self;
    v86 = 1024;
    v87 = v19;
    v88 = 1024;
    v89 = objc_msgSend(a3, "allowAudioRecording");
    v12 = " [%s] %s:%d %@(%p) Recording changed: %d->%d";
    goto LABEL_102;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    return 1;
  v9 = VRTraceErrorLogLevelToCSTR();
  v10 = *MEMORY[0x1E0CF2758];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    return 1;
  v11 = -[VCAudioUnitProperties allowAudioRecording](self->_currentAudioUnitProperties, "allowAudioRecording");
  v77 = 136316162;
  v78 = v9;
  v79 = 2080;
  v80 = "-[VCAudioManager shouldResetAudioUnitWithProperties:]";
  v81 = 1024;
  v82 = 1454;
  v83 = 1024;
  *(_DWORD *)v84 = v11;
  *(_WORD *)&v84[4] = 1024;
  *(_DWORD *)&v84[6] = objc_msgSend(a3, "allowAudioRecording");
  v12 = " [%s] %s:%d Recording changed: %d->%d";
LABEL_97:
  v73 = v10;
  v74 = 40;
LABEL_103:
  _os_log_impl(&dword_1D8A54000, v73, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v77, v74);
  return 1;
}

- (BOOL)shouldResetAudioSessionWithProperties:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  _BOOL4 v25;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  unsigned int v35;
  _BYTE v37[24];
  __int128 v38;
  VCAudioManager *v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = -[VCAudioSessionMediaProperties description](self->_currentAudioSessionMediaProperties, "description");
        *(_DWORD *)v37 = 136315906;
        *(_QWORD *)&v37[4] = v6;
        *(_WORD *)&v37[12] = 2080;
        *(_QWORD *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 1494;
        WORD2(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 6) = v8;
        v9 = " [%s] %s:%d Current settings: %@";
        v10 = v7;
        v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v37, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[VCAudioSessionMediaProperties description](self->_currentAudioSessionMediaProperties, "description");
        *(_DWORD *)v37 = 136316418;
        *(_QWORD *)&v37[4] = v12;
        *(_WORD *)&v37[12] = 2080;
        *(_QWORD *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 1494;
        WORD2(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 6) = v5;
        HIWORD(v38) = 2048;
        v39 = self;
        LOWORD(v40) = 2112;
        *(_QWORD *)((char *)&v40 + 2) = v14;
        v9 = " [%s] %s:%d %@(%p) Current settings: %@";
        v10 = v13;
        v11 = 58;
        goto LABEL_11;
      }
    }
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(a3, "description");
        *(_DWORD *)v37 = 136315906;
        *(_QWORD *)&v37[4] = v16;
        *(_WORD *)&v37[12] = 2080;
        *(_QWORD *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 1495;
        WORD2(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 6) = v18;
        v19 = " [%s] %s:%d New settings: %@";
        v20 = v17;
        v21 = 38;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, v37, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(a3, "description");
        *(_DWORD *)v37 = 136316418;
        *(_QWORD *)&v37[4] = v22;
        *(_WORD *)&v37[12] = 2080;
        *(_QWORD *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
        *(_WORD *)&v37[22] = 1024;
        LODWORD(v38) = 1495;
        WORD2(v38) = 2112;
        *(_QWORD *)((char *)&v38 + 6) = v15;
        HIWORD(v38) = 2048;
        v39 = self;
        LOWORD(v40) = 2112;
        *(_QWORD *)((char *)&v40 + 2) = v24;
        v19 = " [%s] %s:%d %@(%p) New settings: %@";
        v20 = v23;
        v21 = 58;
        goto LABEL_22;
      }
    }
  }
  v25 = -[VCAudioSessionMediaProperties isSessionActive](self->_currentAudioSessionMediaProperties, "isSessionActive", *(_OWORD *)v37, *(_QWORD *)&v37[16], v38, v39, v40);
  if (v25)
  {
    if (-[VCAudioSessionMediaProperties isEqual:](self->_currentAudioSessionMediaProperties, "isEqual:", a3))
    {
      LOBYTE(v25) = -[VCAudioSession shouldResetAudioSession](self->_audioSession, "shouldResetAudioSession");
      return v25;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_37;
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      v29 = -[VCAudioUnitProperties audioSessionId](self->_currentAudioUnitProperties, "audioSessionId");
      *(_DWORD *)v37 = 136315906;
      *(_QWORD *)&v37[4] = v27;
      *(_WORD *)&v37[12] = 2080;
      *(_QWORD *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 1501;
      WORD2(v38) = 1024;
      *(_DWORD *)((char *)&v38 + 6) = v29;
      v30 = " [%s] %s:%d [CMSession]:%u Session properties changed!";
      v31 = v28;
      v32 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v26 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v26 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_37;
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      v35 = -[VCAudioUnitProperties audioSessionId](self->_currentAudioUnitProperties, "audioSessionId");
      *(_DWORD *)v37 = 136316418;
      *(_QWORD *)&v37[4] = v33;
      *(_WORD *)&v37[12] = 2080;
      *(_QWORD *)&v37[14] = "-[VCAudioManager shouldResetAudioSessionWithProperties:]";
      *(_WORD *)&v37[22] = 1024;
      LODWORD(v38) = 1501;
      WORD2(v38) = 2112;
      *(_QWORD *)((char *)&v38 + 6) = v26;
      HIWORD(v38) = 2048;
      v39 = self;
      LOWORD(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 2) = v35;
      v30 = " [%s] %s:%d %@(%p) [CMSession]:%u Session properties changed!";
      v31 = v34;
      v32 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, v37, v32);
LABEL_37:
    LOBYTE(v25) = 1;
  }
  return v25;
}

- (BOOL)resetAUIOWithProperties:(id)a3
{
  __int128 v5;
  tagHANDLE *hAUIO;
  uint64_t v7;
  __int128 *v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  double v13;
  int v14;
  int v15;
  int IsReady;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v27 = -1431655766;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25 = v5;
  v26 = v5;
  v23 = v5;
  v24 = v5;
  v21 = v5;
  v22 = v5;
  v19 = v5;
  v20 = v5;
  if (a3)
  {
    objc_msgSend(a3, "farEndVersionInfo");
  }
  else
  {
    v27 = 0;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
  }
  hAUIO = self->_hAUIO;
  v7 = objc_msgSend(a3, "frameFormatMic");
  v8 = (__int128 *)objc_msgSend(a3, "frameFormatSpeaker");
  v9 = objc_msgSend(a3, "allowAudioRecording");
  v10 = objc_msgSend(a3, "vpOperatingMode");
  v11 = objc_msgSend(a3, "vpEnableSpatialChat");
  v12 = objc_msgSend(a3, "remoteCodecType");
  objc_msgSend(a3, "remoteCodecSampleRate");
  v14 = AUIOSetupFormats(v13, (uint64_t)hAUIO, v7, v8, (uint64_t)&v19, v9, v10, v11, v12);
  if (v14 < 0 && (v15 = v14, v14 != -2145714174))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager resetAUIOWithProperties:].cold.1();
    }
  }
  else
  {
    IsReady = AUIOReceiverIsReady();
    v15 = IsReady;
    if (IsReady < 0 && IsReady != -2145714174 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager resetAUIOWithProperties:].cold.2();
    }
  }
  return v15 >= 0 || v15 == -2145714174;
}

- (BOOL)resetAudioLimiterWithProperties:(id)a3
{
  int v5;
  opaqueVCAudioLimiter *audioLimiter;
  opaqueVCAudioLimiter **p_audioLimiter;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  opaqueVCAudioLimiter *v19;
  _BYTE v20[24];
  __int128 v21;
  VCAudioManager *v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (int)-[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker")[40];
  if (v5 != *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 40))
  {
    p_audioLimiter = &self->_sourceData.audioLimiter;
    audioLimiter = self->_sourceData.audioLimiter;
    if (audioLimiter)
    {
      VCAudioLimiter_Stop((uint64_t)audioLimiter);
      VCAudioDucker_Destroy((void **)&self->_sourceData.audioLimiter);
    }
    if (!self->_isGKVoiceChat && !self->_playbackMode)
    {
      if ((VCAudioManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_19;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        v12 = *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 40);
        *(_DWORD *)v20 = 136315906;
        *(_QWORD *)&v20[4] = v10;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager resetAudioLimiterWithProperties:]";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 1533;
        WORD2(v21) = 1024;
        *(_DWORD *)((char *)&v21 + 6) = v12;
        v13 = " [%s] %s:%d reset audio limiter: %d";
        v14 = v11;
        v15 = 34;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v9 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v9 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_19;
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_19;
        v18 = *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 40);
        *(_DWORD *)v20 = 136316418;
        *(_QWORD *)&v20[4] = v16;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager resetAudioLimiterWithProperties:]";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 1533;
        WORD2(v21) = 2112;
        *(_QWORD *)((char *)&v21 + 6) = v9;
        HIWORD(v21) = 2048;
        v22 = self;
        LOWORD(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 2) = v18;
        v13 = " [%s] %s:%d %@(%p) reset audio limiter: %d";
        v14 = v17;
        v15 = 54;
      }
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, v20, v15);
LABEL_19:
      v19 = (opaqueVCAudioLimiter *)VCAudioLimiter_Allocate((__int128 *)objc_msgSend(a3, "frameFormatMic", *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, v22, v23));
      *p_audioLimiter = v19;
      return VCAudioLimiter_Start((uint64_t)v19);
    }
  }
  return 1;
}

- (void)stopAUIO
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AUIO doesn't exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (BOOL)audioCallbacksRunning
{
  unsigned int state;

  state = self->_state;
  return state == 3 && !self->_isInterrupting || state == 4;
}

- (void)registerClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int state;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  _QWORD *v17;
  dispatch_time_t v18;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  _VCAudioIOControllerClientIO *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _VCAudioIOControllerClientIO *v42;
  __int16 v43;
  _VCAudioIOControllerIOState *v44;
  __int16 v45;
  unsigned int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        state = self->_state;
        *(_DWORD *)buf = 136316418;
        v32 = v8;
        v33 = 2080;
        v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
        v35 = 1024;
        v36 = 1564;
        v37 = 2048;
        v38 = a3;
        v39 = 2048;
        v40 = a4;
        v41 = 1024;
        LODWORD(v42) = state;
        v11 = " [%s] %s:%d Registering clientIO[%p] controllerIO[%p] in current manager state=%d";
        v12 = v9;
        v13 = 54;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_state;
        *(_DWORD *)buf = 136316930;
        v32 = v14;
        v33 = 2080;
        v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
        v35 = 1024;
        v36 = 1564;
        v37 = 2112;
        v38 = (_VCAudioIOControllerClientIO *)v7;
        v39 = 2048;
        v40 = self;
        v41 = 2048;
        v42 = a3;
        v43 = 2048;
        v44 = a4;
        v45 = 1024;
        v46 = v16;
        v11 = " [%s] %s:%d %@(%p) Registering clientIO[%p] controllerIO[%p] in current manager state=%d";
        v12 = v15;
        v13 = 74;
        goto LABEL_11;
      }
    }
  }
  v17 = VCAudioManager_NewAudioEvent(0, (uint64_t)a3);
  v30 = v17;
  v18 = dispatch_time(0, 1000000000);
  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v17[1] + 16), v18))
    goto LABEL_24;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v32 = v20;
        v33 = 2080;
        v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
        v35 = 1024;
        v36 = 1571;
        v37 = 2048;
        v38 = a3;
        v22 = " [%s] %s:%d Wait on run lock semaphore timed out! clientIO=%p";
        v23 = v21;
        v24 = 38;
LABEL_23:
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v32 = v25;
        v33 = 2080;
        v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
        v35 = 1024;
        v36 = 1571;
        v37 = 2112;
        v38 = (_VCAudioIOControllerClientIO *)v19;
        v39 = 2048;
        v40 = self;
        v41 = 2048;
        v42 = a3;
        v22 = " [%s] %s:%d %@(%p) Wait on run lock semaphore timed out! clientIO=%p";
        v23 = v26;
        v24 = 58;
        goto LABEL_23;
      }
    }
  }
LABEL_24:
  pthread_mutex_lock(&self->_interruptingMutex);
  if (-[VCAudioManager audioCallbacksRunning](self, "audioCallbacksRunning"))
  {
    if (CMSimpleQueueEnqueue(a4->eventQueue, v17))
    {
      if ((VCAudioManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioManager registerClientIO:controllerIO:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v27 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v27 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v28 = VRTraceErrorLogLevelToCSTR();
          v29 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v32 = v28;
            v33 = 2080;
            v34 = "-[VCAudioManager registerClientIO:controllerIO:]";
            v35 = 1024;
            v36 = 1577;
            v37 = 2112;
            v38 = (_VCAudioIOControllerClientIO *)v27;
            v39 = 2048;
            v40 = self;
            _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
          }
        }
      }
      VCAudioManager_ReleaseAudioEvent((uint64_t *)&v30, 1);
    }
  }
  else
  {
    _VCAudioManager_RegisterClientIO((uint64_t)a4, v17);
  }
  pthread_mutex_unlock(&self->_interruptingMutex);
}

- (void)unregisterClientIO:(_VCAudioIOControllerClientIO *)a3 controllerIO:(_VCAudioIOControllerIOState *)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int state;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  _DWORD *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  _DWORD *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _VCAudioIOControllerClientIO *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  _VCAudioIOControllerClientIO *v33;
  __int16 v34;
  _VCAudioIOControllerIOState *v35;
  __int16 v36;
  unsigned int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        state = self->_state;
        *(_DWORD *)buf = 136316418;
        v23 = v8;
        v24 = 2080;
        v25 = "-[VCAudioManager unregisterClientIO:controllerIO:]";
        v26 = 1024;
        v27 = 1588;
        v28 = 2048;
        v29 = a3;
        v30 = 2048;
        v31 = a4;
        v32 = 1024;
        LODWORD(v33) = state;
        v11 = " [%s] %s:%d Unregistering clientIO[%p] controllerIO[%p] in current manager state=%d";
        v12 = v9;
        v13 = 54;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = self->_state;
        *(_DWORD *)buf = 136316930;
        v23 = v14;
        v24 = 2080;
        v25 = "-[VCAudioManager unregisterClientIO:controllerIO:]";
        v26 = 1024;
        v27 = 1588;
        v28 = 2112;
        v29 = (_VCAudioIOControllerClientIO *)v7;
        v30 = 2048;
        v31 = self;
        v32 = 2048;
        v33 = a3;
        v34 = 2048;
        v35 = a4;
        v36 = 1024;
        v37 = v16;
        v11 = " [%s] %s:%d %@(%p) Unregistering clientIO[%p] controllerIO[%p] in current manager state=%d";
        v12 = v15;
        v13 = 74;
        goto LABEL_11;
      }
    }
  }
  v17 = VCAudioManager_NewAudioEvent(1, (uint64_t)a3);
  v21 = v17;
  pthread_mutex_lock(&self->_interruptingMutex);
  if (-[VCAudioManager audioCallbacksRunning](self, "audioCallbacksRunning"))
  {
    if (CMSimpleQueueEnqueue(a4->eventQueue, v17))
    {
      if ((VCAudioManager *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioManager unregisterClientIO:controllerIO:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v18 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v18 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v23 = v19;
            v24 = 2080;
            v25 = "-[VCAudioManager unregisterClientIO:controllerIO:]";
            v26 = 1024;
            v27 = 1595;
            v28 = 2112;
            v29 = (_VCAudioIOControllerClientIO *)v18;
            v30 = 2048;
            v31 = self;
            _os_log_error_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
          }
        }
      }
      VCAudioManager_ReleaseAudioEvent((uint64_t *)&v21, 0);
    }
  }
  else
  {
    _VCAudioManager_UnregisterClientIO((uint64_t)a4, (uint64_t)v17);
  }
  pthread_mutex_unlock(&self->_interruptingMutex);
}

- (void)completeStartForAllStartingClients
{
  NSMutableArray *startingIOClients;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCAudioManager *v26;
  __int16 v27;
  __CFString *v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  startingIOClients = self->_startingIOClients;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](startingIOClients, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(startingIOClients);
        v8 = *(__CFString **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((VCAudioManager *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v18 = v15;
              v19 = 2080;
              v20 = "-[VCAudioManager completeStartForAllStartingClients]";
              v21 = 1024;
              v22 = 1607;
              v23 = 2048;
              v24 = v8;
              v12 = v16;
              v13 = " [%s] %s:%d controller did start client (audioIO=%p)";
              v14 = 38;
              goto LABEL_15;
            }
          }
        }
        else
        {
          v9 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v9 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316418;
              v18 = v10;
              v19 = 2080;
              v20 = "-[VCAudioManager completeStartForAllStartingClients]";
              v21 = 1024;
              v22 = 1607;
              v23 = 2112;
              v24 = v9;
              v25 = 2048;
              v26 = self;
              v27 = 2048;
              v28 = v8;
              v12 = v11;
              v13 = " [%s] %s:%d %@(%p) controller did start client (audioIO=%p)";
              v14 = 58;
LABEL_15:
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
            }
          }
        }
        objc_msgSend((id)-[__CFString delegate](v8, "delegate"), "didStart:error:", 1, 0);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](startingIOClients, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    }
    while (v5);
  }
  -[NSMutableArray removeAllObjects](self->_startingIOClients, "removeAllObjects");
}

- (void)activateStartingClient:(id)a3 applyControllerFormat:(BOOL)a4
{
  _BOOL4 v4;
  int playbackMode;
  void *v8;
  VCAudioUnitProperties *currentAudioUnitProperties;
  uint64_t v10;

  if (a3)
  {
    v4 = a4;
    if ((-[NSMutableArray containsObject:](self->_startingIOClients, "containsObject:") & 1) == 0)
    {
      if (v4)
      {
        playbackMode = self->_playbackMode;
        v8 = (void *)objc_msgSend(a3, "delegate");
        currentAudioUnitProperties = self->_currentAudioUnitProperties;
        if (playbackMode == 1)
          v10 = -[VCAudioUnitProperties frameFormatSpeaker](currentAudioUnitProperties, "frameFormatSpeaker");
        else
          v10 = -[VCAudioUnitProperties frameFormatMic](currentAudioUnitProperties, "frameFormatMic");
        objc_msgSend(v8, "controllerFormatChanged:", v10);
      }
      if ((objc_msgSend(a3, "direction") & 1) != 0)
        -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", objc_msgSend(a3, "sourceIO"), &self->_sourceData);
      if ((objc_msgSend(a3, "direction") & 2) != 0)
        -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", objc_msgSend(a3, "sinkIO"), &self->_sinkData);
      -[NSMutableArray addObject:](self->_startingIOClients, "addObject:", a3);
    }
  }
}

- (void)applyControllerFormatToClients:(id)a3
{
  NSMutableArray *allClients;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[3];
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  allClients = self->_allClients;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(allClients);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((-[VCAudioUnitProperties audioUnitType](self->_currentAudioUnitProperties, "audioUnitType") != 2
           || objc_msgSend(v10, "deviceRole") == 2)
          && (-[VCAudioUnitProperties audioUnitType](self->_currentAudioUnitProperties, "audioUnitType") != 1
           || objc_msgSend(v10, "deviceRole") != 2))
        {
          v14[0] = xmmword_1D9108CD0;
          memset(&v14[1], 170, 32);
          if (self->_playbackMode == 1)
            v11 = (__int128 *)objc_msgSend(a3, "frameFormatSpeaker", v14[0], v14[1], v14[2]);
          else
            v11 = (__int128 *)objc_msgSend(a3, "frameFormatMic", v14[0], v14[1], v14[2]);
          v12 = *v11;
          v13 = v11[2];
          v14[1] = v11[1];
          HIDWORD(v14[1]) = *(_DWORD *)(objc_msgSend(v10, "clientFormat", v12, v14[1], v13) + 28);
          objc_msgSend((id)objc_msgSend(v10, "delegate"), "controllerFormatChanged:", v14);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v7);
  }
}

- (int)registerForMutedTalkerNotificationWithAUIO:(tagHANDLE *)a3
{
  int v5;
  const __CFString *v6;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCAudioManager *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 == (tagHANDLE *)0xFFFFFFFFLL
    || -[VCAudioUnitProperties audioUnitType](self->_currentAudioUnitProperties, "audioUnitType") != 1
    || !self->_mutedTalkerNotificationHandler)
  {
    return 0;
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__VCAudioManager_registerForMutedTalkerNotificationWithAUIO___block_invoke;
  v15[3] = &unk_1E9E52260;
  v15[4] = self;
  v5 = AUIORegisterMutedTalkerNotificationEventListener((uint64_t)a3, (uint64_t)v15);
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v17 = v8;
        v18 = 2080;
        v19 = "-[VCAudioManager registerForMutedTalkerNotificationWithAUIO:]";
        v20 = 1024;
        v21 = 1675;
        v22 = 1024;
        LODWORD(v23) = v5;
        v10 = " [%s] %s:%d Registered for mutedTalker notification. result=0x%08x";
        v11 = v9;
        v12 = 34;
LABEL_16:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v17 = v13;
        v18 = 2080;
        v19 = "-[VCAudioManager registerForMutedTalkerNotificationWithAUIO:]";
        v20 = 1024;
        v21 = 1675;
        v22 = 2112;
        v23 = v6;
        v24 = 2048;
        v25 = self;
        v26 = 1024;
        v27 = v5;
        v10 = " [%s] %s:%d %@(%p) Registered for mutedTalker notification. result=0x%08x";
        v11 = v14;
        v12 = 54;
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t __61__VCAudioManager_registerForMutedTalkerNotificationWithAUIO___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a2 <= 1)
  {
    v3 = result;
    if (objc_opt_class() == *(_QWORD *)(result + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936) + 16))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936) + 16))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
      v19 = 136315906;
      v20 = v11;
      v21 = 2080;
      v22 = "-[VCAudioManager registerForMutedTalkerNotificationWithAUIO:]_block_invoke";
      v23 = 1024;
      v24 = 1672;
      v25 = 1024;
      LODWORD(v26) = a2;
      v13 = " [%s] %s:%d Handle mutedTalkerNotification type=%d";
      v14 = v12;
      v15 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend(*(id *)(v3 + 32), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936) + 16))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936) + 16))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
      v18 = *(_QWORD *)(v3 + 32);
      v19 = 136316418;
      v20 = v16;
      v21 = 2080;
      v22 = "-[VCAudioManager registerForMutedTalkerNotificationWithAUIO:]_block_invoke";
      v23 = 1024;
      v24 = 1672;
      v25 = 2112;
      v26 = v4;
      v27 = 2048;
      v28 = v18;
      v29 = 1024;
      v30 = a2;
      v13 = " [%s] %s:%d %@(%p) Handle mutedTalkerNotification type=%d";
      v14 = v17;
      v15 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936) + 16))(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 936), a2, v5, v6, v7, v8, v9, v10);
  }
  return result;
}

- (int)unregisterForMutedTalkerNotificationWithAUIO:(tagHANDLE *)a3
{
  int v5;
  const __CFString *v6;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCAudioManager *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 == (tagHANDLE *)0xFFFFFFFFLL
    || -[VCAudioUnitProperties audioUnitType](self->_currentAudioUnitProperties, "audioUnitType") != 1
    || !self->_mutedTalkerNotificationHandler)
  {
    return 0;
  }
  v5 = AUIORegisterMutedTalkerNotificationEventListener((uint64_t)a3, 0);
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136315906;
        v16 = v8;
        v17 = 2080;
        v18 = "-[VCAudioManager unregisterForMutedTalkerNotificationWithAUIO:]";
        v19 = 1024;
        v20 = 1687;
        v21 = 1024;
        LODWORD(v22) = v5;
        v10 = " [%s] %s:%d Unregistered from muted talker notification. result=0x%08x";
        v11 = v9;
        v12 = 34;
LABEL_16:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 136316418;
        v16 = v13;
        v17 = 2080;
        v18 = "-[VCAudioManager unregisterForMutedTalkerNotificationWithAUIO:]";
        v19 = 1024;
        v20 = 1687;
        v21 = 2112;
        v22 = v6;
        v23 = 2048;
        v24 = self;
        v25 = 1024;
        v26 = v5;
        v10 = " [%s] %s:%d %@(%p) Unregistered from muted talker notification. result=0x%08x";
        v11 = v14;
        v12 = 54;
        goto LABEL_16;
      }
    }
  }
  return v5;
}

- (int)registerForMutedTalkerNotification:(id)a3
{
  NSObject *dispatchQueue;
  int v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD block[7];
  _BYTE buf[24];
  int v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  VCAudioManager *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v12 = 0;
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__VCAudioManager_registerForMutedTalkerNotification___block_invoke;
    block[3] = &unk_1E9E52288;
    block[5] = a3;
    block[6] = buf;
    block[4] = self;
    dispatch_sync(dispatchQueue, block);
    v5 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v5 = -2144534527;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager registerForMutedTalkerNotification:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCAudioManager registerForMutedTalkerNotification:]";
          *(_WORD *)&buf[22] = 1024;
          v12 = 1694;
          v13 = 2112;
          v14 = v7;
          v15 = 2048;
          v16 = self;
          _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Muted talker notification handler is nil", buf, 0x30u);
        }
      }
    }
  }
  return v5;
}

void __53__VCAudioManager_registerForMutedTalkerNotification___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 936))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -2144534487;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __53__VCAudioManager_registerForMutedTalkerNotification___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v5 = *(_QWORD *)(a1 + 32);
          v6 = 136316162;
          v7 = v3;
          v8 = 2080;
          v9 = "-[VCAudioManager registerForMutedTalkerNotification:]_block_invoke";
          v10 = 1024;
          v11 = 1701;
          v12 = 2112;
          v13 = v2;
          v14 = 2048;
          v15 = v5;
          _os_log_error_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Muted talker notification handler already registered", (uint8_t *)&v6, 0x30u);
        }
      }
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 936) = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "registerForMutedTalkerNotificationWithAUIO:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168));
  }
}

- (int)unregisterFromMutedTalkerNotification
{
  NSObject *dispatchQueue;
  int v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VCAudioManager_unregisterFromMutedTalkerNotification__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(dispatchQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __55__VCAudioManager_unregisterFromMutedTalkerNotification__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[117])
  {
    objc_msgSend(v2, "unregisterForMutedTalkerNotificationWithAUIO:", v2[21]);
    _Block_release(*(const void **)(*(_QWORD *)(a1 + 32) + 936));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 936) = 0;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -2144534507;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __55__VCAudioManager_unregisterFromMutedTalkerNotification__block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v6 = *(_QWORD *)(a1 + 32);
          v7 = 136316162;
          v8 = v4;
          v9 = 2080;
          v10 = "-[VCAudioManager unregisterFromMutedTalkerNotification]_block_invoke";
          v11 = 1024;
          v12 = 1715;
          v13 = 2112;
          v14 = v3;
          v15 = 2048;
          v16 = v6;
          _os_log_error_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Muted talker notification handler not registered", (uint8_t *)&v7, 0x30u);
        }
      }
    }
  }
}

- (int)registerAudioSessionId:(unsigned int)a3 maxChannelCountMic:(unsigned int)a4 maxChannelCountSpeaker:(unsigned int)a5 spatialMetadata:(OpaqueCMBlockBuffer *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  VCAudioUnitSpatialContext *v19;
  NSObject *dispatchQueue;
  int v21;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  _QWORD block[6];
  int v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  VCAudioManager *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  v40 = *MEMORY[0x1E0C80C00];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v29 = v12;
        v30 = 2080;
        v31 = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]";
        v32 = 1024;
        v33 = 1734;
        v34 = 1024;
        LODWORD(v35) = v9;
        v14 = " [%s] %s:%d Register session context for audioSessionId=%u";
        v15 = v13;
        v16 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v29 = v17;
        v30 = 2080;
        v31 = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]";
        v32 = 1024;
        v33 = 1734;
        v34 = 2112;
        v35 = v11;
        v36 = 2048;
        v37 = self;
        v38 = 1024;
        v39 = v9;
        v14 = " [%s] %s:%d %@(%p) Register session context for audioSessionId=%u";
        v15 = v18;
        v16 = 54;
        goto LABEL_11;
      }
    }
  }
  v19 = -[VCAudioUnitSpatialContext initWithAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]([VCAudioUnitSpatialContext alloc], "initWithAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:", v9, v8, v7, a6);
  if (v19)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__VCAudioManager_registerAudioSessionId_maxChannelCountMic_maxChannelCountSpeaker_spatialMetadata___block_invoke;
    block[3] = &unk_1E9E522D8;
    v27 = v9;
    block[4] = self;
    block[5] = v19;
    dispatch_async(dispatchQueue, block);
    v21 = 0;
  }
  else
  {
    v21 = -2144534525;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v23 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          v29 = v24;
          v30 = 2080;
          v31 = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]";
          v32 = 1024;
          v33 = 1740;
          v34 = 2112;
          v35 = v23;
          v36 = 2048;
          v37 = self;
          v38 = 1024;
          v39 = v9;
          _os_log_error_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate audio session context for audioSessionId=%u", buf, 0x36u);
        }
      }
    }
  }

  return v21;
}

void __99__VCAudioManager_registerAudioSessionId_maxChannelCountMic_maxChannelCountSpeaker_spatialMetadata___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48))))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __99__VCAudioManager_registerAudioSessionId_maxChannelCountMic_maxChannelCountSpeaker_spatialMetadata___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v2 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v5 = *(_QWORD *)(a1 + 32);
          v6 = *(_DWORD *)(a1 + 48);
          v7 = 136316418;
          v8 = v3;
          v9 = 2080;
          v10 = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]_block_invoke";
          v11 = 1024;
          v12 = 1746;
          v13 = 2112;
          v14 = v2;
          v15 = 2048;
          v16 = v5;
          v17 = 1024;
          v18 = v6;
          _os_log_error_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Session context for audioSessionId=%u is already registered", (uint8_t *)&v7, 0x36u);
        }
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  }
}

- (void)unregisterAudioSessionId:(unsigned int)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *dispatchQueue;
  _QWORD v14[5];
  unsigned int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCAudioManager *v25;
  __int16 v26;
  unsigned int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v17 = v6;
        v18 = 2080;
        v19 = "-[VCAudioManager unregisterAudioSessionId:]";
        v20 = 1024;
        v21 = 1755;
        v22 = 1024;
        LODWORD(v23) = a3;
        v8 = " [%s] %s:%d Unregister session context for audioSessionId=%u";
        v9 = v7;
        v10 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v17 = v11;
        v18 = 2080;
        v19 = "-[VCAudioManager unregisterAudioSessionId:]";
        v20 = 1024;
        v21 = 1755;
        v22 = 2112;
        v23 = v5;
        v24 = 2048;
        v25 = self;
        v26 = 1024;
        v27 = a3;
        v8 = " [%s] %s:%d %@(%p) Unregister session context for audioSessionId=%u";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__VCAudioManager_unregisterAudioSessionId___block_invoke;
  v14[3] = &unk_1E9E52300;
  v14[4] = self;
  v15 = a3;
  dispatch_async(dispatchQueue, v14);
}

void __43__VCAudioManager_unregisterAudioSessionId___block_invoke(uint64_t a1)
{
  unsigned int *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)(a1 + 40);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40))))
  {
    objc_msgSend(*(id *)(*((_QWORD *)v2 - 1) + 912), "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *v2));
  }
  else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __43__VCAudioManager_unregisterAudioSessionId___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = *(_DWORD *)(a1 + 40);
        v8 = 136316418;
        v9 = v4;
        v10 = 2080;
        v11 = "-[VCAudioManager unregisterAudioSessionId:]_block_invoke";
        v12 = 1024;
        v13 = 1761;
        v14 = 2112;
        v15 = v3;
        v16 = 2048;
        v17 = v6;
        v18 = 1024;
        v19 = v7;
        _os_log_error_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Session context for audioSessionId=%u is not registered", (uint8_t *)&v8, 0x36u);
      }
    }
  }
}

- (void)setSpatialMetadata:(OpaqueCMBlockBuffer *)a3 audioSessionId:(unsigned int)a4 completionHandler:(id)a5
{
  NSObject *dispatchQueue;
  _QWORD block[7];
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
    CFRetain(a3);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VCAudioManager_setSpatialMetadata_audioSessionId_completionHandler___block_invoke;
  block[3] = &unk_1E9E52328;
  v11 = a4;
  block[5] = a5;
  block[6] = a3;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __70__VCAudioManager_setSpatialMetadata_audioSessionId_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD *v4;
  const void *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56)));
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "setSpatialMetadata:", *(_QWORD *)(a1 + 48));
    v4 = *(_QWORD **)(a1 + 32);
    if ((void *)v4[116] == v3)
      objc_msgSend(v4, "applySpatialMetadata:", *(_QWORD *)(a1 + 48));
  }
  else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __70__VCAudioManager_setSpatialMetadata_audioSessionId_completionHandler___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_DWORD *)(a1 + 56);
        v11 = 136316418;
        v12 = v7;
        v13 = 2080;
        v14 = "-[VCAudioManager setSpatialMetadata:audioSessionId:completionHandler:]_block_invoke";
        v15 = 1024;
        v16 = 1771;
        v17 = 2112;
        v18 = v6;
        v19 = 2048;
        v20 = v9;
        v21 = 1024;
        v22 = v10;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Spatial context for audioSessionId=%u is not registered", (uint8_t *)&v11, 0x36u);
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
}

- (void)applySessionContextToAudioUnitProperties:(id)a3 preferredClient:(id)a4
{
  const __CFString *v5;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 spatialAudioDisabled;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  VCAudioManager *v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_spatialAudioDisabled)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          spatialAudioDisabled = self->_spatialAudioDisabled;
          v21 = 136315906;
          v22 = v12;
          v23 = 2080;
          v24 = "-[VCAudioManager applySessionContextToAudioUnitProperties:preferredClient:]";
          v25 = 1024;
          v26 = 1785;
          v27 = 1024;
          LODWORD(v28) = spatialAudioDisabled;
          v15 = " [%s] %s:%d skip spatial context _spatialAudioDisabled=%d";
          v16 = v13;
          v17 = 34;
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v21, v17);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_spatialAudioDisabled;
          v21 = 136316418;
          v22 = v18;
          v23 = 2080;
          v24 = "-[VCAudioManager applySessionContextToAudioUnitProperties:preferredClient:]";
          v25 = 1024;
          v26 = 1785;
          v27 = 2112;
          v28 = v5;
          v29 = 2048;
          v30 = self;
          v31 = 1024;
          v32 = v20;
          v15 = " [%s] %s:%d %@(%p) skip spatial context _spatialAudioDisabled=%d";
          v16 = v19;
          v17 = 54;
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v7 = objc_msgSend(a4, "audioSessionId");
    v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_spatialContexts, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7));
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "maxChannelCountMic");
      *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 28) = v10;
      v11 = objc_msgSend(v9, "maxChannelCountSpeaker");
      *(_DWORD *)(objc_msgSend(a3, "frameFormatSpeaker") + 28) = v11;
      objc_msgSend(a3, "setSpatialContext:", v9);
      objc_msgSend(a3, "setVpEnableSpatialChat:", 1);
    }
  }
}

- (void)applySpatialMetadata:(OpaqueCMBlockBuffer *)a3
{
  OSStatus DataPointer;
  int v6;
  OSStatus v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  char *v22;
  size_t totalLengthOut;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  OpaqueCMBlockBuffer *v31;
  __int16 v32;
  size_t v33;
  __int16 v34;
  OpaqueCMBlockBuffer *v35;
  __int16 v36;
  size_t v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  totalLengthOut = 0;
  if (!a3)
    return;
  DataPointer = CMBlockBufferGetDataPointer(a3, 0, 0, &totalLengthOut, &v22);
  if (DataPointer)
  {
    v7 = DataPointer;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return;
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 136315906;
      v25 = v11;
      v26 = 2080;
      v27 = "-[VCAudioManager applySpatialMetadata:]";
      v28 = 1024;
      v29 = 1806;
      v30 = 1024;
      LODWORD(v31) = v7;
      v13 = " [%s] %s:%d Failed to retrieve the metadata buffer. osStatus=%d";
      v14 = v12;
      v15 = 34;
LABEL_26:
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      return;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix, v22);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136316418;
    v25 = v18;
    v26 = 2080;
    v27 = "-[VCAudioManager applySpatialMetadata:]";
    v28 = 1024;
    v29 = 1806;
    v30 = 2112;
    v31 = (OpaqueCMBlockBuffer *)v8;
    v32 = 2048;
    v33 = (size_t)self;
    v34 = 1024;
    LODWORD(v35) = v7;
    v13 = " [%s] %s:%d %@(%p) Failed to retrieve the metadata buffer. osStatus=%d";
    v14 = v19;
LABEL_21:
    v15 = 54;
    goto LABEL_26;
  }
  v6 = AUIOSetSpatialMetadata();
  if ((v6 & 0x80000000) == 0)
    return;
  v9 = v6;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      return;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    *(_DWORD *)buf = 136316418;
    v25 = v16;
    v26 = 2080;
    v27 = "-[VCAudioManager applySpatialMetadata:]";
    v28 = 1024;
    v29 = 1808;
    v30 = 2048;
    v31 = a3;
    v32 = 2048;
    v33 = totalLengthOut;
    v34 = 1024;
    LODWORD(v35) = v9;
    v13 = " [%s] %s:%d Failed to apply the metadata buffer. spatialMetadata=%p, dataBufferLength=%zu, status=%08x";
    v14 = v17;
    goto LABEL_21;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix, v22);
  else
    v10 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      v25 = v20;
      v26 = 2080;
      v27 = "-[VCAudioManager applySpatialMetadata:]";
      v28 = 1024;
      v29 = 1808;
      v30 = 2112;
      v31 = (OpaqueCMBlockBuffer *)v10;
      v32 = 2048;
      v33 = (size_t)self;
      v34 = 2048;
      v35 = a3;
      v36 = 2048;
      v37 = totalLengthOut;
      v38 = 1024;
      v39 = v9;
      v13 = " [%s] %s:%d %@(%p) Failed to apply the metadata buffer. spatialMetadata=%p, dataBufferLength=%zu, status=%08x";
      v14 = v21;
      v15 = 74;
      goto LABEL_26;
    }
  }
}

- (void)setupSpatialContextWithAudioUnitProperties:(id)a3 forceUpdate:(BOOL)a4
{
  uint64_t v7;
  void *v8;
  VCAudioUnitSpatialContext *currentSpatialContext;
  VCAudioUnitSpatialContext *v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = objc_msgSend(a3, "spatialContext");
  v8 = (void *)v7;
  currentSpatialContext = self->_currentSpatialContext;
  if (a4 || (VCAudioUnitSpatialContext *)v7 != currentSpatialContext)
  {

    v10 = v8;
    self->_currentSpatialContext = v10;
    -[VCAudioManager applySpatialMetadata:](self, "applySpatialMetadata:", -[VCAudioUnitSpatialContext spatialMetadata](v10, "spatialMetadata"));
  }
}

- (BOOL)setupVAD
{
  opaqueVCVoiceDetector *v3;
  _BOOL4 v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCAudioManager *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_playbackMode)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v4)
          return v4;
        -[VCAudioManager setupVAD].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v4)
          return v4;
        v19 = 136316162;
        v20 = v13;
        v21 = 2080;
        v22 = "-[VCAudioManager setupVAD]";
        v23 = 1024;
        v24 = 1855;
        v25 = 2112;
        v26 = v5;
        v27 = 2048;
        v28 = self;
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Incorrect playback mode", (uint8_t *)&v19, 0x30u);
      }
    }
    goto LABEL_26;
  }
  v3 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(0);
  self->_sinkData.voiceDetector = v3;
  if (v3)
  {
    LOBYTE(v4) = 1;
    return v4;
  }
  if ((VCAudioManager *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_26;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v4) = 0;
    if (!v17)
      return v4;
    v19 = 136316162;
    v20 = v15;
    v21 = 2080;
    v22 = "-[VCAudioManager setupVAD]";
    v23 = 1024;
    v24 = 1861;
    v25 = 2112;
    v26 = v6;
    v27 = 2048;
    v28 = self;
    v10 = " [%s] %s:%d %@(%p) Failed to create the VAD";
    v11 = v16;
    v12 = 48;
    goto LABEL_25;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v4) = 0;
    if (!v9)
      return v4;
    v19 = 136315650;
    v20 = v7;
    v21 = 2080;
    v22 = "-[VCAudioManager setupVAD]";
    v23 = 1024;
    v24 = 1861;
    v10 = " [%s] %s:%d Failed to create the VAD";
    v11 = v8;
    v12 = 28;
LABEL_25:
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v19, v12);
  }
LABEL_26:
  LOBYTE(v4) = 0;
  return v4;
}

- (void)startVADWithAudioUnitProperties:(id)a3
{
  if (!self->_playbackMode)
  {
    self->_sinkData.isForcedMediaPriorityEnabled = -[VCDefaults forceAudioPriorityEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPriorityEnabled");
    self->_sinkData.forcedMediaPriorityLastUpdateTime = -1.79769313e308;
    VCVoiceDetector_Start(self->_sinkData.voiceDetector, objc_msgSend(a3, "frameFormatMic"));
  }
}

- (void)resetChannelMask
{
  *(_OWORD *)&self->_sourceData.channelStateBitmap = 0u;
  *(_OWORD *)&self->_sinkData.channelStateBitmap = 0u;
}

- (BOOL)stateIdleWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6
{
  _BOOL4 v9;

  *a6 = 1;
  if (!-[NSMutableArray count](self->_allClients, "count", a3, a4, a5))
  {
    -[VCAudioManager resetAudioTimestamps](self, "resetAudioTimestamps");
    -[NSMutableDictionary removeAllObjects](self->_audioSessionSinkMuted, "removeAllObjects");
    goto LABEL_5;
  }
  v9 = -[VCAudioManager startAudioSessionWithProperties:](self, "startAudioSessionWithProperties:", a4);
  if (v9)
  {
    self->_isSuspended = 0;
    *a6 = 2;
LABEL_5:
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (void)enterStateStarted
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  unsigned int state;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  _BYTE v23[24];
  __int128 v24;
  void *p_sourceData;
  _BYTE v26[32];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_state - 3 <= 1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          state = self->_state;
          *(_DWORD *)v23 = 136316418;
          *(_QWORD *)&v23[4] = v4;
          *(_WORD *)&v23[12] = 2080;
          *(_QWORD *)&v23[14] = "-[VCAudioManager enterStateStarted]";
          *(_WORD *)&v23[22] = 1024;
          LODWORD(v24) = 1965;
          WORD2(v24) = 2048;
          *(_QWORD *)((char *)&v24 + 6) = self;
          HIWORD(v24) = 2048;
          p_sourceData = &self->_sourceData;
          *(_WORD *)v26 = 1024;
          *(_DWORD *)&v26[2] = state;
          v7 = " [%s] %s:%d [%p] Flushing eventQueue of source controllerIO[%p] in current manager state=%d";
          v8 = v5;
          v9 = 54;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v23, v9);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = self->_state;
          *(_DWORD *)v23 = 136316930;
          *(_QWORD *)&v23[4] = v10;
          *(_WORD *)&v23[12] = 2080;
          *(_QWORD *)&v23[14] = "-[VCAudioManager enterStateStarted]";
          *(_WORD *)&v23[22] = 1024;
          LODWORD(v24) = 1965;
          WORD2(v24) = 2112;
          *(_QWORD *)((char *)&v24 + 6) = v3;
          HIWORD(v24) = 2048;
          p_sourceData = self;
          *(_WORD *)v26 = 2048;
          *(_QWORD *)&v26[2] = self;
          *(_WORD *)&v26[10] = 2048;
          *(_QWORD *)&v26[12] = &self->_sourceData;
          *(_WORD *)&v26[20] = 1024;
          *(_DWORD *)&v26[22] = v12;
          v7 = " [%s] %s:%d %@(%p) [%p] Flushing eventQueue of source controllerIO[%p] in current manager state=%d";
          v8 = v11;
          v9 = 74;
          goto LABEL_12;
        }
      }
    }
    -[VCAudioManager flushEventQueue:](self, "flushEventQueue:", self->_sourceData.eventQueue, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, p_sourceData, *(_OWORD *)v26, *(_OWORD *)&v26[16]);
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v16 = self->_state;
      *(_DWORD *)v23 = 136316418;
      *(_QWORD *)&v23[4] = v14;
      *(_WORD *)&v23[12] = 2080;
      *(_QWORD *)&v23[14] = "-[VCAudioManager enterStateStarted]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 1967;
      WORD2(v24) = 2048;
      *(_QWORD *)((char *)&v24 + 6) = self;
      HIWORD(v24) = 2048;
      p_sourceData = &self->_sinkData;
      *(_WORD *)v26 = 1024;
      *(_DWORD *)&v26[2] = v16;
      v17 = " [%s] %s:%d [%p] Flushing eventQueue of sink controllerIO[%p] in current manager state=%d";
      v18 = v15;
      v19 = 54;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_24;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      v22 = self->_state;
      *(_DWORD *)v23 = 136316930;
      *(_QWORD *)&v23[4] = v20;
      *(_WORD *)&v23[12] = 2080;
      *(_QWORD *)&v23[14] = "-[VCAudioManager enterStateStarted]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 1967;
      WORD2(v24) = 2112;
      *(_QWORD *)((char *)&v24 + 6) = v13;
      HIWORD(v24) = 2048;
      p_sourceData = self;
      *(_WORD *)v26 = 2048;
      *(_QWORD *)&v26[2] = self;
      *(_WORD *)&v26[10] = 2048;
      *(_QWORD *)&v26[12] = &self->_sinkData;
      *(_WORD *)&v26[20] = 1024;
      *(_DWORD *)&v26[22] = v22;
      v17 = " [%s] %s:%d %@(%p) [%p] Flushing eventQueue of sink controllerIO[%p] in current manager state=%d";
      v18 = v21;
      v19 = 74;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v23, v19);
LABEL_24:
    -[VCAudioManager flushEventQueue:](self, "flushEventQueue:", self->_sinkData.eventQueue, *(_QWORD *)v23, *(_OWORD *)&v23[8], v24, p_sourceData, *(_QWORD *)v26, *(_QWORD *)&v26[8], *(_QWORD *)&v26[16], *(_QWORD *)&v26[24]);
    -[VCAudioManager removeAllClientsForIO:](self, "removeAllClientsForIO:", &self->_sinkData);
    -[VCAudioManager removeAllClientsForIO:](self, "removeAllClientsForIO:", &self->_sourceData);
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
    -[VCAudioManager setCurrentAudioUnitProperties:](self, "setCurrentAudioUnitProperties:", 0);
  }
}

- (BOOL)stateSessionStartedWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6
{
  int v11;
  BOOL v12;
  NSMutableArray *allClients;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int playbackMode;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  unsigned int *v27;
  _VCAudioIOControllerIOState *p_sourceData;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  *a6 = 2;
  if (-[NSMutableArray count](self->_allClients, "count")
    && (v11 = -[VCAudioSessionMediaProperties isSessionActive](self->_currentAudioSessionMediaProperties, "isSessionActive"), v11 == objc_msgSend(a4, "isSessionActive")))
  {
    v27 = a6;
    if (a5 && (-[NSMutableArray containsObject:](self->_startingIOClients, "containsObject:", a5) & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_startingIOClients, "addObject:", a5);
      v26 = 1;
    }
    else
    {
      v26 = 0;
    }
    if (-[VCAudioManager shouldResetAudioSessionWithProperties:](self, "shouldResetAudioSessionWithProperties:", a4, a5))
    {
      -[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:](self, "resetAudioSessionWithProperties:interruptSuccessful:", a4, 0);
    }
    -[VCAudioManager setCurrentAudioUnitProperties:](self, "setCurrentAudioUnitProperties:", a3);
    VCAudioBufferList_AllocateFrame((uint64_t)-[VCAudioUnitProperties frameFormatSpeaker](self->_currentAudioUnitProperties, "frameFormatSpeaker"), &self->_sourceData.secondarySampleBuffer);
    p_sourceData = &self->_sourceData;
    VCAudioBufferList_AllocateFrame((uint64_t)-[VCAudioUnitProperties frameFormatMic](self->_currentAudioUnitProperties, "frameFormatMic"), &self->_sourceData.interruptMixDownSampleBuffer);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    allClients = self->_allClients;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v39 != v17)
            objc_enumerationMutation(allClients);
          v19 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if ((-[VCAudioUnitProperties audioUnitType](self->_currentAudioUnitProperties, "audioUnitType") != 2
             || objc_msgSend(v19, "deviceRole") == 2)
            && (-[VCAudioUnitProperties audioUnitType](self->_currentAudioUnitProperties, "audioUnitType") != 1
             || objc_msgSend(v19, "deviceRole") != 2))
          {
            playbackMode = self->_playbackMode;
            v21 = (void *)objc_msgSend(v19, "delegate");
            if (playbackMode == 1)
              v22 = objc_msgSend(a3, "frameFormatSpeaker");
            else
              v22 = objc_msgSend(a3, "frameFormatMic");
            objc_msgSend(v21, "controllerFormatChanged:", v22);
            if ((objc_msgSend(v19, "direction") & 2) != 0)
              -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", objc_msgSend(v19, "sinkIO"), &self->_sinkData);
            if ((objc_msgSend(v19, "direction") & 1) != 0)
              -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", objc_msgSend(v19, "sourceIO"), p_sourceData);
          }
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](allClients, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      }
      while (v16);
    }
    -[VCAudioManager resetChannelMask](self, "resetChannelMask");
    if (-[VCAudioManager startAUIOWithProperties:](self, "startAUIOWithProperties:", a3))
    {
      *v27 = 3;
      if (VCDefaults_GetBoolValueForKey(CFSTR("forceMixingVoiceWithMediaEnabled"), self->_isMixingVoiceWithMediaEnabled))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v23 = VRTraceErrorLogLevelToCSTR();
          v24 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v30 = v23;
            v31 = 2080;
            v32 = "-[VCAudioManager stateSessionStartedWithAudioUnitProperties:sessionProperties:client:newState:]";
            v33 = 1024;
            v34 = 2024;
            v35 = 1024;
            v36 = 1;
            _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Setting Voice Mixing Enabled=%d", buf, 0x22u);
          }
        }
        v12 = 1;
        -[VCAudioManager setMixingVoiceWithMediaEnabled:](self, "setMixingVoiceWithMediaEnabled:", 1);
      }
      else
      {
        return 1;
      }
    }
    else
    {
      VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
      VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
      -[VCAudioManager removeAllClientsForIO:](self, "removeAllClientsForIO:", &self->_sinkData);
      -[VCAudioManager removeAllClientsForIO:](self, "removeAllClientsForIO:", p_sourceData);
      if (v26)
        -[NSMutableArray removeObject:](self->_startingIOClients, "removeObject:", objc_msgSend(v25, "delegate"));
      return 0;
    }
  }
  else
  {
    self->_isSuspended = 0;
    -[VCAudioManager stopAudioSession](self, "stopAudioSession");
    v12 = 1;
    *a6 = 1;
  }
  return v12;
}

- (BOOL)stateRunningShouldTransitionToStarted:(id)a3
{
  unsigned int v5;

  if (!-[NSMutableArray count](self->_allClients, "count"))
    return 1;
  v5 = -[VCAudioUnitProperties audioUnitType](self->_currentAudioUnitProperties, "audioUnitType");
  return v5 != objc_msgSend(a3, "audioUnitType");
}

- (BOOL)stateRunningShouldTransitionToInterrupted:(id)a3
{
  return !-[VCAudioManager stateRunningShouldTransitionToStarted:](self, "stateRunningShouldTransitionToStarted:", a3)
      && self->_isSuspended;
}

- (void)stateRunningToSessionStarted
{
  -[VCAudioManager stopAUIO](self, "stopAUIO");
  -[VCAudioManager enterStateStarted](self, "enterStateStarted");
}

- (void)stateTransitionRunningToInterrupted
{
  -[VCAudioManager stopAUIO](self, "stopAUIO");
  -[VCAudioManager startInterruptThread](self, "startInterruptThread");
}

- (BOOL)stateRunningWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6
{
  unsigned int v11;
  _BOOL4 v12;
  int v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  NSObject *v22;
  unsigned int v23;
  int v24;
  unsigned int audioSessionId;
  const __CFString *v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  unsigned int v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  int v39;
  _BOOL4 v40;
  int IsReady;
  int v43;
  int v44;
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  _BYTE v53[10];
  VCAudioManager *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  unsigned int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  *a6 = 3;
  if (-[VCAudioManager stateRunningShouldTransitionToStarted:](self, "stateRunningShouldTransitionToStarted:"))
  {
    -[VCAudioManager stateRunningToSessionStarted](self, "stateRunningToSessionStarted");
    v11 = 2;
LABEL_5:
    *a6 = v11;
LABEL_50:
    LOBYTE(v40) = 1;
    return v40;
  }
  if (-[VCAudioManager stateRunningShouldTransitionToInterrupted:](self, "stateRunningShouldTransitionToInterrupted:", a3))
  {
    -[VCAudioManager stateTransitionRunningToInterrupted](self, "stateTransitionRunningToInterrupted");
    v11 = 4;
    goto LABEL_5;
  }
  v12 = -[VCAudioManager shouldResetAudioSessionWithProperties:](self, "shouldResetAudioSessionWithProperties:", a4);
  v13 = -[VCAudioManager shouldResetAudioUnitWithProperties:](self, "shouldResetAudioUnitWithProperties:", a3);
  v14 = v13 | v12;
  if ((v13 | v12) != 1)
    goto LABEL_21;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_18;
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v44 = objc_msgSend(a3, "audioSessionId");
    v18 = *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 40);
    *(_DWORD *)buf = 136316162;
    v47 = v16;
    v48 = 2080;
    v49 = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
    v50 = 1024;
    v51 = 2078;
    v52 = 1024;
    *(_DWORD *)v53 = v44;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v18;
    v19 = " [%s] %s:%d [CMSession]:%u reset audio unit: %d";
    v20 = v17;
    v21 = 40;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_18;
    v45 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    v43 = objc_msgSend(a3, "audioSessionId");
    v23 = *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 40);
    *(_DWORD *)buf = 136316674;
    v47 = v45;
    v48 = 2080;
    v49 = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
    v50 = 1024;
    v51 = 2078;
    v52 = 2112;
    *(_QWORD *)v53 = v15;
    *(_WORD *)&v53[8] = 2048;
    v54 = self;
    v55 = 1024;
    v56 = v43;
    v57 = 1024;
    v58 = v23;
    v19 = " [%s] %s:%d %@(%p) [CMSession]:%u reset audio unit: %d";
    v20 = v22;
    v21 = 60;
  }
  _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
LABEL_18:
  v24 = AUIOSuspend((uint64_t)self->_hAUIO, v13);
  if (v24 < 0 && v24 != -2145714174)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v40)
        return v40;
      -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:].cold.1();
    }
    goto LABEL_67;
  }
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
  VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
  -[VCAudioManager applyControllerFormatToClients:](self, "applyControllerFormatToClients:", a3);
LABEL_21:
  if (v12
    && !-[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:](self, "resetAudioSessionWithProperties:interruptSuccessful:", a4, 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v40)
        return v40;
      -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:].cold.6();
    }
    goto LABEL_67;
  }
  if (v13)
    VCVoiceDetector_Stop(self->_sinkData.voiceDetector);
  audioSessionId = self->_sourceData.audioSessionId;
  if (audioSessionId == objc_msgSend(a3, "audioSessionId"))
    goto LABEL_37;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_37;
    v27 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v29 = objc_msgSend(a3, "audioSessionId");
    v30 = self->_sourceData.audioSessionId;
    *(_DWORD *)buf = 136316162;
    v47 = v27;
    v48 = 2080;
    v49 = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
    v50 = 1024;
    v51 = 2097;
    v52 = 1024;
    *(_DWORD *)v53 = v29;
    *(_WORD *)&v53[4] = 1024;
    *(_DWORD *)&v53[6] = v30;
    v31 = " [%s] %s:%d New active audioSessionId=%u previousAudioSessionID=%u";
    v32 = v28;
    v33 = 40;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_37;
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v36 = objc_msgSend(a3, "audioSessionId");
    v37 = self->_sourceData.audioSessionId;
    *(_DWORD *)buf = 136316674;
    v47 = v34;
    v48 = 2080;
    v49 = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
    v50 = 1024;
    v51 = 2097;
    v52 = 2112;
    *(_QWORD *)v53 = v26;
    *(_WORD *)&v53[8] = 2048;
    v54 = self;
    v55 = 1024;
    v56 = v36;
    v57 = 1024;
    v58 = v37;
    v31 = " [%s] %s:%d %@(%p) New active audioSessionId=%u previousAudioSessionID=%u";
    v32 = v35;
    v33 = 60;
  }
  _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
LABEL_37:
  -[VCAudioUnitProperties setOperatingMode:](self->_currentAudioUnitProperties, "setOperatingMode:", objc_msgSend(a3, "operatingMode"));
  -[VCAudioManager setupSpatialContextWithAudioUnitProperties:forceUpdate:](self, "setupSpatialContextWithAudioUnitProperties:forceUpdate:", a3, 0);
  v38 = objc_msgSend(a3, "audioSessionId");
  self->_sourceData.audioSessionId = v38;
  self->_sinkData.audioSessionId = v38;
  -[VCAudioUnitProperties setAudioSessionId:](self->_currentAudioUnitProperties, "setAudioSessionId:", v38);
  -[VCAudioManager applyAudioSessionMute](self, "applyAudioSessionMute");
  -[VCAudioManager activateStartingClient:applyControllerFormat:](self, "activateStartingClient:applyControllerFormat:", a5, v14 ^ 1u);
  if ((v14 & 1) == 0)
    goto LABEL_47;
  _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sinkData);
  _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sourceData);
  VCAudioBufferList_AllocateFrame(objc_msgSend(a3, "frameFormatSpeaker"), &self->_sourceData.secondarySampleBuffer);
  VCAudioBufferList_AllocateFrame(objc_msgSend(a3, "frameFormatMic"), &self->_sourceData.interruptMixDownSampleBuffer);
  if (v13)
  {
    if (!-[VCAudioManager resetAUIOWithProperties:](self, "resetAUIOWithProperties:", a3))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v40)
          return v40;
        -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:].cold.5();
      }
      goto LABEL_67;
    }
    -[VCAudioManager startVADWithAudioUnitProperties:](self, "startVADWithAudioUnitProperties:", a3);
  }
  if (!-[VCAudioManager resetAudioLimiterWithProperties:](self, "resetAudioLimiterWithProperties:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v40)
        return v40;
      -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:].cold.4();
    }
    goto LABEL_67;
  }
  -[VCAudioManager setCurrentAudioUnitProperties:](self, "setCurrentAudioUnitProperties:", a3);
  v39 = AUIOResume();
  if ((v39 & 0x80000000) == 0 || v39 == -2145714174)
  {
LABEL_47:
    IsReady = AUIOReceiverIsReady();
    if ((IsReady & 0x80000000) == 0 || IsReady == -2145714174)
    {
      -[VCAudioManager completeStartForAllStartingClients](self, "completeStartForAllStartingClients");
      goto LABEL_50;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v40)
        return v40;
      -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:].cold.3();
    }
    goto LABEL_67;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v40 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v40)
      return v40;
    -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:].cold.2();
  }
LABEL_67:
  LOBYTE(v40) = 0;
  return v40;
}

- (BOOL)stateInterruptedShouldGoToStarted:(id)a3
{
  unsigned int v5;

  if (!-[NSMutableArray count](self->_allClients, "count"))
    return 1;
  v5 = -[VCAudioUnitProperties audioUnitType](self->_currentAudioUnitProperties, "audioUnitType");
  return v5 != objc_msgSend(a3, "audioUnitType");
}

- (BOOL)stateInterruptedShouldGoToRunning:(id)a3
{
  return !-[VCAudioManager stateInterruptedShouldGoToStarted:](self, "stateInterruptedShouldGoToStarted:", a3)
      && !self->_isSuspended;
}

- (void)stateTransitionInterruptedToRunning
{
  -[VCAudioManager stopInterruptThread](self, "stopInterruptThread");
  -[VCAudioManager resetChannelMask](self, "resetChannelMask");
  -[VCAudioManager startAUIOWithProperties:](self, "startAUIOWithProperties:", self->_currentAudioUnitProperties);
}

- (void)stateTransitionInterruptedToStarted
{
  -[VCAudioManager stopInterruptThread](self, "stopInterruptThread");
  -[VCAudioManager enterStateStarted](self, "enterStateStarted");
}

- (BOOL)stateInterruptedWithAudioUnitProperties:(id)a3 sessionProperties:(id)a4 client:(id)a5 newState:(unsigned int *)a6
{
  unsigned int v11;
  _BOOL4 v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  unsigned int audioSessionId;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  unsigned int v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  unsigned int v36;
  uint64_t v37;
  _BYTE v39[24];
  __int128 v40;
  VCAudioManager *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  *a6 = 4;
  if (-[VCAudioManager stateInterruptedShouldGoToStarted:](self, "stateInterruptedShouldGoToStarted:"))
  {
    -[VCAudioManager stateTransitionInterruptedToStarted](self, "stateTransitionInterruptedToStarted");
    v11 = 2;
LABEL_7:
    *a6 = v11;
    return 1;
  }
  if (a5)
  {
    v39[0] = 0;
    -[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:](self, "resetAudioSessionWithProperties:interruptSuccessful:", a4, v39);
    self->_isSuspended = v39[0] ^ 1;
  }
  if (-[VCAudioManager stateInterruptedShouldGoToRunning:](self, "stateInterruptedShouldGoToRunning:", a3))
  {
    -[VCAudioManager stateTransitionInterruptedToRunning](self, "stateTransitionInterruptedToRunning");
    v11 = 3;
    goto LABEL_7;
  }
  v12 = -[VCAudioManager shouldResetAudioSessionWithProperties:](self, "shouldResetAudioSessionWithProperties:", a4);
  v13 = -[VCAudioManager shouldResetAudioUnitWithProperties:](self, "shouldResetAudioUnitWithProperties:", a3) || v12;
  if (v13 == 1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_20;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v17 = *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 40);
      *(_DWORD *)v39 = 136315906;
      *(_QWORD *)&v39[4] = v15;
      *(_WORD *)&v39[12] = 2080;
      *(_QWORD *)&v39[14] = "-[VCAudioManager stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 2184;
      WORD2(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 6) = v17;
      v18 = " [%s] %s:%d reset audio unit: %d";
      v19 = v16;
      v20 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_20;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      v23 = *(_DWORD *)(objc_msgSend(a3, "frameFormatMic") + 40);
      *(_DWORD *)v39 = 136316418;
      *(_QWORD *)&v39[4] = v21;
      *(_WORD *)&v39[12] = 2080;
      *(_QWORD *)&v39[14] = "-[VCAudioManager stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 2184;
      WORD2(v40) = 2112;
      *(_QWORD *)((char *)&v40 + 6) = v14;
      HIWORD(v40) = 2048;
      v41 = self;
      LOWORD(v42) = 1024;
      *(_DWORD *)((char *)&v42 + 2) = v23;
      v18 = " [%s] %s:%d %@(%p) reset audio unit: %d";
      v19 = v22;
      v20 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, v39, v20);
LABEL_20:
    -[VCAudioManager stopInterruptThread](self, "stopInterruptThread", *(_OWORD *)v39, *(_QWORD *)&v39[16], v40, v41, v42);
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.secondarySampleBuffer);
    VCAudioBufferList_Destroy((uint64_t *)&self->_sourceData.interruptMixDownSampleBuffer);
    -[VCAudioManager applyControllerFormatToClients:](self, "applyControllerFormatToClients:", a3);
  }
  if (v12)
    -[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:](self, "resetAudioSessionWithProperties:interruptSuccessful:", a4, 0);
  -[VCAudioUnitProperties setOperatingMode:](self->_currentAudioUnitProperties, "setOperatingMode:", objc_msgSend(a3, "operatingMode"));
  audioSessionId = self->_sourceData.audioSessionId;
  if (audioSessionId == objc_msgSend(a3, "audioSessionId"))
    goto LABEL_35;
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_35;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    v28 = objc_msgSend(a3, "audioSessionId");
    v29 = self->_sourceData.audioSessionId;
    *(_DWORD *)v39 = 136316162;
    *(_QWORD *)&v39[4] = v26;
    *(_WORD *)&v39[12] = 2080;
    *(_QWORD *)&v39[14] = "-[VCAudioManager stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:]";
    *(_WORD *)&v39[22] = 1024;
    LODWORD(v40) = 2198;
    WORD2(v40) = 1024;
    *(_DWORD *)((char *)&v40 + 6) = v28;
    WORD5(v40) = 1024;
    HIDWORD(v40) = v29;
    v30 = " [%s] %s:%d New active audioSessionId=%u previousAudioSessionID=%u";
    v31 = v27;
    v32 = 40;
    goto LABEL_34;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v25 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v25 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v33 = VRTraceErrorLogLevelToCSTR();
    v34 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v35 = objc_msgSend(a3, "audioSessionId");
      v36 = self->_sourceData.audioSessionId;
      *(_DWORD *)v39 = 136316674;
      *(_QWORD *)&v39[4] = v33;
      *(_WORD *)&v39[12] = 2080;
      *(_QWORD *)&v39[14] = "-[VCAudioManager stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 2198;
      WORD2(v40) = 2112;
      *(_QWORD *)((char *)&v40 + 6) = v25;
      HIWORD(v40) = 2048;
      v41 = self;
      LOWORD(v42) = 1024;
      *(_DWORD *)((char *)&v42 + 2) = v35;
      HIWORD(v42) = 1024;
      LODWORD(v43) = v36;
      v30 = " [%s] %s:%d %@(%p) New active audioSessionId=%u previousAudioSessionID=%u";
      v31 = v34;
      v32 = 60;
LABEL_34:
      _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, v30, v39, v32);
    }
  }
LABEL_35:
  v37 = objc_msgSend(a3, "audioSessionId", *(_QWORD *)v39, *(_OWORD *)&v39[8], v40, v41, v42, v43);
  self->_sourceData.audioSessionId = v37;
  self->_sinkData.audioSessionId = v37;
  -[VCAudioUnitProperties setAudioSessionId:](self->_currentAudioUnitProperties, "setAudioSessionId:", v37);
  -[VCAudioManager applyAudioSessionMute](self, "applyAudioSessionMute");
  -[VCAudioManager activateStartingClient:applyControllerFormat:](self, "activateStartingClient:applyControllerFormat:", a5, v13 ^ 1u);
  if (((v13 ^ 1) & 1) == 0)
  {
    VCAudioBufferList_AllocateFrame(objc_msgSend(a3, "frameFormatSpeaker"), &self->_sourceData.secondarySampleBuffer);
    VCAudioBufferList_AllocateFrame(objc_msgSend(a3, "frameFormatMic"), &self->_sourceData.interruptMixDownSampleBuffer);
    -[VCAudioManager setCurrentAudioUnitProperties:](self, "setCurrentAudioUnitProperties:", a3);
    -[VCAudioManager startInterruptThread](self, "startInterruptThread");
  }
  -[VCAudioManager completeStartForAllStartingClients](self, "completeStartForAllStartingClients");
  return 1;
}

- (id)preferredClientWithNewClient:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (!a3 || objc_msgSend(a3, "isPrewarmingClient"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)-[NSMutableArray reverseObjectEnumerator](self->_allClients, "reverseObjectEnumerator");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (!objc_msgSend(v10, "isPrewarmingClient"))
          {
            v3 = v10;
            goto LABEL_13;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_13:
    if (!v3)
      return (id)-[NSMutableArray lastObject](self->_allClients, "lastObject");
  }
  return v3;
}

- (BOOL)updateStateWithAudioIOClient:(id)a3
{
  id v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int playbackMode;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  VCAudioManager *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  int v31;
  int v32;
  int v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  uint64_t v40;
  NSObject *v41;
  int v42;
  unint64_t v43;
  VCAudioManager *v44;
  os_log_t *v45;
  const __CFString *v46;
  uint64_t v47;
  os_log_t v48;
  id v49;
  unsigned int v50;
  NSObject *v51;
  const char *v52;
  uint32_t v53;
  uint64_t v54;
  os_log_t v55;
  VCAudioManager *v56;
  unsigned int state;
  uint64_t v58;
  BOOL v59;
  BOOL v60;
  unsigned int v61;
  const __CFString *v62;
  uint64_t v63;
  os_log_t v64;
  id v65;
  int v66;
  id v67;
  NSObject *v68;
  const char *v69;
  uint32_t v70;
  uint64_t v71;
  os_log_t v72;
  VCAudioManager *v73;
  int v74;
  id v75;
  VCAudioManager *v77;
  id v78;
  id v79;
  double v80;
  double v81;
  unsigned int v82;
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  const char *v86;
  __int16 v87;
  int v88;
  __int16 v89;
  VCAudioManager *v90;
  __int16 v91;
  _BYTE v92[20];
  _BYTE v93[14];
  __int16 v94;
  int v95;
  __int16 v96;
  int v97;
  __int16 v98;
  int v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v82 = 0;
  v5 = -[VCAudioManager preferredClientWithNewClient:](self, "preferredClientWithNewClient:");
  -[VCAudioManager _cleanupDeadClients](self, "_cleanupDeadClients");
  v77 = (VCAudioManager *)a3;
  if (a3)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v84 = v7;
          v85 = 2080;
          v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
          v87 = 1024;
          v88 = 2245;
          v89 = 2112;
          v90 = v77;
          v9 = " [%s] %s:%d new client: %@";
          v10 = v8;
          v11 = 38;
LABEL_12:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v84 = v12;
          v85 = 2080;
          v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
          v87 = 1024;
          v88 = 2245;
          v89 = 2112;
          v90 = (VCAudioManager *)v6;
          v91 = 2048;
          *(_QWORD *)v92 = self;
          *(_WORD *)&v92[8] = 2112;
          *(_QWORD *)&v92[10] = v77;
          v9 = " [%s] %s:%d %@(%p) new client: %@";
          v10 = v13;
          v11 = 58;
          goto LABEL_12;
        }
      }
    }
  }
  playbackMode = self->_playbackMode;
  if (playbackMode)
  {
    v78 = -[VCAudioManager newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:](self, "newAudioUnitPropertiesForSystemAudioWithPreferredClient:isInput:", v5, playbackMode == 2);
    v79 = -[VCAudioManager newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:audioUnitProperties:isInput:](self, "newAudioSessionMediaPropertiesForSystemAudioWithPreferredClient:audioUnitProperties:isInput:", v5, v78, self->_playbackMode == 2);
    v15 = v78;
    if (self->_playbackMode != 2)
    {
      v16 = objc_msgSend(v78, "frameFormatSpeaker");
      goto LABEL_18;
    }
  }
  else
  {
    v78 = -[VCAudioManager newAudioUnitPropertiesWithPreferredClient:](self, "newAudioUnitPropertiesWithPreferredClient:", v5);
    v79 = -[VCAudioManager newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:](self, "newAudioSessionMediaPropertiesWithPreferredClient:audioUnitProperties:", v5, v78);
    v15 = v78;
  }
  v16 = objc_msgSend(v15, "frameFormatMic");
LABEL_18:
  v17 = v16;
  v18 = -[NSMutableArray count](self->_allClients, "count");
  v19 = (VCAudioManager *)objc_opt_class();
  if (v18)
  {
    if (v19 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_46;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
      v24 = -[NSMutableArray count](self->_allClients, "count");
      v25 = (int)*(double *)v17;
      v26 = *(_DWORD *)(v17 + 40);
      if (v79)
      {
        objc_msgSend(v79, "outputFormat");
        v27 = (int)v81;
      }
      else
      {
        v27 = 0;
      }
      *(_DWORD *)buf = 136317186;
      v84 = v22;
      v85 = 2080;
      v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
      v87 = 1024;
      v88 = 2262;
      v89 = 2048;
      v90 = self;
      v91 = 2048;
      *(_QWORD *)v92 = v77;
      *(_WORD *)&v92[8] = 1024;
      *(_DWORD *)&v92[10] = v24;
      *(_WORD *)&v92[14] = 1024;
      *(_DWORD *)&v92[16] = v25;
      *(_WORD *)v93 = 1024;
      *(_DWORD *)&v93[2] = v26;
      *(_WORD *)&v93[6] = 1024;
      *(_DWORD *)&v93[8] = v27;
      v37 = " [%s] %s:%d (%p) audioIO=%p clientCount:%d AUIO=%d/%d AudioSession=%d";
      v38 = v23;
      v39 = 72;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v20 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v20 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_46;
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_46;
      v30 = -[NSMutableArray count](self->_allClients, "count");
      v31 = (int)*(double *)v17;
      v32 = *(_DWORD *)(v17 + 40);
      if (v79)
      {
        objc_msgSend(v79, "outputFormat");
        v33 = (int)v80;
      }
      else
      {
        v33 = 0;
      }
      *(_DWORD *)buf = 136317698;
      v84 = v28;
      v85 = 2080;
      v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
      v87 = 1024;
      v88 = 2262;
      v89 = 2112;
      v90 = (VCAudioManager *)v20;
      v91 = 2048;
      *(_QWORD *)v92 = self;
      *(_WORD *)&v92[8] = 2048;
      *(_QWORD *)&v92[10] = self;
      *(_WORD *)&v92[18] = 2048;
      *(_QWORD *)v93 = v77;
      *(_WORD *)&v93[8] = 1024;
      *(_DWORD *)&v93[10] = v30;
      v94 = 1024;
      v95 = v31;
      v96 = 1024;
      v97 = v32;
      v98 = 1024;
      v99 = v33;
      v37 = " [%s] %s:%d %@(%p) (%p) audioIO=%p clientCount:%d AUIO=%d/%d AudioSession=%d";
      v38 = v29;
      v39 = 92;
    }
  }
  else if (v19 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_46;
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    v36 = -[NSMutableArray count](self->_allClients, "count");
    *(_DWORD *)buf = 136316418;
    v84 = v34;
    v85 = 2080;
    v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
    v87 = 1024;
    v88 = 2264;
    v89 = 2048;
    v90 = self;
    v91 = 2048;
    *(_QWORD *)v92 = v77;
    *(_WORD *)&v92[8] = 1024;
    *(_DWORD *)&v92[10] = v36;
    v37 = " [%s] %s:%d (%p) audioIO=%p clientCount:%d AUIO=-/- AudioSession=-";
    v38 = v35;
    v39 = 54;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v21 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v21 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_46;
    v40 = VRTraceErrorLogLevelToCSTR();
    v41 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_46;
    v42 = -[NSMutableArray count](self->_allClients, "count");
    *(_DWORD *)buf = 136316930;
    v84 = v40;
    v85 = 2080;
    v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
    v87 = 1024;
    v88 = 2264;
    v89 = 2112;
    v90 = (VCAudioManager *)v21;
    v91 = 2048;
    *(_QWORD *)v92 = self;
    *(_WORD *)&v92[8] = 2048;
    *(_QWORD *)&v92[10] = self;
    *(_WORD *)&v92[18] = 2048;
    *(_QWORD *)v93 = v77;
    *(_WORD *)&v93[8] = 1024;
    *(_DWORD *)&v93[10] = v42;
    v37 = " [%s] %s:%d %@(%p) (%p) audioIO=%p clientCount:%d AUIO=-/- AudioSession=-";
    v38 = v41;
    v39 = 74;
  }
  _os_log_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
LABEL_46:
  v43 = 0x1F01AF000;
  v44 = v77;
  v45 = (os_log_t *)MEMORY[0x1E0CF2758];
  while (1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v54 = VRTraceErrorLogLevelToCSTR();
        v55 = *v45;
        if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
        {
          v56 = -[NSArray objectAtIndexedSubscript:](self->_stateStrings, "objectAtIndexedSubscript:", self->_state);
          state = self->_state;
          v43 = 0x1F01AF000uLL;
          *(_DWORD *)buf = 136316162;
          v84 = v54;
          v85 = 2080;
          v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
          v87 = 1024;
          v88 = 2268;
          v89 = 2112;
          v90 = v56;
          v91 = 1024;
          *(_DWORD *)v92 = state;
          v51 = v55;
          v52 = " [%s] %s:%d Process state: %@ (%d)";
          v53 = 44;
          goto LABEL_56;
        }
      }
    }
    else
    {
      v46 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v46 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v47 = VRTraceErrorLogLevelToCSTR();
        v48 = *v45;
        if (os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
        {
          v49 = -[NSArray objectAtIndexedSubscript:](self->_stateStrings, "objectAtIndexedSubscript:", self->_state);
          v50 = self->_state;
          v43 = 0x1F01AF000;
          *(_DWORD *)buf = 136316674;
          v84 = v47;
          v85 = 2080;
          v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
          v87 = 1024;
          v88 = 2268;
          v89 = 2112;
          v90 = (VCAudioManager *)v46;
          v91 = 2048;
          *(_QWORD *)v92 = self;
          *(_WORD *)&v92[8] = 2112;
          *(_QWORD *)&v92[10] = v49;
          *(_WORD *)&v92[18] = 1024;
          *(_DWORD *)v93 = v50;
          v51 = v48;
          v52 = " [%s] %s:%d %@(%p) Process state: %@ (%d)";
          v53 = 64;
LABEL_56:
          _os_log_impl(&dword_1D8A54000, v51, OS_LOG_TYPE_DEFAULT, v52, buf, v53);
        }
      }
    }
    v58 = *(int *)(v43 + 2440);
    switch(*(_DWORD *)((char *)&self->super.super.isa + v58))
    {
      case 1:
        v59 = -[VCAudioManager stateIdleWithAudioUnitProperties:sessionProperties:client:newState:](self, "stateIdleWithAudioUnitProperties:sessionProperties:client:newState:", v78, v79, v44, &v82);
        goto LABEL_63;
      case 2:
        v59 = -[VCAudioManager stateSessionStartedWithAudioUnitProperties:sessionProperties:client:newState:](self, "stateSessionStartedWithAudioUnitProperties:sessionProperties:client:newState:", v78, v79, v44, &v82);
        goto LABEL_63;
      case 3:
        v59 = -[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:](self, "stateRunningWithAudioUnitProperties:sessionProperties:client:newState:", v78, v79, v44, &v82);
        goto LABEL_63;
      case 4:
        v59 = -[VCAudioManager stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:](self, "stateInterruptedWithAudioUnitProperties:sessionProperties:client:newState:", v78, v79, v44, &v82);
LABEL_63:
        v60 = v59;
        break;
      default:
        v60 = 1;
        break;
    }
    v61 = v82;
    if (v82 == *(_DWORD *)((char *)&self->super.super.isa + v58))
      break;
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_75;
      v71 = VRTraceErrorLogLevelToCSTR();
      v72 = *v45;
      if (!os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
        goto LABEL_75;
      v73 = -[NSArray objectAtIndexedSubscript:](self->_stateStrings, "objectAtIndexedSubscript:", *(unsigned int *)((char *)&self->super.super.isa + v58));
      v74 = *(_DWORD *)((char *)&self->super.super.isa + v58);
      v43 = 0x1F01AF000;
      v75 = -[NSArray objectAtIndexedSubscript:](self->_stateStrings, "objectAtIndexedSubscript:", v82);
      *(_DWORD *)buf = 136316674;
      v84 = v71;
      v85 = 2080;
      v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
      v87 = 1024;
      v88 = 2287;
      v89 = 2112;
      v90 = v73;
      v91 = 1024;
      *(_DWORD *)v92 = v74;
      v45 = (os_log_t *)MEMORY[0x1E0CF2758];
      *(_WORD *)&v92[4] = 2112;
      *(_QWORD *)&v92[6] = v75;
      *(_WORD *)&v92[14] = 1024;
      *(_DWORD *)&v92[16] = v82;
      v68 = v72;
      v69 = " [%s] %s:%d State change: %@ (%d) -> %@ (%d)";
      v70 = 60;
    }
    else
    {
      v62 = &stru_1E9E58EE0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v62 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_75;
      v63 = VRTraceErrorLogLevelToCSTR();
      v64 = *v45;
      if (!os_log_type_enabled(*v45, OS_LOG_TYPE_DEFAULT))
        goto LABEL_75;
      v65 = -[NSArray objectAtIndexedSubscript:](self->_stateStrings, "objectAtIndexedSubscript:", *(unsigned int *)((char *)&self->super.super.isa + v58));
      v66 = *(_DWORD *)((char *)&self->super.super.isa + v58);
      v45 = (os_log_t *)MEMORY[0x1E0CF2758];
      v67 = -[NSArray objectAtIndexedSubscript:](self->_stateStrings, "objectAtIndexedSubscript:", v82);
      *(_DWORD *)buf = 136317186;
      v84 = v63;
      v85 = 2080;
      v86 = "-[VCAudioManager updateStateWithAudioIOClient:]";
      v87 = 1024;
      v88 = 2287;
      v89 = 2112;
      v90 = (VCAudioManager *)v62;
      v91 = 2048;
      *(_QWORD *)v92 = self;
      *(_WORD *)&v92[8] = 2112;
      *(_QWORD *)&v92[10] = v65;
      v43 = 0x1F01AF000;
      *(_WORD *)&v92[18] = 1024;
      *(_DWORD *)v93 = v66;
      v44 = v77;
      *(_WORD *)&v93[4] = 2112;
      *(_QWORD *)&v93[6] = v67;
      v94 = 1024;
      v95 = v82;
      v68 = v64;
      v69 = " [%s] %s:%d %@(%p) State change: %@ (%d) -> %@ (%d)";
      v70 = 80;
    }
    _os_log_impl(&dword_1D8A54000, v68, OS_LOG_TYPE_DEFAULT, v69, buf, v70);
LABEL_75:
    v61 = v82;
    *(_DWORD *)((char *)&self->super.super.isa + v58) = v82;
    if (!v60)
      goto LABEL_78;
  }
  *(_DWORD *)((char *)&self->super.super.isa + v58) = v82;
LABEL_78:
  if (v61 != 3)
  {
    pthread_mutex_lock(&self->_interruptingMutex);
    self->_isInterrupting = 0;
    pthread_mutex_unlock(&self->_interruptingMutex);
  }

  return v60;
}

- (void)startClient:(id)a3
{
  NSObject *dispatchQueue;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  VCAudioManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__VCAudioManager_startClient___block_invoke;
    v8[3] = &unk_1E9E52238;
    v8[4] = a3;
    v8[5] = self;
    dispatch_async(dispatchQueue, v8);
  }
  else if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager startClient:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCAudioManager startClient:]";
        v13 = 1024;
        v14 = 2306;
        v15 = 2112;
        v16 = v5;
        v17 = 2048;
        v18 = self;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Client is nil!", buf, 0x30u);
      }
    }
  }
}

void __30__VCAudioManager_startClient___block_invoke(uint64_t a1)
{
  id *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "deviceRole") == 3
    || objc_msgSend(*v2, "deviceRole") == 4)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didStart:error:", 0, objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Controller doesn't support client role: %d"), objc_msgSend(*(id *)(a1 + 32), "deviceRole"))));
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __30__VCAudioManager_startClient___block_invoke_cold_1(v4, v2, v5);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)(a1 + 40);
          v10 = objc_msgSend(*(id *)(a1 + 32), "deviceRole");
          *(_DWORD *)buf = 136316418;
          v34 = v7;
          v35 = 2080;
          v36 = "-[VCAudioManager startClient:]_block_invoke";
          v37 = 1024;
          v38 = 2315;
          v39 = 2112;
          v40 = v3;
          v41 = 2048;
          v42 = v9;
          v43 = 1024;
          LODWORD(v44) = v10;
          v11 = " [%s] %s:%d %@(%p) Invalid device role: %d!";
          v12 = v8;
          v13 = 54;
LABEL_17:
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
          return;
        }
      }
    }
    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 40), "addClient:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v17 = (const __CFString *)*v2;
          *(_DWORD *)buf = 136315906;
          v34 = v15;
          v35 = 2080;
          v36 = "-[VCAudioManager startClient:]_block_invoke";
          v37 = 1024;
          v38 = 2324;
          v39 = 2048;
          v40 = v17;
          v18 = " [%s] %s:%d controller start client (audioIO=%p)";
          v19 = v16;
          v20 = 38;
LABEL_31:
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v6 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(_QWORD *)(a1 + 32);
          v23 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136316418;
          v34 = v21;
          v35 = 2080;
          v36 = "-[VCAudioManager startClient:]_block_invoke";
          v37 = 1024;
          v38 = 2324;
          v39 = 2112;
          v40 = v6;
          v41 = 2048;
          v42 = v23;
          v43 = 2048;
          v44 = v24;
          v18 = " [%s] %s:%d %@(%p) controller start client (audioIO=%p)";
          v19 = v22;
          v20 = 58;
          goto LABEL_31;
        }
      }
    }
    if ((objc_msgSend(*(id *)(a1 + 40), "updateStateWithAudioIOClient:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      if (objc_opt_class() == *(_QWORD *)(a1 + 40))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            __30__VCAudioManager_startClient___block_invoke_cold_2();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v25 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
        else
          v25 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v29 = VRTraceErrorLogLevelToCSTR();
          v30 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v32 = *(_QWORD *)(a1 + 32);
            v31 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 136316418;
            v34 = v29;
            v35 = 2080;
            v36 = "-[VCAudioManager startClient:]_block_invoke";
            v37 = 1024;
            v38 = 2326;
            v39 = 2112;
            v40 = v25;
            v41 = 2048;
            v42 = v31;
            v43 = 2048;
            v44 = v32;
            _os_log_error_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) controller start client FAILED (audioIO=%p)", buf, 0x3Au);
          }
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "removeClient:", *(_QWORD *)(a1 + 32));
      if ((objc_msgSend(*(id *)(a1 + 40), "updateStateWithAudioIOClient:", 0) & 1) == 0)
        +[VCAudioManager terminateProcess:terminateSource:agent:](VCAudioManager, "terminateProcess:terminateSource:agent:", CFSTR("Failed to recover AUIO state on client start failure"), CFSTR("VCAudioManager"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
      objc_msgSend((id)objc_msgSend(*v2, "delegate"), "didStart:error:", 0, objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client (%p) failed to start"), *v2)));
    }
    return;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "didStart:error:", 0, objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Controller request denied: client (%p) is alread started"), *(_QWORD *)(a1 + 32))));
  if (objc_opt_class() == *(_QWORD *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __30__VCAudioManager_startClient___block_invoke_cold_3();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v28 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316162;
        v34 = v26;
        v35 = 2080;
        v36 = "-[VCAudioManager startClient:]_block_invoke";
        v37 = 1024;
        v38 = 2321;
        v39 = 2112;
        v40 = v14;
        v41 = 2048;
        v42 = v28;
        v11 = " [%s] %s:%d %@(%p) Client already registered!";
        v12 = v27;
        v13 = 48;
        goto LABEL_17;
      }
    }
  }
}

- (void)stopClient:(id)a3
{
  NSObject *dispatchQueue;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[6];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  VCAudioManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    dispatchQueue = self->_dispatchQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__VCAudioManager_stopClient___block_invoke;
    v8[3] = &unk_1E9E52238;
    v8[4] = self;
    v8[5] = a3;
    dispatch_async(dispatchQueue, v8);
  }
  else if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager stopClient:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCAudioManager stopClient:]";
        v13 = 1024;
        v14 = 2340;
        v15 = 2112;
        v16 = v5;
        v17 = 2048;
        v18 = self;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Client is nil!", buf, 0x30u);
      }
    }
  }
}

uint64_t __29__VCAudioManager_stopClient___block_invoke(uint64_t a1)
{
  id *v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char IsOSFaultDisabled;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 40);
  if ((objc_msgSend(*(id *)(a1 + 32), "removeClient:", *(_QWORD *)(a1 + 40)) & 1) == 0)
    objc_msgSend((id)objc_msgSend(*v2, "delegate"), "didStop:error:", 0, objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32016, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Controller request denied: client (%p) is not running"), *v2)));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = (const __CFString *)*v2;
        *(_DWORD *)buf = 136315906;
        v39 = v4;
        v40 = 2080;
        v41 = "-[VCAudioManager stopClient:]_block_invoke";
        v42 = 1024;
        v43 = 2348;
        v44 = 2048;
        v45 = v6;
        v7 = " [%s] %s:%d controller stop client (audioIO=%p)";
        v8 = v5;
        v9 = 38;
LABEL_13:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v39 = v10;
        v40 = 2080;
        v41 = "-[VCAudioManager stopClient:]_block_invoke";
        v42 = 1024;
        v43 = 2348;
        v44 = 2112;
        v45 = v3;
        v46 = 2048;
        v47 = v12;
        v48 = 2048;
        v49 = v13;
        v7 = " [%s] %s:%d %@(%p) controller stop client (audioIO=%p)";
        v8 = v11;
        v9 = 58;
        goto LABEL_13;
      }
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "updateStateWithAudioIOClient:", 0))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_33;
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      v19 = (const __CFString *)*v2;
      *(_DWORD *)buf = 136315906;
      v39 = v17;
      v40 = 2080;
      v41 = "-[VCAudioManager stopClient:]_block_invoke";
      v42 = 1024;
      v43 = 2350;
      v44 = 2048;
      v45 = v19;
      v20 = " [%s] %s:%d controller did stop client (audioIO=%p)";
      v21 = v18;
      v22 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v14 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v14 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_33;
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_33;
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316418;
      v39 = v23;
      v40 = 2080;
      v41 = "-[VCAudioManager stopClient:]_block_invoke";
      v42 = 1024;
      v43 = 2350;
      v44 = 2112;
      v45 = v14;
      v46 = 2048;
      v47 = v25;
      v48 = 2048;
      v49 = v26;
      v20 = " [%s] %s:%d %@(%p) controller did stop client (audioIO=%p)";
      v21 = v24;
      v22 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
LABEL_33:
    v27 = (void *)objc_msgSend(*v2, "delegate");
    v28 = 1;
    v29 = 0;
    return objc_msgSend(v27, "didStop:error:", v28, v29);
  }
  v15 = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client (%p) failed to stop"), *(_QWORD *)(a1 + 40)));
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __29__VCAudioManager_stopClient___block_invoke_cold_1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        __29__VCAudioManager_stopClient___block_invoke_cold_2();
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v16 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v32 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v33 = *(_QWORD *)(a1 + 32);
          v34 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136316418;
          v39 = v30;
          v40 = 2080;
          v41 = "-[VCAudioManager stopClient:]_block_invoke";
          v42 = 1024;
          v43 = 2354;
          v44 = 2112;
          v45 = v16;
          v46 = 2048;
          v47 = v33;
          v48 = 2048;
          v49 = v34;
          _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) controller stop client FAILED (audioIO=%p)", buf, 0x3Au);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        v35 = *(_QWORD *)(a1 + 32);
        v36 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v39 = v30;
        v40 = 2080;
        v41 = "-[VCAudioManager stopClient:]_block_invoke";
        v42 = 1024;
        v43 = 2354;
        v44 = 2112;
        v45 = v16;
        v46 = 2048;
        v47 = v35;
        v48 = 2048;
        v49 = v36;
        _os_log_fault_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_FAULT, " [%s] %s:%d %@(%p) controller stop client FAILED (audioIO=%p)", buf, 0x3Au);
      }
    }
  }
  v27 = (void *)objc_msgSend(*v2, "delegate");
  v28 = 0;
  v29 = v15;
  return objc_msgSend(v27, "didStop:error:", v28, v29);
}

- (void)updateDirectionWithClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4 isClientRegistered:(BOOL)a5
{
  _BOOL4 v5;
  int v9;
  uint64_t var0;
  char v11;
  uint64_t v12;
  _VCAudioIOControllerIOState *p_sourceData;
  uint64_t v14;
  _VCAudioIOControllerIOState *p_sinkData;

  v5 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v9 = objc_msgSend(a3, "direction");
  var0 = a4->var0;
  v11 = var0 ^ v9;
  if (var0 != v9)
  {
    objc_msgSend(a3, "setDirection:", var0);
    if (v5 && self->_state != 1)
    {
      if ((v11 & 1) != 0)
      {
        v12 = objc_msgSend(a3, "sourceIO");
        p_sourceData = &self->_sourceData;
        if ((var0 & 1) != 0)
        {
          -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", v12, p_sourceData);
          if ((v11 & 2) == 0)
            return;
          goto LABEL_10;
        }
        -[VCAudioManager unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", v12, p_sourceData);
      }
      if ((v11 & 2) == 0)
        return;
LABEL_10:
      v14 = objc_msgSend(a3, "sinkIO");
      p_sinkData = &self->_sinkData;
      if ((var0 & 2) != 0)
        -[VCAudioManager registerClientIO:controllerIO:](self, "registerClientIO:controllerIO:", v14, p_sinkData);
      else
        -[VCAudioManager unregisterClientIO:controllerIO:](self, "unregisterClientIO:controllerIO:", v14, p_sinkData);
    }
  }
}

- (BOOL)supportsVoiceActivityDetection
{
  return 1;
}

- (void)updateSpatialAudioWithClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4 isClientRegistered:(BOOL)a5
{
  _BOOL4 v5;
  BOOL v9;
  VCAudioManager *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 spatialAudioDisabled;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  _BOOL4 v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  VCAudioManager *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  objc_msgSend(a3, "setSpatialAudioDisabled:", a4->var1);
  if (v5 && self->_spatialAudioDisabled != objc_msgSend(a3, "spatialAudioDisabled"))
  {
    self->_spatialAudioDisabled = objc_msgSend(a3, "spatialAudioDisabled");
    v9 = -[VCAudioManager updateStateWithAudioIOClient:](self, "updateStateWithAudioIOClient:", a3);
    v10 = (VCAudioManager *)objc_opt_class();
    if (v9)
    {
      if (v10 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            spatialAudioDisabled = self->_spatialAudioDisabled;
            v24 = 136315906;
            v25 = v13;
            v26 = 2080;
            v27 = "-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]";
            v28 = 1024;
            v29 = 2406;
            v30 = 1024;
            LODWORD(v31) = spatialAudioDisabled;
            v16 = " [%s] %s:%d controller updated _spatialAudioDisabled=%d";
            v17 = v14;
            v18 = 34;
LABEL_20:
            _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v18);
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v11 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v19 = VRTraceErrorLogLevelToCSTR();
          v20 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v21 = self->_spatialAudioDisabled;
            v24 = 136316418;
            v25 = v19;
            v26 = 2080;
            v27 = "-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]";
            v28 = 1024;
            v29 = 2406;
            v30 = 2112;
            v31 = v11;
            v32 = 2048;
            v33 = self;
            v34 = 1024;
            LODWORD(v35) = v21;
            v16 = " [%s] %s:%d %@(%p) controller updated _spatialAudioDisabled=%d";
            v17 = v20;
            v18 = 54;
            goto LABEL_20;
          }
        }
      }
    }
    else if (v10 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v24 = 136316418;
          v25 = v22;
          v26 = 2080;
          v27 = "-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]";
          v28 = 1024;
          v29 = 2404;
          v30 = 2112;
          v31 = v12;
          v32 = 2048;
          v33 = self;
          v34 = 2048;
          v35 = a3;
          _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) controller update FAILED (audioIO=%p)", (uint8_t *)&v24, 0x3Au);
        }
      }
    }
  }
}

- (void)updateVoiceProcessingWithClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4 isClientRegistered:(BOOL)a5
{
  _BOOL4 v5;
  int var2;
  int v10;
  int var3;
  int v12;
  _DWORD *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  _DWORD *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCAudioManager *v28;
  uint64_t v29;

  v5 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var2 = a4->var2;
  v10 = objc_msgSend(a3, "isVoiceActivityEnabled");
  var3 = a4->var3;
  v12 = objc_msgSend(a3, "isMediaPriorityEnabled");
  if (var2 != v10 || var3 != v12)
  {
    objc_msgSend(a3, "setIsVoiceActivityEnabled:", a4->var2);
    objc_msgSend(a3, "setIsMediaPriorityEnabled:", a4->var3);
    if (v5)
    {
      pthread_mutex_lock(&self->_interruptingMutex);
      if (-[VCAudioManager audioCallbacksRunning](self, "audioCallbacksRunning"))
      {
        v14 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00405C5CD52DuLL);
        v14[4] = 2;
        v18 = v14;
        if (CMSimpleQueueEnqueue(self->_sinkData.eventQueue, v14))
        {
          if ((VCAudioManager *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCAudioManager updateVoiceProcessingWithClient:settings:isClientRegistered:].cold.1();
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v15 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v15 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v16 = VRTraceErrorLogLevelToCSTR();
              v17 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v20 = v16;
                v21 = 2080;
                v22 = "-[VCAudioManager updateVoiceProcessingWithClient:settings:isClientRegistered:]";
                v23 = 1024;
                v24 = 2426;
                v25 = 2112;
                v26 = v15;
                v27 = 2048;
                v28 = self;
                _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
              }
            }
          }
          VCAudioManager_ReleaseAudioEvent((uint64_t *)&v18, 1);
        }
      }
      pthread_mutex_unlock(&self->_interruptingMutex);
    }
  }
}

- (void)updateClient:(id)a3 settings:(const tagVCAudioIOControllerClientSettings *)a4
{
  NSObject *dispatchQueue;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  _QWORD block[6];
  tagVCAudioIOControllerClientSettings v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCAudioManager *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __40__VCAudioManager_updateClient_settings___block_invoke;
      block[3] = &unk_1E9E522D8;
      block[4] = self;
      block[5] = a3;
      v13 = *a4;
      dispatch_async(dispatchQueue, block);
      return;
    }
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager updateClient:settings:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v15 = v11;
          v16 = 2080;
          v17 = "-[VCAudioManager updateClient:settings:]";
          v18 = 1024;
          v19 = 2438;
          v20 = 2112;
          v21 = v7;
          v22 = 2048;
          v23 = self;
          v10 = " [%s] %s:%d %@(%p) Invalid parameter: settings is NULL";
          goto LABEL_25;
        }
      }
    }
  }
  else if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager updateClient:settings:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v15 = v8;
        v16 = 2080;
        v17 = "-[VCAudioManager updateClient:settings:]";
        v18 = 1024;
        v19 = 2437;
        v20 = 2112;
        v21 = v6;
        v22 = 2048;
        v23 = self;
        v10 = " [%s] %s:%d %@(%p) Invalid parameter: client is nil";
LABEL_25:
        _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x30u);
      }
    }
  }
}

uint64_t __40__VCAudioManager_updateClient_settings___block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _BYTE v17[24];
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 40);
        v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 184);
        *(_DWORD *)v17 = 136316162;
        *(_QWORD *)&v17[4] = v3;
        *(_WORD *)&v17[12] = 2080;
        *(_QWORD *)&v17[14] = "-[VCAudioManager updateClient:settings:]_block_invoke";
        *(_WORD *)&v17[22] = 1024;
        LODWORD(v18) = 2442;
        WORD2(v18) = 2048;
        *(_QWORD *)((char *)&v18 + 6) = v5;
        HIWORD(v18) = 1024;
        LODWORD(v19) = v6;
        v7 = " [%s] %s:%d Update client[%p]. Current manager state=%d";
        v8 = v4;
        v9 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v17, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(a1 + 40);
        v14 = *(_DWORD *)(v12 + 184);
        *(_DWORD *)v17 = 136316674;
        *(_QWORD *)&v17[4] = v10;
        *(_WORD *)&v17[12] = 2080;
        *(_QWORD *)&v17[14] = "-[VCAudioManager updateClient:settings:]_block_invoke";
        *(_WORD *)&v17[22] = 1024;
        LODWORD(v18) = 2442;
        WORD2(v18) = 2112;
        *(_QWORD *)((char *)&v18 + 6) = v2;
        HIWORD(v18) = 2048;
        v19 = v12;
        LOWORD(v20) = 2048;
        *(_QWORD *)((char *)&v20 + 2) = v13;
        WORD5(v20) = 1024;
        HIDWORD(v20) = v14;
        v7 = " [%s] %s:%d %@(%p) Update client[%p]. Current manager state=%d";
        v8 = v11;
        v9 = 64;
        goto LABEL_11;
      }
    }
  }
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "containsObject:", *(_QWORD *)(a1 + 40), *(_OWORD *)v17, *(_QWORD *)&v17[16], v18, v19, v20);
  objc_msgSend(*(id *)(a1 + 32), "updateDirectionWithClient:settings:isClientRegistered:", *(_QWORD *)(a1 + 40), a1 + 48, v15);
  objc_msgSend(*(id *)(a1 + 32), "updateSpatialAudioWithClient:settings:isClientRegistered:", *(_QWORD *)(a1 + 40), a1 + 48, v15);
  return objc_msgSend(*(id *)(a1 + 32), "updateVoiceProcessingWithClient:settings:isClientRegistered:", *(_QWORD *)(a1 + 40), a1 + 48, v15);
}

- (void)refreshInputMetering
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__VCAudioManager_refreshInputMetering__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __38__VCAudioManager_refreshInputMetering__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInputMetering");
}

- (void)refreshOutputMetering
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__VCAudioManager_refreshOutputMetering__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __39__VCAudioManager_refreshOutputMetering__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOutputMetering");
}

- (void)refreshRemoteCodecType:(unsigned int)a3 sampleRate:(double)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[6];
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__VCAudioManager_refreshRemoteCodecType_sampleRate___block_invoke;
  v5[3] = &unk_1E9E52350;
  v5[4] = self;
  *(double *)&v5[5] = a4;
  v6 = a3;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __52__VCAudioManager_refreshRemoteCodecType_sampleRate___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  int v4;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "audioUnitType");
  if ((_DWORD)result == 1)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(v3 + 184);
    if (v4 == 3 || v4 == 2 && *(_BYTE *)(v3 + 255))
    {
      objc_msgSend(*(id *)(v3 + 200), "setRemoteCodecSampleRate:", *(double *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 200), "setRemoteCodecType:", *(unsigned int *)(a1 + 48));
      return AUIOSetRemoteCodecInfo(*(double *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), *(_DWORD *)(a1 + 48));
    }
  }
  return result;
}

- (BOOL)startAudioSessionWithProperties:(id)a3
{
  const __CFString *v5;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCAudioManager *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[VCAudioManager setCurrentAudioSessionMediaProperties:](self, "setCurrentAudioSessionMediaProperties:");
  if (!-[VCAudioSessionMediaProperties isSessionActive](self->_currentAudioSessionMediaProperties, "isSessionActive"))
    return 1;
  v15 = 0;
  if (self->_playbackMode == 1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136315650;
      v19 = v7;
      v20 = 2080;
      v21 = "-[VCAudioManager startAudioSessionWithProperties:]";
      v22 = 1024;
      v23 = 2487;
      v9 = " [%s] %s:%d Setting kCMSessionProperty_IsExpanseCallSession";
      v10 = v8;
      v11 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_15;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316162;
      v19 = v12;
      v20 = 2080;
      v21 = "-[VCAudioManager startAudioSessionWithProperties:]";
      v22 = 1024;
      v23 = 2487;
      v24 = 2112;
      v25 = v5;
      v26 = 2048;
      v27 = self;
      v9 = " [%s] %s:%d %@(%p) Setting kCMSessionProperty_IsExpanseCallSession";
      v10 = v13;
      v11 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_15:
    v14 = +[VCAudioSession sharedVoiceChatInstance](VCAudioSession, "sharedVoiceChatInstance");
    v16 = *MEMORY[0x1E0D498C0];
    v17 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v14, "updateAudioSessionPropertiesWithProperties:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  }
  return -[VCAudioSession startClient:clientType:mediaProperties:sessionRef:](self->_audioSession, "startClient:clientType:mediaProperties:sessionRef:", self, 1, a3, &v15);
}

- (BOOL)resetAudioSessionWithProperties:(id)a3 interruptSuccessful:(BOOL *)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  _BOOL4 v17;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  double v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCAudioManager *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
        {
          objc_msgSend(a3, "outputFormat");
          v10 = (int)v22;
        }
        else
        {
          v10 = 0;
        }
        *(_DWORD *)buf = 136315906;
        v24 = v8;
        v25 = 2080;
        v26 = "-[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:]";
        v27 = 1024;
        v28 = 2500;
        v29 = 1024;
        LODWORD(v30) = v10;
        v14 = " [%s] %s:%d sampleRate=%d";
        v15 = v9;
        v16 = 34;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (a3)
        {
          objc_msgSend(a3, "outputFormat");
          v13 = (int)*(double *)&v19;
        }
        else
        {
          v13 = 0;
          v21 = 0;
          v19 = 0u;
          v20 = 0u;
        }
        *(_DWORD *)buf = 136316418;
        v24 = v11;
        v25 = 2080;
        v26 = "-[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:]";
        v27 = 1024;
        v28 = 2500;
        v29 = 2112;
        v30 = v7;
        v31 = 2048;
        v32 = self;
        v33 = 1024;
        v34 = v13;
        v14 = " [%s] %s:%d %@(%p) sampleRate=%d";
        v15 = v12;
        v16 = 54;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
  }
  if (objc_msgSend(a3, "isSessionActive", v19, v20, v21)
    && !-[VCAudioSession resetClient:mediaSetting:interruptSuccessful:](self->_audioSession, "resetClient:mediaSetting:interruptSuccessful:", self, a3, a4))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v17)
        return v17;
      -[VCAudioManager resetAudioSessionWithProperties:interruptSuccessful:].cold.1();
    }
    LOBYTE(v17) = 0;
  }
  else
  {
    -[VCAudioManager setCurrentAudioSessionMediaProperties:](self, "setCurrentAudioSessionMediaProperties:", a3);
    LOBYTE(v17) = 1;
  }
  return v17;
}

- (void)stopAudioSession
{
  if (-[VCAudioSessionMediaProperties isSessionActive](self->_currentAudioSessionMediaProperties, "isSessionActive"))
    -[VCAudioSession stopClient:](self->_audioSession, "stopClient:", self);
  -[VCAudioManager setCurrentAudioSessionMediaProperties:](self, "setCurrentAudioSessionMediaProperties:", 0);
}

- (BOOL)setupInterruptThread
{
  VCAudioRelay *v3;
  VCAudioRelayIO *v4;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  _BYTE v12[24];
  __int128 v13;
  VCAudioManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(VCAudioRelay);
  self->_interruptThread = v3;
  if (!v3)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioManager setupInterruptThread].cold.1();
      }
      goto LABEL_24;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_24;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_24;
    *(_DWORD *)v12 = 136316162;
    *(_QWORD *)&v12[4] = v8;
    *(_WORD *)&v12[12] = 2080;
    *(_QWORD *)&v12[14] = "-[VCAudioManager setupInterruptThread]";
    *(_WORD *)&v12[22] = 1024;
    LODWORD(v13) = 2529;
    WORD2(v13) = 2112;
    *(_QWORD *)((char *)&v13 + 6) = v6;
    HIWORD(v13) = 2048;
    v14 = self;
    v10 = " [%s] %s:%d %@(%p) Failed to allocate interrupt thread";
LABEL_27:
    _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v10, v12, 0x30u);
    goto LABEL_24;
  }
  v4 = objc_alloc_init(VCAudioRelayIO);
  self->_interruptThreadClient = v4;
  if (self->_interruptThread)
  {
    -[VCAudioRelayIO setMicCallback:](v4, "setMicCallback:", VCAudioManager_PushAudioSamples);
    -[VCAudioRelayIO setMicCallbackContext:](self->_interruptThreadClient, "setMicCallbackContext:", &self->_sinkData);
    -[VCAudioRelayIO setSpeakerCallback:](self->_interruptThreadClient, "setSpeakerCallback:", VCAudioManager_PullAudioSamples);
    -[VCAudioRelayIO setSpeakerCallbackContext:](self->_interruptThreadClient, "setSpeakerCallbackContext:", &self->_sourceData);
    if (-[VCAudioRelay setClientIO:withError:](self->_interruptThread, "setClientIO:withError:", self->_interruptThreadClient, 0))
    {
      return 1;
    }
    goto LABEL_24;
  }
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager setupInterruptThread].cold.2();
    }
    goto LABEL_24;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 136316162;
      *(_QWORD *)&v12[4] = v11;
      *(_WORD *)&v12[12] = 2080;
      *(_QWORD *)&v12[14] = "-[VCAudioManager setupInterruptThread]";
      *(_WORD *)&v12[22] = 1024;
      LODWORD(v13) = 2532;
      WORD2(v13) = 2112;
      *(_QWORD *)((char *)&v13 + 6) = v7;
      HIWORD(v13) = 2048;
      v14 = self;
      v10 = " [%s] %s:%d %@(%p) Failed to allocate interrupt thread client";
      goto LABEL_27;
    }
  }
LABEL_24:
  -[VCAudioManager cleanupInterruptThread](self, "cleanupInterruptThread", *(_OWORD *)v12, *(_QWORD *)&v12[16], v13, v14);
  return 0;
}

- (void)cleanupInterruptThread
{

  self->_interruptThreadClient = 0;
  self->_interruptThread = 0;
}

- (void)startInterruptThread
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to set the client IO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopInterruptThread
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  _BYTE v11[24];
  __int128 v12;
  VCAudioManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_interruptThreadState != 1)
  {
    if ((VCAudioManager *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)v11 = 136315650;
      *(_QWORD *)&v11[4] = v4;
      *(_WORD *)&v11[12] = 2080;
      *(_QWORD *)&v11[14] = "-[VCAudioManager stopInterruptThread]";
      *(_WORD *)&v11[22] = 1024;
      LODWORD(v12) = 2585;
      v6 = " [%s] %s:%d Stop the interrupt thread";
      v7 = v5;
      v8 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v3 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v3 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)v11 = 136316162;
      *(_QWORD *)&v11[4] = v9;
      *(_WORD *)&v11[12] = 2080;
      *(_QWORD *)&v11[14] = "-[VCAudioManager stopInterruptThread]";
      *(_WORD *)&v11[22] = 1024;
      LODWORD(v12) = 2585;
      WORD2(v12) = 2112;
      *(_QWORD *)((char *)&v12 + 6) = v3;
      HIWORD(v12) = 2048;
      v13 = self;
      v6 = " [%s] %s:%d %@(%p) Stop the interrupt thread";
      v7 = v10;
      v8 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v11, v8);
LABEL_13:
    -[VCAudioRelay stopClientIO](self->_interruptThread, "stopClientIO", *(_OWORD *)v11, *(_QWORD *)&v11[16], v12, v13);
    self->_interruptThreadState = 1;
  }
}

- (void)didSessionStop
{
  _opaque_pthread_mutex_t *p_interruptingMutex;
  NSObject *dispatchQueue;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  p_interruptingMutex = &self->_interruptingMutex;
  pthread_mutex_lock(&self->_interruptingMutex);
  self->_isInterrupting = 1;
  _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sinkData);
  _VCAudioManager_ProcessEventQueue((uint64_t)&self->_sourceData);
  pthread_mutex_unlock(p_interruptingMutex);
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__VCAudioManager_didSessionStop__block_invoke;
  v5[3] = &unk_1E9E521C0;
  v5[4] = self;
  dispatch_async(dispatchQueue, v5);
}

void __32__VCAudioManager_didSessionStop__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _BYTE v20[24];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v20 = 136315650;
        *(_QWORD *)&v20[4] = v3;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager didSessionStop]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2602;
        v5 = " [%s] %s:%d CMSession interrupt begin";
        v6 = v4;
        v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, v20, v7);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v20 = 136316162;
        *(_QWORD *)&v20[4] = v8;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager didSessionStop]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2602;
        WORD2(v21) = 2112;
        *(_QWORD *)((char *)&v21 + 6) = v2;
        HIWORD(v21) = 2048;
        v22 = v10;
        v5 = " [%s] %s:%d %@(%p) CMSession interrupt begin";
        v6 = v9;
        v7 = 48;
        goto LABEL_11;
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 255) = 1;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithAudioIOClient:", 0, *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, v22);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v20 = 136315650;
        *(_QWORD *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager didSessionStop]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2606;
        v14 = " [%s] %s:%d CMSession interrupt begin, audio manager is now paused";
        v15 = v13;
        v16 = 28;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, v20, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v20 = 136316162;
        *(_QWORD *)&v20[4] = v17;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager didSessionStop]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2606;
        WORD2(v21) = 2112;
        *(_QWORD *)((char *)&v21 + 6) = v11;
        HIWORD(v21) = 2048;
        v22 = v19;
        v14 = " [%s] %s:%d %@(%p) CMSession interrupt begin, audio manager is now paused";
        v15 = v18;
        v16 = 48;
        goto LABEL_22;
      }
    }
  }
}

- (void)didSessionEnd
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__VCAudioManager_didSessionEnd__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

void __31__VCAudioManager_didSessionEnd__block_invoke(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  uint32_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _BYTE v20[24];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v20 = 136315650;
        *(_QWORD *)&v20[4] = v3;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager didSessionEnd]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2612;
        v5 = " [%s] %s:%d CMSession interrupt end";
        v6 = v4;
        v7 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v5, v20, v7);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v2 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v20 = 136316162;
        *(_QWORD *)&v20[4] = v8;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager didSessionEnd]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2612;
        WORD2(v21) = 2112;
        *(_QWORD *)((char *)&v21 + 6) = v2;
        HIWORD(v21) = 2048;
        v22 = v10;
        v5 = " [%s] %s:%d %@(%p) CMSession interrupt end";
        v6 = v9;
        v7 = 48;
        goto LABEL_11;
      }
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 255) = 0;
  objc_msgSend(*(id *)(a1 + 32), "resetAudioSessionWithProperties:interruptSuccessful:", objc_msgSend(*(id *)(a1 + 32), "currentAudioSessionMediaProperties", *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, v22), 0);
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithAudioIOClient:", 0);
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v20 = 136315650;
        *(_QWORD *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager didSessionEnd]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2616;
        v14 = " [%s] %s:%d CMSession interrupt end, audio manager resume completed";
        v15 = v13;
        v16 = 28;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, v20, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v20 = 136316162;
        *(_QWORD *)&v20[4] = v17;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCAudioManager didSessionEnd]_block_invoke";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 2616;
        WORD2(v21) = 2112;
        *(_QWORD *)((char *)&v21 + 6) = v11;
        HIWORD(v21) = 2048;
        v22 = v19;
        v14 = " [%s] %s:%d %@(%p) CMSession interrupt end, audio manager resume completed";
        v15 = v18;
        v16 = 48;
        goto LABEL_22;
      }
    }
  }
}

- (void)serverDidDie
{
  NSObject *dispatchQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__VCAudioManager_serverDidDie__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(dispatchQueue, v3);
}

uint64_t __30__VCAudioManager_serverDidDie__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[128];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 216);
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v5++), "delegate"), "serverDidDie");
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v6, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  VCAudioManager *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((VCAudioManager *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioManager didUpdateBasebandCodec:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)-[VCAudioManager performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v7 = 136316162;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCAudioManager didUpdateBasebandCodec:]";
        v11 = 1024;
        v12 = 2644;
        v13 = 2112;
        v14 = v4;
        v15 = 2048;
        v16 = self;
        _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected SPI call", (uint8_t *)&v7, 0x30u);
      }
    }
  }
}

- (int)setVolume:(float)a3 withRampTime:(float)a4
{
  NSObject *dispatchQueue;
  int v5;
  _QWORD v7[6];
  float v8;
  float v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__VCAudioManager_setVolume_withRampTime___block_invoke;
  v7[3] = &unk_1E9E52378;
  v7[4] = self;
  v7[5] = &v10;
  v8 = a3;
  v9 = a4;
  dispatch_sync(dispatchQueue, v7);
  v5 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __41__VCAudioManager_setVolume_withRampTime___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = AUIOSetDynamicDuckerVolume();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isGKVoiceChat
{
  return self->_isGKVoiceChat;
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->_isGKVoiceChat = a3;
}

- (BOOL)isMicrophoneMuted
{
  return self->_isMicrophoneMuted;
}

- (BOOL)isMixingVoiceWithMediaEnabled
{
  return self->_isMixingVoiceWithMediaEnabled;
}

- (BOOL)isSpeakerPhoneEnabled
{
  return self->_isSpeakerPhoneEnabled;
}

- (void)setSpeakerPhoneEnabled:(BOOL)a3
{
  self->_isSpeakerPhoneEnabled = a3;
}

- (VCAudioSessionMediaProperties)currentAudioSessionMediaProperties
{
  return self->_currentAudioSessionMediaProperties;
}

- (void)setCurrentAudioSessionMediaProperties:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 192);
}

- (VCAudioUnitProperties)currentAudioUnitProperties
{
  return self->_currentAudioUnitProperties;
}

- (void)setCurrentAudioUnitProperties:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 200);
}

- (BOOL)isInDaemon
{
  return self->_isInDaemon;
}

- (void)setIsInDaemon:(BOOL)a3
{
  self->_isInDaemon = a3;
}

- (NSDictionary)vpOperatingModeToAudioSessionMediaFormatMapping
{
  return self->_vpOperatingModeToAudioSessionMediaFormatMapping;
}

- (void)setVpOperatingModeToAudioSessionMediaFormatMapping:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 208);
}

- (void)initWithAudioSessionMode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate stateStrings array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to pass a valid audio session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the dispatch queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate client array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate starting IO client array", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate source event queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate sink event queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create allocate the spatial context dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.9()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create allocate the audio session muted dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.10()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the interrupt thread", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.11()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize sink data link list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithAudioSessionMode:.cold.12()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize source data link list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getAudioSessionMediaProperties:forVPOperatingMode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AudioComponentFindNext failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)getAudioSessionMediaProperties:forVPOperatingMode:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Get property failed (block size): %x", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager getAudioSessionMediaProperties:forVPOperatingMode:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)getAudioSessionMediaProperties:forVPOperatingMode:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AudioComponentInstanceNew failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startAUIOWithProperties:.cold.1()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCAudioManager startAUIOWithProperties:]";
  OUTLINED_FUNCTION_4();
  v5 = 1325;
  v6 = v0;
  v7 = 1325;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioManager.m:%d: Failed to create the audio limiter", v3);
  OUTLINED_FUNCTION_3();
}

- (void)startAUIOWithProperties:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioManager startAUIOWithProperties:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AUIOSetupFormats() failed. hResult=0x%08X", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager startAUIOWithProperties:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)startAUIOWithProperties:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioManager startAUIOWithProperties:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to register muted talker notification callback hResult=0x%08X", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager startAUIOWithProperties:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)startAUIOWithProperties:.cold.4()
{
  __int16 v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCAudioManager startAUIOWithProperties:]";
  OUTLINED_FUNCTION_4();
  v5 = 1327;
  v6 = v0;
  v7 = 1327;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCAudioManager.m:%d: Failed to start the audio limiter", v3);
  OUTLINED_FUNCTION_3();
}

- (void)startAUIOWithProperties:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d AUIO already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)resetAUIOWithProperties:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioManager resetAUIOWithProperties:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AUIOSetupFormat failed. result=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager resetAUIOWithProperties:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)resetAUIOWithProperties:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioManager resetAUIOWithProperties:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Receiver ready AUIO notification failed. result=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager resetAUIOWithProperties:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)registerClientIO:controllerIO:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)unregisterClientIO:controllerIO:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerForMutedTalkerNotification:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Muted talker notification handler is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __53__VCAudioManager_registerForMutedTalkerNotification___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Muted talker notification handler already registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__VCAudioManager_unregisterFromMutedTalkerNotification__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Muted talker notification handler not registered", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate audio session context for audioSessionId=%u", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

void __99__VCAudioManager_registerAudioSessionId_maxChannelCountMic_maxChannelCountSpeaker_spatialMetadata___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Session context for audioSessionId=%u is already registered", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __43__VCAudioManager_unregisterAudioSessionId___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Session context for audioSessionId=%u is not registered", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __70__VCAudioManager_setSpatialMetadata_audioSessionId_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Spatial context for audioSessionId=%u is not registered", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupVAD
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Incorrect playback mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;
  const char *v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AUIO receiver ready notification failed. result=%d", v3, v4, v5, v2);
  OUTLINED_FUNCTION_3();
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to resume AUIO. result=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d AUIO receiver ready notification failed. result=%d", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager stateRunningWithAudioUnitProperties:sessionProperties:client:newState:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to reset audio limiter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to reset AUIO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stateRunningWithAudioUnitProperties:sessionProperties:client:newState:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to reset audio session", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startClient:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Client is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __30__VCAudioManager_startClient___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  __int16 v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a2, "deviceRole");
  v8 = 136315906;
  v9 = a1;
  v10 = 2080;
  v11 = "-[VCAudioManager startClient:]_block_invoke";
  OUTLINED_FUNCTION_4();
  v12 = 2315;
  v13 = v5;
  v14 = v6;
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, a3, v7, " [%s] %s:%d Invalid device role: %d!", (uint8_t *)&v8);
}

void __30__VCAudioManager_startClient___block_invoke_cold_2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;
  int v5;
  const void *v6;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  LODWORD(v6) = 2326;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v1, v2, " [%s] %s:%d controller start client FAILED (audioIO=%p)", v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __30__VCAudioManager_startClient___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Client already registered!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stopClient:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Client is nil!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __29__VCAudioManager_stopClient___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d controller stop client FAILED (audioIO=%p)", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void __29__VCAudioManager_stopClient___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[40];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_12();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, " [%s] %s:%d controller stop client FAILED (audioIO=%p)", v1, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)updateSpatialAudioWithClient:settings:isClientRegistered:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]";
  OUTLINED_FUNCTION_4();
  LODWORD(v4) = 2404;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d controller update FAILED (audioIO=%p)", v2, *(const char **)v3, (unint64_t)"-[VCAudioManager updateSpatialAudioWithClient:settings:isClientRegistered:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)updateVoiceProcessingWithClient:settings:isClientRegistered:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d CMSimpleQueueEnqueue Full", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateClient:settings:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid parameter: client is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateClient:settings:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid parameter: settings is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)resetAudioSessionWithProperties:interruptSuccessful:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to reset audio client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupInterruptThread
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate interrupt thread client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)didUpdateBasebandCodec:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected SPI call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
