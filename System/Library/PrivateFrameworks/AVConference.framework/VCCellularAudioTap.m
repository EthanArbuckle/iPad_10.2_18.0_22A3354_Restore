@implementation VCCellularAudioTap

- (BOOL)setUpReportingAgent
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  const void *Agent;
  uint8_t buf[4];
  uint64_t v14;
  __int128 v15;
  _BYTE v16[108];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((VCCellularAudioTap *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCCellularAudioTap performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136316162;
    v14 = v9;
    LOWORD(v15) = 2080;
    *(_QWORD *)((char *)&v15 + 2) = "-[VCCellularAudioTap setUpReportingAgent]";
    WORD5(v15) = 1024;
    HIDWORD(v15) = 70;
    *(_WORD *)v16 = 2112;
    *(_QWORD *)&v16[2] = v3;
    *(_WORD *)&v16[10] = 2048;
    *(_QWORD *)&v16[12] = self;
    v6 = " [%s] %s:%d %@(%p) Register Reporting Agent";
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
      v14 = v4;
      LOWORD(v15) = 2080;
      *(_QWORD *)((char *)&v15 + 2) = "-[VCCellularAudioTap setUpReportingAgent]";
      WORD5(v15) = 1024;
      HIDWORD(v15) = 70;
      v6 = " [%s] %s:%d Register Reporting Agent";
      v7 = v5;
      v8 = 28;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_12:
  *(_DWORD *)buf = self->_tapToken;
  *(_QWORD *)&v15 = 0;
  v14 = 0;
  *((_QWORD *)&v15 + 1) = 0x1500000000;
  memset(v16, 0, sizeof(v16));
  Agent = (const void *)reportingCreateAgent();
  if (Agent)
  {
    -[VCObject setReportingAgent:](self, "setReportingAgent:", Agent);
    CFRelease(Agent);
    -[VCObject reportingAgent](self, "reportingAgent");
    self->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    -[VCObject reportingAgent](self, "reportingAgent");
    -[VCCellularAudioTap clientSpecificUserInfo](self, "clientSpecificUserInfo");
    reportingSetUserInfo();
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingRecordingAndTranscriptionServiceUsage();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCellularAudioTap setUpReportingAgent].cold.1();
  }
  return Agent != 0;
}

void __41__VCCellularAudioTap_setUpReportingAgent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
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
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a2, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "strong");
    v3 = objc_opt_class();
    if (v3 == objc_msgSend(*(id *)(a1 + 32), "strong"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __41__VCCellularAudioTap_setUpReportingAgent__block_invoke_cold_1();
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "strong");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v7 = objc_msgSend(*(id *)(a1 + 32), "strong");
          v8 = 136316162;
          v9 = v5;
          v10 = 2080;
          v11 = "-[VCCellularAudioTap setUpReportingAgent]_block_invoke";
          v12 = 1024;
          v13 = 84;
          v14 = 2112;
          v15 = v4;
          v16 = 2048;
          v17 = v7;
          _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Reporting not available (no backends)", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
}

- (__CFDictionary)clientSpecificUserInfo
{
  NSString *uuid;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  uuid = self->_uuid;
  v4 = CFSTR("AMUUID");
  v5[0] = uuid;
  return (__CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
}

+ (id)stringFromTapType:(unsigned int)a3
{
  const char *v3;

  v3 = "Unknown";
  if (a3 == 1)
    v3 = "Downlink";
  if (!a3)
    v3 = "Uplink";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s(%u)"), v3, *(_QWORD *)&a3);
}

- (void)printAudioTapHealth
{
  NSObject *stateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__VCCellularAudioTap_printAudioTapHealth__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(stateQueue, v3);
}

void __41__VCCellularAudioTap_printAudioTapHealth__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  float v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id obj;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 168);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v8 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKeyedSubscript:", v7), "realtimeContext");
        if (v8)
        {
          v9 = v8;
          v10 = +[VCCellularAudioTap stringFromTapType:](VCCellularAudioTap, "stringFromTapType:", *(unsigned int *)(v8 + 8));
          v11 = *(float *)(v9 + 32);
        }
        else
        {
          v10 = +[VCCellularAudioTap stringFromTapType:](VCCellularAudioTap, "stringFromTapType:", 0xFFFFFFFFLL);
          v11 = NAN;
        }
        objc_msgSend(v2, "appendFormat:", CFSTR("streamToken=%@ tapType=%@ averagePower=%f "), v7, v10, v11);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v4);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136316162;
      v17 = v12;
      v18 = 2080;
      v19 = "-[VCCellularAudioTap printAudioTapHealth]_block_invoke";
      v20 = 1024;
      v21 = 121;
      v22 = 2048;
      v23 = v14;
      v24 = 2112;
      v25 = v2;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @=@ Health: BasebandAudioTap [%p] %@", buf, 0x30u);
    }
  }
}

- (void)setUpPeriodicReporting
{
  if (-[VCObject reportingAgent](self, "reportingAgent"))
  {
    reportingRegisterPeriodicTaskWeak();
    reportingStartTimer();
  }
}

uint64_t __44__VCCellularAudioTap_setUpPeriodicReporting__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
    return objc_msgSend(a2, "printAudioTapHealth");
  return result;
}

- (void)cleanUpPeriodicReporting
{
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingUnregisterPeriodicTask();
  reportingStopTimer();
}

- (void)handleThermalPressureNotification:(id)a3
{
  uint64_t v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("VCVideoCaptureServer_NotificationKeyThermalPressureLevel")), "intValue");
  v5 = CFSTR("Thermal");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
}

- (void)registerForThermalNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (-[VCObject reportingAgent](self, "reportingAgent"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
    self->_registeredForThermalNotifications = 1;
  }
}

- (void)unregisterForThermalNotifications
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_registeredForThermalNotifications)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
    self->_registeredForThermalNotifications = 0;
  }
}

- (BOOL)setUpMediaRecorder
{
  VCMediaRecorder *v3;
  VCMediaRecorder *v4;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  VCCellularAudioTap *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[VCMediaRecorder initWithStreamToken:delegate:reportingAgent:]([VCMediaRecorder alloc], "initWithStreamToken:delegate:reportingAgent:", LODWORD(self->_tapToken), 0, -[VCObject reportingAgent](self, "reportingAgent"));
  v4 = v3;
  self->_mediaRecorder = v3;
  if (v3)
  {
    -[VCMediaRecorder setCapabilities:](v3, "setCapabilities:", 2);
    -[VCMediaRecorderManager registerMediaRecorder:withStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "registerMediaRecorder:withStreamToken:", self->_mediaRecorder, self->_tapToken);
  }
  else if ((VCCellularAudioTap *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCellularAudioTap setUpMediaRecorder].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCCellularAudioTap performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v9 = 136316162;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCCellularAudioTap setUpMediaRecorder]";
        v13 = 1024;
        v14 = 193;
        v15 = 2112;
        v16 = v6;
        v17 = 2048;
        v18 = self;
        _os_log_error_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate media recorder", (uint8_t *)&v9, 0x30u);
      }
    }
  }
  return v4 != 0;
}

- (void)cleanUpMediaRecorder
{
  if (self->_mediaRecorder)
  {
    -[VCMediaRecorderManager unregisterMediaRecorderWithStreamToken:](+[VCMediaRecorderManager sharedInstance](VCMediaRecorderManager, "sharedInstance"), "unregisterMediaRecorderWithStreamToken:", self->_tapToken);
    -[VCMediaRecorder invalidate](self->_mediaRecorder, "invalidate");

    self->_mediaRecorder = 0;
  }
}

- (BOOL)setUpCaptionsCoordinator
{
  VCAudioCaptionsCoordinator *v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  VCCellularAudioTap *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = -[VCAudioCaptionsCoordinator initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:]([VCAudioCaptionsCoordinator alloc], "initWithOneToOneEnabled:isLocal:taskIdentifier:reportingAgent:", 1, 0, CFSTR("callrecordingcaptions"), -[VCObject reportingAgent](self, "reportingAgent"));
  self->_captionsCoordinator = v3;
  if (!v3)
  {
    if ((VCCellularAudioTap *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCellularAudioTap setUpCaptionsCoordinator].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCCellularAudioTap performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v8 = 136316162;
          v9 = v6;
          v10 = 2080;
          v11 = "-[VCCellularAudioTap setUpCaptionsCoordinator]";
          v12 = 1024;
          v13 = 222;
          v14 = 2112;
          v15 = v5;
          v16 = 2048;
          v17 = self;
          _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate downlink captions coordinator", (uint8_t *)&v8, 0x30u);
        }
      }
    }
  }
  return v3 != 0;
}

- (void)cleanUpCaptionsCoordinator
{
  -[VCAudioCaptionsCoordinator invalidate](self->_captionsCoordinator, "invalidate");

  self->_captionsCoordinator = 0;
}

- (BOOL)setUpDelegateQueue:(id)a3
{
  NSObject *CustomRootQueue;
  OS_dispatch_queue *v6;
  _BOOL4 v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCCellularAudioTap *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    dispatch_retain((dispatch_object_t)a3);
    self->_delegateQueue = (OS_dispatch_queue *)a3;
LABEL_4:
    LOBYTE(v7) = 1;
    return v7;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v6 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCCellularAudioTap.delegateQueue", 0, CustomRootQueue);
  self->_delegateQueue = v6;
  if (v6)
    goto LABEL_4;
  if ((VCCellularAudioTap *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
        return v7;
      -[VCCellularAudioTap setUpDelegateQueue:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = (const __CFString *)-[VCCellularAudioTap performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v8 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
        return v7;
      v12 = 136316418;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCCellularAudioTap setUpDelegateQueue:]";
      v16 = 1024;
      v17 = 248;
      v18 = 2112;
      v19 = v8;
      v20 = 2048;
      v21 = self;
      v22 = 2112;
      v23 = 0;
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate the delegateQueue=%@", (uint8_t *)&v12, 0x3Au);
    }
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (BOOL)setUpCallRecordingComponents
{
  _BOOL4 v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCCellularAudioTap *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!VCFeatureFlagManager_CallRecordingEnabled())
  {
    if ((VCCellularAudioTap *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_17;
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v13 = 136315650;
      v14 = v5;
      v15 = 2080;
      v16 = "-[VCCellularAudioTap setUpCallRecordingComponents]";
      v17 = 1024;
      v18 = 264;
      v7 = " [%s] %s:%d Skipping set up for media recorder and captions coordinator because CallRecording is NOT enabled.";
      v8 = v6;
      v9 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)-[VCCellularAudioTap performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_17;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      v13 = 136316162;
      v14 = v10;
      v15 = 2080;
      v16 = "-[VCCellularAudioTap setUpCallRecordingComponents]";
      v17 = 1024;
      v18 = 264;
      v19 = 2112;
      v20 = v4;
      v21 = 2048;
      v22 = self;
      v7 = " [%s] %s:%d %@(%p) Skipping set up for media recorder and captions coordinator because CallRecording is NOT enabled.";
      v8 = v11;
      v9 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
LABEL_17:
    LOBYTE(v3) = 1;
    return v3;
  }
  self->_uuid = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3A28], "UUID"), "UUIDString");
  v3 = -[VCCellularAudioTap setUpReportingAgent](self, "setUpReportingAgent");
  if (v3)
  {
    v3 = -[VCCellularAudioTap setUpMediaRecorder](self, "setUpMediaRecorder");
    if (v3)
    {
      if (!-[VCCellularAudioTap setUpCaptionsCoordinator](self, "setUpCaptionsCoordinator"))
      {
        LOBYTE(v3) = 0;
        return v3;
      }
      goto LABEL_17;
    }
  }
  return v3;
}

- (VCCellularAudioTap)initWithProcessId:(int)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  VCCellularAudioTap *v8;
  NSMutableDictionary *v9;
  NSObject *CustomRootQueue;
  dispatch_queue_t v11;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  objc_super v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  VCCellularAudioTap *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VCCellularAudioTap;
  v8 = -[VCObject init](&v19, sel_init);
  if (!v8)
    return v8;
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8->_audioTapIOMap = v9;
  if (!v9)
  {
    if ((VCCellularAudioTap *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCellularAudioTap initWithProcessId:delegate:delegateQueue:].cold.1();
      }
      goto LABEL_6;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCCellularAudioTap performSelector:](v8, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = v15;
        v22 = 2080;
        v23 = "-[VCCellularAudioTap initWithProcessId:delegate:delegateQueue:]";
        v24 = 1024;
        v25 = 277;
        v26 = 2112;
        v27 = v13;
        v28 = 2048;
        v29 = v8;
        v17 = " [%s] %s:%d %@(%p) Failed to allocate the audio tap I/O map";
LABEL_28:
        _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x30u);
      }
    }
LABEL_6:

    return 0;
  }
  if (!-[VCCellularAudioTap setUpDelegateQueue:](v8, "setUpDelegateQueue:", a5))
    goto LABEL_6;
  -[VCCellularAudioTap setDelegate:](v8, "setDelegate:", a4);
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v11 = dispatch_queue_create_with_target_V2("com.apple.AVConference.VCCellularAudioTap.stateQueue", 0, CustomRootQueue);
  v8->_stateQueue = (OS_dispatch_queue *)v11;
  if (!v11)
  {
    if ((VCCellularAudioTap *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCellularAudioTap initWithProcessId:delegate:delegateQueue:].cold.2();
      }
      goto LABEL_6;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCCellularAudioTap performSelector:](v8, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v21 = v18;
        v22 = 2080;
        v23 = "-[VCCellularAudioTap initWithProcessId:delegate:delegateQueue:]";
        v24 = 1024;
        v25 = 282;
        v26 = 2112;
        v27 = v14;
        v28 = 2048;
        v29 = v8;
        v17 = " [%s] %s:%d %@(%p) Failed to allocate the state queue";
        goto LABEL_28;
      }
    }
    goto LABEL_6;
  }
  v8->_processId = a3;
  v8->_tapToken = VCUniqueIDGenerator_GenerateID();
  if (!-[VCCellularAudioTap setUpCallRecordingComponents](v8, "setUpCallRecordingComponents"))
    goto LABEL_6;
  return v8;
}

- (void)invalidate
{
  -[VCCellularAudioTap setDelegate:](self, "setDelegate:", 0);
  -[VCMediaRecorder invalidate](self->_mediaRecorder, "invalidate");
  -[VCObject reportingAgent](self, "reportingAgent");
  VCReporting_finalizeAggregation();
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *stateQueue;
  NSObject *delegateQueue;
  objc_super v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[VCCellularAudioTap setDelegate:](self, "setDelegate:", 0);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)-[NSMutableDictionary allKeys](self->_audioTapIOMap, "allKeys");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        -[VCCellularAudioTap removeAudioTapForStreamToken:error:](self, "removeAudioTapForStreamToken:error:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "unsignedIntValue"), 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v5);
  }

  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  -[VCCellularAudioTap cleanUpCaptionsCoordinator](self, "cleanUpCaptionsCoordinator");
  -[VCCellularAudioTap cleanUpMediaRecorder](self, "cleanUpMediaRecorder");

  v10.receiver = self;
  v10.super_class = (Class)VCCellularAudioTap;
  -[VCObject dealloc](&v10, sel_dealloc);
}

- (BOOL)addAudioTapForStreamToken:(int64_t)a3 tapType:(unsigned int)a4 error:(id *)a5
{
  NSObject *stateQueue;
  char v6;
  _QWORD v8[8];
  unsigned int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  stateQueue = self->_stateQueue;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__VCCellularAudioTap_addAudioTapForStreamToken_tapType_error___block_invoke;
  v8[3] = &unk_1E9E56B18;
  v9 = a4;
  v8[4] = self;
  v8[5] = &v10;
  v8[6] = a3;
  v8[7] = a5;
  dispatch_sync(stateQueue, v8);
  v6 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __62__VCCellularAudioTap_addAudioTapForStreamToken_tapType_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE v40[24];
  _BYTE v41[24];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = (_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    v5 = -2142830591;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __62__VCCellularAudioTap_addAudioTapForStreamToken_tapType_error___block_invoke_cold_1();
      }
      goto LABEL_51;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v27 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v40 = 136316162;
        *(_QWORD *)&v40[4] = v25;
        *(_WORD *)&v40[12] = 2080;
        *(_QWORD *)&v40[14] = "-[VCCellularAudioTap addAudioTapForStreamToken:tapType:error:]_block_invoke";
        *(_WORD *)&v40[22] = 1024;
        *(_DWORD *)v41 = 335;
        *(_WORD *)&v41[4] = 2112;
        *(_QWORD *)&v41[6] = v9;
        *(_WORD *)&v41[14] = 2048;
        *(_QWORD *)&v41[16] = v27;
        v16 = " [%s] %s:%d %@(%p) Invalid stream token";
        v17 = v26;
        v18 = 48;
LABEL_57:
        _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, v16, v40, v18);
      }
    }
LABEL_51:
    v7 = 0;
    v6 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(v4 + 168), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:")))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v5 = -2142830551;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __62__VCCellularAudioTap_addAudioTapForStreamToken_tapType_error___block_invoke_cold_2();
        goto LABEL_51;
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        v5 = -2142830551;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v30 = *(_QWORD *)(a1 + 32);
          v31 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)v40 = 136316418;
          *(_QWORD *)&v40[4] = v28;
          *(_WORD *)&v40[12] = 2080;
          *(_QWORD *)&v40[14] = "-[VCCellularAudioTap addAudioTapForStreamToken:tapType:error:]_block_invoke";
          *(_WORD *)&v40[22] = 1024;
          *(_DWORD *)v41 = 336;
          *(_WORD *)&v41[4] = 2112;
          *(_QWORD *)&v41[6] = v10;
          *(_WORD *)&v41[14] = 2048;
          *(_QWORD *)&v41[16] = v30;
          LOWORD(v42) = 1024;
          *(_DWORD *)((char *)&v42 + 2) = v31;
          v16 = " [%s] %s:%d %@(%p) Audio tap already registered for streamToken=%u";
          v17 = v29;
          v18 = 54;
          goto LABEL_57;
        }
        goto LABEL_51;
      }
    }
    v7 = 0;
    v6 = 0;
    v5 = -2142830551;
    goto LABEL_6;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "registerAudioTapForStreamToken:tapType:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64));
  if (v5 < 0)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_51;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      v15 = *v3;
      *(_DWORD *)v40 = 136316162;
      *(_QWORD *)&v40[4] = v13;
      *(_WORD *)&v40[12] = 2080;
      *(_QWORD *)&v40[14] = "-[VCCellularAudioTap addAudioTapForStreamToken:tapType:error:]_block_invoke";
      *(_WORD *)&v40[22] = 1024;
      *(_DWORD *)v41 = 339;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = v15;
      *(_WORD *)&v41[10] = 1024;
      *(_DWORD *)&v41[12] = v5;
      v16 = " [%s] %s:%d Failed to register audio tap for streamToken=%u result=0x%x";
      v17 = v14;
      v18 = 40;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_51;
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      v36 = *(_QWORD *)(a1 + 32);
      v37 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v40 = 136316674;
      *(_QWORD *)&v40[4] = v32;
      *(_WORD *)&v40[12] = 2080;
      *(_QWORD *)&v40[14] = "-[VCCellularAudioTap addAudioTapForStreamToken:tapType:error:]_block_invoke";
      *(_WORD *)&v40[22] = 1024;
      *(_DWORD *)v41 = 339;
      *(_WORD *)&v41[4] = 2112;
      *(_QWORD *)&v41[6] = v11;
      *(_WORD *)&v41[14] = 2048;
      *(_QWORD *)&v41[16] = v36;
      LOWORD(v42) = 1024;
      *(_DWORD *)((char *)&v42 + 2) = v37;
      HIWORD(v42) = 1024;
      LODWORD(v43) = v5;
      v16 = " [%s] %s:%d %@(%p) Failed to register audio tap for streamToken=%u result=0x%x";
      v17 = v33;
      v18 = 60;
    }
    goto LABEL_57;
  }
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *v3)), "audioIO"), "start");
  if (!v6)
  {
    v7 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_6;
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_55;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    v21 = *v3;
    *(_DWORD *)v40 = 136316162;
    *(_QWORD *)&v40[4] = v19;
    *(_WORD *)&v40[12] = 2080;
    *(_QWORD *)&v40[14] = "-[VCCellularAudioTap addAudioTapForStreamToken:tapType:error:]_block_invoke";
    *(_WORD *)&v40[22] = 1024;
    *(_DWORD *)v41 = 344;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v21;
    *(_WORD *)&v41[10] = 2112;
    *(_QWORD *)&v41[12] = v6;
    v22 = " [%s] %s:%d Failed to register start the audioIO for streamToken=%u. error=%@";
    v23 = v20;
    v24 = 44;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v12 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_55;
    v34 = VRTraceErrorLogLevelToCSTR();
    v35 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    v38 = *(_QWORD *)(a1 + 32);
    v39 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)v40 = 136316674;
    *(_QWORD *)&v40[4] = v34;
    *(_WORD *)&v40[12] = 2080;
    *(_QWORD *)&v40[14] = "-[VCCellularAudioTap addAudioTapForStreamToken:tapType:error:]_block_invoke";
    *(_WORD *)&v40[22] = 1024;
    *(_DWORD *)v41 = 344;
    *(_WORD *)&v41[4] = 2112;
    *(_QWORD *)&v41[6] = v12;
    *(_WORD *)&v41[14] = 2048;
    *(_QWORD *)&v41[16] = v38;
    LOWORD(v42) = 1024;
    *(_DWORD *)((char *)&v42 + 2) = v39;
    HIWORD(v42) = 2112;
    v43 = v6;
    v22 = " [%s] %s:%d %@(%p) Failed to register start the audioIO for streamToken=%u. error=%@";
    v23 = v35;
    v24 = 64;
  }
  _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, v22, v40, v24);
LABEL_55:
  v7 = 1;
LABEL_6:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "unregisterAudioTapForStreamToken:", *(_QWORD *)(a1 + 48));
    v8 = *(uint64_t **)(a1 + 56);
    if (v8)
    {
      if (!v6)
      {
        v6 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCCellularAudioTap"), v5, 0);
        v8 = *(uint64_t **)(a1 + 56);
      }
      *v8 = v6;
    }
    objc_msgSend(*(id *)(a1 + 32), "cleanUpPeriodicReporting", *(_OWORD *)v40, *(_QWORD *)&v40[16], *(_OWORD *)v41, *(_QWORD *)&v41[16], v42, v43);
    objc_msgSend(*(id *)(a1 + 32), "unregisterForThermalNotifications");
  }
}

- (BOOL)removeAudioTapForStreamToken:(int64_t)a3 error:(id *)a4
{
  NSObject *stateQueue;
  char v5;
  _QWORD block[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke;
  block[3] = &unk_1E9E56B40;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  block[7] = a4;
  dispatch_sync(stateQueue, block);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[24];
  _BYTE v30[24];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v5 = (void *)objc_msgSend(*(id *)(v4 + 168), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"));
    if (!v5)
    {
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        v17 = -2142830570;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_16;
        VRTraceErrorLogLevelToCSTR();
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke_cold_2();
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v21 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v21 = &stru_1E9E58EE0;
        v17 = -2142830570;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_16;
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        v27 = *(_QWORD *)(a1 + 32);
        v28 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)v29 = 136316418;
        *(_QWORD *)&v29[4] = v25;
        *(_WORD *)&v29[12] = 2080;
        *(_QWORD *)&v29[14] = "-[VCCellularAudioTap removeAudioTapForStreamToken:error:]_block_invoke";
        *(_WORD *)&v29[22] = 1024;
        *(_DWORD *)v30 = 373;
        *(_WORD *)&v30[4] = 2112;
        *(_QWORD *)&v30[6] = v21;
        *(_WORD *)&v30[14] = 2048;
        *(_QWORD *)&v30[16] = v27;
        LOWORD(v31) = 1024;
        *(_DWORD *)((char *)&v31 + 2) = v28;
        _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Audio tap not found. streamToken=%u", v29, 0x36u);
      }
      v17 = -2142830570;
      goto LABEL_16;
    }
    v6 = objc_msgSend((id)objc_msgSend(v5, "audioIO"), "stop");
    if (!v6)
      goto LABEL_13;
    v7 = v6;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_13;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v11 = *v3;
      *(_DWORD *)v29 = 136316162;
      *(_QWORD *)&v29[4] = v9;
      *(_WORD *)&v29[12] = 2080;
      *(_QWORD *)&v29[14] = "-[VCCellularAudioTap removeAudioTapForStreamToken:error:]_block_invoke";
      *(_WORD *)&v29[22] = 1024;
      *(_DWORD *)v30 = 378;
      *(_WORD *)&v30[4] = 1024;
      *(_DWORD *)&v30[6] = v11;
      *(_WORD *)&v30[10] = 2112;
      *(_QWORD *)&v30[12] = v7;
      v12 = " [%s] %s:%d Failed to stop the audioIO for streamToken=%u. error=%@";
      v13 = v10;
      v14 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_13;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      v18 = *(_QWORD *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v29 = 136316674;
      *(_QWORD *)&v29[4] = v15;
      *(_WORD *)&v29[12] = 2080;
      *(_QWORD *)&v29[14] = "-[VCCellularAudioTap removeAudioTapForStreamToken:error:]_block_invoke";
      *(_WORD *)&v29[22] = 1024;
      *(_DWORD *)v30 = 378;
      *(_WORD *)&v30[4] = 2112;
      *(_QWORD *)&v30[6] = v8;
      *(_WORD *)&v30[14] = 2048;
      *(_QWORD *)&v30[16] = v18;
      LOWORD(v31) = 1024;
      *(_DWORD *)((char *)&v31 + 2) = v19;
      HIWORD(v31) = 2112;
      v32 = v7;
      v12 = " [%s] %s:%d %@(%p) Failed to stop the audioIO for streamToken=%u. error=%@";
      v13 = v16;
      v14 = 64;
    }
    _os_log_error_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_ERROR, v12, v29, v14);
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "unregisterAudioTapForStreamToken:", *(_QWORD *)(a1 + 48), *(_OWORD *)v29, *(_QWORD *)&v29[16], *(_OWORD *)v30, *(_QWORD *)&v30[16], v31, v32);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "cleanUpPeriodicReporting");
      objc_msgSend(*(id *)(a1 + 32), "unregisterForThermalNotifications");
    }
    v17 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_16;
  }
  v17 = -2142830591;
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v24 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)v29 = 136316162;
        *(_QWORD *)&v29[4] = v22;
        *(_WORD *)&v29[12] = 2080;
        *(_QWORD *)&v29[14] = "-[VCCellularAudioTap removeAudioTapForStreamToken:error:]_block_invoke";
        *(_WORD *)&v29[22] = 1024;
        *(_DWORD *)v30 = 370;
        *(_WORD *)&v30[4] = 2112;
        *(_QWORD *)&v30[6] = v20;
        *(_WORD *)&v30[14] = 2048;
        *(_QWORD *)&v30[16] = v24;
        _os_log_error_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Invalid stream token", v29, 0x30u);
      }
    }
  }
LABEL_16:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_QWORD *)(a1 + 56))
      **(_QWORD **)(a1 + 56) = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCCellularAudioTap"), v17, 0);
  }
}

- (void)serverDidDie
{
  NSObject *delegateQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__VCCellularAudioTap_serverDidDie__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

uint64_t __34__VCCellularAudioTap_serverDidDie__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "serverDidDie");
}

+ (unsigned)audioIOTypeFromTapType:(unsigned int)a3
{
  unsigned int v3;

  if (a3 == 1)
    v3 = 4;
  else
    v3 = -1;
  if (a3)
    return v3;
  else
    return 3;
}

- (tagVCAudioIODelegateContext)sinkDelegateContextWithTapType:(SEL)a3 realtimeContext:(unsigned int)a4
{
  VCAudioCaptionsCoordinator *clientContext;
  int64_t streamToken;

  retstr->delegate = 0;
  retstr->clientCallback = VCCellularAudioTap_ProcessAudioCallback;
  retstr->clientContext = a5;
  clientContext = (VCAudioCaptionsCoordinator *)self[3].clientContext;
  if (clientContext)
    streamToken = a5->streamToken;
  else
    streamToken = 0;
  retstr->captionsToken = streamToken;
  retstr->captionsCoordinator = clientContext;
  retstr->captionsUseSecondaryThread = a4 == 0;
  retstr->injector = 0;
  return self;
}

- (int)makeAudioIOForAudioTapIO:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  VCAudioIO *v11;
  VCAudioIO *v12;
  int v13;
  uint64_t v15;
  NSObject *v16;
  _OWORD v17[14];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "realtimeContext");
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
    {
      v12 = 0;
      v13 = -2142830570;
      goto LABEL_7;
    }
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    v13 = -2142830570;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCellularAudioTap makeAudioIOForAudioTapIO:].cold.1(v15, a3, v16);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = *(unsigned int *)(v5 + 8);
  v8 = +[VCCellularAudioTap audioIOTypeFromTapType:](VCCellularAudioTap, "audioIOTypeFromTapType:", v7);
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18 = v9;
  v19 = v9;
  v20 = v9;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  if (self)
  {
    v10 = v8;
    -[VCCellularAudioTap sinkDelegateContextWithTapType:realtimeContext:](self, "sinkDelegateContextWithTapType:realtimeContext:", v7, v6);
    -[VCCellularAudioTap audioIOConfigWithAudioType:sinkDelegateContext:](self, "audioIOConfigWithAudioType:sinkDelegateContext:", v10, &v18, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL,
      0xAAAAAAAAAAAAAAAALL);
  }
  else
  {
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    memset(v17, 0, sizeof(v17));
  }
  v11 = -[VCAudioIO initWithConfiguration:]([VCAudioIO alloc], "initWithConfiguration:", v17);
  if (!v11)
  {
    v13 = -2142830590;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCellularAudioTap makeAudioIOForAudioTapIO:].cold.2();
    }
LABEL_14:
    v12 = 0;
    goto LABEL_7;
  }
  v12 = v11;
  objc_msgSend(a3, "setAudioIO:", v11);
  v13 = 0;
LABEL_7:

  return v13;
}

- (void)setAudioTapIO:(id)a3 forStreamToken:(int64_t)a4
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (!-[NSMutableDictionary count](self->_audioTapIOMap, "count"))
  {
    -[VCCellularAudioTap setUpPeriodicReporting](self, "setUpPeriodicReporting");
    -[VCCellularAudioTap registerForThermalNotifications](self, "registerForThermalNotifications");
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_audioTapIOMap, "setObject:forKeyedSubscript:", a3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4));
}

- (int)registerAudioTapForStreamToken:(int64_t)a3 tapType:(unsigned int)a4
{
  uint64_t v4;
  VCAudioPowerSpectrumSource *v7;
  VCAudioPowerSpectrumSource *v8;
  VCCellularAudioTapIO *v9;
  VCCellularAudioTapIO *v10;
  int v11;

  v4 = *(_QWORD *)&a4;
  if (+[VCCellularAudioTap audioIOTypeFromTapType:](VCCellularAudioTap, "audioIOTypeFromTapType:", *(_QWORD *)&a4) == -1)
  {
    v11 = -2142830591;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCellularAudioTap registerAudioTapForStreamToken:tapType:].cold.1();
    }
    goto LABEL_13;
  }
  v7 = -[VCAudioPowerSpectrumSource initWithStreamToken:delegate:]([VCAudioPowerSpectrumSource alloc], "initWithStreamToken:delegate:", a3, self);
  if (!v7)
  {
    v11 = -2142830590;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCellularAudioTap registerAudioTapForStreamToken:tapType:].cold.2();
    }
LABEL_13:
    v10 = 0;
    v8 = 0;
    goto LABEL_6;
  }
  v8 = v7;
  v9 = -[VCCellularAudioTapIO initWithStreamToken:powerSpectrumSource:tapType:]([VCCellularAudioTapIO alloc], "initWithStreamToken:powerSpectrumSource:tapType:", a3, v7, v4);
  if (v9)
  {
    v10 = v9;
    -[VCCellularAudioTapIO setMediaRecorder:](v9, "setMediaRecorder:", self->_mediaRecorder);
    v11 = -[VCCellularAudioTap makeAudioIOForAudioTapIO:](self, "makeAudioIOForAudioTapIO:", v10);
    if ((v11 & 0x80000000) == 0)
    {
      -[VCCellularAudioTap setAudioTapIO:forStreamToken:](self, "setAudioTapIO:forStreamToken:", v10, a3);
      -[VCAudioPowerSpectrumManager registerAudioPowerMeterSource:](+[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance"), "registerAudioPowerMeterSource:", v8);
    }
  }
  else
  {
    v11 = -2142830590;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCellularAudioTap registerAudioTapForStreamToken:tapType:].cold.3();
    }
    v10 = 0;
  }
LABEL_6:

  return v11;
}

- (void)unregisterAudioTapForStreamToken:(int64_t)a3
{
  void *v5;
  VCAudioPowerSpectrumManager *v6;

  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_audioTapIOMap, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"));
  v6 = +[VCAudioPowerSpectrumManager sharedInstance](VCAudioPowerSpectrumManager, "sharedInstance");
  -[VCAudioPowerSpectrumManager unregisterAudioPowerSpectrumSourceForStreamToken:](v6, "unregisterAudioPowerSpectrumSourceForStreamToken:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "streamToken")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_audioTapIOMap, "setObject:forKeyedSubscript:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
}

- (tagVCAudioIOConfiguration)audioIOConfigWithAudioType:(SEL)a3 sinkDelegateContext:(unsigned int)a4
{
  __int128 v5;
  int injector;

  *(_QWORD *)&retstr->var1 = 0x200000000;
  *(_QWORD *)&retstr->var9 = 0x1E000005DC0;
  *(_OWORD *)&retstr->var19.delegate = 0u;
  *(_OWORD *)&retstr->var19.clientContext = 0u;
  *(_OWORD *)&retstr->var19.captionsCoordinator = 0u;
  v5 = *(_OWORD *)&a5->clientContext;
  *(_OWORD *)&retstr->var20.delegate = *(_OWORD *)&a5->delegate;
  retstr->var0 = *(_QWORD *)&self->var22;
  retstr->var3 = 0;
  retstr->var4 = a4;
  *(_WORD *)&retstr->var5 = 2;
  injector = (int)self->var20.injector;
  retstr->var7 = self;
  retstr->var8 = injector;
  retstr->var11 = 0;
  retstr->var12 = 0;
  retstr->var13 = 1;
  retstr->var19.injector = 0;
  retstr->var14 = 0;
  retstr->var15 = 0;
  *(_WORD *)&retstr->var17 = 0;
  retstr->var16 = 0;
  *(_OWORD *)&retstr->var20.clientContext = v5;
  *(_OWORD *)&retstr->var20.captionsCoordinator = *(_OWORD *)&a5->captionsCoordinator;
  retstr->var20.injector = a5->injector;
  retstr->var21 = 0;
  *(_WORD *)&retstr->var22 = 0;
  return self;
}

- (int64_t)tapToken
{
  return self->_tapToken;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (VCServerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 240);
}

- (void)setUpReportingAgent
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create reportingAgent", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __41__VCCellularAudioTap_setUpReportingAgent__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpMediaRecorder
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate media recorder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpCaptionsCoordinator
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate downlink captions coordinator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setUpDelegateQueue:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  const char *v3;
  int v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCCellularAudioTap setUpDelegateQueue:]";
  OUTLINED_FUNCTION_4();
  v4 = 248;
  v5 = 2112;
  v6 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, " [%s] %s:%d Failed to allocate the delegateQueue=%@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)initWithProcessId:delegate:delegateQueue:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio tap I/O map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithProcessId:delegate:delegateQueue:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the state queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __62__VCCellularAudioTap_addAudioTapForStreamToken_tapType_error___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid stream token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __62__VCCellularAudioTap_addAudioTapForStreamToken_tapType_error___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCCellularAudioTap addAudioTapForStreamToken:tapType:error:]_block_invoke";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Audio tap already registered for streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCCellularAudioTap addAudioTapForStreamToken:tapType:error:]_block_invoke" >> 16, 336);
  OUTLINED_FUNCTION_3();
}

void __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Invalid stream token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__VCCellularAudioTap_removeAudioTapForStreamToken_error___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];

  OUTLINED_FUNCTION_8_0();
  *(_QWORD *)&v3[6] = "-[VCCellularAudioTap removeAudioTapForStreamToken:error:]_block_invoke";
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Audio tap not found. streamToken=%u", v2, *(const char **)v3, (unint64_t)"-[VCCellularAudioTap removeAudioTapForStreamToken:error:]_block_invoke" >> 16, 373);
  OUTLINED_FUNCTION_3();
}

- (void)makeAudioIOForAudioTapIO:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "streamToken");
  v7 = 136315906;
  v8 = a1;
  v9 = 2080;
  v10 = "-[VCCellularAudioTap makeAudioIOForAudioTapIO:]";
  OUTLINED_FUNCTION_4();
  v11 = 490;
  v12 = 2048;
  v13 = v5;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, a3, v6, " [%s] %s:%d Failed to fetch realtime context for streamToken=%ld", (uint8_t *)&v7);
}

- (void)makeAudioIOForAudioTapIO:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCellularAudioTap makeAudioIOForAudioTapIO:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio IO for tapType=%d", v2, *(const char **)v3, (unint64_t)"-[VCCellularAudioTap makeAudioIOForAudioTapIO:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)registerAudioTapForStreamToken:tapType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCellularAudioTap registerAudioTapForStreamToken:tapType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Unsupported tapType=%d", v2, *(const char **)v3, (unint64_t)"-[VCCellularAudioTap registerAudioTapForStreamToken:tapType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)registerAudioTapForStreamToken:tapType:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCellularAudioTap registerAudioTapForStreamToken:tapType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate power spectrum source for tapType=%d", v2, *(const char **)v3, (unint64_t)"-[VCCellularAudioTap registerAudioTapForStreamToken:tapType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)registerAudioTapForStreamToken:tapType:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCellularAudioTap registerAudioTapForStreamToken:tapType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate the audio tap settings for tapType=%d", v2, *(const char **)v3, (unint64_t)"-[VCCellularAudioTap registerAudioTapForStreamToken:tapType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
