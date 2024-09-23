@implementation VCCallSession

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<VCCallSession localCallID = %d, remoteCallID = %d, state = %d, sentDidStartAsYES = %d>"), -[VCCallInfo callID](self->localCallInfo, "callID"), -[VCCallInfo callID](self->remoteCallInfo, "callID"), self->state, self->sentClientSuccessfulDidStart);
}

- (VCCallSession)init
{
  return -[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:](self, "initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:", 0, 0, 0, 0);
}

- (VCCallSession)initWithDeviceRole:(int)a3 transportType:(unsigned int)a4 isGKVoiceChat:(BOOL)a5 reportingHierarchyToken:(id)a6
{
  _BOOL4 v7;
  char *v10;
  const __CFString *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  int v26;
  BOOL v27;
  uint64_t ID;
  uint64_t v29;
  NSObject *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __objc2_class **v44;
  void *v45;
  void *v46;
  VCSwitchManager *v47;
  uint64_t v48;
  NSObject *v49;
  int v50;
  VCTelephonyInterface *v51;
  objc_super v53;
  _QWORD v54[14];
  _QWORD v55[14];
  uint8_t buf[4];
  uint64_t v57;
  __int128 v58;
  _BYTE v59[12];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  char v67[16];
  pthread_mutexattr_t v68;
  uint64_t v69;

  v7 = a5;
  v69 = *MEMORY[0x1E0C80C00];
  v53.receiver = self;
  v53.super_class = (Class)VCCallSession;
  v10 = -[VCCallSession init](&v53, sel_init);
  if ((char *)objc_opt_class() == v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 136316418;
    v57 = v12;
    LOWORD(v58) = 2080;
    *(_QWORD *)((char *)&v58 + 2) = "-[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:]";
    WORD5(v58) = 1024;
    HIDWORD(v58) = 344;
    *(_WORD *)v59 = 1024;
    *(_DWORD *)&v59[2] = a3;
    *(_WORD *)&v59[6] = 1024;
    *(_DWORD *)&v59[8] = a4;
    LOWORD(v60) = 1024;
    *(_DWORD *)((char *)&v60 + 2) = v7;
    v14 = "VCCallSession [%s] %s:%d deviceRole = %d, transportType = %d, isGKVoiceChat = %d";
    v15 = v13;
    v16 = 46;
    goto LABEL_11;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v11 = (const __CFString *)objc_msgSend(v10, "performSelector:", sel_logPrefix);
  else
    v11 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316930;
      v57 = v17;
      LOWORD(v58) = 2080;
      *(_QWORD *)((char *)&v58 + 2) = "-[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:]";
      WORD5(v58) = 1024;
      HIDWORD(v58) = 344;
      *(_WORD *)v59 = 2112;
      *(_QWORD *)&v59[2] = v11;
      *(_WORD *)&v59[10] = 2048;
      *(_QWORD *)&v60 = v10;
      WORD4(v60) = 1024;
      *(_DWORD *)((char *)&v60 + 10) = a3;
      HIWORD(v60) = 1024;
      LODWORD(v61) = a4;
      WORD2(v61) = 1024;
      *(_DWORD *)((char *)&v61 + 6) = v7;
      v14 = "VCCallSession [%s] %s:%d %@(%p) deviceRole = %d, transportType = %d, isGKVoiceChat = %d";
      v15 = v18;
      v16 = 66;
LABEL_11:
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
LABEL_12:
  *((_QWORD *)v10 + 5) = 2;
  +[VCVTPWrapper startVTP](VCVTPWrapper, "startVTP");
  *((_QWORD *)v10 + 27) = 0xFFFFFFFFLL;
  v19 = +[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager");
  if (a4)
  {
    objc_msgSend(v19, "setupVTPCallback");
  }
  else
  {
    objc_msgSend(v19, "startSIPWithPacketMultiplexMode:transportType:", objc_msgSend(v10, "mapPacketMultiplexModeToSIPMode:", *((_QWORD *)v10 + 5)), 0);
    *((_QWORD *)v10 + 27) = objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "SIPHandle");
  }
  *((_QWORD *)v10 + 94) = 0;
  *((_QWORD *)v10 + 95) = &stru_1E9E58EE0;
  *((_QWORD *)v10 + 192) = &stru_1E9E58EE0;
  *((_QWORD *)v10 + 3) = 0;
  *((_QWORD *)v10 + 4) = 0;
  *((_DWORD *)v10 + 94) = 0;
  v10[226] = 0;
  *((_QWORD *)v10 + 11) = 0;
  *((_WORD *)v10 + 112) = 0;
  *((_QWORD *)v10 + 16) = 0;
  *((_QWORD *)v10 + 17) = 0;
  *((_QWORD *)v10 + 6) = 0xFFFFFFFFLL;
  *((_QWORD *)v10 + 7) = 0xFFFFFFFFLL;
  *((_QWORD *)v10 + 42) = 0xFFFFFFFFLL;
  *((_QWORD *)v10 + 43) = 0xFFFFFFFFLL;
  v68.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v68.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v68);
  pthread_mutexattr_settype(&v68, 2);
  v10[296] = 0;
  *((_QWORD *)v10 + 24) = -1;
  pthread_mutex_init((pthread_mutex_t *)(v10 + 232), &v68);
  pthread_mutexattr_destroy(&v68);
  v10[408] = 0;
  pthread_mutex_init((pthread_mutex_t *)(v10 + 416), 0);
  pthread_mutex_init((pthread_mutex_t *)v10 + 13, 0);
  *(_WORD *)(v10 + 385) = 0;
  *((_QWORD *)v10 + 64) = 0;
  *((_DWORD *)v10 + 165) = -1;
  *((_QWORD *)v10 + 83) = 0;
  v10[993] = v7;
  v10[592] = !v7;
  *((_QWORD *)v10 + 18) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
  *((_WORD *)v10 + 600) = 1450;
  *((_DWORD *)v10 + 95) = 104;
  v10[977] = 1;
  *((_DWORD *)v10 + 82) = a3;
  *((_QWORD *)v10 + 75) = 0;
  v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  *((_QWORD *)v10 + 15) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.connectionChangeQueue", v20);
  *((_QWORD *)v10 + 60) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.videoQueue", v20);
  *((_QWORD *)v10 + 61) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.videoAsyncQueue", v20);
  *((_QWORD *)v10 + 112) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.qualityQueue", 0);
  *((_QWORD *)v10 + 62) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.audioQueue", v20);
  *((_QWORD *)v10 + 63) = dispatch_queue_create("com.apple.VideoConference.VCCallSession.delegateNotificationQueue", v20);
  v10[528] = -[VCDefaults audioRecordingEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "audioRecordingEnabled");
  *((_DWORD *)v10 + 133) = -[VCDefaults aacBlockSize](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "aacBlockSize");
  v10[384] = -[VCDefaults useSBR](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "useSBR");
  *((_QWORD *)v10 + 146) = objc_alloc_init(MEMORY[0x1E0CF2690]);
  *((_QWORD *)v10 + 84) = objc_alloc_init(MEMORY[0x1E0CF2690]);
  *((_QWORD *)v10 + 86) = 0;
  *((_QWORD *)v10 + 99) = 0;
  v10[608] = 0;
  v10[648] = 0;
  *(_QWORD *)(v10 + 652) = 0;
  *(_QWORD *)(v10 + 620) = 0;
  *(_QWORD *)(v10 + 628) = 0;
  *(_QWORD *)(v10 + 612) = 0;
  *((_DWORD *)v10 + 159) = 0;
  v10[593] = 1;
  v10[817] = 0;
  v10[976] = 0;
  v10[980] = 0;
  pthread_mutex_init((pthread_mutex_t *)(v10 + 912), 0);
  *((_QWORD *)v10 + 123) = -[VCCallLinkCongestionDetector initWithRTTThreshold:lossRateThreshold:]([VCCallLinkCongestionDetector alloc], "initWithRTTThreshold:lossRateThreshold:", 3.0, 0.6);
  v10[992] = 1;
  *((_QWORD *)v10 + 136) = 0;
  v10[1080] = 0;
  *((_WORD *)v10 + 548) = 0;
  v10[1545] = 0;
  *((_DWORD *)v10 + 252) = 0;
  *((_OWORD *)v10 + 97) = 0u;
  *((_OWORD *)v10 + 98) = 0u;
  *((_OWORD *)v10 + 99) = 0u;
  *((_OWORD *)v10 + 100) = 0u;
  *((_OWORD *)v10 + 101) = 0u;
  *((_OWORD *)v10 + 102) = 0u;
  *((_OWORD *)v10 + 103) = 0u;
  *((_OWORD *)v10 + 104) = 0u;
  *((_OWORD *)v10 + 105) = 0u;
  *((_OWORD *)v10 + 106) = 0u;
  *((_DWORD *)v10 + 287) = 0;
  *((_QWORD *)v10 + 144) = dispatch_queue_create("com.apple.avconference.vccallsession.celltech", 0);
  *((_QWORD *)v10 + 148) = 0;
  if ((VTP_GetSendRecvStats((unint64_t *)v10 + 151, (unint64_t *)v10 + 152) & 0x80000000) != 0)
  {
    *((_QWORD *)v10 + 151) = -1;
    *((_QWORD *)v10 + 152) = -1;
  }
  *((_QWORD *)v10 + 156) = 0xFFFFFFFFLL;
  *((_QWORD *)v10 + 157) = 0xFFFFFFFFLL;
  *((_QWORD *)v10 + 127) = 0x4008000000000000;
  __asm { FMOV            V0.2D, #4.0 }
  *((_OWORD *)v10 + 64) = _Q0;
  *((_QWORD *)v10 + 130) = 0x4008000000000000;
  *(_OWORD *)(v10 + 1336) = 0u;
  v26 = -[VCDefaults enableiRATSuggestion](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableiRATSuggestion");
  if (v26 == -1)
    v27 = +[GKSConnectivitySettings supportiRATRecommendation](GKSConnectivitySettings, "supportiRATRecommendation");
  else
    v27 = v26 != 0;
  v10[1352] = v27;
  *((_QWORD *)v10 + 3) = objc_alloc_init(VCCallInfo);
  ID = VCUniqueIDGenerator_GenerateID();
  objc_msgSend(*((id *)v10 + 3), "setCallID:", ID);
  objc_msgSend(*((id *)v10 + 3), "setSupportsSKEOptimization:", 1);
  memset(v67, 170, 12);
  __sprintf_chk(v67, 0, 0xCuLL, "%010u", ID);
  *((_QWORD *)v10 + 191) = VRLogfileAlloc(0, (uint64_t)v67, (uint64_t)"CallSettings", (uint64_t)".calldump", "com.apple.VideoConference.CallSettingsLog", 32);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v29 = VRTraceErrorLogLevelToCSTR();
    v30 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v57 = v29;
      LOWORD(v58) = 2080;
      *(_QWORD *)((char *)&v58 + 2) = "-[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:]";
      WORD5(v58) = 1024;
      HIDWORD(v58) = 495;
      _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Using the following path - traditional 1:1", buf, 0x1Cu);
    }
  }
  if (!v7)
  {
    v57 = 0;
    v58 = 0uLL;
    *(_DWORD *)buf = ID;
    *(_DWORD *)v59 = 0;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    *(_QWORD *)&v59[4] = a6;
    v63 = &__block_literal_global_46;
    v64 = 0u;
    v65 = 0u;
    v66 = 0;
    *((_QWORD *)v10 + 174) = reportingCreateAgent();
    *((_DWORD *)v10 + 350) = VCReporting_GetDynamicReportingModuleID();
    reportingSetPeriodicAggregationOccuredHandler();
    -[VCQoSMonitorManager registerQoSReportingSourceForToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "registerQoSReportingSourceForToken:", ID);
  }
  *((_QWORD *)v10 + 50) = objc_alloc_init(MEMORY[0x1E0C99E08]);
  *((_OWORD *)v10 + 85) = 0u;
  v10[1407] = -[VCDefaults rateControlDumpEnabled](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "rateControlDumpEnabled");
  *((_DWORD *)v10 + 373) = 1;
  *((_DWORD *)v10 + 368) = -1;
  v31 = (_QWORD *)MEMORY[0x1E0CF29B0];
  *((_DWORD *)v10 + 355) = 0;
  v54[0] = *v31;
  v55[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[GKSConnectivitySettings getAdaptiveLearningState](GKSConnectivitySettings, "getAdaptiveLearningState"));
  v54[1] = *MEMORY[0x1E0CF2990];
  v55[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[GKSConnectivitySettings getShortTermHistoryLength](GKSConnectivitySettings, "getShortTermHistoryLength"));
  v54[2] = *MEMORY[0x1E0CF2970];
  v55[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[GKSConnectivitySettings getLongTermHistoryLength](GKSConnectivitySettings, "getLongTermHistoryLength"));
  v54[3] = *MEMORY[0x1E0CF2948];
  v32 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdaptiveLearningA](GKSConnectivitySettings, "getAdaptiveLearningA");
  v55[3] = objc_msgSend(v32, "numberWithDouble:");
  v54[4] = *MEMORY[0x1E0CF2958];
  v33 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdjustmentFactorA](GKSConnectivitySettings, "getAdjustmentFactorA");
  v55[4] = objc_msgSend(v33, "numberWithDouble:");
  v54[5] = *MEMORY[0x1E0CF2998];
  v34 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getShortTermValueWeightA](GKSConnectivitySettings, "getShortTermValueWeightA");
  v55[5] = objc_msgSend(v34, "numberWithDouble:");
  v54[6] = *MEMORY[0x1E0CF2978];
  v35 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getLongTermValueWeightA](GKSConnectivitySettings, "getLongTermValueWeightA");
  v55[6] = objc_msgSend(v35, "numberWithDouble:");
  v54[7] = *MEMORY[0x1E0CF2950];
  v36 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdaptiveLearningB](GKSConnectivitySettings, "getAdaptiveLearningB");
  v55[7] = objc_msgSend(v36, "numberWithDouble:");
  v54[8] = *MEMORY[0x1E0CF2960];
  v37 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdjustmentFactorB](GKSConnectivitySettings, "getAdjustmentFactorB");
  v55[8] = objc_msgSend(v37, "numberWithDouble:");
  v54[9] = *MEMORY[0x1E0CF29A0];
  v38 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getShortTermValueWeightB](GKSConnectivitySettings, "getShortTermValueWeightB");
  v55[9] = objc_msgSend(v38, "numberWithDouble:");
  v54[10] = *MEMORY[0x1E0CF2980];
  v39 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getLongTermValueWeightB](GKSConnectivitySettings, "getLongTermValueWeightB");
  v55[10] = objc_msgSend(v39, "numberWithDouble:");
  v54[11] = *MEMORY[0x1E0CF2968];
  v40 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getAdjustmentFactorC](GKSConnectivitySettings, "getAdjustmentFactorC");
  v55[11] = objc_msgSend(v40, "numberWithDouble:");
  v54[12] = *MEMORY[0x1E0CF29A8];
  v41 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getShortTermValueWeightC](GKSConnectivitySettings, "getShortTermValueWeightC");
  v55[12] = objc_msgSend(v41, "numberWithDouble:");
  v54[13] = *MEMORY[0x1E0CF2988];
  v42 = (void *)MEMORY[0x1E0CB37E8];
  +[GKSConnectivitySettings getLongTermValueWeightC](GKSConnectivitySettings, "getLongTermValueWeightC");
  v55[13] = objc_msgSend(v42, "numberWithDouble:");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 14);
  createAdaptiveLearningForAgent();
  reportingRegisterPeriodicTaskWeak();
  reportingRegisterSystemStats();
  reportingSymptomSetCallback();
  *((_QWORD *)v10 + 185) = dispatch_queue_create("com.apple.avconference.vccallsession.timestamp", 0);
  v10[1488] = 0;
  v43 = malloc_type_calloc(1uLL, 0x108uLL, 0x10A0040C891A16EuLL);
  v44 = off_1E9E4D670;
  *((_QWORD *)v10 + 187) = v43;
  if (a4 != 1)
    v44 = off_1E9E4D678;
  v45 = (void *)objc_msgSend(objc_alloc(*v44), "initWithCallID:reportingAgent:", ID, *((_QWORD *)v10 + 174));
  *((_QWORD *)v10 + 189) = v45;
  objc_msgSend(v45, "setPerfTimings:", *((_QWORD *)v10 + 84));
  v46 = (void *)objc_msgSend(*((id *)v10 + 189), "connectionManager");
  *((_QWORD *)v10 + 10) = v46;
  objc_msgSend(v46, "setDuplicationCallback:withContext:", VCCMDuplicationCallback_0, v10);
  objc_msgSend(*((id *)v10 + 10), "setDefaultLinkProbingCapabilityVersionForDeviceRole:", objc_msgSend(v10, "deviceRole"));
  *((_DWORD *)v10 + 377) = a4;
  v47 = objc_alloc_init(VCSwitchManager);
  *((_QWORD *)v10 + 14) = v47;
  -[VCSwitchManager initializeLocalSwitches](v47, "initializeLocalSwitches");
  objc_msgSend(*((id *)v10 + 10), "setCellPrimaryInterfaceChangeEnabled:", objc_msgSend(*((id *)v10 + 14), "isLocalSwitchEnabled:", 0x800000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v48 = VRTraceErrorLogLevelToCSTR();
    v49 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v50 = objc_msgSend(*((id *)v10 + 10), "cellPrimaryInterfaceChangeEnabled");
      *(_DWORD *)buf = 136315906;
      v57 = v48;
      LOWORD(v58) = 2080;
      *(_QWORD *)((char *)&v58 + 2) = "-[VCCallSession initWithDeviceRole:transportType:isGKVoiceChat:reportingHierarchyToken:]";
      WORD5(v58) = 1024;
      HIDWORD(v58) = 570;
      *(_WORD *)v59 = 1024;
      *(_DWORD *)&v59[2] = v50;
      _os_log_impl(&dword_1D8A54000, v49, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch wifiAssistStatusBarEnabled %d", buf, 0x22u);
    }
  }
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setReportingAgent:", *((_QWORD *)v10 + 174));
  objc_msgSend(v10, "registerForReportingNotifications");
  objc_msgSend(v10, "reportClientPersistentSettings");
  if (objc_msgSend(v10, "deviceRole") == 2 || objc_msgSend(v10, "deviceRole") == 4)
  {
    v51 = objc_alloc_init(VCTelephonyInterface);
    *((_QWORD *)v10 + 183) = v51;
    -[VCTelephonyInterface setDelegate:](v51, "setDelegate:", v10);
    objc_msgSend(*((id *)v10 + 183), "registerForNotifications");
  }
  *((double *)v10 + 214) = micro();
  return (VCCallSession *)v10;
}

void __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (!objc_msgSend(a3, "count") && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke_cold_1();
  }
}

uint64_t __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke_28(uint64_t a1, uint64_t a2)
{
  return -[VCQoSMonitorManager updateQoSReport:toClientsWithToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "updateQoSReport:toClientsWithToken:", a2, *(unsigned int *)(a1 + 32));
}

uint64_t __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "gatherRealtimeStats:");
}

- (void)gatherRealtimeStats:(__CFDictionary *)a3
{
  int operatingMode;
  BOOL v6;
  CFAllocatorRef *v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  const __CFAllocator *v12;
  CFStringRef v13;
  CFStringRef v14;
  CFStringRef v15;
  CFStringRef v16;
  CFStringRef v17;
  CFStringRef v18;
  CFStringRef v19;
  CFStringRef v20;
  CFStringRef v21;
  CFStringRef v22;
  CFStringRef v23;
  CFStringRef v24;
  CFStringRef v25;
  const __CFDictionary *v26;
  const __CFAllocator *v27;
  CFNumberRef v28;
  CFStringRef v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  unsigned __int8 v36;
  int v37;
  int valuePtr;
  uint64_t v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    operatingMode = self->operatingMode;
    v6 = operatingMode == 4 || operatingMode == 1;
    v7 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
    if (v6)
    {
      -[VCCallSession sessionReceivingBitrate](self, "sessionReceivingBitrate");
      v9 = (v8 / 1000.0);
      -[VCCallSession sessionTransmittingBitrate](self, "sessionTransmittingBitrate");
      v11 = (v10 / 1000.0);
      v12 = *v7;
      v13 = CFStringCreateWithFormat(*v7, 0, CFSTR("%u"), v9);
      CFDictionaryAddValue(a3, CFSTR("VRxR"), v13);
      CFRelease(v13);
      v14 = CFStringCreateWithFormat(v12, 0, CFSTR("%u"), v11);
      CFDictionaryAddValue(a3, CFSTR("VTxR"), v14);
      CFRelease(v14);
      v15 = CFStringCreateWithFormat(v12, 0, CFSTR("%u"), self->_mediaStallCount);
      CFDictionaryAddValue(a3, CFSTR("MSTC"), v15);
      CFRelease(v15);
      self->_mediaStallCount = 0;
      v16 = CFStringCreateWithFormat(v12, 0, CFSTR("%f"), *(_QWORD *)&self->_mediaStallTotalTime);
      CFDictionaryAddValue(a3, CFSTR("MSTT"), v16);
      CFRelease(v16);
      self->_mediaStallTotalTime = 0.0;
      v17 = CFStringCreateWithFormat(v12, 0, CFSTR("%f"), *(_QWORD *)&self->_maxMediaStallTime);
      CFDictionaryAddValue(a3, CFSTR("MMST"), v17);
      CFRelease(v17);
      self->_maxMediaStallTime = 0.0;
      v18 = CFStringCreateWithFormat(v12, 0, CFSTR("%llu"), -[VCConnectionManager mediaExcessiveCellularTxBytes](self->connectionManager, "mediaExcessiveCellularTxBytes")+ -[VCConnectionManager signalingExcessiveCellularTxBytes](self->connectionManager, "signalingExcessiveCellularTxBytes"));
      CFDictionaryAddValue(a3, CFSTR("CDupTxDb"), v18);
      CFRelease(v18);
      v19 = CFStringCreateWithFormat(v12, 0, CFSTR("%llu"), -[VCConnectionManager mediaExcessiveCellularRxBytes](self->connectionManager, "mediaExcessiveCellularRxBytes")+ -[VCConnectionManager signalingExcessiveCellularRxBytes](self->connectionManager, "signalingExcessiveCellularRxBytes"));
      CFDictionaryAddValue(a3, CFSTR("CDupRxDb"), v19);
      CFRelease(v19);
      v20 = CFStringCreateWithFormat(v12, 0, CFSTR("%llu"), -[VCConnectionManager budgetConsumingCellularTxBytes](self->connectionManager, "budgetConsumingCellularTxBytes"));
      CFDictionaryAddValue(a3, CFSTR("CBudgTxDb"), v20);
      CFRelease(v20);
      v21 = CFStringCreateWithFormat(v12, 0, CFSTR("%llu"), -[VCConnectionManager budgetConsumingCellularRxBytes](self->connectionManager, "budgetConsumingCellularRxBytes"));
      CFDictionaryAddValue(a3, CFSTR("CBudgRxDb"), v21);
      CFRelease(v21);
      v22 = CFStringCreateWithFormat(v12, 0, CFSTR("%llu"), -[VCConnectionManager mediaCellularTxBytes](self->connectionManager, "mediaCellularTxBytes"));
      CFDictionaryAddValue(a3, CFSTR("CTxDb"), v22);
      CFRelease(v22);
      v23 = CFStringCreateWithFormat(v12, 0, CFSTR("%llu"), -[VCConnectionManager mediaCellularRxBytes](self->connectionManager, "mediaCellularRxBytes"));
      CFDictionaryAddValue(a3, CFSTR("CRxDb"), v23);
      CFRelease(v23);
      v24 = CFStringCreateWithFormat(v12, 0, CFSTR("%llu"), -[VCConnectionManager mediaWifiTxBytes](self->connectionManager, "mediaWifiTxBytes"));
      CFDictionaryAddValue(a3, CFSTR("WTxDb"), v24);
      CFRelease(v24);
      v25 = CFStringCreateWithFormat(v12, 0, CFSTR("%llu"), -[VCConnectionManager mediaWifiRxBytes](self->connectionManager, "mediaWifiRxBytes"));
      CFDictionaryAddValue(a3, CFSTR("WRxDb"), v25);
      CFRelease(v25);
      operatingMode = self->operatingMode;
    }
    if (operatingMode == 1)
    {
      v26 = (const __CFDictionary *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyRealtimeStatsDictionary");
      VCUtil_AppendFromDictionary(a3, v26);
      CFRelease(v26);
    }
    v37 = 0;
    v36 = 0;
    +[VCWiFiUtils getInfraChannelNumber:is5Ghz:](VCWiFiUtils, "getInfraChannelNumber:is5Ghz:", &v37, &v36);
    valuePtr = v36;
    v27 = *v7;
    v28 = CFNumberCreate(*v7, kCFNumberIntType, &valuePtr);
    CFDictionaryAddValue(a3, CFSTR("iWiFi5GHz"), v28);
    CFRelease(v28);
    v35 = 0;
    v34 = 0;
    -[VCTransportSession getSignalStrengthBars:displayBars:maxDisplayBars:](self->_transportSession, "getSignalStrengthBars:displayBars:maxDisplayBars:", (char *)&v35 + 4, &v35, &v34);
    v29 = CFStringCreateWithFormat(v27, 0, CFSTR("%d"), HIDWORD(v35));
    CFDictionaryAddValue(a3, CFSTR("SS"), v29);
    CFRelease(v29);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      v32 = *MEMORY[0x1E0CF2758];
      if (*MEMORY[0x1E0CF2748])
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = objc_msgSend((id)-[__CFDictionary description](a3, "description"), "UTF8String");
          valuePtr = 136315906;
          v39 = v30;
          v40 = 2080;
          v41 = "-[VCCallSession gatherRealtimeStats:]";
          v42 = 1024;
          v43 = 672;
          v44 = 2080;
          v45 = v33;
          _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d RTCReporting: reporting dictionary %s", (uint8_t *)&valuePtr, 0x26u);
        }
      }
      else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        -[VCCallSession gatherRealtimeStats:].cold.1();
      }
    }
  }
}

- (void)getVideoFeatureStatusSettings:(tagVCReportingClientSettingsPersist *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = (void *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyInitialStatsDictionary");
    v5 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VideoEyeContact"));
    if (v5)
      a3->var0 = objc_msgSend(v5, "intValue");
    v6 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("REFENB"));
    if (v6)
      a3->var5 = objc_msgSend(v6, "intValue");
    v7 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CSFENB"));
    if (v7)
      a3->var2 = objc_msgSend(v7, "intValue");
    v8 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PMFENB"));
    if (v8)
      a3->var3 = objc_msgSend(v8, "intValue");
    v9 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SLFENB"));
    if (v9)
      a3->var4 = objc_msgSend(v9, "intValue");
    if (v4)
      CFRelease(v4);
  }
}

- (void)reportClientPersistentSettings
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 0uLL;
  v3 = 0;
  -[VCCallSession getVideoFeatureStatusSettings:](self, "getVideoFeatureStatusSettings:", &v2);
  reportingSetReportingClientPersistentSetting();
}

- (BOOL)isCurrentPayloadTypeValid
{
  VCAudioTransmitter *audioTransmitter;

  audioTransmitter = self->audioTransmitter;
  if (audioTransmitter)
    LOBYTE(audioTransmitter) = -[VCAudioPayloadConfig payload](-[VCAudioTransmitter currentAudioPayloadConfig](audioTransmitter, "currentAudioPayloadConfig"), "payload") != 128;
  return (char)audioTransmitter;
}

- (BOOL)requiresWifi
{
  return -[VCTransportSession requiresWiFi](self->_transportSession, "requiresWiFi");
}

- (void)setRequiresWifi:(BOOL)a3
{
  -[VCTransportSession setRequiresWiFi:](self->_transportSession, "setRequiresWiFi:", a3);
}

- (BOOL)useCompressedConnectionData
{
  return -[VCTransportSession useCompressedConnectionData](self->_transportSession, "useCompressedConnectionData");
}

- (void)setUseCompressedConnectionData:(BOOL)a3
{
  -[VCTransportSession setUseCompressedConnectionData:](self->_transportSession, "setUseCompressedConnectionData:", a3);
}

+ (id)keyPathsForValuesAffectingNetworkQuality
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("packetLossRate"), CFSTR("bandwidthUpstream"), CFSTR("packetLateAndMissingRatio"), 0);
}

- (unsigned)callID
{
  return -[VCCallInfo callID](self->localCallInfo, "callID");
}

- (void)setOperatingMode:(int)a3
{
  uint64_t v3;
  int v5;
  int operatingMode;
  _BOOL8 v8;
  tagHANDLE *hAFRC;
  void *v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  NSObject *videoQueue;
  _QWORD *v16;
  id v17;
  _QWORD v18[5];
  _QWORD block[5];
  const __CFString *v20;
  _QWORD v21[2];

  v3 = *(_QWORD *)&a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  -[VCCallSession lock](self, "lock");
  if (self->operatingMode == (_DWORD)v3)
  {
    -[VCCallSession unlock](self, "unlock");
    return;
  }
  self->operatingMode = v3;
  -[VCAudioTransmitter setOperatingMode:](self->audioTransmitter, "setOperatingMode:", v3);
  v20 = CFSTR("Mode");
  v21[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->operatingMode);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  -[VCCallSession reportingAgent](self, "reportingAgent");
  reportingGenericEvent();
  if (self->state == 1)
  {
    v5 = -[VCCallSession evaluateEnableRRx:](self, "evaluateEnableRRx:", 0);
    operatingMode = self->operatingMode;
    v8 = operatingMode == 2 || operatingMode == 7;
    -[VCConnectionManager setIsAudioOnly:](self->connectionManager, "setIsAudioOnly:", v8);
    hAFRC = self->hAFRC;
    if ((_DWORD)v3 == 2)
    {
      AFRCUpdateOperatingMode((uint64_t)hAFRC, 1, v5, 0);
      -[VCCallSession configureRateController](self, "configureRateController");
LABEL_19:
      v12 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->callSessionBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", -[VCConnectionManager getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:", 1, 1));
      v13 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->callSessionBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", -[VCConnectionManager getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:", 1, 0));
      if (v12 >= v13)
        v14 = v13;
      else
        v14 = v12;
      AFRCSetTxCap((uint64_t)self->hAFRC, 1000 * v14);
      videoQueue = self->videoQueue;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __34__VCCallSession_setOperatingMode___block_invoke_103;
      v18[3] = &unk_1E9E521C0;
      v18[4] = self;
      v16 = v18;
      goto LABEL_25;
    }
    AFRCUpdateOperatingMode((uint64_t)hAFRC, self->operatingMode == 7, v5, (_DWORD)v3 == 4);
    -[VCCallSession configureRateController](self, "configureRateController");
    if ((_DWORD)v3 == 4)
    {
      v11 = 2;
    }
    else
    {
      if ((_DWORD)v3 != 1)
        goto LABEL_19;
      v10 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
      if (objc_msgSend(v10, "isWifiToWifi"))
        v11 = 2;
      else
        v11 = 1;
      if (v10)
        CFRelease(v10);
    }
    -[VCCallSession resetVideoRulesForInterface:videoReportingDictionary:](self, "resetVideoRulesForInterface:videoReportingDictionary:", v11, 0);
    videoQueue = self->videoQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__VCCallSession_setOperatingMode___block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = self;
    v16 = block;
LABEL_25:
    dispatch_async(videoQueue, v16);
    v17 = +[VCAudioSession sharedVoiceChatInstance](VCAudioSession, "sharedVoiceChatInstance");
    objc_msgSend(v17, "setAudioSessionMode:", *MEMORY[0x1E0D491F0]);
  }
  -[VCCallSession unlock](self, "unlock");
}

void __34__VCCallSession_setOperatingMode___block_invoke(uint64_t a1)
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  objc_msgSend(*(id *)(a1 + 32), "stopVideoSend:error:", 0, v2);
  objc_msgSend(*(id *)(a1 + 32), "startVideoSend:error:", 0, v2);
  if (v2[0] && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __34__VCCallSession_setOperatingMode___block_invoke_cold_1();
  }
}

void __34__VCCallSession_setOperatingMode___block_invoke_103(uint64_t a1)
{
  _QWORD v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  v1[0] = 0;
  objc_msgSend(*(id *)(a1 + 32), "stopVideoSend:error:", 0, v1);
  if (v1[0] && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __34__VCCallSession_setOperatingMode___block_invoke_103_cold_1();
  }
}

- (void)configureRateController
{
  const void *v3;
  uint64_t v4;
  unsigned int v5;

  if (self->_rateController)
  {
    VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
    VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
    -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
    -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0);
    v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
    v4 = VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode);
    -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v3, 1, v4, self->_currentEncodeRule);
    -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v3, 0, v4, self->_currentEncodeRule);
    if (v3)
      CFRelease(v3);
    LOBYTE(v5) = 0;
    -[AVCRateController configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:](self->_rateController, "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v5);
  }
}

- (void)startAWDStats
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
  self->awdCallNonce = hwrandom();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCCallSession startAWDStats]";
      v9 = 1024;
      v10 = 842;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startAWDStats", (uint8_t *)&v5, 0x1Cu);
    }
  }
  -[VCCallSession isCaller](self, "isCaller");
  time(0);
  reportingAWDCallStart();
}

- (BOOL)videoIsPaused
{
  return -[VCCallInfo videoIsPaused](self->localCallInfo, "videoIsPaused");
}

- (void)setUseRateControl:(BOOL)a3
{
  int v4;
  unsigned int v5;
  BOOL useRateControl;
  BOOL v7;

  self->useRateControl = a3;
  v4 = -[VCDefaults rateControllerType](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "rateControllerType");
  if (v4 == 3)
  {
    v5 = 0;
  }
  else if (v4 == 1)
  {
    v5 = 2;
  }
  else if (v4)
  {
    v5 = 1;
  }
  else
  {
    v5 = +[GKSConnectivitySettings getRateControllerType](GKSConnectivitySettings, "getRateControllerType");
  }
  useRateControl = self->useRateControl;
  v7 = v5 < 2 && self->useRateControl;
  self->useVCRC = v7;
  if ((v5 & 0xFFFFFFFD) != 0)
    useRateControl = 0;
  self->useAFRC = useRateControl;
}

- (void)updateVideoQualityStatusWithTime:(double)a3 isRemote:(BOOL)a4
{
  NSObject *videoQueue;
  _QWORD v5[6];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  videoQueue = self->videoQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__VCCallSession_updateVideoQualityStatusWithTime_isRemote___block_invoke;
  v5[3] = &unk_1E9E529D8;
  v6 = a4;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  dispatch_async(videoQueue, v5);
}

void __59__VCCallSession_updateVideoQualityStatusWithTime_isRemote___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
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
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 32;
  if (!*(_BYTE *)(a1 + 48))
    v3 = 24;
  v4 = *(void **)(v2 + v3);
  if (objc_msgSend(v4, "updateWithLastDecodedFrameTime:time:", *(double *)(v2 + 640), *(double *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "reportImmediateWRMMetric:value:", 0, objc_msgSend(v4, "isVideoQualityDegraded"));
    objc_msgSend(v4, "isVideoQualityDegraded");
    reportingVideoPaused();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:withCallID:videoIsDegraded:isRemote:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID"), objc_msgSend(v4, "isVideoQualityDegraded"), *(unsigned __int8 *)(a1 + 48));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 640);
        v9 = 136316162;
        v10 = v5;
        v11 = 2080;
        v12 = "-[VCCallSession updateVideoQualityStatusWithTime:isRemote:]_block_invoke";
        v13 = 1024;
        v14 = 907;
        v15 = 2048;
        v16 = v7;
        v17 = 1024;
        v18 = objc_msgSend(v4, "isVideoQualityDegraded");
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d updateWithLastDecodedFrameTime returned YES. lastDecodedFrametime=%f isVideoQualityDegraded=%d", (uint8_t *)&v9, 0x2Cu);
      }
    }
  }
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(v4, "isVideoQualityNearDegraded"))
  {
    v8 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v8 + 1545))
    {
      *(_BYTE *)(v8 + 1545) = 0;
      VCConnectionManager_ProcessWRMNotification(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), (_DWORD *)(*(_QWORD *)(a1 + 32) + 1552));
    }
  }
}

- (BOOL)isBetterForSIPInviteWithSourceDestinationInfo:(tagVCSourceDestinationInfo *)a3 thanSession:(id)a4
{
  _BOOL4 v6;
  unsigned int v7;

  if (self->_sipState == 6)
  {
    v6 = -[VCConnectionManager shouldAcceptDataFromSourceDestinationInfo:](-[VCCallSession connectionManager](self, "connectionManager"), "shouldAcceptDataFromSourceDestinationInfo:", a3);
    if (v6)
    {
      if (a4)
      {
        v7 = -[VCCallInfo callID](self->localCallInfo, "callID");
        LOBYTE(v6) = v7 > objc_msgSend(a4, "callID");
      }
      else
      {
        LOBYTE(v6) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)evaluateEnableRRx:(int *)a3
{
  CFPropertyListRef v5;
  const void *v6;
  int v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  int operatingMode;
  BOOL v14;
  CFPropertyListRef v15;
  const void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = CFPreferencesCopyAppValue(CFSTR("enableBBNote"), CFSTR("com.apple.VideoConference"));
  if (v5)
  {
    v6 = v5;
    v7 = CFEqual(v5, (CFTypeRef)*MEMORY[0x1E0C9AE40]);
    v8 = v7 == 0;
    if (v7)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v21 = 136315650;
          v22 = v9;
          v23 = 2080;
          v24 = "-[VCCallSession evaluateEnableRRx:]";
          v25 = 1024;
          v26 = 948;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Found enableBBNote NO. Disable baseband notification", (uint8_t *)&v21, 0x1Cu);
        }
      }
    }
    CFRelease(v6);
  }
  else
  {
    v8 = 1;
  }
  v11 = v8 & VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  if (v11 == 1
    && !NetworkUtils_IsLTEOrNewer(-[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1)))
  {
    v14 = 0;
  }
  else
  {
    operatingMode = self->operatingMode;
    v14 = operatingMode != 2 && operatingMode != 7;
  }
  v15 = CFPreferencesCopyAppValue(CFSTR("enableRRx"), CFSTR("com.apple.VideoConference"));
  if (v15)
  {
    v16 = v15;
    v17 = CFEqual(v15, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
    v14 = v17 != 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315906;
        v22 = v18;
        v23 = 2080;
        v24 = "-[VCCallSession evaluateEnableRRx:]";
        v25 = 1024;
        v26 = 962;
        v27 = 1024;
        v28 = v17 != 0;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Found enableRRx %d for AFRC.", (uint8_t *)&v21, 0x22u);
      }
    }
    CFRelease(v16);
  }
  if (a3)
    *a3 = v11;
  return v14;
}

- (void)updateMaxPktLength
{
  _BOOL8 v3;
  unsigned int v4;
  int IsInterfaceOnCellularForActiveConnectionWithQuality;
  unsigned __int16 maxPacketLength;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BYTE v21[10];
  _BYTE v22[6];
  _DWORD v23[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[VCConnectionManager isConnectedOnIPv6ForActiveConnectionWithQuality:](self->connectionManager, "isConnectedOnIPv6ForActiveConnectionWithQuality:", 1);
  if (v3)
    v4 = 1280;
  else
    v4 = 1450;
  IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  if (IsInterfaceOnCellularForActiveConnectionWithQuality)
  {
    maxPacketLength = -[VCConnectionManager getCellularMTUForActiveConnectionWithQuality:](self->connectionManager, "getCellularMTUForActiveConnectionWithQuality:", 1);
    if (!maxPacketLength)
      maxPacketLength = self->maxPacketLength;
    if (maxPacketLength < v4 && maxPacketLength != 0)
      LOWORD(v4) = maxPacketLength;
  }
  else
  {
    maxPacketLength = 0;
  }
  if (-[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0))
  {
    v8 = (unsigned __int16)v4;
    if ((unsigned __int16)v4 >= 0x583u)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5)
      {
        LOWORD(v4) = 1410;
      }
      else
      {
        v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E0CF2758];
        LOWORD(v4) = 1410;
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v14 = 136316418;
          v15 = v9;
          v16 = 2080;
          v17 = "-[VCCallSession updateMaxPktLength]";
          v18 = 1024;
          v19 = 1019;
          v20 = 2080;
          *(_QWORD *)v21 = CelltechToStr();
          *(_WORD *)&v21[8] = 1024;
          *(_DWORD *)v22 = v8;
          *(_WORD *)&v22[4] = 1024;
          v23[0] = 1410;
          _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d \t\t\t\t VCCallSession:UpdateMTU remote is %s. Lowering local MTU: %d -> %d ", (uint8_t *)&v14, 0x32u);
        }
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->maxPacketLength;
      v14 = 136316674;
      v15 = v11;
      v16 = 2080;
      v17 = "-[VCCallSession updateMaxPktLength]";
      v18 = 1024;
      v19 = 1024;
      v20 = 1024;
      *(_DWORD *)v21 = v13;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = (unsigned __int16)v4;
      *(_WORD *)v22 = 1024;
      *(_DWORD *)&v22[2] = IsInterfaceOnCellularForActiveConnectionWithQuality;
      LOWORD(v23[0]) = 1024;
      *(_DWORD *)((char *)v23 + 2) = maxPacketLength;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession:UpdateMTU MTU: %d -> %d Cellular: %d/%d ", (uint8_t *)&v14, 0x34u);
    }
  }
  if (self->maxPacketLength != (unsigned __int16)v4)
  {
    self->maxPacketLength = v4;
    RTPUpdateIsIPv6((uint64_t)self->rtpVideo, v3);
    RTPUpdateIsIPv6((uint64_t)self->rtpHandle, v3);
    VideoTransmitter_UpdateMTU((uint64_t)self->hVideoTransmitter, self->maxPacketLength, v3);
    -[VCSecureDataChannel setMaxUDPPayloadSize:](self->secureDataChannel, "setMaxUDPPayloadSize:", (int)VCMaxUDPPayloadSize(self->maxPacketLength, v3));
  }
}

- (void)reportHandoverResultsWithDictionary:(id)a3 localBitrateCap:(int)a4 remoteBitrateCap:(int)a5
{
  __CFString *v6;
  __CFString *v7;

  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("captureRule")))
    v6 = (__CFString *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("captureRule"));
  else
    v6 = CFSTR("NoRule");
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("encodeRule")))
    v7 = (__CFString *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("encodeRule"));
  else
    v7 = CFSTR("NoRule");
  -[__CFString UTF8String](v6, "UTF8String");
  -[__CFString UTF8String](v7, "UTF8String");
  reportingHandoverResult();
}

- (void)handleCellTechChange:(int)a3
{
  int v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *cellTechQueue;
  _QWORD v9[5];
  int v10;
  int v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[VCCallSession isCallOngoing](self, "isCallOngoing"))
  {
    v5 = -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v13 = v6;
        v14 = 2080;
        v15 = "-[VCCallSession handleCellTechChange:]";
        v16 = 1024;
        v17 = 1057;
        v18 = 2080;
        v19 = CelltechToStr();
        v20 = 2080;
        v21 = CelltechToStr();
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: handleCellTechChange (%s to %s) ", buf, 0x30u);
      }
    }
    cellTechQueue = self->cellTechQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__VCCallSession_handleCellTechChange___block_invoke;
    v9[3] = &unk_1E9E52960;
    v9[4] = self;
    v10 = a3;
    v11 = v5;
    dispatch_async(cellTechQueue, v9);
  }
}

void __38__VCCallSession_handleCellTechChange___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v5;
  NSObject *v6;
  int64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_time_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[6];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
  v3 = v2;
  if (v2 == -1 || v2 == 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v18 = v5;
        v19 = 2080;
        v20 = "-[VCCallSession handleCellTechChange:]_block_invoke";
        v21 = 1024;
        v22 = 1179;
        v23 = 1024;
        v24 = v3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Local cell tech change ignored, current connection type %d", buf, 0x22u);
      }
    }
  }
  else
  {
    GetConnectionTypeFromCellTech();
    if (IsConnectionDowngrading())
      v8 = 0;
    else
      v8 = 20000000000;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 1160);
    if (!v10
      || (dispatch_source_cancel(v10), v9 = *(_QWORD *)(a1 + 32), (v11 = *(NSObject **)(v9 + 1160)) == 0)
      || (dispatch_release(v11),
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160) = 0,
          v9 = *(_QWORD *)(a1 + 32),
          !*(_QWORD *)(v9 + 1160)))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160) = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v9 + 1152));
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1160);
      v13 = dispatch_time(0, v8);
      dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0);
      v14 = *(_QWORD *)(a1 + 32);
      v15 = *(NSObject **)(v14 + 1160);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __38__VCCallSession_handleCellTechChange___block_invoke_2;
      v16[3] = &unk_1E9E52960;
      v16[5] = *(_QWORD *)(a1 + 40);
      v16[4] = v14;
      dispatch_source_set_event_handler(v15, v16);
      dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 1160));
    }
  }
}

void __38__VCCallSession_handleCellTechChange___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  BOOL v3;
  uint64_t IsInterfaceOnCellularForActiveConnectionWithQuality;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t IsLTEOrNewer;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  unsigned int v33;
  void *v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = (unsigned int *)(a1 + 40);
  v1 = *(unsigned int *)(a1 + 40);
  if ((_DWORD)v1)
    v3 = (int)v1 <= 9;
  else
    v3 = 0;
  if (v3 && (_DWORD)v1 != *(_DWORD *)(a1 + 44))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateCellularTech:forLocalInterface:", v1, 1);
    IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 1, 1);
    v6 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 1, 0);
    v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0);
    VideoTransmitter_SetCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256), IsInterfaceOnCellularForActiveConnectionWithQuality, *(_DWORD *)(a1 + 40), v6, v7);
    v8 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)VCConnectionManager_CopyPrimaryConnection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
    v10 = objc_msgSend(v9, "isWifiToWifi");
    if ((_DWORD)v10)
      v11 = 2;
    else
      v11 = 1;
    if (v9)
      CFRelease(v9);
    objc_msgSend(*(id *)(a1 + 32), "resetVideoRulesForInterface:videoReportingDictionary:", v11, v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setUseWiFiTiers:", v10);
    v12 = (const void *)VCConnectionManager_CopyConnectionForQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 1);
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v12, 1, VCBitrateArbiter_ModeFromOperatingMode(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1420)), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
    if (v12)
      CFRelease(v12);
    if ((_DWORD)v13)
    {
      if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "supportsDynamicMaxBitrate"))
      {
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v13);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", *(unsigned int *)(a1 + 40));
        v15 = v8;
        v16 = v7;
        v17 = v6;
        v18 = IsInterfaceOnCellularForActiveConnectionWithQuality;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v14, CFSTR("VCCellTechKey"), v34, CFSTR("VCMaxBitrateKey"), 0);
        v20 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "newPackedMessageFromDictionary:", v19);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "sendMessage:withTopic:", v20, CFSTR("VCCellTechChangeTopic"));

        IsInterfaceOnCellularForActiveConnectionWithQuality = v18;
        v6 = v17;
        v7 = v16;
        v8 = v15;

      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v36 = v21;
            v37 = 2080;
            v38 = "-[VCCallSession handleCellTechChange:]_block_invoke";
            v39 = 1024;
            v40 = 1134;
            v41 = 1024;
            LODWORD(v42) = v13;
            _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Remote is legacy device: setting local bandwidth estimation cap: %d ", buf, 0x22u);
          }
        }
        AFRCSetBWECap(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), 1000 * v13);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "setEstimatedBandwidthCap:", (1000 * v13));
      }
      AFRCUpdateCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), IsInterfaceOnCellularForActiveConnectionWithQuality, *(_DWORD *)(a1 + 40), v6, v7, objc_msgSend(*(id *)(a1 + 32), "evaluateEnableRRx:", 0), 0);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_DWORD *)(v23 + 1148);
      if (v13 <= objc_msgSend(*(id *)(v23 + 32), "maxBandwidth"))
        v13 = v13;
      else
        v13 = v24;
      objc_msgSend(*(id *)(a1 + 32), "reportHandoverResultsWithDictionary:localBitrateCap:remoteBitrateCap:", v8, v13, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "maxBandwidth"));
      VideoTransmitter_SetBitrate(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256), 1000 * v13);
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1148) = v13;
      v25 = *(_QWORD *)(a1 + 32);
      v26 = *(unsigned int *)(v25 + 1420);
      if ((_DWORD)v26 == 7 || (_DWORD)v26 == 2)
      {
        AFRCSetTxCap(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), objc_msgSend((id)v25, "currentAudioCap"));
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(unsigned int *)(v25 + 1420);
      }
      LOBYTE(v33) = 0;
      objc_msgSend(*(id *)(v25 + 352), "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v26, IsInterfaceOnCellularForActiveConnectionWithQuality, *(unsigned int *)(a1 + 40), v6, v7, v13, v33);
      RTPSetBasebandCongestionDetector(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "basebandCongestionDetector"));
      v27 = *(_QWORD *)(a1 + 32);
      if (!*(_QWORD *)(v27 + 352))
      {
        if (*v2)
        {
          IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(*v2);
          v27 = *(_QWORD *)(a1 + 32);
        }
        else
        {
          IsLTEOrNewer = 1;
        }
        objc_msgSend(*(id *)(v27 + 360), "setIsSenderProbingEnabled:", IsLTEOrNewer);
      }
      v29 = CelltechToStr();
      reportingLog();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v32 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "maxBandwidth");
          *(_DWORD *)buf = 136316418;
          v36 = v30;
          v37 = 2080;
          v38 = "-[VCCallSession handleCellTechChange:]_block_invoke";
          v39 = 1024;
          v40 = 1172;
          v41 = 2080;
          v42 = v29;
          v43 = 1024;
          v44 = v13;
          v45 = 1024;
          v46 = v32;
          _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Local CellTech has changed %s, max bitrate %u, max remote bitrate %u", buf, 0x32u);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __38__VCCallSession_handleCellTechChange___block_invoke_2_cold_1();
    }
  }
}

- (void)handleCellularMTUChanged:(unsigned __int16)a3
{
  NSObject *cellTechQueue;
  _QWORD block[5];
  unsigned __int16 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  cellTechQueue = self->cellTechQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCCallSession_handleCellularMTUChanged___block_invoke;
  block[3] = &unk_1E9E52A50;
  block[4] = self;
  v5 = a3;
  dispatch_async(cellTechQueue, block);
}

uint64_t __42__VCCallSession_handleCellularMTUChanged___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateCellularMTU:", *(unsigned __int16 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateMaxPktLength");
}

- (void)checkAndReportThermalIncreaseAudioOnly:(int)a3
{
  int operatingMode;
  BOOL v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  operatingMode = self->operatingMode;
  v5 = operatingMode != 2 && operatingMode != 7;
  if (a3)
  {
    if (!v5)
    {
      v7 = CFSTR("SymptomReporterOptionalKeyThermalPressureLevel");
      v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      -[VCCallSession reportingAgent](self, "reportingAgent");
      reportingSymptom();
    }
  }
}

- (void)thermalLevelDidChange:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[VCCallSession reportingAgent](self, "reportingAgent");
  micro();
  reportingThermal();
  -[VCCallSession checkAndReportThermalIncreaseAudioOnly:](self, "checkAndReportThermalIncreaseAudioOnly:", v3);
  VideoTransmitter_SetThermalLevel((uint64_t)self->hVideoTransmitter, v3);
}

- (void)remoteCellTechStateUpdate:(int)a3 maxRemoteBitrate:(unsigned int)a4
{
  NSObject *cellTechQueue;
  _QWORD block[5];
  int v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[VCCallSession isCallOngoing](self, "isCallOngoing"))
  {
    cellTechQueue = self->cellTechQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__VCCallSession_remoteCellTechStateUpdate_maxRemoteBitrate___block_invoke;
    block[3] = &unk_1E9E52960;
    block[4] = self;
    v9 = a3;
    v10 = a4;
    dispatch_async(cellTechQueue, block);
  }
}

void __60__VCCallSession_remoteCellTechStateUpdate_maxRemoteBitrate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t IsInterfaceOnCellularForActiveConnectionWithQuality;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  unsigned int v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = CelltechToStr();
  IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 1, 1);
  v4 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 1, 0);
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0);
  v7 = *(_DWORD *)(a1 + 40);
  if (v7
    && (v7 != v6
     || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "maxBandwidth") != *(_DWORD *)(a1 + 44)))
  {
    AFRCUpdateCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), IsInterfaceOnCellularForActiveConnectionWithQuality, v5, v4, *(_DWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "evaluateEnableRRx:", 0), 0);
    reportingLog();
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setMaxBandwidth:", *(unsigned int *)(a1 + 44));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setCellBandwidth:", *(unsigned int *)(a1 + 44));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateCellularTech:forLocalInterface:", *(unsigned int *)(a1 + 40), 0);
  VideoTransmitter_SetCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256), IsInterfaceOnCellularForActiveConnectionWithQuality, v5, v4, *(_DWORD *)(a1 + 40));
  v8 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)VCConnectionManager_CopyPrimaryConnection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v10 = objc_msgSend(v9, "isWifiToWifi");
  if ((_DWORD)v10)
    v11 = 2;
  else
    v11 = 1;
  if (v9)
    CFRelease(v9);
  objc_msgSend(*(id *)(a1 + 32), "resetVideoRulesForInterface:videoReportingDictionary:", v11, v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setUseWiFiTiers:", v10);
  v12 = (const void *)VCConnectionManager_CopyConnectionForQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 1);
  v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v12, 1, VCBitrateArbiter_ModeFromOperatingMode(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1420)), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176));
  if (v12)
    CFRelease(v12);
  v14 = *(_DWORD *)(a1 + 44);
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "reportHandoverResultsWithDictionary:localBitrateCap:remoteBitrateCap:", v8, v15);
  VideoTransmitter_SetBitrate(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256), 1000 * v15);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1148) = v15;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(unsigned int *)(v16 + 1420);
  if ((_DWORD)v17 == 7 || (_DWORD)v17 == 2)
  {
    AFRCSetTxCap(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), objc_msgSend((id)v16, "currentAudioCap"));
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(unsigned int *)(v16 + 1420);
  }
  LOBYTE(v21) = 0;
  objc_msgSend(*(id *)(v16 + 352), "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v17, IsInterfaceOnCellularForActiveConnectionWithQuality, v5, v4, *(unsigned int *)(a1 + 40), v15, v21);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_DWORD *)(a1 + 44);
      *(_DWORD *)buf = 136316418;
      v23 = v18;
      v24 = 2080;
      v25 = "-[VCCallSession remoteCellTechStateUpdate:maxRemoteBitrate:]_block_invoke";
      v26 = 1024;
      v27 = 1266;
      v28 = 2080;
      v29 = v2;
      v30 = 1024;
      v31 = v15;
      v32 = 1024;
      v33 = v20;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Remote CellTech has changed %s, max bitrate %u, max remote bitrate %u", buf, 0x32u);
    }
  }
}

- (id)getFeatureListStringForPayload:(int)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int64_t videoPayload;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3)), "objectForKey:", CFSTR("matchedFeatureListString"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v4)
        v7 = (const char *)objc_msgSend((id)objc_msgSend(v4, "description"), "UTF8String");
      else
        v7 = "<nil>";
      videoPayload = self->videoPayload;
      v10 = 136316162;
      v11 = v5;
      v12 = 2080;
      v13 = "-[VCCallSession getFeatureListStringForPayload:]";
      v14 = 1024;
      v15 = 1272;
      v16 = 2080;
      v17 = v7;
      v18 = 2048;
      v19 = videoPayload;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: transmitter updated feature list string to %s, for payload: %ld", (uint8_t *)&v10, 0x30u);
    }
  }
  return v4;
}

- (int)applyFeatureListStringForPayload:(int)a3
{
  uint64_t v3;
  __int128 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  id v21;
  char *v22;
  char *v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  char *v27;
  char *v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  int v33;
  int v34;
  _BOOL8 v35;
  unsigned int v36;
  unsigned int v38;
  uint64_t v39;
  int v40;
  unint64_t v41;
  _BYTE v42[20];
  char *__lasts;
  char v44[16];
  __int128 v45;
  uint8_t buf[3208];
  uint64_t v47;

  v3 = *(_QWORD *)&a3;
  v47 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v44 = v5;
  v45 = v5;
  memset(v42, 170, sizeof(v42));
  v40 = -1431655766;
  v41 = 0xAAAAAAAAAAAAAAAALL;
  v6 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:")), "objectForKey:", CFSTR("matchedFeatureListString"));
  v7 = (void *)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3)), "objectForKey:", CFSTR("localFeatureListString"));
  v8 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3)), "objectForKey:", CFSTR("remoteFeatureListString"));
  if (v6)
  {
    v9 = (void *)v8;
    self->remoteSupportsVisibleRect = +[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", objc_msgSend(v6, "UTF8String"), 0, 0, "CR");
    self->canLocalResizePIP = +[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", objc_msgSend(v7, "UTF8String"), 0, 0, "PR");
    if (+[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", objc_msgSend(v6, "UTF8String"), v44, 32, "AR")&& sscanf(v44, "%d/%d,%d/%d", &v42[16], &v42[12], &v42[8], &v42[4]) == 4)
    {
      if (+[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", objc_msgSend(v9, "UTF8String"), 0, 0, "PR"))
      {
        self->canRemoteResizePIP = 1;
LABEL_8:
        if (+[VCVideoFeatureListStringHelper findFeatureString:value:valueLength:withPrefix:](VCVideoFeatureListStringHelper, "findFeatureString:value:valueLength:withPrefix:", objc_msgSend(v6, "UTF8String"), v44, 32, "XR"))
        {
          if (sscanf(v44, "%d/%d,%d/%d", v42, (char *)&v41 + 4, &v41, &v40) != 4)
          {
            *(_DWORD *)v42 = *(_DWORD *)&v42[16];
            v40 = *(_DWORD *)&v42[4];
            v41 = *(_QWORD *)&v42[8];
          }
          v10 = 1;
        }
        else
        {
          v10 = 0;
          *(_DWORD *)v42 = *(_DWORD *)&v42[16];
          v40 = *(_DWORD *)&v42[4];
          v41 = *(_QWORD *)&v42[8];
        }
        self->remoteSupportsExpectedAspectRatio = v10;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            if (self->canRemoteResizePIP)
              v14 = "";
            else
              v14 = "No ";
            *(_DWORD *)buf = 136317954;
            *(_QWORD *)&buf[4] = v12;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCCallSession applyFeatureListStringForPayload:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 1383;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = *(_DWORD *)&v42[16];
            *(_WORD *)&buf[34] = 1024;
            *(_DWORD *)&buf[36] = *(_DWORD *)&v42[12];
            *(_WORD *)&buf[40] = 1024;
            *(_DWORD *)&buf[42] = *(_DWORD *)&v42[8];
            *(_WORD *)&buf[46] = 1024;
            *(_DWORD *)&buf[48] = *(_DWORD *)&v42[4];
            *(_WORD *)&buf[52] = 2080;
            *(_QWORD *)&buf[54] = v14;
            *(_WORD *)&buf[62] = 1024;
            *(_DWORD *)&buf[64] = *(_DWORD *)v42;
            *(_WORD *)&buf[68] = 1024;
            *(_DWORD *)&buf[70] = HIDWORD(v41);
            *(_WORD *)&buf[74] = 1024;
            *(_DWORD *)&buf[76] = v41;
            *(_WORD *)&buf[80] = 1024;
            *(_DWORD *)&buf[82] = v40;
            _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Setting remote screen aspect ratio numbers %d/%d,%d/%d (%sPR), remote expects to receive %d/%d,%d/%d", buf, 0x56u);
          }
        }
        v15 = (double)*(int *)&v42[4];
        self->remoteScreenPortraitAspectRatio.width = (double)*(int *)&v42[8];
        self->remoteScreenPortraitAspectRatio.height = v15;
        v16 = (double)*(int *)&v42[12];
        self->remoteScreenLandscapeAspectRatio.width = (double)*(int *)&v42[16];
        v17 = (double)(int)v41;
        v18 = (double)v40;
        self->remoteScreenLandscapeAspectRatio.height = v16;
        self->remoteExpectedPortraitAspectRatio.width = v17;
        self->remoteExpectedPortraitAspectRatio.height = v18;
        v19 = (double)SHIDWORD(v41);
        self->remoteExpectedLandscapeAspectRatio.width = (double)*(int *)v42;
        self->remoteExpectedLandscapeAspectRatio.height = v19;
        if (!self->isGKVoiceChat && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v20 = -[VCCallSession newRemoteScreenAttributesForOrientation:](self, "newRemoteScreenAttributesForOrientation:", 0);
          v21 = -[VCCallSession newRemoteScreenAttributesForOrientation:](self, "newRemoteScreenAttributesForOrientation:", 3);
          -[VCCallSessionDelegate session:didChangeRemoteScreenAttributes:](self->delegate, "session:didChangeRemoteScreenAttributes:", self, v20);
          -[VCCallSessionDelegate session:didChangeRemoteScreenAttributes:](self->delegate, "session:didChangeRemoteScreenAttributes:", self, v21);

        }
        if (*(_BYTE *)objc_msgSend(v6, "UTF8String"))
        {
          objc_msgSend(v6, "UTF8String");
          __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
          memset(buf, 170, 0xC80uLL);
          __strlcpy_chk();
          v22 = strtok_r((char *)buf, ";", &__lasts);
          if (v22)
          {
            v23 = v22;
            v39 = 0;
            v24 = 0;
            v25 = 0;
            v38 = 0;
            v26 = 0;
            do
            {
              v27 = strchr(v23, 58);
              if (v27)
              {
                v28 = v27;
                v29 = atoi(v27 + 1);
                *v28 = 0;
                if (v29 <= 0x63)
                {
                  v30 = v29;
                  if (!strcmp(v23, "MVRA") || !strcmp(v23, "VRA"))
                  {
                    v26 = v30 + 1;
                  }
                  else if (!strcmp(v23, "RVRA1") || !strcmp(v23, "RVRA2"))
                  {
                    v25 = v30 + 1;
                  }
                  else if (!strcmp(v23, "UEP"))
                  {
                    LODWORD(v39) = v30 + 1;
                  }
                  else if (!strcmp(v23, "AS"))
                  {
                    v38 = v30 + 1;
                  }
                  else
                  {
                    v31 = strcmp(v23, "CR");
                    v32 = HIDWORD(v39);
                    if (!v31)
                      v32 = v30 + 1;
                    HIDWORD(v39) = v32;
                  }
                }
              }
              if (!strcmp(v23, "LF"))
                v24 = 1;
              v23 = strtok_r(0, ";", &__lasts);
            }
            while (v23);
          }
          else
          {
            v26 = 0;
            v39 = 0;
            v38 = 0;
            v25 = 0;
            v24 = 0;
          }
          v34 = v24 == 1;
          v33 = v39;
          v35 = (v26 | v39 | v38 | v25 | HIDWORD(v39) | v24) != 0;
        }
        else
        {
          v33 = 0;
          v34 = 0;
          v35 = 0;
        }
        v36 = objc_msgSend((id)(id)CFPreferencesCopyAppValue(CFSTR("useFakeLF"), CFSTR("enableRRx")), "BOOLValue");
        v11 = -[VCCallSession Conference_SetBWEstMode:bFakeLargeFrameMode:](self, "Conference_SetBWEstMode:bFakeLargeFrameMode:", v34 | v36, v36 & ~v34);
        if ((v11 & 0x80000000) == 0)
        {
          -[VCCallSession setUseControlByte:](self, "setUseControlByte:", v35);
          -[VCCallSession setUseUEP:](self, "setUseUEP:", v33 != 0);
        }
        return v11;
      }
    }
    else
    {
      *(_DWORD *)&v42[16] = 3;
      *(_DWORD *)&v42[4] = 3;
      *(_QWORD *)&v42[8] = 0x200000002;
    }
    self->canRemoteResizePIP = 0;
    goto LABEL_8;
  }
  v11 = -2146369521;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession applyFeatureListStringForPayload:].cold.1();
  }
  return v11;
}

- (BOOL)chooseVideoPayloadForInterface:(int)a3
{
  uint64_t v3;
  void *v5;
  unsigned __int8 v6;
  VCMediaNegotiator *mediaNegotiator;
  VCMediaNegotiatorResultsVideo *v8;
  BOOL v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  VCVideoRuleCollections *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  _QWORD v26[4];
  unsigned int v27;
  unsigned int IsInterfaceOnCellularForActiveConnectionWithQuality;
  uint64_t v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = *(_QWORD *)&a3;
  v40 = *MEMORY[0x1E0C80C00];
  if (-[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly")
    || !-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
  {
    return 0;
  }
  IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  v27 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
  v5 = (void *)objc_opt_new();
  if (-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
  {
    if ((_DWORD)v3 == 2)
      v6 = 1;
    else
      v6 = 2;
    mediaNegotiator = self->_mediaNegotiator;
    if (self->operatingMode == 4)
      v8 = -[VCMediaNegotiatorBase negotiatedScreenSettings](mediaNegotiator, "negotiatedScreenSettings");
    else
      v8 = -[VCMediaNegotiatorBase negotiatedVideoSettings](mediaNegotiator, "negotiatedVideoSettings");
    v17 = -[VCMediaNegotiatorResultsVideo videoRuleCollections](v8, "videoRuleCollections");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v18 = -[VCVideoRuleCollections supportedPayloads](v17, "supportedPayloads");
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v37;
      v22 = v6;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](v17, "getVideoRulesForTransport:payload:encodingType:", v22, objc_msgSend(v24, "unsignedIntValue"), 1), "count"))
          {
            objc_msgSend(v5, "addObject:", v24);
          }
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v36, v35, 16);
      }
      while (v20);
    }
  }
  else
  {
    v10 = -[VCImageAttributeRules extractDimensionsForInterface:direction:](-[VCCallSession imageAttributeRules](self, "imageAttributeRules"), "extractDimensionsForInterface:direction:", v3, 0);
    objc_msgSend(v10, "count");
    v26[3] = v26;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v11 = (void *)objc_msgSend(v10, "allKeys");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
          objc_msgSend(v16, "intValue");
          objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v16, "intValue")));
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
      }
      while (v13);
    }
  }
  v9 = -[VCCallSession chooseVideoPayload:operatingMode:isLocalOnCellular:isRemoteOnCellular:](self, "chooseVideoPayload:operatingMode:isLocalOnCellular:isRemoteOnCellular:", v5, self->operatingMode, IsInterfaceOnCellularForActiveConnectionWithQuality, v27);
  if (!v9)
  {
    v29 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession chooseVideoPayloadForInterface:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession chooseVideoPayloadForInterface:].cold.2();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v29, 32002, 223, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 1468), CFSTR("Could not find a compatible codec. Participant may switched wireless interface."), CFSTR("No matching codec"));
    -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", v29, 0);
  }

  return v9;
}

- (id)getVideoRuleForVideoMode:(unint64_t)a3 interface:(int)a4 sessionBitrate:(int *)a5
{
  uint64_t v6;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  int64_t videoPayload;
  int v13;
  VCVideoRule *v14;
  double v15;
  int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;

  v6 = *(_QWORD *)&a4;
  v20 = *MEMORY[0x1E0C80C00];
  v18 = -1431655766;
  v19 = -1431655766;
  v17 = -1431655766;
  v9 = -[VCCallSession getVideoSettings:forInterface:payload:width:height:framerate:bitRate:](self, "getVideoSettings:forInterface:payload:width:height:framerate:bitRate:", a3, *(_QWORD *)&a4, LODWORD(self->videoPayload), &v19, &v18, &v17, a5);
  v10 = 192;
  if (self->operatingMode == 4)
    v10 = 200;
  v11 = *(unsigned int *)((char *)&self->super.isa + v10);
  if (!v9)
  {
    videoPayload = self->videoPayload;
    if (videoPayload == 123)
    {
      v11 = 100;
    }
    else if (videoPayload == 100)
    {
      v11 = 123;
    }
    -[VCCallSession getVideoSettings:forInterface:payload:width:height:framerate:bitRate:](self, "getVideoSettings:forInterface:payload:width:height:framerate:bitRate:", a3, v6, v11, &v19, &v18, &v17, a5);
  }
  v13 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-facetime-photos-use-best-videorule"), CFSTR("FaceTimePhotosUseBestVideoRule"), MEMORY[0x1E0C9AAB0], 0), "BOOLValue");
  if (a3 == 1 && v13)
    -[VCVideoRuleCollectionsCamera getBestFrameWidth:frameHeight:frameRate:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getBestFrameWidth:frameHeight:frameRate:", &v19, &v18, 0);
  v14 = [VCVideoRule alloc];
  *(float *)&v15 = (float)v17;
  return -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:payload:](v14, "initWithFrameWidth:frameHeight:frameRate:payload:", v19, v18, v11, v15);
}

- (void)setCurrentEncodeRule:(id)a3
{
  VCVideoRule *currentEncodeRule;

  currentEncodeRule = self->_currentEncodeRule;
  if (currentEncodeRule != a3)
  {

    self->_currentEncodeRule = (VCVideoRule *)a3;
  }
}

- (void)resetVideoRulesForInterface:(int)a3 videoReportingDictionary:(id)a4
{
  uint64_t v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  float v12;
  double v13;
  float v14;
  double v15;
  int v16;
  float v17;
  double v18;
  float v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  float v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  int v28;
  int v29;
  int v30;
  int v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  int v47;
  __int16 v48;
  int v49;
  __int16 v50;
  int v51;
  __int16 v52;
  double v53;
  __int16 v54;
  double v55;
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  int v61;
  uint64_t v62;

  v5 = *(_QWORD *)&a3;
  v62 = *MEMORY[0x1E0C80C00];
  if (-[VCCallSession chooseVideoPayloadForInterface:](self, "chooseVideoPayloadForInterface:"))
  {
    v7 = -[VCCallSession getVideoRuleForVideoMode:interface:sessionBitrate:](self, "getVideoRuleForVideoMode:interface:sessionBitrate:", 1, v5, 0);
    v8 = -[VCCallSession getVideoRuleForVideoMode:interface:sessionBitrate:](self, "getVideoRuleForVideoMode:interface:sessionBitrate:", 2, v5, 0);
    v9 = -[VCCallSession getFeatureListStringForPayload:](self, "getFeatureListStringForPayload:", LODWORD(self->videoPayload));
    -[VCCallSession applyFeatureListStringForPayload:](self, "applyFeatureListStringForPayload:", LODWORD(self->videoPayload));
    -[VCCallSession setCurrentEncodeRule:](self, "setCurrentEncodeRule:", v8);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_msgSend(v7, "iWidth");
        v30 = objc_msgSend(v7, "iHeight");
        objc_msgSend(v7, "fRate");
        v13 = v12;
        objc_msgSend(v7, "fPref");
        v15 = v14;
        v29 = objc_msgSend(v7, "iPayload");
        v28 = objc_msgSend(v8, "iWidth");
        v16 = objc_msgSend(v8, "iHeight");
        objc_msgSend(v8, "fRate");
        v18 = v17;
        objc_msgSend(v8, "fPref");
        *(_DWORD *)buf = 136318722;
        v33 = v10;
        v34 = 2080;
        v35 = "-[VCCallSession resetVideoRulesForInterface:videoReportingDictionary:]";
        v36 = 1024;
        v37 = 1541;
        v38 = 1024;
        v39 = v31;
        v40 = 1024;
        v41 = v30;
        v42 = 2048;
        v43 = v13;
        v44 = 2048;
        v45 = v15;
        v46 = 1024;
        v47 = v29;
        v48 = 1024;
        v49 = v28;
        v50 = 1024;
        v51 = v16;
        v52 = 2048;
        v53 = v18;
        v54 = 2048;
        v55 = v19;
        v56 = 1024;
        v57 = objc_msgSend(v8, "iPayload");
        v58 = 2080;
        v59 = objc_msgSend(v9, "UTF8String");
        v60 = 1024;
        v61 = v5;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: reset video rules to new capture rule = %dx%dx%.1ffps(%.1f, %d), new encode rule = %dx%dx%.1ffps(%.1f, %d), featureListString %s, interface %d", buf, 0x78u);
      }
    }
    -[VCCallSessionDelegate session:changeVideoRulesToCaptureRule:encodeRule:featureListString:](self->delegate, "session:changeVideoRulesToCaptureRule:encodeRule:featureListString:", self, v7, v8, v9);
    objc_msgSend(v8, "iWidth");
    objc_msgSend(v8, "iHeight");
    objc_msgSend(v8, "fRate");
    reportingVideoProp();
    if (a4)
    {
      if (v7 && v8)
      {
        v20 = (void *)MEMORY[0x1E0CB3940];
        v21 = objc_msgSend(v7, "iWidth");
        v22 = objc_msgSend(v7, "iHeight");
        objc_msgSend(v7, "fRate");
        objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(v20, "stringWithFormat:", CFSTR("%dx%d@%.1f"), v21, v22, v23), CFSTR("captureRule"));
        v24 = (void *)MEMORY[0x1E0CB3940];
        v25 = objc_msgSend(v8, "iWidth");
        v26 = objc_msgSend(v8, "iHeight");
        objc_msgSend(v8, "fRate");
        objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(v24, "stringWithFormat:", CFSTR("%dx%d@%.1f"), v25, v26, v27), CFSTR("encodeRule"));
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession resetVideoRulesForInterface:videoReportingDictionary:].cold.1();
      }
    }
  }
}

- (void)schedulePrimaryConnectionChange:(id)a3 oldConnection:(id)a4
{
  NSObject *connectionChangeQueue;
  _QWORD v5[8];

  v5[7] = *MEMORY[0x1E0C80C00];
  connectionChangeQueue = self->connectionChangeQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__VCCallSession_schedulePrimaryConnectionChange_oldConnection___block_invoke;
  v5[3] = &unk_1E9E527D0;
  v5[4] = self;
  v5[5] = a4;
  v5[6] = a3;
  dispatch_async(connectionChangeQueue, v5);
}

void __63__VCCallSession_schedulePrimaryConnectionChange_oldConnection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 32;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v1 + 88);
  if (v3 >= 2)
  {
    if (v3 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "primaryConnectionDidChangeTo:oldConnection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __63__VCCallSession_schedulePrimaryConnectionChange_oldConnection___block_invoke_cold_1();
    }
  }
  else
  {
    *(_QWORD *)(v1 + 88) = 1;
    if (!*(_QWORD *)(*(_QWORD *)v2 + 96))
    {
      *(_QWORD *)(*(_QWORD *)v2 + 96) = *(_QWORD *)(a1 + 40);
      v4 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = *(void **)(*(_QWORD *)v2 + 96);
          if (v7)
            v8 = (const char *)objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
          else
            v8 = "<nil>";
          v9 = 136315906;
          v10 = v5;
          v11 = 2080;
          v12 = "-[VCCallSession schedulePrimaryConnectionChange:oldConnection:]_block_invoke";
          v13 = 1024;
          v14 = 1575;
          v15 = 2080;
          v16 = v8;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: schedule a pending primary connection change, old primary connection: %s", (uint8_t *)&v9, 0x26u);
        }
      }
    }
  }
}

- (void)handlePendingPrimaryConnectionChange
{
  NSObject *connectionChangeQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  connectionChangeQueue = self->connectionChangeQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__VCCallSession_handlePendingPrimaryConnectionChange__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(connectionChangeQueue, v3);
}

void __53__VCCallSession_handlePendingPrimaryConnectionChange__block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  NSObject *v4;
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
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v2 = (const void *)VCConnectionManager_CopyPrimaryConnection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  if (v2)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = 136315650;
          v8 = v3;
          v9 = 2080;
          v10 = "-[VCCallSession handlePendingPrimaryConnectionChange]_block_invoke";
          v11 = 1024;
          v12 = 1597;
          _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: handle a pending primary connection change", (uint8_t *)&v7, 0x1Cu);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "primaryConnectionDidChangeTo:oldConnection:", v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v5;
        v9 = 2080;
        v10 = "-[VCCallSession handlePendingPrimaryConnectionChange]_block_invoke";
        v11 = 1024;
        v12 = 1602;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: audio/video setup done. Update connection change state to ready", (uint8_t *)&v7, 0x1Cu);
      }
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 2;
    CFRelease(v2);
  }
}

- (void)primaryConnectionDidChangeTo:(id)a3 oldConnection:(id)a4
{
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  BOOL v12;
  int v13;
  NSObject *cellTechQueue;
  _QWORD block[10];
  int v16;
  int v17;
  int v18;
  BOOL v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  _QWORD v25[3];
  int IsRemoteOnCellular;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int IsLocalOnCellular;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (-[VCCallSession isCallOngoing](self, "isCallOngoing"))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    IsLocalOnCellular = -1431655766;
    IsLocalOnCellular = VCConnection_IsLocalOnCellular((uint64_t)a3);
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    IsRemoteOnCellular = -1431655766;
    IsRemoteOnCellular = VCConnection_IsRemoteOnCellular((uint64_t)a3);
    v7 = VCConnection_IsLocalOnCellular((uint64_t)a4);
    v8 = VCConnection_IsRemoteOnCellular((uint64_t)a4);
    v9 = objc_msgSend(a4, "isWifiToWifi");
    v21 = 0;
    v22 = &v21;
    if (v9)
      v10 = 2;
    else
      v10 = 1;
    v23 = 0x2020000000;
    v24 = -1431655766;
    if (objc_msgSend(a3, "isWifiToWifi"))
      v11 = 2;
    else
      v11 = 1;
    v24 = v11;
    v12 = v10 != *((_DWORD *)v22 + 6);
    v13 = *((_DWORD *)v28 + 6);
    if ((v7 & 1) != 0)
    {
      if (!v13)
        -[VCCallSession cleanupWCMClient](self, "cleanupWCMClient");
      LOBYTE(v13) = 0;
    }
    else if (v13)
    {
      -[VCCallSession setupWCMClient](self, "setupWCMClient");
      LOBYTE(v13) = 1;
    }
    cellTechQueue = self->cellTechQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__VCCallSession_primaryConnectionDidChangeTo_oldConnection___block_invoke;
    block[3] = &unk_1E9E55B20;
    v16 = v7;
    v17 = v8;
    v19 = v12;
    v18 = v10;
    block[8] = v25;
    block[9] = &v21;
    block[4] = a3;
    block[5] = self;
    block[6] = a4;
    block[7] = &v27;
    v20 = v13;
    dispatch_async(cellTechQueue, block);
    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(&v27, 8);
  }
}

uint64_t __60__VCCallSession_primaryConnectionDidChangeTo_oldConnection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t IsLTEOrNewer;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v40;
  const __CFString *v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v5 = *(_DWORD *)(a1 + 80);
      v6 = *(_DWORD *)(a1 + 84);
      v7 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v8 = *(unsigned __int8 *)(a1 + 92);
      v9 = *(_DWORD *)(a1 + 88);
      v10 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 136317442;
      v44 = v2;
      v45 = 2080;
      v46 = "-[VCCallSession primaryConnectionDidChangeTo:oldConnection:]_block_invoke";
      v47 = 1024;
      v48 = 1638;
      v49 = 1024;
      v50 = v5;
      v51 = 1024;
      v52 = v4;
      v53 = 1024;
      v54 = v6;
      v55 = 1024;
      v56 = v7;
      v57 = 1024;
      v58 = v8;
      v59 = 1024;
      v60 = v9;
      v61 = 1024;
      v62 = v10;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: local use cellular[%d->%d], remote use cellular[%d->%d], need capture change[%d], interface[%d->%d].", buf, 0x46u);
    }
  }
  v11 = VCConnection_LocalCellTech(*(_QWORD *)(a1 + 32));
  v12 = VCConnection_RemoteCellTech(*(_QWORD *)(a1 + 32));
  VideoTransmitter_SetCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1256), *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), v11, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v12);
  v13 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (*(_BYTE *)(a1 + 92))
    objc_msgSend(*(id *)(a1 + 40), "resetVideoRulesForInterface:videoReportingDictionary:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24), v13);
  v14 = VCBitrateArbiter_ModeFromOperatingMode(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 1420));
  v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1176), "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", *(_QWORD *)(a1 + 32), 1, v14, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
  v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1176), "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", *(_QWORD *)(a1 + 32), 0, v14, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
  v17 = VCConnectionManager_CopyConnectionForQuality(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), 1);
  v18 = (void *)v17;
  if (v17 != *(_QWORD *)(a1 + 48) && v17 != *(_QWORD *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v19 = VRTraceErrorLogLevelToCSTR();
      v20 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v44 = v19;
        v45 = 2080;
        v46 = "-[VCCallSession primaryConnectionDidChangeTo:oldConnection:]_block_invoke";
        v47 = 1024;
        v48 = 1658;
        _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Overwrite bitrate cap and cell related flags as primary and active connections differ in connectionManager", buf, 0x1Cu);
      }
    }
    if (objc_msgSend(v18, "isWifiToWifi"))
      v21 = 2;
    else
      v21 = 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v21;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = VCConnection_IsLocalOnCellular((uint64_t)v18);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = VCConnection_IsRemoteOnCellular((uint64_t)v18);
    v11 = VCConnection_LocalCellTech((uint64_t)v18);
    v12 = VCConnection_RemoteCellTech((uint64_t)v18);
    v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1176), "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v18, 1, v14, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
    v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1176), "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v18, 0, v14, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1232), "setUseWiFiTiers:", *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) == 2);
  }
  if (v18)
    CFRelease(v18);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setMaxBandwidth:", v16);
  VCAudioReceiver_UpdateCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1224), v11, v12);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 320), "isVideoEnabled"))
    VideoReceiver_CellTechChanged();
  v22 = objc_msgSend(*(id *)(a1 + 40), "evaluateEnableRRx:", 0);
  v23 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v24 = *(_DWORD *)(a1 + 80);
  AFRCUpdateCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 344), v23, v11, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), v12, v22, v23 != v24);
  if (v23 != v24)
    MediaQueue_CleanupTxHistory();
  if (v15 >= v16)
    v25 = v16;
  else
    v25 = v15;
  VideoTransmitter_SetBitrate(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1256), 1000 * v25);
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1148) = v25;
  v26 = *(_QWORD *)(a1 + 40);
  v27 = *(unsigned int *)(v26 + 1420);
  if ((_DWORD)v27 == 7 || (_DWORD)v27 == 2)
  {
    AFRCSetTxCap(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 344), objc_msgSend((id)v26, "currentAudioCap"));
    v26 = *(_QWORD *)(a1 + 40);
    v27 = *(unsigned int *)(v26 + 1420);
  }
  LOBYTE(v40) = 0;
  objc_msgSend(*(id *)(v26 + 352), "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", v27, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 0, v11, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0, v12, v25, v40);
  RTPSetBasebandCongestionDetector(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 352), "basebandCongestionDetector"));
  v28 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v28 + 352))
  {
    if ((_DWORD)v11)
    {
      IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(v11);
      v28 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      IsLTEOrNewer = 1;
    }
    objc_msgSend(*(id *)(v28 + 360), "setIsSenderProbingEnabled:", IsLTEOrNewer);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v32 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 136316674;
      v44 = v30;
      v45 = 2080;
      v46 = "-[VCCallSession primaryConnectionDidChangeTo:oldConnection:]_block_invoke";
      v47 = 1024;
      v48 = 1709;
      v49 = 1024;
      v50 = v32;
      v51 = 1024;
      v52 = v25;
      v53 = 1024;
      v54 = v15;
      v55 = 1024;
      v56 = v16;
      _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: handlePrimaryConnChange -- use cellular(%d), new bitrate cap %u, max local bitrate %u, max remote bitrate %u", buf, 0x34u);
    }
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v41 = CFSTR("LCTCH");
    v42 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    reportingGenericEvent();
  }
  objc_msgSend(*(id *)(a1 + 40), "reportHandoverResultsWithDictionary:localBitrateCap:remoteBitrateCap:", v13, v25, v16);
  if (*(_BYTE *)(a1 + 93))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v44 = v33;
        v45 = 2080;
        v46 = "-[VCCallSession primaryConnectionDidChangeTo:oldConnection:]_block_invoke";
        v47 = 1024;
        v48 = 1723;
        _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: sending One-way SIP message to inform peer", buf, 0x1Cu);
      }
    }
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", v15);
    v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v11);
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v36, CFSTR("VCCellTechKey"), v35, CFSTR("VCMaxBitrateKey"), 0);
    v38 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1120), "newPackedMessageFromDictionary:", v37);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1120), "sendMessage:withTopic:", v38, CFSTR("VCCellTechChangeTopic"));

  }
  objc_msgSend(*(id *)(a1 + 40), "updateCachedConnectionState");
  objc_msgSend(*(id *)(a1 + 40), "updateMaxPktLength");
  return objc_msgSend(*(id *)(a1 + 40), "notifyDelegateActiveConnectionDidChange");
}

- (void)setQualityDelegate:(id)a3
{
  _opaque_pthread_mutex_t *p_qualityDelegateLock;

  p_qualityDelegateLock = &self->qualityDelegateLock;
  pthread_mutex_lock(&self->qualityDelegateLock);
  self->qualityDelegate = (VideoConferenceChannelQualityDelegate *)a3;
  pthread_mutex_unlock(p_qualityDelegateLock);
}

- (VideoConferenceChannelQualityDelegate)qualityDelegate
{
  return self->qualityDelegate;
}

- (int)getAudioTxBitrate
{
  VCAudioTransmitter *audioTransmitter;

  audioTransmitter = self->audioTransmitter;
  if (audioTransmitter)
    return -[VCAudioTransmitter audioTxBitrate](audioTransmitter, "audioTxBitrate");
  else
    return 32000;
}

- (double)networkQuality
{
  double v3;
  double v4;
  float64x2_t v5;
  double v6;
  const double *v7;
  float64x2_t v8;
  float64x2_t v9;
  int8x16_t v15;
  int8x16_t v16;
  float64x2_t v17;
  double result;

  if (self->videoPayload == -1)
  {
    v3 = (double)-[VCCallSession getAudioTxBitrate](self, "getAudioTxBitrate");
    v4 = 5000.0;
  }
  else
  {
    v3 = 292000.0;
    v4 = 68000.0;
  }
  v5.f64[0] = (double)self->bandwidthUpstream + 0.000001 - v4;
  v6 = v3 - v4;
  v5.f64[1] = 1.0 - self->packetLateAndMissingRatio + -0.9;
  v7 = (const double *)&unk_1D910D478;
  v8 = vld1q_dup_f64(v7);
  v8.f64[0] = v6;
  v9 = vdivq_f64(v5, v8);
  __asm { FMOV            V1.2D, #1.0 }
  v15 = (int8x16_t)vcgtq_f64(v9, _Q1);
  v16 = (int8x16_t)vcltzq_f64(v9);
  v17 = (float64x2_t)vbslq_s8(vorrq_s8(v16, v15), vbicq_s8((int8x16_t)_Q1, vbicq_s8(v16, v15)), (int8x16_t)v9);
  *(_QWORD *)&result = *(_OWORD *)&vmulq_laneq_f64(v17, v17, 1);
  return result;
}

- (void)updateRemoteMediaStallState:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  double v7;
  int packetsSinceStall;
  NSObject *delegateNotificationQueue;
  uint64_t *p_block;
  uint64_t v11;
  NSObject *v12;
  double lastReceivedPacketTimestamp;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  VCCallSession *v18;
  uint64_t block;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  VCCallSession *v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a3 - self->lastReceivedPacketTimestamp > self->_remoteMediaStallTimeout && !self->isRemoteMediaStalled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        lastReceivedPacketTimestamp = self->lastReceivedPacketTimestamp;
        *(_DWORD *)buf = 136316162;
        v25 = v11;
        v26 = 2080;
        v27 = "-[VCCallSession updateRemoteMediaStallState:]";
        v28 = 1024;
        v29 = 1786;
        v30 = 2048;
        v31 = lastReceivedPacketTimestamp;
        v32 = 2048;
        v33 = a3;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Stalling lastReceivedPacketTime %f currentTime %f", buf, 0x30u);
      }
    }
    reportingLog();
    self->isRemoteMediaStalled = 1;
    self->packetsSinceStall = 0;
    delegateNotificationQueue = self->delegateNotificationQueue;
    block = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __45__VCCallSession_updateRemoteMediaStallState___block_invoke;
    v22 = &unk_1E9E521C0;
    v23 = self;
    p_block = &block;
    goto LABEL_13;
  }
  if (self->packetsSinceStall >= 6 && self->isRemoteMediaStalled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->lastReceivedPacketTimestamp;
        packetsSinceStall = self->packetsSinceStall;
        *(_DWORD *)buf = 136316418;
        v25 = v5;
        v26 = 2080;
        v27 = "-[VCCallSession updateRemoteMediaStallState:]";
        v28 = 1024;
        v29 = 1794;
        v30 = 2048;
        v31 = v7;
        v32 = 2048;
        v33 = a3;
        v34 = 1024;
        v35 = packetsSinceStall;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Unstalling lastReceivedPacketTime %f currentTime %f packetCount %d", buf, 0x36u);
      }
    }
    reportingLog();
    self->isRemoteMediaStalled = 0;
    delegateNotificationQueue = self->delegateNotificationQueue;
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __45__VCCallSession_updateRemoteMediaStallState___block_invoke_162;
    v17 = &unk_1E9E521C0;
    v18 = self;
    p_block = &v14;
LABEL_13:
    dispatch_async(delegateNotificationQueue, p_block);
  }
  -[VCCallSession updateRemoteMediaStallStateReporting:](self, "updateRemoteMediaStallStateReporting:", a3, v14, v15, v16, v17, v18, block, v20, v21, v22, v23);
}

uint64_t __45__VCCallSession_updateRemoteMediaStallState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:remoteMediaStalled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 608));
}

uint64_t __45__VCCallSession_updateRemoteMediaStallState___block_invoke_162(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:remoteMediaStalled:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 608));
}

- (void)updateRemoteMediaStallStateReporting:(double)a3
{
  uint64_t v5;
  NSObject *v6;
  double lastReceivedPacketTimestamp;
  uint64_t v8;
  NSObject *v9;
  double v10;
  int packetsSinceShortMediaStall;
  double maxMediaStallTime;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  double v20;
  __int16 v21;
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3 - self->lastReceivedPacketTimestamp <= 0.5)
  {
    if (!self->_isRemoteMediaStalledShort)
      return;
  }
  else if (!self->_isRemoteMediaStalledShort)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        lastReceivedPacketTimestamp = self->lastReceivedPacketTimestamp;
        v13 = 136316162;
        v14 = v5;
        v15 = 2080;
        v16 = "-[VCCallSession updateRemoteMediaStallStateReporting:]";
        v17 = 1024;
        v18 = 1808;
        v19 = 2048;
        v20 = lastReceivedPacketTimestamp;
        v21 = 2048;
        v22 = a3;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Entering short media stall lastReceivedPacketTime=%f, currentTime=%f", (uint8_t *)&v13, 0x30u);
      }
    }
    self->_lastMediaStallStartTime = a3;
    self->_isRemoteMediaStalledShort = 1;
    self->packetsSinceShortMediaStall = 0;
    goto LABEL_15;
  }
  if (self->packetsSinceShortMediaStall < 6)
    return;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->lastReceivedPacketTimestamp;
      packetsSinceShortMediaStall = self->packetsSinceShortMediaStall;
      v13 = 136316418;
      v14 = v8;
      v15 = 2080;
      v16 = "-[VCCallSession updateRemoteMediaStallStateReporting:]";
      v17 = 1024;
      v18 = 1815;
      v19 = 2048;
      v20 = v10;
      v21 = 2048;
      v22 = a3;
      v23 = 1024;
      v24 = packetsSinceShortMediaStall;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Leaving short media stall lastReceivedPacketTime=%f, currentTime=%f, packetCount=%d", (uint8_t *)&v13, 0x36u);
    }
  }
  ++self->_mediaStallCount;
  maxMediaStallTime = a3 - self->_lastMediaStallStartTime + 0.5;
  self->_mediaStallTotalTime = self->_mediaStallTotalTime + maxMediaStallTime;
  if (self->_maxMediaStallTime > maxMediaStallTime)
    maxMediaStallTime = self->_maxMediaStallTime;
  self->_maxMediaStallTime = maxMediaStallTime;
  self->_lastMediaStallStartTime = 0.0;
  self->_isRemoteMediaStalledShort = 0;
LABEL_15:
  -[VCCallSession reportImmediateWRMMetric:value:](self, "reportImmediateWRMMetric:value:", 1);
}

- (void)updateLastReceivedPacketWithTimestamp:(double)a3 packetType:(int)a4
{
  NSObject *timestampQueue;
  _QWORD block[6];
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->shouldUpdateLastReceivedPacketTimestamp)
  {
    timestampQueue = self->timestampQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke;
    block[3] = &unk_1E9E52350;
    block[4] = self;
    *(double *)&block[5] = a3;
    v6 = a4;
    dispatch_async(timestampQueue, block);
  }
}

uint64_t __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  __CFDictionary *Mutable;
  char v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  double v13;
  void *v14;
  int v15;
  double v16;
  unint64_t v18;
  double *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  BOOL v25;
  uint64_t v26;
  double v27;
  NSObject *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  uint64_t v34;
  uint64_t v35;
  NSObject *global_queue;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  _QWORD v42[5];
  _QWORD v43[6];
  _QWORD block[6];
  uint8_t buf[80];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 593))
    return objc_msgSend((id)v2, "unlock");
  v3 = *(double *)(a1 + 40);
  v4 = *(double *)(v2 + 600);
  if (v3 > v4 && *(_BYTE *)(v2 + 608))
  {
    ++*(_DWORD *)(v2 + 652);
    v2 = *(_QWORD *)(a1 + 32);
    v4 = *(double *)(v2 + 600);
  }
  if (v3 > v4 && *(_BYTE *)(v2 + 648))
  {
    ++*(_DWORD *)(v2 + 656);
    v2 = *(_QWORD *)(a1 + 32);
    v4 = *(double *)(v2 + 600);
  }
  if (v3 > v4)
    *(double *)(v2 + 600) = v3;
  v5 = micro();
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v7 + 1404) && v5 - *(double *)(v7 + 600) > *(double *)(v7 + 800) * 0.5)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeySessionID"), *(const void **)(*(_QWORD *)(a1 + 32) + 760));
    CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeyPeerID"), *(const void **)(*(_QWORD *)(a1 + 32) + 1536));
    reportingSymptom();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1404) = 1;
    CFRelease(Mutable);
    v7 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v7 + 904) && v6 - *(double *)(v7 + 600) > *(double *)(v7 + 800))
  {
    v9 = objc_msgSend((id)v7, "isCallOngoing");
    v2 = *(_QWORD *)(a1 + 32);
    if ((v9 & 1) != 0)
    {
      *(_BYTE *)(v2 + 593) = 0;
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "detailedErrorCode");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v38 = *(_QWORD *)(a1 + 32);
          v37 = *(_QWORD *)(a1 + 40);
          v39 = *(_QWORD *)(v38 + 600);
          v40 = *(_QWORD *)(v38 + 800);
          v41 = *(_DWORD *)(a1 + 48);
          *(_DWORD *)buf = 136316930;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:]_block_invoke";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 1900;
          *(_WORD *)&buf[28] = 2048;
          *(double *)&buf[30] = v6;
          *(_WORD *)&buf[38] = 2048;
          *(_QWORD *)&buf[40] = v37;
          *(_WORD *)&buf[48] = 2048;
          *(_QWORD *)&buf[50] = v39;
          *(_WORD *)&buf[58] = 2048;
          *(_QWORD *)&buf[60] = v40;
          *(_WORD *)&buf[68] = 1024;
          *(_DWORD *)&buf[70] = v41;
          _os_log_error_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d Disconnecting due to no remote packet currentTime=%f lastPacketTime=%f lastReceivedPacketTimestamp=%f noRemotePacketsTimeout=%f packetType=%d", buf, 0x4Au);
        }
      }
      VCUtil_GenerateDiagnostics(0, 1, "Disconnecting due to no remote packets.", 1u);
      objc_msgSend(*(id *)(a1 + 32), "disconnectWithNoRemotePackets:", v10);
      v7 = *(_QWORD *)(a1 + 32);
      goto LABEL_20;
    }
    return objc_msgSend((id)v2, "unlock");
  }
LABEL_20:
  v13 = *(double *)(v7 + 688);
  if (v13 == 0.0)
  {
    *(double *)(v7 + 736) = v6;
    *(double *)(*(_QWORD *)(a1 + 32) + 728) = v6;
    *(double *)(*(_QWORD *)(a1 + 32) + 688) = v6;
    v7 = *(_QWORD *)(a1 + 32);
    v13 = *(double *)(v7 + 688);
  }
  if (v6 - v13 > 1.0)
  {
    if (v6 - *(double *)(v7 + 600) > *(double *)(v7 + 744) + -3.0)
    {
      *(double *)(v7 + 728) = v6;
      *(double *)(*(_QWORD *)(a1 + 32) + 736) = v6;
      v7 = *(_QWORD *)(a1 + 32);
    }
    v14 = *(void **)(v7 + 352);
    if (v14)
    {
      v53 = 0;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v46 = 0u;
      memset(buf, 0, sizeof(buf));
      VCRateControlGetStatistics(objc_msgSend(v14, "statisticsCollector"), 3, (uint64_t)buf);
      v15 = 0;
      *(double *)(*(_QWORD *)(a1 + 32) + 680) = *(double *)&buf[24] / 100.0;
      *(double *)(*(_QWORD *)(a1 + 32) + 696) = *(double *)(*(_QWORD *)(a1 + 32) + 680)
                                                + *(double *)(*(_QWORD *)(a1 + 32) + 696);
      *(double *)(*(_QWORD *)(a1 + 32) + 704) = *(double *)(*(_QWORD *)(a1 + 32) + 704) + 1.0;
      v16 = (double)(*(_DWORD *)&buf[52] / 0x3E8u);
    }
    else
    {
      *(_DWORD *)buf = -1431655766;
      v15 = RTPGetAFRCStat(*(_QWORD *)(v7 + 48), (double *)(v7 + 680), 0, buf, 0, 0, 0);
      LODWORD(v18) = *(_DWORD *)buf;
      v16 = (double)v18 * 0.0009765625;
    }
    *(double *)(*(_QWORD *)(a1 + 32) + 768) = v16;
    objc_msgSend(*(id *)(a1 + 32), "checkAbnormalOWRDAndResetLagReference");
    *(double *)(*(_QWORD *)(a1 + 32) + 688) = v6;
    v19 = *(double **)(a1 + 32);
    if (v6 - v19[90] >= 5.0)
    {
      v19[89] = v19[87] / v19[88];
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 696) = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 704) = 0;
      *(double *)(*(_QWORD *)(a1 + 32) + 720) = v6;
    }
    v20 = *(_QWORD *)(a1 + 32);
    if (v15 < 0)
    {
      *(double *)(v20 + 728) = v6;
      v20 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      if (*(_BYTE *)(v20 + 993))
      {
        v21 = *(NSObject **)(v20 + 896);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_168;
        block[3] = &unk_1E9E52960;
        block[4] = v20;
        *(double *)&block[5] = v6;
        dispatch_async(v21, block);
        v20 = *(_QWORD *)(a1 + 32);
      }
      if (*(double *)(v20 + 680) < 0.6)
      {
        *(double *)(v20 + 728) = v6;
        v20 = *(_QWORD *)(a1 + 32);
      }
      if (*(double *)(v20 + 768) >= 4.5)
        goto LABEL_40;
    }
    *(double *)(v20 + 736) = v6;
LABEL_40:
    v22 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v22 + 352))
      *(_DWORD *)(v22 + 520) = *(_DWORD *)(v22 + 1408);
    else
      RTPGetAFRCTxInfo(*(_QWORD *)(v22 + 48), (_DWORD *)(v22 + 520), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    *(float *)(*(_QWORD *)(a1 + 32) + 780) = VCAudioReceiver_GetPercentPacketsLateAndMissing(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224));
    objc_msgSend(*(id *)(a1 + 32), "logDetailedNetworkInformation");
    objc_msgSend(*(id *)(a1 + 32), "updateNetworkCheckHint:", v6);
    v7 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v7, "updateRemoteMediaStallState:", v6);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = v6 - *(double *)(v23 + 600);
  v25 = v24 > 1.0;
  if (v24 <= 1.0)
  {
    if (*(_BYTE *)(v23 + 816))
LABEL_50:
      reportingNoRemoteChanged();
  }
  else
  {
    if (v6 - *(double *)(v23 + 792) > 1.0)
    {
      *(double *)(v23 + 792) = v6;
      v26 = *(_QWORD *)(a1 + 32);
      v27 = v6 - *(double *)(v26 + 600);
      v28 = *(NSObject **)(v26 + 504);
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_169;
      v43[3] = &unk_1E9E52960;
      v43[4] = v26;
      *(double *)&v43[5] = v27;
      dispatch_async(v28, v43);
      v23 = *(_QWORD *)(a1 + 32);
    }
    if (!*(_BYTE *)(v23 + 816))
      goto LABEL_50;
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 816) = v25;
  v29 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v29 + 904))
    return objc_msgSend((id)v29, "unlock");
  v30 = v6 - *(double *)(v29 + 728);
  v31 = *(double *)(v29 + 744);
  v32 = v6 - *(double *)(v29 + 736);
  if (v30 <= v31 && v32 <= v31)
    return objc_msgSend((id)v29, "unlock");
  if (v30 > v31
    && (int)VRTraceGetErrorLogLevelForModule() >= 3
    && (v34 = VRTraceErrorLogLevelToCSTR(),
        v35 = *MEMORY[0x1E0CF2758],
        os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
  {
    if ((__66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_cold_2(v34, v35, v32 > v31) & 1) != 0)goto LABEL_60;
  }
  else if (v32 > v31)
  {
LABEL_60:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_cold_1();
    }
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isCallOngoing") & 1) != 0)
  {
    global_queue = dispatch_get_global_queue(2, 0);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_171;
    v42[3] = &unk_1E9E521C0;
    v42[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(global_queue, v42);
  }
  v29 = *(_QWORD *)(a1 + 32);
  return objc_msgSend((id)v29, "unlock");
}

void __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_168(uint64_t a1)
{
  pthread_mutex_t **v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t sig;
  uint64_t v6;
  id v7;
  float v8;
  uint64_t v9;
  double v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = (pthread_mutex_t **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "addNewRTT:packetLossRate:timestamp:", *(double *)(*(_QWORD *)(a1 + 32) + 768), *(double *)(*(_QWORD *)(a1 + 32) + 680), *(double *)(a1 + 40));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    v4 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        sig = (*v1)[12].__sig;
        v6 = *(_QWORD *)&(*v1)[10].__opaque[32];
        v11 = 136316162;
        v12 = v2;
        v13 = 2080;
        v14 = "-[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:]_block_invoke";
        v15 = 1024;
        v16 = 1961;
        v17 = 2048;
        v18 = sig;
        v19 = 2048;
        v20 = v6;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d roundTripTime = %f, packetLossRate = %f", (uint8_t *)&v11, 0x30u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_168_cold_1(v2, (uint64_t)v1, v3);
    }
  }
  pthread_mutex_lock(*v1 + 13);
  v7 = *(id *)&(*v1)[12].__opaque[48];
  pthread_mutex_unlock(*v1 + 13);
  if (objc_msgSend(*(id *)&(*v1)[15].__opaque[16], "isLinkCongested"))
    v8 = 0.5;
  else
    v8 = 0.0;
  v9 = objc_msgSend(*(id *)&(*v1)->__opaque[24], "participantID");
  *(float *)&v10 = v8;
  objc_msgSend(v7, "lossRate:forParticipantID:", v9, v10);

}

uint64_t __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_169(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:receivedNoPacketsForSeconds:", *(double *)(a1 + 40));
}

uint64_t __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_171(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 993))
    objc_msgSend(*(id *)(v2 + 1512), "reportNetworkConditionsDegraded");
  v5[0] = 0;
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 2052);
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v5, 32020, 202, v3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Network conditions became unusable for %d seconds"), (int)*(double *)(*(_QWORD *)(a1 + 32) + 744)), CFSTR("Bad network conditions"));
  return objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", v5[0], 0);
}

- (void)checkAbnormalOWRDAndResetLagReference
{
  float OWRD;
  double roundTripTime;
  BOOL v5;
  double v6;
  double v7;
  BOOL v8;
  int abnormalOWRDCount;

  OWRD = VCAudioReceiver_GetOWRD((uint64_t)self->audioReceiver);
  if (OWRD > 2.0
    && ((roundTripTime = self->roundTripTime, v5 = roundTripTime <= 0.0, v6 = OWRD, v7 = roundTripTime * 5.0, !v5)
      ? (v8 = v7 < v6)
      : (v8 = 0),
        v8))
  {
    abnormalOWRDCount = self->abnormalOWRDCount;
    self->abnormalOWRDCount = abnormalOWRDCount + 1;
    if (abnormalOWRDCount >= 3)
      VCAudioReceiver_ResetLagReference((uint64_t)self->audioReceiver);
  }
  else
  {
    self->abnormalOWRDCount = 0;
  }
}

- (void)updateLastReceivedAudioTime
{
  -[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:](self, "updateLastReceivedPacketWithTimestamp:packetType:", 5, VCAudioReceiver_GetLatestAudioTimestamp((uint64_t)self->audioReceiver));
}

- (void)updateLastReceivedPacket:(BOOL)a3 packetType:(int)a4
{
  uint64_t v4;
  double lastReceivedPacketTimestamp;

  v4 = *(_QWORD *)&a4;
  if (a3)
    lastReceivedPacketTimestamp = micro();
  else
    lastReceivedPacketTimestamp = self->lastReceivedPacketTimestamp;
  -[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:](self, "updateLastReceivedPacketWithTimestamp:packetType:", v4, lastReceivedPacketTimestamp);
}

- (void)dealloc
{
  const __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  TimingCollection *perfTimers;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  TimingCollection *v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  tagHANDLE *hSIP;
  NSObject *pausedAudioHeartBeat;
  void *videoMediaControlInfoGenerator;
  void *audioMediaControlInfoGenerator;
  tagVCAudioReceiver *audioReceiver;
  VCCaptionsReceiver *captionsReceiver;
  tagWRMMetricsInfo *wrmInfo;
  OpaqueVTPixelTransferSession *hdTransferSession;
  OpaqueVTPixelTransferSession *v23;
  __CVPixelBufferPool *hdBufferPool;
  opaqueRTCReporting *reportingAgent;
  objc_super v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  VCCallSession *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  unsigned int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        perfTimers = self->perfTimers;
        if (perfTimers)
          v7 = (const char *)objc_msgSend((id)-[TimingCollection description](perfTimers, "description"), "UTF8String");
        else
          v7 = "<nil>";
        *(_DWORD *)buf = 136316162;
        v28 = v4;
        v29 = 2080;
        v30 = "-[VCCallSession dealloc]";
        v31 = 1024;
        v32 = 2096;
        v33 = 2080;
        v34 = (void *)v7;
        v35 = 1024;
        LODWORD(v36) = -[VCCallSession callID](self, "callID");
        v12 = "VCCallSession [%s] %s:%d perfTimers=%s, callID = %u";
        v13 = v5;
        v14 = 44;
        goto LABEL_17;
      }
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v3 = (const __CFString *)-[VCCallSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v3 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = self->perfTimers;
        if (v10)
          v11 = (const char *)objc_msgSend((id)-[TimingCollection description](v10, "description"), "UTF8String");
        else
          v11 = "<nil>";
        *(_DWORD *)buf = 136316674;
        v28 = v8;
        v29 = 2080;
        v30 = "-[VCCallSession dealloc]";
        v31 = 1024;
        v32 = 2096;
        v33 = 2112;
        v34 = (void *)v3;
        v35 = 2048;
        v36 = self;
        v37 = 2080;
        v38 = v11;
        v39 = 1024;
        v40 = -[VCCallSession callID](self, "callID");
        v12 = "VCCallSession [%s] %s:%d %@(%p) perfTimers=%s, callID = %u";
        v13 = v9;
        v14 = 64;
LABEL_17:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
    reportingGenericEvent();
  reportingGenericEvent();
  reportingSetPeriodicAggregationOccuredHandler();
  reportingUnregisterPeriodicTask();
  reportingUnregisterPeriodicTask();
  -[VCCallSession sendTimings](self, "sendTimings");

  self->cameraTimers = 0;
  self->perfTimers = 0;
  -[VCCallSession setDelegate:](self, "setDelegate:", 0);
  -[VCCallSession setCaptionsDelegate:](self, "setCaptionsDelegate:", 0);
  hSIP = self->hSIP;
  if (hSIP != (tagHANDLE *)0xFFFFFFFFLL)
    SIPCloseCall((uint64_t)hSIP, -[VCCallInfo callID](self->localCallInfo, "callID"));
  -[VCTransportSession setPerfTimings:](self->_transportSession, "setPerfTimings:", 0);
  -[VCTransportSession stop](self->_transportSession, "stop");

  if (self->skeState)
  {
    SKEState_Destroy();
    self->skeState = 0;
  }
  if (-[VCCallSession isSIPEnabled](self, "isSIPEnabled") && self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
    objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "stopSIPWithTransportType:", self->_transportType);
  +[VCVTPWrapper stopVTP](VCVTPWrapper, "stopVTP");
  -[VCQoSMonitorManager unregisterQoSReportingSourceForToken:](+[VCQoSMonitorManager sharedInstance](VCQoSMonitorManager, "sharedInstance"), "unregisterQoSReportingSourceForToken:", -[VCCallInfo callID](self->localCallInfo, "callID"));

  pausedAudioHeartBeat = self->pausedAudioHeartBeat;
  if (pausedAudioHeartBeat)
    dispatch_release(pausedAudioHeartBeat);
  dispatch_release((dispatch_object_t)self->connectionChangeQueue);
  dispatch_release((dispatch_object_t)self->videoQueue);
  dispatch_release((dispatch_object_t)self->videoAsyncQueue);
  dispatch_release((dispatch_object_t)self->audioQueue);
  dispatch_release((dispatch_object_t)self->delegateNotificationQueue);
  dispatch_release((dispatch_object_t)self->qualityQueue);

  pthread_mutex_destroy(&self->mutex);
  pthread_mutex_destroy(&self->srtpLock);
  pthread_mutex_destroy(&self->pauseLock);
  pthread_mutex_destroy(&self->qualityDelegateLock);
  dispatch_release((dispatch_object_t)self->cellTechQueue);
  dispatch_release((dispatch_object_t)self->timestampQueue);

  self->callSessionBitrateArbiter = 0;
  videoMediaControlInfoGenerator = self->videoMediaControlInfoGenerator;
  if (videoMediaControlInfoGenerator)
    CFRelease(videoMediaControlInfoGenerator);
  audioMediaControlInfoGenerator = self->audioMediaControlInfoGenerator;
  if (audioMediaControlInfoGenerator)
    CFRelease(audioMediaControlInfoGenerator);
  -[VCCallSession setRemoteVideoAttributes:](self, "setRemoteVideoAttributes:", 0);

  audioReceiver = self->audioReceiver;
  if (audioReceiver)
  {
    free(audioReceiver);
    self->audioReceiver = 0;
  }
  captionsReceiver = self->_captionsReceiver;
  if (captionsReceiver)
  {

    self->_captionsReceiver = 0;
  }
  wrmInfo = self->wrmInfo;
  if (wrmInfo)
  {
    free(wrmInfo);
    self->wrmInfo = 0;
  }

  hdTransferSession = self->hdTransferSession;
  if (hdTransferSession)
  {
    VTPixelTransferSessionInvalidate(hdTransferSession);
    v23 = self->hdTransferSession;
    if (v23)
    {
      CFRelease(v23);
      self->hdTransferSession = 0;
    }
  }
  hdBufferPool = self->hdBufferPool;
  if (hdBufferPool)
  {
    CVPixelBufferPoolRelease(hdBufferPool);
    self->hdBufferPool = 0;
  }
  VCReporting_finalizeAggregation();
  reportingAgent = self->reportingAgent;
  if (reportingAgent)
    CFRelease(reportingAgent);

  VRLogfileFree((uint64_t *)&self->_callLogFile);
  objc_msgSend(+[VCEffectsManager sharedManager](VCEffectsManager, "sharedManager"), "setReportingAgent:", 0);
  -[VCCallSession deregisterForReportingNotifications](self, "deregisterForReportingNotifications");
  v26.receiver = self;
  v26.super_class = (Class)VCCallSession;
  -[VCCallSession dealloc](&v26, sel_dealloc);
}

- (BOOL)isSIPEnabled
{
  return -[VCMediaNegotiatorBase negotiatedFaceTimeSettings](self->_mediaNegotiator, "negotiatedFaceTimeSettings")
      && !-[VCMediaNegotiatorResultsFaceTimeSettings SIPDisabled](-[VCMediaNegotiatorBase negotiatedFaceTimeSettings](self->_mediaNegotiator, "negotiatedFaceTimeSettings"), "SIPDisabled")|| self->_transportType == 0;
}

- (BOOL)isSecureMessagingRequired
{
  if (-[VCMediaNegotiatorResultsFaceTimeSettings secureMessagingRequired](-[VCMediaNegotiatorBase negotiatedFaceTimeSettings](self->_mediaNegotiator, "negotiatedFaceTimeSettings"), "secureMessagingRequired"))
  {
    return 1;
  }
  else
  {
    return !-[VCCallSession isSIPEnabled](self, "isSIPEnabled");
  }
}

- (unsigned)mediaControlInfoFECFeedbackVersion
{
  return -[VCMediaNegotiatorResultsFaceTimeSettings mediaControlInfoFECFeedbackVersion](-[VCMediaNegotiatorBase negotiatedFaceTimeSettings](self->_mediaNegotiator, "negotiatedFaceTimeSettings"), "mediaControlInfoFECFeedbackVersion");
}

- (BOOL)isFECGeneratorEnabled
{
  char v3;
  int v4;
  _BOOL4 IsLossStatsEnabled;
  BOOL result;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-fec-generator-enabled"), CFSTR("isFECGeneratorEnabled"), &unk_1E9EF5168, 0), "BOOLValue");
  v4 = -[VCCallSession mediaControlInfoFECFeedbackVersion](self, "mediaControlInfoFECFeedbackVersion");
  IsLossStatsEnabled = VCMediaControlInfo_IsLossStatsEnabled(v4);
  result = v3 | IsLossStatsEnabled;
  if ((v3 & 1) == 0 && IsLossStatsEnabled)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCCallSession isFECGeneratorEnabled]";
        v13 = 1024;
        v14 = 2249;
        v15 = 1024;
        v16 = v4;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Enabling FECGenerator for FECFeedbackVersion %d", (uint8_t *)&v9, 0x22u);
      }
    }
    return IsLossStatsEnabled;
  }
  return result;
}

- (unsigned)defaultMediaControlInfoFECFeedbackVersion
{
  return objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-fec-feedback-version"), CFSTR("fecFeedbackVersion"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 1), 0), "unsignedIntValue");
}

- (id)activeControlChannel
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[VCCallSession isSecureMessagingRequired](self, "isSecureMessagingRequired");
  v4 = 1128;
  if (v3)
    v4 = 1136;
  return *(Class *)((char *)&self->super.isa + v4);
}

- (void)timeoutUnfinishedConnection
{
  if (!self->isStarted
    && -[VCCallSession isSIPEnabled](self, "isSIPEnabled")
    && self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
  {
    -[VCCallSession setupConnectionTimeoutTimerWithErrorCode:detailedCode:description:reason:](self, "setupConnectionTimeoutTimerWithErrorCode:detailedCode:description:reason:", 32012, 243, CFSTR("The connection timed out without getting started"), CFSTR("Client disconnected session before completely initializing it"));
  }
}

- (void)cancelConnectionTimeoutTimer
{
  uint64_t v3;
  NSObject *v4;
  NSObject *connectionTimeoutSource;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->connectionTimeoutSource)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v3;
        v8 = 2080;
        v9 = "-[VCCallSession cancelConnectionTimeoutTimer]";
        v10 = 1024;
        v11 = 2279;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Cancelling Timeout Source", (uint8_t *)&v6, 0x1Cu);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->connectionTimeoutSource);
    connectionTimeoutSource = self->connectionTimeoutSource;
    if (connectionTimeoutSource)
    {
      dispatch_release(connectionTimeoutSource);
      self->connectionTimeoutSource = 0;
    }
  }
}

- (void)setupConnectionTimeoutTimerWithErrorCode:(int)a3 detailedCode:(int)a4 description:(id)a5 reason:(id)a6
{
  double v11;
  NSObject *connectionTimeoutSource;
  double v13;
  dispatch_time_t v14;
  NSObject *v15;
  _QWORD v16[8];
  int v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[VCCallSession lock](self, "lock");
  -[VCCallSession cancelConnectionTimeoutTimer](self, "cancelConnectionTimeoutTimer");
  self->connectionTimeoutSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
  v11 = micro();
  connectionTimeoutSource = self->connectionTimeoutSource;
  if (connectionTimeoutSource)
  {
    v13 = v11;
    v14 = dispatch_walltime(0, 10000000000);
    dispatch_source_set_timer(connectionTimeoutSource, v14, 0x2540BE400uLL, 0x2540BE400uLL);
    v15 = self->connectionTimeoutSource;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __90__VCCallSession_setupConnectionTimeoutTimerWithErrorCode_detailedCode_description_reason___block_invoke;
    v16[3] = &unk_1E9E55B48;
    *(double *)&v16[7] = v13;
    v17 = a3;
    v18 = a4;
    v16[4] = self;
    v16[5] = a5;
    v16[6] = a6;
    dispatch_source_set_event_handler(v15, v16);
    dispatch_resume((dispatch_object_t)self->connectionTimeoutSource);
  }
  -[VCCallSession unlock](self, "unlock", v11);
}

void __90__VCCallSession_setupConnectionTimeoutTimerWithErrorCode_detailedCode_description_reason___block_invoke(uint64_t a1)
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1405))
  {
    reportingSymptom();
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1405) = 1;
  }
  if (micro() - *(double *)(a1 + 56) > 60.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cancelConnectionTimeoutTimer");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __90__VCCallSession_setupConnectionTimeoutTimerWithErrorCode_detailedCode_description_reason___block_invoke_cold_1();
    }
    v2[0] = 0;
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v2, *(int *)(a1 + 64), *(int *)(a1 + 68), 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", v2[0], 0);
  }
}

- (void)setUpFirstRemoteFrameTimer
{
  OS_dispatch_source *v3;
  NSObject *v4;
  dispatch_time_t v5;
  NSObject *firstRemoteFrameTimemoutSource;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
  {
    v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, 0);
    self->firstRemoteFrameTimemoutSource = v3;
    if (v3)
    {
      v4 = v3;
      v5 = dispatch_walltime(0, 5000000000);
      dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
      firstRemoteFrameTimemoutSource = self->firstRemoteFrameTimemoutSource;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __43__VCCallSession_setUpFirstRemoteFrameTimer__block_invoke;
      v7[3] = &unk_1E9E521C0;
      v7[4] = self;
      dispatch_source_set_event_handler(firstRemoteFrameTimemoutSource, v7);
      dispatch_resume((dispatch_object_t)self->firstRemoteFrameTimemoutSource);
    }
  }
}

uint64_t __43__VCCallSession_setUpFirstRemoteFrameTimer__block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeySessionID"), *(const void **)(*(_QWORD *)(a1 + 32) + 760));
  CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeyPeerID"), *(const void **)(*(_QWORD *)(a1 + 32) + 1536));
  reportingSymptom();
  CFRelease(Mutable);
  return objc_msgSend(*(id *)(a1 + 32), "cancelFirstRemoteFrameTimer");
}

- (void)cancelFirstRemoteFrameTimer
{
  NSObject *firstRemoteFrameTimemoutSource;
  NSObject *v4;

  firstRemoteFrameTimemoutSource = self->firstRemoteFrameTimemoutSource;
  if (firstRemoteFrameTimemoutSource)
  {
    dispatch_source_cancel(firstRemoteFrameTimemoutSource);
    v4 = self->firstRemoteFrameTimemoutSource;
    if (v4)
    {
      dispatch_release(v4);
      self->firstRemoteFrameTimemoutSource = 0;
    }
  }
}

- (BOOL)isLocalOrRemoteOnCellular
{
  int AppBooleanValue;
  BOOL v4;
  BOOL result;
  char IsLTEOrNewer;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("treatLTEAs4G"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 1;
  if (v4)
    return self->_isLocalCellular_LowestConnectionQuality || self->_isRemoteCellular_LowestConnectionQuality;
  if ((NetworkUtils_IsLTEOrNewer(-[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1)) & 1) != 0)return 0;
  IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(-[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0));
  result = 0;
  if ((IsLTEOrNewer & 1) == 0)
    return self->_isLocalCellular_LowestConnectionQuality || self->_isRemoteCellular_LowestConnectionQuality;
  return result;
}

- (void)pushAudioSamples:(opaqueVCAudioBufferList *)a3
{
  VCRedundancyControllerVideo *videoRedundancyController;
  int v6;
  double v7;
  double v8;
  NSObject *global_queue;
  int Timestamp;
  float v11;
  _QWORD block[5];
  _OWORD v13[12];
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!-[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector"))
  {
    v27 = 0;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    if ((AFRCGetAudioTxInfo((uint64_t)self->hAFRC, 0, 0, 0, 0, 0, 0, 0, 0, (uint64_t)&v15) & 0x80000000) == 0)
    {
      videoRedundancyController = self->_videoRedundancyController;
      v13[10] = v25;
      v13[11] = v26;
      v14 = v27;
      v13[6] = v21;
      v13[7] = v22;
      v13[8] = v23;
      v13[9] = v24;
      v13[2] = v17;
      v13[3] = v18;
      v13[4] = v19;
      v13[5] = v20;
      v13[0] = v15;
      v13[1] = v16;
      -[VCRedundancyControllerVideo updateRedundancyStrategyWithNetworkStatistics:](videoRedundancyController, "updateRedundancyStrategyWithNetworkStatistics:", v13);
    }
  }
  if (self->state == 1
    && -[VCCallSession isAudioRunning](self, "isAudioRunning")
    && -[VCCallSession shouldSendAudio](self, "shouldSendAudio"))
  {
    if (VCAudioBufferList_GetSampleCount((uint64_t)a3))
    {
      -[VCAudioTransmitter pushAudioSamples:](self->audioTransmitter, "pushAudioSamples:", a3);
      v6 = -[VCAudioTransmitter actualAudioSendingBitrate](self->audioTransmitter, "actualAudioSendingBitrate");
      if (self->useVCRC)
      {
        -[VCAudioTransmitter setQualityIndicator:](self->audioTransmitter, "setQualityIndicator:", -[VCRateControlMediaController audioFractionTier](self->_mediaController, "audioFractionTier") == 0);
        VCRateControlMediaController_SetAudioSendingBitrate((uint64_t)self->_mediaController, v6, v7, v8);
      }
      if (self->useAFRC)
        AFRCUpdateAudioSendingBitrate((uint64_t)self->hAFRC, v6);
      if (self->_shouldReportWRMMetrics)
      {
        global_queue = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __34__VCCallSession_pushAudioSamples___block_invoke;
        block[3] = &unk_1E9E521C0;
        block[4] = self;
        dispatch_async(global_queue, block);
      }
    }
    else
    {
      Timestamp = VCAudioBufferList_GetTimestamp((uint64_t)a3);
      v11 = (float)(Timestamp
                  - -[VCAudioTransmitter lastSentAudioSampleTime](self->audioTransmitter, "lastSentAudioSampleTime"));
      if ((float)(v11 / (float)-[VCCallSession sampleRate](self, "sampleRate")) > 0.5)
        -[VCAudioTransmitter pushAudioSamples:](self->audioTransmitter, "pushAudioSamples:", a3);
    }
  }
}

uint64_t __34__VCCallSession_pushAudioSamples___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lock");
  WRMIncrementTime(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1496));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v4 = 0u;
  VCAudioTransmitter_UpdateWrmMetrics(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1496));
  VCAudioReceiver_UpdateWrmMetrics(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1496));
  v2 = *(uint64_t **)(a1 + 32);
  if (v2[44])
    objc_msgSend(v2, "updateVCRateControlWRMMetrics:", v2[187], v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
      v20,
      v21,
      v22);
  else
    AFRCSetWrmMetrics(v2[43], (_DWORD *)v2[187]);
  if (WRMGenerateReport(*(unsigned __int8 **)(*(_QWORD *)(a1 + 32) + 1496), (uint64_t)&v4))
    WRMSubmitReport(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1496), (uint64_t)&v4);
  return objc_msgSend(*(id *)(a1 + 32), "unlock", v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
           v21,
           v22);
}

- (void)updateVCRateControlWRMMetrics:(tagWRMMetricsInfo *)a3
{
  unsigned int isLocalCellular_LowestConnectionQuality;

  a3->isCallAudioOnly = -[VCRateControlMediaController isAudioOnly](self->_mediaController, "isAudioOnly");
  a3->bwEstimation = -[AVCStatisticsCollector sharedEstimatedBandwidth](-[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector"), "sharedEstimatedBandwidth");
  a3->targetBitrate = self->_targetBitrate / 0x3E8;
  isLocalCellular_LowestConnectionQuality = self->_isLocalCellular_LowestConnectionQuality;
  a3->adaptationPacketLossPercentage = (self->packetLossRate * 100.0);
  a3->isLocalCellular = isLocalCellular_LowestConnectionQuality;
  a3->isVideoPaused = VCRateControlMediaController_IsVideoStopped(self->_mediaController);
}

- (BOOL)isCaller
{
  return self->isInitiator;
}

- (BOOL)startConnectionWithParticipantID:(id)a3 callID:(unsigned int)a4 usingInviteData:(id)a5 isCaller:(BOOL)a6 capabilities:(id)a7 idsSocket:(int)a8 destination:(id)a9 error:(id *)a10
{
  uint64_t v10;
  _BOOL8 v12;
  uint64_t v14;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  int ErrorLogLevelForModule;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  VCControlChannelMultiWay *v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  uint64_t v36;
  BOOL v37;
  _QWORD *v38;
  BOOL v39;
  int v41;
  id v42;
  _QWORD v43[6];
  _QWORD v44[5];
  _QWORD v45[5];
  uint8_t buf[48];
  const char *v47;
  __int16 v48;
  const char *v49;
  uint64_t v50;

  v10 = *(_QWORD *)&a8;
  v12 = a6;
  v14 = *(_QWORD *)&a4;
  v50 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v17 = VRTraceErrorLogLevelToCSTR();
    v18 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v42 = a3;
      v19 = v10;
      v20 = -[VCCallSession deviceRole](self, "deviceRole");
      if (a7)
      {
        v21 = (const char *)objc_msgSend((id)objc_msgSend(a7, "description"), "UTF8String");
        if (a5)
        {
LABEL_5:
          v22 = (const char *)objc_msgSend((id)objc_msgSend(a5, "description"), "UTF8String");
LABEL_8:
          *(_DWORD *)buf = 136316930;
          *(_QWORD *)&buf[4] = v17;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabil"
                                "ities:idsSocket:destination:error:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 2461;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v14;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = v12;
          *(_WORD *)&buf[40] = 1024;
          *(_DWORD *)&buf[42] = v20;
          *(_WORD *)&buf[46] = 2080;
          v47 = v21;
          v48 = 2080;
          v49 = v22;
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startConnectionWithParticipantID: callID = %d, isCaller = %d, self.deviceRole = %d, caps = %s, inviteData = %s", buf, 0x42u);
          v10 = v19;
          a3 = v42;
          goto LABEL_9;
        }
      }
      else
      {
        v21 = "<nil>";
        if (a5)
          goto LABEL_5;
      }
      v22 = "<nil>";
      goto LABEL_8;
    }
  }
LABEL_9:
  if (!self->isGKVoiceChat)
    self->_shouldReportWRMMetrics = -[VCHardwareSettingsEmbedded hasBaseband](+[VCHardwareSettingsEmbedded sharedInstance](VCHardwareSettingsEmbedded, "sharedInstance"), "hasBaseband");
  if (self->isStarted)
  {
    close(v10);
    return 1;
  }
  -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 12);
  objc_opt_class();
  objc_opt_isKindOfClass();
  reportingModeRoleTransportLog();
  if (v12
    && (v23 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("InviteDataMediaBlob"))) != 0
    && (v24 = v23,
        -[VCCallSession lock](self, "lock"),
        LOBYTE(v24) = -[VCMediaNegotiator processResponseBlob:](self->_mediaNegotiator, "processResponseBlob:", v24),
        -[VCCallSession unlock](self, "unlock"),
        (v24 & 1) == 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:].cold.3();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:].cold.4();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a10, 32031, 200, 0, CFSTR("Failed to process response media blob"), CFSTR("Media blob error"));
    v41 = v10;
  }
  else
  {
    if (-[VCCallSession isSIPEnabled](self, "isSIPEnabled") && self->hSIP == (tagHANDLE *)0xFFFFFFFFLL)
    {
      objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "startSIPWithPacketMultiplexMode:transportType:", -[VCCallSession mapPacketMultiplexModeToSIPMode:](self, "mapPacketMultiplexModeToSIPMode:", self->packetMultiplexMode), self->_transportType);
      self->hSIP = (tagHANDLE *)objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "SIPHandle");
    }
    v25 = -[VCCallSession isSecureMessagingRequired](self, "isSecureMessagingRequired");
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v25)
    {
      if (ErrorLogLevelForModule >= 6)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabil"
                                "ities:idsSocket:destination:error:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 2505;
          _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Starting secure control channel", buf, 0x1Cu);
        }
      }
      if (-[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled"))
        v29 = 0;
      else
        v29 = -[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled") ^ 1;
      v32 = -[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:]([VCControlChannelMultiWay alloc], "initWithTransportSessionID:reportingAgent:mode:", v14, self->reportingAgent, v29);
      self->secureControlChannel = v32;
      -[VCControlChannel setDataReceivedDelegate:](v32, "setDataReceivedDelegate:", self);
      memset(buf, 0, sizeof(buf));
      *(_DWORD *)buf = 1;
      if (!-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:](self->secureControlChannel, "addActiveParticipant:participantUUID:withConfiguration:", 0, CFSTR("00000000-0000-0000-0000-000000000000"), buf)&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:].cold.2();
      }
      -[VCControlChannelMultiWay start](self->secureControlChannel, "start");
    }
    else
    {
      if (ErrorLogLevelForModule >= 6)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v30;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabil"
                                "ities:idsSocket:destination:error:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 2517;
          _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Starting SIP control channel", buf, 0x1Cu);
        }
      }
      self->controlChannel = (VCControlChannel *)-[VCControlChannelFaceTime initWithCallID:reportingAgent:]([VCControlChannelFaceTime alloc], "initWithCallID:reportingAgent:", v14, self->reportingAgent);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v35 = -[VCCallSession mediaControlInfoFECFeedbackVersion](self, "mediaControlInfoFECFeedbackVersion");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilit"
                              "ies:idsSocket:destination:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 2520;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v35;
        _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Media control info FEC feedback version is '%d'", buf, 0x22u);
      }
    }
    -[VCCallSession setupPeerInfo:usingInviteData:isCaller:capabilities:](self, "setupPeerInfo:usingInviteData:isCaller:capabilities:", a3, a5, v12, a7);
    if (v12 && objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("InviteDataSKEBlob")))
    {
      -[VCCallSession lock](self, "lock");
      if (self->skeState)
      {
        if (SKEState_SetBlob())
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:].cold.1();
          }
        }
      }
      -[VCCallSession unlock](self, "unlock");
    }
    reportingSetUserInfo();
    -[VCCallSession applyNegotiatedFaceTimeSettings](self, "applyNegotiatedFaceTimeSettings");
    -[VCCallSession setupABTesting](self, "setupABTesting");
    -[VCSwitchManager negotiatedSwitches](self->_switchManager, "negotiatedSwitches");
    -[VCSwitchManager remoteSwitches](self->_switchManager, "remoteSwitches");
    -[VCMediaNegotiatorResultsFaceTimeSettings remoteFaceTimeSwitchesAvailable](-[VCMediaNegotiatorBase negotiatedFaceTimeSettings](self->_mediaNegotiator, "negotiatedFaceTimeSettings"), "remoteFaceTimeSwitchesAvailable");
    -[VCCallSession vcrcServerBagProfileNumber](self, "vcrcServerBagProfileNumber");
    -[VCConnectionManager primaryConnHealthAllowedDelay](self->connectionManager, "primaryConnHealthAllowedDelay");
    reportingConnecting();
    v36 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    if ((_DWORD)v10 != -1 || a9)
    {
      v39 = -[VCCallSession setupIDSConnectionForCallID:destination:socket:error:](self, "setupIDSConnectionForCallID:destination:socket:error:", v14, a9, v10, a10);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_201;
      v45[3] = &unk_1E9E55BB0;
      v45[4] = v36;
      if (v39)
      {
        v38 = v45;
        goto LABEL_52;
      }
    }
    else
    {
      v37 = -[VCCallSession configureLegacyTransportWithInviteInfo:error:](self, "configureLegacyTransportWithInviteInfo:error:", a5, a10);
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_2;
      v44[3] = &unk_1E9E55BB0;
      v44[4] = v36;
      if (v37)
      {
        v38 = v44;
LABEL_52:
        -[VCTransportSession setCallActive:](self->_transportSession, "setCallActive:", objc_msgSend(a7, "isAudioPausedToStart") ^ 1);
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_3;
        v43[3] = &unk_1E9E55BD8;
        v43[4] = v36;
        v43[5] = v38;
        -[VCTransportSession setEventHandler:](self->_transportSession, "setEventHandler:", v43);
        -[VCTransportSession setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:](self->_transportSession, "setConnectionSelectionVersionWithLocalFrameworkVersion:remoteFrameworkVersion:", -[VCCallInfo frameworkVersion](self->localCallInfo, "frameworkVersion"), -[VCCallInfo frameworkVersion](self->remoteCallInfo, "frameworkVersion"));
        -[VCTransportSession start](self->_transportSession, "start");
        return 1;
      }
    }
    v41 = v10;
  }
  close(v41);
  return 0;
}

void __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke(uint64_t a1, void *a2)
{
  if (!objc_msgSend(a2, "count") && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_cold_1();
  }
}

uint64_t __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_201(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleReceivedPiggybackBlobIDS:", a2);
}

uint64_t __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "handleReceivedPiggybackBlobLegacy:", a2);
}

void __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
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
  v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (v6 && (v7 = v6, (objc_msgSend(v6, "isCallOngoing") & 1) != 0))
  {
    switch(a2)
    {
      case 1:
        objc_msgSend(v7, "handleNewConnectionSetup:isInitialConnection:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoNewLink")), objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoIsFirstLink")), "BOOLValue"));
        break;
      case 2:
      case 16:
        return;
      case 3:
        objc_msgSend(v7, "handlePrimaryConnectionChanged:oldPrimaryConnection:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoNewPrimary")), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoOldPrimary")));
        break;
      case 4:
        objc_msgSend(v7, "handleDuplicationEnabled:activeConnection:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoIsDuplicationEnabled")), "BOOLValue"), objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("transportSessionEventInfoActiveConnection")));
        break;
      case 5:
        (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3);
        break;
      case 6:
        objc_msgSend((id)objc_msgSend(v7, "localCallInfo"), "setSupportsSKEOptimization:", 0);
        break;
      case 7:
        objc_msgSend(v7, "disconnect:didRemoteCancel:", a3, 0);
        break;
      case 8:
        objc_msgSend(v7, "handleCellTechChange:", objc_msgSend(a3, "intValue"));
        break;
      case 9:
        objc_msgSend(v7, "handleCellularMTUChanged:", objc_msgSend(a3, "unsignedShortValue"));
        break;
      case 10:
        objc_msgSend(v7, "hAFRC");
        AFRCMarkNetworkChange();
        break;
      default:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v12 = 136315906;
            v13 = v11;
            v14 = 2080;
            v15 = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocke"
                  "t:destination:error:]_block_invoke";
            v16 = 1024;
            v17 = 2629;
            v18 = 1024;
            v19 = a2;
            v10 = "VCCallSession [%s] %s:%d Received invalid transportSession event(%d)";
            goto LABEL_8;
          }
        }
        break;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315906;
      v13 = v8;
      v14 = 2080;
      v15 = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:dest"
            "ination:error:]_block_invoke_3";
      v16 = 1024;
      v17 = 2575;
      v18 = 1024;
      v19 = a2;
      v10 = "VCCallSession [%s] %s:%d Received transportSession event %d while call is not ongoing. Skipping";
LABEL_8:
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x22u);
    }
  }
}

- (void)verifyFaceTimeClassicNotOnNewerBuilds
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to allocate optionalDictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)handleReceivedPiggybackBlobIDS:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  _BYTE buf[12];
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v5;
      v31 = 2080;
      v32 = "-[VCCallSession handleReceivedPiggybackBlobIDS:]";
      v33 = 1024;
      v34 = 2669;
      v35 = 2048;
      v36 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Received piggyback blob %p", buf, 0x26u);
    }
  }
  -[VCCallSession lock](self, "lock");
  if (a3)
  {
    if (self->skeState)
    {
      v13 = SKEState_SetBlob();
      if ((_DWORD)v13)
      {
        v29 = v13;
        VCSignalErrorAt(v13, "Signalled error at %s: SKEState_SetBlob(1) failed", v14, v15, v16, v17, v18, v19, (char)"-[VCCallSession handleReceivedPiggybackBlobIDS:]");
      }
      else if (!self->isInitiator
             && (v20 = -[VCCallSession setSKEBlobOnTransportSession](self, "setSKEBlobOnTransportSession")) != 0)
      {
        v29 = v20;
      }
      else
      {
        dispatch_time(0, 5000000000);
        v21 = SKEState_CopySecretKeySync();
        if (!(_DWORD)v21)
        {
          -[VCCallSession handleKeyExchangeCompleted](self, "handleKeyExchangeCompleted");
          -[VCCallSession unlock](self, "unlock");
          return;
        }
        v29 = v21;
        VCSignalErrorAt(v21, "Signalled error at %s: SKEState_CopySecretKeySync failed", v22, v23, v24, v25, v26, v27, (char)"-[VCCallSession handleReceivedPiggybackBlobIDS:]");
      }
      -[VCCallSession unlock](self, "unlock");
      goto LABEL_18;
    }
    v28 = VCSignalErrorAt(263, "Signalled error at %s: skeState is NULL", v7, v8, v9, v10, v11, v12, (char)"-[VCCallSession handleReceivedPiggybackBlobIDS:]");
  }
  else
  {
    v28 = VCSignalErrorAt(260, "Signalled error at %s: Piggyback SKE blob is nil", v7, v8, v9, v10, v11, v12, (char)"-[VCCallSession handleReceivedPiggybackBlobIDS:]");
  }
  v29 = v28;
  -[VCCallSession unlock](self, "unlock");
  if (v29)
  {
LABEL_18:
    *(_QWORD *)buf = 0;
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32018, v29, 0, CFSTR("Media insecure"), CFSTR("Key exchange failed"));
    -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", *(_QWORD *)buf, 0);
  }
}

- (void)handleReceivedPiggybackBlobLegacy:(id)a3
{
  __CFData *secretKey;

  -[VCCallSession lock](self, "lock");
  secretKey = self->secretKey;
  self->secretKey = (__CFData *)a3;
  if (a3)
    CFRetain(a3);
  if (secretKey)
    CFRelease(secretKey);
  -[VCCallSession handleKeyExchangeCompleted](self, "handleKeyExchangeCompleted");
  -[VCCallSession unlock](self, "unlock");
}

- (void)applyNegotiatedFaceTimeSettings
{
  -[VCSwitchManager setRemoteSwitches:](self->_switchManager, "setRemoteSwitches:", -[VCMediaNegotiatorResultsFaceTimeSettings faceTimeSwitches](-[VCMediaNegotiatorBase negotiatedFaceTimeSettings](self->_mediaNegotiator, "negotiatedFaceTimeSettings"), "faceTimeSwitches"));
  -[VCSwitchManager negotiateSwitches](self->_switchManager, "negotiateSwitches");
  -[VCConnectionManager setRemoteLinkProbingCapabilityVersion:](self->connectionManager, "setRemoteLinkProbingCapabilityVersion:", -[VCMediaNegotiatorResultsFaceTimeSettings remoteLinkProbingCapabilityVersion](-[VCMediaNegotiatorBase negotiatedFaceTimeSettings](self->_mediaNegotiator, "negotiatedFaceTimeSettings"), "remoteLinkProbingCapabilityVersion"));
}

- (void)setupABTesting
{
  VCSwitchManager *switchManager;
  const char *v4;
  char *v5;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  char *__lasts;
  char *__str;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    switchManager = self->_switchManager;
    v4 = switchManager
       ? (const char *)objc_msgSend(-[VCSwitchManager description](switchManager, "description"), "UTF8String")
       : "<nil>";
    asprintf(&__str, "A/B testing: %s", v4);
    if (__str)
    {
      __lasts = 0;
      v5 = strtok_r(__str, "\n", &__lasts);
      v6 = (os_log_t *)MEMORY[0x1E0CF2758];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *v6;
          if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            v30 = v7;
            v31 = 2080;
            v32 = "-[VCCallSession setupABTesting]";
            v33 = 1024;
            v34 = 2719;
            v35 = 2080;
            v36 = "-[VCCallSession setupABTesting]";
            v37 = 2080;
            v38 = v5;
            _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v5 = strtok_r(0, "\n", &__lasts);
      }
      while (v5);
      free(__str);
    }
  }
  -[VCConnectionManager setPreferRelayOverP2PEnabled:](self->connectionManager, "setPreferRelayOverP2PEnabled:", -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 1));
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[VCConnectionManager preferRelayOverP2PEnabled](self->connectionManager, "preferRelayOverP2PEnabled");
      *(_DWORD *)buf = 136315906;
      v30 = v9;
      v31 = 2080;
      v32 = "-[VCCallSession setupABTesting]";
      v33 = 1024;
      v34 = 2722;
      v35 = 1024;
      LODWORD(v36) = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch preferRelayOverP2P %d", buf, 0x22u);
    }
  }
  -[VCConnectionManager setFastMediaDuplicationEnabled:](self->connectionManager, "setFastMediaDuplicationEnabled:", -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 64));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[VCConnectionManager fastMediaDuplicationEnabled](self->connectionManager, "fastMediaDuplicationEnabled");
      *(_DWORD *)buf = 136315906;
      v30 = v12;
      v31 = 2080;
      v32 = "-[VCCallSession setupABTesting]";
      v33 = 1024;
      v34 = 2724;
      v35 = 1024;
      LODWORD(v36) = v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch fastMediaDuplicationEnabled %d", buf, 0x22u);
    }
  }
  -[VCConnectionManager setDuplicateImportantPktsEnabled:](self->connectionManager, "setDuplicateImportantPktsEnabled:", -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 512));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[VCConnectionManager duplicateImportantPktsEnabled](self->connectionManager, "duplicateImportantPktsEnabled");
      *(_DWORD *)buf = 136315906;
      v30 = v15;
      v31 = 2080;
      v32 = "-[VCCallSession setupABTesting]";
      v33 = 1024;
      v34 = 2726;
      v35 = 1024;
      LODWORD(v36) = v17;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch duplicateImportantPktsEnabled %d", buf, 0x22u);
    }
  }
  -[VCConnectionManager setLowNetworkModeEnabled:](self->connectionManager, "setLowNetworkModeEnabled:", -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 0x1000000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v20 = -[VCConnectionManager lowNetworkModeEnabled](self->connectionManager, "lowNetworkModeEnabled");
      *(_DWORD *)buf = 136315906;
      v30 = v18;
      v31 = 2080;
      v32 = "-[VCCallSession setupABTesting]";
      v33 = 1024;
      v34 = 2728;
      v35 = 1024;
      LODWORD(v36) = v20;
      _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch lowNetworkModeEnabled %d", buf, 0x22u);
    }
  }
  -[VCConnectionManager setDuplicationEnhancementEnabled:](self->connectionManager, "setDuplicationEnhancementEnabled:", -[VCSwitchManager isLocalSwitchEnabled:](self->_switchManager, "isLocalSwitchEnabled:", 0x2000000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v23 = -[VCConnectionManager duplicationEnhancementEnabled](self->connectionManager, "duplicationEnhancementEnabled");
      *(_DWORD *)buf = 136315906;
      v30 = v21;
      v31 = 2080;
      v32 = "-[VCCallSession setupABTesting]";
      v33 = 1024;
      v34 = 2730;
      v35 = 1024;
      LODWORD(v36) = v23;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch duplicationEnhancementEnabled %d", buf, 0x22u);
    }
  }
  -[VCConnectionManager setiRATDuplicationEnabled:](self->connectionManager, "setiRATDuplicationEnabled:", -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 0x8000000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v26 = -[VCConnectionManager iRATDuplicationEnabled](self->connectionManager, "iRATDuplicationEnabled");
      *(_DWORD *)buf = 136315906;
      v30 = v24;
      v31 = 2080;
      v32 = "-[VCCallSession setupABTesting]";
      v33 = 1024;
      v34 = 2732;
      v35 = 1024;
      LODWORD(v36) = v26;
      _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch iRATDuplicationEnabled %d", buf, 0x22u);
    }
  }
}

- (void)setupWCMClient
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  VCWCMClient *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x1E0DD9AE8] && WCMEnabled() && !self->isGKVoiceChat)
  {
    if ((NetworkUtils_IsLTEOrNewer(-[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1)) & 1) != 0)
    {
      if (!self->vcWCMClient)
      {
        v6 = objc_alloc_init(VCWCMClient);
        self->vcWCMClient = v6;
        -[VCWCMClient setWcmClientDelegate:](v6, "setWcmClientDelegate:", self);
        -[VCWCMClient startWCMClient](self->vcWCMClient, "startWCMClient");
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = v7;
        v10 = 2080;
        v11 = "-[VCCallSession setupWCMClient]";
        v12 = 1024;
        v13 = 2740;
        v5 = "VCCallSession [%s] %s:%d WCM: non-LTE RAT not supported.";
        goto LABEL_7;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCCallSession setupWCMClient]";
      v12 = 1024;
      v13 = 2750;
      v5 = "VCCallSession [%s] %s:%d WCM: not supported on this device.";
LABEL_7:
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)cleanupWCMClient
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
  if (MEMORY[0x1E0DD9AE8] && WCMEnabled() && !self->isGKVoiceChat)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v5 = 136315650;
        v6 = v3;
        v7 = 2080;
        v8 = "-[VCCallSession cleanupWCMClient]";
        v9 = 1024;
        v10 = 2757;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WCM: cleanup start.", (uint8_t *)&v5, 0x1Cu);
      }
    }
    -[VCWCMClient stopWCMClient](self->vcWCMClient, "stopWCMClient");
    -[VCWCMClient setWcmClientDelegate:](self->vcWCMClient, "setWcmClientDelegate:", 0);

    self->vcWCMClient = 0;
  }
}

- (void)setupWRMClient
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL8 v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t (*v22)(_QWORD);
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (!self->isGKVoiceChat && !self->vcWRMClient)
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    v4 = (os_log_t *)MEMORY[0x1E0CF2758];
    if (ErrorLogLevelForModule >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v24 = v5;
        v25 = 2080;
        v26 = "-[VCCallSession setupWRMClient]";
        v27 = 1024;
        v28 = 2787;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: vcWRMClient setup start.", buf, 0x1Cu);
      }
    }
    *(_QWORD *)&v21 = self;
    *((_QWORD *)&v21 + 1) = MEMORY[0x1E0C98BD0];
    v22 = MEMORY[0x1E0C98BC0];
    RTPSetWRMInfo((uint64_t)self->rtpHandle, (uint64_t)self->wrmInfo);
    RTPSetWRMMetricsCallback((uint64_t)self->rtpHandle, (uint64_t)WRMReportMetricsCallback, &v21);
    RTPSetWRMCallId((uint64_t)self->rtpHandle, -[VCCallInfo callID](self->localCallInfo, "callID"));
    RTPSetWRMInfo((uint64_t)self->rtpVideo, (uint64_t)self->wrmInfo);
    RTPSetWRMMetricsCallback((uint64_t)self->rtpVideo, (uint64_t)WRMReportMetricsCallback, &v21);
    RTPSetWRMCallId((uint64_t)self->rtpVideo, -[VCCallInfo callID](self->localCallInfo, "callID"));
    -[VCConnectionManager setWRMUpdateCallback:requestNotificationCallback:withContext:completionHandler:](self->connectionManager, "setWRMUpdateCallback:requestNotificationCallback:withContext:completionHandler:", VCCMWRMStatusUpdateCallback_0, VCCMWRMRequestNotificationCallback_0, self, 0);
    self->vcWRMClient = -[WRMClient initWithDelegate:]([WRMClient alloc], "initWithDelegate:", self);
    v7 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 0x10000);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v24 = v8;
        v25 = 2080;
        v26 = "-[VCCallSession setupWRMClient]";
        v27 = 1024;
        v28 = 2808;
        v29 = 1024;
        v30 = v7;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch iRATMetricsEnabled %d", buf, 0x22u);
      }
    }
    v10 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 128);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v24 = v11;
        v25 = 2080;
        v26 = "-[VCCallSession setupWRMClient]";
        v27 = 1024;
        v28 = 2810;
        v29 = 1024;
        v30 = v10;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch iRATRtpEnabled %d", buf, 0x22u);
      }
    }
    v13 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 256);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v24 = v14;
        v25 = 2080;
        v26 = "-[VCCallSession setupWRMClient]";
        v27 = 1024;
        v28 = 2812;
        v29 = 1024;
        v30 = v13;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch preWarmCellEnabled %d", buf, 0x22u);
      }
    }
    v16 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 0x10000000);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v24 = v17;
        v25 = 2080;
        v26 = "-[VCCallSession setupWRMClient]";
        v27 = 1024;
        v28 = 2814;
        v29 = 1024;
        v30 = v16;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch wrmRSSIThresholdEnabled %d", buf, 0x22u);
      }
    }
    -[WRMClient setRSSIThresholdEnabled:](self->vcWRMClient, "setRSSIThresholdEnabled:", v16);
    v19 = 0x10000;
    if (!v13)
      v19 = 0;
    v20 = 256;
    if (!v10)
      v20 = 0;
    -[WRMClient startWRMClientWithMode:metricsConfig:](self->vcWRMClient, "startWRMClientWithMode:metricsConfig:", 1, v20 | v7 | v19);
    -[WRMClient setMediaControlInfoVersion:](self->vcWRMClient, "setMediaControlInfoVersion:", VCMediaControlInfoGeneratorGetVersion(self->videoMediaControlInfoGenerator));
  }
}

- (void)cleanupWRMClient
{
  uint64_t v3;
  NSObject *v4;
  WRMClient *vcWRMClient;
  VCConnectionManager *connectionManager;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCCallSession cleanupWRMClient]";
      v12 = 1024;
      v13 = 2823;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: vcWRMClient cleanup start.", buf, 0x1Cu);
    }
  }
  RTPSetWRMMetricsCallback((uint64_t)self->rtpHandle, 0, 0);
  vcWRMClient = self->vcWRMClient;
  self->vcWRMClient = 0;
  connectionManager = self->connectionManager;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__VCCallSession_cleanupWRMClient__block_invoke;
  v7[3] = &unk_1E9E521C0;
  v7[4] = vcWRMClient;
  -[VCConnectionManager setWRMUpdateCallback:requestNotificationCallback:withContext:completionHandler:](connectionManager, "setWRMUpdateCallback:requestNotificationCallback:withContext:completionHandler:", 0, 0, 0, v7);
}

void __33__VCCallSession_cleanupWRMClient__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopWRMClient");

}

- (void)reportWRMMetrics:(id *)a3
{
  -[WRMClient reportMetricsFaceTimeCalling:](self->vcWRMClient, "reportMetricsFaceTimeCalling:", a3);
}

- (void)reportImmediateWRMMetric:(int)a3 value:(unint64_t)a4
{
  if (self->_shouldReportWRMMetrics)
    -[WRMClient reportImmediateMetric:value:](self->vcWRMClient, "reportImmediateMetric:value:", *(_QWORD *)&a3, a4);
}

- (void)setWRMMetricConfig:(id *)a3
{
  RTPSetWRMMetricConfig((uint64_t)self->rtpHandle, (uint64_t *)a3);
}

- (void)setWRMNotification:(id *)a3
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v8;
  NSObject *v9;
  int var0;
  int var1;
  unint64_t var2;
  unint64_t var5;
  unint64_t var4;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  char *var3;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a3->var2 == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315650;
        v24 = v4;
        v25 = 2080;
        v26 = "-[VCCallSession setWRMNotification:]";
        v27 = 1024;
        v28 = 2849;
        v6 = "VCCallSession [%s] %s:%d HandoverReport: Ignoring iRAT notification because the reason for recommendation i"
             "s WiFi link going down";
LABEL_5:
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v23, 0x1Cu);
      }
    }
  }
  else if (-[VCCallInfo isVideoQualityNearDegraded](self->remoteCallInfo, "isVideoQualityNearDegraded") || a3->var1)
  {
    self->_isWRMNotificationPending = 0;
    *(_OWORD *)&self->_savedWRMNotification.applicationType = 0u;
    *(_OWORD *)self->_savedWRMNotification.linkTypeChangeReasonString = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[16] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[32] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[48] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[64] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[80] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[96] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[112] = 0u;
    *(_OWORD *)&self->_savedWRMNotification.linkBandwidthMin = 0u;
    VCConnectionManager_ProcessWRMNotification((uint64_t)self->connectionManager, a3);
  }
  else
  {
    self->_isWRMNotificationPending = 1;
    v15 = *(_OWORD *)&a3->var0;
    *(_OWORD *)self->_savedWRMNotification.linkTypeChangeReasonString = *(_OWORD *)a3->var3;
    *(_OWORD *)&self->_savedWRMNotification.applicationType = v15;
    v16 = *(_OWORD *)&a3->var3[16];
    v17 = *(_OWORD *)&a3->var3[32];
    v18 = *(_OWORD *)&a3->var3[48];
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[64] = *(_OWORD *)&a3->var3[64];
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[48] = v18;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[32] = v17;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[16] = v16;
    v19 = *(_OWORD *)&a3->var3[80];
    v20 = *(_OWORD *)&a3->var3[96];
    v21 = *(_OWORD *)&a3->var3[112];
    *(_OWORD *)&self->_savedWRMNotification.linkBandwidthMin = *(_OWORD *)&a3->var4;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[112] = v21;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[96] = v20;
    *(_OWORD *)&self->_savedWRMNotification.linkTypeChangeReasonString[80] = v19;
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v23 = 136315650;
        v24 = v22;
        v25 = 2080;
        v26 = "-[VCCallSession setWRMNotification:]";
        v27 = 1024;
        v28 = 2857;
        v6 = "VCCallSession [%s] %s:%d HandoverReport: Pending iRAT notification until video quality degrade";
        goto LABEL_5;
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      var0 = a3->var0;
      var1 = a3->var1;
      var2 = a3->var2;
      var4 = a3->var4;
      var5 = a3->var5;
      v23 = 136317186;
      v24 = v8;
      v25 = 2080;
      v26 = "-[VCCallSession setWRMNotification:]";
      v27 = 1024;
      v28 = 2865;
      v29 = 1024;
      v30 = var0;
      v31 = 1024;
      v32 = var1;
      v33 = 2048;
      v34 = var2;
      v35 = 2080;
      var3 = a3->var3;
      v37 = 2048;
      v38 = var5;
      v39 = 2048;
      v40 = var4;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Get iRAT notification for %u, %u, 0x%llx, %s, (%llu, %llu)", (uint8_t *)&v23, 0x50u);
    }
  }
}

- (void)setWRMCoexMetrics:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WRMCoexIsLocal"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315906;
      v11 = v6;
      v12 = 2080;
      v13 = "-[VCCallSession setWRMCoexMetrics:]";
      v14 = 1024;
      v15 = 2871;
      v16 = 2080;
      v17 = objc_msgSend((id)objc_msgSend(v5, "description"), "UTF8String");
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Get iRAT Coex Metrics %s", (uint8_t *)&v10, 0x26u);
    }
  }
  -[VCConnectionManager processWRMCoexMetrics:](self->connectionManager, "processWRMCoexMetrics:", v5);
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("WRMCoexIsLocal"));
  v9 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:", v8);
  -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v9, CFSTR("VCWRMCoexMetricsMessage"));

}

- (void)setPreWarmState:(BOOL)a3
{
  _BOOL4 v3;
  const __CFString *v5;

  v3 = a3;
  if (-[VCConnectionManager isPreWarmStateEnabled](self->connectionManager, "isPreWarmStateEnabled") != a3)
  {
    if (v3)
      v5 = CFSTR("VCWRMAlertStateEnabled");
    else
      v5 = CFSTR("VCWRMAlertStateDisabled");
    -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v5, CFSTR("VCWRMAlertStateUpdateMessageTopic"));
  }
  VCConnectionManager_SetPreWarmState((uint64_t)self->connectionManager, v3);
}

- (void)sendWRMStatusUpdate:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  int var2;
  unsigned int var3;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      var2 = a3->var2;
      var3 = a3->var3;
      v9 = 136316162;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCCallSession sendWRMStatusUpdate:]";
      v13 = 1024;
      v14 = 2891;
      v15 = 1024;
      v16 = var2;
      v17 = 1024;
      v18 = var3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Send iRAT status update for %u, %u", (uint8_t *)&v9, 0x28u);
    }
  }
  -[WRMClient sendStatusUpdateFaceTimeCalling:](self->vcWRMClient, "sendStatusUpdateFaceTimeCalling:", a3);
}

- (void)requestWRMNotification
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCCallSession requestWRMNotification]";
      v9 = 1024;
      v10 = 2896;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Request for the latest iRAT notification by resubscribing again", (uint8_t *)&v5, 0x1Cu);
    }
  }
  -[WRMClient requestNotificationFaceTimeCalling](self->vcWRMClient, "requestNotificationFaceTimeCalling");
}

- (BOOL)disconnect:(id)a3 didRemoteCancel:(BOOL)a4
{
  return -[VCCallSession disconnectInternal:disconnectError:didRemoteCancel:](self, "disconnectInternal:disconnectError:didRemoteCancel:", 0, a3, a4);
}

- (BOOL)cancel:(id)a3
{
  return -[VCCallSession disconnectInternal:disconnectError:didRemoteCancel:](self, "disconnectInternal:disconnectError:didRemoteCancel:", 1, a3, 0);
}

- (id)newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:(BOOL)a3 useSBR:(BOOL)a4 aacBlockSize:(unsigned int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  _BOOL8 v7;
  VCAudioRuleCollection *v9;
  VCMediaNegotiatorAudioConfiguration *v10;
  uint64_t v11;
  void *v12;
  UInt32 v14;
  uint64_t v15;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  v7 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  AUIOGetAUNumber(&v14);
  v9 = -[VCAudioRuleCollection initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:]([VCAudioRuleCollection alloc], "initWithPhoneContinuity:allowAudioSwitching:sbr:aacBlockSize:", self->_deviceRole != 0, v7, v6, v5);
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:].cold.1();
    }
    goto LABEL_11;
  }
  v10 = [VCMediaNegotiatorAudioConfiguration alloc];
  v11 = -[VCMediaNegotiatorAudioConfiguration initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:](v10, "initWithAllowAudioSwitching:allowAudioRecording:useSBR:ssrc:audioUnitNumber:audioRuleCollection:", v7, self->allowAudioRecording, v6, RTPGenerateSSRC(), v14, v9);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:].cold.2();
    }
LABEL_11:

    return 0;
  }
  v12 = (void *)v11;

  return v12;
}

- (id)newCameraConfiguration
{
  VCMediaNegotiatorVideoConfiguration *v2;
  id v3;
  void *v4;

  v2 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  if (!v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession newCameraConfiguration].cold.1();
    }
    goto LABEL_11;
  }
  -[VCMediaNegotiatorCommonConfiguration setSsrc:](v2, "setSsrc:", RTPGenerateSSRC());
  -[VCMediaNegotiatorVideoConfiguration setVideoRuleCollections:](v2, "setVideoRuleCollections:", +[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"));
  v3 = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:", 1);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession newCameraConfiguration].cold.2();
    }
LABEL_11:

    return 0;
  }
  v4 = v3;
  -[VCMediaNegotiatorVideoConfiguration setVideoFeatureStrings:](v2, "setVideoFeatureStrings:", v3);

  return v2;
}

- (id)newScreenConfigurationWithCameraConfiguration:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a3, "copy");
  if (v3)
  {
    objc_msgSend(v3, "setSsrc:", RTPGenerateSSRC());
    objc_msgSend(v3, "setVideoRuleCollections:", +[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession newScreenConfigurationWithCameraConfiguration:].cold.1();
  }
  return v3;
}

- (BOOL)addMediaConfigurationsToLocalConfiguration:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;

  v5 = -[VCCallSession newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:](self, "newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:", self->allowAudioSwitching, self->useSBR, self->aacBlockSize);
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession addMediaConfigurationsToLocalConfiguration:].cold.1();
    }
    goto LABEL_12;
  }
  v6 = -[VCCallSession newCameraConfiguration](self, "newCameraConfiguration");
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession addMediaConfigurationsToLocalConfiguration:].cold.2();
    }
LABEL_12:
    v9 = 0;
    v7 = 0;
LABEL_17:
    v10 = 0;
    goto LABEL_5;
  }
  v7 = v6;
  v8 = -[VCCallSession newScreenConfigurationWithCameraConfiguration:](self, "newScreenConfigurationWithCameraConfiguration:", v6);
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession addMediaConfigurationsToLocalConfiguration:].cold.3();
    }
    v9 = 0;
    goto LABEL_17;
  }
  v9 = v8;
  v10 = 1;
  objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v5, 1);
  objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v7, 2);
  objc_msgSend(a3, "setMediaConfiguration:forMediaType:", v9, 3);
LABEL_5:

  return v10;
}

- (id)newMediaBlobWithRemoteMediaBlob:(id)a3 localCallID:(unsigned int)a4 isLowBitrateCodecPreferred:(BOOL)a5
{
  int deviceRole;
  VCMediaNegotiatorLocalConfiguration *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  VCMediaNegotiator *v17;
  VCMediaNegotiator *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  const char *v22;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  deviceRole = self->_deviceRole;
  if ((deviceRole == 4 || deviceRole == 2) && a5)
  {
    self->preferredAudioCodec = 98;
    self->allowAudioSwitching = 0;
  }
  v10 = -[VCMediaNegotiatorLocalConfiguration initWithBitrateArbiter:]([VCMediaNegotiatorLocalConfiguration alloc], "initWithBitrateArbiter:", self->callSessionBitrateArbiter);
  if (!v10)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:].cold.1();
    }
    goto LABEL_39;
  }
  -[VCMediaNegotiatorLocalConfiguration setFaceTimeSwitches:](v10, "setFaceTimeSwitches:", -[VCSwitchManager localSwitches](self->_switchManager, "localSwitches"));
  -[VCMediaNegotiatorLocalConfiguration setPreferredAudioCodec:](v10, "setPreferredAudioCodec:", self->preferredAudioCodec);
  -[VCMediaNegotiatorLocalConfiguration setAllowRTCPFB:](v10, "setAllowRTCPFB:", self->isRTCPFBEnabled);
  -[VCMediaNegotiatorLocalConfiguration setIsCaller:](v10, "setIsCaller:", a3 == 0);
  -[VCMediaNegotiatorLocalConfiguration setCallLogFile:](v10, "setCallLogFile:", self->_callLogFile);
  -[VCMediaNegotiatorLocalConfiguration setSecureMessagingRequired:](v10, "setSecureMessagingRequired:", -[VCSwitchManager isLocalSwitchEnabled:](self->_switchManager, "isLocalSwitchEnabled:", 0x80000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v25 = 136315906;
      v26 = v11;
      v27 = 2080;
      v28 = "-[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]";
      v29 = 1024;
      v30 = 3028;
      v31 = 1024;
      v32 = -[VCMediaNegotiatorLocalConfiguration secureMessagingRequired](v10, "secureMessagingRequired");
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch before negotiation secureMessagingRequired %d", (uint8_t *)&v25, 0x22u);
    }
  }
  -[VCMediaNegotiatorLocalConfiguration setSIPDisabled:](v10, "setSIPDisabled:", -[VCSwitchManager isLocalSwitchEnabled:](self->_switchManager, "isLocalSwitchEnabled:", 0x100000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = -[VCMediaNegotiatorLocalConfiguration SIPDisabled](v10, "SIPDisabled");
      v25 = 136315906;
      v26 = v13;
      v27 = 2080;
      v28 = "-[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]";
      v29 = 1024;
      v30 = 3030;
      v31 = 1024;
      v32 = v15;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch before negotiation disableSIPEnabled %d", (uint8_t *)&v25, 0x22u);
    }
  }
  if (-[VCCallSession deviceRole](self, "deviceRole") == 2 || -[VCCallSession deviceRole](self, "deviceRole") == 4)
  {
    -[VCMediaNegotiatorLocalConfiguration setBasebandCodec:](v10, "setBasebandCodec:", self->basebandCodecType);
    -[VCMediaNegotiatorLocalConfiguration setBasebandCodecSampleRate:](v10, "setBasebandCodecSampleRate:", -[NSNumber unsignedIntValue](self->basebandCodecSampleRate, "unsignedIntValue"));
  }
  -[VCMediaNegotiatorLocalConfiguration setMediaRecorderVideoCodecs:](v10, "setMediaRecorderVideoCodecs:", -[VCVideoRuleCollectionsMediaRecorder mediaRecorderVideoCodecs](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderVideoCodecs"));
  -[VCMediaNegotiatorLocalConfiguration setMediaRecorderImageTypes:](v10, "setMediaRecorderImageTypes:", -[VCVideoRuleCollectionsMediaRecorder mediaRecorderImageTypes](+[VCVideoRuleCollectionsMediaRecorder sharedInstance](VCVideoRuleCollectionsMediaRecorder, "sharedInstance"), "mediaRecorderImageTypes"));
  if (-[VCSwitchManager isLocalSwitchEnabled:](self->_switchManager, "isLocalSwitchEnabled:", 0x40000))
    v16 = 2;
  else
    v16 = 1;
  -[VCMediaNegotiatorLocalConfiguration setMediaControlInfoVersion:](v10, "setMediaControlInfoVersion:", v16);
  -[VCMediaNegotiatorLocalConfiguration setMediaControlInfoFECFeedbackVersion:](v10, "setMediaControlInfoFECFeedbackVersion:", -[VCCallSession defaultMediaControlInfoFECFeedbackVersion](self, "defaultMediaControlInfoFECFeedbackVersion"));
  -[VCMediaNegotiatorLocalConfiguration setLinkProbingCapabilityVersion:](v10, "setLinkProbingCapabilityVersion:", -[VCConnectionManager linkProbingCapabilityVersion](self->connectionManager, "linkProbingCapabilityVersion"));
  -[VCCallSession addMediaConfigurationsToLocalConfiguration:](self, "addMediaConfigurationsToLocalConfiguration:", v10);
  v17 = -[VCMediaNegotiator initWithLocalSettings:]([VCMediaNegotiator alloc], "initWithLocalSettings:", v10);
  if (!v17)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:].cold.2();
    }
LABEL_39:
    v18 = 0;
LABEL_40:
    v19 = 0;
    goto LABEL_32;
  }
  v18 = v17;
  if (-[VCMediaNegotiatorLocalConfiguration isCaller](v10, "isCaller"))
  {
    v19 = -[VCMediaNegotiator negotiationData](v18, "negotiationData");
    if (!v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_40;
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
      v25 = 136315650;
      v26 = v20;
      v27 = 2080;
      v28 = "-[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]";
      v29 = 1024;
      v30 = 3049;
      v22 = "VCCallSession [%s] %s:%d Failed to create the invite media blob";
      goto LABEL_44;
    }
  }
  else
  {
    if (!a3)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        goto LABEL_40;
      v24 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_40;
      v25 = 136315650;
      v26 = v24;
      v27 = 2080;
      v28 = "-[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:]";
      v29 = 1024;
      v30 = 3052;
      v22 = "VCCallSession [%s] %s:%d Remote caller doesn't use media pre-negotiation";
LABEL_44:
      _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, 0x1Cu);
      goto LABEL_40;
    }
    if (!-[VCMediaNegotiator processRemoteNegotiationData:](v18, "processRemoteNegotiationData:", a3))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:].cold.4();
      }
      goto LABEL_40;
    }
    v19 = -[VCMediaNegotiator newResponseBlob](v18, "newResponseBlob");
    if (!v19)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:].cold.3();
      }
      goto LABEL_40;
    }
  }
  self->_mediaNegotiator = v18;
  v18 = 0;
LABEL_32:

  return v19;
}

- (void)reportOperatingMode
{
  int operatingMode;
  uint64_t v3;
  NSObject *v4;
  _BYTE buf[12];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  operatingMode = self->operatingMode;
  if (!operatingMode && (int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v3;
      v6 = 2080;
      v7 = "-[VCCallSession reportOperatingMode]";
      v8 = 1024;
      v9 = 3077;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Operating mode is INVALID", buf, 0x1Cu);
    }
  }
  *(_QWORD *)buf = 0;
  snprintf(buf, 8uLL, "%u", operatingMode);
  reportingLog();
}

- (BOOL)isLowBitrateCodecPreferred:(id)a3
{
  VCCallInfoBlob *v3;
  BOOL v4;

  if (!a3)
    return 0;
  v3 = (VCCallInfoBlob *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InviteDataCallInfoBlob"));
  if (v3)
    v3 = -[VCCallInfoBlob initWithData:]([VCCallInfoBlob alloc], "initWithData:", v3);
  v4 = -[NSString hasPrefix:](-[VCCallInfoBlob deviceType](v3, "deviceType"), "hasPrefix:", CFSTR("Watch"));

  return v4;
}

- (id)inviteDataForParticipantID:(id)a3 callID:(unsigned int *)a4 remoteInviteData:(id)a5 nonCellularCandidateTimeout:(double)a6 error:(id *)a7
{
  void *v13;
  uint64_t v14;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  uint64_t v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  v14 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("InviteDataSKEBlob"));
  -[VCCallSession lock](self, "lock");
  self->_inviteDataRequested = 1;
  -[VCCallSession initWithRelevantStorebagEntries](self, "initWithRelevantStorebagEntries");
  -[VCCallSession reportOperatingMode](self, "reportOperatingMode");
  v32 = CFSTR("transportSessionLegacyOptionNonCellularCandidateTimeout");
  v33[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  if (!-[VCTransportSession getConnectionSetupData:withOptions:error:](self->_transportSession, "getConnectionSetupData:withOptions:error:", &v21, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1), a7)|| *a7)
  {
LABEL_3:

    -[VCCallSession unlock](self, "unlock");
    return 0;
  }
  if (v21)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, CFSTR("InviteDataConnectionBlob"));
  -[VCCallInfo setParticipantID:](self->localCallInfo, "setParticipantID:", a3);
  self->state = 3;
  if (self->isGKVoiceChat || a5 && !v14)
    v16 = 0;
  else
    v16 = -[VCCallSession newSKEBlobWithRemoteSKEBlob:](self, "newSKEBlobWithRemoteSKEBlob:", v14);
  v17 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("InviteDataMediaBlob"));
  if (!a5 || v17)
  {
    v20 = -[VCCallSession newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:](self, "newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:", v17, *a4, -[VCCallSession isLowBitrateCodecPreferred:](self, "isLowBitrateCodecPreferred:", a5));
    if (!v20)
    {
      reportingSymptom();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCallSession inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:].cold.1();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[VCCallSession inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:].cold.2();
        }
      }
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a7, 32031, 200, 0, CFSTR("Failed to generate the media blob"), CFSTR("Media blob error"));

      goto LABEL_3;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v23 = v18;
        v24 = 2080;
        v25 = "-[VCCallSession inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:]";
        v26 = 1024;
        v27 = 3159;
        v28 = 2112;
        v29 = a5;
        v30 = 2112;
        v31 = 0;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d falls back to SDP. remoteInviteData = %@, remoteMediaBlob = %@", buf, 0x30u);
      }
    }
    v20 = 0;
  }
  -[VCCallSession addLocalCallInfoToInviteDictionary:](self, "addLocalCallInfoToInviteDictionary:", v13);
  -[VCCallSession unlock](self, "unlock");
  if (!v16)
  {
    -[VCCallInfo setSupportsSKEOptimization:](self->localCallInfo, "setSupportsSKEOptimization:", 0);
    if (!v20)
      return v13;
    goto LABEL_19;
  }
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("InviteDataSKEBlob"));

  if (v20)
  {
LABEL_19:
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("InviteDataMediaBlob"));

  }
  return v13;
}

- (void)addLocalCallInfoToInviteDictionary:(id)a3
{
  VCCallInfoBlob *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(VCCallInfoBlob);
  -[VCCallInfoBlob setCallID:](v5, "setCallID:", -[VCCallInfo callID](self->localCallInfo, "callID"));
  -[VCCallInfoBlob setClientVersion:](v5, "setClientVersion:", +[VCCallInfo getVCCurrentVersion](VCCallInfo, "getVCCurrentVersion"));
  memset(v21, 170, 20);
  VCGetDeviceModelString((char *)v21, 0x14uLL);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v21, 1);
  -[VCCallInfoBlob setDeviceType:](v5, "setDeviceType:", v6);
  -[VCCallInfo setDeviceType:](self->localCallInfo, "setDeviceType:", v6);
  memset(v20, 170, 20);
  VCGetSystemBuildVersionString((char *)v20, 20);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v20, 1);
  -[VCCallInfoBlob setOsVersion:](v5, "setOsVersion:", v7);
  -[VCCallInfo setOSVersion:](self->localCallInfo, "setOSVersion:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", "2055.64.1.1.2", 1);
  -[VCCallInfoBlob setFrameworkVersion:](v5, "setFrameworkVersion:", v8);
  -[VCCallInfo setFrameworkVersion:](self->localCallInfo, "setFrameworkVersion:", v8);
  objc_msgSend(a3, "setObject:forKeyedSubscript:", -[VCCallInfoBlob data](v5, "data"), CFSTR("InviteDataCallInfoBlob"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (objc_msgSend((id)-[VCCallInfoBlob formattedText](v5, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", ")))
      {
        v11 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](v5, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", ")), "description"), "UTF8String");
      }
      else
      {
        v11 = "<nil>";
      }
      v12 = 136315906;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCCallSession addLocalCallInfoToInviteDictionary:]";
      v16 = 1024;
      v17 = 3206;
      v18 = 2080;
      v19 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Local callInfoBlob = %s", (uint8_t *)&v12, 0x26u);
    }
  }

}

- (void)setRemoteCallInfoFromInviteDictionary:(id)a3
{
  void *v5;
  VCCallInfoBlob *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  unsigned int v13;
  _BYTE v14[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  unsigned int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InviteDataConnectionBlob"));
  v6 = (VCCallInfoBlob *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InviteDataCallInfoBlob"));
  if (v6)
    v6 = -[VCCallInfoBlob initWithData:]([VCCallInfoBlob alloc], "initWithData:", v6);
  v14[4] = 0;
  *(_DWORD *)v14 = +[VCCallInfo getVCCurrentVersion](VCCallInfo, "getVCCurrentVersion");
  if (v5)
  {
    objc_msgSend(v5, "bytes");
    objc_msgSend(v5, "length");
    ICEGetCallInfoForConnectionData();
    v7 = *(unsigned int *)&v14[1];
    goto LABEL_11;
  }
  if (v6)
  {
    v7 = -[VCCallInfoBlob callID](v6, "callID");
    v14[0] = -[VCCallInfoBlob clientVersion](v6, "clientVersion");
    goto LABEL_11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    v7 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 136315650;
    v16 = v8;
    v17 = 2080;
    v18 = "-[VCCallSession setRemoteCallInfoFromInviteDictionary:]";
    v19 = 1024;
    v20 = 3232;
    _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Both connectionBlob and callInfoBlob are nil. No callID and client version", buf, 0x1Cu);
  }
  v7 = 0;
LABEL_11:
  -[VCCallInfo setCallID:](self->remoteCallInfo, "setCallID:", v7);
  -[VCCallInfo setU8Version:](self->remoteCallInfo, "setU8Version:", v14[0]);
  if (objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InviteDataSKEBlob")))
    -[VCCallInfo setSupportsSKEOptimization:](self->remoteCallInfo, "setSupportsSKEOptimization:", 1);
  if (v6)
  {
    -[VCCallInfo setDeviceType:](self->remoteCallInfo, "setDeviceType:", -[VCCallInfoBlob deviceType](v6, "deviceType"));
    -[VCCallInfo setFrameworkVersion:](self->remoteCallInfo, "setFrameworkVersion:", -[VCCallInfoBlob frameworkVersion](v6, "frameworkVersion"));
    -[VCCallInfo setOSVersion:](self->remoteCallInfo, "setOSVersion:", -[VCCallInfoBlob osVersion](v6, "osVersion"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (objc_msgSend((id)-[VCCallInfoBlob formattedText](v6, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", ")))
        {
          v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[VCCallInfoBlob formattedText](v6, "formattedText"), "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(", ")), "description"), "UTF8String");
        }
        else
        {
          v12 = "<nil>";
        }
        v13 = -[VCCallInfo callID](self->localCallInfo, "callID");
        *(_DWORD *)buf = 136316162;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCCallSession setRemoteCallInfoFromInviteDictionary:]";
        v19 = 1024;
        v20 = 3247;
        v21 = 2080;
        v22 = v12;
        v23 = 1024;
        v24 = v13;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Remote callInfoBlob = %s localCallID = %d", buf, 0x2Cu);
      }
    }
  }

}

- (void)setShouldSendAudio:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 shouldSendAudio;

  v3 = a3;
  shouldSendAudio = self->shouldSendAudio;
  if (!self->shouldSendAudio && a3)
  {
    -[VCAudioTransmitter setInputMeter:](self->audioTransmitter, "setInputMeter:", 0);
    -[VCPacketBundler resetBuffer](-[VCAudioTransmitter audioBundler](self->audioTransmitter, "audioBundler"), "resetBuffer");
    -[VCPacketBundler resetBuffer](-[VCAudioTransmitter audioBundlerShortRED](self->audioTransmitter, "audioBundlerShortRED"), "resetBuffer");
    VCAudioReceiver_DiscardQueueExcess((uint64_t)self->audioReceiver);
    shouldSendAudio = self->shouldSendAudio;
  }
  if (shouldSendAudio != v3)
  {
    -[VCCallSessionDelegate session:isSendingAudio:error:](self->delegate, "session:isSendingAudio:error:", self, v3, 0);
    if (v3)
      -[VCCallSession stopPausedHeartbeat](self, "stopPausedHeartbeat");
    else
      -[VCCallSession startPausedHeartbeat](self, "startPausedHeartbeat");
  }
  self->shouldSendAudio = v3;
}

- (void)setPacketsPerBundle:(int)a3
{
  -[VCPacketBundler setPacketsPerBundle:](-[VCAudioTransmitter audioBundler](self->audioTransmitter, "audioBundler"), "setPacketsPerBundle:", *(_QWORD *)&a3);
}

- (int)packetsPerBundle
{
  return -[VCPacketBundler packetsPerBundle](-[VCAudioTransmitter audioBundler](self->audioTransmitter, "audioBundler"), "packetsPerBundle");
}

- (int)numBufferBytesAvailable
{
  return -[VCPacketBundler maxPacketSize](-[VCAudioTransmitter audioBundler](self->audioTransmitter, "audioBundler"), "maxPacketSize");
}

- (int)bundledPackets
{
  return -[VCPacketBundler bundledPackets](-[VCAudioTransmitter audioBundler](self->audioTransmitter, "audioBundler"), "bundledPackets");
}

- (void)setInputMeter:(unsigned __int8)a3
{
  -[VCAudioTransmitter setInputMeter:](self->audioTransmitter, "setInputMeter:", a3);
}

- (unsigned)inputMeter
{
  return -[VCAudioTransmitter inputMeter](self->audioTransmitter, "inputMeter");
}

- (unsigned)lastSentAudioSampleTime
{
  return -[VCAudioTransmitter lastSentAudioSampleTime](self->audioTransmitter, "lastSentAudioSampleTime");
}

- (void)setIsGKVoiceChat:(BOOL)a3
{
  self->isGKVoiceChat = a3;
  if (a3)
    self->allowAudioSwitching = 0;
}

- (BOOL)isGKVoiceChat
{
  return self->isGKVoiceChat;
}

- (void)processRemoteIPChange:(id)a3 callID:(unsigned int)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[VCTransportSession processRemoteIPChange:](self->_transportSession, "processRemoteIPChange:", a3);
}

- (BOOL)isCallOngoing
{
  return (self->state > 8uLL) | (0x7Eu >> self->state) & 1;
}

- (void)setSuspendAudio
{
  NSObject *audioQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  audioQueue = self->audioQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__VCCallSession_setSuspendAudio__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(audioQueue, v3);
}

uint64_t __32__VCCallSession_setSuspendAudio__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "setCallActive:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setConnectionPause:isLocalConnection:", 1, 1);
  AFRCSetAudioPaused(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), 1, 1);
  VCAudioReceiver_Reset(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224));
  objc_msgSend(*(id *)(a1 + 32), "startPausedHeartbeat");
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "sendMessage:withTopic:", CFSTR("VCAudioPaused"), CFSTR("AudioPauseStateMessageTopic"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "didChangeLocalVariablesForSession:");
}

- (void)setResumeAudio
{
  NSObject *audioQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  audioQueue = self->audioQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__VCCallSession_setResumeAudio__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(audioQueue, v3);
}

uint64_t __31__VCCallSession_setResumeAudio__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(a1 + 32), "stopPausedHeartbeat");
  AFRCSetAudioPaused(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), 0, 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setConnectionPause:isLocalConnection:", 1, 1);
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "setCallActive:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "sendMessage:withTopic:", CFSTR("VCAudioUnpaused"), CFSTR("AudioPauseStateMessageTopic"));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "didChangeLocalVariablesForSession:");
}

- (BOOL)setPauseAudio:(BOOL)a3 force:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 audioIsPaused;
  int64_t state;
  int deviceRole;
  uint64_t v14;
  id v15;
  NSObject *delegateNotificationQueue;
  uint64_t v17;
  NSObject *v18;
  int64_t v19;
  __int128 v20;
  VCCallInfo *remoteCallInfo;
  const __CFString *v22;
  NSString *v23;
  NSNumber *v24;
  _QWORD v26[6];
  _QWORD v27[5];
  BOOL v28;
  _QWORD v29[7];
  int v30;
  BOOL v31;
  uint8_t buf[48];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  uint64_t v39;

  v6 = a3;
  v39 = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      audioIsPaused = self->audioIsPaused;
      state = self->state;
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCCallSession setPauseAudio:force:error:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 3376;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = audioIsPaused;
      *(_WORD *)&buf[34] = 1024;
      *(_DWORD *)&buf[36] = v6;
      *(_WORD *)&buf[40] = 1024;
      *(_DWORD *)&buf[42] = state;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setPauseAudio (was %d is %d state is %d)", buf, 0x2Eu);
    }
  }
  -[VCCallSession lock](self, "lock");
  if (self->state != 1)
  {
    self->audioIsPaused = v6;
    -[VCTransportSession setCallActive:](self->_transportSession, "setCallActive:", v6 ^ 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->state;
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v17;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCallSession setPauseAudio:force:error:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 3382;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v19;
        _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setPauseAudio early return due to state == %d", buf, 0x22u);
      }
    }
    goto LABEL_14;
  }
  if (!a4 && (self->audioIsPaused == v6 || !-[VCCallSession isCallOngoing](self, "isCallOngoing")))
  {
LABEL_14:
    -[VCCallSession unlock](self, "unlock");

    -[VCCallSessionDelegate session:didPauseAudio:error:](self->delegate, "session:didPauseAudio:error:", self, self->audioIsPaused, 0);
    return 1;
  }
  deviceRole = self->_deviceRole;
  self->audioIsPaused = v6;
  -[VCTransportSession setCallActive:](self->_transportSession, "setCallActive:", v6 ^ 1);
  -[VCConnectionManager setConnectionPause:isLocalConnection:](self->connectionManager, "setConnectionPause:isLocalConnection:", v6, 1);
  AFRCSetAudioPaused((uint64_t)self->hAFRC, v6, 1);
  if (v6)
  {
    -[VCCallSession startPausedHeartbeat](self, "startPausedHeartbeat");
    if (self->isAudioRunning)
    {
      self->isAudioRunning = 0;
      -[VCCallSession unlock](self, "unlock");
      v14 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __43__VCCallSession_setPauseAudio_force_error___block_invoke_254;
      v27[3] = &unk_1E9E55C28;
      v27[4] = self;
      v28 = v6;
      v15 = (id)objc_msgSend(v27, "copy");
      delegateNotificationQueue = self->delegateNotificationQueue;
      v26[0] = v14;
      v26[1] = 3221225472;
      v26[2] = __43__VCCallSession_setPauseAudio_force_error___block_invoke_2;
      v26[3] = &unk_1E9E53548;
      v26[4] = self;
      v26[5] = v15;
      dispatch_async(delegateNotificationQueue, v26);
    }
    else
    {
      -[VCCallSession unlock](self, "unlock");
    }
    v22 = CFSTR("VCAudioPaused");
  }
  else
  {
    -[VCCallSession stopPausedHeartbeat](self, "stopPausedHeartbeat");
    VCAudioReceiver_Reset((uint64_t)self->audioReceiver);
    v38 = -1431655766;
    *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v36 = v20;
    v37 = v20;
    v34 = v20;
    v35 = v20;
    *(_OWORD *)&buf[32] = v20;
    v33 = v20;
    *(_OWORD *)buf = v20;
    *(_OWORD *)&buf[16] = v20;
    remoteCallInfo = self->remoteCallInfo;
    if (remoteCallInfo)
    {
      -[VCCallInfo audioVersionInfo:](remoteCallInfo, "audioVersionInfo:", self->isGKVoiceChat);
    }
    else
    {
      v38 = 0;
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v33 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    if (deviceRole == 1)
    {
      v23 = -[VCCallSession basebandCodecType](self, "basebandCodecType");
      v24 = -[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate");
    }
    else
    {
      v24 = 0;
      v23 = 0;
    }
    -[VCCallSession unlock](self, "unlock");
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __43__VCCallSession_setPauseAudio_force_error___block_invoke;
    v29[3] = &unk_1E9E55C00;
    v30 = deviceRole;
    v29[4] = self;
    v29[5] = v24;
    v29[6] = v23;
    v31 = v6;
    -[VCCallSessionDelegate session:startAudioWithFarEndVersionInfo:internalFrameFormat:completionHandler:](-[VCCallSession delegate](self, "delegate"), "session:startAudioWithFarEndVersionInfo:internalFrameFormat:completionHandler:", self, buf, &self->_vpioFormat, (id)objc_msgSend(v29, "copy"));
    v22 = CFSTR("VCAudioUnpaused");
  }
  -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v22, CFSTR("AudioPauseStateMessageTopic"));
  -[VCCallSessionDelegate didChangeLocalVariablesForSession:](self->delegate, "didChangeLocalVariablesForSession:", self);

  return 1;
}

uint64_t __43__VCCallSession_setPauseAudio_force_error___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    objc_msgSend(v5, "lock");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = 1;
    if (*(_DWORD *)(a1 + 56) == 1
      && (!objc_msgSend(*(id *)(a1 + 40), "isEqualToNumber:", objc_msgSend(*(id *)(a1 + 32), "basebandCodecSampleRate"))|| (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "basebandCodecType")) & 1) == 0))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "basebandCodecType"))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "basebandCodecSampleRate"))
        {
          v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
          v7 = *(void **)(a1 + 32);
          v8 = CStrToFourcc((char *)objc_msgSend((id)objc_msgSend(v7, "basebandCodecType"), "UTF8String"));
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "basebandCodecSampleRate"), "doubleValue");
          objc_msgSend(v6, "session:setRemoteBasebandCodecType:sampleRate:", v7, v8);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              __43__VCCallSession_setPauseAudio_force_error___block_invoke_cold_1();
          }
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "unlock");
  }
  else
  {
    objc_msgSend(v5, "disconnect:didRemoteCancel:", a3, 0);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didPauseAudio:error:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 60), a3);
}

uint64_t __43__VCCallSession_setPauseAudio_force_error___block_invoke_254(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didPauseAudio:error:");
}

uint64_t __43__VCCallSession_setPauseAudio_force_error___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "session:stopAudioWithCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)setPauseAudio:(BOOL)a3 error:(id *)a4
{
  return -[VCCallSession setPauseAudio:force:error:](self, "setPauseAudio:force:error:", a3, 0, a4);
}

- (void)setSuspendVideo
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *videoAsyncQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled");
      *(_DWORD *)buf = 136315906;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCCallSession setSuspendVideo]";
      v12 = 1024;
      v13 = 3476;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d isVideoEnabled=%d", buf, 0x22u);
    }
  }
  if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
  {
    videoAsyncQueue = self->videoAsyncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __32__VCCallSession_setSuspendVideo__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = self;
    dispatch_async(videoAsyncQueue, block);
  }
}

uint64_t __32__VCCallSession_setSuspendVideo__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "sendMessage:withTopic:", CFSTR("VCVideoPaused"), CFSTR("VideoPauseStateMessageTopic"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "didChangeLocalVariablesForSession:");
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

- (void)setResumeVideo
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *videoAsyncQueue;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled");
      *(_DWORD *)buf = 136315906;
      v9 = v3;
      v10 = 2080;
      v11 = "-[VCCallSession setResumeVideo]";
      v12 = 1024;
      v13 = 3489;
      v14 = 1024;
      v15 = v5;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d isVideoEnabled=%d", buf, 0x22u);
    }
  }
  if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
  {
    videoAsyncQueue = self->videoAsyncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__VCCallSession_setResumeVideo__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = self;
    dispatch_async(videoAsyncQueue, block);
  }
}

uint64_t __31__VCCallSession_setResumeVideo__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "sendMessage:withTopic:", CFSTR("VCVideoUnpaused"), CFSTR("VideoPauseStateMessageTopic"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "didChangeLocalVariablesForSession:");
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

- (BOOL)setPauseVideo:(BOOL)a3 force:(BOOL)a4 error:(id *)a5
{
  NSObject *videoAsyncQueue;
  _QWORD block[5];
  BOOL v8;
  BOOL v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  videoAsyncQueue = self->videoAsyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCCallSession_setPauseVideo_force_error___block_invoke;
  block[3] = &unk_1E9E52A50;
  block[4] = self;
  v8 = a4;
  v9 = a3;
  dispatch_async(videoAsyncQueue, block);
  return 1;
}

void __43__VCCallSession_setPauseVideo_force_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];
  __int16 v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 480);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__VCCallSession_setPauseVideo_force_error___block_invoke_2;
  block[3] = &unk_1E9E52A50;
  block[4] = v1;
  v4 = *(_WORD *)(a1 + 40);
  dispatch_sync(v2, block);
}

uint64_t __43__VCCallSession_setPauseVideo_force_error___block_invoke_2(uint64_t a1)
{
  int v2;
  int v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (*(_BYTE *)(a1 + 40))
  {
    v2 = *(unsigned __int8 *)(a1 + 41);
  }
  else
  {
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "videoIsPaused");
    v2 = *(unsigned __int8 *)(a1 + 41);
    if (v2 == v3)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didPauseVideo:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "videoIsPaused"), 0);
      return objc_msgSend(*(id *)(a1 + 32), "unlock");
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setVideoIsPaused:", v2 != 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "videoIsPaused");
  reportingLog();
  if (*(_BYTE *)(a1 + 41))
  {
    v6[0] = 0;
    objc_msgSend(*(id *)(a1 + 32), "stopVideo:error:", 1, v6);
  }
  else
  {
    v6[0] = 0;
    if ((objc_msgSend(*(id *)(a1 + 32), "startVideo:error:", 1, v6) & 1) == 0)
    {
      reportingSymptom();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          __43__VCCallSession_setPauseVideo_force_error___block_invoke_2_cold_1();
      }
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didPauseVideo:error:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "videoIsPaused"), 0);
  if (*(_BYTE *)(a1 + 41))
    v5 = CFSTR("VCVideoPaused");
  else
    v5 = CFSTR("VCVideoUnpaused");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "sendMessage:withTopic:", v5, CFSTR("VideoPauseStateMessageTopic"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "didChangeLocalVariablesForSession:");
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

- (BOOL)setPauseVideo:(BOOL)a3 error:(id *)a4
{
  return -[VCCallSession setPauseVideo:force:error:](self, "setPauseVideo:force:error:", a3, 0, a4);
}

- (void)processRelayRequestResponseDict:(id)a3 didOriginateRequest:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[VCCallSession lock](self, "lock");
  if (-[VCCallSession isCallOngoing](self, "isCallOngoing"))
  {
    -[VCCallSession unlock](self, "unlock");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[VCTransportSession processRelayRequestResponse:didOriginateRequest:](self->_transportSession, "processRelayRequestResponse:didOriginateRequest:", a3, v4);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession processRelayRequestResponseDict:didOriginateRequest:].cold.1();
    }
    -[VCCallSession unlock](self, "unlock");
  }
}

- (void)processRelayUpdateDict:(id)a3 didOriginateRequest:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  -[VCCallSession lock](self, "lock");
  if (!-[VCCallSession isCallOngoing](self, "isCallOngoing"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136316162;
        v10 = v7;
        v11 = 2080;
        v12 = "-[VCCallSession processRelayUpdateDict:didOriginateRequest:]";
        v13 = 1024;
        v14 = 3578;
        v15 = 1024;
        v16 = 3578;
        v17 = 1024;
        v18 = !-[VCCallSession isCallOngoing](self, "isCallOngoing");
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: processRelayUpdateDict bailing because (![self isCallOngoing] == %d)", (uint8_t *)&v9, 0x28u);
      }
    }
    goto LABEL_13;
  }
  if (!self->remoteCallInfo)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession processRelayUpdateDict:didOriginateRequest:].cold.1();
    }
LABEL_13:
    -[VCCallSession unlock](self, "unlock");
    return;
  }
  -[VCCallSession unlock](self, "unlock");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[VCTransportSession processRelayUpdate:didOriginateRequest:](self->_transportSession, "processRelayUpdate:didOriginateRequest:", a3, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[VCConnectionManager setRelayConnectionID:](self->connectionManager, "setRelayConnectionID:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("GKSRelayConnectionID")), "description"));
}

- (void)processCancelRelayRequest:(id)a3 didOriginateRequest:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v8 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
      else
        v8 = "<nil>";
      v9 = 136316162;
      v10 = v6;
      v11 = 2080;
      v12 = "-[VCCallSession processCancelRelayRequest:didOriginateRequest:]";
      v13 = 1024;
      v14 = 3599;
      v15 = 2080;
      v16 = v8;
      v17 = 1024;
      v18 = v4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d STUB:processCancelRelayRequest:%s, %d", (uint8_t *)&v9, 0x2Cu);
    }
  }
}

- (void)rcvdFirstRemoteFrame
{
  NSObject *global_queue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 7);
  -[VCCallSession cancelFirstRemoteFrameTimer](self, "cancelFirstRemoteFrameTimer");
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__VCCallSession_rcvdFirstRemoteFrame__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

uint64_t __37__VCCallSession_rcvdFirstRemoteFrame__block_invoke(uint64_t a1)
{
  reportingRemoteFrameSize();
  reportingGenericEvent();
  return objc_msgSend(*(id *)(a1 + 32), "logPerfTimings");
}

- (void)sendARPLData:(id)a3 toCallID:(unsigned int)a4
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136316162;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCCallSession sendARPLData:toCallID:]";
      v12 = 1024;
      v13 = 3617;
      v14 = 2080;
      v15 = objc_msgSend(a3, "bytes");
      v16 = 1024;
      v17 = a4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d >>>>> Sending ARPL data <%s> with callID %d (in VCCallSession) <<<<<", (uint8_t *)&v8, 0x2Cu);
    }
  }
}

- (void)sendData:(id)a3 messageType:(unsigned int)a4 encrypted:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v25 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "length"))
  {
    if (-[VCCallSession isSIPEnabled](self, "isSIPEnabled"))
    {
      -[VCSecureDataChannel sendData:messageType:encrypted:](self->secureDataChannel, "sendData:messageType:encrypted:", a3, v6, v5);
    }
    else
    {
      v9 = -[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:](self->secureControlChannel, "sendReliableMessageAndWait:withTopic:participantID:", a3, CFSTR("VCExternalClientDataTopic"), 0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = "FAILURE";
          v13 = 136316418;
          v14 = v10;
          v15 = 2080;
          v16 = "-[VCCallSession sendData:messageType:encrypted:]";
          if (v9)
            v12 = "SUCCESS";
          v17 = 1024;
          v18 = 3642;
          v19 = 2080;
          v20 = v12;
          v21 = 1024;
          v22 = 0;
          v23 = 2112;
          v24 = a3;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sendReliableMessageAndWait result was %s, participantID=%d, data=%@", (uint8_t *)&v13, 0x36u);
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession sendData:messageType:encrypted:].cold.1();
  }
}

- (id)remoteParticipantID
{
  return -[VCCallInfo participantID](self->remoteCallInfo, "participantID");
}

- (id)localParticipantID
{
  return -[VCCallInfo participantID](self->localCallInfo, "participantID");
}

- (void)localCameraSwitchedFrom:(int)a3 to:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  reportingLog();
  -[TimingCollection stopTimingForKey:](self->cameraTimers, "stopTimingForKey:", v5);
  -[TimingCollection startTimingForKey:](self->cameraTimers, "startTimingForKey:", v4);
}

- (void)getFrontCaptureTime:(float *)a3 backCaptureTime:(float *)a4
{
  double v7;
  double v8;

  -[TimingCollection stopTimingForKey:](self->cameraTimers, "stopTimingForKey:", -[VCCallSessionDelegate currentCameraID](self->delegate, "currentCameraID"));
  -[TimingCollection totalTimeForKey:](self->cameraTimers, "totalTimeForKey:", 0);
  *(float *)&v7 = v7;
  *a3 = *(float *)&v7;
  -[TimingCollection totalTimeForKey:](self->cameraTimers, "totalTimeForKey:", 1);
  *(float *)&v8 = v8;
  *a4 = *(float *)&v8;
}

- (int)negotiatedReceivingFramerate
{
  VCMediaNegotiator *mediaNegotiator;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int IsInterfaceOnCellularForActiveConnectionWithQuality;
  int v8;
  unsigned __int8 v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  float v17;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation")
    || -[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly")
    || !-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      LODWORD(v5) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!(_DWORD)v5)
        return v5;
      -[VCCallSession negotiatedReceivingFramerate].cold.1();
    }
    LODWORD(v5) = 0;
    return v5;
  }
  mediaNegotiator = self->_mediaNegotiator;
  if (self->operatingMode == 4)
    v4 = -[VCMediaNegotiatorBase negotiatedScreenSettings](mediaNegotiator, "negotiatedScreenSettings");
  else
    v4 = -[VCMediaNegotiatorBase negotiatedVideoSettings](mediaNegotiator, "negotiatedVideoSettings");
  v6 = (void *)v4;
  IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  v8 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
  v20 = 0u;
  v21 = 0u;
  if (IsInterfaceOnCellularForActiveConnectionWithQuality | v8)
    v9 = 2;
  else
    v9 = 1;
  v22 = 0uLL;
  v23 = 0uLL;
  v10 = (void *)objc_msgSend((id)objc_msgSend(v6, "videoRuleCollections"), "supportedPayloads");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
LABEL_17:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
      if (objc_msgSend((id)objc_msgSend(v6, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", v9, objc_msgSend(v15, "unsignedIntValue"), 2))
      {
        break;
      }
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
        if (v12)
          goto LABEL_17;
        goto LABEL_23;
      }
    }
  }
  else
  {
LABEL_23:
    v15 = 0;
  }
  v16 = -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](-[VCMediaNegotiatorBase negotiatedVideoSettings](self->_mediaNegotiator, "negotiatedVideoSettings"), "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", v9, objc_msgSend(v15, "intValue"), 2);
  v5 = objc_msgSend(v16, "count");
  if (v5)
  {
    objc_msgSend((id)objc_msgSend(v16, "objectAtIndex:", 0), "fRate");
    LODWORD(v5) = (int)v17;
  }
  return v5;
}

- (id)callMetadata
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  float v19;
  float v20;
  unint64_t v21;
  unint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  v22 = 0;
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->callSessionBitrate);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v3, CFSTR("SessionBitRate"), 0);
  if ((self->initialSentBytes & 0x8000000000000000) == 0 && !VTP_GetSendRecvStats(&v22, &v21))
  {
    v5 = v22 - self->initialSentBytes + 4096;
    v21 = v21 - self->initialReceivedBytes + 4096;
    v22 = v5;
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:");
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("SessionSentBytes"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("SessionReceivedBytes"));
  }
  v19 = NAN;
  v20 = NAN;
  -[VCCallSession getFrontCaptureTime:backCaptureTime:](self, "getFrontCaptureTime:backCaptureTime:", &v20, &v19);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v24 = v9;
      v25 = 2080;
      v26 = "-[VCCallSession callMetadata]";
      v27 = 1024;
      v28 = 3725;
      v29 = 2048;
      v30 = v20;
      v31 = 2048;
      v32 = v19;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d session:didStopWithDelay:error: frontCaptureTime: %f backCaptureTime %f", buf, 0x30u);
    }
  }
  *(float *)&v8 = v20;
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  *(float *)&v12 = v19;
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("FrontCaptureTime"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("BackCaptureTime"));
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", self->awdCallNonce);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("SessionDataNonce"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCCallSession primaryConnectionType](self, "primaryConnectionType")), CFSTR("connType"));
  v15 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", VCConnection_IsLocalOnCellular((uint64_t)v15));
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", VCConnection_IsRemoteOnCellular((uint64_t)v15));
  if (v15)
    CFRelease(v15);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("LocalUsesCell"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("RemoteUsesCell"));
  return v4;
}

- (BOOL)pullAudioSamples:(opaqueVCAudioBufferList *)a3 rtpTimestamp:(unsigned int *)a4 lastReceivedAudioTime:(double *)a5 padding:(char *)a6 paddingLength:(char *)a7 silence:(int *)a8
{
  uint64_t v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  unint64_t v14;
  _QWORD v16[2];
  uint64_t v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v16[0] = a6;
  if (a7)
    v10 = *a7;
  else
    v10 = 0;
  v16[1] = v10;
  v17 = v10;
  v11 = VCAudioReceiver_PullAudioSamples((uint64_t)-[VCCallSession audioReceiver](self, "audioReceiver"), (uint64_t)a3, a4, a5, (uint64_t)v16, a8, &v18);
  v12 = v11;
  if (a7 && v11)
    *a7 = v17;
  AFRCSetReceiveQueueSize((uint64_t)self->hAFRC, v18);
  v13 = self->awdTime + 1;
  self->awdTime = v13;
  HIDWORD(v14) = 652835029 * v13;
  LODWORD(v14) = 652835029 * v13;
  if ((v14 >> 2) <= 0x83126E)
    VCAudioReceiver_ReportAWDMetrics(&self->audioReceiver->var0.var0);
  return v12;
}

- (BOOL)isSKEOptimizationEnabled
{
  _BOOL4 v3;

  v3 = -[VCCallInfo supportsSKEOptimization](self->remoteCallInfo, "supportsSKEOptimization");
  if (v3)
    LOBYTE(v3) = -[VCCallInfo supportsSKEOptimization](self->localCallInfo, "supportsSKEOptimization");
  return v3;
}

- (unsigned)primaryConnectionType
{
  void *v2;
  unsigned int v3;

  v2 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  v3 = objc_msgSend(v2, "type");
  if (v2)
    CFRelease(v2);
  return v3;
}

- (void)updateRelayedCallType:(unsigned __int8)a3
{
  uint64_t v3;
  const __CFString *v5;
  _QWORD v6[2];

  v3 = a3;
  v6[1] = *MEMORY[0x1E0C80C00];
  -[VCCallSession lock](self, "lock");
  self->_relayedCallType = v3;
  if ((v3 - 10) <= 0xF6u && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession updateRelayedCallType:].cold.1();
  }
  v5 = CFSTR("RelayedCT");
  v6[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3), "stringValue");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  reportingGenericEvent();
  -[VCCallSession unlock](self, "unlock");
}

- (void)setCapabilities:(id)a3
{
  VCCapabilities *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  BOOL v9;
  VCCapabilities *caps;

  -[VCCallSession lock](self, "lock");
  caps = self->caps;
  v5 = (VCCapabilities *)a3;
  self->caps = v5;
  if (self->state == 1)
  {
    v6 = -[VCCapabilities isAudioEnabled](v5, "isAudioEnabled");
    if (v6 != -[VCCapabilities isAudioEnabled](caps, "isAudioEnabled")
      || (v7 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"),
          v7 != -[VCCapabilities isVideoEnabled](caps, "isVideoEnabled")))
    {
      -[VCCallSession sendCallingModeMessage](self, "sendCallingModeMessage");
    }
    v8 = -[VCCapabilities isAudioEnabled](caps, "isAudioEnabled");
    if (v8 != -[VCCapabilities isAudioEnabled](self->caps, "isAudioEnabled"))
      -[VCCallSession enableAudio:](self, "enableAudio:", objc_msgSend(a3, "isAudioEnabled"));
  }
  if (self->caps)
    v9 = caps == 0;
  else
    v9 = 1;
  if (!v9)
  {
    -[VCCapabilities setPreferredAudioCodec:](self->caps, "setPreferredAudioCodec:", -[VCCapabilities preferredAudioCodec](caps, "preferredAudioCodec"));
    -[VCCapabilities setActualAudioCodec:](self->caps, "setActualAudioCodec:", -[VCCapabilities actualAudioCodec](caps, "actualAudioCodec"));
    -[VCCapabilities setPreferredVideoCodec:](self->caps, "setPreferredVideoCodec:", -[VCCapabilities preferredVideoCodec](caps, "preferredVideoCodec"));
    -[VCCapabilities setActualVideoCodec:](self->caps, "setActualVideoCodec:", -[VCCapabilities actualVideoCodec](caps, "actualVideoCodec"));
  }
  -[VCCallSession updateDeviceRole:](self, "updateDeviceRole:", objc_msgSend(a3, "deviceRole"));
  -[VCCallSession unlock](self, "unlock");

}

- (VCCapabilities)capabilities
{
  return self->caps;
}

- (opaqueRTCReporting)reportingAgent
{
  return self->reportingAgent;
}

- (int)audioTierNetworkBitrate
{
  return -[VCAudioTier networkBitrate](-[VCAudioTransmitter currentAudioTier](self->audioTransmitter, "currentAudioTier"), "networkBitrate");
}

- (int)audioTierAudioCodecBitrate
{
  return -[VCAudioTier audioCodecBitrate](-[VCAudioTransmitter currentAudioTier](self->audioTransmitter, "currentAudioTier"), "audioCodecBitrate");
}

- (int)audioTierPacketsPerBundle
{
  return -[VCAudioTier packetsPerBundle](-[VCAudioTransmitter currentAudioTier](self->audioTransmitter, "currentAudioTier"), "packetsPerBundle");
}

- (int)audioTierRedNumPayloads
{
  return -[VCAudioTier redNumPayloads](-[VCAudioTransmitter currentAudioTier](self->audioTransmitter, "currentAudioTier"), "redNumPayloads");
}

- (int)audioTierPayload
{
  return -[VCAudioPayloadConfig payload](-[VCAudioTier payloadConfig](-[VCAudioTransmitter currentAudioTier](self->audioTransmitter, "currentAudioTier"), "payloadConfig"), "payload");
}

- (NSDictionary)dtxMetrics
{
  return -[VCAudioTransmitter dtxMetrics](self->audioTransmitter, "dtxMetrics");
}

- (unsigned)currentAudioCap
{
  unsigned int v3;
  unsigned int v4;
  unsigned int callSessionBitrate;

  v3 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->callSessionBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", -[VCConnectionManager getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:", 1, 1));
  v4 = -[VCBitrateArbiter maxAllowedAudioOnlyBitrateForConnection:](self->callSessionBitrateArbiter, "maxAllowedAudioOnlyBitrateForConnection:", -[VCConnectionManager getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:", 1, 0));
  if (v4)
    callSessionBitrate = v4;
  else
    callSessionBitrate = 40;
  if (v3 < callSessionBitrate)
    callSessionBitrate = v3;
  if (callSessionBitrate >= self->callSessionBitrate)
    callSessionBitrate = self->callSessionBitrate;
  return 1000 * callSessionBitrate;
}

- (void)setSessionConferenceState:(unsigned int)a3 callID:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v4 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v12 = v6;
      v13 = 2080;
      v14 = "-[VCCallSession setSessionConferenceState:callID:]";
      v15 = 1024;
      v16 = 3878;
      v17 = 1024;
      v18 = v4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setSessionConferenceState, %d", buf, 0x22u);
    }
  }
  if (v4 < 3)
  {
    reportingLog();
    VideoTransmitter_SetWindowState((uint64_t)self->hVideoTransmitter, 1, v4);
    v8 = objc_alloc(MEMORY[0x1E0C99D80]);
    v9 = (void *)objc_msgSend(v8, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4), CFSTR("VCWindowState"), 0);
    v10 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:", v9);
    -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v10, CFSTR("VCWindowStateChange"));

  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession setSessionConferenceState:callID:].cold.1();
  }
}

- (void)setSessionConferenceVisualRectangle:(CGRect)a3 callID:(unsigned int)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v31 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      v18 = v9;
      v19 = 2080;
      v20 = "-[VCCallSession setSessionConferenceVisualRectangle:callID:]";
      v21 = 1024;
      v22 = 3901;
      v23 = 2048;
      v24 = x;
      v25 = 2048;
      v26 = y;
      v27 = 2048;
      v28 = width;
      v29 = 2048;
      v30 = height;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setSessionConferenceVisualRectangle: (%g, %g), %gx%g", buf, 0x44u);
    }
  }
  reportingVisualRectangle();
  VideoTransmitter_SetVisualRectangle(x, y, width, height, (uint64_t)self->hVideoTransmitter, 1);
  v11 = objc_alloc(MEMORY[0x1E0C99D80]);
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", x);
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
  v15 = (void *)objc_msgSend(v11, "initWithObjectsAndKeys:", v12, CFSTR("VCWindowOriginX"), v13, CFSTR("VCWindowOriginY"), v14, CFSTR("VCWindowWidth"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height), CFSTR("VCWindowHeight"), 0);
  v16 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:", v15);
  -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v16, CFSTR("VCWindowStateChange"));

}

- (void)setPeerProtocolVersion:(unsigned int)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  self->_peerProtocolVersion = a3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCCallSession setPeerProtocolVersion:]";
      v10 = 1024;
      v11 = 3920;
      v12 = 1024;
      v13 = a3;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d PeerProtocolVersion set to %d", (uint8_t *)&v6, 0x22u);
    }
  }
}

- (void)messageVCMomentsRequest:(id)a3
{
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int ShowFrameRTPTimestamp;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")), "intValue") == 1)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", VideoReceiver_GetShowFrameRTPTimestamp()), CFSTR("vcMomentsRequestTimestamp"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315906;
        v10 = v6;
        v11 = 2080;
        v12 = "-[VCCallSession messageVCMomentsRequest:]";
        v13 = 1024;
        v14 = 3929;
        v15 = 1024;
        ShowFrameRTPTimestamp = VideoReceiver_GetShowFrameRTPTimestamp();
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCMoments in VCCallSession requesting remote video frame for RTP timestamp %d", (uint8_t *)&v9, 0x22u);
      }
    }
  }
  -[VCCallSession reportingMomentsWithRequest:](self, "reportingMomentsWithRequest:", a3);
  v8 = -[VCSessionMessaging newPackedMessageFromMomentsDictionary:](self->messaging, "newPackedMessageFromMomentsDictionary:", v5);
  -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v8, CFSTR("VCMomentsStateMessageTopic"));

}

- (void)reportSymptom:(unsigned int)a3
{
  reportingSymptom();
}

- (void)reportingMomentsWithRequest:(id)a3
{
  id v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  const __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *CTGreenTeaOsLogHandle;
  NSObject *v13;
  uint8_t v14[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestState")), "intValue");
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsMediaType")), "intValue");
  v8 = -[VCCallSession remoteParticipantID](self, "remoteParticipantID");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6), CFSTR("VCMRState"));
  if (v8)
    v9 = v8;
  else
    v9 = &stru_1E9E58EE0;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("VCMRRecipientUUID"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7), CFSTR("VCMRMediaType"));
  if (v6 == 4)
  {
    v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestDidSucceed")), "BOOLValue");
    v11 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsFileSize")), "intValue");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11), CFSTR("VCMRFileSize"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10), CFSTR("VCMRFinishDidSucceed"));
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("vcMomentsRequestMode")), "unsignedIntValue") == 2)
    {
      ct_green_tea_logger_create_static();
      CTGreenTeaOsLogHandle = getCTGreenTeaOsLogHandle();
      if (CTGreenTeaOsLogHandle)
      {
        v13 = CTGreenTeaOsLogHandle;
        if (os_log_type_enabled(CTGreenTeaOsLogHandle, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_INFO, "<FaceTime>[FaceTime][com.apple.AVConference]:Taken FaceTime Live Photo", v14, 2u);
        }
      }
    }
  }
  reportingMediaRecorderEvents();

}

- (BOOL)isVideoRunning
{
  if (self->state == 1)
    return !-[VCCallSession videoIsPaused](self, "videoIsPaused");
  else
    return 0;
}

- (void)triggerInterfaceChange
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[VCTransportSession triggerInterfaceChange](self->_transportSession, "triggerInterfaceChange");
}

- (void)notifyDelegateActiveConnectionDidChange
{
  uint64_t v3;
  const void *v4;
  const __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  NSObject *delegateNotificationQueue;
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  v3 = VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  if (v3)
  {
    v4 = (const void *)v3;
    if (VCConnection_IsRelay(v3))
      v5 = CFSTR("RLY-");
    else
      v5 = CFSTR("P2P-");
    if (-[VCConnectionManager isDuplicationEnabled](self->connectionManager, "isDuplicationEnabled"))
      v6 = CFSTR("D-");
    else
      v6 = CFSTR("P-");
    v7 = -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v5);
    delegateNotificationQueue = self->delegateNotificationQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__VCCallSession_notifyDelegateActiveConnectionDidChange__block_invoke;
    v9[3] = &unk_1E9E527D0;
    v9[4] = self;
    v9[5] = v7;
    v9[6] = v4;
    dispatch_async(delegateNotificationQueue, v9);
    CFRelease(v4);
  }
}

uint64_t __56__VCCallSession_notifyDelegateActiveConnectionDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:connectionDidChangeWithLocalInterfaceType:remoteInterfaceType:callID:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", objc_msgSend(*(id *)(a1 + 48), "localInterfaceTypeString")), objc_msgSend(*(id *)(a1 + 40), "stringByAppendingString:", objc_msgSend(*(id *)(a1 + 48), "remoteInterfaceTypeString")), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID"));
}

- (void)handleNewConnectionSetup:(id)a3 isInitialConnection:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  int operatingMode;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  -[VCCallSession updateMaxPktLength](self, "updateMaxPktLength");
  -[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:](self, "updateLastReceivedPacketWithTimestamp:packetType:", 8, micro());
  -[VCCallSession lock](self, "lock");
  if (VCConnection_IsLocalOnCellular((uint64_t)a3))
    AFRCAddBBDump();
  if ((VCConnection_Priority((uint64_t)a3) & 0xFFFFFFFE) != 2
    && VCConnection_IsRemoteOnCellular((uint64_t)a3))
  {
    v7 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", a3, 0, VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode), self->_currentEncodeRule);
    if (!(_DWORD)v7)
    {
      operatingMode = self->operatingMode;
      if (operatingMode == 4 || operatingMode == 1)
        v7 = 100;
      else
        v7 = 40;
    }
    -[VCCallInfo setCellBandwidth:](self->remoteCallInfo, "setCellBandwidth:", v7);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v12 = -[VCCallInfo cellBandwidth](self->remoteCallInfo, "cellBandwidth");
        v13 = VCConnection_RemoteCellTech((uint64_t)a3);
        v14 = self->operatingMode;
        v15 = 136316418;
        v16 = v10;
        v17 = 2080;
        v18 = "-[VCCallSession handleNewConnectionSetup:isInitialConnection:]";
        v19 = 1024;
        v20 = 4042;
        v21 = 1024;
        v22 = v12;
        v23 = 1024;
        v24 = v13;
        v25 = 1024;
        v26 = v14;
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d connectionEstablishedCallback: initialize remote cell bitrate cap to %u, cell tech %d, operation mode %d", (uint8_t *)&v15, 0x2Eu);
      }
    }
  }
  if (v4)
  {
    -[VCCallSession handleFirstConnectionSetup:](self, "handleFirstConnectionSetup:", a3);
    -[VCCallSession updateCachedConnectionState](self, "updateCachedConnectionState");
    -[VCCallSession unlock](self, "unlock");
    -[VCCallSession verifyFaceTimeClassicNotOnNewerBuilds](self, "verifyFaceTimeClassicNotOnNewerBuilds");
  }
  else
  {
    -[VCCallSession updateCachedConnectionState](self, "updateCachedConnectionState");
    -[VCCallSession unlock](self, "unlock");
  }
}

- (void)handleFirstConnectionSetup:(id)a3
{
  int64_t sipState;
  uint64_t v6;
  NSObject *v7;
  double ICETimeout;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSMutableArray *negotiatedAudioPayloads;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  const void *v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  int v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  _QWORD v43[12];
  _BYTE v44[128];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE buf[12];
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  -[VCCallInfo setIsPreLionOS:](self->remoteCallInfo, "setIsPreLionOS:", -[VCTransportSession isRemoteOSPreLion](self->_transportSession, "isRemoteOSPreLion"));
  if (self->didAttemptSIPInvite
    || !-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation")
    || (*(_QWORD *)buf = 0,
        -[VCCallSession startMediaWithPreNegotiatedSettings:](self, "startMediaWithPreNegotiatedSettings:", buf)))
  {
    sipState = self->_sipState;
    if (sipState == 6)
    {
      -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 1);
      ICETimeout = GKSConnectivitySettings_GetICETimeout();
      if (ICETimeout <= 0.0)
      {
        LODWORD(ICETimeout) = 1114636288;
      }
      else
      {
        ICETimeout = GKSConnectivitySettings_GetICETimeout();
        *(float *)&ICETimeout = (float)(int)ICETimeout;
      }
      -[VCCallSession setupCalleeSIPStartTimeout:](self, "setupCalleeSIPStartTimeout:", ICETimeout);
    }
    else if (sipState == 5 && !self->didAttemptSIPInvite)
    {
      -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 1);
      objc_msgSend(MEMORY[0x1E0CB3978], "detachNewThreadSelector:toTarget:withObject:", sel_sipConnectThreadProc_, self, 0);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v6;
          v50 = 2080;
          v51 = "-[VCCallSession handleFirstConnectionSetup:]";
          v52 = 1024;
          v53 = 4075;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: sipConnectThreadProc", buf, 0x1Cu);
        }
      }
      self->didAttemptSIPInvite = 1;
    }
    VCConnection_IsLocalOnCellular((uint64_t)a3);
    VCConnection_LocalCellTech((uint64_t)a3);
    v9 = CelltechToStr();
    v10 = objc_msgSend(a3, "type");
    if ((v10 - 1) >= 6)
    {
      v11 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v12;
          v50 = 2080;
          v51 = "reportingStatusCodeForConnectionType";
          v52 = 1024;
          v53 = 10905;
          v54 = 1024;
          v55 = v11;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Invalid connection type %d", buf, 0x22u);
        }
      }
    }
    if (self->_isRedEnabled)
    {
      v14 = 1;
    }
    else
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      negotiatedAudioPayloads = self->negotiatedAudioPayloads;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](negotiatedAudioPayloads, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v46 != v18)
              objc_enumerationMutation(negotiatedAudioPayloads);
            if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "config"), "payload") == 108)
            {
              v14 = 2;
              goto LABEL_32;
            }
          }
          v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](negotiatedAudioPayloads, "countByEnumeratingWithState:objects:count:", &v45, v44, 16);
          v14 = 0;
          if (v17)
            continue;
          break;
        }
      }
      else
      {
        v14 = 0;
      }
    }
LABEL_32:
    v20 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
    v21 = VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode);
    v22 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v20, 1, v21, self->_currentEncodeRule);
    v23 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v20, 0, v21, self->_currentEncodeRule);
    if (v20)
      CFRelease(v20);
    CFAllocatorGetDefault();
    v24 = (const __CFString *)CTRegistrationCopyOperatorName();
    v25 = (const __CFString *)CFPreferencesCopyAppValue(CFSTR("cannedReplay"), CFSTR("com.apple.VideoConference"));
    v26 = v25;
    v27 = CFSTR("Unavailable");
    if (v24)
      v27 = v24;
    v32 = CFSTR("Carrier");
    v33 = CFSTR("CannedRelay");
    v28 = CFSTR("missing");
    if (v25)
      v28 = v25;
    v43[0] = v27;
    v43[1] = v28;
    v43[2] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9, v32, v33, CFSTR("Interface"));
    v34 = CFSTR("Upgrade");
    v29 = objc_msgSend(a3, "type");
    v30 = CFSTR("No");
    if (v29 == 6)
      v30 = CFSTR("Yes");
    v43[3] = v30;
    v35 = CFSTR("RedState");
    v43[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
    v36 = CFSTR("WAState");
    v43[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[VCWifiAssistManager wifiAssistState](+[VCWifiAssistManager sharedInstance](VCWifiAssistManager, "sharedInstance"), "wifiAssistState"));
    v37 = CFSTR("REMBUILD");
    if (-[VCCallInfo OSVersion](self->remoteCallInfo, "OSVersion"))
      v31 = -[VCCallInfo OSVersion](self->remoteCallInfo, "OSVersion");
    else
      v31 = CFSTR("unknown");
    v43[6] = v31;
    v38 = CFSTR("localBitrateCap");
    v43[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v22 * 1000.0);
    v39 = CFSTR("remoteBitrateCap");
    v43[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v23 * 1000.0);
    v40 = CFSTR("DeviceRole");
    v43[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deviceRole);
    v41 = CFSTR("MicMode");
    v43[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[VCCallSession getCurrentMicMode](self, "getCurrentMicMode"));
    v42 = CFSTR("SpatialAudioSupported");
    v43[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[VCHardwareSettings isSpatialAudioSupported](VCHardwareSettings, "isSpatialAudioSupported"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v32, 12);
    reportingGenericEvent();
    if (v24)
      CFRelease(v24);
    if (v26)
      CFRelease(v26);
    reportingStartTimer();
    -[VCCallSession logConnectionSuccess](self, "logConnectionSuccess");
    if (!self->secureDataChannel && !-[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled"))
      -[VCCallSession setupSecureDataChannel](self, "setupSecureDataChannel");
  }
  else
  {
    -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", *(_QWORD *)buf, 0);
  }
}

- (void)updateCachedConnectionState
{
  NSObject *cellTechQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  cellTechQueue = self->cellTechQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__VCCallSession_updateCachedConnectionState__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(cellTechQueue, v3);
}

uint64_t __44__VCCallSession_updateCachedConnectionState__block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1523) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "isConnectedOnIPv6ForActiveConnectionWithQuality:", 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1521) = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 1, 1);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1522) = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 1, 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setCellTech:remoteCellular:isIPV6:audioCap:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1521), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1522), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1523), objc_msgSend(*(id *)(a1 + 32), "currentAudioCap"));
}

- (void)handleKeyExchangeCompleted
{
  void *v3;

  v3 = (void *)MEMORY[0x1DF088A10](self, a2);
  -[VCCallSession setupSecureDataChannel](self, "setupSecureDataChannel");
  objc_autoreleasePoolPop(v3);
}

- (void)setupSecureDataChannel
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCCallSession setupSecureDataChannel]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_42(&dword_1D8A54000, v0, (uint64_t)v0, "VCCallSession [%s] %s:%d Setting up secureDataChannel with dataChannelSharedSecret %@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)redundancyController:(id)a3 redundancyVectorDidChange:(id *)a4
{
  if (a4->var0)
    VideoTransmitter_SetFECLevelPerGroupSizeVector((uint64_t)self->hVideoTransmitter, a4->var0, (char *)a4->var1);
}

- (void)redundancyController:(id)a3 redundancyPercentageDidChange:(unsigned int)a4
{
  float v4;

  v4 = VCRedundancyControllerVideo_ConvertRedundancyPercentageToRatio(a4);
  VideoTransmitter_SetFECRatio(v4);
}

- (void)handleThermalPressureNotification:(id)a3
{
  uint64_t v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("VCVideoCaptureServer_NotificationKeyThermalPressureLevel")), "intValue");
  v4 = CFSTR("Thermal");
  v5[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  reportingGenericEvent();
}

- (int64_t)getCurrentMicMode
{
  return AVControlCenterMicrophoneModesModuleGetActiveMicrophoneModeForBundleID();
}

- (void)handleMicModeNotification:(id)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0C8A208]);
  if (v5)
  {
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.facetime")))
    {
      v6 = -[VCCallSession getCurrentMicMode](self, "getCurrentMicMode");
      v7 = CFSTR("MicMode");
      v8[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      reportingGenericEvent();
    }
  }
}

- (void)registerForReportingNotifications
{
  void *v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_handleThermalPressureNotification_, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleMicModeNotification_, *MEMORY[0x1E0C8A1F8], 0);
}

- (void)deregisterForReportingNotifications
{
  void *v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("VCVideoCaptureServer_NotificationNameThermalPressureLevel"), 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C8A1F8], 0);
}

- (tagHANDLE)rtpHandle
{
  return self->rtpHandle;
}

- (void)setRtpHandle:(tagHANDLE *)a3
{
  self->rtpHandle = a3;
}

- (int64_t)connectionChangeState
{
  return self->connectionChangeState;
}

- (void)setConnectionChangeState:(int64_t)a3
{
  self->connectionChangeState = a3;
}

- (VCConnectionManager)connectionManager
{
  return (VCConnectionManager *)objc_getProperty(self, a2, 80, 1);
}

- (void)setConnectionManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (unsigned)maxPacketLength
{
  return self->maxPacketLength;
}

- (void)setMaxPacketLength:(unsigned __int16)a3
{
  self->maxPacketLength = a3;
}

- (int64_t)state
{
  return self->state;
}

- (void)setState:(int64_t)a3
{
  self->state = a3;
}

- (int64_t)videoPayload
{
  return self->videoPayload;
}

- (void)setVideoPayload:(int64_t)a3
{
  self->videoPayload = a3;
}

- (int64_t)sampleRate
{
  return self->sampleRate;
}

- (void)setSampleRate:(int64_t)a3
{
  self->sampleRate = a3;
}

- (VCCallSessionDelegate)delegate
{
  return (VCCallSessionDelegate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (BOOL)isAudioRunning
{
  return self->isAudioRunning;
}

- (BOOL)isWaitingForICEResult
{
  return self->isWaitingForICEResult;
}

- (void)setIsWaitingForICEResult:(BOOL)a3
{
  self->isWaitingForICEResult = a3;
}

- (BOOL)receivedSIPInvite
{
  return self->receivedSIPInvite;
}

- (void)setReceivedSIPInvite:(BOOL)a3
{
  self->receivedSIPInvite = a3;
}

- (tagHANDLE)hMediaQueue
{
  return self->hMediaQueue;
}

- (void)setHMediaQueue:(tagHANDLE *)a3
{
  self->hMediaQueue = a3;
}

- (tagHANDLE)hAFRC
{
  return self->hAFRC;
}

- (void)setHAFRC:(tagHANDLE *)a3
{
  self->hAFRC = a3;
}

- (GKRingBuffer)ringBuf
{
  return self->ringBuf;
}

- (void)setRingBuf:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (unsigned)lastReceived
{
  return self->lastReceived;
}

- (void)setLastReceived:(unsigned int)a3
{
  self->lastReceived = a3;
}

- (int)preferredAudioCodec
{
  return self->preferredAudioCodec;
}

- (void)setPreferredAudioCodec:(int)a3
{
  self->preferredAudioCodec = a3;
}

- (BOOL)useControlByte
{
  return self->useControlByte;
}

- (void)setUseControlByte:(BOOL)a3
{
  self->useControlByte = a3;
}

- (BOOL)useUEP
{
  return self->useUEP;
}

- (void)setUseUEP:(BOOL)a3
{
  self->useUEP = a3;
}

- (int)bandwidthUpstream
{
  return self->bandwidthUpstream;
}

- (void)setBandwidthUpstream:(int)a3
{
  self->bandwidthUpstream = a3;
}

- (int)bandwidthDownstream
{
  return self->bandwidthDownstream;
}

- (void)setBandwidthDownstream:(int)a3
{
  self->bandwidthDownstream = a3;
}

- (NSArray)mutedPeers
{
  return self->mutedPeers;
}

- (void)setMutedPeers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 512);
}

- (BOOL)audioIsPaused
{
  return self->audioIsPaused;
}

- (int)natType
{
  return self->natType;
}

- (void)setNatType:(int)a3
{
  self->natType = a3;
}

- (NSString)peerCN
{
  return self->peerCN;
}

- (void)setPeerCN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (double)packetLossRate
{
  return self->packetLossRate;
}

- (void)setPacketLossRate:(double)a3
{
  self->packetLossRate = a3;
}

- (double)packetLossRate5Secs
{
  return self->packetLossRate5Secs;
}

- (void)setPacketLossRate5Secs:(double)a3
{
  self->packetLossRate5Secs = a3;
}

- (double)networkConditionsTimeoutInSeconds
{
  return self->networkConditionsTimeoutInSeconds;
}

- (void)setNetworkConditionsTimeoutInSeconds:(double)a3
{
  self->networkConditionsTimeoutInSeconds = a3;
}

- (double)roundTripTime
{
  return self->roundTripTime;
}

- (void)setRoundTripTime:(double)a3
{
  self->roundTripTime = a3;
}

- (int)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (void)setSignalStrengthBars:(int)a3
{
  self->_signalStrengthBars = a3;
}

- (int)signalStrengthDisplayBars
{
  return self->_signalStrengthDisplayBars;
}

- (void)setSignalStrengthDisplayBars:(int)a3
{
  self->_signalStrengthDisplayBars = a3;
}

- (int)signalStrengthMaxDisplayBars
{
  return self->_signalStrengthMaxDisplayBars;
}

- (void)setSignalStrengthMaxDisplayBars:(int)a3
{
  self->_signalStrengthMaxDisplayBars = a3;
}

- (float)packetLateAndMissingRatio
{
  return self->packetLateAndMissingRatio;
}

- (void)setPacketLateAndMissingRatio:(float)a3
{
  self->packetLateAndMissingRatio = a3;
}

- (NSString)sessionID
{
  return self->sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 760);
}

- (BOOL)shouldTimeoutPackets
{
  return self->shouldTimeoutPackets;
}

- (void)setShouldTimeoutPackets:(BOOL)a3
{
  self->shouldTimeoutPackets = a3;
}

- (BOOL)useRateControl
{
  return self->useRateControl;
}

- (BOOL)isRTCPFBEnabled
{
  return self->isRTCPFBEnabled;
}

- (void)setIsRTCPFBEnabled:(BOOL)a3
{
  self->isRTCPFBEnabled = a3;
}

- (BOOL)shouldSendAudio
{
  return self->shouldSendAudio;
}

- (BOOL)isStarted
{
  return self->isStarted;
}

- (void)setIsStarted:(BOOL)a3
{
  self->isStarted = a3;
}

- (VCImageAttributeRules)imageAttributeRules
{
  return self->imageAttributeRules;
}

- (void)setImageAttributeRules:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (VideoAttributes)remoteVideoAttributes
{
  return self->remoteVideoAttributes;
}

- (void)setRemoteVideoAttributes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1304);
}

- (tagVCAudioReceiver)audioReceiver
{
  return self->audioReceiver;
}

- (unsigned)remoteFrameWidth
{
  return self->remoteFrameWidth;
}

- (void)setRemoteFrameWidth:(unsigned int)a3
{
  self->remoteFrameWidth = a3;
}

- (unsigned)remoteFrameHeight
{
  return self->remoteFrameHeight;
}

- (void)setRemoteFrameHeight:(unsigned int)a3
{
  self->remoteFrameHeight = a3;
}

- (int)operatingMode
{
  return self->operatingMode;
}

- (BOOL)isRemoteMediaStalled
{
  return self->isRemoteMediaStalled;
}

- (NSNumber)basebandCodecSampleRate
{
  return self->basebandCodecSampleRate;
}

- (void)setBasebandCodecSampleRate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1456);
}

- (NSString)basebandCodecType
{
  return self->basebandCodecType;
}

- (void)setBasebandCodecType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1448);
}

- (int)deviceRole
{
  return self->_deviceRole;
}

- (void)setDeviceRole:(int)a3
{
  self->_deviceRole = a3;
}

- (int64_t)sipState
{
  return self->_sipState;
}

- (void)setSipState:(int64_t)a3
{
  self->_sipState = a3;
}

- (BOOL)didSend200OK
{
  return self->didSend200OK;
}

- (void)setDidSend200OK:(BOOL)a3
{
  self->didSend200OK = a3;
}

- (VCCallInfo)localCallInfo
{
  return self->localCallInfo;
}

- (NSString)peerReportingID
{
  return self->peerReportingID;
}

- (void)setPeerReportingID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1536);
}

- (double)lastDecodedFrameTime
{
  return self->_lastDecodedFrameTime;
}

- (void)setLastDecodedFrameTime:(double)a3
{
  self->_lastDecodedFrameTime = a3;
}

- (VCAudioCaptionsDelegate)captionsDelegate
{
  return (VCAudioCaptionsDelegate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCaptionsDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSData)srtpKeyBytes
{
  return (NSData *)objc_getProperty(self, a2, 1088, 1);
}

- (void)setSrtpKeyBytes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1088);
}

- (void)vcSecureDataChannel:(id)a3 messageType:(unsigned int)a4 receivedData:(id)a5
{
  NSObject *delegateNotificationQueue;
  _QWORD v6[6];
  unsigned int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a4 == 2)
  {
    VCCaptionsReceiver_ProcessCaptionsData((uint64_t)self->_captionsReceiver, a5);
  }
  else
  {
    delegateNotificationQueue = self->delegateNotificationQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__VCCallSession_VCSecureDataChannelDelegate__vcSecureDataChannel_messageType_receivedData___block_invoke;
    v6[3] = &unk_1E9E522D8;
    v6[4] = self;
    v6[5] = a5;
    v7 = a4;
    dispatch_async(delegateNotificationQueue, v6);
  }
}

uint64_t __91__VCCallSession_VCSecureDataChannelDelegate__vcSecureDataChannel_messageType_receivedData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didReceiveData:messageType:withCallID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID"));
}

- (void)telephonyInterface:(id)a3 vocoderInfoChangedToType:(id)a4 sampleRate:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136316162;
      v11 = v8;
      v12 = 2080;
      v13 = "-[VCCallSession(VCTelephonyInterfaceDelegate) telephonyInterface:vocoderInfoChangedToType:sampleRate:]";
      v14 = 1024;
      v15 = 4303;
      v16 = 2080;
      v17 = objc_msgSend(a4, "UTF8String");
      v18 = 1024;
      v19 = objc_msgSend(a5, "unsignedIntValue");
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d vocoderInfoChangedToType:%s sampleRate:%u", (uint8_t *)&v10, 0x2Cu);
    }
  }
  -[VCCallSession lock](self, "lock");
  if (!-[NSString isEqualToString:](-[VCCallSession basebandCodecType](self, "basebandCodecType"), "isEqualToString:", a4)|| !-[NSNumber isEqualToNumber:](-[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"), "isEqualToNumber:", a5))
  {
    -[VCCallSession setBasebandCodecSampleRate:](self, "setBasebandCodecSampleRate:", a5);
    -[VCCallSession setBasebandCodecType:](self, "setBasebandCodecType:", a4);
  }
  if (self->state == 1)
    -[VCCallSession sendBasebandCodecMessage](self, "sendBasebandCodecMessage");
  -[VCCallSession unlock](self, "unlock");
}

- (void)wcmSetCallConfig:(unsigned int)a3 interferenceLevel:(unsigned int)a4
{
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  tagHANDLE *hAFRC;
  AVCRateController *rateController;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v5 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315650;
      v12 = v7;
      v13 = 2080;
      v14 = "-[VCCallSession(WCMClientDelegate) wcmSetCallConfig:interferenceLevel:]";
      v15 = 1024;
      v16 = 4322;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WCM: wcmSetCallConfig callback.", (uint8_t *)&v11, 0x1Cu);
    }
  }
  hAFRC = self->hAFRC;
  if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL)
    AFRCProcessWCMSetCallConfig((uint64_t)hAFRC, v5, a4);
  rateController = self->_rateController;
  if (rateController)
    -[AVCRateController setTargetBitrateCap:](rateController, "setTargetBitrateCap:", v5);
}

- (void)wcmGetCallConfig:(unsigned int *)a3 targetBitrate:(unsigned int *)a4
{
  uint64_t v7;
  NSObject *v8;
  AVCRateController *rateController;
  _BYTE v10[22];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 136315650;
      *(_QWORD *)&v10[4] = v7;
      *(_WORD *)&v10[12] = 2080;
      *(_QWORD *)&v10[14] = "-[VCCallSession(WCMClientDelegate) wcmGetCallConfig:targetBitrate:]";
      v11 = 1024;
      v12 = 4333;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WCM: wcmGetCallConfig callback.", v10, 0x1Cu);
    }
  }
  rateController = self->_rateController;
  if (rateController)
  {
    -[AVCRateController configuration](rateController, "configuration", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
    if (a3)
      *a3 = *(_DWORD *)&v10[12];
    if (a4)
      *a4 = -[AVCRateController targetBitrate](self->_rateController, "targetBitrate");
  }
  else
  {
    AFRCProcessWCMGetCallConfig((uint64_t)self->hAFRC, a3, a4);
  }
}

- (int)sipCallback:(int)a3 callID:(unsigned int)a4 msgIn:(const char *)a5 msgOut:(char *)a6 optional:(void *)a7 confIndex:(int *)a8
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  NSObject *v16;
  const void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  int64_t state;
  __int128 v24;
  int v25;
  id v26;
  int v27;
  __CFData *secretKey;
  uint8_t *v29;
  uint64_t v30;
  NSObject *v31;
  double v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  int64_t sipState;
  uint64_t v39;
  NSObject *v40;
  double v41;
  uint64_t v42;
  NSObject *v43;
  int v44;
  uint64_t v45;
  NSObject *v46;
  double v47;
  double v48;
  uint64_t v49;
  NSObject *v50;
  int v51;
  uint64_t v52;
  NSObject *v53;
  double v54;
  uint64_t v55;
  NSObject *videoQueue;
  _QWORD block[7];
  _QWORD v58[5];
  uint64_t v59;
  _BYTE v60[24];
  int v61;
  __int16 v62;
  double v63;
  __int16 v64;
  int v65;
  uint8_t buf[56];
  uint64_t v67;

  v12 = *(_QWORD *)&a4;
  v13 = *(_QWORD *)&a3;
  v67 = *MEMORY[0x1E0C80C00];
  -[VCCallSession updateLastReceivedPacket:packetType:](self, "updateLastReceivedPacket:packetType:", 1, 2);
  switch((int)v13)
  {
    case 0:
    case 3:
    case 5:
    case 8:
      if (-[VCCallInfo callID](self->localCallInfo, "callID") == (_DWORD)v12)
      {
        if (a5 && a7)
          reportingLog();
        -[VCCallSession shutdownVoiceChatFromRemoteSIPSignal:withReason:](self, "shutdownVoiceChatFromRemoteSIPSignal:withReason:", v13, a5);
      }
      return 0;
    case 1:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 4442;
          _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE", buf, 0x1Cu);
        }
      }
      v20 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 2);
      if (-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
      {
        -[VCCallSession lock](self, "lock");
        self->_sipState = 1;
        -[VCCallSession cancelConnectionTimeoutTimer](self, "cancelConnectionTimeoutTimer");
        -[VCCallSession unlock](self, "unlock");
        objc_msgSend(v20, "drain");
        return 0;
      }
      -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 3);
      -[VCCallSession lock](self, "lock");
      if (-[VCCallSession state](self, "state") != 6
        || -[VCCallInfo callID](self->localCallInfo, "callID") != (_DWORD)v12)
      {
        -[VCCallSession unlock](self, "unlock");
        -[TimingCollection removeTimingForKey:](self->perfTimers, "removeTimingForKey:", 3);
        -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", 0, 0);
        objc_msgSend(v20, "drain");
        return 3;
      }
      VCAudioReceiver_UpdateCellTech((uint64_t)self->audioReceiver, -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1), -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0));
      if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
        VideoReceiver_CellTechChanged();
      VCAudioReceiver_Start(&self->audioReceiver->var0.var0, v33);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3052000000;
      *(_QWORD *)&buf[24] = __Block_byref_object_copy__15;
      *(_QWORD *)&buf[32] = __Block_byref_object_dispose__15;
      *(_QWORD *)&buf[40] = 0;
      *(int64x2_t *)&self->state = vdupq_n_s64(1uLL);
      -[VCCallSession sendBasebandCodecMessage](self, "sendBasebandCodecMessage");
      -[VCCallSession cancelConnectionTimeoutTimer](self, "cancelConnectionTimeoutTimer");
      -[VCCallSession unlock](self, "unlock");
      if (!-[VCCallSession startMediaQueue:](self, "startMediaQueue:", *(_QWORD *)&buf[8] + 40))
        goto LABEL_106;
      -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 3);
      if (-[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v34 = VRTraceErrorLogLevelToCSTR();
          v35 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v60 = 136315650;
            *(_QWORD *)&v60[4] = v34;
            *(_WORD *)&v60[12] = 2080;
            *(_QWORD *)&v60[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
            *(_WORD *)&v60[22] = 1024;
            v61 = 4489;
            _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: use DTLS-SRTP is enabled...", v60, 0x1Cu);
          }
        }
        if (self->srtpKeyBytes)
        {
          -[VCCallSession processSIPMessage:msgOut:optional:confIndex:](self, "processSIPMessage:msgOut:optional:confIndex:", "DTLS-SRTP", 0, &self->srtpKeyBytes, a8);
          goto LABEL_87;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:].cold.1();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:].cold.2();
          }
        }
        +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", *(_QWORD *)&buf[8] + 40, 32018, 205, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 4497), CFSTR("Video Insecure"), CFSTR("Encryption key setup did not complete successfully"));
LABEL_106:
        -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0);
        objc_msgSend(v20, "drain");
LABEL_107:
        v27 = 3;
        goto LABEL_108;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v39 = VRTraceErrorLogLevelToCSTR();
        v40 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v60 = 136315650;
          *(_QWORD *)&v60[4] = v39;
          *(_WORD *)&v60[12] = 2080;
          *(_QWORD *)&v60[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
          *(_WORD *)&v60[22] = 1024;
          v61 = 4506;
          _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: DTLS-SRTP is not enabled...", v60, 0x1Cu);
        }
      }
      if (-[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled"))
      {
        -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 4);
        v59 = 0x403E000000000000;
        v41 = micro();
        if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v42 = VRTraceErrorLogLevelToCSTR();
            v43 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v60 = 136315650;
              *(_QWORD *)&v60[4] = v42;
              *(_WORD *)&v60[12] = 2080;
              *(_QWORD *)&v60[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
              *(_WORD *)&v60[22] = 1024;
              v61 = 4516;
              _os_log_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: Need to wait for SRTP to init... (video)", v60, 0x1Cu);
            }
          }
          v44 = SRTPWaitUseEncryption((uint64_t)self->rtpVideo, (double *)&v59);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v45 = VRTraceErrorLogLevelToCSTR();
            v46 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v47 = micro();
              *(_DWORD *)v60 = 136316162;
              *(_QWORD *)&v60[4] = v45;
              *(_WORD *)&v60[12] = 2080;
              *(_QWORD *)&v60[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
              *(_WORD *)&v60[22] = 1024;
              v61 = 4518;
              v62 = 2048;
              v63 = v47 - v41;
              v64 = 1024;
              v65 = v44;
              _os_log_impl(&dword_1D8A54000, v46, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: end wait SRTP @ %.3f seconds (%08X)", v60, 0x2Cu);
            }
          }
          if (v44 < 0)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if ((VRTraceIsOSFaultDisabled() & 1) != 0)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:].cold.5();
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
              {
                -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:].cold.6();
              }
            }
            +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", *(_QWORD *)&buf[8] + 40, 32018, 205, v44, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 4525), CFSTR("Video Insecure"), CFSTR("Encryption key setup did not complete successfully"));
            -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0);
            objc_msgSend(v20, "drain");
            goto LABEL_107;
          }
        }
        v59 = 0x403E000000000000;
        v48 = micro();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v49 = VRTraceErrorLogLevelToCSTR();
          v50 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v60 = 136315650;
            *(_QWORD *)&v60[4] = v49;
            *(_WORD *)&v60[12] = 2080;
            *(_QWORD *)&v60[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
            *(_WORD *)&v60[22] = 1024;
            v61 = 4538;
            _os_log_impl(&dword_1D8A54000, v50, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: Need to wait for SRTP to init... (audio)", v60, 0x1Cu);
          }
        }
        v51 = SRTPWaitUseEncryption((uint64_t)self->rtpHandle, (double *)&v59);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v52 = VRTraceErrorLogLevelToCSTR();
          v53 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v54 = micro();
            *(_DWORD *)v60 = 136316162;
            *(_QWORD *)&v60[4] = v52;
            *(_WORD *)&v60[12] = 2080;
            *(_QWORD *)&v60[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
            *(_WORD *)&v60[22] = 1024;
            v61 = 4540;
            v62 = 2048;
            v63 = v54 - v48;
            v64 = 1024;
            v65 = v51;
            _os_log_impl(&dword_1D8A54000, v53, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPCONNECTEDCONFERENCE: end wait SRTP @ %.3f seconds (%08X)", v60, 0x2Cu);
          }
        }
        if (v51 < 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
          {
            VRTraceErrorLogLevelToCSTR();
            if ((VRTraceIsOSFaultDisabled() & 1) != 0)
            {
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:].cold.3();
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
            {
              -[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:].cold.4();
            }
          }
          +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", *(_QWORD *)&buf[8] + 40, 32018, 206, v51, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 4547), CFSTR("Audio Insecure"), CFSTR("Encryption key setup did not complete successfully"));
          -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0);
          objc_msgSend(v20, "drain");
          goto LABEL_107;
        }
        -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 4);
      }
LABEL_87:
      -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 5);
      v55 = MEMORY[0x1E0C809B0];
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __79__VCCallSession_Callbacks__sipCallback_callID_msgIn_msgOut_optional_confIndex___block_invoke;
      v58[3] = &unk_1E9E53C48;
      v58[4] = self;
      -[VCCallSession startAudioWithCompletionHandler:](self, "startAudioWithCompletionHandler:", (id)objc_msgSend(v58, "copy"));
      -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 6);
      -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 7);
      -[VCCallSession setUpFirstRemoteFrameTimer](self, "setUpFirstRemoteFrameTimer");
      *(_QWORD *)v60 = 0;
      *(_QWORD *)&v60[8] = v60;
      *(_QWORD *)&v60[16] = 0x2020000000;
      LOBYTE(v61) = 1;
      videoQueue = self->videoQueue;
      block[0] = v55;
      block[1] = 3221225472;
      block[2] = __79__VCCallSession_Callbacks__sipCallback_callID_msgIn_msgOut_optional_confIndex___block_invoke_2;
      block[3] = &unk_1E9E55C68;
      block[4] = self;
      block[5] = v60;
      block[6] = buf;
      dispatch_sync(videoQueue, block);
      -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 6);
      if (*(_BYTE *)(*(_QWORD *)&v60[8] + 24))
      {
        if (-[VCCallInfo videoIsPaused](self->localCallInfo, "videoIsPaused"))
          -[VCCallSession setPauseVideo:force:error:](self, "setPauseVideo:force:error:", 1, 1, 0);
        -[VCCallSession lock](self, "lock");
        -[VCCallSession enableSessionHealthMonitor](self, "enableSessionHealthMonitor");
        -[VCCallSession unlock](self, "unlock");
        -[VCCallSession handlePendingPrimaryConnectionChange](self, "handlePendingPrimaryConnectionChange");
        if (-[VCCallSession shouldNotifyDelegateDidStartBeforeAudioSetup](self, "shouldNotifyDelegateDidStartBeforeAudioSetup"))
        {
          -[VCCallSession notifyDelegateSessionStarted](self, "notifyDelegateSessionStarted");
        }
        objc_msgSend(v20, "drain");
        v27 = 0;
      }
      else
      {
        reportingSymptom();
        -[TimingCollection removeTimingForKey:](self->perfTimers, "removeTimingForKey:", 7);
        -[VCCallSession cancelFirstRemoteFrameTimer](self, "cancelFirstRemoteFrameTimer");
        -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0);
        objc_msgSend(v20, "drain");
        v27 = 3;
      }
      _Block_object_dispose(v60, 8);
LABEL_108:
      _Block_object_dispose(buf, 8);
      return v27;
    case 2:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          state = self->state;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 4370;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = state == 6;
          *(_WORD *)&buf[34] = 1024;
          *(_DWORD *)&buf[36] = state;
          _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPINCOMINGCONFERENCE state == GKVoiceChatServiceStateCalleeAttemptingToConnect = %d, %d", buf, 0x28u);
        }
      }
      if (!-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
      {
        *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&buf[27] = v24;
        *(_OWORD *)buf = v24;
        *(_OWORD *)&buf[16] = v24;
        SIPGetRemoteInfo((uint64_t)self->hSIP, -[VCCallInfo callID](self->localCallInfo, "callID"), (char *)buf, 0);
        -[VCCallInfo setUserAgent:](self->remoteCallInfo, "setUserAgent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buf));
      }
      -[VCCallSession lock](self, "lock");
      -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 1);
      -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 2);
      if (-[VCCallInfo usesInitialFECImplementation](self->remoteCallInfo, "usesInitialFECImplementation"))
        v25 = 1;
      else
        v25 = 2;
      self->fecMode = v25;
      v26 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
      self->receivedSIPInvite = 1;
      *(_QWORD *)v60 = 0;
      if (self->_sipState != 6)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v36 = VRTraceErrorLogLevelToCSTR();
          v37 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            sipState = self->_sipState;
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 4405;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = sipState;
            _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPINCOMING: WE ARE BUSY BUSY (state = %d)", buf, 0x22u);
          }
        }
        v27 = 3;
        goto LABEL_61;
      }
      if (!-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
      {
        v27 = -[VCCallSession handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:](self, "handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:", v12, a5, a6, a7, a8, v60);
        if (v27)
        {
LABEL_61:
          -[VCCallSession unlock](self, "unlock");
          -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", *(_QWORD *)v60, 0);

          return v27;
        }
      }
      self->didSend200OK = 1;
      -[VCCallSession unlock](self, "unlock");

      if (!-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation")
        && -[VCCallSession isSKEOptimizationEnabled](self, "isSKEOptimizationEnabled"))
      {
        LODWORD(v59) = 1;
        *(_QWORD *)buf = 0;
        -[VCCallSession lock](self, "lock");
        secretKey = self->secretKey;
        if (secretKey)
        {
          *(_QWORD *)buf = CFRetain(secretKey);
          v29 = buf;
        }
        else
        {
          v29 = 0;
        }
        -[VCCallSession unlock](self, "unlock");
        -[VCCallSession setupEncryptionWithKey:confIndex:](self, "setupEncryptionWithKey:confIndex:", v29, &v59);
        if (*(_QWORD *)buf)
          CFRelease(*(CFTypeRef *)buf);
      }
      return 0;
    case 6:
      -[VCCallSession processSIPMessage:msgOut:optional:confIndex:](self, "processSIPMessage:msgOut:optional:confIndex:", a5, a6, a7, a8);
      return 0;
    case 15:
      if (-[VCCallInfo callID](self->localCallInfo, "callID") != (_DWORD)v12)
        return 0;
      v27 = 0;
      if (!a5 || !a7 || !a8)
        return v27;
      reportingLog();
      return 0;
    case 16:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
          *(_WORD *)&buf[22] = 1024;
          *(_DWORD *)&buf[24] = 4661;
          *(_WORD *)&buf[28] = 2080;
          *(_QWORD *)&buf[30] = a5;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sipCallback(SIPGENERICREPORTLOG):%s", buf, 0x26u);
        }
      }
      reportingLog();
      return 0;
    case 17:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[VCTransportSession handleConnectionSetupDataChangeMessageDelivered](self->_transportSession, "handleConnectionSetupDataChangeMessageDelivered");
      return 0;
    case 18:
      v17 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
      if (v17)
      {
        CFRelease(v17);
        return 0;
      }
      return 17;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() < 7)
        return 0;
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      v27 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        return v27;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v30;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCCallSession(Callbacks) sipCallback:callID:msgIn:msgOut:optional:confIndex:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 4681;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = v13;
      _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sipCallback: message %d requires no action.", buf, 0x22u);
      return 0;
  }
}

uint64_t __79__VCCallSession_Callbacks__sipCallback_callID_msgIn_msgOut_optional_confIndex___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  _BYTE *v6;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "stopTimingForKey:", 5);
  v6 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (v6[408])
    {
      objc_msgSend(*(id *)(a1 + 32), "setPauseAudio:force:error:", 1, 1, 0);
      v6 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v6, "updateLastReceivedPacketWithTimestamp:packetType:", 3, micro() + 10.0);
  }
  else
  {
    reportingSymptom();
    objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", a3, 0);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "shouldNotifyDelegateDidStartBeforeAudioSetup");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateSessionStarted");
  return result;
}

uint64_t __79__VCCallSession_Callbacks__sipCallback_callID_msgIn_msgOut_optional_confIndex___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "startVideo:error:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)flushBasebandQueueWithPayloads:(id)a3 flushCount:(unsigned int *)a4
{
  return -[VCTransportSession flushBasebandQueueWithPayloads:flushCount:](self->_transportSession, "flushBasebandQueueWithPayloads:flushCount:", a3, a4);
}

- (void)handleMediaReceivedOverPeerToPeerLinkWithConnectionId:(int)a3
{
  -[VCTransportSession handleMediaReceivedOverPeerToPeerLinkWithConnectionId:](self->_transportSession, "handleMediaReceivedOverPeerToPeerLinkWithConnectionId:", *(_QWORD *)&a3);
}

- (void)handleMediaReceivedOverRelayLinkWithConnectionId:(int)a3
{
  -[VCTransportSession handleMediaReceivedOverRelayLinkWithConnectionId:](self->_transportSession, "handleMediaReceivedOverRelayLinkWithConnectionId:", *(_QWORD *)&a3);
}

- (BOOL)setupIDSConnectionForCallID:(unsigned int)a3 destination:(id)a4 socket:(int)a5 error:(id *)a6
{
  uint64_t v7;
  void *v10;
  VCTransportSession *transportSession;
  int v12;
  BOOL v13;

  v7 = *(_QWORD *)&a5;
  if (a4 || a5 != -1)
  {
    -[VCCallSession lock](self, "lock", *(_QWORD *)&a3);
    if (!self->_inviteDataRequested)
    {
      -[VCCallSession initWithRelevantStorebagEntries](self, "initWithRelevantStorebagEntries");
      -[VCCallSession reportOperatingMode](self, "reportOperatingMode");
    }
    if (!-[VCCallInfo participantID](self->localCallInfo, "participantID"))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%u"), hwrandom());
      -[VCCallInfo setParticipantID:](self->localCallInfo, "setParticipantID:", v10);

    }
    transportSession = self->_transportSession;
    -[VCTransportSession setDestination:](transportSession, "setDestination:", a4);
    -[VCTransportSession setSocket:](transportSession, "setSocket:", v7);
    if (self->isInitiator
      && -[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled")
      && (v12 = -[VCCallSession setSKEBlobOnTransportSession](self, "setSKEBlobOnTransportSession")) != 0)
    {
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a6, 32018, v12, 0, CFSTR("Media insecure"), CFSTR("Key exchange failed"));
      v13 = 0;
    }
    else
    {
      v13 = 1;
    }
    -[VCCallSession unlock](self, "unlock");
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) setupIDSConnectionForCallID:destination:socket:error:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) setupIDSConnectionForCallID:destination:socket:error:].cold.2();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a6, 32016, 261, 0, CFSTR("Cannot setup IDS connection"), CFSTR("No destination/socket"));
    return 0;
  }
  return v13;
}

- (int)setSKEBlobOnTransportSession
{
  int v2;

  dispatch_time(0, 5000000000);
  v2 = SKEState_CopyBlobSync();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) setSKEBlobOnTransportSession].cold.1();
  }
  return v2;
}

- (BOOL)configureLegacyTransportWithInviteInfo:(id)a3 error:(id *)a4
{
  void *v6;
  uint64_t v7;
  VCTransportSession *transportSession;
  uint64_t v9;
  NSString *sessionID;
  uint64_t v11;
  __SecIdentity *v12;

  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InviteDataConnectionBlob"));
  v7 = objc_msgSend(v6, "length");
  if (v7)
  {
    transportSession = self->_transportSession;
    if (-[VCCapabilities isRelayForced](self->caps, "isRelayForced"))
      -[VCTransportSession setForceRelay](transportSession, "setForceRelay");
    -[VCTransportSession setAllowsRelay:](transportSession, "setAllowsRelay:", -[VCCapabilities isRelayEnabled](self->caps, "isRelayEnabled"));
    -[VCTransportSession setIsCaller:](transportSession, "setIsCaller:", self->isInitiator);
    -[VCTransportSession setDelegate:](transportSession, "setDelegate:", self);
    -[VCTransportSession setLocalParticipantID:](transportSession, "setLocalParticipantID:", -[VCCallInfo participantID](self->localCallInfo, "participantID"));
    -[VCTransportSession setRemoteParticipantID:](transportSession, "setRemoteParticipantID:", -[VCCallInfo participantID](self->remoteCallInfo, "participantID"));
    if (-[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
      v9 = -[VCCallInfo callID](self->remoteCallInfo, "callID");
    else
      v9 = 0;
    -[VCTransportSession setRemoteCallID:](transportSession, "setRemoteCallID:", v9);
    if (-[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
      sessionID = self->sessionID;
    else
      sessionID = 0;
    -[VCTransportSession setSessionID:](transportSession, "setSessionID:", sessionID);
    if (-[VCCallSession isSKEOptimizationEnabled](self, "isSKEOptimizationEnabled"))
      v11 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", self->skeState);
    else
      v11 = 0;
    -[VCTransportSession setConnectionSetupPiggybackBlob:](transportSession, "setConnectionSetupPiggybackBlob:", v11);
    -[VCTransportSession setRemoteConnectionData:](transportSession, "setRemoteConnectionData:", v6);
    -[VCTransportSession setNATType:](transportSession, "setNATType:", -[VCCallSession natType](self, "natType"));
    -[VCTransportSession setOperatingMode:](transportSession, "setOperatingMode:", self->operatingMode);
    if (-[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
    {
      v12 = -[VCCallSession retrieveIdentity](self, "retrieveIdentity");
      -[VCTransportSession setIdentity:](transportSession, "setIdentity:", v12);
      if (v12)
        CFRelease(v12);
    }
    else
    {
      -[VCTransportSession setIdentity:](transportSession, "setIdentity:", 0);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) configureLegacyTransportWithInviteInfo:error:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) configureLegacyTransportWithInviteInfo:error:].cold.2();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32016, 201, 0, CFSTR("Cannot setup legacy connection"), CFSTR("No remote connection blob"));
  }
  return v7 != 0;
}

- (id)newSKEBlobWithRemoteSKEBlob:(id)a3
{
  __SecIdentity *v3;
  __SecIdentity *v4;
  int v5;

  v3 = -[VCCallSession retrieveIdentity](self, "retrieveIdentity");
  if (v3)
  {
    v4 = v3;
    v5 = SKEState_Create();
    CFRelease(v4);
    if (v5)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:].cold.3();
      }
    }
    else
    {
      dispatch_time(0, 5000000000);
      SKEState_CopyBlobSync();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:].cold.2();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) newSKEBlobWithRemoteSKEBlob:].cold.1();
  }
  return 0;
}

uint64_t __61__VCCallSession_PrivateMethods__newSKEBlobWithRemoteSKEBlob___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "processSIPMessage:msgOut:optional:confIndex:", "SKECheckRemoteCert", a4, a3, &v5);
}

- (int)setupEncryptionWithKey:(const __CFData *)a3 confIndex:(int *)a4
{
  uint64_t ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  BOOL v19;
  uint64_t v20;
  NSObject *v21;
  const __CFData *v22;
  int v23;
  int v24;
  int v25;
  uint64_t v27;
  NSObject *v28;
  UInt8 *v29;
  UInt8 *v30;
  UInt8 *v31;
  UInt8 *v32;
  unsigned int v33;
  _BOOL4 v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  _DWORD *v43;
  signed int v44;
  int v45;
  unsigned int v46;
  unsigned __int8 v47[16];
  unsigned __int8 v48;
  _BYTE v49[10];
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  _QWORD v56[5];
  _BOOL4 v57;
  _BOOL4 v58;
  _BYTE v59[48];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  _QWORD v64[14];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;
  _OWORD v80[4];
  _OWORD v81[2];
  uint64_t v82;
  _OWORD v83[4];
  _OWORD v84[2];
  uint64_t v85;
  uint64_t v86;
  CFRange v87;
  CFRange v88;
  CFRange v89;
  CFRange v90;

  v86 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if ((int)ErrorLogLevelForModule >= 7)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    ErrorLogLevelForModule = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)ErrorLogLevelForModule)
    {
      *(_DWORD *)v59 = 136315650;
      *(_QWORD *)&v59[4] = v8;
      *(_WORD *)&v59[12] = 2080;
      *(_QWORD *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
      *(_WORD *)&v59[22] = 1024;
      *(_DWORD *)&v59[24] = 4901;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setupEncryption", v59, 0x1Cu);
    }
  }
  v10 = MEMORY[0x1E0C80A78](ErrorLogLevelForModule);
  memset(&v56[1], 170, 22);
  v11 = MEMORY[0x1E0C80A78](v10);
  *(_QWORD *)((char *)&v55 + 6) = v12;
  v54 = v12;
  *(_QWORD *)&v55 = v12;
  v53 = v12;
  v13 = MEMORY[0x1E0C80A78](v11);
  *(_QWORD *)((char *)&v52 + 6) = v14;
  v51 = v14;
  *(_QWORD *)&v52 = v14;
  v50 = v14;
  MEMORY[0x1E0C80A78](v13);
  *(_QWORD *)v49 = v15;
  v85 = v15;
  *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v84[0] = v16;
  v84[1] = v16;
  v83[2] = v16;
  v83[3] = v16;
  v83[0] = v16;
  v83[1] = v16;
  v82 = v15;
  v81[0] = v16;
  v81[1] = v16;
  v80[2] = v16;
  v80[3] = v16;
  v80[0] = v16;
  v80[1] = v16;
  v79 = v15;
  v77 = v16;
  v78 = v16;
  v75 = v16;
  v76 = v16;
  v73 = v16;
  v74 = v16;
  v72 = v15;
  v70 = v16;
  v71 = v16;
  v68 = v16;
  v69 = v16;
  v66 = v16;
  v67 = v16;
  if (-[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled", v15, v15, v15, *(_QWORD *)&v49[2], v50, v51, (_QWORD)v52, *((_QWORD *)&v52 + 1), v53, v54, (_QWORD)v55, *((_QWORD *)&v55 + 1), 0xAAAAAAAAAAAAAAAALL, v56[1], v56[2], v56[3])|| -[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
  {
    v17 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled");
    v18 = -[VCCapabilities isAudioEnabled](self->caps, "isAudioEnabled");
    if (!a3)
      goto LABEL_11;
  }
  else
  {
    v18 = 0;
    v17 = 0;
    if (!a3)
      goto LABEL_11;
  }
  v19 = -[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled");
  if (!a4 && !v19)
  {
LABEL_11:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v59 = 136315650;
        *(_QWORD *)&v59[4] = v20;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
        *(_WORD *)&v59[22] = 1024;
        *(_DWORD *)&v59[24] = 4923;
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex cancels", v59, 0x1Cu);
      }
    }
LABEL_19:
    v23 = 0;
    v24 = 0;
    goto LABEL_20;
  }
  v22 = *a3;
  if (!v22 || CFDataGetLength(v22) <= 119)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:].cold.3();
    }
    goto LABEL_19;
  }
  v57 = v18;
  v58 = v17;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v27 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v59 = 136315650;
      *(_QWORD *)&v59[4] = v27;
      *(_WORD *)&v59[12] = 2080;
      *(_QWORD *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
      *(_WORD *)&v59[22] = 1024;
      *(_DWORD *)&v59[24] = 4932;
      _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex ok", v59, 0x1Cu);
    }
  }
  if (self->isInitiator)
    v29 = (UInt8 *)v56;
  else
    v29 = (UInt8 *)&v53;
  if (self->isInitiator)
    v30 = (UInt8 *)&v53;
  else
    v30 = (UInt8 *)v56;
  if (self->isInitiator)
    v31 = (UInt8 *)&v50;
  else
    v31 = v47;
  if (self->isInitiator)
    v32 = v47;
  else
    v32 = (UInt8 *)&v50;
  v87.location = 0;
  v87.length = 30;
  CFDataGetBytes(v22, v87, v29);
  v88.location = 30;
  v88.length = 30;
  CFDataGetBytes(v22, v88, v30);
  v89.location = 60;
  v89.length = 30;
  CFDataGetBytes(v22, v89, v31);
  v90.location = 90;
  v90.length = 30;
  CFDataGetBytes(v22, v90, v32);
  ByteToHex((unint64_t)v83, 65, (unsigned __int8 *)v56, 16);
  ByteToHex((unint64_t)v84 + 1, 29, (unsigned __int8 *)&v56[2], 14);
  ByteToHex((unint64_t)v80, 65, (unsigned __int8 *)&v53, 16);
  ByteToHex((unint64_t)v81 + 1, 29, (unsigned __int8 *)&v55, 14);
  ByteToHex((unint64_t)&v73, 65, (unsigned __int8 *)&v50, 16);
  ByteToHex((unint64_t)&v77 + 1, 29, (unsigned __int8 *)&v52, 14);
  ByteToHex((unint64_t)&v66, 65, v47, 16);
  ByteToHex((unint64_t)&v70 + 1, 29, &v48, 14);
  if (-[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled")
    || -[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
  {
    v33 = self->_peerProtocolVersion != 0;
    v85 = 0;
    v82 = 0;
    v34 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled");
    v18 = v57;
    v17 = v58;
    if (v34)
    {
      SRTPUseEncryption((uint64_t)self->rtpVideo, (uint64_t)v83, (uint64_t)v80, 5, 0, v33);
      v23 = v35;
      if (v35 >= 0)
        v17 = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v36 = VRTraceErrorLogLevelToCSTR();
        v37 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v59 = 136315906;
          *(_QWORD *)&v59[4] = v36;
          *(_WORD *)&v59[12] = 2080;
          *(_QWORD *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
          *(_WORD *)&v59[22] = 1024;
          *(_DWORD *)&v59[24] = 4973;
          *(_WORD *)&v59[28] = 1024;
          *(_DWORD *)&v59[30] = v23;
          _os_log_impl(&dword_1D8A54000, v37, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d UseVideoEncryption: [%08x]", v59, 0x22u);
        }
      }
    }
    else
    {
      v23 = 0;
    }
    v79 = 0;
    v72 = 0;
    SRTPUseEncryption((uint64_t)self->rtpHandle, (uint64_t)&v73, (uint64_t)&v66, 5, 0, v33);
    v24 = v38;
    if (v38 >= 0)
      v18 = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v59 = 136315906;
        *(_QWORD *)&v59[4] = v39;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
        *(_WORD *)&v59[22] = 1024;
        *(_DWORD *)&v59[24] = 4981;
        *(_WORD *)&v59[28] = 1024;
        *(_DWORD *)&v59[30] = v24;
        _os_log_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d UseAudioEncryption: [%08x]", v59, 0x22u);
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v59 = 136315650;
        *(_QWORD *)&v59[4] = v41;
        *(_WORD *)&v59[12] = 2080;
        *(_QWORD *)&v59[14] = "-[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:]";
        *(_WORD *)&v59[22] = 1024;
        *(_DWORD *)&v59[24] = 4982;
        _os_log_impl(&dword_1D8A54000, v42, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex done - using srtp", v59, 0x1Cu);
      }
    }
    if (-[VCCallSession isSecureMessagingRequired](self, "isSecureMessagingRequired"))
    {
      v65 = 0u;
      memset(v64, 0, sizeof(v64));
      v43 = (_DWORD *)CheckInHandleDebug();
      v44 = v43[1808];
      if (v44 <= v43[2028])
        v44 = v43[2028];
      v45 = v43[1918];
      if (v45 <= v43[2138])
        v45 = v43[2138];
      DWORD2(v65) = v45;
      v46 = v43[1910];
      LODWORD(v64[0]) = v43[1800];
      *(_QWORD *)&v65 = __PAIR64__(v44, v46);
      CheckOutHandleDebug();
      v61 = v77;
      v62 = v78;
      v63 = v79;
      *(_OWORD *)v59 = v73;
      *(_OWORD *)&v59[16] = v74;
      *(_OWORD *)&v59[32] = v75;
      v60 = v76;
      *(_OWORD *)&v64[1] = v66;
      *(_OWORD *)&v64[3] = v67;
      v64[13] = v72;
      *(_OWORD *)&v64[9] = v70;
      *(_OWORD *)&v64[11] = v71;
      *(_OWORD *)&v64[5] = v68;
      *(_OWORD *)&v64[7] = v69;
      objc_msgSend(-[VCCallSession activeControlChannel](self, "activeControlChannel"), "setEncryptionWithEncryptionMaterial:", v59);
    }
  }
  else
  {
    v23 = 0;
    v24 = 0;
    v18 = v57;
    v17 = v58;
  }
LABEL_20:
  pthread_mutex_lock(&self->srtpLock);
  if (self->didPrepareSRTP)
  {
    if (v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:].cold.2();
      }
      SRTPCancelEncryption();
    }
    if (v18)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) setupEncryptionWithKey:confIndex:].cold.1();
      }
      SRTPCancelEncryption();
    }
  }
  pthread_mutex_unlock(&self->srtpLock);
  SRTPClearExchangeInfo((uint64_t)v83);
  SRTPClearExchangeInfo((uint64_t)&v73);
  SRTPClearExchangeInfo((uint64_t)v80);
  SRTPClearExchangeInfo((uint64_t)&v66);
  if (v18)
    v25 = v24;
  else
    v25 = 0;
  if (v17)
    return v23;
  else
    return v25;
}

- (VCCallSession)initWithRelevantStorebagEntries
{
  double NoRemotePacketsTimeout;
  double v4;
  int ErrorLogLevelForModule;
  os_log_t *v6;
  uint64_t v7;
  NSObject *v8;
  double v9;
  double v10;
  uint64_t v11;
  NSObject *v12;
  double networkConditionsTimeoutInSeconds;
  double v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  NoRemotePacketsTimeout = GKSConnectivitySettings_GetNoRemotePacketsTimeout();
  v4 = 20.0;
  if (NoRemotePacketsTimeout > 20.0)
    v4 = GKSConnectivitySettings_GetNoRemotePacketsTimeout();
  self->noRemotePacketsTimeout = v4;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v6 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = self->noRemotePacketsTimeout;
      v16 = 136315906;
      v17 = v7;
      v18 = 2080;
      v19 = "-[VCCallSession(PrivateMethods) initWithRelevantStorebagEntries]";
      v20 = 1024;
      v21 = 5029;
      v22 = 2048;
      v23 = v9;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d noRemotePacketsTimeout = %f", (uint8_t *)&v16, 0x26u);
    }
  }
  +[GKSConnectivitySettings getRemoteMediaStallTimeout](GKSConnectivitySettings, "getRemoteMediaStallTimeout");
  self->_remoteMediaStallTimeout = v10;
  self->networkConditionsTimeoutInSeconds = fmax(GKSConnectivitySettings_GetNetworkConditionsTimeout(), 20.0);
  *(_OWORD *)&self->timeLastKnowGoodNetworkPLR = 0u;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      networkConditionsTimeoutInSeconds = self->networkConditionsTimeoutInSeconds;
      v16 = 136315906;
      v17 = v11;
      v18 = 2080;
      v19 = "-[VCCallSession(PrivateMethods) initWithRelevantStorebagEntries]";
      v20 = 1024;
      v21 = 5039;
      v22 = 2048;
      v23 = networkConditionsTimeoutInSeconds;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d networkConditionsTimeoutInSeconds = %f", (uint8_t *)&v16, 0x26u);
    }
  }
  objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-video-throttling-timeout")), "doubleValue");
  if (v14 <= 15.0)
    v14 = 30.0;
  self->videoThrottlingTimeout = v14;
  +[GKSConnectivitySettings getNoRemoteDuplicationThresholdFast](GKSConnectivitySettings, "getNoRemoteDuplicationThresholdFast");
  return (VCCallSession *)-[VCConnectionManager setNoRemoteDuplicationThresholdFast:](self->connectionManager, "setNoRemoteDuplicationThresholdFast:");
}

- (void)updateNetworkCheckHint:(double)a3
{
  double v3;
  NSObject *delegateNotificationQueue;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (self->shouldTimeoutPackets)
  {
    v3 = self->networkConditionsTimeoutInSeconds * 0.25;
    if (a3 - self->timeLastKnowGoodNetworkPLR > v3
      || a3 - self->timeLastKnowGoodNetworkRTT > v3
      || a3 - self->lastReceivedPacketTimestamp > self->noRemotePacketsTimeout * 0.25)
    {
      if (self->isCurrentNetworkBad)
        return;
      self->isCurrentNetworkBad = 1;
      goto LABEL_7;
    }
    if (self->isCurrentNetworkBad)
    {
      self->isCurrentNetworkBad = 0;
LABEL_7:
      delegateNotificationQueue = self->delegateNotificationQueue;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __56__VCCallSession_PrivateMethods__updateNetworkCheckHint___block_invoke;
      v5[3] = &unk_1E9E521C0;
      v5[4] = self;
      dispatch_async(delegateNotificationQueue, v5);
    }
  }
}

uint64_t __56__VCCallSession_PrivateMethods__updateNetworkCheckHint___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:withCallID:networkHint:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1144));
}

- (void)logDetailedNetworkInformation
{
  int sampleLogCount;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  double v11;
  double v12;
  float v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[VCTransportSession getSignalStrengthBars:displayBars:maxDisplayBars:](self->_transportSession, "getSignalStrengthBars:displayBars:maxDisplayBars:", &self->_signalStrengthBars, &self->_signalStrengthDisplayBars, &self->_signalStrengthMaxDisplayBars);
  sampleLogCount = self->sampleLogCount;
  self->sampleLogCount = sampleLogCount + 1;
  if ((sampleLogCount & 3) == 0 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      -[VCCallSession networkQuality](self, "networkQuality");
      v7 = v6;
      -[VCCallSession roundTripTime](self, "roundTripTime");
      v9 = v8;
      v10 = -[VCCallSession bandwidthUpstream](self, "bandwidthUpstream");
      -[VCCallSession packetLossRate5Secs](self, "packetLossRate5Secs");
      v12 = v11 * 100.0;
      -[VCCallSession packetLateAndMissingRatio](self, "packetLateAndMissingRatio");
      v14 = 136317698;
      v15 = v4;
      v16 = 2080;
      v17 = "-[VCCallSession(PrivateMethods) logDetailedNetworkInformation]";
      v18 = 1024;
      v19 = 5102;
      v20 = 2048;
      v21 = v7;
      v22 = 2048;
      v23 = v9;
      v24 = 1024;
      v25 = v10;
      v26 = 2048;
      v27 = v12;
      v28 = 2048;
      v29 = v13 * 100.0;
      v30 = 1024;
      v31 = -[VCCallSession signalStrengthBars](self, "signalStrengthBars");
      v32 = 1024;
      v33 = -[VCCallSession signalStrengthDisplayBars](self, "signalStrengthDisplayBars");
      v34 = 1024;
      v35 = -[VCCallSession signalStrengthMaxDisplayBars](self, "signalStrengthMaxDisplayBars");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d NQ = %.3f, RTT = %.3f, TxBW = %ub/sec, PLR = %.2f%%, PLaMR = %.2f%%, signal = [%d %d %d]", (uint8_t *)&v14, 0x5Cu);
    }
  }
}

- (void)setupDTLSDefaults
{
  CFIndex AppIntegerValue;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  unsigned int v10;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("forceDTLS"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    -[VCCapabilities setIsDTLSEnabled:](self->caps, "setIsDTLSEnabled:", AppIntegerValue != 0);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = -[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled");
        v7 = -[VCCallInfo callID](self->localCallInfo, "callID");
        *(_DWORD *)buf = 136316162;
        v13 = v4;
        v14 = 2080;
        v15 = "-[VCCallSession(PrivateMethods) setupDTLSDefaults]";
        v16 = 1024;
        v17 = 5112;
        v18 = 1024;
        v19 = v6;
        v20 = 1024;
        v21 = v7;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d DTLS force set to (%d) for call (%d): ", buf, 0x28u);
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v10 = -[VCCallInfo callID](self->localCallInfo, "callID");
        *(_DWORD *)buf = 136315906;
        v13 = v8;
        v14 = 2080;
        v15 = "-[VCCallSession(PrivateMethods) setupDTLSDefaults]";
        v16 = 1024;
        v17 = 5116;
        v18 = 1024;
        v19 = v10;
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d NO DTLS force set for call (%d).  We are ignoring the capabilities passed.", buf, 0x22u);
      }
    }
    -[VCCapabilities setIsDTLSEnabled:](self->caps, "setIsDTLSEnabled:", 0);
  }
}

- (void)setupPeerInfo:(id)a3 usingInviteData:(id)a4 isCaller:(BOOL)a5 capabilities:(id)a6
{
  _BOOL4 v7;
  VCCallInfo *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  _BOOL4 v15;
  int64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->isStarted)
  {
    v7 = a5;
    self->isStarted = 1;
    self->isInitiator = a5;
    v11 = objc_alloc_init(VCCallInfo);
    self->remoteCallInfo = v11;
    -[VCCallInfo setParticipantID:](v11, "setParticipantID:", a3);
    -[VCCallSession setRemoteCallInfoFromInviteDictionary:](self, "setRemoteCallInfoFromInviteDictionary:", a4);
    SIPSetEnableCompression((uint64_t)self->hSIP, -[VCCallInfo supportSDPCompression](self->remoteCallInfo, "supportSDPCompression"));
    -[VCCallSession setCapabilities:](self, "setCapabilities:", a6);
    -[VCCallSession setupDTLSDefaults](self, "setupDTLSDefaults");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v14 = -[VCCapabilities isAudioPausedToStart](self->caps, "isAudioPausedToStart");
        v15 = -[VCCapabilities isVideoPausedToStart](self->caps, "isVideoPausedToStart");
        v17 = 136316162;
        v18 = v12;
        v19 = 2080;
        v20 = "-[VCCallSession(PrivateMethods) setupPeerInfo:usingInviteData:isCaller:capabilities:]";
        v21 = 1024;
        v22 = 5148;
        v23 = 1024;
        v24 = v14;
        v25 = 1024;
        v26 = v15;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setupPeerInfo isAudioPausedToStart = %d, isVideoPausedToStart = %d", (uint8_t *)&v17, 0x28u);
      }
    }
    self->audioIsPaused = -[VCCapabilities isAudioPausedToStart](self->caps, "isAudioPausedToStart");
    -[VCCallInfo setVideoIsPaused:](self->localCallInfo, "setVideoIsPaused:", -[VCCapabilities isVideoPausedToStart](self->caps, "isVideoPausedToStart"));
    if (-[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled"))
      -[VCCallSession setLocalIdentityForKeyExchange](self, "setLocalIdentityForKeyExchange");
    v16 = 5;
    if (!v7)
      v16 = 6;
    self->state = v16;
    if (self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
    {
      self->_sipState = v16;
      -[VCCallSession setupConnectionTimeoutTimerWithErrorCode:detailedCode:description:reason:](self, "setupConnectionTimeoutTimerWithErrorCode:detailedCode:description:reason:", 32002, 257, CFSTR("Connection to remote participant timed out"), CFSTR("Connection took too long"));
    }
    -[VCCallSession setupMessaging](self, "setupMessaging");
  }
}

- (__SecIdentity)retrieveIdentity
{
  __SecIdentity *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (__SecIdentity *)objc_msgSend(MEMORY[0x1E0CFE148], "copyIdentity");
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315650;
        v8 = v4;
        v9 = 2080;
        v10 = "-[VCCallSession(PrivateMethods) retrieveIdentity]";
        v11 = 1024;
        v12 = 5183;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d retreiveIdentity: using APS identity...", (uint8_t *)&v7, 0x1Cu);
      }
    }
  }
  -[VCCallSession logIdentity:](self, "logIdentity:", v3);
  return v3;
}

- (void)notifyDelegateAndEndCall:(int64_t)a3 didRemoteCancel:(BOOL)a4 error:(id)a5
{
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 sentClientSuccessfulDidStart;
  uint64_t v14;
  NSObject *global_queue;
  NSObject *delegateNotificationQueue;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD block[7];
  BOOL v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  unsigned int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  _BOOL4 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = ((unint64_t)a3 > 7) | (0x7Fu >> a3);
  v10 = ((unint64_t)a3 < 8) & (0x60u >> a3);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      sentClientSuccessfulDidStart = self->sentClientSuccessfulDidStart;
      *(_DWORD *)buf = 136316674;
      v24 = v11;
      v25 = 2080;
      v26 = "-[VCCallSession(PrivateMethods) notifyDelegateAndEndCall:didRemoteCancel:error:]";
      v27 = 1024;
      v28 = 5214;
      v29 = 1024;
      v30 = v9 & 1;
      v31 = 1024;
      v32 = v10;
      v33 = 1024;
      v34 = a3;
      v35 = 1024;
      v36 = sentClientSuccessfulDidStart;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: notifying delegate didStop %d:%d (%d, %d)", buf, 0x34u);
    }
  }
  if ((v9 & 1) != 0)
  {
    v14 = MEMORY[0x1E0C809B0];
    if (self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = v14;
      block[1] = 3221225472;
      block[2] = __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke;
      block[3] = &unk_1E9E55690;
      v22 = a4;
      block[5] = a5;
      block[6] = a3;
      block[4] = self;
      dispatch_async(global_queue, block);
    }
    delegateNotificationQueue = self->delegateNotificationQueue;
    if (v10)
    {
      v20 = v14;
      v17 = __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke_2;
      v18 = &v20;
    }
    else
    {
      v19 = v14;
      v17 = __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke_3;
      v18 = &v19;
    }
    v18[1] = 3221225472;
    v18[2] = (uint64_t)v17;
    v18[3] = (uint64_t)&unk_1E9E52238;
    v18[4] = (uint64_t)self;
    v18[5] = (uint64_t)a5;
    dispatch_async(delegateNotificationQueue, v18);
  }
}

uint64_t __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doSipEndAction:callID:error:", objc_msgSend(*(id *)(a1 + 32), "calculateSIPEndAction:currentState:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40)), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID"), *(_QWORD *)(a1 + 40));
}

void __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)VCConnectionManager_CopyPrimaryConnection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:", *(_QWORD *)(a1 + 32), 0, objc_msgSend(v2, "type"), objc_msgSend(v2, "localInterfaceTypeString"), objc_msgSend(v2, "remoteInterfaceTypeString"), *(_QWORD *)(a1 + 40));
  if (v2)
    CFRelease(v2);
}

uint64_t __80__VCCallSession_PrivateMethods__notifyDelegateAndEndCall_didRemoteCancel_error___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didStopWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:cleanUpWithDelay:error:", *(_QWORD *)(a1 + 32), 5, *(_QWORD *)(a1 + 40));
}

- (int64_t)calculateSIPEndAction:(BOOL)a3 currentState:(int64_t)a4 error:(id)a5
{
  uint64_t v8;

  if (a3)
    return 0;
  if (a5)
  {
    v8 = objc_msgSend(a5, "code");
    if ((unint64_t)(v8 - 32003) <= 6 && ((1 << (v8 - 3)) & 0x61) != 0)
      return 3;
  }
  switch(a4)
  {
    case 5:
      return 2;
    case 7:
      return 3;
    case 6:
      return self->didSend200OK;
    default:
      return 1;
  }
}

- (void)reportDashboardEndResult:(BOOL)a3
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  switch(self->state)
  {
    case 1:
      if (!VCCTServiceMonitor_GetIsInHomeCountry() && (int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v15 = v4;
          v16 = 2080;
          v17 = "-[VCCallSession(PrivateMethods) reportDashboardEndResult:]";
          v18 = 1024;
          v19 = 5330;
          v20 = 2080;
          v21 = "home country";
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d reportDashboardEndResult: This call is in %s.", buf, 0x26u);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v8 = -[VCConnectionManager signalingExcessiveCellularRxBytes](self->connectionManager, "signalingExcessiveCellularRxBytes");
          v9 = -[VCConnectionManager signalingExcessiveCellularTxBytes](self->connectionManager, "signalingExcessiveCellularTxBytes");
          v10 = -[VCConnectionManager mediaExcessiveCellularRxBytes](self->connectionManager, "mediaExcessiveCellularRxBytes");
          v11 = -[VCConnectionManager mediaExcessiveCellularTxBytes](self->connectionManager, "mediaExcessiveCellularTxBytes");
          v12 = -[VCConnectionManager budgetConsumingCellularTxBytes](self->connectionManager, "budgetConsumingCellularTxBytes");
          v13 = -[VCConnectionManager budgetConsumingCellularRxBytes](self->connectionManager, "budgetConsumingCellularRxBytes");
          *(_DWORD *)buf = 136317186;
          v15 = v6;
          v16 = 2080;
          v17 = "-[VCCallSession(PrivateMethods) reportDashboardEndResult:]";
          v18 = 1024;
          v19 = 5333;
          v20 = 2048;
          v21 = (const char *)v8;
          v22 = 2048;
          v23 = v9;
          v24 = 2048;
          v25 = v10;
          v26 = 2048;
          v27 = v11;
          v28 = 2048;
          v29 = v12;
          v30 = 2048;
          v31 = v13;
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Reporting excessive cellular data usage: signalingExcessiveCellularRxBytes %llu, signalingExcessiveCellularTxBytes %llu, mediaExcessiveCellularRxBytes %llu, mediaExcessiveCellularTxBytes %llu budgetConsumingCellularTxBytes:%llu budgetConsumingCellularRxBytes:%llu", buf, 0x58u);
        }
      }
      -[VCConnectionManager signalingExcessiveCellularRxBytes](self->connectionManager, "signalingExcessiveCellularRxBytes");
      -[VCConnectionManager signalingExcessiveCellularTxBytes](self->connectionManager, "signalingExcessiveCellularTxBytes");
      -[VCConnectionManager mediaExcessiveCellularRxBytes](self->connectionManager, "mediaExcessiveCellularRxBytes");
      -[VCConnectionManager mediaExcessiveCellularTxBytes](self->connectionManager, "mediaExcessiveCellularTxBytes");
      -[VCCallSession dtxMetrics](self, "dtxMetrics");
      reportingDisconnected();
      break;
    case 3:
    case 5:
    case 6:
      reportingCancelLog();
      break;
    default:
      return;
  }
}

- (void)cleanupMedia
{
  tagVCAudioReceiver *audioReceiver;
  id v4;
  id v5;
  SnapshotTimer *v6;

  v6 = objc_alloc_init(SnapshotTimer);
  -[SnapshotTimer checkinWithTimeout:forTask:](v6, "checkinWithTimeout:forTask:", CFSTR("Media cleanup"), 1.75);
  pthread_mutex_lock(&self->srtpLock);
  if (self->didPrepareSRTP)
  {
    SRTPCancelEncryption();
    SRTPCancelEncryption();
    self->didPrepareSRTP = 0;
  }
  RTPSetAudioReceiver((uint64_t)self->rtpVideo, 0);
  self->rtpHandle = (tagHANDLE *)0xFFFFFFFFLL;
  self->rtpVideo = (tagHANDLE *)0xFFFFFFFFLL;
  audioReceiver = self->audioReceiver;
  if (audioReceiver)
  {
    VCAudioReceiver_Finalize(&audioReceiver->var0.var0);
    self->audioReceiver = 0;
  }

  self->_captionsReceiver = 0;
  pthread_mutex_unlock(&self->srtpLock);
  RTPCloseHandle();
  RTPCloseHandle();
  VCMediaControlInfoGeneratorDeregisterCallbacks(self->videoMediaControlInfoGenerator, (const char *)self);
  VCMediaControlInfoGeneratorDeregisterCallbacks(self->audioMediaControlInfoGenerator, (const char *)self);
  if (self->isWaitingForICEResult)
  {
    v4 = +[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager");
    v5 = v4;
    objc_msgSend((id)objc_msgSend(v4, "resultQueue"), "addResult:forCallID:", 0, -[VCCallInfo callID](self->localCallInfo, "callID"));

  }
  -[VCCallSession disableSessionHealthMonitor](self, "disableSessionHealthMonitor");
  -[SnapshotTimer checkout](v6, "checkout");

}

- (void)startPausedHeartbeat
{
  float v3;
  float v4;
  NSObject *global_queue;
  OS_dispatch_source *v6;
  NSObject *pausedAudioHeartBeat;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  if (!self->pausedAudioHeartBeat && self->shouldTimeoutPackets)
  {
    -[VCPacketBundler resetBuffer](-[VCAudioTransmitter audioBundler](self->audioTransmitter, "audioBundler"), "resetBuffer");
    -[VCPacketBundler resetBuffer](-[VCAudioTransmitter audioBundlerShortRED](self->audioTransmitter, "audioBundlerShortRED"), "resetBuffer");
    -[VCDefaults pauseHeartbeatInterval](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "pauseHeartbeatInterval");
    if (v3 > 0.0)
    {
      v4 = v3;
      global_queue = dispatch_get_global_queue(2, 0);
      v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
      self->pausedAudioHeartBeat = v6;
      if (v6)
      {
        dispatch_source_set_timer((dispatch_source_t)v6, 0, (unint64_t)(v4 * 1000000000.0), 0x5F5E100uLL);
        pausedAudioHeartBeat = self->pausedAudioHeartBeat;
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __53__VCCallSession_PrivateMethods__startPausedHeartbeat__block_invoke;
        v8[3] = &unk_1E9E521C0;
        v8[4] = self;
        dispatch_source_set_event_handler(pausedAudioHeartBeat, v8);
        dispatch_resume((dispatch_object_t)self->pausedAudioHeartBeat);
      }
    }
  }
}

void __53__VCCallSession_PrivateMethods__startPausedHeartbeat__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "sendMessage:withTopic:", CFSTR("Ping!"), CFSTR("VCPingTopic"));
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  objc_msgSend(*(id *)(a1 + 32), "updateLastReceivedPacketWithTimestamp:packetType:", 7, VCAudioReceiver_GetLatestAudioTimestamp(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224)));
  VCAudioReceiver_DiscardQueueExcess(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224));
}

- (void)stopPausedHeartbeat
{
  uint64_t v3;
  NSObject *v4;
  NSObject *pausedAudioHeartBeat;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->pausedAudioHeartBeat)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315650;
        v7 = v3;
        v8 = 2080;
        v9 = "-[VCCallSession(PrivateMethods) stopPausedHeartbeat]";
        v10 = 1024;
        v11 = 5441;
        _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d We are tearing down our heartbeat!", (uint8_t *)&v6, 0x1Cu);
      }
    }
    dispatch_source_cancel((dispatch_source_t)self->pausedAudioHeartBeat);
    pausedAudioHeartBeat = self->pausedAudioHeartBeat;
    if (pausedAudioHeartBeat)
    {
      dispatch_release(pausedAudioHeartBeat);
      self->pausedAudioHeartBeat = 0;
    }
  }
}

- (void)logPerfTimings
{
  __int128 v2;
  uint64_t v4;
  os_log_t *v5;
  uint64_t v6;
  NSObject *v7;
  double v8;
  __int128 v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v4 = 0;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = (os_log_t *)MEMORY[0x1E0CF2758];
  *(_QWORD *)&v2 = 136316162;
  v9 = v2;
  do
  {
    if (-[TimingCollection hasKey:](self->perfTimers, "hasKey:", v4, v9)
      && -[TimingCollection isValidTimingForKey:](self->perfTimers, "isValidTimingForKey:", v4)
      && (int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        -[TimingCollection timingForKey:](self->perfTimers, "timingForKey:", v4);
        *(_DWORD *)buf = v9;
        v11 = v6;
        v12 = 2080;
        v13 = "-[VCCallSession(PrivateMethods) logPerfTimings]";
        v14 = 1024;
        v15 = 5452;
        v16 = 1024;
        v17 = v4;
        v18 = 1024;
        v19 = (int)(v8 * 1000.0);
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sendTimings:Key = %d, value = %d", buf, 0x28u);
      }
    }
    v4 = (v4 + 1);
  }
  while ((_DWORD)v4 != 23);
}

- (void)sendTimings
{
  -[VCCallSession logPerfTimings](self, "logPerfTimings");
  reportingPerfTimes();
}

- (void)remotePauseDidChangeToState:(BOOL)a3 forVideo:(BOOL)a4
{
  NSObject *videoQueue;
  _QWORD block[5];
  BOOL v6;
  BOOL v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  videoQueue = self->videoQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__VCCallSession_PrivateMethods__remotePauseDidChangeToState_forVideo___block_invoke;
  block[3] = &unk_1E9E52A50;
  v6 = a4;
  block[4] = self;
  v7 = a3;
  dispatch_async(videoQueue, block);
}

uint64_t __70__VCCallSession_PrivateMethods__remotePauseDidChangeToState_forVideo___block_invoke(uint64_t a1)
{
  _BOOL8 v3;
  uint64_t v4;
  void *v5;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setVideoIsPaused:", *(unsigned __int8 *)(a1 + 41) != 0);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "remoteVideoDidPause:callID:", *(unsigned __int8 *)(a1 + 41), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID"));
  }
  else
  {
    if (*(_BYTE *)(a1 + 41))
    {
      VCAudioReceiver_Reset(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1224));
      v3 = *(_BYTE *)(a1 + 41) != 0;
    }
    else
    {
      v3 = 0;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setConnectionPause:isLocalConnection:", v3, 0);
    AFRCSetAudioPaused(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), *(unsigned __int8 *)(a1 + 41), 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 352);
    if (v5)
    {
      objc_msgSend((id)objc_msgSend(v5, "mediaController"), "setIsRemoteAudioPaused:", *(unsigned __int8 *)(a1 + 41));
      v4 = *(_QWORD *)(a1 + 32);
    }
    return objc_msgSend(*(id *)(v4 + 8), "remoteAudioDidPause:callID:", *(unsigned __int8 *)(a1 + 41), objc_msgSend(*(id *)(v4 + 24), "callID"));
  }
}

- (void)processSIPMessage:(char *)a3 msgOut:(char *)a4 optional:(void *)a5 confIndex:(int *)a6
{
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *global_queue;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD v32[6];
  _BYTE buf[12];
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = v11;
      v34 = 2080;
      v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
      v36 = 1024;
      v37 = 5488;
      v38 = 2080;
      v39 = a3;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SIPMESSAGE...%s", buf, 0x26u);
    }
  }
  if (!strcmp("SKEComplete", a3) || !strcmp("DTLS-SRTP", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v16;
        v34 = 2080;
        v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
        v36 = 1024;
        v37 = 5492;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SKEComplete...", buf, 0x1Cu);
      }
    }
    -[VCCallSession setupEncryptionWithKey:confIndex:](self, "setupEncryptionWithKey:confIndex:", a5, a6);
  }
  else if (!strcmp("SKECheckRemoteCert", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v18;
        v34 = 2080;
        v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
        v36 = 1024;
        v37 = 5495;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SKECheckRemoteCert...", buf, 0x1Cu);
      }
    }
    if (a5)
    {
      if (self->peerCN)
      {
        v20 = (void *)SecCertificateCopyCommonNames();
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v21 = VRTraceErrorLogLevelToCSTR();
          v22 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v23 = -[NSString UTF8String](self->peerCN, "UTF8String");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v21;
            v34 = 2080;
            v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
            v36 = 1024;
            v37 = 5516;
            v38 = 2080;
            v39 = (char *)v23;
            _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SKECheckRemoteCert: peerCN = '%s'", buf, 0x26u);
          }
        }
        if (!v20)
          goto LABEL_42;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v26 = objc_msgSend((id)objc_msgSend(v20, "description"), "UTF8String");
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = v24;
            v34 = 2080;
            v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
            v36 = 1024;
            v37 = 5519;
            v38 = 2080;
            v39 = (char *)v26;
            _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Common names: %s", buf, 0x26u);
          }
        }
        v27 = objc_msgSend(v20, "containsObject:", self->peerCN);
        CFRelease(v20);
        if ((v27 & 1) == 0)
        {
LABEL_42:
          if ((int)VRTraceGetErrorLogLevelForModule() > 6)
          {
            v28 = VRTraceErrorLogLevelToCSTR();
            v29 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = v28;
              v34 = 2080;
              v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
              v36 = 1024;
              v37 = 5531;
              _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SKECheckRemoteCert: specified peer common name not found...", buf, 0x1Cu);
            }
          }
          a5 = 0;
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = v30;
          v34 = 2080;
          v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
          v36 = 1024;
          v37 = 5535;
          v38 = 1024;
          LODWORD(v39) = a5 != 0;
          _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SKECheckRemoteCert valid == %d...", buf, 0x22u);
        }
      }
      if (a4)
        *(_DWORD *)a4 = a5 != 0;
    }
  }
  else if (!strcmp("SKEReportError", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v14 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = v13;
        v34 = 2080;
        v35 = "-[VCCallSession(PrivateMethods) processSIPMessage:msgOut:optional:confIndex:]";
        v36 = 1024;
        v37 = 5541;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SipCallbackNotification SKEReportError...", buf, 0x1Cu);
      }
    }
    if (a5)
    {
      *(_QWORD *)buf = 0;
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32018, (int)(objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("skeDetailCode")), "intValue") + 500), objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("filePath")), objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("description")), objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("reason")));
      global_queue = dispatch_get_global_queue(2, 0);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __77__VCCallSession_PrivateMethods__processSIPMessage_msgOut_optional_confIndex___block_invoke;
      v32[3] = &unk_1E9E52238;
      v32[4] = self;
      v32[5] = *(_QWORD *)buf;
      dispatch_async(global_queue, v32);
    }
  }
}

uint64_t __77__VCCallSession_PrivateMethods__processSIPMessage_msgOut_optional_confIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", *(_QWORD *)(a1 + 40), 0);
}

- (void)lock
{
  pthread_mutex_lock(&self->mutex);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->mutex);
}

- (void)resetState
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = v2;
      v6 = 2080;
      v7 = "-[VCCallSession(PrivateMethods) resetState]";
      v8 = 1024;
      v9 = 5574;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d The call failed.", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)setupCalleeSIPStartTimeout:(float)a3
{
  id v5;
  uint64_t v6;
  dispatch_time_t v7;
  NSObject *global_queue;
  _QWORD block[5];
  float v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v6 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  v7 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VCCallSession_PrivateMethods__setupCalleeSIPStartTimeout___block_invoke;
  block[3] = &unk_1E9E52300;
  block[4] = v6;
  v10 = a3;
  dispatch_after(v7, global_queue, block);

}

uint64_t __60__VCCallSession_PrivateMethods__setupCalleeSIPStartTimeout___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *global_queue;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "strong");
  if (result)
  {
    v3 = (void *)result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v11 = v4;
        v12 = 2080;
        v13 = "-[VCCallSession(PrivateMethods) setupCalleeSIPStartTimeout:]_block_invoke";
        v14 = 1024;
        v15 = 5588;
        v16 = 1024;
        v17 = objc_msgSend(v3, "state") != 1;
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d inviteeICEResultTimer:ready to go, %d", buf, 0x22u);
      }
    }
    objc_msgSend(v3, "lock");
    if (objc_msgSend(v3, "state") != 7 && objc_msgSend(v3, "state") != 1)
    {
      if ((objc_msgSend(v3, "didSend200OK") & 1) != 0)
      {
        objc_msgSend(v3, "disconnectWithNoRemotePackets:", 212);
      }
      else
      {
        v6 = dispatch_time(0, (uint64_t)(float)(*(float *)(a1 + 40) * 1000000000.0));
        global_queue = dispatch_get_global_queue(0, 0);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __60__VCCallSession_PrivateMethods__setupCalleeSIPStartTimeout___block_invoke_1165;
        v8[3] = &unk_1E9E52300;
        v8[4] = *(_QWORD *)(a1 + 32);
        v9 = *(_DWORD *)(a1 + 40);
        dispatch_after(v6, global_queue, v8);
      }
    }
    return objc_msgSend(v3, "unlock");
  }
  return result;
}

void *__60__VCCallSession_PrivateMethods__setupCalleeSIPStartTimeout___block_invoke_1165(uint64_t a1)
{
  void *result;
  void *v3;

  result = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  if (result)
  {
    v3 = result;
    objc_msgSend(result, "lock");
    if (objc_msgSend(v3, "state") != 7 && objc_msgSend(v3, "state") != 1)
      objc_msgSend(v3, "disconnectWithNoRemotePackets:timeoutUsed:", 212, *(float *)(a1 + 40));
    return (void *)objc_msgSend(v3, "unlock");
  }
  return result;
}

- (void)addScreenConfigToSDP:(id)a3
{
  SDPMediaLine *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(SDPMediaLine);
  -[SDPMediaLine setRtpId:](v5, "setRtpId:", -[VCCallSession videoRTPID](self, "videoRTPID"));
  v6 = -[VCVideoRuleCollections supportedPayloads](+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"), "supportedPayloads");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "intValue");
        +[SDPMini setPayload:mediaLine:](SDPMini, "setPayload:mediaLine:", v11, v5);
        -[SDPMediaLine addWifiRules:cellularRules:payload:direction:](v5, "addWifiRules:cellularRules:payload:direction:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 1, v11, 1), -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 2, v11, 1), v11, 0);
        -[SDPMediaLine addWifiRules:cellularRules:payload:direction:](v5, "addWifiRules:cellularRules:payload:direction:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 1, v11, 2), -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 2, v11, 2), v11, 1);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v8);
  }
  objc_msgSend(a3, "addMediaLine:mediaType:", v5, 3);

}

- (BOOL)createSDP:(int *)a3 audioPayloadCount:(int)a4 secondaryPayloadTypes:(int *)a5 secondaryPayloadCount:(int)a6 videoPayloadTypes:(int *)a7 videoPayloadCount:(int)a8 localFeatureList:(id)a9 answerBandwidth:(int)a10 maxBandwidth:(int)a11 imageSizesSend:(imageTag *)a12 imageSendCount:(int *)a13 imageSizesRecv:(imageTag *)a14 imageRecvCount:(int *)a15 sdp:(char *)a16 numSDPBytes:(int *)a17 error:(id *)a18
{
  SDPMini *v23;
  void *v24;
  uint64_t v25;
  NSMutableArray *v26;
  int v27;
  uint64_t v28;
  NSMutableArray *v29;
  unsigned int v30;
  char *v31;
  _BOOL8 v32;
  id v33;
  unint64_t v34;
  _BOOL4 v35;
  id v36;
  void *v37;
  _BOOL4 v39;
  _BOOL4 v42;
  UInt32 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v42 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled");
  v23 = objc_alloc_init(SDPMini);
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "GKVoiceChatService");
  -[SDPMini setOrigin:](v23, "setOrigin:", v24);

  -[SDPMini setFeatureListDict:](v23, "setFeatureListDict:", a9);
  -[SDPMini setAacBlockSize:](v23, "setAacBlockSize:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->aacBlockSize));
  -[SDPMini setAllowAudioRecording:](v23, "setAllowAudioRecording:", self->allowAudioRecording);
  -[SDPMini setAudioRTPID:](v23, "setAudioRTPID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCCallSession audioRTPID](self, "audioRTPID")));
  v43 = 0;
  if ((AUIOGetAUNumber(&v43) & 0x80000000) == 0)
    -[SDPMini setAudioUnitModel:](v23, "setAudioUnitModel:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v43));
  -[SDPMini setAnswerBandwidth:](v23, "setAnswerBandwidth:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a10));
  -[SDPMini setMaxBandwidth:](v23, "setMaxBandwidth:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a11));
  if (!-[VCCallInfo sdp](self->remoteCallInfo, "sdp")
    || -[VCCallInfo supportsDynamicMaxBitrate](self->remoteCallInfo, "supportsDynamicMaxBitrate"))
  {
    -[SDPMini setAllowsDynamicMaxBitrate:](v23, "setAllowsDynamicMaxBitrate:", 1);
    -[SDPMini setAllowsContentsChangeWithAspectPreservation:](v23, "setAllowsContentsChangeWithAspectPreservation:", 1);
  }
  if ((-[VCCallSession deviceRole](self, "deviceRole") == 2 || -[VCCallSession deviceRole](self, "deviceRole") == 4)
    && -[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate")
    && -[VCCallSession basebandCodecType](self, "basebandCodecType"))
  {
    -[SDPMini setBasebandCodecType:sampleRate:](v23, "setBasebandCodecType:sampleRate:", self->basebandCodecType, self->basebandCodecSampleRate);
  }
  if (a4 >= 1)
  {
    v25 = a4;
    do
    {
      v26 = -[SDPMini audioPayloads](v23, "audioPayloads");
      -[NSMutableArray addObject:](v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *a3));
      v27 = *a3++;
      if ((v27 - 104) <= 2)
        -[SDPMini setUseSbr:blockSize:forAACFormat:](v23, "setUseSbr:blockSize:forAACFormat:", self->useSBR, self->aacBlockSize);
      --v25;
    }
    while (v25);
  }
  if (a5 && a6 && self->allowAudioSwitching && a6 >= 1)
  {
    v28 = a6;
    do
    {
      v29 = -[SDPMini secondaryAudioPayloads](v23, "secondaryAudioPayloads");
      v30 = *a5++;
      -[NSMutableArray addObject:](v29, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v30));
      --v28;
    }
    while (v28);
  }
  v31 = a16;
  v32 = v42;
  if (v42)
  {
    v39 = -[SDPMini setVideoPayloads:count:](v23, "setVideoPayloads:count:", a7, a8);
    v33 = -[SDPMini getMediaLineForType:](v23, "getMediaLineForType:", 2);
    objc_msgSend(v33, "setRtpId:", -[VCCallSession videoRTPID](self, "videoRTPID"));
    if (a7 && a8 >= 1)
    {
      v34 = 0;
      do
      {
        objc_msgSend(v33, "createVideoImageAttr:direction:dimensions:count:", a7[v34], 0, a12[v34], a13[v34]);
        objc_msgSend(v33, "createVideoImageAttr:direction:dimensions:count:", a7[v34], 1, a14[v34], a15[v34]);
        ++v34;
      }
      while (v34 < a8);
    }
    if (self->isRTCPFBEnabled)
      -[SDPMini setVideoRTCPFB:useNACK:](v23, "setVideoRTCPFB:useNACK:", 1, 1);
    v32 = v42;
    v31 = a16;
    v35 = v39;
  }
  else
  {
    v35 = 0;
  }
  v36 = -[SDPMini toStringWithVideoEnabled:](v23, "toStringWithVideoEnabled:", v32);
  if (v31
    && a17
    && ((v37 = v36, !v32) || v35)
    && v23
    && v36
    && *a17 > (int)objc_msgSend(v36, "lengthOfBytesUsingEncoding:", 4))
  {
    strlcpy(v31, (const char *)objc_msgSend(v37, "UTF8String"), *a17);
    *a17 = objc_msgSend(v37, "lengthOfBytesUsingEncoding:", 4) + 1;
    -[VCCallInfo setSdp:](self->localCallInfo, "setSdp:", v23);

    return 1;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:].cold.2();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a18, 32002, 214, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 5747), CFSTR("Could not create session description"), 0);

    return 0;
  }
}

- (void)negotiateMediaMaxBandwidth
{
  const void *v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  const void *v7;
  unsigned int v8;
  unsigned int carrierBitrateCap;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  int operatingMode;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[VCBitrateArbiter updateNegotiatedSettings:](self->callSessionBitrateArbiter, "updateNegotiatedSettings:", -[VCMediaNegotiatorBase negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"));
  v3 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  v4 = VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode);
  v5 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v3, 1, v4, self->_currentEncodeRule);
  v6 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v3, 0, v4, self->_currentEncodeRule);
  if (v3)
    CFRelease(v3);
  -[VCCallInfo setMaxBandwidth:](self->remoteCallInfo, "setMaxBandwidth:", v6);
  v7 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  if (VCConnection_IsRemoteOnCellular((uint64_t)v7))
    -[VCCallInfo setCellBandwidth:](self->remoteCallInfo, "setCellBandwidth:", v6);
  if (v7)
    CFRelease(v7);
  if (v5 >= v6)
    v8 = v6;
  else
    v8 = v5;
  if (self->operatingMode == 4)
    carrierBitrateCap = -[VCBitrateArbiter maxAllowedScreenShareCellularBitrate](self->callSessionBitrateArbiter, "maxAllowedScreenShareCellularBitrate");
  else
    carrierBitrateCap = self->carrierBitrateCap;
  if (-[VCCallSession treatAsCellular](self, "treatAsCellular") && v8 > carrierBitrateCap)
    v10 = carrierBitrateCap;
  else
    v10 = v8;
  self->callSessionBitrate = v10;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136316418;
      v16 = v11;
      v17 = 2080;
      v18 = "-[VCCallSession(PrivateMethods) negotiateMediaMaxBandwidth]";
      v19 = 1024;
      v20 = 6053;
      v21 = 1024;
      v22 = v5;
      v23 = 1024;
      v24 = v6;
      v25 = 1024;
      v26 = v10;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d localMaxBandwidth: %u remoteMaxBandwidth: %u answerBandwidth: %u", (uint8_t *)&v15, 0x2Eu);
    }
  }
  operatingMode = self->operatingMode;
  if (operatingMode == 7 || operatingMode == 2)
  {
    v14 = -[VCCallSession currentAudioCap](self, "currentAudioCap");
    AFRCSetTxCap((uint64_t)self->hAFRC, v14);
    -[AVCRateController setTargetBitrateCap:](self->_rateController, "setTargetBitrateCap:", v14);
  }
}

- (void)applyNegotiatedSettings
{
  VCMediaNegotiatorResults *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[VCMediaNegotiatorBase negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings");
  -[VCCallInfo setSupportsDynamicMaxBitrate:](self->remoteCallInfo, "setSupportsDynamicMaxBitrate:", -[VCMediaNegotiatorResults supportsDynamicMaxBitrate](v3, "supportsDynamicMaxBitrate"));
  -[VCCallSession negotiateMediaMaxBandwidth](self, "negotiateMediaMaxBandwidth");
  if (-[VCCallSession deviceRole](self, "deviceRole") == 1)
  {
    if (-[VCMediaNegotiatorResults remoteBasebandCodec](v3, "remoteBasebandCodec"))
    {
      -[VCCallSession setBasebandCodecType:](self, "setBasebandCodecType:", -[VCMediaNegotiatorResults remoteBasebandCodec](v3, "remoteBasebandCodec"));
      -[VCCallSession setBasebandCodecSampleRate:](self, "setBasebandCodecSampleRate:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[VCMediaNegotiatorResults remoteBasebandCodecSampleRate](v3, "remoteBasebandCodecSampleRate")));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v4 = VRTraceErrorLogLevelToCSTR();
        v5 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136316162;
          v10 = v4;
          v11 = 2080;
          v12 = "-[VCCallSession(PrivateMethods) applyNegotiatedSettings]";
          v13 = 1024;
          v14 = 6072;
          v15 = 2080;
          v16 = -[NSString UTF8String](-[VCMediaNegotiatorResults remoteBasebandCodec](v3, "remoteBasebandCodec"), "UTF8String");
          v17 = 1024;
          v18 = -[VCMediaNegotiatorResults remoteBasebandCodecSampleRate](v3, "remoteBasebandCodecSampleRate");
          _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Baseband codec information form negotiated settings: basebandCodecType:%s, sampleRate:%u", (uint8_t *)&v9, 0x2Cu);
        }
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[VCMediaNegotiatorResults mediaControlInfoVersion](v3, "mediaControlInfoVersion");
      v9 = 136315906;
      v10 = v6;
      v11 = 2080;
      v12 = "-[VCCallSession(PrivateMethods) applyNegotiatedSettings]";
      v13 = 1024;
      v14 = 6074;
      v15 = 1024;
      LODWORD(v16) = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d mediaControlInfoVersion = %d", (uint8_t *)&v9, 0x22u);
    }
  }
  -[VCCallInfo setUserAgent:](self->remoteCallInfo, "setUserAgent:", -[VCMediaNegotiatorResults remoteUserAgent](v3, "remoteUserAgent"));
}

+ (int)setRxPayloadList:(tagHANDLE *)a3 withPayloadTypes:(id)a4
{
  return +[VCCallSession setRxPayloadList:withPayloadTypes:isRedEnabled:](VCCallSession, "setRxPayloadList:withPayloadTypes:isRedEnabled:", a3, a4, 0);
}

+ (int)setRxPayloadList:(tagHANDLE *)a3 withPayloadTypes:(id)a4 isRedEnabled:(BOOL)a5
{
  unsigned int v8;
  _DWORD *v9;
  _DWORD *v10;
  uint64_t v11;
  unsigned int v12;
  int v14;

  v8 = objc_msgSend(a4, "count") + a5;
  v9 = malloc_type_calloc(v8, 4uLL, 0x100004052888210uLL);
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(a4, "count"))
    {
      v11 = 0;
      v12 = 1;
      do
      {
        v10[v11] = objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", v11), "intValue");
        v11 = v12;
      }
      while (objc_msgSend(a4, "count") > (unint64_t)v12++);
    }
    if (a5)
      v10[objc_msgSend(a4, "count")] = 20;
    v14 = RTPSetRxPayloadList((uint64_t)a3, v8, v10);
    free(v10);
    return v14;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        +[VCCallSession(PrivateMethods) setRxPayloadList:withPayloadTypes:isRedEnabled:].cold.1();
    }
    return -2147418109;
  }
}

- (BOOL)applyNegotiatedAudioSettings:(id *)a3
{
  VCMediaNegotiatorResultsAudio *v5;
  int operatingMode;
  uint64_t v7;
  NSObject *v8;
  int v9;
  _BOOL4 v10;
  int ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  int currentRedPayloadType;
  _BOOL4 isRedEnabled;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  unint64_t v24;
  id v25;
  unint64_t v26;
  __int128 v27;
  unint64_t v28;
  unint64_t v29;
  int v31;
  _OWORD v32[2];
  unint64_t v33;
  _OWORD v34[2];
  unint64_t v35;
  _OWORD v36[2];
  unint64_t v37;
  _BYTE v38[128];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  _BOOL4 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
  {
    LOBYTE(v14) = 1;
    return v14;
  }
  v5 = -[VCMediaNegotiatorBase negotiatedAudioSettings](self->_mediaNegotiator, "negotiatedAudioSettings");
  -[VCCallInfo setAuNumber:](self->remoteCallInfo, "setAuNumber:", -[VCMediaNegotiatorResultsAudio audioUnitModel](v5, "audioUnitModel"));
  self->allowAudioSwitching = -[VCMediaNegotiatorResultsAudio allowSwitching](v5, "allowSwitching");
  self->allowAudioRecording = -[VCMediaNegotiatorResultsAudio allowRecording](v5, "allowRecording");
  self->useSBR = -[VCMediaNegotiatorResultsAudio useSBR](v5, "useSBR");
  self->_isUseCaseWatchContinuity = +[VCPayloadUtils isUseCaseWatchContinuity:primaryPayload:](VCPayloadUtils, "isUseCaseWatchContinuity:primaryPayload:", self->_deviceRole, -[VCMediaNegotiatorResultsAudio primaryPayload](v5, "primaryPayload"));
  if (-[VCMediaNegotiatorResultsAudio dtxPayload](v5, "dtxPayload") != 128)
  {
    operatingMode = self->operatingMode;
    if (operatingMode == 7 || operatingMode == 2)
    {
      self->currentDTXPayload = (VCAudioPayload *)-[VCCallSession addAudioPayload:](self, "addAudioPayload:", -[VCMediaNegotiatorResultsAudio dtxPayload](v5, "dtxPayload"));
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v9 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentDTXPayload, "config"), "payload");
          *(_DWORD *)buf = 136315906;
          v44 = v7;
          v45 = 2080;
          v46 = "-[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]";
          v47 = 1024;
          v48 = 6120;
          v49 = 1024;
          v50 = v9;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Silence Suppression using DTX payload[%d] enabled", buf, 0x22u);
        }
      }
    }
  }
  self->_currentRedPayloadType = -[VCMediaNegotiatorResultsAudio redPayload](v5, "redPayload");
  self->_isRedEnabled = -[VCMediaNegotiatorResultsAudio redPayload](v5, "redPayload") == 20;
  v10 = -[VCDefaults disableRed](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "disableRed");
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v10)
  {
    if (ErrorLogLevelForModule >= 5)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v44 = v12;
        v45 = 2080;
        v46 = "-[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]";
        v47 = 1024;
        v48 = 6127;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Forcing Red to be disabled", buf, 0x1Cu);
      }
    }
    self->_isRedEnabled = 0;
  }
  else if (ErrorLogLevelForModule >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      currentRedPayloadType = self->_currentRedPayloadType;
      isRedEnabled = self->_isRedEnabled;
      *(_DWORD *)buf = 136316162;
      v44 = v15;
      v45 = 2080;
      v46 = "-[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:]";
      v47 = 1024;
      v48 = 6130;
      v49 = 1024;
      v50 = currentRedPayloadType;
      v51 = 1024;
      v52 = isRedEnabled;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Apply negotiated redPayload settings. RedPayloadType:%d, isRedEnabled:%d", buf, 0x28u);
    }
  }
  if (!-[VCCallSession setupAudioCodecWithPayload:](self, "setupAudioCodecWithPayload:", -[VCMediaNegotiatorResultsAudio primaryPayload](v5, "primaryPayload")))
  {
    reportingSymptom();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
      {
        v29 = 0;
        goto LABEL_31;
      }
      -[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:].cold.4();
    }
    v29 = 0;
    goto LABEL_52;
  }
  -[VCCapabilities setActualAudioCodec:](self->caps, "setActualAudioCodec:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"));
  if (self->allowAudioSwitching)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v19 = -[VCMediaNegotiatorResultsAudio secondaryPayloads](v5, "secondaryPayloads");
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v19);
          -[VCCallSession addAudioPayload:](self, "addAudioPayload:", objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "unsignedIntValue"));
        }
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v39, v38, 16);
      }
      while (v21);
    }
  }
  v24 = RTPSetRemoteSSRC((uint64_t)self->rtpHandle, -[VCMediaNegotiatorResultsAudio remoteSSRC](v5, "remoteSSRC"));
  if ((v24 & 0x80000000) != 0)
  {
    v29 = v24;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v14)
        goto LABEL_31;
      -[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:].cold.3();
    }
    goto LABEL_52;
  }
  v25 = -[VCCallSession negotiatedAudioPayloadTypes](self, "negotiatedAudioPayloadTypes");
  v26 = +[VCCallSession setRxPayloadList:withPayloadTypes:isRedEnabled:](VCCallSession, "setRxPayloadList:withPayloadTypes:isRedEnabled:", self->rtpHandle, v25, self->_isRedEnabled);
  if ((v26 & 0x80000000) != 0
    || (RTPSetCellularUniqueTag((uint64_t)self->rtpHandle, -[VCTransportSession basebandNotificationRegistrationToken](self->_transportSession, "basebandNotificationRegistrationToken")), (v26 & 0x80000000) != 0))
  {
    v29 = v26;
    goto LABEL_52;
  }
  v37 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v36[0] = v27;
  v36[1] = v27;
  v34[0] = v27;
  v34[1] = v27;
  v35 = 0xAAAAAAAAAAAAAAAALL;
  v32[0] = v27;
  v32[1] = v27;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  MakeIPPORT();
  MakeIPPORT();
  v31 = -1431655766;
  RTPCreateSockets((uint64_t)self->rtpHandle, (uint64_t)v36, (int *)v34, &v31, (int *)v32);
  v29 = v28;
  if ((v28 & 0x80000000) != 0)
  {
LABEL_52:
    LOBYTE(v14) = 0;
    goto LABEL_31;
  }
  LOBYTE(v14) = -[VCCallSession setRTPPayloads:withError:](self, "setRTPPayloads:withError:", v25, a3);
LABEL_31:
  if (a3 && !v14)
  {
    if (!*a3)
      +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32027, 200, (int)v29, 0, CFSTR("Failed to apply audio settings"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: %x."), v29));
    if ((int)VRTraceGetErrorLogLevelForModule() < 2)
      goto LABEL_41;
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (v14)
      {
        -[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:].cold.1();
LABEL_41:
        LOBYTE(v14) = 0;
      }
    }
    else
    {
      v14 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
      if (v14)
      {
        -[VCCallSession(PrivateMethods) applyNegotiatedAudioSettings:].cold.2();
        goto LABEL_41;
      }
    }
  }
  return v14;
}

- (BOOL)applyNegotiatedVideoSettings:(id *)a3
{
  VCMediaNegotiator *mediaNegotiator;
  VCMediaNegotiatorResultsVideo *v6;
  _BOOL8 v7;
  VCMediaNegotiatorResultsVideo *v8;
  int IsInterfaceOnCellularForActiveConnectionWithQuality;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  VCCallSession *v23;
  int operatingMode;
  VCMediaNegotiatorLocalConfiguration *v25;
  uint64_t v26;
  id v27;
  VCMediaNegotiatorResultsVideo *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  int v38;
  char *v39;
  NSMutableArray *v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  char *v47;
  uint64_t v48;
  __int128 v49;
  void *v51;
  NSMutableArray *obj;
  NSMutableArray *obja;
  VCCallSession *v54;
  VCMediaNegotiatorResultsVideo *v55;
  int v56;
  _OWORD v57[2];
  unint64_t v58;
  _OWORD v59[2];
  unint64_t v60;
  _OWORD v61[2];
  unint64_t v62;
  _BYTE v63[128];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[3];
  _QWORD v69[3];
  _BYTE v70[128];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (!-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation")
    || -[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly")
    || !-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  mediaNegotiator = self->_mediaNegotiator;
  if (self->operatingMode == 4)
    v6 = -[VCMediaNegotiatorBase negotiatedScreenSettings](mediaNegotiator, "negotiatedScreenSettings");
  else
    v6 = -[VCMediaNegotiatorBase negotiatedVideoSettings](mediaNegotiator, "negotiatedVideoSettings");
  v8 = v6;
  if (!-[VCMediaNegotiatorResultsVideo isSupported](v6, "isSupported"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v48 = 16;
      LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
        goto LABEL_63;
      -[VCCallSession(PrivateMethods) applyNegotiatedVideoSettings:].cold.4();
    }
    LOBYTE(v7) = 0;
    v48 = 16;
    goto LABEL_63;
  }
  IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  if (IsInterfaceOnCellularForActiveConnectionWithQuality | VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0))v10 = 2;
  else
    v10 = 1;
  v54 = self;
  v55 = v8;
  if (-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
  {
    v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload"));
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[VCDefaults forceRecvVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceRecvVideoPayload"));
    -[VCMediaNegotiatorResultsVideo setFeatureStrings:](v8, "setFeatureStrings:", +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:", 1));
  }
  else
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    obj = -[VCVideoRuleCollections supportedPayloads](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v8, "videoRuleCollections"), "supportedPayloads");
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
    if (v13)
    {
      v14 = v13;
      v11 = 0;
      v12 = 0;
      v15 = *(_QWORD *)v77;
      v16 = v10;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v77 != v15)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          if (-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v8, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", v16, objc_msgSend(v18, "unsignedIntValue"), 1))
          {
            v11 = (uint64_t)v18;
          }
          if (-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v8, "videoRuleCollections"), "getVideoRulesForTransport:payload:encodingType:", v16, objc_msgSend(v18, "unsignedIntValue"), 2))
          {
            v12 = (uint64_t)v18;
          }
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
      }
      while (v14);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
  }
  if (v12)
    v19 = 1;
  else
    v19 = v11 == 0;
  if (v19)
    v20 = v12;
  else
    v20 = v11;
  if (v11 == 0 && v20 != 0)
    v21 = (void *)v20;
  else
    v21 = (void *)v11;
  v51 = v21;
  if (v21)
    v22 = v20 == 0;
  else
    v22 = 1;
  if (v22)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
      {
LABEL_84:
        v48 = 32;
        goto LABEL_63;
      }
      -[VCCallSession(PrivateMethods) applyNegotiatedVideoSettings:].cold.3();
    }
    LOBYTE(v7) = 0;
    goto LABEL_84;
  }
  v23 = v54;
  operatingMode = v54->operatingMode;
  v25 = -[VCMediaNegotiatorBase localSettings](v54->_mediaNegotiator, "localSettings");
  if (operatingMode == 4)
    v26 = 3;
  else
    v26 = 2;
  v27 = -[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](v25, "mediaConfigurationForMediaType:", v26);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v28 = v8;
  obja = -[VCVideoRuleCollections supportedPayloads](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v8, "videoRuleCollections"), "supportedPayloads");
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v71, v70, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v72;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v72 != v31)
          objc_enumerationMutation(obja);
        v33 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
        v34 = -[NSDictionary objectForKeyedSubscript:](-[VCMediaNegotiatorResultsVideo featureStrings](v28, "featureStrings"), "objectForKeyedSubscript:", v33);
        v35 = objc_msgSend((id)objc_msgSend(v27, "videoFeatureStrings"), "objectForKeyedSubscript:", v33);
        v36 = +[VCMediaNegotiator negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:](VCMediaNegotiator, "negotiatedFeaturesStringWithLocalFeaturesString:remoteFeaturesString:", v35, v34);
        v68[0] = CFSTR("matchedFeatureListString");
        v68[1] = CFSTR("localFeatureListString");
        v68[2] = CFSTR("remoteFeatureListString");
        v69[0] = v36;
        v69[1] = v35;
        v69[2] = v34;
        v28 = v55;
        v23 = v54;
        -[NSMutableDictionary setObject:forKeyedSubscript:](v54->featureListStringDict, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 3), v33);
      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v71, v70, 16);
    }
    while (v30);
  }
  v23->videoPayload = objc_msgSend(v51, "integerValue");
  -[VCCapabilities setActualVideoCodec:](v23->caps, "setActualVideoCodec:", objc_msgSend(v51, "unsignedIntValue"));
  v37 = RTPSetRemoteSSRC((uint64_t)v23->rtpVideo, -[VCMediaNegotiatorResultsVideo remoteSSRC](v28, "remoteSSRC"));
  if ((v37 & 0x80000000) != 0)
    goto LABEL_74;
  v38 = -[NSMutableArray count](-[VCVideoRuleCollections supportedPayloads](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v28, "videoRuleCollections"), "supportedPayloads"), "count");
  v39 = (char *)malloc_type_calloc(v38, 4uLL, 0x100004052888210uLL);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v40 = -[VCVideoRuleCollections supportedPayloads](-[VCMediaNegotiatorResultsVideo videoRuleCollections](v28, "videoRuleCollections"), "supportedPayloads");
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v64, v63, 16);
  if (v41)
  {
    v42 = v41;
    v43 = 0;
    v44 = *(_QWORD *)v65;
    do
    {
      v45 = 0;
      v46 = v43;
      v47 = &v39[4 * v43];
      do
      {
        if (*(_QWORD *)v65 != v44)
          objc_enumerationMutation(v40);
        *(_DWORD *)&v47[4 * v45] = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v45), "unsignedIntValue");
        ++v45;
      }
      while (v42 != v45);
      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v64, v63, 16);
      v43 = v46 + v45;
    }
    while (v42);
  }
  v48 = RTPSetRxPayloadList((uint64_t)v23->rtpVideo, v38, v39);
  free(v39);
  if ((v48 & 0x80000000) != 0)
    goto LABEL_75;
  v37 = RTPSetRTCPFB((uint64_t)v23->rtpVideo, -[VCMediaNegotiatorResultsVideo isRTCPFBEnabled](v55, "isRTCPFBEnabled"));
  if ((v37 & 0x80000000) != 0
    || (v37 = -[VCCallSession applyFeatureListStringForPayload:](v23, "applyFeatureListStringForPayload:", objc_msgSend(v51, "unsignedIntValue")), (v37 & 0x80000000) != 0))
  {
LABEL_74:
    v48 = v37;
LABEL_75:
    LOBYTE(v7) = 0;
    goto LABEL_63;
  }
  -[VCCapabilities setActualVideoCodec:](v23->caps, "setActualVideoCodec:", LODWORD(v23->videoPayload));
  v62 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v49 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v61[0] = v49;
  v61[1] = v49;
  v59[0] = v49;
  v59[1] = v49;
  v60 = 0xAAAAAAAAAAAAAAAALL;
  v57[0] = v49;
  v57[1] = v49;
  v58 = 0xAAAAAAAAAAAAAAAALL;
  MakeIPPORT();
  MakeIPPORT();
  v56 = -1431655766;
  RTPCreateSockets((uint64_t)v23->rtpVideo, (uint64_t)v61, (int *)v59, &v56, (int *)v57);
  v48 = v7;
  LOBYTE(v7) = (int)v7 >= 0;
LABEL_63:
  if (a3 && !v7)
  {
    if (!*a3)
      +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32028, 200, (int)v48, 0, CFSTR("Failed to apply video settings"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: %x."), v48));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
        if (!v7)
          return v7;
        -[VCCallSession(PrivateMethods) applyNegotiatedVideoSettings:].cold.1();
      }
      else
      {
        LODWORD(v7) = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT);
        if (!v7)
          return v7;
        -[VCCallSession(PrivateMethods) applyNegotiatedVideoSettings:].cold.2();
      }
    }
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)applyNegotiatedCaptionsSettings
{
  VCMediaNegotiatorResultsCaptions *v3;
  VCMediaNegotiatorResultsCaptions *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[VCMediaNegotiator negotiatedCaptionsSettings](self->_mediaNegotiator, "negotiatedCaptionsSettings");
  if (v3)
  {
    v4 = v3;
    if (-[VCCallSession captionsDelegate](self, "captionsDelegate"))
    {
      -[VCAudioCaptionsDelegate didUpdateCaptionsLocalLanguages:remoteLanguages:remoteCanDisplay:](-[VCCallSession captionsDelegate](self, "captionsDelegate"), "didUpdateCaptionsLocalLanguages:remoteLanguages:remoteCanDisplay:", -[VCMediaNegotiatorResultsCaptions localLanguages](v4, "localLanguages"), -[VCMediaNegotiatorResultsCaptions remoteLanguages](v4, "remoteLanguages"), -[VCMediaNegotiatorResultsCaptions remoteCanDisplayCaptions](v4, "remoteCanDisplayCaptions"));
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315650;
        v10 = v8;
        v11 = 2080;
        v12 = "-[VCCallSession(PrivateMethods) applyNegotiatedCaptionsSettings]";
        v13 = 1024;
        v14 = 6297;
        v7 = "VCCallSession [%s] %s:%d Captions delegate callback not set";
        goto LABEL_10;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315650;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCCallSession(PrivateMethods) applyNegotiatedCaptionsSettings]";
      v13 = 1024;
      v14 = 6290;
      v7 = "VCCallSession [%s] %s:%d No pre-negotiated captions settings.";
LABEL_10:
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (void)applyNegotiatedMediaRecorderSettings
{
  VCMediaNegotiatorResultsMediaRecorder *v3;

  v3 = -[VCMediaNegotiatorBase negotiatedMediaRecorderSettings](self->_mediaNegotiator, "negotiatedMediaRecorderSettings");
  -[VCCallSessionDelegate session:setMomentsCapabilities:imageType:videoCodec:](self->delegate, "session:setMomentsCapabilities:imageType:videoCodec:", self, -[VCMediaNegotiatorResultsMediaRecorder capabilities](v3, "capabilities"), -[VCMediaNegotiatorResultsMediaRecorder imageType](v3, "imageType"), -[VCMediaNegotiatorResultsMediaRecorder videoCodec](v3, "videoCodec"));
}

- (BOOL)startMediaWithPreNegotiatedSettings:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL8 v12;
  unsigned int deviceRole;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  BOOL v17;
  tagHANDLE *hAFRC;
  unsigned int operatingMode;
  uint64_t v20;
  NSObject *v21;
  tagWRMMetricsInfo *wrmInfo;
  BOOL v23;
  double v24;
  int v25;
  int v26;
  BOOL v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  __CFData *secretKey;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *videoQueue;
  _QWORD block[7];
  _QWORD v41[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  CFTypeRef cf[6];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  const char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v48 = v5;
      v49 = 2080;
      v50 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
      v51 = 1024;
      v52 = 6308;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v7 = -[VCCallSession createRTPHandles:](self, "createRTPHandles:", a3);
  *((_BYTE *)v43 + 24) = v7;
  if (v7)
  {
    v8 = -[VCCallSession prepareSRTPWithError:](self, "prepareSRTPWithError:", a3);
    *((_BYTE *)v43 + 24) = v8;
    if (v8)
    {
      v9 = -[VCCallSession createMediaQueueHandle:](self, "createMediaQueueHandle:", a3);
      *((_BYTE *)v43 + 24) = v9;
      if (v9)
      {
        -[VCCallSession applyNegotiatedSettings](self, "applyNegotiatedSettings");
        v10 = -[VCCallSession applyNegotiatedAudioSettings:](self, "applyNegotiatedAudioSettings:", a3);
        *((_BYTE *)v43 + 24) = v10;
        if (!v10)
          goto LABEL_109;
        v11 = -[VCCallSession applyNegotiatedVideoSettings:](self, "applyNegotiatedVideoSettings:", a3);
        *((_BYTE *)v43 + 24) = v11;
        if (!v11)
          goto LABEL_109;
        -[VCCallSession applyNegotiatedCaptionsSettings](self, "applyNegotiatedCaptionsSettings");
        -[VCCallSession applyNegotiatedMediaRecorderSettings](self, "applyNegotiatedMediaRecorderSettings");
        if (!-[VCCallSession setMediaQueueStreamSettings](self, "setMediaQueueStreamSettings")
          && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.8();
        }
        v12 = 0;
        deviceRole = self->_deviceRole;
        if (deviceRole <= 5 && ((1 << deviceRole) & 0x29) != 0)
          v12 = -[VCTransportSession isHandoverSupported](self->_transportSession, "isHandoverSupported");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v14 = VRTraceErrorLogLevelToCSTR();
          v15 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v16 = "NOT ";
            v48 = v14;
            *(_DWORD *)buf = 136315906;
            v50 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
            v49 = 2080;
            if (v12)
              v16 = "";
            v51 = 1024;
            v52 = 6338;
            v53 = 2080;
            v54 = v16;
            _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: handover is %ssupported.", buf, 0x26u);
          }
        }
        -[VCConnectionManager setSupportDuplication:](self->connectionManager, "setSupportDuplication:", v12);
        -[VCConnectionManager resetConnectionStatTimers](self->connectionManager, "resetConnectionStatTimers");
        if (self->useRateControl)
        {
          v17 = -[VCCallSession startRateControl:](self, "startRateControl:", a3);
          *((_BYTE *)v43 + 24) = v17;
          if (!v17)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.7();
            }
            goto LABEL_109;
          }
          hAFRC = self->hAFRC;
          if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL)
            AFRCSetAudioPayload((uint64_t)hAFRC, -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"), -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate"));
          if (VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1))-[VCCallSession setupWCMClient](self, "setupWCMClient");
          operatingMode = self->operatingMode;
          if (operatingMode <= 7
            && ((1 << operatingMode) & 0x96) != 0
            && self->iRATSuggestionEnabled
            && self->_deviceRole != 4)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v20 = VRTraceErrorLogLevelToCSTR();
              v21 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v48 = v20;
                v49 = 2080;
                v50 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
                v51 = 1024;
                v52 = 6360;
                _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: iRAT recommendation is enabled.", buf, 0x1Cu);
              }
            }
            wrmInfo = self->wrmInfo;
            if (wrmInfo)
              WRMInitialize((uint64_t)wrmInfo, (uint64_t)self->rtpHandle);
            -[VCCallSession setupWRMClient](self, "setupWRMClient");
            operatingMode = self->operatingMode;
          }
          if (operatingMode == 7 || operatingMode == 2)
            AFRCSetTxCap((uint64_t)self->hAFRC, -[VCCallSession currentAudioCap](self, "currentAudioCap"));
        }
        v23 = -[VCCallSession createAudioTransmitter:](self, "createAudioTransmitter:", a3);
        *((_BYTE *)v43 + 24) = v23;
        if (v23)
        {
          -[VCAudioTransmitter setCellTech:remoteCellular:isIPV6:audioCap:](self->audioTransmitter, "setCellTech:remoteCellular:isIPV6:audioCap:", self->_isLocalCellular_LowestConnectionQuality, self->_isRemoteCellular_LowestConnectionQuality, self->_isConnectedOnIPv6_LowestConnectionQuality, -[VCCallSession currentAudioCap](self, "currentAudioCap"));
          VCAudioReceiver_UpdateCellTech((uint64_t)self->audioReceiver, -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1), -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0));
          v25 = VCAudioReceiver_Start(&self->audioReceiver->var0.var0, v24);
          *((_BYTE *)v43 + 24) = v25;
          if (!v25)
          {
            v32 = 4;
            goto LABEL_110;
          }
          self->state = 1;
          if (-[VCCallInfo usesInitialFECImplementation](self->remoteCallInfo, "usesInitialFECImplementation"))
            v26 = 1;
          else
            v26 = 2;
          self->fecMode = v26;
          v27 = -[VCCallSession startMediaQueue:](self, "startMediaQueue:", a3);
          *((_BYTE *)v43 + 24) = v27;
          if (v27)
          {
            if (!-[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled")
              && !-[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
            {
              -[TimingCollection removeTimingForKey:](self->perfTimers, "removeTimingForKey:", 3);
              v32 = 0;
              goto LABEL_74;
            }
            cf[0] = 0;
            -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 3);
            if (-[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v28 = VRTraceErrorLogLevelToCSTR();
                v29 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v48 = v28;
                  v49 = 2080;
                  v50 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
                  v51 = 1024;
                  v52 = 6419;
                  _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- check use dtls-srtp key", buf, 0x1Cu);
                }
              }
              if (self->srtpKeyBytes)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v30 = VRTraceErrorLogLevelToCSTR();
                  v31 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v48 = v30;
                    v49 = 2080;
                    v50 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
                    v51 = 1024;
                    v52 = 6421;
                    _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex use dtls-srtp key", buf, 0x1Cu);
                  }
                }
                v32 = 0;
                cf[0] = CFRetain(self->srtpKeyBytes);
                if (!cf[0])
                  goto LABEL_74;
LABEL_73:
                *(_DWORD *)buf = 1;
                v32 = -[VCCallSession setupEncryptionWithKey:confIndex:](self, "setupEncryptionWithKey:confIndex:", cf, buf);
                CFRelease(cf[0]);
                if ((v32 & 0x80000000) == 0)
                  goto LABEL_74;
LABEL_110:
                if (!a3)
                  goto LABEL_82;
                goto LABEL_111;
              }
            }
            else
            {
              if (!-[VCCallSession isSKEOptimizationEnabled](self, "isSKEOptimizationEnabled"))
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                {
                  v34 = VRTraceErrorLogLevelToCSTR();
                  v35 = *MEMORY[0x1E0CF2758];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v48 = v34;
                    v49 = 2080;
                    v50 = "-[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:]";
                    v51 = 1024;
                    v52 = 6408;
                    _os_log_impl(&dword_1D8A54000, v35, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex initiate exchange", buf, 0x1Cu);
                  }
                }
                -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 4);
                v36 = SIPKeyExchange((uint64_t *)&self->hSIP, -[VCCallInfo callID](self->localCallInfo, "callID"), 0, cf, 0);
                -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 4);
                v32 = 2148139061;
                if ((_DWORD)v36 != -2146828235)
                {
                  v32 = v36;
                  goto LABEL_110;
                }
LABEL_72:
                if (cf[0])
                  goto LABEL_73;
LABEL_74:
                -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 5);
                v37 = MEMORY[0x1E0C809B0];
                v41[0] = MEMORY[0x1E0C809B0];
                v41[1] = 3221225472;
                v41[2] = __69__VCCallSession_PrivateMethods__startMediaWithPreNegotiatedSettings___block_invoke;
                v41[3] = &unk_1E9E53C48;
                v41[4] = self;
                -[VCCallSession startAudioWithCompletionHandler:](self, "startAudioWithCompletionHandler:", (id)objc_msgSend(v41, "copy"));
                -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 6);
                -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 7);
                -[VCCallSession setUpFirstRemoteFrameTimer](self, "setUpFirstRemoteFrameTimer");
                videoQueue = self->videoQueue;
                block[0] = v37;
                block[1] = 3221225472;
                block[2] = __69__VCCallSession_PrivateMethods__startMediaWithPreNegotiatedSettings___block_invoke_2;
                block[3] = &unk_1E9E52378;
                block[4] = self;
                block[5] = &v42;
                block[6] = a3;
                dispatch_sync(videoQueue, block);
                -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 6);
                if (*((_BYTE *)v43 + 24))
                {
                  if (-[VCCallInfo videoIsPaused](self->localCallInfo, "videoIsPaused"))
                    -[VCCallSession setPauseVideo:force:error:](self, "setPauseVideo:force:error:", 1, 1, 0);
                  if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
                    VideoReceiver_CellTechChanged();
                  -[VCCallSession lock](self, "lock");
                  -[VCCallSession enableSessionHealthMonitor](self, "enableSessionHealthMonitor");
                  -[VCCallSession unlock](self, "unlock");
                  -[VCCallSession handlePendingPrimaryConnectionChange](self, "handlePendingPrimaryConnectionChange");
                  if (-[VCCallSession shouldNotifyDelegateDidStartBeforeAudioSetup](self, "shouldNotifyDelegateDidStartBeforeAudioSetup"))
                  {
                    -[VCCallSession notifyDelegateSessionStarted](self, "notifyDelegateSessionStarted");
                  }
                  LOBYTE(a3) = 1;
                  goto LABEL_82;
                }
                reportingSymptom();
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.3();
                }
                goto LABEL_110;
              }
              -[VCCallSession lock](self, "lock");
              secretKey = self->secretKey;
              if (secretKey)
              {
                cf[0] = CFRetain(secretKey);
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.4();
              }
              -[VCCallSession unlock](self, "unlock");
            }
            v32 = 0;
            goto LABEL_72;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.5();
          }
LABEL_109:
          v32 = 0;
          goto LABEL_110;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_109;
        VRTraceErrorLogLevelToCSTR();
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_109;
        if (*a3)
          objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.6();
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3)
          goto LABEL_109;
        VRTraceErrorLogLevelToCSTR();
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          goto LABEL_109;
        if (*a3)
          objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.9();
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3)
        goto LABEL_109;
      VRTraceErrorLogLevelToCSTR();
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        goto LABEL_109;
      if (*a3)
        objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
      -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.10();
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3)
      goto LABEL_109;
    VRTraceErrorLogLevelToCSTR();
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      goto LABEL_109;
    if (*a3)
      objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
    -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.11();
  }
  v32 = 0;
LABEL_111:
  if (!*a3)
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32029, 200, (int)v32, 0, CFSTR("Failed to start media"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error: %x."), v32));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        if (*a3)
          objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.1();
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      if (*a3)
        objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
      -[VCCallSession(PrivateMethods) startMediaWithPreNegotiatedSettings:].cold.2();
    }
  }
  LOBYTE(a3) = 0;
LABEL_82:
  _Block_object_dispose(&v42, 8);
  return (char)a3;
}

uint64_t __69__VCCallSession_PrivateMethods__startMediaWithPreNegotiatedSettings___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  _BYTE *v6;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "stopTimingForKey:", 5);
  v6 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (v6[408])
    {
      objc_msgSend(*(id *)(a1 + 32), "setPauseAudio:force:error:", 1, 1, 0);
      v6 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v6, "updateLastReceivedPacketWithTimestamp:packetType:", 4, micro() + 10.0);
  }
  else
  {
    reportingSymptom();
    objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", a3, 0);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "shouldNotifyDelegateDidStartBeforeAudioSetup");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateSessionStarted");
  return result;
}

uint64_t __69__VCCallSession_PrivateMethods__startMediaWithPreNegotiatedSettings___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "startVideo:error:", 0, *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)handleIncomingWithCallID:(unsigned int)a3 msgIn:(const char *)a4 msgOut:(char *)a5 optional:(void *)a6 confIndex:(int *)a7 error:(id *)a8
{
  VCCallSession *v8;
  void *v13;
  uint64_t v14;
  _DWORD *v15;
  uint64_t v16;
  _DWORD *v17;
  void *v18;
  uint64_t v19;
  id *v20;
  const void *v21;
  uint64_t v22;
  void *v23;
  _DWORD *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  _DWORD *v28;
  uint64_t v29;
  SDPMini *v30;
  id v31;
  uint64_t v32;
  _DWORD *v33;
  _DWORD *MaxImageDimensions;
  _DWORD *v35;
  size_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  _DWORD *v47;
  _DWORD *v48;
  size_t v49;
  _DWORD *v50;
  _DWORD *v51;
  __int128 v52;
  __int128 v53;
  unsigned int v54;
  _DWORD *v55;
  __int128 v56;
  __int128 v57;
  void *v58;
  uint64_t v59;
  void *v60;
  tagHANDLE **v61;
  char v62;
  int v63;
  int v64;
  uint64_t v65;
  void **v66;
  void **v67;
  void *v68;
  void *v69;
  _DWORD *v71;
  _DWORD *v72;
  tagHANDLE ***v73;
  int *v74;
  unsigned int v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  id *v79;
  uint64_t v80;
  uint64_t v81;
  VCCallSession *v82;
  _DWORD *v83;
  unsigned int v84;
  void *v85;
  _QWORD *v86;
  int v87;
  unsigned int v88;
  void *v89;
  uint8_t __b[2700];
  uint8_t buf[4];
  uint64_t v92;
  __int16 v93;
  const char *v94;
  __int16 v95;
  int v96;
  __int16 v97;
  int v98;
  uint64_t v99;

  v8 = self;
  v99 = *MEMORY[0x1E0C80C00];
  v89 = 0;
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.1();
    }
    goto LABEL_81;
  }
  if (!-[VCCallSession createRTPHandles:](self, "createRTPHandles:", a8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.11();
    }
LABEL_81:
    v17 = 0;
    v15 = 0;
    v62 = 0;
    v63 = 0;
    v64 = 0;
    v60 = 0;
    v24 = 0;
    v85 = 0;
    v86 = 0;
    LODWORD(v80) = 0;
    goto LABEL_57;
  }
  if (!-[VCCallSession prepareSRTPWithError:](v8, "prepareSRTPWithError:", a8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.10();
    }
    goto LABEL_88;
  }
  if (!-[VCCallSession createMediaQueueHandle:](v8, "createMediaQueueHandle:", a8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.9();
    }
LABEL_88:
    v17 = 0;
    v15 = 0;
    v62 = 0;
    v63 = 0;
    v60 = 0;
    v24 = 0;
    v85 = 0;
    v86 = 0;
    LODWORD(v80) = 0;
    goto LABEL_56;
  }
  memset(__b, 170, sizeof(__b));
  __strlcpy_chk();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", __b, 1);
  -[VCCallInfo setSdpString:](v8->remoteCallInfo, "setSdpString:", v13);

  if (!-[VCCallSession negotiatePayloads:withError:](v8, "negotiatePayloads:withError:", 0, a8))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.8();
    }
    v17 = 0;
    v15 = 0;
    goto LABEL_99;
  }
  v79 = a8;
  v14 = -[NSMutableArray count](v8->negotiatedAudioPayloads, "count");
  v15 = malloc_type_calloc((int)v14, 4uLL, 0x100004052888210uLL);
  if ((int)v14 >= 1)
  {
    v16 = 0;
    do
    {
      v15[v16] = objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](v8->negotiatedAudioPayloads, "objectAtIndex:", v16), "config"), "payload");
      ++v16;
    }
    while (v14 != v16);
  }
  v17 = malloc_type_calloc((int)v14, 4uLL, 0x100004052888210uLL);
  if (v8->allowAudioSwitching)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v8->negotiatedAudioPayloads);
    objc_msgSend(v18, "removeObject:", v8->currentAudioPayload);
    v78 = objc_msgSend(v18, "count");
    if ((int)v78 >= 1)
    {
      v19 = 0;
      do
      {
        v17[v19] = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "objectAtIndexedSubscript:", v19), "config"), "payload");
        ++v19;
      }
      while (v78 != v19);
    }

  }
  else
  {
    v78 = 0;
  }
  v20 = v79;
  if (!-[VCCallSession setRTPPayloads:withError:](v8, "setRTPPayloads:withError:", -[VCCallSession negotiatedAudioPayloadTypes](v8, "negotiatedAudioPayloadTypes"), v79))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.7();
    }
    goto LABEL_99;
  }
  if (!-[VCCallSession setMediaQueueStreamSettings](v8, "setMediaQueueStreamSettings"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.6();
    }
LABEL_99:
    v62 = 0;
    v60 = 0;
    v24 = 0;
    v85 = 0;
    v86 = 0;
    LODWORD(v80) = 0;
    goto LABEL_55;
  }
  v88 = 0;
  v21 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)v8->connectionManager, 1);
  v75 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](v8->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v21, 1, VCBitrateArbiter_ModeFromOperatingMode(v8->operatingMode), v8->_currentEncodeRule);
  if (v21)
    CFRelease(v21);
  v76 = v14;
  v77 = a5;
  -[VCCallSession negotiateMaxBandwidth:](v8, "negotiateMaxBandwidth:", &v88);
  v84 = -[VCConnectionManager getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:](v8->connectionManager, "getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
  v87 = 2700;
  v73 = (tagHANDLE ***)a6;
  v74 = a7;
  if (v8->videoPayload < 1)
  {
    v58 = 0;
    v24 = 0;
    v23 = 0;
    v27 = 0;
    v22 = 0;
    goto LABEL_52;
  }
  v22 = -[VCCallSession getAllCompatibleVideoPayloads:forMediaType:](v8, "getAllCompatibleVideoPayloads:forMediaType:", &v89, 2);
  v86 = malloc_type_calloc((int)v22, 8uLL, 0x2004093837F09uLL);
  v23 = malloc_type_calloc((int)v22, 8uLL, 0x2004093837F09uLL);
  v24 = malloc_type_calloc((int)v22, 4uLL, 0x100004052888210uLL);
  v25 = malloc_type_calloc((int)v22, 4uLL, 0x100004052888210uLL);
  if ((int)v22 < 1)
  {
    v27 = v86;
    v58 = v25;
LABEL_52:
    v59 = -[VCCallSession getCompatibleLocalFeatureListForPayloads:count:](v8, "getCompatibleLocalFeatureListForPayloads:count:", v89, v22);
    v60 = v58;
    LODWORD(v80) = v22;
    v85 = v23;
    v86 = v27;
    if (-[VCCallSession createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:](v8, "createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:", v15, v76, v17, v78, v89, v22, v59, __PAIR64__(v75, v88), v27, v24, v23, v58, v77, &v87, v20))
    {
      if (-[VCCallSession createAudioTransmitter:](v8, "createAudioTransmitter:", v20))
      {
        -[VCAudioTransmitter setCellTech:remoteCellular:isIPV6:audioCap:](v8->audioTransmitter, "setCellTech:remoteCellular:isIPV6:audioCap:", v8->_isLocalCellular_LowestConnectionQuality, v8->_isRemoteCellular_LowestConnectionQuality, v8->_isConnectedOnIPv6_LowestConnectionQuality, -[VCCallSession currentAudioCap](v8, "currentAudioCap"));
        v61 = *v73;
        *v61 = v8->rtpVideo;
        v61[1] = v8->rtpHandle;
        *v74 = 0;
        v62 = 1;
LABEL_55:
        v63 = 1;
LABEL_56:
        v64 = 1;
        goto LABEL_57;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.4();
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.5();
    }
LABEL_73:
    v62 = 0;
    goto LABEL_55;
  }
  v83 = v24;
  v71 = v17;
  v72 = v15;
  v26 = 0;
  v80 = v22;
  v81 = v22;
  v27 = v86;
  v28 = v25;
  v85 = v23;
  v82 = v8;
  while (1)
  {
    v29 = *((unsigned int *)v89 + v26);
    v30 = -[VCCallInfo sdp](v8->remoteCallInfo, "sdp");
    v31 = -[VCBitrateArbiter maxAllowedBitrateRuleForConnection:](v8->callSessionBitrateArbiter, "maxAllowedBitrateRuleForConnection:", v84);
    v32 = -[VCCallInfo isHDVideoSupported](v8->remoteCallInfo, "isHDVideoSupported");
    v27[v26] = 0;
    v83[v26] = 0;
    *((_QWORD *)v23 + v26) = 0;
    v33 = v28;
    v28[v26] = 0;
    MaxImageDimensions = getMaxImageDimensions(1, 2, v30, v29, v31, v32);
    v35 = getMaxImageDimensions(1, 1, v30, v29, v31, v32);
    v36 = v35 ? (MaxImageDimensions != 0) + 1 : (MaxImageDimensions != 0);
    v83[v26] = v36;
    if ((_DWORD)v36)
    {
      v27[v26] = malloc_type_calloc(v36, 0x24uLL, 0x10000408AA14F5FuLL);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v92 = v37;
        v93 = 2080;
        v94 = "imageAttrForAnswer";
        v95 = 1024;
        v96 = 5911;
        v97 = 1024;
        v98 = v29;
        _os_log_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d *pSendCount is zero (payload=%d)", buf, 0x22u);
      }
    }
    if (MaxImageDimensions)
    {
      v27 = v86;
      v39 = v86[v26];
      if (v39)
      {
        v40 = *(_OWORD *)MaxImageDimensions;
        v41 = *((_OWORD *)MaxImageDimensions + 1);
        *(_DWORD *)(v39 + 32) = MaxImageDimensions[8];
        *(_OWORD *)v39 = v40;
        *(_OWORD *)(v39 + 16) = v41;
      }
      free(MaxImageDimensions);
      v42 = 1;
      v28 = v33;
    }
    else
    {
      v42 = 0;
      v28 = v33;
      v27 = v86;
    }
    v8 = v82;
    if (v35)
    {
      v43 = v27[v26];
      if (v43)
      {
        v44 = v43 + 36 * v42;
        v45 = *(_OWORD *)v35;
        v46 = *((_OWORD *)v35 + 1);
        *(_DWORD *)(v44 + 32) = v35[8];
        *(_OWORD *)v44 = v45;
        *(_OWORD *)(v44 + 16) = v46;
      }
      free(v35);
    }
    v47 = getMaxImageDimensions(0, 2, v30, v29, v31, v32);
    v48 = getMaxImageDimensions(0, 1, v30, v29, v31, v32);
    v49 = v48 ? (v47 != 0) + 1 : (v47 != 0);
    v28[v26] = v49;
    if (!(_DWORD)v49)
      break;
    v50 = malloc_type_calloc(v49, 0x24uLL, 0x10000408AA14F5FuLL);
    v51 = v50;
    if (v47)
    {
      v52 = *(_OWORD *)v47;
      v53 = *((_OWORD *)v47 + 1);
      v50[8] = v47[8];
      *(_OWORD *)v50 = v52;
      *((_OWORD *)v50 + 1) = v53;
      free(v47);
      v54 = 1;
    }
    else
    {
      v54 = 0;
    }
    v23 = v85;
    if (v48)
    {
      v55 = &v51[9 * v54];
      v56 = *(_OWORD *)v48;
      v57 = *((_OWORD *)v48 + 1);
      v55[8] = v48[8];
      *(_OWORD *)v55 = v56;
      *((_OWORD *)v55 + 1) = v57;
      free(v48);
    }
    *((_QWORD *)v85 + v26++) = v51;
    if (v81 == v26)
    {
      v58 = v28;
      v17 = v71;
      v15 = v72;
      v24 = v83;
      v20 = v79;
      v22 = v80;
      goto LABEL_52;
    }
  }
  v24 = v83;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.3();
  }
  v60 = v28;
  free((void *)v86[v26]);
  v86[v26] = 0;
  v83[v26] = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    v17 = v71;
    v15 = v72;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) handleIncomingWithCallID:msgIn:msgOut:optional:confIndex:error:].cold.2();
    goto LABEL_73;
  }
  v62 = 0;
  v63 = 1;
  v64 = 1;
  v17 = v71;
  v15 = v72;
LABEL_57:
  free(v15);
  free(v17);
  free(v89);
  if ((int)v80 >= 1)
  {
    v65 = v80;
    v67 = (void **)v85;
    v66 = (void **)v86;
    do
    {
      v68 = *v66++;
      free(v68);
      v69 = *v67++;
      free(v69);
      --v65;
    }
    while (v65);
  }
  free(v86);
  free(v85);
  free(v24);
  free(v60);
  if ((v62 & 1) == 0)
  {
    if (v63)
      -[VCCallSession stopMediaQueue:](v8, "stopMediaQueue:", 0);
    if (v64)
      -[VCCallSession releaseRTPHandles](v8, "releaseRTPHandles");
    -[VCCallSession resetState](v8, "resetState");
  }
  return 0;
}

- (void)getAllPayloadsForAudio:(int *)a3 count:(int *)a4 secondaryPayloads:(int *)a5 secondaryCount:(int *)a6
{
  int v11;
  void *v12;
  int v13;
  int *v14;
  uint64_t i;
  int *v16;
  int v17;
  int *v18;

  if (a3 && a4)
  {
    v11 = +[VCAudioRuleCollection getForcedPayload](VCAudioRuleCollection, "getForcedPayload");
    if (v11 == 128)
    {
      if (self->_deviceRole)
        v12 = &unk_1E9EFA0D0;
      else
        v12 = &unk_1E9EFA0B8;
      v13 = objc_msgSend(v12, "count");
      v14 = (int *)malloc_type_calloc(1uLL, 4 * v13, 0x100004052888210uLL);
      if (v13 >= 1)
      {
        for (i = 0; i != v13; ++i)
          v14[i] = objc_msgSend((id)objc_msgSend(v12, "objectAtIndexedSubscript:", i), "intValue");
      }
      *a3 = v14;
      *a4 = v13;
      if (a5 && a6 && self->allowAudioSwitching)
      {
        v16 = (int *)malloc_type_malloc(0x14uLL, 0x1000040A86A77D5uLL);
        if (v16)
        {
          v16[4] = 13;
          *(_OWORD *)v16 = xmmword_1D910D4F0;
          *a6 = 5;
          *a5 = v16;
        }
      }
    }
    else
    {
      v17 = v11;
      v18 = (int *)malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
      *v18 = v17;
      *a3 = v18;
      *a4 = 1;
    }
  }
}

- (void)getAllPayloadsForVideo:(int *)a3 count:(int *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int ErrorLogLevelForModule;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  int *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
    return;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", -[VCVideoRuleCollections supportedPayloads](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "supportedPayloads"));
  if (!-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
  {
    objc_msgSend(v6, "removeObject:", &unk_1E9EF5270);
    goto LABEL_15;
  }
  v7 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
  v8 = -[VCDefaults forceRecvVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceRecvVideoPayload");
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
  if ((_DWORD)v7 == 128)
  {
LABEL_15:
    v18 = objc_msgSend(v6, "count");
    v19 = (int *)malloc_type_malloc(4 * v18, 0x100004052888210uLL);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __62__VCCallSession_PrivateMethods__getAllPayloadsForVideo_count___block_invoke;
    v20[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    v20[4] = v19;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v20);

    *a3 = v19;
    *a4 = v18;
    return;
  }
  v11 = v10;
  v12 = objc_msgSend(v6, "containsObject:", v9);
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v12)
  {
    if (ErrorLogLevelForModule >= 5)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v22 = v14;
        v23 = 2080;
        v24 = "-[VCCallSession(PrivateMethods) getAllPayloadsForVideo:count:]";
        v25 = 1024;
        v26 = 6720;
        v27 = 1024;
        v28 = v7;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video payload OVERRIDE to %d", buf, 0x22u);
      }
    }
    objc_msgSend(v6, "removeAllObjects");
    objc_msgSend(v6, "addObject:", v9);
    if ((_DWORD)v8 != 128)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v22 = v16;
          v23 = 2080;
          v24 = "-[VCCallSession(PrivateMethods) getAllPayloadsForVideo:count:]";
          v25 = 1024;
          v26 = 6734;
          v27 = 1024;
          v28 = v8;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video receive payload OVERRIDE to %d", buf, 0x22u);
        }
      }
      objc_msgSend(v6, "addObject:", v11);
    }
    goto LABEL_15;
  }
  if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) getAllPayloadsForVideo:count:].cold.1();
  }
  *a4 = 0;
  *a3 = 0;

}

uint64_t __62__VCCallSession_PrivateMethods__getAllPayloadsForVideo_count___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "intValue");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * a3) = result;
  return result;
}

- (void)getAllPayloadsForScreen:(int *)a3 count:(int *)a4
{
  void *v6;
  int v7;
  int *v8;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", -[VCVideoRuleCollections supportedPayloads](+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"), "supportedPayloads"));
      v7 = objc_msgSend(v6, "count");
      v8 = (int *)malloc_type_malloc(4 * v7, 0x100004052888210uLL);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __63__VCCallSession_PrivateMethods__getAllPayloadsForScreen_count___block_invoke;
      v9[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
      v9[4] = v8;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

      *a3 = v8;
      *a4 = v7;
    }
  }
}

uint64_t __63__VCCallSession_PrivateMethods__getAllPayloadsForScreen_count___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "intValue");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * a3) = result;
  return result;
}

- (BOOL)canSendSIPInviteWithError:(id *)a3
{
  int64_t sipState;
  int64_t v5;

  sipState = self->_sipState;
  if (sipState != 5)
  {
    v5 = -[VCCallSession state](self, "state");
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32002, 215, v5, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 6780), CFSTR("no longer attempting to connect"), CFSTR("State != GKVoiceChatServiceStateCallerAttemptingToConnect"));
  }
  return sipState == 5;
}

- (id)createInviteSDPWithError:(id *)a3
{
  const void *v5;
  signed int v6;
  signed int carrierBitrateCap;
  unsigned int v8;
  void **v9;
  unint64_t v10;
  void **v11;
  void **v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void **v16;
  void **v17;
  int *v18;
  int *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  _DWORD *v28;
  int v29;
  _DWORD *v30;
  int *v31;
  void **v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  unsigned int v37;
  id *v38;
  void **v39;
  void **v40;
  int *v41;
  int *v42;
  unsigned int v43;
  VCCallSession *v44;
  int *v45;
  void *v46;
  void *v47;
  char v48;
  int *v49;
  uint64_t v50;
  void *v51;
  int v52;
  unsigned int v53;
  size_t count;
  void *v55;
  void *v56;
  void *v57;
  _BYTE v58[2700];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v56 = 0;
  v57 = 0;
  count = 0;
  v55 = 0;
  v53 = 0;
  bzero(v58, 0xA8CuLL);
  v52 = 2700;
  -[VCCallSession lock](self, "lock");
  -[VCCallSession getAllPayloadsForAudio:count:secondaryPayloads:secondaryCount:](self, "getAllPayloadsForAudio:count:secondaryPayloads:secondaryCount:", &v56, &count, &v55, &v53);
  -[VCCallSession getAllPayloadsForVideo:count:](self, "getAllPayloadsForVideo:count:", &v57, (char *)&count + 4);
  v44 = self;
  if (!-[VCCallInfo supportSDPCompression](self->remoteCallInfo, "supportSDPCompression") && v57)
  {
    *(_DWORD *)v57 = 126;
    HIDWORD(count) = 1;
  }
  v5 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  v6 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v5, 1, VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode), self->_currentEncodeRule);
  if (v5)
    CFRelease(v5);
  carrierBitrateCap = v44->carrierBitrateCap;
  if (-[VCCallSession treatAsCellular](v44, "treatAsCellular") && v6 > carrierBitrateCap)
    v8 = carrierBitrateCap;
  else
    v8 = v6;
  v44->callSessionBitrate = v8;
  v9 = (void **)malloc_type_calloc(SHIDWORD(count), 8uLL, 0x2004093837F09uLL);
  v10 = 0x1E0CB3000;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) createInviteSDPWithError:].cold.1();
    }
    goto LABEL_44;
  }
  v11 = (void **)malloc_type_calloc(SHIDWORD(count), 8uLL, 0x2004093837F09uLL);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) createInviteSDPWithError:].cold.2();
    }
LABEL_44:
    v41 = 0;
    v42 = 0;
    v12 = 0;
    goto LABEL_55;
  }
  v12 = v11;
  v42 = (int *)malloc_type_calloc(SHIDWORD(count), 4uLL, 0x100004052888210uLL);
  if (!v42)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) createInviteSDPWithError:].cold.3();
    }
    v41 = 0;
    v42 = 0;
    goto LABEL_55;
  }
  v41 = (int *)malloc_type_calloc(SHIDWORD(count), 4uLL, 0x100004052888210uLL);
  if (!v41)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) createInviteSDPWithError:].cold.4();
    }
    v41 = 0;
    goto LABEL_55;
  }
  v39 = v9;
  v40 = v12;
  v38 = a3;
  v43 = -[VCConnectionManager getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:](v44->connectionManager, "getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
  v13 = HIDWORD(count);
  v14 = v57;
  v37 = v8;
  if (SHIDWORD(count) >= 1 && v57)
  {
    v15 = 0;
    v16 = v9;
    v17 = v40;
    v19 = v41;
    v18 = v42;
    do
    {
      *v17 = 0;
      *v16 = 0;
      *v19 = 0;
      v49 = v18;
      *v18 = 0;
      v20 = -[VCBitrateArbiter maxAllowedBitrateRuleForConnection:](v44->callSessionBitrateArbiter, "maxAllowedBitrateRuleForConnection:", v43);
      v48 = -[VCCallInfo isHDVideoSupported](v44->remoteCallInfo, "isHDVideoSupported");
      v50 = v15;
      v21 = *((unsigned int *)v57 + v15);
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", -[VCVideoRuleCollections supportedVideoRulesForBitrate:transportType:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "supportedVideoRulesForBitrate:transportType:payload:encodingType:", objc_msgSend(v20, "limitingRule"), 1, v21, 1));
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", -[VCVideoRuleCollections supportedVideoRulesForBitrate:transportType:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "supportedVideoRulesForBitrate:transportType:payload:encodingType:", objc_msgSend(v20, "limitingRule"), 1, v21, 2));
      v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 2, v21, 1));
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 2, v21, 2));
      remove16x9Resolutions(v23);
      remove16x9Resolutions(v24);
      if (-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
      {
        v25 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
        v26 = -[VCDefaults forceRecvVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceRecvVideoPayload");
        if (v25 != 128 && v25 != (_DWORD)v21)
        {
          objc_msgSend(v22, "removeAllObjects");
          objc_msgSend(v51, "removeAllObjects");
        }
        if (v26 != 128 && v26 != (_DWORD)v21)
        {
          objc_msgSend(v23, "removeAllObjects");
          objc_msgSend(v24, "removeAllObjects");
        }
      }
      v46 = v22;
      v27 = objc_msgSend(v22, "count");
      v28 = malloc_type_calloc(v27, 0x24uLL, 0x10000408AA14F5FuLL);
      *v16 = v28;
      v47 = v24;
      *v49 = v27;
      v18 = v49 + 1;
      addWifiInterfaceForImageDimensions(v28, v27, v48, v22);
      v29 = objc_msgSend(v23, "count");
      v30 = malloc_type_calloc(v29, 0x24uLL, 0x10000408AA14F5FuLL);
      *v19 = v29;
      v31 = v19 + 1;
      v45 = v19;
      v32 = v17;
      *v17++ = v30;
      addWifiInterfaceForImageDimensions(v30, v29, v48, v23);
      addCellInterfaceForImageDimensions(v16, v49, v21, v51);
      addCellInterfaceForImageDimensions(v32, v45, v21, v47);

      v15 = v50 + 1;
      v13 = SHIDWORD(count);
      v14 = v57;
      if (v50 + 1 >= SHIDWORD(count))
        break;
      ++v16;
      v19 = v31;
    }
    while (v57);
  }
  a3 = v38;
  v9 = v39;
  LODWORD(v36) = 0;
  HIDWORD(v36) = v37;
  if (-[VCCallSession createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:](v44, "createSDP:audioPayloadCount:secondaryPayloadTypes:secondaryPayloadCount:videoPayloadTypes:videoPayloadCount:localFeatureList:answerBandwidth:maxBandwidth:imageSizesSend:imageSendCount:imageSizesRecv:imageRecvCount:sdp:numSDPBytes:error:", v56, count, v55, v53, v14, v13, -[VCCallSession allPayloadsLocalFeaturesString](v44, "allPayloadsLocalFeaturesString"), v36, v39, v42, v40, v41, v58, &v52, v38))
  {
    v10 = 0x1E0CB3000uLL;
    v12 = v40;
    goto LABEL_27;
  }
  v10 = 0x1E0CB3000uLL;
  v12 = v40;
  if ((int)VRTraceGetErrorLogLevelForModule() < 3
    || (VRTraceErrorLogLevelToCSTR(), !os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR)))
  {
LABEL_55:
    if (!a3)
      goto LABEL_27;
    goto LABEL_56;
  }
  -[VCCallSession(PrivateMethods) createInviteSDPWithError:].cold.5();
LABEL_56:
  if (!*a3)
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32002, 215, -[VCCallSession state](v44, "state"), 0, CFSTR("Failed to create the offer SDP"), objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("Error status: 0x%08x"), 3));
LABEL_27:
  free(v42);
  free(v41);
  free(v57);
  free(v56);
  free(v55);
  if (v9)
  {
    if (SHIDWORD(count) >= 1)
    {
      v33 = 0;
      do
        free(v9[v33++]);
      while (v33 < SHIDWORD(count));
    }
    free(v9);
  }
  if (v12)
  {
    if (SHIDWORD(count) >= 1)
    {
      v34 = 0;
      do
        free(v12[v34++]);
      while (v34 < SHIDWORD(count));
    }
    free(v12);
  }
  -[VCCallSession unlock](v44, "unlock");
  return (id)objc_msgSend(*(id *)(v10 + 2368), "stringWithFormat:", CFSTR("%s"), v58);
}

- (BOOL)establishSIPDialogWithSDP:(id)a3 error:(id *)a4
{
  __int128 v7;
  int IsLTEOrNewer;
  int v9;
  unsigned int dwRTT_ice;
  int v11;
  BOOL v12;
  uint64_t v13;
  int8x16_t v15;
  char v16[2701];
  __int128 v17;
  _OWORD v18[2];
  __int128 v19;
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = vextq_s8(*(int8x16_t *)&self->rtpHandle, *(int8x16_t *)&self->rtpHandle, 8uLL);
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)((char *)v20 + 11) = v7;
  v19 = v7;
  v20[0] = v7;
  *(_OWORD *)((char *)v18 + 11) = v7;
  v17 = v7;
  v18[0] = v7;
  -[NSString UTF8String](-[VCCallInfo participantID](self->localCallInfo, "participantID"), "UTF8String");
  __strlcpy_chk();
  -[NSString UTF8String](-[VCCallInfo participantID](self->remoteCallInfo, "participantID"), "UTF8String");
  __strlcpy_chk();
  IsLTEOrNewer = 1;
  -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 1);
  -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 2);
  if (VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1))IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(-[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1));
  v9 = 1;
  if (VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0))v9 = NetworkUtils_IsLTEOrNewer(-[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0));
  if ((IsLTEOrNewer & v9) == 1)
    dwRTT_ice = self->dwRTT_ice;
  else
    dwRTT_ice = -1;
  bzero(v16, 0xA8DuLL);
  v11 = SIPConnectIPPort((uint64_t *)&self->hSIP, -[VCCallInfo callID](self->localCallInfo, "callID"), -[VCCallInfo callID](self->remoteCallInfo, "callID"), (const char *)&v19, (const char *)&v17, (char *)objc_msgSend(a3, "UTF8String"), v16, &v15, 1, dwRTT_ice);
  -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 2);
  -[VCCallSession lock](self, "lock");
  if (v11 < 0)
  {
    if (-[VCConnectionManager isConnectedOnRelayForActiveConnectionWithQuality:](self->connectionManager, "isConnectedOnRelayForActiveConnectionWithQuality:", 1))
    {
      v13 = 252;
    }
    else
    {
      v13 = 216;
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a4, 32002, v13, v11, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 6932), CFSTR("Unable to establish session with the remote participant."), CFSTR("SIPConnectIPPort failed"));
    v12 = 0;
  }
  else
  {
    -[VCCallInfo setSdpString:](self->remoteCallInfo, "setSdpString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 1));
    v12 = self->_sipState == 5;
  }
  -[VCCallSession unlock](self, "unlock");
  return v12;
}

- (BOOL)sendSIPInviteWithError:(id *)a3
{
  _BOOL4 v5;
  id v6;
  BOOL v7;
  BOOL v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  const char *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[VCCallSession lock](self, "lock");
  if (!-[VCCallSession canSendSIPInviteWithError:](self, "canSendSIPInviteWithError:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      v12 = 0;
      v13 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      if (*a3)
        v14 = (const char *)objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
      else
        v14 = "<nil>";
      v15 = 136315906;
      v16 = v10;
      v17 = 2080;
      v18 = "-[VCCallSession(PrivateMethods) sendSIPInviteWithError:]";
      v19 = 1024;
      v20 = 6949;
      v21 = 2080;
      v22 = v14;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d sendSIPInviteWithError failed state: no longer attempting to connect! error = (%s)", (uint8_t *)&v15, 0x26u);
    }
    goto LABEL_36;
  }
  v5 = -[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation");
  if (!v5)
  {
    if (-[VCCallSession createRTPHandles:](self, "createRTPHandles:", a3))
    {
      if (-[VCCallSession prepareSRTPWithError:](self, "prepareSRTPWithError:", a3))
      {
        if (-[VCCallSession createMediaQueueHandle:](self, "createMediaQueueHandle:", a3))
        {
          v6 = -[VCCallSession createInviteSDPWithError:](self, "createInviteSDPWithError:", a3);
          if (objc_msgSend(v6, "length"))
            goto LABEL_8;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCCallSession(PrivateMethods) sendSIPInviteWithError:].cold.2();
          }
          v12 = 1;
LABEL_33:
          v13 = 1;
          goto LABEL_37;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCallSession(PrivateMethods) sendSIPInviteWithError:].cold.3();
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) sendSIPInviteWithError:].cold.4();
      }
      v12 = 0;
      goto LABEL_33;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) sendSIPInviteWithError:].cold.5();
    }
LABEL_36:
    v12 = 0;
    v13 = 0;
    goto LABEL_37;
  }
  v6 = 0;
LABEL_8:
  -[VCCallSession unlock](self, "unlock");
  v7 = -[VCCallSession establishSIPDialogWithSDP:error:](self, "establishSIPDialogWithSDP:error:", v6, a3);
  -[VCCallSession lock](self, "lock");
  if (v7)
  {
    v8 = 1;
    goto LABEL_10;
  }
  v12 = !v5;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) sendSIPInviteWithError:].cold.1();
  }
  v13 = !v5;
LABEL_37:
  if (self->state)
  {
    if (v12)
      -[VCCallSession stopMediaQueue:](self, "stopMediaQueue:", 0);
    if (v13)
      -[VCCallSession releaseRTPHandles](self, "releaseRTPHandles");
    -[VCCallSession resetState](self, "resetState");
  }
  v8 = 0;
LABEL_10:
  -[VCCallSession unlock](self, "unlock");
  return v8;
}

- (BOOL)treatAsCellular
{
  int AppBooleanValue;
  BOOL v4;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("treatLTEAs4G"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 1;
  if (v4
    || (NetworkUtils_IsLTEOrNewer(-[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1)) & 1) == 0)
  {
    return VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
  }
  else
  {
    return 0;
  }
}

- (int)fillMediaControlInfo:(void *)a3
{
  -[VCConnectionManager setConnectionHealthOnControlInfo:](self->connectionManager, "setConnectionHealthOnControlInfo:");
  if (!self->useVCRC
    || !VCRateControlSetFeedbackControlInfo(-[AVCRateController feedbackController](self->_rateController, "feedbackController"), a3))
  {
    return AFRCSetFeedbackControlInfo((uint64_t)self->hAFRC, a3);
  }
  AFRCSetFeedbackControlInfo((uint64_t)self->hAFRC, 0);
  return 0;
}

- (int)processMediaControlInfo:(void *)a3 isAudio:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;

  v4 = a4;
  if (a4)
  {
    -[VCConnectionManager processConnectionHealthFromControlInfo:](self->connectionManager, "processConnectionHealthFromControlInfo:", a3);
    if (!self->useVCRC)
      goto LABEL_6;
    VCRateControlProcessFeedbackControlInfo((uint64_t)-[AVCRateController feedbackController](self->_rateController, "feedbackController"), a3);
  }
  else if (!self->useVCRC)
  {
    goto LABEL_6;
  }
  VCRateControlProcessProbingControlInfo((_DWORD *)-[AVCRateController feedbackController](self->_rateController, "feedbackController"), a3, v4);
LABEL_6:
  v7 = 56;
  if (v4)
    v7 = 48;
  return RTPProcessMediaControlInfo(*(uint64_t *)((char *)&self->super.isa + v7), a3, v4);
}

- (BOOL)createAudioTransmitter:(id *)a3
{
  VCAudioTransmitterConfig *v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  VCAudioTransmitter *v18;
  VCAudioTransmitter *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  VCAudioTransmitter *audioTransmitter;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  VCAudioTransmitter *v29;
  _BOOL8 v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  char IsOSFaultDisabled;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  _OWORD v45[3];
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  VCCallSession *v55;
  __int16 v56;
  VCAudioTransmitter *v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(VCAudioTransmitterConfig);
  -[VCAudioTransmitterConfig setRtpHandle:](v5, "setRtpHandle:", self->rtpHandle);
  -[VCAudioTransmitterConfig setControlInfoGenerator:](v5, "setControlInfoGenerator:", self->audioMediaControlInfoGenerator);
  -[VCAudioTransmitterConfig setAudioPayloads:](v5, "setAudioPayloads:", self->negotiatedAudioPayloads);
  -[VCAudioTransmitterConfig setChosenAudioPayload:](v5, "setChosenAudioPayload:", self->currentAudioPayload);
  -[VCAudioTransmitterConfig setChosenDTXPayload:](v5, "setChosenDTXPayload:", self->currentDTXPayload);
  -[VCAudioTransmitterConfig setChosenRedPayloadType:](v5, "setChosenRedPayloadType:", self->_currentRedPayloadType);
  -[VCAudioTransmitterConfig setRedEnabled:](v5, "setRedEnabled:", self->_isRedEnabled);
  -[VCAudioTransmitterConfig setIncludeRedSequenceOffset:](v5, "setIncludeRedSequenceOffset:", 1);
  v6 = *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket;
  v45[0] = *(_OWORD *)&self->_vpioFormat.format.mSampleRate;
  v45[1] = v6;
  v45[2] = *(_OWORD *)&self->_vpioFormat.format.mBitsPerChannel;
  -[VCAudioTransmitterConfig setInputFormat:](v5, "setInputFormat:", v45);
  -[VCAudioTransmitterConfig setUseRateControl:](v5, "setUseRateControl:", self->useRateControl);
  -[VCAudioTransmitterConfig setBundlingScheme:](v5, "setBundlingScheme:", 1);
  -[VCAudioTransmitterConfig setIsUseCaseWatchContinuity:](v5, "setIsUseCaseWatchContinuity:", self->_isUseCaseWatchContinuity);
  -[VCAudioTransmitterConfig setAllowAudioSwitching:](v5, "setAllowAudioSwitching:", self->allowAudioSwitching);
  -[VCAudioTransmitterConfig setAfrcHandle:](v5, "setAfrcHandle:", self->hAFRC);
  -[VCAudioTransmitterConfig setStatisticsCollector:](v5, "setStatisticsCollector:", -[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector"));
  -[VCAudioTransmitterConfig setOperatingMode:](v5, "setOperatingMode:", self->operatingMode);
  -[VCAudioTransmitterConfig setSupportsAdaptation:](v5, "setSupportsAdaptation:", !self->isGKVoiceChat);
  -[VCAudioTransmitterConfig setNeedsPacketThread:](v5, "setNeedsPacketThread:", self->isGKVoiceChat);
  -[VCAudioTransmitterConfig setTransportSession:](v5, "setTransportSession:", self->_transportSession);
  -[VCAudioTransmitterConfig setReportingAgent:](v5, "setReportingAgent:", self->reportingAgent);
  -[VCAudioTransmitterConfig setMediaQueue:](v5, "setMediaQueue:", self->hMediaQueue);
  -[VCAudioTransmitterConfig setRtpVideo:](v5, "setRtpVideo:", self->rtpVideo);
  -[VCAudioTransmitterConfig setShouldCreateRedundancyController:](v5, "setShouldCreateRedundancyController:", 1);
  if (self->isGKVoiceChat)
    v7 = 4;
  else
    v7 = 1;
  -[VCAudioTransmitterConfig setPacketsPerBundle:](v5, "setPacketsPerBundle:", v7);
  if (self->_isRedEnabled)
    v8 = &unk_1E9EFA0E8;
  else
    v8 = &unk_1E9EFA100;
  -[VCAudioTransmitterConfig setSupportedNumRedundantPayload:](v5, "setSupportedNumRedundantPayload:", v8);
  -[VCAudioTransmitterConfig setMediaControlInfoVersion:](v5, "setMediaControlInfoVersion:", -[VCMediaNegotiatorResults mediaControlInfoVersion](-[VCMediaNegotiatorBase negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "mediaControlInfoVersion"));
  -[VCAudioTransmitterConfig setAlwaysOnAudioRedundancyEnabled:](v5, "setAlwaysOnAudioRedundancyEnabled:", -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 2));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[VCAudioTransmitterConfig alwaysOnAudioRedundancyEnabled](v5, "alwaysOnAudioRedundancyEnabled");
      *(_DWORD *)buf = 136315906;
      v47 = v9;
      v48 = 2080;
      v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
      v50 = 1024;
      v51 = 7087;
      v52 = 1024;
      LODWORD(v53) = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch alwaysOnAudioRedundancyEnabled %d", buf, 0x22u);
    }
  }
  -[VCAudioTransmitterConfig setCellularAllowRedLowBitratesEnabled:](v5, "setCellularAllowRedLowBitratesEnabled:", -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 0x8000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v14 = -[VCAudioTransmitterConfig cellularAllowRedLowBitratesEnabled](v5, "cellularAllowRedLowBitratesEnabled");
      *(_DWORD *)buf = 136315906;
      v47 = v12;
      v48 = 2080;
      v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
      v50 = 1024;
      v51 = 7089;
      v52 = 1024;
      LODWORD(v53) = v14;
      _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch cellularLowTierRedundancyEnabled %d", buf, 0x22u);
    }
  }
  -[VCAudioTransmitterConfig setWifiAllowRedLowBitratesEnabled:](v5, "setWifiAllowRedLowBitratesEnabled:", -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 0x4000));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = -[VCAudioTransmitterConfig wifiAllowRedLowBitratesEnabled](v5, "wifiAllowRedLowBitratesEnabled");
      *(_DWORD *)buf = 136315906;
      v47 = v15;
      v48 = 2080;
      v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
      v50 = 1024;
      v51 = 7091;
      v52 = 1024;
      LODWORD(v53) = v17;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch wifiLowTierRedundancyEnabled %d", buf, 0x22u);
    }
  }
  -[VCAudioTransmitterConfig setTierPickerMode:](v5, "setTierPickerMode:", +[VCAudioTierPicker operatingModeToTierPickerMode:isLowLatency:preferPlistForTierTable:](VCAudioTierPicker, "operatingModeToTierPickerMode:isLowLatency:preferPlistForTierTable:", self->operatingMode, 0, 0));
  -[VCAudioTransmitterConfig setCellularAllowRedLowBitratesEnabled:](v5, "setCellularAllowRedLowBitratesEnabled:", -[VCAudioTransmitterConfig cellularAllowRedLowBitratesEnabled](v5, "cellularAllowRedLowBitratesEnabled") ^ 1);
  -[VCAudioTransmitterConfig setWifiAllowRedLowBitratesEnabled:](v5, "setWifiAllowRedLowBitratesEnabled:", -[VCAudioTransmitterConfig wifiAllowRedLowBitratesEnabled](v5, "wifiAllowRedLowBitratesEnabled") ^ 1);
  v18 = -[VCAudioTransmitter initWithConfig:]([VCAudioTransmitter alloc], "initWithConfig:", v5);
  v19 = v18;
  if (!v18)
  {
    v35 = CFSTR("Failed to allocate audio transmitter");
    v36 = 7102;
    v33 = -2147418109;
    v34 = CFSTR("Could not setup RTP");
    goto LABEL_36;
  }
  self->audioTransmitter = v18;
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_28;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    audioTransmitter = self->audioTransmitter;
    *(_DWORD *)buf = 136315906;
    v47 = v21;
    v48 = 2080;
    v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
    v50 = 1024;
    v51 = 7105;
    v52 = 2048;
    v53 = (uint64_t)audioTransmitter;
    v24 = "VCCallSession [%s] %s:%d audioTransmitter=%p";
    v25 = v22;
    v26 = 38;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = (const __CFString *)-[VCCallSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v20 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_28;
    v27 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v29 = self->audioTransmitter;
    *(_DWORD *)buf = 136316418;
    v47 = v27;
    v48 = 2080;
    v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
    v50 = 1024;
    v51 = 7105;
    v52 = 2112;
    v53 = (uint64_t)v20;
    v54 = 2048;
    v55 = self;
    v56 = 2048;
    v57 = v29;
    v24 = "VCCallSession [%s] %s:%d %@(%p) audioTransmitter=%p";
    v25 = v28;
    v26 = 58;
  }
  _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_28:
  v30 = -[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation");
  if (v30 || !-[VCCallInfo supportsSpecialAACBundle](self->remoteCallInfo, "supportsSpecialAACBundle"))
    -[VCPacketBundler setAllowLargePackets:](-[VCAudioTransmitter audioBundler](self->audioTransmitter, "audioBundler"), "setAllowLargePackets:", v30);
  -[VCAudioTransmitter setDelegate:](self->audioTransmitter, "setDelegate:", self);
  if (self->useVCRC)
  {
    -[VCAudioTransmitter setTargetBitrate:](self->audioTransmitter, "setTargetBitrate:", self->_targetBitrate);
    -[VCAudioTransmitter setRateChangeCounter:](self->audioTransmitter, "setRateChangeCounter:", self->_rateChangeCounter);
  }
  v31 = (void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  v32 = objc_msgSend(v31, "isWifiToWifi");
  if (v31)
    CFRelease(v31);
  -[VCAudioTransmitter setUseWiFiTiers:](self->audioTransmitter, "setUseWiFiTiers:", v32);
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0xFFFFFFFFLL;
LABEL_36:

  if (!v19)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      v37 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v39 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v40 = objc_msgSend((id)-[__CFString description](v34, "description"), "UTF8String");
          v41 = objc_msgSend((id)-[__CFString description](v35, "description"), "UTF8String");
          *(_DWORD *)buf = 136316162;
          v47 = v37;
          v48 = 2080;
          v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
          v50 = 1024;
          v51 = 7134;
          v52 = 2080;
          v53 = v40;
          v54 = 2080;
          v55 = (VCCallSession *)v41;
          _os_log_error_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d %s: %s", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        v43 = objc_msgSend((id)-[__CFString description](v34, "description"), "UTF8String");
        v44 = objc_msgSend((id)-[__CFString description](v35, "description"), "UTF8String");
        *(_DWORD *)buf = 136316162;
        v47 = v37;
        v48 = 2080;
        v49 = "-[VCCallSession(PrivateMethods) createAudioTransmitter:]";
        v50 = 1024;
        v51 = 7134;
        v52 = 2080;
        v53 = v43;
        v54 = 2080;
        v55 = (VCCallSession *)v44;
        _os_log_fault_impl(&dword_1D8A54000, v39, OS_LOG_TYPE_FAULT, "VCCallSession [%s] %s:%d %s: %s", buf, 0x30u);
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 217, v33, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", v36), v34, v35);
  }
  return v19 != 0;
}

- (BOOL)createRTPHandles:(id *)a3
{
  int deviceRole;
  int BoolValueForKey;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  VCMediaControlInfoGenerator *v12;
  unsigned int *Receiver;
  tagVCAudioReceiver *v14;
  int v15;
  int v16;
  int operatingMode;
  int v18;
  VCMediaNegotiatorLocalConfiguration *v19;
  uint64_t v20;
  int v21;
  VCMediaControlInfoGenerator *v22;
  int v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  VCCaptionsReceiver *v27;
  tagHANDLE *v28;
  const __CFString *v29;
  uint64_t v30;
  NSObject *v31;
  tagVCAudioReceiver *audioReceiver;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  uint64_t v36;
  NSObject *v37;
  tagVCAudioReceiver *v38;
  __CFString *v40;
  uint64_t v41;
  char IsOSFaultDisabled;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  uint64_t v59;
  __int16 v60;
  VCCallSession *v61;
  __int16 v62;
  tagVCAudioReceiver *v63;
  _QWORD v64[2];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
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
  __int128 v89;
  __int128 v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  deviceRole = self->_deviceRole;
  if (deviceRole == 3 || deviceRole == 0)
    BoolValueForKey = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-facetime-jitter-buffer-mode"), CFSTR("useErasureSensitiveMode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", deviceRole != 3), 0), "BOOLValue");
  else
    BoolValueForKey = VCDefaults_GetBoolValueForKey(CFSTR("useErasureSensitiveMode"), 1);
  v8 = BoolValueForKey;
  v9 = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-facetime-jb-high-start"), CFSTR("useHighStartMode"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_deviceRole == 0), 0), "BOOLValue");
  v50 = 0xFFFFFFFFLL;
  v51 = 0xFFFFFFFFLL;
  v10 = RTPCreateHandle(&v51, 0, 1, 0, -[VCCallSession callID](self, "callID"), (uint64_t)MediaCallback, (uint64_t)self, objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](-[VCMediaNegotiatorBase localSettings](self->_mediaNegotiator, "localSettings"), "mediaConfigurationForMediaType:", 1), "ssrc"));
  if (v10 < 0)
  {
    v16 = v10;
    v25 = CFSTR("Error creating handle");
    v26 = 7175;
  }
  else
  {
    if (-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
      v11 = -[VCMediaNegotiatorResults mediaControlInfoVersion](-[VCMediaNegotiatorBase negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "mediaControlInfoVersion");
    else
      v11 = 1;
    v12 = VCMediaControlInfoGeneratorCreateWithTypeAndVersion(0, v11);
    self->audioMediaControlInfoGenerator = v12;
    VCMediaControlInfoGeneratoSetFECFeedbackVersion(v12, (const char *)-[VCCallSession mediaControlInfoFECFeedbackVersion](self, "mediaControlInfoFECFeedbackVersion"));
    if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
      VCMediaControlInfoGeneratorAddOptions(self->audioMediaControlInfoGenerator, (const char *)1);
    VCMediaControlInfoGeneratorRegisterCallbacks(self->audioMediaControlInfoGenerator, (const char *)self, (uint64_t)VCCallSessionFillMediaControlInfoCallback, (uint64_t)VCCallSessionProcessMediaControlInfoCallback);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v64[0] = 1;
    v64[1] = v51;
    *((_QWORD *)&v78 + 1) = self->audioMediaControlInfoGenerator;
    LODWORD(v79) = -[VCCallSession callID](self, "callID");
    DWORD1(v79) = v8;
    LODWORD(v83) = 0;
    HIDWORD(v79) = 1;
    LODWORD(v80) = v9;
    BYTE4(v80) = 1;
    *((_QWORD *)&v80 + 1) = self->reportingAgent;
    BYTE10(v82) = 0;
    Receiver = VCAudioReceiver_CreateReceiver((uint64_t)v64);
    if (Receiver)
    {
      v14 = (tagVCAudioReceiver *)Receiver;
      v15 = RTPSetPacketMultiplexMode(v51, -[VCCallSession mapPacketMultiplexModeToRTPMode:](self, "mapPacketMultiplexModeToRTPMode:", self->packetMultiplexMode));
      if (v15 < 0)
      {
        v16 = v15;
        v25 = CFSTR("Error setting VTP mode");
        v26 = 7202;
      }
      else
      {
        v16 = RTPSetConnectionManager(v51, self->connectionManager);
        if ((v16 & 0x80000000) == 0)
        {
          if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
          {
            operatingMode = self->operatingMode;
            v18 = -[VCCallSession callID](self, "callID");
            v19 = -[VCMediaNegotiatorBase localSettings](self->_mediaNegotiator, "localSettings");
            if (operatingMode == 4)
              v20 = 3;
            else
              v20 = 2;
            v21 = RTPCreateHandle(&v50, 1u, 1, 0, v18, (uint64_t)MediaCallback, (uint64_t)self, objc_msgSend(-[VCMediaNegotiatorLocalConfiguration mediaConfigurationForMediaType:](v19, "mediaConfigurationForMediaType:", v20), "ssrc"));
            if (v21 < 0)
            {
              v16 = v21;
              v25 = CFSTR("Error creating video handle");
              v26 = 7211;
              v24 = 218;
              goto LABEL_46;
            }
            v22 = VCMediaControlInfoGeneratorCreateWithTypeAndVersion(1, v11);
            self->videoMediaControlInfoGenerator = v22;
            VCMediaControlInfoGeneratoSetFECFeedbackVersion(v22, (const char *)-[VCCallSession mediaControlInfoFECFeedbackVersion](self, "mediaControlInfoFECFeedbackVersion"));
            VCMediaControlInfoGeneratorRegisterCallbacks(self->videoMediaControlInfoGenerator, (const char *)self, (uint64_t)VCCallSessionFillMediaControlInfoCallback, (uint64_t)VCCallSessionProcessMediaControlInfoCallback);
            v23 = RTPSetPacketMultiplexMode(v50, -[VCCallSession mapPacketMultiplexModeToRTPMode:](self, "mapPacketMultiplexModeToRTPMode:", self->packetMultiplexMode));
            if (v23 < 0)
            {
              v16 = v23;
              v25 = CFSTR("Error setting VTP mode");
              v26 = 7216;
              v24 = 218;
              v40 = CFSTR("Could not setup video RTP");
LABEL_47:
              VCAudioReceiver_Finalize(&v14->var0.var0);
              if (v50 != 0xFFFFFFFFLL)
                CheckOutHandleDebug();
              goto LABEL_49;
            }
            v16 = RTPSetAudioReceiver(v50, (uint64_t)v14);
            v24 = 218;
            if (v16 < 0)
            {
              v25 = CFSTR("Failed to associate audio/video handles");
              v26 = 7218;
LABEL_46:
              v40 = CFSTR("Could not setup RTP");
              goto LABEL_47;
            }
          }
          else
          {
            v24 = 217;
          }
          v27 = -[VCCaptionsReceiver initWithDelegate:]([VCCaptionsReceiver alloc], "initWithDelegate:", self);
          self->_captionsReceiver = v27;
          if (!v27)
          {
            v25 = CFSTR("Failed to create the captions receiver");
            v26 = 7223;
            goto LABEL_46;
          }
          v28 = (tagHANDLE *)v50;
          self->rtpHandle = (tagHANDLE *)v51;
          self->rtpVideo = v28;
          self->audioReceiver = v14;
          if ((VCCallSession *)objc_opt_class() == self)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() < 7)
              return 1;
            v30 = VRTraceErrorLogLevelToCSTR();
            v31 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              return 1;
            audioReceiver = self->audioReceiver;
            *(_DWORD *)buf = 136315906;
            v53 = v30;
            v54 = 2080;
            v55 = "-[VCCallSession(PrivateMethods) createRTPHandles:]";
            v56 = 1024;
            v57 = 7229;
            v58 = 2048;
            v59 = (uint64_t)audioReceiver;
            v33 = "VCCallSession [%s] %s:%d audioReceiver=%p";
            v34 = v31;
            v35 = 38;
          }
          else
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v29 = (const __CFString *)-[VCCallSession performSelector:](self, "performSelector:", sel_logPrefix);
            else
              v29 = &stru_1E9E58EE0;
            if ((int)VRTraceGetErrorLogLevelForModule() < 7)
              return 1;
            v36 = VRTraceErrorLogLevelToCSTR();
            v37 = *MEMORY[0x1E0CF2758];
            if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              return 1;
            v38 = self->audioReceiver;
            *(_DWORD *)buf = 136316418;
            v53 = v36;
            v54 = 2080;
            v55 = "-[VCCallSession(PrivateMethods) createRTPHandles:]";
            v56 = 1024;
            v57 = 7229;
            v58 = 2112;
            v59 = (uint64_t)v29;
            v60 = 2048;
            v61 = self;
            v62 = 2048;
            v63 = v38;
            v33 = "VCCallSession [%s] %s:%d %@(%p) audioReceiver=%p";
            v34 = v37;
            v35 = 58;
          }
          _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
          return 1;
        }
        v25 = CFSTR("Error setting connectionManager");
        v26 = 7205;
      }
      v24 = 217;
      goto LABEL_46;
    }
    v25 = CFSTR("Failed to initialize audio receiver");
    v16 = -2147418109;
    v26 = 7199;
  }
  v24 = 217;
  v40 = CFSTR("Could not setup RTP");
LABEL_49:
  if (v51 != 0xFFFFFFFFLL)
    CheckOutHandleDebug();
  if (v16 < 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      v41 = VRTraceErrorLogLevelToCSTR();
      IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
      v43 = *MEMORY[0x1E0CF2758];
      if ((IsOSFaultDisabled & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v48 = v26;
          v44 = -[__CFString UTF8String](v40, "UTF8String");
          v45 = -[__CFString UTF8String](v25, "UTF8String");
          *(_DWORD *)buf = 136316162;
          v53 = v41;
          v54 = 2080;
          v55 = "-[VCCallSession(PrivateMethods) createRTPHandles:]";
          v56 = 1024;
          v57 = 7249;
          v58 = 2080;
          v59 = v44;
          v26 = v48;
          v60 = 2080;
          v61 = (VCCallSession *)v45;
          _os_log_error_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d %s: %s", buf, 0x30u);
        }
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        v49 = v26;
        v46 = -[__CFString UTF8String](v40, "UTF8String");
        v47 = -[__CFString UTF8String](v25, "UTF8String");
        *(_DWORD *)buf = 136316162;
        v53 = v41;
        v54 = 2080;
        v55 = "-[VCCallSession(PrivateMethods) createRTPHandles:]";
        v56 = 1024;
        v57 = 7249;
        v58 = 2080;
        v59 = v46;
        v26 = v49;
        v60 = 2080;
        v61 = (VCCallSession *)v47;
        _os_log_fault_impl(&dword_1D8A54000, v43, OS_LOG_TYPE_FAULT, "VCCallSession [%s] %s:%d %s: %s", buf, 0x30u);
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, v24, v16, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", v26), v40, v25);
  }
  return 0;
}

- (void)releaseRTPHandles
{
  VCAudioTransmitter *audioTransmitter;

  RTPSetAudioReceiver((uint64_t)self->rtpVideo, 0);
  self->rtpHandle = (tagHANDLE *)0xFFFFFFFFLL;
  self->rtpVideo = (tagHANDLE *)0xFFFFFFFFLL;
  VCAudioReceiver_Finalize(&self->audioReceiver->var0.var0);
  audioTransmitter = self->audioTransmitter;
  *(_OWORD *)&self->audioReceiver = 0u;

  RTPCloseHandle();
  RTPCloseHandle();
}

- (BOOL)prepareSRTPWithError:(id *)a3
{
  _opaque_pthread_mutex_t *p_srtpLock;
  int v6;
  int v7;
  BOOL v8;

  if (!-[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled")
    && !-[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
  {
    return 1;
  }
  p_srtpLock = &self->srtpLock;
  pthread_mutex_lock(&self->srtpLock);
  self->didPrepareSRTP = 1;
  v6 = SRTPPrepareEncryption();
  if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
    v7 = SRTPPrepareEncryption();
  else
    v7 = 0;
  pthread_mutex_unlock(p_srtpLock);
  v8 = v6 >= 0;
  if ((v6 & 0x80000000) == 0)
    goto LABEL_14;
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 259, v6, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7305), CFSTR("Could not prepare SRTP for audio RTP handle"), CFSTR("Error calling SRTPPrepareEncryption"));
  if ((int)VRTraceGetErrorLogLevelForModule() < 2)
    goto LABEL_14;
  VRTraceErrorLogLevelToCSTR();
  if ((VRTraceIsOSFaultDisabled() & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
    {
      -[VCCallSession(PrivateMethods) prepareSRTPWithError:].cold.3();
      if ((v7 & 0x80000000) == 0)
        return v8;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
  {
LABEL_14:
    if ((v7 & 0x80000000) == 0)
      return v8;
    goto LABEL_15;
  }
  -[VCCallSession(PrivateMethods) prepareSRTPWithError:].cold.4();
  if ((v7 & 0x80000000) == 0)
    return v8;
LABEL_15:
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 259, v7, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7317), CFSTR("Could not prepare SRTP for video RTP handle"), CFSTR("Error calling SRTPPrepareEncryption"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    VRTraceErrorLogLevelToCSTR();
    if ((VRTraceIsOSFaultDisabled() & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) prepareSRTPWithError:].cold.1();
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      -[VCCallSession(PrivateMethods) prepareSRTPWithError:].cold.2();
    }
  }
  return 0;
}

- (BOOL)createMediaQueueHandle:(id *)a3
{
  int Handle;

  Handle = MediaQueue_CreateHandle((uint64_t *)&self->hMediaQueue, (uint64_t)self->rtpHandle);
  if (Handle < 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) createMediaQueueHandle:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) createMediaQueueHandle:].cold.2();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 219, Handle, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7336), CFSTR("Could not setup media queue"), CFSTR("Error creating handle"));
  }
  else
  {
    MediaQueue_SetFECFeedbackVersion((uint64_t)self->hMediaQueue, -[VCCallSession mediaControlInfoFECFeedbackVersion](self, "mediaControlInfoFECFeedbackVersion"));
  }
  return Handle >= 0;
}

+ (id)getDecodePayloadTypes:(int)a3 secondaryPayloadTypes:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v5 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a4, "count") + 1);
  objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "intValue");
        if ((_DWORD)v12 != (_DWORD)v5
          && +[VCPayloadUtils isPayloadSupportedInFaceTime:](VCPayloadUtils, "isPayloadSupportedInFaceTime:", v12))
        {
          objc_msgSend(v6, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v8);
  }
  return v6;
}

- (void)negotiateFeaturesString:(id)a3 forPayload:(int)a4
{
  uint64_t v4;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  _BYTE v17[3200];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BYTE *v25;
  __int16 v26;
  int v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v4 = *(_QWORD *)&a4;
  v29[3] = *MEMORY[0x1E0C80C00];
  bzero(v17, 0xC80uLL);
  v7 = -[VCCallSession pickFeaturesStringForPayload:featureListDict:remote:](self, "pickFeaturesStringForPayload:featureListDict:remote:", v4, -[VCCallSession allPayloadsLocalFeaturesString](self, "allPayloadsLocalFeaturesString"), 0);
  v8 = -[VCCallSession pickFeaturesStringForPayload:featureListDict:remote:](self, "pickFeaturesStringForPayload:featureListDict:remote:", v4, objc_msgSend(a3, "featureListDict"), 1);
  if (-[VCCallSession setMatchedFeaturesString:localFeaturesString:remoteFeaturesString:](self, "setMatchedFeaturesString:localFeaturesString:remoteFeaturesString:", v17, v7, v8))
  {
    v28[0] = CFSTR("matchedFeatureListString");
    v29[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
    v29[1] = v7;
    v28[1] = CFSTR("localFeatureListString");
    v28[2] = CFSTR("remoteFeatureListString");
    v29[2] = v8;
    v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->featureListStringDict, "setObject:forKeyedSubscript:", v9, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v19 = v10;
        v20 = 2080;
        v21 = "-[VCCallSession(PrivateMethods) negotiateFeaturesString:forPayload:]";
        v22 = 1024;
        v23 = 7385;
        v24 = 2080;
        v25 = v17;
        v26 = 1024;
        v27 = v4;
        v12 = "VCCallSession [%s] %s:%d matched FeaturesString = [%s], for payload %d";
        v13 = v11;
        v14 = 44;
LABEL_8:
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v19 = v15;
      v20 = 2080;
      v21 = "-[VCCallSession(PrivateMethods) negotiateFeaturesString:forPayload:]";
      v22 = 1024;
      v23 = 7387;
      v24 = 1024;
      LODWORD(v25) = v4;
      v12 = "VCCallSession [%s] %s:%d setMatchedFeaturesString returned NO for payload %d";
      v13 = v16;
      v14 = 34;
      goto LABEL_8;
    }
  }
}

- (BOOL)negotiatePayloads:(id *)a3 withError:(id *)a4
{
  unsigned int v7;
  SDPMini *v8;
  SDPMini *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  _BOOL4 allowAudioRecording;
  _BOOL4 v20;
  BOOL v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 isRTCPFBEnabled;
  int v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  size_t v30;
  uint64_t v31;
  unsigned int *v32;
  uint64_t v33;
  NSMutableArray *v34;
  uint64_t v35;
  tagHANDLE *rtpVideo;
  int ErrorLogLevelForModule;
  uint64_t v38;
  int operatingMode;
  objc_class *v40;
  uint64_t IsInterfaceOnCellularForActiveConnectionWithQuality;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  uint64_t v53;
  _BOOL8 v54;
  unsigned int deviceRole;
  uint64_t v56;
  NSObject *v57;
  const char *v58;
  tagHANDLE *hAFRC;
  int v60;
  unsigned int v61;
  uint64_t v62;
  NSObject *v63;
  tagWRMMetricsInfo *wrmInfo;
  int v65;
  unsigned int v66;
  int v67;
  uint64_t v68;
  NSObject *v69;
  int64_t videoPayload;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  int v74;
  int v75;
  id *v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[12];
  int v80;
  uint64_t v81;
  SDPMini *v82;
  unsigned int v83;
  id *v84;
  _BYTE *v85;
  NSMutableArray *v86;
  id v87;
  id v88;
  _BYTE v89[128];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  const char *v97;
  __int16 v98;
  int v99;
  __int16 v100;
  _BYTE v101[10];
  _DWORD v102[4];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v7 = -[VCCallInfo callID](self->localCallInfo, "callID");
  v8 = -[SDPMini initWithString:]([SDPMini alloc], "initWithString:", -[VCCallInfo sdpString](self->remoteCallInfo, "sdpString"));
  if (v8)
  {
    v9 = v8;
    v83 = v7;
    v84 = a4;
    v10 = -[SDPMini getMediaLineForType:](v8, "getMediaLineForType:", 2);
    -[VCCallInfo setSdp:](self->remoteCallInfo, "setSdp:", v9);
    objc_msgSend((id)objc_msgSend(v10, "imageAttributeRules"), "swapSendAndReceiveRules");
    -[VCCallInfo setSupportsDynamicMaxBitrate:](self->remoteCallInfo, "setSupportsDynamicMaxBitrate:", -[SDPMini allowsDynamicMaxBitrate](v9, "allowsDynamicMaxBitrate"));
    -[VCCallInfo setAuNumber:](self->remoteCallInfo, "setAuNumber:", -[NSNumber unsignedIntegerValue](-[SDPMini audioUnitModel](v9, "audioUnitModel"), "unsignedIntegerValue"));
    -[VCCallInfo setMaxBandwidth:](self->remoteCallInfo, "setMaxBandwidth:", -[NSNumber unsignedIntegerValue](-[SDPMini maxBandwidth](v9, "maxBandwidth"), "unsignedIntegerValue"));
    self->callSessionBitrate = -[NSNumber unsignedIntegerValue](-[SDPMini answerBandwidth](v9, "answerBandwidth"), "unsignedIntegerValue");
    if (-[VCCallSession deviceRole](self, "deviceRole") == 1)
    {
      v87 = 0;
      v88 = 0;
      if (-[SDPMini getBasebandCodecType:sampleRate:](v9, "getBasebandCodecType:sampleRate:", &v88, &v87))
      {
        -[VCCallSession setBasebandCodecType:](self, "setBasebandCodecType:", v88);
        -[VCCallSession setBasebandCodecSampleRate:](self, "setBasebandCodecSampleRate:", v87);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v13 = objc_msgSend(v88, "UTF8String");
            v14 = objc_msgSend(v87, "intValue");
            *(_DWORD *)buf = 136316162;
            v95 = v11;
            v96 = 2080;
            v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
            v98 = 1024;
            v99 = 7425;
            v100 = 2080;
            *(_QWORD *)v101 = v13;
            *(_WORD *)&v101[8] = 1024;
            v102[0] = v14;
            _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SDP has basebandCodecType:%s, sampleRate:%d", buf, 0x2Cu);
          }
        }
      }
    }
    if (self->allowAudioRecording || -[SDPMini allowAudioRecording](v9, "allowAudioRecording"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          if (self->allowAudioRecording)
          {
            v17 = -[SDPMini allowAudioRecording](v9, "allowAudioRecording");
            allowAudioRecording = self->allowAudioRecording;
          }
          else
          {
            allowAudioRecording = 0;
            v17 = 0;
          }
          v20 = -[SDPMini allowAudioRecording](v9, "allowAudioRecording");
          *(_DWORD *)buf = 136316418;
          v95 = v15;
          v96 = 2080;
          v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
          v98 = 1024;
          v99 = 7431;
          v100 = 1024;
          *(_DWORD *)v101 = v17;
          *(_WORD *)&v101[4] = 1024;
          *(_DWORD *)&v101[6] = allowAudioRecording;
          LOWORD(v102[0]) = 1024;
          *(_DWORD *)((char *)v102 + 2) = v20;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d AllowAudioRecording: %d (local: %d remote: %d)", buf, 0x2Eu);
        }
      }
      v21 = self->allowAudioRecording && -[SDPMini allowAudioRecording](v9, "allowAudioRecording");
      self->allowAudioRecording = v21;
    }
    v22 = self->isRTCPFBEnabled && -[SDPMini allowRTCPFB](v9, "allowRTCPFB");
    self->isRTCPFBEnabled = v22;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        isRTCPFBEnabled = self->isRTCPFBEnabled;
        *(_DWORD *)buf = 136315906;
        v95 = v23;
        v96 = 2080;
        v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
        v98 = 1024;
        v99 = 7437;
        v100 = 1024;
        *(_DWORD *)v101 = isRTCPFBEnabled;
        _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d isRTCPFBEnabled = %d", buf, 0x22u);
      }
    }
    if (!-[NSMutableArray count](-[SDPMini secondaryAudioPayloads](v9, "secondaryAudioPayloads"), "count")
      && self->preferredAudioCodec == 104
      && !self->_deviceRole)
    {
      self->preferredAudioCodec = 105;
    }
    if (-[SDPMini aacBlockSize](v9, "aacBlockSize"))
    {
      v26 = -[NSNumber intValue](-[SDPMini aacBlockSize](v9, "aacBlockSize"), "intValue");
      if (v26 > self->aacBlockSize)
        self->aacBlockSize = v26;
    }
    else
    {
      self->aacBlockSize = 512;
    }
    RTPSetRemoteSSRC((uint64_t)self->rtpHandle, -[NSNumber intValue](-[SDPMini audioRTPID](v9, "audioRTPID"), "intValue"));
    RTPSetRemoteSSRC((uint64_t)self->rtpVideo, objc_msgSend(v10, "rtpId"));
    RTPSetCellularUniqueTag((uint64_t)self->rtpHandle, -[VCTransportSession basebandNotificationRegistrationToken](self->_transportSession, "basebandNotificationRegistrationToken"));
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", objc_msgSend(v10, "payloads"));
    objc_msgSend(v27, "removeObject:", &unk_1E9EF5270);
    v28 = objc_msgSend(v27, "count");
    v85 = v79;
    v29 = v28;
    v30 = 4 * v28;
    v31 = (v30 + 15) & 0x7FFFFFFF0;
    v32 = (unsigned int *)&v79[-v31];
    if ((_DWORD)v28)
      memset(&v79[-v31], 170, v30);
    v86 = (NSMutableArray *)a3;
    if ((int)v28 >= 1)
    {
      v33 = 0;
      do
      {
        v32[v33] = objc_msgSend((id)objc_msgSend(v27, "objectAtIndexedSubscript:", v33), "intValue");
        ++v33;
      }
      while (v28 != v33);
    }
    v34 = -[SDPMini audioPayloads](v9, "audioPayloads");
    v35 = -[SDPMini secondaryAudioPayloads](v9, "secondaryAudioPayloads");
    +[VCCallSession setRxPayloadList:withPayloadTypes:](VCCallSession, "setRxPayloadList:withPayloadTypes:", self->rtpHandle, v34);
    rtpVideo = self->rtpVideo;
    v81 = v28;
    RTPSetRxPayloadList((uint64_t)rtpVideo, v28, v32);
    RTPSetRTCPFB((uint64_t)self->rtpVideo, -[SDPMini allowRTCPFB](v9, "allowRTCPFB"));
    if (-[NSMutableArray count](v34, "count"))
      self->_isUseCaseWatchContinuity = +[VCPayloadUtils isUseCaseWatchContinuity:primaryPayload:](VCPayloadUtils, "isUseCaseWatchContinuity:primaryPayload:", self->_deviceRole, objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](v34, "objectAtIndexedSubscript:", 0), "intValue"));
    if (!-[VCCallSession choosePayload:](self, "choosePayload:", v34))
    {
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v38 = v83;
      if (ErrorLogLevelForModule >= 2)
      {
        VRTraceErrorLogLevelToCSTR();
        if ((VRTraceIsOSFaultDisabled() & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
            -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.7();
        }
        else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
        {
          -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.8();
        }
      }
      SIPHangup((uint64_t *)&self->hSIP, v38, 222);
      v53 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7492);
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v84, 32002, 222, v53, CFSTR("Could not find a compatible codec.  The remote participant may be using an incompatible version."), CFSTR("No matching codec"));
      -[VCCapabilities setActualAudioCodec:](self->caps, "setActualAudioCodec:", 0xFFFFFFFFLL);
      goto LABEL_81;
    }
    v82 = v9;
    if (!+[VCPayloadUtils isUseCaseWatchContinuity:primaryPayload:](VCPayloadUtils, "isUseCaseWatchContinuity:primaryPayload:", self->_deviceRole, -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload")))
    {
      if (!self->allowAudioSwitching
        || -[VCCallSession chooseSecondaryPayloads:](self, "chooseSecondaryPayloads:", v35))
      {
LABEL_53:
        if (!self->isGKVoiceChat)
        {
          operatingMode = self->operatingMode;
          if (operatingMode == 7 || operatingMode == 2)
            -[VCCallSession chooseDTXPayloads:](self, "chooseDTXPayloads:", v34);
        }
        -[VCCapabilities setActualAudioCodec:](self->caps, "setActualAudioCodec:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"));
        v40 = +[VCCallSession getDecodePayloadTypes:secondaryPayloadTypes:](VCCallSession, "getDecodePayloadTypes:secondaryPayloadTypes:", -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"), v35);
        v9 = v82;
        if (v86)
          v86->super.super.isa = v40;
        IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
        v42 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
        if (!-[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly"))
        {
          v43 = self->operatingMode;
          if (v43 == 4)
            v44 = 1;
          else
            v44 = v43;
          if (!-[VCCallSession chooseVideoPayload:operatingMode:isLocalOnCellular:isRemoteOnCellular:](self, "chooseVideoPayload:operatingMode:isLocalOnCellular:isRemoteOnCellular:", v27, v44, IsInterfaceOnCellularForActiveConnectionWithQuality, v42)&& -[VCCapabilities isDuplexVideoOnly](self->caps, "isDuplexVideoOnly"))
          {
            v45 = VRTraceGetErrorLogLevelForModule();
            v46 = v83;
            if (v45 >= 2)
            {
              VRTraceErrorLogLevelToCSTR();
              if ((VRTraceIsOSFaultDisabled() & 1) != 0)
              {
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                  -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.4();
              }
              else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
              {
                -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.5();
              }
            }
            -[VCCapabilities setActualVideoCodec:](self->caps, "setActualVideoCodec:", 0xFFFFFFFFLL);
            SIPHangup((uint64_t *)&self->hSIP, v46, 223);
            v78 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7541);
            +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v84, 32002, 223, v78, CFSTR("Could not find a compatible codec.  The remote participant may be using an incompatible version."), CFSTR("No matching codec"));
LABEL_81:

            -[VCCallInfo setSdp:](self->remoteCallInfo, "setSdp:", 0);
            return 0;
          }
          v47 = -[SDPMini getMediaLineForType:](v9, "getMediaLineForType:", 3);
          objc_msgSend((id)objc_msgSend(v47, "imageAttributeRules"), "swapSendAndReceiveRules");
          self->screenPayload = 0;
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v86 = -[VCVideoRuleCollections supportedPayloads](+[VCVideoRuleCollectionsScreen sharedInstance](VCVideoRuleCollectionsScreen, "sharedInstance"), "supportedPayloads");
          v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v90, v89, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v91;
            v80 = IsInterfaceOnCellularForActiveConnectionWithQuality;
            while (2)
            {
              for (i = 0; i != v49; ++i)
              {
                if (*(_QWORD *)v91 != v50)
                  objc_enumerationMutation(v86);
                v52 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
                if (objc_msgSend((id)objc_msgSend(v47, "payloads"), "containsObject:", v52))
                {
                  self->screenPayload = objc_msgSend(v52, "integerValue");
                  v9 = v82;
                  LODWORD(IsInterfaceOnCellularForActiveConnectionWithQuality) = v80;
                  goto LABEL_83;
                }
              }
              v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v90, v89, 16);
              v9 = v82;
              LODWORD(IsInterfaceOnCellularForActiveConnectionWithQuality) = v80;
              if (v49)
                continue;
              break;
            }
          }
        }
LABEL_83:

        if (!self->isGKVoiceChat)
        {
          v65 = self->operatingMode;
          if (v65 == 4 || v65 == 1)
          {
            if ((int)v81 >= 1)
            {
              do
              {
                v66 = *v32++;
                -[VCCallSession negotiateFeaturesString:forPayload:](self, "negotiateFeaturesString:forPayload:", v9, v66);
                --v29;
              }
              while (v29);
            }
            v67 = -[VCCallSession applyFeatureListStringForPayload:](self, "applyFeatureListStringForPayload:", LODWORD(self->videoPayload));
            if (v67 < 0)
            {
              v74 = v67;
              v75 = VRTraceGetErrorLogLevelForModule();
              v76 = v84;
              v77 = v83;
              if (v75 >= 2)
              {
                VRTraceErrorLogLevelToCSTR();
                if ((VRTraceIsOSFaultDisabled() & 1) != 0)
                {
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
                    -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.2();
                }
                else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
                {
                  -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.3();
                }
              }
              -[VCCapabilities setActualVideoCodec:](self->caps, "setActualVideoCodec:", 0xFFFFFFFFLL);
              SIPHangup((uint64_t *)&self->hSIP, v77, 221);
              +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", v76, 32002, 221, v74, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7581), CFSTR("SetBWEstMode critical failure."), CFSTR("Bad SDP."));

              goto LABEL_137;
            }
            -[VCCapabilities setActualVideoCodec:](self->caps, "setActualVideoCodec:", LODWORD(self->videoPayload));
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              v68 = VRTraceErrorLogLevelToCSTR();
              v69 = *MEMORY[0x1E0CF2758];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
              {
                videoPayload = self->videoPayload;
                *(_DWORD *)buf = 136315906;
                v95 = v68;
                v96 = 2080;
                v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
                v98 = 1024;
                v99 = 7591;
                v100 = 1024;
                *(_DWORD *)v101 = videoPayload;
                _os_log_impl(&dword_1D8A54000, v69, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ===== Actual Video Payload (%d) =====", buf, 0x22u);
              }
            }
          }
        }
        v54 = 0;
        deviceRole = self->_deviceRole;
        if (deviceRole <= 5 && ((1 << deviceRole) & 0x29) != 0)
          v54 = -[VCTransportSession isHandoverSupported](self->_transportSession, "isHandoverSupported");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v56 = VRTraceErrorLogLevelToCSTR();
          v57 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v58 = "NOT ";
            v95 = v56;
            *(_DWORD *)buf = 136315906;
            v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
            v96 = 2080;
            if (v54)
              v58 = "";
            v98 = 1024;
            v99 = 7595;
            v100 = 2080;
            *(_QWORD *)v101 = v58;
            _os_log_impl(&dword_1D8A54000, v57, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: handover is %ssupported.", buf, 0x26u);
          }
        }
        -[VCConnectionManager setSupportDuplication:](self->connectionManager, "setSupportDuplication:", v54);
        if (!self->useRateControl || -[VCCallSession startRateControl:](self, "startRateControl:", v84))
        {
          hAFRC = self->hAFRC;
          if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL)
            AFRCSetAudioPayload((uint64_t)hAFRC, -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload"), -[VCAudioPayload bitrate](self->currentAudioPayload, "bitrate"));
          -[VCCallSession lock](self, "lock");
          if (self->useRateControl)
            v60 = IsInterfaceOnCellularForActiveConnectionWithQuality;
          else
            v60 = 0;
          if (v60 == 1)
            -[VCCallSession setupWCMClient](self, "setupWCMClient");
          -[VCCallSession unlock](self, "unlock");
          -[VCCallSession lock](self, "lock");
          if (self->useRateControl)
          {
            v61 = self->operatingMode;
            if (v61 <= 7 && ((1 << v61) & 0x96) != 0 && self->iRATSuggestionEnabled)
            {
              if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
              {
                v62 = VRTraceErrorLogLevelToCSTR();
                v63 = *MEMORY[0x1E0CF2758];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v95 = v62;
                  v96 = 2080;
                  v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
                  v98 = 1024;
                  v99 = 7620;
                  _os_log_impl(&dword_1D8A54000, v63, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: iRAT recommendation is enabled.", buf, 0x1Cu);
                }
              }
              wrmInfo = self->wrmInfo;
              if (wrmInfo)
                WRMInitialize((uint64_t)wrmInfo, (uint64_t)self->rtpHandle);
              -[VCCallSession setupWRMClient](self, "setupWRMClient");
            }
          }
          -[VCCallSession unlock](self, "unlock");

          return 1;
        }

LABEL_137:
        -[VCCallInfo setSdp:](self->remoteCallInfo, "setSdp:", 0);
        return 0;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v71 = VRTraceErrorLogLevelToCSTR();
        v72 = *MEMORY[0x1E0CF2758];
        v73 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v95 = v71;
            v96 = 2080;
            v97 = "-[VCCallSession(PrivateMethods) negotiatePayloads:withError:]";
            v98 = 1024;
            v99 = 7508;
            _os_log_impl(&dword_1D8A54000, v72, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Not using secondary audio, no codecs found", buf, 0x1Cu);
          }
        }
        else if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.6();
        }
      }
    }
    self->allowAudioSwitching = 0;
    goto LABEL_53;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) negotiatePayloads:withError:].cold.1();
  }
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32002, 221, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7400), CFSTR("Unable to parse session description. The remote participant may be using an incompatible version."), CFSTR("Bad SDP."));
  return 0;
}

- (BOOL)negotiateMaxBandwidth:(int *)a3
{
  const void *v5;
  uint64_t v6;
  int v7;
  uint64_t callSessionBitrate;
  const void *v9;
  int v10;
  int v11;
  signed int carrierBitrateCap;
  _BOOL4 v13;
  signed int v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int operatingMode;
  uint64_t v19;
  int v21;
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return a3 != 0;
  v5 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  v6 = VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode);
  v7 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v5, 1, v6, self->_currentEncodeRule);
  callSessionBitrate = self->callSessionBitrate;
  v9 = (const void *)VCConnectionManager_CopyPrimaryConnection((uint64_t)self->connectionManager);
  if (VCConnection_IsRemoteOnCellular((uint64_t)v9))
    -[VCCallInfo setCellBandwidth:](self->remoteCallInfo, "setCellBandwidth:", callSessionBitrate);
  if (v9)
    CFRelease(v9);
  if (!(_DWORD)callSessionBitrate)
  {
    if (!-[VCCallSession isLocalOrRemoteOnCellular](self, "isLocalOrRemoteOnCellular"))
    {
      LODWORD(callSessionBitrate) = 300;
      if (!v5)
        goto LABEL_13;
      goto LABEL_12;
    }
    v10 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v5, 0, v6, self->_currentEncodeRule);
    if (v10 <= 100)
      LODWORD(callSessionBitrate) = 100;
    else
      LODWORD(callSessionBitrate) = v10;
  }
  if (v5)
LABEL_12:
    CFRelease(v5);
LABEL_13:
  if (v7 >= (int)callSessionBitrate)
    v11 = callSessionBitrate;
  else
    v11 = v7;
  *a3 = v11;
  if (self->operatingMode == 4)
    carrierBitrateCap = -[VCBitrateArbiter maxAllowedScreenShareCellularBitrate](self->callSessionBitrateArbiter, "maxAllowedScreenShareCellularBitrate");
  else
    carrierBitrateCap = self->carrierBitrateCap;
  v13 = -[VCCallSession treatAsCellular](self, "treatAsCellular");
  v14 = *a3;
  if (v13 && v14 > carrierBitrateCap)
  {
    *a3 = carrierBitrateCap;
    v14 = carrierBitrateCap;
  }
  self->callSessionBitrate = v14;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = *a3;
      v21 = 136316418;
      v22 = v15;
      v23 = 2080;
      v24 = "-[VCCallSession(PrivateMethods) negotiateMaxBandwidth:]";
      v25 = 1024;
      v26 = 7672;
      v27 = 1024;
      v28 = v7;
      v29 = 1024;
      v30 = callSessionBitrate;
      v31 = 1024;
      v32 = v17;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d localMaxBandwidth: %d remoteMaxBandwidth: %d answerBandwidth: %d", (uint8_t *)&v21, 0x2Eu);
    }
  }
  operatingMode = self->operatingMode;
  if (operatingMode == 7 || operatingMode == 2)
  {
    v19 = -[VCCallSession currentAudioCap](self, "currentAudioCap");
    AFRCSetTxCap((uint64_t)self->hAFRC, v19);
    -[AVCRateController setTargetBitrateCap:](self->_rateController, "setTargetBitrateCap:", v19);
  }
  return a3 != 0;
}

- (BOOL)canNegotiateVideoPayload:(int)a3 supportedPayloads:(id)a4 isLocalOnCellular:(BOOL)a5 isRemoteOnCellular:(BOOL)a6
{
  int v7;
  void *v8;

  if (a3 == 100)
  {
    if (-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation", *(_QWORD *)&a3, a4, a5, a6))
    {
      if ((-[NSMutableArray containsObject:](-[VCVideoRuleCollections supportedPayloads](-[VCMediaNegotiatorResultsVideo videoRuleCollections](-[VCMediaNegotiatorBase negotiatedVideoSettings](self->_mediaNegotiator, "negotiatedVideoSettings"), "videoRuleCollections"), "supportedPayloads"), "containsObject:", &unk_1E9EF5270) & 1) == 0)
      {
        LOBYTE(v7) = 0;
        return v7;
      }
    }
    else
    {
      v7 = -[VCCallSession doesVideoPayloadMatchRemoteImageAttributeRules:](self, "doesVideoPayloadMatchRemoteImageAttributeRules:", &unk_1E9EF5270);
      if (!v7)
        return v7;
    }
    if (!-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI")
      || -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload") != 100)
    {
      LOBYTE(v7) = 1;
      return v7;
    }
    v8 = &unk_1E9EF5270;
    goto LABEL_6;
  }
  if (a3 == 123)
  {
    v8 = &unk_1E9EF52B8;
LABEL_6:
    LOBYTE(v7) = objc_msgSend(a4, "containsObject:", v8, a4, a5, a6);
    return v7;
  }
  LOBYTE(v7) = a3 == 126;
  return v7;
}

- (BOOL)chooseVideoPayload:(id)a3 operatingMode:(int)a4 isLocalOnCellular:(BOOL)a5 isRemoteOnCellular:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t i;
  int v18;
  BOOL v19;
  int64_t v20;
  _BOOL4 v21;
  int v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v6 = a6;
  v7 = a5;
  v41 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    return 0;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  if (!v11)
  {
    if (a4 == 4)
    {
LABEL_20:
      v19 = 0;
      self->videoPayload = 128;
      return v19;
    }
    goto LABEL_31;
  }
  v12 = v11;
  v27 = v6;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = *(_QWORD *)v38;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v38 != v16)
        objc_enumerationMutation(a3);
      v18 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "unsignedIntValue");
      switch(v18)
      {
        case 'd':
          v15 = 1;
          break;
        case '{':
          v14 = 1;
          break;
        case '~':
          v13 = 1;
          break;
      }
    }
    v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v36, 16);
  }
  while (v12);
  if (a4 == 4)
  {
    if ((v14 & 1) != 0)
    {
      self->videoPayload = 123;
      return 1;
    }
    goto LABEL_20;
  }
  if ((v15 & 1) != 0)
  {
    v20 = 100;
    if (-[VCCallSession canNegotiateVideoPayload:supportedPayloads:isLocalOnCellular:isRemoteOnCellular:](self, "canNegotiateVideoPayload:supportedPayloads:isLocalOnCellular:isRemoteOnCellular:", 100, -[VCVideoRuleCollections supportedPayloads](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "supportedPayloads"), v7, v27))
    {
      goto LABEL_28;
    }
  }
  if ((v14 & 1) == 0)
  {
    if ((v13 & 1) != 0)
    {
      v19 = 1;
      v20 = 126;
      goto LABEL_32;
    }
LABEL_31:
    v19 = 0;
    v20 = -1;
    goto LABEL_32;
  }
  v21 = -[VCCallSession canNegotiateVideoPayload:supportedPayloads:isLocalOnCellular:isRemoteOnCellular:](self, "canNegotiateVideoPayload:supportedPayloads:isLocalOnCellular:isRemoteOnCellular:", 123, -[VCVideoRuleCollections supportedPayloads](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "supportedPayloads"), v7, v27);
  if (v21)
    v20 = 123;
  else
    v20 = 126;
  if (((v21 | v13) & 1) == 0)
    goto LABEL_31;
LABEL_28:
  v19 = 1;
LABEL_32:
  self->videoPayload = v20;
  if (-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
  {
    v22 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
    if (v22 != 128)
    {
      v23 = v22;
      self->videoPayload = v22;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v29 = v24;
          v30 = 2080;
          v31 = "-[VCCallSession(PrivateMethods) chooseVideoPayload:operatingMode:isLocalOnCellular:isRemoteOnCellular:]";
          v32 = 1024;
          v33 = 7791;
          v34 = 1024;
          v35 = v23;
          _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video payload OVERRIDE to %d", buf, 0x22u);
        }
      }
      return 1;
    }
  }
  return v19;
}

- (BOOL)isValidVideoPayloadOverride:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  v4 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
  v5 = -[VCDefaults forceRecvVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceRecvVideoPayload");
  if (((_DWORD)v4 == 128
     || (v6 = objc_msgSend(a3, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4))) != 0)
    && ((_DWORD)v5 == 128
     || (v6 = objc_msgSend(a3, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5))) != 0))
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)doesVideoPayloadMatchRemoteImageAttributeRules:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = -[SDPMini getMediaLineForType:](-[VCCallInfo sdp](self->remoteCallInfo, "sdp"), "getMediaLineForType:", 2);
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageAttributeRules"), "imageAttributeRules"), "objectForKeyedSubscript:", CFSTR("cellRules"));
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "imageAttributeRules"), "imageAttributeRules"), "objectForKeyedSubscript:", CFSTR("wifiRules"));
  v7 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("send"));
  v8 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("send"));
  v9 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recv"));
  v10 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("recv"));
  if (!objc_msgSend(v7, "objectForKeyedSubscript:", a3) && !objc_msgSend(v8, "objectForKeyedSubscript:", a3))
    return (objc_msgSend(v9, "objectForKeyedSubscript:", a3) || objc_msgSend(v10, "objectForKeyedSubscript:", a3))
        && -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(a3, "intValue"), 2) != 0;
  v11 = 1;
  if (!-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(a3, "intValue"), 1))return (objc_msgSend(v9, "objectForKeyedSubscript:", a3) || objc_msgSend(v10, "objectForKeyedSubscript:", a3))&& -[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](+[VCVideoRuleCollectionsCamera sharedInstance](VCVideoRuleCollectionsCamera, "sharedInstance"), "getVideoRulesForTransport:payload:encodingType:", 1, objc_msgSend(a3, "intValue"), 2) != 0;
  return v11;
}

- (int)getAllCompatibleVideoPayloads:(int *)a3 forMediaType:(int)a4
{
  uint64_t v4;
  __objc2_class **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  int *v19;
  _QWORD v21[5];
  _QWORD v22[7];
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v4 = *(_QWORD *)&a4;
  v31 = *MEMORY[0x1E0C80C00];
  if (a4 == 2)
  {
    v7 = off_1E9E4D680;
    goto LABEL_5;
  }
  if (a4 == 3)
  {
    v7 = off_1E9E4D688;
LABEL_5:
    v8 = -[__objc2_class supportedPayloads](-[__objc2_class sharedInstance](*v7, "sharedInstance"), "supportedPayloads");
    v9 = (void *)objc_msgSend(-[SDPMini getMediaLineForType:](-[VCCallInfo sdp](self->remoteCallInfo, "sdp"), "getMediaLineForType:", v4), "payloads");
    goto LABEL_7;
  }
  v9 = 0;
  v8 = 0;
LABEL_7:
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __76__VCCallSession_PrivateMethods__getAllCompatibleVideoPayloads_forMediaType___block_invoke;
  v22[3] = &unk_1E9E55CD8;
  v22[4] = v8;
  v22[5] = self;
  v22[6] = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v22);
  if (!-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
  {
    if (objc_msgSend(v10, "containsObject:", &unk_1E9EF52B8)
      && objc_msgSend(v10, "containsObject:", &unk_1E9EF52D0))
    {
      objc_msgSend(v10, "removeObject:", &unk_1E9EF52D0);
    }
    objc_msgSend(v10, "removeObject:", &unk_1E9EF5270);
    goto LABEL_23;
  }
  if (-[VCCallSession isValidVideoPayloadOverride:](self, "isValidVideoPayloadOverride:", v10))
  {
    v12 = -[VCDefaults forceVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceVideoPayload");
    v13 = -[VCDefaults forceRecvVideoPayload](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceRecvVideoPayload");
    objc_msgSend(v10, "removeAllObjects");
    if ((_DWORD)v12 != 128)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v24 = v14;
          v25 = 2080;
          v26 = "-[VCCallSession(PrivateMethods) getAllCompatibleVideoPayloads:forMediaType:]";
          v27 = 1024;
          v28 = 7869;
          v29 = 1024;
          v30 = v12;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video payload OVERRIDE to %d", buf, 0x22u);
        }
      }
      objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12));
    }
    if ((_DWORD)v13 != 128)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v24 = v16;
          v25 = 2080;
          v26 = "-[VCCallSession(PrivateMethods) getAllCompatibleVideoPayloads:forMediaType:]";
          v27 = 1024;
          v28 = 7874;
          v29 = 1024;
          v30 = v13;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Video receive payload OVERRIDE to %d", buf, 0x22u);
        }
      }
      objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13));
    }
LABEL_23:
    v18 = objc_msgSend(v10, "count");
    v19 = (int *)malloc_type_malloc(4 * v18, 0x100004052888210uLL);
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __76__VCCallSession_PrivateMethods__getAllCompatibleVideoPayloads_forMediaType___block_invoke_1275;
    v21[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
    v21[4] = v19;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v21);
    goto LABEL_28;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) getAllCompatibleVideoPayloads:forMediaType:].cold.1();
  }
  v19 = 0;
  v18 = 0;
LABEL_28:
  *a3 = v19;
  return v18;
}

uint64_t __76__VCCallSession_PrivateMethods__getAllCompatibleVideoPayloads_forMediaType___block_invoke(id *a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(a1[4], "containsObject:", a2);
  if ((_DWORD)result)
  {
    result = objc_msgSend(a1[5], "doesVideoPayloadMatchRemoteImageAttributeRules:", a2);
    if ((_DWORD)result)
      return objc_msgSend(a1[6], "addObject:", a2);
  }
  return result;
}

uint64_t __76__VCCallSession_PrivateMethods__getAllCompatibleVideoPayloads_forMediaType___block_invoke_1275(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "intValue");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * a3) = result;
  return result;
}

- (id)getCompatibleLocalFeatureListForPayloads:(int *)a3 count:(int)a4
{
  void *v7;
  __int128 v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (a4 >= 1)
  {
    v9 = a4;
    *(_QWORD *)&v8 = 136316162;
    v20 = v8;
    do
    {
      v10 = *a3++;
      v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10, v20);
      v12 = objc_msgSend(-[VCCallSession allPayloadsLocalFeaturesString](self, "allPayloadsLocalFeaturesString"), "objectForKeyedSubscript:", v11);
      if (v12)
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v11);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        {
          v15 = "<nil>";
          if (v11)
            v15 = (const char *)objc_msgSend((id)objc_msgSend(v11, "description"), "UTF8String");
          *(_DWORD *)buf = v20;
          v22 = v13;
          v23 = 2080;
          v24 = "-[VCCallSession(PrivateMethods) getCompatibleLocalFeatureListForPayloads:count:]";
          v25 = 1024;
          v26 = 7916;
          v27 = 2080;
          v28 = v15;
          v29 = 1024;
          v30 = a4;
          _os_log_error_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d filterFeatureListForPayloads: Unexpected for %s count: %d", buf, 0x2Cu);
        }
      }
      --v9;
    }
    while (v9);
  }
  if (!a4)
  {
    v16 = objc_msgSend(-[VCCallSession allPayloadsLocalFeaturesString](self, "allPayloadsLocalFeaturesString"), "objectForKeyedSubscript:", &unk_1E9EF52D0);
    if (v16)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, &unk_1E9EF52D0);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) getCompatibleLocalFeatureListForPayloads:count:].cold.1(v17, v18);
    }
  }
  return v7;
}

- (BOOL)setRTPPayloads:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  size_t v12;
  char *v13;
  int deviceRole;
  BOOL v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  char *v21;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  id *v28;
  int v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v28 = a4;
  v38 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "count");
  v7 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v28 - v9;
  if (v7)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v12 = v8;
    v13 = (char *)&v28 - v9;
    do
    {
      *((_DWORD *)v13 + 8) = -1431655766;
      *(_OWORD *)v13 = v11;
      *((_OWORD *)v13 + 1) = v11;
      v13 += 36;
      v12 -= 36;
    }
    while (v12);
  }
  else
  {
    v8 = 0;
  }
  bzero(v10, v8);
  deviceRole = self->_deviceRole;
  if (deviceRole)
    v15 = deviceRole == 3;
  else
    v15 = 1;
  v16 = !v15;
  v29 = v16;
  if (objc_msgSend(a3, "count"))
  {
    v17 = 0;
    v18 = 1;
    do
    {
      v19 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", v17), "intValue");
      v20 = -[VCCallSession newConfigForPayloadType:](self, "newConfigForPayloadType:", v19);
      v21 = &v10[36 * v17];
      *(_DWORD *)v21 = objc_msgSend(v20, "payload");
      *((_DWORD *)v21 + 1) = objc_msgSend(v20, "payload");
      *((_DWORD *)v21 + 3) = objc_msgSend(v20, "flags");
      *((_DWORD *)v21 + 2) = objc_msgSend(v20, "samplesPerFrame");
      *((_DWORD *)v21 + 5) = +[VCPayloadUtils canBundleExternallyForPayload:forBundlingScheme:operatingMode:](VCPayloadUtils, "canBundleExternallyForPayload:forBundlingScheme:operatingMode:", v19, 1, self->operatingMode);

      if ((v19 - 97) <= 1)
        v10[36 * v17 + 16] = v29;
      v17 = v18;
    }
    while (objc_msgSend(a3, "count") > (unint64_t)v18++);
  }
  if (VCAudioReceiver_SetupDecoders((uint64_t)self->audioReceiver, (uint64_t)v10, objc_msgSend(a3, "count"), (__int128 *)&self->_vpioFormat, 0))
  {
    v23 = RTPSetSourceRate((uint64_t)self->rtpHandle, self->_vpioFormat.format.mSampleRate);
    if ((v23 & 0x80000000) == 0)
      return v23 >= 0;
  }
  else
  {
    v23 = -2147418108;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v24 = VRTraceErrorLogLevelToCSTR();
    v25 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v31 = v24;
      v32 = 2080;
      v33 = "-[VCCallSession(PrivateMethods) setRTPPayloads:withError:]";
      v34 = 1024;
      v35 = 7972;
      v36 = 1024;
      v37 = v23;
      _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d failed: result=%x", buf, 0x22u);
    }
  }
  v26 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 7977);
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", v28, 32002, 224, v23, v26, CFSTR("Could not set RTP payload"), CFSTR("Error"));
  SIPHangup((uint64_t *)&self->hSIP, -[VCCallInfo callID](self->localCallInfo, "callID"), 224);
  return v23 >= 0;
}

- (BOOL)setMediaQueueStreamSettings
{
  unint64_t v2;
  int v3;

  LODWORD(v2) = self->_vpioFormat.samplesPerFrame;
  v3 = RTPSetThrottlingAudioInterval((double)v2 / self->_vpioFormat.format.mSampleRate);
  if (v3 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) setMediaQueueStreamSettings].cold.1();
  }
  return v3 >= 0;
}

- (BOOL)setupCallerRTPChannelWithError:(id *)a3
{
  double v5;
  uint64_t v6;
  NSObject *v7;
  int64_t sipState;
  BOOL v9;
  int v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  VCAudioReceiver_UpdateCellTech((uint64_t)self->audioReceiver, -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1), -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0));
  if (-[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled"))
    VideoReceiver_CellTechChanged();
  v12 = 0;
  if (!-[VCCallSession negotiatePayloads:withError:](self, "negotiatePayloads:withError:", &v12, a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:].cold.5();
    }
    return 0;
  }
  if (!-[VCCallSession setRTPPayloads:withError:](self, "setRTPPayloads:withError:", v12, a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:].cold.4();
    }
    return 0;
  }
  if (!-[VCCallSession setMediaQueueStreamSettings](self, "setMediaQueueStreamSettings"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:].cold.3();
    }
    return 0;
  }
  if ((VCAudioReceiver_Start(&self->audioReceiver->var0.var0, v5) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:].cold.2();
    }
    return 0;
  }
  v11 = 0;
  -[VCCallSession negotiateMaxBandwidth:](self, "negotiateMaxBandwidth:", &v11);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      sipState = self->_sipState;
      *(_DWORD *)buf = 136316162;
      v14 = v6;
      v15 = 2080;
      v16 = "-[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:]";
      v17 = 1024;
      v18 = 8034;
      v19 = 1024;
      v20 = sipState == 5;
      v21 = 1024;
      v22 = sipState;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d (state == GKVoiceChatServiceStateCallerAttemptingToConnect = %d, sipState = %d", buf, 0x28u);
    }
  }
  v9 = -[VCCallSession createAudioTransmitter:](self, "createAudioTransmitter:", a3);
  if (!v9 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) setupCallerRTPChannelWithError:].cold.1();
  }
  return v9;
}

- (BOOL)sipConnectWithError:(id *)a3
{
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  unsigned __int128 v8;
  int v9;
  id v10;
  const char *v12;
  _BYTE v13[48];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!-[VCCallSession sendSIPInviteWithError:](self, "sendSIPInviteWithError:"))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        if (*a3)
          v12 = (const char *)objc_msgSend((id)objc_msgSend(*a3, "description"), "UTF8String");
        else
          v12 = "<nil>";
        *(_DWORD *)v13 = 136315906;
        *(_QWORD *)&v13[4] = v6;
        *(_WORD *)&v13[12] = 2080;
        *(_QWORD *)&v13[14] = "-[VCCallSession(PrivateMethods) sipConnectWithError:]";
        *(_WORD *)&v13[22] = 1024;
        *(_DWORD *)&v13[24] = 8047;
        *(_WORD *)&v13[28] = 2080;
        *(_QWORD *)&v13[30] = v12;
        _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d sendSIPInvite returned NO error = %s", v13, 0x26u);
        reportingSymptom();
        goto LABEL_16;
      }
    }
    reportingSymptom();
    if (a3)
    {
LABEL_16:
      v10 = *a3;
LABEL_18:
      -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", v10, 0);
      return 0;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  if (-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
  {
    -[VCCallSession lock](self, "lock");
    -[VCCallSession cancelConnectionTimeoutTimer](self, "cancelConnectionTimeoutTimer");
    -[VCCallSession unlock](self, "unlock");
    return 1;
  }
  -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 3);
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[27] = v8;
  *(_OWORD *)v13 = v8;
  *(_OWORD *)&v13[16] = v8;
  SIPGetRemoteInfo((uint64_t)self->hSIP, -[VCCallInfo callID](self->localCallInfo, "callID", v8, v8, (unint64_t)(v8 >> 40), *(_QWORD *)&v13[40]), v13, 0);
  -[VCCallInfo setUserAgent:](self->remoteCallInfo, "setUserAgent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13));
  -[VCCallSession lock](self, "lock");
  if (!-[VCCallSession setupCallerRTPChannelWithError:](self, "setupCallerRTPChannelWithError:", a3))
  {
    -[VCCallSession unlock](self, "unlock");
    if (a3)
      goto LABEL_16;
    goto LABEL_17;
  }
  v5 = 1;
  if (-[VCCallInfo usesInitialFECImplementation](self->remoteCallInfo, "usesInitialFECImplementation"))
    v9 = 1;
  else
    v9 = 2;
  self->fecMode = v9;
  self->state = 1;
  -[VCCallSession sendBasebandCodecMessage](self, "sendBasebandCodecMessage");
  -[VCCallSession cancelConnectionTimeoutTimer](self, "cancelConnectionTimeoutTimer");
  -[VCCallSession unlock](self, "unlock");
  if (!-[VCCallSession startMediaQueue:](self, "startMediaQueue:", a3))
  {
    if (!a3)
      goto LABEL_17;
    goto LABEL_16;
  }
  return v5;
}

- (void)stopAudioWithCompletionHandler:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[VCCallSession lock](self, "lock");
  if (self->isAudioRunning)
  {
    self->isAudioRunning = 0;
    -[VCCallSession unlock](self, "unlock");
    -[VCCallSessionDelegate session:stopAudioWithCompletionHandler:](-[VCCallSession delegate](self, "delegate"), "session:stopAudioWithCompletionHandler:", self, a3);
  }
  else
  {
    -[VCCallSession unlock](self, "unlock");
    if (a3)
      (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
  }
  if (-[VCCapabilities isAudioEnabled](self->caps, "isAudioEnabled"))
    -[VCAudioTransmitter stop](self->audioTransmitter, "stop");
  reportingGenericEvent();

}

- (void)stopAudioIO:(id)a3
{
  NSObject *global_queue;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  -[VCCallSession lock](self, "lock");
  if (self->isAudioRunning)
  {
    self->isAudioRunning = 0;
    -[VCCallSessionDelegate session:stopAudioWithCompletionHandler:](-[VCCallSession delegate](self, "delegate"), "session:stopAudioWithCompletionHandler:", self, a3);
  }
  else if (a3)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__VCCallSession_PrivateMethods__stopAudioIO___block_invoke;
    v6[3] = &unk_1E9E55D00;
    v6[4] = a3;
    dispatch_async(global_queue, v6);
  }
  -[VCCallSession unlock](self, "unlock");
}

uint64_t __45__VCCallSession_PrivateMethods__stopAudioIO___block_invoke(uint64_t a1)
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v3, 32012, 264, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8138), CFSTR("Could not stop audio."), CFSTR("Audio is not running"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startAudioWithCompletionHandler:(id)a3
{
  NSObject *audioQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  audioQueue = self->audioQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__VCCallSession_PrivateMethods__startAudioWithCompletionHandler___block_invoke;
  block[3] = &unk_1E9E53548;
  block[4] = self;
  block[5] = a3;
  dispatch_async(audioQueue, block);
}

uint64_t __65__VCCallSession_PrivateMethods__startAudioWithCompletionHandler___block_invoke(uint64_t a1)
{
  int AppBooleanValue;
  _QWORD *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t result;
  uint64_t (*v8)(void);
  id *v9;
  int v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  char v14;
  void *v15;
  char v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  Boolean keyExistsAndHasValidFormat;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v21 = 0;
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("disableAudio"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[19])
  {
    if ((objc_msgSend(v3, "isCallOngoing") & 1) != 0)
    {
      v4 = *(unsigned __int8 **)(a1 + 32);
      if (keyExistsAndHasValidFormat && AppBooleanValue)
      {
        objc_msgSend(v4, "unlock");
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          v5 = VRTraceErrorLogLevelToCSTR();
          v6 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v23 = v5;
            v24 = 2080;
            v25 = "-[VCCallSession(PrivateMethods) startAudioWithCompletionHandler:]_block_invoke";
            v26 = 1024;
            v27 = 8181;
            _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d disableAudio is set to True, not starting audio!", buf, 0x1Cu);
          }
        }
        goto LABEL_23;
      }
      v10 = v4[408];
      v11 = v4[224];
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v23 = v12;
          v24 = 2080;
          v25 = "-[VCCallSession(PrivateMethods) startAudioWithCompletionHandler:]_block_invoke";
          v26 = 1024;
          v27 = 0x1FFF;
          v28 = 1024;
          v29 = v11;
          v30 = 1024;
          v31 = v10 == 0;
          _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d alreadyStarted = %d, isEnabled = %d", buf, 0x28u);
        }
      }
      v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "setupAudio:", &v21);
      v9 = *(id **)(a1 + 32);
      if ((v14 & 1) != 0)
      {

        *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "audioPayloads"), "mutableCopy");
        v15 = *(void **)(a1 + 32);
        if (v11 | v10)
        {
          objc_msgSend(v15, "unlock");
LABEL_23:
          result = *(_QWORD *)(a1 + 40);
          if (!result)
            return result;
          v8 = *(uint64_t (**)(void))(result + 16);
          return v8();
        }
        v16 = objc_msgSend(v15, "setupAudioCookies");
        v17 = *(_QWORD *)(a1 + 32);
        if ((v16 & 1) != 0)
        {
          if (*(_BYTE *)(v17 + 993))
          {
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) = -[GKRingBuffer initWithCapacity:bytesPerFrame:]([GKRingBuffer alloc], "initWithCapacity:bytesPerFrame:", 2048, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 568));
            v17 = *(_QWORD *)(a1 + 32);
          }
          v18 = objc_msgSend(*(id *)(v17 + 320), "isAudioEnabled");
          v19 = *(_QWORD *)(a1 + 32);
          if (v18)
          {
            objc_msgSend(*(id *)(v19 + 1232), "start");
            objc_msgSend(*(id *)(a1 + 32), "startAudioIOWithCompletionHandler:", *(_QWORD *)(a1 + 40));
          }
          else
          {
            objc_msgSend(*(id *)(v19 + 672), "stopTimingForKey:", 5);
            objc_msgSend(*(id *)(a1 + 32), "startPausedHeartbeat");
          }
          reportingGenericEvent();
          return objc_msgSend(*(id *)(a1 + 32), "unlock");
        }
        objc_msgSend((id)v17, "unlock");
        +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v21, 32016, 226, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8219), CFSTR("Couldn't setup encoder."), CFSTR("Bad cookie?"));
        goto LABEL_15;
      }
    }
    else
    {
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", &v21, 32012, 225, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8169), CFSTR("Could not start audio."), CFSTR("Call already completed"));
      v9 = *(id **)(a1 + 32);
    }
    objc_msgSend(v9, "unlock");
LABEL_15:
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __65__VCCallSession_PrivateMethods__startAudioWithCompletionHandler___block_invoke_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)startAudioIOWithCompletionHandler:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  NSString *v7;
  NSNumber *v8;
  __int128 v9;
  VCCallInfo *remoteCallInfo;
  _QWORD v11[8];
  uint8_t buf[32];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCCallSession(PrivateMethods) startAudioIOWithCompletionHandler:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 8246;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ", buf, 0x1Cu);
    }
  }
  if (self->_deviceRole == 1)
  {
    v7 = -[VCCallSession basebandCodecType](self, "basebandCodecType");
    v8 = -[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate");
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v19 = -1431655766;
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v17 = v9;
  v18 = v9;
  v15 = v9;
  v16 = v9;
  v13 = v9;
  v14 = v9;
  *(_OWORD *)buf = v9;
  *(_OWORD *)&buf[16] = v9;
  remoteCallInfo = self->remoteCallInfo;
  if (remoteCallInfo)
  {
    -[VCCallInfo audioVersionInfo:](remoteCallInfo, "audioVersionInfo:", self->isGKVoiceChat);
  }
  else
  {
    v19 = 0;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    memset(buf, 0, sizeof(buf));
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__VCCallSession_PrivateMethods__startAudioIOWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E9E55D28;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = v7;
  v11[7] = a3;
  -[VCCallSessionDelegate session:startAudioWithFarEndVersionInfo:internalFrameFormat:completionHandler:](-[VCCallSession delegate](self, "delegate"), "session:startAudioWithFarEndVersionInfo:internalFrameFormat:completionHandler:", self, buf, &self->_vpioFormat, (id)objc_msgSend(v11, "copy"));
}

uint64_t __67__VCCallSession_PrivateMethods__startAudioIOWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  _DWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v9[0] = 0;
    objc_msgSend(*(id *)(a1 + 32), "lock");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 224) = 1;
    v3 = objc_msgSend(*(id *)(a1 + 32), "isCallOngoing");
    if ((v3 & 1) == 0)
    {
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v9, 32012, 228, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8271), CFSTR("Audio started after call ended."), CFSTR("Call already completed"));
      objc_msgSend(*(id *)(a1 + 32), "stopAudioWithCompletionHandler:", 0);
    }
    v4 = *(_DWORD **)(a1 + 32);
    if (v4[82] == 1
      && (!objc_msgSend(*(id *)(a1 + 40), "isEqualToNumber:", objc_msgSend(v4, "basebandCodecSampleRate"))
       || (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "basebandCodecType")) & 1) == 0))
    {
      if (objc_msgSend(*(id *)(a1 + 32), "basebandCodecType"))
      {
        if (objc_msgSend(*(id *)(a1 + 32), "basebandCodecSampleRate"))
        {
          v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
          v6 = *(void **)(a1 + 32);
          v7 = CStrToFourcc((char *)objc_msgSend((id)objc_msgSend(v6, "basebandCodecType"), "UTF8String"));
          objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "basebandCodecSampleRate"), "doubleValue");
          objc_msgSend(v5, "session:setRemoteBasebandCodecType:sampleRate:", v6, v7);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              __67__VCCallSession_PrivateMethods__startAudioIOWithCompletionHandler___block_invoke_cold_1();
          }
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "unlock");
    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, v9[0]);
  }
  else
  {
    result = *(_QWORD *)(a1 + 56);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  }
  return result;
}

- (void)enableAudio:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  -[VCCallSession lock](self, "lock", MEMORY[0x1E0C809B0], 3221225472, __45__VCCallSession_PrivateMethods__enableAudio___block_invoke, &unk_1E9E53C48, self, *MEMORY[0x1E0C80C00]);
  if (v3)
  {
    -[VCCallSession startAudioIOWithCompletionHandler:](self, "startAudioIOWithCompletionHandler:", &v5);
    -[VCCallSession stopPausedHeartbeat](self, "stopPausedHeartbeat");
  }
  else
  {
    -[VCCallSession stopAudioIO:](self, "stopAudioIO:", 0);
    -[VCCallSession startPausedHeartbeat](self, "startPausedHeartbeat");
  }
  -[VCCallSession unlock](self, "unlock");
}

uint64_t __45__VCCallSession_PrivateMethods__enableAudio___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    if (*(_BYTE *)(v3 + 408))
    {
      objc_msgSend(*(id *)(a1 + 32), "setPauseAudio:force:error:", 1, 1, 0);
      v3 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend((id)v3, "updateLastReceivedPacketWithTimestamp:packetType:", 6, micro() + 10.0);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    v7 = objc_msgSend(*(id *)(v5 + 24), "callID");
    v8 = v6;
    v9 = v5;
    v10 = 1;
    v11 = 0;
  }
  else
  {
    v13 = *(void **)(v3 + 8);
    v7 = objc_msgSend(*(id *)(v3 + 24), "callID");
    v8 = v13;
    v9 = v3;
    v10 = 0;
    v11 = a3;
  }
  return objc_msgSend(v8, "session:localAudioEnabled:withCallID:error:", v9, v10, v7, v11);
}

- (void)updateDeviceRole:(int)a3
{
  int deviceRole;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 isAudioRunning;
  BOOL v11;
  int v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  dispatch_time_t v28;
  NSObject *videoQueue;
  uint64_t v30;
  NSObject *v31;
  int v32;
  uint64_t v33;
  NSObject *v34;
  dispatch_time_t v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  char IsOSFaultDisabled;
  NSObject *v40;
  int v41;
  int v42;
  _QWORD block[5];
  _QWORD v44[5];
  _QWORD v45[5];
  _BYTE buf[12];
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  _BYTE v52[10];
  VCCallSession *v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  __int16 v58;
  _BOOL4 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  deviceRole = self->_deviceRole;
  if (deviceRole == a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v7 = self->_deviceRole;
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v5;
        v47 = 2080;
        v48 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
        v49 = 1024;
        v50 = 8347;
        v51 = 1024;
        *(_DWORD *)v52 = v7;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SAME device role %d set, No-Op", buf, 0x22u);
      }
    }
    return;
  }
  v8 = *(_QWORD *)&a3;
  if (a3 == 4 && deviceRole == 2 || a3 == 3 && !deviceRole || a3 == 2 && deviceRole == 4 || !a3 && deviceRole == 3)
  {
    v9 = dispatch_semaphore_create(0);
    isAudioRunning = self->isAudioRunning;
    if (-[VCCapabilities isVideoEnabled](-[VCCallSession capabilities](self, "capabilities"), "isVideoEnabled"))
    {
      if ((_DWORD)v8)
        v11 = 0;
      else
        v11 = self->_deviceRole == 3;
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    if ((VCCallSession *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = self->_deviceRole;
          *(_DWORD *)buf = 136316418;
          *(_QWORD *)&buf[4] = v14;
          v47 = 2080;
          v48 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
          v49 = 1024;
          v50 = 8369;
          v51 = 1024;
          *(_DWORD *)v52 = v16;
          *(_WORD *)&v52[4] = 1024;
          *(_DWORD *)&v52[6] = v8;
          LOWORD(v53) = 1024;
          *(_DWORD *)((char *)&v53 + 2) = isAudioRunning;
          v17 = "VCCallSession [%s] %s:%d Updating from role %d to %d. shouldRestartAudio %d";
          v18 = v15;
          v19 = 46;
LABEL_31:
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        }
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v13 = (const __CFString *)-[VCCallSession performSelector:](self, "performSelector:", sel_logPrefix);
      else
        v13 = &stru_1E9E58EE0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v22 = self->_deviceRole;
          *(_DWORD *)buf = 136316930;
          *(_QWORD *)&buf[4] = v20;
          v47 = 2080;
          v48 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
          v49 = 1024;
          v50 = 8369;
          v51 = 2112;
          *(_QWORD *)v52 = v13;
          *(_WORD *)&v52[8] = 2048;
          v53 = self;
          v54 = 1024;
          v55 = v22;
          v56 = 1024;
          v57 = v8;
          v58 = 1024;
          v59 = isAudioRunning;
          v17 = "VCCallSession [%s] %s:%d %@(%p) Updating from role %d to %d. shouldRestartAudio %d";
          v18 = v21;
          v19 = 66;
          goto LABEL_31;
        }
      }
    }
    v23 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke;
    v45[3] = &unk_1E9E53C48;
    v45[4] = v9;
    v24 = (id)objc_msgSend(v45, "copy");
    v44[0] = v23;
    v44[1] = 3221225472;
    v44[2] = __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke_1302;
    v44[3] = &unk_1E9E53C48;
    v44[4] = v9;
    v25 = (id)objc_msgSend(v44, "copy");
    if (isAudioRunning)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v26 = VRTraceErrorLogLevelToCSTR();
        v27 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v26;
          v47 = 2080;
          v48 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
          v49 = 1024;
          v50 = 8384;
          _os_log_impl(&dword_1D8A54000, v27, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d stopping audio", buf, 0x1Cu);
        }
      }
      -[VCCallSession stopAudioIO:](self, "stopAudioIO:", v44);
      v28 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v9, v28))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCCallSession(PrivateMethods) updateDeviceRole:].cold.3();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[VCCallSession(PrivateMethods) updateDeviceRole:].cold.4();
          }
        }
        *(_QWORD *)buf = 0;
        v36 = (void *)MEMORY[0x1E0CB3940];
        v37 = CFSTR("Stop Audio Timed out");
LABEL_65:
        +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32016, 258, 0, CFSTR("updateDeviceRole failed"), objc_msgSend(v36, "stringWithFormat:", v37));
        -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", *(_QWORD *)buf, 0);
LABEL_66:
        dispatch_release(v9);
        return;
      }
      self->_deviceRole = v8;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v33 = VRTraceErrorLogLevelToCSTR();
        v34 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v33;
          v47 = 2080;
          v48 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
          v49 = 1024;
          v50 = 8402;
          _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d starting audio", buf, 0x1Cu);
        }
      }
      -[VCCallSession startAudioIOWithCompletionHandler:](self, "startAudioIOWithCompletionHandler:", v45);
      v35 = dispatch_time(0, 10000000000);
      if (dispatch_semaphore_wait(v9, v35))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
        {
          VRTraceErrorLogLevelToCSTR();
          if ((VRTraceIsOSFaultDisabled() & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
              -[VCCallSession(PrivateMethods) updateDeviceRole:].cold.1();
          }
          else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
          {
            -[VCCallSession(PrivateMethods) updateDeviceRole:].cold.2();
          }
        }
        *(_QWORD *)buf = 0;
        v36 = (void *)MEMORY[0x1E0CB3940];
        v37 = CFSTR("Start Audio Timed out");
        goto LABEL_65;
      }
    }
    else
    {
      self->_deviceRole = v8;
    }
    if (v12)
    {
      videoQueue = self->videoQueue;
      block[0] = v23;
      block[1] = 3221225472;
      block[2] = __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke_1307;
      block[3] = &unk_1E9E521C0;
      block[4] = self;
      dispatch_async(videoQueue, block);
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v32 = self->_deviceRole;
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v30;
        v47 = 2080;
        v48 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
        v49 = 1024;
        v50 = 8424;
        v51 = 1024;
        *(_DWORD *)v52 = v32;
        _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Finished update to role %d", buf, 0x22u);
      }
    }
    goto LABEL_66;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
  {
    v38 = VRTraceErrorLogLevelToCSTR();
    IsOSFaultDisabled = VRTraceIsOSFaultDisabled();
    v40 = *MEMORY[0x1E0CF2758];
    if ((IsOSFaultDisabled & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      {
        v41 = self->_deviceRole;
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v38;
        v47 = 2080;
        v48 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
        v49 = 1024;
        v50 = 8353;
        v51 = 1024;
        *(_DWORD *)v52 = v41;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = v8;
        _os_log_error_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d Invalid transition from role %d to %d", buf, 0x28u);
      }
    }
    else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
    {
      v42 = self->_deviceRole;
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v38;
      v47 = 2080;
      v48 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]";
      v49 = 1024;
      v50 = 8353;
      v51 = 1024;
      *(_DWORD *)v52 = v42;
      *(_WORD *)&v52[4] = 1024;
      *(_DWORD *)&v52[6] = v8;
      _os_log_fault_impl(&dword_1D8A54000, v40, OS_LOG_TYPE_FAULT, "VCCallSession [%s] %s:%d Invalid transition from role %d to %d", buf, 0x28u);
    }
  }
  *(_QWORD *)buf = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32016, 258, 0, CFSTR("updateDeviceRole failed"), objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid transition from role %d to %d"), self->_deviceRole, v8));
  -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", *(_QWORD *)buf, 0);
}

intptr_t __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]_block_invoke";
      v11 = 1024;
      v12 = 8372;
      v13 = 1024;
      v14 = a2;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Finished starting audio didStart[%d]", (uint8_t *)&v7, 0x22u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke_1302(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
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
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCCallSession(PrivateMethods) updateDeviceRole:]_block_invoke";
      v11 = 1024;
      v12 = 8378;
      v13 = 1024;
      v14 = a2;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Finished stopping audio didStop[%d]", (uint8_t *)&v7, 0x22u);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __50__VCCallSession_PrivateMethods__updateDeviceRole___block_invoke_1307(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "stopVideoSend:error:", 0, 0);
  return objc_msgSend(*(id *)(a1 + 32), "startVideoSend:error:", 1, 0);
}

- (void)sendCallingModeMessage
{
  __CFString *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[VCCapabilities isAudioEnabled](-[VCCallSession capabilities](self, "capabilities"), "isAudioEnabled"))
  {
    if (-[VCCapabilities isVideoEnabled](-[VCCallSession capabilities](self, "capabilities"), "isVideoEnabled"))
      v3 = CFSTR("VCVideoMode");
    else
      v3 = CFSTR("VCAudioMode");
  }
  else
  {
    v3 = CFSTR("VCDataMode");
  }
  -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v3, CFSTR("CallingModeTopic"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315906;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCCallSession(PrivateMethods) sendCallingModeMessage]";
      v10 = 1024;
      v11 = 8443;
      v12 = 2080;
      v13 = objc_msgSend((id)-[__CFString description](v3, "description"), "UTF8String");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Sending VCCallingModeTopic %s", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (BOOL)setupAudioCookies
{
  NSMutableArray *negotiatedAudioPayloads;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  BOOL v14;
  uint64_t audioReceiver;
  int v16;
  int v17;
  __int128 v19;
  VCCallSession *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  _BYTE v29[128];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE __b[1024];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  memset(__b, 170, sizeof(__b));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = self;
  negotiatedAudioPayloads = self->negotiatedAudioPayloads;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](negotiatedAudioPayloads, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v31;
    *(_QWORD *)&v5 = 136315906;
    v19 = v5;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(negotiatedAudioPayloads);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (+[VCPayloadUtils shouldUseCookieForPayload:](VCPayloadUtils, "shouldUseCookieForPayload:", objc_msgSend((id)objc_msgSend(v9, "config", v19), "payload")))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            v10 = VRTraceErrorLogLevelToCSTR();
            v11 = *MEMORY[0x1E0CF2758];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
            {
              v12 = objc_msgSend((id)objc_msgSend(v9, "config"), "payload");
              *(_DWORD *)buf = v19;
              v22 = v10;
              v23 = 2080;
              v24 = "-[VCCallSession(PrivateMethods) setupAudioCookies]";
              v25 = 1024;
              v26 = 8453;
              v27 = 1024;
              v28 = v12;
              _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Getting cookie for payload type %d", buf, 0x22u);
            }
          }
          *(_DWORD *)buf = 1024;
          v13 = objc_msgSend(v9, "getMagicCookie:withLength:", __b, buf);
          if (v13)
            v14 = *(_DWORD *)buf == 0;
          else
            v14 = 1;
          if (v14)
          {
            if (!v13)
              return v13;
          }
          else
          {
            audioReceiver = (uint64_t)v20->audioReceiver;
            v16 = objc_msgSend((id)objc_msgSend(v9, "config"), "payload");
            v17 = objc_msgSend((id)objc_msgSend(v9, "config"), "payload");
            if (!VCAudioReceiver_SetMagicCookieForPayload(audioReceiver, v16, v17, __b, *(UInt32 *)buf))
            {
              LOBYTE(v13) = 0;
              return v13;
            }
          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](negotiatedAudioPayloads, "countByEnumeratingWithState:objects:count:", &v30, v29, 16);
      if (v6)
        continue;
      break;
    }
  }
  LOBYTE(v13) = 1;
  return v13;
}

- (int)interfaceForCurrentCall
{
  void *v2;
  int v3;

  v2 = (void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  v3 = objc_msgSend(v2, "isWifiToWifi");
  if (v2)
    CFRelease(v2);
  if (v3)
    return 2;
  else
    return 1;
}

- (BOOL)startVideoSend:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  unsigned int v12;
  int64_t state;
  int operatingMode;
  BOOL v15;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  float v23;
  double v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  double v30;
  int v31;
  int v32;
  float v33;
  double v34;
  float v35;
  double v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  NSObject *v59;
  int v60;
  float v61;
  _BOOL4 v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  _BOOL4 v66;
  uint64_t v67;
  NSObject *v68;
  double v69;
  unsigned int v70;
  uint64_t v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  NSObject *v75;
  const __CFString *v76;
  uint64_t v77;
  NSObject *v78;
  unsigned int callSessionBitrate;
  const char *v80;
  NSObject *v81;
  uint32_t v82;
  uint64_t v83;
  NSObject *v84;
  unsigned int v85;
  uint64_t v86;
  NSObject *v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  unsigned int v95;
  _QWORD v96[3];
  signed int v97;
  uint8_t buf[4];
  uint64_t v99;
  __int16 v100;
  const char *v101;
  __int16 v102;
  int v103;
  __int16 v104;
  _BYTE v105[10];
  _BYTE v106[20];
  __int16 v107;
  int v108;
  __int16 v109;
  int v110;
  __int16 v111;
  int v112;
  __int16 v113;
  double v114;
  __int16 v115;
  double v116;
  __int16 v117;
  int v118;
  __int16 v119;
  int v120;
  __int16 v121;
  int v122;
  __int16 v123;
  double v124;
  __int16 v125;
  double v126;
  __int16 v127;
  int v128;
  __int16 v129;
  unsigned int v130;
  uint64_t v131;

  v5 = a3;
  v131 = *MEMORY[0x1E0C80C00];
  -[VCCallSession lock](self, "lock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly");
      v10 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled");
      v11 = -[VCCallInfo videoIsPaused](self->localCallInfo, "videoIsPaused");
      v12 = -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec");
      state = self->state;
      *(_DWORD *)buf = 136316930;
      v99 = v7;
      v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      v102 = 1024;
      v103 = 8484;
      v104 = 1024;
      *(_DWORD *)v105 = v9;
      *(_WORD *)&v105[4] = 1024;
      *(_DWORD *)&v105[6] = v10;
      *(_WORD *)v106 = 1024;
      *(_DWORD *)&v106[2] = v11;
      *(_WORD *)&v106[6] = 1024;
      *(_DWORD *)&v106[8] = v12;
      *(_WORD *)&v106[12] = 1024;
      *(_DWORD *)&v106[14] = state;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startVideoSend: called: %d %d %d %d %d", buf, 0x3Au);
    }
  }
  if (-[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly")
    || -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec") == -1
    || (operatingMode = self->operatingMode, operatingMode == 7)
    || operatingMode == 2)
  {
    -[VCCallSession unlock](self, "unlock");
    return 1;
  }
  if (!-[VCCallSession isCallOngoing](self, "isCallOngoing") || self->state != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) startVideoSend:error:].cold.3();
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32012, 229, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8496), CFSTR("Could not start video."), CFSTR("Call already completed"));
    -[VCCallSession unlock](self, "unlock");
    return 0;
  }
  -[VCCallSession unlock](self, "unlock");
  v97 = -1431655766;
  v17 = -[VCCallSession interfaceForCurrentCall](self, "interfaceForCurrentCall");
  v15 = 1;
  v18 = -[VCCallSession getVideoRuleForVideoMode:interface:sessionBitrate:](self, "getVideoRuleForVideoMode:interface:sessionBitrate:", 1, 2, 0);
  v19 = -[VCCallSession getVideoRuleForVideoMode:interface:sessionBitrate:](self, "getVideoRuleForVideoMode:interface:sessionBitrate:", 1, 1, 0);
  v20 = -[VCCallSession getVideoRuleForVideoMode:interface:sessionBitrate:](self, "getVideoRuleForVideoMode:interface:sessionBitrate:", 2, v17, &v97);
  if (-[VCCallInfo videoIsPaused](self->localCallInfo, "videoIsPaused"))
    return v15;
  v95 = v17;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v93 = objc_msgSend(v18, "iWidth");
      v92 = objc_msgSend(v18, "iHeight");
      objc_msgSend(v18, "fRate");
      v24 = v23;
      objc_msgSend(v18, "fPref");
      v26 = v25;
      v91 = objc_msgSend(v18, "iPayload");
      v90 = objc_msgSend(v19, "iWidth");
      v89 = objc_msgSend(v19, "iHeight");
      objc_msgSend(v19, "fRate");
      v28 = v27;
      objc_msgSend(v19, "fPref");
      v30 = v29;
      v88 = objc_msgSend(v19, "iPayload");
      v31 = objc_msgSend(v20, "iWidth");
      v32 = objc_msgSend(v20, "iHeight");
      objc_msgSend(v20, "fRate");
      v34 = v33;
      objc_msgSend(v20, "fPref");
      v36 = v35;
      v37 = objc_msgSend(v20, "iPayload");
      *(_DWORD *)buf = 136319746;
      v99 = v21;
      v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      v102 = 1024;
      v103 = 8520;
      v104 = 1024;
      *(_DWORD *)v105 = v93;
      *(_WORD *)&v105[4] = 1024;
      *(_DWORD *)&v105[6] = v92;
      *(_WORD *)v106 = 2048;
      *(double *)&v106[2] = v24;
      *(_WORD *)&v106[10] = 2048;
      *(double *)&v106[12] = v26;
      v107 = 1024;
      v108 = v91;
      v109 = 1024;
      v110 = v90;
      v111 = 1024;
      v112 = v89;
      v113 = 2048;
      v114 = v28;
      v115 = 2048;
      v116 = v30;
      v117 = 1024;
      v118 = v88;
      v119 = 1024;
      v120 = v31;
      v121 = 1024;
      v122 = v32;
      v123 = 2048;
      v124 = v34;
      v125 = 2048;
      v126 = v36;
      v127 = 1024;
      v128 = v37;
      v129 = 1024;
      v130 = v95;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCALLSESSION: start video with capture rule wifi = %dx%dx%.1ffps(%.1f, %d), capture rule cell = %dx%dx%.1ffps(%.1f, %d), encode rule = %dx%dx%.1ffps(%.1f, %d), for interface %d", buf, 0x94u);
    }
  }
  if (v97 >= 1 && v97 < (signed int)self->callSessionBitrate)
    self->callSessionBitrate = v97;
  -[VCCallSession adjustBitrateForConnectionType](self, "adjustBitrateForConnectionType");
  if (-[VCDefaults forceHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceHWI"))
  {
    self->callSessionBitrate = -[VCDefaults forceBitrate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceBitrate");
    v38 = -[VCDefaults forceCaptureWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceCaptureWidth");
    v39 = -[VCDefaults forceCaptureHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceCaptureHeight");
    *(float *)&v40 = (float)-[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate");
    objc_msgSend(v18, "setFrameWidth:frameHeight:frameRate:", v38, v39, v40);
    v41 = -[VCDefaults forceCaptureWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceCaptureWidth");
    v42 = -[VCDefaults forceCaptureHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceCaptureHeight");
    *(float *)&v43 = (float)-[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate");
    objc_msgSend(v19, "setFrameWidth:frameHeight:frameRate:", v41, v42, v43);
    v44 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
    v45 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
    *(float *)&v46 = (float)-[VCDefaults forceFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceFramerate");
    objc_msgSend(v20, "setFrameWidth:frameHeight:frameRate:", v44, v45, v46);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v47 = VRTraceErrorLogLevelToCSTR();
      v48 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v99 = v47;
        v100 = 2080;
        v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
        v102 = 1024;
        v103 = 8536;
        _os_log_impl(&dword_1D8A54000, v48, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: forcing camera and encoder settings to forceHWI", buf, 0x1Cu);
      }
    }
  }
  if (-[VCDefaults forceScreenHWI](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceScreenHWI"))
  {
    v49 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
    v50 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
    *(float *)&v51 = (float)-[VCDefaults forceEncodeFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeFramerate");
    objc_msgSend(v18, "setFrameWidth:frameHeight:frameRate:", v49, v50, v51);
    v52 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
    v53 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
    *(float *)&v54 = (float)-[VCDefaults forceEncodeFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeFramerate");
    objc_msgSend(v19, "setFrameWidth:frameHeight:frameRate:", v52, v53, v54);
    v55 = -[VCDefaults forceEncodeWidth](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeWidth");
    v56 = -[VCDefaults forceEncodeHeight](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeHeight");
    *(float *)&v57 = (float)-[VCDefaults forceEncodeFramerate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceEncodeFramerate");
    objc_msgSend(v20, "setFrameWidth:frameHeight:frameRate:", v55, v56, v57);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v58 = VRTraceErrorLogLevelToCSTR();
      v59 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v94 = objc_msgSend(v20, "iWidth");
        v60 = objc_msgSend(v20, "iHeight");
        objc_msgSend(v20, "fRate");
        *(_DWORD *)buf = 136316418;
        v99 = v58;
        v100 = 2080;
        v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
        v102 = 1024;
        v103 = 8546;
        v104 = 1024;
        *(_DWORD *)v105 = v94;
        *(_WORD *)&v105[4] = 1024;
        *(_DWORD *)&v105[6] = v60;
        *(_WORD *)v106 = 2048;
        *(double *)&v106[2] = v61;
        _os_log_impl(&dword_1D8A54000, v59, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: forcing screen sharing encoder settings to %dx%d@%f", buf, 0x32u);
      }
    }
  }
  -[VCCallSession setCurrentEncodeRule:](self, "setCurrentEncodeRule:", v20);
  if (!-[VCConnectionManager getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:", 1, 1)&& -[VCDefaults max2GRate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "max2GRate") >= 1)
  {
    self->callSessionBitrate = -[VCDefaults max2GRate](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "max2GRate");
  }
  objc_msgSend(v20, "iWidth");
  objc_msgSend(v20, "iHeight");
  objc_msgSend(v20, "fRate");
  reportingVideoProp();
  v96[1] = v18;
  v96[2] = v19;
  v96[0] = v20;
  if (!-[VCCallSession initializeVideoTransmitter:videoRules:unpausing:reportingAgent:fecHeaderV1Enabled:isFECGeneratorEnabled:](self, "initializeVideoTransmitter:videoRules:unpausing:reportingAgent:fecHeaderV1Enabled:isFECGeneratorEnabled:", a4, v96, v5, self->reportingAgent, -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 0x20000), -[VCCallSession isFECGeneratorEnabled](self, "isFECGeneratorEnabled")))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) startVideoSend:error:].cold.2();
    }
    goto LABEL_63;
  }
  if ((-[VCCallSessionDelegate session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:](self->delegate, "session:startVideoSend:captureRuleWifi:captureRuleCell:interface:isUnpausing:", self, a4, v18, v19, v95, v5) & 1) == 0)
  {
LABEL_63:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) startVideoSend:error:].cold.1();
    }
    return 0;
  }
  VideoReceiver_SetVTHandle((uint64_t)self->hVideoReceiver, (uint64_t)self->hVideoTransmitter);
  -[VCCallSession configureRateController](self, "configureRateController");
  v62 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 16);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v63 = VRTraceErrorLogLevelToCSTR();
    v64 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v99 = v63;
      v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      v102 = 1024;
      v103 = 8582;
      v104 = 1024;
      *(_DWORD *)v105 = v62;
      _os_log_impl(&dword_1D8A54000, v64, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch vplrFecEnabled %d", buf, 0x22u);
    }
  }
  if (-[VCMediaNegotiatorResults mediaControlInfoVersion](-[VCMediaNegotiatorBase negotiatedSettings](self->_mediaNegotiator, "negotiatedSettings"), "mediaControlInfoVersion") > 1&& v62)
  {
    v65 = 6;
  }
  else
  {
    v65 = 5;
  }
  v66 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v67 = VRTraceErrorLogLevelToCSTR();
    v68 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v99 = v67;
      v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      v102 = 1024;
      v103 = 8585;
      v104 = 1024;
      *(_DWORD *)v105 = v66;
      _os_log_impl(&dword_1D8A54000, v68, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch highFecEnabled %d", buf, 0x22u);
    }
  }
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", CFSTR("vc-video-redundancy-percentage-max"), CFSTR("videoRedundancyPercentageMax"), &unk_1E9EF52E8, 1), "doubleValue");
  v70 = v69;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v71 = VRTraceErrorLogLevelToCSTR();
    v72 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v99 = v71;
      v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      v102 = 1024;
      v103 = 8587;
      v104 = 1024;
      *(_DWORD *)v105 = v70;
      _os_log_impl(&dword_1D8A54000, v72, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d currentRedundancyPercentage before abTestSwitch %d", buf, 0x22u);
    }
  }
  if (v66)
    v73 = v70;
  else
    v73 = 100;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v74 = VRTraceErrorLogLevelToCSTR();
    v75 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v99 = v74;
      v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      v102 = 1024;
      v103 = 8589;
      v104 = 1024;
      *(_DWORD *)v105 = v73;
      _os_log_impl(&dword_1D8A54000, v75, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d maxAllowedRedundancyPercentage after abTestSwitch %d", buf, 0x22u);
    }
  }
  if (!self->_videoRedundancyController)
    self->_videoRedundancyController = -[VCRedundancyControllerVideo initWithDelegate:mode:parameters:]([VCRedundancyControllerVideo alloc], "initWithDelegate:mode:parameters:", self, v65, -[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector"), v73);
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_74;
    v77 = VRTraceErrorLogLevelToCSTR();
    v78 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_74;
    callSessionBitrate = self->callSessionBitrate;
    *(_DWORD *)buf = 136315906;
    v99 = v77;
    v100 = 2080;
    v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
    v102 = 1024;
    v103 = 8598;
    v104 = 1024;
    *(_DWORD *)v105 = callSessionBitrate;
    v80 = "VCCallSession [%s] %s:%d VCCallSession: startVideo maxBandwidth=%d, ";
    v81 = v78;
    v82 = 34;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v76 = (const __CFString *)-[VCCallSession performSelector:](self, "performSelector:", sel_logPrefix);
    else
      v76 = &stru_1E9E58EE0;
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_74;
    v83 = VRTraceErrorLogLevelToCSTR();
    v84 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_74;
    v85 = self->callSessionBitrate;
    *(_DWORD *)buf = 136316418;
    v99 = v83;
    v100 = 2080;
    v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
    v102 = 1024;
    v103 = 8598;
    v104 = 2112;
    *(_QWORD *)v105 = v76;
    *(_WORD *)&v105[8] = 2048;
    *(_QWORD *)v106 = self;
    *(_WORD *)&v106[8] = 1024;
    *(_DWORD *)&v106[10] = v85;
    v80 = "VCCallSession [%s] %s:%d %@(%p) VCCallSession: startVideo maxBandwidth=%d, ";
    v81 = v84;
    v82 = 54;
  }
  _os_log_impl(&dword_1D8A54000, v81, OS_LOG_TYPE_DEFAULT, v80, buf, v82);
LABEL_74:
  -[VCCallSession lock](self, "lock");
  v15 = -[VCCallSession isCallOngoing](self, "isCallOngoing");
  if (!v15)
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a4, 32012, 230, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8607), CFSTR("Could not start video."), CFSTR("Call already completed"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v86 = VRTraceErrorLogLevelToCSTR();
    v87 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v99 = v86;
      v100 = 2080;
      v101 = "-[VCCallSession(PrivateMethods) startVideoSend:error:]";
      v102 = 1024;
      v103 = 8613;
      _os_log_impl(&dword_1D8A54000, v87, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startVideoSend: completed.", buf, 0x1Cu);
    }
  }
  -[VCCallSession unlock](self, "unlock");
  -[TimingCollection startTimingForKey:](self->cameraTimers, "startTimingForKey:", -[VCCallSessionDelegate currentCameraID](self->delegate, "currentCameraID"));
  return v15;
}

- (BOOL)startVideoReceive:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  unsigned int v10;
  int64_t state;
  _BOOL8 v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL8 v15;
  uint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  BOOL v19;
  uint64_t v21;
  NSObject *v22;
  unsigned int callSessionBitrate;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  uint64_t v27;
  NSObject *v28;
  unsigned int v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  _BYTE v37[10];
  VCCallSession *v38;
  _BYTE v39[6];
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[VCCallSession lock](self, "lock");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = -[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly");
      v8 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled");
      v9 = -[VCCallInfo videoIsPaused](self->localCallInfo, "videoIsPaused");
      v10 = -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec");
      state = self->state;
      *(_DWORD *)buf = 136316930;
      v31 = v5;
      v32 = 2080;
      v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
      v34 = 1024;
      v35 = 8630;
      v36 = 1024;
      *(_DWORD *)v37 = v7;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v8;
      LOWORD(v38) = 1024;
      *(_DWORD *)((char *)&v38 + 2) = v9;
      HIWORD(v38) = 1024;
      *(_DWORD *)v39 = v10;
      *(_WORD *)&v39[4] = 1024;
      v40 = state;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d startVideoReceive: called: %d %d %d %d %d", buf, 0x3Au);
    }
  }
  if (-[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly")
    || -[VCCallInfo videoIsPaused](self->localCallInfo, "videoIsPaused")
    || -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec") == -1)
  {
    -[VCCallSession unlock](self, "unlock");
    return 1;
  }
  if (!-[VCCallSession isCallOngoing](self, "isCallOngoing") || self->state != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) startVideoReceive:].cold.2();
    }
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32012, 229, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8643), CFSTR("Could not start video."), CFSTR("Call already completed"));
    -[VCCallSession unlock](self, "unlock");
    return 0;
  }
  -[VCCallSession unlock](self, "unlock");
  v12 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 0x20000);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v31 = v13;
      v32 = 2080;
      v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
      v34 = 1024;
      v35 = 8653;
      v36 = 1024;
      *(_DWORD *)v37 = v12;
      _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch fecHeaderV1Enabled %d", buf, 0x22u);
    }
  }
  v15 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 0x4000000);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v31 = v16;
      v32 = 2080;
      v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
      v34 = 1024;
      v35 = 8656;
      v36 = 1024;
      *(_DWORD *)v37 = v15;
      _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch videoJBEnabled %d", buf, 0x22u);
    }
  }
  if (!-[VCCallSession initializeVideoReceiver:reportingAgent:fecHeaderV1Enabled:videoJBEnabled:](self, "initializeVideoReceiver:reportingAgent:fecHeaderV1Enabled:videoJBEnabled:", a3, self->reportingAgent, v12, v15)|| (-[VCCallSessionDelegate session:startVideoReceive:](self->delegate, "session:startVideoReceive:", self, a3) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(PrivateMethods) startVideoReceive:].cold.1();
    }
    return 0;
  }
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      goto LABEL_38;
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    callSessionBitrate = self->callSessionBitrate;
    *(_DWORD *)buf = 136315906;
    v31 = v21;
    v32 = 2080;
    v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
    v34 = 1024;
    v35 = 8669;
    v36 = 1024;
    *(_DWORD *)v37 = callSessionBitrate;
    v24 = "VCCallSession [%s] %s:%d VCCallSession: startVideo maxBandwidth=%d, ";
    v25 = v22;
    v26 = 34;
    goto LABEL_37;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v18 = (const __CFString *)-[VCCallSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v18 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v27 = VRTraceErrorLogLevelToCSTR();
    v28 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v29 = self->callSessionBitrate;
      *(_DWORD *)buf = 136316418;
      v31 = v27;
      v32 = 2080;
      v33 = "-[VCCallSession(PrivateMethods) startVideoReceive:]";
      v34 = 1024;
      v35 = 8669;
      v36 = 2112;
      *(_QWORD *)v37 = v18;
      *(_WORD *)&v37[8] = 2048;
      v38 = self;
      *(_WORD *)v39 = 1024;
      *(_DWORD *)&v39[2] = v29;
      v24 = "VCCallSession [%s] %s:%d %@(%p) VCCallSession: startVideo maxBandwidth=%d, ";
      v25 = v28;
      v26 = 54;
LABEL_37:
      _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    }
  }
LABEL_38:
  -[VCCallSession lock](self, "lock");
  v19 = -[VCCallSession isCallOngoing](self, "isCallOngoing");
  if (!v19)
    +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32012, 230, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 8678), CFSTR("Could not start video."), CFSTR("Call already completed"));
  -[VCCallSession unlock](self, "unlock");
  return v19;
}

- (BOOL)startVideo:(BOOL)a3 error:(id *)a4
{
  _BOOL8 v5;
  _BOOL4 v7;

  v5 = a3;
  v7 = -[VCCallSession startVideoReceive:](self, "startVideoReceive:", a4);
  if (v7)
    LOBYTE(v7) = -[VCCallSession startVideoSend:error:](self, "startVideoSend:error:", v5, a4);
  return v7;
}

- (BOOL)stopVideoSend:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  unsigned int v11;
  int v12;
  VCRedundancyControllerVideo *videoRedundancyController;
  _BYTE v15[12];
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly");
      v10 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled");
      v11 = -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec");
      *(_DWORD *)v15 = 136316418;
      *(_QWORD *)&v15[4] = v7;
      v16 = 2080;
      v17 = "-[VCCallSession(PrivateMethods) stopVideoSend:error:]";
      v18 = 1024;
      v19 = 8703;
      v20 = 1024;
      v21 = v9;
      v22 = 1024;
      v23 = v10;
      v24 = 1024;
      v25 = v11 == -1;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d stopVideoSend: caps.isDuplexAudioOnly = %d, caps.isVideoEnabled = %d, caps.actualVideoCodec == AV_CODEC_INVALID is %d", v15, 0x2Eu);
    }
  }
  if (-[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec", *(_QWORD *)v15) == -1)
    goto LABEL_16;
  if (!v5)
  {
    VideoReceiver_SetVTHandle((uint64_t)self->hVideoReceiver, 0xFFFFFFFFLL);
    MediaQueue_ResetRefreshFrameState();
    -[VCCallSession cleanUpVideoTransmitter](self, "cleanUpVideoTransmitter");
    videoRedundancyController = self->_videoRedundancyController;
    if (videoRedundancyController)
    {

      self->_videoRedundancyController = 0;
    }
    v12 = -[VCCallSessionDelegate stopVideoSend:error:](self->delegate, "stopVideoSend:error:", 1, a4);
    if (!v12)
      return v12;
    goto LABEL_14;
  }
  VideoTransmitter_Pause((uint64_t)self->hVideoTransmitter, 1);
  if ((-[VCCallSessionDelegate stopVideoSend:error:](self->delegate, "stopVideoSend:error:", 0, a4) & 1) != 0)
  {
LABEL_14:
    v12 = -[VCCallSessionDelegate session:didStopVideoIO:error:](self->delegate, "session:didStopVideoIO:error:", self, !v5, a4);
    if (!v12)
      return v12;
    -[TimingCollection stopTimingForKey:](self->cameraTimers, "stopTimingForKey:", -[VCCallSessionDelegate currentCameraID](self->delegate, "currentCameraID"));
LABEL_16:
    LOBYTE(v12) = 1;
    return v12;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_10:
    LOBYTE(v12) = 0;
    return v12;
  }
  VRTraceErrorLogLevelToCSTR();
  v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
  if (v12)
  {
    -[VCCallSession(PrivateMethods) stopVideoSend:error:].cold.1();
    goto LABEL_10;
  }
  return v12;
}

- (BOOL)stopVideoReceive:(id *)a3 isPausing:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  unsigned int v11;
  _BYTE v13[12];
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = -[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly");
      v10 = -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled");
      v11 = -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec");
      *(_DWORD *)v13 = 136316418;
      *(_QWORD *)&v13[4] = v7;
      v14 = 2080;
      v15 = "-[VCCallSession(PrivateMethods) stopVideoReceive:isPausing:]";
      v16 = 1024;
      v17 = 8749;
      v18 = 1024;
      v19 = v9;
      v20 = 1024;
      v21 = v10;
      v22 = 1024;
      v23 = v11 == -1;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d stopVideoReceive: caps.isDuplexAudioOnly = %d, caps.isVideoEnabled = %d, caps.actualVideoCodec == AV_CODEC_INVALID is %d", v13, 0x2Eu);
    }
  }
  if (-[VCCapabilities isDuplexAudioOnly](self->caps, "isDuplexAudioOnly", *(_QWORD *)v13)
    || -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec") == -1)
  {
    return 1;
  }
  -[VCCallSession cleanUpDisplayLink](self, "cleanUpDisplayLink");
  -[VCCallSession cleanUpVideoReceiver](self, "cleanUpVideoReceiver");
  return -[VCCallSessionDelegate session:stopVideoReceive:isPausing:](self->delegate, "session:stopVideoReceive:isPausing:", self, a3, v4);
}

- (BOOL)stopVideo:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v7;

  v7 = -[VCCallSession stopVideoSend:error:](self, "stopVideoSend:error:");
  if (v7 && !a3)
    LOBYTE(v7) = -[VCCallSession stopVideoReceive:isPausing:](self, "stopVideoReceive:isPausing:", a4, 0);
  return v7;
}

- (BOOL)getVideoSettings:(int)a3 forInterface:(int)a4 payload:(int)a5 width:(int *)a6 height:(int *)a7 framerate:(int *)a8 bitRate:(int *)a9
{
  uint64_t v12;
  uint64_t v13;
  int v14;
  int *v16;
  uint64_t v17;
  id v18;
  const void *v20;
  unsigned __int8 v21;
  VCMediaNegotiator *mediaNegotiator;
  VCMediaNegotiatorResultsVideo *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int operatingMode;
  uint64_t v28;
  VCVideoRuleCollections *v29;
  void *v30;
  void *v31;
  double v32;
  VCVideoRule *v33;
  VCVideoRule *v34;
  float v35;
  int *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  VCVideoRule *v42;
  double v43;
  uint64_t v44;
  NSObject *v45;
  int *v46;
  float v47;
  int v48;
  int v49;
  int *v50;
  int v51;
  float v52;
  float v53;
  int v54;
  int v55;
  int v56;
  int v58;
  int v59;
  int *v60;
  int v61;
  int v62;
  void *v63;
  int v64;
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  __int128 v69;
  _QWORD v70[2];
  uint8_t buf[4];
  uint64_t v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  int v76;
  __int16 v77;
  int v78;
  __int16 v79;
  int v80;
  __int16 v81;
  int v82;
  __int16 v83;
  int v84;
  __int16 v85;
  int v86;
  __int16 v87;
  int v88;
  uint64_t v89;

  v12 = *(_QWORD *)&a5;
  v13 = *(_QWORD *)&a4;
  v14 = a3;
  v16 = a9;
  v89 = *MEMORY[0x1E0C80C00];
  v69 = 0u;
  v68 = 320;
  *(_QWORD *)((char *)&v69 + 4) = 0xF000000140;
  v70[0] = 0xF000000F0;
  v70[1] = 1056964608;
  v65 = 0u;
  v64 = 320;
  *(_QWORD *)((char *)&v65 + 4) = 0xF000000140;
  v66 = 0xF000000F0;
  v67 = 1056964608;
  if (self->operatingMode == 1)
  {
    v17 = -[VCConnectionManager getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getConnectionTypeForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
    if ((_DWORD)v13 == 2 && (_DWORD)v17 == 3 || (v63 = 0, (_DWORD)v13 == 1) && (_DWORD)v17 != 3)
    {
      v18 = -[VCBitrateArbiter maxAllowedBitrateRuleForConnection:](self->callSessionBitrateArbiter, "maxAllowedBitrateRuleForConnection:", v17);
      v63 = (void *)objc_msgSend(v18, "limitingRule");
      if (a9)
        *a9 = objc_msgSend(v18, "bitrate");
    }
  }
  else if (a9)
  {
    v20 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
    *a9 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v20, 1, VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode), self->_currentEncodeRule);
    if (v20)
      CFRelease(v20);
    v63 = 0;
    v14 = a3;
  }
  else
  {
    v63 = 0;
  }
  if (!-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
  {
    v24 = 24;
    if (!self->didSend200OK)
      v24 = 32;
    v25 = (void *)objc_msgSend(*(id *)((char *)&self->super.isa + v24), "sdp");
    v26 = v25;
    operatingMode = self->operatingMode;
    v60 = a7;
    v61 = v14;
    if (operatingMode == 1)
    {
      v28 = 2;
    }
    else
    {
      if (operatingMode != 4)
      {
        v36 = a8;
        v37 = 0;
        goto LABEL_33;
      }
      v28 = 3;
    }
    v36 = a8;
    v37 = (void *)objc_msgSend(v25, "getMediaLineForType:", v28);
LABEL_33:
    -[VCCallSession setImageAttributeRules:](self, "setImageAttributeRules:", objc_msgSend(v37, "imageAttributeRules"));
    v38 = (void *)objc_msgSend((id)objc_msgSend(v37, "imageAttributeRules"), "extractDimensionsForInterface:direction:", v13, 1);
    if (objc_msgSend(v38, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->videoPayload)))
    {
      +[SDPMediaLine fillImageStructWithDictionary:forInterface:imageStruct:](SDPMediaLine, "fillImageStructWithDictionary:forInterface:imageStruct:", objc_msgSend(v38, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->videoPayload)), v13, &v64);
      v39 = (double)SDWORD1(v65);
      v40 = (double)(int)v66;
    }
    else
    {
      v39 = 320.0;
      v40 = 240.0;
    }
    self->expectedDecodeSize.width = v39;
    self->expectedDecodeSize.height = v40;
    v41 = (void *)objc_msgSend((id)objc_msgSend(v37, "imageAttributeRules"), "extractDimensionsForInterface:direction:", v13, 0);
    if (objc_msgSend(v41, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12)))
    {
      +[SDPMediaLine fillImageStructWithDictionary:forInterface:imageStruct:](SDPMediaLine, "fillImageStructWithDictionary:forInterface:imageStruct:", objc_msgSend(v41, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->videoPayload)), v13, &v68);
    }
    else
    {
      objc_msgSend(v26, "rulesImageSizeForExternalPayload:pWidth:pHeight:", RTPGetExternalPayload((uint64_t)self->rtpVideo, (unsigned __int16)self->videoPayload), (char *)&v69 + 4, v70);
      HIDWORD(v70[0]) = objc_msgSend(v26, "rulesFramerate:", LODWORD(self->videoPayload));
    }
    a8 = v36;
    a7 = v60;
    v16 = a9;
    v14 = v61;
    if (self->operatingMode != 1)
    {
LABEL_48:
      LOBYTE(v33) = 1;
      goto LABEL_49;
    }
    v42 = [VCVideoRule alloc];
    *(float *)&v43 = (float)SHIDWORD(v70[0]);
    v34 = -[VCVideoRule initWithFrameWidth:frameHeight:frameRate:](v42, "initWithFrameWidth:frameHeight:frameRate:", DWORD1(v69), LODWORD(v70[0]), v43);
    goto LABEL_41;
  }
  if ((_DWORD)v13 == 2)
    v21 = 1;
  else
    v21 = 2;
  mediaNegotiator = self->_mediaNegotiator;
  if (self->operatingMode == 4)
    v23 = -[VCMediaNegotiatorBase negotiatedScreenSettings](mediaNegotiator, "negotiatedScreenSettings");
  else
    v23 = -[VCMediaNegotiatorBase negotiatedVideoSettings](mediaNegotiator, "negotiatedVideoSettings");
  v29 = -[VCMediaNegotiatorResultsVideo videoRuleCollections](v23, "videoRuleCollections");
  v30 = (void *)objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](v29, "getVideoRulesForTransport:payload:encodingType:", v21, v12, 2), "firstObject");
  if (v30)
  {
    v31 = v30;
    self->expectedDecodeSize.width = (double)(int)objc_msgSend(v30, "iWidth");
    v32 = (double)(int)objc_msgSend(v31, "iHeight");
  }
  else
  {
    self->expectedDecodeSize.width = 320.0;
    v32 = 240.0;
  }
  self->expectedDecodeSize.height = v32;
  v33 = (VCVideoRule *)objc_msgSend(-[VCVideoRuleCollections getVideoRulesForTransport:payload:encodingType:](v29, "getVideoRulesForTransport:payload:encodingType:", v21, v12, 1), "firstObject");
  if (!v33)
    goto LABEL_49;
  v34 = v33;
  DWORD1(v69) = -[VCVideoRule iWidth](v33, "iWidth");
  LODWORD(v70[0]) = -[VCVideoRule iHeight](v34, "iHeight");
  -[VCVideoRule fRate](v34, "fRate");
  HIDWORD(v70[0]) = (int)v35;
LABEL_41:
  LOBYTE(v33) = 1;
  if (v63 && v34)
  {
    if (-[VCVideoRule compare:](v34, "compare:", v63) == 1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        v44 = VRTraceErrorLogLevelToCSTR();
        v45 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v59 = -[VCVideoRule iWidth](v34, "iWidth");
          v58 = -[VCVideoRule iHeight](v34, "iHeight");
          -[VCVideoRule fRate](v34, "fRate");
          v62 = v14;
          v46 = a6;
          v48 = (int)v47;
          v49 = objc_msgSend(v63, "iWidth");
          v50 = v16;
          v51 = objc_msgSend(v63, "iHeight");
          objc_msgSend(v63, "fRate");
          *(_DWORD *)buf = 136317186;
          v72 = v44;
          v73 = 2080;
          v74 = "-[VCCallSession(PrivateMethods) getVideoSettings:forInterface:payload:width:height:framerate:bitRate:]";
          v75 = 1024;
          v76 = 8890;
          v77 = 1024;
          v78 = v59;
          v79 = 1024;
          v80 = v58;
          v81 = 1024;
          v82 = v48;
          a6 = v46;
          v14 = v62;
          v83 = 1024;
          v84 = v49;
          v85 = 1024;
          v86 = v51;
          v16 = v50;
          v87 = 1024;
          v88 = (int)v52;
          _os_log_impl(&dword_1D8A54000, v45, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: limiting negotiated video settings from %dx%d@%d to %dx%d@%d due to slow connection", buf, 0x40u);
        }
      }
      DWORD1(v69) = objc_msgSend(v63, "iWidth");
      LODWORD(v70[0]) = objc_msgSend(v63, "iHeight");
      objc_msgSend(v63, "fRate");
      HIDWORD(v70[0]) = (int)v53;
    }
    goto LABEL_48;
  }
LABEL_49:
  if (v14 == 2)
  {
    v56 = v70[0];
    *a6 = DWORD1(v69);
    *a7 = v56;
    *a8 = HIDWORD(v70[0]);
    if (v16 && *a7 * *a6 <= 307200)
      *v16 = 802;
  }
  else
  {
    if (v14 == 1)
    {
      v54 = v70[0];
      *a6 = DWORD1(v69);
      *a7 = v54;
      v55 = HIDWORD(v70[0]);
    }
    else
    {
      LOBYTE(v33) = 0;
      *a6 = 320;
      *a7 = 240;
      v55 = 15;
    }
    *a8 = v55;
  }
  return (char)v33;
}

- (BOOL)startMediaQueue:(id *)a3
{
  unint64_t v3;
  double v5;

  LODWORD(v3) = self->_vpioFormat.samplesPerFrame;
  v5 = (double)v3 / self->_vpioFormat.format.mSampleRate;
  MediaQueue_Start();
  RTPSetMediaQueue(v5, (uint64_t)self->rtpHandle, (uint64_t)self->hMediaQueue);
  RTPSetMediaQueue(v5, (uint64_t)self->rtpVideo, (uint64_t)self->hMediaQueue);
  if (-[VCCallInfo useNewPLCalc](self->remoteCallInfo, "useNewPLCalc"))
  {
    AFRCSetPLCalc((uint64_t)self->hAFRC, 1);
    MediaQueue_SetPLCalc((uint64_t)self->hMediaQueue, 1);
  }
  RTPSetRedundantAudio((uint64_t)self->rtpHandle, !self->isGKVoiceChat, self->_isRedEnabled);
  return 1;
}

- (BOOL)stopMediaQueue:(id *)a3
{
  MediaQueue_CloseHandle();
  self->hMediaQueue = (tagHANDLE *)0xFFFFFFFFLL;
  return 1;
}

- (unsigned)vcrcServerBagProfileNumber
{
  id v2;
  id v3;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = +[VCRateControlServerBag profileNumberKeyWithMode:](VCRateControlServerBag, "profileNumberKeyWithMode:", self->operatingMode);
  v3 = +[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:](GKSConnectivitySettings, "getVCRCSeverBagConfigWithKey:", v2);
  if (v3)
    return objc_msgSend(v3, "unsignedIntValue");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136316162;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCCallSession(PrivateMethods) vcrcServerBagProfileNumber]";
      v11 = 1024;
      v12 = 8971;
      v13 = 2112;
      v14 = v2;
      v15 = 1024;
      v16 = 0;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Could not find server bag config for %@. Using default value %d", (uint8_t *)&v7, 0x2Cu);
    }
  }
  return 0;
}

- (id)vcrcServerBag
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  VCRateControlServerBag *v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = +[VCRateControlServerBag keysWithMode:](VCRateControlServerBag, "keysWithMode:", self->operatingMode);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "setObject:forKeyedSubscript:", +[GKSConnectivitySettings getVCRCSeverBagConfigWithKey:](GKSConnectivitySettings, "getVCRCSeverBagConfigWithKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8)), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v6);
  }
  v9 = -[VCRateControlServerBag initWithMode:serverBagDict:]([VCRateControlServerBag alloc], "initWithMode:serverBagDict:", self->operatingMode, v3);

  return v9;
}

- (BOOL)startAFRC:(id *)a3
{
  BOOL v3;
  CFPropertyListRef v7;
  const void *v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  int IsInterfaceOnCellularForActiveConnectionWithQuality;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  int v19;
  _BOOL4 v20;
  uint64_t v21;
  NSObject *v22;
  int v23;
  int operatingMode;
  _BOOL4 v26;
  _BOOL4 v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  _BOOL4 v32;
  int v33;
  VCRateControlMediaController *mediaController;
  uint64_t IsLTEOrNewer;
  int v36;
  uint64_t v37;
  NSObject *v38;
  char v39;
  int v40;
  uint8_t v41[4];
  uint64_t v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  _BOOL4 v50;
  uint8_t buf[4];
  uint64_t v52;
  _BYTE v53[12];
  int v54;
  _BYTE v55[12];
  const char *v56;
  unsigned int v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (self->hAFRC != (tagHANDLE *)0xFFFFFFFFLL)
    return 1;
  v7 = CFPreferencesCopyAppValue(CFSTR("enableTFRCLog"), CFSTR("com.apple.VideoConference"));
  if (v7)
  {
    v8 = v7;
    v9 = CFEqual(v7, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
    v10 = v9 != 0;
    if (v9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v52 = v11;
          *(_WORD *)v53 = 2080;
          *(_QWORD *)&v53[2] = "-[VCCallSession(PrivateMethods) startAFRC:]";
          *(_WORD *)&v53[10] = 1024;
          v54 = 8998;
          _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Found enableTFRCLog YES. Enable rate control log", buf, 0x1Cu);
        }
      }
    }
    CFRelease(v8);
  }
  else
  {
    v10 = 0;
  }
  v40 = -1431655766;
  v13 = -[VCCallSession evaluateEnableRRx:](self, "evaluateEnableRRx:", &v40);
  IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v15 = VRTraceErrorLogLevelToCSTR();
    v16 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v17 = "YES";
      *(_DWORD *)buf = 136316162;
      if (v40)
        v18 = "YES";
      else
        v18 = "NO";
      v52 = v15;
      *(_QWORD *)&v53[2] = "-[VCCallSession(PrivateMethods) startAFRC:]";
      *(_WORD *)v53 = 2080;
      if (!IsInterfaceOnCellularForActiveConnectionWithQuality)
        v17 = "NO";
      *(_WORD *)&v53[10] = 1024;
      v54 = 9010;
      *(_WORD *)v55 = 2080;
      *(_QWORD *)&v55[2] = v18;
      *(_WORD *)&v55[10] = 2080;
      v56 = v17;
      _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Local device uses cellular:[%s], remote device uses cellular:[%s]", buf, 0x30u);
    }
  }
  v58 = 0;
  v19 = -[VCConnectionManager connectionCount](self->connectionManager, "connectionCount");
  v20 = -[VCConnectionManager isLocalCellularInterfaceUsed](self->connectionManager, "isLocalCellularInterfaceUsed");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v41 = 136316162;
      v42 = v21;
      v43 = 2080;
      v44 = "-[VCCallSession(PrivateMethods) startAFRC:]";
      v45 = 1024;
      v46 = 9018;
      v47 = 1024;
      v48 = v19;
      v49 = 1024;
      v50 = v20;
      _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Current connection number %d, enableBBDump %d", v41, 0x28u);
    }
  }
  *(_DWORD *)buf = v40;
  LODWORD(v52) = IsInterfaceOnCellularForActiveConnectionWithQuality;
  HIDWORD(v52) = -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
  v23 = -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0);
  operatingMode = self->operatingMode;
  v26 = operatingMode == 2 || operatingMode == 7;
  *(_DWORD *)v53 = v23;
  *(_DWORD *)&v53[4] = v26;
  *(_DWORD *)&v53[8] = v13;
  v54 = v10;
  *(_DWORD *)v55 = self->enableRateControlDump;
  *(_DWORD *)&v55[4] = v19;
  *(_DWORD *)&v55[8] = v20;
  LODWORD(v56) = operatingMode == 4;
  HIDWORD(v56) = self->_isRedEnabled;
  v57 = -[VCCallSession callID](self, "callID");
  v27 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 1024);
  LOBYTE(v58) = v27;
  BYTE2(v58) = self->useVCRC;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v41 = 136315906;
      v42 = v28;
      v43 = 2080;
      v44 = "-[VCCallSession(PrivateMethods) startAFRC:]";
      v45 = 1024;
      v46 = 9035;
      v47 = 1024;
      v48 = v27;
      _os_log_impl(&dword_1D8A54000, v29, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch allowBurstyLossRampDownEnabled %d", v41, 0x22u);
    }
  }
  BYTE1(v58) = !-[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 8);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v32 = -[VCSwitchManager isSwitchEnabled:](self->_switchManager, "isSwitchEnabled:", 8);
      *(_DWORD *)v41 = 136315906;
      v42 = v30;
      v43 = 2080;
      v44 = "-[VCCallSession(PrivateMethods) startAFRC:]";
      v45 = 1024;
      v46 = 9037;
      v47 = 1024;
      v48 = v32;
      _os_log_impl(&dword_1D8A54000, v31, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Load switch lowFpsVideoEnabled %d", v41, 0x22u);
    }
  }
  HIBYTE(v58) = -[VCCallSession mediaControlInfoFECFeedbackVersion](self, "mediaControlInfoFECFeedbackVersion");
  v33 = AFRCCreateHandle((uint64_t *)&self->hAFRC, (uint64_t)self->hMediaQueue, self->reportingAgent, (int *)buf);
  v3 = v33 >= 0;
  if (v33 < 0)
  {
    v36 = v33;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 2)
    {
      VRTraceErrorLogLevelToCSTR();
      if ((VRTraceIsOSFaultDisabled() & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) startAFRC:].cold.1();
      }
      else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_FAULT))
      {
        -[VCCallSession(PrivateMethods) startAFRC:].cold.2();
      }
    }
    +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", a3, 32000, 231, v36, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9046), CFSTR("Could not setup AFRC"), CFSTR("could not create handle"));
  }
  else
  {
    v39 = 0;
    if ((AFRCGetSendersLogState((uint64_t)self->hAFRC, (BOOL *)&v39, &self->bBWEstActiveProbingSenderLog) & 0x80000000) == 0)
      MediaQueue_SetActiveProbingLog((uint64_t)self->hMediaQueue, v39);
    if (!self->bBWEstOperatingModeInitialized
      || -[VCCallSession Conference_SetBWEstMode:bFakeLargeFrameMode:](self, "Conference_SetBWEstMode:bFakeLargeFrameMode:", self->bBWEstNewBWEstModeEnabled, self->bBWEstFakeLargeFrameModeEnabled) < 0)
    {
      VTP_SetAFRCRecvMode((uint64_t)self->hAFRC, 0);
    }
    RTPSetAFRCHandle((uint64_t)self->rtpHandle, (uint64_t)self->hAFRC);
    RTPSetAFRCHandle((uint64_t)self->rtpVideo, (uint64_t)self->hAFRC);
    mediaController = -[VCRateControlMediaController initWithMediaQueue:delegate:]([VCRateControlMediaController alloc], "initWithMediaQueue:delegate:", self->hMediaQueue, self);
    self->_mediaController = mediaController;
    if (HIDWORD(v52))
    {
      IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(HIDWORD(v52));
      mediaController = self->_mediaController;
    }
    else
    {
      IsLTEOrNewer = 1;
    }
    -[VCRateControlMediaController setIsSenderProbingEnabled:](mediaController, "setIsSenderProbingEnabled:", IsLTEOrNewer);
    -[VCRateControlMediaController setIsRTPFlushBasebandFromVCRateControl:](self->_mediaController, "setIsRTPFlushBasebandFromVCRateControl:", 1);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v41 = 136315650;
        v42 = v37;
        v43 = 2080;
        v44 = "-[VCCallSession(PrivateMethods) startAFRC:]";
        v45 = 1024;
        v46 = 9086;
        _os_log_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Starting AFRC", v41, 0x1Cu);
      }
    }
  }
  return v3;
}

- (BOOL)startVCRC:(id *)a3
{
  id v4;
  opaqueRTCReporting *reportingAgent;
  AVCRateController *rateController;
  VCRateControlMediaController *mediaController;
  VCRateControlMediaController *v8;
  uint64_t v9;
  NSObject *v10;
  AVCRateController *v11;
  VCRateControlMediaController *v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  AVCRateController *v26;
  __int16 v27;
  VCRateControlMediaController *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->_rateController)
  {
    v15 = 0u;
    v18 = 0;
    v17 = 0u;
    v16 = 0u;
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%010u"), -[VCCallSession callID](self, "callID", a3));
    BYTE1(v15) = 1;
    v4 = -[VCCallSession vcrcServerBag](self, "vcrcServerBag");
    reportingAgent = self->reportingAgent;
    *((_QWORD *)&v15 + 1) = v4;
    *(_QWORD *)&v16 = reportingAgent;
    BYTE8(v16) = 1;
    rateController = -[AVCRateController initWithDelegate:params:]([AVCRateController alloc], "initWithDelegate:params:", self, &v14);
    self->_rateController = rateController;
    mediaController = self->_mediaController;
    if (!mediaController)
    {
      v8 = -[VCRateControlMediaController initWithMediaQueue:delegate:]([VCRateControlMediaController alloc], "initWithMediaQueue:delegate:", self->hMediaQueue, self);
      self->_mediaController = v8;
      -[VCRateControlMediaController setIsRTPFlushBasebandFromVCRateControl:](v8, "setIsRTPFlushBasebandFromVCRateControl:", 1);
      rateController = self->_rateController;
      mediaController = self->_mediaController;
    }
    -[AVCRateController setMediaController:](rateController, "setMediaController:", mediaController);
    -[VCRateControlMediaController setStatisticsCollector:](self->_mediaController, "setStatisticsCollector:", -[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector"));
    -[AVCStatisticsCollector setMediaControlInfoFECFeedbackVersion:](-[VCRateControlMediaController statisticsCollector](self->_mediaController, "statisticsCollector"), "setMediaControlInfoFECFeedbackVersion:", -[VCCallSession mediaControlInfoFECFeedbackVersion](self, "mediaControlInfoFECFeedbackVersion"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = self->_rateController;
        v12 = self->_mediaController;
        *(_DWORD *)buf = 136316162;
        v20 = v9;
        v21 = 2080;
        v22 = "-[VCCallSession(PrivateMethods) startVCRC:]";
        v23 = 1024;
        v24 = 9110;
        v25 = 2048;
        v26 = v11;
        v27 = 2048;
        v28 = v12;
        _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Starting VCRateController (%p) and VCMediaController (%p)", buf, 0x30u);
      }
    }
    -[VCCallSession configureRateController](self, "configureRateController");
    RTPSetStatisticsCollector((uint64_t)self->rtpHandle, -[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector"));
    RTPSetStatisticsCollector((uint64_t)self->rtpVideo, -[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector"));
    RTPSetBasebandCongestionDetector((uint64_t)self->rtpHandle, -[AVCRateController basebandCongestionDetector](self->_rateController, "basebandCongestionDetector"));
    -[AVCRateController start](self->_rateController, "start");
  }
  return 1;
}

- (BOOL)startRateControl:(id *)a3
{
  tagHANDLE *hAFRC;
  AVCRateController *rateController;
  _BOOL4 v7;

  if (self->useAFRC && !-[VCCallSession startAFRC:](self, "startAFRC:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
        return v7;
      -[VCCallSession(PrivateMethods) startRateControl:].cold.2();
    }
LABEL_15:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (self->useVCRC && !-[VCCallSession startVCRC:](self, "startVCRC:", a3))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
      if (!v7)
        return v7;
      -[VCCallSession(PrivateMethods) startRateControl:].cold.1();
    }
    goto LABEL_15;
  }
  hAFRC = self->hAFRC;
  if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL)
  {
    rateController = self->_rateController;
    if (rateController)
      AFRCSetStatisticsCollector((uint64_t)hAFRC, (uint64_t)-[AVCRateController statisticsCollector](rateController, "statisticsCollector"));
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (BOOL)stopRateControl:(id *)a3
{
  tagHANDLE *hAFRC;
  NSObject *global_queue;
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (self->hAFRC != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VTP_SetAFRCRecvMode(0xFFFFFFFFLL, 0);
    hAFRC = self->hAFRC;
    global_queue = dispatch_get_global_queue(0, 0);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__VCCallSession_PrivateMethods__stopRateControl___block_invoke;
    v7[3] = &__block_descriptor_40_e5_v8__0l;
    v7[4] = hAFRC;
    dispatch_async(global_queue, v7);
    self->hAFRC = (tagHANDLE *)0xFFFFFFFFLL;
  }
  -[AVCRateController stop](self->_rateController, "stop");
  return 1;
}

uint64_t __49__VCCallSession_PrivateMethods__stopRateControl___block_invoke()
{
  return AFRCCloseHandle();
}

- (void)setupAACELDPayload:(int)a3
{
  uint64_t v3;
  BOOL useSBR;
  int v6;
  BOOL v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = 0;
  if (!-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
  {
    if (-[SDPMini getUseSbr:blockSize:forAACFormat:](-[VCCallInfo sdp](self->remoteCallInfo, "sdp"), "getUseSbr:blockSize:forAACFormat:", &v7, &v6, v3))
    {
      useSBR = v7;
      if (v7)
        useSBR = self->useSBR;
      self->useSBR = useSBR;
      if (v6 > self->aacBlockSize)
        self->aacBlockSize = v6;
    }
    else
    {
      self->useSBR = 0;
    }
  }
}

- (id)newConfigForPayloadType:(int)a3
{
  uint64_t v3;
  id v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  _BOOL8 v9;
  int v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int operatingMode;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 isUseCaseWatchContinuity;
  VCAudioPayloadConfig *v21;
  int v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v3 = *(_QWORD *)&a3;
  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3), CFSTR("vcAudioPayloadConfigKeyPayloadType"));
  v6 = v3 - 104;
  if ((v3 - 104) <= 2)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->aacBlockSize), CFSTR("vcAudioPayloadConfigKeyBlockSize"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_vpioFormat.format.mSampleRate), CFSTR("vcAudioPayloadConfigKeyInputSampleRate"));
  if (self->_isUseCaseWatchContinuity)
    LODWORD(v7) = 1;
  else
    LODWORD(v7) = 3;
  v8 = -[VCDefaults forceAudioPacketsPerBundle](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "forceAudioPacketsPerBundle");
  if (v8)
    v7 = v8;
  else
    v7 = v7;
  if ((v3 - 97) <= 1)
  {
    if (self->_isUseCaseWatchContinuity)
    {
      v9 = 0;
    }
    else
    {
      operatingMode = self->operatingMode;
      v9 = operatingMode == 2 || operatingMode == 7;
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7), CFSTR("vcPayloadConfigKeyInternalBundleFactor"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isUseCaseWatchContinuity), CFSTR("vcPayloadConfigKeyOctetAligned"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9), CFSTR("vcPayloadConfigKeyDTXEnabled"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v18 = VRTraceErrorLogLevelToCSTR();
      v19 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        isUseCaseWatchContinuity = self->_isUseCaseWatchContinuity;
        v23 = 136316418;
        v24 = v18;
        v25 = 2080;
        v26 = "-[VCCallSession(PrivateMethods) newConfigForPayloadType:]";
        v27 = 1024;
        v28 = 9195;
        v29 = 1024;
        v30 = v7;
        v31 = 1024;
        v32 = isUseCaseWatchContinuity;
        v33 = 1024;
        v34 = v9;
        _os_log_impl(&dword_1D8A54000, v19, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d AMR packetsPerBundle[%d] octetAligned[%d] dtxEnabled[%d]", (uint8_t *)&v23, 0x2Eu);
      }
    }
    goto LABEL_34;
  }
  if ((_DWORD)v3 != 108)
  {
LABEL_34:
    if (v6 <= 2)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->useSBR), CFSTR("vcPayloadConfigKeyUseSBR"));
    goto LABEL_36;
  }
  v10 = self->operatingMode;
  v11 = v10 == 2 || v10 == 7;
  v12 = v11;
  if (v11)
    v13 = 0;
  else
    v13 = 3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12), CFSTR("vcPayloadConfigKeyDTXEnabled"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13), CFSTR("vcPayloadConfigKeyEVSSIDPeriod"));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136316162;
      v24 = v14;
      v25 = 2080;
      v26 = "-[VCCallSession(PrivateMethods) newConfigForPayloadType:]";
      v27 = 1024;
      v28 = 9203;
      v29 = 1024;
      v30 = v12;
      v31 = 1024;
      v32 = v13;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d EVS dtxEnabled[%d] evsSIDPeriod[%d]", (uint8_t *)&v23, 0x28u);
    }
  }
LABEL_36:
  v21 = -[VCAudioPayloadConfig initWithConfigDict:]([VCAudioPayloadConfig alloc], "initWithConfigDict:", v5);

  return v21;
}

- (id)addAudioPayload:(int)a3
{
  id v4;
  VCAudioPayload *v5;

  v4 = -[VCCallSession newConfigForPayloadType:](self, "newConfigForPayloadType:", *(_QWORD *)&a3);
  v5 = -[VCAudioPayload initWithConfig:]([VCAudioPayload alloc], "initWithConfig:", v4);
  if (v5)
    -[NSMutableArray addObject:](self->negotiatedAudioPayloads, "addObject:", v5);

  return v5;
}

- (id)negotiatedAudioPayloadTypes
{
  void *v3;
  NSMutableArray *negotiatedAudioPayloads;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->negotiatedAudioPayloads, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  negotiatedAudioPayloads = self->negotiatedAudioPayloads;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](negotiatedAudioPayloads, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(negotiatedAudioPayloads);
        objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8++), "config"), "payload")));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](negotiatedAudioPayloads, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v6);
  }
  return v3;
}

- (BOOL)setupAudioCodecWithPayload:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  VCAudioPayload *v7;
  VCCallSessionDelegate *v8;
  __int128 v9;
  _BYTE v11[40];
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v11 = 136315906;
      *(_QWORD *)&v11[4] = v5;
      *(_WORD *)&v11[12] = 2080;
      *(_QWORD *)&v11[14] = "-[VCCallSession(PrivateMethods) setupAudioCodecWithPayload:]";
      *(_WORD *)&v11[22] = 1024;
      *(_DWORD *)&v11[24] = 9238;
      *(_WORD *)&v11[28] = 1024;
      *(_DWORD *)&v11[30] = v3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Setting up audioCodec with payload=%d", v11, 0x22u);
    }
  }
  if ((v3 - 104) > 2)
    self->useSBR = 0;
  else
    -[VCCallSession setupAACELDPayload:](self, "setupAACELDPayload:", v3);
  v7 = -[VCCallSession addAudioPayload:](self, "addAudioPayload:", v3);
  self->currentAudioPayload = v7;
  self->sampleRate = -[VCAudioPayloadConfig inputSampleRate](-[VCAudioPayload config](v7, "config"), "inputSampleRate");
  self->_vpioFormat.samplesPerFrame = -[VCAudioPayloadConfig inputSampleRate](-[VCAudioPayload config](self->currentAudioPayload, "config"), "inputSampleRate")/ 0x32;
  v8 = -[VCCallSession delegate](self, "delegate");
  if (v8)
    -[VCCallSessionDelegate audioIOFormat](v8, "audioIOFormat");
  else
    memset(v11, 0, sizeof(v11));
  v9 = *(_OWORD *)&v11[16];
  *(_OWORD *)&self->_vpioFormat.format.mSampleRate = *(_OWORD *)v11;
  *(_OWORD *)&self->_vpioFormat.format.mBytesPerPacket = v9;
  *(_QWORD *)&self->_vpioFormat.format.mBitsPerChannel = *(_QWORD *)&v11[32];
  self->_vpioFormat.format.mSampleRate = (double)self->sampleRate;
  return self->currentAudioPayload != 0;
}

- (unsigned)codecBitmapForPayloads:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t i;
  int v9;
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
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(a3);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "intValue");
      if (v9 <= 96)
      {
        if (v9)
        {
          if (v9 == 9)
          {
            v6 |= 0x40u;
          }
          else if (v9 == 13)
          {
            v6 |= 0x8000u;
          }
        }
        else
        {
          v6 |= 4u;
        }
      }
      else if (v9 > 118)
      {
        switch(v9)
        {
          case 'w':
            v6 |= 0x1000u;
            break;
          case 'y':
            v6 |= 0x800u;
            break;
          case 'z':
            v6 |= 0x400u;
            break;
        }
      }
      else
      {
        switch(v9)
        {
          case 'a':
            v6 |= 0x2000u;
            break;
          case 'b':
            v6 |= 0x4000u;
            break;
          case 'h':
            v6 |= 0x200u;
            break;
          case 'i':
            v6 |= 0x100u;
            break;
          case 'j':
            v6 |= 0x80u;
            break;
          case 'l':
            v6 |= 2u;
            break;
          default:
            continue;
        }
      }
    }
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  }
  while (v5);
  return v6;
}

- (BOOL)choosePayload:(id)a3
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  int v12;
  unsigned int preferredAudioCodec;
  __int16 v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  int v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  _BYTE v46[128];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = +[VCAudioRuleCollection getForcedPayload](VCAudioRuleCollection, "getForcedPayload");
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v48;
      LODWORD(v10) = 128;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v48 != v9)
            objc_enumerationMutation(a3);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "intValue");
          preferredAudioCodec = v6;
          if (v6 == 128)
            preferredAudioCodec = self->preferredAudioCodec;
          if (v12 == preferredAudioCodec)
            v10 = preferredAudioCodec;
          else
            v10 = v10;
        }
        v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v47, v46, 16);
      }
      while (v8);
      if ((_DWORD)v10 != 128)
        goto LABEL_77;
    }
    if (v6 != 128)
    {
LABEL_28:
      LOBYTE(v5) = 0;
      return v5;
    }
    v14 = -[VCCallSession codecBitmapForPayloads:](self, "codecBitmapForPayloads:", a3);
    if ((v14 & 0x200) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v40 = 136315650;
          v41 = v15;
          v42 = 2080;
          v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          v44 = 1024;
          v45 = 9318;
          _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AAC_ELD/24000!", (uint8_t *)&v40, 0x1Cu);
        }
      }
      v10 = 104;
      goto LABEL_77;
    }
    if ((v14 & 0x100) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v40 = 136315650;
          v41 = v17;
          v42 = 2080;
          v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          v44 = 1024;
          v45 = 9321;
          _os_log_impl(&dword_1D8A54000, v18, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AAC_ELD/22050!", (uint8_t *)&v40, 0x1Cu);
        }
      }
      v10 = 105;
      goto LABEL_77;
    }
    if ((v14 & 0x80) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v19 = VRTraceErrorLogLevelToCSTR();
        v20 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v40 = 136315650;
          v41 = v19;
          v42 = 2080;
          v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          v44 = 1024;
          v45 = 9324;
          _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AAC_ELD/16000!", (uint8_t *)&v40, 0x1Cu);
        }
      }
      v10 = 106;
      goto LABEL_77;
    }
    if ((v14 & 0x40) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v21 = VRTraceErrorLogLevelToCSTR();
        v22 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v40 = 136315650;
          v41 = v21;
          v42 = 2080;
          v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          v44 = 1024;
          v45 = 9327;
          _os_log_impl(&dword_1D8A54000, v22, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_G722!", (uint8_t *)&v40, 0x1Cu);
        }
      }
      v10 = 9;
      goto LABEL_77;
    }
    if ((v14 & 0x1000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v40 = 136315650;
          v41 = v23;
          v42 = 2080;
          v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          v44 = 1024;
          v45 = 9330;
          _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_OPUS", (uint8_t *)&v40, 0x1Cu);
        }
      }
      v10 = 119;
      goto LABEL_77;
    }
    if (v14 < 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v40 = 136315650;
          v41 = v25;
          v42 = 2080;
          v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          v44 = 1024;
          v45 = 9333;
          _os_log_impl(&dword_1D8A54000, v26, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_CN", (uint8_t *)&v40, 0x1Cu);
        }
      }
      v10 = 13;
      goto LABEL_77;
    }
    if ((v14 & 0x400) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v40 = 136315650;
          v41 = v27;
          v42 = 2080;
          v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          v44 = 1024;
          v45 = 9336;
          _os_log_impl(&dword_1D8A54000, v28, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_SPEEX_8K", (uint8_t *)&v40, 0x1Cu);
        }
      }
      v10 = 122;
      goto LABEL_77;
    }
    if ((v14 & 0x800) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v29 = VRTraceErrorLogLevelToCSTR();
        v30 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v40 = 136315650;
          v41 = v29;
          v42 = 2080;
          v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
          v44 = 1024;
          v45 = 9339;
          _os_log_impl(&dword_1D8A54000, v30, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_SPEEX_16K", (uint8_t *)&v40, 0x1Cu);
        }
      }
      v10 = 121;
      goto LABEL_77;
    }
    if ((v14 & 4) == 0)
    {
      if ((v14 & 0x4000) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v33 = VRTraceErrorLogLevelToCSTR();
          v34 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v40 = 136315650;
            v41 = v33;
            v42 = 2080;
            v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
            v44 = 1024;
            v45 = 9345;
            _os_log_impl(&dword_1D8A54000, v34, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AMR_16000!", (uint8_t *)&v40, 0x1Cu);
          }
        }
        v10 = 98;
      }
      else if ((v14 & 0x2000) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v35 = VRTraceErrorLogLevelToCSTR();
          v36 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v40 = 136315650;
            v41 = v35;
            v42 = 2080;
            v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
            v44 = 1024;
            v45 = 9348;
            _os_log_impl(&dword_1D8A54000, v36, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_AMR_8000!", (uint8_t *)&v40, 0x1Cu);
          }
        }
        v10 = 97;
      }
      else
      {
        if ((v14 & 2) == 0)
          goto LABEL_28;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v37 = VRTraceErrorLogLevelToCSTR();
          v38 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v40 = 136315650;
            v41 = v37;
            v42 = 2080;
            v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
            v44 = 1024;
            v45 = 9351;
            _os_log_impl(&dword_1D8A54000, v38, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting PL_EVS_32000!", (uint8_t *)&v40, 0x1Cu);
          }
        }
        v10 = 108;
      }
LABEL_77:
      LOBYTE(v5) = -[VCCallSession setupAudioCodecWithPayload:](self, "setupAudioCodecWithPayload:", v10);
      return v5;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E0CF2758];
      v10 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        goto LABEL_77;
      v40 = 136315650;
      v41 = v31;
      v42 = 2080;
      v43 = "-[VCCallSession(PrivateMethods) choosePayload:]";
      v44 = 1024;
      v45 = 9342;
      _os_log_impl(&dword_1D8A54000, v32, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Selecting MULAW!", (uint8_t *)&v40, 0x1Cu);
    }
    v10 = 0;
    goto LABEL_77;
  }
  return v5;
}

- (BOOL)chooseSecondaryPayloads:(id)a3
{
  __int16 v4;
  int v5;
  int v6;
  int v7;

  v4 = -[VCCallSession codecBitmapForPayloads:](self, "codecBitmapForPayloads:", a3);
  v5 = -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload");
  v6 = v5;
  v7 = 0;
  if ((v4 & 0x80) != 0 && v5 != 106)
    v7 = -[VCCallSession addAudioPayload:](self, "addAudioPayload:", 106) != 0;
  if ((v4 & 0x800) != 0 && v6 != 121 && -[VCCallSession addAudioPayload:](self, "addAudioPayload:", 121))
    ++v7;
  if ((v4 & 0x400) != 0 && v6 != 122 && -[VCCallSession addAudioPayload:](self, "addAudioPayload:", 122))
    ++v7;
  if ((v4 & 0x1000) != 0 && v6 != 119 && -[VCCallSession addAudioPayload:](self, "addAudioPayload:", 119))
    ++v7;
  if ((v4 & 0x4000) != 0 && v6 != 98 && -[VCCallSession addAudioPayload:](self, "addAudioPayload:", 98))
    ++v7;
  if ((v4 & 0x2000) != 0 && v6 != 97 && -[VCCallSession addAudioPayload:](self, "addAudioPayload:", 97))
    ++v7;
  if ((v4 & 2) != 0 && v6 != 108 && -[VCCallSession addAudioPayload:](self, "addAudioPayload:", 108))
    ++v7;
  return v7 != 0;
}

- (BOOL)chooseDTXPayloads:(id)a3
{
  if ((-[VCCallSession codecBitmapForPayloads:](self, "codecBitmapForPayloads:", a3) & 0x8000) == 0
    || -[VCAudioPayloadConfig payload](-[VCAudioPayload config](self->currentAudioPayload, "config"), "payload") == 13)
  {
    return 0;
  }
  self->currentDTXPayload = (VCAudioPayload *)-[VCCallSession addAudioPayload:](self, "addAudioPayload:", 13);
  return 1;
}

- (void)shutdownVoiceChatFromRemoteSIPSignal:(int)a3 withReason:(const char *)a4
{
  id v7;
  unsigned int v8;
  NSObject *global_queue;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];
  _QWORD block[6];
  _QWORD v17[6];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v18[0] = 0;
  v8 = -[VCCallSession primaryConnectionType](self, "primaryConnectionType");
  switch(a3)
  {
    case 0:
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v18, 32003, 235, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9460), CFSTR("Remote participant hangup."), CFSTR("Remote participant hangup."));
      global_queue = dispatch_get_global_queue(2, 0);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke_3;
      v15[3] = &unk_1E9E52238;
      v15[4] = self;
      v15[5] = v18[0];
      v10 = v15;
      goto LABEL_10;
    case 3:
      if (a4)
        a4 = (const char *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
      if (-[VCConnectionManager isConnectedOnRelayForActiveConnectionWithQuality:](self->connectionManager, "isConnectedOnRelayForActiveConnectionWithQuality:", 1))
      {
        v11 = 252;
      }
      else
      {
        v11 = 216;
      }
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9433);
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v18, 32002, v11, v12, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SIP failed with internal fatal error")), a4);
      global_queue = dispatch_get_global_queue(2, 0);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke;
      v17[3] = &unk_1E9E52238;
      v17[4] = self;
      v17[5] = v18[0];
      v10 = v17;
      goto LABEL_10;
    case 5:
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v18, 32009, 234, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9447), CFSTR("Remote participant cancelled request."), CFSTR("Remote participant cancelled session."));
      global_queue = dispatch_get_global_queue(2, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke_2;
      block[3] = &unk_1E9E52238;
      block[4] = self;
      block[5] = v18[0];
      v10 = block;
LABEL_10:
      dispatch_async(global_queue, v10);
      break;
    case 8:
      v13 = 232;
      if (v8 > 2)
        v13 = 254;
      if (v8 == 2)
        v14 = 253;
      else
        v14 = v13;
      -[VCCallSession disconnectWithNoRemotePackets:](self, "disconnectWithNoRemotePackets:", v14);
      break;
    default:
      break;
  }

}

uint64_t __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __81__VCCallSession_PrivateMethods__shutdownVoiceChatFromRemoteSIPSignal_withReason___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", *(_QWORD *)(a1 + 40), 0);
}

- (void)sipConnectThreadProc:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  __CFData *secretKey;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  NSObject *videoQueue;
  _QWORD block[7];
  _QWORD v16[5];
  CFTypeRef cf;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  _BYTE buf[24];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = __Block_byref_object_copy__15;
  v22 = __Block_byref_object_dispose__15;
  v23 = 0;
  if (self->_sipState != 5
    || !-[VCCallSession sipConnectWithError:](self, "sipConnectWithError:", &v23)
    || -[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
  {
    goto LABEL_38;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  if (-[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled")
    || -[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
  {
    cf = 0;
    -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 3);
    if (-[VCCapabilities isDTLSEnabled](self->caps, "isDTLSEnabled"))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCallSession(PrivateMethods) sipConnectThreadProc:]";
          *(_WORD *)&buf[22] = 1024;
          v25 = 9524;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- check use dtls-srtp key", buf, 0x1Cu);
        }
      }
      if (self->srtpKeyBytes)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v7 = VRTraceErrorLogLevelToCSTR();
          v8 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = v7;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCCallSession(PrivateMethods) sipConnectThreadProc:]";
            *(_WORD *)&buf[22] = 1024;
            v25 = 9526;
            _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex use dtls-srtp key", buf, 0x1Cu);
          }
        }
        cf = CFRetain(self->srtpKeyBytes);
        if (!cf)
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    else if (-[VCCallSession isSKEOptimizationEnabled](self, "isSKEOptimizationEnabled"))
    {
      -[VCCallSession lock](self, "lock");
      secretKey = self->secretKey;
      if (secretKey)
      {
        cf = CFRetain(secretKey);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) sipConnectThreadProc:].cold.1();
      }
      -[VCCallSession unlock](self, "unlock");
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v10;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "-[VCCallSession(PrivateMethods) sipConnectThreadProc:]";
          *(_WORD *)&buf[22] = 1024;
          v25 = 9510;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d ---- keyex initiate exchange", buf, 0x1Cu);
        }
      }
      -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 4);
      v12 = SIPKeyExchange((uint64_t *)&self->hSIP, -[VCCallInfo callID](self->localCallInfo, "callID"), 0, &cf, 0);
      -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 4);
      if (v12 == -2146828235)
      {
        objc_msgSend(v4, "drain");
        goto LABEL_38;
      }
    }
    if (cf)
    {
LABEL_30:
      *(_DWORD *)buf = 1;
      -[VCCallSession setupEncryptionWithKey:confIndex:](self, "setupEncryptionWithKey:confIndex:", &cf, buf);
      CFRelease(cf);
    }
  }
  else
  {
    -[TimingCollection removeTimingForKey:](self->perfTimers, "removeTimingForKey:", 3);
  }
LABEL_31:
  -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 5);
  v13 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __54__VCCallSession_PrivateMethods__sipConnectThreadProc___block_invoke;
  v16[3] = &unk_1E9E53C48;
  v16[4] = self;
  -[VCCallSession startAudioWithCompletionHandler:](self, "startAudioWithCompletionHandler:", (id)objc_msgSend(v16, "copy"));
  -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 6);
  -[TimingCollection startTimingForKey:](self->perfTimers, "startTimingForKey:", 7);
  -[VCCallSession setUpFirstRemoteFrameTimer](self, "setUpFirstRemoteFrameTimer");
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v25) = 1;
  videoQueue = self->videoQueue;
  block[0] = v13;
  block[1] = 3221225472;
  block[2] = __54__VCCallSession_PrivateMethods__sipConnectThreadProc___block_invoke_2;
  block[3] = &unk_1E9E55C68;
  block[4] = self;
  block[5] = buf;
  block[6] = &v18;
  dispatch_sync(videoQueue, block);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    if (-[VCCallInfo videoIsPaused](self->localCallInfo, "videoIsPaused"))
      -[VCCallSession setPauseVideo:force:error:](self, "setPauseVideo:force:error:", 1, 1, 0);
    -[VCCallSession lock](self, "lock");
    -[VCCallSession enableSessionHealthMonitor](self, "enableSessionHealthMonitor");
    -[VCCallSession unlock](self, "unlock");
    if (-[VCCallSession shouldNotifyDelegateDidStartBeforeAudioSetup](self, "shouldNotifyDelegateDidStartBeforeAudioSetup"))
    {
      -[VCCallSession notifyDelegateSessionStarted](self, "notifyDelegateSessionStarted");
    }
  }
  else
  {
    reportingSymptom();
    -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 7);
    -[VCCallSession cancelFirstRemoteFrameTimer](self, "cancelFirstRemoteFrameTimer");
    -[VCCallSession disconnect:didRemoteCancel:](self, "disconnect:didRemoteCancel:", v19[5], 0);
  }
  -[TimingCollection stopTimingForKey:](self->perfTimers, "stopTimingForKey:", 6);
  -[VCCallSession handlePendingPrimaryConnectionChange](self, "handlePendingPrimaryConnectionChange");

  _Block_object_dispose(buf, 8);
LABEL_38:
  _Block_object_dispose(&v18, 8);
}

uint64_t __54__VCCallSession_PrivateMethods__sipConnectThreadProc___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  _BYTE *v6;
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 672), "stopTimingForKey:", 5);
  v6 = *(_BYTE **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    if (v6[408])
    {
      objc_msgSend(*(id *)(a1 + 32), "setPauseAudio:force:error:", 1, 1, 0);
      v6 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v6, "updateLastReceivedPacketWithTimestamp:packetType:", 1, micro() + 10.0);
  }
  else
  {
    reportingSymptom();
    objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", a3, 0);
  }
  result = objc_msgSend(*(id *)(a1 + 32), "shouldNotifyDelegateDidStartBeforeAudioSetup");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateSessionStarted");
  return result;
}

uint64_t __54__VCCallSession_PrivateMethods__sipConnectThreadProc___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "startVideo:error:", 0, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)shouldNotifyDelegateDidStartBeforeAudioSetup
{
  return -[VCCallSession deviceRole](self, "deviceRole") == 4
      || -[VCCallSession deviceRole](self, "deviceRole") == 5
      || !-[VCCapabilities isAudioEnabled](self->caps, "isAudioEnabled")
      || -[VCCapabilities isVideoEnabled](self->caps, "isVideoEnabled")
      || -[VCCallSession isGKVoiceChat](self, "isGKVoiceChat");
}

- (unsigned)audioRTPID
{
  int v3;
  unsigned int result;
  int v5;
  uint64_t v6;
  NSObject *v7;
  tagHANDLE *rtpHandle;
  unsigned int v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  tagHANDLE *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v3 = RTPGetLocalSSRC((uint64_t)self->rtpHandle, &v9);
  if ((v3 & 0x80000000) == 0)
    return v9;
  v5 = v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    rtpHandle = self->rtpHandle;
    *(_DWORD *)buf = 136316418;
    v11 = v6;
    v12 = 2080;
    v13 = "-[VCCallSession(PrivateMethods) audioRTPID]";
    v14 = 1024;
    v15 = 9621;
    v16 = 1024;
    v17 = 9621;
    v18 = 1024;
    v19 = v5;
    v20 = 2048;
    v21 = rtpHandle;
    _os_log_error_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: RTPGetLocalSSRC for audio failed (%08X) handle = %p", buf, 0x32u);
  }
  return 0;
}

- (unsigned)videoRTPID
{
  unsigned int result;
  unsigned int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if ((RTPGetLocalSSRC((uint64_t)self->rtpVideo, &v3) & 0x80000000) == 0)
    return v3;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    -[VCCallSession(PrivateMethods) videoRTPID].cold.1();
  }
  return 0;
}

- (void)doSipEndProc:(id)a3
{
  id v5;

  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  -[VCCallSession doSipEndAction:callID:error:](self, "doSipEndAction:callID:error:", objc_msgSend(a3, "intValue"), -[VCCallInfo callID](self->localCallInfo, "callID"), 0);

}

- (void)disconnectWithNoRemotePackets:(int64_t)a3
{
  -[VCCallSession disconnectWithNoRemotePackets:timeoutUsed:](self, "disconnectWithNoRemotePackets:timeoutUsed:", a3, self->noRemotePacketsTimeout);
}

- (void)disconnectWithNoRemotePackets:(int64_t)a3 timeoutUsed:(double)a4
{
  NSObject *global_queue;
  _QWORD v8[8];

  v8[7] = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(2, 0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__VCCallSession_PrivateMethods__disconnectWithNoRemotePackets_timeoutUsed___block_invoke;
  v8[3] = &unk_1E9E52910;
  v8[4] = self;
  v8[5] = a3;
  *(double *)&v8[6] = a4;
  dispatch_async(global_queue, v8);
}

uint64_t __75__VCCallSession_PrivateMethods__disconnectWithNoRemotePackets_timeoutUsed___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE buf[12];
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    v4 = *MEMORY[0x1E0CF2758];
    if (*MEMORY[0x1E0CF2748])
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v2;
        v12 = 2080;
        v13 = "-[VCCallSession(PrivateMethods) disconnectWithNoRemotePackets:timeoutUsed:]_block_invoke";
        v14 = 1024;
        v15 = 9654;
        v16 = 1024;
        v17 = v5;
        _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Failing due to no remote packets.  local callid: %x", buf, 0x22u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      __75__VCCallSession_PrivateMethods__disconnectWithNoRemotePackets_timeoutUsed___block_invoke_cold_1();
    }
  }
  *(_QWORD *)buf = 0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v6 + 993))
    objc_msgSend(*(id *)(v6 + 1512), "reportNetworkConditionsDegraded");
  v8 = (int)*(double *)(a1 + 48);
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 9667);
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", buf, 32001, v7, v8, v9, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No remote packets for %d seconds"), (int)*(double *)(a1 + 48)), CFSTR("Remote network outage?"));
  return objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", *(_QWORD *)buf, 0);
}

- (void)doSipEndAction:(int)a3 callID:(unsigned int)a4 error:(id)a5
{
  uint64_t v5;
  void *v8;
  int v9;
  __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v5 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 2:
LABEL_9:
      SIPCancel((uint64_t)self->hSIP, v5);
      break;
    case 1:
      v8 = (void *)objc_msgSend(a5, "userInfo");
      v9 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NSErrorUserInfoDetailedError")), "unsignedIntValue");
      v10 = (__CFString *)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2D68]);
      if (!v10)
        v10 = CFSTR("Normal Call Termination");
      -[__CFString UTF8String](v10, "UTF8String");
      if ((SIPHangupWithTimeout((uint64_t *)&self->hSIP, v5, 0x1388uLL, v9) & 0x80000000) != 0)
        SIPCloseCall((uint64_t)self->hSIP, v5);
      goto LABEL_9;
    case 0:
      SIPCloseCall((uint64_t)self->hSIP, a4);
      break;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315906;
      v14 = v11;
      v15 = 2080;
      v16 = "-[VCCallSession(PrivateMethods) doSipEndAction:callID:error:]";
      v17 = 1024;
      v18 = 9701;
      v19 = 1024;
      v20 = a3;
      _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Finished sip end action %d", (uint8_t *)&v13, 0x22u);
    }
  }
}

- (void)notifyDelegateSessionStarted
{
  NSObject *delegateNotificationQueue;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  self->sentClientSuccessfulDidStart = 1;
  delegateNotificationQueue = self->delegateNotificationQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__VCCallSession_PrivateMethods__notifyDelegateSessionStarted__block_invoke;
  v3[3] = &unk_1E9E521C0;
  v3[4] = self;
  dispatch_async(delegateNotificationQueue, v3);
}

uint64_t __61__VCCallSession_PrivateMethods__notifyDelegateSessionStarted__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)VCConnectionManager_CopyPrimaryConnection(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  v3 = (void *)objc_msgSend(v2, "localInterfaceTypeString");
  v4 = (void *)objc_msgSend(v2, "remoteInterfaceTypeString");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didStart:connectionType:localInterfaceType:remoteInterfaceType:error:", *(_QWORD *)(a1 + 32), 1, objc_msgSend(v2, "type"), v3, v4, 0);
  if (v2)
    CFRelease(v2);
  objc_msgSend(v3, "UTF8String");
  objc_msgSend(v4, "UTF8String");
  return reportingLocalAndRemoteInterface();
}

- (int)Conference_SetBWEstMode:(BOOL)a3 bFakeLargeFrameMode:(BOOL)a4
{
  tagHANDLE *hAFRC;
  int v6;
  int v7;
  __int16 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  hAFRC = self->hAFRC;
  if (hAFRC == (tagHANDLE *)0xFFFFFFFFLL)
  {
    v7 = 0;
    self->bBWEstOperatingModeInitialized = 1;
    self->bBWEstNewBWEstModeEnabled = a3;
    self->bBWEstFakeLargeFrameModeEnabled = a4;
  }
  else
  {
    self->bBWEstNewBWEstModeEnabled = a3;
    self->bBWEstFakeLargeFrameModeEnabled = a4;
    v6 = AFRCSetBWEstMode((uint64_t)hAFRC, a3, -[VCCallInfo isIOS](self->remoteCallInfo, "isIOS"));
    if (v6 < 0)
    {
      return v6;
    }
    else
    {
      v9 = 0;
      v7 = AFRCGetSenderRecvrModes((uint64_t)self->hAFRC, (_BYTE *)&v9 + 1, &v9);
      if ((v7 & 0x80000000) == 0)
      {
        MediaQueue_SetAFRCSendMode((uint64_t)self->hMediaQueue, SHIBYTE(v9));
        VTP_SetAFRCRecvMode((uint64_t)self->hAFRC, v9);
        RTPSetAFRCRecvMode((uint64_t)self->rtpHandle, v9);
        RTPSetAFRCRecvMode((uint64_t)self->rtpVideo, v9);
        -[VCCallSessionDelegate setBWEOptions:UseNewBWEMode:FakeLargeFrameMode:ProbingSenderLog:](self->delegate, "setBWEOptions:UseNewBWEMode:FakeLargeFrameMode:ProbingSenderLog:", self->bBWEstOperatingModeInitialized, self->bBWEstNewBWEstModeEnabled, self->bBWEstFakeLargeFrameModeEnabled, self->bBWEstActiveProbingSenderLog);
      }
    }
  }
  return v7;
}

- (void)setLocalIdentityForKeyExchange
{
  __SecIdentity *v3;
  __SecIdentity *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  NSString *peerCN;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *global_queue;
  VCCapabilities *caps;
  const char *v15;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = -[VCCallSession retrieveIdentity](self, "retrieveIdentity");
  if (v3)
  {
    v4 = v3;
    if (self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v5 = VRTraceErrorLogLevelToCSTR();
        v6 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v7 = -[VCCapabilities isKeyExchangeEnabled](self->caps, "isKeyExchangeEnabled");
          v8 = objc_msgSend((id)-[__SecIdentity description](v4, "description"), "UTF8String");
          peerCN = self->peerCN;
          if (peerCN)
            v10 = -[NSString UTF8String](-[NSString description](peerCN, "description"), "UTF8String");
          else
            v10 = "<nil>";
          caps = self->caps;
          if (caps)
            v15 = (const char *)objc_msgSend(-[VCCapabilities description](caps, "description"), "UTF8String");
          else
            v15 = "<nil>";
          *(_DWORD *)buf = 136316674;
          v18 = v5;
          v19 = 2080;
          v20 = "-[VCCallSession(PrivateMethods) setLocalIdentityForKeyExchange]";
          v21 = 1024;
          v22 = 9772;
          v23 = 1024;
          v24 = v7;
          v25 = 2080;
          v26 = v8;
          v27 = 2080;
          v28 = v10;
          v29 = 2080;
          v30 = v15;
          _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SIPSetDoKeyExchange = %d, ident = %s, peerCN =%s, caps = %s", buf, 0x40u);
        }
      }
      SIPSetDoKeyExchange((uint64_t)self->hSIP, 0, v4);
    }
    CFRelease(v4);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v18 = v11;
        v19 = 2080;
        v20 = "-[VCCallSession(PrivateMethods) setLocalIdentityForKeyExchange]";
        v21 = 1024;
        v22 = 9779;
        _os_log_impl(&dword_1D8A54000, v12, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Failed retreiving the localIdentity from APS", buf, 0x1Cu);
      }
    }
    global_queue = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__VCCallSession_PrivateMethods__setLocalIdentityForKeyExchange__block_invoke;
    block[3] = &unk_1E9E521C0;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
}

uint64_t __63__VCCallSession_PrivateMethods__setLocalIdentityForKeyExchange__block_invoke(uint64_t a1)
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", v3, 32021, 0, 0, CFSTR("We could not establish end-to-end security for this call."), CFSTR("No local identity could be retrieved."));
  return objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", v3[0], 0);
}

- (void)logIdentity:(__SecIdentity *)a3
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  int ErrorLogLevelForModule;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  SecCertificateRef certificateRef;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    certificateRef = (SecCertificateRef)0xAAAAAAAAAAAAAAAALL;
    if (SecIdentityCopyCertificate(a3, &certificateRef))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v3 = VRTraceErrorLogLevelToCSTR();
        v4 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v20 = v3;
          v21 = 2080;
          v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
          v23 = 1024;
          v24 = 9797;
          v5 = "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: SecIdentityCopyCertificate error";
LABEL_6:
          _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0x1Cu);
        }
      }
    }
    else if (certificateRef)
    {
      v6 = (void *)SecCertificateCopyCommonNames();
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v20 = v7;
          v21 = 2080;
          v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
          v23 = 1024;
          v24 = 9816;
          _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: display common name(s) from local cert...", buf, 0x1Cu);
        }
      }
      ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (v6)
      {
        if (ErrorLogLevelForModule >= 7)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v12 = objc_msgSend((id)objc_msgSend(v6, "description"), "UTF8String");
            *(_DWORD *)buf = 136315906;
            v20 = v10;
            v21 = 2080;
            v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
            v23 = 1024;
            v24 = 9819;
            v25 = 2080;
            v26 = v12;
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d %s", buf, 0x26u);
          }
        }
        CFRelease(v6);
      }
      else if (ErrorLogLevelForModule >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v20 = v14;
          v21 = 2080;
          v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
          v23 = 1024;
          v24 = 9822;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: no common name(s) found in local cert...", buf, 0x1Cu);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v20 = v16;
          v21 = 2080;
          v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
          v23 = 1024;
          v24 = 9825;
          _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: done displaying common name(s) from local cert...", buf, 0x1Cu);
        }
      }
      CFRelease(certificateRef);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v13 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v20 = v13;
        v21 = 2080;
        v22 = "-[VCCallSession(PrivateMethods) logIdentity:]";
        v23 = 1024;
        v24 = 9828;
        v5 = "VCCallSession [%s] %s:%d setLocalIdentityForKeyExchange: no local cert found...";
        goto LABEL_6;
      }
    }
  }
}

- (id)pickFeaturesStringForPayload:(int)a3 featureListDict:(id)a4 remote:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  int ErrorLogLevelForModule;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
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
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v5 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v8)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v12 = "remote";
        else
          v12 = "local";
        if (a4)
          v13 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        else
          v13 = "<nil>";
        v17 = 136316674;
        v18 = v10;
        v19 = 2080;
        v20 = "-[VCCallSession(PrivateMethods) pickFeaturesStringForPayload:featureListDict:remote:]";
        v21 = 1024;
        v22 = 9847;
        v23 = 1024;
        v24 = a3;
        v25 = 2080;
        v26 = v12;
        v27 = 2080;
        v28 = v13;
        v29 = 2080;
        v30 = objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d pickFeaturesStringForPayload for %d (%s) from %s: %s", (uint8_t *)&v17, 0x40u);
      }
    }
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v8);
  }
  else
  {
    if (ErrorLogLevelForModule >= 5)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v17 = 136315906;
        v18 = v14;
        v19 = 2080;
        v20 = "-[VCCallSession(PrivateMethods) pickFeaturesStringForPayload:featureListDict:remote:]";
        v21 = 1024;
        v22 = 9841;
        v23 = 1024;
        v24 = a3;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d pickFeaturesStringForPayload: DID NOT FIND payload %d.", (uint8_t *)&v17, 0x22u);
      }
    }
    return 0;
  }
}

- (id)allPayloadsLocalFeaturesString
{
  id result;

  result = self->_allPayloadsLocalFeaturesString;
  if (!result)
  {
    result = +[VCVideoFeatureListStringHelper newLocalFeaturesStringWithType:](VCVideoFeatureListStringHelper, "newLocalFeaturesStringWithType:", 1);
    self->_allPayloadsLocalFeaturesString = (NSDictionary *)result;
  }
  return result;
}

- (BOOL)setMatchedFeaturesString:(char *)a3 localFeaturesString:(id)a4 remoteFeaturesString:(id)a5
{
  uint64_t v9;
  NSObject *v10;
  BOOL v11;
  BOOL v12;
  char *v13;
  unsigned int v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  char *v25;
  const char *v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  char *__lasts;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  char __str[3200];
  char __b[3200];
  _OWORD v46[200];
  _OWORD v47[200];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  __lasts = (char *)0xAAAAAAAAAAAAAAAALL;
  memset(v47, 170, sizeof(v47));
  memset(v46, 170, sizeof(v46));
  memset(__b, 170, sizeof(__b));
  memset(__str, 170, sizeof(__str));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v35 = v9;
      v36 = 2080;
      v37 = "-[VCCallSession(PrivateMethods) setMatchedFeaturesString:localFeaturesString:remoteFeaturesString:]";
      v38 = 1024;
      v39 = 9873;
      v40 = 2080;
      v41 = objc_msgSend(a4, "UTF8String");
      v42 = 2080;
      v43 = objc_msgSend(a5, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d setMatchedFeaturesString: local=[%s] remote=[%s]", buf, 0x30u);
    }
  }
  if (a4)
    v11 = a5 == 0;
  else
    v11 = 1;
  v12 = !v11;
  if (v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v35 = v22;
        v36 = 2080;
        v37 = "-[VCCallSession(PrivateMethods) setMatchedFeaturesString:localFeaturesString:remoteFeaturesString:]";
        v38 = 1024;
        v39 = 9876;
        _os_log_impl(&dword_1D8A54000, v23, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d NO matched featuresString", buf, 0x1Cu);
      }
    }
  }
  else
  {
    objc_msgSend(a4, "UTF8String");
    __strlcpy_chk();
    objc_msgSend(a5, "UTF8String");
    __strlcpy_chk();
    v13 = strtok_r(__str, ";", &__lasts);
    if (v13 && !strcmp(v13, "FLS"))
    {
      if (-[VCCallInfo requiresImplicitFeatureString](self->remoteCallInfo, "requiresImplicitFeatureString"))
      {
        __strlcpy_chk();
        LODWORD(v47[0]) = 5395532;
        __strlcpy_chk();
        strcpy((char *)&v47[2], "CABAC");
        v14 = 2;
      }
      else
      {
        v14 = 0;
      }
      v25 = strtok_r(0, ";", &__lasts);
      if (v25)
      {
        v26 = v25;
        v27 = v14;
        v28 = (char *)&v47[2 * v14];
        v29 = (char *)&v46[2 * v14];
        do
        {
          strlcpy(v29, v26, 0x20uLL);
          strlcpy(v28, v26, 0x20uLL);
          v30 = strchr(v28, 58);
          if (v30)
            *v30 = 0;
          v31 = strtok_r(0, ";", &__lasts);
          v14 = v27 + 1;
          if (!v31)
            break;
          v26 = v31;
          v28 += 32;
          v29 += 32;
        }
        while (v27++ < 0x63);
      }
    }
    else
    {
      v14 = 0;
    }
    v15 = strtok_r(__b, ";", &__lasts);
    if (v15)
    {
      if (!strcmp(v15, "FLS"))
      {
        v16 = strtok_r(0, ";", &__lasts);
        if (v16)
        {
          v17 = v16;
          do
          {
            v18 = strchr(v17, 58);
            if (v18)
              *v18 = 0;
            if ((int)v14 >= 1)
            {
              v19 = (const char *)v46;
              v20 = (const char *)v47;
              v21 = v14;
              while (strcmp(v17, v20))
              {
                v19 += 32;
                v20 += 32;
                if (!--v21)
                  goto LABEL_26;
              }
              strlcat(a3, v19, 0xC80uLL);
              strlcat(a3, ";", 0xC80uLL);
            }
LABEL_26:
            v17 = strtok_r(0, ";", &__lasts);
          }
          while (v17);
        }
      }
    }
  }
  return v12;
}

- (const)matchedFeaturesStringForPayload:(int)a3
{
  return (const char *)objc_msgSend(-[VCCallSession getFeatureListStringForPayload:](self, "getFeatureListStringForPayload:", *(_QWORD *)&a3), "UTF8String");
}

- (void)setupBitrateNegotiation
{
  VCBitrateArbiter *callSessionBitrateArbiter;
  int v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  int carrierBitrateCap;
  const char *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  callSessionBitrateArbiter = self->callSessionBitrateArbiter;
  if (!callSessionBitrateArbiter)
  {
    callSessionBitrateArbiter = -[VCBitrateArbiter initWithDeviceRole:callLogFile:]([VCBitrateArbiter alloc], "initWithDeviceRole:callLogFile:", self->_deviceRole, self->_callLogFile);
    self->callSessionBitrateArbiter = callSessionBitrateArbiter;
  }
  self->carrierBitrateCap = -[VCBitrateArbiter maxAllowedCellularBitrate](callSessionBitrateArbiter, "maxAllowedCellularBitrate");
  -[VCCallInfo setMaxBandwidth:](self->localCallInfo, "setMaxBandwidth:", -[VCBitrateArbiter maxAllowedBitrate](self->callSessionBitrateArbiter, "maxAllowedBitrate"));
  v12 = 0;
  v4 = VCCarrierBundle_QueryCarrierBundleValueForKey((uint64_t)CFSTR("MaxFaceTimeBitrate"), &v12);
  v5 = objc_msgSend(v12, "intValue");
  if (v4 && v5 >= 1)
  {
    self->carrierBitrateCap = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        carrierBitrateCap = self->carrierBitrateCap;
        *(_DWORD *)buf = 136315906;
        v14 = v6;
        v15 = 2080;
        v16 = "-[VCCallSession(PrivateMethods) setupBitrateNegotiation]";
        v17 = 1024;
        v18 = 9950;
        v19 = 1024;
        v20 = carrierBitrateCap;
        v9 = "VCCallSession [%s] %s:%d Read key 'MaxFaceTimeBitrate' from carrier bundle: %d";
LABEL_11:
        _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v9, buf, 0x22u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = self->carrierBitrateCap;
      *(_DWORD *)buf = 136315906;
      v14 = v10;
      v15 = 2080;
      v16 = "-[VCCallSession(PrivateMethods) setupBitrateNegotiation]";
      v17 = 1024;
      v18 = 9952;
      v19 = 1024;
      v20 = v11;
      v9 = "VCCallSession [%s] %s:%d No key 'MaxFaceTimeBitrate' in carrier bundle: using default (%d)";
      goto LABEL_11;
    }
  }
}

- (void)adjustBitrateForConnectionType
{
  unsigned int v3;

  v3 = -[VCCallSession maxBitrateForConnectionType](self, "maxBitrateForConnectionType");
  if (self->callSessionBitrate > v3)
    self->callSessionBitrate = v3;
}

- (unsigned)maxBitrateForConnectionType
{
  unsigned int v3;
  signed int v4;
  signed int v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int operatingMode;
  const void *v12;
  unsigned int v13;
  signed int v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  signed int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[VCCallSession primaryConnectionType](self, "primaryConnectionType");
  if (v3 - 3 >= 2)
  {
    if (v3 != 2)
    {
      v5 = 0;
      goto LABEL_15;
    }
    v5 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-bitrate-max-wifi")), "intValue");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v9 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315906;
        v17 = v9;
        v18 = 2080;
        v19 = "-[VCCallSession(PrivateMethods) maxBitrateForConnectionType]";
        v20 = 1024;
        v21 = 9982;
        v22 = 1024;
        v23 = v5;
        v8 = "VCCallSession [%s] %s:%d UDP maxBitrateForConnectionType is %d";
        goto LABEL_14;
      }
    }
  }
  else
  {
    v4 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-tcp-relay-bitrate-max")), "intValue");
    if (v4)
    {
      v5 = v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315906;
          v17 = v6;
          v18 = 2080;
          v19 = "-[VCCallSession(PrivateMethods) maxBitrateForConnectionType]";
          v20 = 1024;
          v21 = 9974;
          v22 = 1024;
          v23 = v5;
          v8 = "VCCallSession [%s] %s:%d TCP maxBitrateForConnectionType is %d";
LABEL_14:
          _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, 0x22u);
        }
      }
    }
    else
    {
      v5 = objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", CFSTR("gk-p2p-bitrate-max-wifi")), "intValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315906;
          v17 = v10;
          v18 = 2080;
          v19 = "-[VCCallSession(PrivateMethods) maxBitrateForConnectionType]";
          v20 = 1024;
          v21 = 9977;
          v22 = 1024;
          v23 = v5;
          v8 = "VCCallSession [%s] %s:%d Use general RelayBitRate for TCP: %d";
          goto LABEL_14;
        }
      }
    }
  }
LABEL_15:
  operatingMode = self->operatingMode;
  v12 = (const void *)VCConnectionManager_CopyConnectionForQuality((uint64_t)self->connectionManager, 1);
  v13 = -[VCBitrateArbiter maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:](self->callSessionBitrateArbiter, "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", v12, 1, VCBitrateArbiter_ModeFromOperatingMode(self->operatingMode), self->_currentEncodeRule);
  if (v12)
    CFRelease(v12);
  if (operatingMode == 4)
    v14 = 0;
  else
    v14 = v5;
  if (v14 <= 0)
    return v13;
  else
    return v14;
}

- (void)logConnectionSuccess
{
  NSObject *global_queue;
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__VCCallSession_PrivateMethods__logConnectionSuccess__block_invoke;
  v4[3] = &unk_1E9E521C0;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

uint64_t __53__VCCallSession_PrivateMethods__logConnectionSuccess__block_invoke()
{
  __CFString *v0;

  v0 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "infoDictionary"), "objectForKey:", CFSTR("CFBundleName"));
  if (!v0)
    v0 = CFSTR("Unknown");
  -[__CFString UTF8String](v0, "UTF8String");
  return reportingLog();
}

- (void)enableSessionHealthMonitor
{
  NSObject *global_queue;
  OS_dispatch_source *v4;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  if (!self->sessionHealthMonitor)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, global_queue);
    self->sessionHealthMonitor = v4;
    dispatch_source_set_timer((dispatch_source_t)v4, 0, 0xB2D05E00uLL, 0x1C9C380uLL);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__VCCallSession_PrivateMethods__enableSessionHealthMonitor__block_invoke;
    v5[3] = &unk_1E9E521C0;
    v5[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)self->sessionHealthMonitor, v5);
    dispatch_source_set_cancel_handler((dispatch_source_t)self->sessionHealthMonitor, v5);
    dispatch_resume((dispatch_object_t)self->sessionHealthMonitor);
  }
}

void __59__VCCallSession_PrivateMethods__enableSessionHealthMonitor__block_invoke(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  _DWORD *v8;
  int v9;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  NSObject *v24;
  int v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  double v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  NSString *v47;
  uint64_t v48;
  NSSize v49;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "audioReceivingBitrateKbps");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "audioTransmittingBitrateKbps");
  v7 = v6;
  v8 = *(_DWORD **)(a1 + 32);
  v9 = v8[355];
  if (v9 == 4 || v9 == 1)
  {
    objc_msgSend(v8, "sessionReceivingBitrate");
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "sessionReceivingFramerate");
    v14 = v13;
    objc_msgSend(*(id *)(a1 + 32), "sessionTransmittingBitrate");
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 32), "sessionTransmittingFramerate");
    v18 = v17;
    v19 = *(_QWORD *)(a1 + 32);
    LODWORD(v1) = *(_DWORD *)(v19 + 1328);
    LODWORD(v2) = *(_DWORD *)(v19 + 1332);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v22 = objc_msgSend(*(id *)(a1 + 32), "callID");
        v49.width = (double)v1;
        v49.height = (double)v2;
        v26 = 136317698;
        v27 = v20;
        v28 = 2080;
        v29 = "-[VCCallSession(PrivateMethods) enableSessionHealthMonitor]_block_invoke";
        v30 = 1024;
        v31 = 10039;
        v32 = 2048;
        v33 = v16 / 1000.0;
        v34 = 2048;
        v35 = v18;
        v36 = 2048;
        v37 = v7;
        v38 = 2048;
        v39 = v12 / 1000.0;
        v40 = 2048;
        v41 = v14;
        v42 = 2048;
        v43 = v5;
        v44 = 1024;
        v45 = v22;
        v46 = 2112;
        v47 = NSStringFromSize(v49);
        _os_log_impl(&dword_1D8A54000, v21, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d @=@ Health: VCCallSession videoTxBitrate=%5.3f kbps, videoTxFrameRate=%3.1f, audioTxBitrate=%5.3f kbps, videoRxBitrate=%5.3f kbps, videoRxFrameRate=%3.1f, audioRxBitrate=%5.3f kbps, callID=%d videoRxResolution=%@", (uint8_t *)&v26, 0x68u);
      }
    }
  }
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 1420) == 2 && (int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v23 = VRTraceErrorLogLevelToCSTR();
    v24 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_msgSend(*(id *)(a1 + 32), "callID");
      v26 = 136316418;
      v27 = v23;
      v28 = 2080;
      v29 = "-[VCCallSession(PrivateMethods) enableSessionHealthMonitor]_block_invoke";
      v30 = 1024;
      v31 = 10043;
      v32 = 2048;
      v33 = v7;
      v34 = 2048;
      v35 = v5;
      v36 = 1024;
      LODWORD(v37) = v25;
      _os_log_impl(&dword_1D8A54000, v24, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d @=@ Health: VCCallSession-AudioOnly audioTxBitrate=%5.3f kbps, audioRxBitrate=%5.3f kbps, callID=%d", (uint8_t *)&v26, 0x36u);
    }
  }
}

- (double)audioReceivingBitrateKbps
{
  unint64_t v2;
  _OWORD v4[5];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  VCAudioReceiver_CollectChannelMetrics((uint64_t)self->audioReceiver, v4);
  LODWORD(v2) = v4[0];
  return (double)v2;
}

- (double)audioTransmittingBitrateKbps
{
  VCAudioTransmitter *audioTransmitter;
  unint64_t v3;
  int v5;

  audioTransmitter = self->audioTransmitter;
  if (!audioTransmitter)
    return 0.0;
  -[VCAudioTransmitter currentChannelMetrics](audioTransmitter, "currentChannelMetrics");
  LODWORD(v3) = v5;
  return (double)v3;
}

- (void)disableSessionHealthMonitor
{
  NSObject *sessionHealthMonitor;
  NSObject *v4;

  sessionHealthMonitor = self->sessionHealthMonitor;
  if (sessionHealthMonitor)
  {
    dispatch_source_cancel(sessionHealthMonitor);
    v4 = self->sessionHealthMonitor;
    if (v4)
    {
      dispatch_release(v4);
      self->sessionHealthMonitor = 0;
    }
  }
}

- (void)sendBasebandCodecMessage
{
  int deviceRole;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  const char *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  VCCallSession *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  deviceRole = self->_deviceRole;
  if (deviceRole != 4 && deviceRole != 2)
    return;
  if (-[VCCallSession basebandCodecType](self, "basebandCodecType")
    && -[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"))
  {
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", -[VCCallSession basebandCodecType](self, "basebandCodecType"), CFSTR("VCBasebandCodecType"), -[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"), CFSTR("VCBasebandCodecSampleRate"), 0);
    v5 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:");
    -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v5, CFSTR("VCBasebandCodecChange"));

    return;
  }
  if ((VCCallSession *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7)
      return;
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      return;
    if (-[VCCallSession basebandCodecType](self, "basebandCodecType"))
      v9 = -[NSString UTF8String](-[NSString description](-[VCCallSession basebandCodecType](self, "basebandCodecType"), "description"), "UTF8String");
    else
      v9 = "<nil>";
    if (-[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"))
      v17 = (const char *)objc_msgSend((id)-[NSNumber description](-[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"), "description"), "UTF8String");
    else
      v17 = "<nil>";
    *(_DWORD *)buf = 136316162;
    v20 = v7;
    v21 = 2080;
    v22 = "-[VCCallSession(PrivateMethods) sendBasebandCodecMessage]";
    v23 = 1024;
    v24 = 10077;
    v25 = 2080;
    v26 = (void *)v9;
    v27 = 2080;
    v28 = (VCCallSession *)v17;
    v14 = "VCCallSession [%s] %s:%d Not sending message. codecType = %s, codecRate = %s";
    v15 = v8;
    v16 = 48;
LABEL_31:
    _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    return;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = (const __CFString *)-[VCCallSession performSelector:](self, "performSelector:", sel_logPrefix);
  else
    v6 = &stru_1E9E58EE0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (-[VCCallSession basebandCodecType](self, "basebandCodecType"))
        v12 = -[NSString UTF8String](-[NSString description](-[VCCallSession basebandCodecType](self, "basebandCodecType"), "description"), "UTF8String");
      else
        v12 = "<nil>";
      if (-[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"))
        v13 = (const char *)objc_msgSend((id)-[NSNumber description](-[VCCallSession basebandCodecSampleRate](self, "basebandCodecSampleRate"), "description"), "UTF8String");
      else
        v13 = "<nil>";
      *(_DWORD *)buf = 136316674;
      v20 = v10;
      v21 = 2080;
      v22 = "-[VCCallSession(PrivateMethods) sendBasebandCodecMessage]";
      v23 = 1024;
      v24 = 10077;
      v25 = 2112;
      v26 = (void *)v6;
      v27 = 2048;
      v28 = self;
      v29 = 2080;
      v30 = v12;
      v31 = 2080;
      v32 = v13;
      v14 = "VCCallSession [%s] %s:%d %@(%p) Not sending message. codecType = %s, codecRate = %s";
      v15 = v11;
      v16 = 68;
      goto LABEL_31;
    }
  }
}

- (void)shouldSendBlackFrame:(BOOL)a3
{
  self->shouldSendBlackFrame = a3;
}

- (void)sendSymptomToRemote:(id)a3 groupID:(id)a4
{
  id v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("VCSymptomReporterSymptom");
  v6[1] = CFSTR("VCSymptomReporterGroupID");
  v7[0] = a3;
  v7[1] = a4;
  v5 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
  -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v5, CFSTR("VCSymptomReporterMessage"));

}

- (void)setDuplicationFlag:(BOOL)a3 withPreferredLocalLinkTypeForDuplication:(int)a4 notifyPeer:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v7;
  id v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v5 = a3;
    v9[0] = CFSTR("VCPreferredInterfaceKey");
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[VCConnectionManager preferredLocalInterfaceForDuplication](self->connectionManager, "preferredLocalInterfaceForDuplication", a3, *(_QWORD *)&a4));
    v9[1] = CFSTR("VCPreferredInterfaceDuplicatingKey");
    v10[0] = v7;
    v10[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v8 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
    -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v8, CFSTR("VCPreferredInterfaceMessageTopic"));

  }
}

- (void)handleDuplicationEnabled:(BOOL)a3 activeConnection:(id)a4
{
  _BOOL4 v5;
  int ErrorLogLevelForModule;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  NSObject *cellTechQueue;
  _QWORD block[6];
  BOOL v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a3;
  v24 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (a4)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        if (v5)
          v10 = "ON";
        else
          v10 = "OFF";
        *(_DWORD *)buf = 136316162;
        v15 = v8;
        v16 = 2080;
        v17 = "-[VCCallSession(PrivateMethods) handleDuplicationEnabled:activeConnection:]";
        v18 = 1024;
        v19 = 10141;
        v20 = 2080;
        v21 = v10;
        v22 = 2080;
        v23 = objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: duplication is %s with active connection %s", buf, 0x30u);
      }
    }
    cellTechQueue = self->cellTechQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__VCCallSession_PrivateMethods__handleDuplicationEnabled_activeConnection___block_invoke;
    block[3] = &unk_1E9E52210;
    block[4] = a4;
    block[5] = self;
    v13 = v5;
    dispatch_async(cellTechQueue, block);
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(PrivateMethods) handleDuplicationEnabled:activeConnection:].cold.1();
  }
}

uint64_t __75__VCCallSession_PrivateMethods__handleDuplicationEnabled_activeConnection___block_invoke(uint64_t a1)
{
  uint64_t IsLocalOnCellular;
  uint64_t IsRemoteOnCellular;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int ErrorLogLevelForModule;
  os_log_t *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  os_log_t *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  const void *v28;
  int v29;
  uint64_t v30;
  uint64_t IsLTEOrNewer;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  IsLocalOnCellular = VCConnection_IsLocalOnCellular(*(_QWORD *)(a1 + 32));
  IsRemoteOnCellular = VCConnection_IsRemoteOnCellular(*(_QWORD *)(a1 + 32));
  v4 = VCConnection_LocalCellTech(*(_QWORD *)(a1 + 32));
  v5 = VCConnection_RemoteCellTech(*(_QWORD *)(a1 + 32));
  VideoTransmitter_SetCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1256), IsLocalOnCellular, v4, IsRemoteOnCellular, v5);
  v6 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = objc_msgSend(*(id *)(a1 + 32), "isWifiToWifi");
  if ((_DWORD)v7)
    v8 = 2;
  else
    v8 = 1;
  objc_msgSend(*(id *)(a1 + 40), "resetVideoRulesForInterface:videoReportingDictionary:", v8, v6);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1232), "setUseWiFiTiers:", v7);
  v9 = VCBitrateArbiter_ModeFromOperatingMode(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 1420));
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1176), "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", *(_QWORD *)(a1 + 32), 1, v9, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176));
  if (!v10)
  {
    v11 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1420);
    if (v11 == 7 || v11 == 2)
      v10 = 40;
    else
      v10 = 100;
  }
  v13 = objc_msgSend(*(id *)(a1 + 32), "remoteConnectionType");
  v14 = *(_QWORD *)(a1 + 40);
  v34 = v6;
  if (v13 == 3)
    v15 = objc_msgSend(*(id *)(v14 + 1176), "maxAllowedBitrateForVCConnection:forLocalInterface:arbiterMode:encodeRule:", *(_QWORD *)(a1 + 32), 0, v9, *(_QWORD *)(v14 + 176));
  else
    v15 = objc_msgSend(*(id *)(v14 + 32), "cellBandwidth");
  v16 = v15;
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v18 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *v18;
    if (os_log_type_enabled(*v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      v36 = v19;
      v37 = 2080;
      v38 = "-[VCCallSession(PrivateMethods) handleDuplicationEnabled:activeConnection:]_block_invoke";
      v39 = 1024;
      v40 = 10168;
      v41 = 1024;
      v42 = v16;
      v43 = 1024;
      v44 = IsRemoteOnCellular;
      _os_log_impl(&dword_1D8A54000, v20, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: remoteBitrateCapToUse = %d, remoteUseCellular = %d", buf, 0x28u);
    }
  }
  if (v10 >= v16)
    v21 = v16;
  else
    v21 = v10;
  VideoTransmitter_SetBitrate(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1256), 1000 * v21);
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 1148) = v21;
  VCAudioReceiver_UpdateCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1224), v4, v5);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 320), "isVideoEnabled"))
    VideoReceiver_CellTechChanged();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v22 = VRTraceErrorLogLevelToCSTR();
    v23 = v18;
    v24 = v22;
    v25 = *v23;
    if (os_log_type_enabled(*v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v36 = v24;
      v37 = 2080;
      v38 = "-[VCCallSession(PrivateMethods) handleDuplicationEnabled:activeConnection:]_block_invoke";
      v39 = 1024;
      v40 = 10180;
      v41 = 1024;
      v42 = v10;
      v43 = 1024;
      v44 = IsLocalOnCellular;
      v45 = 1024;
      v46 = IsRemoteOnCellular;
      _os_log_impl(&dword_1D8A54000, v25, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: localBitrateCapToUse = %d, useCellular = %d, %d", buf, 0x2Eu);
    }
  }
  AFRCUpdateCellTech(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 344), IsLocalOnCellular, v4, IsRemoteOnCellular, v5, objc_msgSend(*(id *)(a1 + 40), "evaluateEnableRRx:", 0), 0);
  v26 = *(_QWORD *)(a1 + 40);
  v27 = *(_DWORD *)(v26 + 1420);
  if (v27 == 7 || v27 == 2)
  {
    AFRCSetTxCap(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 344), objc_msgSend((id)v26, "currentAudioCap"));
    v26 = *(_QWORD *)(a1 + 40);
  }
  v28 = (const void *)VCConnectionManager_CopyPrimaryConnection(*(_QWORD *)(v26 + 80));
  if (!VCConnection_IsLocalOnWiFiOrWired((uint64_t)v28))
  {
    v29 = 0;
    if (!v28)
      goto LABEL_33;
    goto LABEL_32;
  }
  v29 = *(unsigned __int8 *)(a1 + 48) << 9;
  if (v28)
LABEL_32:
    CFRelease(v28);
LABEL_33:
  HIDWORD(v33) = v29;
  LOBYTE(v33) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 352), "configureWithOperatingMode:isLocalCellular:localCellTech:isRemoteCellular:remoteCellTech:bitrateCapKbps:isTrafficBursty:featureFlags:", *(unsigned int *)(*(_QWORD *)(a1 + 40) + 1420), IsLocalOnCellular, v4, IsRemoteOnCellular, v5, v21, v33);
  RTPSetBasebandCongestionDetector(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), (const void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 352), "basebandCongestionDetector"));
  v30 = *(_QWORD *)(a1 + 40);
  if (!*(_QWORD *)(v30 + 352))
  {
    if ((_DWORD)v4)
    {
      IsLTEOrNewer = NetworkUtils_IsLTEOrNewer(v4);
      v30 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      IsLTEOrNewer = 1;
    }
    objc_msgSend(*(id *)(v30 + 360), "setIsSenderProbingEnabled:", IsLTEOrNewer);
    v30 = *(_QWORD *)(a1 + 40);
  }
  objc_msgSend((id)v30, "reportHandoverResultsWithDictionary:localBitrateCap:remoteBitrateCap:", v34, v21, v16);
  objc_msgSend(*(id *)(a1 + 40), "updateCachedConnectionState");
  objc_msgSend(*(id *)(a1 + 40), "updateMaxPktLength");
  return objc_msgSend(*(id *)(a1 + 40), "notifyDelegateActiveConnectionDidChange");
}

- (int)mapPacketMultiplexModeToRTPMode:(int64_t)a3
{
  int result;

  if (a3 == 1)
    return 1;
  if (a3 == 2)
    return 2;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    -[VCCallSession(PrivateMethods) mapPacketMultiplexModeToRTPMode:].cold.1();
  }
  return 0;
}

- (int)mapPacketMultiplexModeToSIPMode:(int64_t)a3
{
  int result;

  if (a3 == 1)
    return 1;
  if (a3 == 2)
    return 2;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    result = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    -[VCCallSession(PrivateMethods) mapPacketMultiplexModeToSIPMode:].cold.1();
  }
  return 0;
}

- (BOOL)disconnectInternal:(BOOL)a3 disconnectError:(id)a4 didRemoteCancel:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  VCControlChannelMultiWay *secureControlChannel;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[5];
  _QWORD v18[8];
  BOOL v19;
  BOOL v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  -[VCConnectionManager remoteNoRemotePacketInterval](self->connectionManager, "remoteNoRemotePacketInterval");
  v10 = v9;
  v11 = fmax(micro() - self->lastReceivedPacketTimestamp, 0.0);
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke;
  v18[3] = &unk_1E9E55D70;
  v19 = a3;
  v20 = v5;
  v18[4] = self;
  v18[5] = a4;
  *(double *)&v18[6] = v11;
  v18[7] = v10;
  -[VCCallSession lock](self, "lock");
  LODWORD(a4) = self->_cleanupDone;
  self->_cleanupDone = 1;
  -[VCCallSession unlock](self, "unlock");
  if (!(_DWORD)a4)
  {
    secureControlChannel = self->secureControlChannel;
    self->secureControlChannel = 0;
    if (!-[VCCallSession isSIPEnabled](self, "isSIPEnabled") && !v5)
    {
      if (-[VCCallSession isSIPEnabled](self, "isSIPEnabled"))
        goto LABEL_11;
      if (self->hSIP != (tagHANDLE *)0xFFFFFFFFLL)
        goto LABEL_11;
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_3;
      v17[3] = &unk_1E9E55D98;
      v17[4] = secureControlChannel;
      if (-[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:timeout:completion:](secureControlChannel, "sendReliableMessage:withTopic:participantID:timeout:completion:", CFSTR("VCDisconnectMessage"), CFSTR("VCDisconnectMessage"), 0, 5, v17))
      {
        goto LABEL_11;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
          -[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:].cold.1();
      }
    }
    +[VCCallSession stopSecureControlChannel:](VCCallSession, "stopSecureControlChannel:", secureControlChannel);
LABEL_11:
    -[VCCallSession stopAudioWithCompletionHandler:](self, "stopAudioWithCompletionHandler:", v18);

    self->controlChannel = 0;
  }
  if (!self->sentClientSuccessfulDidStart && self->isStarted)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v22 = v14;
        v23 = 2080;
        v24 = "-[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:]";
        v25 = 1024;
        v26 = 10377;
        _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Ending the Call even though we haven't finished notifying the client that we have started", buf, 0x1Cu);
      }
    }
    VCUtil_GenerateDiagnostics(0, 1, "Ending the Call even though we haven't finished notifying the client that we have started", 1u);
  }
  return 1;
}

void __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  const void *v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[5];
  _QWORD block[5];
  _BYTE buf[22];
  __int16 v30;
  int v31;
  __int16 v32;
  _BYTE v33[10];
  __int16 v34;
  _BOOL4 v35;
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:]_block_invoke";
        v30 = 1024;
        v31 = 10252;
        v32 = 2080;
        *(_QWORD *)v33 = objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Stop audio failed with error: %s", buf, 0x26u);
      }
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  objc_msgSend(*(id *)(a1 + 32), "reportDashboardEndResult:", *(unsigned __int8 *)(a1 + 64));
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "callID");
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *(_QWORD *)(v11 + 128);
      v14 = *(unsigned __int8 *)(a1 + 65);
      LODWORD(v11) = *(unsigned __int8 *)(v11 + 226);
      *(_DWORD *)buf = 136317186;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "-[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:]_block_invoke";
      v30 = 1024;
      v31 = 10261;
      v32 = 1024;
      *(_DWORD *)v33 = v10;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v13;
      v34 = 1024;
      v35 = v13 == 6;
      v36 = 1024;
      v37 = v14;
      v38 = 1024;
      v39 = v11;
      v40 = 2112;
      v41 = v12;
      _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d disconnect: callID = %d state = %d, stateIsCallee = %d, didRemoteCancel = %d, didSend200OK = %d, error = %@", buf, 0x44u);
    }
  }
  v15 = *(_QWORD *)(a1 + 32);
  v16 = MEMORY[0x1E0C809B0];
  v17 = *(NSObject **)(v15 + 480);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_1393;
  block[3] = &unk_1E9E521C0;
  block[4] = v15;
  dispatch_async(v17, block);
  objc_msgSend(*(id *)(a1 + 32), "stopMediaQueue:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stopRateControl:", 0);
  objc_msgSend(*(id *)(a1 + 32), "stopPausedHeartbeat");
  objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1512), "connectionManager"), "stop");
  objc_msgSend(*(id *)(a1 + 32), "cleanupMedia");
  objc_msgSend(*(id *)(a1 + 32), "cleanupWCMClient");
  v18 = *(uint64_t **)(a1 + 32);
  if (v18[187])
  {
    WRMUninitialize(v18[187]);
    v18 = *(uint64_t **)(a1 + 32);
  }
  objc_msgSend(v18, "cleanupWRMClient");
  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(_QWORD *)(v19 + 128);
  *(_QWORD *)(v19 + 128) = 7;
  v21 = *(_QWORD **)(a1 + 32);
  v22 = (void *)v21[140];
  if (v22)
  {
    v21[140] = 0;
    v21 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v21, "cancelConnectionTimeoutTimer");
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(const void **)(v23 + 1432);
  if (v24)
  {
    CFRelease(v24);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1432) = 0;
    v23 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v23 + 1424))
  {
    SKEState_Release();
    v23 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v23 + 1440), "setDelegate:", 0);
  if (objc_msgSend(*(id *)(a1 + 32), "deviceRole") == 2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1464), "unregisterForNotifications");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1464), "setDelegate:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "unlock");
  objc_msgSend(*(id *)(a1 + 32), "notifyDelegateAndEndCall:didRemoteCancel:error:", v20, *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 40));
  memset(buf, 170, 16);
  objc_msgSend(+[VideoConferenceManager defaultVideoConferenceManager](VideoConferenceManager, "defaultVideoConferenceManager"), "getClientUUID:", buf);
  objc_msgSend(*(id *)(a1 + 40), "code");
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "userInfo"), "objectForKey:", CFSTR("NSErrorUserInfoDetailedError")), "intValue");
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "domain"), "UTF8String");
  reportingCallEndError();
  v25 = *(_QWORD *)(a1 + 32);
  v26 = *(NSObject **)(v25 + 1152);
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_2;
  v27[3] = &unk_1E9E521C0;
  v27[4] = v25;
  dispatch_async(v26, v27);
  reportingStopTimer();
  reportingUnregisterPeriodicTask();
  reportingUnregisterPeriodicTask();
  objc_msgSend(v22, "stopMessaging");

}

uint64_t __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_1393(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 320), "isVideoEnabled");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "stopVideo:error:", 0, 0);
    return reportingGenericEvent();
  }
  return result;
}

void __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1160);
  if (v2)
  {
    dispatch_source_cancel(v2);
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 1160);
    if (v3)
    {
      dispatch_release(v3);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160) = 0;
    }
  }
}

uint64_t __84__VCCallSession_PrivateMethods__disconnectInternal_disconnectError_didRemoteCancel___block_invoke_3(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  _BYTE v8[24];
  int v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("UNSUCCESSFULLY");
      *(_DWORD *)v8 = 136315906;
      *(_QWORD *)&v8[4] = v4;
      *(_WORD *)&v8[12] = 2080;
      *(_QWORD *)&v8[14] = "-[VCCallSession(PrivateMethods) disconnectInternal:disconnectError:didRemoteCancel:]_block_invoke_3";
      if (a2)
        v6 = CFSTR("SUCCESSFULLY");
      *(_WORD *)&v8[22] = 1024;
      v9 = 10359;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Disconnect message was sent %@", v8, 0x26u);
    }
  }
  return +[VCCallSession stopSecureControlChannel:](VCCallSession, "stopSecureControlChannel:", *(_QWORD *)(a1 + 32), *(_OWORD *)v8, *(_QWORD *)&v8[16]);
}

+ (void)stopSecureControlChannel:(id)a3
{
  objc_msgSend(a3, "flushActiveMessages");
  objc_msgSend(a3, "removeActiveParticipant:", 0);
  objc_msgSend(a3, "stop");

}

- (void)setupMessaging
{
  -[VCCallSession lock](self, "lock");
  if (!self->messaging)
  {
    self->messaging = -[VCSessionMessaging initWithControlChannel:remoteVersion:]([VCSessionMessaging alloc], "initWithControlChannel:remoteVersion:", -[VCCallSession activeControlChannel](self, "activeControlChannel"), 0);
    -[VCCallSession setupVideoPauseMessages](self, "setupVideoPauseMessages");
    -[VCCallSession setupAudioPauseMessages](self, "setupAudioPauseMessages");
    -[VCCallSession setupCellTechChangeMessages](self, "setupCellTechChangeMessages");
    -[VCCallSession setupMomentsMessages](self, "setupMomentsMessages");
    -[VCCallSession setupAudioPausedHBMessages](self, "setupAudioPausedHBMessages");
    -[VCCallSession setupCallingModeMessages](self, "setupCallingModeMessages");
    -[VCCallSession setupHandoverCandidateChangeMessage](self, "setupHandoverCandidateChangeMessage");
    -[VCCallSession setupPiPStateChangeMessage](self, "setupPiPStateChangeMessage");
    -[VCCallSession setupPreferredInterfaceMessage](self, "setupPreferredInterfaceMessage");
    -[VCCallSession setupSymptomEnabledMessage](self, "setupSymptomEnabledMessage");
    -[VCCallSession setupWRMAlertStateUpdateMessage](self, "setupWRMAlertStateUpdateMessage");
    -[VCCallSession setupWRMCoexMetricsMessage](self, "setupWRMCoexMetricsMessage");
    if (-[VCCallSession deviceRole](self, "deviceRole") == 1
      || -[VCCallSession deviceRole](self, "deviceRole") == 2
      || -[VCCallSession deviceRole](self, "deviceRole") == 4)
    {
      -[VCCallSession setupBasebandCodecInfoMessages](self, "setupBasebandCodecInfoMessages");
    }
    if (!-[VCCallSession isSIPEnabled](self, "isSIPEnabled"))
      -[VCCallSession setupDisconnectMessage](self, "setupDisconnectMessage");
  }
  -[VCCallSession unlock](self, "unlock");
}

- (void)setupAudioPauseMessages
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__VCCallSession_Messages__setupAudioPauseMessages__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("AudioPauseStateMessageTopic"), &unk_1E9EFA118, 0, v3);
}

uint64_t __50__VCCallSession_Messages__setupAudioPauseMessages__block_invoke(uint64_t a1, void *a2)
{
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
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
      v8 = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCCallSession(Messages) setupAudioPauseMessages]_block_invoke";
      v12 = 1024;
      v13 = 10433;
      v14 = 1024;
      v15 = v6;
      v16 = 2080;
      v17 = objc_msgSend(a2, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v8, 0x2Cu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "remotePauseDidChangeToState:forVideo:", objc_msgSend(a2, "isEqualToString:", CFSTR("VCAudioPaused")), 0);
}

- (void)setupVideoPauseMessages
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__VCCallSession_Messages__setupVideoPauseMessages__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VideoPauseStateMessageTopic"), &unk_1E9EFA130, 0, v3);
}

uint64_t __50__VCCallSession_Messages__setupVideoPauseMessages__block_invoke(uint64_t a1, void *a2)
{
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
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
      v8 = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCCallSession(Messages) setupVideoPauseMessages]_block_invoke";
      v12 = 1024;
      v13 = 10445;
      v14 = 1024;
      v15 = v6;
      v16 = 2080;
      v17 = objc_msgSend(a2, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v8, 0x2Cu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "remotePauseDidChangeToState:forVideo:", objc_msgSend(a2, "isEqualToString:", CFSTR("VCVideoPaused")), 1);
}

- (void)setupAudioPausedHBMessages
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__VCCallSession_Messages__setupAudioPausedHBMessages__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCPingTopic"), &unk_1E9EFA148, 0, v3);
}

uint64_t __53__VCCallSession_Messages__setupAudioPausedHBMessages__block_invoke(uint64_t a1, void *a2)
{
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
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
      v8 = 136316162;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCCallSession(Messages) setupAudioPausedHBMessages]_block_invoke";
      v12 = 1024;
      v13 = 10456;
      v14 = 1024;
      v15 = v6;
      v16 = 2080;
      v17 = objc_msgSend(a2, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v8, 0x2Cu);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateLastReceivedPacket:packetType:", 1, 7);
}

- (void)setupAudioOnOffStateMessages
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__VCCallSession_Messages__setupAudioOnOffStateMessages__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("AudioOnOffStateMessageTopic"), &unk_1E9EFA160, 0, v3);
}

uint64_t __55__VCCallSession_Messages__setupAudioOnOffStateMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
      v16 = 136316162;
      v17 = v4;
      v18 = 2080;
      v19 = "-[VCCallSession(Messages) setupAudioOnOffStateMessages]_block_invoke";
      v20 = 1024;
      v21 = 10466;
      v22 = 1024;
      v23 = v6;
      v24 = 2080;
      v25 = objc_msgSend(a2, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v16, 0x2Cu);
    }
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCAudioEnabled")))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    v9 = objc_msgSend(*(id *)(v7 + 24), "callID");
    v10 = v8;
    v11 = v7;
    v12 = 1;
  }
  else
  {
    result = objc_msgSend(a2, "isEqualToString:", CFSTR("VCAudioDisbaled"));
    if (!(_DWORD)result)
      return result;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 8);
    v9 = objc_msgSend(*(id *)(v14 + 24), "callID");
    v10 = v15;
    v11 = v14;
    v12 = 0;
  }
  return objc_msgSend(v10, "session:remoteAudioEnabled:withCallID:", v11, v12, v9);
}

- (void)setupCallingModeMessages
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__VCCallSession_Messages__setupCallingModeMessages__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("CallingModeTopic"), &unk_1E9EFA178, 0, v3);
}

uint64_t __51__VCCallSession_Messages__setupCallingModeMessages__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t result;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
      v18 = 136316162;
      v19 = v4;
      v20 = 2080;
      v21 = "-[VCCallSession(Messages) setupCallingModeMessages]_block_invoke";
      v22 = 1024;
      v23 = 10484;
      v24 = 1024;
      v25 = v6;
      v26 = 2080;
      v27 = objc_msgSend(a2, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] receives message :%s", (uint8_t *)&v18, 0x2Cu);
    }
  }
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCDataMode")))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 8);
    v9 = objc_msgSend(*(id *)(v7 + 24), "callID");
    v10 = v8;
    v11 = v7;
    v12 = 1;
  }
  else if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCAudioMode")))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 8);
    v9 = objc_msgSend(*(id *)(v13 + 24), "callID");
    v10 = v14;
    v11 = v13;
    v12 = 2;
  }
  else
  {
    result = objc_msgSend(a2, "isEqualToString:", CFSTR("VCVideoMode"));
    if (!(_DWORD)result)
      return result;
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 8);
    v9 = objc_msgSend(*(id *)(v16 + 24), "callID");
    v10 = v17;
    v11 = v16;
    v12 = 3;
  }
  return objc_msgSend(v10, "session:remoteCallingModeChanged:withCallID:", v11, v12, v9);
}

- (void)setupBasebandCodecInfoMessages
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__VCCallSession_Messages__setupBasebandCodecInfoMessages__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCBasebandCodecChange"), 0, 0, v3);
}

void __57__VCCallSession_Messages__setupBasebandCodecInfoMessages__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "newDictionaryFromUnpackedMessage:", a2);
    v4 = v3;
    if (v3)
    {
      v5 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VCBasebandCodecSampleRate"));
      v6 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VCBasebandCodecType"));
      v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "intValue"));
      if (v7 && v6 != 0)
      {
        v9 = (void *)v7;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v10 = VRTraceErrorLogLevelToCSTR();
          v11 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
            v16 = 136316418;
            v17 = v10;
            v18 = 2080;
            v19 = "-[VCCallSession(Messages) setupBasebandCodecInfoMessages]_block_invoke";
            v20 = 1024;
            v21 = 10514;
            v22 = 1024;
            v23 = v12;
            v24 = 2080;
            v25 = objc_msgSend(v6, "UTF8String");
            v26 = 1024;
            v27 = objc_msgSend(v9, "unsignedIntValue");
            _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] received message about BasebandCodecChange type :%s, sampleRate %u", (uint8_t *)&v16, 0x32u);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "lock");
        objc_msgSend(*(id *)(a1 + 32), "setBasebandCodecSampleRate:", v9);
        objc_msgSend(*(id *)(a1 + 32), "setBasebandCodecType:", v6);
        if (objc_msgSend(*(id *)(a1 + 32), "isAudioRunning"))
        {
          v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "delegate");
          v14 = *(_QWORD *)(a1 + 32);
          v15 = CStrToFourcc((char *)objc_msgSend(v6, "UTF8String"));
          objc_msgSend(v9, "doubleValue");
          objc_msgSend(v13, "session:setRemoteBasebandCodecType:sampleRate:", v14, v15);
        }
        objc_msgSend(*(id *)(a1 + 32), "unlock");
      }
    }

  }
}

- (void)setupDisconnectMessage
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __49__VCCallSession_Messages__setupDisconnectMessage__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCDisconnectMessage"), 0, 0, v3);
}

uint64_t __49__VCCallSession_Messages__setupDisconnectMessage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  _BYTE buf[12];
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = v6;
      v11 = 2080;
      v12 = "-[VCCallSession(Messages) setupDisconnectMessage]_block_invoke";
      v13 = 1024;
      v14 = 10536;
      v15 = 1024;
      v16 = v8;
      v17 = 2112;
      v18 = a4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] received 'disconnect' message from remote participant '%@'", buf, 0x2Cu);
    }
  }
  *(_QWORD *)buf = 0;
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", buf, 32003, 235, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m", 10541), CFSTR("Remote participant hangup."), CFSTR("Remote participant hangup."));
  return objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", *(_QWORD *)buf, 1);
}

- (void)setupHandoverCandidateChangeMessage
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__VCCallSession_Messages__setupHandoverCandidateChangeMessage__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCHandoverCandidateChange"), 0, 1, v3);
}

void __62__VCCallSession_Messages__setupHandoverCandidateChangeMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "newDictionaryFromUnpackedMessage:", a2);
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VCHandoverNewCandidateBlob"));
      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v5, 1);
      if (v6)
      {
        v7 = (void *)v6;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
            v11 = 136316162;
            v12 = v8;
            v13 = 2080;
            v14 = "-[VCCallSession(Messages) setupHandoverCandidateChangeMessage]_block_invoke";
            v15 = 1024;
            v16 = 10560;
            v17 = 1024;
            v18 = v10;
            v19 = 2080;
            v20 = objc_msgSend((id)objc_msgSend(v7, "description"), "UTF8String");
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: VCCallSession callID[%d] received message about remote candidate change:%s", (uint8_t *)&v11, 0x2Cu);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "processRemoteIPChange:callID:", v7, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID"));

      }
    }

  }
}

- (void)setupPiPStateChangeMessage
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__VCCallSession_Messages__setupPiPStateChangeMessage__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCWindowStateChange"), 0, 1, v3);
}

void __53__VCCallSession_Messages__setupPiPStateChangeMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  BOOL v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "newDictionaryFromUnpackedMessage:", a2);
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VCWindowState"));
      v7 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VCWindowWidth"));
      v8 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VCWindowHeight"));
      v9 = objc_msgSend(v6, "intValue");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v12 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID");
          v24 = 136316162;
          v25 = v10;
          v26 = 2080;
          v27 = "-[VCCallSession(Messages) setupPiPStateChangeMessage]_block_invoke";
          v28 = 1024;
          v29 = 10584;
          v30 = 1024;
          v31 = v12;
          v32 = 2112;
          v33 = a2;
          _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%d] received message about PIP State change:%@", (uint8_t *)&v24, 0x2Cu);
        }
      }
      if (v6 && (v9 & 0x80000000) == 0 && v9 <= 2)
      {
        reportingLog();
        VideoTransmitter_SetWindowState(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256), 0, v9);
      }
      if (v7)
        v13 = v8 == 0;
      else
        v13 = 1;
      if (!v13)
      {
        v14 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VCWindowOriginX"));
        v15 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("VCWindowOriginY"));
        objc_msgSend(v14, "doubleValue");
        v17 = v16;
        objc_msgSend(v15, "doubleValue");
        v19 = v18;
        objc_msgSend(v7, "doubleValue");
        v21 = v20;
        objc_msgSend(v8, "doubleValue");
        v23 = v22;
        reportingVisualRectangle();
        VideoTransmitter_SetVisualRectangle(v17, v19, v21, v23, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1256), 0);
      }
    }

  }
}

- (void)setupCellTechChangeMessages
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__VCCallSession_Messages__setupCellTechChangeMessages__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCCellTechChangeTopic"), 0, 0, v3);
}

void __54__VCCallSession_Messages__setupCellTechChangeMessages__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "newDictionaryFromUnpackedMessage:", a2);
    v4 = v3;
    if (v3)
    {
      v5 = objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VCCellTechKey"));
      v6 = objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("VCMaxBitrateKey"));
      if (v5 | v6)
      {
        v7 = (void *)v6;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *MEMORY[0x1E0CF2758];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
          {
            v10 = 136316162;
            v11 = v8;
            v12 = 2080;
            v13 = "-[VCCallSession(Messages) setupCellTechChangeMessages]_block_invoke";
            v14 = 1024;
            v15 = 10622;
            v16 = 1024;
            v17 = objc_msgSend((id)v5, "intValue");
            v18 = 1024;
            v19 = objc_msgSend(v7, "unsignedIntValue");
            _os_log_impl(&dword_1D8A54000, v9, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession received message about CellTech change :%d, remote bitrate %u", (uint8_t *)&v10, 0x28u);
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "remoteCellTechStateUpdate:maxRemoteBitrate:", objc_msgSend((id)v5, "intValue"), objc_msgSend(v7, "unsignedIntValue"));
      }
    }

  }
}

- (void)setupMomentsMessages
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__VCCallSession_Messages__setupMomentsMessages__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCMomentsStateMessageTopic"), 0, 0, v3);
}

void __47__VCCallSession_Messages__setupMomentsMessages__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "newDictionaryFromUnpackedMomentsMessage:", a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v6 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      else
        v6 = "<nil>";
      v7 = 136315906;
      v8 = v4;
      v9 = 2080;
      v10 = "-[VCCallSession(Messages) setupMomentsMessages]_block_invoke";
      v11 = 1024;
      v12 = 10641;
      v13 = 2080;
      v14 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d moment message %s", (uint8_t *)&v7, 0x26u);
    }
  }
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didReceiveMomentsRequest:", *(_QWORD *)(a1 + 32), v3);
    objc_msgSend(*(id *)(a1 + 32), "reportingMomentsWithRequest:", v3);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __47__VCCallSession_Messages__setupMomentsMessages__block_invoke_cold_1();
  }

}

- (void)setupPreferredInterfaceMessage
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__VCCallSession_Messages__setupPreferredInterfaceMessage__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCPreferredInterfaceMessageTopic"), 0, 0, v3);
}

void __57__VCCallSession_Messages__setupPreferredInterfaceMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  unsigned __int8 v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "newDictionaryFromUnpackedMessage:", a2);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v6 = (const char *)objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
      else
        v6 = "<nil>";
      v9 = 136315906;
      v10 = v4;
      v11 = 2080;
      v12 = "-[VCCallSession(Messages) setupPreferredInterfaceMessage]_block_invoke";
      v13 = 1024;
      v14 = 10658;
      v15 = 2080;
      v16 = v6;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d Preferred interface message %s", (uint8_t *)&v9, 0x26u);
    }
  }
  if (v3)
  {
    v7 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VCPreferredInterfaceKey")), "unsignedIntValue");
    v8 = objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("VCPreferredInterfaceDuplicatingKey")), "BOOLValue");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setPreferredRemoteInterfaceForDuplication:", v7);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "processRemoteWRMSuggestion:isRemoteDuplicating:", v7 == 0, v8);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __57__VCCallSession_Messages__setupPreferredInterfaceMessage__block_invoke_cold_1();
  }

}

- (void)processSymptomFromMessage:(id)a3 participantID:(id)a4 isLocalInitiated:(BOOL)a5 isLocalSideOnly:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v10;
  id v11;
  void *v12;
  int v13;
  const void *v14;
  uint64_t v15;
  NSObject *v16;
  __CFDictionary *Mutable;
  const void **v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const void *v34;
  uint64_t v35;

  v6 = a6;
  v7 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self, a4), "strong");
  v11 = -[VCSessionMessaging newDictionaryFromUnpackedMessage:](self->messaging, "newDictionaryFromUnpackedMessage:", a3);
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VCSymptomReporterSymptom"));
    v13 = processGroupSymptoms();
    v14 = (const void *)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("VCSymptomReporterGroupID"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136316930;
        v20 = v15;
        v21 = 2080;
        v22 = "-[VCCallSession(Messages) processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:]";
        v23 = 1024;
        v24 = 10678;
        v25 = 1024;
        v26 = v7;
        v27 = 1024;
        v28 = v6;
        v29 = 2080;
        v30 = objc_msgSend(a3, "UTF8String");
        v31 = 1024;
        v32 = v13;
        v33 = 2112;
        v34 = v14;
        _os_log_impl(&dword_1D8A54000, v16, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SymptomReporter: isLocalInitiated:%d isLocalSideOnly:%d message:%s, symptomID = %d, groupID = %@", (uint8_t *)&v19, 0x42u);
      }
    }
    if (v14)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalKeyGroupID"), v14);
      v18 = (const void **)MEMORY[0x1E0C9AE50];
      if (!v6)
        v18 = (const void **)MEMORY[0x1E0C9AE40];
      CFDictionarySetValue(Mutable, CFSTR("SymptomReporterOptionalIsLocalSideOnly"), *v18);
      objc_msgSend(v10, "reportingAgent");
      reportingSymptom();
      CFRelease(Mutable);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(Messages) processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:].cold.1();
    }
  }

}

- (void)setupSymptomEnabledMessage
{
  uint64_t v3;
  VCSessionMessaging *messaging;
  _QWORD v5[5];
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
  messaging = self->messaging;
  v5[4] = v3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__VCCallSession_Messages__setupSymptomEnabledMessage__block_invoke;
  v6[3] = &unk_1E9E55DE8;
  v6[4] = v3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VCCallSession_Messages__setupSymptomEnabledMessage__block_invoke_1609;
  v5[3] = &unk_1E9E55DC0;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:sendCompletionHandler:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:sendCompletionHandler:receiveHandler:", CFSTR("VCSymptomReporterMessage"), 0, 0, v6, v5);
}

uint64_t __53__VCCallSession_Messages__setupSymptomEnabledMessage__block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "strong");
  v8 = v7;
  if (a3)
    return objc_msgSend(v7, "processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:", a2, a4, 1, 0);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136316162;
      v13 = v10;
      v14 = 2080;
      v15 = "-[VCCallSession(Messages) setupSymptomEnabledMessage]_block_invoke";
      v16 = 1024;
      v17 = 10703;
      v18 = 2080;
      v19 = objc_msgSend(a2, "UTF8String");
      v20 = 2112;
      v21 = a4;
      _os_log_impl(&dword_1D8A54000, v11, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d SymptomReporter: Failed to send symptom message %s to participantID %@, requesting only the local side", (uint8_t *)&v12, 0x30u);
    }
  }
  return objc_msgSend(v8, "processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:", a2, a4, 1, 1);
}

uint64_t __53__VCCallSession_Messages__setupSymptomEnabledMessage__block_invoke_1609(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "strong"), "processSymptomFromMessage:participantID:isLocalInitiated:isLocalSideOnly:", a2, a4, 0, 0);
}

- (void)setupWRMAlertStateUpdateMessage
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCWRMAlertStateUpdateMessageTopic"), &unk_1E9EFA190, 0, v3);
}

void __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v4;
      v10 = 2080;
      v11 = "-[VCCallSession(Messages) setupWRMAlertStateUpdateMessage]_block_invoke";
      v12 = 1024;
      v13 = 10718;
      v14 = 2080;
      v15 = objc_msgSend(a2, "UTF8String");
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM Alert state update message: %s", (uint8_t *)&v8, 0x26u);
    }
  }
  if (a2)
  {
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCWRMAlertStateEnabled")))
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      v7 = 1;
LABEL_12:
      objc_msgSend(v6, "setRemotePreWarmStateEnabled:", v7);
      return;
    }
    if (objc_msgSend(a2, "isEqualToString:", CFSTR("VCWRMAlertStateDisabled")))
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      v7 = 0;
      goto LABEL_12;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke_cold_2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke_cold_1();
  }
}

- (void)setupWRMCoexMetricsMessage
{
  VCSessionMessaging *messaging;
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  messaging = self->messaging;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__VCCallSession_Messages__setupWRMCoexMetricsMessage__block_invoke;
  v3[3] = &unk_1E9E55DC0;
  v3[4] = self;
  -[VCSessionMessaging addTopic:associatedStrings:allowConcurrent:receiveHandler:](messaging, "addTopic:associatedStrings:allowConcurrent:receiveHandler:", CFSTR("VCWRMCoexMetricsMessage"), 0, 0, v3);
}

void __53__VCCallSession_Messages__setupWRMCoexMetricsMessage__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "newDictionaryFromUnpackedMessage:", a2);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v6 = 136315906;
        v7 = v4;
        v8 = 2080;
        v9 = "-[VCCallSession(Messages) setupWRMCoexMetricsMessage]_block_invoke";
        v10 = 1024;
        v11 = 10740;
        v12 = 2080;
        v13 = objc_msgSend((id)objc_msgSend(v3, "description"), "UTF8String");
        _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d WRM: Get remote iRAT Coex Metrics %s", (uint8_t *)&v6, 0x26u);
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "processWRMCoexMetrics:", v3);

  }
}

- (void)controlChannel:(id)a3 receivedData:(id)a4 transactionID:(unsigned int)a5 fromParticipant:(id)a6
{
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *delegateNotificationQueue;
  _QWORD v13[6];
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[VCCallInfo callID](self->localCallInfo, "callID");
      *(_DWORD *)buf = 136316418;
      v15 = v9;
      v16 = 2080;
      v17 = "-[VCCallSession(Messages) controlChannel:receivedData:transactionID:fromParticipant:]";
      v18 = 1024;
      v19 = 10751;
      v20 = 1024;
      v21 = v11;
      v22 = 2112;
      v23 = a4;
      v24 = 2112;
      v25 = a6;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession callID[%u] received data='%@' from remote participant '%@'", buf, 0x36u);
    }
  }
  delegateNotificationQueue = self->delegateNotificationQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__VCCallSession_Messages__controlChannel_receivedData_transactionID_fromParticipant___block_invoke;
  v13[3] = &unk_1E9E52238;
  v13[4] = self;
  v13[5] = a4;
  dispatch_async(delegateNotificationQueue, v13);
}

uint64_t __85__VCCallSession_Messages__controlChannel_receivedData_transactionID_fromParticipant___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:didReceiveData:messageType:withCallID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "callID"));
}

- (void)transportSession:(id)a3 connectionSetupDataDidChange:(id)a4
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[VCCallSessionDelegate session:localIPChange:withCallID:](self->delegate, "session:localIPChange:withCallID:", self, a4, -[VCCallInfo callID](self->localCallInfo, "callID", a3));
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v8 = (const char *)objc_msgSend((id)objc_msgSend(a4, "description"), "UTF8String");
      else
        v8 = "<nil>";
      *(_DWORD *)buf = 136315906;
      v13 = v6;
      v14 = 2080;
      v15 = "-[VCCallSession(VCTransportSessionLegacyDelegate) transportSession:connectionSetupDataDidChange:]";
      v16 = 1024;
      v17 = 10769;
      v18 = 2080;
      v19 = v8;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d HandoverReport: sending SIP message to inform ipChange %s", buf, 0x26u);
    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", objc_msgSend(a4, "base64EncodedDataWithOptions:", 1), 4);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v9, CFSTR("VCHandoverNewCandidateBlob"), 0);

  v11 = -[VCSessionMessaging newPackedMessageFromDictionary:](self->messaging, "newPackedMessageFromDictionary:", v10);
  -[VCSessionMessaging sendMessage:withTopic:](self->messaging, "sendMessage:withTopic:", v11, CFSTR("VCHandoverCandidateChange"));

}

- (void)transportSession:(id)a3 cancelRelayRequest:(id)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_cancelRelayRequest___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __87__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_cancelRelayRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:cancelRelayRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)transportSession:(id)a3 initiateRelayRequest:(id)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  if (-[VCCallSession isCallOngoing](self, "isCallOngoing", a3))
  {
    delegateNotificationQueue = self->delegateNotificationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_initiateRelayRequest___block_invoke;
    block[3] = &unk_1E9E52238;
    block[4] = self;
    block[5] = a4;
    dispatch_async(delegateNotificationQueue, block);
  }
}

uint64_t __89__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_initiateRelayRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:initiateRelayRequest:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)transportSession:(id)a3 sendRelayResponse:(id)a4
{
  NSObject *delegateNotificationQueue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  delegateNotificationQueue = self->delegateNotificationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_sendRelayResponse___block_invoke;
  block[3] = &unk_1E9E52238;
  block[4] = self;
  block[5] = a4;
  dispatch_async(delegateNotificationQueue, block);
}

uint64_t __86__VCCallSession_VCTransportSessionLegacyDelegate__transportSession_sendRelayResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "session:sendRelayResponse:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)rateController:(id)a3 targetBitrateDidChange:(unsigned int)a4 rateChangeCounter:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  tagHANDLE *hAFRC;
  uint64_t v9;
  NSObject *v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v24 = *MEMORY[0x1E0C80C00];
  hAFRC = self->hAFRC;
  if (hAFRC != (tagHANDLE *)0xFFFFFFFFLL)
    AFRCUpdateRateTier((uint64_t)hAFRC, a4);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v11 = -[VCCallInfo callID](self->localCallInfo, "callID");
      v12 = 136316418;
      v13 = v9;
      v14 = 2080;
      v15 = "-[VCCallSession(AVCRateControllerDelegate) rateController:targetBitrateDidChange:rateChangeCounter:]";
      v16 = 1024;
      v17 = 10810;
      v18 = 1024;
      v19 = v6;
      v20 = 1024;
      v21 = v5;
      v22 = 1024;
      v23 = v11;
      _os_log_impl(&dword_1D8A54000, v10, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCRC targetBitrateDidChange:%d, rateChangeCounter:%d callID %d", (uint8_t *)&v12, 0x2Eu);
    }
  }
  if (self->useVCRC)
  {
    -[VCAudioTransmitter setTargetBitrate:](self->audioTransmitter, "setTargetBitrate:", v6);
    -[VCAudioTransmitter setRateChangeCounter:](self->audioTransmitter, "setRateChangeCounter:", v5);
    self->_targetBitrate = v6;
    self->_rateChangeCounter = v5;
  }
}

- (int)learntBitrateForSegment:(id)a3 defaultValue:(int)a4
{
  return reportingGetLearntBitrateForSegment();
}

- (void)mediaController:(void *)a3 mediaSuggestionDidChange:(VCRateControlMediaSuggestion)a4
{
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  unint64_t v16;
  _BYTE v17[24];
  __int128 v18;
  const char *v19;
  _BYTE v20[32];
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = "flush audio";
      *(_DWORD *)v17 = 136317442;
      *(_QWORD *)&v17[4] = v6;
      if ((*(_QWORD *)&a4 & 0x100000000) == 0)
        v8 = "";
      *(_WORD *)&v17[12] = 2080;
      *(_QWORD *)&v17[14] = "-[VCCallSession(VCRateControlMediaControllerDelegate) mediaController:mediaSuggestionDidChange:]";
      v9 = "flush video";
      if ((*(_DWORD *)&a4.var0 & 0x1000000) == 0)
        v9 = "";
      *(_WORD *)&v17[22] = 1024;
      LODWORD(v18) = 10836;
      v10 = "refresh video";
      if ((*(_QWORD *)&a4 & 0x10000) == 0)
        v10 = "";
      WORD2(v18) = 2080;
      *(_QWORD *)((char *)&v18 + 6) = v8;
      v11 = "stop video";
      if (!a4.var0)
        v11 = "";
      HIWORD(v18) = 2080;
      v19 = v9;
      v12 = "start video";
      if ((*(_WORD *)&a4.var0 & 0x100) == 0)
        v12 = "";
      *(_WORD *)v20 = 2080;
      *(_QWORD *)&v20[2] = v10;
      v13 = "stall audio";
      if ((*(_QWORD *)&a4 & 0x10000000000) == 0)
        v13 = "";
      *(_WORD *)&v20[10] = 2080;
      *(_QWORD *)&v20[12] = v11;
      v14 = "unstall audio";
      *(_WORD *)&v20[20] = 2080;
      *(_QWORD *)&v20[22] = v12;
      *(_WORD *)&v20[30] = 2080;
      if ((*(_QWORD *)&a4 & 0x1000000000000) == 0)
        v14 = "";
      v21 = v13;
      v22 = 2080;
      v23 = v14;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCRC mediaSuggestion:[%s,%s,%s,%s,%s,%s,%s]", v17, 0x62u);
    }
  }
  if (!self->didReportAudioStall && (*(_QWORD *)&a4 & 0x10000000000) != 0)
  {
    reportingSymptom();
    self->didReportAudioStall = 1;
  }
  if (self->useVCRC)
  {
    if (-[VCAudioTransmitter isAudioStalled](self->audioTransmitter, "isAudioStalled"))
      v16 = (*(_QWORD *)&a4 & 0x1000000000000) == 0;
    else
      v16 = (*(unint64_t *)&a4 >> 40) & 1;
    -[VCAudioTransmitter setIsAudioStalled:](self->audioTransmitter, "setIsAudioStalled:", v16, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18, v19, *(_OWORD *)v20, *(_OWORD *)&v20[16]);
    VideoTransmitter_SetMediaSuggestion((uint64_t)self->hVideoTransmitter, *(_QWORD *)&a4);
  }
}

- (void)packMeters:(char *)a3 withLength:(char *)a4
{
  -[VCCallSessionDelegate session:packMeters:withLength:](self->delegate, "session:packMeters:withLength:", self, a3, a4);
}

- (void)processBlackFrame:(opaqueCMSampleBuffer *)a3
{
  __CVBuffer *ImageBuffer;
  __CVBuffer *v5;
  size_t PlaneCount;
  OSType PixelFormatType;
  _BOOL4 v8;
  void *BaseAddressOfPlane;
  void *v10;
  size_t BytesPerRowOfPlane;
  size_t HeightOfPlane;
  size_t v13;
  size_t v14;

  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (ImageBuffer)
  {
    if (self->shouldSendBlackFrame)
    {
      v5 = ImageBuffer;
      CVPixelBufferLockBaseAddress(ImageBuffer, 0);
      if (CVPixelBufferIsPlanar(v5))
      {
        PlaneCount = CVPixelBufferGetPlaneCount(v5);
        PixelFormatType = CVPixelBufferGetPixelFormatType(v5);
        if (PlaneCount == 2 && (PixelFormatType | 0x10) == 0x34323076)
        {
          v8 = PixelFormatType == 875704438;
          BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(v5, 0);
          v10 = CVPixelBufferGetBaseAddressOfPlane(v5, 1uLL);
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v5, 0);
          HeightOfPlane = CVPixelBufferGetHeightOfPlane(v5, 0);
          memset(BaseAddressOfPlane, 16 * v8, HeightOfPlane * BytesPerRowOfPlane);
          v13 = CVPixelBufferGetBytesPerRowOfPlane(v5, 1uLL);
          v14 = CVPixelBufferGetHeightOfPlane(v5, 1uLL);
          memset(v10, 128, v14 * v13);
        }
      }
      CVPixelBufferUnlockBaseAddress(v5, 0);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(VideoConferencing) processBlackFrame:].cold.1();
  }
}

- (BOOL)onCaptureFrame:(opaqueCMSampleBuffer *)a3 audioTS:(unsigned int)a4 audioHT:(double)a5 videoHT:(id *)a6 cameraBits:(unsigned __int8)a7
{
  unsigned int v7;
  uint64_t v10;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  float v16;
  tagHANDLE *hVideoTransmitter;
  int v19;
  NSObject *global_queue;
  _QWORD block[5];
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _BYTE buf[48];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (self->hVideoTransmitter == (tagHANDLE *)0xFFFFFFFFLL)
    return 0;
  v7 = a7;
  v10 = *(_QWORD *)&a4;
  if (self->useVCRC)
    VideoTransmitter_SetTargetBitrate((uint64_t)self->hVideoTransmitter, self->_targetBitrate- -[VCAudioTransmitter actualAudioSendingBitrate](self->audioTransmitter, "actualAudioSendingBitrate"), self->_rateChangeCounter, -[VCRateControlMediaController isInThrottlingMode](self->_mediaController, "isInThrottlingMode"));
  if (!-[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector"))
  {
    v35 = 0;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    if ((AFRCGetAudioTxInfo((uint64_t)self->hAFRC, 0, 0, 0, 0, 0, 0, 0, 0, (uint64_t)&v23) & 0x80000000) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        v13 = VRTraceErrorLogLevelToCSTR();
        v14 = *MEMORY[0x1E0CF2758];
        v15 = *MEMORY[0x1E0CF2758];
        if (*MEMORY[0x1E0CF2748])
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            v16 = *((double *)&v24 + 1);
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v13;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "-[VCCallSession(VideoConferencing) onCaptureFrame:audioTS:audioHT:videoHT:cameraBits:]";
            *(_WORD *)&buf[22] = 1024;
            *(_DWORD *)&buf[24] = 110;
            *(_WORD *)&buf[28] = 2048;
            *(double *)&buf[30] = v16;
            *(_WORD *)&buf[38] = 1024;
            *(_DWORD *)&buf[40] = v26;
            _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d AFRC Statistics packetLossPercentage=%3.3f burstPacketLoss=%d", buf, 0x2Cu);
          }
        }
        else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          -[VCCallSession(VideoConferencing) onCaptureFrame:audioTS:audioHT:videoHT:cameraBits:].cold.1(v13, (uint64_t)&v23, v14);
        }
      }
      v44 = v33;
      v45 = v34;
      v46 = v35;
      v40 = v29;
      v41 = v30;
      v42 = v31;
      v43 = v32;
      *(_OWORD *)&buf[32] = v25;
      v37 = v26;
      v38 = v27;
      v39 = v28;
      *(_OWORD *)buf = v23;
      *(_OWORD *)&buf[16] = v24;
      -[VCCallSession updateStatistics:](self, "updateStatistics:", buf);
    }
  }
  -[VCCallSession processBlackFrame:](self, "processBlackFrame:", a3);
  hVideoTransmitter = self->hVideoTransmitter;
  v23 = *(_OWORD *)&a6->var0;
  *(_QWORD *)&v24 = a6->var3;
  v19 = VideoTransmitter_EnqueueBuffer((uint64_t)hVideoTransmitter, a3, v10, &v23, 0, v7, a5);
  if (v19 < 0)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__VCCallSession_VideoConferencing__onCaptureFrame_audioTS_audioHT_videoHT_cameraBits___block_invoke;
    block[3] = &unk_1E9E52300;
    v22 = v19;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  -[VCCallSession updateVideoQualityNotification:](self, "updateVideoQualityNotification:", a5);
  return v19 >= 0;
}

uint64_t __86__VCCallSession_VideoConferencing__onCaptureFrame_audioTS_audioHT_videoHT_cameraBits___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = *(int *)(a1 + 40);
  v5[0] = 0;
  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSessionCategories.m", 126);
  +[GKVoiceChatError getNSError:code:detailedCode:returnCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:returnCode:filePath:description:reason:", v5, 32017, 223, v2, v3, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in VideoTransmitter encode")), CFSTR("VideoTransmitter returned error"));
  return objc_msgSend(*(id *)(a1 + 32), "disconnect:didRemoteCancel:", v5[0], 0);
}

- (void)onPlayVideo:(__CVBuffer *)a3 frameTime:(id *)a4 cameraStatusBits:(unsigned __int8)a5
{
  uint64_t v5;
  __int128 v9;
  uint64_t v10;
  uint64_t ErrorLogLevelForModule;
  uint64_t v12;
  NSObject *v13;
  unsigned int remoteFrameWidth;
  unsigned int remoteFrameHeight;
  OpaqueVTPixelTransferSession **p_hdTransferSession;
  CFAllocatorRef *v17;
  __CVPixelBufferPool *hdBufferPool;
  const __CFAllocator *v19;
  OpaqueVTPixelTransferSession *hdTransferSession;
  OpaqueVTPixelTransferSession *v21;
  __CVPixelBufferPool *v22;
  void *v23;
  uint64_t v24;
  id v25;
  const __CFDictionary *v26;
  VideoAttributes *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  const __CFString *v32;
  _BYTE buf[24];
  int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  unsigned int v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v5 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  self->_lastDecodedFrameTime = micro();
  *(_QWORD *)&v9 = -1;
  *((_QWORD *)&v9 + 1) = -1;
  v29 = v9;
  v30 = v9;
  v27 = 0;
  v28 = 0;
  CVPixelBufferRetain(a3);
  self->remoteFrameWidth = CVPixelBufferGetWidth(a3);
  self->remoteFrameHeight = CVPixelBufferGetHeight(a3);
  VideoUtil_GetVisibleRect(a3, (double *)&v29);
  if (*(_QWORD *)&self->remoteFrameWidth == 0x1E000000280
    && self->expectedDecodeSize.width == 1280.0
    && self->expectedDecodeSize.height == 720.0)
  {
    ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if ((int)ErrorLogLevelForModule >= 6)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      ErrorLogLevelForModule = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)ErrorLogLevelForModule)
      {
        remoteFrameWidth = self->remoteFrameWidth;
        remoteFrameHeight = self->remoteFrameHeight;
        *(_DWORD *)buf = 136317186;
        *(_QWORD *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCallSession(VideoConferencing) onPlayVideo:frameTime:cameraStatusBits:]";
        *(_WORD *)&buf[22] = 1024;
        v34 = 160;
        v35 = 1024;
        v36 = remoteFrameWidth;
        v37 = 1024;
        v38 = remoteFrameHeight;
        v39 = 2048;
        v40 = v29;
        v41 = 2048;
        v42 = *((_QWORD *)&v29 + 1);
        v43 = 2048;
        v44 = v30;
        v45 = 2048;
        v46 = *((_QWORD *)&v30 + 1);
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d receiving frame size %dx%d visible rect %g,%g,%g,%g", buf, 0x50u);
      }
    }
    p_hdTransferSession = &self->hdTransferSession;
    v17 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
    if (!self->hdTransferSession)
    {
      VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->hdTransferSession);
      VTSessionSetProperty(*p_hdTransferSession, (CFStringRef)*MEMORY[0x1E0CED848], (CFTypeRef)*MEMORY[0x1E0CEDB48]);
      ErrorLogLevelForModule = VTSessionSetProperty(*p_hdTransferSession, (CFStringRef)*MEMORY[0x1E0CED800], (CFTypeRef)*MEMORY[0x1E0C9AE40]);
    }
    hdBufferPool = self->hdBufferPool;
    if (hdBufferPool)
    {
      v19 = *v17;
    }
    else
    {
      v23 = (void *)MEMORY[0x1DF088A10](ErrorLogLevelForModule);
      v31 = *MEMORY[0x1E0CBC048];
      v32 = CFSTR("AVConference:DecodeResize");
      v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v25 = objc_alloc(MEMORY[0x1E0C99D80]);
      v26 = (const __CFDictionary *)objc_msgSend(v25, "initWithObjectsAndKeys:", &unk_1E9EF72E0, *MEMORY[0x1E0CA90E0], &unk_1E9EF72F8, *MEMORY[0x1E0CA8FD8], &unk_1E9EF7310, *MEMORY[0x1E0CA9040], &unk_1E9EF7328, *MEMORY[0x1E0CBBF00], v24, *MEMORY[0x1E0CA8FF0], 0);
      v19 = *v17;
      CVPixelBufferPoolCreate(*v17, 0, v26, &self->hdBufferPool);

      objc_autoreleasePoolPop(v23);
      hdBufferPool = self->hdBufferPool;
    }
    *(_QWORD *)buf = 0;
    CVPixelBufferPoolCreatePixelBuffer(v19, hdBufferPool, (CVPixelBufferRef *)buf);
    if (*(_QWORD *)buf)
    {
      VTPixelTransferSessionTransferImage(*p_hdTransferSession, a3, *(CVPixelBufferRef *)buf);
      CVPixelBufferRelease(a3);
      a3 = *(__CVBuffer **)buf;
    }
  }
  else
  {
    hdTransferSession = self->hdTransferSession;
    if (hdTransferSession)
    {
      VTPixelTransferSessionInvalidate(hdTransferSession);
      v21 = self->hdTransferSession;
      if (v21)
      {
        CFRelease(v21);
        self->hdTransferSession = 0;
      }
    }
    v22 = self->hdBufferPool;
    if (v22)
    {
      CVPixelBufferPoolRelease(v22);
      self->hdBufferPool = 0;
    }
  }
  VCCallSession_SetUpRemoteAttributes(a3, v5, self->remoteSupportsExpectedAspectRatio, !self->receivedFirstRemoteFrame, self->remoteExpectedPortraitAspectRatio.width, self->remoteExpectedPortraitAspectRatio.height, self->remoteExpectedLandscapeAspectRatio.width, self->remoteExpectedLandscapeAspectRatio.height, self->remoteScreenPortraitAspectRatio.width, self->remoteScreenPortraitAspectRatio.height, self->remoteScreenLandscapeAspectRatio.width, self->remoteScreenLandscapeAspectRatio.height, 0, v10, &v28, &v27);
  *(_OWORD *)buf = *(_OWORD *)&a4->var0;
  *(_QWORD *)&buf[16] = a4->var3;
  -[VCCallSession nofityDelegateReceivedRemoteFrame:frameTime:cameraStatusBits:newRemoteVideoAttributes:remoteScreenAttributes:](self, "nofityDelegateReceivedRemoteFrame:frameTime:cameraStatusBits:newRemoteVideoAttributes:remoteScreenAttributes:", a3, buf, v5, v28, v27);
}

- (void)nofityDelegateReceivedRemoteFrame:(__CVBuffer *)a3 frameTime:(id *)a4 cameraStatusBits:(unsigned __int8)a5 newRemoteVideoAttributes:(id)a6 remoteScreenAttributes:(id)a7
{
  id v8;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  VideoAttributes *remoteVideoAttributes;
  const char *v16;
  const char *v17;
  VCCallSessionDelegate *delegate;
  _BOOL8 v19;
  BOOL v20;
  uint64_t v21;
  _BYTE buf[24];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((a5 & 0x80) == 0)
    return;
  v8 = a6;
  if (!VCVideoAttributes_IsEqual((uint64_t)self->remoteVideoAttributes, (uint64_t)a6))
  {
    v12 = (void *)MEMORY[0x1DF088A10]();
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
      goto LABEL_12;
    v13 = VRTraceErrorLogLevelToCSTR();
    v14 = *MEMORY[0x1E0CF2758];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    remoteVideoAttributes = self->remoteVideoAttributes;
    if (remoteVideoAttributes)
    {
      v16 = (const char *)objc_msgSend(-[VideoAttributes description](remoteVideoAttributes, "description"), "UTF8String");
      if (v8)
      {
LABEL_8:
        v17 = (const char *)objc_msgSend((id)objc_msgSend(v8, "description"), "UTF8String");
LABEL_11:
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "-[VCCallSession(VideoConferencing) nofityDelegateReceivedRemoteFrame:frameTime:cameraStatu"
                              "sBits:newRemoteVideoAttributes:remoteScreenAttributes:]";
        *(_WORD *)&buf[22] = 1024;
        v23 = 406;
        v24 = 2080;
        v25 = v16;
        v26 = 2080;
        v27 = v17;
        _os_log_impl(&dword_1D8A54000, v14, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: remote video attributes changing from %s to %s", buf, 0x30u);
LABEL_12:
        objc_autoreleasePoolPop(v12);
        -[VCCallSession setRemoteVideoAttributes:](self, "setRemoteVideoAttributes:", v8);
        goto LABEL_13;
      }
    }
    else
    {
      v16 = "<nil>";
      if (v8)
        goto LABEL_8;
    }
    v17 = "<nil>";
    goto LABEL_11;
  }

  v8 = 0;
LABEL_13:
  if (self->hVideoReceiver != (tagHANDLE *)0xFFFFFFFFLL)
  {
    delegate = self->delegate;
    v19 = !self->receivedFirstRemoteFrame;
    v20 = -[VCCallSession videoIsPaused](self, "videoIsPaused");
    *(_OWORD *)buf = *(_OWORD *)&a4->var0;
    *(_QWORD *)&buf[16] = a4->var3;
    LOBYTE(v21) = v20;
    -[VCCallSessionDelegate session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:](delegate, "session:receivedRemoteFrame:atTime:withScreenAttributes:videoAttributes:isFirstFrame:isVideoPaused:", self, a3, buf, a7, v8, v19, v21);
  }
  CVPixelBufferRelease(a3);

  if (!self->receivedFirstRemoteFrame)
  {
    self->receivedFirstRemoteFrame = 1;
    -[VCCallSession rcvdFirstRemoteFrame](self, "rcvdFirstRemoteFrame");
  }
}

- (unsigned)parameterSetForPayload:(int)a3
{
  uint64_t v3;
  VCMediaNegotiator *mediaNegotiator;
  VCMediaNegotiatorResultsVideo *v6;
  NSDictionary *v8;

  v3 = *(_QWORD *)&a3;
  if (!-[VCMediaNegotiator usePreNegotiation](self->_mediaNegotiator, "usePreNegotiation"))
    return VCVideoParamaterSets_DefaultSupportedSets(v3);
  mediaNegotiator = self->_mediaNegotiator;
  if (self->operatingMode == 4)
    v6 = -[VCMediaNegotiatorBase negotiatedScreenSettings](mediaNegotiator, "negotiatedScreenSettings");
  else
    v6 = -[VCMediaNegotiatorBase negotiatedVideoSettings](mediaNegotiator, "negotiatedVideoSettings");
  v8 = -[VCMediaNegotiatorResultsVideo parameterSets](v6, "parameterSets");
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3)), "unsignedIntValue");
}

- (CGSize)computeVisibleAspectRatioWithRemoteScreenAspectRatio:(CGSize)a3 remoteExpectedAspectRatio:(CGSize)a4 encodeWidth:(int)a5 encodeHeight:(int)a6
{
  double v6;
  double v7;
  CGSize result;

  v6 = ComputeVisibleAspectRatioWithRemoteScreenAspectRatio(a5, a6, a3.width, a3.height, a4.width, a4.height);
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)cleanUpVideoRTP
{
  if (self->rtpVideo != (tagHANDLE *)0xFFFFFFFFLL)
  {
    RTPCloseHandle();
    self->rtpVideo = (tagHANDLE *)0xFFFFFFFFLL;
  }
}

- (void)cleanUpVideoReceiver
{
  if (self->hVideoReceiver != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VideoReceiver_CloseHandle();
    self->hVideoReceiver = (tagHANDLE *)0xFFFFFFFFLL;
  }
}

- (void)cleanUpVideoTransmitter
{
  tagHANDLE *hVideoTransmitter;

  hVideoTransmitter = self->hVideoTransmitter;
  if (hVideoTransmitter != (tagHANDLE *)0xFFFFFFFFLL)
  {
    VideoTransmitter_CloseHandle((uint64_t)hVideoTransmitter);
    self->hVideoTransmitter = (tagHANDLE *)0xFFFFFFFFLL;
  }
}

- (void)cleanUpDisplayLink
{
  -[VCDisplayLink deactivate](self->_displayLink, "deactivate");

  self->_displayLink = 0;
}

- (BOOL)initializeVideoTransmitter:(id *)a3 videoRules:(VCCSVideoTransmitterVideoRules_t *)a4 unpausing:(BOOL)a5 reportingAgent:(opaqueRTCReporting *)a6 fecHeaderV1Enabled:(BOOL)a7 isFECGeneratorEnabled:(BOOL)a8
{
  uint64_t *p_hVideoTransmitter;
  int Handle;
  _BOOL4 bBWEstNewBWEstModeEnabled;
  _BOOL4 bBWEstActiveProbingSenderLog;
  const void *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  unsigned int callSessionBitrate;
  float v20;
  tagHANDLE *rtpHandle;
  void *videoMediaControlInfoGenerator;
  VCRateControlMediaController *mediaController;
  float v24;
  float v25;
  unsigned int v26;
  float v27;
  int v28;
  int v29;
  uint64_t v30;
  AVCStatisticsCollector *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  int v41;
  unsigned int v43;
  BOOL v44;
  BOOL v45;
  int operatingMode;
  int v47;
  BOOL v48;
  int v51;
  int v52;
  int IsInterfaceOnCellularForActiveConnectionWithQuality;
  int v54;
  _BOOL4 v55;
  _QWORD v56[5];
  _DWORD v57[4];
  uint8_t buf[4];
  _BYTE v59[20];
  __int128 v60;
  __int16 v61;
  int v62;
  __int16 v63;
  unsigned int v64;
  tagHANDLE *v65;
  void *v66;
  opaqueRTCReporting *v67;
  VCRateControlMediaController *v68;
  AVCStatisticsCollector *v69;
  BOOL v70;
  BOOL v71;
  BOOL useRateControl;
  char v73;
  int fecMode;
  int v75;
  int v76;
  int v77;
  _BOOL4 v78;
  _BOOL4 remoteSupportsVisibleRect;
  unsigned int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  uint64_t v93;
  unsigned int v94;
  int v95;
  int sampleRate;
  _DWORD *v97;
  uint64_t v98;
  unsigned int v99;
  const void *v100;
  const char *v101;
  unsigned __int16 maxPacketLength;
  unsigned int v103;
  int v104;
  BOOL v105;
  BOOL v106;
  BOOL v107;
  int v108;
  int v109;
  int v110;
  BOOL v111;
  BOOL v112;
  char v113;
  uint64_t v114;

  v55 = a5;
  v114 = *MEMORY[0x1E0C80C00];
  p_hVideoTransmitter = (uint64_t *)&self->hVideoTransmitter;
  if (self->hVideoTransmitter == (tagHANDLE *)0xFFFFFFFFLL)
  {
    v48 = -[VCConnectionManager isConnectedOnIPv6ForActiveConnectionWithQuality:](self->connectionManager, "isConnectedOnIPv6ForActiveConnectionWithQuality:", 1);
    IsInterfaceOnCellularForActiveConnectionWithQuality = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 1);
    v52 = -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 1);
    v54 = VCConnectionManager_IsInterfaceOnCellularForActiveConnectionWithQuality((uint64_t)self->connectionManager, 1, 0);
    v51 = -[VCConnectionManager getCellularTechForActiveConnectionWithQuality:forLocalInterface:](self->connectionManager, "getCellularTechForActiveConnectionWithQuality:forLocalInterface:", 1, 0);
    v47 = -[VCDefaults enableTxSourceYuvDump](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableTxSourceYuvDump");
    v45 = -[VCDefaults enableTxBitstreamDump](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableTxBitstreamDump");
    v44 = -[VCDefaults enableTxTimestampAlignmentLogs](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableTxTimestampAlignmentLogs");
    operatingMode = self->operatingMode;
    v43 = -[VCCallSession parameterSetForPayload:](self, "parameterSetForPayload:", -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec"));
    bBWEstNewBWEstModeEnabled = self->bBWEstNewBWEstModeEnabled;
    v57[0] = self->bBWEstOperatingModeInitialized;
    v57[1] = bBWEstNewBWEstModeEnabled;
    bBWEstActiveProbingSenderLog = self->bBWEstActiveProbingSenderLog;
    v57[2] = self->bBWEstFakeLargeFrameModeEnabled;
    v57[3] = bBWEstActiveProbingSenderLog;
    v15 = (const void *)objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "copyCameraColorInfo");
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v41 = objc_msgSend(a4->var0, "iWidth");
        v18 = objc_msgSend(a4->var0, "iHeight");
        objc_msgSend(a4->var0, "fRate");
        callSessionBitrate = self->callSessionBitrate;
        *(_DWORD *)buf = 136316674;
        *(_QWORD *)v59 = v16;
        *(_WORD *)&v59[8] = 2080;
        *(_QWORD *)&v59[10] = "-[VCCallSession(VideoConferencing) initializeVideoTransmitter:videoRules:unpausing:reporti"
                              "ngAgent:fecHeaderV1Enabled:isFECGeneratorEnabled:]";
        *(_WORD *)&v59[18] = 1024;
        LODWORD(v60) = 558;
        WORD2(v60) = 1024;
        *(_DWORD *)((char *)&v60 + 6) = v41;
        WORD5(v60) = 1024;
        HIDWORD(v60) = v18;
        v61 = 1024;
        v62 = (int)v20;
        v63 = 1024;
        v64 = callSessionBitrate;
        _os_log_impl(&dword_1D8A54000, v17, OS_LOG_TYPE_DEFAULT, "VCCallSession [%s] %s:%d VCCallSession: Encode video settings %dx%d@%dfps, bitrate %d Kbps", buf, 0x34u);
      }
    }
    bzero(buf, 0x270uLL);
    v60 = 0uLL;
    *(_OWORD *)&v59[4] = (unint64_t)self->rtpVideo;
    rtpHandle = self->rtpHandle;
    *(_DWORD *)buf = 1;
    videoMediaControlInfoGenerator = self->videoMediaControlInfoGenerator;
    v65 = rtpHandle;
    v66 = videoMediaControlInfoGenerator;
    mediaController = self->_mediaController;
    v67 = a6;
    v68 = mediaController;
    v69 = -[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector");
    v103 = -[VCCallSession callID](self, "callID");
    v81 = objc_msgSend(a4->var0, "iWidth");
    v82 = objc_msgSend(a4->var0, "iHeight");
    objc_msgSend(a4->var0, "fRate");
    v83 = (int)v24;
    v85 = objc_msgSend(a4->var1, "iWidth");
    v86 = objc_msgSend(a4->var1, "iHeight");
    objc_msgSend(a4->var1, "fRate");
    v87 = (int)v25;
    v88 = objc_msgSend(a4->var2, "iWidth");
    v89 = objc_msgSend(a4->var2, "iHeight");
    objc_msgSend(a4->var2, "fRate");
    v26 = self->callSessionBitrate;
    v90 = (int)v27;
    v91 = 1000 * v26;
    v94 = -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec");
    v92 = -1;
    v93 = 0x3FD0000000000000;
    v98 = 0x20000000200;
    v101 = -[VCCallSession matchedFeaturesStringForPayload:](self, "matchedFeaturesStringForPayload:", -[VCCapabilities actualVideoCodec](self->caps, "actualVideoCodec"));
    remoteSupportsVisibleRect = self->remoteSupportsVisibleRect;
    v100 = v15;
    v97 = v57;
    v75 = IsInterfaceOnCellularForActiveConnectionWithQuality;
    v76 = v52;
    v77 = v54;
    v78 = (int)VCCPUCount() > 1;
    v95 = -[VCAudioTransmitter audioTxBitrate](self->audioTransmitter, "audioTxBitrate");
    sampleRate = self->sampleRate;
    v80 = -[VCCallInfo visibleRectCropping](self->remoteCallInfo, "visibleRectCropping");
    v70 = -[VCCallInfo isIOS](self->remoteCallInfo, "isIOS");
    maxPacketLength = self->maxPacketLength;
    v71 = v48;
    v104 = v47;
    v105 = v45;
    v106 = v44;
    v99 = v43;
    v73 = 1;
    fecMode = self->fecMode;
    useRateControl = self->useRateControl;
    v107 = -[VCCallInfo supportsDynamicContentsRectWithAspectPreservation](self->remoteCallInfo, "supportsDynamicContentsRectWithAspectPreservation");
    v84 = 875704438;
    v111 = a7;
    v28 = operatingMode;
    if (operatingMode == 4)
    {
      v29 = 3;
    }
    else
    {
      v28 = 1;
      v29 = 2;
    }
    v108 = v28;
    v109 = v29;
    v110 = 1;
    v112 = a8;
    v113 = 1;
    Handle = VideoTransmitter_CreateHandle(p_hVideoTransmitter, (unsigned int *)buf);
    if (v15)
      CFRelease(v15);
    if (Handle < 0)
    {
      -[VCCallSession cleanUpVideoReceiver](self, "cleanUpVideoReceiver");
      -[VCCallSession cleanUpVideoRTP](self, "cleanUpVideoRTP");
      +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32017, 111, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d"), "/Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSessionCategories.m", 632), CFSTR("Could not create video transmitting unit"), CFSTR("Video unavailable"));
    }
    v30 = objc_msgSend(MEMORY[0x1E0CF26A0], "weakObjectHolderWithObject:", self);
    v31 = -[AVCRateController statisticsCollector](self->_rateController, "statisticsCollector");
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __140__VCCallSession_VideoConferencing__initializeVideoTransmitter_videoRules_unpausing_reportingAgent_fecHeaderV1Enabled_isFECGeneratorEnabled___block_invoke;
    v56[3] = &unk_1E9E523A0;
    v56[4] = v30;
    -[AVCStatisticsCollector registerStatisticsChangeHandlerWithType:handler:](v31, "registerStatisticsChangeHandlerWithType:handler:", 3, v56);
    if (self->canLocalResizePIP || !self->canRemoteResizePIP)
    {
      -[VCCallSession computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:](self, "computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:", objc_msgSend(a4->var0, "iHeight"), objc_msgSend(a4->var0, "iWidth"), self->remoteScreenPortraitAspectRatio.width, self->remoteScreenPortraitAspectRatio.height, self->remoteExpectedPortraitAspectRatio.width, self->remoteExpectedPortraitAspectRatio.height);
      v33 = v32;
      v35 = v34;
      -[VCCallSession computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:](self, "computeVisibleAspectRatioWithRemoteScreenAspectRatio:remoteExpectedAspectRatio:encodeWidth:encodeHeight:", objc_msgSend(a4->var0, "iWidth"), objc_msgSend(a4->var0, "iHeight"), self->remoteScreenLandscapeAspectRatio.width, self->remoteScreenLandscapeAspectRatio.height, self->remoteExpectedLandscapeAspectRatio.width, self->remoteExpectedLandscapeAspectRatio.height);
    }
    else
    {
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 0);
      v33 = v38;
      v35 = v39;
      objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "localScreenRatioForScreenOrientation:", 3);
    }
    VideoTransmitter_SetAspectRatios(v33, v35, v36, v37);
    VideoTransmitter_SetCellTech(*p_hVideoTransmitter, IsInterfaceOnCellularForActiveConnectionWithQuality, v52, v54, v51);
  }
  else
  {
    Handle = 0;
  }
  if (v55)
    VideoTransmitter_Pause(*p_hVideoTransmitter, 0);
  return Handle >= 0;
}

void __140__VCCallSession_VideoConferencing__initializeVideoTransmitter_videoRules_unpausing_reportingAgent_fecHeaderV1Enabled_isFECGeneratorEnabled___block_invoke(uint64_t a1, uint64_t a2)
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
  objc_msgSend(v3, "updateStatistics:", v10);
  if (v3)
    CFRelease(v3);
}

- (BOOL)initializeDisplayLinkWithError:(id *)a3
{
  VCDisplayLink *v5;
  double v6;
  VCDisplayLink *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, double *);
  void *v12;
  VCCallSession *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __67__VCCallSession_VideoConferencing__initializeDisplayLinkWithError___block_invoke;
  v12 = &unk_1E9E555A8;
  v13 = self;
  v5 = [VCDisplayLink alloc];
  LODWORD(v6) = 0;
  v7 = -[VCDisplayLink initWithHandler:threadPriority:threadOptions:threadIdentifier:preferredFrameRate:](v5, "initWithHandler:threadPriority:threadOptions:threadIdentifier:preferredFrameRate:", &v9, 39, 0, CFSTR("com.apple.VCCallSession.VCDisplayLink"), v6);
  self->_displayLink = v7;
  if (v7)
  {
    if (-[VCDisplayLink activate](v7, "activate", v9, v10, v11, v12, v13, v14))
      return 1;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
        -[VCCallSession(VideoConferencing) initializeDisplayLinkWithError:].cold.2();
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(VideoConferencing) initializeDisplayLinkWithError:].cold.1();
  }
  -[VCCallSession cleanUpDisplayLink](self, "cleanUpDisplayLink", v9, v10, v11, v12, v13, v14);
  +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32017, 117, 0, CFSTR("Could not create and activate display link"), CFSTR("Video unavailable"));
  return 0;
}

uint64_t __67__VCCallSession_VideoConferencing__initializeDisplayLinkWithError___block_invoke(uint64_t a1, double *a2)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1248);
  if (result != 0xFFFFFFFFLL)
    return VideoReceiver_DisplayLinkTick(a2[1], *a2, a2[2]);
  return result;
}

- (void)handleVideoReceiverInitializationFailed
{
  -[VCCallSession cleanUpVideoTransmitter](self, "cleanUpVideoTransmitter");
  -[VCCallSession cleanUpVideoReceiver](self, "cleanUpVideoReceiver");
  -[VCCallSession cleanUpDisplayLink](self, "cleanUpDisplayLink");
  -[VCCallSession cleanUpVideoRTP](self, "cleanUpVideoRTP");
}

- (BOOL)videoReceiverInitializationError:(id *)a3 withDescription:(id)a4
{
  return +[GKVoiceChatError getNSError:code:detailedCode:filePath:description:reason:](GKVoiceChatError, "getNSError:code:detailedCode:filePath:description:reason:", a3, 32017, 110, 0, a4, CFSTR("Video unavailable"));
}

- (BOOL)createVideoReceiverWithReportingAgent:(opaqueRTCReporting *)a3 fecHeaderV1Enabled:(BOOL)a4 videoJBEnabled:(BOOL)a5 error:(id *)a6
{
  _BOOL4 bBWEstNewBWEstModeEnabled;
  _BOOL4 bBWEstActiveProbingSenderLog;
  const __CFAllocator *v9;
  CFIndex v10;
  __CFDictionary *Mutable;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  tagHANDLE *rtpVideo;
  CFTypeRef v18;
  void *videoMediaControlInfoGenerator;
  tagWRMMetricsInfo *wrmInfo;
  int v21;
  _BOOL4 v24;
  int v25;
  _BOOL4 v26;
  _BOOL4 v27;
  __int128 v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  tagHANDLE *v36;
  CFTypeRef v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int sampleRate;
  int v47;
  _BOOL4 v48;
  unsigned int v49;
  _BOOL4 v50;
  _BOOL4 v51;
  int v52;
  _BOOL4 v53;
  _BOOL4 v54;
  char v55;
  VCCallSession *v56;
  uint64_t (*v57)(void *, uint64_t, __int128 *, uint64_t);
  tagWRMMetricsInfo *v58;
  int v59;
  BOOL v60;
  __int16 v61;
  char v62;
  BOOL v63;
  __int16 v64;
  void *v65;
  char v66;
  int v67;
  BOOL v68;
  _BYTE v69[128];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v26 = -[VCDefaults enableVPBLogging](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableVPBLogging");
  v27 = -[VCDefaults enableBitstreamCapture](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableBitstreamCapture");
  v25 = -[VCDefaults enableRxDecodeYUVDump](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableRxDecodeYUVDump");
  v24 = -[VCDefaults enableRecvBitstreamDump](+[VCDefaults sharedInstance](VCDefaults, "sharedInstance"), "enableRecvBitstreamDump");
  bBWEstNewBWEstModeEnabled = self->bBWEstNewBWEstModeEnabled;
  LODWORD(v31) = self->bBWEstOperatingModeInitialized;
  DWORD1(v31) = bBWEstNewBWEstModeEnabled;
  bBWEstActiveProbingSenderLog = self->bBWEstActiveProbingSenderLog;
  DWORD2(v31) = self->bBWEstFakeLargeFrameModeEnabled;
  HIDWORD(v31) = bBWEstActiveProbingSenderLog;
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v10 = -[NSMutableDictionary count](self->featureListStringDict, "count");
  Mutable = CFDictionaryCreateMutable(v9, v10, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v12 = (void *)-[NSMutableDictionary allKeys](self->featureListStringDict, "allKeys");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v69, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v71 != v15)
          objc_enumerationMutation(v12);
        CFDictionaryAddValue(Mutable, *(const void **)(*((_QWORD *)&v70 + 1) + 8 * i), (const void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->featureListStringDict, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i)), "objectForKey:", CFSTR("matchedFeatureListString"))));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v69, 16);
    }
    while (v14);
  }
  bzero(&v32, 0x568uLL);
  rtpVideo = self->rtpVideo;
  if (Mutable)
    v18 = CFRetain(Mutable);
  else
    v18 = 0;
  videoMediaControlInfoGenerator = self->videoMediaControlInfoGenerator;
  v32 = 1;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = rtpVideo;
  v37 = v18;
  v38 = 0;
  v39 = 0;
  v40 = videoMediaControlInfoGenerator;
  v41 = 0;
  v42 = 0;
  v43 = 0;
  v45 = -[VCCallSession callID](self, "callID");
  sampleRate = self->sampleRate;
  v47 = sampleRate;
  v48 = v26;
  v49 = -[VCCallSession callID](self, "callID");
  v50 = -[VCCallSession useControlByte](self, "useControlByte");
  v51 = v27;
  v52 = v25;
  v53 = -[VCCallSession useUEP](self, "useUEP");
  v54 = v24;
  v55 = 0;
  v56 = self;
  v57 = GCKVoiceChatOnPlayVideo;
  wrmInfo = self->wrmInfo;
  v62 = 1;
  v58 = wrmInfo;
  v63 = a4;
  v61 = 0;
  v60 = a5;
  v44 = 0x200000000;
  v59 = 60;
  v64 = 256;
  v66 = 0;
  v65 = self->videoMediaControlInfoGenerator;
  v67 = 1;
  v68 = -[VCCallSession operatingMode](self, "operatingMode") == 4;
  v21 = VideoReceiver_CreateHandle((uint64_t *)&self->hVideoReceiver, (uint64_t)&v32, a3, &v31, 0);
  if (Mutable)
    CFRelease(Mutable);
  if (v18)
    CFRelease(v18);
  if (v21 < 0)
  {
    -[VCCallSession videoReceiverInitializationError:withDescription:](self, "videoReceiverInitializationError:withDescription:", a6, CFSTR("Could not create video receiver"));
    -[VCCallSession cleanUpDisplayLink](self, "cleanUpDisplayLink");
    -[VCCallSession cleanUpVideoReceiver](self, "cleanUpVideoReceiver");
  }
  return v21 >= 0;
}

- (BOOL)initializeVideoReceiver:(id *)a3 reportingAgent:(opaqueRTCReporting *)a4 fecHeaderV1Enabled:(BOOL)a5 videoJBEnabled:(BOOL)a6
{
  tagHANDLE *hVideoReceiver;

  hVideoReceiver = self->hVideoReceiver;
  if (hVideoReceiver == (tagHANDLE *)0xFFFFFFFFLL)
  {
    if (!-[VCCallSession createVideoReceiverWithReportingAgent:fecHeaderV1Enabled:videoJBEnabled:error:](self, "createVideoReceiverWithReportingAgent:fecHeaderV1Enabled:videoJBEnabled:error:", a4, a5, a6, a3))
    {
      -[VCCallSession handleVideoReceiverInitializationFailed](self, "handleVideoReceiverInitializationFailed");
      return 0;
    }
    hVideoReceiver = self->hVideoReceiver;
  }
  if ((VideoReceiver_SetVTHandleAndStart((uint64_t)hVideoReceiver, (uint64_t)self->hVideoTransmitter) & 0x80000000) != 0)
    -[VCCallSession videoReceiverInitializationError:withDescription:](self, "videoReceiverInitializationError:withDescription:", a3, CFSTR("Could not start video receiver"));
  return 1;
}

- (double)sessionTransmittingFramerate
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = 0.0;
  VideoTransmitter_GetFramerate(3.0, (uint64_t)self->hVideoTransmitter, v3);
  return v3[0];
}

- (double)sessionTransmittingBitrate
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = 0.0;
  VideoTransmitter_GetBitrate(3.0, (uint64_t)self->hVideoTransmitter, v3);
  return v3[0];
}

- (double)sessionReceivingFramerate
{
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v3[0] = 0.0;
  VideoReceiver_GetFramerate(3.0, (uint64_t)self->hVideoReceiver, v3);
  return v3[0];
}

- (double)sessionReceivingBitrate
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  VideoReceiver_GetBitrate(3.0, (uint64_t)self->hVideoReceiver, (uint64_t)v3, 0, 0, 0, 0);
  return *(double *)v3;
}

- (void)updateVideoQualityNotification:(double)a3
{
  if (a3 - self->lastVideoQualityNotificationUpdate > 0.5)
  {
    -[VCCallSession updateVideoQualityStatusWithTime:isRemote:](self, "updateVideoQualityStatusWithTime:isRemote:", 0, a3);
    if (!self->isRemoteMediaStalled)
      -[VCCallSession updateVideoQualityStatusWithTime:isRemote:](self, "updateVideoQualityStatusWithTime:isRemote:", 1, a3);
    self->lastVideoQualityNotificationUpdate = a3;
  }
}

- (id)newRemoteScreenAttributesForOrientation:(int)a3
{
  VideoAttributes *v5;
  id v6;
  double v7;
  double v8;
  uint64_t v9;
  int *v10;
  double *v11;

  v5 = objc_alloc_init(VideoAttributes);
  v6 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton");
  if (a3 > 1)
  {
    v9 = 3;
    objc_msgSend(v6, "localScreenRatioForScreenOrientation:", 3);
    if (self->canLocalResizePIP || !self->canRemoteResizePIP)
    {
      v10 = &OBJC_IVAR___VCCallSession_remoteScreenLandscapeAspectRatio;
LABEL_9:
      v11 = (double *)((char *)self + *v10);
      v7 = *v11;
      v8 = v11[1];
    }
  }
  else
  {
    objc_msgSend(v6, "localScreenRatioForScreenOrientation:", 0);
    if (self->canLocalResizePIP)
    {
      v9 = 0;
LABEL_8:
      v10 = &OBJC_IVAR___VCCallSession_remoteScreenPortraitAspectRatio;
      goto LABEL_9;
    }
    v9 = 0;
    if (!self->canRemoteResizePIP)
      goto LABEL_8;
  }
  -[VideoAttributes setRatio:](v5, "setRatio:", v7, v8);
  -[VideoAttributes setOrientation:](v5, "setOrientation:", v9);
  -[VideoAttributes setCamera:](v5, "setCamera:", 0);
  -[VideoAttributes setCameraSwitching:](v5, "setCameraSwitching:", 0);
  return v5;
}

- (void)processResolutionChangeToVideoRule:(id)a3 captureRule:(id)a4 featureListString:(id)a5
{
  int v9;
  tagHANDLE *hVideoTransmitter;
  int v11;
  int v12;
  int v13;
  float v14;

  if (a3 && a4)
  {
    v9 = -[VCCallSession parameterSetForPayload:](self, "parameterSetForPayload:", objc_msgSend(a3, "iPayload"));
    hVideoTransmitter = self->hVideoTransmitter;
    v11 = objc_msgSend(a3, "iWidth");
    v12 = objc_msgSend(a3, "iHeight");
    v13 = objc_msgSend(a3, "iPayload");
    objc_msgSend(a3, "fRate");
    VideoTransmitter_PrepareForResChange((uint64_t)hVideoTransmitter, v11, v12, v13, (int)v14, (_BYTE *)objc_msgSend(a5, "UTF8String"), objc_msgSend(a4, "iWidth"), objc_msgSend(a4, "iHeight"), v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[VCCallSessionDelegate session:didChangeVideoRule:](self->delegate, "session:didChangeVideoRule:", self, a4);
  }
}

- (void)updateSourcePlayoutTime:(const tagVCMediaTime *)a3
{
  double v5;
  tagHANDLE *hVideoReceiver;

  if (a3)
  {
    v5 = micro();
    if (v5 - self->lastVideoCallAlarmTime > 0.0)
    {
      hVideoReceiver = self->hVideoReceiver;
      if (hVideoReceiver != (tagHANDLE *)0xFFFFFFFFLL)
        VideoReceiver_UpdateSourcePlayoutTime((uint64_t)hVideoReceiver, a3);
      self->lastVideoCallAlarmTime = v5;
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_ERROR))
      -[VCCallSession(VideoConferencing) updateSourcePlayoutTime:].cold.1();
  }
}

- (void)updateStatistics:(tagVCStatisticsMessage *)a3
{
  tagHANDLE *hVideoTransmitter;
  unsigned int audioReceivedPackets;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v5 = 0;
  v7 = 0;
  hVideoTransmitter = self->hVideoTransmitter;
  audioReceivedPackets = a3->var0.feedback.audioReceivedPackets;
  VideoTransmitter_SetNetworkStats((uint64_t)hVideoTransmitter, (uint64_t)&audioReceivedPackets);
}

void __88__VCCallSession_initWithDeviceRole_transportType_isGKVoiceChat_reportingHierarchyToken___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d RTCReporting: can't configure the reporting agent.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)gatherRealtimeStats:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[40];
  uint64_t v5;

  OUTLINED_FUNCTION_14_2();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)OUTLINED_FUNCTION_43(v1, v2), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_42(&dword_1D8A54000, v0, v3, "VCCallSession [%s] %s:%d RTCReporting: reporting dictionary %s", v4);
  OUTLINED_FUNCTION_3_0();
}

void __34__VCCallSession_setOperatingMode___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d setOperatingMode - startVideo failed with error %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

void __34__VCCallSession_setOperatingMode___block_invoke_103_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_14_2();
  v1 = (void *)OUTLINED_FUNCTION_16_3(v0, *MEMORY[0x1E0C80C00]);
  if (v1)
    objc_msgSend((id)objc_msgSend(v1, "description"), "UTF8String");
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10_10();
  OUTLINED_FUNCTION_6_4(&dword_1D8A54000, v2, v3, "VCCallSession [%s] %s:%d setOperatingMode - stop failed with error %s", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_3_0();
}

void __38__VCCallSession_handleCellTechChange___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  const char *v3;
  int v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d VCCallSession: received unsupported cell tech change to %d", v2, v3, v4, 1105);
  OUTLINED_FUNCTION_3();
}

- (void)applyFeatureListStringForPayload:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession applyFeatureListStringForPayload:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d NO matched feature list string for selected payload %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession applyFeatureListStringForPayload:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)chooseVideoPayloadForInterface:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession chooseVideoPayloadForInterface:]";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Could not find matching video codec for interface %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession chooseVideoPayloadForInterface:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)chooseVideoPayloadForInterface:.cold.2()
{
  os_log_t v0;
  uint8_t v1[14];
  const char *v2;
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCCallSession chooseVideoPayloadForInterface:]";
  v3 = 1024;
  OUTLINED_FUNCTION_7();
  _os_log_fault_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_FAULT, "VCCallSession [%s] %s:%d Could not find matching video codec for interface %d", v1, 0x22u);
  OUTLINED_FUNCTION_3();
}

- (void)resetVideoRulesForInterface:videoReportingDictionary:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d captureRule or encodeRule is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __63__VCCallSession_schedulePrimaryConnectionChange_oldConnection___block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  v3 = 1582;
  v4 = 2048;
  v5 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, "VCCallSession [%s] %s:%d invalid connection change state %ld", v2);
  OUTLINED_FUNCTION_3();
}

void __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d RTT too high:Disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

uint64_t __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_cold_2(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v11;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v4, v5, "VCCallSession [%s] %s:%d PLR too high:Disconnecting", v6, v7, v8, v9, v11);
  return a3 & 1;
}

void __66__VCCallSession_updateLastReceivedPacketWithTimestamp_packetType___block_invoke_168_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 768);
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 680);
  v5 = 136316162;
  v6 = a1;
  v7 = 2080;
  v8 = "-[VCCallSession updateLastReceivedPacketWithTimestamp:packetType:]_block_invoke";
  v9 = 1024;
  v10 = 1961;
  v11 = 2048;
  v12 = v3;
  v13 = 2048;
  v14 = v4;
  _os_log_debug_impl(&dword_1D8A54000, log, OS_LOG_TYPE_DEBUG, "VCCallSession [%s] %s:%d roundTripTime = %f, packetLossRate = %f", (uint8_t *)&v5, 0x30u);
}

void __90__VCCallSession_setupConnectionTimeoutTimerWithErrorCode_detailedCode_description_reason___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Connection timeout occurred, disconnecting", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsS"
                      "ocket:destination:error:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d SKEState_SetBlob(0) failed with error %d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to add participant to Control Channel list of active participants", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to process response media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)startConnectionWithParticipantID:callID:usingInviteData:isCaller:capabilities:idsSocket:destination:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to process response media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __123__VCCallSession_startConnectionWithParticipantID_callID_usingInviteData_isCaller_capabilities_idsSocket_destination_error___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Reporting not available (no backends)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create audio rules for media negotiator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaNegotiatorAudioConfigurationWithAllowAudioSwitching:useSBR:aacBlockSize:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create audio configuration for media negotiator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newCameraConfiguration
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create local feature string for media negotiator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newScreenConfigurationWithCameraConfiguration:.cold.1()
{
  NSObject *v0;
  uint8_t v1[14];
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v2 = "-[VCCallSession newScreenConfigurationWithCameraConfiguration:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v0, (uint64_t)v0, "VCCallSession [%s] %s:%d Failed to copy cameraConfiguration=%@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)addMediaConfigurationsToLocalConfiguration:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create local microphone configuration for media negotiator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addMediaConfigurationsToLocalConfiguration:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create cameraConfiguration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)addMediaConfigurationsToLocalConfiguration:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create screenConfiguration", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create local configuration for the media negotiator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:.cold.2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create media negotiator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:.cold.3()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to create the response media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newMediaBlobWithRemoteMediaBlob:localCallID:isLowBitrateCodecPreferred:.cold.4()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to process media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to generate the media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)inviteDataForParticipantID:callID:remoteInviteData:nonCellularCandidateTimeout:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_11_3(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Failed to generate the media blob", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__VCCallSession_setPauseAudio_force_error___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Baseband codec not set propertly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __43__VCCallSession_setPauseVideo_force_error___block_invoke_2_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[24];
  int v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9();
  v3 = 3522;
  v4 = 2112;
  v5 = v0;
  OUTLINED_FUNCTION_11(&dword_1D8A54000, v1, (uint64_t)v1, "VCCallSession [%s] %s:%d failed to start video with error %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)processRelayRequestResponseDict:didOriginateRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  id v2;
  __int16 v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  OUTLINED_FUNCTION_14_2();
  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "isCallOngoing");
  v5 = 136316162;
  v6 = v1;
  v7 = 2080;
  OUTLINED_FUNCTION_9();
  v8 = 3561;
  v9 = v3;
  v10 = 3561;
  v11 = v3;
  v12 = v4;
  _os_log_error_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_ERROR, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: processRelayRequestResponseDict bailing because (![self isCallOngoing] == %d)", (uint8_t *)&v5, 0x28u);
  OUTLINED_FUNCTION_3_0();
}

- (void)processRelayUpdateDict:didOriginateRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCCallSession processRelayUpdateDict:didOriginateRequest:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: processRelayUpdateDict: remoteCallInfo is nil.", v2);
  OUTLINED_FUNCTION_3();
}

- (void)sendData:messageType:encrypted:.cold.1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Attempt to send data with zero size. Ignoring...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)negotiatedReceivingFramerate
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d framerate is not set.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)updateRelayedCallType:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  _BYTE v3[14];
  int v4;

  OUTLINED_FUNCTION_6();
  *(_QWORD *)&v3[6] = "-[VCCallSession updateRelayedCallType:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Invalid relayedCallType=%d", v2, *(const char **)v3, (unint64_t)"-[VCCallSession updateRelayedCallType:]" >> 16, v4);
  OUTLINED_FUNCTION_3();
}

- (void)setSessionConferenceState:callID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCCallSession setSessionConferenceState:callID:]";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: setSessionConferenceState: invalid state", v2);
  OUTLINED_FUNCTION_3();
}

void __65__VCCallSession_PrivateMethods__startAudioWithCompletionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = "-[VCCallSession(PrivateMethods) startAudioWithCompletionHandler:]_block_invoke";
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_7_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCCallSession.m:%d: Benign Error (possibly not): We started audio before we negotiated our codec.", v2);
  OUTLINED_FUNCTION_3();
}

void __67__VCCallSession_PrivateMethods__startAudioIOWithCompletionHandler___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d Baseband codec not set propertly", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __75__VCCallSession_PrivateMethods__disconnectWithNoRemotePackets_timeoutUsed___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  __int16 v2;
  int v3;
  uint8_t v4[14];
  const char *v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  OUTLINED_FUNCTION_14_2();
  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "callID");
  OUTLINED_FUNCTION_12_0();
  v5 = "-[VCCallSession(PrivateMethods) disconnectWithNoRemotePackets:timeoutUsed:]_block_invoke";
  OUTLINED_FUNCTION_4();
  v6 = 9654;
  v7 = v2;
  v8 = v3;
  _os_log_debug_impl(&dword_1D8A54000, v0, OS_LOG_TYPE_DEBUG, "VCCallSession [%s] %s:%d Failing due to no remote packets.  local callid: %x", v4, 0x22u);
  OUTLINED_FUNCTION_3_0();
}

void __47__VCCallSession_Messages__setupMomentsMessages__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d setupMomentsMessages message is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __57__VCCallSession_Messages__setupPreferredInterfaceMessage__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d setupPreferredInterfaceMessage message is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke_cold_1()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d setupWRMAlertStateUpdateMessage message is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__VCCallSession_Messages__setupWRMAlertStateUpdateMessage__block_invoke_cold_2()
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
  OUTLINED_FUNCTION_0(&dword_1D8A54000, v0, v1, "VCCallSession [%s] %s:%d setupWRMAlertStateUpdateMessage message is invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
