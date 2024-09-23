@implementation VCAudioStreamGroupCommon

- (VCAudioStreamGroupCommon)initWithConfig:(id)a3 audioCallback:(void *)a4 context:(void *)a5 audioDirection:(unsigned __int8)a6 stateQueue:(id)a7
{
  uint64_t v8;
  VCAudioStreamGroupCommon *v12;
  void *v13;
  OS_dispatch_queue *v14;
  tagVCMemoryPool *v15;
  uint64_t v17;
  NSObject *v18;
  objc_super v19;
  uint64_t v20;

  v8 = a6;
  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VCAudioStreamGroupCommon;
  v12 = -[VCObject init](&v19, sel_init);
  if (!v12)
    return v12;
  if (!+[VCAudioStreamGroupCommon isSupportedDirection:](VCAudioStreamGroupCommon, "isSupportedDirection:", v8))
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:].cold.6(v17, v8, v18);
    }
    return 0;
  }
  v13 = (void *)objc_msgSend(a3, "audioStreamGroupConfig");
  v12->_isMuted = objc_msgSend(v13, "isMuted");
  v12->_processID = objc_msgSend(v13, "processID");
  v12->_isGKVoiceChat = objc_msgSend(v13, "isGKVoiceChat");
  v12->_preferredIOSampleRate = objc_msgSend(v13, "preferredIOSampleRate");
  v12->_preferredIOSamplesPerFrame = objc_msgSend(v13, "preferredIOSamplesPerFrame");
  v12->_audioSessionID = objc_msgSend(v13, "audioSessionID");
  v12->_powerSpectrumStreamToken = objc_msgSend(v13, "powerSpectrumStreamToken");
  v12->_captionsToken = objc_msgSend(a3, "streamToken");
  v12->_captionsCoordinator = (VCAudioCaptionsCoordinator *)(id)objc_msgSend(v13, "captionsCoordinator");
  v12->_spatialAudioSourceID = objc_msgSend(v13, "spatialAudioSourceID");
  v12->_deviceRole = 0;
  v12->_participantUUID = (NSString *)(id)objc_msgSend(a3, "participantUUID");
  v12->_streamGroupID = objc_msgSend(a3, "streamGroupID");
  v12->_audioType = -[VCAudioStreamGroupCommon audioTypeForCaptureSource:](v12, "audioTypeForCaptureSource:", objc_msgSend(a3, "captureSource"));
  v12->_direction = v8;
  v12->_callback = a4;
  v12->_context = a5;
  v12->_maxChannelCount = 1;
  v12->_audioChannelIndex = objc_msgSend(v13, "audioChannelIndex");
  v12->_operatingMode = 6;
  -[VCObject setLogPrefix:](v12, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("streamGroupID=%s participantUUID=%@ "), FourccToCStr(v12->_streamGroupID), v12->_participantUUID));
  if (!a7)
  {
    v12->_stateQueue = 0;
LABEL_11:

    if (objc_opt_class())
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(0, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:].cold.2();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:].cold.1();
    }
    return 0;
  }
  v14 = (OS_dispatch_queue *)CFRetain(a7);
  v12->_stateQueue = v14;
  if (!v14)
    goto LABEL_11;
  v12->_syncDestinationList.slh_first = 0;
  CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 10, &v12->_syncDestinationChangeEventQueue);
  if (!v12->_syncDestinationChangeEventQueue)
  {

    if (objc_opt_class())
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(0, "performSelector:", sel_logPrefix);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:].cold.4();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:].cold.3();
    }
    return 0;
  }
  v15 = (tagVCMemoryPool *)VCMemoryPool_Create(0x10uLL);
  v12->_syncDestinationChangeEventPool = v15;
  if (!v15)
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:].cold.5();
    }
    return 0;
  }
  return v12;
}

- (NSString)description
{
  void *v3;
  NSString *v4;
  char *v5;
  const char *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)VCAudioStreamGroupCommon;
  v4 = -[VCAudioStreamGroupCommon description](&v8, sel_description);
  v5 = FourccToCStr(self->_streamGroupID);
  if (self->_direction == 2)
    v6 = "Send";
  else
    v6 = "Receive";
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@ streamGroupID=%s %s Group }"), v4, v5, v6);
}

- (unsigned)audioTypeForCaptureSource:(int)a3
{
  if (a3 > 0xA)
    return 1;
  else
    return dword_1D910925C[a3];
}

- (void)flushSyncDestinationUpdatesEventQueue
{
  void *v3;
  void *v4;

  v3 = (void *)CMSimpleQueueDequeue(self->_syncDestinationChangeEventQueue);
  if (v3)
  {
    v4 = v3;
    do
    {
      VCMemoryPool_Free((OSQueueHead *)self->_syncDestinationChangeEventPool, v4);
      v4 = (void *)CMSimpleQueueDequeue(self->_syncDestinationChangeEventQueue);
    }
    while (v4);
  }
}

- (void)dealloc
{
  OS_dispatch_queue *stateQueue;
  opaqueCMSimpleQueue *syncDestinationChangeEventQueue;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  VCAudioBufferList_Destroy((uint64_t *)&self->_sampleBuffer);

  self->_audioIO = 0;
  stateQueue = self->_stateQueue;
  if (stateQueue)
    CFRelease(stateQueue);
  -[VCAudioStreamGroupCommon cleanupStreams](self, "cleanupStreams");
  -[VCAudioStreamGroupCommon cleanupSyncDestinations](self, "cleanupSyncDestinations");
  -[VCAudioStreamGroupCommon cleanupPowerSpectrumSource](self, "cleanupPowerSpectrumSource");
  -[VCAudioStreamGroupCommon flushSyncDestinationUpdatesEventQueue](self, "flushSyncDestinationUpdatesEventQueue");
  VCMemoryPool_Destroy((OSQueueHead *)self->_syncDestinationChangeEventPool);
  syncDestinationChangeEventQueue = self->_syncDestinationChangeEventQueue;
  if (syncDestinationChangeEventQueue)
  {
    CFRelease(syncDestinationChangeEventQueue);
    self->_syncDestinationChangeEventQueue = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)VCAudioStreamGroupCommon;
  -[VCObject dealloc](&v5, sel_dealloc);
}

- (BOOL)setDeviceRole:(int)a3 operatingMode:(int)a4
{
  _BOOL4 v7;

  if (self->_deviceRole == a3 && self->_operatingMode == a4)
    goto LABEL_5;
  v7 = -[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:](self, "reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:", *(_QWORD *)&a3, *(_QWORD *)&a4);
  if (v7)
  {
    self->_deviceRole = a3;
    self->_operatingMode = a4;
LABEL_5:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (tagVCAudioStreamGroupStream)audioStreams
{
  return self->_audioStreams;
}

- (void)setPowerSpectrumEnabled:(BOOL)a3
{
  self->_isPowerSpectrumEnabled = a3;
}

- (BOOL)isPowerSpectrumEnabled
{
  return self->_isPowerSpectrumEnabled;
}

- (BOOL)configurePowerSpectrumSource
{
  VCAudioPowerSpectrumSource *v3;
  _BOOL4 v4;

  if (self->_audioPowerSpectrumSource)
    goto LABEL_4;
  v3 = -[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]([VCAudioPowerSpectrumSource alloc], "initWithStreamToken:delegate:", self->_powerSpectrumStreamToken, self);
  self->_audioPowerSpectrumSource = v3;
  if (v3)
  {
    -[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:](+[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance"), "registerAudioPowerMeterSource:", self->_audioPowerSpectrumSource);
LABEL_4:
    LOBYTE(v4) = 1;
    return v4;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v4)
      return v4;
    -[VCAudioStreamGroupCommon configurePowerSpectrumSource].cold.1();
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (void)cleanupPowerSpectrumSource
{
  VCAudioPowerSpectrumManager *v3;

  if (self->_audioPowerSpectrumSource)
  {
    v3 = +[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance");
    -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v3, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCAudioPowerSpectrumSource streamToken](self->_audioPowerSpectrumSource, "streamToken")));
    -[VCAudioPowerSpectrumSource invalidate](self->_audioPowerSpectrumSource, "invalidate");

    self->_audioPowerSpectrumSource = 0;
  }
}

- (void)initCodecConfigurationsForStream:(tagVCAudioStreamGroupStream *)a3 withDefaultAudioConfig:(id)a4
{
  void *v6;
  void *v7;

  a3->var10 = CFDictionaryCreateCopy(0, (CFDictionaryRef)objc_msgSend(a4, "codecConfigurations"));
  v6 = (void *)objc_msgSend(a4, "multiwayConfig");
  if (v6)
  {
    v7 = v6;
    if (objc_msgSend((id)objc_msgSend(v6, "v2CodecConfigurations"), "count"))
    {
      objc_msgSend(v7, "v2CodecConfigurations");
      a3->var12 = 1;
    }
    FigCFCreateCombinedDictionary();
  }
}

- (void)setupStreamsWithStreamInfos:(id)a3
{
  void *p_audioStreams;
  const __CFString *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  unsigned int maxChannelCount;
  uint64_t v28;
  NSObject *v29;
  unsigned int v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  VCAudioStreamGroupCommon *v40;
  __int16 v41;
  unsigned int v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  p_audioStreams = &self->_audioStreams;
  if (self->_audioStreams)
  {
    if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v31 = 136315650;
          v32 = v17;
          v33 = 2080;
          v34 = "-[VCAudioStreamGroupCommon setupStreamsWithStreamInfos:]";
          v35 = 1024;
          v36 = 252;
          v19 = " [%s] %s:%d Streams are already setup";
          v20 = v18;
          v21 = 28;
LABEL_35:
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v31, v21);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v31 = 136316162;
          v32 = v22;
          v33 = 2080;
          v34 = "-[VCAudioStreamGroupCommon setupStreamsWithStreamInfos:]";
          v35 = 1024;
          v36 = 252;
          v37 = 2112;
          v38 = v5;
          v39 = 2048;
          v40 = self;
          v19 = " [%s] %s:%d %@(%p) Streams are already setup";
          v20 = v23;
          v21 = 48;
          goto LABEL_35;
        }
      }
    }
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v45;
      v10 = 1;
      do
      {
        v11 = 0;
        v12 = p_audioStreams;
        do
        {
          if (*(_QWORD *)v45 != v9)
            objc_enumerationMutation(a3);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v11);
          p_audioStreams = malloc_type_malloc(0x50uLL, 0x10E00400BEC5DB2uLL);
          v14 = (void *)objc_msgSend(v13, "stream");
          *((_QWORD *)p_audioStreams + 5) = v14;
          *((_QWORD *)p_audioStreams + 2) = objc_msgSend(v14, "realtimeSourceContext");
          if (self->_direction == 1)
            *((_QWORD *)p_audioStreams + 3) = objc_msgSend(*((id *)p_audioStreams + 5), "pullSamplesCallback");
          v15 = (void *)objc_msgSend((id)objc_msgSend(v13, "streamConfigs"), "firstObject");
          v16 = (void *)objc_msgSend(v15, "multiwayConfig");
          *((_WORD *)p_audioStreams + 16) = objc_msgSend(v16, "idsStreamID");
          *((_WORD *)p_audioStreams + 17) = objc_msgSend(v16, "v2StreamID");
          *((_BYTE *)p_audioStreams + 8) = 0;
          *((_DWORD *)p_audioStreams + 12) = objc_msgSend(v16, "maxNetworkBitrate");
          *((_DWORD *)p_audioStreams + 13) = objc_msgSend(v16, "repairedMaxNetworkBitrate");
          *((_BYTE *)p_audioStreams + 9) = objc_msgSend(v15, "isRTCPEnabled");
          *(_QWORD *)p_audioStreams = 0;
          *v12 = p_audioStreams;
          -[VCAudioStreamGroupCommon initCodecConfigurationsForStream:withDefaultAudioConfig:](self, "initCodecConfigurationsForStream:withDefaultAudioConfig:", p_audioStreams, v15);
          if (v10 < objc_msgSend(v15, "channelCount"))
            v10 = objc_msgSend(v15, "channelCount");
          ++v11;
          v12 = p_audioStreams;
        }
        while (v8 != v11);
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 1;
    }
    self->_maxChannelCount = v10;
    _VCAudioStreamGroup_ApplyAudioPlayoutDelay((uint64_t)self);
    if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          maxChannelCount = self->_maxChannelCount;
          v31 = 136315906;
          v32 = v25;
          v33 = 2080;
          v34 = "-[VCAudioStreamGroupCommon setupStreamsWithStreamInfos:]";
          v35 = 1024;
          v36 = 282;
          v37 = 1024;
          LODWORD(v38) = maxChannelCount;
          v19 = " [%s] %s:%d updated _maxChannelCount to channel count: %d";
          v20 = v26;
          v21 = 34;
          goto LABEL_35;
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v30 = self->_maxChannelCount;
          v31 = 136316418;
          v32 = v28;
          v33 = 2080;
          v34 = "-[VCAudioStreamGroupCommon setupStreamsWithStreamInfos:]";
          v35 = 1024;
          v36 = 282;
          v37 = 2112;
          v38 = v24;
          v39 = 2048;
          v40 = self;
          v41 = 1024;
          v42 = v30;
          v19 = " [%s] %s:%d %@(%p) updated _maxChannelCount to channel count: %d";
          v20 = v29;
          v21 = 54;
          goto LABEL_35;
        }
      }
    }
  }
}

- (void)cleanupStreams
{
  tagVCAudioStreamGroupStream *i;
  __CFDictionary *var10;
  __CFDictionary *var11;

  for (i = self->_audioStreams; i; i = self->_audioStreams)
  {
    var10 = i->var10;
    if (var10)
      CFRelease(var10);
    var11 = i->var11;
    if (var11)
      CFRelease(var11);
    self->_audioStreams = i->var0;
    free(i);
  }
  self->_audioStreams = 0;
}

- (BOOL)configureAudioIOWithDeviceRole:(int)a3 operatingMode:(int)a4
{
  opaqueVCAudioBufferList **p_sampleBuffer;
  __int128 v8;
  unsigned int audioSessionID;
  unsigned int audioChannelIndex;
  int processID;
  unsigned int preferredIOSampleRate;
  unsigned int preferredIOSamplesPerFrame;
  unint64_t spatialAudioSourceID;
  id *(*v15)(uint64_t, uint64_t);
  VCAudioStreamGroupCommon *v16;
  int64_t captionsToken;
  VCAudioCaptionsCoordinator *captionsCoordinator;
  id *(*v19)(uint64_t, uint64_t);
  VCAudioStreamGroupCommon *v20;
  int64_t v21;
  VCAudioCaptionsCoordinator *v22;
  VCAudioIO *audioIO;
  const __CFString *v24;
  VCAudioIO *v25;
  const __CFString *v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  _BOOL4 v31;
  unsigned int audioType;
  unsigned int maxChannelCount;
  unsigned int v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  int v39;
  _BOOL4 v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  BOOL result;
  const __CFString *v45;
  const __CFString *v46;
  uint64_t v47;
  NSObject *v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  NSObject *v55;
  VCAudioIO *v56;
  int direction;
  unsigned int v58;
  uint64_t v59;
  NSObject *v60;
  VCAudioIO *v61;
  int v62;
  unsigned int v63;
  uint64_t v64;
  NSObject *v65;
  int v66;
  int v67;
  uint64_t v68;
  NSObject *v69;
  int v70;
  VCAudioIO *v71;
  VCAudioIO *loga;
  os_log_t log;
  opaqueVCAudioBufferList **v74;
  _DWORD v75[4];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint8_t buf[96];
  __int128 v90;
  __int128 v91;
  UInt32 v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  p_sampleBuffer = &self->_sampleBuffer;
  VCAudioBufferList_Destroy((uint64_t *)&self->_sampleBuffer);
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v87 = v8;
  v88 = v8;
  v85 = v8;
  v86 = v8;
  v83 = v8;
  v84 = v8;
  v81 = v8;
  v82 = v8;
  v79 = v8;
  v80 = v8;
  audioSessionID = self->_audioSessionID;
  v77 = v8;
  v78 = v8;
  audioChannelIndex = self->_audioChannelIndex;
  v76 = v8;
  v75[0] = audioSessionID;
  v75[1] = audioChannelIndex;
  v75[2] = a4;
  v75[3] = a3;
  LODWORD(v76) = self->_audioType;
  WORD2(v76) = self->_direction;
  processID = self->_processID;
  preferredIOSampleRate = self->_preferredIOSampleRate;
  *((_QWORD *)&v76 + 1) = self;
  preferredIOSamplesPerFrame = self->_preferredIOSamplesPerFrame;
  *(_QWORD *)&v77 = __PAIR64__(preferredIOSampleRate, processID);
  DWORD2(v77) = preferredIOSamplesPerFrame;
  spatialAudioSourceID = self->_spatialAudioSourceID;
  BYTE12(v77) = 0;
  *(_QWORD *)&v78 = spatialAudioSourceID;
  DWORD2(v78) = self->_maxChannelCount;
  *(_QWORD *)&v80 = 0;
  v79 = 0uLL;
  LOBYTE(preferredIOSampleRate) = self->_isVoiceActivityEnabled;
  BYTE8(v80) = self->_isMediaPriorityEnabled;
  BYTE9(v80) = preferredIOSampleRate;
  if (BYTE4(v76) == 1)
    v15 = VCAudioStreamGroup_ProcessAudioSamples;
  else
    v15 = 0;
  *(_QWORD *)&v81 = 0;
  *((_QWORD *)&v81 + 1) = v15;
  if (BYTE4(v76) == 1)
    v16 = self;
  else
    v16 = 0;
  *(_QWORD *)&v82 = v16;
  if (BYTE4(v76) == 1)
  {
    captionsToken = self->_captionsToken;
    captionsCoordinator = self->_captionsCoordinator;
  }
  else
  {
    captionsToken = 0;
    captionsCoordinator = 0;
  }
  *((_QWORD *)&v82 + 1) = captionsToken;
  *(_QWORD *)&v83 = captionsCoordinator;
  BYTE8(v83) = 0;
  v84 = 0uLL;
  if (BYTE4(v76) == 2)
    v19 = VCAudioStreamGroup_ProcessAudioSamples;
  else
    v19 = 0;
  if (BYTE4(v76) == 2)
    v20 = self;
  else
    v20 = 0;
  *(_QWORD *)&v85 = v19;
  *((_QWORD *)&v85 + 1) = v20;
  if (BYTE4(v76) == 2)
  {
    v21 = self->_captionsToken;
    v22 = self->_captionsCoordinator;
  }
  else
  {
    v21 = 0;
    v22 = 0;
  }
  *(_QWORD *)&v86 = v21;
  *((_QWORD *)&v86 + 1) = v22;
  LOBYTE(v87) = 1;
  *((_QWORD *)&v87 + 1) = 0;
  *(_QWORD *)&v88 = 0;
  WORD4(v88) = 0;
  audioIO = self->_audioIO;
  if (audioIO)
  {
    if (!-[VCAudioIO reconfigureWithConfig:](audioIO, "reconfigureWithConfig:", v75))
    {
      if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_68;
        v54 = VRTraceErrorLogLevelToCSTR();
        v55 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        v56 = self->_audioIO;
        direction = self->_direction;
        v58 = self->_audioChannelIndex;
        *(_DWORD *)buf = 136316930;
        *(_QWORD *)&buf[4] = v54;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 342;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = v56;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = a4;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = a3;
        *(_WORD *)&buf[50] = 1024;
        *(_DWORD *)&buf[52] = direction;
        *(_WORD *)&buf[56] = 1024;
        *(_DWORD *)&buf[58] = v58;
        v49 = " [%s] %s:%d Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d audioChannelIndex=%u";
        v50 = v55;
        v51 = 62;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v24 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v24 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_68;
        v59 = VRTraceErrorLogLevelToCSTR();
        v60 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        v61 = self->_audioIO;
        v62 = self->_direction;
        v63 = self->_audioChannelIndex;
        *(_DWORD *)buf = 136317442;
        *(_QWORD *)&buf[4] = v59;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 342;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v24;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = self;
        *(_WORD *)&buf[48] = 2048;
        *(_QWORD *)&buf[50] = v61;
        *(_WORD *)&buf[58] = 1024;
        *(_DWORD *)&buf[60] = a4;
        *(_WORD *)&buf[64] = 1024;
        *(_DWORD *)&buf[66] = a3;
        *(_WORD *)&buf[70] = 1024;
        *(_DWORD *)&buf[72] = v62;
        *(_WORD *)&buf[76] = 1024;
        *(_DWORD *)&buf[78] = v63;
        v49 = " [%s] %s:%d %@(%p) Failed to reconfigure: audioIO=%p operatingMode=%d deviceRole=%d direction=%d audioChannelIndex=%u";
        v50 = v60;
        v51 = 82;
      }
LABEL_67:
      _os_log_impl(&dword_1D8A54000, v50, OS_LOG_TYPE_DEFAULT, v49, buf, v51);
LABEL_68:

      result = 0;
      self->_audioIO = 0;
      return result;
    }
  }
  else
  {
    v25 = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", v75);
    self->_audioIO = v25;
    if (!v25)
    {
      if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_68;
        v64 = VRTraceErrorLogLevelToCSTR();
        v65 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        v66 = self->_direction;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v64;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 334;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = a4;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = a3;
        *(_WORD *)&buf[40] = 1024;
        *(_DWORD *)&buf[42] = v66;
        v49 = " [%s] %s:%d Failed to create audioIO. operatingMode=%d deviceRole=%d direction=%d";
        v50 = v65;
        v51 = 46;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v46 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v46 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_68;
        v67 = a4;
        v68 = VRTraceErrorLogLevelToCSTR();
        v69 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_68;
        v70 = self->_direction;
        *(_DWORD *)buf = 136316930;
        *(_QWORD *)&buf[4] = v68;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 334;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v46;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = self;
        *(_WORD *)&buf[48] = 1024;
        *(_DWORD *)&buf[50] = v67;
        *(_WORD *)&buf[54] = 1024;
        *(_DWORD *)&buf[56] = a3;
        *(_WORD *)&buf[60] = 1024;
        *(_DWORD *)&buf[62] = v70;
        v49 = " [%s] %s:%d %@(%p) Failed to create audioIO. operatingMode=%d deviceRole=%d direction=%d";
        v50 = v69;
        v51 = 66;
      }
      goto LABEL_67;
    }
    -[VCAudioIO setIsGKVoiceChat:](v25, "setIsGKVoiceChat:", self->_isGKVoiceChat);
    -[VCAudioStreamGroupCommon setMuted:](self, "setMuted:", self->_isMuted);
    v92 = 0;
    v90 = 0u;
    v91 = 0u;
    memset(buf, 0, sizeof(buf));
    AUIOGetAUNumber(&v92);
    -[VCAudioIO setFarEndVersionInfo:](self->_audioIO, "setFarEndVersionInfo:", buf);
  }
  v74 = p_sampleBuffer;
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    v27 = a3;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        loga = self->_audioIO;
        v30 = self->_direction;
        v31 = -[VCAudioStreamGroupCommon isMuted](self, "isMuted");
        audioType = self->_audioType;
        maxChannelCount = self->_maxChannelCount;
        v34 = self->_audioChannelIndex;
        *(_DWORD *)buf = 136317698;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 344;
        *(_WORD *)&buf[28] = 2048;
        *(_QWORD *)&buf[30] = loga;
        *(_WORD *)&buf[38] = 1024;
        *(_DWORD *)&buf[40] = a4;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = v27;
        *(_WORD *)&buf[50] = 1024;
        *(_DWORD *)&buf[52] = v30;
        *(_WORD *)&buf[56] = 1024;
        *(_DWORD *)&buf[58] = v31;
        *(_WORD *)&buf[62] = 1024;
        *(_DWORD *)&buf[64] = audioType;
        *(_WORD *)&buf[68] = 1024;
        *(_DWORD *)&buf[70] = maxChannelCount;
        *(_WORD *)&buf[74] = 1024;
        *(_DWORD *)&buf[76] = v34;
        v35 = " [%s] %s:%d configured audioIO=%p operatingMode=%d deviceRole=%d direction=%d isMuted=%d audioType=%d maxC"
              "hannelCount=%d audioChannelIndex=%u";
        v36 = v29;
        v37 = 80;
LABEL_36:
        _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v38 = VRTraceErrorLogLevelToCSTR();
      log = (os_log_t)*MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v71 = self->_audioIO;
        v39 = self->_direction;
        v40 = -[VCAudioStreamGroupCommon isMuted](self, "isMuted");
        v41 = self->_audioType;
        v42 = self->_maxChannelCount;
        v43 = self->_audioChannelIndex;
        *(_DWORD *)buf = 136318210;
        *(_QWORD *)&buf[4] = v38;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 344;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v26;
        *(_WORD *)&buf[38] = 2048;
        *(_QWORD *)&buf[40] = self;
        *(_WORD *)&buf[48] = 2048;
        *(_QWORD *)&buf[50] = v71;
        *(_WORD *)&buf[58] = 1024;
        *(_DWORD *)&buf[60] = a4;
        *(_WORD *)&buf[64] = 1024;
        *(_DWORD *)&buf[66] = a3;
        *(_WORD *)&buf[70] = 1024;
        *(_DWORD *)&buf[72] = v39;
        *(_WORD *)&buf[76] = 1024;
        *(_DWORD *)&buf[78] = v40;
        *(_WORD *)&buf[82] = 1024;
        *(_DWORD *)&buf[84] = v41;
        *(_WORD *)&buf[88] = 1024;
        *(_DWORD *)&buf[90] = v42;
        *(_WORD *)&buf[94] = 1024;
        LODWORD(v90) = v43;
        v35 = " [%s] %s:%d %@(%p) configured audioIO=%p operatingMode=%d deviceRole=%d direction=%d isMuted=%d audioType="
              "%d maxChannelCount=%d audioChannelIndex=%u";
        v36 = log;
        v37 = 100;
        goto LABEL_36;
      }
    }
  }
  VCAudioBufferList_AllocateFrame((uint64_t)-[VCAudioIO clientFormat](self->_audioIO, "clientFormat"), v74);
  if (!*v74)
  {
    if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_68;
      v47 = VRTraceErrorLogLevelToCSTR();
      v48 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_68;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v47;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 347;
      v49 = " [%s] %s:%d Failed to create sample buffer";
      v50 = v48;
      v51 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v45 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v45 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_68;
      v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_68;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v52;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 347;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v45;
      *(_WORD *)&buf[38] = 2048;
      *(_QWORD *)&buf[40] = self;
      v49 = " [%s] %s:%d %@(%p) Failed to create sample buffer";
      v50 = v53;
      v51 = 48;
    }
    goto LABEL_67;
  }
  return 1;
}

- (BOOL)reconfigureAudioIOIfNeededWithDeviceRole:(int)a3 operatingMode:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  __CFString *v8;
  BOOL v9;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
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
  VCAudioStreamGroupCommon *v28;
  uint64_t v29;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = dispatch_semaphore_create(0);
  if (-[VCAudioIO state](self->_audioIO, "state") == 2)
  {
    if (-[VCAudioIO stop](self->_audioIO, "stop"))
    {
      if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:].cold.3();
        }
        goto LABEL_9;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v12 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v12 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v19 = 136316162;
          v20 = v15;
          v21 = 2080;
          v22 = "-[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:]";
          v23 = 1024;
          v24 = 365;
          v25 = 2112;
          v26 = v12;
          v27 = 2048;
          v28 = self;
          v17 = " [%s] %s:%d %@(%p) stop audio IO failed";
LABEL_39:
          _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x30u);
        }
      }
LABEL_9:
      v9 = 1;
      goto LABEL_10;
    }
    if (-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:](self, "configureAudioIOWithDeviceRole:operatingMode:", v5, v4))
    {
      if (-[VCAudioIO start](self->_audioIO, "start"))
      {
        if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:].cold.1();
          }
          goto LABEL_9;
        }
        v8 = (objc_opt_respondsToSelector() & 1) != 0
           ? (__CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix)
           : &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v18 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v19 = 136316162;
            v20 = v18;
            v21 = 2080;
            v22 = "-[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:]";
            v23 = 1024;
            v24 = 372;
            v25 = 2112;
            v26 = v8;
            v27 = 2048;
            v28 = self;
            v17 = " [%s] %s:%d %@(%p) start audio IO failed";
            goto LABEL_39;
          }
        }
      }
      goto LABEL_9;
    }
  }
  else if (-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:](self, "configureAudioIOWithDeviceRole:operatingMode:", v5, v4))
  {
    goto LABEL_9;
  }
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:].cold.2();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v19 = 136316162;
        v20 = v13;
        v21 = 2080;
        v22 = "-[VCAudioStreamGroupCommon reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:]";
        v23 = 1024;
        v24 = 368;
        v25 = 2112;
        v26 = v11;
        v27 = 2048;
        v28 = self;
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) configure audio IO failed", (uint8_t *)&v19, 0x30u);
      }
    }
  }
  v9 = 0;
LABEL_10:
  dispatch_release(v7);
  return v9;
}

- (BOOL)addSyncDestination:(id)a3 shouldSchedule:(BOOL)a4
{
  if (a4)
    return -[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:](self, "enqueueSyncDestinationChangeEvent:eventType:", a3, 1);
  else
    return _VCAudioStreamGroup_AddSyncDestination((uint64_t)self, a3);
}

- (BOOL)removeSyncDestination:(id)a3 shouldSchedule:(BOOL)a4
{
  if (a4)
    return -[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:](self, "enqueueSyncDestinationChangeEvent:eventType:", a3, 2);
  else
    return _VCAudioStreamGroup_RemoveSyncDestination((uint64_t)self, (uint64_t)a3);
}

- (void)updateVoiceActivityEnabled:(BOOL)a3 isMediaPriorityEnabled:(BOOL)a4
{
  if (self->_isVoiceActivityEnabled != a3 || self->_isMediaPriorityEnabled != a4)
  {
    self->_isVoiceActivityEnabled = a3;
    self->_isMediaPriorityEnabled = a4;
    -[VCAudioIO updateVoiceActivityEnabled:isMediaPriorityEnabled:](self->_audioIO, "updateVoiceActivityEnabled:isMediaPriorityEnabled:", self->_isVoiceActivityEnabled);
  }
}

- (id)startCapture
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  VCAudioIO *audioIO;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  VCAudioIO *v12;
  _BYTE v14[24];
  __int128 v15;
  VCAudioStreamGroupCommon *v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->_audioIO;
        *(_DWORD *)v14 = 136316162;
        *(_QWORD *)&v14[4] = v4;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCAudioStreamGroupCommon startCapture]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 478;
        WORD2(v15) = 2048;
        *(_QWORD *)((char *)&v15 + 6) = self;
        HIWORD(v15) = 2048;
        v16 = (VCAudioStreamGroupCommon *)audioIO;
        v7 = " [%s] %s:%d (%p) starting audioIO=%p";
        v8 = v5;
        v9 = 48;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v14, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_audioIO;
        *(_DWORD *)v14 = 136316674;
        *(_QWORD *)&v14[4] = v10;
        *(_WORD *)&v14[12] = 2080;
        *(_QWORD *)&v14[14] = "-[VCAudioStreamGroupCommon startCapture]";
        *(_WORD *)&v14[22] = 1024;
        LODWORD(v15) = 478;
        WORD2(v15) = 2112;
        *(_QWORD *)((char *)&v15 + 6) = v3;
        HIWORD(v15) = 2048;
        v16 = self;
        *(_WORD *)v17 = 2048;
        *(_QWORD *)&v17[2] = self;
        *(_WORD *)&v17[10] = 2048;
        *(_QWORD *)&v17[12] = v12;
        v7 = " [%s] %s:%d %@(%p) (%p) starting audioIO=%p";
        v8 = v11;
        v9 = 68;
        goto LABEL_11;
      }
    }
  }
  return -[VCAudioIO start](self->_audioIO, "start", *(_OWORD *)v14, *(_QWORD *)&v14[16], v15, v16, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
}

- (id)stopCapture
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  VCAudioIO *audioIO;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  VCAudioIO *v12;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  _BYTE v22[24];
  __int128 v23;
  VCAudioStreamGroupCommon *v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        audioIO = self->_audioIO;
        *(_DWORD *)v22 = 136315906;
        *(_QWORD *)&v22[4] = v4;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VCAudioStreamGroupCommon stopCapture]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 489;
        WORD2(v23) = 2048;
        *(_QWORD *)((char *)&v23 + 6) = audioIO;
        v7 = " [%s] %s:%d Stopping audioIO=%p";
        v8 = v5;
        v9 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v22, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = self->_audioIO;
        *(_DWORD *)v22 = 136316418;
        *(_QWORD *)&v22[4] = v10;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VCAudioStreamGroupCommon stopCapture]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 489;
        WORD2(v23) = 2112;
        *(_QWORD *)((char *)&v23 + 6) = v3;
        HIWORD(v23) = 2048;
        v24 = self;
        LOWORD(v25) = 2048;
        *(_QWORD *)((char *)&v25 + 2) = v12;
        v7 = " [%s] %s:%d %@(%p) Stopping audioIO=%p";
        v8 = v11;
        v9 = 58;
        goto LABEL_11;
      }
    }
  }
  if (-[VCAudioIO state](self->_audioIO, "state", *(_OWORD *)v22, *(_QWORD *)&v22[16], v23, v24, v25) == 2)
    return -[VCAudioIO stop](self->_audioIO, "stop");
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)v22 = 136315650;
    *(_QWORD *)&v22[4] = v15;
    *(_WORD *)&v22[12] = 2080;
    *(_QWORD *)&v22[14] = "-[VCAudioStreamGroupCommon stopCapture]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 497;
    v17 = " [%s] %s:%d audioIO already stopped";
    v18 = v16;
    v19 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return 0;
    v20 = VRTraceErrorLogLevelToCSTR();
    v21 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)v22 = 136316162;
    *(_QWORD *)&v22[4] = v20;
    *(_WORD *)&v22[12] = 2080;
    *(_QWORD *)&v22[14] = "-[VCAudioStreamGroupCommon stopCapture]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 497;
    WORD2(v23) = 2112;
    *(_QWORD *)((char *)&v23 + 6) = v14;
    HIWORD(v23) = 2048;
    v24 = self;
    v17 = " [%s] %s:%d %@(%p) audioIO already stopped";
    v18 = v21;
    v19 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, v22, v19);
  return 0;
}

- (id)getAudioDumpName
{
  return 0;
}

- (void)setMuted:(BOOL)a3
{
  VCAudioIO *audioIO;

  self->_isMuted = a3;
  audioIO = self->_audioIO;
  if (audioIO)
  {
    if (self->_direction == 2)
      -[VCAudioIO setMuted:](audioIO, "setMuted:");
  }
}

- (BOOL)configureStreams:(id)a3 withRateControlConfig:(id)a4
{
  int deviceRole;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  id obj;
  uint64_t v23;
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  VCAudioStreamGroupCommon *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!-[VCAudioStreamGroupCommon configurePowerSpectrumSource](self, "configurePowerSpectrumSource", a3, a4))
  {
    if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioStreamGroupCommon configureStreams:withRateControlConfig:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v35 = v20;
          v36 = 2080;
          v37 = "-[VCAudioStreamGroupCommon configureStreams:withRateControlConfig:]";
          v38 = 1024;
          v39 = 550;
          v40 = 2112;
          v41 = v19;
          v42 = 2048;
          v43 = self;
          _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to configure the power spectrum source", buf, 0x30u);
        }
      }
    }
    goto LABEL_30;
  }
  -[VCAudioStreamGroupCommon setupStreamsWithStreamInfos:](self, "setupStreamsWithStreamInfos:", a3);
  if (!-[VCAudioStreamGroupCommon configureAudioIOWithDeviceRole:operatingMode:](self, "configureAudioIOWithDeviceRole:operatingMode:", self->_deviceRole, self->_operatingMode))
  {
LABEL_30:
    -[VCAudioStreamGroupCommon cleanupStreams](self, "cleanupStreams");
    -[VCAudioStreamGroupCommon cleanupPowerSpectrumSource](self, "cleanupPowerSpectrumSource");
    return 0;
  }
  deviceRole = self->_deviceRole;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  if (v7)
  {
    v8 = v7;
    obj = a3;
    v23 = *(_QWORD *)v31;
    if (deviceRole == 3)
      v9 = 6;
    else
      v9 = 5;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v12 = (void *)objc_msgSend(v11, "streamConfigs", obj);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v17, "setAudioStreamMode:", v9);
              objc_msgSend(v17, "setShouldApplyRedAsBoolean:", 1);
              objc_msgSend(v17, "setExternalIOFormat:", -[VCAudioIO clientFormat](self->_audioIO, "clientFormat"));
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
          }
          while (v14);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
    }
    while (v8);
  }
  return 1;
}

- (void)collectAndLogChannelMetrics:(id *)a3 averagePower:(float)a4
{
  tagVCAudioStreamGroupStream *audioStreams;
  double v7;
  __int128 v8;
  id var7;
  int v10;
  int v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  int v16;
  $630EEFBF570FF8F3C5E9582E2A557BD5 *v17;
  int v18;
  VCAudioIO *v19;
  unsigned int v20;
  unsigned int v21;
  NSObject *v22;
  const char *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  int v28;
  int v29;
  VCAudioIO *audioIO;
  unsigned int processedFramesCount;
  unsigned int v32;
  __int128 v33;
  int v34;
  const char *v35;
  const char *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  _BYTE v46[10];
  _BYTE v47[10];
  _BYTE v48[6];
  __int128 v49;
  _BYTE v50[6];
  double v51;
  __int16 v52;
  unsigned int v53;
  __int16 v54;
  int v55;
  _OWORD v56[5];
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  audioStreams = self->_audioStreams;
  if (audioStreams)
  {
    v7 = a4;
    *(_QWORD *)&v8 = 136317698;
    v33 = v8;
    do
    {
      var7 = audioStreams->var7;
      v57 = 0;
      memset(v56, 0, sizeof(v56));
      if (self->_direction == 2)
        objc_msgSend(var7, "collectTxChannelMetrics:", v56);
      else
        objc_msgSend(var7, "collectRxChannelMetrics:", v56);
      VCMediaChannelMetrics_Sum((uint64_t)a3, (uint64_t)v56);
      v10 = HIDWORD(v57);
      v11 = v10 - objc_msgSend(var7, "lastNoVoiceActivityPacketCount");
      objc_msgSend(var7, "setLastNoVoiceActivityPacketCount:", HIDWORD(v57));
      if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_20;
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        v27 = "Receive";
        if (self->_direction == 2)
          v27 = "Send";
        v36 = v27;
        v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(var7, "defaultStreamConfig", v33), "multiwayConfig"), "idsStreamID");
        v29 = v56[0];
        audioIO = self->_audioIO;
        processedFramesCount = self->_processedFramesCount;
        v32 = -[VCAudioIO state](audioIO, "state");
        *(_DWORD *)buf = v33;
        v38 = v25;
        v39 = 2080;
        v40 = "-[VCAudioStreamGroupCommon collectAndLogChannelMetrics:averagePower:]";
        v41 = 1024;
        v42 = 586;
        v43 = 2080;
        v44 = (const __CFString *)v36;
        v45 = 1024;
        *(_DWORD *)v46 = v28;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v29;
        *(_WORD *)v47 = 2048;
        *(_QWORD *)&v47[2] = audioIO;
        *(_WORD *)v48 = 1024;
        *(_DWORD *)&v48[2] = processedFramesCount;
        LOWORD(v49) = 2048;
        *(double *)((char *)&v49 + 2) = v7;
        WORD5(v49) = 1024;
        HIDWORD(v49) = v32;
        *(_WORD *)v50 = 1024;
        *(_DWORD *)&v50[2] = v11;
        v22 = v26;
        v23 = " [%s] %s:%d Health Monitor for Audio Stream %s Group streamID=%u audio=%ukbps VCAudioIO=%p procsCount=%u a"
              "veragePower=%f state=%d noVoiceActivityPacketCount=%u";
        v24 = 88;
      }
      else
      {
        v12 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v12 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() < 6)
          goto LABEL_20;
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        v15 = "Receive";
        if (self->_direction == 2)
          v15 = "Send";
        v35 = v15;
        v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(var7, "defaultStreamConfig", v33), "multiwayConfig"), "idsStreamID");
        v34 = v11;
        v17 = a3;
        v18 = v56[0];
        v19 = self->_audioIO;
        v20 = self->_processedFramesCount;
        v21 = -[VCAudioIO state](v19, "state");
        *(_DWORD *)buf = 136318210;
        v38 = v13;
        v39 = 2080;
        v40 = "-[VCAudioStreamGroupCommon collectAndLogChannelMetrics:averagePower:]";
        v41 = 1024;
        v42 = 586;
        v43 = 2112;
        v44 = v12;
        v45 = 2048;
        *(_QWORD *)v46 = self;
        *(_WORD *)&v46[8] = 2080;
        *(_QWORD *)v47 = v35;
        *(_WORD *)&v47[8] = 1024;
        *(_DWORD *)v48 = v16;
        *(_WORD *)&v48[4] = 1024;
        LODWORD(v49) = v18;
        a3 = v17;
        WORD2(v49) = 2048;
        *(_QWORD *)((char *)&v49 + 6) = v19;
        HIWORD(v49) = 1024;
        *(_DWORD *)v50 = v20;
        *(_WORD *)&v50[4] = 2048;
        v51 = v7;
        v52 = 1024;
        v53 = v21;
        v54 = 1024;
        v55 = v34;
        v22 = v14;
        v23 = " [%s] %s:%d %@(%p) Health Monitor for Audio Stream %s Group streamID=%u audio=%ukbps VCAudioIO=%p procsCou"
              "nt=%u averagePower=%f state=%d noVoiceActivityPacketCount=%u";
        v24 = 108;
      }
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
LABEL_20:
      audioStreams = audioStreams->var0;
    }
    while (audioStreams);
  }
}

- (BOOL)enqueueSyncDestinationChangeEvent:(id)a3 eventType:(int)a4
{
  _QWORD *v7;
  OSStatus v8;
  OSStatus v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCAudioStreamGroupCommon *v23;
  __int16 v24;
  OSStatus v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:].cold.1();
    }
    return 1;
  }
  v7 = VCMemoryPool_Alloc((OSQueueHead *)self->_syncDestinationChangeEventPool);
  v7[1] = a3;
  *(_DWORD *)v7 = a4;
  v8 = CMSimpleQueueEnqueue(self->_syncDestinationChangeEventQueue, v7);
  if (!v8)
    return 1;
  v9 = v8;
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:].cold.2();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = v11;
        v16 = 2080;
        v17 = "-[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:]";
        v18 = 1024;
        v19 = 600;
        v20 = 2112;
        v21 = v10;
        v22 = 2048;
        v23 = self;
        v24 = 1024;
        v25 = v9;
        _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error adding sync destination change event to the queue. error=%d", (uint8_t *)&v14, 0x36u);
      }
    }
  }
  VCMemoryPool_Free((OSQueueHead *)self->_syncDestinationChangeEventPool, v7);
  return 0;
}

- (void)didSuspendAudioIO:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  VCAudioStreamGroupCommon *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = v6;
        v15 = 2080;
        v16 = "-[VCAudioStreamGroupCommon didSuspendAudioIO:]";
        v17 = 1024;
        v18 = 611;
        v19 = 2048;
        v20 = a3;
        v8 = " [%s] %s:%d audioIO=%p";
        v9 = v7;
        v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316418;
        v14 = v11;
        v15 = 2080;
        v16 = "-[VCAudioStreamGroupCommon didSuspendAudioIO:]";
        v17 = 1024;
        v18 = 611;
        v19 = 2112;
        v20 = (id)v5;
        v21 = 2048;
        v22 = self;
        v23 = 2048;
        v24 = a3;
        v8 = " [%s] %s:%d %@(%p) audioIO=%p";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)didResumeAudioIO:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  VCAudioStreamGroupCommon *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCAudioStreamGroupCommon *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315906;
        v14 = v6;
        v15 = 2080;
        v16 = "-[VCAudioStreamGroupCommon didResumeAudioIO:]";
        v17 = 1024;
        v18 = 615;
        v19 = 2048;
        v20 = a3;
        v8 = " [%s] %s:%d audioIO=%p";
        v9 = v7;
        v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioStreamGroupCommon performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136316418;
        v14 = v11;
        v15 = 2080;
        v16 = "-[VCAudioStreamGroupCommon didResumeAudioIO:]";
        v17 = 1024;
        v18 = 615;
        v19 = 2112;
        v20 = (id)v5;
        v21 = 2048;
        v22 = self;
        v23 = 2048;
        v24 = a3;
        v8 = " [%s] %s:%d %@(%p) audioIO=%p";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (void)audioPowerSpectrumSinkDidRegister
{
  -[VCAudioStreamGroupCommon sendAudioPowerSpectrumSourceRegistration:](self, "sendAudioPowerSpectrumSourceRegistration:", 1);
}

- (void)audioPowerSpectrumSinkDidUnregister
{
  -[VCAudioStreamGroupCommon sendAudioPowerSpectrumSourceRegistration:](self, "sendAudioPowerSpectrumSourceRegistration:", 0);
}

- (void)sendAudioPowerSpectrumSourceRegistration:(BOOL)a3
{
  _BOOL8 v3;
  __CFDictionary *Mutable;

  v3 = a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("VCSPUUID"), self->_participantUUID);
  CFDictionaryAddValue(Mutable, CFSTR("VCSPAPSReg"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3));
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
  if (Mutable)
    CFRelease(Mutable);
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCAudioStreamGroupCommon didUpdateBasebandCodec:].cold.1();
  }
}

+ (BOOL)isSupportedDirection:(unsigned __int8)a3
{
  return (a3 - 1) < 2;
}

- (void)cleanupSyncDestinations
{
  VCAudioStreamGroupSyncDestinationList *p_syncDestinationList;
  tagVCAudioStreamGroupSyncDestination *slh_first;
  tagVCAudioStreamGroupSyncDestination *v4;
  VCAudioStreamGroupSyncDestinationList *v5;
  tagVCAudioStreamGroupSyncDestination *v6;
  tagVCAudioStreamGroupSyncDestination *v7;

  p_syncDestinationList = &self->_syncDestinationList;
  slh_first = self->_syncDestinationList.slh_first;
  if (slh_first)
  {
    do
    {
      v4 = p_syncDestinationList->slh_first;
      v5 = p_syncDestinationList;
      if (p_syncDestinationList->slh_first != slh_first)
      {
        do
        {
          v6 = v4;
          v4 = (tagVCAudioStreamGroupSyncDestination *)*((_QWORD *)v4 + 2);
        }
        while (v4 != slh_first);
        v5 = (VCAudioStreamGroupSyncDestinationList *)((char *)v6 + 16);
      }
      v7 = (tagVCAudioStreamGroupSyncDestination *)*((_QWORD *)slh_first + 2);
      v5->slh_first = v7;

      free(slh_first);
      slh_first = v7;
    }
    while (v7);
  }
}

- (BOOL)isMuted
{
  return self->_isMuted;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (VCAudioIO)audioIO
{
  return self->_audioIO;
}

- (unsigned)audioChannelIndex
{
  return self->_audioChannelIndex;
}

- (void)setAudioChannelIndex:(unsigned int)a3
{
  self->_audioChannelIndex = a3;
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (void)context
{
  return self->_context;
}

- (void)setContext:(void *)a3
{
  self->_context = a3;
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d State queue cannot be nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_6_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d %@(%p) State queue cannot be nil");
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create sync destination change event queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_6_1(&dword_1D8A54000, v0, v1, " [%s] %s:%d %@(%p) Failed to create sync destination change event queue");
}

- (void)initWithConfig:audioCallback:context:audioDirection:stateQueue:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create sync destination change event pool", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:(NSObject *)a3 audioCallback:context:audioDirection:stateQueue:.cold.6(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[22];

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, a2, a3, " [%s] %s:%d Invalid direction %d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCAudioStreamGroupCommon initWithConfig:audioCallback:context:audioDirection:stateQueue:]" >> 16, 100);
  OUTLINED_FUNCTION_3();
}

- (void)configurePowerSpectrumSource
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio power spectrum", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d start audio IO failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d configure audio IO failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)reconfigureAudioIOIfNeededWithDeviceRole:operatingMode:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stop audio IO failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)configureStreams:withRateControlConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to configure the power spectrum source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueSyncDestinationChangeEvent:eventType:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unexpected event type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)enqueueSyncDestinationChangeEvent:eventType:.cold.2()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  _BYTE v4[14];

  OUTLINED_FUNCTION_2();
  *(_WORD *)&v4[4] = v0;
  *(_QWORD *)&v4[6] = "-[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:]";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v1, v2, " [%s] %s:%d Error adding sync destination change event to the queue. error=%d", v3, *(const char **)v4, (unint64_t)"-[VCAudioStreamGroupCommon enqueueSyncDestinationChangeEvent:eventType:]" >> 16, 600);
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
