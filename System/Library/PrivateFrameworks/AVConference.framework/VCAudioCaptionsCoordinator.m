@implementation VCAudioCaptionsCoordinator

- (VCAudioCaptionsCoordinator)initWithOneToOneEnabled:(BOOL)a3 isLocal:(BOOL)a4 taskIdentifier:(id)a5 reportingAgent:(opaqueRTCReporting *)a6
{
  _BOOL8 v8;
  VCAudioCaptionsCoordinator *v10;
  VCAudioCaptions *v11;
  VCCaptionsGibberishDetector *v12;
  double DoubleValueForKey;
  uint64_t v14;
  VCAudioCaptionsBufferInfoCollection *v15;
  NSObject *CustomRootQueue;
  dispatch_queue_t v17;
  opaqueRTCReporting *v18;
  int IsInternalOSInstalled;
  opaqueVCVoiceDetector *v20;
  opaqueVCVoiceDetector *v21;
  unsigned int IntValueForKey;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  VCAudioCaptionsCoordinator *v50;
  uint64_t v51;

  v8 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v40.receiver = self;
  v40.super_class = (Class)VCAudioCaptionsCoordinator;
  v10 = -[VCObject init](&v40, sel_init);
  if (!v10)
    return v10;
  if (!a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.1();
    }
    goto LABEL_93;
  }
  v11 = -[VCAudioCaptions initWithDelegate:isLocal:taskIdentifier:reportingAgent:]([VCAudioCaptions alloc], "initWithDelegate:isLocal:taskIdentifier:reportingAgent:", v10, v8, a5, a6);
  v10->_audioCaptions = v11;
  if (!v11)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.2();
      }
      goto LABEL_93;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](v10, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_93;
    v31 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    *(_DWORD *)buf = 136316162;
    v42 = v31;
    v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    v45 = 1024;
    v46 = 92;
    v47 = 2112;
    v48 = v24;
    v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create audio captions object.";
    goto LABEL_92;
  }
  v12 = [VCCaptionsGibberishDetector alloc];
  DoubleValueForKey = VCDefaults_GetDoubleValueForKey(CFSTR("captionsConfidenceGibberishThreshold"), 0.6875);
  v14 = -[VCCaptionsGibberishDetector initWithGibberishThreshold:windowLength:](v12, "initWithGibberishThreshold:windowLength:", (int)VCDefaults_GetIntValueForKey(CFSTR("captionsConfidenceGibberishDetectionWindowLength"), 30), DoubleValueForKey);
  v10->_gibberishDetector = (VCCaptionsGibberishDetector *)v14;
  if (!v14)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.3();
      }
      goto LABEL_93;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](v10, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_93;
    v34 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    *(_DWORD *)buf = 136316162;
    v42 = v34;
    v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    v45 = 1024;
    v46 = 94;
    v47 = 2112;
    v48 = v25;
    v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create gibberish detection object.";
    goto LABEL_92;
  }
  v15 = -[VCAudioCaptionsBufferInfoCollection initWithBufferLength:]([VCAudioCaptionsBufferInfoCollection alloc], "initWithBufferLength:", 0.5);
  v10->_bufferInfos = v15;
  if (!v15)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.4();
      }
      goto LABEL_93;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](v10, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_93;
    v35 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    *(_DWORD *)buf = 136316162;
    v42 = v35;
    v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    v45 = 1024;
    v46 = 96;
    v47 = 2112;
    v48 = v26;
    v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to buffer info collection.";
    goto LABEL_92;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(47);
  v17 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCAudioCaptionsCoordinator.delegateQueue", 0, CustomRootQueue);
  v10->_delegateQueue = (OS_dispatch_queue *)v17;
  if (!v17)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.5();
      }
      goto LABEL_93;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](v10, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_93;
    v36 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    *(_DWORD *)buf = 136316162;
    v42 = v36;
    v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    v45 = 1024;
    v46 = 99;
    v47 = 2112;
    v48 = v27;
    v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create delegateQueue";
    goto LABEL_92;
  }
  if (!-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue](v10, "setUpSecondaryBufferQueue"))
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.8();
      }
      goto LABEL_93;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v28 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](v10, "performSelector:", sel_logPrefix);
    else
      v28 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_93;
    v37 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    *(_DWORD *)buf = 136316162;
    v42 = v37;
    v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    v45 = 1024;
    v46 = 101;
    v47 = 2112;
    v48 = v28;
    v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create setup the secondary buffer queue";
    goto LABEL_92;
  }
  v10->_oneToOneEnabled = a3;
  v10->_stateLock._os_unfair_lock_opaque = 0;
  v10->_startStopSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  if (a6)
    v18 = (opaqueRTCReporting *)CFRetain(a6);
  else
    v18 = 0;
  v10->_reportingAgent = v18;
  IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
    LOBYTE(IsInternalOSInstalled) = VCDefaults_GetBoolValueForKey(CFSTR("forceCaptionsVoiceDetection"), 0);
  v10->_forceCaptionsVoiceDetection = IsInternalOSInstalled;
  v20 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(0);
  v10->_voiceDetectorInfoPrimary.voiceDetector = v20;
  if (!v20)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.6();
      }
      goto LABEL_93;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](v10, "performSelector:", sel_logPrefix);
    else
      v29 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_93;
    v38 = VRTraceErrorLogLevelToCSTR();
    v32 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    *(_DWORD *)buf = 136316162;
    v42 = v38;
    v43 = 2080;
    v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
    v45 = 1024;
    v46 = 108;
    v47 = 2112;
    v48 = v29;
    v49 = 2048;
    v50 = v10;
    v33 = " [%s] %s:%d %@(%p) Failed to create the primary voice detector";
LABEL_92:
    _os_log_error_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0x30u);
    goto LABEL_93;
  }
  v21 = (opaqueVCVoiceDetector *)VCVoiceDetector_Create(v10->_forceCaptionsVoiceDetection);
  v10->_voiceDetectorInfoSecondary.voiceDetector = v21;
  if (!v21)
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == v10)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:].cold.7();
      }
      goto LABEL_93;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v30 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](v10, "performSelector:", sel_logPrefix);
    else
      v30 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v42 = v39;
        v43 = 2080;
        v44 = "-[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]";
        v45 = 1024;
        v46 = 110;
        v47 = 2112;
        v48 = v30;
        v49 = 2048;
        v50 = v10;
        v33 = " [%s] %s:%d %@(%p) Failed to create the secondary voice detector";
        goto LABEL_92;
      }
    }
LABEL_93:

    return 0;
  }
  v10->_lowPriorityThresholdSeconds = VCDefaults_GetInternalOSDoubleValueForKey(CFSTR("captionsLowPriorityThresholdSeconds"), 0.75);
  IntValueForKey = VRTraceIsInternalOSInstalled();
  if (IntValueForKey)
    IntValueForKey = VCDefaults_GetIntValueForKey(CFSTR("ignoreCaptionsForThreads"), 0);
  v10->_ignoreCaptionsForThreads = IntValueForKey;
  return v10;
}

- (void)invalidate
{
  os_unfair_lock_s *p_stateLock;
  VCAudioCaptionsBufferInfoCollection *bufferInfos;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  opaqueRTCReporting *reportingAgent;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  bufferInfos = self->_bufferInfos;
  if (bufferInfos)
  {
    v5 = (void *)VCAudioCaptionsBufferInfoCollection_CopyOrderedBufferInfos((uint64_t)bufferInfos);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
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
          objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "unregisterCaptionsSourceWithStreamToken:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "token"));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      }
      while (v7);
    }

  }
  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
  {
    CFRelease(reportingAgent);
    self->_reportingAgent = 0;
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)dealloc
{
  NSObject *delegateQueue;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  -[VCAudioCaptions setDelegate:](self->_audioCaptions, "setDelegate:", 0);

  if (self->_voiceDetectorInfoPrimary.isVoiceDetectorRunning)
  {
    VCVoiceDetector_Stop(self->_voiceDetectorInfoPrimary.voiceDetector);
    self->_voiceDetectorInfoPrimary.isVoiceDetectorRunning = 0;
  }
  VCVoiceDetector_Destroy((void **)&self->_voiceDetectorInfoPrimary.voiceDetector);
  if (self->_voiceDetectorInfoSecondary.isVoiceDetectorRunning)
  {
    VCVoiceDetector_Stop(self->_voiceDetectorInfoSecondary.voiceDetector);
    self->_voiceDetectorInfoSecondary.isVoiceDetectorRunning = 0;
  }
  VCVoiceDetector_Destroy((void **)&self->_voiceDetectorInfoSecondary.voiceDetector);
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
    dispatch_release(delegateQueue);
  -[VCAudioCaptionsCoordinator cleanUpSecondaryBufferQueue](self, "cleanUpSecondaryBufferQueue");
  v4.receiver = self;
  v4.super_class = (Class)VCAudioCaptionsCoordinator;
  -[VCObject dealloc](&v4, sel_dealloc);
}

- (BOOL)setUpSecondaryBufferQueue
{
  const __CFAllocator *v3;
  OSStatus v4;
  _BOOL4 v5;
  OSStatus v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  uint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  _BOOL4 v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  VCAudioCaptionsCoordinator *v35;
  __int16 v36;
  OSStatus v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, &self->_secondarySamplesQueue);
  if (v4)
  {
    v6 = v4;
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        -[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v5)
          return v5;
        v26 = 136316418;
        v27 = v18;
        v28 = 2080;
        v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
        v30 = 1024;
        v31 = 161;
        v32 = 2112;
        v33 = v7;
        v34 = 2048;
        v35 = self;
        v36 = 1024;
        v37 = v6;
        _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create samples queue. status=%d", (uint8_t *)&v26, 0x36u);
      }
    }
    goto LABEL_39;
  }
  if (VCAllocatorFirstCome_Create(v3, (uint64_t)"com.apple.AVConference.VCAudioCaptionsCoordinator.secondarySamplesAllocator", &self->_secondarySamplesAllocator))
  {
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_39;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      v22 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (!v22)
        return v5;
      v26 = 136316162;
      v27 = v20;
      v28 = 2080;
      v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
      v30 = 1024;
      v31 = 164;
      v32 = 2112;
      v33 = v8;
      v34 = 2048;
      v35 = self;
      v13 = " [%s] %s:%d %@(%p) Failed to create the samples allocator";
LABEL_37:
      v16 = v21;
      v17 = 48;
      goto LABEL_38;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (!v12)
        return v5;
      v26 = 136315650;
      v27 = v10;
      v28 = 2080;
      v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
      v30 = 1024;
      v31 = 164;
      v13 = " [%s] %s:%d Failed to create the samples allocator";
      goto LABEL_24;
    }
  }
  else
  {
    if (!VCAllocatorFirstCome_Create(v3, (uint64_t)"com.apple.AVConference.VCAudioCaptionsCoordinator.secondarySampleBufferInfoAllocator", &self->_secondarySampleBufferInfoAllocator))
    {
      LOBYTE(v5) = 1;
      return v5;
    }
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_39;
      v23 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      v24 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (!v24)
        return v5;
      v26 = 136316162;
      v27 = v23;
      v28 = 2080;
      v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
      v30 = 1024;
      v31 = 167;
      v32 = 2112;
      v33 = v9;
      v34 = 2048;
      v35 = self;
      v13 = " [%s] %s:%d %@(%p) Failed to create the samples allocator";
      goto LABEL_37;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v15 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v5) = 0;
      if (!v15)
        return v5;
      v26 = 136315650;
      v27 = v14;
      v28 = 2080;
      v29 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
      v30 = 1024;
      v31 = 167;
      v13 = " [%s] %s:%d Failed to create the samples allocator";
LABEL_24:
      v16 = v11;
      v17 = 28;
LABEL_38:
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v26, v17);
    }
  }
LABEL_39:
  LOBYTE(v5) = 0;
  return v5;
}

- (void)cleanUpSecondaryBufferQueue
{
  os_unfair_lock_s *p_stateLock;
  opaqueCMSimpleQueue *secondarySamplesQueue;
  __CFAllocator *secondarySamplesAllocator;
  __CFAllocator *secondarySampleBufferInfoAllocator;
  uint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  while (1)
  {
    v7[0] = (uint64_t)CMSimpleQueueDequeue(self->_secondarySamplesQueue);
    if (!v7[0])
      break;
    _VCAudioCaptionsCoordinator_ReleaseSampleInfo((uint64_t)self, v7);
  }
  secondarySamplesQueue = self->_secondarySamplesQueue;
  if (secondarySamplesQueue)
  {
    CFRelease(secondarySamplesQueue);
    self->_secondarySamplesQueue = 0;
  }
  secondarySamplesAllocator = self->_secondarySamplesAllocator;
  if (secondarySamplesAllocator)
  {
    CFRelease(secondarySamplesAllocator);
    self->_secondarySamplesAllocator = 0;
  }
  secondarySampleBufferInfoAllocator = self->_secondarySampleBufferInfoAllocator;
  if (secondarySampleBufferInfoAllocator)
  {
    CFRelease(secondarySampleBufferInfoAllocator);
    self->_secondarySampleBufferInfoAllocator = 0;
  }
  os_unfair_lock_unlock(p_stateLock);
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
  os_unfair_lock_s *p_stateLock;

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_oneToOneEnabled = a3;
  os_unfair_lock_unlock(p_stateLock);
}

- (BOOL)registerStreamWithConfig:(const tagVCAudioCaptionsStreamConfig *)a3
{
  os_unfair_lock_s *p_stateLock;
  _BOOL4 v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  int64_t var0;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  int64_t v19;
  uint64_t v20;
  NSObject *v21;
  int64_t v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  VCAudioCaptionsCoordinator *v33;
  __int16 v34;
  int64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v6 = VCAudioCaptionsBufferInfoCollection_AddBufferInfo((uint64_t)self->_bufferInfos, &a3->var0, 0);
  if (v6)
  {
    objc_msgSend(+[VCCaptionsManager defaultManager](VCCaptionsManager, "defaultManager"), "registerCaptionsSource:streamToken:", self, a3->var0);
    if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          var0 = a3->var0;
          v24 = 136315906;
          v25 = v9;
          v26 = 2080;
          v27 = "-[VCAudioCaptionsCoordinator registerStreamWithConfig:]";
          v28 = 1024;
          v29 = 247;
          v30 = 2048;
          v31 = var0;
          v12 = " [%s] %s:%d Register captions source streamToken=%ld";
          v13 = v10;
          v14 = 38;
LABEL_18:
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v24, v14);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v19 = a3->var0;
          v24 = 136316418;
          v25 = v17;
          v26 = 2080;
          v27 = "-[VCAudioCaptionsCoordinator registerStreamWithConfig:]";
          v28 = 1024;
          v29 = 247;
          v30 = 2112;
          v31 = (int64_t)v7;
          v32 = 2048;
          v33 = self;
          v34 = 2048;
          v35 = v19;
          v12 = " [%s] %s:%d %@(%p) Register captions source streamToken=%ld";
          v13 = v18;
          v14 = 58;
          goto LABEL_18;
        }
      }
    }
  }
  else if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCAudioCaptionsCoordinator registerStreamWithConfig:].cold.1(v15, a3, v16);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v23 = a3->var0;
        v24 = 136316418;
        v25 = v20;
        v26 = 2080;
        v27 = "-[VCAudioCaptionsCoordinator registerStreamWithConfig:]";
        v28 = 1024;
        v29 = 249;
        v30 = 2112;
        v31 = (int64_t)v8;
        v32 = 2048;
        v33 = self;
        v34 = 2048;
        v35 = v23;
        _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not register streamToken=%ld for captions", (uint8_t *)&v24, 0x3Au);
      }
    }
  }
  os_unfair_lock_unlock(p_stateLock);
  return v6;
}

- (void)registerCaptionsEventDelegate:(id)a3
{
  if (objc_msgSend(a3, "conformsToProtocol:", &unk_1F01D1B48))
    objc_storeWeak((id *)&self->_captionsDelegate, a3);
}

- (id)captionsDelegate
{
  return objc_loadWeak((id *)&self->_captionsDelegate);
}

- (void)setCaptionsLocale:(id)a3
{
  -[VCAudioCaptions setLocale:](self->_audioCaptions, "setLocale:", a3);
}

- (void)setCaptionsUsage:(id)a3
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = CFSTR("ACSU");
    v4[0] = a3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
    reportingGenericEvent();
  }
}

- (BOOL)captionsEnabled
{
  return -[VCAudioCaptions enabled](self->_audioCaptions, "enabled");
}

- (BOOL)captionsSupported
{
  return -[VCAudioCaptions supported](self->_audioCaptions, "supported");
}

- (void)enableCaptions:(BOOL)a3
{
  NSObject *global_queue;
  _QWORD block[5];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__VCAudioCaptionsCoordinator_enableCaptions___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v7 = a3;
  dispatch_async(global_queue, block);
}

void __45__VCAudioCaptionsCoordinator_enableCaptions___block_invoke(uint64_t a1)
{
  int v2;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 216));
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (v2 != objc_msgSend(*(id *)(a1 + 32), "captionsEnabled"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "enableCaptions:", *(unsigned __int8 *)(a1 + 40));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = *(unsigned __int8 *)(a1 + 40);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 216));
}

- (void)didDisableCaptions:(BOOL)a3 error:(id)a4
{
  uint64_t v7;
  NSObject *delegateQueue;
  _QWORD block[7];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  reportingGenericEvent();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  os_unfair_lock_lock(&self->_stateLock);
  v7 = -[NSArray copy](-[VCAudioCaptionsBufferInfoCollection streamTokens](self->_bufferInfos, "streamTokens"), "copy");
  v12[5] = v7;
  -[VCCaptionsGibberishDetector reset](self->_gibberishDetector, "reset");
  os_unfair_lock_unlock(&self->_stateLock);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__VCAudioCaptionsCoordinator_didDisableCaptions_error___block_invoke;
  block[3] = &unk_1E9E54C70;
  block[5] = a4;
  block[6] = &v11;
  v10 = a3;
  block[4] = self;
  dispatch_async(delegateQueue, block);
  _Block_object_dispose(&v11, 8);
}

void __55__VCAudioCaptionsCoordinator_didDisableCaptions_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  id obj;
  uint8_t buf[4];
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
  __CFString *v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v33;
    *(_QWORD *)&v3 = 136315906;
    v17 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(obj);
        v7 = *(__CFString **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_opt_class() == *(_QWORD *)(a1 + 32))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v20 = v15;
              v21 = 2080;
              v22 = "-[VCAudioCaptionsCoordinator didDisableCaptions:error:]_block_invoke";
              v23 = 1024;
              v24 = 315;
              v25 = 2112;
              v26 = v7;
              v12 = v16;
              v13 = " [%s] %s:%d Disabled captioning for token=%@";
              v14 = 38;
              goto LABEL_15;
            }
          }
        }
        else
        {
          v8 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v11 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 136316418;
              v20 = v9;
              v21 = 2080;
              v22 = "-[VCAudioCaptionsCoordinator didDisableCaptions:error:]_block_invoke";
              v23 = 1024;
              v24 = 315;
              v25 = 2112;
              v26 = v8;
              v27 = 2048;
              v28 = v11;
              v29 = 2112;
              v30 = v7;
              v12 = v10;
              v13 = " [%s] %s:%d %@(%p) Disabled captioning for token=%@";
              v14 = 58;
LABEL_15:
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
            }
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "streamToken:didDisableCaptions:error:", -[__CFString unsignedIntValue](v7, "unsignedIntValue", v17), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v4);
  }

}

- (void)didEnableCaptions:(BOOL)a3 error:(id)a4
{
  uint64_t v7;
  NSObject *delegateQueue;
  _QWORD block[7];
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  reportingGenericEvent();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v16 = 0;
  os_unfair_lock_lock(&self->_stateLock);
  v7 = -[NSArray copy](-[VCAudioCaptionsBufferInfoCollection streamTokens](self->_bufferInfos, "streamTokens"), "copy");
  v12[5] = v7;
  -[VCCaptionsGibberishDetector reset](self->_gibberishDetector, "reset");
  os_unfair_lock_unlock(&self->_stateLock);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__VCAudioCaptionsCoordinator_didEnableCaptions_error___block_invoke;
  block[3] = &unk_1E9E54C70;
  block[5] = a4;
  block[6] = &v11;
  v10 = a3;
  block[4] = self;
  dispatch_async(delegateQueue, block);
  _Block_object_dispose(&v11, 8);
}

void __54__VCAudioCaptionsCoordinator_didEnableCaptions_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  id obj;
  uint8_t buf[4];
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
  __CFString *v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)v33;
    *(_QWORD *)&v3 = 136315906;
    v17 = v3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v33 != v5)
          objc_enumerationMutation(obj);
        v7 = *(__CFString **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_opt_class() == *(_QWORD *)(a1 + 32))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v15 = VRTraceErrorLogLevelToCSTR();
            v16 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              v20 = v15;
              v21 = 2080;
              v22 = "-[VCAudioCaptionsCoordinator didEnableCaptions:error:]_block_invoke";
              v23 = 1024;
              v24 = 331;
              v25 = 2112;
              v26 = v7;
              v12 = v16;
              v13 = " [%s] %s:%d Enabled captioning for token=%@";
              v14 = 38;
              goto LABEL_15;
            }
          }
        }
        else
        {
          v8 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v9 = VRTraceErrorLogLevelToCSTR();
            v10 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v11 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 136316418;
              v20 = v9;
              v21 = 2080;
              v22 = "-[VCAudioCaptionsCoordinator didEnableCaptions:error:]_block_invoke";
              v23 = 1024;
              v24 = 331;
              v25 = 2112;
              v26 = v8;
              v27 = 2048;
              v28 = v11;
              v29 = 2112;
              v30 = v7;
              v12 = v10;
              v13 = " [%s] %s:%d %@(%p) Enabled captioning for token=%@";
              v14 = 58;
LABEL_15:
              _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, v14);
            }
          }
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "streamToken:didEnableCaptions:error:", -[__CFString unsignedIntValue](v7, "unsignedIntValue", v17), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
    }
    while (v4);
  }

}

- (void)didStartCaptioningWithReason:(int)a3 streamToken:(int64_t)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *delegateQueue;
  _QWORD block[6];
  int v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  VCAudioCaptionsCoordinator *v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v19 = v8;
        v20 = 2080;
        v21 = "-[VCAudioCaptionsCoordinator didStartCaptioningWithReason:streamToken:]";
        v22 = 1024;
        v23 = 339;
        v24 = 2048;
        v25 = a4;
        v10 = " [%s] %s:%d Started captioning for token=%ld";
        v11 = v9;
        v12 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v19 = v13;
        v20 = 2080;
        v21 = "-[VCAudioCaptionsCoordinator didStartCaptioningWithReason:streamToken:]";
        v22 = 1024;
        v23 = 339;
        v24 = 2112;
        v25 = (int64_t)v7;
        v26 = 2048;
        v27 = self;
        v28 = 2048;
        v29 = a4;
        v10 = " [%s] %s:%d %@(%p) Started captioning for token=%ld";
        v11 = v14;
        v12 = 58;
        goto LABEL_11;
      }
    }
  }
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__VCAudioCaptionsCoordinator_didStartCaptioningWithReason_streamToken___block_invoke;
  block[3] = &unk_1E9E52350;
  block[4] = self;
  block[5] = a4;
  v17 = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __71__VCAudioCaptionsCoordinator_didStartCaptioningWithReason_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "streamToken:didStartCaptioningWithReason:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)didStopCaptioningWithReason:(int)a3 streamToken:(int64_t)a4
{
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *delegateQueue;
  _QWORD block[6];
  int v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int64_t v25;
  __int16 v26;
  VCAudioCaptionsCoordinator *v27;
  __int16 v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v19 = v8;
        v20 = 2080;
        v21 = "-[VCAudioCaptionsCoordinator didStopCaptioningWithReason:streamToken:]";
        v22 = 1024;
        v23 = 346;
        v24 = 2048;
        v25 = a4;
        v10 = " [%s] %s:%d Stopped captioning for token=%ld";
        v11 = v9;
        v12 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v19 = v13;
        v20 = 2080;
        v21 = "-[VCAudioCaptionsCoordinator didStopCaptioningWithReason:streamToken:]";
        v22 = 1024;
        v23 = 346;
        v24 = 2112;
        v25 = (int64_t)v7;
        v26 = 2048;
        v27 = self;
        v28 = 2048;
        v29 = a4;
        v10 = " [%s] %s:%d %@(%p) Stopped captioning for token=%ld";
        v11 = v14;
        v12 = 58;
        goto LABEL_11;
      }
    }
  }
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VCAudioCaptionsCoordinator_didStopCaptioningWithReason_streamToken___block_invoke;
  block[3] = &unk_1E9E52350;
  block[4] = self;
  block[5] = a4;
  v17 = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __70__VCAudioCaptionsCoordinator_didStopCaptioningWithReason_streamToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "streamToken:didStopCaptioningWithReason:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)didUpdateCaptions:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  BOOL v13;
  BOOL v14;
  NSObject *delegateQueue;
  _QWORD block[6];
  BOOL v17;
  BOOL v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  VCAudioCaptionsCoordinator *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if ((VCAudioCaptionsCoordinator *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v20 = v6;
        v21 = 2080;
        v22 = "-[VCAudioCaptionsCoordinator didUpdateCaptions:]";
        v23 = 1024;
        v24 = 353;
        v25 = 2048;
        v26 = objc_msgSend(a3, "streamToken");
        v8 = " [%s] %s:%d Got transcription for token=%ld";
        v9 = v7;
        v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCAudioCaptionsCoordinator performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v20 = v11;
        v21 = 2080;
        v22 = "-[VCAudioCaptionsCoordinator didUpdateCaptions:]";
        v23 = 1024;
        v24 = 353;
        v25 = 2112;
        v26 = (uint64_t)v5;
        v27 = 2048;
        v28 = self;
        v29 = 2048;
        v30 = objc_msgSend(a3, "streamToken");
        v8 = " [%s] %s:%d %@(%p) Got transcription for token=%ld";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
  v13 = -[VCCaptionsGibberishDetector processTranscript:](self->_gibberishDetector, "processTranscript:", a3);
  v14 = -[VCCaptionsGibberishDetector gibberishStateForCaptionsToken:](self->_gibberishDetector, "gibberishStateForCaptionsToken:", objc_msgSend(a3, "streamToken"));
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCAudioCaptionsCoordinator_didUpdateCaptions___block_invoke;
  block[3] = &unk_1E9E54C98;
  v17 = v13;
  block[4] = self;
  block[5] = a3;
  v18 = v14;
  dispatch_async(delegateQueue, block);
}

uint64_t __48__VCAudioCaptionsCoordinator_didUpdateCaptions___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "streamToken:didDetectGibberish:", objc_msgSend(*(id *)(a1 + 40), "streamToken"), *(unsigned __int8 *)(a1 + 49));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "streamToken:didUpdateCaptions:", objc_msgSend(*(id *)(a1 + 40), "streamToken"), *(_QWORD *)(a1 + 40));
}

- (int64_t)currentlyCaptionedStreamToken
{
  return self->_currentlyCaptionedStreamToken;
}

- (void)setCurrentlyCaptionedStreamToken:(int64_t)a3
{
  self->_currentlyCaptionedStreamToken = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (os_unfair_lock_s)stateLock
{
  return self->_stateLock;
}

- (void)setStateLock:(os_unfair_lock_s)a3
{
  self->_stateLock = a3;
}

intptr_t ___VCAudioCaptionsCoordinator_StartCaptioning_block_invoke(uint64_t a1, int a2)
{
  char v2;

  v2 = a2;
  if (a2)
  {
    _VCAudioCaptionsCoordinator_PushAudioSamplesToRecognizer(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCAudioCaptionsCoordinator_StartCaptioning_block_invoke_cold_1();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 48) + 224));
}

intptr_t ___VCAudioCaptionsCoordinator_StopCaptioning_block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      ___VCAudioCaptionsCoordinator_StopCaptioning_block_invoke_cold_1();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 224));
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Requires valid taskIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create audio captions object.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create gibberish detection object.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to buffer info collection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create delegateQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.6()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the primary voice detector", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.7()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create the secondary voice detector", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:.cold.8()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create setup the secondary buffer queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpSecondaryBufferQueue
{
  __int16 v0;
  int v1;
  os_log_t v2;
  uint8_t v3[14];
  const char *v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v4 = "-[VCAudioCaptionsCoordinator setUpSecondaryBufferQueue]";
  OUTLINED_FUNCTION_4();
  v5 = 161;
  v6 = v0;
  v7 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create samples queue. status=%d", v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)registerStreamWithConfig:(NSObject *)a3 .cold.1(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[22];
  __int128 v4;

  *(_DWORD *)v3 = 136315906;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(_QWORD *)&v3[14] = "-[VCAudioCaptionsCoordinator registerStreamWithConfig:]";
  LODWORD(v4) = 249;
  WORD2(v4) = 2048;
  *(_QWORD *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, (uint64_t)a2, a3, " [%s] %s:%d Could not register streamToken=%ld for captions", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCAudioCaptionsCoordinator registerStreamWithConfig:]" >> 16, (_QWORD)v4);
  OUTLINED_FUNCTION_3();
}

void ___VCAudioCaptionsCoordinator_StartCaptioning_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Tried to start captions but failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___VCAudioCaptionsCoordinator_StopCaptioning_block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Tried to stop captions but failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
