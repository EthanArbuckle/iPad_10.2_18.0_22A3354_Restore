@implementation VCSessionUplinkVideoStreamController

- (VCSessionUplinkVideoStreamController)initWithVideoStreams:(id)a3 streamInfos:(id)a4 reportingAgent:(opaqueRTCReporting *)a5 delegate:(id)a6
{
  VCSessionUplinkVideoStreamController *v10;
  VCSessionUplinkVideoStreamController *v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  opaqueRTCReporting *v14;
  const __CFString *v15;
  uint64_t v16;
  NSObject *v17;
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
  VCSessionUplinkVideoStreamController *v29;
  pthread_mutexattr_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)VCSessionUplinkVideoStreamController;
  v10 = -[VCSessionUplinkVideoStreamController init](&v19, sel_init);
  v11 = v10;
  if (!v10)
  {
LABEL_16:

    return 0;
  }
  objc_storeWeak(&v10->_delegate, a6);
  v11->_videoStreams = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  v12 = objc_msgSend(a3, "count");
  v11->_streamInfoMap = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  -[VCSessionUplinkVideoStreamController initilizeStreamInfoMapWithStreamInfos:](v11, "initilizeStreamInfoMapWithStreamInfos:", a4);
  v11->_streamScheduleWifi = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v11->_streamScheduleCell = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v12);
  v11->_activeVideoStreams = v13;
  v11->_cachedActiveVideoStreams = (NSDictionary *)-[NSMutableDictionary copy](v13, "copy");
  v11->_streamToPause = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v12);
  v11->_streamToResume = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v12);
  v11->_streamsPendingKeyFrameGeneration = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
  v30.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v30.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v30);
  pthread_mutexattr_settype(&v30, 2);
  pthread_mutex_init(&v11->_mutex, &v30);
  pthread_mutexattr_destroy(&v30);
  v11->_startTime = 0.0;
  if (a5)
    v14 = (opaqueRTCReporting *)CFRetain(a5);
  else
    v14 = 0;
  v11->_reportingAgent = v14;
  if (!-[VCSessionUplinkVideoStreamController setStreamsUseRTCPWithStreamInfos:](v11, "setStreamsUseRTCPWithStreamInfos:", a4))
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == v11)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionUplinkVideoStreamController initWithVideoStreams:streamInfos:reportingAgent:delegate:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v15 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](v11, "performSelector:", sel_logPrefix);
      else
        v15 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v21 = v16;
          v22 = 2080;
          v23 = "-[VCSessionUplinkVideoStreamController initWithVideoStreams:streamInfos:reportingAgent:delegate:]";
          v24 = 1024;
          v25 = 57;
          v26 = 2112;
          v27 = v15;
          v28 = 2048;
          v29 = v11;
          _os_log_error_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to initialize VCSessionUplinkVideoStreamController. Invalid RTCP config.", buf, 0x30u);
        }
      }
    }
    goto LABEL_16;
  }
  return v11;
}

- (void)dealloc
{
  opaqueRTCReporting *reportingAgent;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];

  objc_storeWeak(&self->_delegate, 0);
  reportingAgent = self->_reportingAgent;
  if (reportingAgent)
    CFRelease(reportingAgent);
  pthread_mutex_destroy(&self->_mutex);
  v4.receiver = self;
  v4.super_class = (Class)VCSessionUplinkVideoStreamController;
  -[VCSessionUplinkVideoStreamController dealloc](&v4, sel_dealloc);
}

- (NSDictionary)activeVideoStreams
{
  NSDictionary *v3;

  -[VCSessionUplinkVideoStreamController lock](self, "lock");
  v3 = self->_cachedActiveVideoStreams;
  -[VCSessionUplinkVideoStreamController unlock](self, "unlock");
  return v3;
}

- (void)setCachedActiveVideoStreams:(id)a3
{

  self->_cachedActiveVideoStreams = (NSDictionary *)objc_msgSend(a3, "copy");
}

- (void)setStreamIDsCell:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  int v30;
  int v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  NSMutableDictionary *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  NSMutableDictionary *v41;
  uint64_t v42;
  NSMutableDictionary *v43;
  NSObject *v44;
  uint32_t v45;
  uint64_t v46;
  NSMutableDictionary *v47;
  const __CFString *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  NSMutableDictionary *streamScheduleCell;
  NSMutableDictionary *currentStreamSchedule;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  _BYTE v67[10];
  NSMutableDictionary *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  _BYTE v73[128];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  -[VCSessionUplinkVideoStreamController lock](self, "lock");
  if (!objc_msgSend(a3, "count"))
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_51;
      v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E0CF2758];
      v51 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          -[VCSessionUplinkVideoStreamController setStreamIDsCell:].cold.1();
        goto LABEL_51;
      }
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      *(_DWORD *)buf = 136315650;
      v59 = v49;
      v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
      v62 = 1024;
      v63 = 105;
      v38 = " [%s] %s:%d streamIDsCell is nil";
      v44 = v50;
      v45 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v48 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v48 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_51;
      v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E0CF2758];
      v54 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          v59 = v52;
          v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
          v62 = 1024;
          v63 = 105;
          v64 = 2112;
          v65 = (void *)v48;
          v66 = 2048;
          *(_QWORD *)v67 = self;
          _os_log_debug_impl(&dword_1D8A54000, v53, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) streamIDsCell is nil", buf, 0x30u);
        }
        goto LABEL_51;
      }
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      *(_DWORD *)buf = 136316162;
      v59 = v52;
      v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
      v62 = 1024;
      v63 = 105;
      v64 = 2112;
      v65 = (void *)v48;
      v66 = 2048;
      *(_QWORD *)v67 = self;
      v38 = " [%s] %s:%d %@(%p) streamIDsCell is nil";
      v44 = v53;
      v45 = 48;
    }
    goto LABEL_50;
  }
  streamScheduleCell = self->_streamScheduleCell;
  currentStreamSchedule = self->_currentStreamSchedule;

  self->_streamIDsCell = (NSArray *)objc_msgSend(a3, "copy");
  self->_streamScheduleCell = (NSMutableDictionary *)-[VCSessionUplinkVideoStreamController newVideoStreamKeyFrameScheduleWithStreamIDs:](self, "newVideoStreamKeyFrameScheduleWithStreamIDs:", self->_streamIDsCell);

  self->_schedulerCell = -[VCIDRScheduler initWithStreams:captureFramerate:]([VCIDRScheduler alloc], "initWithStreams:captureFramerate:", -[NSMutableDictionary allValues](self->_streamScheduleCell, "allValues"), self->_captureFrameRate);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v5 = (void *)-[NSMutableDictionary allValues](self->_streamScheduleCell, "allValues");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
  if (!v6)
    goto LABEL_27;
  v7 = v6;
  v8 = *(_QWORD *)v75;
  v57 = v5;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v75 != v8)
        objc_enumerationMutation(v5);
      v10 = *(NSMutableDictionary **)(*((_QWORD *)&v74 + 1) + 8 * v9);
      if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          goto LABEL_22;
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        v22 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          v23 = -[NSMutableDictionary framePosition](v10, "framePosition");
          v24 = -[NSMutableDictionary framesPerIdrPeriod](v10, "framesPerIdrPeriod");
          *(_DWORD *)buf = 136316418;
          v59 = v20;
          v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
          v62 = 1024;
          v63 = 115;
          v64 = 2112;
          v65 = v10;
          v66 = 1024;
          *(_DWORD *)v67 = v23;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v24;
          v17 = v21;
          v18 = " [%s] %s:%d Cell stream %@ position %d, framesPerIdrPeriod %d";
          v19 = 50;
          goto LABEL_18;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v30 = -[NSMutableDictionary framePosition](v10, "framePosition");
          v31 = -[NSMutableDictionary framesPerIdrPeriod](v10, "framesPerIdrPeriod");
          *(_DWORD *)buf = 136316418;
          v59 = v20;
          v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
          v62 = 1024;
          v63 = 115;
          v64 = 2112;
          v65 = v10;
          v66 = 1024;
          *(_DWORD *)v67 = v30;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v31;
          v27 = v21;
          v28 = " [%s] %s:%d Cell stream %@ position %d, framesPerIdrPeriod %d";
          v29 = 50;
          goto LABEL_25;
        }
      }
      else
      {
        v11 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          v14 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              goto LABEL_22;
            v15 = -[NSMutableDictionary framePosition](v10, "framePosition");
            v16 = -[NSMutableDictionary framesPerIdrPeriod](v10, "framesPerIdrPeriod");
            *(_DWORD *)buf = 136316930;
            v59 = v12;
            v60 = 2080;
            v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
            v62 = 1024;
            v63 = 115;
            v64 = 2112;
            v65 = (void *)v11;
            v66 = 2048;
            *(_QWORD *)v67 = self;
            *(_WORD *)&v67[8] = 2112;
            v68 = v10;
            v69 = 1024;
            v70 = v15;
            v5 = v57;
            v71 = 1024;
            v72 = v16;
            v17 = v13;
            v18 = " [%s] %s:%d %@(%p) Cell stream %@ position %d, framesPerIdrPeriod %d";
            v19 = 70;
LABEL_18:
            _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
            goto LABEL_22;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v25 = -[NSMutableDictionary framePosition](v10, "framePosition");
            v26 = -[NSMutableDictionary framesPerIdrPeriod](v10, "framesPerIdrPeriod");
            *(_DWORD *)buf = 136316930;
            v59 = v12;
            v60 = 2080;
            v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
            v62 = 1024;
            v63 = 115;
            v64 = 2112;
            v65 = (void *)v11;
            v66 = 2048;
            *(_QWORD *)v67 = self;
            *(_WORD *)&v67[8] = 2112;
            v68 = v10;
            v69 = 1024;
            v70 = v25;
            v5 = v57;
            v71 = 1024;
            v72 = v26;
            v27 = v13;
            v28 = " [%s] %s:%d %@(%p) Cell stream %@ position %d, framesPerIdrPeriod %d";
            v29 = 70;
LABEL_25:
            _os_log_debug_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEBUG, v28, buf, v29);
          }
        }
      }
LABEL_22:
      ++v9;
    }
    while (v7 != v9);
    v32 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
    v7 = v32;
  }
  while (v32);
LABEL_27:
  if (currentStreamSchedule == streamScheduleCell)
  {
    self->_currentStreamSchedule = self->_streamScheduleCell;
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_51;
      v42 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      v43 = self->_streamScheduleCell;
      *(_DWORD *)buf = 136315906;
      v59 = v42;
      v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
      v62 = 1024;
      v63 = 119;
      v64 = 2112;
      v65 = v43;
      v38 = " [%s] %s:%d StreamScheduleCell (active) is %@";
      goto LABEL_44;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v34 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_51;
    v46 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    v47 = self->_streamScheduleCell;
    *(_DWORD *)buf = 136316418;
    v59 = v46;
    v60 = 2080;
    v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
    v62 = 1024;
    v63 = 119;
    v64 = 2112;
    v65 = (void *)v34;
    v66 = 2048;
    *(_QWORD *)v67 = self;
    *(_WORD *)&v67[8] = 2112;
    v68 = v47;
    v38 = " [%s] %s:%d %@(%p) StreamScheduleCell (active) is %@";
LABEL_49:
    v44 = v40;
    v45 = 58;
LABEL_50:
    _os_log_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_DEFAULT, v38, buf, v45);
    goto LABEL_51;
  }
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_51;
    v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    v37 = self->_streamScheduleCell;
    *(_DWORD *)buf = 136315906;
    v59 = v35;
    v60 = 2080;
    v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
    v62 = 1024;
    v63 = 121;
    v64 = 2112;
    v65 = v37;
    v38 = " [%s] %s:%d StreamScheduleCell is %@";
LABEL_44:
    v44 = v36;
    v45 = 38;
    goto LABEL_50;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v33 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v33 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v41 = self->_streamScheduleCell;
      *(_DWORD *)buf = 136316418;
      v59 = v39;
      v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsCell:]";
      v62 = 1024;
      v63 = 121;
      v64 = 2112;
      v65 = (void *)v33;
      v66 = 2048;
      *(_QWORD *)v67 = self;
      *(_WORD *)&v67[8] = 2112;
      v68 = v41;
      v38 = " [%s] %s:%d %@(%p) StreamScheduleCell is %@";
      goto LABEL_49;
    }
  }
LABEL_51:
  -[VCSessionUplinkVideoStreamController unlock](self, "unlock", streamScheduleCell, currentStreamSchedule);
}

- (void)setStreamIDsWifi:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  int v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  int v23;
  int v24;
  int v25;
  int v26;
  NSObject *v27;
  const char *v28;
  uint32_t v29;
  int v30;
  int v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  NSObject *v36;
  NSMutableDictionary *v37;
  const char *v38;
  uint64_t v39;
  NSObject *v40;
  NSMutableDictionary *v41;
  uint64_t v42;
  NSMutableDictionary *v43;
  NSObject *v44;
  uint32_t v45;
  uint64_t v46;
  NSMutableDictionary *v47;
  const __CFString *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  NSMutableDictionary *streamScheduleWifi;
  NSMutableDictionary *currentStreamSchedule;
  void *v57;
  uint8_t buf[4];
  uint64_t v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  int v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  _BYTE v67[10];
  NSMutableDictionary *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  _BYTE v73[128];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  -[VCSessionUplinkVideoStreamController lock](self, "lock");
  if (!objc_msgSend(a3, "count"))
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_51;
      v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E0CF2758];
      v51 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
          -[VCSessionUplinkVideoStreamController setStreamIDsWifi:].cold.1();
        goto LABEL_51;
      }
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      *(_DWORD *)buf = 136315650;
      v59 = v49;
      v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
      v62 = 1024;
      v63 = 130;
      v38 = " [%s] %s:%d streamIDsWifi is nil";
      v44 = v50;
      v45 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v48 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v48 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 8)
        goto LABEL_51;
      v52 = VRTraceErrorLogLevelToCSTR();
      v53 = *MEMORY[0x1E0CF2758];
      v54 = *MEMORY[0x1E0CF2758];
      if (!*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316162;
          v59 = v52;
          v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
          v62 = 1024;
          v63 = 130;
          v64 = 2112;
          v65 = (void *)v48;
          v66 = 2048;
          *(_QWORD *)v67 = self;
          _os_log_debug_impl(&dword_1D8A54000, v53, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) streamIDsWifi is nil", buf, 0x30u);
        }
        goto LABEL_51;
      }
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      *(_DWORD *)buf = 136316162;
      v59 = v52;
      v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
      v62 = 1024;
      v63 = 130;
      v64 = 2112;
      v65 = (void *)v48;
      v66 = 2048;
      *(_QWORD *)v67 = self;
      v38 = " [%s] %s:%d %@(%p) streamIDsWifi is nil";
      v44 = v53;
      v45 = 48;
    }
    goto LABEL_50;
  }
  streamScheduleWifi = self->_streamScheduleWifi;
  currentStreamSchedule = self->_currentStreamSchedule;

  self->_streamIDsWifi = (NSArray *)objc_msgSend(a3, "copy");
  self->_streamScheduleWifi = (NSMutableDictionary *)-[VCSessionUplinkVideoStreamController newVideoStreamKeyFrameScheduleWithStreamIDs:](self, "newVideoStreamKeyFrameScheduleWithStreamIDs:", self->_streamIDsWifi);

  self->_schedulerWifi = -[VCIDRScheduler initWithStreams:captureFramerate:]([VCIDRScheduler alloc], "initWithStreams:captureFramerate:", -[NSMutableDictionary allValues](self->_streamScheduleWifi, "allValues"), self->_captureFrameRate);
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v5 = (void *)-[NSMutableDictionary allValues](self->_streamScheduleWifi, "allValues");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
  if (!v6)
    goto LABEL_27;
  v7 = v6;
  v8 = *(_QWORD *)v75;
  v57 = v5;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v75 != v8)
        objc_enumerationMutation(v5);
      v10 = *(NSMutableDictionary **)(*((_QWORD *)&v74 + 1) + 8 * v9);
      if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8)
          goto LABEL_22;
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        v22 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          v23 = -[NSMutableDictionary framePosition](v10, "framePosition");
          v24 = -[NSMutableDictionary framesPerIdrPeriod](v10, "framesPerIdrPeriod");
          *(_DWORD *)buf = 136316418;
          v59 = v20;
          v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
          v62 = 1024;
          v63 = 139;
          v64 = 2112;
          v65 = v10;
          v66 = 1024;
          *(_DWORD *)v67 = v23;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v24;
          v17 = v21;
          v18 = " [%s] %s:%d Wifi stream %@, position %d, framesPerIdrPeriod %d";
          v19 = 50;
          goto LABEL_18;
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v30 = -[NSMutableDictionary framePosition](v10, "framePosition");
          v31 = -[NSMutableDictionary framesPerIdrPeriod](v10, "framesPerIdrPeriod");
          *(_DWORD *)buf = 136316418;
          v59 = v20;
          v60 = 2080;
          v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
          v62 = 1024;
          v63 = 139;
          v64 = 2112;
          v65 = v10;
          v66 = 1024;
          *(_DWORD *)v67 = v30;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = v31;
          v27 = v21;
          v28 = " [%s] %s:%d Wifi stream %@, position %d, framesPerIdrPeriod %d";
          v29 = 50;
          goto LABEL_25;
        }
      }
      else
      {
        v11 = &stru_1E9E58EE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          v14 = *MEMORY[0x1E0CF2758];
          if (*MEMORY[0x1E0CF2748])
          {
            if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              goto LABEL_22;
            v15 = -[NSMutableDictionary framePosition](v10, "framePosition");
            v16 = -[NSMutableDictionary framesPerIdrPeriod](v10, "framesPerIdrPeriod");
            *(_DWORD *)buf = 136316930;
            v59 = v12;
            v60 = 2080;
            v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
            v62 = 1024;
            v63 = 139;
            v64 = 2112;
            v65 = (void *)v11;
            v66 = 2048;
            *(_QWORD *)v67 = self;
            *(_WORD *)&v67[8] = 2112;
            v68 = v10;
            v69 = 1024;
            v70 = v15;
            v5 = v57;
            v71 = 1024;
            v72 = v16;
            v17 = v13;
            v18 = " [%s] %s:%d %@(%p) Wifi stream %@, position %d, framesPerIdrPeriod %d";
            v19 = 70;
LABEL_18:
            _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
            goto LABEL_22;
          }
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v25 = -[NSMutableDictionary framePosition](v10, "framePosition");
            v26 = -[NSMutableDictionary framesPerIdrPeriod](v10, "framesPerIdrPeriod");
            *(_DWORD *)buf = 136316930;
            v59 = v12;
            v60 = 2080;
            v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
            v62 = 1024;
            v63 = 139;
            v64 = 2112;
            v65 = (void *)v11;
            v66 = 2048;
            *(_QWORD *)v67 = self;
            *(_WORD *)&v67[8] = 2112;
            v68 = v10;
            v69 = 1024;
            v70 = v25;
            v5 = v57;
            v71 = 1024;
            v72 = v26;
            v27 = v13;
            v28 = " [%s] %s:%d %@(%p) Wifi stream %@, position %d, framesPerIdrPeriod %d";
            v29 = 70;
LABEL_25:
            _os_log_debug_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEBUG, v28, buf, v29);
          }
        }
      }
LABEL_22:
      ++v9;
    }
    while (v7 != v9);
    v32 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
    v7 = v32;
  }
  while (v32);
LABEL_27:
  if (currentStreamSchedule == streamScheduleWifi)
  {
    self->_currentStreamSchedule = self->_streamScheduleWifi;
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_51;
      v42 = VRTraceErrorLogLevelToCSTR();
      v36 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_51;
      v43 = self->_streamScheduleWifi;
      *(_DWORD *)buf = 136315906;
      v59 = v42;
      v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
      v62 = 1024;
      v63 = 143;
      v64 = 2112;
      v65 = v43;
      v38 = " [%s] %s:%d StreamScheduleWifi (active) is %@";
      goto LABEL_44;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v34 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v34 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_51;
    v46 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    v47 = self->_streamScheduleWifi;
    *(_DWORD *)buf = 136316418;
    v59 = v46;
    v60 = 2080;
    v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
    v62 = 1024;
    v63 = 143;
    v64 = 2112;
    v65 = (void *)v34;
    v66 = 2048;
    *(_QWORD *)v67 = self;
    *(_WORD *)&v67[8] = 2112;
    v68 = v47;
    v38 = " [%s] %s:%d %@(%p) StreamScheduleWifi (active) is %@";
LABEL_49:
    v44 = v40;
    v45 = 58;
LABEL_50:
    _os_log_impl(&dword_1D8A54000, v44, OS_LOG_TYPE_DEFAULT, v38, buf, v45);
    goto LABEL_51;
  }
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_51;
    v35 = VRTraceErrorLogLevelToCSTR();
    v36 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_51;
    v37 = self->_streamScheduleWifi;
    *(_DWORD *)buf = 136315906;
    v59 = v35;
    v60 = 2080;
    v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
    v62 = 1024;
    v63 = 145;
    v64 = 2112;
    v65 = v37;
    v38 = " [%s] %s:%d StreamScheduleWifi is %@";
LABEL_44:
    v44 = v36;
    v45 = 38;
    goto LABEL_50;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v33 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v33 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v39 = VRTraceErrorLogLevelToCSTR();
    v40 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v41 = self->_streamScheduleWifi;
      *(_DWORD *)buf = 136316418;
      v59 = v39;
      v60 = 2080;
      v61 = "-[VCSessionUplinkVideoStreamController setStreamIDsWifi:]";
      v62 = 1024;
      v63 = 145;
      v64 = 2112;
      v65 = (void *)v33;
      v66 = 2048;
      *(_QWORD *)v67 = self;
      *(_WORD *)&v67[8] = 2112;
      v68 = v41;
      v38 = " [%s] %s:%d %@(%p) StreamScheduleWifi is %@";
      goto LABEL_49;
    }
  }
LABEL_51:
  -[VCSessionUplinkVideoStreamController unlock](self, "unlock", streamScheduleWifi, currentStreamSchedule);
}

- (void)setPendingVideoStreamsInternal:(id)a3
{
  NSMutableDictionary *v5;
  BOOL v6;

  v5 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  self->_pendingVideoStreams = v5;
  if (-[NSMutableDictionary count](v5, "count"))
  {
    v6 = 1;
  }
  else
  {
    if (-[NSMutableSet count](self->_streamToResume, "count"))
      -[NSMutableSet removeAllObjects](self->_streamToResume, "removeAllObjects");

    self->_streamToPause = (NSMutableSet *)-[NSMutableDictionary mutableCopy](self->_activeVideoStreams, "mutableCopy");
    -[VCSessionUplinkVideoStreamController pauseStreams](self, "pauseStreams");
    v6 = 0;
  }
  self->_pendingStreamsUpdated = v6;
}

- (void)setPendingVideoStreams:(id)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BYTE v13[24];
  __int128 v14;
  VCSessionUplinkVideoStreamController *v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCSessionUplinkVideoStreamController setPendingVideoStreams:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 172;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = objc_msgSend(a3, "allKeys");
        v8 = " [%s] %s:%d Setting pending streams %@";
        v9 = v7;
        v10 = 38;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v5 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v13 = 136316418;
        *(_QWORD *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCSessionUplinkVideoStreamController setPendingVideoStreams:]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 172;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        v15 = self;
        LOWORD(v16) = 2112;
        *(_QWORD *)((char *)&v16 + 2) = objc_msgSend(a3, "allKeys");
        v8 = " [%s] %s:%d %@(%p) Setting pending streams %@";
        v9 = v12;
        v10 = 58;
        goto LABEL_11;
      }
    }
  }
  -[VCSessionUplinkVideoStreamController lock](self, "lock", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15, v16);
  -[VCSessionUplinkVideoStreamController setPendingVideoStreamsInternal:](self, "setPendingVideoStreamsInternal:", a3);
  -[VCSessionUplinkVideoStreamController unlock](self, "unlock");
}

- (void)selectVideoStreamForVideoPriority
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t i;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (self->_dynamicVideoPriorityEnabled)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v3 = (void *)-[NSMutableDictionary allValues](self->_activeVideoStreams, "allValues");
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v22;
      v7 = -1;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v3);
          v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "defaultStreamConfig"), "multiwayConfig"), "qualityIndex");
          if (v7 >= v9)
            v7 = v9;
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
      }
      while (v5);
    }
    else
    {
      v7 = -1;
    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = (void *)-[NSMutableDictionary allValues](self->_activeVideoStreams, "allValues");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "setEncodingMode:", v7 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * j), "defaultStreamConfig"), "multiwayConfig"), "qualityIndex"));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
      }
      while (v12);
    }
  }
}

- (void)printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:(float)a3
{
  double pendingKeyFrameGenerationStartTime;
  double v6;
  double v7;
  const __CFString *v8;
  uint64_t v9;
  NSObject *v10;
  NSMutableArray *streamsPendingKeyFrameGeneration;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  NSMutableArray *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  __int16 v26;
  VCSessionUplinkVideoStreamController *v27;
  __int16 v28;
  double v29;
  __int16 v30;
  NSMutableArray *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_streamsPendingKeyFrameGeneration, "count"))
  {
    self->_pendingKeyFrameGenerationStartTime = 0.0;
    return;
  }
  pendingKeyFrameGenerationStartTime = self->_pendingKeyFrameGenerationStartTime;
  v6 = a3;
  if (pendingKeyFrameGenerationStartTime == 0.0)
  {
    self->_pendingKeyFrameGenerationStartTime = v6;
    return;
  }
  v7 = v6 - pendingKeyFrameGenerationStartTime;
  if (v6 - pendingKeyFrameGenerationStartTime > 3.0)
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_15;
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      streamsPendingKeyFrameGeneration = self->_streamsPendingKeyFrameGeneration;
      v18 = 136316162;
      v19 = v9;
      v20 = 2080;
      v21 = "-[VCSessionUplinkVideoStreamController printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:]";
      v22 = 1024;
      v23 = 196;
      v24 = 2048;
      v25 = v7;
      v26 = 2112;
      v27 = (VCSessionUplinkVideoStreamController *)streamsPendingKeyFrameGeneration;
      v12 = " [%s] %s:%d _streamsPendingKeyFrameGeneration array has been non zero for %5.2f seconds, streams=%@";
      v13 = v10;
      v14 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v8 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v8 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_15;
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v17 = self->_streamsPendingKeyFrameGeneration;
      v18 = 136316674;
      v19 = v15;
      v20 = 2080;
      v21 = "-[VCSessionUplinkVideoStreamController printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:]";
      v22 = 1024;
      v23 = 196;
      v24 = 2112;
      v25 = *(double *)&v8;
      v26 = 2048;
      v27 = self;
      v28 = 2048;
      v29 = v7;
      v30 = 2112;
      v31 = v17;
      v12 = " [%s] %s:%d %@(%p) _streamsPendingKeyFrameGeneration array has been non zero for %5.2f seconds, streams=%@";
      v13 = v16;
      v14 = 68;
    }
    _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
LABEL_15:
    reportingSymptom();
  }
}

- (void)setCurrentFrameTime:(float)a3
{
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
  BOOL v15;
  uint64_t v16;
  void *v17;
  NSMutableSet *v18;
  NSMutableSet *v19;
  BOOL v20;
  id v21;
  double v22;
  _BYTE v23[24];
  __int128 v24;
  VCSessionUplinkVideoStreamController *v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VCSessionUplinkVideoStreamController lock](self, "lock");
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8)
      goto LABEL_18;
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    v8 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)v23 = 136315906;
      *(_QWORD *)&v23[4] = v6;
      *(_WORD *)&v23[12] = 2080;
      *(_QWORD *)&v23[14] = "-[VCSessionUplinkVideoStreamController setCurrentFrameTime:]";
      *(_WORD *)&v23[22] = 1024;
      LODWORD(v24) = 204;
      WORD2(v24) = 2048;
      *(double *)((char *)&v24 + 6) = a3;
      v9 = " [%s] %s:%d FrameTime is %f";
      v10 = v7;
      v11 = 38;
LABEL_13:
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, v9, v23, v11);
      goto LABEL_18;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[VCSessionUplinkVideoStreamController setCurrentFrameTime:].cold.1(v6);
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
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
          goto LABEL_18;
        *(_DWORD *)v23 = 136316418;
        *(_QWORD *)&v23[4] = v12;
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[VCSessionUplinkVideoStreamController setCurrentFrameTime:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 204;
        WORD2(v24) = 2112;
        *(_QWORD *)((char *)&v24 + 6) = v5;
        HIWORD(v24) = 2048;
        v25 = self;
        LOWORD(v26) = 2048;
        *(double *)((char *)&v26 + 2) = a3;
        v9 = " [%s] %s:%d %@(%p) FrameTime is %f";
        v10 = v13;
        v11 = 58;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v23 = 136316418;
        *(_QWORD *)&v23[4] = v12;
        *(_WORD *)&v23[12] = 2080;
        *(_QWORD *)&v23[14] = "-[VCSessionUplinkVideoStreamController setCurrentFrameTime:]";
        *(_WORD *)&v23[22] = 1024;
        LODWORD(v24) = 204;
        WORD2(v24) = 2112;
        *(_QWORD *)((char *)&v24 + 6) = v5;
        HIWORD(v24) = 2048;
        v25 = self;
        LOWORD(v26) = 2048;
        *(double *)((char *)&v26 + 2) = a3;
        _os_log_debug_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) FrameTime is %f", v23, 0x3Au);
      }
    }
  }
LABEL_18:
  if (self->_startTime == 0.0)
    self->_startTime = a3;
  self->_currentFrameTime = a3;
  if (self->_pendingStreamsUpdated)
  {
    v15 = -[VCSessionUplinkVideoStreamController filterPendingTemporalStreams](self, "filterPendingTemporalStreams");
    v16 = objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", -[NSMutableDictionary allKeys](self->_pendingVideoStreams, "allKeys"));
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", -[NSMutableDictionary allKeys](self->_activeVideoStreams, "allKeys"));
    v18 = (NSMutableSet *)objc_msgSend((id)v16, "mutableCopy");
    v19 = (NSMutableSet *)objc_msgSend(v17, "mutableCopy");
    -[NSMutableSet minusSet:](v18, "minusSet:", v17);
    -[NSMutableSet minusSet:](v19, "minusSet:", v16);

    self->_streamToPause = v19;
    self->_streamToResume = v18;
    LOBYTE(v16) = -[VCSessionUplinkVideoStreamController pauseStreams](self, "pauseStreams");
    v20 = -[VCSessionUplinkVideoStreamController resumeStreams](self, "resumeStreams");
    self->_pendingStreamsUpdated = 0;
    if ((v16 & 1) != 0 || v20 || v15)
    {
LABEL_27:
      v21 = -[VCSessionUplinkVideoStreamController delegate](self, "delegate", *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25, v26);
      objc_msgSend(v21, "controller:didChangeActiveVideoStreams:", self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_activeVideoStreams));
    }
  }
  else if (-[NSMutableSet count](self->_streamToResume, "count")
         && -[VCSessionUplinkVideoStreamController resumeStreams](self, "resumeStreams"))
  {
    goto LABEL_27;
  }
  if (-[NSMutableArray count](self->_streamsPendingKeyFrameGeneration, "count", *(_QWORD *)v23, *(_OWORD *)&v23[8], v24))
  {
    -[VCSessionUplinkVideoStreamController handleStreamsPendingKeyFrameGeneration](self, "handleStreamsPendingKeyFrameGeneration");
  }
  *(float *)&v22 = a3;
  -[VCSessionUplinkVideoStreamController printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:](self, "printPendingKeyFrameWarningOnThresholdTimeElapsedWithCurrentFrameTime:", v22);
  if (-[NSMutableArray count](self->_streamResetIDR, "count"))
    -[VCSessionUplinkVideoStreamController handleStreamsResetIDR](self, "handleStreamsResetIDR");
  -[VCSessionUplinkVideoStreamController unlock](self, "unlock");
}

- (void)setIsLocalOnCellular:(BOOL)a3 cappedVideoStreamIDs:(id)a4
{
  _BOOL4 v5;
  const __CFString *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  unsigned int v26;
  float v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  _BYTE v42[24];
  _BYTE v43[24];
  __int128 v44;
  uint64_t v45;

  v5 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  -[VCSessionUplinkVideoStreamController lock](self, "lock");
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v42 = 136316162;
        *(_QWORD *)&v42[4] = v8;
        *(_WORD *)&v42[12] = 2080;
        *(_QWORD *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
        *(_WORD *)&v42[22] = 1024;
        *(_DWORD *)v43 = 256;
        *(_WORD *)&v43[4] = 1024;
        *(_DWORD *)&v43[6] = v5;
        *(_WORD *)&v43[10] = 2112;
        *(_QWORD *)&v43[12] = a4;
        v10 = " [%s] %s:%d Current interface isLocalOnCellular %d %@";
        v11 = v9;
        v12 = 44;
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v42, v12);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v7 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v42 = 136316674;
        *(_QWORD *)&v42[4] = v13;
        *(_WORD *)&v42[12] = 2080;
        *(_QWORD *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
        *(_WORD *)&v42[22] = 1024;
        *(_DWORD *)v43 = 256;
        *(_WORD *)&v43[4] = 2112;
        *(_QWORD *)&v43[6] = v7;
        *(_WORD *)&v43[14] = 2048;
        *(_QWORD *)&v43[16] = self;
        LOWORD(v44) = 1024;
        *(_DWORD *)((char *)&v44 + 2) = v5;
        WORD3(v44) = 2112;
        *((_QWORD *)&v44 + 1) = a4;
        v10 = " [%s] %s:%d %@(%p) Current interface isLocalOnCellular %d %@";
        v11 = v14;
        v12 = 64;
        goto LABEL_11;
      }
    }
  }
  v15 = 64;
  if (v5)
    v15 = 72;
  self->_currentStreamSchedule = *(NSMutableDictionary **)((char *)&self->super.isa + v15);
  v16 = -[VCSessionUplinkVideoStreamController anchorStreamIDWithCappedVideoStreamIDs:](self, "anchorStreamIDWithCappedVideoStreamIDs:", a4, *(_OWORD *)v42, *(_QWORD *)&v42[16], *(_OWORD *)v43, *(_QWORD *)&v43[16], v44);
  if (!v16)
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_21;
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_DWORD *)v42 = 136315650;
      *(_QWORD *)&v42[4] = v31;
      *(_WORD *)&v42[12] = 2080;
      *(_QWORD *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
      *(_WORD *)&v42[22] = 1024;
      *(_DWORD *)v43 = 265;
      v33 = " [%s] %s:%d anchor stream doesn't exist";
      v34 = v32;
      v35 = 28;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v28 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        goto LABEL_21;
      v36 = VRTraceErrorLogLevelToCSTR();
      v37 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_DWORD *)v42 = 136316162;
      *(_QWORD *)&v42[4] = v36;
      *(_WORD *)&v42[12] = 2080;
      *(_QWORD *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
      *(_WORD *)&v42[22] = 1024;
      *(_DWORD *)v43 = 265;
      *(_WORD *)&v43[4] = 2112;
      *(_QWORD *)&v43[6] = v28;
      *(_WORD *)&v43[14] = 2048;
      *(_QWORD *)&v43[16] = self;
      v33 = " [%s] %s:%d %@(%p) anchor stream doesn't exist";
      v34 = v37;
      v35 = 48;
    }
    _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, v33, v42, v35);
    goto LABEL_21;
  }
  v17 = v16;
  v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_streamScheduleWifi, "objectForKeyedSubscript:", v16);
  if (v18)
  {
    v19 = (void *)v18;
    v20 = -[NSMutableDictionary objectForKeyedSubscript:](self->_streamScheduleCell, "objectForKeyedSubscript:", v17);
    if (v20)
    {
      v21 = (void *)v20;
      v22 = (float)objc_msgSend(v19, "framePosition");
      v23 = v22 / (float)objc_msgSend(v19, "framesPerIdrPeriod");
      v24 = (float)objc_msgSend(v21, "framePosition");
      v25 = v24 / (float)objc_msgSend(v21, "framesPerIdrPeriod");
      v26 = objc_msgSend(v19, "keyFrameInterval") / 0x3E8;
      if (v5)
        v27 = v23 - v25;
      else
        v27 = v25 - v23;
      self->_currentFrameTime = self->_currentFrameTime - (float)(v27 * (float)v26);
      goto LABEL_21;
    }
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:].cold.2();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v30 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v30 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v41 = VRTraceErrorLogLevelToCSTR();
        v39 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v42 = 136316418;
          *(_QWORD *)&v42[4] = v41;
          *(_WORD *)&v42[12] = 2080;
          *(_QWORD *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
          *(_WORD *)&v42[22] = 1024;
          *(_DWORD *)v43 = 269;
          *(_WORD *)&v43[4] = 2112;
          *(_QWORD *)&v43[6] = v30;
          *(_WORD *)&v43[14] = 2048;
          *(_QWORD *)&v43[16] = self;
          LOWORD(v44) = 2112;
          *(_QWORD *)((char *)&v44 + 2) = v17;
          v40 = " [%s] %s:%d %@(%p) schedule for anchor stream %@ on cell not found";
          goto LABEL_53;
        }
      }
    }
  }
  else if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:].cold.1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v29 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v29 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v42 = 136316418;
        *(_QWORD *)&v42[4] = v38;
        *(_WORD *)&v42[12] = 2080;
        *(_QWORD *)&v42[14] = "-[VCSessionUplinkVideoStreamController setIsLocalOnCellular:cappedVideoStreamIDs:]";
        *(_WORD *)&v42[22] = 1024;
        *(_DWORD *)v43 = 267;
        *(_WORD *)&v43[4] = 2112;
        *(_QWORD *)&v43[6] = v29;
        *(_WORD *)&v43[14] = 2048;
        *(_QWORD *)&v43[16] = self;
        LOWORD(v44) = 2112;
        *(_QWORD *)((char *)&v44 + 2) = v17;
        v40 = " [%s] %s:%d %@(%p) schedule for anchor stream %@ on Wifi not found";
LABEL_53:
        _os_log_error_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_ERROR, v40, v42, 0x3Au);
      }
    }
  }
LABEL_21:
  -[VCSessionUplinkVideoStreamController unlock](self, "unlock", *(_QWORD *)v42, *(_OWORD *)&v42[8], *(_OWORD *)v43, *(_QWORD *)&v43[16], v44);
}

- (void)generateKeyFrameWithStreamID:(id)a3 firType:(int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a4;
  v19 = *MEMORY[0x1E0C80C00];
  -[VCSessionUplinkVideoStreamController lock](self, "lock");
  if (self->_shouldSkipIDRScheduler)
  {
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_activeVideoStreams, "objectForKeyedSubscript:", a3))
    {
      v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_activeVideoStreams, "objectForKeyedSubscript:", a3);
LABEL_16:
      objc_msgSend(v7, "generateKeyFrameWithFIRType:", v4);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v8 = (void *)-[NSMutableDictionary allValues](self->_activeVideoStreams, "allValues");
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            if (objc_msgSend((id)objc_msgSend(v13, "compoundStreamIDs"), "containsObject:", a3))
            {
              v7 = v13;
              goto LABEL_16;
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
          if (v10)
            continue;
          break;
        }
      }
    }
  }
  else if ((-[NSMutableArray containsObject:](self->_streamsPendingKeyFrameGeneration, "containsObject:", a3) & 1) == 0)
  {
    -[NSMutableArray addObject:](self->_streamsPendingKeyFrameGeneration, "addObject:", a3);
  }
  -[VCSessionUplinkVideoStreamController unlock](self, "unlock");
}

- (BOOL)setStreamsUseRTCPWithStreamInfos:(id)a3
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BYTE v37[18];
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  _BYTE v42[128];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a3
    || !objc_msgSend(a3, "count")
    || !objc_msgSend((id)objc_msgSend(a3, "firstObject"), "streamConfigs")
    || !objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "streamConfigs"), "count"))
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() != self)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v17 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v17 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_44;
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v16)
      {
        *(_DWORD *)buf = 136316162;
        v31 = v18;
        v32 = 2080;
        v33 = "-[VCSessionUplinkVideoStreamController setStreamsUseRTCPWithStreamInfos:]";
        v34 = 1024;
        v35 = 308;
        v36 = 2112;
        *(_QWORD *)v37 = v17;
        *(_WORD *)&v37[8] = 2048;
        *(_QWORD *)&v37[10] = self;
        v23 = " [%s] %s:%d %@(%p) StreamInfo array is nil, empty, or its streamConfigs array is nil or empty.";
        v24 = v19;
        v25 = 48;
LABEL_43:
        _os_log_error_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_ERROR, v23, buf, v25);
        goto LABEL_44;
      }
      goto LABEL_30;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v16)
      {
LABEL_30:
        LOBYTE(v5) = 0;
        goto LABEL_45;
      }
      -[VCSessionUplinkVideoStreamController setStreamsUseRTCPWithStreamInfos:].cold.1();
    }
LABEL_44:
    LOBYTE(v5) = 0;
    LOBYTE(v16) = 0;
    goto LABEL_45;
  }
  v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "firstObject"), "streamConfigs"), "firstObject"), "isRTCPEnabled");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v49;
LABEL_7:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v8)
        objc_enumerationMutation(a3);
      v10 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v9);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v29 = v10;
      v11 = (void *)objc_msgSend(v10, "streamConfigs");
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
      if (v12)
        break;
LABEL_18:
      if (++v9 == v7)
      {
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v48, v47, 16);
        LOBYTE(v16) = 1;
        if (v7)
          goto LABEL_7;
        goto LABEL_45;
      }
    }
    v13 = v12;
    v14 = *(_QWORD *)v44;
LABEL_12:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v14)
        objc_enumerationMutation(v11);
      if (v5 != objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v15), "isRTCPEnabled"))
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v42, 16);
        if (v13)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_44;
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v16)
      {
        *(_DWORD *)buf = 136316162;
        v31 = v21;
        v32 = 2080;
        v33 = "-[VCSessionUplinkVideoStreamController setStreamsUseRTCPWithStreamInfos:]";
        v34 = 1024;
        v35 = 318;
        v36 = 1024;
        *(_DWORD *)v37 = v5;
        *(_WORD *)&v37[4] = 2048;
        *(_QWORD *)&v37[6] = objc_msgSend(v29, "stream");
        v23 = " [%s] %s:%d Invalid RTCP config. firstStreamRTCPEnabled=%d but stream=%p has a different value. All stream"
              "s must have matching isRTCPEnabled values.";
        v24 = v22;
        v25 = 44;
        goto LABEL_43;
      }
      goto LABEL_30;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_44;
    v26 = VRTraceErrorLogLevelToCSTR();
    v27 = *MEMORY[0x1E0CF2758];
    v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!v16)
      goto LABEL_30;
    *(_DWORD *)buf = 136316674;
    v31 = v26;
    v32 = 2080;
    v33 = "-[VCSessionUplinkVideoStreamController setStreamsUseRTCPWithStreamInfos:]";
    v34 = 1024;
    v35 = 318;
    v36 = 2112;
    *(_QWORD *)v37 = v20;
    *(_WORD *)&v37[8] = 2048;
    *(_QWORD *)&v37[10] = self;
    v38 = 1024;
    v39 = v5;
    v40 = 2048;
    v41 = objc_msgSend(v29, "stream");
    v23 = " [%s] %s:%d %@(%p) Invalid RTCP config. firstStreamRTCPEnabled=%d but stream=%p has a different value. All str"
          "eams must have matching isRTCPEnabled values.";
    v24 = v27;
    v25 = 64;
    goto LABEL_43;
  }
  LOBYTE(v16) = 1;
LABEL_45:
  self->_streamsUseRTCP = v5;
  return v16;
}

- (id)anchorStreamIDWithCappedVideoStreamIDs:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  const __CFString *v16;
  uint64_t v17;
  NSObject *v18;
  _BYTE v20[128];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  VCSessionUplinkVideoStreamController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", -[NSMutableDictionary allKeys](self->_activeVideoStreams, "allKeys"));
  objc_msgSend(v5, "intersectSet:", objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", a3));
  if (!objc_msgSend(v5, "count"))
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCSessionUplinkVideoStreamController anchorStreamIDWithCappedVideoStreamIDs:].cold.1();
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v16 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v16 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v26 = v17;
          v27 = 2080;
          v28 = "-[VCSessionUplinkVideoStreamController anchorStreamIDWithCappedVideoStreamIDs:]";
          v29 = 1024;
          v30 = 333;
          v31 = 2112;
          v32 = v16;
          v33 = 2048;
          v34 = self;
          _os_log_error_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) no streams available", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  v6 = (void *)objc_msgSend(v5, "allObjects");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = 0;
  v10 = 0;
  v11 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v22 != v11)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      v14 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInfoMap, "objectForKeyedSubscript:", v13), "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
      if (objc_msgSend(v14, "maxNetworkBitrate") > v9)
      {
        v9 = objc_msgSend(v14, "maxNetworkBitrate");
        v10 = v13;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v20, 16);
  }
  while (v8);
  if (v10)
  {

    v15 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
    self->_streamResetIDR = v15;
    -[NSMutableArray removeObject:](v15, "removeObject:", v10);
  }
  return v10;
}

- (void)initilizeStreamInfoMapWithStreamInfos:(id)a3
{
  unint64_t v4;
  os_log_t *v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  NSMutableDictionary *streamInfoMap;
  const char *v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  char *v34;
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
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v42;
    v4 = 0x1E0CB3000uLL;
    v5 = (os_log_t *)MEMORY[0x1E0CF2758];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(a3);
        v18 = v6;
        v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v20 = (id)objc_msgSend(v7, "streamConfigs");
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
        if (v22)
        {
          v21 = *(_QWORD *)v37;
          v19 = v7;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v37 != v21)
                objc_enumerationMutation(v20);
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamInfoMap, "setObject:forKeyedSubscript:", v7, objc_msgSend(*(id *)(v4 + 2024), "numberWithUnsignedShort:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "multiwayConfig"), "idsStreamID")));
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                __str = 0;
                streamInfoMap = self->_streamInfoMap;
                v10 = streamInfoMap
                    ? (const char *)objc_msgSend((id)-[NSMutableDictionary description](streamInfoMap, "description"), "UTF8String"): "<nil>";
                asprintf(&__str, "(%p) %s", self, v10);
                if (__str)
                {
                  v11 = v4;
                  __lasts = 0;
                  v12 = strtok_r(__str, "\n", &__lasts);
                  do
                  {
                    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                    {
                      v13 = VRTraceErrorLogLevelToCSTR();
                      v14 = *v5;
                      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136316162;
                        v26 = v13;
                        v27 = 2080;
                        v28 = "-[VCSessionUplinkVideoStreamController initilizeStreamInfoMapWithStreamInfos:]";
                        v29 = 1024;
                        v30 = 360;
                        v31 = 2080;
                        v32 = "_streamInfoMap:";
                        v33 = 2080;
                        v34 = v12;
                        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                      }
                    }
                    v12 = strtok_r(0, "\n", &__lasts);
                  }
                  while (v12);
                  free(__str);
                  v4 = v11;
                  v7 = v19;
                }
              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
          }
          while (v22);
        }
        v6 = v18 + 1;
      }
      while (v18 + 1 != v17);
      v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
    }
    while (v17);
  }
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (BOOL)resumeStreams
{
  id v3;
  NSMutableSet *streamToResume;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  NSMutableDictionary *activeVideoStreams;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  NSObject *v22;
  NSMutableDictionary *v23;
  const __CFString *v25;
  uint64_t v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  _BYTE v35[18];
  __int16 v36;
  _BYTE v37[14];
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  streamToResume = self->_streamToResume;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](streamToResume, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(streamToResume);
        v10 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v11 = objc_msgSend(-[VCSessionUplinkVideoStreamController getMultiwayConfigForStreamID:](self, "getMultiwayConfigForStreamID:", v10), "isTemporalStream");
        v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentStreamSchedule, "objectForKeyedSubscript:", v10);
        if (!v12 && (v11 & 1) == 0 && !self->_shouldSkipIDRScheduler)
        {
          if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCSessionUplinkVideoStreamController resumeStreams].cold.1();
            }
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v25 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v25 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              v26 = VRTraceErrorLogLevelToCSTR();
              v27 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              {
                v28 = 136316418;
                v29 = v26;
                v30 = 2080;
                v31 = "-[VCSessionUplinkVideoStreamController resumeStreams]";
                v32 = 1024;
                v33 = 379;
                v34 = 2112;
                *(_QWORD *)v35 = v25;
                *(_WORD *)&v35[8] = 2048;
                *(_QWORD *)&v35[10] = self;
                v36 = 2112;
                *(_QWORD *)v37 = v10;
                _os_log_error_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Non temporal stream's schedule is nil for streamID %@", (uint8_t *)&v28, 0x3Au);
              }
            }
          }
          goto LABEL_23;
        }
        if (((-[VCSessionUplinkVideoStreamController shouldGenerateIDRWithStreamSchedule:](self, "shouldGenerateIDRWithStreamSchedule:", v12) | v11) & 1) != 0|| self->_shouldSkipIDRScheduler)
        {
          v13 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_videoStreams, "objectForKeyedSubscript:", v10);
          if (objc_msgSend(v13, "state") == 4)
            objc_msgSend(v13, "setPause:", 0);
          if (self->_streamsUseRTCP)
            objc_msgSend(v13, "setRtcpEnabled:", 1);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeVideoStreams, "setObject:forKeyedSubscript:", v13, v10);
          objc_msgSend(v3, "addObject:", v10);
          v7 = 1;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](streamToResume, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      if (v6)
        continue;
      break;
    }
    -[VCSessionUplinkVideoStreamController setCachedActiveVideoStreams:](self, "setCachedActiveVideoStreams:", self->_activeVideoStreams);
    if (v7)
    {
      -[NSMutableSet minusSet:](self->_streamToResume, "minusSet:", v3);
      v7 = 1;
      goto LABEL_22;
    }
  }
  else
  {
    -[VCSessionUplinkVideoStreamController setCachedActiveVideoStreams:](self, "setCachedActiveVideoStreams:", self->_activeVideoStreams);
  }
  v7 = 0;
LABEL_22:
  -[VCSessionUplinkVideoStreamController selectVideoStreamForVideoPriority](self, "selectVideoStreamForVideoPriority");
LABEL_23:

  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        activeVideoStreams = self->_activeVideoStreams;
        v28 = 136316162;
        v29 = v15;
        v30 = 2080;
        v31 = "-[VCSessionUplinkVideoStreamController resumeStreams]";
        v32 = 1024;
        v33 = 401;
        v34 = 1024;
        *(_DWORD *)v35 = v7;
        *(_WORD *)&v35[4] = 2112;
        *(_QWORD *)&v35[6] = activeVideoStreams;
        v18 = " [%s] %s:%d streamResumed %d activeVideoStreams %@";
        v19 = v16;
        v20 = 44;
LABEL_33:
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v28, v20);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v14 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v21 = VRTraceErrorLogLevelToCSTR();
      v22 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = self->_activeVideoStreams;
        v28 = 136316674;
        v29 = v21;
        v30 = 2080;
        v31 = "-[VCSessionUplinkVideoStreamController resumeStreams]";
        v32 = 1024;
        v33 = 401;
        v34 = 2112;
        *(_QWORD *)v35 = v14;
        *(_WORD *)&v35[8] = 2048;
        *(_QWORD *)&v35[10] = self;
        v36 = 1024;
        *(_DWORD *)v37 = v7;
        *(_WORD *)&v37[4] = 2112;
        *(_QWORD *)&v37[6] = v23;
        v18 = " [%s] %s:%d %@(%p) streamResumed %d activeVideoStreams %@";
        v19 = v22;
        v20 = 64;
        goto LABEL_33;
      }
    }
  }
  return v7;
}

- (BOOL)shouldGenerateIDRWithStreamSchedule:(id)a3
{
  float v5;
  unsigned int v6;
  float v7;
  float v8;
  float v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  double currentFrameTime;
  double startTime;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  double v20;
  double v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = self->_currentFrameTime - self->_startTime;
  v6 = objc_msgSend(a3, "keyFrameInterval");
  v7 = (float)(v5 - (float)((float)(int)(float)(v5 / (float)(v6 / 0x3E8)) * (float)(v6 / 0x3E8))) / (float)(v6 / 0x3E8);
  v8 = (float)objc_msgSend(a3, "framePosition");
  v9 = v8 / (float)objc_msgSend(a3, "framesPerIdrPeriod");
  if (v7 < v9 && -[NSMutableArray count](self->_streamsPendingKeyFrameGeneration, "count"))
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          currentFrameTime = self->_currentFrameTime;
          startTime = self->_startTime;
          v23 = 136316674;
          v24 = v11;
          v25 = 2080;
          v26 = "-[VCSessionUplinkVideoStreamController shouldGenerateIDRWithStreamSchedule:]";
          v27 = 1024;
          v28 = 418;
          v29 = 2048;
          v30 = v7;
          v31 = 2048;
          v32 = v9;
          v33 = 2048;
          v34 = currentFrameTime;
          v35 = 2048;
          v36 = startTime;
          v15 = " [%s] %s:%d reminderTimePercentage=%3.2f, expectedTimePercentage=%3.2f, _currentFrameTime=%5.2f, _startTime=%5.2f.";
          v16 = v12;
          v17 = 68;
LABEL_13:
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v23, v17);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        *(double *)&v10 = COERCE_DOUBLE(-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix));
      else
        *(double *)&v10 = COERCE_DOUBLE(&stru_1E9E58EE0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v20 = self->_currentFrameTime;
          v21 = self->_startTime;
          v23 = 136317186;
          v24 = v18;
          v25 = 2080;
          v26 = "-[VCSessionUplinkVideoStreamController shouldGenerateIDRWithStreamSchedule:]";
          v27 = 1024;
          v28 = 418;
          v29 = 2112;
          v30 = *(double *)&v10;
          v31 = 2048;
          v32 = *(double *)&self;
          v33 = 2048;
          v34 = v7;
          v35 = 2048;
          v36 = v9;
          v37 = 2048;
          v38 = v20;
          v39 = 2048;
          v40 = v21;
          v15 = " [%s] %s:%d %@(%p) reminderTimePercentage=%3.2f, expectedTimePercentage=%3.2f, _currentFrameTime=%5.2f, "
                "_startTime=%5.2f.";
          v16 = v19;
          v17 = 88;
          goto LABEL_13;
        }
      }
    }
  }
  return v7 >= v9;
}

- (BOOL)pauseStreams
{
  NSMutableSet *streamToPause;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  NSMutableDictionary *activeVideoStreams;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  uint64_t v18;
  NSObject *v19;
  NSMutableDictionary *v20;
  _BYTE v22[24];
  _BYTE v23[24];
  uint64_t v24;
  NSMutableDictionary *v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  streamToPause = self->_streamToPause;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](streamToPause, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)v28;
    v7 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(streamToPause);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v10 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_activeVideoStreams, "objectForKeyedSubscript:", v9);
        if (objc_msgSend(v10, "state") == 2)
        {
          if (self->_streamsUseRTCP)
            objc_msgSend(v10, "setRtcpEnabled:", 0);
          objc_msgSend(v10, "setPause:", 1);
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeVideoStreams, "setObject:forKeyedSubscript:", 0, v9);
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](streamToPause, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
    }
    while (v7);
  }
  -[VCSessionUplinkVideoStreamController setCachedActiveVideoStreams:](self, "setCachedActiveVideoStreams:", self->_activeVideoStreams);
  -[NSMutableSet removeAllObjects](self->_streamToPause, "removeAllObjects");
  if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        activeVideoStreams = self->_activeVideoStreams;
        *(_DWORD *)v22 = 136316162;
        *(_QWORD *)&v22[4] = v12;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VCSessionUplinkVideoStreamController pauseStreams]";
        *(_WORD *)&v22[22] = 1024;
        *(_DWORD *)v23 = 440;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v5 != 0;
        *(_WORD *)&v23[10] = 2112;
        *(_QWORD *)&v23[12] = activeVideoStreams;
        v15 = " [%s] %s:%d streamPaused %d activeVideoStreams %@";
        v16 = v13;
        v17 = 44;
LABEL_22:
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, v15, v22, v17);
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v11 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v20 = self->_activeVideoStreams;
        *(_DWORD *)v22 = 136316674;
        *(_QWORD *)&v22[4] = v18;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VCSessionUplinkVideoStreamController pauseStreams]";
        *(_WORD *)&v22[22] = 1024;
        *(_DWORD *)v23 = 440;
        *(_WORD *)&v23[4] = 2112;
        *(_QWORD *)&v23[6] = v11;
        *(_WORD *)&v23[14] = 2048;
        *(_QWORD *)&v23[16] = self;
        LOWORD(v24) = 1024;
        *(_DWORD *)((char *)&v24 + 2) = v5 != 0;
        HIWORD(v24) = 2112;
        v25 = v20;
        v15 = " [%s] %s:%d %@(%p) streamPaused %d activeVideoStreams %@";
        v16 = v19;
        v17 = 64;
        goto LABEL_22;
      }
    }
  }
  -[VCSessionUplinkVideoStreamController selectVideoStreamForVideoPriority](self, "selectVideoStreamForVideoPriority", *(_OWORD *)v22, *(_QWORD *)&v22[16], *(_OWORD *)v23, *(_QWORD *)&v23[16], v24, v25);
  return v5 != 0;
}

- (void)handleStreamsPendingKeyFrameGeneration
{
  id v3;
  id v4;
  NSMutableArray *streamsPendingKeyFrameGeneration;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  char v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  streamsPendingKeyFrameGeneration = self->_streamsPendingKeyFrameGeneration;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamsPendingKeyFrameGeneration, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(streamsPendingKeyFrameGeneration);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v17 = 0;
        v11 = -[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:](self, "videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:", v10, &v17);
        if (v17)
        {
          v12 = v11;
          objc_msgSend(v3, "addObject:", v10);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamsPendingKeyFrameGeneration, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v7);
  }
  if (objc_msgSend(v3, "count"))
  {
    -[NSMutableArray removeObjectsInArray:](self->_streamsPendingKeyFrameGeneration, "removeObjectsInArray:", v3);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "generateKeyFrameWithFIRType:", 0);
        }
        v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
      }
      while (v14);
    }
  }

}

- (id)videoStreamPendingKeyFrameGenerationWithStreamID:(id)a3 shouldRemoveFromPendingArray:(BOOL *)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  VCSessionUplinkVideoStreamController *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  NSMutableDictionary *activeVideoStreams;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  NSMutableDictionary *v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  uint64_t v37;
  NSObject *v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  id v46;
  __int16 v47;
  VCSessionUplinkVideoStreamController *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  VCSessionUplinkVideoStreamController *v52;
  __int16 v53;
  NSMutableDictionary *v54;
  _BYTE v55[128];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v7 = (void *)-[NSMutableDictionary allValues](self->_activeVideoStreams, "allValues");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
  if (!v8)
    goto LABEL_9;
  v9 = v8;
  v10 = *(_QWORD *)v57;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v57 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v11);
    if ((objc_msgSend((id)objc_msgSend(v12, "compoundStreamIDs"), "containsObject:", a3) & 1) != 0)
      break;
    if (v9 == ++v11)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v56, v55, 16);
      if (v9)
        goto LABEL_3;
LABEL_9:
      if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:].cold.1();
        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v13 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          {
            v39 = 136316418;
            v40 = v20;
            v41 = 2080;
            v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFr"
                  "omPendingArray:]";
            v43 = 1024;
            v44 = 483;
            v45 = 2112;
            v46 = (id)v13;
            v47 = 2048;
            v48 = self;
            v49 = 2112;
            v50 = a3;
            _os_log_error_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Requesting a streamID %@ that is not in any of the compound streamIDs", (uint8_t *)&v39, 0x3Au);
          }
        }
      }
      v14 = 0;
LABEL_30:
      v16 = 0;
      goto LABEL_17;
    }
  }
  v14 = (VCSessionUplinkVideoStreamController *)objc_msgSend((id)objc_msgSend(v12, "sendingStreamID"), "copy");
  v15 = -[NSMutableDictionary objectForKeyedSubscript:](self->_activeVideoStreams, "objectForKeyedSubscript:", v14);
  if (!v15)
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_30;
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      activeVideoStreams = self->_activeVideoStreams;
      v39 = 136316418;
      v40 = v22;
      v41 = 2080;
      v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:]";
      v43 = 1024;
      v44 = 485;
      v45 = 2112;
      v46 = a3;
      v47 = 2112;
      v48 = v14;
      v49 = 2112;
      v50 = activeVideoStreams;
      v25 = " [%s] %s:%d  Stream is nil for streamID %@, sendingStreamID %@ activeVideoStreams %@";
      v26 = v23;
      v27 = 58;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v19 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v19 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_30;
      v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      v31 = self->_activeVideoStreams;
      v39 = 136316930;
      v40 = v29;
      v41 = 2080;
      v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:]";
      v43 = 1024;
      v44 = 485;
      v45 = 2112;
      v46 = (id)v19;
      v47 = 2048;
      v48 = self;
      v49 = 2112;
      v50 = a3;
      v51 = 2112;
      v52 = v14;
      v53 = 2112;
      v54 = v31;
      v25 = " [%s] %s:%d %@(%p)  Stream is nil for streamID %@, sendingStreamID %@ activeVideoStreams %@";
      v26 = v30;
      v27 = 78;
    }
    _os_log_error_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v39, v27);
    goto LABEL_30;
  }
  v16 = (void *)v15;
  v17 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentStreamSchedule, "objectForKeyedSubscript:", v14);
  if (!v17 && (objc_msgSend(v16, "isTemporalScalingEnabled") & 1) == 0)
  {
    if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_17;
      v32 = VRTraceErrorLogLevelToCSTR();
      v33 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v39 = 136316162;
      v40 = v32;
      v41 = 2080;
      v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:]";
      v43 = 1024;
      v44 = 489;
      v45 = 2112;
      v46 = a3;
      v47 = 2112;
      v48 = v14;
      v34 = " [%s] %s:%d Non temporal stream's schedule is nil for streamID %@, sendingStreamID %@";
      v35 = v33;
      v36 = 48;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v28 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_17;
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      v39 = 136316674;
      v40 = v37;
      v41 = 2080;
      v42 = "-[VCSessionUplinkVideoStreamController videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:]";
      v43 = 1024;
      v44 = 489;
      v45 = 2112;
      v46 = (id)v28;
      v47 = 2048;
      v48 = self;
      v49 = 2112;
      v50 = a3;
      v51 = 2112;
      v52 = v14;
      v34 = " [%s] %s:%d %@(%p) Non temporal stream's schedule is nil for streamID %@, sendingStreamID %@";
      v35 = v38;
      v36 = 68;
    }
    _os_log_error_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_ERROR, v34, (uint8_t *)&v39, v36);
LABEL_17:
    *a4 = 1;
    goto LABEL_18;
  }
  if (-[VCSessionUplinkVideoStreamController shouldGenerateIDRWithStreamSchedule:](self, "shouldGenerateIDRWithStreamSchedule:", v17)|| objc_msgSend(v16, "isTemporalScalingEnabled"))
  {
    goto LABEL_17;
  }
LABEL_18:

  return v16;
}

- (void)handleStreamsResetIDR
{
  id v3;
  NSMutableArray *streamResetIDR;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  const __CFString *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint32_t v22;
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
  VCSessionUplinkVideoStreamController *v33;
  _BYTE v34[128];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  streamResetIDR = self->_streamResetIDR;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamResetIDR, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
  if (!v5)
    goto LABEL_18;
  v6 = v5;
  v7 = *(_QWORD *)v36;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v36 != v7)
        objc_enumerationMutation(streamResetIDR);
      v9 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
      v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_activeVideoStreams, "objectForKeyedSubscript:", v9);
      if (!v10)
      {
        if ((VCSessionUplinkVideoStreamController *)objc_opt_class() != self)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v13 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v13 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_20;
          v18 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_20;
          v24 = 136316162;
          v25 = v18;
          v26 = 2080;
          v27 = "-[VCSessionUplinkVideoStreamController handleStreamsResetIDR]";
          v28 = 1024;
          v29 = 503;
          v30 = 2112;
          v31 = v13;
          v32 = 2048;
          v33 = self;
          v16 = " [%s] %s:%d %@(%p) Stream is nil";
          goto LABEL_42;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_20;
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        v24 = 136315650;
        v25 = v14;
        v26 = 2080;
        v27 = "-[VCSessionUplinkVideoStreamController handleStreamsResetIDR]";
        v28 = 1024;
        v29 = 503;
        v16 = " [%s] %s:%d Stream is nil";
LABEL_37:
        v21 = v15;
        v22 = 28;
LABEL_43:
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v24, v22);
        goto LABEL_20;
      }
      v11 = (void *)v10;
      v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_currentStreamSchedule, "objectForKeyedSubscript:", v9);
      if (!v12 && (objc_msgSend(v11, "isTemporalScalingEnabled") & 1) == 0)
      {
        if ((VCSessionUplinkVideoStreamController *)objc_opt_class() != self)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v17 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
          else
            v17 = &stru_1E9E58EE0;
          if ((int)VRTraceGetErrorLogLevelForModule() < 7)
            goto LABEL_20;
          v23 = VRTraceErrorLogLevelToCSTR();
          v19 = *MEMORY[0x1E0CF2758];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            goto LABEL_20;
          v24 = 136316162;
          v25 = v23;
          v26 = 2080;
          v27 = "-[VCSessionUplinkVideoStreamController handleStreamsResetIDR]";
          v28 = 1024;
          v29 = 507;
          v30 = 2112;
          v31 = v17;
          v32 = 2048;
          v33 = self;
          v16 = " [%s] %s:%d %@(%p) Non temporal stream's schedule stream is nil";
LABEL_42:
          v21 = v19;
          v22 = 48;
          goto LABEL_43;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_20;
        v20 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        v24 = 136315650;
        v25 = v20;
        v26 = 2080;
        v27 = "-[VCSessionUplinkVideoStreamController handleStreamsResetIDR]";
        v28 = 1024;
        v29 = 507;
        v16 = " [%s] %s:%d Non temporal stream's schedule stream is nil";
        goto LABEL_37;
      }
      if (-[VCSessionUplinkVideoStreamController shouldGenerateIDRWithStreamSchedule:](self, "shouldGenerateIDRWithStreamSchedule:", v12)|| objc_msgSend(v11, "isTemporalScalingEnabled"))
      {
        if (objc_msgSend(v11, "state") == 2)
          objc_msgSend(v11, "setPause:", 1);
        if (objc_msgSend(v11, "state") == 4)
          objc_msgSend(v11, "setPause:", 0);
        objc_msgSend(v3, "addObject:", v9);
      }
    }
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](streamResetIDR, "countByEnumeratingWithState:objects:count:", &v35, v34, 16);
    if (v6)
      continue;
    break;
  }
LABEL_18:
  if (objc_msgSend(v3, "count"))
    -[NSMutableArray removeObjectsInArray:](self->_streamResetIDR, "removeObjectsInArray:", v3);
LABEL_20:

}

- (id)getMultiwayConfigForStreamID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamInfoMap, "objectForKeyedSubscript:");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_msgSend(v4, "streamConfigs");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (!v6)
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
  v7 = v6;
  v8 = *(_QWORD *)v15;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v8)
      objc_enumerationMutation(v5);
    v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "multiwayConfig");
    v11 = objc_msgSend(a3, "intValue");
    if (v11 == objc_msgSend(v10, "idsStreamID"))
      break;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v7)
        goto LABEL_3;
      break;
    }
  }
  if (!v10)
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "streamConfigs"), "objectAtIndexedSubscript:", 0), "multiwayConfig");
  return v10;
}

- (id)newVideoStreamKeyFrameScheduleWithStreamIDs:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v11 = -[VCSessionUplinkVideoStreamController schedulerStreamWithVideoStream:](self, "schedulerStreamWithVideoStream:", -[VCSessionUplinkVideoStreamController getMultiwayConfigForStreamID:](self, "getMultiwayConfigForStreamID:", v10));
        if (v11)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)schedulerStreamWithVideoStream:(id)a3
{
  uint64_t v4;

  v4 = 1000;
  if (objc_msgSend(a3, "keyFrameInterval"))
    v4 = 1000 * objc_msgSend(a3, "keyFrameInterval");
  return +[VCIDRSchedulerStream schedulerStreamWithKeyFrameInterval:framerate:weightFactor:](VCIDRSchedulerStream, "schedulerStreamWithKeyFrameInterval:framerate:weightFactor:", v4, objc_msgSend(a3, "framerate"), objc_msgSend(a3, "maxNetworkBitrate"));
}

- (void)lock
{
  pthread_mutex_lock(&self->_mutex);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->_mutex);
}

- (void)restart
{
  void *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  NSObject *v12;
  _BYTE v13[24];
  __int128 v14;
  VCSessionUplinkVideoStreamController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[VCSessionUplinkVideoStreamController lock](self, "lock");
  if (-[NSMutableDictionary count](self->_activeVideoStreams, "count"))
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", self->_pendingVideoStreams);
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "addEntriesFromDictionary:", self->_activeVideoStreams);
      -[VCSessionUplinkVideoStreamController setPendingVideoStreamsInternal:](self, "setPendingVideoStreamsInternal:", v4);
      -[NSMutableDictionary removeAllObjects](self->_activeVideoStreams, "removeAllObjects");
      -[VCSessionUplinkVideoStreamController setCachedActiveVideoStreams:](self, "setCachedActiveVideoStreams:", self->_activeVideoStreams);
    }
    else
    {
      if ((VCSessionUplinkVideoStreamController *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_4;
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_4;
        *(_DWORD *)v13 = 136315650;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCSessionUplinkVideoStreamController restart]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 573;
        v8 = " [%s] %s:%d Could not allocate memory for pendingVideoStreams dictionary";
        v9 = v7;
        v10 = 28;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 = (const __CFString *)-[VCSessionUplinkVideoStreamController performSelector:](self, "performSelector:", sel_logPrefix);
        else
          v5 = &stru_1E9E58EE0;
        if ((int)VRTraceGetErrorLogLevelForModule() < 7)
          goto LABEL_4;
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          goto LABEL_4;
        *(_DWORD *)v13 = 136316162;
        *(_QWORD *)&v13[4] = v11;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCSessionUplinkVideoStreamController restart]";
        *(_WORD *)&v13[22] = 1024;
        LODWORD(v14) = 573;
        WORD2(v14) = 2112;
        *(_QWORD *)((char *)&v14 + 6) = v5;
        HIWORD(v14) = 2048;
        v15 = self;
        v8 = " [%s] %s:%d %@(%p) Could not allocate memory for pendingVideoStreams dictionary";
        v9 = v12;
        v10 = 48;
      }
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v8, v13, v10);
    }
LABEL_4:

  }
  -[VCSessionUplinkVideoStreamController unlock](self, "unlock", *(_OWORD *)v13, *(_QWORD *)&v13[16], v14, v15);
}

- (BOOL)filterPendingTemporalStreams
{
  VCSessionUplinkVideoStreamController *v2;
  uint64_t v3;
  NSMutableDictionary *pendingVideoStreams;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v2 = self;
  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = -[NSMutableDictionary allValues](self->_activeVideoStreams, "allValues");
  pendingVideoStreams = v2->_pendingVideoStreams;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__VCSessionUplinkVideoStreamController_filterPendingTemporalStreams__block_invoke;
  v6[3] = &unk_1E9E53AA8;
  v6[4] = v3;
  v6[5] = v2;
  v6[6] = &v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pendingVideoStreams, "enumerateKeysAndObjectsUsingBlock:", v6);
  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return (char)v2;
}

uint64_t __68__VCSessionUplinkVideoStreamController_filterPendingTemporalStreams__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:");
  if ((_DWORD)result)
  {
    result = objc_msgSend(a3, "isTemporalScalingEnabled");
    if ((_DWORD)result)
    {
      v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "allKeysForObject:", a3);
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v11);
            v13 = objc_msgSend(a2, "intValue");
            if (v13 != objc_msgSend(v12, "intValue"))
            {
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKeyedSubscript:", 0, v12);
              objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKeyedSubscript:", a3, a2);
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
        }
        while (v9);
      }
      return objc_msgSend(*(id *)(a1 + 40), "setCachedActiveVideoStreams:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    }
  }
  return result;
}

- (NSDictionary)pendingVideoStreams
{
  return &self->_pendingVideoStreams->super;
}

- (unsigned)captureFrameRate
{
  return self->_captureFrameRate;
}

- (void)setCaptureFrameRate:(unsigned int)a3
{
  self->_captureFrameRate = a3;
}

- (NSArray)streamIDsCell
{
  return self->_streamIDsCell;
}

- (NSArray)streamIDsWifi
{
  return self->_streamIDsWifi;
}

- (float)currentFrameTime
{
  return self->_currentFrameTime;
}

- (BOOL)dynamicVideoPriorityEnabled
{
  return self->_dynamicVideoPriorityEnabled;
}

- (void)setDynamicVideoPriorityEnabled:(BOOL)a3
{
  self->_dynamicVideoPriorityEnabled = a3;
}

- (BOOL)shouldSkipIDRScheduler
{
  return self->_shouldSkipIDRScheduler;
}

- (void)setShouldSkipIDRScheduler:(BOOL)a3
{
  self->_shouldSkipIDRScheduler = a3;
}

- (void)initWithVideoStreams:streamInfos:reportingAgent:delegate:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Failed to initialize VCSessionUplinkVideoStreamController. Invalid RTCP config.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setStreamIDsCell:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamIDsCell is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setStreamIDsWifi:.cold.1()
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
  OUTLINED_FUNCTION_2_3(&dword_1D8A54000, v0, v1, " [%s] %s:%d streamIDsWifi is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)setCurrentFrameTime:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = 136315906;
  v4 = a1;
  v5 = 2080;
  v6 = "-[VCSessionUplinkVideoStreamController setCurrentFrameTime:]";
  OUTLINED_FUNCTION_4();
  v7 = 204;
  v8 = 2048;
  v9 = v1;
  _os_log_debug_impl(&dword_1D8A54000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d FrameTime is %f", (uint8_t *)&v3, 0x26u);
  OUTLINED_FUNCTION_3();
}

- (void)setIsLocalOnCellular:cappedVideoStreamIDs:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d schedule for anchor stream %@ on Wifi not found");
  OUTLINED_FUNCTION_3();
}

- (void)setIsLocalOnCellular:cappedVideoStreamIDs:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d schedule for anchor stream %@ on cell not found");
  OUTLINED_FUNCTION_3();
}

- (void)setStreamsUseRTCPWithStreamInfos:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d StreamInfo array is nil, empty, or its streamConfigs array is nil or empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)anchorStreamIDWithCappedVideoStreamIDs:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d no streams available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)resumeStreams
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Non temporal stream's schedule is nil for streamID %@");
  OUTLINED_FUNCTION_3();
}

- (void)videoStreamPendingKeyFrameGenerationWithStreamID:shouldRemoveFromPendingArray:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, " [%s] %s:%d Requesting a streamID %@ that is not in any of the compound streamIDs");
  OUTLINED_FUNCTION_3();
}

@end
