@implementation VCRedundancyControllerVideo

- (VCRedundancyControllerVideo)initWithDelegate:(id)a3 mode:(unsigned int)a4 parameters:(VCRedundancyControllerVideoParameters_t)a5
{
  uint64_t v5;
  id var0;
  uint64_t v7;
  VCRedundancyControllerVideo *v9;
  VCRedundancyControllerVideo *v10;
  AVCStatisticsCollector *statisticsCollector;
  AVCStatisticsCollector *v12;
  VCRedundancyControlAlgorithmVideo *v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  __objc2_class *v19;
  int v20;
  uint64_t v21;
  AVCStatisticsCollector *v22;
  uint64_t v23;
  uint64_t type;
  AVCStatisticsCollector *v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v29[5];
  _QWORD v30[5];
  objc_super v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v5 = *(_QWORD *)&a5.var1;
  var0 = a5.var0;
  v7 = *(_QWORD *)&a4;
  v38 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)VCRedundancyControllerVideo;
  v9 = -[VCRedundancyControllerVideo init](&v31, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_28;
  objc_storeWeak(&v9->_redundancyControllerDelegate, a3);
  if ((v5 & 0x100000000) != 0)
  {
    v12 = -[AVCStatisticsCollector initForSimulation:useExternalThread:]([AVCStatisticsCollector alloc], "initForSimulation:useExternalThread:", 0, 1);
    v10->_statisticsCollector = v12;
    if (v12)
    {
      -[AVCStatisticsCollector setMediaControlInfoFECFeedbackVersion:](v12, "setMediaControlInfoFECFeedbackVersion:", BYTE5(v5));
      v10->_isUsingInternalStatisticsCollector = 1;
      -[AVCStatisticsCollector start](v10->_statisticsCollector, "start");
      statisticsCollector = v10->_statisticsCollector;
      goto LABEL_6;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:].cold.2(v26, v27);
    }
LABEL_28:

    return 0;
  }
  statisticsCollector = (AVCStatisticsCollector *)var0;
  v10->_statisticsCollector = statisticsCollector;
LABEL_6:
  v10->_mode = v7;
  v10->_type = 0;
  v10->_btNotificationHandlerIndex = -1;
  v10->_mediaControlInfoFECFeedbackVersion = -[AVCStatisticsCollector mediaControlInfoFECFeedbackVersion](statisticsCollector, "mediaControlInfoFECFeedbackVersion");
  RSUtil_SetOptimizationMode(objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-fec-vectorization-enabled"), CFSTR("isRSUOptimizationEnabled"), &unk_1E9EF3AD0, 0), "integerValue"));
  v10->_isNWConnectionEnabled = _os_feature_enabled_impl();
  switch(v10->_mode)
  {
    case 0u:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v33 = v15;
          v34 = 2080;
          v35 = "-[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]";
          v36 = 1024;
          v37 = 82;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video redundancy is disabled.", buf, 0x1Cu);
        }
      }
      break;
    case 5u:
    case 6u:
      v13 = -[VCRedundancyControlAlgorithmVideo initWithRedundancyControllerMode:maxAllowedRedundancyPercentage:mediaControlInfoFECFeedbackVersion:]([VCRedundancyControlAlgorithmVideo alloc], "initWithRedundancyControllerMode:maxAllowedRedundancyPercentage:mediaControlInfoFECFeedbackVersion:", v7, v5, v10->_mediaControlInfoFECFeedbackVersion);
      v14 = 0;
      v10->_algorithm = (VCRedundancyControlAlgorithm *)v13;
      v10->_type = 3;
      goto LABEL_20;
    case 7u:
      v19 = VCRedundancyControlAlgorithmVideoMultiway;
      goto LABEL_16;
    case 8u:
      v19 = VCRedundancyControlAlgorithmVideoIpadCompanion;
LABEL_16:
      v10->_algorithm = (VCRedundancyControlAlgorithm *)objc_alloc_init(v19);
      v20 = 3;
      goto LABEL_18;
    case 9u:
      v10->_algorithm = (VCRedundancyControlAlgorithm *)-[VCRedundancyControlAlgorithmVideo initWithRedundancyControllerMode:maxAllowedRedundancyPercentage:mediaControlInfoFECFeedbackVersion:]([VCRedundancyControlAlgorithmVideo alloc], "initWithRedundancyControllerMode:maxAllowedRedundancyPercentage:mediaControlInfoFECFeedbackVersion:", v7, v5, v10->_mediaControlInfoFECFeedbackVersion);
      v20 = 13;
LABEL_18:
      v10->_type = v20;
      break;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:].cold.1(v17, (int *)&v10->_mode, v18);
      }
      break;
  }
  v14 = 1;
LABEL_20:
  v21 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", v10);
  v22 = v10->_statisticsCollector;
  v23 = MEMORY[0x1E0C809B0];
  type = v10->_type;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __64__VCRedundancyControllerVideo_initWithDelegate_mode_parameters___block_invoke;
  v30[3] = &unk_1E9E523A0;
  v30[4] = v21;
  -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](v22, "registerStatisticsChangeHandlerWithType:handler:", type, v30);
  if ((v14 & 1) == 0 && v10->_isNWConnectionEnabled)
  {
    v25 = v10->_statisticsCollector;
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __64__VCRedundancyControllerVideo_initWithDelegate_mode_parameters___block_invoke_2;
    v29[3] = &unk_1E9E523A0;
    v29[4] = v21;
    -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](v25, "registerStatisticsChangeHandlerWithType:handler:", 11, v29);
  }
  if (_os_feature_enabled_impl())
    -[VCRedundancyControllerVideo setBtNotificationMonitor](v10, "setBtNotificationMonitor");
  return v10;
}

void __64__VCRedundancyControllerVideo_initWithDelegate_mode_parameters___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[12];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
  v4 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v4;
  v11 = *(_QWORD *)(a2 + 192);
  v5 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v5;
  v6 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v6;
  v7 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v7;
  v8 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v8;
  v9 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v9;
  objc_msgSend(v3, "updateRedundancyStrategyWithNetworkStatistics:", v10);
  if (v3)
    CFRelease(v3);
}

void __64__VCRedundancyControllerVideo_initWithDelegate_mode_parameters___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[12];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1DF086F1C](objc_msgSend(*(id *)(a1 + 32), "weak"));
  v4 = *(_OWORD *)(a2 + 176);
  v10[10] = *(_OWORD *)(a2 + 160);
  v10[11] = v4;
  v11 = *(_QWORD *)(a2 + 192);
  v5 = *(_OWORD *)(a2 + 112);
  v10[6] = *(_OWORD *)(a2 + 96);
  v10[7] = v5;
  v6 = *(_OWORD *)(a2 + 144);
  v10[8] = *(_OWORD *)(a2 + 128);
  v10[9] = v6;
  v7 = *(_OWORD *)(a2 + 48);
  v10[2] = *(_OWORD *)(a2 + 32);
  v10[3] = v7;
  v8 = *(_OWORD *)(a2 + 80);
  v10[4] = *(_OWORD *)(a2 + 64);
  v10[5] = v8;
  v9 = *(_OWORD *)(a2 + 16);
  v10[0] = *(_OWORD *)a2;
  v10[1] = v9;
  objc_msgSend(v3, "updateRedundancyStrategyWithNetworkStatistics:", v10);
  if (v3)
    CFRelease(v3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (self->_isUsingInternalStatisticsCollector)
    -[AVCStatisticsCollector stop](self->_statisticsCollector, "stop");
  -[VCBTNotificationMonitor unregisterBTNotificationHandler:](+[VCBTNotificationMonitor sharedInstance](VCBTNotificationMonitor, "sharedInstance"), "unregisterBTNotificationHandler:", self->_btNotificationHandlerIndex);
  self->_btNotificationHandlerIndex = -1;
  objc_storeWeak(&self->_redundancyControllerDelegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)VCRedundancyControllerVideo;
  -[VCRedundancyControllerVideo dealloc](&v3, sel_dealloc);
}

- (void)updateRedundancyStrategyWithNetworkStatistics:(tagVCStatisticsMessage *)a3
{
  unint64_t v5;
  VCRedundancyControlAlgorithm *algorithm;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int type;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  unint64_t statisticsID;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _BYTE v22[48];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_type == 3 && (v5 = a3->var0.network.statisticsID) != 0 && v5 != self->_statisticsID)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      v17 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          statisticsID = self->_statisticsID;
          v19 = a3->var0.network.statisticsID;
          *(_DWORD *)v22 = 136316162;
          *(_QWORD *)&v22[4] = v15;
          *(_WORD *)&v22[12] = 2080;
          *(_QWORD *)&v22[14] = "-[VCRedundancyControllerVideo updateRedundancyStrategyWithNetworkStatistics:]";
          *(_WORD *)&v22[22] = 1024;
          *(_DWORD *)&v22[24] = 135;
          *(_WORD *)&v22[28] = 2048;
          *(_QWORD *)&v22[30] = statisticsID;
          *(_WORD *)&v22[38] = 2048;
          *(_QWORD *)&v22[40] = v19;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Filter out statistics not belong to this redundancyController with id:%llu, statisticsID:%llu", v22, 0x30u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v20 = self->_statisticsID;
        v21 = a3->var0.network.statisticsID;
        *(_DWORD *)v22 = 136316162;
        *(_QWORD *)&v22[4] = v15;
        *(_WORD *)&v22[12] = 2080;
        *(_QWORD *)&v22[14] = "-[VCRedundancyControllerVideo updateRedundancyStrategyWithNetworkStatistics:]";
        *(_WORD *)&v22[22] = 1024;
        *(_DWORD *)&v22[24] = 135;
        *(_WORD *)&v22[28] = 2048;
        *(_QWORD *)&v22[30] = v20;
        *(_WORD *)&v22[38] = 2048;
        *(_QWORD *)&v22[40] = v21;
        _os_log_debug_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Filter out statistics not belong to this redundancyController with id:%llu, statisticsID:%llu", v22, 0x30u);
      }
    }
  }
  else
  {
    algorithm = self->_algorithm;
    v7 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 152);
    v30 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 136);
    v31 = v7;
    v32 = *((_QWORD *)&a3->var0.localRCEvent + 21);
    v8 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 88);
    v26 = *(_OWORD *)(&a3->var0.localRCEvent + 3);
    v27 = v8;
    v9 = *(_OWORD *)(&a3->var0.localRCEvent + 5);
    v28 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 104);
    v29 = v9;
    v10 = *(_OWORD *)(&a3->var0.localRCEvent + 1);
    *(_OWORD *)&v22[32] = *(_OWORD *)&a3->var0.rtcpRR.lastSequenceNumber;
    v23 = v10;
    v11 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 56);
    v24 = *(_OWORD *)((char *)&a3->var0.localRCEvent + 40);
    v25 = v11;
    v12 = *(_OWORD *)&a3->isVCRCInternal;
    *(_OWORD *)v22 = *(_OWORD *)&a3->type;
    *(_OWORD *)&v22[16] = v12;
    -[VCRedundancyControlAlgorithm updateRedundancyStrategyWithNetworkStatistics:](algorithm, "updateRedundancyStrategyWithNetworkStatistics:", v22);
    type = self->_type;
    if (type == 13 || type == 3)
    {
      v14 = -[VCRedundancyControlAlgorithm redundancyPercentage](self->_algorithm, "redundancyPercentage");
      -[VCRedundancyControlAlgorithm redundancyInterval](self->_algorithm, "redundancyInterval");
      -[VCRedundancyControllerVideo reportRedundancyPercentage:redundancyInterval:](self, "reportRedundancyPercentage:redundancyInterval:", v14);
    }
  }
}

- (void)reportRedundancyPercentage:(unsigned int)a3 redundancyInterval:(double)a4
{
  uint64_t v5;
  int forceRedundancyPercentage;
  uint64_t v8;
  NSObject *v9;
  unsigned int currentRedundancyPercentage;
  unsigned int mode;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  VCRedundancyControlAlgorithm *algorithm;
  void *v17;
  _OWORD v18[4];
  __int16 v19;
  _BYTE buf[48];
  __int128 v21;
  __int16 v22;
  uint64_t v23;

  LODWORD(v5) = a3;
  v23 = *MEMORY[0x1E0C80C00];
  -[VCRedundancyControllerVideo loadDefaultSettings](self, "loadDefaultSettings");
  forceRedundancyPercentage = self->_forceRedundancyPercentage;
  if (forceRedundancyPercentage >= 0)
    v5 = forceRedundancyPercentage;
  else
    v5 = v5;
  if (self->_currentRedundancyPercentage != (_DWORD)v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        currentRedundancyPercentage = self->_currentRedundancyPercentage;
        mode = self->_mode;
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = v8;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCRedundancyControllerVideo reportRedundancyPercentage:redundancyInterval:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 165;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = currentRedundancyPercentage;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = v5;
        *(_WORD *)&buf[40] = 1024;
        *(_DWORD *)&buf[42] = mode;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video redundancy percentage changed from %d to %d with mode %d", buf, 0x2Eu);
      }
    }
    self->_currentRedundancyPercentage = v5;
    v12 = (void *)MEMORY[0x1DF086F1C](&self->_redundancyControllerDelegate);
    objc_msgSend(v12, "redundancyController:redundancyPercentageDidChange:", self, v5);
    if (v12)
      CFRelease(v12);
  }
  if (a4 != 0.0 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCRedundancyControllerVideo reportRedundancyPercentage:redundancyInterval:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 173;
      *(_WORD *)&buf[28] = 2048;
      *(double *)&buf[30] = a4;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Video redundancy interval %f, which should be 0 since we don't support cross-frame FEC yet", buf, 0x26u);
    }
  }
  if (VCMediaControlInfo_IsLossStatsEnabled(self->_mediaControlInfoFECFeedbackVersion))
  {
    v22 = -21846;
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&buf[32] = v15;
    v21 = v15;
    *(_OWORD *)buf = v15;
    *(_OWORD *)&buf[16] = v15;
    algorithm = self->_algorithm;
    if (algorithm)
    {
      -[VCRedundancyControlAlgorithm getFecLevelPerFrameSizeVector](algorithm, "getFecLevelPerFrameSizeVector");
      if (*(_WORD *)buf)
      {
        v17 = (void *)MEMORY[0x1DF086F1C](&self->_redundancyControllerDelegate);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v18[2] = *(_OWORD *)&buf[32];
          v18[3] = v21;
          v19 = v22;
          v18[0] = *(_OWORD *)buf;
          v18[1] = *(_OWORD *)&buf[16];
          objc_msgSend(v17, "redundancyController:redundancyVectorDidChange:", self, v18);
        }
        if (v17)
          CFRelease(v17);
      }
    }
  }
}

- (void)loadDefaultSettings
{
  double v3;

  v3 = micro();
  if (v3 - self->_lastDefaultSettingLoadingTime > 3.0)
  {
    self->_forceRedundancyPercentage = -[VCDefaults redundancyControlForceVideoRedundancyPercentage](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "redundancyControlForceVideoRedundancyPercentage");
    self->_lastDefaultSettingLoadingTime = v3;
  }
}

- (void)setBtNotificationMonitor
{
  VCBTNotificationMonitor *v3;
  _QWORD v4[5];
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3052000000;
  v5[3] = __Block_byref_object_copy__2;
  v5[4] = __Block_byref_object_dispose__2;
  v5[5] = self;
  v3 = +[VCBTNotificationMonitor sharedInstance](VCBTNotificationMonitor, "sharedInstance");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__VCRedundancyControllerVideo_setBtNotificationMonitor__block_invoke;
  v4[3] = &unk_1E9E523E8;
  v4[4] = v5;
  self->_btNotificationHandlerIndex = -[VCBTNotificationMonitor registerBTNotificationHandler:](v3, "registerBTNotificationHandler:", v4);
  _Block_object_dispose(v5, 8);
}

uint64_t __55__VCRedundancyControllerVideo_setBtNotificationMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "resetRedundancyStrategy:", a2);
}

- (void)resetRedundancyStrategy:(id *)a3
{
  const __CFString *v5;
  uint64_t v6;
  NSObject *v7;
  char *var0;
  unint64_t var1;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  unint64_t v16;
  _BYTE v17[24];
  __int128 v18;
  VCRedundancyControllerVideo *v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((VCRedundancyControllerVideo *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      var0 = a3->var0;
      var1 = a3->var1;
      *(_DWORD *)v17 = 136316162;
      *(_QWORD *)&v17[4] = v6;
      *(_WORD *)&v17[12] = 2080;
      *(_QWORD *)&v17[14] = "-[VCRedundancyControllerVideo resetRedundancyStrategy:]";
      *(_WORD *)&v17[22] = 1024;
      LODWORD(v18) = 206;
      WORD2(v18) = 2080;
      *(_QWORD *)((char *)&v18 + 6) = var0;
      HIWORD(v18) = 1024;
      LODWORD(v19) = var1;
      v10 = " [%s] %s:%d Reset redundancy strategy, BT device %s state=%d while WLAN's on 2.4GHz";
      v11 = v7;
      v12 = 44;
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v5 = (const __CFString *)-[VCRedundancyControllerVideo performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v5 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_13;
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v15 = a3->var0;
      v16 = a3->var1;
      *(_DWORD *)v17 = 136316674;
      *(_QWORD *)&v17[4] = v13;
      *(_WORD *)&v17[12] = 2080;
      *(_QWORD *)&v17[14] = "-[VCRedundancyControllerVideo resetRedundancyStrategy:]";
      *(_WORD *)&v17[22] = 1024;
      LODWORD(v18) = 206;
      WORD2(v18) = 2112;
      *(_QWORD *)((char *)&v18 + 6) = v5;
      HIWORD(v18) = 2048;
      v19 = self;
      LOWORD(v20) = 2080;
      *(_QWORD *)((char *)&v20 + 2) = v15;
      WORD5(v20) = 1024;
      HIDWORD(v20) = v16;
      v10 = " [%s] %s:%d %@(%p) Reset redundancy strategy, BT device %s state=%d while WLAN's on 2.4GHz";
      v11 = v14;
      v12 = 64;
    }
    _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, v10, v17, v12);
LABEL_13:
    -[VCRedundancyControlAlgorithm setIsRedundancyStrategyResetPending:](self->_algorithm, "setIsRedundancyStrategyResetPending:", 1, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18, v19, v20);
  }
}

- (unint64_t)statisticsID
{
  return self->_statisticsID;
}

- (void)setStatisticsID:(unint64_t)a3
{
  self->_statisticsID = a3;
}

- (AVCStatisticsCollector)statisticsCollector
{
  return self->_statisticsCollector;
}

- (NSArray)fecLevelPerFrameSizeVector
{
  return self->_fecLevelPerFrameSizeVector;
}

- (void)initWithDelegate:(uint64_t)a1 mode:(int *)a2 parameters:(os_log_t)log .cold.1(uint64_t a1, int *a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 136315906;
  v5 = a1;
  v6 = 2080;
  v7 = "-[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]";
  v8 = 1024;
  v9 = 85;
  v10 = 1024;
  v11 = v3;
  _os_log_error_impl(&dword_1D8A54000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d In-appropriate mode %d for VCRedundancyControllerVideo", (uint8_t *)&v4, 0x22u);
}

- (void)initWithDelegate:(uint64_t)a1 mode:(NSObject *)a2 parameters:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136315650;
  v3 = a1;
  v4 = 2080;
  v5 = "-[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]";
  v6 = 1024;
  v7 = 45;
  _os_log_error_impl(&dword_1D8A54000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create internal statistics collector for redundancy controller", (uint8_t *)&v2, 0x1Cu);
}

@end
