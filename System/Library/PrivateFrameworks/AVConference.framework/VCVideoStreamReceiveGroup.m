@implementation VCVideoStreamReceiveGroup

- (VCVideoStreamReceiveGroup)initWithConfig:(id)a3
{
  VCVideoStreamReceiveGroup *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  VCVideoStreamReceiveGroup *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)VCVideoStreamReceiveGroup;
  v3 = -[VCMediaStreamReceiveGroup initWithConfig:](&v13, sel_initWithConfig_, a3);
  if (v3)
  {
    if (!-[VCDefaults forceFECRepairStream](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFECRepairStream"))
    {
LABEL_16:
      v3->_shouldConvertSourceRTPTimestamp = 1;
      -[VCVideoStreamReceiveGroup setIsRemoteMediaStalled:](v3, "setIsRemoteMediaStalled:", v3->_isVideoDegraded);
      -[VCVideoStreamReceiveGroup setupVideoPriority](v3, "setupVideoPriority");
      -[VCVideoStreamReceiveGroup setupExternalRenderLatency](v3, "setupExternalRenderLatency");
      v3->_poorConnectionPercentageABCReportingThreshold = objc_msgSend(+[GKSConnectivitySettings readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "readStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-reporting-poor-connection-percentage-symptom-threshold"), 0, &unk_1E9EF63F8, 0), "intValue");
      return v3;
    }
    if ((VCVideoStreamReceiveGroup *)objc_opt_class() == v3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_15;
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136315650;
      v15 = v5;
      v16 = 2080;
      v17 = "-[VCVideoStreamReceiveGroup initWithConfig:]";
      v18 = 1024;
      v19 = 84;
      v7 = " [%s] %s:%d _isRedundancyRequested set to YES by forceFECRepairStream";
      v8 = v6;
      v9 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](v3, "performSelector:", sel_logPrefix);
      else
        v4 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_15;
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      *(_DWORD *)buf = 136316162;
      v15 = v10;
      v16 = 2080;
      v17 = "-[VCVideoStreamReceiveGroup initWithConfig:]";
      v18 = 1024;
      v19 = 84;
      v20 = 2112;
      v21 = v4;
      v22 = 2048;
      v23 = v3;
      v7 = " [%s] %s:%d %@(%p) _isRedundancyRequested set to YES by forceFECRepairStream";
      v8 = v11;
      v9 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, buf, v9);
LABEL_15:
    v3->_isRedundancyRequested = 1;
    goto LABEL_16;
  }
  return v3;
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
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  VCVideoStreamReceiveGroup *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v13 = v4;
        v14 = 2080;
        v15 = "-[VCVideoStreamReceiveGroup dealloc]";
        v16 = 1024;
        v17 = 104;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v9;
        v14 = 2080;
        v15 = "-[VCVideoStreamReceiveGroup dealloc]";
        v16 = 1024;
        v17 = 104;
        v18 = 2112;
        v19 = v3;
        v20 = 2048;
        v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        v8 = 48;
        goto LABEL_11;
      }
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)VCVideoStreamReceiveGroup;
  -[VCMediaStreamReceiveGroup dealloc](&v11, sel_dealloc);
}

- (void)setupExternalRenderLatency
{
  const __CFString *v3;
  double DoubleValueForKey;

  -[VCMediaStreamGroup streamGroupID](self, "streamGroupID");
  v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%s"), CFSTR("forceExternalRenderLatency"), FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID")));
  DoubleValueForKey = VCDefaults_GetDoubleValueForKey(CFSTR("forceExternalRenderLatency"), 0.0);
  -[VCVideoStreamReceiveGroup setExternalRenderLatency:](self, "setExternalRenderLatency:", VCDefaults_GetDoubleValueForKey(v3, DoubleValueForKey));
}

- (void)setExternalRenderLatency:(double)a3
{
  double v5;
  id v6;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  double v17;
  objc_super v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  VCVideoStreamReceiveGroup *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[VCMediaStreamGroup externalRenderLatency](self, "externalRenderLatency");
  if (v5 != a3)
  {
    v18.receiver = self;
    v18.super_class = (Class)VCVideoStreamReceiveGroup;
    -[VCMediaStreamGroup setExternalRenderLatency:](&v18, sel_setExternalRenderLatency_, a3);
    v6 = -[NSArray firstObject](self->super.super._mediaStreams, "firstObject");
    if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      -[VCMediaStreamGroup externalRenderLatency](self, "externalRenderLatency");
      *(_DWORD *)buf = 136315906;
      v20 = v8;
      v21 = 2080;
      v22 = "-[VCVideoStreamReceiveGroup setExternalRenderLatency:]";
      v23 = 1024;
      v24 = 136;
      v25 = 2048;
      v26 = v10;
      v11 = " [%s] %s:%d Display external output latency=%f";
      v12 = v9;
      v13 = 38;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v7 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v7 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      -[VCMediaStreamGroup externalRenderLatency](self, "externalRenderLatency");
      *(_DWORD *)buf = 136316418;
      v20 = v14;
      v21 = 2080;
      v22 = "-[VCVideoStreamReceiveGroup setExternalRenderLatency:]";
      v23 = 1024;
      v24 = 136;
      v25 = 2112;
      v26 = v7;
      v27 = 2048;
      v28 = self;
      v29 = 2048;
      v30 = v16;
      v11 = " [%s] %s:%d %@(%p) Display external output latency=%f";
      v12 = v15;
      v13 = 58;
    }
    _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_13:
    -[VCMediaStreamGroup externalRenderLatency](self, "externalRenderLatency");
    VCVideoStream_SetExternalOutputVideoLatency((uint64_t)v6, v17);
  }
}

- (void)resetDidReceiveFirstFrame
{
  NSArray *mediaStreamInfoArray;
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
  mediaStreamInfoArray = self->super.super._mediaStreamInfoArray;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(mediaStreamInfoArray);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "stream"), "setDidReceiveFirstFrame:", 0);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreamInfoArray, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
    }
    while (v4);
  }
}

- (void)resetPerfTimers
{
  double v3;

  v3 = micro();
  self->super.super._creationTime = v3;
  self->super.super._firstMediaPacketTime = v3;
  VCPerfTimingUtilsSetStartForKeyOnceWithTime(self->super.super._perfTimers, 16, self->super.super._creationTime);
  self->_haveReportedPerfTimers = 0;
}

- (id)setupRedundancyController
{
  VCRedundancyControllerVideo *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  VCVideoStreamReceiveGroup *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (self->_videoRedundancyController)
    return 0;
  if (-[VCMediaStreamGroup statisticsCollector](self, "statisticsCollector"))
  {
    v3 = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, 7, -[VCMediaStreamGroup statisticsCollector](self, "statisticsCollector"), 400);
    self->_videoRedundancyController = v3;
    if (v3)
    {
      -[VCRedundancyControllerVideo setStatisticsID:](v3, "setStatisticsID:", self->super.super._idsParticipantID);
      if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return 0;
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return 0;
        v17 = 136315650;
        v18 = v5;
        v19 = 2080;
        v20 = "-[VCVideoStreamReceiveGroup setupRedundancyController]";
        v21 = 1024;
        v22 = 183;
        v7 = " [%s] %s:%d Redundancy controller is created";
        v8 = v6;
        v9 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v4 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v4 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          return 0;
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          return 0;
        v17 = 136316162;
        v18 = v10;
        v19 = 2080;
        v20 = "-[VCVideoStreamReceiveGroup setupRedundancyController]";
        v21 = 1024;
        v22 = 183;
        v23 = 2112;
        v24 = v4;
        v25 = 2048;
        v26 = self;
        v7 = " [%s] %s:%d %@(%p) Redundancy controller is created";
        v8 = v11;
        v9 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v17, v9);
      return 0;
    }
    v13 = CFSTR("Failed to create video redundancy controller");
  }
  else
  {
    v13 = CFSTR("Need statistics collector to create redundancy controller");
  }
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCVideoStreamReceiveGroup setupRedundancyController].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v17 = 136316418;
        v18 = v15;
        v19 = 2080;
        v20 = "-[VCVideoStreamReceiveGroup setupRedundancyController]";
        v21 = 1024;
        v22 = 186;
        v23 = 2112;
        v24 = v14;
        v25 = 2048;
        v26 = self;
        v27 = 2112;
        v28 = v13;
        _os_log_error_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) %@", (uint8_t *)&v17, 0x3Au);
      }
    }
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB35C8], "AVConferenceServiceError:detailCode:description:", 32000, 0, v13);
}

- (BOOL)isVisible
{
  return self->_visibilityIndex == 0;
}

- (BOOL)isVideoExpected
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  unsigned int v7;
  _BOOL4 isRemoteMediaStalled;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  unsigned int v15;
  _BOOL4 v16;
  unsigned int v17;
  _BOOL4 v18;
  _BYTE v20[24];
  __int128 v21;
  VCVideoStreamReceiveGroup *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      v6 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          v7 = -[VCMediaStreamGroup state](self, "state");
          isRemoteMediaStalled = self->_isRemoteMediaStalled;
          *(_DWORD *)v20 = 136316418;
          *(_QWORD *)&v20[4] = v4;
          *(_WORD *)&v20[12] = 2080;
          *(_QWORD *)&v20[14] = "-[VCVideoStreamReceiveGroup isVideoExpected]";
          *(_WORD *)&v20[22] = 1024;
          LODWORD(v21) = 197;
          WORD2(v21) = 1024;
          *(_DWORD *)((char *)&v21 + 6) = v7;
          WORD5(v21) = 1024;
          HIDWORD(v21) = isRemoteMediaStalled;
          LOWORD(v22) = 1024;
          *(_DWORD *)((char *)&v22 + 2) = -[VCVideoStreamReceiveGroup isVisible](self, "isVisible");
          v9 = " [%s] %s:%d state:%d remoteVideoPaused:%d isVisible:%d";
          v10 = v5;
          v11 = 46;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v20, v11);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        -[VCVideoStreamReceiveGroup isVideoExpected].cold.1(v4, (unsigned __int8 *)self, v5);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      return -[VCMediaStreamGroup state](self, "state", *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, v22, v23, v24, v25) == 1
          && !self->_isRemoteMediaStalled
          && -[VCVideoStreamReceiveGroup isVisible](self, "isVisible");
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    v14 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = -[VCMediaStreamGroup state](self, "state");
        v16 = self->_isRemoteMediaStalled;
        *(_DWORD *)v20 = 136316930;
        *(_QWORD *)&v20[4] = v12;
        *(_WORD *)&v20[12] = 2080;
        *(_QWORD *)&v20[14] = "-[VCVideoStreamReceiveGroup isVideoExpected]";
        *(_WORD *)&v20[22] = 1024;
        LODWORD(v21) = 197;
        WORD2(v21) = 2112;
        *(_QWORD *)((char *)&v21 + 6) = v3;
        HIWORD(v21) = 2048;
        v22 = self;
        LOWORD(v23) = 1024;
        *(_DWORD *)((char *)&v23 + 2) = v15;
        HIWORD(v23) = 1024;
        LODWORD(v24) = v16;
        WORD2(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 6) = -[VCVideoStreamReceiveGroup isVisible](self, "isVisible");
        v9 = " [%s] %s:%d %@(%p) state:%d remoteVideoPaused:%d isVisible:%d";
        v10 = v13;
        v11 = 66;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v17 = -[VCMediaStreamGroup state](self, "state");
      v18 = self->_isRemoteMediaStalled;
      *(_DWORD *)v20 = 136316930;
      *(_QWORD *)&v20[4] = v12;
      *(_WORD *)&v20[12] = 2080;
      *(_QWORD *)&v20[14] = "-[VCVideoStreamReceiveGroup isVideoExpected]";
      *(_WORD *)&v20[22] = 1024;
      LODWORD(v21) = 197;
      WORD2(v21) = 2112;
      *(_QWORD *)((char *)&v21 + 6) = v3;
      HIWORD(v21) = 2048;
      v22 = self;
      LOWORD(v23) = 1024;
      *(_DWORD *)((char *)&v23 + 2) = v17;
      HIWORD(v23) = 1024;
      LODWORD(v24) = v18;
      WORD2(v24) = 1024;
      *(_DWORD *)((char *)&v24 + 6) = -[VCVideoStreamReceiveGroup isVisible](self, "isVisible");
      _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) state:%d remoteVideoPaused:%d isVisible:%d", v20, 0x42u);
    }
  }
  return -[VCMediaStreamGroup state](self, "state", *(_OWORD *)v20, *(_QWORD *)&v20[16], v21, v22, v23, v24, v25) == 1
      && !self->_isRemoteMediaStalled
      && -[VCVideoStreamReceiveGroup isVisible](self, "isVisible");
}

- (void)setShouldEnableFaceZoom:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *mediaStreams;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(mediaStreams);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setShouldEnableFaceZoom:", v3);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v6);
  }
}

- (void)updateShouldEnableFaceZoom
{
  const __CFString *v3;
  VCVideoStreamReceiveGroup *v4;
  uint64_t v5;
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
  const __CFString *v20;
  __int16 v21;
  VCVideoStreamReceiveGroup *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (-[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1667329381
    || -[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1667329399)
  {
    if (-[VCDefaults forceDisableFaceZoom](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableFaceZoom"))
    {
      if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v6 = VRTraceErrorLogLevelToCSTR();
          v7 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v13 = 136315650;
            v14 = v6;
            v15 = 2080;
            v16 = "-[VCVideoStreamReceiveGroup updateShouldEnableFaceZoom]";
            v17 = 1024;
            v18 = 212;
            v8 = " [%s] %s:%d FaceZoom is disabled.";
            v9 = v7;
            v10 = 28;
LABEL_19:
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, v10);
          }
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v3 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v3 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v13 = 136316162;
            v14 = v11;
            v15 = 2080;
            v16 = "-[VCVideoStreamReceiveGroup updateShouldEnableFaceZoom]";
            v17 = 1024;
            v18 = 212;
            v19 = 2112;
            v20 = v3;
            v21 = 2048;
            v22 = self;
            v8 = " [%s] %s:%d %@(%p) FaceZoom is disabled.";
            v9 = v12;
            v10 = 48;
            goto LABEL_19;
          }
        }
      }
    }
    else
    {
      if (self->_remoteVideoPaused || !-[VCVideoStreamReceiveGroup isVisible](self, "isVisible"))
      {
        v4 = self;
        v5 = 0;
      }
      else
      {
        v4 = self;
        v5 = 1;
      }
      -[VCVideoStreamReceiveGroup setShouldEnableFaceZoom:](v4, "setShouldEnableFaceZoom:", v5);
    }
  }
}

- (BOOL)setSyncSource:(id)a3
{
  NSObject *stateQueue;
  char v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  stateQueue = self->super.super._stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__VCVideoStreamReceiveGroup_setSyncSource___block_invoke;
  v6[3] = &unk_1E9E52988;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = self;
  dispatch_sync(stateQueue, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __43__VCVideoStreamReceiveGroup_setSyncSource___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "state"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __43__VCVideoStreamReceiveGroup_setSyncSource___block_invoke_cold_1(v9, v2, v10);
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)objc_msgSend(*v2, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v13 = *v2;
          *(_DWORD *)buf = 136316418;
          v20 = v11;
          v21 = 2080;
          v22 = "-[VCVideoStreamReceiveGroup setSyncSource:]_block_invoke";
          v23 = 1024;
          v24 = 225;
          v25 = 2112;
          v26 = v8;
          v27 = 2048;
          v28 = v13;
          v29 = 1024;
          v30 = objc_msgSend(v13, "state");
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Stream group must be stopped when setting sync source. state=%d", buf, 0x36u);
        }
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 592) = *(_QWORD *)(a1 + 40) == 0;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "streamConfigs"), "firstObject"), "setSyncSource:", *(_QWORD *)(a1 + 40));
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      }
      while (v5);
    }
  }
}

- (void)setVideoStreamDelegate:(id)a3 delegateFunctions:(const tagVCVideoStreamDelegateRealtimeInstanceVTable *)a4
{
  void *remoteScreenAttributesDidChange;
  NSObject *stateQueue;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD block[7];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  VCVideoStreamReceiveGroup *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    remoteScreenAttributesDidChange = a4->remoteScreenAttributesDidChange;
    stateQueue = self->super.super._stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__VCVideoStreamReceiveGroup_setVideoStreamDelegate_delegateFunctions___block_invoke;
    block[3] = &unk_1E9E53820;
    block[4] = self;
    block[5] = a3;
    block[6] = remoteScreenAttributesDidChange;
    dispatch_async(stateQueue, block);
    return;
  }
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v17 = v8;
        v18 = 2080;
        v19 = "-[VCVideoStreamReceiveGroup setVideoStreamDelegate:delegateFunctions:]";
        v20 = 1024;
        v21 = 241;
        v10 = " [%s] %s:%d videoStreamDelegateFunctions is NULL";
        v11 = v9;
        v12 = 28;
LABEL_14:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v17 = v13;
        v18 = 2080;
        v19 = "-[VCVideoStreamReceiveGroup setVideoStreamDelegate:delegateFunctions:]";
        v20 = 1024;
        v21 = 241;
        v22 = 2112;
        v23 = v7;
        v24 = 2048;
        v25 = self;
        v10 = " [%s] %s:%d %@(%p) videoStreamDelegateFunctions is NULL";
        v11 = v14;
        v12 = 48;
        goto LABEL_14;
      }
    }
  }
}

uint64_t __70__VCVideoStreamReceiveGroup_setVideoStreamDelegate_delegateFunctions___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  __int128 v21;
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
  __CFString *v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v38;
    *(_QWORD *)&v4 = 136316162;
    v21 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v7);
        if (objc_msgSend(v8, "isOneToOneSupported", v21))
        {
          v9 = (__CFString *)objc_msgSend(v8, "stream");
          if (objc_opt_class() == *(_QWORD *)(a1 + 32))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v18 = VRTraceErrorLogLevelToCSTR();
              v19 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v20 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = v21;
                v23 = v18;
                v24 = 2080;
                v25 = "-[VCVideoStreamReceiveGroup setVideoStreamDelegate:delegateFunctions:]_block_invoke";
                v26 = 1024;
                v27 = 249;
                v28 = 2048;
                v29 = v9;
                v30 = 2048;
                v31 = v20;
                v15 = v19;
                v16 = " [%s] %s:%d stream=%p, videoStreamDelegate=%p";
                v17 = 48;
LABEL_16:
                _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
              }
            }
          }
          else
          {
            v10 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v10 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v11 = VRTraceErrorLogLevelToCSTR();
              v12 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v13 = *(_QWORD *)(a1 + 32);
                v14 = *(_QWORD *)(a1 + 40);
                *(_DWORD *)buf = 136316674;
                v23 = v11;
                v24 = 2080;
                v25 = "-[VCVideoStreamReceiveGroup setVideoStreamDelegate:delegateFunctions:]_block_invoke";
                v26 = 1024;
                v27 = 249;
                v28 = 2112;
                v29 = v10;
                v30 = 2048;
                v31 = v13;
                v32 = 2048;
                v33 = v9;
                v34 = 2048;
                v35 = v14;
                v15 = v12;
                v16 = " [%s] %s:%d %@(%p) stream=%p, videoStreamDelegate=%p";
                v17 = 68;
                goto LABEL_16;
              }
            }
          }
          -[__CFString setVideoStreamDelegate:delegateFunctions:](v9, "setVideoStreamDelegate:delegateFunctions:", *(_QWORD *)(a1 + 40), a1 + 48);
        }
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (id)willStart
{
  self->_startTime = micro();
  self->_poorConnectionTotalLength = 0.0;
  -[VCVideoStreamReceiveGroup resetDidReceiveFirstFrame](self, "resetDidReceiveFirstFrame");
  -[VCVideoStreamReceiveGroup resetPerfTimers](self, "resetPerfTimers");
  return -[VCVideoStreamReceiveGroup setupRedundancyController](self, "setupRedundancyController");
}

- (void)didStop
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCVideoStreamReceiveGroup resetDidReceiveFirstFrame](self, "resetDidReceiveFirstFrame");
  v3.receiver = self;
  v3.super_class = (Class)VCVideoStreamReceiveGroup;
  -[VCMediaStreamGroup didStop](&v3, sel_didStop);
}

- (void)setupVideoPriority
{
  self->_lastVideoPriority = 0;
  self->_videoQuality = 0;
}

- (void)updateVideoPriority:(unsigned __int8)a3
{
  uint64_t v5;
  NSObject *delegateQueue;
  _QWORD v7[6];
  unsigned __int8 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_videoQuality != a3)
  {
    self->_videoQuality = a3;
    v5 = MEMORY[0x1DF086F1C](&self->super.super._delegate, a2);
    if (v5)
    {
      delegateQueue = self->super.super._delegateQueue;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __49__VCVideoStreamReceiveGroup_updateVideoPriority___block_invoke;
      v7[3] = &unk_1E9E52210;
      v7[4] = v5;
      v7[5] = self;
      v8 = a3;
      dispatch_async(delegateQueue, v7);
    }
  }
}

void __49__VCVideoStreamReceiveGroup_updateVideoPriority___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "streamGroup:didChangeMediaPriority:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)setOptedInStreamID:(id)a3
{
  if (self->super._optedInStreamID != a3)
  {

    self->_previousOptedInStreamID = (NSNumber *)-[NSNumber copy](self->super._optedInStreamID, "copy");
    self->super._optedInStreamID = (NSNumber *)a3;
  }
}

- (void)setActiveStreamIDs:(id)a3
{
  NSObject *stateQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = a3;
  block[5] = self;
  dispatch_async(stateQueue, block);
}

void __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  char v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t *v26;
  const __CFString *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, void *, void *);
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, void *, void *, _BYTE *);
  void *v39;
  uint64_t v40;
  _BYTE buf[24];
  __int128 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v50 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 184), "objectForKeyedSubscript:", v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v49, v48, 16);
    }
    while (v5);
  }
  v10 = objc_msgSend(v2, "count");
  v11 = *(_BYTE **)(a1 + 40);
  if (!v10)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_25;
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v42) = 326;
      v16 = " [%s] %s:%d Opted out of all video streams!!!";
      v17 = v15;
      v18 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_25;
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      v21 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v42) = 326;
      WORD2(v42) = 2112;
      *(_QWORD *)((char *)&v42 + 6) = v13;
      HIWORD(v42) = 2048;
      v43 = v21;
      v16 = " [%s] %s:%d %@(%p) Opted out of all video streams!!!";
      v17 = v20;
      v18 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_25:
    if (!objc_msgSend(*(id *)(a1 + 40), "isVideoExpected"))
      goto LABEL_27;
    v22 = *(_BYTE **)(a1 + 40);
    if (v22[521])
      goto LABEL_27;
    v12 = 1;
    objc_msgSend(v22, "setMediaSuspended:forStreamToken:", 1, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken")));
    goto LABEL_13;
  }
  if (!v11[521])
    goto LABEL_27;
  objc_msgSend(v11, "setMediaSuspended:forStreamToken:", 0, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "streamToken")));
  v12 = 0;
LABEL_13:
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 521) = v12;
LABEL_27:
  v23 = objc_msgSend(v2, "count");
  v24 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v24 + 432))
    v25 = v23 == 2;
  else
    v25 = 1;
  if (v25)
  {
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_27;
    v39 = &unk_1E9E573F0;
    v40 = v24;
    v26 = &v36;
LABEL_35:
    objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v26, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, *(_OWORD *)buf, *(_QWORD *)&buf[16], v42, v43);
    goto LABEL_36;
  }
  if (objc_msgSend(v2, "count") == 1)
  {
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_29;
    v34 = &unk_1E9E573F0;
    v35 = *(_QWORD *)(a1 + 40);
    v26 = &v31;
    goto LABEL_35;
  }
  if (!objc_msgSend(v2, "count"))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 497) = 0;
    objc_msgSend(*(id *)(a1 + 40), "setOptedInStreamID:", 0);
  }
LABEL_36:
  if ((unint64_t)objc_msgSend(v2, "count") >= 3)
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 40))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_cold_1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v27 = (const __CFString *)objc_msgSend(*(id *)(a1 + 40), "performSelector:", sel_logPrefix);
      else
        v27 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v30 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 136316674;
          *(_QWORD *)&buf[4] = v28;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v42) = 375;
          WORD2(v42) = 2112;
          *(_QWORD *)((char *)&v42 + 6) = v27;
          HIWORD(v42) = 2048;
          v43 = v30;
          v44 = 1024;
          v45 = 2;
          v46 = 2112;
          v47 = v2;
          _os_log_error_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Trying to opt into more than %d video streams! Streams:%@", buf, 0x40u);
        }
      }
    }
  }
}

uint64_t __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_27(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v8;
  uint64_t result;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  _BYTE v28[24];
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v8 + 432) && *(_QWORD *)(v8 + 504) && objc_msgSend(a2, "isEqualToNumber:"))
  {
    if (objc_opt_class() == *(_QWORD *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v28 = 136315906;
          *(_QWORD *)&v28[4] = v20;
          *(_WORD *)&v28[12] = 2080;
          *(_QWORD *)&v28[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
          *(_WORD *)&v28[22] = 1024;
          LODWORD(v29) = 347;
          WORD2(v29) = 2112;
          *(_QWORD *)((char *)&v29 + 6) = a2;
          v22 = " [%s] %s:%d Opted out and back in to the same video streamID %@, large sequence number gaps may occur";
          v23 = v21;
          v24 = 38;
LABEL_28:
          _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, v22, v28, v24);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v11 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v11 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v27 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)v28 = 136316418;
          *(_QWORD *)&v28[4] = v25;
          *(_WORD *)&v28[12] = 2080;
          *(_QWORD *)&v28[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
          *(_WORD *)&v28[22] = 1024;
          LODWORD(v29) = 347;
          WORD2(v29) = 2112;
          *(_QWORD *)((char *)&v29 + 6) = v11;
          HIWORD(v29) = 2048;
          v30 = v27;
          LOWORD(v31) = 2112;
          *(_QWORD *)((char *)&v31 + 2) = a2;
          v22 = " [%s] %s:%d %@(%p) Opted out and back in to the same video streamID %@, large sequence number gaps may occur";
          v23 = v26;
          v24 = 58;
          goto LABEL_28;
        }
      }
    }
  }
  result = objc_msgSend(a2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432), *(_OWORD *)v28, *(_QWORD *)&v28[16], v29, v30, v31);
  if ((result & 1) != 0)
    return result;
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_19;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)v28 = 136315906;
    *(_QWORD *)&v28[4] = v12;
    *(_WORD *)&v28[12] = 2080;
    *(_QWORD *)&v28[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
    *(_WORD *)&v28[22] = 1024;
    LODWORD(v29) = 351;
    WORD2(v29) = 2112;
    *(_QWORD *)((char *)&v29 + 6) = a2;
    v14 = " [%s] %s:%d Starting seamless video switch with target stream id: %@";
    v15 = v13;
    v16 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_19;
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v28 = 136316418;
    *(_QWORD *)&v28[4] = v17;
    *(_WORD *)&v28[12] = 2080;
    *(_QWORD *)&v28[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
    *(_WORD *)&v28[22] = 1024;
    LODWORD(v29) = 351;
    WORD2(v29) = 2112;
    *(_QWORD *)((char *)&v29 + 6) = v10;
    HIWORD(v29) = 2048;
    v30 = v19;
    LOWORD(v31) = 2112;
    *(_QWORD *)((char *)&v31 + 2) = a2;
    v14 = " [%s] %s:%d %@(%p) Starting seamless video switch with target stream id: %@";
    v15 = v18;
    v16 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, v28, v16);
LABEL_19:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 497) = 1;
  result = objc_msgSend(a3, "setTargetStreamID:", a2, *(_QWORD *)v28, *(_OWORD *)&v28[8], v29, v30, v31);
  *a4 = 1;
  return result;
}

uint64_t __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_29(uint64_t a1, void *a2, void *a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[24];
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a2, "isEqual:", objc_msgSend(a3, "targetStreamID"));
  v7 = objc_opt_class();
  v8 = *(_QWORD *)(a1 + 32);
  if ((v6 & 1) != 0)
  {
    if (v7 != v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v9 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
      else
        v9 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v19 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)v23 = 136316418;
          *(_QWORD *)&v23[4] = v17;
          *(_WORD *)&v23[12] = 2080;
          *(_QWORD *)&v23[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
          *(_WORD *)&v23[22] = 1024;
          LODWORD(v24) = 363;
          WORD2(v24) = 2112;
          *(_QWORD *)((char *)&v24 + 6) = v9;
          HIWORD(v24) = 2048;
          v25 = v19;
          LOWORD(v26) = 2112;
          *(_QWORD *)((char *)&v26 + 2) = a2;
          v13 = " [%s] %s:%d %@(%p) Ending seamless video switch with target stream id: %@";
LABEL_23:
          v15 = v18;
          v16 = 58;
          goto LABEL_24;
        }
      }
      goto LABEL_25;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_25;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)v23 = 136315906;
    *(_QWORD *)&v23[4] = v11;
    *(_WORD *)&v23[12] = 2080;
    *(_QWORD *)&v23[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
    *(_WORD *)&v23[22] = 1024;
    LODWORD(v24) = 363;
    WORD2(v24) = 2112;
    *(_QWORD *)((char *)&v24 + 6) = a2;
    v13 = " [%s] %s:%d Ending seamless video switch with target stream id: %@";
LABEL_14:
    v15 = v12;
    v16 = 38;
LABEL_24:
    _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v13, v23, v16);
    goto LABEL_25;
  }
  if (v7 == v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_25;
    v14 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)v23 = 136315906;
    *(_QWORD *)&v23[4] = v14;
    *(_WORD *)&v23[12] = 2080;
    *(_QWORD *)&v23[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
    *(_WORD *)&v23[22] = 1024;
    LODWORD(v24) = 361;
    WORD2(v24) = 2112;
    *(_QWORD *)((char *)&v24 + 6) = a2;
    v13 = " [%s] %s:%d Non-seamless video switch with target stream id: %@";
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v10 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
  else
    v10 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v20 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v23 = 136316418;
      *(_QWORD *)&v23[4] = v20;
      *(_WORD *)&v23[12] = 2080;
      *(_QWORD *)&v23[14] = "-[VCVideoStreamReceiveGroup setActiveStreamIDs:]_block_invoke";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 361;
      WORD2(v24) = 2112;
      *(_QWORD *)((char *)&v24 + 6) = v10;
      HIWORD(v24) = 2048;
      v25 = v21;
      LOWORD(v26) = 2112;
      *(_QWORD *)((char *)&v26 + 2) = a2;
      v13 = " [%s] %s:%d %@(%p) Non-seamless video switch with target stream id: %@";
      goto LABEL_23;
    }
  }
LABEL_25:
  objc_msgSend(a3, "setTargetStreamID:", a2, *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25, v26);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 497) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "setOptedInStreamID:", a2);
}

- (void)setMediaSuspended:(BOOL)a3 forStreamToken:(id)a4
{
  objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidSuspend:streamToken:", a3, objc_msgSend(a4, "unsignedIntValue"));
}

- (void)setRemoteVideoPaused:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__VCVideoStreamReceiveGroup_setRemoteVideoPaused___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, block);
}

void __50__VCVideoStreamReceiveGroup_setRemoteVideoPaused___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 476) != v2)
  {
    *(_BYTE *)(v1 + 476) = v2;
    objc_msgSend(*(id *)(a1 + 32), "updateVideoExpected");
    objc_msgSend(*(id *)(a1 + 32), "setIsRemoteMediaStalled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 477));
    v4 = MEMORY[0x1DF086F1C](*(_QWORD *)(a1 + 32) + 296);
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(NSObject **)(v5 + 304);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __50__VCVideoStreamReceiveGroup_setRemoteVideoPaused___block_invoke_2;
      v7[3] = &unk_1E9E52210;
      v7[4] = v4;
      v7[5] = v5;
      v8 = *(_BYTE *)(a1 + 40);
      dispatch_async(v6, v7);
    }
  }
}

void __50__VCVideoStreamReceiveGroup_setRemoteVideoPaused___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "streamGroup:didRemotePauseChange:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)setRemoteVideoEnabled:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD block[5];
  BOOL v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__VCVideoStreamReceiveGroup_setRemoteVideoEnabled___block_invoke;
  block[3] = &unk_1E9E521E8;
  block[4] = self;
  v5 = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __51__VCVideoStreamReceiveGroup_setRemoteVideoEnabled___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 608) != v2)
  {
    v3 = result;
    *(_BYTE *)(v1 + 608) = v2;
    objc_msgSend(*(id *)(result + 32), "updateVideoExpected");
    objc_msgSend(*(id *)(v3 + 32), "setIsRemoteMediaStalled:", *(unsigned __int8 *)(*(_QWORD *)(v3 + 32) + 477));
    result = *(_QWORD *)(v3 + 32);
    if (!*(_BYTE *)(result + 608))
      return objc_msgSend((id)result, "resetDidReceiveFirstFrame");
  }
  return result;
}

- (void)setVisibilityIndex:(unsigned int)a3
{
  self->_visibilityIndex = +[VCDefaults integerValueForKey:defaultValue:](VCDefaults, "integerValueForKey:defaultValue:", CFSTR("forceVisibilityIndex"), a3);
  -[VCMediaStreamGroup streamToken](self, "streamToken");
  kdebug_trace();
  -[VCVideoStreamReceiveGroup updateVideoExpected](self, "updateVideoExpected");
  -[VCVideoStreamReceiveGroup setIsRemoteMediaStalled:](self, "setIsRemoteMediaStalled:", self->_isVideoDegraded);
  -[VCVideoStreamReceiveGroup updateShouldEnableFaceZoom](self, "updateShouldEnableFaceZoom");
}

- (void)checkAndReportRegressedPoorConnectionPercentage
{
  double v3;
  double v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  int poorConnectionPercentageABCReportingThreshold;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  __CFDictionary *Mutable;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BYTE v24[10];
  VCVideoStreamReceiveGroup *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[VCMediaStreamGroup streamGroupID](self, "streamGroupID") == 1667329381
    && !self->_poorConnectionPercentageRegressedFromTelemetrySymptomReported)
  {
    if (self->_poorConnectionPercentageABCReportingThreshold)
    {
      v3 = micro();
      v4 = v3 - self->_isVideoDegradedStartTime + self->_poorConnectionTotalLength;
      self->_poorConnectionTotalLength = v4;
      v5 = (int)(v4 * 10000.0 / (v3 - self->_startTime));
      if (self->_poorConnectionPercentageABCReportingThreshold < v5)
      {
        if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_16;
          v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          poorConnectionPercentageABCReportingThreshold = self->_poorConnectionPercentageABCReportingThreshold;
          v17 = 136316162;
          v18 = v7;
          v19 = 2080;
          v20 = "-[VCVideoStreamReceiveGroup checkAndReportRegressedPoorConnectionPercentage]";
          v21 = 1024;
          v22 = 435;
          v23 = 1024;
          *(_DWORD *)v24 = v5;
          *(_WORD *)&v24[4] = 1024;
          *(_DWORD *)&v24[6] = poorConnectionPercentageABCReportingThreshold;
          v10 = " [%s] %s:%d PoorConnectionPercentage=%d >= ReportingThresholdFromTelemetry=%d";
          v11 = v8;
          v12 = 40;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v6 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v6 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 6)
            goto LABEL_16;
          v13 = VRTraceErrorLogLevelToCSTR();
          v14 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          v15 = self->_poorConnectionPercentageABCReportingThreshold;
          v17 = 136316674;
          v18 = v13;
          v19 = 2080;
          v20 = "-[VCVideoStreamReceiveGroup checkAndReportRegressedPoorConnectionPercentage]";
          v21 = 1024;
          v22 = 435;
          v23 = 2112;
          *(_QWORD *)v24 = v6;
          *(_WORD *)&v24[8] = 2048;
          v25 = self;
          v26 = 1024;
          v27 = v5;
          v28 = 1024;
          v29 = v15;
          v10 = " [%s] %s:%d %@(%p) PoorConnectionPercentage=%d >= ReportingThresholdFromTelemetry=%d";
          v11 = v14;
          v12 = 60;
        }
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
LABEL_16:
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeySessionID"), self->super.super._sessionUUID);
        CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeyParticipantID"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->super.super._idsParticipantID));
        -[VCObject reportingAgent](self, "reportingAgent");
        reportingSymptom();
        CFRelease(Mutable);
        self->_poorConnectionPercentageRegressedFromTelemetrySymptomReported = 1;
      }
    }
  }
}

- (void)setVideoDegraded:(BOOL)a3 duration:(double)a4
{
  _BOOL8 v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  __CFDictionary *Mutable;
  const __CFString *v17;
  int64_t v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  _BYTE v29[24];
  __int128 v30;
  VCVideoStreamReceiveGroup *v31;
  uint64_t v32;
  uint64_t v33;

  v5 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)v29 = 136315906;
    *(_QWORD *)&v29[4] = v8;
    *(_WORD *)&v29[12] = 2080;
    *(_QWORD *)&v29[14] = "-[VCVideoStreamReceiveGroup setVideoDegraded:duration:]";
    *(_WORD *)&v29[22] = 1024;
    LODWORD(v30) = 448;
    WORD2(v30) = 1024;
    *(_DWORD *)((char *)&v30 + 6) = v5;
    v10 = " [%s] %s:%d videoDegraded=%d";
    v11 = v9;
    v12 = 34;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v7 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v29 = 136316418;
      *(_QWORD *)&v29[4] = v13;
      *(_WORD *)&v29[12] = 2080;
      *(_QWORD *)&v29[14] = "-[VCVideoStreamReceiveGroup setVideoDegraded:duration:]";
      *(_WORD *)&v29[22] = 1024;
      LODWORD(v30) = 448;
      WORD2(v30) = 2112;
      *(_QWORD *)((char *)&v30 + 6) = v7;
      HIWORD(v30) = 2048;
      v31 = self;
      LOWORD(v32) = 1024;
      *(_DWORD *)((char *)&v32 + 2) = v5;
      v10 = " [%s] %s:%d %@(%p) videoDegraded=%d";
      v11 = v14;
      v12 = 54;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v29, v12);
    }
  }
LABEL_12:
  if ((a4 > 5.0 || !v5) && self->_reportedDegradeStatus != v5)
  {
    -[VCMediaStreamGroup streamGroupID](self, "streamGroupID");
    v15 = reportingStreamGroupFromStreamGroupID();
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(Mutable, CFSTR("VCSPUUID"), self->super.super._participantUUID);
    CFDictionaryAddValue(Mutable, CFSTR("VCSPVideoDegraded"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5));
    CFDictionaryAddValue(Mutable, CFSTR("VCMSStreamGroup"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v15));
    -[VCObject reportingAgent](self, "reportingAgent");
    reportingGenericEvent();
    if (Mutable)
      CFRelease(Mutable);
    self->_reportedDegradeStatus = v5;
  }
  if (*(&self->_isVideoDegraded + 1) == v5)
  {
    if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v22 = *((unsigned __int8 *)&self->_isVideoDegraded + 1);
          *(_DWORD *)v29 = 136315906;
          *(_QWORD *)&v29[4] = v20;
          *(_WORD *)&v29[12] = 2080;
          *(_QWORD *)&v29[14] = "-[VCVideoStreamReceiveGroup setVideoDegraded:duration:]";
          *(_WORD *)&v29[22] = 1024;
          LODWORD(v30) = 462;
          WORD2(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 6) = v22;
          v23 = " [%s] %s:%d Ignoring setVideoDegraded=%d with same value";
          v24 = v21;
          v25 = 34;
LABEL_39:
          _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, v23, v29, v25);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v28 = *((unsigned __int8 *)&self->_isVideoDegraded + 1);
          *(_DWORD *)v29 = 136316418;
          *(_QWORD *)&v29[4] = v26;
          *(_WORD *)&v29[12] = 2080;
          *(_QWORD *)&v29[14] = "-[VCVideoStreamReceiveGroup setVideoDegraded:duration:]";
          *(_WORD *)&v29[22] = 1024;
          LODWORD(v30) = 462;
          WORD2(v30) = 2112;
          *(_QWORD *)((char *)&v30 + 6) = v17;
          HIWORD(v30) = 2048;
          v31 = self;
          LOWORD(v32) = 1024;
          *(_DWORD *)((char *)&v32 + 2) = v28;
          v23 = " [%s] %s:%d %@(%p) Ignoring setVideoDegraded=%d with same value";
          v24 = v27;
          v25 = 54;
          goto LABEL_39;
        }
      }
    }
  }
  else
  {
    v18 = -[VCMediaStreamGroup streamToken](self, "streamToken");
    if (!-[VCDefaults forceDisableVideoDegraded](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceDisableVideoDegraded"))objc_msgSend((id)VCRemoteVideoManager_DefaultManager(), "remoteVideoDidDegrade:streamToken:", v5, v18);
    if (self->_isVideoDegradedStartTime != 0.0 && *(&self->_isVideoDegraded + 1) && !v5)
      -[VCVideoStreamReceiveGroup checkAndReportRegressedPoorConnectionPercentage](self, "checkAndReportRegressedPoorConnectionPercentage");
    *(&self->_isVideoDegraded + 1) = v5;
    -[VCNetworkFeedbackController reportImmediateWRMMetric:value:](self->super.super._networkFeedbackController, "reportImmediateWRMMetric:value:", 0, v5, *(_OWORD *)v29, *(_QWORD *)&v29[16], v30, v31, v32, v33);
    kdebug_trace();
    if (*(&self->_isVideoDegraded + 1))
      v19 = micro();
    else
      v19 = 0.0;
    self->_isVideoDegradedStartTime = v19;
  }
}

- (unsigned)lastDisplayedFrameRTPTimestamp
{
  NSObject *stateQueue;
  unsigned int v3;
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
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__VCVideoStreamReceiveGroup_lastDisplayedFrameRTPTimestamp__block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(stateQueue, block);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__VCVideoStreamReceiveGroup_lastDisplayedFrameRTPTimestamp__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
  if (v2)
  {
    v3 = (void *)v2;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "lastDisplayedFrameRTPTimestamp");
      return;
    }
  }
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      return;
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      return;
    v7 = *(const __CFString **)(*(_QWORD *)(a1 + 32) + 440);
    v15 = 136315906;
    v16 = v5;
    v17 = 2080;
    v18 = "-[VCVideoStreamReceiveGroup lastDisplayedFrameRTPTimestamp]_block_invoke";
    v19 = 1024;
    v20 = 487;
    v21 = 2112;
    v22 = v7;
    v8 = " [%s] %s:%d Can not find VCMediaStream from _activeDownlinkStreamID=%@";
    v9 = v6;
    v10 = 38;
LABEL_15:
    _os_log_error_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v15, v10);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
  else
    v4 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v13 + 440);
      v15 = 136316418;
      v16 = v11;
      v17 = 2080;
      v18 = "-[VCVideoStreamReceiveGroup lastDisplayedFrameRTPTimestamp]_block_invoke";
      v19 = 1024;
      v20 = 487;
      v21 = 2112;
      v22 = v4;
      v23 = 2048;
      v24 = v13;
      v25 = 2112;
      v26 = v14;
      v8 = " [%s] %s:%d %@(%p) Can not find VCMediaStream from _activeDownlinkStreamID=%@";
      v9 = v12;
      v10 = 58;
      goto LABEL_15;
    }
  }
}

- (void)setShouldEnableMLEnhance:(BOOL)a3 streamID:(unsigned __int16)a4
{
  NSObject *stateQueue;
  _QWORD block[5];
  unsigned __int16 v9;
  BOOL v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[VCMediaStreamGroup streamGroupID](self, "streamGroupID") != 1935897189)
  {
    stateQueue = self->super.super._stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__VCVideoStreamReceiveGroup_setShouldEnableMLEnhance_streamID___block_invoke;
    block[3] = &unk_1E9E55668;
    block[4] = self;
    v10 = a3;
    v9 = a4;
    dispatch_async(stateQueue, block);
  }
}

uint64_t __63__VCVideoStreamReceiveGroup_setShouldEnableMLEnhance_streamID___block_invoke(uint64_t a1)
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
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 168);
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
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6++), "stream"), "setShouldEnableMLEnhance:streamID:", *(unsigned __int8 *)(a1 + 42), *(unsigned __int16 *)(a1 + 40));
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v7, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  NSObject *stateQueue;
  _QWORD block[5];
  unsigned int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!-[VCDefaults forceFECRepairStream](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance", a3), "forceFECRepairStream"))
  {
    stateQueue = self->super.super._stateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__VCVideoStreamReceiveGroup_redundancyController_redundancyPercentageDidChange___block_invoke;
    block[3] = &unk_1E9E52300;
    block[4] = self;
    v8 = a4;
    dispatch_async(stateQueue, block);
  }
}

void __80__VCVideoStreamReceiveGroup_redundancyController_redundancyPercentageDidChange___block_invoke(uint64_t a1)
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
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[6];
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
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136315906;
        v20 = v3;
        v21 = 2080;
        v22 = "-[VCVideoStreamReceiveGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        v23 = 1024;
        v24 = 512;
        v25 = 1024;
        LODWORD(v26) = v5;
        v6 = " [%s] %s:%d New redundancy percentage %d";
        v7 = v4;
        v8 = 34;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
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
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        v12 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        v20 = v9;
        v21 = 2080;
        v22 = "-[VCVideoStreamReceiveGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        v23 = 1024;
        v24 = 512;
        v25 = 2112;
        v26 = v2;
        v27 = 2048;
        v28 = v11;
        v29 = 1024;
        v30 = v12;
        v6 = " [%s] %s:%d %@(%p) New redundancy percentage %d";
        v7 = v10;
        v8 = 54;
        goto LABEL_11;
      }
    }
  }
  v13 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 40))
  {
    if (*(_BYTE *)(v13 + 520))
      return;
    v14 = 1;
  }
  else
  {
    if (!*(_BYTE *)(v13 + 520))
      return;
    v14 = 0;
  }
  *(_BYTE *)(v13 + 520) = v14;
  v15 = MEMORY[0x1DF086F1C](*(_QWORD *)(a1 + 32) + 296);
  if (v15)
  {
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(NSObject **)(v16 + 304);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__VCVideoStreamReceiveGroup_redundancyController_redundancyPercentageDidChange___block_invoke_42;
    v18[3] = &unk_1E9E52238;
    v18[4] = v16;
    v18[5] = v15;
    dispatch_async(v17, v18);
  }
}

void __80__VCVideoStreamReceiveGroup_redundancyController_redundancyPercentageDidChange___block_invoke_42(uint64_t a1)
{
  const __CFString *v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  _BYTE v13[24];
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_opt_class() == *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 520))
          v5 = "Requesting";
        else
          v5 = "Dismissing";
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v3;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCVideoStreamReceiveGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 531;
        WORD2(v14) = 2080;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        v6 = " [%s] %s:%d %s video redundancy";
        v7 = v4;
        v8 = 38;
        goto LABEL_17;
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
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v11 + 520))
          v12 = "Requesting";
        else
          v12 = "Dismissing";
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v9;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCVideoStreamReceiveGroup redundancyController:redundancyPercentageDidChange:]_block_invoke";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 531;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v2;
        HIWORD(v14) = 2048;
        v15 = v11;
        LOWORD(v16) = 2080;
        *(_QWORD *)((char *)&v16 + 2) = v12;
        v6 = " [%s] %s:%d %@(%p) %s video redundancy";
        v7 = v10;
        v8 = 58;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v6, v13, v8);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "streamGroup:didRequestRedundancy:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 520), *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)vcMediaStream:(id)a3 priorityDidChange:(unsigned __int8)a4
{
  -[VCVideoStreamReceiveGroup updateVideoPriority:](self, "updateVideoPriority:", a4);
}

- (void)vcMediaStream:(id)a3 didReceiveFirstFrameWithTime:(id *)a4
{
  NSObject *stateQueue;
  _QWORD block[6];
  _QWORD v7[3];
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = NAN;
  v8 = micro();
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__VCVideoStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke;
  block[3] = &unk_1E9E522B0;
  block[4] = self;
  block[5] = v7;
  dispatch_async(stateQueue, block);
  _Block_object_dispose(v7, 8);
}

uint64_t __72__VCVideoStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke(uint64_t a1)
{
  double v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  _QWORD v10[5];
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setFirstMediaFrameReceivedTime:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)VCVideoStreamReceiveGroup;
  objc_msgSendSuper2(&v11, sel_finalizePerfTimersForFirstMediaFrameWithTime_, v2);
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "hasKey:", 6);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  if (v3)
  {
    v6 = *(_QWORD *)(v5 + 8);
    v7 = *(double *)(v6 + 24);
    if (v7 - *(double *)(v4 + 264) < 0.001)
    {
      *(double *)(v6 + 24) = v7 + 0.001;
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
    }
  }
  VCPerfTimingUtilsSetStopForKeyOnceWithTime(*(void **)(v4 + 240), 6, *(double *)(*(_QWORD *)(v5 + 8) + 24));
  objc_msgSend(*(id *)(a1 + 32), "reportParticipantsPerfTimings");
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__VCVideoStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke_2;
  v10[3] = &unk_1E9E52A28;
  v10[4] = v8;
  return objc_msgSend(v8, "callDelegateWithBlock:", v10);
}

uint64_t __72__VCVideoStreamReceiveGroup_vcMediaStream_didReceiveFirstFrameWithTime___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveFirstFrameForStreamGroup:", *(_QWORD *)(a1 + 32));
}

- (void)vcMediaStream:(id)a3 didSwitchFromStreamID:(unsigned __int16)a4 toStreamID:(unsigned __int16)a5
{
  NSObject *stateQueue;
  _QWORD block[5];
  unsigned __int16 v7;
  unsigned __int16 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke;
  block[3] = &unk_1E9E52300;
  v7 = a5;
  block[4] = self;
  v8 = a4;
  dispatch_async(stateQueue, block);
}

uint64_t __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _BYTE *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  int v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BYTE v32[18];
  __int16 v33;
  int v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(a1 + 40));
  if (objc_opt_class() != *(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(v13 + 432);
    v15 = *(unsigned __int16 *)(a1 + 40);
    *(_DWORD *)buf = 136316674;
    v26 = v11;
    v27 = 2080;
    v28 = "-[VCVideoStreamReceiveGroup vcMediaStream:didSwitchFromStreamID:toStreamID:]_block_invoke";
    v29 = 1024;
    v30 = 572;
    v31 = 2112;
    *(_QWORD *)v32 = v3;
    *(_WORD *)&v32[8] = 2048;
    *(_QWORD *)&v32[10] = v13;
    v33 = 1024;
    v34 = v15;
    v35 = 2112;
    v36 = v14;
    v8 = " [%s] %s:%d %@(%p) Completed transition to streamId:%d (previous:%@). Opt out of old stream id if needed.";
    v9 = v12;
    v10 = 64;
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(unsigned __int16 *)(a1 + 40);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432);
      *(_DWORD *)buf = 136316162;
      v26 = v4;
      v27 = 2080;
      v28 = "-[VCVideoStreamReceiveGroup vcMediaStream:didSwitchFromStreamID:toStreamID:]_block_invoke";
      v29 = 1024;
      v30 = 572;
      v31 = 1024;
      *(_DWORD *)v32 = v6;
      *(_WORD *)&v32[4] = 2112;
      *(_QWORD *)&v32[6] = v7;
      v8 = " [%s] %s:%d Completed transition to streamId:%d (previous:%@). Opt out of old stream id if needed.";
      v9 = v5;
      v10 = 44;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }
  }
LABEL_12:
  v16 = *(_BYTE **)(a1 + 32);
  v17 = MEMORY[0x1E0C809B0];
  if (v16[497])
  {
    objc_msgSend(v16, "setOptedInStreamID:", v2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 497) = 0;
    v18 = *(void **)(a1 + 32);
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke_48;
    v23[3] = &unk_1E9E52A00;
    v23[4] = v18;
    HIDWORD(v19) = *(_DWORD *)(a1 + 40);
    LODWORD(v19) = HIDWORD(v19);
    v24 = v19 >> 16;
    objc_msgSend(v18, "callDelegateWithBlock:", v23);
    v16 = *(_BYTE **)(a1 + 32);
  }
  v16[448] = *(_WORD *)(a1 + 40) == 0;
  objc_msgSend(*(id *)(a1 + 32), "setActiveStreamID:", v2);
  v20 = *(void **)(a1 + 32);
  v22[0] = v17;
  v22[1] = 3221225472;
  v22[2] = __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke_2;
  v22[3] = &unk_1E9E52A28;
  v22[4] = v20;
  return objc_msgSend(v20, "callDelegateWithBlock:", v22);
}

uint64_t __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke_48(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "streamGroup:didSwitchFromStreamID:toStreamID:", *(_QWORD *)(a1 + 32), *(unsigned __int16 *)(a1 + 40), *(unsigned __int16 *)(a1 + 42));
}

uint64_t __76__VCVideoStreamReceiveGroup_vcMediaStream_didSwitchFromStreamID_toStreamID___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didChangeReceivingStreamsForStreamGroup:", *(_QWORD *)(a1 + 32));
}

- (void)updateVideoExpected
{
  _BOOL4 isVideoExpected;
  VCNetworkFeedbackController *networkFeedbackController;
  uint64_t v5;
  NSObject *v6;
  NSArray *mediaStreams;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  isVideoExpected = self->_isVideoExpected;
  if (isVideoExpected != -[VCVideoStreamReceiveGroup isVideoExpected](self, "isVideoExpected"))
  {
    self->_isVideoExpected = -[VCVideoStreamReceiveGroup isVideoExpected](self, "isVideoExpected");
    self->_lastVideoExpectationSwitch = micro();
    networkFeedbackController = self->super.super._networkFeedbackController;
    if (networkFeedbackController)
    {
      -[VCNetworkFeedbackController setIsVideoPaused:](networkFeedbackController, "setIsVideoPaused:", !self->_isVideoExpected);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v18 = v5;
        v19 = 2080;
        v20 = "-[VCVideoStreamReceiveGroup updateVideoExpected]";
        v21 = 1024;
        v22 = 596;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d networkFeedbackController is nil in VCVideoStreamReceiveGroup", buf, 0x1Cu);
      }
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    mediaStreams = self->super.super._mediaStreams;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(mediaStreams);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "setVideoExpected:", self->_isVideoExpected);
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v9);
    }
  }
}

- (void)setIsRemoteMediaStalled:(BOOL)a3 duration:(double)a4
{
  VCVideoStreamReceiveGroup *v6;
  _BOOL4 isVideoDegraded;
  double v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  double lastVideoExpectationSwitch;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  double v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v6 = self;
  v36 = *MEMORY[0x1E0C80C00];
  isVideoDegraded = self->_isVideoDegraded;
  if (!a3 && self->_isVideoDegraded)
  {
    if (!self->_isVideoExpected)
      goto LABEL_13;
    isVideoDegraded = 1;
  }
  if (isVideoDegraded == a3 && self->_reportedDegradeStatus == a3
    || !self->_isVideoExpected
    || !self->super._optedInStreamID && !self->super._receivingEndToEndStream)
  {
    return;
  }
  if (!a3)
  {
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v8 = micro();
  self = v6;
  if (v8 - v6->_lastVideoExpectationSwitch > 10.0)
  {
    v9 = 1;
LABEL_14:
    -[VCVideoStreamReceiveGroup setVideoDegraded:duration:](self, "setVideoDegraded:duration:", v9, a4);
    v6->_isVideoDegraded = a3;
    return;
  }
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        lastVideoExpectationSwitch = v6->_lastVideoExpectationSwitch;
        v20 = 136316418;
        v21 = v11;
        v22 = 2080;
        v23 = "-[VCVideoStreamReceiveGroup setIsRemoteMediaStalled:duration:]";
        v24 = 1024;
        v25 = 629;
        v26 = 2048;
        v27 = v8;
        v28 = 2048;
        v29 = lastVideoExpectationSwitch;
        v30 = 2048;
        v31 = v8 - lastVideoExpectationSwitch;
        v14 = " [%s] %s:%d We are experiencing a video stall too soon after we switch video on. Ignoring... currentTime=%"
              "f lastVideoExpectationSwitch=%f diff=%f";
        v15 = v12;
        v16 = 58;
LABEL_26:
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, v16);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](v6, "performSelector:", sel_logPrefix);
    else
      v10 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v6->_lastVideoExpectationSwitch;
        v20 = 136316930;
        v21 = v17;
        v22 = 2080;
        v23 = "-[VCVideoStreamReceiveGroup setIsRemoteMediaStalled:duration:]";
        v24 = 1024;
        v25 = 629;
        v26 = 2112;
        v27 = *(double *)&v10;
        v28 = 2048;
        v29 = *(double *)&v6;
        v30 = 2048;
        v31 = v8;
        v32 = 2048;
        v33 = v19;
        v34 = 2048;
        v35 = v8 - v19;
        v14 = " [%s] %s:%d %@(%p) We are experiencing a video stall too soon after we switch video on. Ignoring... curren"
              "tTime=%f lastVideoExpectationSwitch=%f diff=%f";
        v15 = v18;
        v16 = 78;
        goto LABEL_26;
      }
    }
  }
}

- (void)vcMediaStream:(id)a3 remoteMediaStalled:(BOOL)a4 duration:(double)a5
{
  NSObject *stateQueue;
  _QWORD block[7];
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  stateQueue = self->super.super._stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__VCVideoStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke;
  block[3] = &unk_1E9E55690;
  v7 = a4;
  *(double *)&block[6] = a5;
  block[4] = self;
  block[5] = a3;
  dispatch_async(stateQueue, block);
}

uint64_t __71__VCVideoStreamReceiveGroup_vcMediaStream_remoteMediaStalled_duration___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsRemoteMediaStalled:duration:", *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 32), "checkForExtendedPoorConnectionWithStallDuration:", *(double *)(a1 + 48));
  if (*(_BYTE *)(a1 + 56))
    return objc_msgSend(*(id *)(a1 + 32), "checkForAndReportPoorConnectionDespiteVideoReceivedForVideoStream:stallDuration:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
  return result;
}

- (void)vcMediaStream:(id)a3 requestKeyFrameGenerationWithStreamID:(unsigned __int16)a4 firType:(int)a5
{
  int v6;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *delegateQueue;
  _QWORD block[6];
  int v19;
  __int16 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  VCVideoStreamReceiveGroup *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v6 = a4;
  v33 = *MEMORY[0x1E0C80C00];
  if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_12;
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136315906;
    v22 = v9;
    v23 = 2080;
    v24 = "-[VCVideoStreamReceiveGroup vcMediaStream:requestKeyFrameGenerationWithStreamID:firType:]";
    v25 = 1024;
    v26 = 648;
    v27 = 1024;
    LODWORD(v28) = v6;
    v11 = " [%s] %s:%d Requesting streamID to generate a key frame %hu";
    v12 = v10;
    v13 = 34;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v8 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v22 = v14;
      v23 = 2080;
      v24 = "-[VCVideoStreamReceiveGroup vcMediaStream:requestKeyFrameGenerationWithStreamID:firType:]";
      v25 = 1024;
      v26 = 648;
      v27 = 2112;
      v28 = v8;
      v29 = 2048;
      v30 = self;
      v31 = 1024;
      v32 = v6;
      v11 = " [%s] %s:%d %@(%p) Requesting streamID to generate a key frame %hu";
      v12 = v15;
      v13 = 54;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
    }
  }
LABEL_12:
  v16 = MEMORY[0x1DF086F1C](&self->super.super._delegate);
  if (v16)
  {
    delegateQueue = self->super.super._delegateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__VCVideoStreamReceiveGroup_vcMediaStream_requestKeyFrameGenerationWithStreamID_firType___block_invoke;
    block[3] = &unk_1E9E57418;
    block[4] = v16;
    block[5] = self;
    v20 = v6;
    v19 = a5;
    dispatch_async(delegateQueue, block);
  }
}

void __89__VCVideoStreamReceiveGroup_vcMediaStream_requestKeyFrameGenerationWithStreamID_firType___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "streamGroup:requestKeyFrameGenerationWithStreamID:firType:", *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 52), *(unsigned int *)(a1 + 48));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)checkForExtendedPoorConnectionWithStallDuration:(double)a3
{
  double v5;
  double lastRecordedExtendedPoorConnection;
  BOOL v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t idsParticipantID;
  double isVideoDegradedStartTime;
  __CFDictionary *Mutable;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(&self->_isVideoDegraded + 1)
    && self->_isVideoExpected
    && (self->super._optedInStreamID || self->super._receivingEndToEndStream))
  {
    v5 = micro();
    lastRecordedExtendedPoorConnection = self->_lastRecordedExtendedPoorConnection;
    v7 = lastRecordedExtendedPoorConnection != 0.0;
    if (v5 - lastRecordedExtendedPoorConnection > 30.0)
      v7 = 0;
    if (a3 > 30.0 && self->_isVideoDegradedStartTime != 0.0 && !v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v8 = VRTraceErrorLogLevelToCSTR();
        v9 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          idsParticipantID = self->super.super._idsParticipantID;
          isVideoDegradedStartTime = self->_isVideoDegradedStartTime;
          v13 = 136316674;
          v14 = v8;
          v15 = 2080;
          v16 = "-[VCVideoStreamReceiveGroup checkForExtendedPoorConnectionWithStallDuration:]";
          v17 = 1024;
          v18 = 670;
          v19 = 2048;
          v20 = idsParticipantID;
          v21 = 2048;
          v22 = a3;
          v23 = 2048;
          v24 = v5;
          v25 = 2048;
          v26 = isVideoDegradedStartTime;
          _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ExtendedPoorConnection detected for idsParticipantID=%llu duration=%f now=%f  isVideoDegradedStartTime=%f", (uint8_t *)&v13, 0x44u);
        }
      }
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeySessionID"), self->super.super._sessionUUID);
      CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeyParticipantID"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->super.super._idsParticipantID));
      -[VCObject reportingAgent](self, "reportingAgent");
      reportingSymptom();
      CFRelease(Mutable);
      self->_lastRecordedExtendedPoorConnection = v5;
    }
  }
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
  int v15;
  int v16;
  unint64_t v17;
  NSString *v18;
  unint64_t v19;
  double v20;
  NSObject *v21;
  const char *v22;
  uint32_t v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  int v27;
  int v28;
  __int128 v29;
  NSString *v30;
  unint64_t syncUpdateCalled;
  double displayLatency;
  __int128 v33;
  NSArray *v34;
  $630EEFBF570FF8F3C5E9582E2A557BD5 *v35;
  int v36;
  char *v37;
  char *v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  _BYTE v48[10];
  char *v49;
  uint64_t v50;
  _BYTE v51[10];
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  double v55;
  __int16 v56;
  unint64_t v57;
  __int16 v58;
  double v59;
  _OWORD v60[5];
  uint64_t v61;
  _BYTE v62[128];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  mediaStreams = self->super.super._mediaStreams;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v64;
    *(_QWORD *)&v7 = 136317698;
    v33 = v7;
    v34 = mediaStreams;
    v35 = a3;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v64 != v9)
          objc_enumerationMutation(mediaStreams);
        v11 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        if (objc_msgSend(v11, "state", v33) == 2)
        {
          v61 = 0;
          memset(v60, 0, sizeof(v60));
          objc_msgSend(v11, "collectRxChannelMetrics:", v60);
          VCMediaChannelMetrics_Sum((uint64_t)a3, (uint64_t)v60);
          if ((VCVideoStreamReceiveGroup *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v24 = VRTraceErrorLogLevelToCSTR();
              v25 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v38 = FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
                v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
                v27 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "repairedStreamID");
                v28 = v60[0];
                v29 = v60[2];
                v30 = NSStringFromSize(*(NSSize *)((char *)&v60[2] + 8));
                syncUpdateCalled = self->_syncUpdateCalled;
                displayLatency = self->_displayLatency;
                *(_DWORD *)buf = v33;
                v40 = v24;
                v41 = 2080;
                v42 = "-[VCVideoStreamReceiveGroup collectAndLogChannelMetrics:]";
                v43 = 1024;
                v44 = 686;
                v45 = 2080;
                v46 = v38;
                v47 = 1024;
                *(_DWORD *)v48 = v26;
                *(_WORD *)&v48[4] = 1024;
                *(_DWORD *)&v48[6] = v27;
                LOWORD(v49) = 1024;
                *(_DWORD *)((char *)&v49 + 2) = v28;
                mediaStreams = v34;
                a3 = v35;
                HIWORD(v49) = 2048;
                v50 = v29;
                *(_WORD *)v51 = 2112;
                *(_QWORD *)&v51[2] = v30;
                v52 = 2048;
                v53 = syncUpdateCalled;
                v54 = 2048;
                v55 = displayLatency;
                v21 = v25;
                v22 = " [%s] %s:%d Health Monitor for Video Stream Receive GroupID=%s StreamID[main:%u repair:%u] Video[%"
                      "ukbps %4.1ffps] VideoResolution=%@ syncUpdateCalled=%ld videoDisplayLatency=%f";
                v23 = 96;
                goto LABEL_16;
              }
            }
          }
          else
          {
            v12 = &stru_1E9E58EE0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v12 = (const __CFString *)-[VCVideoStreamReceiveGroup performSelector:](self, "performSelector:", sel_logPrefix);
            if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
            {
              v13 = VRTraceErrorLogLevelToCSTR();
              v14 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                v37 = FourccToCStr(-[VCMediaStreamGroup streamGroupID](self, "streamGroupID"));
                v36 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "idsStreamID");
                v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "defaultStreamConfig"), "multiwayConfig"), "repairedStreamID");
                v16 = v60[0];
                v17 = *(_QWORD *)&v60[2];
                v18 = NSStringFromSize(*(NSSize *)((char *)&v60[2] + 8));
                v19 = self->_syncUpdateCalled;
                v20 = self->_displayLatency;
                *(_DWORD *)buf = 136318210;
                v40 = v13;
                v41 = 2080;
                v42 = "-[VCVideoStreamReceiveGroup collectAndLogChannelMetrics:]";
                v43 = 1024;
                v44 = 686;
                v45 = 2112;
                v46 = (void *)v12;
                v47 = 2048;
                *(_QWORD *)v48 = self;
                *(_WORD *)&v48[8] = 2080;
                v49 = v37;
                LOWORD(v50) = 1024;
                *(_DWORD *)((char *)&v50 + 2) = v36;
                HIWORD(v50) = 1024;
                *(_DWORD *)v51 = v15;
                *(_WORD *)&v51[4] = 1024;
                *(_DWORD *)&v51[6] = v16;
                v52 = 2048;
                v53 = v17;
                mediaStreams = v34;
                a3 = v35;
                v54 = 2112;
                v55 = *(double *)&v18;
                v56 = 2048;
                v57 = v19;
                v58 = 2048;
                v59 = v20;
                v21 = v14;
                v22 = " [%s] %s:%d %@(%p) Health Monitor for Video Stream Receive GroupID=%s StreamID[main:%u repair:%u] "
                      "Video[%ukbps %4.1ffps] VideoResolution=%@ syncUpdateCalled=%ld videoDisplayLatency=%f";
                v23 = 116;
LABEL_16:
                _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
                continue;
              }
            }
          }
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](mediaStreams, "countByEnumeratingWithState:objects:count:", &v63, v62, 16);
    }
    while (v8);
  }
}

- (void)checkForAndReportPoorConnectionDespiteVideoReceivedForVideoStream:(id)a3 stallDuration:(double)a4
{
  double v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t idsParticipantID;
  double isVideoDegradedStartTime;
  __CFDictionary *Mutable;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(&self->_isVideoDegraded + 1)
    && self->_isVideoExpected
    && (self->super._optedInStreamID || self->super._receivingEndToEndStream))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a3, "videoRxFrameRate");
      v8 = v7;
      if (self->_isVideoDegradedStartTime != 0.0
        && a4 > 5.0
        && self->_didReportSymptomOnPoorConnectionDespiteVideoIsReceived == 0.0
        && v7 > 0.0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v9 = VRTraceErrorLogLevelToCSTR();
          v10 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            idsParticipantID = self->super.super._idsParticipantID;
            isVideoDegradedStartTime = self->_isVideoDegradedStartTime;
            v14 = 136316674;
            v15 = v9;
            v16 = 2080;
            v17 = "-[VCVideoStreamReceiveGroup checkForAndReportPoorConnectionDespiteVideoReceivedForVideoStream:stallDuration:]";
            v18 = 1024;
            v19 = 700;
            v20 = 2048;
            v21 = idsParticipantID;
            v22 = 2048;
            v23 = a4;
            v24 = 2048;
            v25 = isVideoDegradedStartTime;
            v26 = 2048;
            v27 = v8;
            _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Poor connection detected for idsParticipantID=%llu duration=%2.3f isVideoDegradedStartTime=%2.3f videoRxFramerate[past 5s]=%2.3f", (uint8_t *)&v14, 0x44u);
          }
        }
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeySessionID"), self->super.super._sessionUUID);
        CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeyParticipantID"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->super.super._idsParticipantID));
        -[VCObject reportingAgent](self, "reportingAgent");
        reportingSymptom();
        CFRelease(Mutable);
        self->_didReportSymptomOnPoorConnectionDespiteVideoIsReceived = 1.0;
      }
    }
  }
}

- (void)mediaStream:(id)a3 didReceiveNewMediaKeyIndex:(id)a4
{
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)VCVideoStreamReceiveGroup;
  -[VCMediaStreamGroup mediaStream:didReceiveNewMediaKeyIndex:](&v6, sel_mediaStream_didReceiveNewMediaKeyIndex_, a3);
  -[VCMediaStreamGroup setupPerfTimersWithMediaKeyIndex:perfTimerIndexToStart:](self, "setupPerfTimersWithMediaKeyIndex:perfTimerIndexToStart:", a4, 6);
}

- (BOOL)isRemoteVideoPaused
{
  return self->_isRemoteMediaStalled;
}

- (unsigned)videoQuality
{
  return self->_remoteVideoPaused;
}

- (void)setVideoQuality:(unsigned __int8)a3
{
  self->_remoteVideoPaused = a3;
}

- (BOOL)isRemoteMediaStalled
{
  return self->_isVideoDegraded;
}

- (void)setIsRemoteMediaStalled:(BOOL)a3
{
  self->_isVideoDegraded = a3;
}

- (unsigned)visibilityIndex
{
  return self->_visibilityIndex;
}

- (BOOL)isRemoteVideoEnabled
{
  return self->_remoteVideoEnabled;
}

- (void)setupRedundancyController
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v4 = v0;
  v5 = "-[VCVideoStreamReceiveGroup setupRedundancyController]";
  v6 = 1024;
  v7 = 186;
  v8 = 2112;
  v9 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@", v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)isVideoExpected
{
  int v6;
  int v7;
  __int16 v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a2, "state");
  v7 = a2[476];
  objc_msgSend(a2, "isVisible");
  v10 = 136316418;
  v11 = a1;
  OUTLINED_FUNCTION_1();
  v12 = 197;
  v13 = v8;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  _os_log_debug_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_DEBUG, " [%s] %s:%d state:%d remoteVideoPaused:%d isVisible:%d", (uint8_t *)&v10, 0x2Eu);
}

void __43__VCVideoStreamReceiveGroup_setSyncSource___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(*a2, "state");
  v6 = 136315906;
  v7 = a1;
  v8 = 2080;
  v9 = "-[VCVideoStreamReceiveGroup setSyncSource:]_block_invoke";
  v10 = 1024;
  v11 = 225;
  v12 = 1024;
  v13 = v5;
  _os_log_error_impl(&dword_1D8A54000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Stream group must be stopped when setting sync source. state=%d", (uint8_t *)&v6, 0x22u);
}

void __48__VCVideoStreamReceiveGroup_setActiveStreamIDs___block_invoke_cold_1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[24];
  int v4;
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  v4 = 375;
  v5 = v0;
  v6 = 2;
  v7 = 2112;
  v8 = v1;
  _os_log_error_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Trying to opt into more than %d video streams! Streams:%@", v3, 0x2Cu);
}

@end
