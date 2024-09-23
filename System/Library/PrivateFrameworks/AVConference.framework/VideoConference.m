@implementation VideoConference

- (VideoConference)initWithClientPid:(int)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  char *v13;
  void *v14;
  uint64_t v15;
  int AppBooleanValue;
  int v17;
  char v18;
  BOOL v19;
  VCAudioPowerLevelMonitor *v20;
  Boolean keyExistsAndHasValidFormat;
  objc_super v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  VideoConference *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if ((VideoConference *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v25 = v6;
        v26 = 2080;
        v27 = "-[VideoConference initWithClientPid:]";
        v28 = 1024;
        v29 = 288;
        v8 = "VideoConference [%s] %s:%d ";
        v9 = v7;
        v10 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VideoConference performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v25 = v11;
        v26 = 2080;
        v27 = "-[VideoConference initWithClientPid:]";
        v28 = 1024;
        v29 = 288;
        v30 = 2112;
        v31 = v5;
        v32 = 2048;
        v33 = self;
        v8 = "VideoConference [%s] %s:%d %@(%p) ";
        v9 = v12;
        v10 = 48;
        goto LABEL_11;
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)VideoConference;
  v13 = -[VCObject init](&v23, sel_init);
  *((_DWORD *)v13 + 42) = a3;
  v13[741] = 0;
  *((_QWORD *)v13 + 28) = +[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager");
  pthread_rwlock_init((pthread_rwlock_t *)(v13 + 232), 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
  *((_QWORD *)v13 + 54) = v14;
  *((_QWORD *)v13 + 55) = (id)objc_msgSend(v14, "allValues");
  *((_QWORD *)v13 + 56) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*((id *)v13 + 55), "count"));
  objc_msgSend(*((id *)v13 + 28), "addVideoConference:", v13);
  objc_msgSend(*((id *)v13 + 28), "setActiveConference:", v13);
  *((_QWORD *)v13 + 66) = 0;
  *((_QWORD *)v13 + 67) = 0;
  *((_QWORD *)v13 + 68) = 0;
  *((_DWORD *)v13 + 145) = 0;
  *((_DWORD *)v13 + 144) = 0;
  *((_QWORD *)v13 + 73) = objc_alloc_init(VCVideoRule);
  *((_QWORD *)v13 + 74) = objc_alloc_init(CameraConferenceSynchronizer);
  *((_QWORD *)v13 + 75) = 0;
  *((_DWORD *)v13 + 184) = 0;
  pthread_mutex_init((pthread_mutex_t *)(v13 + 608), 0);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 672), 0);
  v13[740] = 0;
  *((_DWORD *)v13 + 186) = 2;
  v13[748] = 0;
  v13[893] = 0;
  *((_QWORD *)v13 + 94) = 0;
  *((_QWORD *)v13 + 95) = 0;
  v13[892] = 1;
  *((_QWORD *)v13 + 97) = 0;
  *(_QWORD *)(v13 + 796) = 0;
  *(_QWORD *)(v13 + 804) = 0;
  *((_DWORD *)v13 + 198) = -1;
  *((_DWORD *)v13 + 208) = 1008981770;
  *((_DWORD *)v13 + 209) = 0;
  v13[840] = 0;
  *((_DWORD *)v13 + 211) = 0;
  *((_DWORD *)v13 + 212) = 1;
  v13[768] = 1;
  *((_DWORD *)v13 + 193) = 1065353216;
  v15 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)(v13 + 852) = *MEMORY[0x1E0CA2E18];
  *(_QWORD *)(v13 + 868) = *(_QWORD *)(v15 + 16);
  *((_DWORD *)v13 + 220) = 104;
  *((_DWORD *)v13 + 221) = 0;
  v13[894] = 0;
  v13[877] = 1;
  *((_DWORD *)v13 + 258) = 0;
  *((_DWORD *)v13 + 121) = -1024458752;
  *((_DWORD *)v13 + 120) = -1024458752;
  *((_QWORD *)v13 + 61) = VCUniqueIDGenerator_GenerateID();
  *((_QWORD *)v13 + 63) = -[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]([VCAudioPowerSpectrumSource alloc], "initWithStreamToken:delegate:", *((_QWORD *)v13 + 61), 0);
  -[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:](+[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance"), "registerAudioPowerMeterSource:", *((_QWORD *)v13 + 63));
  *((_QWORD *)v13 + 62) = VCUniqueIDGenerator_GenerateID();
  *((_QWORD *)v13 + 64) = -[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]([VCAudioPowerSpectrumSource alloc], "initWithStreamToken:delegate:", *((_QWORD *)v13 + 62), 0);
  -[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:](+[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance"), "registerAudioPowerMeterSource:", *((_QWORD *)v13 + 64));
  buf[0] = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("disableAudio"), CFSTR("com.apple.VideoConference"), buf);
  keyExistsAndHasValidFormat = 0;
  v17 = CFPreferencesGetAppBooleanValue(CFSTR("disableFacetimeTimeout"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (!buf[0] || (v18 = 0, !AppBooleanValue))
  {
    if (keyExistsAndHasValidFormat)
      v19 = v17 == 0;
    else
      v19 = 1;
    v18 = v19;
  }
  v13[895] = v18;
  v13[876] = 0;
  v13[896] = 0;
  v13[897] = 1;
  if (!v13[893] && (int)*MEMORY[0x1E0CF2740] <= 6)
    VRTraceSetErrorLogLevel();
  pthread_mutex_init((pthread_mutex_t *)(v13 + 912), 0);
  *((_QWORD *)v13 + 113) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", CFSTR("summaryType"), &unk_1E9EF5300, CFSTR("carrierType"), &unk_1E9EF5300, CFSTR("nonCarrierType"), 0);
  v13[1009] = 0;
  v13[1010] = 0;
  v13[1011] = 0;
  v13[1012] = 0;
  v13[1013] = 0;
  v13[1014] = 1;
  v13[1015] = 1;
  *((_DWORD *)v13 + 259) = 0;
  *((_DWORD *)v13 + 260) = 0;
  v20 = objc_alloc_init(VCAudioPowerLevelMonitor);
  *((_QWORD *)v13 + 123) = v20;
  -[VCAudioPowerLevelMonitor setDelegate:](v20, "setDelegate:", v13);
  *((_DWORD *)v13 + 254) = 0;
  *((_QWORD *)v13 + 128) = dispatch_queue_create("com.apple.VideoConference.Notification", 0);
  *((_QWORD *)v13 + 132) = 0;
  *((_DWORD *)v13 + 266) = 0;
  *((_QWORD *)v13 + 134) = 0;
  return (VideoConference *)v13;
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  VCAudioPowerSpectrumManager *v11;
  VCAudioPowerSpectrumManager *v12;
  uint64_t v13;
  NSObject *v14;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VideoConference *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((VideoConference *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VideoConference performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136316162;
    v17 = v9;
    v18 = 2080;
    v19 = "-[VideoConference dealloc]";
    v20 = 1024;
    v21 = 412;
    v22 = 2112;
    v23 = v3;
    v24 = 2048;
    v25 = self;
    v6 = "VideoConference [%s] %s:%d %@(%p) ";
    v7 = v10;
    v8 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v17 = v4;
      v18 = 2080;
      v19 = "-[VideoConference dealloc]";
      v20 = 1024;
      v21 = 412;
      v6 = "VideoConference [%s] %s:%d ";
      v7 = v5;
      v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  -[VideoConference cleanupQueues](self, "cleanupQueues");

  self->_vcMediaRecorder = 0;
  self->mutedPeers = 0;

  self->connectedPeers = 0;
  self->currentFocus = 0;

  self->_startedSessions = 0;
  self->_sessionDict = 0;

  self->_sessionArray = 0;
  self->natTypeDictionary = 0;
  VCFFTMeter_Destroy((uint64_t *)&self->_inputFFTMeter);
  VCFFTMeter_Destroy((uint64_t *)&self->_outputFFTMeter);

  self->_remoteAudioPowerLevelMonitor = 0;
  v11 = +[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance");
  -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v11, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCAudioPowerSpectrumSource streamToken](self->_inputAudioPowerSpectrumSource, "streamToken")));
  v12 = +[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance");
  -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v12, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCAudioPowerSpectrumSource streamToken](self->_outputAudioPowerSpectrumSource, "streamToken")));
  -[VCAudioPowerSpectrumSource invalidate](self->_inputAudioPowerSpectrumSource, "invalidate");

  -[VCAudioPowerSpectrumSource invalidate](self->_outputAudioPowerSpectrumSource, "invalidate");
  pthread_mutex_destroy(&self->natMutex);

  objc_sync_enter(self);
  -[GKNATObserver setDelegate:](self->natObserver, "setDelegate:", 0);

  self->natObserver = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v17 = v13;
      v18 = 2080;
      v19 = "-[VideoConference dealloc]";
      v20 = 1024;
      v21 = 449;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Tearing down the natObserver.", buf, 0x1Cu);
    }
  }
  objc_sync_exit(self);

  self->synchronizer = 0;
  self->conferenceCaptureRule = 0;
  pthread_mutex_destroy(&self->xRemoteLayer);
  pthread_mutex_destroy(&self->xAudioTS);
  pthread_rwlock_destroy(&self->stateLock);
  dispatch_release((dispatch_object_t)self->delegateNotificationQueue);
  objc_storeWeak(&self->delegate, 0);
  v15.receiver = self;
  v15.super_class = (Class)VideoConference;
  -[VCObject dealloc](&v15, sel_dealloc);
}

- (unsigned)initializeNewCallWithDeviceRole:(int)a3
{
  return -[VideoConference initializeNewCallWithDeviceRole:reportingHierarchyToken:](self, "initializeNewCallWithDeviceRole:reportingHierarchyToken:", *(_QWORD *)&a3, 0);
}

- (unsigned)initializeNewCallWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4
{
  uint64_t v5;
  NSObject *global_queue;
  id v8;
  _QWORD v10[6];

  v5 = *(_QWORD *)&a3;
  v10[5] = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__VideoConference_initializeNewCallWithDeviceRole_reportingHierarchyToken___block_invoke;
  v10[3] = &unk_1E9E521C0;
  v10[4] = self;
  dispatch_async(global_queue, v10);
  self->_deviceRole = v5;
  v8 = -[VideoConference newSessionWithDeviceRole:reportingHierarchyToken:](self, "newSessionWithDeviceRole:reportingHierarchyToken:", v5, a4);
  self->frontQueue = (VCImageQueue *)objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "newQueueForStreamToken:videoMode:", objc_msgSend(v8, "callID"), 0);
  self->backQueue = (VCImageQueue *)objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "newQueueForStreamToken:videoMode:", objc_msgSend(v8, "callID"), 1);
  self->screenQueue = (VCImageQueue *)objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "newQueueForStreamToken:videoMode:", objc_msgSend(v8, "callID"), 2);
  LODWORD(self) = objc_msgSend(v8, "callID");

  return self;
}

uint64_t __75__VideoConference_initializeNewCallWithDeviceRole_reportingHierarchyToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "warmupForCall");
}

- (id)newSessionWithDeviceRole:(int)a3 reportingHierarchyToken:(id)a4
{
  VCCallSession *v6;
  VCCallSession *v7;
  int ErrorLogLevelForModule;
  os_log_t *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSArray *sessionArray;
  const char *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = -[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:]([VCCallSession alloc], "initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:", *(_QWORD *)&a3, self->_transportType, BYTE1(self->downstreamBandwidth), a4);
  v7 = v6;
  if (!a3)
    -[VCCallSession setPreferredAudioCodec:](v6, "setPreferredAudioCodec:", *(unsigned int *)&self->disableVAD);
  -[VCCallSession setDelegate:](v7, "setDelegate:", self);
  -[VCCallSession setPacketsPerBundle:](v7, "setPacketsPerBundle:", self->packetsPerBundle);
  -[VCCallSession setUseCompressedConnectionData:](v7, "setUseCompressedConnectionData:", self->isGKVoiceChat);
  -[VCCallSession setRequiresWifi:](v7, "setRequiresWifi:", BYTE5(self->recvRTPTimeStamp.epoch));
  -[VCCallSession setNatType:](v7, "setNatType:", -[VideoConference natTypeForCallSessions:](self, "natTypeForCallSessions:", "newSession"));
  -[VCCallSession setQualityDelegate:](v7, "setQualityDelegate:", self->qualityDelegate);
  -[VCCallSession setShouldTimeoutPackets:](v7, "setShouldTimeoutPackets:", HIBYTE(self->downstreamBandwidth));
  if (self->conferenceOperatingMode)
    -[VCCallSession setOperatingMode:](v7, "setOperatingMode:");
  if (!BYTE1(self->downstreamBandwidth))
    -[VCCallSession setupBitrateNegotiation](v7, "setupBitrateNegotiation");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v9 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315906;
      v18 = v10;
      v19 = 2080;
      v20 = "-[VideoConference newSessionWithDeviceRole:reportingHierarchyToken:]";
      v21 = 1024;
      v22 = 520;
      v23 = 1024;
      LODWORD(v24) = -[VCCallSession requiresWifi](v7, "requiresWifi");
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d session.requiresWifi = %d", (uint8_t *)&v17, 0x22u);
    }
  }
  -[VideoConference wrlock](self, "wrlock");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sessionDict, "setObject:forKeyedSubscript:", v7, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCCallSession callID](v7, "callID")));

  self->_sessionArray = (NSArray *)(id)-[NSMutableDictionary allValues](self->_sessionDict, "allValues");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
    {
      sessionArray = self->_sessionArray;
      if (sessionArray)
        v15 = -[NSString UTF8String](-[NSArray description](sessionArray, "description"), "UTF8String");
      else
        v15 = "<nil>";
      v17 = 136315906;
      v18 = v12;
      v19 = 2080;
      v20 = "-[VideoConference newSessionWithDeviceRole:reportingHierarchyToken:]";
      v21 = 1024;
      v22 = 526;
      v23 = 2080;
      v24 = v15;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d New session array = %s", (uint8_t *)&v17, 0x26u);
    }
  }
  -[VideoConference unlock](self, "unlock");
  return v7;
}

- (void)cleanupManager
{
  -[VideoConferenceManager removeVideoConference:](self->manager, "removeVideoConference:", self);
}

- (void)sendARPLData:(id)a3 toCallID:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v4 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VideoConference unlock](self, "unlock");
  if (!v7 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VideoConference sendARPLData:toCallID:]";
      v16 = 1024;
      v17 = 543;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d >>>>> ERROR: VCCallSession is nil (in VideoConference) <<<<<", (uint8_t *)&v12, 0x1Cu);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = v10;
      v14 = 2080;
      v15 = "-[VideoConference sendARPLData:toCallID:]";
      v16 = 1024;
      v17 = 546;
      v18 = 1024;
      v19 = v4;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d >>>>> Relaying outgoing ARPL data from VideoConferenceManager to VCCallsession with callID=%d (in VideoConference) <<<<<", (uint8_t *)&v12, 0x22u);
    }
  }
  objc_msgSend(v7, "sendARPLData:toCallID:", a3, v4);
}

- (void)sendData:(id)a3 toCallID:(unsigned int)a4 encrypted:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v9;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  -[VideoConference rdlock](self, "rdlock");
  v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6));
  -[VideoConference unlock](self, "unlock");
  objc_msgSend(v9, "sendData:messageType:encrypted:", a3, 1, v5);
}

- (void)warmupForCall
{
  NSObject *global_queue;
  uint64_t v4;
  NSObject *v5;
  int v6;
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
  if (warmupForCall_sDispatchOnceVPInit != -1)
    dispatch_once(&warmupForCall_sDispatchOnceVPInit, &__block_literal_global_47);
  objc_sync_enter(self);
  if (!self->_isWarmedUp)
  {
    self->_isWarmedUp = 1;
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(global_queue, &__block_literal_global_34);
    if ((objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "enableLoopbackInterface") & 1) == 0)
    {
      if (!BYTE1(self->downstreamBandwidth))
      {
        if (self->_transportType == 1)
          +[VCServerBag clearBagWithRefreshIntervalInSeconds:](VCServerBag, "clearBagWithRefreshIntervalInSeconds:", 86400);
        +[VCServerBag pullStoreBagKeys](VCServerBag, "pullStoreBagKeys");
      }
      if (!self->_transportType)
      {
        -[VideoConference setupNATObserver](self, "setupNATObserver");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v4 = VRTraceErrorLogLevelToCSTR();
          v5 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v6 = BYTE5(self->recvRTPTimeStamp.epoch);
            v7 = 136315906;
            v8 = v4;
            v9 = 2080;
            v10 = "-[VideoConference warmupForCall]";
            v11 = 1024;
            v12 = 597;
            v13 = 1024;
            v14 = v6;
            _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d warmupForCall: Setting up the natObserver. (requiresWifi: %d)", (uint8_t *)&v7, 0x22u);
          }
        }
      }
    }
  }
  objc_sync_exit(self);
}

uint64_t __32__VideoConference_warmupForCall__block_invoke_2()
{
  CFPreferencesAppSynchronize(CFSTR("com.apple.VideoConference"));
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x1E0C9B248]);
  VRTraceReset();
  return VRTracePrintLoggingInfo();
}

- (void)setupNATObserver
{
  void *v3;
  GKNATObserver *v4;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v5 = 0;
  if (+[VCServerBag verifyRequiredKeys:](VCServerBag, "verifyRequiredKeys:", &v5)
    && setupNATObserver_onceToken != -1)
  {
    dispatch_once(&setupNATObserver_onceToken, &__block_literal_global_37);
  }
  v3 = (void *)MEMORY[0x1DF088A10]();
  v6[0] = CFSTR("checkTCPSSL");
  v6[1] = CFSTR("favorNonCar");
  v7[0] = MEMORY[0x1E0C9AAB0];
  v7[1] = MEMORY[0x1E0C9AAB0];
  v6[2] = CFSTR("addCarrier");
  v7[2] = MEMORY[0x1E0C9AAB0];
  v4 = -[GKNATObserver initWithOptions:]([GKNATObserver alloc], "initWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
  self->natObserver = v4;
  -[GKNATObserver setDelegate:](v4, "setDelegate:", self);
  objc_autoreleasePoolPop(v3);
}

void __35__VideoConference_setupNATObserver__block_invoke()
{
  if (GetSNATMAPServer() && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __35__VideoConference_setupNATObserver__block_invoke_cold_1();
  }
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *sessionArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  BYTE1(self->downstreamBandwidth) = a3;
  objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "setIsGKVoiceChat:", a3);
  -[VCAudioIO setIsGKVoiceChat:](self->_audioIO, "setIsGKVoiceChat:", v3);
  -[VideoConference rdlock](self, "rdlock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  sessionArray = self->_sessionArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(sessionArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setIsGKVoiceChat:", BYTE1(self->downstreamBandwidth));
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
  -[VideoConference unlock](self, "unlock");
}

- (int)natType
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[VideoConference natTypeForCallSessions:](self, "natTypeForCallSessions:", "natType");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = BYTE5(self->recvRTPTimeStamp.epoch);
      v8 = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VideoConference natType]";
      v12 = 1024;
      v13 = 643;
      v14 = 1024;
      v15 = v3;
      v16 = 1024;
      v17 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Getting natType: %d [requiresWifi: %d]", (uint8_t *)&v8, 0x28u);
    }
  }
  return v3;
}

- (double)packetLossRateForCallID:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  double result;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  -[VideoConference unlock](self, "unlock");
  objc_msgSend(v5, "packetLossRate");
  return result;
}

- (double)networkQualityForCallID:(unsigned int)a3
{
  uint64_t mostRecentStartedCall;
  double v5;
  double v6;

  mostRecentStartedCall = *(_QWORD *)&a3;
  if (!a3)
    mostRecentStartedCall = self->mostRecentStartedCall;
  -[VideoConference rdlock](self, "rdlock");
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", mostRecentStartedCall)), "networkQuality");
  v6 = v5;
  -[VideoConference unlock](self, "unlock");
  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->delegate, a3);
}

- (VideoConferenceDelegate)delegate
{
  return (VideoConferenceDelegate *)objc_loadWeak(&self->delegate);
}

- (void)setChatMode:(int)a3
{
  NSArray *sessionArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[VideoConference wrlock](self, "wrlock");
  self->chatMode = a3;
  if (a3 == 2)
  {
    LOBYTE(self->downstreamBandwidth) = 0;
  }
  else if (!a3)
  {
    BYTE4(self->recvRTPTimeStamp.epoch) = 0;
    LOBYTE(self->downstreamBandwidth) = 1;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    sessionArray = self->_sessionArray;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(sessionArray);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setUseRateControl:", 1);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      }
      while (v7);
    }
  }
  -[VideoConference unlock](self, "unlock");
}

- (void)setIsFocus:(BOOL)a3
{
  _BOOL4 v3;
  NSArray *sessionArray;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[VideoConference wrlock](self, "wrlock");
  if (!self->isFocus && v3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    sessionArray = self->_sessionArray;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(sessionArray);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isEqual:", self->currentFocusSession) & 1) == 0)
            VCAudioReceiver_DiscardQueueExcess(objc_msgSend(v11, "audioReceiver"));
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v8);
    }
  }
  self->isFocus = v3;
  -[VideoConference unlock](self, "unlock");
}

- (BOOL)isOutputMeteringEnabled
{
  return self->outputMeteringEnabled;
}

- (void)setOutputMeteringEnabled:(BOOL)a3
{
  self->outputMeteringEnabled = a3;
  -[VCAudioIO setOutputMeteringEnabled:](self->_audioIO, "setOutputMeteringEnabled:");
}

- (void)setIsUsingSuppression:(BOOL)a3
{
  BYTE2(self->downstreamBandwidth) = a3;
}

- (BOOL)isInputFrequencyMeteringEnabled
{
  return self->inputFrequencyMeteringEnabled;
}

- (void)setInputFrequencyMeteringEnabled:(BOOL)a3
{
  if (self->inputFrequencyMeteringEnabled != a3)
  {
    if (a3)
      self->_inputFFTMeter = (opaqueVCFFTMeter *)VCFFTMeter_Create();
    else
      VCFFTMeter_Destroy((uint64_t *)&self->_inputFFTMeter);
    self->inputFrequencyMeteringEnabled = a3;
  }
}

- (BOOL)isOutputFrequencyMeteringEnabled
{
  return self->outputFrequencyMeteringEnabled;
}

- (void)setOutputFrequencyMeteringEnabled:(BOOL)a3
{
  if (self->outputFrequencyMeteringEnabled != a3)
  {
    if (a3)
      self->_outputFFTMeter = (opaqueVCFFTMeter *)VCFFTMeter_Create();
    else
      VCFFTMeter_Destroy((uint64_t *)&self->_outputFFTMeter);
    self->outputFrequencyMeteringEnabled = a3;
  }
}

- (BOOL)isInputMeteringEnabled
{
  return self->inputMeteringEnabled;
}

- (void)setInputMeteringEnabled:(BOOL)a3
{
  self->inputMeteringEnabled = a3;
  -[VCAudioIO setInputMeteringEnabled:](self->_audioIO, "setInputMeteringEnabled:");
}

- (float)outputMeterLevel
{
  return self->outputMeterLevel;
}

- (float)inputMeterLevel
{
  return self->inputMeterLevel;
}

- (void)cleanupQueues
{
  _opaque_pthread_mutex_t *p_xRemoteLayer;

  p_xRemoteLayer = &self->xRemoteLayer;
  pthread_mutex_lock(&self->xRemoteLayer);

  self->frontQueue = 0;
  self->backQueue = 0;

  self->screenQueue = 0;
  pthread_mutex_unlock(p_xRemoteLayer);
}

- (id)connectionBlobForParticipantID:(id)a3 callID:(unsigned int *)a4 error:(id *)a5
{
  return (id)objc_msgSend(-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:](self, "inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:", a3, a4, 0, a5, 0.0), "objectForKeyedSubscript:", CFSTR("InviteDataConnectionBlob"));
}

- (id)inviteDataForParticipantID:(id)a3 callID:(unsigned int *)a4 remoteInviteData:(id)a5 nonCellularCandidateTimeout:(double)a6 error:(id *)a7
{
  unsigned int v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  int v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  NSObject *v36;
  _BYTE buf[12];
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BYTE v44[10];
  unsigned int *v45;
  __int16 v46;
  unsigned int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v13 = *a4;
  v14 = objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "enableLoopbackInterface");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v15;
      v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      v41 = 1024;
      v42 = 956;
      v43 = 1024;
      *(_DWORD *)v44 = v14;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d inviteDataForParticipantID skipReachingServers:%d", buf, 0x22u);
    }
  }
  if ((v14 & 1) != 0 || BYTE1(self->downstreamBandwidth))
  {
    +[VCServerBag verifyRequiredVoiceChatKeys:](VCServerBag, "verifyRequiredVoiceChatKeys:", 0);
  }
  else
  {
    +[VCServerBag pullStoreBagKeys](VCServerBag, "pullStoreBagKeys");
    *(_QWORD *)buf = 0;
    if (!+[VCServerBag verifyRequiredKeys:](VCServerBag, "verifyRequiredKeys:", buf)
      && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:].cold.1();
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v19 = *a4;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v17;
      v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      v41 = 1024;
      v42 = 971;
      v43 = 1024;
      *(_DWORD *)v44 = v19;
      _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d inviteDataForParticipantID:callID %d", buf, 0x22u);
    }
  }
  if (*a4)
  {
    -[VideoConference rdlock](self, "rdlock");
    v20 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a4));
    -[VideoConference unlock](self, "unlock");
    objc_msgSend(v20, "setRequiresWifi:", BYTE5(self->recvRTPTimeStamp.epoch));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = BYTE5(self->recvRTPTimeStamp.epoch);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v21;
        v39 = 2080;
        v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
        v41 = 1024;
        v42 = 989;
        v43 = 1024;
        *(_DWORD *)v44 = v23;
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d inviteDataForParticipantID: session.requiresWifi = %d", buf, 0x22u);
      }
    }
    if ((v14 & 1) != 0)
      v24 = 0;
    else
      v24 = -[VideoConference natTypeForCallSessions:](self, "natTypeForCallSessions:", "connectionBlobForParticipantID");
    objc_msgSend(v20, "setNatType:", v24);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_msgSend(v20, "callID");
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v27;
        v39 = 2080;
        v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
        v41 = 1024;
        v42 = 997;
        v43 = 1024;
        *(_DWORD *)v44 = v24;
        *(_WORD *)&v44[4] = 1024;
        *(_DWORD *)&v44[6] = v29;
        _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d inviteDataForParticipantID: Setting natType %d for callID %d", buf, 0x28u);
      }
    }
  }
  else
  {
    v20 = -[VideoConference newSessionWithDeviceRole:reportingHierarchyToken:](self, "newSessionWithDeviceRole:reportingHierarchyToken:", 0, 0);
    *a4 = objc_msgSend(v20, "callID");
    v26 = v20;
  }
  v25 = (void *)objc_msgSend(v20, "inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:", a3, a4, a5, a7, a6);
  if (v13 != *a4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v30;
      v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      v41 = 1024;
      v42 = 1007;
      v43 = 2048;
      *(_QWORD *)v44 = self;
      *(_WORD *)&v44[8] = 2048;
      v45 = a4;
      v46 = 1024;
      v47 = v13;
      _os_log_error_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_ERROR, "VideoConference [%s] %s:%d VideoConference: CALLID MISMATCH %p client callID %ld internal callID %u", buf, 0x36u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v25)
        v34 = (const char *)objc_msgSend((id)objc_msgSend(v25, "description"), "UTF8String");
      else
        v34 = "<nil>";
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v32;
      v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      v41 = 1024;
      v42 = 1010;
      v43 = 2080;
      *(_QWORD *)v44 = v34;
      _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Returning invite data: %s", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v35;
      v39 = 2080;
      v40 = "-[VideoConference inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
      v41 = 1024;
      v42 = 1012;
      _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d connection-data-returned", buf, 0x1Cu);
    }
  }
  return v25;
}

- (int)natTypeForCallSessions:(const char *)a3
{
  _opaque_pthread_mutex_t *p_natMutex;
  int v6;
  uint64_t v7;
  NSObject *v8;
  NSDictionary *natTypeDictionary;
  const char *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_natMutex = &self->natMutex;
  pthread_mutex_lock(&self->natMutex);
  if (-[NSDictionary objectForKeyedSubscript:](self->natTypeDictionary, "objectForKeyedSubscript:", CFSTR("summaryType")))
  {
    v6 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->natTypeDictionary, "objectForKeyedSubscript:", CFSTR("summaryType")), "unsignedLongValue");
  }
  else
  {
    v6 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      natTypeDictionary = self->natTypeDictionary;
      if (natTypeDictionary)
        v10 = -[NSString UTF8String](-[NSDictionary description](natTypeDictionary, "description"), "UTF8String");
      else
        v10 = "<nil>";
      v12 = 136316418;
      v13 = v7;
      v14 = 2080;
      v15 = "-[VideoConference natTypeForCallSessions:]";
      v16 = 1024;
      v17 = 1029;
      v18 = 2080;
      v19 = a3;
      v20 = 2080;
      v21 = v10;
      v22 = 1024;
      v23 = v6;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d natTypeForCallSessions(%s): natTypeDictionary %s. natType is %d.", (uint8_t *)&v12, 0x36u);
    }
  }
  pthread_mutex_unlock(p_natMutex);
  return v6;
}

- (void)notifyDelegateOfLocalVariablesChange
{
  NSObject *delegateNotificationQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__VideoConference_notifyDelegateOfLocalVariablesChange__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateNotificationQueue, v3);
}

uint64_t __55__VideoConference_notifyDelegateOfLocalVariablesChange__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didChangeLocalVariablesForCallID:", *(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1000));
  return result;
}

- (void)setRequiresWifi:(BOOL)a3
{
  int AppBooleanValue;
  BOOL v6;
  BOOL v7;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("requiresNoWifi"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v6 = AppBooleanValue == 0;
  else
    v6 = 1;
  v7 = v6 && a3;
  BYTE5(self->recvRTPTimeStamp.epoch) = v7;
  -[VideoConference notifyDelegateOfLocalVariablesChange](self, "notifyDelegateOfLocalVariablesChange");
}

- (id)callMetadataForCallID:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  -[VideoConference unlock](self, "unlock");
  return (id)objc_msgSend(v5, "callMetadata");
}

- (void)processRemoteIPChange:(id)a3 callID:(unsigned int)a4
{
  uint64_t v4;
  id v7;

  v4 = *(_QWORD *)&a4;
  -[VideoConference rdlock](self, "rdlock");
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VideoConference unlock](self, "unlock");
  objc_msgSend(v7, "processRemoteIPChange:callID:", a3, v4);
}

- (void)setUseViceroyBlobFormat:(BOOL)a3
{
  self->useViceroyBlobFormat = a3;
  if (a3)
    self->isGKVoiceChat = 1;
}

+ (void)terminateProcess:(id)a3 terminateSource:(id)a4 agent:(opaqueRTCReporting *)a5
{
  VCTerminateProcess((uint64_t)a3, a4, (uint64_t)a5);
}

- (void)mediaRecorder:(id)a3 shouldProcessRequest:(id)a4 recipientID:(id)a5
{
  uint64_t v7;
  NSObject *global_queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock", a3, a4, a5);
  v7 = -[NSMutableDictionary allValues](self->_sessionDict, "allValues");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VideoConference_mediaRecorder_shouldProcessRequest_recipientID___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = v7;
  block[5] = a4;
  dispatch_async(global_queue, block);
  -[VideoConference unlock](self, "unlock");
}

void __66__VideoConference_mediaRecorder_shouldProcessRequest_recipientID___block_invoke(uint64_t a1)
{
  size_t v2;
  NSObject *global_queue;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VideoConference_mediaRecorder_shouldProcessRequest_recipientID___block_invoke_2;
  block[3] = &unk_1E9E55E30;
  v5 = *(_OWORD *)(a1 + 32);
  dispatch_apply(v2, global_queue, block);
}

uint64_t __66__VideoConference_mediaRecorder_shouldProcessRequest_recipientID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2), "messageVCMomentsRequest:", *(_QWORD *)(a1 + 40));
}

- (void)vcAudioPowerLevelMonitor:(id)a3 isAudioBelowThreshold:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[VideoConference delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[VideoConferenceDelegate videoConference:isRemoteAudioBelowThreshold:](-[VideoConference delegate](self, "delegate"), "videoConference:isRemoteAudioBelowThreshold:", self, v4);
}

- (BOOL)getIsVideoPaused:(BOOL *)a3 callID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v9;

  v6 = *(_QWORD *)&a4;
  -[VideoConference rdlock](self, "rdlock");
  v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6));
  -[VideoConference unlock](self, "unlock");
  if (v9)
  {
    if (a3)
      *a3 = objc_msgSend(v9, "videoIsPaused");
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32004, 101, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1135), CFSTR("No CallID"), CFSTR("Called without a callID we know about"));
  }
  return v9 != 0;
}

- (BOOL)getIsAudioPaused:(BOOL *)a3 callID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  id v9;

  v6 = *(_QWORD *)&a4;
  -[VideoConference rdlock](self, "rdlock");
  v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6));
  -[VideoConference unlock](self, "unlock");
  if (v9)
  {
    if (a3)
      *a3 = objc_msgSend(v9, "audioIsPaused");
  }
  else
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32004, 102, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1168), CFSTR("No CallID"), CFSTR("Called without a callID we know about"));
  }
  return v9 != 0;
}

- (BOOL)shouldSendAudioForCallID:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  -[VideoConference unlock](self, "unlock");
  return objc_msgSend(v5, "shouldSendAudio");
}

- (void)setSendAudio:(BOOL)a3 forCallID:(unsigned int)a4
{
  uint64_t v4;
  _BOOL8 v5;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[VideoConference rdlock](self, "rdlock");
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4)), "setShouldSendAudio:", v5);
  -[VideoConference unlock](self, "unlock");
}

- (BOOL)setPauseAudio:(BOOL)a3 callID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  _BOOL8 v7;
  id v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  self->shouldResumeAudio = !v7;
  v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6));
  -[VideoConference unlock](self, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v9)
        v12 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
      else
        v12 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v15 = v10;
      v16 = 2080;
      v17 = "-[VideoConference setPauseAudio:callID:error:]";
      v18 = 1024;
      v19 = 1208;
      v20 = 2080;
      v21 = v12;
      v22 = 1024;
      v23 = v6;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setPauseAudio called...session = %s, callID = %d", buf, 0x2Cu);
    }
  }
  if (v9)
    return objc_msgSend(v9, "setPauseAudio:error:", v7, a5);
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32004, 103, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1218), CFSTR("No CallID"), CFSTR("Called without a callID we know about"));
  return 0;
}

- (BOOL)setPauseVideo:(BOOL)a3 callID:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  _BOOL8 v7;
  id v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  self->shouldResumeVideo = !v7;
  v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6));
  -[VideoConference unlock](self, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v9)
        v12 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
      else
        v12 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v15 = v10;
      v16 = 2080;
      v17 = "-[VideoConference setPauseVideo:callID:error:]";
      v18 = 1024;
      v19 = 1242;
      v20 = 2080;
      v21 = v12;
      v22 = 1024;
      v23 = v6;
      v24 = 1024;
      v25 = v7;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setPauseVideo called...session = %s, callID = %d, isPaused = %d", buf, 0x32u);
    }
  }
  if (v9)
    return objc_msgSend(v9, "setPauseVideo:error:", v7, a5);
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a5, 32004, 104, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1251), CFSTR("No CallID"), CFSTR("Called without a callID we know about"));
  return 0;
}

- (void)setPeerCN:(id)a3 callID:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v4 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VideoConference unlock](self, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v7)
      {
        v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
        if (a3)
        {
LABEL_5:
          v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
LABEL_8:
          v12 = 136316418;
          v13 = v8;
          v14 = 2080;
          v15 = "-[VideoConference setPeerCN:callID:]";
          v16 = 1024;
          v17 = 1265;
          v18 = 2080;
          v19 = v10;
          v20 = 2080;
          v21 = v11;
          v22 = 1024;
          v23 = v4;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setPeerCN: called...session = %s, peerCN = %s callID = %d", (uint8_t *)&v12, 0x36u);
          goto LABEL_9;
        }
      }
      else
      {
        v10 = "<nil>";
        if (a3)
          goto LABEL_5;
      }
      v11 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  objc_msgSend(v7, "setPeerCN:", a3);
}

- (void)setSessionID:(id)a3 callID:(unsigned int)a4
{
  uint64_t v4;
  id v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v4 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VideoConference unlock](self, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    goto LABEL_9;
  v8 = VRTraceErrorLogLevelToCSTR();
  v9 = *MEMORY[0x1E0CF2758];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    goto LABEL_9;
  if (!v7)
  {
    v10 = "<nil>";
    if (a3)
      goto LABEL_5;
LABEL_7:
    v11 = "<nil>";
    goto LABEL_8;
  }
  v10 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
  if (!a3)
    goto LABEL_7;
LABEL_5:
  v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
LABEL_8:
  v13 = 136316418;
  v14 = v8;
  v15 = 2080;
  v16 = "-[VideoConference setSessionID:callID:]";
  v17 = 1024;
  v18 = 1274;
  v19 = 2080;
  v20 = v10;
  v21 = 2080;
  v22 = v11;
  v23 = 1024;
  v24 = v4;
  _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setSessionID: called...session = %s, sessionID = %s callID = %d", (uint8_t *)&v13, 0x36u);
LABEL_9:
  if (a3)
    v12 = (const __CFString *)a3;
  else
    v12 = &stru_1E9E58EE0;
  objc_msgSend(v7, "setSessionID:", v12);
}

- (void)setPeerReportingID:(id)a3 sessionID:(id)a4 callID:(unsigned int)a5
{
  uint64_t v5;
  id v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const __CFString *v15;
  const __CFString *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v5 = *(_QWORD *)&a5;
  v31 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v9 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5));
  -[VideoConference unlock](self, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() < 7)
    goto LABEL_11;
  v10 = VRTraceErrorLogLevelToCSTR();
  v11 = *MEMORY[0x1E0CF2758];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    goto LABEL_11;
  if (a3)
  {
    v12 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
    if (v9)
      goto LABEL_5;
LABEL_8:
    v13 = "<nil>";
    if (a4)
      goto LABEL_6;
LABEL_9:
    v14 = "<nil>";
    goto LABEL_10;
  }
  v12 = "<nil>";
  if (!v9)
    goto LABEL_8;
LABEL_5:
  v13 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
  if (!a4)
    goto LABEL_9;
LABEL_6:
  v14 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
LABEL_10:
  v17 = 136316674;
  v18 = v10;
  v19 = 2080;
  v20 = "-[VideoConference setPeerReportingID:sessionID:callID:]";
  v21 = 1024;
  v22 = 1285;
  v23 = 2080;
  v24 = v12;
  v25 = 2080;
  v26 = v13;
  v27 = 2080;
  v28 = v14;
  v29 = 1024;
  v30 = v5;
  _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setPeerReportingID: called...peerReportingID = %s, session = %s, sessionID = %s callID = %d", (uint8_t *)&v17, 0x40u);
LABEL_11:
  if (a3)
    v15 = (const __CFString *)a3;
  else
    v15 = &stru_1E9E58EE0;
  objc_msgSend(v9, "setPeerReportingID:", v15);
  if (a4)
    v16 = (const __CFString *)a4;
  else
    v16 = &stru_1E9E58EE0;
  objc_msgSend(v9, "setSessionID:", v16);
}

- (void)updateRelayedCallType:(unsigned __int8)a3 forCallID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  -[VideoConference rdlock](self, "rdlock");
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VideoConference unlock](self, "unlock");
  objc_msgSend(v7, "updateRelayedCallType:", v5);
}

- (void)updateCapabilities:(id)a3 forSession:(id)a4
{
  int deviceRole;
  uint64_t v8;

  if (objc_msgSend(a4, "isAudioRunning"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VideoConference updateCapabilities:forSession:].cold.1();
    }
  }
  else
  {
    deviceRole = self->_deviceRole;
    if (deviceRole != objc_msgSend(a3, "deviceRole"))
    {
      self->lastSentAudioSampleTime = 0;
      if (objc_msgSend(a3, "isVideoEnabled"))
      {
        if (!-[VideoConference deregisterForVideoFramesWithDeviceRole:](self, "deregisterForVideoFramesWithDeviceRole:", self->_deviceRole)&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VideoConference updateCapabilities:forSession:].cold.3();
        }
        if (!-[VideoConference registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:](self, "registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:", objc_msgSend(a3, "deviceRole"), self->conferenceCaptureRule, 1)&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VideoConference updateCapabilities:forSession:].cold.2();
        }
      }
    }
    objc_msgSend(a4, "setCapabilities:", a3);
    -[VideoConference setUpAudioIO:callID:](self, "setUpAudioIO:callID:", objc_msgSend(a3, "deviceRole"), objc_msgSend(a4, "callID"));
    self->_deviceRole = objc_msgSend(a3, "deviceRole");
    if (objc_msgSend(a3, "isVideoEnabled"))
    {
      if (objc_msgSend(a3, "isVideoSourceScreen"))
        v8 = 4;
      else
        v8 = 1;
    }
    else if (objc_msgSend(a3, "isAudioEnabled"))
    {
      if (objc_msgSend(a3, "isHalfDuplexAudio"))
        v8 = 7;
      else
        v8 = 2;
    }
    else
    {
      v8 = 0;
    }
    -[VideoConference setConferenceOperatingMode:](self, "setConferenceOperatingMode:", v8);
  }
}

- (void)updateCapabilities:(id)a3 forCallID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v7;
  NSObject *v8;
  int deviceRole;
  id v10;
  int v11;
  _QWORD v12[7];
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  VideoConference *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v4 = *(_QWORD *)&a4;
  v27 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      deviceRole = self->_deviceRole;
      *(_DWORD *)buf = 136316674;
      v14 = v7;
      v15 = 2080;
      v16 = "-[VideoConference updateCapabilities:forCallID:]";
      v17 = 1024;
      v18 = 1335;
      v19 = 2048;
      v20 = self;
      v21 = 1024;
      v22 = v4;
      v23 = 2112;
      v24 = a3;
      v25 = 1024;
      v26 = deviceRole;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d self = %p, callID = %d, capabilities = %@, _deviceRole = %d", buf, 0x3Cu);
    }
  }
  -[VideoConference rdlock](self, "rdlock");
  v10 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VideoConference unlock](self, "unlock");
  v11 = self->_deviceRole;
  if (v11 == objc_msgSend(a3, "deviceRole") || !objc_msgSend(v10, "isAudioRunning"))
  {
    -[VideoConference updateCapabilities:forSession:](self, "updateCapabilities:forSession:", a3, v10);
  }
  else
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __48__VideoConference_updateCapabilities_forCallID___block_invoke;
    v12[3] = &unk_1E9E55E58;
    v12[4] = self;
    v12[5] = a3;
    v12[6] = v10;
    objc_msgSend(v10, "stopAudioWithCompletionHandler:", v12);
  }
}

uint64_t __48__VideoConference_updateCapabilities_forCallID___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateCapabilities:forSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 48), "startAudioWithCompletionHandler:", 0);
}

- (BOOL)shouldReinitializeCallWithDuration:(double)a3 forCallID:(unsigned int)a4
{
  uint64_t v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v7 = 0;
  -[VideoConference getIsAudioPaused:callID:error:](self, "getIsAudioPaused:callID:error:", &v8, *(_QWORD *)&a4, &v7);
  return a3 > 15.0 && v8 == 0;
}

- (void)setConferenceOperatingMode:(int)a3
{
  uint64_t v3;
  NSArray *sessionArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  VCMediaRecorder *vcMediaRecorder;
  BOOL v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v3 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[VideoConference wrlock](self, "wrlock");
  if (self->conferenceOperatingMode != (_DWORD)v3)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    sessionArray = self->_sessionArray;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(sessionArray);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "setOperatingMode:", v3);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v7);
    }
    v10 = -[NSArray firstObject](self->_sessionArray, "firstObject");
    vcMediaRecorder = self->_vcMediaRecorder;
    if ((_DWORD)v3 == 1)
    {
      if (!vcMediaRecorder)
      {
        self->_vcMediaRecorder = -[VCMediaRecorder initWithStreamToken:delegate:reportingAgent:]([VCMediaRecorder alloc], "initWithStreamToken:delegate:reportingAgent:", objc_msgSend(v10, "callID"), self, -[VCObject reportingAgent](self, "reportingAgent"));
        -[VCMediaRecorderManager registerMediaRecorder:withStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "registerMediaRecorder:withStreamToken:", self->_vcMediaRecorder, objc_msgSend(v10, "callID"));
      }
    }
    else if (vcMediaRecorder)
    {
      -[VCMediaRecorderManager unregisterMediaRecorderWithStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "unregisterMediaRecorderWithStreamToken:", objc_msgSend(v10, "callID"));

      self->_vcMediaRecorder = 0;
    }
    self->conferenceOperatingMode = v3;
  }
  v13 = (_DWORD)v3 != 2 && (_DWORD)v3 != 7;
  BYTE4(self->recvRTPTimeStamp.epoch) = v13;
  -[VideoConference unlock](self, "unlock");
  -[VideoConference notifyDelegateOfLocalVariablesChange](self, "notifyDelegateOfLocalVariablesChange");
}

- (int)conferenceOperatingMode
{
  int conferenceOperatingMode;

  -[VideoConference rdlock](self, "rdlock");
  conferenceOperatingMode = self->conferenceOperatingMode;
  -[VideoConference unlock](self, "unlock");
  return conferenceOperatingMode;
}

- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 oldCallID:(unsigned int)a5 usingInviteData:(id)a6 isCaller:(BOOL)a7 relayResponseDict:(id)a8 didOriginateRelayRequest:(BOOL)a9 capabilities:(id)a10 idsSocket:(int)a11 destination:(id)a12 error:(id *)a13
{
  self->lastActiveCall = a5;
  return -[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:](self, "startConnectionWithParticipantID:callID:usingInviteData:isCaller:relayResponseDict:didOriginateRelayRequest:capabilities:idsSocket:destination:error:", a3, *(_QWORD *)&a4, a6, a7, a8, a9);
}

- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 usingInviteData:(id)a5 isCaller:(BOOL)a6 relayResponseDict:(id)a7 didOriginateRelayRequest:(BOOL)a8 capabilities:(id)a9 idsSocket:(int)a10 destination:(id)a11 error:(id *)a12
{
  _BOOL8 v12;
  uint64_t v14;
  _BOOL4 v16;
  BOOL v17;

  v12 = a8;
  v14 = *(_QWORD *)&a4;
  v16 = -[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:](self, "startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:", a3, *(_QWORD *)&a4, a5, a6, a9, a10, a11, a12);
  v17 = v16;
  if (a7 && v16)
    -[VideoConference processRelayRequestResponse:responseDict:didOriginateRequest:](self, "processRelayRequestResponse:responseDict:didOriginateRequest:", v14, a7, v12);
  return v17;
}

- (void)setUpAudioIO:(int)a3 callID:(unsigned int)a4
{
  __int128 v7;
  VCAudioIO *audioIO;
  uint64_t v9;
  NSObject *v10;
  VCAudioIO *v11;
  int conferenceOperatingMode;
  unsigned int audioChannelIndex;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[64];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  VideoConference *v33;
  __int16 v34;
  VCAudioIO *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  unsigned int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  if (-[NSMutableArray count](self->_startedSessions, "count"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VideoConference setUpAudioIO:callID:].cold.1();
    }
  }
  else
  {
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v7;
    v23 = v7;
    v24 = v7;
    v25 = v7;
    *(_OWORD *)&v21[32] = v7;
    *(_OWORD *)&v21[48] = v7;
    *(_OWORD *)v21 = v7;
    *(_OWORD *)&v21[16] = v7;
    v19 = v7;
    v20 = v7;
    v17 = v7;
    v18 = v7;
    v16 = v7;
    v14 = __PAIR64__(self->_audioChannelIndex, a4);
    LODWORD(v15) = self->conferenceOperatingMode;
    HIDWORD(v15) = a3;
    LODWORD(v16) = 0;
    WORD2(v16) = 259;
    *((_QWORD *)&v16 + 1) = self;
    LODWORD(v17) = self->_clientPid;
    BYTE12(v17) = 0;
    *(_QWORD *)((char *)&v17 + 4) = 0;
    *(_QWORD *)&v18 = a4;
    DWORD2(v18) = 1;
    memset(&v21[8], 0, 48);
    v19 = 0uLL;
    WORD4(v20) = 0;
    *(_QWORD *)&v20 = 0;
    *(_QWORD *)v21 = self;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    *(_QWORD *)&v21[56] = self;
    *(_QWORD *)&v25 = 0;
    WORD4(v25) = 0;
    audioIO = self->_audioIO;
    if (audioIO)
    {
      -[VCAudioIO reconfigureWithConfig:](audioIO, "reconfigureWithConfig:", &v14);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v11 = self->_audioIO;
          conferenceOperatingMode = self->conferenceOperatingMode;
          audioChannelIndex = self->_audioChannelIndex;
          *(_DWORD *)buf = 136317186;
          v27 = v9;
          v28 = 2080;
          v29 = "-[VideoConference setUpAudioIO:callID:]";
          v30 = 1024;
          v31 = 1493;
          v32 = 2048;
          v33 = self;
          v34 = 2048;
          v35 = v11;
          v36 = 1024;
          v37 = conferenceOperatingMode;
          v38 = 1024;
          v39 = a3;
          v40 = 1024;
          v41 = BYTE4(v16);
          v42 = 1024;
          v43 = audioChannelIndex;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d (%p) reconfigured audioIO=%p operatingMode:%d deviceRole:%d direction:%d channelIndex=%u", buf, 0x48u);
        }
      }
    }
    else
    {
      self->_audioIO = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", &v14);
    }
    -[VCAudioIO setMuted:](self->_audioIO, "setMuted:", self->microphoneMuted, v14, v15, v16, v17, v18, v19, v20, *(_OWORD *)v21, *(_OWORD *)&v21[16], *(_OWORD *)&v21[32], *(_OWORD *)&v21[48], v22, v23, v24, v25);
    -[VCAudioIO setInputMeteringEnabled:](self->_audioIO, "setInputMeteringEnabled:", self->inputMeteringEnabled);
    -[VCAudioIO setOutputMeteringEnabled:](self->_audioIO, "setOutputMeteringEnabled:", self->outputMeteringEnabled);
  }
  -[VideoConference unlock](self, "unlock");
}

- (int)setupSpatialAudioWithCallID:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  int v6;
  int Entry;
  int v8;
  id v9;
  int v10;
  void *v11;
  void *spatialMetadata;
  CFTypeRef v14;
  CFTypeRef v15;
  CFTypeRef cf[2];

  v3 = *(_QWORD *)&a3;
  cf[1] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v15 = 0;
  cf[0] = 0;
  v14 = 0;
  if (!+[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"))
    return 0;
  v5 = *MEMORY[0x1E0C9AE00];
  v6 = VCSpatialAudioMetadata_Create((const __CFAllocator *)*MEMORY[0x1E0C9AE00], 32, 0, 0, (uint64_t *)cf);
  if (v6 < 0)
  {
    v10 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VideoConference setupSpatialAudioWithCallID:].cold.1();
    }
  }
  else
  {
    Entry = VCSpatialAudioMetadata_CreateEntry(v5, (uint64_t)cf[0], 0, (uint64_t *)&v15);
    if (Entry < 0)
    {
      v10 = Entry;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VideoConference setupSpatialAudioWithCallID:].cold.2();
      }
    }
    else
    {
      -[VideoConference wrlock](self, "wrlock");
      v8 = VCSpatialAudioMetadata_ChannelIndex((uint64_t)v15, &self->_audioChannelIndex);
      if (v8 < 0)
      {
        v10 = v8;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VideoConference setupSpatialAudioWithCallID:].cold.3();
        }
      }
      else
      {
        VCSpatialAudioMetadata_Serialize((uint64_t)cf[0], (CMBlockBufferRef *)&v14);
        v9 = +[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance");
        v10 = objc_msgSend(v9, "registerAudioSessionId:maxChannelCountMic:maxChannelCountSpeaker:spatialMetadata:", v3, 1, 32, v14);
        if (v10 < 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VideoConference setupSpatialAudioWithCallID:].cold.4();
          }
        }
        else
        {
          v11 = (void *)cf[0];
          self->_spatialMetadataEntry = (void *)v15;
          v15 = 0;
          spatialMetadata = self->_spatialMetadata;
          self->_spatialMetadata = v11;
          if (v11)
            CFRetain(v11);
          if (spatialMetadata)
            CFRelease(spatialMetadata);
          -[VideoConference unlock](self, "unlock");
        }
      }
    }
  }
  if (cf[0])
    CFRelease(cf[0]);
  if (v15)
    CFRelease(v15);
  if (v14)
    CFRelease(v14);
  return v10;
}

- (void)cleanupSpatialAudioForCallID:(unsigned int)a3
{
  uint64_t v3;
  void *spatialMetadataEntry;
  void *spatialMetadata;

  v3 = *(_QWORD *)&a3;
  if (+[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"))
  {
    spatialMetadataEntry = self->_spatialMetadataEntry;
    if (spatialMetadataEntry)
    {
      CFRelease(spatialMetadataEntry);
      self->_spatialMetadataEntry = 0;
    }
    self->_audioChannelIndex = 0;
    spatialMetadata = self->_spatialMetadata;
    if (spatialMetadata)
    {
      CFRelease(spatialMetadata);
      self->_spatialMetadata = 0;
    }
    objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "unregisterAudioSessionId:", v3);
  }
}

- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 usingInviteData:(id)a5 isCaller:(BOOL)a6 capabilities:(id)a7 idsSocket:(int)a8 destination:(id)a9 error:(id *)a10
{
  uint64_t v10;
  _BOOL4 v12;
  uint64_t v14;
  VCCallSession *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  BOOL v23;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v10 = *(_QWORD *)&a8;
  v38 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a7 || !a10)
  {
    if (a10)
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a10, 32016, 105, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), *(_QWORD *)&a4, a5, a6, a7, "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1563), CFSTR("Invalid Parameter"), CFSTR("Called with an invalid parameter"));
    close(v10);
    return 0;
  }
  v12 = a6;
  v14 = *(_QWORD *)&a4;
  if ((objc_msgSend(+[VCTestMonitorManager sharedManager](VCTestMonitorManager, "sharedManager"), "enableLoopbackInterface") & 1) == 0)
  {
    objc_sync_enter(self);
    -[GKNATObserver shouldTryNATCheck](self->natObserver, "shouldTryNATCheck");
    objc_sync_exit(self);
  }
  v27 = v12;
  -[VideoConference setupSpatialAudioWithCallID:](self, "setupSpatialAudioWithCallID:", v14);
  -[VideoConference updateCapabilities:forCallID:](self, "updateCapabilities:forCallID:", a7, v14);
  -[VideoConference rdlock](self, "rdlock");
  v17 = (VCCallSession *)(id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v14));
  if (objc_msgSend(a7, "isVideoEnabled"))
    self->mostRecentStartedCall = v14;
  self->shouldResumeVideo = objc_msgSend(a7, "isVideoPausedToStart") ^ 1;
  -[VideoConference unlock](self, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v17)
        v20 = -[NSString UTF8String](-[VCCallSession description](v17, "description"), "UTF8String");
      else
        v20 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v29 = v18;
      v30 = 2080;
      v31 = "-[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:de"
            "stination:error:]";
      v32 = 1024;
      v33 = 1594;
      v34 = 2080;
      v35 = v20;
      v36 = 1024;
      v37 = v14;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d startConnectionWithParticipantID called...session = %s, callID = %d", buf, 0x2Cu);
    }
  }
  pthread_mutex_lock(&self->xRemoteLayer);
  -[VCImageQueue stop](self->frontQueue, "stop");
  -[VCImageQueue stop](self->backQueue, "stop");
  -[VCImageQueue stop](self->screenQueue, "stop");
  pthread_mutex_unlock(&self->xRemoteLayer);
  if (!v17)
  {
    -[VideoConference cleanupSpatialAudioForCallID:](self, "cleanupSpatialAudioForCallID:", v14);
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a10, 32004, 106, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 1651), CFSTR("No CallID"), CFSTR("Called without a callID we know about"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v29 = v21;
        v30 = 2080;
        v31 = "-[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:"
              "destination:error:]";
        v32 = 1024;
        v33 = 1655;
        _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d startConnectionWithParticipantID-completed", buf, 0x1Cu);
      }
    }
    close(v10);
    return 0;
  }
  -[VideoConference setUpAudioIO:callID:](self, "setUpAudioIO:callID:", self->_deviceRole, v14);
  -[VideoConference wrlock](self, "wrlock");
  if (objc_msgSend(a3, "isEqual:", self->currentFocus))
    self->currentFocusSession = v17;
  -[VCCallSession setUseRateControl:](v17, "setUseRateControl:", LOBYTE(self->downstreamBandwidth));
  -[VideoConference unlock](self, "unlock");
  if (BYTE1(self->downstreamBandwidth))
    objc_msgSend(a7, "setIsRelayEnabled:", 0);
  else
    -[VideoConference setPacketsPerBundle:](self, "setPacketsPerBundle:", 1);
  v23 = -[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:](v17, "startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:", a3, v14, a5, v27, a7, v10, a9, a10);
  if (!BYTE1(self->downstreamBandwidth))
    -[VCCallSession startAWDStats](v17, "startAWDStats");
  if (!v23)
  {

    self->_audioIO = 0;
    -[VideoConference cleanupSpatialAudioForCallID:](self, "cleanupSpatialAudioForCallID:", v14);
  }
  self->dAudioHostTime = 0.0;
  self->dwAudioTS = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v25 = VRTraceErrorLogLevelToCSTR();
    v26 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v29 = v25;
      v30 = 2080;
      v31 = "-[VideoConference startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:de"
            "stination:error:]";
      v32 = 1024;
      v33 = 1643;
      _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d startConnectionWithParticipantID-completed", buf, 0x1Cu);
    }
  }
  return v23;
}

- (BOOL)setActive:(BOOL)a3
{
  -[VideoConferenceManager setActiveConference:](self->manager, "setActiveConference:", self);
  -[VideoConference notifyDelegateOfLocalVariablesChange](self, "notifyDelegateOfLocalVariablesChange");
  return 1;
}

- (void)setCurrentFocus:(id)a3
{
  VCCallSession *currentFocusSession;
  VCCallSession *v6;
  uint64_t v7;
  NSObject *v8;
  VCCallSession *v9;
  NSArray *sessionArray;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_t *v14;
  uint64_t i;
  VCCallSession *v16;
  uint64_t v17;
  NSObject *v18;
  VideoConference *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  VCCallSession *v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[VideoConference wrlock](self, "wrlock");

  self->currentFocus = (NSString *)a3;
  v19 = self;
  if (a3)
  {
    currentFocusSession = self->currentFocusSession;
    v6 = -[VideoConference sessionForParticipantID:](self, "sessionForParticipantID:", a3);
    self->currentFocusSession = v6;
    if ((-[VCCallSession isEqual:](currentFocusSession, "isEqual:", v6) & 1) == 0)
      VCAudioReceiver_DiscardQueueExcess((uint64_t)-[VCCallSession audioReceiver](self->currentFocusSession, "audioReceiver"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = self->currentFocusSession;
        *(_DWORD *)buf = 136315906;
        v21 = v7;
        v22 = 2080;
        v23 = "-[VideoConference setCurrentFocus:]";
        v24 = 1024;
        v25 = 1685;
        v26 = 2048;
        v27 = v9;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setCurrentFocus: updateLastReceivedPacket at client for session: %p", buf, 0x26u);
      }
    }
    -[VCCallSession updateLastReceivedPacket:packetType:](self->currentFocusSession, "updateLastReceivedPacket:packetType:", 1, 9);
  }
  else
  {
    self->currentFocusSession = 0;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    sessionArray = self->_sessionArray;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      v14 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(sessionArray);
          v16 = *(VCCallSession **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v17 = VRTraceErrorLogLevelToCSTR();
            v18 = *v14;
            if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              v21 = v17;
              v22 = 2080;
              v23 = "-[VideoConference setCurrentFocus:]";
              v24 = 1024;
              v25 = 1676;
              v26 = 2048;
              v27 = v16;
              _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d setCurrentFocus: updateLastReceivedPacket at focus for session: %p", buf, 0x26u);
            }
          }
          -[VCCallSession updateLastReceivedPacket:packetType:](v16, "updateLastReceivedPacket:packetType:", 1, 9);
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
      }
      while (v12);
    }
  }
  -[VideoConference unlock](v19, "unlock");
}

- (void)setQualityDelegate:(id)a3
{
  NSArray *sessionArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  self->qualityDelegate = (VideoConferenceChannelQualityDelegate *)a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  sessionArray = self->_sessionArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(sessionArray);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setQualityDelegate:", a3);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
  -[VideoConference unlock](self, "unlock");
}

- (VideoConferenceChannelQualityDelegate)qualityDelegate
{
  return self->qualityDelegate;
}

- (void)updatedMutedPeers:(id)a3 forParticipantID:(id)a4
{
  NSArray *sessionArray;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[VideoConference wrlock](self, "wrlock");
  if (a4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    sessionArray = self->_sessionArray;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(sessionArray);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v12, "remoteParticipantID"), "isEqualToString:", a4))
          {
            objc_msgSend(v12, "setMutedPeers:", a3);
            goto LABEL_13;
          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        if (v9)
          continue;
        break;
      }
    }
  }
  else
  {
    v13 = a3;

    self->mutedPeers = (NSArray *)a3;
  }
LABEL_13:
  -[VideoConference unlock](self, "unlock");
}

- (void)updatedConnectedPeers:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char *v11;
  NSUInteger v12;
  id v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[VideoConference wrlock](self, "wrlock");
  v19 = 0uLL;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      v10 = v7;
      v11 = (char *)&v19 + v7;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a3);
        v12 = -[NSArray indexOfObject:](self->connectedPeers, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
          v11[v9] = self->speakingArray[v12];
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      v7 = v10 + v9;
    }
    while (v6);
  }
  *(_OWORD *)self->speakingArray = v19;
  v13 = a3;

  self->connectedPeers = (NSArray *)a3;
  -[VideoConference unlock](self, "unlock");
}

- (void)stopAllCalls:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)-[NSArray copy](self->_sessionArray, "copy");
  -[VideoConference unlock](self, "unlock");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[VideoConference stopCallID:didRemoteCancel:error:](self, "stopCallID:didRemoteCancel:error:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "callID"), 0, a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v7);
  }

  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315650;
      v13 = v10;
      v14 = 2080;
      v15 = "-[VideoConference stopAllCalls:]";
      v16 = 1024;
      v17 = 1752;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d stopAllCalls-completed", (uint8_t *)&v12, 0x1Cu);
    }
  }
}

- (void)stopCallID:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[VideoConference stopCallID:didRemoteCancel:error:](self, "stopCallID:didRemoteCancel:error:", *(_QWORD *)&a3, 0, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VideoConference stopCallID:]";
      v9 = 1024;
      v10 = 1757;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d stopCallID-completed", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)cancelCallID:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[VideoConference cancelCallID:error:](self, "cancelCallID:error:", *(_QWORD *)&a3, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VideoConference cancelCallID:]";
      v9 = 1024;
      v10 = 1762;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d cancelCallID-completed", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)remoteCancelledCallID:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[VideoConference stopCallID:didRemoteCancel:error:](self, "stopCallID:didRemoteCancel:error:", *(_QWORD *)&a3, 1, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VideoConference remoteCancelledCallID:]";
      v9 = 1024;
      v10 = 1767;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d remoteCancelledCallID-completed", (uint8_t *)&v5, 0x1Cu);
    }
  }
}

- (void)setCallReport:(unsigned int)a3 withReport:(id)a4
{
  int v5;
  size_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a4, "lengthOfBytesUsingEncoding:", 4);
  if (v5)
  {
    v6 = (v5 + 1);
    if (v5 != -1)
      memset((char *)v9 - ((v6 + 15) & 0x1FFFFFFF0), 170, v6);
    objc_msgSend(a4, "getCString:maxLength:encoding:", (char *)v9 - ((v6 + 15) & 0x1FFFFFFF0), (int)v6, 4);
    if (*((_BYTE *)v9 - ((v6 + 15) & 0x1FFFFFFF0)))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", (char *)v9 - ((v6 + 15) & 0x1FFFFFFF0));
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v7, CFSTR("Report"), 0);

    }
    else
    {
      v8 = 0;
    }
    reportingClassSendMsgToServer();

  }
}

- (BOOL)isMicrophoneMuted
{
  return self->microphoneMuted;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  self->microphoneMuted = a3;
  -[VCAudioIO setMuted:](self->_audioIO, "setMuted:");
  -[VideoConference notifyDelegateOfLocalVariablesChange](self, "notifyDelegateOfLocalVariablesChange");
}

- (double)localFramerateForCallID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  double v6;
  double v7;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v3);
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v5), "sessionTransmittingFramerate");
  v7 = v6;

  -[VideoConference unlock](self, "unlock");
  return v7;
}

- (double)localBitrateForCallID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  double v6;
  double v7;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v3);
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v5), "sessionTransmittingBitrate");
  v7 = v6;

  -[VideoConference unlock](self, "unlock");
  return v7;
}

- (double)remoteFramerateForCallID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  double v6;
  double v7;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v3);
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v5), "sessionReceivingFramerate");
  v7 = v6;

  -[VideoConference unlock](self, "unlock");
  return v7;
}

- (double)remoteBitrateForCallID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  double v6;
  double v7;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v3);
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v5), "sessionReceivingBitrate");
  v7 = v6;

  -[VideoConference unlock](self, "unlock");
  return v7;
}

- (double)remotePacketLossRateForCallID:(unsigned int)a3
{
  uint64_t v3;
  float v5;
  double v6;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "packetLateAndMissingRatio");
  v6 = v5;
  -[VideoConference unlock](self, "unlock");
  return v6;
}

- (double)localPacketLossRateForCallID:(unsigned int)a3
{
  uint64_t v3;
  double v5;
  double v6;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "packetLossRate");
  v6 = v5;
  -[VideoConference unlock](self, "unlock");
  return v6;
}

- (double)roundTripTimeForCallID:(unsigned int)a3
{
  uint64_t v3;
  double v5;
  double v6;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "roundTripTime");
  v6 = v5;
  -[VideoConference unlock](self, "unlock");
  return v6;
}

- (CGSize)remoteFrameSizeForCallID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  v6 = (double)objc_msgSend(v5, "remoteFrameWidth");
  v7 = (double)objc_msgSend(v5, "remoteFrameHeight");
  -[VideoConference unlock](self, "unlock");
  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)statsForCallID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __CFString **v28;
  __CFString **v29;
  __CFString *v31;
  _QWORD v32[17];
  _QWORD v33[19];

  v3 = *(_QWORD *)&a3;
  v33[17] = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  objc_msgSend(v5, "roundTripTime");
  v7 = v6;
  objc_msgSend(v5, "packetLossRate");
  v9 = v8;
  objc_msgSend(v5, "packetLateAndMissingRatio");
  v11 = v10;
  objc_msgSend(v5, "sessionReceivingBitrate");
  v13 = v12;
  objc_msgSend(v5, "sessionReceivingFramerate");
  v15 = v14;
  objc_msgSend(v5, "sessionTransmittingBitrate");
  v17 = v16;
  objc_msgSend(v5, "sessionTransmittingFramerate");
  v19 = v18;
  v20 = objc_msgSend(v5, "remoteFrameWidth");
  v21 = objc_msgSend(v5, "remoteFrameHeight");
  v22 = objc_msgSend(v5, "primaryConnectionType");
  v23 = objc_msgSend(v5, "audioTierNetworkBitrate");
  v24 = objc_msgSend(v5, "audioTierAudioCodecBitrate");
  v25 = objc_msgSend(v5, "audioTierRedNumPayloads");
  v26 = objc_msgSend(v5, "audioTierPacketsPerBundle");
  v27 = objc_msgSend(v5, "audioTierPayload");
  -[VideoConference unlock](self, "unlock");
  v28 = AVConferenceConnectionTypeP2P;
  v29 = AVConferenceConnectionTypeRelayP2PUpgrade;
  if (v22 != 6)
    v29 = AVConferenceConnectionTypeRelay;
  if (v22 != 1)
    v28 = v29;
  v31 = *v28;
  v32[0] = CFSTR("LocalFrameHeight");
  v33[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VideoConference localFrameHeight](self, "localFrameHeight"));
  v32[1] = CFSTR("LocalFrameWidth");
  v33[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VideoConference localFrameWidth](self, "localFrameWidth"));
  v32[2] = CFSTR("RemoteFrameHeight");
  v33[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v21);
  v32[3] = CFSTR("RemoteFrameWidth");
  v33[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20);
  v32[4] = CFSTR("AudioTierNetworkBitrate");
  v33[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v23);
  v32[5] = CFSTR("AudioTierAudioBitrate");
  v33[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v24);
  v32[6] = CFSTR("AudioTierPacketsPerBundle");
  v33[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v26);
  v32[7] = CFSTR("AudioTierRedNumPayloads");
  v33[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v25);
  v32[8] = CFSTR("AudioTierPayload");
  v33[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
  v32[9] = CFSTR("RoundTripTime");
  v33[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
  v32[10] = CFSTR("LocalPacketLossRate");
  v33[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v32[11] = CFSTR("RemotePacketLossRate");
  v33[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v32[12] = CFSTR("RemoteBitRate");
  v33[12] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v32[13] = CFSTR("LocalBitRate");
  v33[13] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v32[14] = CFSTR("RemoteFrameRate");
  v33[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v32[15] = CFSTR("LocalFrameRate");
  v32[16] = CFSTR("AVConferenceConnectionType");
  v33[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v33[16] = v31;
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 17);
}

- (void)forceNoICE:(BOOL)a3
{
  self->forceNoICE = a3;
}

- (void)setPacketsPerBundle:(int)a3
{
  uint64_t v5;
  NSObject *v6;
  int packetsPerBundle;
  NSArray *sessionArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->packetsPerBundle != a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        packetsPerBundle = self->packetsPerBundle;
        *(_DWORD *)buf = 136316162;
        v19 = v5;
        v20 = 2080;
        v21 = "-[VideoConference setPacketsPerBundle:]";
        v22 = 1024;
        v23 = 1986;
        v24 = 1024;
        v25 = packetsPerBundle;
        v26 = 1024;
        v27 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference setPacketsPerBundle %d -> %d", buf, 0x28u);
      }
    }
    self->packetsPerBundle = a3;
    -[VideoConference rdlock](self, "rdlock");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    sessionArray = self->_sessionArray;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(sessionArray);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "setPacketsPerBundle:", self->packetsPerBundle);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v10);
    }
    -[VideoConference unlock](self, "unlock");
  }
}

- (void)setHasMic:(BOOL)a3
{
  _BOOL4 v3;
  VideoConferenceManager *manager;
  VideoConference *v6;

  v3 = a3;
  -[VideoConference wrlock](self, "wrlock");
  self->hasMic = v3;
  if (v3)
  {
    if (self->isTalking && -[VideoConferenceManager conferenceWithMic](self->manager, "conferenceWithMic") != self)
      -[VideoConferenceSpeakingDelegate didStartSpeaking:](self->speakingDelegate, "didStartSpeaking:", 0);
    -[VideoConference unlock](self, "unlock");
    manager = self->manager;
    v6 = self;
  }
  else
  {
    if (-[VideoConferenceManager conferenceWithMic](self->manager, "conferenceWithMic") != self)
    {
      -[VideoConference unlock](self, "unlock");
      return;
    }
    if (self->isTalking)
      -[VideoConferenceSpeakingDelegate didStopSpeaking:](self->speakingDelegate, "didStopSpeaking:", 0);
    -[VideoConference unlock](self, "unlock");
    manager = self->manager;
    v6 = 0;
  }
  -[VideoConferenceManager setConferenceWithMic:](manager, "setConferenceWithMic:", v6);
}

- (BOOL)hasMic
{
  return self->hasMic;
}

- (void)setConferenceVolume:(float)a3
{
  float v3;
  BOOL v4;
  float v5;

  v3 = 1.0;
  if (a3 <= 1.0)
    v3 = a3;
  v4 = a3 < 0.0;
  v5 = 0.0;
  if (!v4)
    v5 = v3;
  self->conferenceVolume = v5;
}

- (float)conferenceVolume
{
  return self->conferenceVolume;
}

- (void)setEnableSpeakerPhone:(BOOL)a3
{
  objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "setSpeakerPhoneEnabled:", a3);
}

- (BOOL)isSpeakerPhoneEnabled
{
  return objc_msgSend(+[VCAudioManager sharedVoiceChatInstance](VCAudioManager, "sharedVoiceChatInstance"), "isSpeakerPhoneEnabled");
}

- (void)processRelayRequestResponse:(unsigned int)a3 responseDict:(id)a4 didOriginateRequest:(BOOL)a5
{
  uint64_t v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *global_queue;
  _QWORD block[6];
  BOOL v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v7 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7));
  if (v9)
  {
    v10 = (void *)v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v17 = v11;
        v18 = 2080;
        v19 = "-[VideoConference processRelayRequestResponse:responseDict:didOriginateRequest:]";
        v20 = 1024;
        v21 = 2047;
        v22 = 2080;
        v23 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d processRelayRequestResponse:session %s", buf, 0x26u);
      }
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__VideoConference_processRelayRequestResponse_responseDict_didOriginateRequest___block_invoke;
    block[3] = &unk_1E9E52210;
    block[4] = v10;
    block[5] = a4;
    v15 = a5;
    dispatch_async(global_queue, block);
  }
  -[VideoConference unlock](self, "unlock");
}

uint64_t __80__VideoConference_processRelayRequestResponse_responseDict_didOriginateRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processRelayRequestResponseDict:didOriginateRequest:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)processRelayUpdate:(unsigned int)a3 updateDict:(id)a4 didOriginateRequest:(BOOL)a5
{
  uint64_t v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *global_queue;
  _QWORD block[6];
  BOOL v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v7 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7));
  if (v9)
  {
    v10 = (void *)v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v17 = v11;
        v18 = 2080;
        v19 = "-[VideoConference processRelayUpdate:updateDict:didOriginateRequest:]";
        v20 = 1024;
        v21 = 2068;
        v22 = 2080;
        v23 = objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d processRelayUpdate:session %s", buf, 0x26u);
      }
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__VideoConference_processRelayUpdate_updateDict_didOriginateRequest___block_invoke;
    block[3] = &unk_1E9E52210;
    block[4] = v10;
    block[5] = a4;
    v15 = a5;
    dispatch_async(global_queue, block);
  }
  -[VideoConference unlock](self, "unlock");
}

uint64_t __69__VideoConference_processRelayUpdate_updateDict_didOriginateRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processRelayUpdateDict:didOriginateRequest:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)handleCellTechChange:(int)a3 cellularMaxPktLen:(unsigned __int16)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_sessionArray);
  -[VideoConference unlock](self, "unlock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "handleCellularMTUChanged:", v4);
        objc_msgSend(v12, "handleCellTechChange:", v5);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v9);
  }

}

- (void)setPeerProtocolVersion:(unsigned int)a3 forCallID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VideoConference unlock](self, "unlock");
  objc_msgSend(v7, "setPeerProtocolVersion:", v5);
}

- (unsigned)powerFloatToInt:(float)a3
{
  int v4;

  if (a3 >= 0.0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    if (a3 < -120.0)
      a3 = -120.0;
    return (int)(float)(a3 * 2.0 + 255.0);
  }
  return v4;
}

- (float)powerIntToFloat:(unsigned __int8)a3
{
  float result;

  result = ((double)a3 + -255.0) * 0.5;
  if (((a3 + 1) & 0xFE) == 0)
    return NAN;
  return result;
}

- (void)didSuspendAudioIO:(id)a3
{
  uint64_t v4;
  NSObject *global_queue;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock", a3);
  v4 = -[NSMutableDictionary allValues](self->_sessionDict, "allValues");
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__VideoConference_didSuspendAudioIO___block_invoke;
  v6[3] = &unk_1E9E521C0;
  v6[4] = v4;
  dispatch_async(global_queue, v6);
  -[VideoConference unlock](self, "unlock");
}

void __37__VideoConference_didSuspendAudioIO___block_invoke(uint64_t a1)
{
  size_t v2;
  NSObject *global_queue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__VideoConference_didSuspendAudioIO___block_invoke_2;
  v4[3] = &unk_1E9E55E80;
  v4[4] = *(_QWORD *)(a1 + 32);
  dispatch_apply(v2, global_queue, v4);
}

uint64_t __37__VideoConference_didSuspendAudioIO___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  objc_msgSend(v2, "setSuspendAudio");
  return objc_msgSend(v2, "setSuspendVideo");
}

- (void)didResumeAudioIO:(id)a3
{
  uint64_t v4;
  NSObject *global_queue;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock", a3);
  v4 = -[NSMutableDictionary allValues](self->_sessionDict, "allValues");
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__VideoConference_didResumeAudioIO___block_invoke;
  v6[3] = &unk_1E9E521C0;
  v6[4] = v4;
  dispatch_async(global_queue, v6);
  -[VideoConference unlock](self, "unlock");
}

void __36__VideoConference_didResumeAudioIO___block_invoke(uint64_t a1)
{
  size_t v2;
  NSObject *global_queue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__VideoConference_didResumeAudioIO___block_invoke_2;
  v4[3] = &unk_1E9E55E80;
  v4[4] = *(_QWORD *)(a1 + 32);
  dispatch_apply(v2, global_queue, v4);
}

uint64_t __36__VideoConference_didResumeAudioIO___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  objc_msgSend(v2, "setResumeAudio");
  return objc_msgSend(v2, "setResumeVideo");
}

- (void)serverDidDie
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v3, 32000, 119, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 2161), CFSTR("Call failed"), CFSTR("Media server terminated"));
  -[VideoConference stopAllCalls:](self, "stopAllCalls:", v3[0]);
}

- (void)didUpdateBasebandCodec:(const _VCRemoteCodecInfo *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSArray *sessionArray;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", FourccToCStr(a3->codecType));
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->sampleRate);
  -[VideoConference rdlock](self, "rdlock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  sessionArray = self->_sessionArray;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(sessionArray);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "setBasebandCodecType:", v5);
        objc_msgSend(v12, "setBasebandCodecSampleRate:", v6);
        objc_msgSend(v12, "sendBasebandCodecMessage");
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v9);
  }
  -[VideoConference unlock](self, "unlock");
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  float AveragePower;
  uint64_t VoiceActivity;
  uint64_t Timestamp;
  uint64_t v8;
  NSObject *v9;
  int chatMode;
  VideoConferenceDelegate *v11;
  double v12;
  __CFData *v13;
  int timescale;
  uint64_t v15;
  unsigned int value_high;
  NSArray *sessionArray;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  _BYTE v22[24];
  _QWORD v23[3];
  _BYTE v24[128];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  AveragePower = VCAudioBufferList_GetAveragePower((uint64_t)a3);
  VoiceActivity = VCAudioBufferList_GetVoiceActivity((uint64_t)a3);
  Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  -[VCAudioPowerSpectrumSource pushAudioSamples:](self->_inputAudioPowerSpectrumSource, "pushAudioSamples:", a3);
  if (-[VideoConference tryrdlock](self, "tryrdlock"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v22 = 136315906;
        *(_QWORD *)&v22[4] = v8;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VideoConference pushAudioSamples:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23[0]) = 2244;
        WORD2(v23[0]) = 1024;
        *(_DWORD *)((char *)v23 + 6) = Timestamp;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d IOProc:  Missing grabbing lock onCaptureSound at %u", v22, 0x22u);
      }
    }
  }
  else
  {
    if (BYTE4(self->recvRTPTimeStamp.epoch))
      self->isTalking = 1;
    else
      -[VideoConference updateSpeaking:timeStamp:](self, "updateSpeaking:timeStamp:", VoiceActivity, Timestamp);
    chatMode = self->chatMode;
    if (chatMode == 2)
    {
      if (self->hasMic)
        -[VideoConference captureMeshMode:](self, "captureMeshMode:", a3);
    }
    else if (!chatMode)
    {
      if (self->isFocus)
        -[VideoConference captureAsFocus:](self, "captureAsFocus:", a3);
      else
        -[VideoConference captureAsFocusClient:](self, "captureAsFocusClient:", a3);
    }
    VCMediaRecorder_AddLocalAudioSampleBuffer((uint64_t)self->_vcMediaRecorder, (uint64_t)a3, self->dwAudioTS);
    if (self->inputMeteringEnabled && self->inputMeterLevel != AveragePower)
    {
      self->inputMeterLevel = AveragePower;
      v11 = -[VideoConference delegate](self, "delegate");
      *(float *)&v12 = self->inputMeterLevel;
      -[VideoConferenceDelegate videoConference:updateInputMeterLevel:](v11, "videoConference:updateInputMeterLevel:", self, v12);
    }
    if (self->inputFrequencyMeteringEnabled)
    {
      v13 = VCFFTMeter_Compute((uint64_t)self->_inputFFTMeter, (uint64_t)a3);
      -[VideoConferenceDelegate videoConference:updateInputFrequencyLevel:](-[VideoConference delegate](self, "delegate"), "videoConference:updateInputFrequencyLevel:", self, v13);
      if (v13)
        CFRelease(v13);
    }
    if (!BYTE1(self->downstreamBandwidth))
    {
      timescale = self->recvRTPTimeStamp.timescale;
      if ((timescale & 1) != 0)
      {
        v15 = *(_QWORD *)&self->recvRTPTimeStamp.flags;
        value_high = HIDWORD(self->recvRTPTimeStamp.value);
        *(_QWORD *)v22 = *(_QWORD *)(&self->packetsPerBundle + 1);
        *(_QWORD *)&v22[8] = __PAIR64__(timescale, value_high);
        *(_QWORD *)&v22[16] = v15;
        v23[0] = VCAudioBufferList_GetHostTime((uint64_t)a3);
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        sessionArray = self->_sessionArray;
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v25, v24, 16, *(_QWORD *)v22, *(_QWORD *)&v22[8], *(_QWORD *)&v22[16], v23[0]);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v26;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v26 != v20)
                objc_enumerationMutation(sessionArray);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "updateSourcePlayoutTime:", v22);
            }
            v19 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v25, v24, 16);
          }
          while (v19);
        }
      }
    }
    -[VideoConference unlock](self, "unlock");
  }
  if (!BYTE1(self->downstreamBandwidth))
  {
    pthread_mutex_lock(&self->xAudioTS);
    self->dAudioHostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
    self->dwAudioTS = self->lastSentAudioSampleTime;
    pthread_mutex_unlock(&self->xAudioTS);
  }
}

- (void)pullAudioSamples:(opaqueVCAudioBufferList *)a3
{
  uint64_t Timestamp;
  uint64_t v6;
  NSObject *v7;
  int chatMode;
  float conferenceVolume;
  float AveragePower;
  VideoConferenceDelegate *v11;
  double v12;
  __CFData *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  VideoConference *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  VCAudioBufferList_ZeroMemory((uint64_t)a3);
  if (-[VideoConference tryrdlock](self, "tryrdlock"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = 136316162;
        v15 = v6;
        v16 = 2080;
        v17 = "-[VideoConference pullAudioSamples:]";
        v18 = 1024;
        v19 = 2304;
        v20 = 2048;
        v21 = self;
        v22 = 1024;
        v23 = Timestamp;
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference[%p] IOProc:  Missing grabbing lock onPlaySound at %u", (uint8_t *)&v14, 0x2Cu);
      }
    }
  }
  else
  {
    chatMode = self->chatMode;
    if (chatMode == 2)
    {
      -[VideoConference pullDecodedMeshMode:](self, "pullDecodedMeshMode:", a3);
    }
    else if (!chatMode)
    {
      if (self->isFocus)
        -[VideoConference pullDecodedAsFocus:](self, "pullDecodedAsFocus:", a3);
      else
        -[VideoConference pullDecodedAsFocusClient:](self, "pullDecodedAsFocusClient:", a3);
    }
    conferenceVolume = self->conferenceVolume;
    if (conferenceVolume < 1.0)
      VCAudioBufferList_ApplyGain((uint64_t)a3, conferenceVolume);
    -[VCAudioPowerSpectrumSource pushAudioSamples:](self->_outputAudioPowerSpectrumSource, "pushAudioSamples:", a3);
    AveragePower = VCAudioBufferList_GetAveragePower((uint64_t)a3);
    -[VCAudioPowerLevelMonitor detectRemoteAveragePowerLevel:timestamp:](self->_remoteAudioPowerLevelMonitor, "detectRemoteAveragePowerLevel:timestamp:", Timestamp);
    if (self->outputMeteringEnabled && self->outputMeterLevel != AveragePower)
    {
      self->outputMeterLevel = AveragePower;
      v11 = -[VideoConference delegate](self, "delegate");
      *(float *)&v12 = self->outputMeterLevel;
      -[VideoConferenceDelegate videoConference:updateOutputMeterLevel:](v11, "videoConference:updateOutputMeterLevel:", self, v12);
    }
    if (self->outputFrequencyMeteringEnabled)
    {
      v13 = VCFFTMeter_Compute((uint64_t)self->_outputFFTMeter, (uint64_t)a3);
      -[VideoConferenceDelegate videoConference:updateOutputFrequencyLevel:](-[VideoConference delegate](self, "delegate"), "videoConference:updateOutputFrequencyLevel:", self, v13);
      if (v13)
        CFRelease(v13);
    }
    VCMediaRecorder_AddRemoteAudioSampleBuffer((uint64_t)self->_vcMediaRecorder, (uint64_t)a3, self->dwAudioTS);
    -[VideoConference unlock](self, "unlock");
  }
}

- (int)chatMode
{
  return self->chatMode;
}

- (BOOL)isFocus
{
  return self->isFocus;
}

- (NSString)currentFocus
{
  return self->currentFocus;
}

- (int)packetsPerBundle
{
  return self->packetsPerBundle;
}

- (unsigned)preferredCodec
{
  return *(_DWORD *)&self->disableVAD;
}

- (void)setPreferredCodec:(unsigned int)a3
{
  *(_DWORD *)&self->disableVAD = a3;
}

- (int)upstreamBandwidth
{
  return self->preferredCodec;
}

- (void)setUpstreamBandwidth:(int)a3
{
  self->preferredCodec = a3;
}

- (int)downstreamBandwidth
{
  return self->upstreamBandwidth;
}

- (void)setDownstreamBandwidth:(int)a3
{
  self->upstreamBandwidth = a3;
}

- (VideoConferenceSpeakingDelegate)speakingDelegate
{
  return self->speakingDelegate;
}

- (void)setSpeakingDelegate:(id)a3
{
  self->speakingDelegate = (VideoConferenceSpeakingDelegate *)a3;
}

- (BOOL)useViceroyBlobFormat
{
  return self->useViceroyBlobFormat;
}

- (BOOL)isUsingSuppression
{
  return BYTE2(self->downstreamBandwidth);
}

- (BOOL)shouldTimeoutPackets
{
  return HIBYTE(self->downstreamBandwidth) & 1;
}

- (void)setShouldTimeoutPackets:(BOOL)a3
{
  HIBYTE(self->downstreamBandwidth) = a3;
}

- (BOOL)useCompressedConnectionData
{
  return self->isGKVoiceChat;
}

- (void)setUseCompressedConnectionData:(BOOL)a3
{
  self->isGKVoiceChat = a3;
}

- (BOOL)isGKVoiceChat
{
  return BYTE1(self->downstreamBandwidth);
}

- (BOOL)requiresWifi
{
  return BYTE5(self->recvRTPTimeStamp.epoch);
}

- (unsigned)talkingPeersLimit
{
  return self->talkingPeersLimit;
}

- (void)setTalkingPeersLimit:(unsigned int)a3
{
  self->talkingPeersLimit = a3;
}

- (BOOL)disableVAD
{
  return BYTE4(self->recvRTPTimeStamp.epoch) & 1;
}

- (void)setDisableVAD:(BOOL)a3
{
  BYTE4(self->recvRTPTimeStamp.epoch) = a3;
}

- (int)localFrameWidth
{
  return self->localFrameWidth;
}

- (int)localFrameHeight
{
  return self->localFrameHeight;
}

- (BOOL)shouldPrioritizeParticipantIDForSIPInvite
{
  return self->shouldPrioritizeParticipantIDForSIPInvite;
}

- (void)setShouldPrioritizeParticipantIDForSIPInvite:(BOOL)a3
{
  self->shouldPrioritizeParticipantIDForSIPInvite = a3;
}

- (VCVideoRule)conferenceCaptureRule
{
  return self->conferenceCaptureRule;
}

- (unsigned)lastActiveCall
{
  return self->lastActiveCall;
}

- (void)setLastActiveCall:(unsigned int)a3
{
  self->lastActiveCall = a3;
}

- (BOOL)isValid
{
  return self->isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->isValid = a3;
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (unsigned)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(unsigned int)a3
{
  self->_transportType = a3;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  return self->_inputAudioPowerSpectrumToken;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  return self->_outputAudioPowerSpectrumToken;
}

- (VCMediaRecorder)vcMediaRecorder
{
  return self->_vcMediaRecorder;
}

- (NSMutableDictionary)sessionDict
{
  return self->_sessionDict;
}

- (void)setSessionDict:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 432);
}

- (BOOL)updateSpeaking:(unsigned int)a3 timeStamp:(unsigned int)a4
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  BOOL result;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (!self->isTalking)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        v8 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            v13 = 136315906;
            v14 = v6;
            v15 = 2080;
            v16 = "-[VideoConference(AudioProcessing) updateSpeaking:timeStamp:]";
            v17 = 1024;
            v18 = 2326;
            v19 = 1024;
            v20 = a4;
            _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d START TALKING at %u", (uint8_t *)&v13, 0x22u);
          }
        }
        else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          -[VideoConference(AudioProcessing) updateSpeaking:timeStamp:].cold.2();
        }
      }
      self->isTalking = 1;
      if (self->hasMic)
        -[VideoConferenceSpeakingDelegate didStartSpeaking:](self->speakingDelegate, "didStartSpeaking:", 0);
    }
    result = 0;
    self->talkTime = a4;
  }
  else if (self->isTalking)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v11 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315906;
          v14 = v9;
          v15 = 2080;
          v16 = "-[VideoConference(AudioProcessing) updateSpeaking:timeStamp:]";
          v17 = 1024;
          v18 = 2334;
          v19 = 1024;
          v20 = a4;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d STOP TALKING at %u", (uint8_t *)&v13, 0x22u);
        }
      }
      else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        -[VideoConference(AudioProcessing) updateSpeaking:timeStamp:].cold.1();
      }
    }
    self->isTalking = 0;
    if (self->hasMic)
      -[VideoConferenceSpeakingDelegate didStopSpeaking:](self->speakingDelegate, "didStopSpeaking:", 0);
    return 1;
  }
  else
  {
    return 0;
  }
  return result;
}

- (unsigned)pruneQuietestPeers:(unsigned int)a3 talking:(unsigned int)a4 mask:(unsigned int)a5 meters:(char *)a6
{
  unsigned int i;
  uint64_t v7;
  char v8;
  unsigned __int8 v9;

  for (i = self->talkingPeersLimit; a4 > i; --a4)
  {
    if (a3)
    {
      v7 = 0;
      v8 = 0;
      v9 = -1;
      do
      {
        if (((a5 >> v7) & 1) != 0 && a6[v7] < v9)
        {
          v9 = a6[v7];
          v8 = v7;
        }
        ++v7;
      }
      while (a3 != v7);
    }
    else
    {
      v8 = 0;
    }
    a5 &= ~(1 << v8);
  }
  return a5;
}

- (unsigned)calculateTalkingMaskAtTimeStamp:(unsigned int)a3
{
  uint64_t v3;
  _BOOL4 v5;
  opaqueVCAudioBufferList *sourceBuffer;
  unsigned int SampleCapacity;
  uint64_t SampleCount;
  int v9;
  size_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  double v13;
  unsigned __int8 v14;
  NSArray *sessionArray;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  NSUInteger v25;
  size_t v27;
  unsigned __int8 *v28;
  unsigned __int8 *v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v3 = *(_QWORD *)&a3;
  v39 = *MEMORY[0x1E0C80C00];
  v5 = self->isTalking && self->hasMic;
  sourceBuffer = self->_sourceBuffer;
  SampleCapacity = VCAudioBufferList_GetSampleCapacity((uint64_t)sourceBuffer);
  VCAudioBufferList_SetSampleCount((uint64_t)sourceBuffer, SampleCapacity);
  v33 = 200;
  SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)self->_sourceBuffer);
  v9 = -[NSArray count](self->_sessionArray, "count");
  v10 = (v9 + 1);
  v11 = (v10 + 15) & 0x1FFFFFFF0;
  v12 = (unsigned __int8 *)&v27 - v11;
  if (v9 != -1)
    memset((char *)&v27 - v11, 170, v10);
  v27 = v10;
  bzero(v12, v10);
  *(float *)&v13 = self->inputMeterLevel;
  v14 = -[VideoConference powerFloatToInt:](self, "powerFloatToInt:", v13);
  v28 = v12;
  *v12 = v14;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  sessionArray = self->_sessionArray;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  v32 = v5;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    v19 = 1;
    v31 = v5;
    do
    {
      v20 = 0;
      v30 = v19;
      v29 = &v28[v19];
      do
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(sessionArray);
        v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v20);
        if (objc_msgSend(v21, "state") == 1
          && objc_msgSend(v21, "isAudioRunning")
          && objc_msgSend(v21, "shouldSendAudio"))
        {
          v22 = objc_msgSend((id)objc_msgSend(v21, "ringBuf"), "needsNewNumSamples:timestamp:", SampleCount, v3);
          if (v22)
          {
            v23 = SampleCount - v22;
            if ((int)((SampleCount - v22) | v22) < 0)
              v23 = 0;
            v24 = v33;
            VCAudioBufferList_SetTime(*(uint64_t *)((char *)&self->super.super.isa + v33), v23 + v3, 0.0);
            -[VideoConference recvSamplesForSession:sampleBuffer:](self, "recvSamplesForSession:sampleBuffer:", v21, *(Class *)((char *)&self->super.super.isa + v24));
          }
          if (objc_msgSend(v21, "lastReceived") >= v3)
          {
            v25 = -[NSArray indexOfObject:](self->connectedPeers, "indexOfObject:", objc_msgSend(v21, "remoteParticipantID"));
            if (v25 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v29[v20] = self->speakingArray[v25];
              v32 |= 1 << (v19 + v20);
              ++v31;
            }
          }
        }
        ++v20;
      }
      while (v17 != v20);
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
      v19 = v30 + v20;
    }
    while (v17);
  }
  else
  {
    v31 = v5;
  }
  return -[VideoConference pruneQuietestPeers:talking:mask:meters:](self, "pruneQuietestPeers:talking:mask:meters:", v27, v31, v32, v28);
}

- (void)calculateMixingArrays:(unsigned int *)a3 talkingMask:(unsigned int)a4
{
  NSArray *sessionArray;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  char v19;
  unsigned int *v21;
  uint64_t v22;
  NSArray *v23;
  uint64_t v25;
  int v26;
  uint64_t v27;
  NSArray *obj;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  sessionArray = self->_sessionArray;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (v6)
  {
    v7 = v6;
    LODWORD(v8) = 0;
    v9 = *(_QWORD *)v36;
    v22 = *(_QWORD *)v36;
    v23 = sessionArray;
    v21 = a3;
    do
    {
      v10 = 0;
      v8 = (int)v8;
      v25 = v7;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(sessionArray);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
        if (objc_msgSend(v11, "state") == 1 && objc_msgSend(v11, "isAudioRunning"))
        {
          v12 = a4 & ~(1 << (v8 + 1));
          v13 = objc_msgSend((id)objc_msgSend(v11, "mutedPeers"), "count");
          v27 = v8;
          if (v13)
          {
            if (!objc_msgSend((id)objc_msgSend(v11, "mutedPeers"), "containsObject:", objc_msgSend(v11, "localParticipantID"))|| (v12 &= ~1u, --v13, v13))
            {
              v32 = 0u;
              v33 = 0u;
              v30 = 0u;
              v31 = 0u;
              obj = self->_sessionArray;
              v14 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v31;
                v17 = 1;
                while (2)
                {
                  v18 = 0;
                  v19 = v17;
                  v26 = v17 + v15;
                  do
                  {
                    if (*(_QWORD *)v31 != v16)
                      objc_enumerationMutation(obj);
                    if (objc_msgSend((id)objc_msgSend(v11, "mutedPeers"), "containsObject:", objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v18), "remoteParticipantID")))
                    {
                      v12 &= ~(1 << (v19 + v18));
                      if (!--v13)
                      {
                        a3 = v21;
                        goto LABEL_23;
                      }
                    }
                    ++v18;
                  }
                  while (v15 != v18);
                  v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
                  a3 = v21;
                  v17 = v26;
                  if (v15)
                    continue;
                  break;
                }
              }
            }
          }
LABEL_23:
          ++v8;
          a3[v27] = v12;
          v9 = v22;
          sessionArray = v23;
          v7 = v25;
        }
        else
        {
          a3[v8++] = 0;
        }
        ++v10;
      }
      while (v10 != v7);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    }
    while (v7);
  }
}

- (void)captureAsFocus:(opaqueVCAudioBufferList *)a3
{
  opaqueVCAudioBufferList *v3;
  uint64_t Timestamp;
  uint64_t v6;
  opaqueVCAudioBufferList *sinkBufferMix;
  unsigned int v8;
  uint64_t v9;
  size_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  double HostTime;
  int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  opaqueVCAudioBufferList *sinkBuffer;
  VideoConference *v27;
  uint64_t v28;
  uint64_t AudioBufferList;
  void *v30;
  uint64_t v31;
  double v32;
  int v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  char *v37;
  opaqueVCAudioBufferList *v38;
  NSUInteger v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int SampleCount;
  unsigned int v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE v51[128];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;

  v3 = a3;
  v56 = *MEMORY[0x1E0C80C00];
  Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)v3);
  v6 = 216;
  VCAudioBufferList_Reset((uint64_t)self->_sinkBufferMix);
  sinkBufferMix = self->_sinkBufferMix;
  v8 = VCAudioBufferList_GetSampleCount((uint64_t)v3);
  VCAudioBufferList_SetSampleCount((uint64_t)sinkBufferMix, v8);
  v44 = Timestamp;
  v9 = -[VideoConference calculateTalkingMaskAtTimeStamp:](self, "calculateTalkingMaskAtTimeStamp:", Timestamp);
  v48 = 440;
  v39 = -[NSArray count](self->_sessionArray, "count");
  v10 = 4 * v39;
  v11 = (char *)&v36 - ((v10 + 15) & 0x7FFFFFFF0);
  if ((_DWORD)v39)
    memset((char *)&v36 - ((v10 + 15) & 0x7FFFFFFF0), 170, v10);
  else
    v10 = 0;
  bzero(v11, v10);
  -[VideoConference calculateMixingArrays:talkingMask:](self, "calculateMixingArrays:talkingMask:", v11, v9);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v45 = *(Class *)((char *)&self->super.super.isa + v48);
  v12 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
  if (v12)
  {
    v13 = v12;
    LODWORD(v14) = 0;
    v47 = (v39 + 1);
    v46 = (int)v39;
    v36 = (int)v39 - 1;
    v49 = *(_QWORD *)v53;
    v38 = v3;
    v41 = 216;
    v37 = v11;
    do
    {
      v15 = 0;
      v14 = (int)v14;
      v40 = (int)v14;
      v42 = v13;
      do
      {
        if (*(_QWORD *)v53 != v49)
          objc_enumerationMutation(v45);
        v50 = v14 + 1;
        v16 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v15);
        if (objc_msgSend(v16, "state", v36) == 1)
        {
          if (objc_msgSend(v16, "isAudioRunning"))
          {
            if (objc_msgSend(v16, "shouldSendAudio"))
            {
              v17 = *(_DWORD *)&v11[4 * v14];
              if (v17 != -1)
              {
                if (v17)
                {
                  VCAudioBufferList_Reset(*(uint64_t *)((char *)&self->super.super.isa + v6));
                  v19 = *(uint64_t *)((char *)&self->super.super.isa + v6);
                  HostTime = VCAudioBufferList_GetHostTime((uint64_t)v3);
                  v21 = VCAudioBufferList_GetTimestamp((uint64_t)v3);
                  VCAudioBufferList_SetTime(v19, v21, HostTime);
                  v22 = *(uint64_t *)((char *)&self->super.super.isa + v6);
                  v23 = VCAudioBufferList_GetSampleCount((uint64_t)v3);
                  VCAudioBufferList_SetSampleCount(v22, v23);
                  VCAudioBufferList_ZeroMemory(*(uint64_t *)((char *)&self->super.super.isa + v6));
                  if ((v17 & 1) != 0)
                    VCAudioBufferList_Mix(*(uint64_t *)((char *)&self->super.super.isa + v6), (uint64_t)v3);
                  if ((int)v39 >= 1)
                  {
                    v24 = 1;
                    do
                    {
                      if (((v17 >> v24) & 1) != 0)
                      {
                        v25 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v48), "objectAtIndexedSubscript:", v24 - 1);
                        sinkBuffer = self->_sinkBuffer;
                        v27 = self;
                        v28 = SampleCount;
                        VCAudioBufferList_SetSampleCount((uint64_t)sinkBuffer, SampleCount);
                        AudioBufferList = VCAudioBufferList_GetAudioBufferList((uint64_t)v27->_sinkBuffer);
                        v30 = (void *)objc_msgSend(v25, "ringBuf");
                        v31 = v28;
                        self = v27;
                        if (objc_msgSend(v30, "fetch:numSamples:timestamp:", *(_QWORD *)(AudioBufferList + 16), v31, v44))VCAudioBufferList_Mix(*(uint64_t *)((char *)&v27->super.super.isa + v41), (uint64_t)v27->_sinkBuffer);
                      }
                      ++v24;
                    }
                    while (v47 != v24);
                  }
                  if (self->isTalking)
                  {
                    v6 = v41;
                    v11 = v37;
                    if (self->hasMic)
                    {
                      *(float *)&v32 = VCAudioBufferList_GetAveragePower(*(uint64_t *)((char *)&self->super.super.isa
                                                                                    + v41));
                      v33 = -[VideoConference powerFloatToInt:](self, "powerFloatToInt:", v32);
                    }
                    else
                    {
                      v33 = 0;
                    }
                    v3 = v38;
                  }
                  else
                  {
                    v33 = 0;
                    v3 = v38;
                    v6 = v41;
                    v11 = v37;
                  }
                  objc_msgSend(v16, "setInputMeter:", ((int)(v33 + objc_msgSend(v16, "bundledPackets") * objc_msgSend(v16, "inputMeter"))/ (int)(objc_msgSend(v16, "bundledPackets") + 1)));
                  objc_msgSend(v16, "pushAudioSamples:", *(Class *)((char *)&self->super.super.isa + v6));
                  v13 = v42;
                  if (v14 < v36)
                  {
                    v34 = (int)v50;
                    do
                    {
                      if (*(_DWORD *)&v11[4 * v34] == v17)
                      {
                        v35 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v48), "objectAtIndexedSubscript:", v34);
                        if (objc_msgSend(v35, "shouldSendAudio"))
                        {
                          objc_msgSend(v35, "setInputMeter:", ((int)(v33+ objc_msgSend(v35, "bundledPackets")* objc_msgSend(v35, "inputMeter"))/ (int)(objc_msgSend(v35, "bundledPackets") + 1)));
                          objc_msgSend(v35, "pushAudioSamples:", *(Class *)((char *)&self->super.super.isa + v6));
                        }
                        *(_DWORD *)&v11[4 * v34] = -1;
                        v13 = v42;
                      }
                      ++v34;
                    }
                    while (v34 < v46);
                  }
                }
                else
                {
                  v18 = VCAudioBufferList_GetSampleCount((uint64_t)v3);
                  VCAudioBufferList_SetSampleCount((uint64_t)v3, 0);
                  objc_msgSend(v16, "pushAudioSamples:", v3);
                  VCAudioBufferList_SetSampleCount((uint64_t)v3, v18);
                  v13 = v42;
                }
              }
            }
          }
        }
        ++v15;
        v14 = v50;
      }
      while (v15 != v13);
      LODWORD(v14) = v40 + v13;
      v13 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v52, v51, 16);
    }
    while (v13);
  }
}

- (void)captureAsFocusClient:(opaqueVCAudioBufferList *)a3
{
  unsigned int SampleCount;
  double v6;

  SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
  if (-[VCCallSession shouldSendAudio](self->currentFocusSession, "shouldSendAudio")
    && -[VCCallSession state](self->currentFocusSession, "state") == 1
    && -[VCCallSession isAudioRunning](self->currentFocusSession, "isAudioRunning"))
  {
    if (self->hasMic && self->isTalking)
    {
      *(float *)&v6 = VCAudioBufferList_GetAveragePower((uint64_t)a3);
      -[VCCallSession setInputMeter:](self->currentFocusSession, "setInputMeter:", ((-[VideoConference powerFloatToInt:](self, "powerFloatToInt:", v6)+ -[VCCallSession bundledPackets](self->currentFocusSession, "bundledPackets")* -[VCCallSession inputMeter](self->currentFocusSession, "inputMeter"))/ (-[VCCallSession bundledPackets](self->currentFocusSession, "bundledPackets") + 1)));
    }
    else
    {
      VCAudioBufferList_SetSampleCount((uint64_t)a3, 0);
    }
    -[VCCallSession pushAudioSamples:](self->currentFocusSession, "pushAudioSamples:", a3);
  }
  VCAudioBufferList_SetSampleCount((uint64_t)a3, SampleCount);
}

- (void)updateAudioTimestampsForSession:(id)a3 withNewSampleTime:(unsigned int)a4 hostTime:(double)a5 numSamples:(int)a6
{
  signed int v11;
  unsigned int v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  int v16;
  int v17;
  uint64_t v19;
  NSObject *v20;
  unsigned int v21;
  double v22;
  unsigned int lastSentAudioSampleTime;
  double v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  unsigned int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v11 = a4 - self->lastSentAudioSampleTime;
  v12 = llround((a5 - self->dAudioHostTime) * (float)(objc_msgSend(a3, "sampleRate") / a6)) * a6;
  if (self->lastSentAudioSampleTime)
  {
    if (v11 != a6 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        lastSentAudioSampleTime = self->lastSentAudioSampleTime;
        v24 = a5 - self->dAudioHostTime;
        v25 = 136317186;
        v26 = v13;
        v27 = 2080;
        v28 = "-[VideoConference(AudioProcessing) updateAudioTimestampsForSession:withNewSampleTime:hostTime:numSamples:]";
        v29 = 1024;
        v30 = 2549;
        v31 = 1024;
        v32 = v11;
        v33 = 1024;
        v34 = lastSentAudioSampleTime;
        v35 = 1024;
        v36 = a4;
        v37 = 2048;
        v38 = a5;
        v39 = 2048;
        v40 = v24;
        v41 = 1024;
        v42 = v12;
        _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, "VideoConference [%s] %s:%d Timestamp jumped by %d, %d to %d at %f. host time jump %f (%d)", (uint8_t *)&v25, 0x48u);
      }
    }
  }
  if (self->dAudioHostTime != 0.0)
  {
    v15 = 5 * a6;
    v16 = v11 - v12;
    if ((int)(v11 - v12) < 0)
      v16 = v12 - v11;
    if (v11 >= 0)
      v17 = v11;
    else
      v17 = -v11;
    if (v15 < v16 || v15 < v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v21 = self->lastSentAudioSampleTime;
          v22 = a5 - self->dAudioHostTime;
          v25 = 136316930;
          v26 = v19;
          v27 = 2080;
          v28 = "-[VideoConference(AudioProcessing) updateAudioTimestampsForSession:withNewSampleTime:hostTime:numSamples:]";
          v29 = 1024;
          v30 = 2555;
          v31 = 1024;
          v32 = v12;
          v33 = 1024;
          v34 = v21;
          v35 = 1024;
          v36 = a4;
          v37 = 2048;
          v38 = v22;
          v39 = 1024;
          LODWORD(v40) = v12;
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Detected large timestamp jump by %d, from %d to %d. host time jump %f (%d)", (uint8_t *)&v25, 0x3Eu);
        }
      }
      VCAudioReceiver_DiscardQueueExcess(objc_msgSend(a3, "audioReceiver"));
    }
  }
  self->lastSentAudioSampleTime = a4;
}

- (void)captureMeshMode:(opaqueVCAudioBufferList *)a3
{
  double HostTime;
  NSArray *sessionArray;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int SampleCount;
  unsigned int Timestamp;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
  Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  sessionArray = self->_sessionArray;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(sessionArray);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "state") == 1)
        {
          if (objc_msgSend(v11, "isAudioRunning"))
          {
            if (objc_msgSend(v11, "isCurrentPayloadTypeValid") && !BYTE1(self->downstreamBandwidth))
              -[VideoConference updateAudioTimestampsForSession:withNewSampleTime:hostTime:numSamples:](self, "updateAudioTimestampsForSession:withNewSampleTime:hostTime:numSamples:", v11, Timestamp, SampleCount, HostTime);
            if (self->isTalking || !BYTE1(self->downstreamBandwidth))
              objc_msgSend(v11, "pushAudioSamples:", a3);
          }
          if (objc_msgSend(v11, "isRemoteMediaStalled") && (self->timeStampUpdateCounter & 1) == 0
            || (objc_msgSend(v11, "isRemoteMediaStalled") & 1) == 0
            && -1030792151 * self->timeStampUpdateCounter <= 0xA3D70A3)
          {
            objc_msgSend(v11, "updateLastReceivedAudioTime");
          }
          ++self->timeStampUpdateCounter;
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }
}

- (void)updateMeter:(unsigned __int8)a3 forParticipant:(id)a4 atIndex:(unsigned int)a5
{
  unsigned __int8 *speakingArray;
  uint64_t v7;

  speakingArray = self->speakingArray;
  v7 = a5;
  if (!a3 || self->speakingArray[a5])
  {
    if (!a3 && self->speakingArray[a5])
      -[VideoConferenceSpeakingDelegate didStopSpeaking:](self->speakingDelegate, "didStopSpeaking:", a4);
  }
  else
  {
    -[VideoConferenceSpeakingDelegate didStartSpeaking:](self->speakingDelegate, "didStartSpeaking:", a4);
  }
  speakingArray[v7] = a3;
}

- (void)updateMeters:(unsigned __int16)a3
{
  char v3;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t i;

  v3 = a3;
  v5 = -[NSArray count](self->connectedPeers, "count");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[VideoConference updateMeter:forParticipant:atIndex:](self, "updateMeter:forParticipant:atIndex:", ((1 << i) & v3), -[NSArray objectAtIndexedSubscript:](self->connectedPeers, "objectAtIndexedSubscript:", i), i);
  }
}

- (BOOL)recvSamplesForSession:(id)a3 sampleBuffer:(opaqueVCAudioBufferList *)a4
{
  uint64_t SampleCount;
  uint64_t Timestamp;
  NSUInteger v9;
  BOOL v10;
  NSUInteger v11;
  uint64_t v12;
  NSUInteger v13;
  double v15;
  _DWORD *v16;
  int64x2_t v17;
  _DWORD v18[5];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(v18, 170, sizeof(v18));
  v15 = 0.0;
  v16 = &v18[1];
  v17 = vdupq_n_s64(0x10uLL);
  SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a4);
  Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a4);
  if (objc_msgSend(a3, "state") != 1 || !objc_msgSend(a3, "isAudioRunning"))
    goto LABEL_8;
  if (!VCAudioReceiver_PullAudioSamples(objc_msgSend(a3, "audioReceiver"), (uint64_t)a4, 0, &v15, (uint64_t)&v16, v18, 0))goto LABEL_7;
  objc_msgSend(a3, "updateLastReceivedPacketWithTimestamp:packetType:", 5, v15);
  if (v17.i64[1])
  {
    objc_msgSend((id)objc_msgSend(a3, "ringBuf"), "store:numSamples:timestamp:", *(_QWORD *)(VCAudioBufferList_GetAudioBufferList((uint64_t)a4) + 16), SampleCount, Timestamp);
    if (!v18[0] || LOBYTE(v18[1]))
    {
      objc_msgSend(a3, "setLastReceived:", (Timestamp + SampleCount), *(_QWORD *)&v15, v16, v17.i64[0]);
      if (LOBYTE(v18[1]))
      {
        v13 = -[NSArray indexOfObject:](self->connectedPeers, "indexOfObject:", objc_msgSend(a3, "remoteParticipantID"));
        if (v13 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v11 = v13;
          v10 = 1;
          v12 = LOBYTE(v18[1]);
          goto LABEL_11;
        }
      }
      return 1;
    }
LABEL_7:
    if (Timestamp > objc_msgSend(a3, "lastReceived", *(_QWORD *)&v15, v16, v17.i64[0]))
    {
LABEL_8:
      v9 = -[NSArray indexOfObject:](self->connectedPeers, "indexOfObject:", objc_msgSend(a3, "remoteParticipantID", *(_QWORD *)&v15));
      if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        return 0;
      v11 = v9;
      v12 = 0;
      v10 = 0;
LABEL_11:
      -[VideoConference updateMeter:forParticipant:atIndex:](self, "updateMeter:forParticipant:atIndex:", v12, objc_msgSend(a3, "remoteParticipantID"), v11);
      return v10;
    }
    return 1;
  }
  return 0;
}

- (int)pullDecodedAsFocus:(opaqueVCAudioBufferList *)a3
{
  uint64_t Timestamp;
  double HostTime;
  uint64_t SampleCount;
  NSArray *sessionArray;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t i;
  void *v14;
  int v15;
  int v16;
  int v18;
  _BOOL4 v19;
  opaqueVCAudioBufferList *v21;
  NSArray *v22;
  int v23;
  unsigned int v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
  v21 = a3;
  SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  sessionArray = self->_sessionArray;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (!v9)
    return 0;
  v10 = v9;
  v23 = 0;
  v24 = SampleCount;
  v11 = *(_QWORD *)v27;
  v12 = &OBJC_IVAR___VCCallSession_packetLossRate;
  v22 = sessionArray;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v27 != v11)
        objc_enumerationMutation(sessionArray);
      v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
      if ((objc_msgSend(*(id *)((char *)&self->super.super.isa + v12[171]), "containsObject:", objc_msgSend(v14, "remoteParticipantID")) & 1) == 0&& objc_msgSend(v14, "isAudioRunning")&& objc_msgSend(v14, "shouldSendAudio"))
      {
        v15 = objc_msgSend((id)objc_msgSend(v14, "ringBuf"), "needsNewNumSamples:timestamp:", SampleCount, Timestamp);
        v16 = v15;
        if (v15)
        {
          if ((int)SampleCount - v15 > (int)SampleCount || (int)SampleCount - v15 < 0)
            v18 = 0;
          else
            v18 = SampleCount - v15;
          VCAudioBufferList_SetTime((uint64_t)self->_sourceBuffer, v18 + Timestamp, HostTime);
          v19 = -[VideoConference recvSamplesForSession:sampleBuffer:](self, "recvSamplesForSession:sampleBuffer:", v14, self->_sourceBuffer);
        }
        else
        {
          v18 = 0;
          v19 = 1;
        }
        if (Timestamp <= objc_msgSend(v14, "lastReceived") && v19)
        {
          if (!v16 || v18)
            objc_msgSend((id)objc_msgSend(v14, "ringBuf"), "fetch:numSamples:timestamp:", *(_QWORD *)(VCAudioBufferList_GetAudioBufferList((uint64_t)self->_sourceBuffer) + 16), v24, Timestamp);
          VCAudioBufferList_Mix((uint64_t)v21, (uint64_t)self->_sourceBuffer);
          ++v23;
        }
        SampleCount = v24;
        sessionArray = v22;
        v12 = &OBJC_IVAR___VCCallSession_packetLossRate;
      }
    }
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  }
  while (v10);
  return v23;
}

- (int)pullDecodedAsFocusClient:(opaqueVCAudioBufferList *)a3
{
  uint64_t v5;
  int v6;
  double v8;
  _DWORD *v9;
  int64x2_t v10;
  _DWORD v11[5];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memset(v11, 170, sizeof(v11));
  v8 = 0.0;
  v9 = &v11[1];
  v10 = vdupq_n_s64(0x10uLL);
  if (-[VCCallSession state](self->currentFocusSession, "state") != 1
    || !-[VCCallSession isAudioRunning](self->currentFocusSession, "isAudioRunning")
    || !-[VCCallSession shouldSendAudio](self->currentFocusSession, "shouldSendAudio"))
  {
    return 0;
  }
  if (VCAudioReceiver_PullAudioSamples((uint64_t)-[VCCallSession audioReceiver](self->currentFocusSession, "audioReceiver"), (uint64_t)a3, 0, &v8, (uint64_t)&v9, v11, 0)&& (-[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:](self->currentFocusSession, "updateLastReceivedPacketWithTimestamp:packetType:", 5, v8), !v11[0]))
  {
    v6 = 1;
    if (v10.i64[1] < 2uLL)
      return v6;
    v5 = LOWORD(v11[1]);
  }
  else
  {
    v5 = 0;
    v6 = 0;
  }
  -[VideoConference updateMeters:](self, "updateMeters:", v5);
  return v6;
}

- (int)pullDecodedMeshMode:(opaqueVCAudioBufferList *)a3
{
  opaqueVCAudioBufferList *sourceBuffer;
  unsigned int SampleCount;
  opaqueVCAudioBufferList *v7;
  double HostTime;
  int Timestamp;
  NSArray *sessionArray;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  opaqueVCAudioBufferList *v16;
  uint64_t i;
  void *v18;
  double v19;
  int v20;
  double v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v25;
  VideoConference *v26;
  uint64_t v27;
  int v28;
  int v29;
  _BYTE buf[24];
  int v31;
  __int16 v32;
  double v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  sourceBuffer = self->_sourceBuffer;
  SampleCount = VCAudioBufferList_GetSampleCount((uint64_t)a3);
  VCAudioBufferList_SetSampleCount((uint64_t)sourceBuffer, SampleCount);
  v29 = -1431655766;
  v7 = self->_sourceBuffer;
  HostTime = VCAudioBufferList_GetHostTime((uint64_t)a3);
  Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
  VCAudioBufferList_SetTime((uint64_t)v7, Timestamp, HostTime);
  v28 = -1431655766;
  v26 = self;
  v27 = 0;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  sessionArray = self->_sessionArray;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (!v11)
    return 0;
  v13 = v11;
  v14 = 0;
  v15 = *(_QWORD *)v36;
  *(_QWORD *)&v12 = 136315906;
  v25 = v12;
  v16 = a3;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v36 != v15)
        objc_enumerationMutation(sessionArray);
      v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
      if (objc_msgSend(v18, "state", v25) == 1 && objc_msgSend(v18, "isAudioRunning"))
      {
        v19 = micro();
        v20 = objc_msgSend(v18, "pullAudioSamples:rtpTimestamp:lastReceivedAudioTime:padding:paddingLength:silence:", v16, &v29, &v27, 0, 0, &v28);
        v21 = micro() - v19;
        if (v21 > 0.005 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            *(_QWORD *)&buf[4] = v22;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VideoConference(AudioProcessing) pullDecodedMeshMode:]";
            *(_WORD *)&buf[22] = 1024;
            v31 = 2746;
            v32 = 2048;
            v33 = v21;
            _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d pullAudioSamples() took a long time = %f", buf, 0x26u);
          }
        }
        if (v20)
        {
          VCAudioBufferList_GetNetworkTimestamp((uint64_t)a3, (uint64_t)buf);
          *(_OWORD *)(&v26->packetsPerBundle + 1) = *(_OWORD *)buf;
          *(_QWORD *)&v26->recvRTPTimeStamp.flags = *(_QWORD *)&buf[16];
          if (!v28)
            ++v14;
          if (v16 != a3)
            VCAudioBufferList_Mix((uint64_t)a3, (uint64_t)v16);
          v16 = v26->_sourceBuffer;
        }
      }
    }
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  }
  while (v13);
  return v14;
}

- (int)sipCallbackNotification:(int)a3 callID:(unsigned int)a4 msgIn:(const char *)a5 msgOut:(char *)a6 optional:(void *)a7 confIndex:(int *)a8
{
  uint64_t v12;
  uint64_t v13;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 shouldPrioritizeParticipantIDForSIPInvite;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  const char *v24;
  id v25;
  int v26;
  id v27;
  void *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v12 = *(_QWORD *)&a4;
  v13 = *(_QWORD *)&a3;
  v38 = *MEMORY[0x1E0C80C00];
  v15 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v31 = v16;
      v32 = 2080;
      v33 = "-[VideoConference(SIPDispatch) sipCallbackNotification:callID:msgIn:msgOut:optional:confIndex:]";
      v34 = 1024;
      v35 = 2775;
      v36 = 1024;
      LODWORD(v37) = v13;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d sipCallbackNotification:%d", buf, 0x22u);
    }
  }
  -[VideoConference rdlock](self, "rdlock");
  if ((_DWORD)v13 == 13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        shouldPrioritizeParticipantIDForSIPInvite = self->shouldPrioritizeParticipantIDForSIPInvite;
        *(_DWORD *)buf = 136315906;
        v31 = v18;
        v32 = 2080;
        v33 = "-[VideoConference(SIPDispatch) sipCallbackNotification:callID:msgIn:msgOut:optional:confIndex:]";
        v34 = 1024;
        v35 = 2784;
        v36 = 1024;
        LODWORD(v37) = shouldPrioritizeParticipantIDForSIPInvite;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d shouldPrioritizeParticipantIDForSIPInvite %d", buf, 0x22u);
      }
    }
    if (self->shouldPrioritizeParticipantIDForSIPInvite)
    {
      v25 = -[VideoConference sessionForIncomingParticipantID:](self, "sessionForIncomingParticipantID:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), a5));
      if (v25)
        goto LABEL_19;
      v25 = -[VideoConference sessionForSourceDestinationInfo:](self, "sessionForSourceDestinationInfo:", a6);
      if (v25)
        goto LABEL_19;
    }
    else
    {
      v25 = -[VideoConference sessionForSourceDestinationInfo:](self, "sessionForSourceDestinationInfo:", a6);
      if (v25)
        goto LABEL_19;
      v25 = -[VideoConference sessionForIncomingParticipantID:](self, "sessionForIncomingParticipantID:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), a5));
      if (v25)
        goto LABEL_19;
    }
    v25 = -[VideoConference loopbackSessionWaitingForSIPInvite](self, "loopbackSessionWaitingForSIPInvite");
    if (!v25)
    {
      v26 = 3;
      goto LABEL_20;
    }
LABEL_19:
    v26 = 0;
    *(_DWORD *)a7 = objc_msgSend(v25, "callID");
LABEL_20:
    -[VideoConference unlock](self, "unlock");
    objc_msgSend(v15, "drain");
    return v26;
  }
  v29 = a7;
  v21 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v21)
        v24 = (const char *)objc_msgSend((id)objc_msgSend(v21, "description"), "UTF8String");
      else
        v24 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v31 = v22;
      v32 = 2080;
      v33 = "-[VideoConference(SIPDispatch) sipCallbackNotification:callID:msgIn:msgOut:optional:confIndex:]";
      v34 = 1024;
      v35 = 2819;
      v36 = 2080;
      v37 = v24;
      _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d sipCallbackNotification:session = %s", buf, 0x26u);
    }
  }
  v27 = v21;
  -[VideoConference unlock](self, "unlock");
  if (v21)
  {
    v26 = objc_msgSend(v21, "sipCallback:callID:msgIn:msgOut:optional:confIndex:", v13, v12, a5, a6, v29, a8);

  }
  else
  {

    return 3;
  }
  return v26;
}

- (BOOL)matchesCallID:(unsigned int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  LOBYTE(v3) = -[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)) != 0;
  -[VideoConference unlock](self, "unlock");
  return v3;
}

- (BOOL)matchesOpenSessionForParticipantID:(id)a3
{
  id v5;

  -[VideoConference rdlock](self, "rdlock");
  v5 = -[VideoConference openSessionForParticipant:](self, "openSessionForParticipant:", a3);
  -[VideoConference unlock](self, "unlock");
  return v5 != 0;
}

- (unsigned)callIDForOpenSessionWithParticipantID:(id)a3
{
  id v5;
  id v6;
  unsigned int v7;

  -[VideoConference rdlock](self, "rdlock");
  v5 = -[VideoConference openSessionForParticipant:](self, "openSessionForParticipant:", a3);
  v6 = v5;
  -[VideoConference unlock](self, "unlock");
  if (v5)
    v7 = objc_msgSend(v5, "callID");
  else
    v7 = -1;

  return v7;
}

- (id)openSessionForParticipant:(id)a3
{
  NSMutableDictionary *sessionDict;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  sessionDict = self->_sessionDict;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](sessionDict, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v14;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v8)
      objc_enumerationMutation(sessionDict);
    v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
    if (objc_msgSend(v10, "remoteParticipantID"))
    {
      if (objc_msgSend((id)objc_msgSend(v10, "remoteParticipantID"), "isEqualToString:", a3)
        && objc_msgSend(v10, "state") != 7)
      {
        return v10;
      }
    }
    if (v7 == ++v9)
    {
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](sessionDict, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)matchesParticipantID:(id)a3
{
  id v5;

  -[VideoConference rdlock](self, "rdlock");
  v5 = -[VideoConference sessionForParticipantID:](self, "sessionForParticipantID:", a3);
  -[VideoConference unlock](self, "unlock");
  return v5 != 0;
}

- (id)sessionForParticipantID:(id)a3
{
  NSArray *sessionArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  sessionArray = self->_sessionArray;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(sessionArray);
    v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
    if (objc_msgSend(v9, "remoteParticipantID"))
    {
      if ((objc_msgSend((id)objc_msgSend(v9, "remoteParticipantID"), "isEqualToString:", a3) & 1) != 0)
        return v9;
    }
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)conferenceMatchesSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  __int128 v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  char *v23;
  _OWORD v24[12];
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v25 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[10] = v5;
  v24[11] = v5;
  v24[8] = v5;
  v24[9] = v5;
  v24[6] = v5;
  v24[7] = v5;
  v24[4] = v5;
  v24[5] = v5;
  v24[2] = v5;
  v24[3] = v5;
  v24[0] = v5;
  v24[1] = v5;
  v6 = -[VideoConference sessionForSourceDestinationInfo:](self, "sessionForSourceDestinationInfo:", a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (self)
      {
        v9 = (const char *)objc_msgSend((id)-[VideoConference description](self, "description"), "UTF8String");
        if (v6)
        {
LABEL_5:
          v10 = (const char *)objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
LABEL_8:
          v12 = 136316418;
          v13 = v7;
          v14 = 2080;
          v15 = "-[VideoConference(SessionInfo) conferenceMatchesSourceDestinationInfo:]";
          v16 = 1024;
          v17 = 2922;
          v18 = 2080;
          v19 = v9;
          v20 = 2080;
          v21 = v10;
          v22 = 2080;
          v23 = VCSDInfoToStringRepresentation((uint64_t)a3, (char *)v24);
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d %s matches session %s for %s", (uint8_t *)&v12, 0x3Au);
          goto LABEL_9;
        }
      }
      else
      {
        v9 = "<nil>";
        if (v6)
          goto LABEL_5;
      }
      v10 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  -[VideoConference unlock](self, "unlock");
  return v6 != 0;
}

- (id)sessionForSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3
{
  NSMutableDictionary *sessionDict;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSMutableDictionary *v15;
  const char *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  _BYTE v28[128];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  sessionDict = self->_sessionDict;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](sessionDict, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(sessionDict);
        v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        if (objc_msgSend(v11, "isBetterForSIPInviteWithSourceDestinationInfo:thanSession:", a3, v8))
          v8 = v11;
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](sessionDict, "countByEnumeratingWithState:objects:count:", &v29, v28, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v8)
        v14 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
      else
        v14 = "<nil>";
      v15 = self->_sessionDict;
      if (v15)
        v16 = (const char *)objc_msgSend((id)-[NSMutableDictionary description](v15, "description"), "UTF8String");
      else
        v16 = "<nil>";
      v18 = 136316162;
      v19 = v12;
      v20 = 2080;
      v21 = "-[VideoConference(SessionInfo) sessionForSourceDestinationInfo:]";
      v22 = 1024;
      v23 = 2941;
      v24 = 2080;
      v25 = v14;
      v26 = 2080;
      v27 = v16;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d returns %s out of %s", (uint8_t *)&v18, 0x30u);
    }
  }
  return v8;
}

- (BOOL)hasSessionWaitingForSIPInvite
{
  id v3;

  -[VideoConference rdlock](self, "rdlock");
  v3 = -[VideoConference loopbackSessionWaitingForSIPInvite](self, "loopbackSessionWaitingForSIPInvite");
  -[VideoConference unlock](self, "unlock");
  return v3 != 0;
}

- (id)loopbackSessionWaitingForSIPInvite
{
  NSMutableDictionary *sessionDict;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  sessionDict = self->_sessionDict;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](sessionDict, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = *(_QWORD *)v12;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v6)
      objc_enumerationMutation(sessionDict);
    v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
    if (objc_msgSend(v8, "state") == 6
      && objc_msgSend(v8, "remoteParticipantID")
      && !objc_msgSend(v8, "receivedSIPInvite"))
    {
      return v8;
    }
    if (v5 == ++v7)
    {
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](sessionDict, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      if (v5)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)sessionForIncomingParticipantID:(id)a3
{
  NSMutableDictionary *sessionDict;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  sessionDict = self->_sessionDict;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](sessionDict, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(sessionDict);
        v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
        if (objc_msgSend(v10, "sipState") == 6
          && objc_msgSend(v10, "remoteParticipantID")
          && objc_msgSend((id)objc_msgSend(v10, "remoteParticipantID"), "isEqualToString:", a3))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              if (v10)
                v13 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "UTF8String");
              else
                v13 = "<nil>";
              v15 = 136315906;
              v16 = v11;
              v17 = 2080;
              v18 = "-[VideoConference(SessionInfo) sessionForIncomingParticipantID:]";
              v19 = 1024;
              v20 = 2983;
              v21 = 2080;
              v22 = v13;
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d sessionForIncomingParticipantID returned: %s", (uint8_t *)&v15, 0x26u);
            }
          }
          return v10;
        }
      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](sessionDict, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  return 0;
}

- (int)stateForCallID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  int v6;

  v3 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3));
  if (v5)
    v6 = objc_msgSend(v5, "state");
  else
    v6 = 8;
  -[VideoConference unlock](self, "unlock");
  return v6;
}

- (void)wrlock
{
  pthread_rwlock_wrlock(&self->stateLock);
}

- (int)tryrdlock
{
  return pthread_rwlock_tryrdlock(&self->stateLock);
}

- (void)rdlock
{
  pthread_rwlock_rdlock(&self->stateLock);
}

- (void)unlock
{
  pthread_rwlock_unlock(&self->stateLock);
}

- (void)stopCallID:(unsigned int)a3 didRemoteCancel:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  uint64_t v7;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[VideoConference rdlock](self, "rdlock");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v7);
  v11 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v10);
  v12 = v11;

  -[VideoConference unlock](self, "unlock");
  if (objc_msgSend(v11, "isCallOngoing"))
    -[VCObject startTimeoutTimer](self, "startTimeoutTimer");
  objc_msgSend(v11, "disconnect:didRemoteCancel:", a5, v6);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v11)
        v15 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
      else
        v15 = "<nil>";
      v16 = 136316418;
      v17 = v13;
      v18 = 2080;
      v19 = "-[VideoConference(PrivateMethods) stopCallID:didRemoteCancel:error:]";
      v20 = 1024;
      v21 = 3044;
      v22 = 1024;
      v23 = v7;
      v24 = 1024;
      v25 = v6;
      v26 = 2080;
      v27 = v15;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d stopCallID: %d, didRemoteCancel = %d, session = %s", (uint8_t *)&v16, 0x32u);
    }
  }

  if (!(_DWORD)v7)
    -[VideoConference markUnfinishedSessions](self, "markUnfinishedSessions");
  objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "releaseQueueForStreamToken:", v7);

}

- (void)cancelCallID:(unsigned int)a3 error:(id)a4
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[VideoConference rdlock](self, "rdlock");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v5);
  v9 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", v8);
  v10 = v9;

  -[VideoConference unlock](self, "unlock");
  objc_msgSend(v9, "cancel:", a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v9)
        v13 = (const char *)objc_msgSend((id)objc_msgSend(v9, "description"), "UTF8String");
      else
        v13 = "<nil>";
      v14 = 136316162;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VideoConference(PrivateMethods) cancelCallID:error:]";
      v18 = 1024;
      v19 = 3074;
      v20 = 1024;
      v21 = v5;
      v22 = 2080;
      v23 = v13;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d cancelCallID: %d, session = %s", (uint8_t *)&v14, 0x2Cu);
    }
  }

  if (!(_DWORD)v5)
    -[VideoConference markUnfinishedSessions](self, "markUnfinishedSessions");
  objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "releaseQueueForStreamToken:", v5);

}

- (void)cleanupSession:(id)a3 withDelay:(unint64_t)a4
{
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3978];
  v6[0] = CFSTR("session");
  v6[1] = CFSTR("date");
  v7[0] = a3;
  v7[1] = objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)a4);
  objc_msgSend(v5, "detachNewThreadSelector:toTarget:withObject:", sel_cleanupProc_, self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
}

- (void)cleanupProc:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend(MEMORY[0x1E0CB3978], "sleepUntilDate:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("date")));
  -[VideoConference threadSafeCleanupSession:](self, "threadSafeCleanupSession:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("session")));

}

- (void)defaultCleanupSession:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VideoConference(PrivateMethods) defaultCleanupSession:]";
      v11 = 1024;
      v12 = 3106;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d defaultCleanupSession!", (uint8_t *)&v7, 0x1Cu);
    }
  }
  -[VideoConference cleanupSession:withDelay:](self, "cleanupSession:withDelay:", a3, 0);
}

- (void)threadSafeCleanupSession:(id)a3
{
  int ErrorLogLevelForModule;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = v7;
      v13 = 2080;
      v14 = "-[VideoConference(PrivateMethods) threadSafeCleanupSession:]";
      v15 = 1024;
      v16 = 3111;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d threadSafeCleanupSession!", (uint8_t *)&v11, 0x1Cu);
    }
  }
  -[VideoConference wrlock](self, "wrlock");
  -[VideoConference cleanupSession:didRemoteCancel:](self, "cleanupSession:didRemoteCancel:", a3, 0);
  -[VideoConference unlock](self, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = v9;
      v13 = 2080;
      v14 = "-[VideoConference(PrivateMethods) threadSafeCleanupSession:]";
      v15 = 1024;
      v16 = 3116;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d threadSafeCleanupSession end!", (uint8_t *)&v11, 0x1Cu);
    }
  }
}

- (void)cleanupSession:(id)a3 didRemoteCancel:(BOOL)a4
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *delegateNotificationQueue;
  _QWORD v10[6];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v8 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v8 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VideoConference(PrivateMethods) cleanupSession:didRemoteCancel:]";
      v15 = 1024;
      v16 = 3121;
      v17 = 2080;
      v18 = v8;
      v19 = 1024;
      v20 = objc_msgSend(a3, "state") == 1;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d cleanupSession: session = %s, session.state == GKVoiceChatServiceStateRunning = %d", buf, 0x2Cu);
    }
  }
  if (a3)
  {
    if (objc_msgSend(a3, "isEqual:", self->currentFocusSession))
    {
      self->currentFocusSession = 0;

      self->currentFocus = 0;
    }
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
    {
      delegateNotificationQueue = self->delegateNotificationQueue;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __66__VideoConference_PrivateMethods__cleanupSession_didRemoteCancel___block_invoke;
      v10[3] = &unk_1E9E52238;
      v10[4] = self;
      v10[5] = a3;
      dispatch_async(delegateNotificationQueue, v10);
      -[VideoConference cleanupSpatialAudioForCallID:](self, "cleanupSpatialAudioForCallID:", objc_msgSend(a3, "callID"));
      objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "unregisterCaptionsSourceWithStreamToken:", objc_msgSend(a3, "callID"));
      -[VCMediaRecorderManager unregisterMediaRecorderWithStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "unregisterMediaRecorderWithStreamToken:", objc_msgSend(a3, "callID"));
      -[NSMutableDictionary removeObjectForKey:](self->_sessionDict, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "callID")));

      self->_sessionArray = (NSArray *)(id)-[NSMutableDictionary allValues](self->_sessionDict, "allValues");
    }
  }
}

uint64_t __66__VideoConference_PrivateMethods__cleanupSession_didRemoteCancel___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:closeConnectionForCallID:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "callID"));
  return result;
}

- (BOOL)setPauseAudio:(BOOL)a3
{
  uint64_t v5;
  NSObject *global_queue;
  _QWORD v8[6];
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v5 = -[NSMutableDictionary allValues](self->_sessionDict, "allValues");
  global_queue = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__VideoConference_PrivateMethods__setPauseAudio___block_invoke;
  v8[3] = &unk_1E9E52210;
  v8[4] = v5;
  v8[5] = self;
  v9 = a3;
  dispatch_async(global_queue, v8);
  -[VideoConference unlock](self, "unlock");
  return 1;
}

void __49__VideoConference_PrivateMethods__setPauseAudio___block_invoke(uint64_t a1)
{
  size_t v2;
  NSObject *global_queue;
  _QWORD v4[4];
  __int128 v5;
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__VideoConference_PrivateMethods__setPauseAudio___block_invoke_2;
  v4[3] = &unk_1E9E55EA8;
  v5 = *(_OWORD *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 48);
  dispatch_apply(v2, global_queue, v4);
}

void __49__VideoConference_PrivateMethods__setPauseAudio___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  int ErrorLogLevelForModule;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v5 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      if (v8)
      {
        v9 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        if (v3)
        {
LABEL_5:
          v10 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
LABEL_8:
          *(_DWORD *)buf = 136316162;
          v18 = v6;
          v19 = 2080;
          v20 = "-[VideoConference(PrivateMethods) setPauseAudio:]_block_invoke_2";
          v21 = 1024;
          v22 = 3156;
          v23 = 2080;
          v24 = v9;
          v25 = 2080;
          v26 = v10;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d InterruptMe:%s Begin Pausing audio session %s", buf, 0x30u);
          goto LABEL_9;
        }
      }
      else
      {
        v9 = "<nil>";
        if (v3)
          goto LABEL_5;
      }
      v10 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  v16 = 0;
  objc_msgSend(v3, "setPauseAudio:error:", *(unsigned __int8 *)(a1 + 48), &v16);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(void **)(a1 + 40);
      if (v13)
      {
        v14 = (const char *)objc_msgSend((id)objc_msgSend(v13, "description"), "UTF8String");
        if (v3)
        {
LABEL_13:
          v15 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
LABEL_16:
          *(_DWORD *)buf = 136316162;
          v18 = v11;
          v19 = 2080;
          v20 = "-[VideoConference(PrivateMethods) setPauseAudio:]_block_invoke";
          v21 = 1024;
          v22 = 3160;
          v23 = 2080;
          v24 = v14;
          v25 = 2080;
          v26 = v15;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d InterruptMe:%s End Pausing audio session  done%s", buf, 0x30u);
          return;
        }
      }
      else
      {
        v14 = "<nil>";
        if (v3)
          goto LABEL_13;
      }
      v15 = "<nil>";
      goto LABEL_16;
    }
  }
}

- (BOOL)setPauseVideo:(BOOL)a3
{
  uint64_t v5;
  NSObject *global_queue;
  _QWORD block[5];
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v5 = -[NSMutableDictionary allValues](self->_sessionDict, "allValues");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VideoConference_PrivateMethods__setPauseVideo___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = v5;
  v9 = a3;
  dispatch_async(global_queue, block);
  -[VideoConference unlock](self, "unlock");
  return 1;
}

void __49__VideoConference_PrivateMethods__setPauseVideo___block_invoke(uint64_t a1)
{
  size_t v2;
  NSObject *global_queue;
  _QWORD block[5];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VideoConference_PrivateMethods__setPauseVideo___block_invoke_2;
  block[3] = &unk_1E9E544C8;
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_BYTE *)(a1 + 40);
  dispatch_apply(v2, global_queue, block);
}

uint64_t __49__VideoConference_PrivateMethods__setPauseVideo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5[0] = 0;
  return objc_msgSend(v3, "setPauseVideo:error:", *(unsigned __int8 *)(a1 + 40), v5);
}

- (void)markUnfinishedSessions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_sessionArray);
  -[VideoConference unlock](self, "unlock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "timeoutUnfinishedConnection");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }

}

- (void)session:(id)a3 withCallID:(unsigned int)a4 networkHint:(BOOL)a5
{
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  unsigned int v7;
  BOOL v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VideoConference_SessionDelegate__session_withCallID_networkHint___block_invoke;
  block[3] = &unk_1E9E55ED0;
  block[4] = self;
  v7 = a4;
  v8 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __67__VideoConference_SessionDelegate__session_withCallID_networkHint___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:withCallID:networkHint:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44));
  return result;
}

- (void)session:(id)a3 withCallID:(unsigned int)a4 videoIsDegraded:(BOOL)a5 isRemote:(BOOL)a6
{
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  unsigned int v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__VideoConference_SessionDelegate__session_withCallID_videoIsDegraded_isRemote___block_invoke;
  block[3] = &unk_1E9E55EF8;
  block[4] = self;
  v8 = a4;
  v9 = a5;
  v10 = a6;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __80__VideoConference_SessionDelegate__session_withCallID_videoIsDegraded_isRemote___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:videoQualityNotificationForCallID:isDegraded:isRemote:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned __int8 *)(a1 + 44), *(unsigned __int8 *)(a1 + 45));
  if (*(_BYTE *)(a1 + 45))
    return objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidDegrade:streamToken:", *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  return result;
}

- (void)session:(id)a3 localIPChange:(id)a4 withCallID:(unsigned int)a5
{
  NSObject *delegateNotificationQueue;
  _QWORD v6[6];
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__VideoConference_SessionDelegate__session_localIPChange_withCallID___block_invoke;
  v6[3] = &unk_1E9E522D8;
  v6[4] = self;
  v6[5] = a4;
  v7 = a5;
  dispatch_async(delegateNotificationQueue, v6);
}

uint64_t __69__VideoConference_SessionDelegate__session_localIPChange_withCallID___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:localIPChange:withCallID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  return result;
}

- (void)session:(id)a3 connectionDidChangeWithLocalInterfaceType:(id)a4 remoteInterfaceType:(id)a5 callID:(unsigned int)a6
{
  NSObject *delegateNotificationQueue;
  _QWORD v7[6];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __113__VideoConference_SessionDelegate__session_connectionDidChangeWithLocalInterfaceType_remoteInterfaceType_callID___block_invoke;
  v7[3] = &unk_1E9E522D8;
  v7[4] = a4;
  v7[5] = a5;
  v8 = a6;
  dispatch_async(delegateNotificationQueue, v7);
}

uint64_t __113__VideoConference_SessionDelegate__session_connectionDidChangeWithLocalInterfaceType_remoteInterfaceType_callID___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "connectionDidChangeWithLocalInterfaceType:remoteInterfaceType:streamToken:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

- (void)session:(id)a3 didStart:(BOOL)a4 connectionType:(unsigned int)a5 localInterfaceType:(id)a6 remoteInterfaceType:(id)a7 error:(id)a8
{
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v15;
  int *v16;
  const char *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  NSObject *delegateNotificationQueue;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  NSObject *log;
  id v33;
  id v34;
  _QWORD block[9];
  int v36;
  BOOL v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  VideoConference *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  uint64_t v58;

  v11 = *(_QWORD *)&a5;
  v12 = a4;
  v58 = *MEMORY[0x1E0C80C00];
  if (!a4 || (objc_msgSend(a3, "isCallOngoing") & 1) != 0)
  {
    -[VideoConference rdlock](self, "rdlock");
    v15 = objc_msgSend(a3, "callID");
    v16 = &OBJC_IVAR___VCCallSession_packetLossRate;
    v34 = a8;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7
      || (v31 = VRTraceErrorLogLevelToCSTR(),
          log = *MEMORY[0x1E0CF2758],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT)))
    {
LABEL_22:
      v33 = a7;
      if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v16[150]), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
      {
        if (v12)
        {
          self->mostRecentStartedCall = v15;
        }
        else
        {
          -[VCObject stopTimeoutTimer](self, "stopTimeoutTimer");
          -[VideoConference defaultCleanupSession:](self, "defaultCleanupSession:", a3);
        }
      }
      -[VideoConference unlock](self, "unlock");
      v18 = v15;
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v15);
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v12);
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v11);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v19, CFSTR("callID"), v20, CFSTR("didStart"), v21, CFSTR("connType"), 0);
      MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ VideoConference-didStart");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v25 = -[VideoConference conferenceOperatingMode](self, "conferenceOperatingMode");
          *(_DWORD *)buf = 136316162;
          v39 = v23;
          v40 = 2080;
          v41 = "-[VideoConference(SessionDelegate) session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:]";
          v42 = 1024;
          v43 = 3309;
          v44 = 2048;
          v45 = self;
          v46 = 1024;
          v47 = v25;
          _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d @:@ VideoConference-didStart (%p) operatingMode=%d", buf, 0x2Cu);
        }
      }
      delegateNotificationQueue = self->delegateNotificationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __113__VideoConference_SessionDelegate__session_didStart_connectionType_localInterfaceType_remoteInterfaceType_error___block_invoke;
      block[3] = &unk_1E9E55F20;
      v37 = v12;
      v36 = v18;
      block[4] = self;
      block[5] = v22;
      block[6] = v34;
      block[7] = a6;
      block[8] = v33;
      dispatch_async(delegateNotificationQueue, block);

      return;
    }
    if (a3)
    {
      v30 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      if (a6)
        goto LABEL_7;
    }
    else
    {
      v30 = "<nil>";
      if (a6)
      {
LABEL_7:
        v29 = (const char *)objc_msgSend((id)objc_msgSend(a6, "description"), "UTF8String");
        if (a7)
        {
LABEL_8:
          v28 = (const char *)objc_msgSend((id)objc_msgSend(a7, "description"), "UTF8String");
LABEL_15:
          if (a8)
            v27 = (const char *)objc_msgSend((id)objc_msgSend(a8, "description"), "UTF8String");
          else
            v27 = "<nil>";
          if (-[NSMutableDictionary objectForKey:](self->_sessionDict, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
          {
            v17 = (const char *)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_sessionDict, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))), "description"), "UTF8String");
          }
          else
          {
            v17 = "<nil>";
          }
          *(_DWORD *)buf = 136317442;
          v39 = v31;
          v40 = 2080;
          v41 = "-[VideoConference(SessionDelegate) session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:]";
          v42 = 1024;
          v43 = 3283;
          v44 = 2080;
          v45 = (VideoConference *)v30;
          v46 = 1024;
          v47 = v12;
          v48 = 1024;
          v49 = v11;
          v50 = 2080;
          v51 = v29;
          v52 = 2080;
          v53 = v28;
          v54 = 2080;
          v55 = v27;
          v56 = 2080;
          v57 = v17;
          _os_log_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d didStart:session %s, didStart = %d, connType = %u, InterfaceType = %s, %s, error = %s, claimed Session = %s", buf, 0x5Au);
          v16 = &OBJC_IVAR___VCCallSession_packetLossRate;
          goto LABEL_22;
        }
LABEL_14:
        v28 = "<nil>";
        goto LABEL_15;
      }
    }
    v29 = "<nil>";
    if (a7)
      goto LABEL_8;
    goto LABEL_14;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VideoConference(SessionDelegate) session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:].cold.1();
  }
}

uint64_t __113__VideoConference_SessionDelegate__session_didStart_connectionType_localInterfaceType_remoteInterfaceType_error___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = objc_opt_respondsToSelector();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "videoConference:didStartSession:withCallID:withUserInfo:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didStartSession:withCallID:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48));
  }
  return objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "connectionDidChangeWithLocalInterfaceType:remoteInterfaceType:streamToken:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 72));
}

- (void)session:(id)a3 cleanUpWithDelay:(int64_t)a4 error:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  id v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int64_t v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(a3, "callID");
      if (a5)
        v12 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
      else
        v12 = "<nil>";
      v14 = 136316418;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VideoConference(SessionDelegate) session:cleanUpWithDelay:error:]";
      v18 = 1024;
      v19 = 3334;
      v20 = 1024;
      v21 = v11;
      v22 = 2048;
      v23 = a4;
      v24 = 2080;
      v25 = v12;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference: clean up session (call ID %d) with delay %ld, error %s", (uint8_t *)&v14, 0x36u);
    }
  }
  -[VideoConference rdlock](self, "rdlock");
  v13 = a3;
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
  {
    -[VideoConference cleanupSession:withDelay:](self, "cleanupSession:withDelay:", a3, a4);
  }
  objc_msgSend(a3, "setQualityDelegate:", 0);
  -[VideoConference unlock](self, "unlock");

}

- (void)session:(id)a3 didStopWithError:(id)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  -[VCObject stopTimeoutTimer](self, "stopTimeoutTimer");
  delegateNotificationQueue = self->delegateNotificationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__VideoConference_SessionDelegate__session_didStopWithError___block_invoke;
  v8[3] = &unk_1E9E527D0;
  v8[4] = a3;
  v8[5] = self;
  v8[6] = a4;
  dispatch_async(delegateNotificationQueue, v8);
}

uint64_t __61__VideoConference_SessionDelegate__session_didStopWithError___block_invoke(uint64_t a1)
{
  int ErrorLogLevelForModule;
  os_log_t *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v3 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "callID");
      v16 = 136315906;
      v17 = v4;
      v18 = 2080;
      v19 = "-[VideoConference(SessionDelegate) session:didStopWithError:]_block_invoke";
      v20 = 1024;
      v21 = 3353;
      v22 = 1024;
      v23 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference: notifying delegate of didStop for call ID %d", (uint8_t *)&v16, 0x22u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "callID");
      if (objc_msgSend(*(id *)(a1 + 32), "dtxMetrics"))
        v10 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "dtxMetrics"), "description"), "UTF8String");
      else
        v10 = "<nil>";
      v16 = 136316162;
      v17 = v7;
      v18 = 2080;
      v19 = "-[VideoConference(SessionDelegate) session:didStopWithError:]_block_invoke";
      v20 = 1024;
      v21 = 3354;
      v22 = 1024;
      v23 = v9;
      v24 = 2080;
      v25 = v10;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VCCallSession callID[%d] call end audio metrics: %s", (uint8_t *)&v16, 0x2Cu);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v11 = objc_opt_respondsToSelector();
  v12 = (void *)objc_msgSend(*(id *)(a1 + 40), "delegate");
  v13 = *(_QWORD *)(a1 + 40);
  v14 = objc_msgSend(*(id *)(a1 + 32), "callID");
  if ((v11 & 1) != 0)
    return objc_msgSend(v12, "videoConference:didStopWithCallID:error:callMetadata:", v13, v14, *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "callMetadata"));
  else
    return objc_msgSend(v12, "videoConference:didStopWithCallID:error:", v13, v14, *(_QWORD *)(a1 + 48));
}

- (void)session:(id)a3 receivedNoPacketsForSeconds:(double)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__VideoConference_SessionDelegate__session_receivedNoPacketsForSeconds___block_invoke;
  v5[3] = &unk_1E9E53820;
  *(double *)&v5[6] = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(delegateNotificationQueue, v5);
}

uint64_t __72__VideoConference_SessionDelegate__session_receivedNoPacketsForSeconds___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:receivedNoRemotePacketsForTime:callID:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "callID"), *(double *)(a1 + 48));
  return result;
}

- (void)session:(id)a3 remoteMediaStalled:(BOOL)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__VideoConference_SessionDelegate__session_remoteMediaStalled___block_invoke;
  v5[3] = &unk_1E9E52210;
  v6 = a4;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(delegateNotificationQueue, v5);
}

uint64_t __63__VideoConference_SessionDelegate__session_remoteMediaStalled___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:remoteMediaStalled:callID:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "callID"));
  return objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteMediaDidStall:streamToken:", *(unsigned __int8 *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "callID"));
}

- (void)session:(id)a3 packMeters:(char *)a4 withLength:(char *)a5
{
  int chatMode;
  int v10;
  __int16 v11;
  uint64_t i;
  int v13;
  char v14;

  chatMode = self->chatMode;
  if (chatMode == 2)
  {
    v14 = 0;
  }
  else
  {
    if (chatMode)
      return;
    if (self->isFocus)
    {
      v10 = -[NSArray count](self->connectedPeers, "count");
      if (v10 < 2)
      {
        v11 = 0;
      }
      else
      {
        v11 = 0;
        for (i = 1; i != v10; ++i)
        {
          if (self->speakingArray[i])
            v13 = 1 << i;
          else
            LOWORD(v13) = 0;
          v11 |= v13;
        }
      }
      *(_WORD *)a4 = v11 | (objc_msgSend(a3, "inputMeter") != 0);
      v14 = 2;
    }
    else
    {
      *a4 = objc_msgSend(a3, "inputMeter");
      v14 = 1;
    }
  }
  *a5 = v14;
}

- (void)session:(id)a3 didChangeVideoRule:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;

  if (!objc_msgSend(a4, "iWidth", a3) || !objc_msgSend(a4, "iHeight"))
  {
    v6 = -[VCVideoRule iWidth](self->conferenceCaptureRule, "iWidth");
    v7 = -[VCVideoRule iHeight](self->conferenceCaptureRule, "iHeight");
    objc_msgSend(a4, "fRate");
    objc_msgSend(a4, "setFrameWidth:frameHeight:frameRate:", v6, v7);
  }
  objc_msgSend(a4, "fRate");
  if (v8 == 0.0)
  {
    v9 = objc_msgSend(a4, "iWidth");
    v10 = objc_msgSend(a4, "iHeight");
    -[VCVideoRule fRate](self->conferenceCaptureRule, "fRate");
    objc_msgSend(a4, "setFrameWidth:frameHeight:frameRate:", v9, v10);
  }
  v11 = objc_msgSend(a4, "iWidth");
  v12 = objc_msgSend(a4, "iHeight");
  objc_msgSend(a4, "fRate");
  -[VideoConference initiateResolutionChangeToWidth:height:rate:](self, "initiateResolutionChangeToWidth:height:rate:", v11, v12, (int)v13);
}

- (BOOL)session:(id)a3 receivedRemoteFrame:(__CVBuffer *)a4 atTime:(id *)a5 withScreenAttributes:(id)a6 videoAttributes:(id)a7 isFirstFrame:(BOOL)a8 isVideoPaused:(BOOL)a9
{
  _opaque_pthread_mutex_t *p_xRemoteLayer;
  CFMutableDictionaryRef EncodedCFDictionary;
  char *v17;
  VCImageQueue *backQueue;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  char *currentFacing;
  uint64_t v23;
  VCVideoRelay *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  VCImageQueue *currentQueue;
  uint64_t v30;
  NSObject *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  VideoConference *v36;
  VideoConference *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  NSObject *delegateNotificationQueue;
  uint64_t v42;
  NSObject *v43;
  VideoConference *v44;
  VideoConference *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  NSObject *v49;
  CameraConferenceSynchronizer *synchronizer;
  _BOOL4 v52;
  _QWORD v53[6];
  _QWORD v54[7];
  _QWORD block[7];
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  int v57;
  __int16 v58;
  VideoConference *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  int v63;
  uint64_t v64;

  v52 = a8;
  v64 = *MEMORY[0x1E0C80C00];
  p_xRemoteLayer = &self->xRemoteLayer;
  pthread_mutex_lock(&self->xRemoteLayer);
  if (a7)
  {
    EncodedCFDictionary = VideoAttributes_CreateEncodedCFDictionary(a7);
    VCImageQueue_EnqueueAttributes((uint64_t)self->currentQueue, EncodedCFDictionary);
    if (EncodedCFDictionary)
      CFRelease(EncodedCFDictionary);
    if (objc_msgSend(a7, "videoSourceScreen"))
    {
      self->currentQueue = self->screenQueue;
      v17 = "screen";
    }
    else if (objc_msgSend(a7, "camera") && (backQueue = self->backQueue) != 0)
    {
      self->currentQueue = backQueue;
      v17 = "back";
    }
    else
    {
      self->currentQueue = self->frontQueue;
      v17 = "front";
    }
  }
  else
  {
    if (self->currentQueue)
      goto LABEL_13;
    self->currentQueue = self->frontQueue;
    v17 = "front";
  }
  self->currentFacing = v17;
LABEL_13:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    v21 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        currentFacing = self->currentFacing;
        LODWORD(buf.var0) = 136315906;
        *(int64_t *)((char *)&buf.var0 + 4) = v19;
        LOWORD(buf.var2) = 2080;
        *(_QWORD *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        v57 = 3475;
        v58 = 2080;
        v59 = (VideoConference *)currentFacing;
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d FigImageQueueEnqueueImage [remote - %s] queue", (uint8_t *)&buf, 0x26u);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      -[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:].cold.4();
    }
  }
  if (!self->currentQueue && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:].cold.3();
  }
  if (self->_deviceRole == 3)
  {
    v23 = VCCameraStatusBitsFromVideoAttributes(a7);
    v24 = +[VCVideoRelay sharedInstance](VCVideoRelay, "sharedInstance");
    buf = *a5;
    if (!-[VCVideoRelay enqueueFrame:atTime:cameraStatusBits:](v24, "enqueueFrame:atTime:cameraStatusBits:", a4, &buf, v23)&& (int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      v27 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          goto LABEL_39;
        LODWORD(buf.var0) = 136315906;
        *(int64_t *)((char *)&buf.var0 + 4) = v25;
        LOWORD(buf.var2) = 2080;
        *(_QWORD *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        v57 = 3490;
        v58 = 2048;
        v59 = self;
        v28 = "VideoConference [%s] %s:%d VCVideoRelay enqueueFrame failed; self = %p";
LABEL_34:
        _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&buf, 0x26u);
        goto LABEL_39;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:].cold.1();
    }
  }
  else
  {
    currentQueue = self->currentQueue;
    buf = *a5;
    if ((VCImageQueue_EnqueueFrame((uint64_t)currentQueue, a4, (CMTime *)&buf) & 1) == 0
      && (int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      v31 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          goto LABEL_39;
        v32 = self->currentFacing;
        LODWORD(buf.var0) = 136315906;
        *(int64_t *)((char *)&buf.var0 + 4) = v30;
        LOWORD(buf.var2) = 2080;
        *(_QWORD *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        v57 = 3495;
        v58 = 2080;
        v59 = (VideoConference *)v32;
        v28 = "VideoConference [%s] %s:%d FigImageQueueEnqueueImage skipped [remote - %s] queue full!";
        goto LABEL_34;
      }
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:].cold.2();
    }
  }
LABEL_39:
  pthread_mutex_unlock(p_xRemoteLayer);
  v33 = MEMORY[0x1E0C809B0];
  if (a6)
  {
    VCMediaRecorder_UpdateTargetScreenAttributes((uint64_t)self->_vcMediaRecorder, (uint64_t)a7);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a6, "ratio");
        v37 = v36;
        objc_msgSend(a6, "ratio");
        v39 = v38;
        v40 = objc_msgSend(a6, "orientation");
        LODWORD(buf.var0) = 136316418;
        *(int64_t *)((char *)&buf.var0 + 4) = v34;
        LOWORD(buf.var2) = 2080;
        *(_QWORD *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        v57 = 3505;
        v58 = 2048;
        v59 = v37;
        v60 = 2048;
        v61 = v39;
        v62 = 1024;
        v63 = v40;
        _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d screen attributes: %fx%f orientation:%d", (uint8_t *)&buf, 0x36u);
      }
    }
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = v33;
    block[1] = 3221225472;
    block[2] = __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke;
    block[3] = &unk_1E9E527D0;
    block[4] = self;
    block[5] = a6;
    block[6] = a3;
    dispatch_async(delegateNotificationQueue, block);
  }
  if (a7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v42 = VRTraceErrorLogLevelToCSTR();
      v43 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a7, "ratio");
        v45 = v44;
        objc_msgSend(a7, "ratio");
        v47 = v46;
        v48 = objc_msgSend(a7, "orientation");
        LODWORD(buf.var0) = 136316418;
        *(int64_t *)((char *)&buf.var0 + 4) = v42;
        LOWORD(buf.var2) = 2080;
        *(_QWORD *)((char *)&buf.var2 + 2) = "-[VideoConference(SessionDelegate) session:receivedRemoteFrame:atTime:withS"
                                             "creenAttributes:videoAttributes:isFirstFrame:isVideoPaused:]";
        HIWORD(buf.var3) = 1024;
        v57 = 3518;
        v58 = 2048;
        v59 = v45;
        v60 = 2048;
        v61 = v47;
        v62 = 1024;
        v63 = v48;
        _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video attributes: %fx%f orientation:%d", (uint8_t *)&buf, 0x36u);
      }
    }
    v49 = self->delegateNotificationQueue;
    v54[0] = v33;
    v54[1] = 3221225472;
    v54[2] = __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_611;
    v54[3] = &unk_1E9E527D0;
    v54[4] = self;
    v54[5] = a7;
    v54[6] = a3;
    dispatch_async(v49, v54);
  }
  if (v52)
  {
    synchronizer = self->synchronizer;
    v53[0] = v33;
    v53[1] = 3221225472;
    v53[2] = __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_2;
    v53[3] = &unk_1E9E52238;
    v53[4] = self;
    v53[5] = a3;
    -[CameraConferenceSynchronizer scheduleFirstRemoteFrameNotification:](synchronizer, "scheduleFirstRemoteFrameNotification:", v53);
  }
  return 1;
}

void __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didRemoteScreenAttributesChange:forCallID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "callID"));
  v2 = VCRemoteVideoManager_DefaultManager();
  VCRemoteVideoManager_RemoteScreenAttributesDidChange(v2, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "callID"));
}

void __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_611(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didRemoteVideoAttributesChange:forCallID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "callID"));
  v2 = VCRemoteVideoManager_DefaultManager();
  VCRemoteVideoManager_RemoteVideoAttributesDidChange(v2, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "callID"));
}

void __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_2(uint64_t a1)
{
  __int128 v1;
  NSObject *v2;
  _QWORD block[4];
  __int128 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1024);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_3;
  block[3] = &unk_1E9E52238;
  v4 = v1;
  dispatch_async(v2, block);
}

void __135__VideoConference_SessionDelegate__session_receivedRemoteFrame_atTime_withScreenAttributes_videoAttributes_isFirstFrame_isVideoPaused___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didReceiveFirstRemoteFrameForCallID:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "callID"));
  v2 = VCRemoteVideoManager_DefaultManager();
  VCRemoteVideoManager_DidReceiveFirstRemoteFrameForStreamToken(v2, objc_msgSend(*(id *)(a1 + 40), "callID"));
}

- (void)session:(id)a3 didReceiveARPLData:(id)a4 fromCallID:(unsigned int)a5
{
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];
  unsigned int v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v16 = v8;
      v17 = 2080;
      v18 = "-[VideoConference(SessionDelegate) session:didReceiveARPLData:fromCallID:]";
      v19 = 1024;
      v20 = 3551;
      v21 = 1024;
      v22 = a5;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d >>>>> Relaying incoming ARPL data from VCCallSession to VideoConferenceManager with callID=%d (in VideoConference) <<<<<", buf, 0x22u);
    }
  }
  if (!a4 && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = v10;
      v17 = 2080;
      v18 = "-[VideoConference(SessionDelegate) session:didReceiveARPLData:fromCallID:]";
      v19 = 1024;
      v20 = 3554;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d >>>>> DATA ERROR (in VideoConference) <<<<<", buf, 0x1Cu);
    }
  }
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__VideoConference_SessionDelegate__session_didReceiveARPLData_fromCallID___block_invoke;
  block[3] = &unk_1E9E522D8;
  block[4] = self;
  block[5] = a4;
  v14 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __74__VideoConference_SessionDelegate__session_didReceiveARPLData_fromCallID___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didReceiveARPLData:fromCallID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
  return result;
}

- (void)session:(id)a3 didReceiveData:(id)a4 messageType:(unsigned int)a5 withCallID:(unsigned int)a6
{
  NSObject *delegateNotificationQueue;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[6];
  unsigned int v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a5 == 1)
  {
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__VideoConference_SessionDelegate__session_didReceiveData_messageType_withCallID___block_invoke;
    block[3] = &unk_1E9E522D8;
    block[4] = self;
    block[5] = a4;
    v12 = a6;
    dispatch_async(delegateNotificationQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v14 = v9;
      v15 = 2080;
      v16 = "-[VideoConference(SessionDelegate) session:didReceiveData:messageType:withCallID:]";
      v17 = 1024;
      v18 = 3575;
      v19 = 1024;
      v20 = a6;
      v21 = 1024;
      v22 = a5;
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, "VideoConference [%s] %s:%d Unsupported data received from callId=%d with messageType=%u", buf, 0x28u);
    }
  }
}

uint64_t __82__VideoConference_SessionDelegate__session_didReceiveData_messageType_withCallID___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didReceiveData:forCallID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
}

- (BOOL)session:(id)a3 startVideoSend:(id *)a4 captureRuleWifi:(id)a5 captureRuleCell:(id)a6 interface:(int)a7 isUnpausing:(BOOL)a8
{
  _BOOL8 v8;
  uint64_t v12;
  NSObject *v13;
  int deviceRole;
  uint64_t v15;
  NSObject *v16;
  VCMediaRecorder *vcMediaRecorder;
  int v18;
  int v19;
  void *conferenceCaptureRule;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  int v24;
  int v25;
  float v26;
  BOOL v27;
  int v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BYTE v36[10];
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  _BOOL4 v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v8 = a8;
  v44 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      deviceRole = self->_deviceRole;
      v29 = 136316930;
      v30 = v12;
      v31 = 2080;
      v32 = "-[VideoConference(SessionDelegate) session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:]";
      v33 = 1024;
      v34 = 3589;
      v35 = 2048;
      *(_QWORD *)v36 = self;
      *(_WORD *)&v36[8] = 2112;
      v37 = a5;
      v38 = 2112;
      v39 = a6;
      v40 = 1024;
      v41 = v8;
      v42 = 1024;
      v43 = deviceRole;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d self = %p, captureRuleWifi = %@, captureRuleCell=%@, isUnpausing = %d, _deviceRole = %d", (uint8_t *)&v29, 0x46u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315906;
      v30 = v15;
      v31 = 2080;
      v32 = "-[VideoConference(SessionDelegate) session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:]";
      v33 = 1024;
      v34 = 3592;
      v35 = 2112;
      *(_QWORD *)v36 = a5;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Capture rule set to %@", (uint8_t *)&v29, 0x26u);
    }
  }
  if (-[VCDefaults momentsUserPreferenceEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "momentsUserPreferenceEnabled"))
  {
    vcMediaRecorder = self->_vcMediaRecorder;
    objc_msgSend(a5, "fRate");
    -[VCMediaRecorder setFrameRate:](vcMediaRecorder, "setFrameRate:");
  }
  LOBYTE(self->downstreamBandwidth) = 1;
  if (!-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
  {
    v18 = objc_msgSend(a5, "iWidth");
    if (objc_msgSend(a5, "iHeight") * v18 == 176640)
    {
      objc_msgSend(a5, "fRate");
      objc_msgSend(a5, "setFrameWidth:frameHeight:frameRate:", 640, 480);
    }
    v19 = objc_msgSend(a5, "iWidth");
    if (objc_msgSend(a5, "iHeight") * v19 == 130560)
    {
      objc_msgSend(a5, "fRate");
      objc_msgSend(a5, "setFrameWidth:frameHeight:frameRate:", 1280, 720);
    }
  }
  if (v8 && -[VCVideoRule iWidth](self->conferenceCaptureRule, "iWidth"))
  {
    conferenceCaptureRule = self->conferenceCaptureRule;
    v21 = a5;
  }
  else
  {
    v21 = self->conferenceCaptureRule;
    conferenceCaptureRule = a5;
  }
  objc_msgSend(v21, "setToVideoRule:", conferenceCaptureRule);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(a5, "iWidth");
      v25 = objc_msgSend(a5, "iHeight");
      objc_msgSend(a5, "fRate");
      v29 = 136316418;
      v30 = v22;
      v31 = 2080;
      v32 = "-[VideoConference(SessionDelegate) session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:]";
      v33 = 1024;
      v34 = 3626;
      v35 = 1024;
      *(_DWORD *)v36 = v24;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = v25;
      LOWORD(v37) = 1024;
      *(_DWORD *)((char *)&v37 + 2) = (int)v26;
      _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VIDEOCONFERENCE: Capture video settings %dx%d@%dfps", (uint8_t *)&v29, 0x2Eu);
    }
  }
  v27 = -[VideoConference registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:](self, "registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:", self->_deviceRole, a5, v8);
  if (!v27 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VideoConference(SessionDelegate) session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:].cold.1();
  }
  return v27;
}

- (BOOL)registerForVideoFramesWithDeviceRole:(int)a3 captureRule:(id)a4 isUnpausing:(BOOL)a5
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  CameraConferenceSynchronizer *synchronizer;
  int v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v21[0] = 0;
  v20 = 0;
  v8 = -[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance", *(_QWORD *)&a3, a4, a5), "getBestFrameWidth:frameHeight:frameRate:", (char *)v21 + 4, v21, &v20);
  if (a3 != 4)
  {
    if (v8)
    {
      if (-[VideoConference conferenceOperatingMode](self, "conferenceOperatingMode") == 1)
      {
        v10 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton");
        v11 = objc_msgSend(a4, "iWidth");
        v12 = objc_msgSend(a4, "iHeight");
        objc_msgSend(a4, "fRate");
        if ((objc_msgSend(v10, "registerForVideoFramesFromSource:withClient:width:height:frameRate:", 3, self, v11, v12, (int)v13) & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_19;
          VRTraceErrorLogLevelToCSTR();
          v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v9)
          {
            -[VideoConference(SessionDelegate) registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:].cold.2();
            goto LABEL_19;
          }
          return v9;
        }
      }
      else if (-[VideoConference conferenceOperatingMode](self, "conferenceOperatingMode") == 4)
      {
        v14 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton");
        v15 = objc_msgSend(a4, "iWidth");
        v16 = objc_msgSend(a4, "iHeight");
        objc_msgSend(a4, "fRate");
        if ((objc_msgSend(v14, "registerForVideoFramesFromSource:withClient:width:height:frameRate:", 1, self, v15, v16, (int)v17) & 1) == 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_19;
          VRTraceErrorLogLevelToCSTR();
          v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
          if (v9)
          {
            -[VideoConference(SessionDelegate) registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:].cold.3();
            goto LABEL_19;
          }
          return v9;
        }
      }
      synchronizer = self->synchronizer;
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 0);
      -[CameraConferenceSynchronizer setLocalPortraitAspectRatio:](synchronizer, "setLocalPortraitAspectRatio:");
      -[CameraConferenceSynchronizer scheduleCameraChangeToCaptureSettings:](self->synchronizer, "scheduleCameraChangeToCaptureSettings:", a4);
    }
LABEL_15:
    LOBYTE(v9) = 1;
    return v9;
  }
  if (-[VCVideoRelay registerForVideoFrames:](+[VCVideoRelay sharedInstance](VCVideoRelay, "sharedInstance"), "registerForVideoFrames:", self))
  {
    goto LABEL_15;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_19:
    LOBYTE(v9) = 0;
    return v9;
  }
  VRTraceErrorLogLevelToCSTR();
  v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v9)
  {
    -[VideoConference(SessionDelegate) registerForVideoFramesWithDeviceRole:captureRule:isUnpausing:].cold.1();
    goto LABEL_19;
  }
  return v9;
}

- (BOOL)session:(id)a3 startVideoReceive:(id *)a4
{
  _opaque_pthread_mutex_t *p_xRemoteLayer;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_xRemoteLayer = &self->xRemoteLayer;
  pthread_mutex_lock(&self->xRemoteLayer);
  v7 = objc_msgSend(a3, "negotiatedReceivingFramerate");
  if ((_DWORD)v7)
  {
    v8 = v7;
    -[VCImageQueue setFrameRate:](self->frontQueue, "setFrameRate:", v7);
    -[VCImageQueue setFrameRate:](self->backQueue, "setFrameRate:", v8);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 136315906;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VideoConference(SessionDelegate) session:startVideoReceive:]";
        v16 = 1024;
        v17 = 3710;
        v18 = 1024;
        v19 = v8;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d set receiving framerate for remote queue: %dfps", (uint8_t *)&v12, 0x22u);
      }
    }
  }
  -[VCImageQueue start](self->frontQueue, "start");
  -[VCImageQueue start](self->backQueue, "start");
  -[VCImageQueue start](self->screenQueue, "start");
  pthread_mutex_unlock(p_xRemoteLayer);
  return 1;
}

- (BOOL)stopVideoSend:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;
  uint64_t v6;
  NSObject *v7;
  int deviceRole;
  BOOL v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  VideoConference *v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      deviceRole = self->_deviceRole;
      v13 = 136316418;
      v14 = v6;
      v15 = 2080;
      v16 = "-[VideoConference(SessionDelegate) stopVideoSend:error:]";
      v17 = 1024;
      v18 = 3728;
      v19 = 2048;
      v20 = self;
      v21 = 1024;
      v22 = v4;
      v23 = 1024;
      v24 = deviceRole;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d self = %p, fullTeardown = %d, _deviceRole = %d", (uint8_t *)&v13, 0x32u);
    }
  }
  v9 = -[VideoConference deregisterForVideoFramesWithDeviceRole:](self, "deregisterForVideoFramesWithDeviceRole:", self->_deviceRole);
  if (v9)
  {
    VCMediaRecorder_ClearHistoryBuffer((uint64_t)self->_vcMediaRecorder);
    VCMediaRecorder_StopProcessingAllRequests((uint64_t)self->_vcMediaRecorder);
    if (v4)
    {
      self->localFrameWidth = 0;
      self->localFrameHeight = 0;
      -[VCVideoRule setToVideoRule:](self->conferenceCaptureRule, "setToVideoRule:", 0);
      -[CameraConferenceSynchronizer reset](self->synchronizer, "reset");
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315650;
        v14 = v10;
        v15 = 2080;
        v16 = "-[VideoConference(SessionDelegate) stopVideoSend:error:]";
        v17 = 1024;
        v18 = 3747;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video-stop-completed", (uint8_t *)&v13, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VideoConference(SessionDelegate) stopVideoSend:error:].cold.1();
  }
  return v9;
}

- (BOOL)deregisterForVideoFramesWithDeviceRole:(int)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  int v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v9[0] = 0;
  v8 = 0;
  v5 = -[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getBestFrameWidth:frameHeight:frameRate:", (char *)v9 + 4, v9, &v8);
  if (a3 != 4)
  {
    if (v5)
    {
      if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 3, self) & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_17;
        VRTraceErrorLogLevelToCSTR();
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (v6)
        {
          -[VideoConference(SessionDelegate) deregisterForVideoFramesWithDeviceRole:].cold.3();
          goto LABEL_17;
        }
        return v6;
      }
      if ((objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 1, self) & 1) == 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_17;
        VRTraceErrorLogLevelToCSTR();
        v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (v6)
        {
          -[VideoConference(SessionDelegate) deregisterForVideoFramesWithDeviceRole:].cold.2();
          goto LABEL_17;
        }
        return v6;
      }
      -[CameraConferenceSynchronizer scheduleCameraChangeToPreviewSettings](self->synchronizer, "scheduleCameraChangeToPreviewSettings");
    }
LABEL_10:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (-[VCVideoRelay deregisterForVideoFrames:](+[VCVideoRelay sharedInstance](VCVideoRelay, "sharedInstance"), "deregisterForVideoFrames:", self))
  {
    goto LABEL_10;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_17:
    LOBYTE(v6) = 0;
    return v6;
  }
  VRTraceErrorLogLevelToCSTR();
  v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v6)
  {
    -[VideoConference(SessionDelegate) deregisterForVideoFramesWithDeviceRole:].cold.1();
    goto LABEL_17;
  }
  return v6;
}

- (BOOL)session:(id)a3 stopVideoReceive:(id *)a4 isPausing:(BOOL)a5
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VideoConference *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((VideoConference *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VideoConference performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v17 = 136316162;
    v18 = v12;
    v19 = 2080;
    v20 = "-[VideoConference(SessionDelegate) session:stopVideoReceive:isPausing:]";
    v21 = 1024;
    v22 = 3786;
    v23 = 2112;
    v24 = v6;
    v25 = 2048;
    v26 = self;
    v9 = "VideoConference [%s] %s:%d %@(%p) ";
    v10 = v13;
    v11 = 48;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = v7;
      v19 = 2080;
      v20 = "-[VideoConference(SessionDelegate) session:stopVideoReceive:isPausing:]";
      v21 = 1024;
      v22 = 3786;
      v9 = "VideoConference [%s] %s:%d ";
      v10 = v8;
      v11 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v11);
    }
  }
LABEL_12:
  pthread_mutex_lock(&self->xRemoteLayer);
  -[VCImageQueue pause](self->frontQueue, "pause");
  -[VCImageQueue pause](self->backQueue, "pause");
  -[VCImageQueue pause](self->screenQueue, "pause");
  pthread_mutex_unlock(&self->xRemoteLayer);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = v14;
      v19 = 2080;
      v20 = "-[VideoConference(SessionDelegate) session:stopVideoReceive:isPausing:]";
      v21 = 1024;
      v22 = 3796;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video-stop-completed", (uint8_t *)&v17, 0x1Cu);
    }
  }
  return 1;
}

- (BOOL)session:(id)a3 didStopVideoIO:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v5;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  NSArray *sessionArray;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  uint64_t v22;
  NSObject *v23;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  VideoConference *v39;
  uint64_t v40;

  v5 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  if ((VideoConference *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v31 = v9;
        v32 = 2080;
        v33 = "-[VideoConference(SessionDelegate) session:didStopVideoIO:error:]";
        v34 = 1024;
        v35 = 3808;
        v11 = "VideoConference [%s] %s:%d ";
        v12 = v10;
        v13 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VideoConference performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v31 = v14;
        v32 = 2080;
        v33 = "-[VideoConference(SessionDelegate) session:didStopVideoIO:error:]";
        v34 = 1024;
        v35 = 3808;
        v36 = 2112;
        v37 = v8;
        v38 = 2048;
        v39 = self;
        v11 = "VideoConference [%s] %s:%d %@(%p) ";
        v12 = v15;
        v13 = 48;
        goto LABEL_11;
      }
    }
  }
  -[VideoConference rdlock](self, "rdlock");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  sessionArray = self->_sessionArray;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(sessionArray);
        v21 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if (v21 != a3 && (objc_msgSend(v21, "isVideoRunning") & 1) != 0)
        {
          -[VideoConference unlock](self, "unlock");
          return 0;
        }
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](sessionArray, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
      if (v18)
        continue;
      break;
    }
  }
  -[VideoConference unlock](self, "unlock");
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 3, self);
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 1, self);
  -[CameraConferenceSynchronizer scheduleCameraChangeToPreviewSettings](self->synchronizer, "scheduleCameraChangeToPreviewSettings");
  if (v5)
  {
    self->localFrameHeight = 0;
    self->localFrameWidth = 0;
    -[VCVideoRule setToVideoRule:](self->conferenceCaptureRule, "setToVideoRule:", 0);
    -[CameraConferenceSynchronizer reset](self->synchronizer, "reset");
  }
  pthread_mutex_lock(&self->xRemoteLayer);
  -[VCImageQueue pause](self->frontQueue, "pause");
  -[VCImageQueue pause](self->backQueue, "pause");
  -[VCImageQueue pause](self->screenQueue, "pause");
  pthread_mutex_unlock(&self->xRemoteLayer);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v31 = v22;
      v32 = 2080;
      v33 = "-[VideoConference(SessionDelegate) session:didStopVideoIO:error:]";
      v34 = 1024;
      v35 = 3841;
      _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video-stop-completed", buf, 0x1Cu);
    }
  }
  return 1;
}

- (void)session:(id)a3 isSendingAudio:(BOOL)a4 error:(id)a5
{
  NSObject *delegateNotificationQueue;
  _QWORD block[7];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VideoConference_SessionDelegate__session_isSendingAudio_error___block_invoke;
  block[3] = &unk_1E9E53608;
  block[4] = self;
  block[5] = a3;
  v7 = a4;
  block[6] = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __65__VideoConference_SessionDelegate__session_isSendingAudio_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:withCallID:isSendingAudio:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "callID"), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)session:(id)a3 didPauseAudio:(BOOL)a4 error:(id)a5
{
  NSObject *delegateNotificationQueue;
  _QWORD block[7];
  BOOL v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a4)
    -[VideoConference setMicrophoneMuted:](self, "setMicrophoneMuted:", self->microphoneMuted);
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VideoConference_SessionDelegate__session_didPauseAudio_error___block_invoke;
  block[3] = &unk_1E9E53608;
  block[4] = self;
  block[5] = a3;
  v11 = a4;
  block[6] = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __64__VideoConference_SessionDelegate__session_didPauseAudio_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:withCallID:didPauseAudio:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "callID"), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)session:(id)a3 didPauseVideo:(BOOL)a4 error:(id)a5
{
  NSObject *delegateNotificationQueue;
  _QWORD block[7];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__VideoConference_SessionDelegate__session_didPauseVideo_error___block_invoke;
  block[3] = &unk_1E9E53608;
  block[4] = self;
  block[5] = a3;
  v7 = a4;
  block[6] = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __64__VideoConference_SessionDelegate__session_didPauseVideo_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:withCallID:didPauseVideo:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "callID"), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
  return result;
}

- (void)remoteAudioDidPause:(BOOL)a3 callID:(unsigned int)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  unsigned int v6;
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VideoConference_SessionDelegate__remoteAudioDidPause_callID___block_invoke;
  block[3] = &unk_1E9E55ED0;
  block[4] = self;
  v7 = a3;
  v6 = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __63__VideoConference_SessionDelegate__remoteAudioDidPause_callID___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:remoteAudioPaused:callID:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 44))
  {
    result = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(result + 1014))
      return objc_msgSend((id)result, "setPauseAudio:callID:error:", 0, *(unsigned int *)(a1 + 40), 0);
  }
  return result;
}

- (void)remoteVideoDidPause:(BOOL)a3 callID:(unsigned int)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  unsigned int v6;
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__VideoConference_SessionDelegate__remoteVideoDidPause_callID___block_invoke;
  block[3] = &unk_1E9E55ED0;
  block[4] = self;
  v7 = a3;
  v6 = a4;
  dispatch_async(delegateNotificationQueue, block);
}

_BYTE *__63__VideoConference_SessionDelegate__remoteVideoDidPause_callID___block_invoke(uint64_t a1)
{
  _BYTE *result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:remoteVideoPaused:callID:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  result = (_BYTE *)objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidPause:streamToken:", *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 44))
  {
    result = *(_BYTE **)(a1 + 32);
    if (result[1015])
      return (_BYTE *)objc_msgSend(result, "setPauseVideo:callID:error:", 0, *(unsigned int *)(a1 + 40), 0);
  }
  return result;
}

- (void)session:(id)a3 initiateRelayRequest:(id)a4
{
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];
  int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  VideoConference *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v7 = objc_msgSend(a3, "callID");
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
  {
    if ((VideoConference *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_19;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      if (a3)
        v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v11 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v22 = v9;
      v23 = 2080;
      v24 = "-[VideoConference(SessionDelegate) session:initiateRelayRequest:]";
      v25 = 1024;
      v26 = 3922;
      v27 = 2080;
      v28 = (void *)v11;
      v15 = "VideoConference [%s] %s:%d session=%s";
      v16 = v10;
      v17 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VideoConference performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_19;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      if (a3)
        v14 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v14 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v22 = v12;
      v23 = 2080;
      v24 = "-[VideoConference(SessionDelegate) session:initiateRelayRequest:]";
      v25 = 1024;
      v26 = 3922;
      v27 = 2112;
      v28 = (void *)v8;
      v29 = 2048;
      v30 = self;
      v31 = 2080;
      v32 = v14;
      v15 = "VideoConference [%s] %s:%d %@(%p) session=%s";
      v16 = v13;
      v17 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_19:
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__VideoConference_SessionDelegate__session_initiateRelayRequest___block_invoke;
    block[3] = &unk_1E9E522D8;
    v20 = v7;
    block[4] = self;
    block[5] = a4;
    dispatch_async(delegateNotificationQueue, block);
  }
  -[VideoConference unlock](self, "unlock");
}

uint64_t __65__VideoConference_SessionDelegate__session_initiateRelayRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:inititiateRelayRequest:requestDict:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)session:(id)a3 sendRelayResponse:(id)a4
{
  int v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *delegateNotificationQueue;
  _QWORD block[6];
  int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  VideoConference *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v7 = objc_msgSend(a3, "callID");
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "callID"))))
  {
    if ((VideoConference *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_19;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      if (a3)
        v11 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v11 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v22 = v9;
      v23 = 2080;
      v24 = "-[VideoConference(SessionDelegate) session:sendRelayResponse:]";
      v25 = 1024;
      v26 = 3942;
      v27 = 2080;
      v28 = (void *)v11;
      v15 = "VideoConference [%s] %s:%d session=%s";
      v16 = v10;
      v17 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VideoConference performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_19;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      if (a3)
        v14 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v14 = "<nil>";
      *(_DWORD *)buf = 136316418;
      v22 = v12;
      v23 = 2080;
      v24 = "-[VideoConference(SessionDelegate) session:sendRelayResponse:]";
      v25 = 1024;
      v26 = 3942;
      v27 = 2112;
      v28 = (void *)v8;
      v29 = 2048;
      v30 = self;
      v31 = 2080;
      v32 = v14;
      v15 = "VideoConference [%s] %s:%d %@(%p) session=%s";
      v16 = v13;
      v17 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
LABEL_19:
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__VideoConference_SessionDelegate__session_sendRelayResponse___block_invoke;
    block[3] = &unk_1E9E522D8;
    v20 = v7;
    block[4] = self;
    block[5] = a4;
    dispatch_async(delegateNotificationQueue, block);
  }
  -[VideoConference unlock](self, "unlock");
}

uint64_t __62__VideoConference_SessionDelegate__session_sendRelayResponse___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:sendRelayUpdate:updateDict:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)session:(id)a3 cancelRelayRequest:(id)a4
{
  int v6;
  NSObject *delegateNotificationQueue;
  _QWORD v8[6];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "callID");
  delegateNotificationQueue = self->delegateNotificationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__VideoConference_SessionDelegate__session_cancelRelayRequest___block_invoke;
  v8[3] = &unk_1E9E522D8;
  v9 = v6;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(delegateNotificationQueue, v8);
}

uint64_t __63__VideoConference_SessionDelegate__session_cancelRelayRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:cancelRelayRequest:requestDict:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)session:(id)a3 didChangeRemoteScreenAttributes:(id)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  -[VCMediaRecorder setInitialRemoteScreenAttributes:](self->_vcMediaRecorder, "setInitialRemoteScreenAttributes:", a4);
  delegateNotificationQueue = self->delegateNotificationQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__VideoConference_SessionDelegate__session_didChangeRemoteScreenAttributes___block_invoke;
  v8[3] = &unk_1E9E527D0;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  dispatch_async(delegateNotificationQueue, v8);
}

void __76__VideoConference_SessionDelegate__session_didChangeRemoteScreenAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:didRemoteScreenAttributesChange:forCallID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "callID"));
  v2 = VCRemoteVideoManager_DefaultManager();
  VCRemoteVideoManager_RemoteScreenAttributesDidChange(v2, *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "callID"));
}

- (void)session:(id)a3 remoteAudioEnabled:(BOOL)a4 withCallID:(unsigned int)a5
{
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  unsigned int v7;
  BOOL v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__VideoConference_SessionDelegate__session_remoteAudioEnabled_withCallID___block_invoke;
  block[3] = &unk_1E9E55ED0;
  block[4] = self;
  v8 = a4;
  v7 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __74__VideoConference_SessionDelegate__session_remoteAudioEnabled_withCallID___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:remoteAudioEnabled:forCallID:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 44), *(unsigned int *)(a1 + 40));
  return result;
}

- (void)session:(id)a3 localAudioEnabled:(BOOL)a4 withCallID:(unsigned int)a5 error:(id)a6
{
  NSObject *delegateNotificationQueue;
  _QWORD v7[6];
  unsigned int v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__VideoConference_SessionDelegate__session_localAudioEnabled_withCallID_error___block_invoke;
  v7[3] = &unk_1E9E55F48;
  v9 = a4;
  v8 = a5;
  v7[4] = self;
  v7[5] = a6;
  dispatch_async(delegateNotificationQueue, v7);
}

uint64_t __79__VideoConference_SessionDelegate__session_localAudioEnabled_withCallID_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:localAudioEnabled:forCallID:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 52), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return result;
}

- (void)session:(id)a3 remoteCallingModeChanged:(unsigned int)a4 withCallID:(unsigned int)a5
{
  NSObject *delegateNotificationQueue;
  _QWORD block[5];
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__VideoConference_SessionDelegate__session_remoteCallingModeChanged_withCallID___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  v7 = a4;
  v8 = a5;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __80__VideoConference_SessionDelegate__session_remoteCallingModeChanged_withCallID___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "videoConference:remoteCallingModeChanged:forCallID:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
  return result;
}

- (void)setBWEOptions:(BOOL)a3 UseNewBWEMode:(BOOL)a4 FakeLargeFrameMode:(BOOL)a5 ProbingSenderLog:(BOOL)a6
{
  self->bweOperatingModeInitialized = a3;
  self->useNewBWEMode = a4;
  self->useFakeLargeFrameMode = a5;
  self->useActiveProbingSenderLog = a6;
}

- (int)currentCameraID
{
  return self->currentCamera;
}

- (void)session:(id)a3 changeVideoRulesToCaptureRule:(id)a4 encodeRule:(id)a5 featureListString:(id)a6
{
  int v11;
  uint64_t v12;
  NSObject *v13;
  float v14;
  double v15;
  float v16;
  double v17;
  int v18;
  int v19;
  float v20;
  double v21;
  float v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  int v31;
  int v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = objc_msgSend(a4, "iWidth");
  if (objc_msgSend(a4, "iHeight") * v11 == 130560)
  {
    objc_msgSend(a4, "fRate");
    objc_msgSend(a4, "setFrameWidth:frameHeight:frameRate:", 1280, 720);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(a4, "iWidth");
      v31 = objc_msgSend(a4, "iHeight");
      objc_msgSend(a4, "fRate");
      v15 = v14;
      objc_msgSend(a4, "fPref");
      v17 = v16;
      v30 = objc_msgSend(a4, "iPayload");
      v18 = objc_msgSend(a5, "iWidth");
      v19 = objc_msgSend(a5, "iHeight");
      objc_msgSend(a5, "fRate");
      v21 = v20;
      objc_msgSend(a5, "fPref");
      *(_DWORD *)buf = 136318466;
      v34 = v12;
      v35 = 2080;
      v36 = "-[VideoConference(SessionDelegate) session:changeVideoRulesToCaptureRule:encodeRule:featureListString:]";
      v37 = 1024;
      v38 = 4047;
      v39 = 1024;
      v40 = v32;
      v41 = 1024;
      v42 = v31;
      v43 = 2048;
      v44 = v15;
      v45 = 2048;
      v46 = v17;
      v47 = 1024;
      v48 = v30;
      v49 = 1024;
      v50 = v18;
      v51 = 1024;
      v52 = v19;
      v53 = 2048;
      v54 = v21;
      v55 = 2048;
      v56 = v22;
      v57 = 1024;
      v58 = objc_msgSend(a5, "iPayload");
      v59 = 2080;
      v60 = objc_msgSend(a6, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference: schedule camera change, resolution change with new capture rule = %dx%dx%.1ffps(%.1f, %d), new encode rule = %dx%dx%.1ffps(%.1f, %d), featureListString %s", buf, 0x72u);
    }
  }
  if (-[VCMediaRecorder isActive](self->_vcMediaRecorder, "isActive"))
  {
    LODWORD(v23) = 0;
    objc_msgSend(a4, "setFrameWidth:frameHeight:frameRate:", 0, 0, v23);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v34 = v24;
        v35 = 2080;
        v36 = "-[VideoConference(SessionDelegate) session:changeVideoRulesToCaptureRule:encodeRule:featureListString:]";
        v37 = 1024;
        v38 = 4050;
        _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference: captureRule reset for VCMoments", buf, 0x1Cu);
      }
    }
  }
  if (a4)
    -[CameraConferenceSynchronizer scheduleCameraChangeToCaptureSettings:](self->synchronizer, "scheduleCameraChangeToCaptureSettings:", a4);
  if (a5 && a6)
    objc_msgSend(a3, "processResolutionChangeToVideoRule:captureRule:featureListString:", a5, a4, a6);
  v26 = objc_msgSend(a3, "negotiatedReceivingFramerate");
  if ((_DWORD)v26)
  {
    v27 = v26;
    -[VCImageQueue setFrameRate:](self->frontQueue, "setFrameRate:", v26);
    -[VCImageQueue setFrameRate:](self->backQueue, "setFrameRate:", v27);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v28 = VRTraceErrorLogLevelToCSTR();
      v29 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v34 = v28;
        v35 = 2080;
        v36 = "-[VideoConference(SessionDelegate) session:changeVideoRulesToCaptureRule:encodeRule:featureListString:]";
        v37 = 1024;
        v38 = 4066;
        v39 = 1024;
        v40 = v27;
        _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d reset receiving framerate for remote queue: %dfps", buf, 0x22u);
      }
    }
  }
}

- (void)session:(id)a3 startAudioWithFarEndVersionInfo:(VoiceIOFarEndVersionInfo *)a4 internalFrameFormat:(const tagVCAudioFrameFormat *)a5 completionHandler:(id)a6
{
  id v11;
  uint64_t v12;
  VCAudioIO *audioIO;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[7];

  v16[6] = *MEMORY[0x1E0C80C00];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __114__VideoConference_SessionDelegate__session_startAudioWithFarEndVersionInfo_internalFrameFormat_completionHandler___block_invoke;
  v16[3] = &unk_1E9E53C70;
  v16[4] = self;
  v16[5] = a6;
  v11 = (id)objc_msgSend(v16, "copy");
  v15 = 0;
  -[VideoConference rdlock](self, "rdlock");
  if (-[NSMutableArray containsObject:](self->_startedSessions, "containsObject:", a3))
  {
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v15, 32012, 7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 4095), CFSTR("Could not start audio."), CFSTR("Audio is already running"));
    -[VideoConference unlock](self, "unlock");
    goto LABEL_4;
  }
  v12 = -[NSMutableArray count](self->_startedSessions, "count");
  -[NSMutableArray addObject:](self->_startedSessions, "addObject:", a3);
  -[VideoConference unlock](self, "unlock");
  if (v12)
  {
LABEL_4:
    if (a6)
      (*((void (**)(id, BOOL))a6 + 2))(a6, v15 == 0);
    return;
  }
  -[VCAudioIO setClientFormat:](self->_audioIO, "setClientFormat:", a5);
  VCAudioBufferList_AllocateFrame((uint64_t)a5, &self->_sourceBuffer);
  VCAudioBufferList_AllocateFrame((uint64_t)a5, &self->_sinkBufferMix);
  VCAudioBufferList_AllocateFrame((uint64_t)a5, &self->_sinkBuffer);
  -[VCAudioIO setFarEndVersionInfo:](self->_audioIO, "setFarEndVersionInfo:", a4);
  if (objc_msgSend(a3, "basebandCodecType") && objc_msgSend(a3, "basebandCodecSampleRate"))
  {
    audioIO = self->_audioIO;
    v14 = CStrToFourcc((char *)objc_msgSend((id)objc_msgSend(a3, "basebandCodecType"), "UTF8String"));
    objc_msgSend((id)objc_msgSend(a3, "basebandCodecSampleRate"), "doubleValue");
    -[VCAudioIO setRemoteCodecType:sampleRate:](audioIO, "setRemoteCodecType:sampleRate:", v14);
  }
  -[VCAudioIO startWithCompletionHandler:](self->_audioIO, "startWithCompletionHandler:", v11);
}

uint64_t __114__VideoConference_SessionDelegate__session_startAudioWithFarEndVersionInfo_internalFrameFormat_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if ((a2 & 1) == 0)
  {
    VCAudioBufferList_Destroy((uint64_t *)(*(_QWORD *)(a1 + 32) + 200));
    VCAudioBufferList_Destroy((uint64_t *)(*(_QWORD *)(a1 + 32) + 216));
    VCAudioBufferList_Destroy((uint64_t *)(*(_QWORD *)(a1 + 32) + 208));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeAllObjects");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)session:(id)a3 stopAudioWithCompletionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__VideoConference_SessionDelegate__session_stopAudioWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E9E53C70;
  v9[4] = self;
  v9[5] = a4;
  -[VideoConference rdlock](self, "rdlock");
  if ((-[NSMutableArray containsObject:](self->_startedSessions, "containsObject:", a3) & 1) == 0)
  {
    v10 = *MEMORY[0x1E0CB2D68];
    v11[0] = CFSTR("Stopping audio session but session wasn't started");
    v8 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VideoConference"), -2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1));
    -[VideoConference unlock](self, "unlock");
    if (!a4)
      return;
    goto LABEL_6;
  }
  -[NSMutableArray removeObject:](self->_startedSessions, "removeObject:", a3);
  v7 = -[NSMutableArray count](self->_startedSessions, "count");
  -[VideoConference unlock](self, "unlock");
  if (!v7)
  {
    -[VCAudioIO stopWithCompletionHandler:](self->_audioIO, "stopWithCompletionHandler:", v9);
    return;
  }
  v8 = 0;
  if (a4)
LABEL_6:
    (*((void (**)(id, uint64_t, uint64_t))a4 + 2))(a4, 1, v8);
}

uint64_t __75__VideoConference_SessionDelegate__session_stopAudioWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  VCAudioBufferList_Destroy((uint64_t *)(*(_QWORD *)(a1 + 32) + 200));
  VCAudioBufferList_Destroy((uint64_t *)(*(_QWORD *)(a1 + 32) + 216));
  VCAudioBufferList_Destroy((uint64_t *)(*(_QWORD *)(a1 + 32) + 208));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)session:(id)a3 setRemoteBasebandCodecType:(unsigned int)a4 sampleRate:(double)a5
{
  -[VCAudioIO setRemoteCodecType:sampleRate:](self->_audioIO, "setRemoteCodecType:sampleRate:", *(_QWORD *)&a4, a5);
}

- (AudioStreamBasicDescription)audioIOFormat
{
  AudioStreamBasicDescription *result;
  __int128 v5;

  result = -[VCAudioIO clientFormat](self->_audioIO, "clientFormat");
  v5 = *(_OWORD *)&result->mBytesPerPacket;
  *(_OWORD *)&retstr->mSampleRate = *(_OWORD *)&result->mSampleRate;
  *(_OWORD *)&retstr->mBytesPerPacket = v5;
  *(_QWORD *)&retstr->mBitsPerChannel = *(_QWORD *)&result->mBitsPerChannel;
  return result;
}

- (void)session:(id)a3 setMomentsCapabilities:(unsigned int)a4 imageType:(int)a5 videoCodec:(int)a6
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  -[VCMediaRecorder setCapabilities:](self->_vcMediaRecorder, "setCapabilities:", *(_QWORD *)&a4);
  -[VCMediaRecorder setVideoCodec:](self->_vcMediaRecorder, "setVideoCodec:", v6);
  -[VCMediaRecorder setImageType:](self->_vcMediaRecorder, "setImageType:", v7);
}

- (unsigned)momentsCapabilitiesWithNegotiationBlobMomentsSettings_Capabilities:(int)a3
{
  unsigned int v3;

  if (a3 == 4)
    v3 = 7;
  else
    v3 = 0;
  if (a3 == 2)
    return 1;
  else
    return v3;
}

- (void)session:(id)a3 didReceiveMomentsRequest:(id)a4
{
  -[VCMediaRecorder processRequest:](self->_vcMediaRecorder, "processRequest:", a4);
}

- (id)clientCaptureRule
{
  return self->conferenceCaptureRule;
}

- (BOOL)initiateResolutionChangeToWidth:(int)a3 height:(int)a4 rate:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int ErrorLogLevelForModule;
  os_log_t *v10;
  uint64_t v11;
  NSObject *v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v10 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 5)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136316418;
      v18 = v11;
      v19 = 2080;
      v20 = "-[VideoConference(VideoProcessing) initiateResolutionChangeToWidth:height:rate:]";
      v21 = 1024;
      v22 = 4199;
      v23 = 1024;
      v24 = v7;
      v25 = 1024;
      v26 = v6;
      v27 = 1024;
      v28 = v5;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d VideoConference:initiateResolutionChange:  %dx%d@%dfps", (uint8_t *)&v17, 0x2Eu);
    }
  }
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "setCaptureWidth:height:rate:", v7, v6, v5);
  *(float *)&v13 = (float)(int)v5;
  -[VCVideoRule setFrameWidth:frameHeight:frameRate:](self->conferenceCaptureRule, "setFrameWidth:frameHeight:frameRate:", v7, v6, v13);
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *v10;
    if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = v14;
      v19 = 2080;
      v20 = "-[VideoConference(VideoProcessing) initiateResolutionChangeToWidth:height:rate:]";
      v21 = 1024;
      v22 = 4205;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d video-resolution-change", (uint8_t *)&v17, 0x1Cu);
    }
  }
  return 1;
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  VideoConference *v7;
  uint64_t var6;
  __CVBuffer *ImageBuffer;
  BOOL v10;
  uint64_t dwAudioTS;
  double dAudioHostTime;
  uint64_t currentCamera;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char v21;
  VideoConference *v22;
  NSArray *obj;
  __int128 v24;
  int64_t var3;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_deviceRole == 3)
    return 1;
  v7 = self;
  var6 = a5->var6;
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  v7->localFrameWidth = CVPixelBufferGetWidth(ImageBuffer);
  v7->localFrameHeight = CVPixelBufferGetHeight(ImageBuffer);
  VCMediaRecorder_AddLocalVideoSampleBuffer((uint64_t)v7->_vcMediaRecorder, a3, var6, v7->dwAudioTS);
  -[CameraConferenceSynchronizer cameraSizeChangedTo:](v7->synchronizer, "cameraSizeChangedTo:", (double)v7->localFrameWidth, (double)v7->localFrameHeight);
  if (v7->dAudioHostTime == 0.0)
    return 1;
  pthread_mutex_lock(&v7->xAudioTS);
  dwAudioTS = v7->dwAudioTS;
  dAudioHostTime = v7->dAudioHostTime;
  pthread_mutex_unlock(&v7->xAudioTS);
  currentCamera = v7->currentCamera;
  v15 = (var6 >> 3) & 1;
  if ((_DWORD)currentCamera != v15)
    v7->currentCamera = v15;
  if (-[VideoConference tryrdlock](v7, "tryrdlock"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VideoConference(VideoProcessing) onVideoFrame:frameTime:attribute:].cold.1();
    }
    return 0;
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = v7->_sessionArray;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    if (v16)
    {
      v17 = v16;
      v22 = v7;
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((_DWORD)currentCamera != v15)
            objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "localCameraSwitchedFrom:to:", currentCamera, v22->currentCamera);
          v24 = *(_OWORD *)&a4->var0;
          var3 = a4->var3;
          v21 = objc_msgSend(v20, "onCaptureFrame:audioTS:audioHT:videoHT:cameraBits:", a3, dwAudioTS, &v24, var6, dAudioHostTime);
        }
        v10 = v21;
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
      }
      while (v17);
      v7 = v22;
    }
    else
    {
      v10 = 0;
    }
    -[VideoConference unlock](v7, "unlock");
  }
  return v10;
}

- (void)avConferencePreviewError:(id)a3
{
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1DF088A10](self, a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VideoConference(VideoProcessing) avConferencePreviewError:].cold.1();
  }
  v7[0] = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("avCaptureStartPreviewFail")) & 1) != 0)
  {
    v6 = 107;
  }
  else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("avCaptureStartCaptureFail")) & 1) != 0)
  {
    v6 = 109;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("avCaptureStopFail")))
  {
    v6 = 108;
  }
  else
  {
    v6 = 113;
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v7, 32023, v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 4304), CFSTR("Camera failure"), a3);
  -[VideoConference stopAllCalls:](self, "stopAllCalls:", v7[0]);
  -[CameraConferenceSynchronizer reset](self->synchronizer, "reset");
  objc_autoreleasePoolPop(v5);
}

- (void)avConferenceScreenCaptureError:(id)a3
{
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1DF088A10](self, a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VideoConference(VideoProcessing) avConferenceScreenCaptureError:].cold.1();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      -[VideoConference(VideoProcessing) avConferenceScreenCaptureError:].cold.2();
    }
  }
  v7[0] = 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("vcScreenCaptureFailStart")) & 1) != 0)
  {
    v6 = 109;
  }
  else if (objc_msgSend(a3, "isEqualToString:", CFSTR("vcScreenCaptureFailPreempt")))
  {
    v6 = 114;
  }
  else
  {
    v6 = 113;
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v7, 32029, v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VideoConference.m", 4330), CFSTR("SreenCapture failure"), a3);
  -[VideoConference stopAllCalls:](self, "stopAllCalls:", v7[0]);
  -[CameraConferenceSynchronizer reset](self->synchronizer, "reset");
  objc_autoreleasePoolPop(v5);
}

- (void)shouldSendBlackFrame:(BOOL)a3 callID:(id)a4
{
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", a4), "shouldSendBlackFrame:", a3);
}

- (void)setConferenceState:(unsigned int)a3 forCallID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  id v7;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[VideoConference rdlock](self, "rdlock");
  v7 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VideoConference unlock](self, "unlock");
  objc_msgSend(v7, "setSessionConferenceState:callID:", v5, v4);
}

- (void)setConferenceVisualRectangle:(CGRect)a3 forCallID:(unsigned int)a4
{
  uint64_t v4;
  double height;
  double width;
  double y;
  double x;
  id v10;

  v4 = *(_QWORD *)&a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VideoConference rdlock](self, "rdlock");
  v10 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_sessionDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4));
  -[VideoConference unlock](self, "unlock");
  objc_msgSend(v10, "setSessionConferenceVisualRectangle:callID:", v4, x, y, width, height);
}

- (void)thermalLevelDidChange:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v3 = *(_QWORD *)&a3;
  v15 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_sessionArray);
  -[VideoConference unlock](self, "unlock");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "thermalLevelDidChange:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }

}

- (void)cameraAvailabilityDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_sessionArray);
  -[VideoConference unlock](self, "unlock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if (v3)
          objc_msgSend(v10, "setResumeVideo");
        else
          objc_msgSend(v10, "setSuspendVideo");
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }

}

- (void)triggerInterfaceChange
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[VideoConference rdlock](self, "rdlock");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_sessionArray);
  -[VideoConference unlock](self, "unlock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v16 = v4;
      v17 = 2080;
      v18 = "-[VideoConference(NATDelegate) triggerInterfaceChange]";
      v19 = 1024;
      v20 = 4413;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Forced interface change", buf, 0x1Cu);
    }
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "triggerInterfaceChange");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }

}

- (void)NATTypeDictionaryUpdated:(id)a3
{
  _opaque_pthread_mutex_t *p_natMutex;
  uint64_t v6;
  NSObject *v7;
  int v8;
  NSDictionary *natTypeDictionary;
  const char *v10;
  int v11;
  NSObject *global_queue;
  _QWORD v13[5];
  int v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  p_natMutex = &self->natMutex;
  pthread_mutex_lock(&self->natMutex);

  self->natTypeDictionary = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = BYTE5(self->recvRTPTimeStamp.epoch);
      natTypeDictionary = self->natTypeDictionary;
      if (natTypeDictionary)
        v10 = -[NSString UTF8String](-[NSDictionary description](natTypeDictionary, "description"), "UTF8String");
      else
        v10 = "<nil>";
      *(_DWORD *)buf = 136316162;
      v16 = v6;
      v17 = 2080;
      v18 = "-[VideoConference(NATDelegate) NATTypeDictionaryUpdated:]";
      v19 = 1024;
      v20 = 4427;
      v21 = 1024;
      v22 = v8;
      v23 = 2080;
      v24 = v10;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d NATTypeDictionaryUpdated: requiresWifi: %d  natTypeDictionary %s", buf, 0x2Cu);
    }
  }
  pthread_mutex_unlock(p_natMutex);
  v11 = -[VideoConference natTypeForCallSessions:](self, "natTypeForCallSessions:", "NATTypeDictionaryUpdated");
  global_queue = dispatch_get_global_queue(0, 0);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__VideoConference_NATDelegate__NATTypeDictionaryUpdated___block_invoke;
  v13[3] = &unk_1E9E52300;
  v13[4] = self;
  v14 = v11;
  dispatch_async(global_queue, v13);
}

void __57__VideoConference_NATDelegate__NATTypeDictionaryUpdated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  const char *v6;
  os_log_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  os_log_t *v16;
  int v17;
  int v18;
  __int128 v19;
  uint64_t v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "rdlock");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v3)
  {
    v5 = v3;
    v6 = "VideoConference";
    v7 = (os_log_t *)MEMORY[0x1E0CF2758];
    v8 = *(_QWORD *)v33;
    *(_QWORD *)&v4 = 136316162;
    v19 = v4;
    do
    {
      v9 = 0;
      v20 = v5;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v9);
        objc_msgSend(v10, "setNatType:", *(unsigned int *)(a1 + 40), v19);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            v13 = v8;
            v14 = v6;
            v15 = v2;
            v16 = v7;
            v17 = *(_DWORD *)(a1 + 40);
            v18 = objc_msgSend(v10, "callID");
            *(_DWORD *)buf = v19;
            v22 = v11;
            v23 = 2080;
            v24 = "-[VideoConference(NATDelegate) NATTypeDictionaryUpdated:]_block_invoke";
            v25 = 1024;
            v26 = 4445;
            v27 = 1024;
            v28 = v17;
            v7 = v16;
            v2 = v15;
            v6 = v14;
            v8 = v13;
            v5 = v20;
            v29 = 1024;
            v30 = v18;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VideoConference [%s] %s:%d Setting natType %d for callID %d", buf, 0x28u);
          }
        }
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v5);
  }

}

void __35__VideoConference_setupNATObserver__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d Something is wrong with getting the snatmapserver", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d Error to verify loaded Server Bags %@");
  OUTLINED_FUNCTION_3();
}

- (void)updateCapabilities:forSession:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d audio for the session should not be running", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateCapabilities:forSession:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d registerForVideoFramesWithDeviceRole failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)updateCapabilities:forSession:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  const void *v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d deregisterForVideoFramesWithDeviceRole failed; self = %p",
    v2,
    v3,
    v4,
    v5);
  OUTLINED_FUNCTION_3();
}

- (void)setUpAudioIO:callID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d _startedSessions is not empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialAudioWithCallID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d Failed to create the spatial metadata. status=%08x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialAudioWithCallID:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d Failed to allocate spatial metadata entry. status=%08x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialAudioWithCallID:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d Failed to retrieve the channel index. status=%08x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)setupSpatialAudioWithCallID:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;
  int v5;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VideoConference [%s] %s:%d Failed to register the spatial metadata. status=%08x", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
