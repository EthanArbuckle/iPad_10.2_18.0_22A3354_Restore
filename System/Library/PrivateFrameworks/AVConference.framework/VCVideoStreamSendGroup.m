@implementation VCVideoStreamSendGroup

- (VCVideoStreamSendGroup)initWithConfig:(id)a3
{
  VCVideoStreamSendGroup *v4;
  VCVideoStreamSendGroup *v5;
  NSMutableSet *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  _BOOL4 v18;
  NSArray *obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v24.receiver = self;
  v24.super_class = (Class)VCVideoStreamSendGroup;
  v4 = -[VCMediaStreamSendGroup initWithConfig:](&v24, sel_initWithConfig_);
  v5 = v4;
  if (!v4)
  {
LABEL_49:

    return 0;
  }
  -[VCMediaStreamSendGroup setIsSuspended:](v4, "setIsSuspended:", 1);
  v5->_clientCaptureController = objc_storeWeak(&v5->_clientCaptureController, (id)objc_msgSend(a3, "captureController"));
  -[VCMediaStreamGroup setCaptureController:](v5, "setCaptureController:", v5);
  v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5->_videoPayloadTypes = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup initWithConfig:].cold.1();
    }
    goto LABEL_49;
  }
  if (!-[VCVideoStreamSendGroup setupRedundancySettings](v5, "setupRedundancySettings"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup initWithConfig:].cold.5();
    }
    goto LABEL_49;
  }
  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5->_pendingActiveUplinkStreams = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup initWithConfig:].cold.2();
    }
    goto LABEL_49;
  }
  -[VCVideoStreamSendGroup setupVideoPriority](v5, "setupVideoPriority");
  *(_DWORD *)(&v5->super._isSuspended + 3) = objc_msgSend(a3, "captureSource");
  v5->_maxSupportedCaptureFrameRate = -[VCVideoStreamSendGroup maxCaptureFrameRateForMode:](v5, "maxCaptureFrameRateForMode:", v5->super._streamGroupMode);
  v8 = -[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:](v5, "uplinkVideoStreamControllerForMode:", v5->super._streamGroupMode);
  v5->_uplinkVideoStreamController = (VCSessionUplinkVideoStreamController *)v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup initWithConfig:].cold.3();
    }
    goto LABEL_49;
  }
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5->_temporalStreamsIDs = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup initWithConfig:].cold.4();
    }
    goto LABEL_49;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5->super.super._mediaStreamInfoArray;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(obj);
        v23 = v10;
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v10);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v12 = (void *)objc_msgSend(v11, "streamConfigs");
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v27 != v15)
                objc_enumerationMutation(v12);
              v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "multiwayConfig");
              if (objc_msgSend(v17, "isTemporalStream"))
                -[NSMutableArray addObject:](v5->_temporalStreamsIDs, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v17, "idsStreamID")));
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
          }
          while (v14);
        }
        v10 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    }
    while (v22);
  }
  -[VCVideoStreamSendGroup setupPayloadTypes](v5, "setupPayloadTypes");
  v5->_maxSupportedMultiwayVideoResolution = -[VCVideoStreamSendGroup maxCaptureResolution](v5, "maxCaptureResolution");
  v5->_captureFrameRate = v5->_maxSupportedCaptureFrameRate;
  v5->_fecRatio = -1.0;
  if (+[VCHardwareSettings deviceClass](VCHardwareSettings, "deviceClass") != 8)
  {
    if (!v5->_allowSuspendProvisionedStreams)
      goto LABEL_31;
    goto LABEL_30;
  }
  v18 = -[VCMediaStreamGroup streamGroupID](v5, "streamGroupID") == 1667329381
     || -[VCMediaStreamGroup streamGroupID](v5, "streamGroupID") == 1667329399;
  v5->_allowSuspendProvisionedStreams = v18;
  if (v18)
  {
LABEL_30:
    v5->_hasPeerSubscribedStreams = 0;
    v5->super.super._areStreamsSuspended = 1;
  }
LABEL_31:
  if (-[VCMediaStreamGroup streamGroupID](v5, "streamGroupID") == 1935897189)
    -[VCVideoStreamSendGroup registerConfigForScreenShare](v5, "registerConfigForScreenShare");
  v5->_initTime = micro() != 0.0;
  v5->_totalNumFramesProcessed = 0;
  return v5;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCVideoStreamSendGroup cleanupRedundancySettings](self, "cleanupRedundancySettings");

  objc_storeWeak(&self->_clientCaptureController, 0);
  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamSendGroup;
  -[VCMediaStreamSendGroup dealloc](&v3, sel_dealloc);
}

- (BOOL)setupStreamGroupWithConfig:(id)a3
{
  BOOL v5;
  int v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VCVideoStreamSendGroup;
  v5 = -[VCMediaStreamSendGroup setupStreamGroupWithConfig:](&v8, sel_setupStreamGroupWithConfig_);
  self->_uplinkVideoStreamController = (VCSessionUplinkVideoStreamController *)-[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:](self, "uplinkVideoStreamControllerForMode:", objc_msgSend(a3, "streamGroupMode"));
  v6 = -[VCVideoStreamSendGroup maxCaptureFrameRateForMode:](self, "maxCaptureFrameRateForMode:", objc_msgSend(a3, "streamGroupMode"));
  self->_maxSupportedCaptureFrameRate = v6;
  self->_captureFrameRate = v6;
  return v5;
}

- (BOOL)setupRedundancySettings
{
  tagVCMemoryPool *v3;
  _BOOL4 v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  VCVideoStreamSendGroup *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (tagVCMemoryPool *)VCMemoryPool_Create(8uLL);
  self->_videoRedundancyPool = v3;
  if (v3)
  {
    CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 10, &self->_videoRedundancyChangeEventQueue);
    if (self->_videoRedundancyChangeEventQueue)
    {
      LOBYTE(v4) = 1;
      return v4;
    }
    if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v4)
          return v4;
        -[VCVideoStreamSendGroup setupRedundancySettings].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v4)
          return v4;
        v9 = 136316162;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCVideoStreamSendGroup setupRedundancySettings]";
        v13 = 1024;
        v14 = 180;
        v15 = 2112;
        v16 = v5;
        v17 = 2048;
        v18 = self;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create videoRedundancyChangeQueue", (uint8_t *)&v9, 0x30u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v4)
      return v4;
    -[VCVideoStreamSendGroup setupRedundancySettings].cold.1();
  }
  LOBYTE(v4) = 0;
  return v4;
}

- (id)setupRedundancyControllerForMode:(unsigned int)a3
{
  void *v4;
  void *v5;
  VCRedundancyControllerVideo *v6;
  VCRedundancyControllerVideo *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  char v17;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  _BYTE v22[24];
  __int128 v23;
  VCVideoStreamSendGroup *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "redundancyController") || !objc_msgSend(v5, "statisticsCollector"))
      goto LABEL_17;
    v6 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, objc_msgSend(v5, "redundancyMode"), objc_msgSend(v5, "statisticsCollector"), objc_msgSend(v5, "redundancyPercentage"));
    if (v6)
    {
      v7 = v6;
      -[VCRedundancyControllerVideo setStatisticsID:](v6, "setStatisticsID:", self->super.super._idsParticipantID);
      if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_16;
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)v22 = 136315650;
        *(_QWORD *)&v22[4] = v9;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VCVideoStreamSendGroup setupRedundancyControllerForMode:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 204;
        v11 = " [%s] %s:%d Redundancy controller is created";
        v12 = v10;
        v13 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_16;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_16;
        *(_DWORD *)v22 = 136316162;
        *(_QWORD *)&v22[4] = v14;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VCVideoStreamSendGroup setupRedundancyControllerForMode:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 204;
        WORD2(v23) = 2112;
        *(_QWORD *)((char *)&v23 + 6) = v8;
        HIWORD(v23) = 2048;
        v24 = self;
        v11 = " [%s] %s:%d %@(%p) Redundancy controller is created";
        v12 = v15;
        v13 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, v22, v13);
LABEL_16:
      objc_msgSend(v5, "setRedundancyController:", v7, *(_OWORD *)v22, *(_QWORD *)&v22[16], v23, v24);

LABEL_17:
      v16 = 0;
      v17 = 1;
      goto LABEL_18;
    }
    v17 = 0;
    v16 = CFSTR("Failed to create video redundancy controller");
  }
  else
  {
    v17 = 0;
    v16 = CFSTR("Tried to create redundancy controller for mode but VCMediaStreamSendGroupConfig is nil");
  }
LABEL_18:
  -[VCMediaStreamSendGroup setRedundancyController:](self, "setRedundancyController:", objc_msgSend(v5, "redundancyController"));
  if ((v17 & 1) != 0)
    return 0;
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup setupRedundancyControllerForMode:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v19 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v22 = 136316418;
        *(_QWORD *)&v22[4] = v20;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VCVideoStreamSendGroup setupRedundancyControllerForMode:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 212;
        WORD2(v23) = 2112;
        *(_QWORD *)((char *)&v23 + 6) = v19;
        HIWORD(v23) = 2048;
        v24 = self;
        v25 = 2112;
        v26 = v16;
        _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %@", v22, 0x3Au);
      }
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, v16);
}

- (void)setupPayloadTypes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *obj;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->super.super._mediaStreamInfoArray;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v6);
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v8 = (void *)objc_msgSend(v7, "streamConfigs");
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v16;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v16 != v11)
                objc_enumerationMutation(v8);
              -[NSMutableSet addObjectsFromArray:](self->_videoPayloadTypes, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "txPayloadMap"), "allKeys"));
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
          }
          while (v10);
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v4);
  }
}

- (void)cleanupRedundancySettings
{
  opaqueCMSimpleQueue *videoRedundancyChangeEventQueue;

  -[VCVideoStreamSendGroup flushVideoRedundancyEventQueue](self, "flushVideoRedundancyEventQueue");
  VCMemoryPool_Destroy((OSQueueHead *)self->_videoRedundancyPool);
  videoRedundancyChangeEventQueue = self->_videoRedundancyChangeEventQueue;
  if (videoRedundancyChangeEventQueue)
    CFRelease(videoRedundancyChangeEventQueue);
}

- (int64_t)maxCaptureResolution
{
  if (+[VCHardwareSettings supportsMultiway1080pStream](VCHardwareSettings, "supportsMultiway1080pStream"))
  {
    return 20;
  }
  if (+[VCHardwareSettings supportsMultiway720pStream](VCHardwareSettings, "supportsMultiway720pStream"))
    return 16;
  return 11;
}

- (int)maxCaptureFrameRateForMode:(unsigned int)a3
{
  if ((*(_DWORD *)(&self->super._isSuspended + 3) - 1) > 1)
    return -[VCVideoStreamSendGroup maxCaptureCameraFrameRateForMode:](self, "maxCaptureCameraFrameRateForMode:", *(_QWORD *)&a3);
  else
    return -[VCVideoStreamSendGroup maxStreamFrameRate](self, "maxStreamFrameRate", *(_QWORD *)&a3);
}

- (int)maxCaptureCameraFrameRateForMode:(unsigned int)a3
{
  int result;

  if (a3 == 1)
  {
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:")))
    {
      return objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1)), "mediaStreamInfoArray"), "firstObject"), "streamConfigs"), "firstObject"), "framerate");
    }
    else
    {
      return +[VCHardwareSettings maxOneToOneFramerateSupported](VCHardwareSettings, "maxOneToOneFramerateSupported");
    }
  }
  else if (a3)
  {
    return 30;
  }
  else
  {
    result = +[VCHardwareSettings maxMultiwayFramerateSupported](VCHardwareSettings, "maxMultiwayFramerateSupported");
    if (result >= 0x1E)
      return 30;
  }
  return result;
}

- (id)uplinkVideoStreamControllerForMode:(unsigned int)a3
{
  void *v5;
  void *v6;
  VCSessionUplinkVideoStreamController *v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  const __CFString *v22;
  uint64_t v23;
  NSObject *v24;
  _BYTE v25[24];
  __int128 v26;
  VCVideoStreamSendGroup *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:"));
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "uplinkVideoStreamController"))
    {
      v7 = -[VCSessionUplinkVideoStreamController initWithVideoStreams:streamInfos:reportingAgent:delegate:]([VCSessionUplinkVideoStreamController alloc], "initWithVideoStreams:streamInfos:reportingAgent:delegate:", self->super.super._streamIDToMediaStreamMap, self->super.super._mediaStreamInfoArray, self->super.super.super._reportingAgent, self);
      -[VCSessionUplinkVideoStreamController setCaptureFrameRate:](v7, "setCaptureFrameRate:", self->_maxSupportedCaptureFrameRate);
      if (BYTE2(self->_captureSource))
      {
        v8 = -[VCMediaStreamGroup streamGroupID](self, "streamGroupID");
        if (a3)
          v9 = 0;
        else
          v9 = v8 == 1667329381;
        v10 = v9;
      }
      else
      {
        v10 = 0;
      }
      -[VCSessionUplinkVideoStreamController setDynamicVideoPriorityEnabled:](v7, "setDynamicVideoPriorityEnabled:", v10);
      -[VCSessionUplinkVideoStreamController setShouldSkipIDRScheduler:](v7, "setShouldSkipIDRScheduler:", 1);
      if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_22;
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
        v14 = BYTE2(self->_captureSource);
        *(_DWORD *)v25 = 136316418;
        *(_QWORD *)&v25[4] = v12;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 290;
        WORD2(v26) = 1024;
        *(_DWORD *)((char *)&v26 + 6) = v14;
        WORD5(v26) = 1024;
        HIDWORD(v26) = -[VCSessionUplinkVideoStreamController dynamicVideoPriorityEnabled](v7, "dynamicVideoPriorityEnabled");
        LOWORD(v27) = 1024;
        *(_DWORD *)((char *)&v27 + 2) = -[VCSessionUplinkVideoStreamController captureFrameRate](v7, "captureFrameRate");
        v15 = " [%s] %s:%d _videoPriorityEnabled=%d, uplinkVideoStreamController.dynamicVideoPriorityEnabled=%d uplinkVid"
              "eoStreamController.captureFrameRate=%d";
        v16 = v13;
        v17 = 46;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v11 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_22;
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_22;
        v20 = BYTE2(self->_captureSource);
        *(_DWORD *)v25 = 136316930;
        *(_QWORD *)&v25[4] = v18;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 290;
        WORD2(v26) = 2112;
        *(_QWORD *)((char *)&v26 + 6) = v11;
        HIWORD(v26) = 2048;
        v27 = self;
        LOWORD(v28) = 1024;
        *(_DWORD *)((char *)&v28 + 2) = v20;
        HIWORD(v28) = 1024;
        LODWORD(v29) = -[VCSessionUplinkVideoStreamController dynamicVideoPriorityEnabled](v7, "dynamicVideoPriorityEnabled");
        WORD2(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 6) = -[VCSessionUplinkVideoStreamController captureFrameRate](v7, "captureFrameRate");
        v15 = " [%s] %s:%d %@(%p) _videoPriorityEnabled=%d, uplinkVideoStreamController.dynamicVideoPriorityEnabled=%d up"
              "linkVideoStreamController.captureFrameRate=%d";
        v16 = v19;
        v17 = 66;
      }
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, v25, v17);
LABEL_22:
      objc_msgSend(v6, "setUplinkVideoStreamController:", v7, *(_OWORD *)v25, *(_QWORD *)&v25[16], v26, v27, v28, v29);

    }
  }
  else if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v22 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v25 = 136316162;
        *(_QWORD *)&v25[4] = v23;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = "-[VCVideoStreamSendGroup uplinkVideoStreamControllerForMode:]";
        *(_WORD *)&v25[22] = 1024;
        LODWORD(v26) = 282;
        WORD2(v26) = 2112;
        *(_QWORD *)((char *)&v26 + 6) = v22;
        HIWORD(v26) = 2048;
        v27 = self;
        _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Tried to create uplink video stream controller for mode but VCMediaStreamSendGroupConfig is nil", v25, 0x30u);
      }
    }
  }
  return (id)objc_msgSend(v6, "uplinkVideoStreamController");
}

- (BOOL)generateKeyFrameWithStreamID:(id)a3 firType:(int)a4
{
  uint64_t v4;
  id v7;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  __int16 v25;
  VCVideoStreamSendGroup *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v4 = *(_QWORD *)&a4;
  v29 = *MEMORY[0x1E0C80C00];
  v7 = -[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:");
  if (v7)
  {
    -[VCSessionUplinkVideoStreamController generateKeyFrameWithStreamID:firType:](self->_uplinkVideoStreamController, "generateKeyFrameWithStreamID:firType:", a3, v4);
    return v7 != 0;
  }
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315906;
        v18 = v10;
        v19 = 2080;
        v20 = "-[VCVideoStreamSendGroup generateKeyFrameWithStreamID:firType:]";
        v21 = 1024;
        v22 = 301;
        v23 = 2112;
        v24 = a3;
        v12 = " [%s] %s:%d streamID=%@ does not exist";
        v13 = v11;
        v14 = 38;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136316418;
        v18 = v15;
        v19 = 2080;
        v20 = "-[VCVideoStreamSendGroup generateKeyFrameWithStreamID:firType:]";
        v21 = 1024;
        v22 = 301;
        v23 = 2112;
        v24 = (id)v9;
        v25 = 2048;
        v26 = self;
        v27 = 2112;
        v28 = a3;
        v12 = " [%s] %s:%d %@(%p) streamID=%@ does not exist";
        v13 = v16;
        v14 = 58;
        goto LABEL_14;
      }
    }
  }
  return v7 != 0;
}

- (id)willStart
{
  if (!objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->super._streamGroupMode)), "streamGroupRedundancyControlEnabled"))return 0;
  -[VCVideoStreamSendGroup flushVideoRedundancyEventQueue](self, "flushVideoRedundancyEventQueue");
  return -[VCVideoStreamSendGroup setupRedundancyControllerForMode:](self, "setupRedundancyControllerForMode:", self->super._streamGroupMode);
}

- (void)updateEnabledState
{
  unsigned int state;
  _BOOL4 hasPeerSubscribedStreams;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 allowSuspendProvisionedStreams;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  _BOOL4 v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BYTE v28[10];
  VCVideoStreamSendGroup *v29;
  _BYTE v30[6];
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  state = self->super.super._state;
  hasPeerSubscribedStreams = !self->_allowSuspendProvisionedStreams && state == 1;
  if (self->_allowSuspendProvisionedStreams && state == 1)
    hasPeerSubscribedStreams = self->_hasPeerSubscribedStreams;
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->_hasPeerSubscribedStreams;
        v11 = self->super.super._state == 1;
        allowSuspendProvisionedStreams = self->_allowSuspendProvisionedStreams;
        v21 = 136316674;
        v22 = v8;
        v23 = 2080;
        v24 = "-[VCVideoStreamSendGroup updateEnabledState]";
        v25 = 1024;
        v26 = 352;
        v27 = 1024;
        *(_DWORD *)v28 = hasPeerSubscribedStreams;
        *(_WORD *)&v28[4] = 1024;
        *(_DWORD *)&v28[6] = v11;
        LOWORD(v29) = 1024;
        *(_DWORD *)((char *)&v29 + 2) = v10;
        HIWORD(v29) = 1024;
        *(_DWORD *)v30 = allowSuspendProvisionedStreams;
        v13 = " [%s] %s:%d captureEnabled=%d isRunning=%d _hasPeerSubscribedStreams=%d _allowSuspendProvisionedStreams=%d";
        v14 = v9;
        v15 = 52;
LABEL_23:
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v21, v15);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v18 = self->_hasPeerSubscribedStreams;
        v19 = self->super.super._state == 1;
        v20 = self->_allowSuspendProvisionedStreams;
        v21 = 136317186;
        v22 = v16;
        v23 = 2080;
        v24 = "-[VCVideoStreamSendGroup updateEnabledState]";
        v25 = 1024;
        v26 = 352;
        v27 = 2112;
        *(_QWORD *)v28 = v7;
        *(_WORD *)&v28[8] = 2048;
        v29 = self;
        *(_WORD *)v30 = 1024;
        *(_DWORD *)&v30[2] = hasPeerSubscribedStreams;
        v31 = 1024;
        v32 = v19;
        v33 = 1024;
        v34 = v18;
        v35 = 1024;
        v36 = v20;
        v13 = " [%s] %s:%d %@(%p) captureEnabled=%d isRunning=%d _hasPeerSubscribedStreams=%d _allowSuspendProvisionedStreams=%d";
        v14 = v17;
        v15 = 72;
        goto LABEL_23;
      }
    }
  }
}

- (void)setupVideoPriority
{
  int v3;
  BOOL v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  VCVideoStreamSendGroup *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  LOBYTE(self->_captureSource) = 0;
  if (-[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1667329381)
  {
    v3 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-priority-enabled"), CFSTR("enableVideoPriority"), MEMORY[0x1E0C9AAB0], 0), "BOOLValue");
    v4 = 0;
    if (v3)
      v4 = +[VCHardwareSettings supportsVideoPriority](VCHardwareSettings, "supportsVideoPriority");
    BYTE2(self->_captureSource) = v4;
  }
  BYTE1(self->_captureSource) = 0;
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = BYTE2(self->_captureSource);
        v15 = 136315906;
        v16 = v6;
        v17 = 2080;
        v18 = "-[VCVideoStreamSendGroup setupVideoPriority]";
        v19 = 1024;
        v20 = 364;
        v21 = 1024;
        LODWORD(v22) = v8;
        v9 = " [%s] %s:%d _videoPriorityEnabled=%d";
        v10 = v7;
        v11 = 34;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = BYTE2(self->_captureSource);
        v15 = 136316418;
        v16 = v12;
        v17 = 2080;
        v18 = "-[VCVideoStreamSendGroup setupVideoPriority]";
        v19 = 1024;
        v20 = 364;
        v21 = 2112;
        v22 = v5;
        v23 = 2048;
        v24 = self;
        v25 = 1024;
        v26 = v14;
        v9 = " [%s] %s:%d %@(%p) _videoPriorityEnabled=%d";
        v10 = v13;
        v11 = 54;
        goto LABEL_15;
      }
    }
  }
}

void __VCVideoStreamSendGroup_ProcessVideoPriority_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "streamGroup:didChangeMediaPriority:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)flushVideoRedundancyEventQueue
{
  void *v3;
  void *v4;

  v3 = (void *)CMSimpleQueueDequeue(self->_videoRedundancyChangeEventQueue);
  if (v3)
  {
    v4 = v3;
    do
    {
      VCMemoryPool_Free((OSQueueHead *)self->_videoRedundancyPool, v4);
      v4 = (void *)CMSimpleQueueDequeue(self->_videoRedundancyChangeEventQueue);
    }
    while (v4);
  }
}

- (CGSize)getCaptureEncodingSize
{
  void *v3;
  int64_t maxSupportedMultiwayVideoResolution;
  double v6;
  double v7;
  CGSize result;

  v3 = (void *)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject");
  if (self->super._streamGroupMode != 1 || v3 == 0)
    maxSupportedMultiwayVideoResolution = self->_maxSupportedMultiwayVideoResolution;
  else
    maxSupportedMultiwayVideoResolution = objc_msgSend(v3, "videoResolution");
  +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", maxSupportedMultiwayVideoResolution);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)dispatchedSetCaptureVideoRule:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->super.super._stateQueue);

  self->_captureVideoRule = (VCVideoRule *)a3;
}

- (void)registerForVideoCapture:(int)a3
{
  uint64_t v3;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  VCVideoRule *v19;
  double v20;
  VCVideoRule *v21;
  _BYTE v22[24];
  __int128 v23;
  VCVideoStreamSendGroup *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v3 = *(_QWORD *)&a3;
  v27 = *MEMORY[0x1E0C80C00];
  -[VCVideoStreamSendGroup getCaptureEncodingSize](self, "getCaptureEncodingSize");
  v6 = v5;
  v8 = v7;
  if ((VCVideoStreamSendGroup *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)v22 = 136316930;
    *(_QWORD *)&v22[4] = v15;
    *(_WORD *)&v22[12] = 2080;
    *(_QWORD *)&v22[14] = "-[VCVideoStreamSendGroup registerForVideoCapture:]";
    *(_WORD *)&v22[22] = 1024;
    LODWORD(v23) = 428;
    WORD2(v23) = 2112;
    *(_QWORD *)((char *)&v23 + 6) = v9;
    HIWORD(v23) = 2048;
    v24 = self;
    LOWORD(v25) = 1024;
    *(_DWORD *)((char *)&v25 + 2) = v6;
    HIWORD(v25) = 1024;
    LODWORD(v26) = v8;
    WORD2(v26) = 1024;
    *(_DWORD *)((char *)&v26 + 6) = v3;
    v12 = " [%s] %s:%d %@(%p) encode = %dx%d %d fps";
    v13 = v16;
    v14 = 66;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v22 = 136316418;
      *(_QWORD *)&v22[4] = v10;
      *(_WORD *)&v22[12] = 2080;
      *(_QWORD *)&v22[14] = "-[VCVideoStreamSendGroup registerForVideoCapture:]";
      *(_WORD *)&v22[22] = 1024;
      LODWORD(v23) = 428;
      WORD2(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 6) = v6;
      WORD5(v23) = 1024;
      HIDWORD(v23) = v8;
      LOWORD(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 2) = v3;
      v12 = " [%s] %s:%d encode = %dx%d %d fps";
      v13 = v11;
      v14 = 46;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, v22, v14);
    }
  }
LABEL_12:
  if (-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance", *(_OWORD *)v22, *(_QWORD *)&v22[16], v23, v24, v25, v26), "forceHWI"))
  {
    v6 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
    v8 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
    v3 = -[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v22 = 136316418;
        *(_QWORD *)&v22[4] = v17;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VCVideoStreamSendGroup registerForVideoCapture:]";
        *(_WORD *)&v22[22] = 1024;
        LODWORD(v23) = 434;
        WORD2(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 6) = v6;
        WORD5(v23) = 1024;
        HIDWORD(v23) = v8;
        LOWORD(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 2) = v3;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d forcing capture settings %dx%d %d fps", v22, 0x2Eu);
      }
    }
  }
  self->_captureFrameRate = v3;
  v19 = [VCVideoRule alloc];
  *(float *)&v20 = (float)(int)v3;
  v21 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v19, "initWithFrameWidth:frameHeight:frameRate:", v6, v8, v20);
  -[VCVideoStreamSendGroup dispatchedSetCaptureVideoRule:](self, "dispatchedSetCaptureVideoRule:", v21);

  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:withClient:width:height:frameRate:", 3, self, v6, v8, v3);
  -[VCVideoStreamSendGroup sourceFrameRateDidChange:](self, "sourceFrameRateDidChange:", v3);
}

- (void)deregisterForVideoCapture
{
  -[VCVideoStreamSendGroup dispatchedSetCaptureVideoRule:](self, "dispatchedSetCaptureVideoRule:", 0);
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", 3, self);
}

- (unsigned)getPixelFormat
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray firstObject](self->super.super._mediaStreamInfoArray, "firstObject"), "streamConfigs"), "firstObject"), "pixelFormat");
}

- (id)registerForScreenCapture
{
  VCVideoStreamSendGroup *v2;
  id v3;
  uint64_t v4;
  uint64_t v6;
  _QWORD v7[2];

  v2 = self;
  v7[1] = *MEMORY[0x1E0C80C00];
  -[VCVideoStreamSendGroup computeMaxScreenCaptureSize](self, "computeMaxScreenCaptureSize");
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("Client"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2->_maxScreenCaptureSize.width), CFSTR("VideoWidth"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2->_maxScreenCaptureSize.height), CFSTR("VideoHeight"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VCVideoStreamSendGroup maxStreamFrameRate](v2, "maxStreamFrameRate")), CFSTR("FrameRate"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9EF6F80, CFSTR("ScreenCaptureConfigurationDisplayMode"));
  v4 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ShouldSendBlackFramesOnClearScreen"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9EF6F98, CFSTR("ResolutionScaling"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCVideoStreamSendGroup getPixelFormat](v2, "getPixelFormat")), CFSTR("PixelFormat"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("EnableIdleFrameAdjustments"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("ScreenWatcherExempt"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ShouldSupressDRMContent"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9EF6FB0, CFSTR("BiomeEventType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("AllowRemoteControlLayers"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("NotifyOnDisallowedCloningLayers"));
  LOBYTE(v2) = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerForVideoFramesFromSource:sourceConfig:", *(unsigned int *)(&v2->super._isSuspended + 3), v3);

  if ((v2 & 1) != 0)
    return 0;
  v6 = *MEMORY[0x1E0CB2D50];
  v7[0] = CFSTR("Screen capture is busy or not permitted");
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("VCVideoStreamGroup"), -2, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1));
}

- (void)deregisterForScreenCapture
{
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterForVideoFramesFromSource:withClient:", *(unsigned int *)(&self->super._isSuspended + 3), self);
}

- (void)updateSuspendedState
{
  _BOOL4 v3;
  id v4;
  uint64_t v5;

  if (self->_isStreamInputCaptureSource)
  {
    v3 = -[VCMediaStreamSendGroup isSuspended](self, "isSuspended");
    v4 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton");
    v5 = *(unsigned int *)(&self->super._isSuspended + 3);
    if (v3)
      objc_msgSend(v4, "suspendVideoSink:withCaptureSource:", self, v5);
    else
      objc_msgSend(v4, "resumeVideoSink:withCaptureSource:", self, v5);
  }
}

- (void)dispatchedUpdateActiveMediaStreamIDs:(id)a3 withTargetBitrate:(unsigned int)a4 mediaBitrates:(id)a5 rateChangeCounter:(unsigned int)a6
{
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  __int128 v35;
  unsigned int v36;
  objc_super v39;
  _QWORD v40[2];
  _QWORD v41[2];
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  char *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  __int16 v58;
  unsigned int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        v43 = v10;
        v44 = 2080;
        v45 = "-[VCVideoStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
        v46 = 1024;
        v47 = 517;
        v48 = 2080;
        v49 = FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
        v50 = 2112;
        v51 = a3;
        v52 = 2112;
        v53 = (uint64_t)a5;
        v54 = 1024;
        LODWORD(v55) = a4;
        v12 = " [%s] %s:%d StreamGroup:%s VideoStreamIDs:%@ videoMediaBitrates:%@ for targetBitrate:%d";
        v13 = v11;
        v14 = 64;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v9 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136317186;
        v43 = v15;
        v44 = 2080;
        v45 = "-[VCVideoStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
        v46 = 1024;
        v47 = 517;
        v48 = 2112;
        v49 = (char *)v9;
        v50 = 2048;
        v51 = self;
        v52 = 2080;
        v53 = (uint64_t)FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
        v54 = 2112;
        v55 = a3;
        v56 = 2112;
        v57 = a5;
        v58 = 1024;
        v59 = a4;
        v12 = " [%s] %s:%d %@(%p) StreamGroup:%s VideoStreamIDs:%@ videoMediaBitrates:%@ for targetBitrate:%d";
        v13 = v16;
        v14 = 84;
        goto LABEL_11;
      }
    }
  }
  v36 = a4;
  -[NSMutableDictionary removeAllObjects](self->_pendingActiveUplinkStreams, "removeAllObjects");
  if ((int)objc_msgSend(a3, "count") >= 1)
  {
    v18 = 0;
    v19 = 0;
    *(_QWORD *)&v17 = 136315906;
    v35 = v17;
    while (1)
    {
      v20 = objc_msgSend(a3, "objectAtIndexedSubscript:", v18, v35);
      v21 = (void *)objc_msgSend(a5, "objectAtIndexedSubscript:", v18);
      v22 = -[NSDictionary objectForKeyedSubscript:](self->super.super._streamIDToMediaStreamMap, "objectForKeyedSubscript:", v20);
      if (v22)
      {
        v23 = v22;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingActiveUplinkStreams, "setObject:forKeyedSubscript:", v22, v20);
        objc_msgSend(v23, "setTargetEncoderBitrate:", objc_msgSend(v21, "unsignedIntValue"));
      }
      else
      {
        if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_16;
          v30 = VRTraceErrorLogLevelToCSTR();
          v31 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_16;
          *(_DWORD *)buf = v35;
          v43 = v30;
          v44 = 2080;
          v45 = "-[VCVideoStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
          v46 = 1024;
          v47 = 530;
          v48 = 2112;
          v49 = (char *)v20;
          v27 = v31;
          v28 = " [%s] %s:%d not found video stream with stream ID %@";
          v29 = 38;
        }
        else
        {
          v24 = &stru_1E9E58EE0;
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v24 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
          if ((int)VRTraceGetErrorLogLevelForModule() < 3)
            goto LABEL_16;
          v25 = VRTraceErrorLogLevelToCSTR();
          v26 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            goto LABEL_16;
          *(_DWORD *)buf = 136316418;
          v43 = v25;
          v44 = 2080;
          v45 = "-[VCVideoStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:]";
          v46 = 1024;
          v47 = 530;
          v48 = 2112;
          v49 = (char *)v24;
          v50 = 2048;
          v51 = self;
          v52 = 2112;
          v53 = v20;
          v27 = v26;
          v28 = " [%s] %s:%d %@(%p) not found video stream with stream ID %@";
          v29 = 58;
        }
        _os_log_error_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_ERROR, v28, buf, v29);
      }
LABEL_16:
      if (-[NSMutableArray containsObject:](self->_temporalStreamsIDs, "containsObject:", v20))
        v19 |= 1 << -[NSMutableArray indexOfObject:](self->_temporalStreamsIDs, "indexOfObject:", v20);
      if (++v18 >= (int)objc_msgSend(a3, "count"))
        goto LABEL_31;
    }
  }
  v19 = 0;
LABEL_31:
  if (self->_activeTemporalTierBitmap != v19)
  {
    self->_activeTemporalTierBitmap = v19;
    -[VCObject reportingAgent](self, "reportingAgent");
    v40[0] = CFSTR("VCVSTxTemporalTier");
    v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_activeTemporalTierBitmap);
    v40[1] = CFSTR("VCMSStreamGroup");
    v41[0] = v32;
    v33 = (void *)MEMORY[0x1E0CB37E8];
    -[VCMediaStreamGroup streamGroupID](self, "streamGroupID");
    v41[1] = objc_msgSend(v33, "numberWithUnsignedInt:", reportingStreamGroupFromStreamGroupID());
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
    reportingGenericEvent();
  }
  -[VCSessionUplinkVideoStreamController setPendingVideoStreams:](self->_uplinkVideoStreamController, "setPendingVideoStreams:", self->_pendingActiveUplinkStreams);
  v34 = -[VCMediaStreamSendGroup isSuspended](self, "isSuspended");
  if (((v34 ^ (objc_msgSend(a3, "count") != 0)) & 1) == 0)
  {
    -[VCMediaStreamSendGroup setIsSuspended:](self, "setIsSuspended:", objc_msgSend(a3, "count") == 0);
    -[VCVideoStreamSendGroup updateSuspendedState](self, "updateSuspendedState");
  }
  v39.receiver = self;
  v39.super_class = (Class)VCVideoStreamSendGroup;
  -[VCMediaStreamSendGroup dispatchedUpdateActiveMediaStreamIDs:withTargetBitrate:mediaBitrates:rateChangeCounter:](&v39, sel_dispatchedUpdateActiveMediaStreamIDs_withTargetBitrate_mediaBitrates_rateChangeCounter_, a3, v36, a5, a6);
}

- (id)activeStreamKeys
{
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  NSArray *obj;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[VCSessionUplinkVideoStreamController activeVideoStreams](self->_uplinkVideoStreamController, "activeVideoStreams");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = -[NSDictionary allValues](v4, "allValues");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(obj);
        v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
        if ((_DWORD)v9)
          v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9);
        else
          v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), self->super.super._participantUUID, v10));
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v6);
  }
  return v3;
}

- (BOOL)updateUplinkStreamsForPeerSubscribedStreams:(id)a3
{
  NSArray *mediaStreams;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  char v13;
  uint64_t v14;
  VCVideoStreamSendGroup *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  VCVideoStreamSendGroup *v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(mediaStreams);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v10, "isTemporalScalingEnabled"))
          objc_msgSend(v10, "setPeerSubscribedStreamIDs:", a3);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
    }
    while (v7);
  }
  v11 = objc_msgSend(a3, "count");
  v12 = v11 != 0;
  if (self->_allowSuspendProvisionedStreams && self->_hasPeerSubscribedStreams != v12)
  {
    v14 = v11;
    v15 = (VCVideoStreamSendGroup *)objc_opt_class();
    if (v14)
    {
      if (v15 != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v16 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v16 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_37;
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_37;
        *(_DWORD *)buf = 136316162;
        v30 = v21;
        v31 = 2080;
        v32 = "-[VCVideoStreamSendGroup updateUplinkStreamsForPeerSubscribedStreams:]";
        v33 = 1024;
        v34 = 577;
        v35 = 2112;
        v36 = v16;
        v37 = 2048;
        v38 = self;
        v20 = " [%s] %s:%d %@(%p) New remote subscriptions. Enable capture.";
        goto LABEL_35;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_37;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      *(_DWORD *)buf = 136315650;
      v30 = v18;
      v31 = 2080;
      v32 = "-[VCVideoStreamSendGroup updateUplinkStreamsForPeerSubscribedStreams:]";
      v33 = 1024;
      v34 = 577;
      v20 = " [%s] %s:%d New remote subscriptions. Enable capture.";
    }
    else
    {
      if (v15 != self)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v17 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v17 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_37;
        v26 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_37;
        *(_DWORD *)buf = 136316162;
        v30 = v26;
        v31 = 2080;
        v32 = "-[VCVideoStreamSendGroup updateUplinkStreamsForPeerSubscribedStreams:]";
        v33 = 1024;
        v34 = 579;
        v35 = 2112;
        v36 = v17;
        v37 = 2048;
        v38 = self;
        v20 = " [%s] %s:%d %@(%p) No remote subscriptions. Disable capture.";
LABEL_35:
        v24 = v22;
        v25 = 48;
        goto LABEL_36;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_37;
      v23 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      *(_DWORD *)buf = 136315650;
      v30 = v23;
      v31 = 2080;
      v32 = "-[VCVideoStreamSendGroup updateUplinkStreamsForPeerSubscribedStreams:]";
      v33 = 1024;
      v34 = 579;
      v20 = " [%s] %s:%d No remote subscriptions. Disable capture.";
    }
    v24 = v19;
    v25 = 28;
LABEL_36:
    _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v20, buf, v25);
LABEL_37:
    self->_hasPeerSubscribedStreams = v12;
    v13 = 1;
    goto LABEL_38;
  }
  v13 = 0;
LABEL_38:
  v28.receiver = self;
  v28.super_class = (Class)VCVideoStreamSendGroup;
  return v13 | -[VCMediaStreamSendGroup updateUplinkStreamsForPeerSubscribedStreams:](&v28, sel_updateUplinkStreamsForPeerSubscribedStreams_, a3);
}

- (void)updateUplinkBitrateCapCell:(unsigned int)a3 activeStreamIDs:(id)a4
{
  uint64_t v5;
  objc_super v7;
  uint64_t v8;

  v5 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  -[VCSessionUplinkVideoStreamController setStreamIDsCell:](self->_uplinkVideoStreamController, "setStreamIDsCell:", a4);
  v7.receiver = self;
  v7.super_class = (Class)VCVideoStreamSendGroup;
  -[VCMediaStreamSendGroup updateUplinkBitrateCapCell:activeStreamIDs:](&v7, sel_updateUplinkBitrateCapCell_activeStreamIDs_, v5, a4);
}

- (void)updateUplinkBitrateCapWifi:(unsigned int)a3 activeStreamIDs:(id)a4
{
  uint64_t v5;
  objc_super v7;
  uint64_t v8;

  v5 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  -[VCSessionUplinkVideoStreamController setStreamIDsWifi:](self->_uplinkVideoStreamController, "setStreamIDsWifi:", a4);
  v7.receiver = self;
  v7.super_class = (Class)VCVideoStreamSendGroup;
  -[VCMediaStreamSendGroup updateUplinkBitrateCapWifi:activeStreamIDs:](&v7, sel_updateUplinkBitrateCapWifi_activeStreamIDs_, v5, a4);
}

- (void)setActiveConnection:(id)a3 uplinkBitrateCap:(unsigned int)a4 activeMediaStreamIDs:(id)a5 mediaBitrates:(id)a6 rateChangeCounter:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v10;
  objc_super v13;
  uint64_t v14;

  v7 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a4;
  v14 = *MEMORY[0x1E0C80C00];
  -[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:](self->_uplinkVideoStreamController, "setIsLocalOnCellular:cappedVideoStreamIDs:", VCConnection_IsLocalOnCellular((uint64_t)a3), a5);
  v13.receiver = self;
  v13.super_class = (Class)VCVideoStreamSendGroup;
  -[VCMediaStreamSendGroup setActiveConnection:uplinkBitrateCap:activeMediaStreamIDs:mediaBitrates:rateChangeCounter:](&v13, sel_setActiveConnection_uplinkBitrateCap_activeMediaStreamIDs_mediaBitrates_rateChangeCounter_, a3, v10, a5, a6, v7);
}

- (id)streamDescriptionForMediaStreamConfig:(id)a3
{
  void *v5;
  double v7;
  double v8;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[VCMediaStreamGroup mediaType](self, "mediaType") == 1986618469)
  {
    v5 = (void *)objc_msgSend(a3, "multiwayConfig");
    if (objc_msgSend(v5, "resolution") == 27 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("streamId=%hu quality=%u, %dx%d."), objc_msgSend(v5, "idsStreamID"), objc_msgSend(v5, "qualityIndex"), objc_msgSend(a3, "customWidth"), objc_msgSend(a3, "customHeight"));
    }
    else
    {
      +[VideoUtil sizeForVideoResolution:](VideoUtil, "sizeForVideoResolution:", objc_msgSend(v5, "resolution"));
      return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("streamId=%hu quality=%u, %dx%d."), objc_msgSend(v5, "idsStreamID"), objc_msgSend(v5, "qualityIndex"), (int)v7, (int)v8);
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VCVideoStreamSendGroup;
    return -[VCMediaStreamSendGroup streamDescriptionForMediaStreamConfig:](&v9, sel_streamDescriptionForMediaStreamConfig_, a3);
  }
}

- (BOOL)shouldSubscribeToStreamID:(id)a3 peerSubscribedStreams:(id)a4
{
  unsigned int v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unsigned int v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = +[VCHardwareSettings maxVCPSupportedTemporalLayers](VCHardwareSettings, "maxVCPSupportedTemporalLayers");
  v8 = objc_msgSend(a4, "containsObject:", a3);
  if (!v8)
    return v8;
  if (!-[NSMutableArray containsObject:](self->_temporalStreamsIDs, "containsObject:", a3)
    || (int)-[NSMutableArray count](self->_temporalStreamsIDs, "count") < 1)
  {
    goto LABEL_11;
  }
  v9 = 0;
  v10 = 0;
  while (1)
  {
    if (!objc_msgSend(a4, "containsObject:", -[NSMutableArray objectAtIndexedSubscript:](self->_temporalStreamsIDs, "objectAtIndexedSubscript:", v9)))goto LABEL_10;
    if (++v10 == v7)
    {
      if (objc_msgSend(a3, "isEqualToNumber:", -[NSMutableArray objectAtIndexedSubscript:](self->_temporalStreamsIDs, "objectAtIndexedSubscript:", v9)))break;
    }
    if (v10 > v7 || v9 > (int)-[NSMutableArray indexOfObject:](self->_temporalStreamsIDs, "indexOfObject:", a3))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v13 = objc_msgSend(a3, "unsignedIntValue");
          v14 = objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_temporalStreamsIDs, "objectAtIndexedSubscript:", v9), "unsignedIntValue");
          v18 = 136316418;
          v19 = v11;
          v20 = 2080;
          v21 = "-[VCVideoStreamSendGroup shouldSubscribeToStreamID:peerSubscribedStreams:]";
          v22 = 1024;
          v23 = 642;
          v24 = 1024;
          v25 = v13;
          v26 = 1024;
          v27 = v14;
          v28 = 1024;
          v29 = v7;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d not subscribing to streamID=%d either a higher temporal tier is subscribed (%d) or max active tiers=%d", (uint8_t *)&v18, 0x2Eu);
        }
      }
      objc_msgSend(a4, "removeObject:", a3);
      LOBYTE(v8) = 0;
      return v8;
    }
LABEL_10:
    if (++v9 >= (int)-[NSMutableArray count](self->_temporalStreamsIDs, "count"))
      goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 136316162;
      v19 = v15;
      v20 = 2080;
      v21 = "-[VCVideoStreamSendGroup shouldSubscribeToStreamID:peerSubscribedStreams:]";
      v22 = 1024;
      v23 = 637;
      v24 = 1024;
      v25 = objc_msgSend(a3, "unsignedIntValue");
      v26 = 1024;
      v27 = +[VCHardwareSettings maxVCPSupportedTemporalLayers](VCHardwareSettings, "maxVCPSupportedTemporalLayers");
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d streamID=%d is the highest temporal tier within max=%d", (uint8_t *)&v18, 0x28u);
    }
  }
LABEL_11:
  LOBYTE(v8) = 1;
  return v8;
}

- (BOOL)shouldCompoundListIgnoreStream:(id)a3 streamConfig:(id)a4 activeStreamIds:(id)a5
{
  char v8;
  uint64_t v9;
  void *v10;
  BOOL v11;

  v8 = objc_msgSend(a5, "containsObject:", a3);
  if (objc_msgSend(a4, "temporalScalingEnabled"))
  {
    v9 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a5);
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", self->_temporalStreamsIDs);
    objc_msgSend(v10, "intersectSet:", v9);
    v11 = objc_msgSend(v10, "count") != 0;
  }
  else
  {
    v11 = 0;
  }
  return v11 & ~v8;
}

- (BOOL)dispatchedEnableRedundancy:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  unsigned int v6;
  _DWORD *v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  VCVideoStreamSendGroup *v22;
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->super.super._stateQueue);
  v12.receiver = self;
  v12.super_class = (Class)VCVideoStreamSendGroup;
  v5 = -[VCMediaStreamSendGroup dispatchedEnableRedundancy:](&v12, sel_dispatchedEnableRedundancy_, v3);
  if (v5
    && !self->super._streamGroupMode
    && (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->super._sendGroupConfigForMode, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0)), "streamGroupRedundancyControlEnabled") & 1) == 0)
  {
    v6 = v3 ? 50 : 0;
    self->_fecRatio = VCRedundancyControllerVideo_ConvertRedundancyPercentageToRatio(v6);
    v7 = VCMemoryPool_Alloc((OSQueueHead *)self->_videoRedundancyPool);
    *v7 = v6;
    if (CMSimpleQueueEnqueue(self->_videoRedundancyChangeEventQueue, v7))
    {
      if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCVideoStreamSendGroup dispatchedEnableRedundancy:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v8 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v8 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316162;
            v14 = v9;
            v15 = 2080;
            v16 = "-[VCVideoStreamSendGroup dispatchedEnableRedundancy:]";
            v17 = 1024;
            v18 = 694;
            v19 = 2112;
            v20 = v8;
            v21 = 2048;
            v22 = self;
            _os_log_error_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
          }
        }
      }
      VCMemoryPool_Free((OSQueueHead *)self->_videoRedundancyPool, v7);
    }
  }
  return v5;
}

- (void)setCaptureFrameRate:(int)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCVideoStreamSendGroup_setCaptureFrameRate___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

void __46__VCVideoStreamSendGroup_setCaptureFrameRate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  int v16;
  const __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  int v37;
  uint64_t v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  _BYTE v44[10];
  uint64_t v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 732) == 3)
  {
    v3 = *(_DWORD *)(a1 + 40);
    if (v3 == *(_DWORD *)(v2 + 768))
      return;
    if (v3 > *(_DWORD *)(v2 + 772))
    {
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v22 = VRTraceErrorLogLevelToCSTR();
          v23 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v24 = *(_QWORD *)(a1 + 32);
            v25 = *(_DWORD *)(v24 + 768);
            LODWORD(v24) = *(_DWORD *)(v24 + 772);
            v26 = *(_DWORD *)(a1 + 40);
            v37 = 136316418;
            v38 = v22;
            v39 = 2080;
            v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
            v41 = 1024;
            v42 = 706;
            v43 = 1024;
            *(_DWORD *)v44 = v25;
            *(_WORD *)&v44[4] = 1024;
            *(_DWORD *)&v44[6] = v24;
            LOWORD(v45) = 1024;
            *(_DWORD *)((char *)&v45 + 2) = v26;
            v9 = " [%s] %s:%d Ignoring the change of captureFrameRate. currentCaptureFrameRate=%d maxSupportedMultiwayFra"
                 "meRate=%d framerate=%d";
            v10 = v23;
            v11 = 46;
            goto LABEL_17;
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v18 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
        else
          v18 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v31 = VRTraceErrorLogLevelToCSTR();
          v32 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v33 = *(_QWORD *)(a1 + 32);
            v34 = *(_DWORD *)(v33 + 768);
            v35 = *(_DWORD *)(v33 + 772);
            v36 = *(_DWORD *)(a1 + 40);
            v37 = 136316930;
            v38 = v31;
            v39 = 2080;
            v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
            v41 = 1024;
            v42 = 706;
            v43 = 2112;
            *(_QWORD *)v44 = v18;
            *(_WORD *)&v44[8] = 2048;
            v45 = v33;
            v46 = 1024;
            v47 = v34;
            v48 = 1024;
            v49 = v35;
            v50 = 1024;
            v51 = v36;
            v9 = " [%s] %s:%d %@(%p) Ignoring the change of captureFrameRate. currentCaptureFrameRate=%d maxSupportedMult"
                 "iwayFrameRate=%d framerate=%d";
            v10 = v32;
            v11 = 66;
            goto LABEL_17;
          }
        }
      }
    }
    else
    {
      if (*(_DWORD *)(v2 + 316) == 1 && !*(_BYTE *)(v2 + 288))
      {
        objc_msgSend((id)v2, "deregisterForVideoCapture");
        objc_msgSend(*(id *)(a1 + 32), "registerForVideoCapture:", *(unsigned int *)(a1 + 40));
      }
      else
      {
        *(_DWORD *)(v2 + 768) = v3;
      }
      if (objc_opt_class() == *(_QWORD *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v5 = VRTraceErrorLogLevelToCSTR();
          v6 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v7 = *(_QWORD *)(a1 + 32);
            v8 = *(_DWORD *)(v7 + 768);
            LODWORD(v7) = *(unsigned __int8 *)(v7 + 288);
            v37 = 136316162;
            v38 = v5;
            v39 = 2080;
            v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
            v41 = 1024;
            v42 = 714;
            v43 = 1024;
            *(_DWORD *)v44 = v8;
            *(_WORD *)&v44[4] = 1024;
            *(_DWORD *)&v44[6] = v7;
            v9 = " [%s] %s:%d Set capture rate to %d fps areStreamsSuspended=%{BOOL}d";
            v10 = v6;
            v11 = 40;
LABEL_17:
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v37, v11);
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
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v14 = *(_QWORD *)(a1 + 32);
            v15 = *(_DWORD *)(v14 + 768);
            v16 = *(unsigned __int8 *)(v14 + 288);
            v37 = 136316674;
            v38 = v12;
            v39 = 2080;
            v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
            v41 = 1024;
            v42 = 714;
            v43 = 2112;
            *(_QWORD *)v44 = v4;
            *(_WORD *)&v44[8] = 2048;
            v45 = v14;
            v46 = 1024;
            v47 = v15;
            v48 = 1024;
            v49 = v16;
            v9 = " [%s] %s:%d %@(%p) Set capture rate to %d fps areStreamsSuspended=%{BOOL}d";
            v10 = v13;
            v11 = 60;
            goto LABEL_17;
          }
        }
      }
    }
  }
  else if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 732);
        v37 = 136315906;
        v38 = v19;
        v39 = 2080;
        v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
        v41 = 1024;
        v42 = 704;
        v43 = 1024;
        *(_DWORD *)v44 = v21;
        v9 = " [%s] %s:%d Cannot set capture framerate for captureSource=%d";
        v10 = v20;
        v11 = 34;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v17 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v29 = *(_QWORD *)(a1 + 32);
        v30 = *(_DWORD *)(v29 + 732);
        v37 = 136316418;
        v38 = v27;
        v39 = 2080;
        v40 = "-[VCVideoStreamSendGroup setCaptureFrameRate:]_block_invoke";
        v41 = 1024;
        v42 = 704;
        v43 = 2112;
        *(_QWORD *)v44 = v17;
        *(_WORD *)&v44[8] = 2048;
        v45 = v29;
        v46 = 1024;
        v47 = v30;
        v9 = " [%s] %s:%d %@(%p) Cannot set capture framerate for captureSource=%d";
        v10 = v28;
        v11 = 54;
        goto LABEL_17;
      }
    }
  }
}

- (void)setMediaQueueSize:(unsigned int)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  unsigned int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCVideoStreamSendGroup_setMediaQueueSize___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, block);
}

uint64_t __44__VCVideoStreamSendGroup_setMediaQueueSize___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
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
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 876) = *(_DWORD *)(a1 + 40);
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "activeVideoStreams");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(v2, "allValues");
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        VCVideoStream_SetMediaQueueSize(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), *(_DWORD *)(a1 + 40));
      }
      while (v5 != v7);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (id)startCapture
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  const void *v22;
  void *v23;
  int v24;
  unsigned int v25;
  VCVideoStreamSendGroup *v26;
  const __CFString *v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  int v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  uint64_t v35;
  NSObject *v36;
  int v37;
  const char *v38;
  NSObject *v39;
  uint32_t v40;
  uint64_t v41;
  NSObject *v42;
  int v43;
  uint64_t v44;
  NSObject *v45;
  int v46;
  _BYTE v48[24];
  __int128 v49;
  VCVideoStreamSendGroup *v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_DWORD *)(&self->super._isSuspended + 3);
        *(_DWORD *)v48 = 136315906;
        *(_QWORD *)&v48[4] = v4;
        *(_WORD *)&v48[12] = 2080;
        *(_QWORD *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
        *(_WORD *)&v48[22] = 1024;
        LODWORD(v49) = 733;
        WORD2(v49) = 1024;
        *(_DWORD *)((char *)&v49 + 6) = v6;
        v7 = " [%s] %s:%d Registering for video capture of type: %d";
        v8 = v5;
        v9 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, v48, v9);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_DWORD *)(&self->super._isSuspended + 3);
        *(_DWORD *)v48 = 136316418;
        *(_QWORD *)&v48[4] = v10;
        *(_WORD *)&v48[12] = 2080;
        *(_QWORD *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
        *(_WORD *)&v48[22] = 1024;
        LODWORD(v49) = 733;
        WORD2(v49) = 2112;
        *(_QWORD *)((char *)&v49 + 6) = v3;
        HIWORD(v49) = 2048;
        v50 = self;
        LOWORD(v51) = 1024;
        *(_DWORD *)((char *)&v51 + 2) = v12;
        v7 = " [%s] %s:%d %@(%p) Registering for video capture of type: %d";
        v8 = v11;
        v9 = 54;
        goto LABEL_11;
      }
    }
  }
  -[VCSessionUplinkVideoStreamController restart](self->_uplinkVideoStreamController, "restart", *(_OWORD *)v48, *(_QWORD *)&v48[16], v49, v50, v51, v52);
  self->_isStreamInputCaptureSource = 0;
  if (!-[VCDefaults forceFECRepairStream](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFECRepairStream"))goto LABEL_25;
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_24;
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)v48 = 136315650;
    *(_QWORD *)&v48[4] = v14;
    *(_WORD *)&v48[12] = 2080;
    *(_QWORD *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
    *(_WORD *)&v48[22] = 1024;
    LODWORD(v49) = 737;
    v16 = " [%s] %s:%d _enableRedundancy set to YES by forceFECRepairStream";
    v17 = v15;
    v18 = 28;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v13 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      goto LABEL_24;
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)v48 = 136316162;
    *(_QWORD *)&v48[4] = v19;
    *(_WORD *)&v48[12] = 2080;
    *(_QWORD *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
    *(_WORD *)&v48[22] = 1024;
    LODWORD(v49) = 737;
    WORD2(v49) = 2112;
    *(_QWORD *)((char *)&v49 + 6) = v13;
    HIWORD(v49) = 2048;
    v50 = self;
    v16 = " [%s] %s:%d %@(%p) _enableRedundancy set to YES by forceFECRepairStream";
    v17 = v20;
    v18 = 48;
  }
  _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, v48, v18);
LABEL_24:
  -[VCVideoStreamSendGroup dispatchedEnableRedundancy:](self, "dispatchedEnableRedundancy:", 1, *(_QWORD *)v48, *(_OWORD *)&v48[8], v49, v50);
LABEL_25:
  v21 = (void *)MEMORY[0x1DF086F1C](&self->_clientCaptureController);
  if (!v21)
  {
    v24 = *(_DWORD *)(&self->super._isSuspended + 3);
    if ((v24 - 1) >= 2)
    {
      if (v24 == 3)
      {
        -[VCVideoStreamSendGroup registerForVideoCapture:](self, "registerForVideoCapture:", self->_captureFrameRate);
      }
      else
      {
        self->_isStreamInputCaptureSource = 1;
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerVideoSink:withCaptureSource:", self, *(unsigned int *)(&self->super._isSuspended + 3));
        -[VCVideoStreamSendGroup updateSuspendedState](self, "updateSuspendedState");
      }
      return 0;
    }
    v25 = -[VCMediaStreamGroup streamGroupID](self, "streamGroupID");
    v26 = (VCVideoStreamSendGroup *)objc_opt_class();
    if (v25 == 1935897189)
    {
      if (v26 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_49;
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_49;
        v31 = *(_DWORD *)(&self->super._isSuspended + 3);
        *(_DWORD *)v48 = 136315906;
        *(_QWORD *)&v48[4] = v29;
        *(_WORD *)&v48[12] = 2080;
        *(_QWORD *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
        *(_WORD *)&v48[22] = 1024;
        LODWORD(v49) = 751;
        WORD2(v49) = 1024;
        *(_DWORD *)((char *)&v49 + 6) = v31;
        v32 = " [%s] %s:%d Registering for screen capture of type: %d";
        v33 = v30;
        v34 = 34;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v27 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v27 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_49;
        v41 = VRTraceErrorLogLevelToCSTR();
        v42 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_49;
        v43 = *(_DWORD *)(&self->super._isSuspended + 3);
        *(_DWORD *)v48 = 136316418;
        *(_QWORD *)&v48[4] = v41;
        *(_WORD *)&v48[12] = 2080;
        *(_QWORD *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
        *(_WORD *)&v48[22] = 1024;
        LODWORD(v49) = 751;
        WORD2(v49) = 2112;
        *(_QWORD *)((char *)&v49 + 6) = v27;
        HIWORD(v49) = 2048;
        v50 = self;
        LOWORD(v51) = 1024;
        *(_DWORD *)((char *)&v51 + 2) = v43;
        v32 = " [%s] %s:%d %@(%p) Registering for screen capture of type: %d";
        v33 = v42;
        v34 = 54;
      }
      _os_log_impl(&dword_1D8A54000, v33, OS_LOG_TYPE_DEFAULT, v32, v48, v34);
LABEL_49:
      -[VCVideoStreamSendGroup registerClientForScreenShare](self, "registerClientForScreenShare", *(_QWORD *)v48, *(_OWORD *)&v48[8], v49, v50, v51);
      return 0;
    }
    if (v26 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return -[VCVideoStreamSendGroup registerForScreenCapture](self, "registerForScreenCapture", *(_QWORD *)v48, *(_OWORD *)&v48[8], v49, v50, v51);
      v35 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return -[VCVideoStreamSendGroup registerForScreenCapture](self, "registerForScreenCapture", *(_QWORD *)v48, *(_OWORD *)&v48[8], v49, v50, v51);
      v37 = *(_DWORD *)(&self->super._isSuspended + 3);
      *(_DWORD *)v48 = 136315906;
      *(_QWORD *)&v48[4] = v35;
      *(_WORD *)&v48[12] = 2080;
      *(_QWORD *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
      *(_WORD *)&v48[22] = 1024;
      LODWORD(v49) = 754;
      WORD2(v49) = 1024;
      *(_DWORD *)((char *)&v49 + 6) = v37;
      v38 = " [%s] %s:%d Registering for screen capture of type: %d";
      v39 = v36;
      v40 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v28 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return -[VCVideoStreamSendGroup registerForScreenCapture](self, "registerForScreenCapture", *(_QWORD *)v48, *(_OWORD *)&v48[8], v49, v50, v51);
      v44 = VRTraceErrorLogLevelToCSTR();
      v45 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return -[VCVideoStreamSendGroup registerForScreenCapture](self, "registerForScreenCapture", *(_QWORD *)v48, *(_OWORD *)&v48[8], v49, v50, v51);
      v46 = *(_DWORD *)(&self->super._isSuspended + 3);
      *(_DWORD *)v48 = 136316418;
      *(_QWORD *)&v48[4] = v44;
      *(_WORD *)&v48[12] = 2080;
      *(_QWORD *)&v48[14] = "-[VCVideoStreamSendGroup startCapture]";
      *(_WORD *)&v48[22] = 1024;
      LODWORD(v49) = 754;
      WORD2(v49) = 2112;
      *(_QWORD *)((char *)&v49 + 6) = v28;
      HIWORD(v49) = 2048;
      v50 = self;
      LOWORD(v51) = 1024;
      *(_DWORD *)((char *)&v51 + 2) = v46;
      v38 = " [%s] %s:%d %@(%p) Registering for screen capture of type: %d";
      v39 = v45;
      v40 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_DEFAULT, v38, v48, v40);
    return -[VCVideoStreamSendGroup registerForScreenCapture](self, "registerForScreenCapture", *(_QWORD *)v48, *(_OWORD *)&v48[8], v49, v50, v51);
  }
  v22 = v21;
  v23 = (void *)objc_msgSend(v21, "startCapture");
  CFRelease(v22);
  return v23;
}

- (id)stopCapture
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;
  const void *v14;
  void *v15;
  int v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  VCVideoStreamSendGroup *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() != self)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v12 = *(_DWORD *)(&self->super._isSuspended + 3);
    v18 = 136316418;
    v19 = v10;
    v20 = 2080;
    v21 = "-[VCVideoStreamSendGroup stopCapture]";
    v22 = 1024;
    v23 = 772;
    v24 = 2112;
    v25 = v3;
    v26 = 2048;
    v27 = self;
    v28 = 1024;
    v29 = v12;
    v7 = " [%s] %s:%d %@(%p) Unregistering from video capture of type: %d";
    v8 = v11;
    v9 = 54;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(&self->super._isSuspended + 3);
      v18 = 136315906;
      v19 = v4;
      v20 = 2080;
      v21 = "-[VCVideoStreamSendGroup stopCapture]";
      v22 = 1024;
      v23 = 772;
      v24 = 1024;
      LODWORD(v25) = v6;
      v7 = " [%s] %s:%d Unregistering from video capture of type: %d";
      v8 = v5;
      v9 = 34;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v18, v9);
    }
  }
LABEL_12:
  v13 = (void *)MEMORY[0x1DF086F1C](&self->_clientCaptureController);
  if (v13)
  {
    v14 = v13;
    v15 = (void *)objc_msgSend(v13, "stopCapture");
    CFRelease(v14);
  }
  else
  {
    v16 = *(_DWORD *)(&self->super._isSuspended + 3);
    if ((v16 - 1) >= 2)
    {
      if (v16 == 3)
        -[VCVideoStreamSendGroup deregisterForVideoCapture](self, "deregisterForVideoCapture");
      else
        objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "unregisterVideoSink:withCaptureSource:", self, *(unsigned int *)(&self->super._isSuspended + 3));
    }
    else if (-[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1935897189)
    {
      -[VCVideoStreamSendGroup deregisterClientForScreenShare](self, "deregisterClientForScreenShare");
    }
    else
    {
      -[VCVideoStreamSendGroup deregisterForScreenCapture](self, "deregisterForScreenCapture");
    }
    return 0;
  }
  return v15;
}

- (id)captureConfigForScreenShare
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  -[VCVideoStreamSendGroup computeMaxScreenCaptureSize](self, "computeMaxScreenCaptureSize");
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxScreenCaptureSize.width), CFSTR("VideoWidth"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxScreenCaptureSize.height), CFSTR("VideoHeight"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VCVideoStreamSendGroup maxStreamFrameRate](self, "maxStreamFrameRate")), CFSTR("FrameRate"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9EF6F80, CFSTR("ScreenCaptureConfigurationDisplayMode"));
  v4 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ShouldSendBlackFramesOnClearScreen"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9EF6F98, CFSTR("ResolutionScaling"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCVideoStreamSendGroup getPixelFormat](self, "getPixelFormat")), CFSTR("PixelFormat"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("EnableIdleFrameAdjustments"));
  v5 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("ScreenWatcherExempt"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ShouldSupressDRMContent"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ShouldAllowReconfigureForLocalDisplay"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("ShouldOptimizeForLowLatency"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E9EF6FB0, CFSTR("BiomeEventType"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("AllowRemoteControlLayers"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("NotifyOnDisallowedCloningLayers"));
  return v3;
}

- (void)registerConfigForScreenShare
{
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureConfig:forSource:", -[VCVideoStreamSendGroup captureConfigForScreenShare](self, "captureConfigForScreenShare"), 1);
}

- (void)registerClientForScreenShare
{
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "registerCaptureClientForScreenShare:", self);
}

- (void)deregisterClientForScreenShare
{
  objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "deregisterCaptureClientForScreenShare:", self);
}

- (void)controller:(id)a3 didChangeActiveVideoStreams:(id)a4
{
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[5];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  VCVideoStreamSendGroup *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v26 = v7;
        v27 = 2080;
        v28 = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]";
        v29 = 1024;
        v30 = 846;
        v31 = 2112;
        v32 = (uint64_t)a4;
        v9 = " [%s] %s:%d activeVideoStreams:%@";
        v10 = v8;
        v11 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v26 = v12;
        v27 = 2080;
        v28 = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]";
        v29 = 1024;
        v30 = 846;
        v31 = 2112;
        v32 = (uint64_t)v6;
        v33 = 2048;
        v34 = self;
        v35 = 2112;
        v36 = (uint64_t)a4;
        v9 = " [%s] %s:%d %@(%p) activeVideoStreams:%@";
        v10 = v13;
        v11 = 58;
        goto LABEL_11;
      }
    }
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __65__VCVideoStreamSendGroup_controller_didChangeActiveVideoStreams___block_invoke;
  v24[3] = &unk_1E9E585E8;
  v24[4] = self;
  -[VCMediaStreamSendGroup updateStreamIDCompoundingWithBlock:activeStreamIds:](self, "updateStreamIDCompoundingWithBlock:activeStreamIds:", v24, objc_msgSend(a4, "allKeys"));
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(a4, "allKeys");
        *(_DWORD *)buf = 136315906;
        v26 = v15;
        v27 = 2080;
        v28 = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]";
        v29 = 1024;
        v30 = 864;
        v31 = 2112;
        v32 = v17;
        v18 = " [%s] %s:%d Currently sending streamIDs %@";
        v19 = v16;
        v20 = 38;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(a4, "allKeys");
        *(_DWORD *)buf = 136316418;
        v26 = v21;
        v27 = 2080;
        v28 = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]";
        v29 = 1024;
        v30 = 864;
        v31 = 2112;
        v32 = (uint64_t)v14;
        v33 = 2048;
        v34 = self;
        v35 = 2112;
        v36 = v23;
        v18 = " [%s] %s:%d %@(%p) Currently sending streamIDs %@";
        v19 = v22;
        v20 = 58;
        goto LABEL_22;
      }
    }
  }
  -[VCMediaStreamSendGroup calculateUplinkTotalBitrateForMediaStreams:](self, "calculateUplinkTotalBitrateForMediaStreams:", objc_msgSend(a4, "allValues"));
}

uint64_t __65__VCVideoStreamSendGroup_controller_didChangeActiveVideoStreams___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _BYTE v19[24];
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 472))
    objc_msgSend(a2, "setStreamIDs:repairStreamIDs:");
  objc_msgSend(a2, "setIsServerBasedBandwidthProbingEnabled:", a5);
  result = objc_msgSend(a2, "isCompoundStreamIDsIncreased");
  if ((_DWORD)result)
  {
    v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, v21, v22, v23), 0);
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, v21, v22, v23), 0);
      *(_DWORD *)v19 = 136315906;
      *(_QWORD *)&v19[4] = v11;
      *(_WORD *)&v19[12] = 2080;
      *(_QWORD *)&v19[14] = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 857;
      WORD2(v20) = 1024;
      *(_DWORD *)((char *)&v20 + 6) = v9;
      v13 = " [%s] %s:%d compound streamID increased for stream %hu, generating key frame";
      v14 = v12;
      v15 = 34;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v10 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v10 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, v21, v22, v23), 0);
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, v21, v22, v23), 0);
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v19 = 136316418;
      *(_QWORD *)&v19[4] = v16;
      *(_WORD *)&v19[12] = 2080;
      *(_QWORD *)&v19[14] = "-[VCVideoStreamSendGroup controller:didChangeActiveVideoStreams:]_block_invoke";
      *(_WORD *)&v19[22] = 1024;
      LODWORD(v20) = 857;
      WORD2(v20) = 2112;
      *(_QWORD *)((char *)&v20 + 6) = v10;
      HIWORD(v20) = 2048;
      v21 = v18;
      LOWORD(v22) = 1024;
      *(_DWORD *)((char *)&v22 + 2) = v9;
      v13 = " [%s] %s:%d %@(%p) compound streamID increased for stream %hu, generating key frame";
      v14 = v17;
      v15 = 54;
    }
    _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, v13, v19, v15);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 784), "generateKeyFrameWithStreamID:firType:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v9, *(_OWORD *)v19, *(_QWORD *)&v19[16], v20, v21, v22, v23), 0);
  }
  return result;
}

- (void)sourceFrameRateDidChange:(unsigned int)a3
{
  uint64_t v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSArray *mediaStreams;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  VCVideoStreamSendGroup *v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v3 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v24 = v6;
        v25 = 2080;
        v26 = "-[VCVideoStreamSendGroup sourceFrameRateDidChange:]";
        v27 = 1024;
        v28 = 871;
        v29 = 1024;
        LODWORD(v30) = v3;
        v8 = " [%s] %s:%d frameRate=%u";
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
      v5 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v24 = v11;
        v25 = 2080;
        v26 = "-[VCVideoStreamSendGroup sourceFrameRateDidChange:]";
        v27 = 1024;
        v28 = 871;
        v29 = 2112;
        v30 = v5;
        v31 = 2048;
        v32 = self;
        v33 = 1024;
        v34 = v3;
        v8 = " [%s] %s:%d %@(%p) frameRate=%u";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(mediaStreams);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "sourceFrameRateDidChange:", v3);
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v15);
  }
}

- (BOOL)onVideoFrame:(opaqueCMSampleBuffer *)a3 frameTime:(id *)a4 attribute:(id *)a5
{
  CMTime v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6 = *(CMTime *)a4;
  return VCVideoStreamSendGroup_OnVideoFrame((uint64_t)self, a3, &v6, (uint64_t)a5);
}

- (id)copyOnVideoFrameBlock
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__VCVideoStreamSendGroup_copyOnVideoFrameBlock__block_invoke;
  v3[3] = &unk_1E9E56490;
  v3[4] = self;
  return _Block_copy(v3);
}

uint64_t __47__VCVideoStreamSendGroup_copyOnVideoFrameBlock__block_invoke(uint64_t a1, opaqueCMSampleBuffer *a2, CMTime *a3, uint64_t a4)
{
  uint64_t v4;
  CMTime v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  v6 = *a3;
  return VCVideoStreamSendGroup_OnVideoFrame(v4, a2, &v6, a4);
}

- (void)avConferencePreviewError:(id)a3
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
  VCVideoStreamSendGroup *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
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
        v16 = "-[VCVideoStreamSendGroup avConferencePreviewError:]";
        v17 = 1024;
        v18 = 942;
        v19 = 2112;
        v20 = a3;
        v8 = " [%s] %s:%d avConferencePreviewError %@";
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
      v5 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
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
        v16 = "-[VCVideoStreamSendGroup avConferencePreviewError:]";
        v17 = 1024;
        v18 = 942;
        v19 = 2112;
        v20 = (id)v5;
        v21 = 2048;
        v22 = self;
        v23 = 2112;
        v24 = a3;
        v8 = " [%s] %s:%d %@(%p) avConferencePreviewError %@";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
}

- (id)clientCaptureRule
{
  return 0;
}

- (void)thermalLevelDidChange:(int)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *stateQueue;
  _QWORD v14[5];
  int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCVideoStreamSendGroup *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
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
        v19 = "-[VCVideoStreamSendGroup thermalLevelDidChange:]";
        v20 = 1024;
        v21 = 950;
        v22 = 1024;
        LODWORD(v23) = a3;
        v8 = " [%s] %s:%d thermalLevelDidChange %u";
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
      v5 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
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
        v19 = "-[VCVideoStreamSendGroup thermalLevelDidChange:]";
        v20 = 1024;
        v21 = 950;
        v22 = 2112;
        v23 = v5;
        v24 = 2048;
        v25 = self;
        v26 = 1024;
        v27 = a3;
        v8 = " [%s] %s:%d %@(%p) thermalLevelDidChange %u";
        v9 = v12;
        v10 = 54;
        goto LABEL_11;
      }
    }
  }
  stateQueue = self->super.super._stateQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__VCVideoStreamSendGroup_thermalLevelDidChange___block_invoke;
  v14[3] = &unk_1E9E52300;
  v14[4] = self;
  v15 = a3;
  dispatch_async(stateQueue, v14);
  -[VCObject reportingAgent](self, "reportingAgent");
  micro();
  reportingThermal();
}

uint64_t __48__VCVideoStreamSendGroup_thermalLevelDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "allValues"));
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "thermalLevelDidChange:", *(unsigned int *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)cameraAvailabilityDidChange:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
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
  VCVideoStreamSendGroup *v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        return;
      v15 = 136315906;
      v16 = v6;
      v17 = 2080;
      v18 = "-[VCVideoStreamSendGroup cameraAvailabilityDidChange:]";
      v19 = 1024;
      v20 = 960;
      v21 = 1024;
      LODWORD(v22) = v3;
      v9 = " [%s] %s:%d cameraAvailabilityDidChange=%d ignored";
      v10 = v7;
      v11 = 34;
LABEL_13:
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      return;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[VCVideoStreamSendGroup cameraAvailabilityDidChange:].cold.1(v6, v3, v7);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      v14 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          return;
        v15 = 136316418;
        v16 = v12;
        v17 = 2080;
        v18 = "-[VCVideoStreamSendGroup cameraAvailabilityDidChange:]";
        v19 = 1024;
        v20 = 960;
        v21 = 2112;
        v22 = v5;
        v23 = 2048;
        v24 = self;
        v25 = 1024;
        v26 = v3;
        v9 = " [%s] %s:%d %@(%p) cameraAvailabilityDidChange=%d ignored";
        v10 = v13;
        v11 = 54;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v15 = 136316418;
        v16 = v12;
        v17 = 2080;
        v18 = "-[VCVideoStreamSendGroup cameraAvailabilityDidChange:]";
        v19 = 1024;
        v20 = 960;
        v21 = 2112;
        v22 = v5;
        v23 = 2048;
        v24 = self;
        v25 = 1024;
        v26 = v3;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) cameraAvailabilityDidChange=%d ignored", (uint8_t *)&v15, 0x36u);
      }
    }
  }
}

- (void)frameRateIsBeingThrottled:(int)a3 thermalLevelDidChange:(BOOL)a4 powerLevelDidChange:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v7;
  __CFDictionary *Mutable;

  v5 = a5;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, CFSTR("VCSPUUID"), self->super.super._participantUUID);
  CFDictionaryAddValue(Mutable, CFSTR("VCSPFR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7));
  CFDictionaryAddValue(Mutable, CFSTR("VCSPTLC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6));
  CFDictionaryAddValue(Mutable, CFSTR("VCSPPLC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5));
  -[VCObject reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
  if (Mutable)
    CFRelease(Mutable);
  -[VCVideoStreamSendGroup sourceFrameRateDidChange:](self, "sourceFrameRateDidChange:", v7);
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  NSObject *stateQueue;
  _QWORD v5[6];
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke;
  v5[3] = &unk_1E9E522D8;
  v5[4] = a3;
  v5[5] = self;
  v6 = a4;
  dispatch_async(stateQueue, v5);
}

void __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _DWORD *v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[5];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 40);
  if (v3 != v2[60])
    return;
  if (objc_msgSend(v2, "dispatchedEnableRedundancy:", *(_DWORD *)(a1 + 48) != 0)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_2;
    v21[3] = &unk_1E9E52A28;
    v21[4] = v4;
    objc_msgSend(v4, "callDelegateWithBlock:", v21);
  }
  v5 = VCMemoryPool_Alloc(*(OSQueueHead **)(*(_QWORD *)(a1 + 40) + 792));
  *v5 = *(_DWORD *)(a1 + 48);
  if (objc_opt_class() == *(_QWORD *)(a1 + 40))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 136315906;
        v23 = v7;
        v24 = 2080;
        v25 = "-[VCVideoStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        v26 = 1024;
        v27 = 997;
        v28 = 1024;
        LODWORD(v29) = v9;
        v10 = " [%s] %s:%d Enqueue new redundancyPercentage=%d";
        v11 = v8;
        v12 = 34;
LABEL_15:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
    else
      v6 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v15 = *(_QWORD *)(a1 + 40);
        v16 = *(_DWORD *)(a1 + 48);
        *(_DWORD *)buf = 136316418;
        v23 = v13;
        v24 = 2080;
        v25 = "-[VCVideoStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        v26 = 1024;
        v27 = 997;
        v28 = 2112;
        v29 = v6;
        v30 = 2048;
        v31 = v15;
        v32 = 1024;
        v33 = v16;
        v10 = " [%s] %s:%d %@(%p) Enqueue new redundancyPercentage=%d";
        v11 = v14;
        v12 = 54;
        goto LABEL_15;
      }
    }
  }
  if (CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(*(_QWORD *)(a1 + 40) + 800), v5))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v20 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136316162;
          v23 = v18;
          v24 = 2080;
          v25 = "-[VCVideoStreamSendGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
          v26 = 1024;
          v27 = 1000;
          v28 = 2112;
          v29 = v17;
          v30 = 2048;
          v31 = v20;
          _os_log_error_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) CMSimpleQueueEnqueue Full", buf, 0x30u);
        }
      }
    }
    VCMemoryPool_Free(*(OSQueueHead **)(*(_QWORD *)(a1 + 40) + 792), v5);
  }
}

uint64_t __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "streamGroup:didRequestRedundancy:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 428));
}

- (void)redundancyController:(id)a3 redundancyVectorDidChange:(id *)a4
{
  NSObject *stateQueue;
  __int128 v5;
  __int128 v6;
  _QWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  $06D0163FE0D7AFE752A9F21F38483579 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4->var0)
  {
    stateQueue = self->super.super._stateQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __73__VCVideoStreamSendGroup_redundancyController_redundancyVectorDidChange___block_invoke;
    v7[3] = &unk_1E9E58610;
    v7[4] = a3;
    v7[5] = self;
    v5 = *(_OWORD *)&a4->var1[23].var0;
    v10 = *(_OWORD *)&a4->var1[15].var0;
    v11 = v5;
    v12 = a4->var1[31];
    v6 = *(_OWORD *)&a4->var1[7].var0;
    v8 = *(_OWORD *)&a4->var0;
    v9 = v6;
    dispatch_async(stateQueue, v7);
  }
}

void __73__VCVideoStreamSendGroup_redundancyController_redundancyVectorDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (v3 != *(_QWORD *)(v2 + 480) || *(_DWORD *)(v2 + 472) != 1)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return;
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v15 = *(const __CFString **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(v14 + 480);
      LODWORD(v14) = *(_DWORD *)(v14 + 472);
      *(_DWORD *)buf = 136316418;
      v32 = v12;
      v33 = 2080;
      v34 = "-[VCVideoStreamSendGroup redundancyController:redundancyVectorDidChange:]_block_invoke";
      v35 = 1024;
      v36 = 1015;
      v37 = 2112;
      v38 = v15;
      v39 = 2112;
      v40 = v16;
      v41 = 1024;
      LODWORD(v42) = v14;
      v17 = " [%s] %s:%d Ignoring redundancy controller callback for controller=%@, current controller=%@, streamGroupMode=%u";
      v18 = v13;
      v19 = 54;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return;
      v23 = *(_QWORD *)(a1 + 32);
      v22 = *(_QWORD *)(a1 + 40);
      v24 = *(_QWORD *)(v22 + 480);
      v25 = *(_DWORD *)(v22 + 472);
      *(_DWORD *)buf = 136316930;
      v32 = v20;
      v33 = 2080;
      v34 = "-[VCVideoStreamSendGroup redundancyController:redundancyVectorDidChange:]_block_invoke";
      v35 = 1024;
      v36 = 1015;
      v37 = 2112;
      v38 = v11;
      v39 = 2048;
      v40 = v22;
      v41 = 2112;
      v42 = v23;
      v43 = 2112;
      v44 = v24;
      v45 = 1024;
      v46 = v25;
      v17 = " [%s] %s:%d %@(%p) Ignoring redundancy controller callback for controller=%@, current controller=%@, streamGroupMode=%u";
      v18 = v21;
      v19 = 74;
    }
    _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    return;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = *(void **)(v2 + 168);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v8 = a1 + 48;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "stream");
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v10, "defaultStreamConfig"), "multiwayConfig"), "isOneToOne"))objc_msgSend(v10, "setFECRedundancyVector:", v8);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v6);
  }
}

- (void)vcMediaStreamDidRTPTimeOut:(id)a3
{
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
  VCVideoStreamSendGroup *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup vcMediaStreamDidRTPTimeOut:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v8 = 136316418;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCVideoStreamSendGroup vcMediaStreamDidRTPTimeOut:]";
        v12 = 1024;
        v13 = 1031;
        v14 = 2112;
        v15 = v5;
        v16 = 2048;
        v17 = self;
        v18 = 2048;
        v19 = a3;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream:%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)vcMediaStreamDidRTCPTimeOut:(id)a3
{
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
  VCVideoStreamSendGroup *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup vcMediaStreamDidRTCPTimeOut:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v8 = 136316418;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCVideoStreamSendGroup vcMediaStreamDidRTCPTimeOut:]";
        v12 = 1024;
        v13 = 1035;
        v14 = 2112;
        v15 = v5;
        v16 = 2048;
        v17 = self;
        v18 = 2048;
        v19 = a3;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream:%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)vcMediaStreamDidDecryptionTimeOut:(id)a3
{
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
  VCVideoStreamSendGroup *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamSendGroup vcMediaStreamDidDecryptionTimeOut:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v8 = 136316418;
        v9 = v6;
        v10 = 2080;
        v11 = "-[VCVideoStreamSendGroup vcMediaStreamDidDecryptionTimeOut:]";
        v12 = 1024;
        v13 = 1039;
        v14 = 2112;
        v15 = v5;
        v16 = 2048;
        v17 = self;
        v18 = 2048;
        v19 = a3;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) stream:%p", (uint8_t *)&v8, 0x3Au);
      }
    }
  }
}

- (void)updateSendSampleRTPTimestamp:(unsigned int)a3 sampleRate:(double)a4 systemTime:(double)a5
{
  VCMediaStreamSendGroup_UpdateSendSampleRTPTimestamp((uint64_t)self, a3, a4, a5);
}

- (void)computeMaxScreenCaptureSize
{
  unint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  CGFloat height;
  CGFloat width;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  NSObject *v23;
  CGFloat v24;
  CGFloat v25;
  NSArray *obj;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  CGFloat v36;
  __int16 v37;
  VCVideoStreamSendGroup *v38;
  __int16 v39;
  CGFloat v40;
  __int16 v41;
  CGFloat v42;
  _BYTE v43[128];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = self->super.super._mediaStreamInfoArray;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
  if (v28)
  {
    v3 = 0;
    v27 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v50 != v27)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v6 = (void *)objc_msgSend(v5, "streamConfigs");
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v45 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
              if (objc_msgSend(v11, "videoResolution") == 27)
              {
                v12 = objc_msgSend(v11, "customWidth");
                v13 = objc_msgSend(v11, "customHeight") * v12;
                if (v13 > v3)
                {
                  self->_maxScreenCaptureSize.width = (double)(unint64_t)objc_msgSend(v11, "customWidth");
                  self->_maxScreenCaptureSize.height = (double)(unint64_t)objc_msgSend(v11, "customHeight");
                  v3 = v13;
                }
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v43, 16);
          }
          while (v8);
        }
      }
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
    }
    while (v28);
  }
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        width = self->_maxScreenCaptureSize.width;
        height = self->_maxScreenCaptureSize.height;
        *(_DWORD *)buf = 136316162;
        v30 = v15;
        v31 = 2080;
        v32 = "-[VCVideoStreamSendGroup computeMaxScreenCaptureSize]";
        v33 = 1024;
        v34 = 1065;
        v35 = 2048;
        v36 = width;
        v37 = 2048;
        v38 = *(VCVideoStreamSendGroup **)&height;
        v19 = " [%s] %s:%d Max Screen capture size: width = %f, height = %f";
        v20 = v16;
        v21 = 48;
LABEL_28:
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v25 = self->_maxScreenCaptureSize.width;
        v24 = self->_maxScreenCaptureSize.height;
        *(_DWORD *)buf = 136316674;
        v30 = v22;
        v31 = 2080;
        v32 = "-[VCVideoStreamSendGroup computeMaxScreenCaptureSize]";
        v33 = 1024;
        v34 = 1065;
        v35 = 2112;
        v36 = *(double *)&v14;
        v37 = 2048;
        v38 = self;
        v39 = 2048;
        v40 = v25;
        v41 = 2048;
        v42 = v24;
        v19 = " [%s] %s:%d %@(%p) Max Screen capture size: width = %f, height = %f";
        v20 = v23;
        v21 = 68;
        goto LABEL_28;
      }
    }
  }
}

- (unint64_t)maxStreamFrameRate
{
  NSArray *mediaStreamInfoArray;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  VCVideoStreamSendGroup *v34;
  __int16 v35;
  int v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  mediaStreamInfoArray = self->super.super._mediaStreamInfoArray;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v44 != v6)
          objc_enumerationMutation(mediaStreamInfoArray);
        v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v9 = (void *)objc_msgSend(v8, "streamConfigs");
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v39 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
              if (objc_msgSend(v14, "framerate") > v5)
                v5 = objc_msgSend(v14, "framerate");
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
          }
          while (v11);
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v26 = v16;
        v27 = 2080;
        v28 = "-[VCVideoStreamSendGroup maxStreamFrameRate]";
        v29 = 1024;
        v30 = 1077;
        v31 = 1024;
        LODWORD(v32) = v5;
        v18 = " [%s] %s:%d Max Screen capture frame rate: = %d";
        v19 = v17;
        v20 = 34;
LABEL_29:
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v15 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v26 = v21;
        v27 = 2080;
        v28 = "-[VCVideoStreamSendGroup maxStreamFrameRate]";
        v29 = 1024;
        v30 = 1077;
        v31 = 2112;
        v32 = v15;
        v33 = 2048;
        v34 = self;
        v35 = 1024;
        v36 = v5;
        v18 = " [%s] %s:%d %@(%p) Max Screen capture frame rate: = %d";
        v19 = v22;
        v20 = 54;
        goto LABEL_29;
      }
    }
  }
  return v5;
}

- (void)collectAndLogChannelMetrics:(id *)a3
{
  NSArray *mediaStreams;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  NSObject *v14;
  $630EEFBF570FF8F3C5E9582E2A557BD5 *v15;
  int v16;
  int v17;
  unsigned int v18;
  unsigned int v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  uint64_t v23;
  NSObject *v24;
  char *v25;
  int v26;
  int v27;
  unsigned int totalNumFramesReceived;
  unsigned int totalNumFramesProcessed;
  __int128 v30;
  NSArray *v31;
  char *v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _BYTE v42[10];
  char *v43;
  uint64_t v44;
  _BYTE v45[6];
  _BYTE v46[6];
  uint64_t v47;
  __int16 v48;
  unsigned int v49;
  __int16 v50;
  unsigned int v51;
  _OWORD v52[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  _BYTE v57[128];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v59;
    *(_QWORD *)&v7 = 136317442;
    v30 = v7;
    v31 = mediaStreams;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v59 != v9)
          objc_enumerationMutation(mediaStreams);
        v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        if (objc_msgSend(v11, "state", v30) == 2)
        {
          v56 = 0;
          v54 = 0u;
          v55 = 0u;
          v53 = 0u;
          memset(v52, 0, sizeof(v52));
          objc_msgSend(v11, "collectTxChannelMetrics:", v52);
          VCMediaChannelMetrics_Sum((uint64_t)a3, (uint64_t)v52);
          if ((VCVideoStreamSendGroup *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v23 = VRTraceErrorLogLevelToCSTR();
              v24 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v25 = FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
                v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
                v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "repairedStreamID");
                totalNumFramesReceived = self->_totalNumFramesReceived;
                totalNumFramesProcessed = self->_totalNumFramesProcessed;
                *(_DWORD *)buf = v30;
                v34 = v23;
                v35 = 2080;
                v36 = "-[VCVideoStreamSendGroup collectAndLogChannelMetrics:]";
                v37 = 1024;
                v38 = 1087;
                v39 = 2080;
                v40 = v25;
                v41 = 1024;
                *(_DWORD *)v42 = v26;
                mediaStreams = v31;
                *(_WORD *)&v42[4] = 1024;
                *(_DWORD *)&v42[6] = v27;
                LOWORD(v43) = 1024;
                *(_DWORD *)((char *)&v43 + 2) = v52[0];
                HIWORD(v43) = 2048;
                v44 = v53;
                *(_WORD *)v45 = 1024;
                *(_DWORD *)&v45[2] = totalNumFramesReceived;
                *(_WORD *)v46 = 1024;
                *(_DWORD *)&v46[2] = totalNumFramesProcessed;
                v20 = v24;
                v21 = " [%s] %s:%d Health Monitor for Video Stream Send GroupID=%s StreamID[main:%u repair:%u] Video[%ukb"
                      "ps %4.1ffps] Frames Received=%u Processed=%u";
                v22 = 78;
                goto LABEL_16;
              }
            }
          }
          else
          {
            v12 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v12 = (const __CFString *)-[VCVideoStreamSendGroup performSelector:](self, "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v13 = VRTraceErrorLogLevelToCSTR();
              v14 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v32 = FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
                v15 = a3;
                v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
                v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "repairedStreamID");
                v18 = self->_totalNumFramesReceived;
                v19 = self->_totalNumFramesProcessed;
                *(_DWORD *)buf = 136317954;
                v34 = v13;
                v35 = 2080;
                v36 = "-[VCVideoStreamSendGroup collectAndLogChannelMetrics:]";
                v37 = 1024;
                v38 = 1087;
                v39 = 2112;
                v40 = (void *)v12;
                v41 = 2048;
                *(_QWORD *)v42 = self;
                *(_WORD *)&v42[8] = 2080;
                v43 = v32;
                LOWORD(v44) = 1024;
                *(_DWORD *)((char *)&v44 + 2) = v16;
                a3 = v15;
                mediaStreams = v31;
                HIWORD(v44) = 1024;
                *(_DWORD *)v45 = v17;
                *(_WORD *)&v45[4] = 1024;
                *(_DWORD *)v46 = v52[0];
                *(_WORD *)&v46[4] = 2048;
                v47 = v53;
                v48 = 1024;
                v49 = v18;
                v50 = 1024;
                v51 = v19;
                v20 = v14;
                v21 = " [%s] %s:%d %@(%p) Health Monitor for Video Stream Send GroupID=%s StreamID[main:%u repair:%u] Vid"
                      "eo[%ukbps %4.1ffps] Frames Received=%u Processed=%u";
                v22 = 98;
LABEL_16:
                _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
                continue;
              }
            }
          }
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v58, v57, 16);
    }
    while (v8);
  }
}

- (int)captureFrameRate
{
  return self->_captureFrameRate;
}

- (unsigned)mediaQueueSize
{
  return self->_mediaQueueSize;
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate payload types set", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate pending uplink streams dictionary", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup the stream controller", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to allocate temporal streamIDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)initWithConfig:.cold.5()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to setup redundancy settings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRedundancySettings
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to create videoRedundancyChangeQueue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setupRedundancyControllerForMode:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d %@");
  OUTLINED_FUNCTION_3();
}

- (void)uplinkVideoStreamControllerForMode:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Tried to create uplink video stream controller for mode but VCMediaStreamSendGroupConfig is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)dispatchedEnableRedundancy:.cold.1()
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

- (void)cameraAvailabilityDidChange:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCVideoStreamSendGroup cameraAvailabilityDidChange:]";
  v7 = 1024;
  v8 = 960;
  v9 = 1024;
  v10 = a2 & 1;
  _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d cameraAvailabilityDidChange=%d ignored", (uint8_t *)&v3, 0x22u);
  OUTLINED_FUNCTION_3();
}

void __77__VCVideoStreamSendGroup_redundancyController_redundancyPercentageDidChange___block_invoke_cold_1()
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

- (void)vcMediaStreamDidRTPTimeOut:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoStreamSendGroup vcMediaStreamDidRTPTimeOut:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stream:%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamSendGroup vcMediaStreamDidRTPTimeOut:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)vcMediaStreamDidRTCPTimeOut:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoStreamSendGroup vcMediaStreamDidRTCPTimeOut:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stream:%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamSendGroup vcMediaStreamDidRTCPTimeOut:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)vcMediaStreamDidDecryptionTimeOut:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  const void *v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCVideoStreamSendGroup vcMediaStreamDidDecryptionTimeOut:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d stream:%p", v2, *(const char **)v3, (unint64_t)"-[VCVideoStreamSendGroup vcMediaStreamDidDecryptionTimeOut:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

@end
