@implementation AVCRateController

- (AVCRateController)initWithDelegate:(id)a3 dumpID:(id)a4 isUplink:(BOOL)a5 reportingAgent:(id)a6
{
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v11 = 0;
  v10 = 0u;
  v7 = a4;
  BYTE1(v8) = a5;
  v9 = (unint64_t)a6;
  return -[AVCRateController initWithDelegate:params:](self, "initWithDelegate:params:", a3, &v7);
}

- (AVCRateController)initWithDelegate:(id)a3 params:(const tagVCRateControlParams *)a4
{
  AVCRateController *v5;
  OS_nw_activity *var6;
  NSObject *CustomRootQueue;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  const char *v11;
  _BOOL4 isBWEDumpFileEnabled;
  const char *v13;
  objc_super v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  AVCRateController *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)AVCRateController;
  v5 = -[AVCRateController init](&v15, sel_init);
  if (v5)
  {
    FigCFWeakReferenceStore();
    FigCFWeakReferenceStore();
    v5->_reportingModuleID = VCReporting_GetDynamicReportingModuleID();
    v5->_statisticsCollector = (AVCStatisticsCollector *)-[AVCStatisticsCollector initForSimulation:useExternalThread:]([AVCStatisticsCollector alloc], "initForSimulation:useExternalThread:", a4->var1, a4->var5);
    v5->_feedbackController = -[AVCRateControlFeedbackController initWithStatisticsCollector:]([AVCRateControlFeedbackController alloc], "initWithStatisticsCollector:", v5->_statisticsCollector);
    v5->_isForSimulation = a4->var1;
    v5->_isRateControlDumpFileEnabled = -[VCDefaults rateControlDumpEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "rateControlDumpEnabled");
    v5->_isBWEDumpFileEnabled = -[VCDefaults bandwidthEstimationDumpEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "bandwidthEstimationDumpEnabled");
    v5->_dumpID = (NSString *)objc_msgSend(a4->var0, "copy");
    v5->_isUplink = a4->var2;
    v5->_useExternalThread = a4->var5;
    v5->_isPeriodicLoggingEnabled = -[VCDefaults rateControlLogEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "rateControlLogEnabled");
    *(_QWORD *)&v5->_forcedTargetBitrate = -1;
    v5->_serverBag = (VCRateControlServerBag *)a4->var3;
    v5->_btNotificationHandlerIndex = -1;
    var6 = (OS_nw_activity *)a4->var6;
    v5->_parentNWActivity = var6;
    v5->_registrationLock._os_unfair_lock_opaque = 0;
    v5->_isECNEnabled = 0;
    if (var6)
      nw_retain(var6);
    pthread_mutex_init(&v5->_mutex, 0);
    v5->_useNWConnectionNotification = _os_feature_enabled_impl();
    v5->_sharingGroup = (VCRateSharingGroup *)a4->var8;
    if (_os_feature_enabled_impl())
      v5->_useBTNotificationMonitor = a4->var7;
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v5->_reportingQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.VideoConference.VCRCReport", 0, CustomRootQueue);
    v5->_weakSelf = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = "enabled";
        if (v5->_isRateControlDumpFileEnabled)
          v11 = "enabled";
        else
          v11 = "disabled";
        isBWEDumpFileEnabled = v5->_isBWEDumpFileEnabled;
        if (v5->_isPeriodicLoggingEnabled)
          v13 = "enabled";
        else
          v13 = "disabled";
        *(_DWORD *)buf = 136316674;
        if (!isBWEDumpFileEnabled)
          v10 = "disabled";
        v17 = v8;
        v18 = 2080;
        v19 = "-[AVCRateController initWithDelegate:params:]";
        v20 = 1024;
        v21 = 512;
        v22 = 2048;
        v23 = v5;
        v24 = 2080;
        v25 = v11;
        v26 = 2080;
        v27 = v13;
        v28 = 2080;
        v29 = v10;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d AVCRateController (%p) init with VCRateControl dumpFile %s, VCRateControl logging %s, BWE dumpFile %s.", buf, 0x44u);
      }
    }
  }
  return v5;
}

- (void)completeAndReleaseNwActivity:(id)a3 withReason:(int)a4
{
  nw_activity_complete_with_reason();
  nw_release(a3);
}

- (void)cleanupNwActivity
{
  OS_nw_activity *noServerStatsUplinkNwActivity;
  OS_nw_activity *noServerStatsDownlinkNwActivity;
  OS_nw_activity *parentNWActivity;

  noServerStatsUplinkNwActivity = self->_noServerStatsUplinkNwActivity;
  if (noServerStatsUplinkNwActivity)
    -[AVCRateController completeAndReleaseNwActivity:withReason:](self, "completeAndReleaseNwActivity:withReason:", noServerStatsUplinkNwActivity, 3);
  noServerStatsDownlinkNwActivity = self->_noServerStatsDownlinkNwActivity;
  if (noServerStatsDownlinkNwActivity)
    -[AVCRateController completeAndReleaseNwActivity:withReason:](self, "completeAndReleaseNwActivity:withReason:", noServerStatsDownlinkNwActivity, 3);
  parentNWActivity = self->_parentNWActivity;
  if (parentNWActivity)
    nw_release(parentNWActivity);
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *reportingQueue;
  OpaqueFigCFWeakReferenceHolder *weakSelf;
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  AVCRateController *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v9 = v3;
      v10 = 2080;
      v11 = "-[AVCRateController dealloc]";
      v12 = 1024;
      v13 = 536;
      v14 = 2048;
      v15 = self;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d (%p)", buf, 0x26u);
    }
  }
  -[AVCRateController releaseAllLogDumpFiles](self, "releaseAllLogDumpFiles");
  FigCFWeakReferenceStore();
  FigCFWeakReferenceStore();

  -[AVCRateController cleanupNwActivity](self, "cleanupNwActivity");
  pthread_mutex_destroy(&self->_mutex);
  reportingQueue = self->_reportingQueue;
  if (reportingQueue)
    dispatch_release(reportingQueue);
  weakSelf = self->_weakSelf;
  if (weakSelf)
    CFRelease(weakSelf);

  v7.receiver = self;
  v7.super_class = (Class)AVCRateController;
  -[AVCRateController dealloc](&v7, sel_dealloc);
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    VCRateControlAlgorithm_SetPaused((uint64_t)self->_rateControlAlgorithm, a3);
  }
}

- (void)configure:(AVCRateControlConfig *)a3
{
  uint64_t v5;
  NSObject *v6;
  unsigned int mode;
  unsigned int localRadioAccessTechnology;
  unsigned int minBitrate;
  unsigned int maxBitrate;
  unsigned int remoteRadioAccessTechnology;
  _BOOL4 isTrafficBursty;
  unsigned int featureFlags;
  AVCStatisticsCollector *statisticsCollector;
  tagVCRateControlAlgorithmConfig *algorithmConfig;
  AVCBasebandCongestionDetector *v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  VCNWConnectionCongestionDetector *v20;
  VCNWConnectionCongestionDetectorBaseband *v21;
  _BYTE v22[200];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      mode = a3->mode;
      localRadioAccessTechnology = a3->localRadioAccessTechnology;
      maxBitrate = a3->maxBitrate;
      minBitrate = a3->minBitrate;
      remoteRadioAccessTechnology = a3->remoteRadioAccessTechnology;
      isTrafficBursty = a3->isTrafficBursty;
      featureFlags = a3->featureFlags;
      statisticsCollector = self->_statisticsCollector;
      *(_DWORD *)v22 = 136317954;
      *(_QWORD *)&v22[4] = v5;
      *(_WORD *)&v22[12] = 2080;
      *(_QWORD *)&v22[14] = "-[AVCRateController configure:]";
      *(_WORD *)&v22[22] = 1024;
      *(_DWORD *)&v22[24] = 567;
      *(_WORD *)&v22[28] = 2048;
      *(_QWORD *)&v22[30] = self;
      *(_WORD *)&v22[38] = 1024;
      *(_DWORD *)&v22[40] = mode;
      *(_WORD *)&v22[44] = 1024;
      *(_DWORD *)&v22[46] = localRadioAccessTechnology;
      *(_WORD *)&v22[50] = 1024;
      *(_DWORD *)&v22[52] = remoteRadioAccessTechnology;
      *(_WORD *)&v22[56] = 1024;
      *(_DWORD *)&v22[58] = minBitrate;
      *(_WORD *)&v22[62] = 1024;
      *(_DWORD *)&v22[64] = maxBitrate;
      *(_WORD *)&v22[68] = 1024;
      *(_DWORD *)&v22[70] = isTrafficBursty;
      *(_WORD *)&v22[74] = 1024;
      *(_DWORD *)&v22[76] = featureFlags;
      *(_WORD *)&v22[80] = 2048;
      *(_QWORD *)&v22[82] = statisticsCollector;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d AVCRateController (%p) configuration with mode=%d, LocalRAT=%d, RemoteRAT=%d, minBitrate=%d, maxBitrate=%d, isTrafficBursty=%d, featureFlags=%X, statisticsCollector=%p", v22, 0x5Au);
    }
  }
  if ((a3->featureFlags & 4) != 0)
    -[VCRateControlMediaController setEnableAggressiveProbingSequence:](self->_mediaController, "setEnableAggressiveProbingSequence:", 1);
  -[VCRateControlMediaController setServerBag:](self->_mediaController, "setServerBag:", self->_serverBag);
  algorithmConfig = a3->algorithmConfig;
  if (algorithmConfig && !self->_didCacheAlgorithmConfig)
  {
    memcpy(&self->_algorithmConfigCache, algorithmConfig, sizeof(self->_algorithmConfigCache));
    self->_didCacheAlgorithmConfig = 1;
  }
  if (!self->_basebandCongestionDetector && a3->localRadioAccessTechnology - 2 <= 4)
  {
    v16 = objc_alloc_init(AVCBasebandCongestionDetector);
    self->_basebandCongestionDetector = v16;
    -[AVCBasebandCongestionDetector setStatisticsCollector:](v16, "setStatisticsCollector:", self->_statisticsCollector);
    -[AVCBasebandCongestionDetector setMediaController:](self->_basebandCongestionDetector, "setMediaController:", self->_mediaController);
    -[AVCRateController createBasebandLogDumpFile](self, "createBasebandLogDumpFile");
    -[AVCBasebandCongestionDetector enableBasebandLogDump:](self->_basebandCongestionDetector, "enableBasebandLogDump:", self->_logBasebandDump);
    -[VCRateControlMediaController enableBasebandLogDump:](self->_mediaController, "enableBasebandLogDump:", self->_logBasebandDump);
  }
  v17 = a3->mode;
  if (!self->_nwConnectionCongestionDetector)
  {
    if ((v17 & 0xFFFFFFFE) != 8
      || (v20 = objc_alloc_init(VCNWConnectionCongestionDetector),
          self->_nwConnectionCongestionDetector = v20,
          -[VCNWConnectionCongestionDetector setStatisticsCollector:](v20, "setStatisticsCollector:", self->_statisticsCollector), -[AVCRateController createNWConnectionLogDumpFile](self, "createNWConnectionLogDumpFile"), -[VCNWConnectionCongestionDetector enableNWLogDump:](self->_nwConnectionCongestionDetector, "enableNWLogDump:", self->_logNWDump), v17 = a3->mode, !self->_nwConnectionCongestionDetector))
    {
      if (v17 == 10)
      {
        v21 = objc_alloc_init(VCNWConnectionCongestionDetectorBaseband);
        self->_nwConnectionCongestionDetector = &v21->super;
        -[VCNWConnectionCongestionDetector setStatisticsCollector:](v21, "setStatisticsCollector:", self->_statisticsCollector);
        -[AVCRateController createNWConnectionLogDumpFile](self, "createNWConnectionLogDumpFile");
        -[VCNWConnectionCongestionDetector enableNWLogDump:](self->_nwConnectionCongestionDetector, "enableNWLogDump:", self->_logNWDump);
        v17 = a3->mode;
      }
    }
  }
  v18 = a3->localRadioAccessTechnology;
  if (v18 == 1)
  {
    if (v17 - 1 > 1 || self->_logNWDump)
    {
      v18 = 1;
    }
    else
    {
      -[AVCRateController createNWConnectionLogDumpFile](self, "createNWConnectionLogDumpFile");
      v17 = a3->mode;
      v18 = a3->localRadioAccessTechnology;
    }
  }
  memset(&v22[24], 0, 176);
  *(_OWORD *)&v22[8] = 0u;
  *(_QWORD *)v22 = 0x100000009;
  *(_DWORD *)&v22[32] = v18;
  v19 = a3->remoteRadioAccessTechnology;
  *(_DWORD *)&v22[24] = v17;
  *(_DWORD *)&v22[28] = v19;
  *(_QWORD *)&v22[36] = *(_QWORD *)&a3->maxBitrate;
  *(_DWORD *)&v22[44] = a3->initialBitrate;
  *(_DWORD *)&v22[52] = a3->featureFlags;
  v22[48] = a3->isTrafficBursty;
  AVCStatisticsCollector_SetVCStatistics((uint64_t)self->_statisticsCollector, (uint64_t)v22);
}

- (BOOL)start
{
  _opaque_pthread_mutex_t *p_mutex;
  AVCRateControllerDelegate *v4;
  opaqueRTCReporting *v5;
  AVCStatisticsCollector *statisticsCollector;
  unsigned int mode;
  BOOL v8;
  AVCRateControllerDelegate *rateControllerDelegate;
  _QWORD v11[6];

  v11[5] = *MEMORY[0x1E0C80C00];
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  if (-[AVCRateController isStarted](self, "isStarted"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRateController start].cold.1();
    }
LABEL_21:
    v8 = 0;
    goto LABEL_22;
  }
  v4 = (AVCRateControllerDelegate *)MEMORY[0x1DF086F1C](&self->_rateControllerDelegateWeak);
  self->_rateControllerDelegate = v4;
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRateController start].cold.2();
    }
    goto LABEL_21;
  }
  if (self->_reportingAgentWeak
    && (v5 = (opaqueRTCReporting *)MEMORY[0x1DF086F1C](&self->_reportingAgentWeak),
        (self->_reportingAgentStrong = v5) == 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRateController start].cold.3();
    }
    rateControllerDelegate = self->_rateControllerDelegate;
    if (!rateControllerDelegate)
      goto LABEL_21;
    CFRelease(rateControllerDelegate);
    v8 = 0;
    self->_rateControllerDelegate = 0;
  }
  else
  {
    statisticsCollector = self->_statisticsCollector;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __26__AVCRateController_start__block_invoke;
    v11[3] = &unk_1E9E523A0;
    v11[4] = self;
    -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](statisticsCollector, "registerStatisticsChangeHandlerWithType:handler:", 9, v11);
    _AVCRateController_RegisterStatisticsChangeHandlers((uint64_t)self);
    -[AVCStatisticsCollector start](self->_statisticsCollector, "start");
    -[AVCRateController registerPeriodicTask](self, "registerPeriodicTask");
    -[AVCRateController registerForRateSharing:](self, "registerForRateSharing:", self->_configuration.mode);
    -[AVCRateController setBtNotificationMonitor](self, "setBtNotificationMonitor");
    mode = self->_configuration.mode;
    if (mode <= 7
      && ((1 << mode) & 0x86) != 0
      && -[VCRateControlMediaController vcMediaQueue](self->_mediaController, "vcMediaQueue"))
    {
      -[AVCRateController initAndStartTrafficMetricCollector](self, "initAndStartTrafficMetricCollector");
    }
    -[VCRateControlAlgorithm setIsFirstTimestampArrived:](self->_rateControlAlgorithm, "setIsFirstTimestampArrived:", 0);
    v8 = 1;
  }
LABEL_22:
  pthread_mutex_unlock(p_mutex);
  return v8;
}

uint64_t __26__AVCRateController_start__block_invoke(uint64_t a1, uint64_t a2)
{
  float32x2x2_t v2;
  unint64_t v3;
  float *v4;
  int v6[6];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v2 = *(float32x2x2_t *)(a2 + 24);
  v3 = vextq_s8((int8x16_t)v2, (int8x16_t)v2, 8uLL).u64[0];
  v4 = (float *)v6;
  vst2_f32(v4, v2);
  v4 += 4;
  *(_QWORD *)v4 = *(_QWORD *)(a2 + 40);
  LOBYTE(v7) = *(_BYTE *)(a2 + 48);
  LODWORD(v9) = *(_DWORD *)(a2 + 52);
  return _AVCRateController_ConfigureInternal(*(_QWORD *)(a1 + 32), v6);
}

- (BOOL)stop
{
  _opaque_pthread_mutex_t *p_mutex;
  BOOL v4;
  AVCRateControllerDelegate *rateControllerDelegate;
  opaqueRTCReporting *reportingAgentStrong;
  uint64_t v7;
  NSObject *v8;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  AVCRateController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  v4 = -[AVCRateController isStarted](self, "isStarted");
  if (v4)
  {
    -[AVCRateController deregisterForRateSharing](self, "deregisterForRateSharing");
    -[AVCRateController deregisterPeriodicTask](self, "deregisterPeriodicTask");
    rateControllerDelegate = self->_rateControllerDelegate;
    if (rateControllerDelegate)
    {
      CFRelease(rateControllerDelegate);
      self->_rateControllerDelegate = 0;
    }
    reportingAgentStrong = self->_reportingAgentStrong;
    if (reportingAgentStrong)
    {
      CFRelease(reportingAgentStrong);
      self->_reportingAgentStrong = 0;
    }
    -[AVCStatisticsCollector stop](self->_statisticsCollector, "stop");
    -[AVCStatisticsCollector unregisterAllStatisticsChangeHandlers](self->_statisticsCollector, "unregisterAllStatisticsChangeHandlers");
    -[VCBTNotificationMonitor unregisterBTNotificationHandler:](+[VCBTNotificationMonitor sharedInstance](VCBTNotificationMonitor, "sharedInstance"), "unregisterBTNotificationHandler:", self->_btNotificationHandlerIndex);
    self->_btNotificationHandlerIndex = -1;
    -[VCRateControlTrafficMetricCollector stopVCRateControlTrafficMetricCollector](self->_trafficMetricCollector, "stopVCRateControlTrafficMetricCollector");
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v7;
      v12 = 2080;
      v13 = "-[AVCRateController stop]";
      v14 = 1024;
      v15 = 684;
      v16 = 2048;
      v17 = self;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d (%p) rate controller has been stopped", (uint8_t *)&v10, 0x26u);
    }
  }
  pthread_mutex_unlock(p_mutex);
  return v4;
}

- (tagAVCRateControlExperimentConfig)rateControlExperimentConfig
{
  unsigned int v3;
  uint64_t v4;
  VCRateControlAlgorithm *rateControlAlgorithm;
  VCRateControlAlgorithm *v6;
  unsigned int v7;
  VCRateControlAlgorithm *v8;
  unint64_t v9;
  unsigned __int8 v10;
  int v11;
  int v12;
  tagAVCRateControlExperimentConfig result;

  v3 = -[VCRateControlServerBag experimentVersion](self->_serverBag, "experimentVersion");
  v4 = -[NSNumber intValue](-[VCRateControlServerBag experimentGroupIndex](self->_serverBag, "experimentGroupIndex"), "intValue");
  rateControlAlgorithm = self->_rateControlAlgorithm;
  if (!rateControlAlgorithm)
    goto LABEL_9;
  -[VCRateControlAlgorithm config](rateControlAlgorithm, "config");
  v6 = self->_rateControlAlgorithm;
  if (!v6)
  {
    if (!v12)
      goto LABEL_9;
    goto LABEL_7;
  }
  -[VCRateControlAlgorithm reportStatistics](v6, "reportStatistics");
  v7 = 0;
  if (v12 && !v11)
  {
LABEL_7:
    v8 = self->_rateControlAlgorithm;
    if (v8)
    {
      -[VCRateControlAlgorithm reportStatistics](v8, "reportStatistics");
      v7 = v10;
      goto LABEL_10;
    }
LABEL_9:
    v7 = 0;
  }
LABEL_10:
  v9 = v3 | (unint64_t)(v4 << 32);
  result.var0 = v9;
  result.var1 = HIDWORD(v9);
  result.var2 = v7;
  return result;
}

- (tagVCRateControlAlgorithmConfig)algorithmConfig
{
  VCRateControlAlgorithm *rateControlAlgorithm;
  tagVCRateControlAlgorithmConfig *result;

  rateControlAlgorithm = self->_rateControlAlgorithm;
  if (rateControlAlgorithm)
    return (tagVCRateControlAlgorithmConfig *)-[VCRateControlAlgorithm config](rateControlAlgorithm, "config");
  bzero(retstr, 0x3D0uLL);
  return result;
}

- (void)initAndStartTrafficMetricCollector
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
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "AVCRC [%s] %s:%d [%p] cannot start Rate controller, because trafficMetricCollector is not allocated", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)periodicTask:(void *)a3
{
  unsigned int mode;

  if (a3)
  {
    mode = self->_configuration.mode;
    if (mode - 8 < 2)
    {
      -[AVCRateController getRealTimeStatsForLowLatency:](self, "getRealTimeStatsForLowLatency:");
    }
    else if (mode == 5)
    {
      -[AVCRateController getRealTimeStatsForServerBasedRxOnly:](self, "getRealTimeStatsForServerBasedRxOnly:");
    }
    else if (mode == 4)
    {
      -[AVCRateController getRealTimeStatsForServerBasedTxOnly:](self, "getRealTimeStatsForServerBasedTxOnly:");
    }
    else
    {
      -[AVCRateController getRealTimeStats:](self, "getRealTimeStats:");
    }
    -[AVCRateController resetStatsForPeriodicTaskReport](self, "resetStatsForPeriodicTaskReport");
    -[AVCRateController printRateControllerHealthPrint](self, "printRateControllerHealthPrint");
  }
  else
  {
    -[AVCRateController accumulateStatsForPeriodicTaskUpdate](self, "accumulateStatsForPeriodicTaskUpdate");
  }
}

- (void)accumulateStatsForPeriodicTaskUpdate
{
  unint64_t v3;
  double v4;
  unsigned int targetBitrateTier;
  unsigned int targetBitrate;
  BOOL v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int actualBitrate;
  unsigned int v14;
  BOOL v15;
  unsigned int v16;
  uint64_t v17;

  *(float64x2_t *)&self->_sumPLR = vmlaq_f64(*(float64x2_t *)&self->_sumPLR, (float64x2_t)vdupq_n_s64(0x4059000000000000uLL), *(float64x2_t *)&self->_packetLossPercentage);
  -[VCRateControlAlgorithm worstRecentRoundTripTime](self->_rateControlAlgorithm, "worstRecentRoundTripTime");
  LODWORD(v3) = self->_sumWorstRecentRTTInMillisecond;
  self->_sumWorstRecentRTTInMillisecond = ((double)v3 + v4 * 1000.0);
  self->_sumWorstRecentBurstLoss += -[VCRateControlAlgorithm worstRecentBurstLoss](self->_rateControlAlgorithm, "worstRecentBurstLoss");
  targetBitrateTier = self->_targetBitrateTier;
  if (targetBitrateTier)
  {
    targetBitrate = self->_targetBitrate;
    v15 = targetBitrate >= targetBitrateTier;
    v8 = targetBitrate - targetBitrateTier;
    v7 = v8 != 0 && v15;
    targetBitrateTier = v8 / 0x3E8;
    if (!v7)
      targetBitrateTier = 0;
  }
  self->_sumExtraTargetBitrate += targetBitrateTier;
  if ((-[VCRateControlAlgorithm isSendBitrateLimited](self->_rateControlAlgorithm, "isSendBitrateLimited") & 1) == 0)
  {
    v9 = -[AVCStatisticsCollector sharedRemoteEstimatedBandwidth](self->_statisticsCollector, "sharedRemoteEstimatedBandwidth");
    v10 = self->_targetBitrate;
    v11 = v9 - v10;
    if (v10 >= v9)
      v11 = v10 - v9;
    v12 = 1200;
    if (v10 < v9)
      v12 = 1204;
    *(_DWORD *)((char *)&self->super.isa + v12) += v11 / 0x3E8;
    actualBitrate = self->_actualBitrate;
    v14 = v10 - actualBitrate;
    v15 = actualBitrate >= v10;
    v16 = actualBitrate - v10;
    if (!v15)
      v16 = v14;
    v17 = 1208;
    if (!v15)
      v17 = 1212;
    *(_DWORD *)((char *)&self->super.isa + v17) += v16 / 0x3E8;
  }
  ++self->_countPeriodicTaskUpdate;
}

- (void)resetStatsForPeriodicTaskReport
{
  self->_isCongestedForReport = 0;
  *(_OWORD *)&self->_sumPLR = 0u;
  *(_OWORD *)&self->_sumOverUtilizedBandwidth = 0u;
  *(_OWORD *)&self->_sumWorstRecentRTTInMillisecond = 0u;
}

- (void)registerPeriodicTask
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
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "AVCRC [%s] %s:%d (%p) Cannot register periodic task before rate controller start!", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

uint64_t __41__AVCRateController_registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)getRealTimeStatsForServerBasedTxOnly:(__CFDictionary *)a3
{
  unsigned int countPeriodicTaskUpdate;
  double v6;

  countPeriodicTaskUpdate = self->_countPeriodicTaskUpdate;
  if (countPeriodicTaskUpdate)
    v6 = self->_sumPLR / (double)countPeriodicTaskUpdate;
  else
    v6 = 0.0;
  CFDictionaryAddValue(a3, CFSTR("ULPLR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6));
  CFDictionaryAddValue(a3, CFSTR("RTTUL"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_roundTripTimeMilliseconds));
  CFDictionaryAddValue(a3, CFSTR("ULTBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_targetBitrate / 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("ULSBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_actualBitrate / 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("ULWMBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_wifiTxMediaBitrate / 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("ULWNBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_wifiNonAVCTxMediaBitrate / 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("ULBWE"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AVCStatisticsCollector sharedEstimatedBandwidthUncapped](self->_statisticsCollector, "sharedEstimatedBandwidthUncapped")/ 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("ULTBSNT"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalBytesSent));
  CFDictionaryAddValue(a3, CFSTR("ULTPRC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalPacketsReceived));
  CFDictionaryAddValue(a3, CFSTR("ULTPST"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalPacketsSent));
  CFDictionaryAddValue(a3, CFSTR("ULLBA"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCRateControlAlgorithm isLossBasedAdaptationOn](self->_rateControlAlgorithm, "isLossBasedAdaptationOn")));
}

- (void)getRealTimeStatsForServerBasedRxOnly:(__CFDictionary *)a3
{
  unsigned int countPeriodicTaskUpdate;
  double v6;

  CFDictionaryAddValue(a3, CFSTR("DLTPRC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalPacketsReceived));
  countPeriodicTaskUpdate = self->_countPeriodicTaskUpdate;
  if (countPeriodicTaskUpdate)
    v6 = self->_sumPLR / (double)countPeriodicTaskUpdate;
  else
    v6 = 0.0;
  CFDictionaryAddValue(a3, CFSTR("DLPLR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6));
  CFDictionaryAddValue(a3, CFSTR("RTTDL"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_roundTripTimeMilliseconds));
  CFDictionaryAddValue(a3, CFSTR("DLTBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_targetBitrate / 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("DLRBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_actualBitrate / 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("DLBWE"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AVCStatisticsCollector sharedEstimatedBandwidthUncapped](self->_statisticsCollector, "sharedEstimatedBandwidthUncapped")/ 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("DLTBRCVD"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_totalBytesReceived));
  CFDictionaryAddValue(a3, CFSTR("DLLBA"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCRateControlAlgorithm isLossBasedAdaptationOn](self->_rateControlAlgorithm, "isLossBasedAdaptationOn")));
}

- (void)getRealTimeStatsForLowLatency:(__CFDictionary *)a3
{
  unsigned int countPeriodicTaskUpdate;
  double v6;
  VCNWConnectionCongestionDetector *nwConnectionCongestionDetector;

  countPeriodicTaskUpdate = self->_countPeriodicTaskUpdate;
  if (countPeriodicTaskUpdate)
    v6 = self->_sumPLR / (double)countPeriodicTaskUpdate;
  else
    v6 = 0.0;
  CFDictionaryAddValue(a3, CFSTR("ULPLR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6));
  CFDictionaryAddValue(a3, CFSTR("RTT"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_roundTripTimeMilliseconds));
  CFDictionaryAddValue(a3, CFSTR("ULTBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_targetBitrate / 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("ULBWE"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AVCStatisticsCollector sharedRemoteEstimatedBandwidth](self->_statisticsCollector, "sharedRemoteEstimatedBandwidth")/ 0x3E8uLL));
  CFDictionaryAddValue(a3, CFSTR("ULBPL"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_burstPacketLoss));
  nwConnectionCongestionDetector = self->_nwConnectionCongestionDetector;
  if (nwConnectionCongestionDetector)
  {
    CFDictionaryAddValue(a3, CFSTR("NWAPD"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCNWConnectionCongestionDetector averagePacketDelayMs](nwConnectionCongestionDetector, "averagePacketDelayMs")));
    CFDictionaryAddValue(a3, CFSTR("MAWFPD"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCNWConnectionCongestionDetector maxAveragePacketDelayMs](self->_nwConnectionCongestionDetector, "maxAveragePacketDelayMs")));
    CFDictionaryAddValue(a3, CFSTR("NWATH"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCNWConnectionCongestionDetector averageThroughputBps](self->_nwConnectionCongestionDetector, "averageThroughputBps")/ 0x3E8uLL));
    CFDictionaryAddValue(a3, CFSTR("NWNaC"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCNWConnectionCongestionDetector packetDropCount](self->_nwConnectionCongestionDetector, "packetDropCount")));
    -[VCNWConnectionCongestionDetector setMaxAveragePacketDelayMs:](self->_nwConnectionCongestionDetector, "setMaxAveragePacketDelayMs:", 0);
  }
}

- (void)getRealTimeStats:(__CFDictionary *)a3
{
  const __CFAllocator *v5;
  uint64_t countPeriodicTaskUpdate;
  CFStringRef v7;
  uint64_t v8;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v11;
  CFStringRef v12;
  CFStringRef v13;
  CFStringRef v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int lastReportedBandwidthEstimation;
  CFStringRef v31;
  CFStringRef v32;
  double v33;
  CFStringRef v34;
  CFStringRef v35;
  CFStringRef v36;
  CFStringRef v37;
  unsigned int v38;
  unsigned int v39;
  CFStringRef v40;
  CFStringRef v41;
  CFStringRef v42;
  CFStringRef v43;
  CFStringRef v44;
  CFStringRef v45;
  CFStringRef v46;
  CFStringRef v47;
  uint64_t remotePacketReceivedVideo;
  CFStringRef v49;

  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  countPeriodicTaskUpdate = self->_countPeriodicTaskUpdate;
  if ((_DWORD)countPeriodicTaskUpdate)
    countPeriodicTaskUpdate = (int)(self->_sumPLR / (double)countPeriodicTaskUpdate);
  v7 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), countPeriodicTaskUpdate);
  CFDictionaryAddValue(a3, CFSTR("PLR"), v7);
  CFRelease(v7);
  v8 = self->_countPeriodicTaskUpdate;
  if ((_DWORD)v8)
    v8 = (int)(self->_sumPLRVideo / (double)v8);
  v9 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), v8);
  CFDictionaryAddValue(a3, CFSTR("VPLR"), v9);
  CFRelease(v9);
  v10 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), self->_roundTripTimeMilliseconds);
  CFDictionaryAddValue(a3, CFSTR("RTT"), v10);
  CFRelease(v10);
  v11 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), self->_targetBitrate / 0x3E8uLL);
  CFDictionaryAddValue(a3, CFSTR("TTxR"), v11);
  CFRelease(v11);
  v12 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), self->_actualBitrate / 0x3E8uLL);
  CFDictionaryAddValue(a3, CFSTR("ULSBR"), v12);
  CFRelease(v12);
  v13 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), -[AVCStatisticsCollector sharedEstimatedBandwidthUncapped](self->_statisticsCollector, "sharedEstimatedBandwidthUncapped")/ 0x3E8uLL);
  CFDictionaryAddValue(a3, CFSTR("DBE"), v13);
  CFRelease(v13);
  v14 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), -[AVCStatisticsCollector sharedRemoteEstimatedBandwidth](self->_statisticsCollector, "sharedRemoteEstimatedBandwidth")/ 0x3E8uLL);
  CFDictionaryAddValue(a3, CFSTR("UBE"), v14);
  CFRelease(v14);
  v15 = self->_countPeriodicTaskUpdate;
  if (v15)
    v16 = self->_sumWorstRecentRTTInMillisecond / v15;
  else
    v16 = 0;
  CFDictionaryAddValue(a3, CFSTR("WRRTT"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16));
  v17 = self->_countPeriodicTaskUpdate;
  if (v17)
    v18 = self->_sumWorstRecentBurstLoss / v17;
  else
    v18 = 0;
  CFDictionaryAddValue(a3, CFSTR("WRBPL"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18));
  v19 = self->_countPeriodicTaskUpdate;
  if (v19)
    v20 = self->_sumOverShootSendBitrate / v19;
  else
    v20 = 0;
  CFDictionaryAddValue(a3, CFSTR("OVSBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v20));
  v21 = self->_countPeriodicTaskUpdate;
  if (v21)
    v22 = self->_sumUnderShootSendBitrate / v21;
  else
    v22 = 0;
  CFDictionaryAddValue(a3, CFSTR("UNSBR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v22));
  v23 = self->_countPeriodicTaskUpdate;
  if (v23)
    v24 = self->_sumOverUtilizedBandwidth / v23;
  else
    v24 = 0;
  CFDictionaryAddValue(a3, CFSTR("OVBWE"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24));
  v25 = self->_countPeriodicTaskUpdate;
  if (v25)
    v26 = self->_sumUnderUtilizedBandwidth / v25;
  else
    v26 = 0;
  CFDictionaryAddValue(a3, CFSTR("UNBWE"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v26));
  v27 = self->_countPeriodicTaskUpdate;
  if (v27)
    v28 = self->_sumExtraTargetBitrate / v27;
  else
    v28 = 0;
  CFDictionaryAddValue(a3, CFSTR("AExTR"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v28));
  v29 = -[AVCStatisticsCollector sharedEstimatedBandwidth](self->_statisticsCollector, "sharedEstimatedBandwidth");
  lastReportedBandwidthEstimation = self->_lastReportedBandwidthEstimation;
  if (lastReportedBandwidthEstimation
    && v29
    && (double)lastReportedBandwidthEstimation / (double)v29 > 2.0
    && lastReportedBandwidthEstimation - v29 >= 0x2EF)
  {
    ++self->_totalSuddenBandwidthDropCount;
  }
  self->_lastReportedBandwidthEstimation = v29;
  v31 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), self->_totalSuddenBandwidthDropCount);
  CFDictionaryAddValue(a3, CFSTR("SBWD"), v31);
  CFRelease(v31);
  if (-[VCRateControlAlgorithm didMBLRampDown](self->_rateControlAlgorithm, "didMBLRampDown"))
    ++self->_totalMBLRampDownCount;
  -[VCRateControlAlgorithm setDidMBLRampDown:](self->_rateControlAlgorithm, "setDidMBLRampDown:", 0);
  v32 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), self->_totalMBLRampDownCount);
  CFDictionaryAddValue(a3, CFSTR("RDMBL"), v32);
  CFRelease(v32);
  -[AVCBasebandCongestionDetector basebandExpectedQueuingDelay](self->_basebandCongestionDetector, "basebandExpectedQueuingDelay");
  v34 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), (v33 * 1000.0));
  CFDictionaryAddValue(a3, CFSTR("BbD"), v34);
  CFRelease(v34);
  v35 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), -[AVCBasebandCongestionDetector basebandQueueDepth](self->_basebandCongestionDetector, "basebandQueueDepth"));
  CFDictionaryAddValue(a3, CFSTR("BbQ"), v35);
  CFRelease(v35);
  v36 = CFStringCreateWithFormat(v5, 0, CFSTR("%5.1f"), (double)-[AVCBasebandCongestionDetector basebandAverageBitrate](self->_basebandCongestionDetector, "basebandAverageBitrate")/ 1000.0);
  CFDictionaryAddValue(a3, CFSTR("BbTx"), v36);
  CFRelease(v36);
  v37 = CFStringCreateWithFormat(v5, 0, CFSTR("%5.1f"), (double)-[AVCBasebandCongestionDetector basebandTxBitrate](self->_basebandCongestionDetector, "basebandTxBitrate")/ 1000.0);
  CFDictionaryAddValue(a3, CFSTR("InTxR"), v37);
  CFRelease(v37);
  v38 = -[VCRateControlMediaController basebandFlushedVideoCount](self->_mediaController, "basebandFlushedVideoCount");
  v39 = -[VCRateControlMediaController basebandFlushedAudioCount](self->_mediaController, "basebandFlushedAudioCount");
  v40 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), v38 - self->_lastReportFlushedVideoPacketCount);
  CFDictionaryAddValue(a3, CFSTR("VPF"), v40);
  CFRelease(v40);
  v41 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), v39 - self->_lastReportFlushedAudioPacketCount);
  CFDictionaryAddValue(a3, CFSTR("APF"), v41);
  CFRelease(v41);
  v42 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), self->_remotePacketReceivedAudio);
  CFDictionaryAddValue(a3, CFSTR("APRR"), v42);
  CFRelease(v42);
  v43 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), self->_remoteECT1ReceiveCount);
  CFDictionaryAddValue(a3, CFSTR("ECT1Cnt"), v43);
  CFRelease(v43);
  v44 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), self->_remoteCEReceiveCount);
  CFDictionaryAddValue(a3, CFSTR("CECnt"), v44);
  CFRelease(v44);
  v45 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), self->_isCongestedForReport);
  CFDictionaryAddValue(a3, CFSTR("NWCng"), v45);
  CFRelease(v45);
  if (-[VCRateControlAlgorithm bytesInFlightState](self->_rateControlAlgorithm, "bytesInFlightState") != -1)
  {
    v46 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), -[VCRateControlAlgorithm bytesInFlightState](self->_rateControlAlgorithm, "bytesInFlightState") == 0);
    CFDictionaryAddValue(a3, CFSTR("BIFCng"), v46);
    CFRelease(v46);
  }
  v47 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), -[VCRateControlAlgorithm isLossBasedAdaptationOn](self->_rateControlAlgorithm, "isLossBasedAdaptationOn"));
  CFDictionaryAddValue(a3, CFSTR("ULLBA"), v47);
  CFRelease(v47);
  if (VCMediaControlInfo_IsLossStatsEnabled(-[AVCStatisticsCollector mediaControlInfoFECFeedbackVersion](self->_statisticsCollector, "mediaControlInfoFECFeedbackVersion")))
  {
    remotePacketReceivedVideo = 0;
  }
  else
  {
    remotePacketReceivedVideo = self->_remotePacketReceivedVideo;
  }
  v49 = CFStringCreateWithFormat(v5, 0, CFSTR("%u"), remotePacketReceivedVideo);
  CFDictionaryAddValue(a3, CFSTR("VPRR"), v49);
  CFRelease(v49);
  self->_lastReportFlushedVideoPacketCount = v38;
  self->_lastReportFlushedAudioPacketCount = v39;
}

- (void)deregisterPeriodicTask
{
  reportingUnregisterPeriodicTask();
}

- (void)setShareProfile:(id)a3
{
  -[VCRateControlAlgorithm setRateSharingCount:](self->_rateControlAlgorithm, "setRateSharingCount:", objc_msgSend(a3, "rateSharingCount"));
}

- (BOOL)isStarted
{
  return -[AVCStatisticsCollector isStarted](self->_statisticsCollector, "isStarted");
}

- (void)configureWithOperatingMode:(int)a3 isLocalCellular:(BOOL)a4 localCellTech:(int)a5 isRemoteCellular:(BOOL)a6 remoteCellTech:(int)a7 bitrateCapKbps:(unsigned int)a8 isTrafficBursty:(BOOL)a9 featureFlags:(unsigned int)a10
{
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  _BOOL8 v14;
  _DWORD v16[4];
  uint64_t v17;
  BOOL v18;
  _BYTE v19[15];
  unsigned int v20;
  int v21;
  uint64_t v22;

  v11 = *(_QWORD *)&a7;
  v12 = a6;
  v13 = *(_QWORD *)&a5;
  v14 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  memset(v19, 0, sizeof(v19));
  v16[0] = -[AVCRateController rateControlModeFromAVConferenceOperatingMode:](self, "rateControlModeFromAVConferenceOperatingMode:", *(_QWORD *)&a3);
  v16[1] = -[AVCRateController radioAccessTechnologyFromAVConferenceCellTech:isCellular:](self, "radioAccessTechnologyFromAVConferenceCellTech:isCellular:", v13, v14);
  v16[2] = -[AVCRateController radioAccessTechnologyFromAVConferenceCellTech:isCellular:](self, "radioAccessTechnologyFromAVConferenceCellTech:isCellular:", v11, v12);
  v16[3] = 1000 * a8;
  v17 = 0;
  v18 = a9;
  v20 = -[AVCRateController loadDefaultVCRCFeatureFlags:](self, "loadDefaultVCRCFeatureFlags:", a10);
  v21 = 0;
  -[AVCRateController configure:](self, "configure:", v16);
}

- (void)setTargetBitrateCap:(unsigned int)a3
{
  uint64_t v5;
  NSObject *v6;
  unsigned int targetBitrateCap;
  unsigned int remoteRadioAccessTechnology;
  __int128 v9;
  _BYTE v10[12];
  _BYTE v11[38];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      targetBitrateCap = self->_targetBitrateCap;
      *(_DWORD *)v10 = 136316418;
      *(_QWORD *)&v10[4] = v5;
      *(_WORD *)v11 = 2080;
      *(_QWORD *)&v11[2] = "-[AVCRateController setTargetBitrateCap:]";
      *(_WORD *)&v11[10] = 1024;
      *(_DWORD *)&v11[12] = 987;
      *(_WORD *)&v11[16] = 2048;
      *(_QWORD *)&v11[18] = self;
      *(_WORD *)&v11[26] = 1024;
      *(_DWORD *)&v11[28] = targetBitrateCap;
      *(_WORD *)&v11[32] = 1024;
      *(_DWORD *)&v11[34] = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d (%p) AVCRateController target bitrate cap %d -> %d", v10, 0x32u);
    }
  }
  self->_targetBitrateCap = a3;
  *(_QWORD *)v10 = *(_QWORD *)&self->_configuration.mode;
  remoteRadioAccessTechnology = self->_configuration.remoteRadioAccessTechnology;
  v9 = *(_OWORD *)&self->_configuration.algorithmConfig;
  *(_OWORD *)&v11[4] = *(_OWORD *)&self->_configuration.minBitrate;
  *(_OWORD *)&v11[20] = v9;
  *(_DWORD *)&v10[8] = remoteRadioAccessTechnology;
  *(_DWORD *)v11 = a3;
  -[AVCRateController configure:](self, "configure:", v10);
}

- (void)setEstimatedBandwidthCap:(unsigned int)a3
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int estimatedBandwidthCap;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  AVCRateController *v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((self->_configuration.mode & 0xFFFFFFFE) == 4)
    {
      v5 = 7;
      do
        v6 = vcRateControlTierBitrates[v5++];
      while (v6 < a3);
    }
    else
    {
      v5 = 0;
      do
        v8 = vcRateControlTierBitrates[v5++];
      while (v8 < a3);
    }
    v9 = v5 - 1;
    if (v9 >= 31)
      v9 = 31;
    if (v9 < 30)
      ++v9;
    v7 = vcRateControlTierBitrates[v9];
  }
  else
  {
    v7 = 0;
  }
  self->_estimatedBandwidthCap = v7;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      estimatedBandwidthCap = self->_estimatedBandwidthCap;
      v13 = 136316418;
      v14 = v10;
      v15 = 2080;
      v16 = "-[AVCRateController setEstimatedBandwidthCap:]";
      v17 = 1024;
      v18 = 1014;
      v19 = 2048;
      v20 = self;
      v21 = 1024;
      v22 = a3;
      v23 = 1024;
      v24 = estimatedBandwidthCap;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d (%p) AVCRateController bandwidth estimation cap %d -> %d", (uint8_t *)&v13, 0x32u);
    }
  }
  -[AVCStatisticsCollector setEstimatedBandwidthCap:](self->_statisticsCollector, "setEstimatedBandwidthCap:", self->_estimatedBandwidthCap);
}

- (void)setExpectedBitrate:(unsigned int)a3
{
  self->_expectedBitrate = a3;
  -[AVCStatisticsCollector setExpectedBitrate:](self->_statisticsCollector, "setExpectedBitrate:");
}

- (void)registerForRateSharing:(unsigned int)a3
{
  os_unfair_lock_s *p_registrationLock;
  VCRateSharingGroup *sharingGroup;

  p_registrationLock = &self->_registrationLock;
  os_unfair_lock_lock(&self->_registrationLock);
  if (a3 == 8 && !self->_isRegisteredForRateSharing)
  {
    sharingGroup = self->_sharingGroup;
    if (sharingGroup)
    {
      self->_isRegisteredForRateSharing = -[VCRateSharingGroup registerRateSharingClient:forInterfaceType:](sharingGroup, "registerRateSharingClient:forInterfaceType:", self, 0);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[AVCRateController registerForRateSharing:].cold.1();
    }
  }
  os_unfair_lock_unlock(p_registrationLock);
}

- (void)deregisterForRateSharing
{
  os_unfair_lock_s *p_registrationLock;

  p_registrationLock = &self->_registrationLock;
  os_unfair_lock_lock(&self->_registrationLock);
  if (self->_isRegisteredForRateSharing)
  {
    -[VCRateSharingGroup deregisterRateSharingClient:](self->_sharingGroup, "deregisterRateSharingClient:", self);
    self->_isRegisteredForRateSharing = 0;
  }
  os_unfair_lock_unlock(p_registrationLock);
}

- (unsigned)loadDefaultVCRCFeatureFlags:(unsigned int)a3
{
  int v4;
  unsigned int v5;

  if (VCDefaults_GetBoolValueForKey(CFSTR("disableBasebandAdaptation"), 0))
    v4 = 957;
  else
    v4 = 445;
  v5 = v4 | a3;
  if (VCDefaults_GetBoolValueForKey(CFSTR("enableRampDownSuppression"), 0))
    v5 |= 0x400u;
  if (VCDefaults_GetBoolValueForKey(CFSTR("enableBlockRampUpInBluetoothCoex"), 0))
    v5 |= 0x800u;
  if (VCDefaults_GetBoolValueForKey(CFSTR("enableRampDownToActualSendBitrate"), 0))
    v5 |= 0x1000u;
  if (VCDefaults_GetBoolValueForKey(CFSTR("enableRampDownUsingPLRThreshold"), 1))
    return v5 | 0x2000;
  else
    return v5;
}

- (void)setBtNotificationMonitor
{
  VCBTNotificationMonitor *v3;
  _QWORD v4[5];
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  if (self->_useBTNotificationMonitor)
  {
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3052000000;
    v5[3] = __Block_byref_object_copy_;
    v5[4] = __Block_byref_object_dispose_;
    v5[5] = self;
    v3 = +[VCBTNotificationMonitor sharedInstance](VCBTNotificationMonitor, "sharedInstance");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__AVCRateController_setBtNotificationMonitor__block_invoke;
    v4[3] = &unk_1E9E523E8;
    v4[4] = v5;
    self->_btNotificationHandlerIndex = -[VCBTNotificationMonitor registerBTNotificationHandler:](v3, "registerBTNotificationHandler:", v4);
    _Block_object_dispose(v5, 8);
  }
}

void __45__AVCRateController_setBtNotificationMonitor__block_invoke(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPaused:", 1);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v7 = *a2;
      v8 = a2[1];
      v9 = 136316418;
      v10 = v4;
      v11 = 2080;
      v12 = "-[AVCRateController setBtNotificationMonitor]_block_invoke";
      v13 = 1024;
      v14 = 1083;
      v15 = 2048;
      v16 = v6;
      v17 = 2080;
      v18 = v7;
      v19 = 1024;
      v20 = v8;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d [%p] Pause rate controller for 5 seconds, BT device %s state=%d while WLAN's on 2.4GHz", (uint8_t *)&v9, 0x36u);
    }
  }
}

- (unsigned)rateControlModeFromAVConferenceOperatingMode:(int)a3
{
  unsigned int result;

  result = 2;
  switch(a3)
  {
    case 1:
    case 4:
      result = 1;
      break;
    case 2:
    case 7:
      return result;
    case 6:
      if (self->_isUplink)
        result = 4;
      else
        result = 5;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (unsigned)radioAccessTechnologyFromAVConferenceCellTech:(int)a3 isCellular:(BOOL)a4
{
  if (!a4)
    return 1;
  if ((a3 - 1) > 8)
    return 0;
  return dword_1D9108FF0[a3 - 1];
}

- (void)createBasebandLogDumpFile
{
  unsigned int mode;
  const char *v4;
  const char *v5;
  FILE **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  if (self->_isRateControlDumpFileEnabled)
  {
    mode = self->_configuration.mode;
    v4 = "VCRateControl";
    if (mode == 5)
      v4 = "VCRC-DL";
    if (mode == 4)
      v5 = "VCRC-UL";
    else
      v5 = v4;
    v6 = VRLogfileAlloc(0, (uint64_t)-[NSString UTF8String](self->_dumpID, "UTF8String"), (uint64_t)v5, (uint64_t)".bbdump", "com.apple.VideoConference.VCRClogBB", 9);
    self->_logBasebandDump = v6;
    VRLogfilePrintSync(v6, "STime\t\tV-R-A-F-T\tQD\tQD2\tXmitB\tLTxTS\tIBR\tIBR_OLD\tABRS\tABRL\tBDS\tBDCD\tNBDCD\tND\tTR\tAF\n", v7, v8, v9, v10, v11, v12, v13);
  }
}

- (void)createNWConnectionLogDumpFile
{
  FILE **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (self->_isRateControlDumpFileEnabled)
  {
    v3 = VRLogfileAlloc(0, (uint64_t)-[NSString UTF8String](self->_dumpID, "UTF8String"), (uint64_t)"VCRateControl", (uint64_t)".nwdump", "com.apple.VideoConference.VCRClogNW", 9);
    self->_logNWDump = v3;
    VRLogfilePrintSync(v3, "STime\taTime\tTxTS\tVersion\tDirection\tTech\tByteCount\tQSize1\tQSize2\tDelay\tThroughput\tTxRate\tRateTrend\tFrequentScans\n", v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)releaseAllLogDumpFiles
{
  -[AVCRateController releaseLogDumpFile:](self, "releaseLogDumpFile:", &self->_logDump);
  -[AVCRateController releaseLogDumpFile:](self, "releaseLogDumpFile:", &self->_logFeedbackDump);
  -[AVCRateController releaseLogDumpFile:](self, "releaseLogDumpFile:", &self->_logBasebandDump);
  -[AVCRateController releaseLogDumpFile:](self, "releaseLogDumpFile:", &self->_logNWDump);
  -[AVCRateController releaseLogDumpFile:](self, "releaseLogDumpFile:", &self->_logBWEDump);
}

- (void)releaseLogDumpFile:(void *)a3
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*a3)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v11[6] = v4;
    v11[7] = v4;
    v11[4] = v4;
    v11[5] = v4;
    v11[2] = v4;
    v11[3] = v4;
    v11[0] = v4;
    v11[1] = v4;
    micro();
    VRLogfileGetTimestamp((char *)v11, 0x80u);
    VRLogfilePrintSync((FILE **)*a3, "%s\t%8.3f\tEndOfFile\n", v5, v6, v7, v8, v9, v10, (char)v11);
    VRLogfileFree((uint64_t *)a3);
    *a3 = 0;
  }
}

- (void)printRateControllerHealthPrint
{
  uint64_t v3;
  NSObject *v4;
  unsigned int mode;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int roundTripTimeMilliseconds;
  unsigned int owrd;
  unsigned int v13;
  const char *v14;
  const char *v15;
  double packetLossPercentage;
  const char *v17;
  double packetLossPercentageVideo;
  unsigned int remoteECT1ReceiveCount;
  unsigned int remoteCEReceiveCount;
  unsigned int targetBitrateTier;
  int v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  AVCRateController *v29;
  __int16 v30;
  unsigned int v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unsigned int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  unsigned int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  double v53;
  __int16 v54;
  unsigned int v55;
  __int16 v56;
  unsigned int v57;
  __int16 v58;
  unsigned int v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (-[AVCRateController isStarted](self, "isStarted"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        mode = self->_configuration.mode;
        v6 = self->_targetBitrate / 0x3E8;
        v7 = self->_configuration.maxBitrate / 0x3E8;
        v8 = self->_actualBitrate / 0x3E8;
        v9 = -[AVCStatisticsCollector sharedRemoteEstimatedBandwidth](self->_statisticsCollector, "sharedRemoteEstimatedBandwidth")/ 0x3E8;
        v10 = -[AVCStatisticsCollector sharedEstimatedBandwidth](self->_statisticsCollector, "sharedEstimatedBandwidth")
            / 0x3E8;
        roundTripTimeMilliseconds = self->_roundTripTimeMilliseconds;
        owrd = self->_owrd;
        v13 = self->_configuration.mode;
        v14 = "Uplink PLR=";
        if (v13 == 5)
          v14 = "Downlink PLR=";
        if (v13 == 1)
          v15 = "APLR=";
        else
          v15 = v14;
        packetLossPercentage = self->_packetLossPercentage;
        if (v13 == 1)
          v17 = "VPLR=";
        else
          v17 = "";
        packetLossPercentageVideo = self->_packetLossPercentageVideo;
        remoteECT1ReceiveCount = self->_remoteECT1ReceiveCount;
        remoteCEReceiveCount = self->_remoteCEReceiveCount;
        targetBitrateTier = self->_targetBitrateTier;
        if (targetBitrateTier)
          targetBitrateTier = self->_targetBitrate - targetBitrateTier;
        v22 = 136319746;
        v23 = v3;
        v24 = 2080;
        v25 = "-[AVCRateController printRateControllerHealthPrint]";
        v26 = 1024;
        v27 = 2981;
        v28 = 2048;
        v29 = self;
        v30 = 1024;
        v31 = mode;
        v32 = 1024;
        v33 = v6;
        v34 = 1024;
        v35 = v7;
        v36 = 1024;
        v37 = v8;
        v38 = 1024;
        v39 = v9;
        v40 = 1024;
        v41 = v10;
        v42 = 1024;
        v43 = roundTripTimeMilliseconds;
        v44 = 1024;
        v45 = owrd;
        v46 = 2080;
        v47 = v15;
        v48 = 2048;
        v49 = packetLossPercentage;
        v50 = 2080;
        v51 = v17;
        v52 = 2048;
        v53 = packetLossPercentageVideo;
        v54 = 1024;
        v55 = remoteECT1ReceiveCount;
        v56 = 1024;
        v57 = remoteCEReceiveCount;
        v58 = 1024;
        v59 = targetBitrateTier;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "AVCRC [%s] %s:%d @=@ Health: VCRC (%p) mode=%d, targetBitrate=%u kbps, bitrateCap=%u kbps, actualBitrate=%u kbps, RemoteBWE=%u kbps, LocalBWE=%u kbps, RTT=%u ms, OWRD=%u ms, %s%.2f%%, %s%.2f%%, ect1Count=%u, ceCount=%u, extraTargetBitrate=%u", (uint8_t *)&v22, 0x90u);
      }
    }
  }
}

- (AVCBasebandCongestionDetector)basebandCongestionDetector
{
  return self->_basebandCongestionDetector;
}

- (void)setBasebandCongestionDetector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (VCNWConnectionCongestionDetector)nwConnectionCongestionDetector
{
  return self->_nwConnectionCongestionDetector;
}

- (void)setNwConnectionCongestionDetector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (AVCRateControlFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (void)setFeedbackController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1792);
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (void)setStatisticsCollector:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (VCRateControlMediaController)mediaController
{
  return self->_mediaController;
}

- (void)setMediaController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (unsigned)targetBitrate
{
  return self->_targetBitrate;
}

- (AVCRateControlConfig)configuration
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].algorithmConfig;
  *(_OWORD *)&retstr->mode = *(_OWORD *)&self[1].minBitrate;
  *(_OWORD *)&retstr->minBitrate = v3;
  *(_OWORD *)&retstr->algorithmConfig = *(_OWORD *)&self[2].mode;
  return self;
}

- (unsigned)targetBitrateCap
{
  return self->_targetBitrateCap;
}

- (unsigned)estimatedBandwidthCap
{
  return self->_estimatedBandwidthCap;
}

- (unsigned)expectedBitrate
{
  return self->_expectedBitrate;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (unsigned)nwNotificationProcessed
{
  return self->_nwNotificationProcessed;
}

- (unsigned)maxTargetBitrate
{
  return self->_maxTargetBitrate;
}

- (unsigned)minTargetBitrate
{
  return self->_minTargetBitrate;
}

- (VCRateControlTrafficMetricCollector)trafficMetricCollector
{
  return self->_trafficMetricCollector;
}

- (id)reportingAgent
{
  return self->_reportingAgent;
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _AVCRateController_DoRateControlWithStatistics(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_2(uint64_t a1, _DWORD *a2)
{
  _AVCRateController_DoRateControlWithBasebandStatistics(*(_QWORD *)(a1 + 32), a2);
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_3(uint64_t a1, uint64_t a2)
{
  _AVCRateController_DoRateControlWithNWConnectionStatistics(*(_QWORD *)(a1 + 32), a2);
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_4(uint64_t a1, int *a2)
{
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  NSObject *v6;
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
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  if (*a2 == 14)
  {
    _AVCRateController_DoRateControl((uint64_t)v3, (uint64_t)a2);
    _AVCRateController_NotifyTargetBitrateChange((uint64_t)v3);
  }
  else if ((void *)objc_opt_class() == v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_4_cold_1();
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = (const __CFString *)objc_msgSend(v3, "performSelector:", sel_logPrefix);
    else
      v4 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v7 = *a2;
        v8 = 136316418;
        v9 = v5;
        v10 = 2080;
        v11 = "_AVCRateController_DoRateControlWithLocalRCEvent";
        v12 = 1024;
        v13 = 2572;
        v14 = 2112;
        v15 = v4;
        v16 = 2048;
        v17 = v3;
        v18 = 1024;
        v19 = v7;
        _os_log_error_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_ERROR, "AVCRC [%s] %s:%d %@(%p) Wrong statistics type=%d", (uint8_t *)&v8, 0x36u);
      }
    }
  }
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _AVCRateController_DoRateControlWithStatistics(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_6(uint64_t a1, uint64_t a2)
{
  _AVCRateController_DoRateControlWithNWConnectionStatistics(*(_QWORD *)(a1 + 32), a2);
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _AVCRateController_DoRateControlWithStatistics(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_8(uint64_t a1, _DWORD *a2)
{
  _AVCRateController_DoRateControlWithBasebandStatistics(*(_QWORD *)(a1 + 32), a2);
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _AVCRateController_DoRateControlWithStatistics(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, a6, a7, a8);
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_10(uint64_t a1, uint64_t a2)
{
  _AVCRateController_DoRateControlWithNWConnectionStatistics(*(_QWORD *)(a1 + 32), a2);
}

void ___AVCRateController_SetupDelayedReportingSmartBrake_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v4;
  unsigned int v5;
  unsigned int v6;

  v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = objc_msgSend(*(id *)(v2 + 1776), "targetBitrate");
    v5 = *(_DWORD *)(a1 + 48);
    if (v5)
      v6 = 100 * v4 / v5;
    else
      v6 = -1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
    CFRelease(v3);
  }
}

void ___AVCRateController_SetupDelayedReportingSmartBrake_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  int v4;
  unsigned int v5;
  unsigned int v6;

  v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = objc_msgSend(*(id *)(v2 + 1776), "targetBitrate");
    v5 = *(_DWORD *)(a1 + 48);
    if (v5)
      v6 = 100 * v4 / v5;
    else
      v6 = -1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;
    CFRelease(v3);
  }
}

void ___AVCRateController_SetupDelayedReportingSmartBrake_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    v3 = (const void *)v2;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 100
                                                                * objc_msgSend(*(id *)(v2 + 1776), "targetBitrate")/ *(_DWORD *)(a1 + 64);
    v4 = *(unsigned int *)(a1 + 68);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v7 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v8 = *(unsigned int *)(*(_QWORD *)(v5 + 8) + 24);
    v9[0] = CFSTR("CongestionIndex");
    v10[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
    v9[1] = CFSTR("BWETTxRRatio5");
    v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v9[2] = CFSTR("BWETTxRRatio15");
    v10[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v9[3] = CFSTR("BWETTxRRatio30");
    v10[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v8);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
    reportingGenericEvent();
    CFRelease(v3);
  }
}

- (void)start
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
  OUTLINED_FUNCTION_10_0(&dword_1D8A54000, v0, v1, "AVCRC [%s] %s:%d (%p) Cannot load and retain reportingAgent successfully!", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)registerForRateSharing:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "AVCRC [%s] %s:%d Failed to register for rate sharing due to nil sharing group", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void ___AVCRateController_RegisterStatisticsChangeHandlers_block_invoke_4_cold_1()
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
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "AVCRC [%s] %s:%d Wrong statistics type=%d", v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end
