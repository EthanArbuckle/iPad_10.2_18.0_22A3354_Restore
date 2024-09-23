@implementation VCMediaStreamGroup

- (VCMediaStreamGroup)initWithConfig:(id)a3
{
  VCMediaStreamGroup *v4;
  VCNetworkFeedbackController *v5;
  const char *v6;
  NSObject *CustomRootQueue;
  dispatch_queue_t v8;
  tagVCJBTargetEstimatorSynchronizer *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  tagVCJBTargetEstimatorSynchronizer *jbTargetEstimatorSynchronizer;
  char *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  tagVCJBTargetEstimatorSynchronizer *v20;
  char *v21;
  double v22;
  NSObject *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  int v40;
  objc_super v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  tagVCJBTargetEstimatorSynchronizer *v54;
  __int16 v55;
  char *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v42.receiver = self;
  v42.super_class = (Class)VCMediaStreamGroup;
  v4 = -[VCObject init](&v42, sel_init);
  if (!v4)
    goto LABEL_69;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamGroup initWithConfig:].cold.1();
    }
    goto LABEL_69;
  }
  v4->_streamGroupID = objc_msgSend(a3, "streamGroupID");
  v4->_participantUUID = (NSString *)(id)objc_msgSend(a3, "participantUUID");
  -[VCObject setLogPrefix:](v4, "setLogPrefix:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("streamGroupID=%s participantUUID=%@ "), FourccToCStr(v4->_streamGroupID), v4->_participantUUID));
  v5 = (VCNetworkFeedbackController *)objc_msgSend(a3, "networkFeedbackController");
  v4->_networkFeedbackController = v5;
  if (v5)
    CFRetain(v5);
  if (!objc_msgSend(a3, "delegate"))
  {
    if ((VCMediaStreamGroup *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamGroup initWithConfig:].cold.2();
      }
      goto LABEL_69;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v24 = (const __CFString *)-[VCMediaStreamGroup performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v24 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_69;
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_69;
    *(_DWORD *)buf = 136316162;
    v44 = v30;
    v45 = 2080;
    v46 = "-[VCMediaStreamGroup initWithConfig:]";
    v47 = 1024;
    v48 = 86;
    v49 = 2112;
    v50 = v24;
    v51 = 2048;
    v52 = v4;
    v32 = " [%s] %s:%d %@(%p) Delegate is nil";
    goto LABEL_58;
  }
  if (!objc_msgSend(a3, "delegateQueue"))
  {
    if ((VCMediaStreamGroup *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamGroup initWithConfig:].cold.3();
      }
      goto LABEL_69;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v25 = (const __CFString *)-[VCMediaStreamGroup performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v25 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_69;
    v33 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_69;
    *(_DWORD *)buf = 136316162;
    v44 = v33;
    v45 = 2080;
    v46 = "-[VCMediaStreamGroup initWithConfig:]";
    v47 = 1024;
    v48 = 87;
    v49 = 2112;
    v50 = v25;
    v51 = 2048;
    v52 = v4;
    v32 = " [%s] %s:%d %@(%p) Delegate queue is nil";
LABEL_58:
    v34 = v31;
    v35 = 48;
LABEL_68:
    _os_log_error_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_ERROR, v32, buf, v35);
    goto LABEL_69;
  }
  v6 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.stateQueue.%s.%u"), "com.apple.AVConference.VCMediaStreamGroup", FourccToCStr(v4->_streamGroupID), objc_msgSend(a3, "streamToken")), "UTF8String");
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v8 = dispatch_queue_create_with_target_V2(v6, 0, CustomRootQueue);
  v4->_stateQueue = (OS_dispatch_queue *)v8;
  if (!v8)
  {
    if ((VCMediaStreamGroup *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamGroup initWithConfig:].cold.4(v28, a3);
      }
      goto LABEL_69;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v26 = (const __CFString *)-[VCMediaStreamGroup performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v26 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v38 = objc_msgSend(a3, "streamToken");
        *(_DWORD *)buf = 136316418;
        v44 = v36;
        v45 = 2080;
        v46 = "-[VCMediaStreamGroup initWithConfig:]";
        v47 = 1024;
        v48 = 91;
        v49 = 2112;
        v50 = v26;
        v51 = 2048;
        v52 = v4;
        v53 = 1024;
        LODWORD(v54) = v38;
        v32 = " [%s] %s:%d %@(%p) Failed to create the state queue for streamToken=%u";
LABEL_67:
        v34 = v37;
        v35 = 54;
        goto LABEL_68;
      }
    }
LABEL_69:

    return 0;
  }
  v9 = (tagVCJBTargetEstimatorSynchronizer *)objc_msgSend(a3, "jbTargetEstimatorSynchronizer");
  v4->_jbTargetEstimatorSynchronizer = v9;
  if (v9)
    CFRetain(v9);
  if ((VCMediaStreamGroup *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        jbTargetEstimatorSynchronizer = v4->_jbTargetEstimatorSynchronizer;
        v14 = FourccToCStr(objc_msgSend(a3, "syncGroupID"));
        *(_DWORD *)buf = 136316162;
        v44 = v11;
        v45 = 2080;
        v46 = "-[VCMediaStreamGroup initWithConfig:]";
        v47 = 1024;
        v48 = 95;
        v49 = 2048;
        v50 = (const __CFString *)jbTargetEstimatorSynchronizer;
        v51 = 2080;
        v52 = v14;
        v15 = " [%s] %s:%d Create Stream Group with TargetEstimatorSynchronizer=%p syncGroupID=%s";
        v16 = v12;
        v17 = 48;
LABEL_20:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCMediaStreamGroup performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = v4->_jbTargetEstimatorSynchronizer;
        v21 = FourccToCStr(objc_msgSend(a3, "syncGroupID"));
        *(_DWORD *)buf = 136316674;
        v44 = v18;
        v45 = 2080;
        v46 = "-[VCMediaStreamGroup initWithConfig:]";
        v47 = 1024;
        v48 = 95;
        v49 = 2112;
        v50 = v10;
        v51 = 2048;
        v52 = v4;
        v53 = 2048;
        v54 = v20;
        v55 = 2080;
        v56 = v21;
        v15 = " [%s] %s:%d %@(%p) Create Stream Group with TargetEstimatorSynchronizer=%p syncGroupID=%s";
        v16 = v19;
        v17 = 68;
        goto LABEL_20;
      }
    }
  }
  if (!-[VCMediaStreamGroup setupStreamsWithConfig:](v4, "setupStreamsWithConfig:", a3))
  {
    if ((VCMediaStreamGroup *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCMediaStreamGroup initWithConfig:].cold.5(v29, a3);
      }
      goto LABEL_69;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v27 = (const __CFString *)-[VCMediaStreamGroup performSelector:](v4, "performSelector:", sel_logPrefix);
    else
      v27 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v40 = objc_msgSend(a3, "streamToken");
        *(_DWORD *)buf = 136316418;
        v44 = v39;
        v45 = 2080;
        v46 = "-[VCMediaStreamGroup initWithConfig:]";
        v47 = 1024;
        v48 = 98;
        v49 = 2112;
        v50 = v27;
        v51 = 2048;
        v52 = v4;
        v53 = 1024;
        LODWORD(v54) = v40;
        v32 = " [%s] %s:%d %@(%p) Failed to setup the streams for streamToken=%u";
        goto LABEL_67;
      }
    }
    goto LABEL_69;
  }
  v4->_perfTimers = (TimingCollection *)objc_alloc_init(MEMORY[0x1E0CF2690]);
  v22 = micro();
  v4->_creationTime = v22;
  VCPerfTimingUtilsSetStartForKeyOnceWithTime(v4->_perfTimers, 20, v22);
  VCPerfTimingUtilsSetStartForKeyOnceWithTime(v4->_perfTimers, 16, v4->_creationTime);
  -[VCMediaStreamGroup registerMediaStreamNotificationDelegate](v4, "registerMediaStreamNotificationDelegate");
  v4->_syncGroupID = objc_msgSend(a3, "syncGroupID");
  v4->_state = 0;
  v4->_streamToken = objc_msgSend(a3, "streamToken");
  v23 = objc_msgSend(a3, "delegateQueue");
  v4->_delegateQueue = (OS_dispatch_queue *)v23;
  dispatch_retain(v23);
  v4->_mediaType = objc_msgSend(a3, "mediaType");
  v4->_mediaSubtype = objc_msgSend(a3, "mediaSubtype");
  v4->_idsParticipantID = objc_msgSend(a3, "idsParticipantID");
  v4->_sessionUUID = (NSString *)(id)objc_msgSend(a3, "sessionUUID");
  objc_storeWeak(&v4->_delegate, (id)objc_msgSend(a3, "delegate"));
  objc_storeWeak(&v4->_captureController, (id)objc_msgSend(a3, "captureController"));
  return v4;
}

- (void)dealloc
{
  NSObject *delegateQueue;
  NSObject *stateQueue;
  tagVCJBTargetEstimatorSynchronizer *jbTargetEstimatorSynchronizer;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[VCMediaStreamGroup unregisterMediaStreamNotificationDelegate](self, "unregisterMediaStreamNotificationDelegate");
  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  stateQueue = self->_stateQueue;
  if (stateQueue)
  {
    dispatch_release(stateQueue);
    self->_stateQueue = 0;
  }
  objc_storeWeak(&self->_captureController, 0);
  objc_storeWeak(&self->_delegate, 0);

  jbTargetEstimatorSynchronizer = self->_jbTargetEstimatorSynchronizer;
  if (jbTargetEstimatorSynchronizer)
  {
    CFRelease(jbTargetEstimatorSynchronizer);
    self->_jbTargetEstimatorSynchronizer = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VCMediaStreamGroup;
  -[VCObject dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p streamGroupID=%s state=%d participantUUID=%@"), self, FourccToCStr(self->_streamGroupID), self->_state, self->_participantUUID);
}

- (BOOL)setupStreamsWithConfig:(id)a3
{
  NSArray *mediaStreamInfoArray;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];

  self->_mediaStreamInfoArray = (NSArray *)(id)objc_msgSend(a3, "mediaStreamInfoArray");
  self->_mediaStreams = (NSArray *)(id)objc_msgSend(a3, "mediaStreams");
  self->_streamIDToMediaStreamMap = (NSDictionary *)(id)objc_msgSend(a3, "streamIDToMediaStreamMap");
  self->_groupEntries = (NSDictionary *)(id)objc_msgSend(a3, "groupEntries");
  self->_hasRepairedStreams = objc_msgSend(a3, "hasRepairedStreams");
  self->_rtpTimestampRate = objc_msgSend(a3, "rtpTimestampRate");
  mediaStreamInfoArray = self->_mediaStreamInfoArray;
  v6 = mediaStreamInfoArray && self->_mediaStreams && self->_streamIDToMediaStreamMap && self->_groupEntries != 0;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(mediaStreamInfoArray);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "stream"), "setDelegate:", self);
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v8);
  }
  return v6;
}

- (BOOL)configureStreams
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  NSArray *obj;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCMediaStreamGroup *v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = self->_mediaStreamInfoArray;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
  v19 = v3;
  if (v3)
  {
    v18 = *(_QWORD *)v42;
LABEL_3:
    v4 = 0;
    while (1)
    {
      if (*(_QWORD *)v42 != v18)
        objc_enumerationMutation(obj);
      v5 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v4);
      v6 = (void *)objc_msgSend(v5, "stream");
      objc_msgSend(v6, "setReportingAgent:", -[VCObject reportingAgent](self, "reportingAgent"));
      v21 = v6;
      objc_msgSend(v6, "setNetworkFeedbackController:", self->_networkFeedbackController);
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v20 = v5;
      v7 = (void *)objc_msgSend(v5, "streamConfigs");
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v37 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v12, "setJbTargetEstimatorSynchronizer:", self->_jbTargetEstimatorSynchronizer);
            objc_msgSend((id)objc_msgSend(v12, "multiwayConfig"), "setStreamGroupID:", self->_streamGroupID);
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
        }
        while (v9);
      }
      if ((objc_msgSend(v21, "setStreamConfig:withError:", objc_msgSend(v20, "streamConfigs"), &v22) & 1) == 0)
        break;
      if (++v4 == v19)
      {
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
        if (v19)
          goto LABEL_3;
        LOBYTE(v3) = 1;
        return v3;
      }
    }
    if ((VCMediaStreamGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        LODWORD(v3) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v3)
          return v3;
        -[VCMediaStreamGroup configureStreams].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        LODWORD(v3) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!(_DWORD)v3)
          return v3;
        *(_DWORD *)buf = 136316418;
        v24 = v14;
        v25 = 2080;
        v26 = "-[VCMediaStreamGroup configureStreams]";
        v27 = 1024;
        v28 = 196;
        v29 = 2112;
        v30 = v13;
        v31 = 2048;
        v32 = self;
        v33 = 2112;
        v34 = v22;
        _os_log_error_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Error configuring media stream [%@]", buf, 0x3Au);
      }
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)callDelegateWithBlock:(id)a3
{
  uint64_t v5;
  NSObject *delegateQueue;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  _QWORD v13[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCMediaStreamGroup *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = MEMORY[0x1DF086F1C](&self->_delegate, a2);
    if (v5)
    {
      delegateQueue = self->_delegateQueue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __44__VCMediaStreamGroup_callDelegateWithBlock___block_invoke;
      v13[3] = &unk_1E9E533D0;
      v13[4] = v5;
      v13[5] = a3;
      dispatch_async(delegateQueue, v13);
      return;
    }
    if ((VCMediaStreamGroup *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        return;
      v12 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        return;
      *(_DWORD *)buf = 136316162;
      v15 = v12;
      v16 = 2080;
      v17 = "-[VCMediaStreamGroup callDelegateWithBlock:]";
      v18 = 1024;
      v19 = 218;
      v20 = 2112;
      v21 = v8;
      v22 = 2048;
      v23 = self;
      v11 = " [%s] %s:%d %@(%p) delegate could not be loaded";
LABEL_25:
      _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x30u);
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamGroup callDelegateWithBlock:].cold.2();
    }
  }
  else if ((VCMediaStreamGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamGroup callDelegateWithBlock:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        v15 = v9;
        v16 = 2080;
        v17 = "-[VCMediaStreamGroup callDelegateWithBlock:]";
        v18 = 1024;
        v19 = 208;
        v20 = 2112;
        v21 = v7;
        v22 = 2048;
        v23 = self;
        v11 = " [%s] %s:%d %@(%p) block is nil";
        goto LABEL_25;
      }
    }
  }
}

void __44__VCMediaStreamGroup_callDelegateWithBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (BOOL)containsStreamWithIDSStreamID:(unsigned __int16)a3
{
  int v3;
  NSArray *mediaStreamInfoArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  mediaStreamInfoArray = self->_mediaStreamInfoArray;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(mediaStreamInfoArray);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = (void *)objc_msgSend(v9, "streamConfigs");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v18;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v18 != v13)
                objc_enumerationMutation(v10);
              if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "multiwayConfig"), "idsStreamID") == v3)
              {
                LOBYTE(v5) = 1;
                return v5;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
            if (v12)
              continue;
            break;
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
      LOBYTE(v5) = 0;
    }
    while (v6);
  }
  return v5;
}

- (void)setParticipantJoinedToFirstMKITimer
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Could not find mediaKeyIndex=%@. PerfTimer will not be set for participant joined to first MKI");
  OUTLINED_FUNCTION_3();
}

- (void)setFirstMKIToFirstMediaReceivedTimerForMKIReceivedTime
{
  -[TimingCollection setStartTime:forKey:](self->_perfTimers, "setStartTime:forKey:", 17, self->_firstMediaKeyIndexTime);
  -[TimingCollection setStopTime:forKey:](self->_perfTimers, "setStopTime:forKey:", 17, self->_firstMediaPacketTime);
}

- (void)setTotalMediaStallSaveIntervalWithTime:(double)a3
{
  double firstMediaKeyIndexTime;

  firstMediaKeyIndexTime = self->_firstMediaKeyIndexTime;
  if (self->_firstMediaFrameGapDetected || firstMediaKeyIndexTime <= self->_firstMediaPacketTime)
    a3 = self->_firstMediaKeyIndexTime;
  -[TimingCollection setStartTime:forKey:](self->_perfTimers, "setStartTime:forKey:", 18, firstMediaKeyIndexTime);
  -[TimingCollection setStopTime:forKey:](self->_perfTimers, "setStopTime:forKey:", 18, a3);
}

- (void)setupPerfTimersWithMediaKeyIndex:(id)a3 perfTimerIndexToStart:(int)a4
{
  double v7;
  NSObject *stateQueue;
  _QWORD block[7];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = micro();
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__VCMediaStreamGroup_setupPerfTimersWithMediaKeyIndex_perfTimerIndexToStart___block_invoke;
  block[3] = &unk_1E9E55A90;
  *(double *)&block[6] = v7;
  block[4] = self;
  block[5] = a3;
  v10 = a4;
  dispatch_async(stateQueue, block);
}

uint64_t __77__VCMediaStreamGroup_setupPerfTimersWithMediaKeyIndex_perfTimerIndexToStart___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 280))
  {
    *(_QWORD *)(v2 + 256) = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) = objc_msgSend(*(id *)(a1 + 40), "copy");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 240), "setStartTime:forKey:", *(unsigned int *)(a1 + 56), *(double *)(a1 + 48));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "setStopTime:forKey:", 21, *(double *)(a1 + 48));
  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 424))
  {
    result = objc_msgSend(*(id *)(v4 + 240), "setStartTime:forKey:", 22, *(double *)(a1 + 48));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 424) = 1;
  }
  return result;
}

- (void)finalizePerfTimersForFirstMediaFrameWithTime:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[VCMediaStreamGroup setParticipantJoinedToFirstMKITimer](self, "setParticipantJoinedToFirstMKITimer");
  -[VCMediaStreamGroup setFirstMKIToFirstMediaReceivedTimerForMKIReceivedTime](self, "setFirstMKIToFirstMediaReceivedTimerForMKIReceivedTime");
  -[VCMediaStreamGroup setTotalMediaStallSaveIntervalWithTime:](self, "setTotalMediaStallSaveIntervalWithTime:", a3);
  -[TimingCollection setStopTime:forKey:](self->_perfTimers, "setStopTime:forKey:", 22, a3);
}

- (void)setFirstMediaFrameReceivedTime:(double)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__VCMediaStreamGroup_setFirstMediaFrameReceivedTime___block_invoke;
  block[3] = &unk_1E9E52960;
  block[4] = self;
  *(double *)&block[5] = a3;
  dispatch_async(stateQueue, block);
}

double __53__VCMediaStreamGroup_setFirstMediaFrameReceivedTime___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 416) = result;
  return result;
}

- (double)firstMediaFrameReceivedTime
{
  NSObject *stateQueue;
  double v3;
  _QWORD block[6];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = -1;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCMediaStreamGroup_firstMediaFrameReceivedTime__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __49__VCMediaStreamGroup_firstMediaFrameReceivedTime__block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 416);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setEnabledAtStart:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__VCMediaStreamGroup_setEnabledAtStart___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __40__VCMediaStreamGroup_setEnabledAtStart___block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 408) = *(_BYTE *)(result + 40);
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 408))
    return objc_msgSend(*(id *)(v1 + 240), "removeTimingForKey:", 20);
  return result;
}

- (BOOL)isEnabledAtStart
{
  NSObject *stateQueue;
  char v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__VCMediaStreamGroup_isEnabledAtStart__block_invoke;
  block[3] = &unk_1E9E52938;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __38__VCMediaStreamGroup_isEnabledAtStart__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 408);
  return result;
}

- (void)setCaptureController:(id)a3
{
  objc_storeWeak(&self->_captureController, a3);
}

- (VCMediaCaptureController)captureController
{
  VCMediaCaptureController *result;

  result = (VCMediaCaptureController *)objc_loadWeak(&self->_captureController);
  if (!result)
    return (VCMediaCaptureController *)self;
  return result;
}

- (tagVCSecurityKeyHolder)securityKeyHolder
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  return (tagVCSecurityKeyHolder *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->_mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject"), "securityKeyHolder");
}

- (id)startMediaStreams
{
  unsigned int state;
  VCMediaStreamGroup *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSDictionary *groupEntries;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSDictionary *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  const __CFString *v23;
  uint64_t v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  NSObject *v30;
  _BYTE v31[128];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  VCMediaStreamGroup *v45;
  __int16 v46;
  NSDictionary *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  v4 = (VCMediaStreamGroup *)objc_opt_class();
  if (state)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136315650;
      v37 = v24;
      v38 = 2080;
      v39 = "-[VCMediaStreamGroup startMediaStreams]";
      v40 = 1024;
      v41 = 352;
      v26 = " [%s] %s:%d Starting stream group that isn't stopped";
      v27 = v25;
      v28 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v23 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136316162;
      v37 = v29;
      v38 = 2080;
      v39 = "-[VCMediaStreamGroup startMediaStreams]";
      v40 = 1024;
      v41 = 352;
      v42 = 2112;
      v43 = (void *)v23;
      v44 = 2048;
      v45 = self;
      v26 = " [%s] %s:%d %@(%p) Starting stream group that isn't stopped";
      v27 = v30;
      v28 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    return 0;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_13;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    groupEntries = self->_groupEntries;
    *(_DWORD *)buf = 136315906;
    v37 = v6;
    v38 = 2080;
    v39 = "-[VCMediaStreamGroup startMediaStreams]";
    v40 = 1024;
    v41 = 353;
    v42 = 2112;
    v43 = groupEntries;
    v9 = " [%s] %s:%d Starting group. groupEntries=%@";
    v10 = v7;
    v11 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_13;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v14 = self->_groupEntries;
    *(_DWORD *)buf = 136316418;
    v37 = v12;
    v38 = 2080;
    v39 = "-[VCMediaStreamGroup startMediaStreams]";
    v40 = 1024;
    v41 = 353;
    v42 = 2112;
    v43 = (void *)v5;
    v44 = 2048;
    v45 = self;
    v46 = 2112;
    v47 = v14;
    v9 = " [%s] %s:%d %@(%p) Starting group. groupEntries=%@";
    v10 = v13;
    v11 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_13:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = -[NSDictionary allValues](self->_groupEntries, "allValues");
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        v20 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "start");
        if (v20)
        {
          v21 = (void *)v20;
          self->_state = 1;
          -[VCMediaStreamGroup stopMediaStreams](self, "stopMediaStreams");
          return v21;
        }
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v32, v31, 16);
      if (v17)
        continue;
      break;
    }
  }
  v21 = 0;
  self->_state = 1;
  return v21;
}

- (id)stopMediaStreams
{
  unsigned int state;
  VCMediaStreamGroup *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSDictionary *groupEntries;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSDictionary *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  VCMediaStreamGroup *v46;
  __int16 v47;
  NSDictionary *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  v4 = (VCMediaStreamGroup *)objc_opt_class();
  if (!state)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136315650;
      v38 = v25;
      v39 = 2080;
      v40 = "-[VCMediaStreamGroup stopMediaStreams]";
      v41 = 1024;
      v42 = 370;
      v27 = " [%s] %s:%d Stopping stream group that is already stopped";
      v28 = v26;
      v29 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v24 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v24 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        return 0;
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return 0;
      *(_DWORD *)buf = 136316162;
      v38 = v30;
      v39 = 2080;
      v40 = "-[VCMediaStreamGroup stopMediaStreams]";
      v41 = 1024;
      v42 = 370;
      v43 = 2112;
      v44 = (void *)v24;
      v45 = 2048;
      v46 = self;
      v27 = " [%s] %s:%d %@(%p) Stopping stream group that is already stopped";
      v28 = v31;
      v29 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
    return 0;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_13;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    groupEntries = self->_groupEntries;
    *(_DWORD *)buf = 136315906;
    v38 = v6;
    v39 = 2080;
    v40 = "-[VCMediaStreamGroup stopMediaStreams]";
    v41 = 1024;
    v42 = 371;
    v43 = 2112;
    v44 = groupEntries;
    v9 = " [%s] %s:%d Stopping group. groupEntries=%@";
    v10 = v7;
    v11 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_13;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v14 = self->_groupEntries;
    *(_DWORD *)buf = 136316418;
    v38 = v12;
    v39 = 2080;
    v40 = "-[VCMediaStreamGroup stopMediaStreams]";
    v41 = 1024;
    v42 = 371;
    v43 = 2112;
    v44 = (void *)v5;
    v45 = 2048;
    v46 = self;
    v47 = 2112;
    v48 = v14;
    v9 = " [%s] %s:%d %@(%p) Stopping group. groupEntries=%@";
    v10 = v13;
    v11 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
LABEL_13:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = -[NSDictionary allValues](self->_groupEntries, "allValues");
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (objc_msgSend(v21, "state"))
        {
          v22 = objc_msgSend(v21, "stop");
          if (v22)
            v18 = (void *)v22;
        }
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }
  self->_state = 0;
  return v18;
}

- (BOOL)shouldSetPause:(BOOL)a3 onStream:(id)a4
{
  _BOOL4 v4;
  int v5;
  int v6;

  v4 = a3;
  v5 = objc_msgSend(a4, "state");
  if (v4)
    v6 = 4;
  else
    v6 = 2;
  return v5 != v6;
}

- (id)setPauseOnMediaStreams:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = -[NSDictionary allValues](self->_groupEntries, "allValues");
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (-[VCMediaStreamGroup shouldSetPause:onStream:](self, "shouldSetPause:onStream:", v3, v10))
        {
          v11 = objc_msgSend(v10, "setPause:", v3);
          if (v11)
          {
            v12 = (void *)v11;
            -[VCMediaStreamGroup stopCapture](self, "stopCapture");
            -[VCMediaStreamGroup stopMediaStreams](self, "stopMediaStreams");
            return v12;
          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      if (v7)
        continue;
      break;
    }
  }
  return 0;
}

- (id)pauseMediaStreams
{
  unsigned int state;
  VCMediaStreamGroup *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  NSDictionary *groupEntries;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  NSDictionary *v15;
  id result;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  VCMediaStreamGroup *v31;
  __int16 v32;
  NSDictionary *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  v4 = (VCMediaStreamGroup *)objc_opt_class();
  if (state == 1)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_19;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      groupEntries = self->_groupEntries;
      *(_DWORD *)buf = 136315906;
      v23 = v7;
      v24 = 2080;
      v25 = "-[VCMediaStreamGroup pauseMediaStreams]";
      v26 = 1024;
      v27 = 418;
      v28 = 2112;
      v29 = groupEntries;
      v10 = " [%s] %s:%d Pausing group. groupEntries=%@";
      v11 = v8;
      v12 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_19;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v15 = self->_groupEntries;
      *(_DWORD *)buf = 136316418;
      v23 = v13;
      v24 = 2080;
      v25 = "-[VCMediaStreamGroup pauseMediaStreams]";
      v26 = 1024;
      v27 = 418;
      v28 = 2112;
      v29 = (void *)v5;
      v30 = 2048;
      v31 = self;
      v32 = 2112;
      v33 = v15;
      v10 = " [%s] %s:%d %@(%p) Pausing group. groupEntries=%@";
      v11 = v14;
      v12 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_19:
    result = -[VCMediaStreamGroup setPauseOnMediaStreams:](self, "setPauseOnMediaStreams:", 1);
    if (!result)
      self->_state = 2;
    return result;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamGroup pauseMediaStreams].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v21 = self->_groupEntries;
        *(_DWORD *)buf = 136316418;
        v23 = v17;
        v24 = 2080;
        v25 = "-[VCMediaStreamGroup pauseMediaStreams]";
        v26 = 1024;
        v27 = 412;
        v28 = 2112;
        v29 = (void *)v6;
        v30 = 2048;
        v31 = self;
        v32 = 2112;
        v33 = v21;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Pausing stream group that isn't running=%@", buf, 0x3Au);
      }
    }
  }
  if (self->_state == 2)
    return 0;
  v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state=%d"), self->_state);
  v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@. Failed to pause streamToken=%u"), -[VCObject logPrefix](self, "logPrefix"), self->_streamToken);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailedCode:filePath:description:reason:", 32026, self->_state, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamGroup.m", 416), v20, v19);
}

- (id)resumeMediaStreams
{
  unsigned int state;
  VCMediaStreamGroup *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  NSDictionary *groupEntries;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  NSDictionary *v15;
  id result;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSDictionary *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  VCMediaStreamGroup *v31;
  __int16 v32;
  NSDictionary *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  v4 = (VCMediaStreamGroup *)objc_opt_class();
  if (state == 2)
  {
    if (v4 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_19;
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      groupEntries = self->_groupEntries;
      *(_DWORD *)buf = 136315906;
      v23 = v7;
      v24 = 2080;
      v25 = "-[VCMediaStreamGroup resumeMediaStreams]";
      v26 = 1024;
      v27 = 438;
      v28 = 2112;
      v29 = groupEntries;
      v10 = " [%s] %s:%d Resuming group. groupEntries=%@";
      v11 = v8;
      v12 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 6)
        goto LABEL_19;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      v15 = self->_groupEntries;
      *(_DWORD *)buf = 136316418;
      v23 = v13;
      v24 = 2080;
      v25 = "-[VCMediaStreamGroup resumeMediaStreams]";
      v26 = 1024;
      v27 = 438;
      v28 = 2112;
      v29 = (void *)v5;
      v30 = 2048;
      v31 = self;
      v32 = 2112;
      v33 = v15;
      v10 = " [%s] %s:%d %@(%p) Resuming group. groupEntries=%@";
      v11 = v14;
      v12 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_19:
    result = -[VCMediaStreamGroup setPauseOnMediaStreams:](self, "setPauseOnMediaStreams:", 0);
    if (!result)
      self->_state = 1;
    return result;
  }
  if (v4 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCMediaStreamGroup resumeMediaStreams].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCMediaStreamGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v21 = self->_groupEntries;
        *(_DWORD *)buf = 136316418;
        v23 = v17;
        v24 = 2080;
        v25 = "-[VCMediaStreamGroup resumeMediaStreams]";
        v26 = 1024;
        v27 = 432;
        v28 = 2112;
        v29 = (void *)v6;
        v30 = 2048;
        v31 = self;
        v32 = 2112;
        v33 = v21;
        _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Resuming stream group that isn't paused=%@", buf, 0x3Au);
      }
    }
  }
  if (self->_state == 1)
    return 0;
  v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state=%d"), self->_state);
  v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@. Failed to resume streamToken=%u"), -[VCObject logPrefix](self, "logPrefix"), self->_streamToken);
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailedCode:filePath:description:reason:", 32026, self->_state, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamGroup.m", 436), v20, v19);
}

- (void)perfTimerStarted
{
  double v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v3 = micro();
  self->_ignoreMKINotifications = 0;
  if (-[TimingCollection hasKey:](self->_perfTimers, "hasKey:", 20))
    -[TimingCollection setStopTime:forKey:](self->_perfTimers, "setStopTime:forKey:", 20, v3);
  -[TimingCollection setStartTime:forKey:](self->_perfTimers, "setStartTime:forKey:", 21, v3);
}

- (id)start
{
  uint64_t v3;
  NSObject *v4;
  NSString *v5;
  int64_t streamToken;
  NSObject *stateQueue;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  VCMediaStreamGroup *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__33;
  v15 = __Block_byref_object_dispose__33;
  v16 = 0;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ StreamGroup-Start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[VCObject logPrefix](self, "logPrefix");
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316418;
      v18 = v3;
      v19 = 2080;
      v20 = "-[VCMediaStreamGroup start]";
      v21 = 1024;
      v22 = 463;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v5;
      v27 = 1024;
      v28 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ StreamGroup-Start (%p) %@ streamToken=%u", buf, 0x36u);
    }
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__VCMediaStreamGroup_start__block_invoke;
  v10[3] = &unk_1E9E522B0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateQueue, v10);
  v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __27__VCMediaStreamGroup_start__block_invoke(uint64_t a1)
{
  unsigned int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _BYTE *v7;

  v2 = *(unsigned int **)(a1 + 32);
  v3 = v2[79];
  if ((_DWORD)v3)
  {
    v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state=%d"), v3);
    v5 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@. Failed already running streamToken=%u"), objc_msgSend(*(id *)(a1 + 32), "logPrefix"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352));
    result = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailedCode:filePath:description:reason:", 32026, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 316), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamGroup.m", 469), v5, v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    return result;
  }
  result = objc_msgSend(v2, "willStart");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "perfTimerStarted");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "startMediaStreams");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      return objc_msgSend(*(id *)(a1 + 32), "didStop");
    v7 = *(_BYTE **)(a1 + 32);
    if (!v7[288])
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(v7, "startCapture");
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
LABEL_10:
        objc_msgSend(*(id *)(a1 + 32), "stopMediaStreams");
        return objc_msgSend(*(id *)(a1 + 32), "didStop");
      }
      v7 = *(_BYTE **)(a1 + 32);
    }
    result = objc_msgSend(v7, "didStart");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      goto LABEL_10;
  }
  return result;
}

- (id)stop
{
  uint64_t v3;
  NSObject *v4;
  NSString *v5;
  int64_t streamToken;
  NSObject *stateQueue;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  VCMediaStreamGroup *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__33;
  v15 = __Block_byref_object_dispose__33;
  v16 = 0;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ StreamGroup-Stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[VCObject logPrefix](self, "logPrefix");
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316418;
      v18 = v3;
      v19 = 2080;
      v20 = "-[VCMediaStreamGroup stop]";
      v21 = 1024;
      v22 = 504;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v5;
      v27 = 1024;
      v28 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ StreamGroup-Stop (%p) %@ streamToken=%u", buf, 0x36u);
    }
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __26__VCMediaStreamGroup_stop__block_invoke;
  v10[3] = &unk_1E9E522B0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateQueue, v10);
  v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __26__VCMediaStreamGroup_stop__block_invoke(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_DWORD **)(a1 + 32);
  if (v2[79])
  {
    objc_msgSend(v2, "willStop");
    v3 = objc_msgSend(*(id *)(a1 + 32), "stopCapture");
    v4 = objc_msgSend(*(id *)(a1 + 32), "stopMediaStreams");
    if (v3)
      v5 = v3;
    else
      v5 = v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v5;
    return objc_msgSend(*(id *)(a1 + 32), "didStop");
  }
  else
  {
    v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid state=%d"), 0);
    v8 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@. Failed already stopped streamToken=%u"), objc_msgSend(*(id *)(a1 + 32), "logPrefix"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 352));
    result = objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailedCode:filePath:description:reason:", 32026, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 316), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCMediaStreamGroup.m", 511), v8, v7);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

- (id)pause
{
  uint64_t v3;
  NSObject *v4;
  NSString *v5;
  int64_t streamToken;
  NSObject *stateQueue;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  VCMediaStreamGroup *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__33;
  v15 = __Block_byref_object_dispose__33;
  v16 = 0;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ StreamGroup-Pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[VCObject logPrefix](self, "logPrefix");
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316418;
      v18 = v3;
      v19 = 2080;
      v20 = "-[VCMediaStreamGroup pause]";
      v21 = 1024;
      v22 = 525;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v5;
      v27 = 1024;
      v28 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ StreamGroup-Pause (%p) %@ streamToken=%u", buf, 0x36u);
    }
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __27__VCMediaStreamGroup_pause__block_invoke;
  v10[3] = &unk_1E9E52938;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateQueue, v10);
  v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __27__VCMediaStreamGroup_pause__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "pauseMediaStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    return objc_msgSend(*(id *)(a1 + 32), "didPause:", 1);
  return result;
}

- (id)resume
{
  uint64_t v3;
  NSObject *v4;
  NSString *v5;
  int64_t streamToken;
  NSObject *stateQueue;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  VCMediaStreamGroup *v24;
  __int16 v25;
  NSString *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__33;
  v15 = __Block_byref_object_dispose__33;
  v16 = 0;
  MEMORY[0x1DF087EB8](&dword_1D8A54000, "@:@ StreamGroup-Resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[VCObject logPrefix](self, "logPrefix");
      streamToken = self->_streamToken;
      *(_DWORD *)buf = 136316418;
      v18 = v3;
      v19 = 2080;
      v20 = "-[VCMediaStreamGroup resume]";
      v21 = 1024;
      v22 = 538;
      v23 = 2048;
      v24 = self;
      v25 = 2112;
      v26 = v5;
      v27 = 1024;
      v28 = streamToken;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ StreamGroup-Resume (%p) %@ streamToken=%u", buf, 0x36u);
    }
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__VCMediaStreamGroup_resume__block_invoke;
  v10[3] = &unk_1E9E52938;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(stateQueue, v10);
  v8 = (void *)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __28__VCMediaStreamGroup_resume__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "resumeMediaStreams");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    return objc_msgSend(*(id *)(a1 + 32), "didPause:", 0);
  return result;
}

- (void)handleActiveConnectionChange:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  v4 = -[NSDictionary allValues](self->_groupEntries, "allValues");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "handleActiveConnectionChange:", a3);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (BOOL)containsStreamWithSSRC:(unsigned int)a3
{
  NSArray *mediaStreamInfoArray;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  mediaStreamInfoArray = self->_mediaStreamInfoArray;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(mediaStreamInfoArray);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v10 = (void *)objc_msgSend(v9, "streamConfigs");
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              if (objc_msgSend((id)objc_msgSend(v15, "multiwayConfig"), "ssrc") == a3
                && !objc_msgSend((id)objc_msgSend(v15, "multiwayConfig"), "isOneToOne"))
              {
                LOBYTE(v5) = 1;
                return v5;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
            if (v12)
              continue;
            break;
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      LOBYTE(v5) = 0;
    }
    while (v6);
  }
  return v5;
}

- (BOOL)addSyncDestination:(id)a3
{
  return 1;
}

- (BOOL)removeSyncDestination:(id)a3
{
  return 1;
}

- (void)reportParticipantsPerfTimings
{
  uint64_t v3;
  const __CFString *participantUUID;
  TimingCollection *perfTimers;
  opaqueRTCReporting *v6;
  __n128 v7;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_haveReportedPerfTimers)
  {
    -[TimingCollection removeTimingForKey:](self->_perfTimers, "removeTimingForKey:", 5);
    -[TimingCollection removeTimingForKey:](self->_perfTimers, "removeTimingForKey:", 6);
    -[TimingCollection removeTimingForKey:](self->_perfTimers, "removeTimingForKey:", 17);
    -[TimingCollection removeTimingForKey:](self->_perfTimers, "removeTimingForKey:", 18);
    -[TimingCollection removeTimingForKey:](self->_perfTimers, "removeTimingForKey:", 19);
  }
  else
  {
    self->_haveReportedPerfTimers = 1;
  }
  -[VCMediaStreamGroup streamGroupID](self, "streamGroupID");
  v8[0] = CFSTR("VCMSStreamGroup");
  v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", reportingStreamGroupFromStreamGroupID());
  v8[1] = CFSTR("VCSPIDSID");
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_idsParticipantID);
  v8[2] = CFSTR("VCSPUUID");
  participantUUID = (const __CFString *)self->_participantUUID;
  if (!participantUUID)
    participantUUID = CFSTR("Unknown");
  v9[1] = v3;
  v9[2] = participantUUID;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  perfTimers = self->_perfTimers;
  v6 = -[VCObject reportingAgent](self, "reportingAgent");
  VCPerfTimingUtilsReport(perfTimers, (uint64_t)v6, v7);
}

- (id)startCapture
{
  return 0;
}

- (id)stopCapture
{
  return 0;
}

- (BOOL)handleEncryptionInfoChange:(id)a3
{
  NSArray *mediaStreams;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  mediaStreams = self->_mediaStreams;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mediaStreams);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "handleEncryptionInfoChange:", a3);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }
  self->_encryptionInfoReceived = 1;
  return 1;
}

- (void)resetDecryptionTimeout
{
  NSArray *mediaStreams;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  mediaStreams = self->_mediaStreams;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(mediaStreams);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "resetDecryptionTimeout");
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v4);
  }
}

- (void)registerMediaStreamNotificationDelegate
{
  NSArray *mediaStreams;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  mediaStreams = self->_mediaStreams;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(mediaStreams);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setNotificationDelegate:", self);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
    }
    while (v5);
  }
}

- (void)unregisterMediaStreamNotificationDelegate
{
  NSArray *mediaStreams;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _BYTE v7[128];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  mediaStreams = self->_mediaStreams;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(mediaStreams);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "setNotificationDelegate:", 0);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v4);
  }
}

- (void)mediaStream:(id)a3 didReceiveNewMediaKeyIndex:(id)a4
{
  NSObject *stateQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__VCMediaStreamGroup_mediaStream_didReceiveNewMediaKeyIndex___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a3;
  dispatch_async(stateQueue, v5);
}

void __61__VCMediaStreamGroup_mediaStream_didReceiveNewMediaKeyIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  if ((VCSecurityKeyHolder_CopyKeyMaterialForKeyIndex(objc_msgSend(*(id *)(a1 + 32), "securityKeyHolder"), *(const char **)(a1 + 40), (uint64_t *)v3) & 0x80000000) == 0)
  {
    v2 = objc_msgSend(v3[0], "firstObject");
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 48), "handleEncryptionInfoChange:", v2);
      objc_msgSend(*(id *)(a1 + 48), "resetDecryptionTimeout");
    }
  }

}

- (void)mediaStream:(id)a3 didReceiveRTPGapForMediaKeyIndex:(id)a4
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__VCMediaStreamGroup_mediaStream_didReceiveRTPGapForMediaKeyIndex___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

void __67__VCMediaStreamGroup_mediaStream_didReceiveRTPGapForMediaKeyIndex___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 272) = 1;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[VCMediaStreamGroup mediaStream:didReceiveRTPGapForMediaKeyIndex:]_block_invoke";
      v9 = 1024;
      v10 = 666;
      v11 = 2048;
      v12 = v4;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d RTP sequence number gap detected for stream=%p", (uint8_t *)&v5, 0x26u);
    }
  }
}

- (void)mediaStream:(id)a3 didReceiveFlushRequestWithPayloads:(id)a4
{
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __69__VCMediaStreamGroup_mediaStream_didReceiveFlushRequestWithPayloads___block_invoke;
    v6[3] = &unk_1E9E57DB8;
    v6[4] = self;
    v6[5] = a4;
    -[VCMediaStreamGroup callDelegateWithBlock:](self, "callDelegateWithBlock:", v6);
  }
}

uint64_t __69__VCMediaStreamGroup_mediaStream_didReceiveFlushRequestWithPayloads___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "streamGroup:didReceiveFlushRequestWithPayloads:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (unsigned)streamGroupID
{
  return self->_streamGroupID;
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(unsigned int)a3
{
  self->_mediaType = a3;
}

- (unsigned)mediaSubtype
{
  return self->_mediaSubtype;
}

- (void)setMediaSubtype:(unsigned int)a3
{
  self->_mediaSubtype = a3;
}

- (unsigned)syncGroupID
{
  return self->_syncGroupID;
}

- (void)setSyncGroupID:(unsigned int)a3
{
  self->_syncGroupID = a3;
}

- (unsigned)state
{
  return self->_state;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (NSDictionary)streamIDToMediaStreamMap
{
  return self->_streamIDToMediaStreamMap;
}

- (NSArray)mediaStreamInfoArray
{
  return self->_mediaStreamInfoArray;
}

- (BOOL)encryptionInfoReceived
{
  return self->_encryptionInfoReceived;
}

- (void)setEncryptionInfoReceived:(BOOL)a3
{
  self->_encryptionInfoReceived = a3;
}

- (BOOL)hasRepairedStreams
{
  return self->_hasRepairedStreams;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (VCMediaRecorder)mediaRecorder
{
  return self->_mediaRecorder;
}

- (void)setMediaRecorder:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (double)externalRenderLatency
{
  return self->_externalRenderLatency;
}

- (void)setExternalRenderLatency:(double)a3
{
  self->_externalRenderLatency = a3;
}

- (TimingCollection)perfTimers
{
  return self->_perfTimers;
}

- (id)willStart
{
  return 0;
}

- (void)didStart
{
  objc_msgSend(self->_delegate, "streamGroup:didChangeState:", self, self->_state);
}

- (void)didStop
{
  objc_msgSend(self->_delegate, "streamGroup:didChangeState:", self, self->_state);
}

- (void)didPause:(BOOL)a3
{
  objc_msgSend(self->_delegate, "streamGroup:didChangeState:", self, self->_state);
}

- (void)initWithConfig:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Configuration is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Delegate is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Delegate queue is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_16(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Failed to create the state queue for streamToken=%u", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)initWithConfig:(uint64_t)a1 .cold.5(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_10_16(a2, *MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_0_4(&dword_1D8A54000, v2, v3, " [%s] %s:%d Failed to setup the streams for streamToken=%u", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

- (void)configureStreams
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Error configuring media stream [%@]");
  OUTLINED_FUNCTION_3();
}

- (void)callDelegateWithBlock:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d block is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)callDelegateWithBlock:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d delegate could not be loaded", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pauseMediaStreams
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Pausing stream group that isn't running=%@");
  OUTLINED_FUNCTION_3();
}

- (void)resumeMediaStreams
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Resuming stream group that isn't paused=%@");
  OUTLINED_FUNCTION_3();
}

@end
